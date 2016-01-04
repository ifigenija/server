--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-04 17:15:55 CET

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
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 34364252)
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
-- TOC entry 237 (class 1259 OID 34364863)
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
-- TOC entry 236 (class 1259 OID 34364846)
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
-- TOC entry 182 (class 1259 OID 34364245)
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
-- TOC entry 181 (class 1259 OID 34364243)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 34364723)
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
-- TOC entry 230 (class 1259 OID 34364753)
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
-- TOC entry 251 (class 1259 OID 34365166)
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
-- TOC entry 203 (class 1259 OID 34364500)
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
-- TOC entry 205 (class 1259 OID 34364532)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 34364537)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 34365088)
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
-- TOC entry 194 (class 1259 OID 34364397)
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
-- TOC entry 238 (class 1259 OID 34364876)
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
-- TOC entry 223 (class 1259 OID 34364680)
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
-- TOC entry 200 (class 1259 OID 34364471)
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
-- TOC entry 197 (class 1259 OID 34364437)
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
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 34364414)
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
-- TOC entry 212 (class 1259 OID 34364594)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 34365146)
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
-- TOC entry 250 (class 1259 OID 34365159)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 34365181)
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
-- TOC entry 216 (class 1259 OID 34364619)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 34364371)
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
-- TOC entry 185 (class 1259 OID 34364271)
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
-- TOC entry 189 (class 1259 OID 34364338)
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
-- TOC entry 186 (class 1259 OID 34364282)
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
-- TOC entry 178 (class 1259 OID 34364217)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 34364236)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 34364626)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 34364660)
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
-- TOC entry 233 (class 1259 OID 34364794)
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
-- TOC entry 188 (class 1259 OID 34364318)
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
-- TOC entry 191 (class 1259 OID 34364363)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 34365032)
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
-- TOC entry 213 (class 1259 OID 34364600)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 34364348)
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
-- TOC entry 202 (class 1259 OID 34364492)
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
-- TOC entry 198 (class 1259 OID 34364452)
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
-- TOC entry 199 (class 1259 OID 34364464)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 34364612)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 34365046)
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
-- TOC entry 242 (class 1259 OID 34365056)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 34364945)
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
-- TOC entry 243 (class 1259 OID 34365064)
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
-- TOC entry 219 (class 1259 OID 34364641)
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
-- TOC entry 211 (class 1259 OID 34364585)
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
-- TOC entry 210 (class 1259 OID 34364575)
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
-- TOC entry 232 (class 1259 OID 34364783)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 34364713)
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
-- TOC entry 196 (class 1259 OID 34364426)
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
-- TOC entry 175 (class 1259 OID 34364188)
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
-- TOC entry 174 (class 1259 OID 34364186)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 34364654)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 34364226)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 34364210)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 34364668)
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
-- TOC entry 214 (class 1259 OID 34364606)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 34364552)
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
-- TOC entry 173 (class 1259 OID 34364175)
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
-- TOC entry 172 (class 1259 OID 34364167)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 34364162)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 34364730)
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
-- TOC entry 187 (class 1259 OID 34364310)
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
-- TOC entry 209 (class 1259 OID 34364562)
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
-- TOC entry 231 (class 1259 OID 34364771)
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
-- TOC entry 184 (class 1259 OID 34364261)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 34365076)
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
-- TOC entry 207 (class 1259 OID 34364542)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 34364383)
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
-- TOC entry 176 (class 1259 OID 34364197)
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
-- TOC entry 235 (class 1259 OID 34364821)
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
-- TOC entry 201 (class 1259 OID 34364482)
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
-- TOC entry 218 (class 1259 OID 34364633)
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
-- TOC entry 229 (class 1259 OID 34364744)
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
-- TOC entry 247 (class 1259 OID 34365126)
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
-- TOC entry 246 (class 1259 OID 34365095)
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
-- TOC entry 248 (class 1259 OID 34365138)
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
-- TOC entry 225 (class 1259 OID 34364706)
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
-- TOC entry 204 (class 1259 OID 34364526)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 34364811)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 34364696)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2241 (class 2604 OID 34364248)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 34364191)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3116 (class 0 OID 34364252)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-568a-9ab7-0213-07b53c8326d2	10	30	Otroci	Abonma za otroke	200
000a0000-568a-9ab7-5ffa-54d6fd915375	20	60	Mladina	Abonma za mladino	400
000a0000-568a-9ab7-602d-8f5bcdb4dfcf	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3170 (class 0 OID 34364863)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-568a-9ab7-a1f2-81357d8ad00c	000d0000-568a-9ab7-ad5a-1ea03316052a	\N	00090000-568a-9ab7-f585-c75cf1e6263b	000b0000-568a-9ab7-3d90-44bc1795b07c	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-568a-9ab7-4fca-4c0880899ba9	000d0000-568a-9ab7-40f9-504a781d0fe3	00100000-568a-9ab7-6b49-8b2363d59cf3	00090000-568a-9ab7-7a50-465028260ceb	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-568a-9ab7-c6ce-a94b63457ae7	000d0000-568a-9ab7-dd8a-bd0c392cc571	00100000-568a-9ab7-bff9-6319f628b8ee	00090000-568a-9ab7-9610-0912a197dc34	\N	0003	t	\N	2016-01-04	\N	2	t	\N	f	f
000c0000-568a-9ab7-f7c6-b36d6e96ebf1	000d0000-568a-9ab7-066c-3c512ae13620	\N	00090000-568a-9ab7-e767-00e0830ce87a	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-568a-9ab7-7d10-8ffd618452d6	000d0000-568a-9ab7-27b0-4fee4a0ae701	\N	00090000-568a-9ab7-542f-26f006f8c1c7	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-568a-9ab7-a2f9-00c1dc681474	000d0000-568a-9ab7-6e98-39ca0b547675	\N	00090000-568a-9ab7-090f-76225ea65949	000b0000-568a-9ab7-952a-2672bd949a13	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-568a-9ab7-e31f-99e26339a464	000d0000-568a-9ab7-b93e-62cb38e40a9c	00100000-568a-9ab7-0742-55f0bdc88f7c	00090000-568a-9ab7-3ab0-76e6e165bbc5	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-568a-9ab7-a890-bb3e6e413ef9	000d0000-568a-9ab7-6124-ab444e8dd55c	\N	00090000-568a-9ab7-8946-d3f5f244afe2	000b0000-568a-9ab7-e666-3e30c9b270fb	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-568a-9ab7-6d4d-06157467b22b	000d0000-568a-9ab7-b93e-62cb38e40a9c	00100000-568a-9ab7-7d51-486aa99e39d5	00090000-568a-9ab7-811c-697742704112	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-568a-9ab7-b7ff-e35807984e61	000d0000-568a-9ab7-b93e-62cb38e40a9c	00100000-568a-9ab7-4504-1da74103775b	00090000-568a-9ab7-103d-6f3a8f6128db	\N	0010	t	\N	2016-01-04	\N	16	f	\N	f	t
000c0000-568a-9ab7-5880-efa0fbf73a52	000d0000-568a-9ab7-b93e-62cb38e40a9c	00100000-568a-9ab7-0f68-0c2a26aa8182	00090000-568a-9ab7-54a7-083c7346b006	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-568a-9ab7-a1b7-8a847d183607	000d0000-568a-9ab7-c6a8-3fdb552fe2c5	00100000-568a-9ab7-6b49-8b2363d59cf3	00090000-568a-9ab7-7a50-465028260ceb	000b0000-568a-9ab7-7a4d-691484342108	0012	t	\N	\N	\N	2	t	\N	t	t
000c0000-568a-9ab7-7700-926d0236feb7	000d0000-568a-9ab7-b593-46d9a2b55daa	\N	00090000-568a-9ab7-8946-d3f5f244afe2	\N	0013	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-9ab7-85a9-99db6ca8089a	000d0000-568a-9ab7-b593-46d9a2b55daa	\N	00090000-568a-9ab7-2145-1ae5dd4220a9	\N	0014	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-9ab7-b6a9-0e2d8b0d63b2	000d0000-568a-9ab7-6a06-bc35f5d88468	00100000-568a-9ab7-bff9-6319f628b8ee	00090000-568a-9ab7-9610-0912a197dc34	\N	0015	t	\N	\N	\N	2	t	\N	f	t
000c0000-568a-9ab7-ca7a-001047c4788e	000d0000-568a-9ab7-6a06-bc35f5d88468	\N	00090000-568a-9ab7-2145-1ae5dd4220a9	\N	0016	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-9ab7-78ac-d76f3e1cd21d	000d0000-568a-9ab7-8e19-3956b0ec358c	\N	00090000-568a-9ab7-2145-1ae5dd4220a9	\N	0017	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-9ab7-9771-d2207eda4162	000d0000-568a-9ab7-8e19-3956b0ec358c	\N	00090000-568a-9ab7-8946-d3f5f244afe2	\N	0018	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-9ab7-5131-3757835e36af	000d0000-568a-9ab7-85bd-9676432ee840	00100000-568a-9ab7-0742-55f0bdc88f7c	00090000-568a-9ab7-3ab0-76e6e165bbc5	\N	0019	t	\N	\N	\N	2	t	\N	f	t
000c0000-568a-9ab7-de0c-e4db2f23d049	000d0000-568a-9ab7-85bd-9676432ee840	\N	00090000-568a-9ab7-2145-1ae5dd4220a9	\N	0020	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-9ab8-d277-570de387e66a	000d0000-568a-9ab7-d460-ea651a0cc7c4	\N	00090000-568a-9ab7-2145-1ae5dd4220a9	\N	0021	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-9ab8-ab73-6285ca1b0f4a	000d0000-568a-9ab7-d460-ea651a0cc7c4	00100000-568a-9ab7-0742-55f0bdc88f7c	00090000-568a-9ab7-3ab0-76e6e165bbc5	\N	0022	t	\N	\N	\N	2	f	\N	f	t
000c0000-568a-9ab8-1932-ce9bc1341852	000d0000-568a-9ab7-3ae3-add891a7dc61	\N	00090000-568a-9ab7-2145-1ae5dd4220a9	\N	0023	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-9ab8-02ca-fafd3dcdd068	000d0000-568a-9ab7-60a9-1bb7f31ef3d6	\N	00090000-568a-9ab7-8946-d3f5f244afe2	\N	0024	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-9ab8-6a49-dc0968e7931c	000d0000-568a-9ab7-fb40-71311a6e1392	\N	00090000-568a-9ab7-8946-d3f5f244afe2	\N	0025	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-9ab8-6c38-b81998a13df2	000d0000-568a-9ab7-fb40-71311a6e1392	00100000-568a-9ab7-bff9-6319f628b8ee	00090000-568a-9ab7-9610-0912a197dc34	\N	0026	t	\N	\N	\N	2	f	\N	f	t
000c0000-568a-9ab8-6864-318e06139e6e	000d0000-568a-9ab7-92c8-50c582187877	\N	00090000-568a-9ab7-708b-3246962ad736	\N	0027	f	\N	\N	\N	2	t	\N	f	t
000c0000-568a-9ab8-16ca-622833c239eb	000d0000-568a-9ab7-92c8-50c582187877	\N	00090000-568a-9ab7-fe35-e1881d60b0ab	\N	0028	f	\N	\N	\N	2	f	\N	f	t
000c0000-568a-9ab8-3bb0-b7ef6cd24f34	000d0000-568a-9ab7-60af-6ba2c52b57e6	\N	00090000-568a-9ab7-8946-d3f5f244afe2	\N	0029	f	\N	\N	\N	1	t	\N	f	t
000c0000-568a-9ab8-3f2d-7a849f7492e2	000d0000-568a-9ab7-60af-6ba2c52b57e6	00100000-568a-9ab7-bff9-6319f628b8ee	00090000-568a-9ab7-9610-0912a197dc34	\N	0030	t	\N	\N	\N	2	f	\N	f	t
000c0000-568a-9ab8-ec2a-7a8a6f209b97	000d0000-568a-9ab7-60af-6ba2c52b57e6	\N	00090000-568a-9ab7-fe35-e1881d60b0ab	\N	0031	f	\N	\N	\N	3	f	\N	f	t
000c0000-568a-9ab8-409d-d6fafeb9c1c7	000d0000-568a-9ab7-60af-6ba2c52b57e6	\N	00090000-568a-9ab7-708b-3246962ad736	\N	0032	f	\N	\N	\N	4	f	\N	f	t
000c0000-568a-9ab8-c8a2-1fdf7efd3223	000d0000-568a-9ab7-2fb8-7accc5a130ca	\N	00090000-568a-9ab7-8946-d3f5f244afe2	\N	0033	f	\N	\N	\N	4	t	\N	f	t
000c0000-568a-9ab8-f4ac-634959f5c165	000d0000-568a-9ab7-f6c1-b0dbc90a0e3a	00100000-568a-9ab7-bff9-6319f628b8ee	00090000-568a-9ab7-9610-0912a197dc34	\N	0034	t	\N	\N	\N	4	t	\N	f	t
000c0000-568a-9ab8-1661-10d635fa296a	000d0000-568a-9ab7-f6c1-b0dbc90a0e3a	\N	00090000-568a-9ab7-2145-1ae5dd4220a9	\N	0035	f	\N	\N	\N	4	f	\N	f	t
\.


--
-- TOC entry 3169 (class 0 OID 34364846)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 34364245)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3160 (class 0 OID 34364723)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-568a-9ab7-f8a5-daf5ad951783	00160000-568a-9ab6-ec99-120d134f903e	00090000-568a-9ab7-fe35-e1881d60b0ab	aizv	10	t
003d0000-568a-9ab7-b139-193c55efa4d2	00160000-568a-9ab6-ec99-120d134f903e	00090000-568a-9ab7-4d1d-95000da7d78f	apri	14	t
003d0000-568a-9ab7-cb21-5538cf1bdbe1	00160000-568a-9ab6-83a7-1e61095dd8ff	00090000-568a-9ab7-708b-3246962ad736	aizv	11	t
003d0000-568a-9ab7-b4f9-f624c46febc6	00160000-568a-9ab6-bec5-f209e7fc1a18	00090000-568a-9ab7-68a5-1e5d64864b2d	aizv	12	t
003d0000-568a-9ab7-5253-f3200b59f36d	00160000-568a-9ab6-ec99-120d134f903e	00090000-568a-9ab7-2145-1ae5dd4220a9	apri	18	f
\.


--
-- TOC entry 3163 (class 0 OID 34364753)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-568a-9ab6-ec99-120d134f903e	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-568a-9ab6-83a7-1e61095dd8ff	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-568a-9ab6-bec5-f209e7fc1a18	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3184 (class 0 OID 34365166)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 34364500)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-568a-9ab7-6d8c-fd3f16e6ab13	\N	\N	00200000-568a-9ab7-d183-f8ccde7c5b2f	\N	\N	\N	00220000-568a-9ab6-d6a9-7d3113de8143	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-568a-9ab7-e628-b1341a0912f4	\N	\N	00200000-568a-9ab7-ae8c-ddc4a85aed12	\N	\N	\N	00220000-568a-9ab6-d6a9-7d3113de8143	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-568a-9ab7-a5c5-01934b79b9b7	\N	\N	00200000-568a-9ab7-7f98-3414b932e734	\N	\N	\N	00220000-568a-9ab6-a744-0d69f1ce3f82	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-568a-9ab7-33d0-1b087be6ab9a	\N	\N	00200000-568a-9ab7-2898-ff27b3abd971	\N	\N	\N	00220000-568a-9ab6-eaf3-8415ae46d67e	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-568a-9ab7-e754-37694b2c3902	\N	\N	00200000-568a-9ab7-5c86-2fd56ef933c7	\N	\N	\N	00220000-568a-9ab6-f223-64cc68f6148d	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3138 (class 0 OID 34364532)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 34364537)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 34365088)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 34364397)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-568a-9ab3-900d-e27c6b5c4e6f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-568a-9ab3-c4a4-b226223e7610	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-568a-9ab3-891a-7f0a7e95a194	AL	ALB	008	Albania 	Albanija	\N
00040000-568a-9ab3-12c3-a6f522804c05	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-568a-9ab3-8fe4-c71d5735e201	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-568a-9ab3-2625-1e049fc6a952	AD	AND	020	Andorra 	Andora	\N
00040000-568a-9ab3-32e7-f675c4b27f25	AO	AGO	024	Angola 	Angola	\N
00040000-568a-9ab3-17f0-53d3bc03abc6	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-568a-9ab3-bde0-cfed19876077	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-568a-9ab3-16f2-133a470c03d8	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-568a-9ab3-4106-81645eef6e2b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-568a-9ab3-3266-3e7ebaffa2c5	AM	ARM	051	Armenia 	Armenija	\N
00040000-568a-9ab3-80d3-2543f0b8ac20	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-568a-9ab3-2261-30f835117d93	AU	AUS	036	Australia 	Avstralija	\N
00040000-568a-9ab3-0a9a-7db2c7be3554	AT	AUT	040	Austria 	Avstrija	\N
00040000-568a-9ab3-b316-773f2161257f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-568a-9ab3-51fd-b82aee91fec4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-568a-9ab3-34f7-23bf5e5a97a5	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-568a-9ab3-3f05-361783c89761	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-568a-9ab3-2b76-e9d71cf17b26	BB	BRB	052	Barbados 	Barbados	\N
00040000-568a-9ab3-1f2d-906ebfb87c8d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-568a-9ab3-163e-2add3172624a	BE	BEL	056	Belgium 	Belgija	\N
00040000-568a-9ab3-d97a-0c7852f14edc	BZ	BLZ	084	Belize 	Belize	\N
00040000-568a-9ab3-fbe6-f946c31f0e4e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-568a-9ab3-2343-13749f73f0ee	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-568a-9ab3-0451-f23e01684f92	BT	BTN	064	Bhutan 	Butan	\N
00040000-568a-9ab3-4e67-67560f81f95c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-568a-9ab3-f2ac-a92200a8ec3e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-568a-9ab3-0314-363e1759a3f7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-568a-9ab3-447a-d11099781143	BW	BWA	072	Botswana 	Bocvana	\N
00040000-568a-9ab3-ad75-e87609cb8836	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-568a-9ab3-f4a6-5d5f5dd728b7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-568a-9ab3-86b8-b0980ddb4fe0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-568a-9ab3-c6a2-a8d23f75f59c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-568a-9ab3-be4a-c12a7c64e3a8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-568a-9ab3-48fe-c24660b1c17d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-568a-9ab3-91a9-23b43e2f5a98	BI	BDI	108	Burundi 	Burundi 	\N
00040000-568a-9ab3-712b-eec590b0e3df	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-568a-9ab3-4f00-42949c32ea4b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-568a-9ab3-271f-198809b87568	CA	CAN	124	Canada 	Kanada	\N
00040000-568a-9ab3-3d12-f841374ec831	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-568a-9ab3-5fe3-c0025b990d0d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-568a-9ab3-1695-6630956b8dd3	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-568a-9ab3-0a77-0d23ec53f317	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-568a-9ab3-0789-866b4000f3cf	CL	CHL	152	Chile 	Čile	\N
00040000-568a-9ab3-897c-3d8c8afe3dec	CN	CHN	156	China 	Kitajska	\N
00040000-568a-9ab3-e685-847ef861ec26	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-568a-9ab3-783c-e12c60cd3068	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-568a-9ab3-9557-1e03a8c04424	CO	COL	170	Colombia 	Kolumbija	\N
00040000-568a-9ab3-709a-761dac9e3de7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-568a-9ab3-df6b-dd6e326f580a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-568a-9ab3-c298-1af0fc40d7ea	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-568a-9ab3-b9ad-c27fc4154eab	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-568a-9ab3-3da9-7aac5afe9849	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-568a-9ab3-a02d-b8d3b92ba471	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-568a-9ab3-1cbf-4c177d4b39c8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-568a-9ab3-93be-eaeac32f6a03	CU	CUB	192	Cuba 	Kuba	\N
00040000-568a-9ab3-9f75-d37bb35fd107	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-568a-9ab3-dc46-b2ea1b90a688	CY	CYP	196	Cyprus 	Ciper	\N
00040000-568a-9ab3-cacc-20d47904f803	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-568a-9ab3-5cec-bd052bb8d91d	DK	DNK	208	Denmark 	Danska	\N
00040000-568a-9ab3-be5f-82e40740e013	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-568a-9ab3-6bd0-761e094e4cf2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-568a-9ab3-6eab-d5f0aa52b6cb	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-568a-9ab3-8305-72e83b161623	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-568a-9ab3-db8f-5577c39bb0ed	EG	EGY	818	Egypt 	Egipt	\N
00040000-568a-9ab3-a783-83f2083b2643	SV	SLV	222	El Salvador 	Salvador	\N
00040000-568a-9ab3-46a1-b011036cfddb	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-568a-9ab3-5564-0915b58924c2	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-568a-9ab3-b886-57c999277ec0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-568a-9ab3-4d40-bfc0ab81555e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-568a-9ab3-d4a3-6abadfa9c5c4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-568a-9ab3-b5a0-b1145544271a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-568a-9ab3-a5f6-6caf65c0d2f4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-568a-9ab3-7d91-fa200080ee87	FI	FIN	246	Finland 	Finska	\N
00040000-568a-9ab3-9390-5b76b6f3c6e5	FR	FRA	250	France 	Francija	\N
00040000-568a-9ab3-a261-501a39e78b8c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-568a-9ab3-1139-e309c2d92685	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-568a-9ab3-4160-7f76a0605163	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-568a-9ab3-baeb-4074aa43dd5c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-568a-9ab3-5927-37b33a33ddc6	GA	GAB	266	Gabon 	Gabon	\N
00040000-568a-9ab3-b703-18937aebe7b9	GM	GMB	270	Gambia 	Gambija	\N
00040000-568a-9ab3-a529-fbf8157e984d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-568a-9ab3-ead6-65bcd3796edc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-568a-9ab3-4fcd-3d809c1d9594	GH	GHA	288	Ghana 	Gana	\N
00040000-568a-9ab3-6231-df655fc8dac3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-568a-9ab3-1662-1e7fddbbf758	GR	GRC	300	Greece 	Grčija	\N
00040000-568a-9ab3-11f6-e426c7a37363	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-568a-9ab3-d181-3137daa1d10f	GD	GRD	308	Grenada 	Grenada	\N
00040000-568a-9ab3-f727-4799b4e3abb1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-568a-9ab3-4b00-12dd963a7a06	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-568a-9ab3-7a94-e6247ee0f93b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-568a-9ab3-dcfd-9d3eef4ebb12	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-568a-9ab3-ee23-e6181c1842d3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-568a-9ab3-cf2d-df27c18c4bd4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-568a-9ab3-7002-8d96940d65e6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-568a-9ab3-15a8-1d70489aaf18	HT	HTI	332	Haiti 	Haiti	\N
00040000-568a-9ab3-56bc-b7cebb88c17c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-568a-9ab3-63c9-97e6138ccc0a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-568a-9ab3-adbf-d557a69b5cf8	HN	HND	340	Honduras 	Honduras	\N
00040000-568a-9ab3-997d-e7faf9547bea	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-568a-9ab3-25f8-9938b1a636f6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-568a-9ab3-e5c3-683cd83cb471	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-568a-9ab3-4023-11e0eaabbbbd	IN	IND	356	India 	Indija	\N
00040000-568a-9ab3-8f9e-a62a3c8f003e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-568a-9ab3-a586-7f6985320d8f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-568a-9ab3-c0f2-4e4226bce39e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-568a-9ab3-0841-9a487ec2ffed	IE	IRL	372	Ireland 	Irska	\N
00040000-568a-9ab3-ae8f-f5b586336a38	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-568a-9ab3-20a9-279744f85dc4	IL	ISR	376	Israel 	Izrael	\N
00040000-568a-9ab3-9530-a7865fc291e2	IT	ITA	380	Italy 	Italija	\N
00040000-568a-9ab3-70f2-323433e6cfa0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-568a-9ab3-9809-6902d3353b94	JP	JPN	392	Japan 	Japonska	\N
00040000-568a-9ab3-4b89-c9ad9620467e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-568a-9ab3-0086-91fe6441b942	JO	JOR	400	Jordan 	Jordanija	\N
00040000-568a-9ab3-88dd-61560fe3a422	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-568a-9ab3-4573-09c24eec5f94	KE	KEN	404	Kenya 	Kenija	\N
00040000-568a-9ab3-27be-b71340647f78	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-568a-9ab3-3436-8689724ea31a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-568a-9ab3-a5a4-d6273ddc219e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-568a-9ab3-1bf0-f8152514de3e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-568a-9ab3-a017-e624055216ae	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-568a-9ab3-e08d-158068dde02b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-568a-9ab3-9c8c-c14ce51c882d	LV	LVA	428	Latvia 	Latvija	\N
00040000-568a-9ab3-146f-53c0b325f0fb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-568a-9ab3-80a3-d3fea1db3fcb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-568a-9ab3-5f23-4f0387deeb59	LR	LBR	430	Liberia 	Liberija	\N
00040000-568a-9ab3-1912-10ad5b0ec4f6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-568a-9ab3-92eb-ae8bd605f9d1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-568a-9ab3-b6aa-020c05f3f269	LT	LTU	440	Lithuania 	Litva	\N
00040000-568a-9ab3-f220-b8853e2076b0	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-568a-9ab3-6843-1f54b56afbaf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-568a-9ab3-02e6-51d3caf8a375	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-568a-9ab3-a3bb-8844e660ca60	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-568a-9ab3-449a-a3f8f73e5680	MW	MWI	454	Malawi 	Malavi	\N
00040000-568a-9ab3-9fb4-441a8e074389	MY	MYS	458	Malaysia 	Malezija	\N
00040000-568a-9ab3-b04a-b201566aa3af	MV	MDV	462	Maldives 	Maldivi	\N
00040000-568a-9ab3-8c6f-7bbc7202bfa8	ML	MLI	466	Mali 	Mali	\N
00040000-568a-9ab3-faf8-2aa242354ff1	MT	MLT	470	Malta 	Malta	\N
00040000-568a-9ab3-417c-7023212112d6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-568a-9ab3-8e80-0ca6eb1d6dd4	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-568a-9ab3-8e2e-a8e40bc67f11	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-568a-9ab3-c8f4-558de7f2205c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-568a-9ab3-c48f-4a4bab68cb2c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-568a-9ab3-aa4a-10b8eebd4c3e	MX	MEX	484	Mexico 	Mehika	\N
00040000-568a-9ab3-7ae7-f2f51c6c3980	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-568a-9ab3-0725-58b4fb7677af	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-568a-9ab3-bb01-685a43036713	MC	MCO	492	Monaco 	Monako	\N
00040000-568a-9ab3-94e0-87966049344f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-568a-9ab3-406d-dbed247da2ff	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-568a-9ab3-31fc-dd01c52bb165	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-568a-9ab3-8a30-32aff4d2b591	MA	MAR	504	Morocco 	Maroko	\N
00040000-568a-9ab3-7a78-ad3e9779825a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-568a-9ab3-a150-fe061ffb5a37	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-568a-9ab3-4b3f-d18c5a13edac	NA	NAM	516	Namibia 	Namibija	\N
00040000-568a-9ab3-2855-6ff9b8350454	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-568a-9ab3-69e5-d22079d59498	NP	NPL	524	Nepal 	Nepal	\N
00040000-568a-9ab3-c0ca-8844409411d1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-568a-9ab3-f180-90b5864f09ea	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-568a-9ab3-f0f9-f0d856c518d4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-568a-9ab3-23d3-56c8a57ce731	NE	NER	562	Niger 	Niger 	\N
00040000-568a-9ab3-613d-db955aaf8397	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-568a-9ab3-24c3-1f19bb8fe8d4	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-568a-9ab3-d98b-85f374536b0d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-568a-9ab3-f6d3-ccd98bd69f30	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-568a-9ab3-02da-8b21a95a0068	NO	NOR	578	Norway 	Norveška	\N
00040000-568a-9ab3-8f33-a8e357c0ba2b	OM	OMN	512	Oman 	Oman	\N
00040000-568a-9ab3-4a6d-ef008121db0b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-568a-9ab3-2912-c9bb99a28738	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-568a-9ab3-65c3-58d913c84fcc	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-568a-9ab3-6e9d-7ea73ecc538b	PA	PAN	591	Panama 	Panama	\N
00040000-568a-9ab3-030a-5eccc569f6c2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-568a-9ab3-96a5-1a6af9072bcc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-568a-9ab3-b344-dc2f5aee49cb	PE	PER	604	Peru 	Peru	\N
00040000-568a-9ab3-a15d-c01f9ae42ce7	PH	PHL	608	Philippines 	Filipini	\N
00040000-568a-9ab3-dbb5-7de2d6e2b2ed	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-568a-9ab3-b0d2-ca6518fd316a	PL	POL	616	Poland 	Poljska	\N
00040000-568a-9ab3-f616-8d6ad230e0bf	PT	PRT	620	Portugal 	Portugalska	\N
00040000-568a-9ab3-8253-02cd6ae2cbc1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-568a-9ab3-dc47-63aa3b063597	QA	QAT	634	Qatar 	Katar	\N
00040000-568a-9ab3-a79e-6d660fbf2eb7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-568a-9ab3-0ba2-ff09e375d473	RO	ROU	642	Romania 	Romunija	\N
00040000-568a-9ab3-42dd-91e04c7d2e52	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-568a-9ab3-8734-a16562175c89	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-568a-9ab3-b889-f22bb65c18a8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-568a-9ab3-219c-06c03c4dadbf	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-568a-9ab3-047e-6137242b8069	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-568a-9ab3-8db9-3e56f65f660b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-568a-9ab3-e372-6dc8ca4a998f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-568a-9ab3-1b4a-a4dc3e6d150e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-568a-9ab3-b8c4-f28c05b32ab4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-568a-9ab3-abd3-6dd39437de31	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-568a-9ab3-e779-7acf4c2f022d	SM	SMR	674	San Marino 	San Marino	\N
00040000-568a-9ab3-2e05-77fdc5bc8c7e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-568a-9ab3-1249-248058ab350b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-568a-9ab3-5dfb-3b665d913b9c	SN	SEN	686	Senegal 	Senegal	\N
00040000-568a-9ab3-d0fd-20385fa0b7cb	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-568a-9ab3-d5b5-6107d61af9a1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-568a-9ab3-70c6-3a1c8740b6c2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-568a-9ab3-ee81-e5ed41c7658e	SG	SGP	702	Singapore 	Singapur	\N
00040000-568a-9ab3-7e87-3869319ef62e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-568a-9ab3-367e-953a18f296da	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-568a-9ab3-1fc7-8c8414cfa151	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-568a-9ab3-9588-1e3ed95dda00	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-568a-9ab3-e97d-81f71164bc0e	SO	SOM	706	Somalia 	Somalija	\N
00040000-568a-9ab3-6fa7-df94381c6bae	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-568a-9ab3-e155-a4a30869a6f1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-568a-9ab3-3545-da80129882b7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-568a-9ab3-978a-372078bd1cc6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-568a-9ab3-0823-37941bb5f490	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-568a-9ab3-875a-895206c0a69e	SD	SDN	729	Sudan 	Sudan	\N
00040000-568a-9ab3-5c98-debadaa8770a	SR	SUR	740	Suriname 	Surinam	\N
00040000-568a-9ab3-e6f3-5b2aa9b0cf49	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-568a-9ab3-28b3-c6951baa9fb8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-568a-9ab3-a858-ab73634855c4	SE	SWE	752	Sweden 	Švedska	\N
00040000-568a-9ab3-2595-aab526a2b93f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-568a-9ab3-07d7-f0f75d09ec9a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-568a-9ab3-6256-c525a56b7589	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-568a-9ab3-c0f0-da23d29c9ddb	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-568a-9ab3-6c53-493806df97d9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-568a-9ab3-1ae7-b335864fb178	TH	THA	764	Thailand 	Tajska	\N
00040000-568a-9ab3-095e-e511d8437635	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-568a-9ab3-bd00-acfa3fbe2757	TG	TGO	768	Togo 	Togo	\N
00040000-568a-9ab3-013f-f7ea378102cb	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-568a-9ab3-7a59-ce1b32e32de7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-568a-9ab3-c69b-3db62816bf5c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-568a-9ab3-b5e6-a12f5e164f20	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-568a-9ab3-c67f-276b41237636	TR	TUR	792	Turkey 	Turčija	\N
00040000-568a-9ab3-3dbb-44726880c3b8	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-568a-9ab3-d269-37a0fc637a88	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-568a-9ab3-97f0-e39069ad201a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-568a-9ab3-58ac-3c5a77946831	UG	UGA	800	Uganda 	Uganda	\N
00040000-568a-9ab3-4ed5-429ed27a635b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-568a-9ab3-3b9d-563bb6017132	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-568a-9ab3-c0b1-01a2f44d669f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-568a-9ab3-5144-3619751f5141	US	USA	840	United States 	Združene države Amerike	\N
00040000-568a-9ab3-00af-7092dbbb866b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-568a-9ab3-b575-fe1a5f620c37	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-568a-9ab3-daca-8f44f7749409	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-568a-9ab3-d641-4a74198ac4c0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-568a-9ab3-75f9-ca0f9dd9a23a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-568a-9ab3-6653-5ac29a6b51d6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-568a-9ab3-f1c0-e30095ffef0c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-568a-9ab3-c6a9-a99f1cc10152	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-568a-9ab3-f5ac-af9f8c9d8b1b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-568a-9ab3-b69a-8345d5ba4dd7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-568a-9ab3-a538-f195aa10928b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-568a-9ab3-cbdf-f5e4b41250f7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-568a-9ab3-a0e7-70a1747f11e1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3171 (class 0 OID 34364876)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-568a-9ab7-4ba0-e3aa649f9896	000e0000-568a-9ab7-5f00-9d8cf5972771	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568a-9ab3-6213-cca0228647ed	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-568a-9ab7-83a3-84703635fe71	000e0000-568a-9ab7-c037-2c4fab7a0db3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568a-9ab3-bc7d-ded65cb090a1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-568a-9ab7-532a-29677ca905c3	000e0000-568a-9ab7-33f1-11430f478e8a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568a-9ab3-6213-cca0228647ed	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-568a-9ab7-99c8-85638eb4d545	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-568a-9ab7-65cc-43a0d2eb92a3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3156 (class 0 OID 34364680)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-568a-9ab7-67da-a4271a3d014f	000e0000-568a-9ab7-86ed-d9bdf16968c9	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	0	000f0000-568a-9ab3-3b6e-514b816a0975
000d0000-568a-9ab7-4552-a03456e9feb6	000e0000-568a-9ab7-86ed-d9bdf16968c9	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	0	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-ad5a-1ea03316052a	000e0000-568a-9ab7-c037-2c4fab7a0db3	000c0000-568a-9ab7-a1f2-81357d8ad00c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-568a-9ab3-3b6e-514b816a0975
000d0000-568a-9ab7-40f9-504a781d0fe3	000e0000-568a-9ab7-c037-2c4fab7a0db3	000c0000-568a-9ab7-4fca-4c0880899ba9	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-dd8a-bd0c392cc571	000e0000-568a-9ab7-c037-2c4fab7a0db3	000c0000-568a-9ab7-c6ce-a94b63457ae7	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-568a-9ab3-520b-0a3eb56caf41
000d0000-568a-9ab7-066c-3c512ae13620	000e0000-568a-9ab7-c037-2c4fab7a0db3	000c0000-568a-9ab7-f7c6-b36d6e96ebf1	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-568a-9ab3-9bf9-f0c06e9b95f7
000d0000-568a-9ab7-27b0-4fee4a0ae701	000e0000-568a-9ab7-c037-2c4fab7a0db3	000c0000-568a-9ab7-7d10-8ffd618452d6	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-568a-9ab3-9bf9-f0c06e9b95f7
000d0000-568a-9ab7-6e98-39ca0b547675	000e0000-568a-9ab7-c037-2c4fab7a0db3	000c0000-568a-9ab7-a2f9-00c1dc681474	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-568a-9ab3-3b6e-514b816a0975
000d0000-568a-9ab7-b93e-62cb38e40a9c	000e0000-568a-9ab7-c037-2c4fab7a0db3	000c0000-568a-9ab7-6d4d-06157467b22b	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-568a-9ab3-3b6e-514b816a0975
000d0000-568a-9ab7-6124-ab444e8dd55c	000e0000-568a-9ab7-c037-2c4fab7a0db3	000c0000-568a-9ab7-a890-bb3e6e413ef9	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-568a-9ab3-e410-579faefd5e57
000d0000-568a-9ab7-c6a8-3fdb552fe2c5	000e0000-568a-9ab7-c037-2c4fab7a0db3	000c0000-568a-9ab7-a1b7-8a847d183607	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-568a-9ab3-7e61-0a78782ab8ac
000d0000-568a-9ab7-b593-46d9a2b55daa	000e0000-568a-9ab7-e3c1-1cb54b1cc52d	000c0000-568a-9ab7-7700-926d0236feb7	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	2	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-6a06-bc35f5d88468	000e0000-568a-9ab7-781a-be88bbd33e59	000c0000-568a-9ab7-b6a9-0e2d8b0d63b2	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	2	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-8e19-3956b0ec358c	000e0000-568a-9ab7-781a-be88bbd33e59	000c0000-568a-9ab7-78ac-d76f3e1cd21d	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	2	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-85bd-9676432ee840	000e0000-568a-9ab7-04ca-25bcaf036050	000c0000-568a-9ab7-5131-3757835e36af	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	2	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-d460-ea651a0cc7c4	000e0000-568a-9ab7-9fc1-397c47df5c02	000c0000-568a-9ab8-d277-570de387e66a	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	2	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-3ae3-add891a7dc61	000e0000-568a-9ab7-8683-14778035ec60	000c0000-568a-9ab8-1932-ce9bc1341852	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	1	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-60a9-1bb7f31ef3d6	000e0000-568a-9ab7-d7b8-54086ea56e00	000c0000-568a-9ab8-02ca-fafd3dcdd068	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	1	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-fb40-71311a6e1392	000e0000-568a-9ab7-3fdd-4efc03d4de2a	000c0000-568a-9ab8-6a49-dc0968e7931c	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	2	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-92c8-50c582187877	000e0000-568a-9ab7-6705-1ecd2430c6f7	000c0000-568a-9ab8-6864-318e06139e6e	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	2	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-60af-6ba2c52b57e6	000e0000-568a-9ab7-6705-1ecd2430c6f7	000c0000-568a-9ab8-3bb0-b7ef6cd24f34	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	4	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-2fb8-7accc5a130ca	000e0000-568a-9ab7-ca82-589164e0626c	000c0000-568a-9ab8-c8a2-1fdf7efd3223	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	1	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
000d0000-568a-9ab7-f6c1-b0dbc90a0e3a	000e0000-568a-9ab7-ca82-589164e0626c	000c0000-568a-9ab8-f4ac-634959f5c165	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	2	000f0000-568a-9ab3-4fd5-c7fd6cb7aeba
\.


--
-- TOC entry 3133 (class 0 OID 34364471)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 34364437)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 34364414)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-568a-9ab7-39c7-389078370f9b	00080000-568a-9ab7-5b17-3b7acf7dfd0b	00090000-568a-9ab7-103d-6f3a8f6128db	AK		igralka
\.


--
-- TOC entry 3145 (class 0 OID 34364594)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 34365146)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-568a-9ab7-178e-30d44f2da947	00010000-568a-9ab5-aaa3-3da88ccfba1d	\N	Prva mapa	Root mapa	2016-01-04 17:15:51	2016-01-04 17:15:51	R	\N	\N
\.


--
-- TOC entry 3183 (class 0 OID 34365159)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 34365181)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 33138684)
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
-- TOC entry 3149 (class 0 OID 34364619)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 34364371)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-568a-9ab5-3159-e4693506d970	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-568a-9ab5-f693-d1884521bad5	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-568a-9ab5-6ad0-abefc69d1204	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-568a-9ab5-678a-92e02950c75b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-568a-9ab5-a188-d87e536ab977	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-568a-9ab5-9494-ba2434797ee6	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-568a-9ab5-f386-6f6bf15fadf8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-568a-9ab5-24d7-db79a383c8c5	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-568a-9ab5-e278-f8811b9758e6	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-568a-9ab5-fa68-a61b9e9726f8	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-568a-9ab5-0556-1fc8e3604e1a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-568a-9ab5-4187-15b4ae234ead	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-568a-9ab5-b83c-05e138b20923	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-568a-9ab5-38b9-041395d3d79b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-568a-9ab6-2be0-550bd92e46d3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-568a-9ab6-e6db-8bd2f9a90bcc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-568a-9ab6-0abd-45508cfede2e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-568a-9ab6-9a42-b529c5be773f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-568a-9ab6-6dd4-7e62685a15a6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-568a-9ab9-614b-90440df04859	application.tenant.maticnopodjetje	string	s:36:"00080000-568a-9ab9-9084-ee265c1bfe32";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3118 (class 0 OID 34364271)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-568a-9ab6-3e41-b20dc9e928d3	00000000-568a-9ab6-2be0-550bd92e46d3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-568a-9ab6-5917-c13e8ecf00fd	00000000-568a-9ab6-2be0-550bd92e46d3	00010000-568a-9ab5-aaa3-3da88ccfba1d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-568a-9ab6-818d-386642adae35	00000000-568a-9ab6-e6db-8bd2f9a90bcc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3122 (class 0 OID 34364338)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-568a-9ab7-aa88-4067b7ca2a11	\N	00100000-568a-9ab7-6b49-8b2363d59cf3	00100000-568a-9ab7-bff9-6319f628b8ee	01	Gledališče Nimbis
00410000-568a-9ab7-2457-54bc5c41f28d	00410000-568a-9ab7-aa88-4067b7ca2a11	00100000-568a-9ab7-6b49-8b2363d59cf3	00100000-568a-9ab7-bff9-6319f628b8ee	02	Tehnika
\.


--
-- TOC entry 3119 (class 0 OID 34364282)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-568a-9ab7-f585-c75cf1e6263b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-568a-9ab7-e767-00e0830ce87a	00010000-568a-9ab7-d2b9-fdf31bfa7e04	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-568a-9ab7-9610-0912a197dc34	00010000-568a-9ab7-588a-0edd11562de2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-568a-9ab7-811c-697742704112	00010000-568a-9ab7-a830-036a0c2a25db	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-568a-9ab7-07f8-b31b68dd3fb5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-568a-9ab7-090f-76225ea65949	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-568a-9ab7-54a7-083c7346b006	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-568a-9ab7-3ab0-76e6e165bbc5	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-568a-9ab7-103d-6f3a8f6128db	00010000-568a-9ab7-91fa-f0c94e668efe	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-568a-9ab7-7a50-465028260ceb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-568a-9ab7-23a4-103c04ead415	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-568a-9ab7-542f-26f006f8c1c7	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-568a-9ab7-8946-d3f5f244afe2	00010000-568a-9ab7-cbfe-9d11fc0016d5	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-568a-9ab7-fe35-e1881d60b0ab	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-9ab7-4d1d-95000da7d78f	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-9ab7-708b-3246962ad736	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-9ab7-68a5-1e5d64864b2d	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-568a-9ab7-2145-1ae5dd4220a9	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-568a-9ab7-f7a1-0edd60c95299	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-9ab7-7b20-a5c80df0340d	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-568a-9ab7-001d-42d2c80857b7	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3111 (class 0 OID 34364217)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-568a-9ab4-7c3f-2bba13295b2c	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-568a-9ab4-7b53-8d8349b763bb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-568a-9ab4-09dc-1e3000fa55a4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-568a-9ab4-c2aa-c1dfed86ea39	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-568a-9ab4-6010-27762555ec3e	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-568a-9ab4-5a0d-6a15b63dd4cf	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-568a-9ab4-8550-9ca68498b3f7	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-568a-9ab4-0ff5-6d85215f5275	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-568a-9ab4-87c7-c248d2295ee1	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-568a-9ab4-0d8b-e5f2c39d25d4	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-568a-9ab4-059d-b5bb66152f7d	Abonma-read	Abonma - branje	t
00030000-568a-9ab4-e27f-871e2a7e4ce5	Abonma-write	Abonma - spreminjanje	t
00030000-568a-9ab4-1d58-1968d87df9db	Alternacija-read	Alternacija - branje	t
00030000-568a-9ab4-07dd-539064a2a703	Alternacija-write	Alternacija - spreminjanje	t
00030000-568a-9ab4-b2e4-6bb4f64d283b	Arhivalija-read	Arhivalija - branje	t
00030000-568a-9ab4-5a02-9ed24f073541	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-568a-9ab4-a4a7-a05023198111	AuthStorage-read	AuthStorage - branje	t
00030000-568a-9ab4-74a4-3f54c68f12c8	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-568a-9ab4-e4d0-bad1ffb9adae	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-568a-9ab4-fe6f-4f14ab4011cb	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-568a-9ab4-ac28-549bb93f409b	Besedilo-read	Besedilo - branje	t
00030000-568a-9ab4-7fdc-7179ba4da8cf	Besedilo-write	Besedilo - spreminjanje	t
00030000-568a-9ab4-1d04-13c87aad51d8	Dogodek-read	Dogodek - branje	t
00030000-568a-9ab4-c8d7-976e24a5dffb	Dogodek-write	Dogodek - spreminjanje	t
00030000-568a-9ab4-8f70-55e2f8b96203	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-568a-9ab4-1942-6b4314578ddd	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-568a-9ab4-023c-b1d3cf4a7d0d	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-568a-9ab4-db7a-71b2610d0fd4	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-568a-9ab4-3a4a-cb19993d6eda	DogodekTrait-read	DogodekTrait - branje	t
00030000-568a-9ab4-37e5-9e089323782e	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-568a-9ab4-c758-14d07a72a133	DrugiVir-read	DrugiVir - branje	t
00030000-568a-9ab4-b09e-9097c3f0c861	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-568a-9ab4-d028-a4dd638028d7	Drzava-read	Drzava - branje	t
00030000-568a-9ab4-0676-45247966fda7	Drzava-write	Drzava - spreminjanje	t
00030000-568a-9ab4-4b82-b499f0e1b4fa	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-568a-9ab4-ef1b-e2f3c6611e4a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-568a-9ab4-72ee-8b0fef4daede	Funkcija-read	Funkcija - branje	t
00030000-568a-9ab4-48b9-5bfeb259f462	Funkcija-write	Funkcija - spreminjanje	t
00030000-568a-9ab4-6ef1-d2169ea8ec26	Gostovanje-read	Gostovanje - branje	t
00030000-568a-9ab4-de7f-ed9691450015	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-568a-9ab4-e4b2-4d64f83d6237	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-568a-9ab4-1d1d-20f23b6a2c7f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-568a-9ab4-5477-0bab9c9d5860	Kupec-read	Kupec - branje	t
00030000-568a-9ab4-e60c-06b91c88b05c	Kupec-write	Kupec - spreminjanje	t
00030000-568a-9ab4-bd53-2a814be201a9	NacinPlacina-read	NacinPlacina - branje	t
00030000-568a-9ab4-2427-786245d006b7	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-568a-9ab4-5726-2a5c5b247331	Option-read	Option - branje	t
00030000-568a-9ab4-fe52-56d9ae28efdb	Option-write	Option - spreminjanje	t
00030000-568a-9ab4-1c55-763cf53f40db	OptionValue-read	OptionValue - branje	t
00030000-568a-9ab4-d122-d9c570ec0363	OptionValue-write	OptionValue - spreminjanje	t
00030000-568a-9ab4-d8c5-c4c450e17cfd	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-568a-9ab4-f6f0-bf8aa3947c95	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-568a-9ab4-5a6d-27bdd6120f42	Oseba-read	Oseba - branje	t
00030000-568a-9ab4-f6ad-59ec925ba070	Oseba-write	Oseba - spreminjanje	t
00030000-568a-9ab4-d888-94e339cf9490	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-568a-9ab4-96ff-1c39bf4e5e47	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-568a-9ab4-6f61-096902d150c4	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-568a-9ab4-ad30-afb5867285aa	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-568a-9ab4-a34d-ee8f60af3be8	Pogodba-read	Pogodba - branje	t
00030000-568a-9ab4-b3db-e91587dbacba	Pogodba-write	Pogodba - spreminjanje	t
00030000-568a-9ab4-96b8-83040377a1f4	Popa-read	Popa - branje	t
00030000-568a-9ab4-5566-f610162219c5	Popa-write	Popa - spreminjanje	t
00030000-568a-9ab4-8860-06e65ff1bc79	Posta-read	Posta - branje	t
00030000-568a-9ab4-ec0b-3a647f4c0eaf	Posta-write	Posta - spreminjanje	t
00030000-568a-9ab4-77b5-fcb3b701483d	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-568a-9ab4-5e6c-48dd9dcab0f3	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-568a-9ab4-da8f-334a52c2c886	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-568a-9ab4-5f84-20def02e1b22	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-568a-9ab4-8dae-b52ef51fed1b	PostniNaslov-read	PostniNaslov - branje	t
00030000-568a-9ab4-7335-16662b2494b9	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-568a-9ab4-0006-b94840264d61	Praznik-read	Praznik - branje	t
00030000-568a-9ab4-47c0-07dacaab5c08	Praznik-write	Praznik - spreminjanje	t
00030000-568a-9ab4-3dcb-e606424a34eb	Predstava-read	Predstava - branje	t
00030000-568a-9ab4-7e82-8a716b261176	Predstava-write	Predstava - spreminjanje	t
00030000-568a-9ab4-d159-98cd5cf3d525	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-568a-9ab4-23a7-486ca03359b4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-568a-9ab4-a933-ca4d4707c38e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-568a-9ab4-3aba-70033192f6db	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-568a-9ab4-af4b-de708b6f269f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-568a-9ab4-6206-12b2cfee6c59	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-568a-9ab4-6c62-e0e3bc9ce7da	ProgramDela-read	ProgramDela - branje	t
00030000-568a-9ab4-140b-f45f006396b8	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-568a-9ab4-d57f-b2aebeaf9303	ProgramFestival-read	ProgramFestival - branje	t
00030000-568a-9ab4-bf6a-600b25b1d4c0	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-568a-9ab4-4979-48fdb7c1f82d	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-568a-9ab4-b354-9df9a3308c08	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-568a-9ab4-a28b-58365e8d3436	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-568a-9ab4-de02-ff7900d28370	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-568a-9ab4-611a-187208c4be04	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-568a-9ab4-035c-81603a470852	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-568a-9ab4-5730-e1ddddb1c75d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-568a-9ab4-cb1c-13e443d30240	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-568a-9ab4-2bff-29e64fd2de89	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-568a-9ab4-bed7-6919a7f449a7	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-568a-9ab4-2b4a-ad9f381079f7	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-568a-9ab4-2335-5f48019dcfbd	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-568a-9ab4-3795-2313ae0bcbeb	ProgramRazno-read	ProgramRazno - branje	t
00030000-568a-9ab4-bc2f-dec7350b1366	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-568a-9ab4-91be-aaad01551b34	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-568a-9ab4-bbc4-a4a98a4ba269	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-568a-9ab4-4ec3-df28dcd32b95	Prostor-read	Prostor - branje	t
00030000-568a-9ab4-e273-97d7231e1403	Prostor-write	Prostor - spreminjanje	t
00030000-568a-9ab4-9e4c-0ec61aef75ac	Racun-read	Racun - branje	t
00030000-568a-9ab4-3c42-9d33fc7e8116	Racun-write	Racun - spreminjanje	t
00030000-568a-9ab4-5d2a-4f3ab629e388	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-568a-9ab4-4834-129b104dfef6	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-568a-9ab4-3ca5-598b7d3ba744	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-568a-9ab4-3e99-0e00ef1be59c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-568a-9ab4-1f5f-ec842825065f	Rekvizit-read	Rekvizit - branje	t
00030000-568a-9ab4-6e0a-d00db76c2503	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-568a-9ab4-b40e-475dde18d261	Revizija-read	Revizija - branje	t
00030000-568a-9ab4-24ae-c1a428f4b79c	Revizija-write	Revizija - spreminjanje	t
00030000-568a-9ab4-3bd1-6e60dc518db3	Rezervacija-read	Rezervacija - branje	t
00030000-568a-9ab4-b317-c684d58ebac7	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-568a-9ab4-d4c7-d7a258387033	SedezniRed-read	SedezniRed - branje	t
00030000-568a-9ab4-2798-a640ff92ac5d	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-568a-9ab4-9afb-33a8a86e2551	Sedez-read	Sedez - branje	t
00030000-568a-9ab4-d4e0-2cfd90e28241	Sedez-write	Sedez - spreminjanje	t
00030000-568a-9ab4-50b5-917bd43112ed	Sezona-read	Sezona - branje	t
00030000-568a-9ab4-360a-8aed7d7b1c5a	Sezona-write	Sezona - spreminjanje	t
00030000-568a-9ab4-c633-8e9d75a6573b	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-568a-9ab4-0c14-a529fbf406a2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-568a-9ab4-adc3-570e08d9bbab	Telefonska-read	Telefonska - branje	t
00030000-568a-9ab4-35f0-5ad7e0bbf442	Telefonska-write	Telefonska - spreminjanje	t
00030000-568a-9ab4-52c4-b9883786c543	TerminStoritve-read	TerminStoritve - branje	t
00030000-568a-9ab4-c204-dc0163790280	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-568a-9ab4-e04f-9f73325d32b5	TipFunkcije-read	TipFunkcije - branje	t
00030000-568a-9ab4-a028-9d4c75f1cc8d	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-568a-9ab4-b176-8a52189fadb9	TipPopa-read	TipPopa - branje	t
00030000-568a-9ab4-d8b5-fbb5e44ebe75	TipPopa-write	TipPopa - spreminjanje	t
00030000-568a-9ab4-95ba-f5c7efd7142c	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-568a-9ab4-3068-93ebb7e88db1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-568a-9ab4-da19-3757eb16f926	TipVaje-read	TipVaje - branje	t
00030000-568a-9ab4-a69c-9c7e3950dec8	TipVaje-write	TipVaje - spreminjanje	t
00030000-568a-9ab4-5554-9668c0da01b3	Trr-read	Trr - branje	t
00030000-568a-9ab4-5c4f-68e2b6a8d8bc	Trr-write	Trr - spreminjanje	t
00030000-568a-9ab4-208d-1323da301ef3	Uprizoritev-read	Uprizoritev - branje	t
00030000-568a-9ab4-3d0a-e6b6513075aa	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-568a-9ab4-78fa-fa945d629fe3	Vaja-read	Vaja - branje	t
00030000-568a-9ab4-8b55-a6a0cf26fe53	Vaja-write	Vaja - spreminjanje	t
00030000-568a-9ab4-bb04-699b83401286	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-568a-9ab4-ecd6-b5cdd467899c	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-568a-9ab4-d8d3-91c4e86d3d02	VrstaStroska-read	VrstaStroska - branje	t
00030000-568a-9ab4-4974-56d8783ab326	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-568a-9ab4-9a88-fc859be56b0c	Zaposlitev-read	Zaposlitev - branje	t
00030000-568a-9ab4-dca1-3f1c7db2c1bb	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-568a-9ab4-c715-f4b2b7262a30	Zasedenost-read	Zasedenost - branje	t
00030000-568a-9ab4-045e-551453ef31fc	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-568a-9ab4-afbf-e2263f143f1f	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-568a-9ab4-1767-902272d48059	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-568a-9ab4-48a6-033537934c32	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-568a-9ab4-5d27-5d2f5d579339	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-568a-9ab4-d9d4-4b45e1857bc0	Job-read	Branje opravil - samo zase - branje	t
00030000-568a-9ab4-7eaa-26e164a2d835	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-568a-9ab4-c7ca-370138379b5a	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-568a-9ab4-babf-426fa19e90b1	Report-read	Report - branje	t
00030000-568a-9ab4-6283-fdb90abee4c6	Report-write	Report - spreminjanje	t
00030000-568a-9ab4-ff7a-ce415b204327	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-568a-9ab4-de5a-e8117ea3c9e3	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-568a-9ab4-393f-316243c87e00	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-568a-9ab4-3f34-d8a037ec1d17	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-568a-9ab4-7d10-ea6c17f2e7e5	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-568a-9ab4-11ba-0198db9b7c5f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-568a-9ab4-49a0-f9da36cc8b8c	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-568a-9ab4-c8b1-3900d83a27a0	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-568a-9ab4-f5ff-4721348dc389	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-568a-9ab4-bfaf-19080fe725eb	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-568a-9ab4-d556-af0ba05c6a60	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-568a-9ab4-8d6d-d34606331f2a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-568a-9ab4-a07a-6cbbf5305562	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-568a-9ab4-c94d-5c838cf09ee0	Datoteka-write	Datoteka - spreminjanje	t
00030000-568a-9ab4-c116-5394c3bcf148	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3113 (class 0 OID 34364236)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-568a-9ab4-f507-da3d59d76757	00030000-568a-9ab4-7b53-8d8349b763bb
00020000-568a-9ab4-f507-da3d59d76757	00030000-568a-9ab4-7c3f-2bba13295b2c
00020000-568a-9ab4-8270-ac4b2a904c04	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-fe6f-4f14ab4011cb
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-7fdc-7179ba4da8cf
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-e4d0-bad1ffb9adae
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-f525-398104bb73b9	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-9599-f4b7a1a7f99c	00030000-568a-9ab4-e4d0-bad1ffb9adae
00020000-568a-9ab4-9599-f4b7a1a7f99c	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-9599-f4b7a1a7f99c	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-9599-f4b7a1a7f99c	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-9599-f4b7a1a7f99c	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-9599-f4b7a1a7f99c	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-ac72-0f20e3ad43a1	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-ac72-0f20e3ad43a1	00030000-568a-9ab4-dca1-3f1c7db2c1bb
00020000-568a-9ab4-ac72-0f20e3ad43a1	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-ac72-0f20e3ad43a1	00030000-568a-9ab4-6010-27762555ec3e
00020000-568a-9ab4-ac72-0f20e3ad43a1	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-ac72-0f20e3ad43a1	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-ac72-0f20e3ad43a1	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-62ef-4786ddfb2115	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-62ef-4786ddfb2115	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-62ef-4786ddfb2115	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-8a58-b7ea348ecda3	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-8a58-b7ea348ecda3	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-8a58-b7ea348ecda3	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-8a58-b7ea348ecda3	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-8a58-b7ea348ecda3	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-8a58-b7ea348ecda3	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-8a58-b7ea348ecda3	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-8a58-b7ea348ecda3	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-4df8-6e4242ff267b	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-4df8-6e4242ff267b	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-4df8-6e4242ff267b	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-4df8-6e4242ff267b	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-6010-27762555ec3e
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-5c4f-68e2b6a8d8bc
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-7335-16662b2494b9
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-35f0-5ad7e0bbf442
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-2705-10a8c8e71ec3	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-2ec8-f041abd6c79c	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-2ec8-f041abd6c79c	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-2ec8-f041abd6c79c	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-2ec8-f041abd6c79c	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-2ec8-f041abd6c79c	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-2ec8-f041abd6c79c	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-2ec8-f041abd6c79c	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-35f0-5ad7e0bbf442
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-7335-16662b2494b9
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-5c4f-68e2b6a8d8bc
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-5566-f610162219c5
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-1d1d-20f23b6a2c7f
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-6206-12b2cfee6c59
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-97c9-45841a79cf6d	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-e490-e364220df3e2	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-ea49-98b0446a662d	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-ea49-98b0446a662d	00030000-568a-9ab4-d8b5-fbb5e44ebe75
00020000-568a-9ab4-405b-ee2e57aa7446	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-1456-e81d1cc3ffb4	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab4-1456-e81d1cc3ffb4	00030000-568a-9ab4-ec0b-3a647f4c0eaf
00020000-568a-9ab4-b9f0-6d213740ae18	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab4-94a4-079597b5c261	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-94a4-079597b5c261	00030000-568a-9ab4-0676-45247966fda7
00020000-568a-9ab4-d445-c04e580304c3	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-c2dc-6f0a1ac03e01	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab4-c2dc-6f0a1ac03e01	00030000-568a-9ab4-5d27-5d2f5d579339
00020000-568a-9ab4-afed-bd51141019c5	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab4-5b39-70693f38f5cd	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab4-5b39-70693f38f5cd	00030000-568a-9ab4-1767-902272d48059
00020000-568a-9ab4-1892-062ec836d827	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab4-0585-86913375f7b4	00030000-568a-9ab4-059d-b5bb66152f7d
00020000-568a-9ab4-0585-86913375f7b4	00030000-568a-9ab4-e27f-871e2a7e4ce5
00020000-568a-9ab4-f5a5-576e3a4b3f35	00030000-568a-9ab4-059d-b5bb66152f7d
00020000-568a-9ab4-4c4e-b6e9fbc2f1f2	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab4-4c4e-b6e9fbc2f1f2	00030000-568a-9ab4-e273-97d7231e1403
00020000-568a-9ab4-4c4e-b6e9fbc2f1f2	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-4c4e-b6e9fbc2f1f2	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-4c4e-b6e9fbc2f1f2	00030000-568a-9ab4-7335-16662b2494b9
00020000-568a-9ab4-4c4e-b6e9fbc2f1f2	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-d4c8-f4c38435d05b	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab4-d4c8-f4c38435d05b	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-d4c8-f4c38435d05b	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-6d06-990b379e329c	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-6d06-990b379e329c	00030000-568a-9ab4-4974-56d8783ab326
00020000-568a-9ab4-32b4-c08d6b93714e	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-764f-acc9a65316da	00030000-568a-9ab4-f6f0-bf8aa3947c95
00020000-568a-9ab4-764f-acc9a65316da	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-764f-acc9a65316da	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-764f-acc9a65316da	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-764f-acc9a65316da	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-764f-acc9a65316da	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-764f-acc9a65316da	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-764f-acc9a65316da	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-764f-acc9a65316da	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-3b3e-8b45882a2aff	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-3b3e-8b45882a2aff	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-3b3e-8b45882a2aff	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-3b3e-8b45882a2aff	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-3b3e-8b45882a2aff	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-57dc-2f78f4ee7610	00030000-568a-9ab4-da19-3757eb16f926
00020000-568a-9ab4-57dc-2f78f4ee7610	00030000-568a-9ab4-a69c-9c7e3950dec8
00020000-568a-9ab4-ab78-50fcb02bdde6	00030000-568a-9ab4-da19-3757eb16f926
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-8550-9ca68498b3f7
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-0ff5-6d85215f5275
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-6c62-e0e3bc9ce7da
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-140b-f45f006396b8
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-d57f-b2aebeaf9303
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-bf6a-600b25b1d4c0
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-4979-48fdb7c1f82d
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-b354-9df9a3308c08
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-a28b-58365e8d3436
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-de02-ff7900d28370
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-611a-187208c4be04
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-035c-81603a470852
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-5730-e1ddddb1c75d
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-cb1c-13e443d30240
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-2bff-29e64fd2de89
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-bed7-6919a7f449a7
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-2b4a-ad9f381079f7
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-2335-5f48019dcfbd
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-3795-2313ae0bcbeb
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-bc2f-dec7350b1366
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-91be-aaad01551b34
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-bbc4-a4a98a4ba269
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-3aba-70033192f6db
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-b09e-9097c3f0c861
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-5e6c-48dd9dcab0f3
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-7eaa-26e164a2d835
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-c758-14d07a72a133
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-a933-ca4d4707c38e
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-77b5-fcb3b701483d
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-d9d4-4b45e1857bc0
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-3ed8-f991290bda33	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-6c62-e0e3bc9ce7da
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-d57f-b2aebeaf9303
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-4979-48fdb7c1f82d
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-a28b-58365e8d3436
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-611a-187208c4be04
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-5730-e1ddddb1c75d
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-2bff-29e64fd2de89
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-2b4a-ad9f381079f7
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-3795-2313ae0bcbeb
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-91be-aaad01551b34
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-a933-ca4d4707c38e
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-c758-14d07a72a133
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-77b5-fcb3b701483d
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-d9d4-4b45e1857bc0
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-78f4-53ebfdeebfb1	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-3d0a-e6b6513075aa
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-87c7-c248d2295ee1
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-48b9-5bfeb259f462
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-0d8b-e5f2c39d25d4
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-84b7-61fc3c03dc5a	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-e5cb-c83e2493f34f	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-f82f-9d2d2b74c20f	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-f82f-9d2d2b74c20f	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab4-f82f-9d2d2b74c20f	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-f82f-9d2d2b74c20f	00030000-568a-9ab4-48b9-5bfeb259f462
00020000-568a-9ab4-f82f-9d2d2b74c20f	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-f82f-9d2d2b74c20f	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-f82f-9d2d2b74c20f	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-f82f-9d2d2b74c20f	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-87c7-c248d2295ee1
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-6010-27762555ec3e
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-b3db-e91587dbacba
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-0c14-a529fbf406a2
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-5ab4-5a7204fe255e	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-b022-cdfa4ca9f00b	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-c412-76660cdf0b0c	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-c412-76660cdf0b0c	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-c412-76660cdf0b0c	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-c412-76660cdf0b0c	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab4-c412-76660cdf0b0c	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-c412-76660cdf0b0c	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-c412-76660cdf0b0c	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-82a0-3391004fdf2c	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-82a0-3391004fdf2c	00030000-568a-9ab4-0c14-a529fbf406a2
00020000-568a-9ab4-82a0-3391004fdf2c	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-82a0-3391004fdf2c	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-23d5-89161a3f416e	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-23d5-89161a3f416e	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-059d-b5bb66152f7d
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-87c7-c248d2295ee1
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-e4d0-bad1ffb9adae
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-fe6f-4f14ab4011cb
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-7fdc-7179ba4da8cf
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-c758-14d07a72a133
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-b09e-9097c3f0c861
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-48b9-5bfeb259f462
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-0d8b-e5f2c39d25d4
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-d9d4-4b45e1857bc0
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-7eaa-26e164a2d835
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-6010-27762555ec3e
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-b3db-e91587dbacba
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-77b5-fcb3b701483d
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-5e6c-48dd9dcab0f3
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-a933-ca4d4707c38e
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-3aba-70033192f6db
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-8550-9ca68498b3f7
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-6c62-e0e3bc9ce7da
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-0ff5-6d85215f5275
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-140b-f45f006396b8
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-d57f-b2aebeaf9303
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-bf6a-600b25b1d4c0
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-4979-48fdb7c1f82d
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-b354-9df9a3308c08
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-a28b-58365e8d3436
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-de02-ff7900d28370
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-611a-187208c4be04
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-035c-81603a470852
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-5730-e1ddddb1c75d
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-cb1c-13e443d30240
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-2bff-29e64fd2de89
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-bed7-6919a7f449a7
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-2b4a-ad9f381079f7
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-2335-5f48019dcfbd
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-3795-2313ae0bcbeb
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-bc2f-dec7350b1366
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-91be-aaad01551b34
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-bbc4-a4a98a4ba269
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-0c14-a529fbf406a2
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-da19-3757eb16f926
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-3d0a-e6b6513075aa
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab4-480a-fc609376745d	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-059d-b5bb66152f7d
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-e4d0-bad1ffb9adae
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-fe6f-4f14ab4011cb
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-7fdc-7179ba4da8cf
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-da19-3757eb16f926
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab4-0ebf-8a608764b21f	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-059d-b5bb66152f7d
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-87c7-c248d2295ee1
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-e4d0-bad1ffb9adae
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-fe6f-4f14ab4011cb
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-7fdc-7179ba4da8cf
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-48b9-5bfeb259f462
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-0d8b-e5f2c39d25d4
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-da19-3757eb16f926
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-3d0a-e6b6513075aa
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab4-844d-7165bae3b792	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-87c7-c248d2295ee1
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-e4d0-bad1ffb9adae
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-fe6f-4f14ab4011cb
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-7fdc-7179ba4da8cf
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-c758-14d07a72a133
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-b09e-9097c3f0c861
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-48b9-5bfeb259f462
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-0d8b-e5f2c39d25d4
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-d9d4-4b45e1857bc0
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-7eaa-26e164a2d835
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-1d1d-20f23b6a2c7f
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-6010-27762555ec3e
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-b3db-e91587dbacba
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-5566-f610162219c5
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-77b5-fcb3b701483d
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-5e6c-48dd9dcab0f3
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-7335-16662b2494b9
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-a933-ca4d4707c38e
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-3aba-70033192f6db
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-6206-12b2cfee6c59
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-8550-9ca68498b3f7
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-6c62-e0e3bc9ce7da
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-0ff5-6d85215f5275
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-140b-f45f006396b8
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-d57f-b2aebeaf9303
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-bf6a-600b25b1d4c0
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-4979-48fdb7c1f82d
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-b354-9df9a3308c08
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-a28b-58365e8d3436
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-de02-ff7900d28370
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-611a-187208c4be04
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-035c-81603a470852
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-5730-e1ddddb1c75d
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-cb1c-13e443d30240
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-2bff-29e64fd2de89
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-bed7-6919a7f449a7
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-2b4a-ad9f381079f7
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-2335-5f48019dcfbd
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-3795-2313ae0bcbeb
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-bc2f-dec7350b1366
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-91be-aaad01551b34
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-bbc4-a4a98a4ba269
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-0c14-a529fbf406a2
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-35f0-5ad7e0bbf442
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-5c4f-68e2b6a8d8bc
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-3d0a-e6b6513075aa
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-dca1-3f1c7db2c1bb
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab4-af30-eb5dc6e307e4	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-059d-b5bb66152f7d
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-87c7-c248d2295ee1
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-e4d0-bad1ffb9adae
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-fe6f-4f14ab4011cb
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-7fdc-7179ba4da8cf
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-48b9-5bfeb259f462
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-0d8b-e5f2c39d25d4
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-1d1d-20f23b6a2c7f
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-6010-27762555ec3e
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-5566-f610162219c5
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-7335-16662b2494b9
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-6206-12b2cfee6c59
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-35f0-5ad7e0bbf442
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-da19-3757eb16f926
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-5c4f-68e2b6a8d8bc
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-3d0a-e6b6513075aa
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-dca1-3f1c7db2c1bb
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab4-b4b6-fffdb5658cd0	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-059d-b5bb66152f7d
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-e4d0-bad1ffb9adae
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-48b9-5bfeb259f462
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-da19-3757eb16f926
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab4-6b80-b7f26bef5543	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-059d-b5bb66152f7d
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-87c7-c248d2295ee1
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-c758-14d07a72a133
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-b09e-9097c3f0c861
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-d9d4-4b45e1857bc0
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-7eaa-26e164a2d835
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-1d1d-20f23b6a2c7f
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-f6f0-bf8aa3947c95
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-6010-27762555ec3e
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-b3db-e91587dbacba
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-5566-f610162219c5
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-77b5-fcb3b701483d
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-5e6c-48dd9dcab0f3
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-7335-16662b2494b9
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-a933-ca4d4707c38e
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-3aba-70033192f6db
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-6206-12b2cfee6c59
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-8550-9ca68498b3f7
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-6c62-e0e3bc9ce7da
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-0ff5-6d85215f5275
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-140b-f45f006396b8
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-d57f-b2aebeaf9303
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-bf6a-600b25b1d4c0
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-4979-48fdb7c1f82d
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-b354-9df9a3308c08
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-a28b-58365e8d3436
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-de02-ff7900d28370
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-611a-187208c4be04
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-035c-81603a470852
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-5730-e1ddddb1c75d
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-cb1c-13e443d30240
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-2bff-29e64fd2de89
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-bed7-6919a7f449a7
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-2b4a-ad9f381079f7
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-2335-5f48019dcfbd
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-3795-2313ae0bcbeb
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-bc2f-dec7350b1366
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-91be-aaad01551b34
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-bbc4-a4a98a4ba269
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-0c14-a529fbf406a2
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-35f0-5ad7e0bbf442
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-da19-3757eb16f926
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-5c4f-68e2b6a8d8bc
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-4974-56d8783ab326
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-dca1-3f1c7db2c1bb
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab4-895c-cda21d96ff45	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-7c3f-2bba13295b2c
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-7b53-8d8349b763bb
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-059d-b5bb66152f7d
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-e27f-871e2a7e4ce5
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-87c7-c248d2295ee1
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-b2e4-6bb4f64d283b
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5a02-9ed24f073541
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-a4a7-a05023198111
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-74a4-3f54c68f12c8
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-e4d0-bad1ffb9adae
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-fe6f-4f14ab4011cb
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-ac28-549bb93f409b
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-7fdc-7179ba4da8cf
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-1d04-13c87aad51d8
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c2aa-c1dfed86ea39
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-8f70-55e2f8b96203
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-1942-6b4314578ddd
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-023c-b1d3cf4a7d0d
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-db7a-71b2610d0fd4
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3a4a-cb19993d6eda
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-37e5-9e089323782e
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c8d7-976e24a5dffb
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c758-14d07a72a133
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-b09e-9097c3f0c861
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d028-a4dd638028d7
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-0676-45247966fda7
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-4b82-b499f0e1b4fa
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-ef1b-e2f3c6611e4a
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-0d8b-e5f2c39d25d4
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-48b9-5bfeb259f462
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-6ef1-d2169ea8ec26
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-de7f-ed9691450015
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c7ca-370138379b5a
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d9d4-4b45e1857bc0
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-7eaa-26e164a2d835
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-e4b2-4d64f83d6237
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-1d1d-20f23b6a2c7f
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5477-0bab9c9d5860
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-e60c-06b91c88b05c
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-49a0-f9da36cc8b8c
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-11ba-0198db9b7c5f
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-de5a-e8117ea3c9e3
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-393f-316243c87e00
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3f34-d8a037ec1d17
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-7d10-ea6c17f2e7e5
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-bd53-2a814be201a9
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-2427-786245d006b7
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5726-2a5c5b247331
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-1c55-763cf53f40db
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d122-d9c570ec0363
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-fe52-56d9ae28efdb
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d8c5-c4c450e17cfd
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-f6f0-bf8aa3947c95
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-6010-27762555ec3e
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d888-94e339cf9490
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-96ff-1c39bf4e5e47
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-6f61-096902d150c4
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-ad30-afb5867285aa
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-b3db-e91587dbacba
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5566-f610162219c5
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-8860-06e65ff1bc79
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-77b5-fcb3b701483d
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5e6c-48dd9dcab0f3
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-da8f-334a52c2c886
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5f84-20def02e1b22
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-ec0b-3a647f4c0eaf
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-7335-16662b2494b9
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-0006-b94840264d61
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-47c0-07dacaab5c08
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3dcb-e606424a34eb
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-7e82-8a716b261176
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d159-98cd5cf3d525
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-23a7-486ca03359b4
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-a933-ca4d4707c38e
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3aba-70033192f6db
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-af4b-de708b6f269f
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-6206-12b2cfee6c59
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-8550-9ca68498b3f7
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-6c62-e0e3bc9ce7da
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-0ff5-6d85215f5275
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-140b-f45f006396b8
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d57f-b2aebeaf9303
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-bf6a-600b25b1d4c0
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-4979-48fdb7c1f82d
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-b354-9df9a3308c08
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-a28b-58365e8d3436
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-de02-ff7900d28370
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-611a-187208c4be04
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-035c-81603a470852
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5730-e1ddddb1c75d
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-cb1c-13e443d30240
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-2bff-29e64fd2de89
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-bed7-6919a7f449a7
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-2b4a-ad9f381079f7
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-2335-5f48019dcfbd
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3795-2313ae0bcbeb
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-bc2f-dec7350b1366
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-91be-aaad01551b34
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-bbc4-a4a98a4ba269
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-4ec3-df28dcd32b95
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-e273-97d7231e1403
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-9e4c-0ec61aef75ac
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3c42-9d33fc7e8116
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5d2a-4f3ab629e388
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-4834-129b104dfef6
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3ca5-598b7d3ba744
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3e99-0e00ef1be59c
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-1f5f-ec842825065f
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-6e0a-d00db76c2503
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-babf-426fa19e90b1
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-6283-fdb90abee4c6
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-b40e-475dde18d261
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-24ae-c1a428f4b79c
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3bd1-6e60dc518db3
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-b317-c684d58ebac7
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d4c7-d7a258387033
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-2798-a640ff92ac5d
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-9afb-33a8a86e2551
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d4e0-2cfd90e28241
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-50b5-917bd43112ed
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-360a-8aed7d7b1c5a
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-ff7a-ce415b204327
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-0c14-a529fbf406a2
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-35f0-5ad7e0bbf442
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-52c4-b9883786c543
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-09dc-1e3000fa55a4
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c204-dc0163790280
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-e04f-9f73325d32b5
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-a028-9d4c75f1cc8d
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-b176-8a52189fadb9
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d8b5-fbb5e44ebe75
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-95ba-f5c7efd7142c
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3068-93ebb7e88db1
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-da19-3757eb16f926
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-a69c-9c7e3950dec8
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5c4f-68e2b6a8d8bc
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-3d0a-e6b6513075aa
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-78fa-fa945d629fe3
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-8b55-a6a0cf26fe53
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-bb04-699b83401286
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-ecd6-b5cdd467899c
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d8d3-91c4e86d3d02
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-4974-56d8783ab326
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-a07a-6cbbf5305562
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-8d6d-d34606331f2a
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-dca1-3f1c7db2c1bb
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-c715-f4b2b7262a30
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-045e-551453ef31fc
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-afbf-e2263f143f1f
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-1767-902272d48059
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-48a6-033537934c32
00020000-568a-9ab6-1b9b-cee2eced14e3	00030000-568a-9ab4-5d27-5d2f5d579339
00020000-568a-9ab6-2548-fd3cbb63b33d	00030000-568a-9ab4-d556-af0ba05c6a60
00020000-568a-9ab6-9101-aa2b03d9603e	00030000-568a-9ab4-bfaf-19080fe725eb
00020000-568a-9ab6-e671-67bd105015a6	00030000-568a-9ab4-3d0a-e6b6513075aa
00020000-568a-9ab6-f06c-b92e23a1bdf8	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab6-0d00-d1c94db5174f	00030000-568a-9ab4-393f-316243c87e00
00020000-568a-9ab6-72d0-bdefac2c3b28	00030000-568a-9ab4-3f34-d8a037ec1d17
00020000-568a-9ab6-38ca-43aa2ba68758	00030000-568a-9ab4-7d10-ea6c17f2e7e5
00020000-568a-9ab6-4624-610c40381284	00030000-568a-9ab4-de5a-e8117ea3c9e3
00020000-568a-9ab6-c673-15ce421dc015	00030000-568a-9ab4-49a0-f9da36cc8b8c
00020000-568a-9ab6-4a11-196cb1109961	00030000-568a-9ab4-11ba-0198db9b7c5f
00020000-568a-9ab6-a513-45dda6656915	00030000-568a-9ab4-f5ff-4721348dc389
00020000-568a-9ab6-be31-48fb84efbf3b	00030000-568a-9ab4-c8b1-3900d83a27a0
00020000-568a-9ab6-dc21-a3ccac484cde	00030000-568a-9ab4-5a6d-27bdd6120f42
00020000-568a-9ab6-0fec-e9671e57023e	00030000-568a-9ab4-f6ad-59ec925ba070
00020000-568a-9ab6-0c68-125273afc7ef	00030000-568a-9ab4-6010-27762555ec3e
00020000-568a-9ab6-fda4-a742db619165	00030000-568a-9ab4-5a0d-6a15b63dd4cf
00020000-568a-9ab6-cdde-ca54377ad710	00030000-568a-9ab4-c94d-5c838cf09ee0
00020000-568a-9ab6-8f9c-9f8e71e6d35f	00030000-568a-9ab4-c116-5394c3bcf148
00020000-568a-9ab6-0e21-c9744ebb6ed7	00030000-568a-9ab4-96b8-83040377a1f4
00020000-568a-9ab6-0e21-c9744ebb6ed7	00030000-568a-9ab4-5566-f610162219c5
00020000-568a-9ab6-0e21-c9744ebb6ed7	00030000-568a-9ab4-208d-1323da301ef3
00020000-568a-9ab6-d1d1-2406dbe31e9a	00030000-568a-9ab4-5554-9668c0da01b3
00020000-568a-9ab6-dc6d-97a4feb89701	00030000-568a-9ab4-5c4f-68e2b6a8d8bc
00020000-568a-9ab6-6d93-4d547cd09665	00030000-568a-9ab4-ff7a-ce415b204327
00020000-568a-9ab6-bb45-f3721a940652	00030000-568a-9ab4-adc3-570e08d9bbab
00020000-568a-9ab6-6584-f8e3a7fb9357	00030000-568a-9ab4-35f0-5ad7e0bbf442
00020000-568a-9ab6-38e7-9a1b0083d431	00030000-568a-9ab4-8dae-b52ef51fed1b
00020000-568a-9ab6-3170-26b5e4b52a93	00030000-568a-9ab4-7335-16662b2494b9
00020000-568a-9ab6-351e-672caad909fd	00030000-568a-9ab4-9a88-fc859be56b0c
00020000-568a-9ab6-fb4f-6c842a461141	00030000-568a-9ab4-dca1-3f1c7db2c1bb
00020000-568a-9ab6-91af-7a22cfc0e513	00030000-568a-9ab4-a34d-ee8f60af3be8
00020000-568a-9ab6-719f-a526b491bca4	00030000-568a-9ab4-b3db-e91587dbacba
00020000-568a-9ab6-7cc1-357041113571	00030000-568a-9ab4-c633-8e9d75a6573b
00020000-568a-9ab6-b34c-0c586ac34a46	00030000-568a-9ab4-0c14-a529fbf406a2
00020000-568a-9ab7-d4a6-f291b5d23641	00030000-568a-9ab4-1d58-1968d87df9db
00020000-568a-9ab7-c09e-49ddba55adfc	00030000-568a-9ab4-07dd-539064a2a703
00020000-568a-9ab7-35fb-6a7f6913b4ff	00030000-568a-9ab4-87c7-c248d2295ee1
00020000-568a-9ab7-8b7e-eadfe01610df	00030000-568a-9ab4-72ee-8b0fef4daede
00020000-568a-9ab7-6635-0df063434d65	00030000-568a-9ab4-48b9-5bfeb259f462
00020000-568a-9ab7-bc12-0de3d2ed1e66	00030000-568a-9ab4-0d8b-e5f2c39d25d4
\.


--
-- TOC entry 3150 (class 0 OID 34364626)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 34364660)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 34364794)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-568a-9ab7-3d90-44bc1795b07c	00090000-568a-9ab7-f585-c75cf1e6263b	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-568a-9ab7-952a-2672bd949a13	00090000-568a-9ab7-090f-76225ea65949	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-568a-9ab7-e666-3e30c9b270fb	00090000-568a-9ab7-8946-d3f5f244afe2	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-568a-9ab7-7a4d-691484342108	00090000-568a-9ab7-7a50-465028260ceb	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3121 (class 0 OID 34364318)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-568a-9ab7-5b17-3b7acf7dfd0b	\N	00040000-568a-9ab3-1fc7-8c8414cfa151	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-9ab7-b7d7-dff739cd3496	\N	00040000-568a-9ab3-1fc7-8c8414cfa151	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-568a-9ab7-53d0-951d2deca8d3	\N	00040000-568a-9ab3-1fc7-8c8414cfa151	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-9ab7-540f-ca13ed6ea82b	\N	00040000-568a-9ab3-1fc7-8c8414cfa151	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-9ab7-ddeb-b6da807864b3	\N	00040000-568a-9ab3-1fc7-8c8414cfa151	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-9ab7-ab67-95c0b32b062a	\N	00040000-568a-9ab3-4106-81645eef6e2b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-9ab7-3a22-248a8278776d	\N	00040000-568a-9ab3-1cbf-4c177d4b39c8	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-9ab7-b417-119e897abe40	\N	00040000-568a-9ab3-0a9a-7db2c7be3554	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-9ab7-1325-c2a5142e977d	\N	00040000-568a-9ab3-ead6-65bcd3796edc	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568a-9ab9-9084-ee265c1bfe32	\N	00040000-568a-9ab3-1fc7-8c8414cfa151	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3124 (class 0 OID 34364363)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-568a-9ab3-0ce7-50a1ebf0179e	8341	Adlešiči
00050000-568a-9ab3-c0dc-e83410e7d94a	5270	Ajdovščina
00050000-568a-9ab3-54c3-5d25b76ca4a0	6280	Ankaran/Ancarano
00050000-568a-9ab3-6861-a4e441097ba0	9253	Apače
00050000-568a-9ab3-3ad5-d21b3371b4b2	8253	Artiče
00050000-568a-9ab3-69bf-7b44ac2c278d	4275	Begunje na Gorenjskem
00050000-568a-9ab3-582e-0f1bfff4cbd3	1382	Begunje pri Cerknici
00050000-568a-9ab3-76f0-6ae8de9535be	9231	Beltinci
00050000-568a-9ab3-d6b1-2f021c5f52cd	2234	Benedikt
00050000-568a-9ab3-4544-645e5d42cbb3	2345	Bistrica ob Dravi
00050000-568a-9ab3-9871-a7c2234b7795	3256	Bistrica ob Sotli
00050000-568a-9ab3-ce08-7bb817eba510	8259	Bizeljsko
00050000-568a-9ab3-3da1-e51df028972d	1223	Blagovica
00050000-568a-9ab3-ec5e-3fca3d0ba22c	8283	Blanca
00050000-568a-9ab3-9611-fd1fee19e83a	4260	Bled
00050000-568a-9ab3-7465-c57e1f005e7c	4273	Blejska Dobrava
00050000-568a-9ab3-a52d-b4b79b1740c1	9265	Bodonci
00050000-568a-9ab3-bd75-3a17ddb8356d	9222	Bogojina
00050000-568a-9ab3-d437-78fb0fc15766	4263	Bohinjska Bela
00050000-568a-9ab3-115a-cf2f8709db61	4264	Bohinjska Bistrica
00050000-568a-9ab3-5e7c-38220d235efc	4265	Bohinjsko jezero
00050000-568a-9ab3-058e-0cb17b162b4f	1353	Borovnica
00050000-568a-9ab3-f1e2-2bedf4ec60e3	8294	Boštanj
00050000-568a-9ab3-7312-e68c4c3ba80a	5230	Bovec
00050000-568a-9ab3-d119-41e277588b12	5295	Branik
00050000-568a-9ab3-57ed-6ba36f9986c9	3314	Braslovče
00050000-568a-9ab3-0cd3-993b870ed424	5223	Breginj
00050000-568a-9ab3-ef9b-241423c1960e	8280	Brestanica
00050000-568a-9ab3-ee7c-77fd3eb5a12c	2354	Bresternica
00050000-568a-9ab3-e962-8f655059c2d3	4243	Brezje
00050000-568a-9ab3-e166-1e078bc71e92	1351	Brezovica pri Ljubljani
00050000-568a-9ab3-8823-c6da2b2e4f79	8250	Brežice
00050000-568a-9ab3-5372-91ccf1777ec3	4210	Brnik - Aerodrom
00050000-568a-9ab3-4ecb-adb619767562	8321	Brusnice
00050000-568a-9ab3-703c-ee82838583c8	3255	Buče
00050000-568a-9ab3-31d3-7e6f37f68d62	8276	Bučka 
00050000-568a-9ab3-9b1d-dbeb02f72584	9261	Cankova
00050000-568a-9ab3-e7ae-217c5f747839	3000	Celje 
00050000-568a-9ab3-cb25-b3d76174bba4	3001	Celje - poštni predali
00050000-568a-9ab3-9637-38fdd66e010d	4207	Cerklje na Gorenjskem
00050000-568a-9ab3-ebd5-72056519f3e4	8263	Cerklje ob Krki
00050000-568a-9ab3-1996-05837f47fcbf	1380	Cerknica
00050000-568a-9ab3-2470-fd43352f37d0	5282	Cerkno
00050000-568a-9ab3-4f66-64e1a39e9672	2236	Cerkvenjak
00050000-568a-9ab3-1bc3-933d95d37dcb	2215	Ceršak
00050000-568a-9ab3-4d17-8d9d0a157527	2326	Cirkovce
00050000-568a-9ab3-9d87-f82bafa4dda5	2282	Cirkulane
00050000-568a-9ab3-ab82-5cdc3e7dbee0	5273	Col
00050000-568a-9ab3-22f7-fa4c7313f56b	8251	Čatež ob Savi
00050000-568a-9ab3-ac02-34798f34fcd4	1413	Čemšenik
00050000-568a-9ab3-946c-4c3a0d22f9b2	5253	Čepovan
00050000-568a-9ab3-25b0-2d7cbee83a51	9232	Črenšovci
00050000-568a-9ab3-a5ea-b36fb3532a48	2393	Črna na Koroškem
00050000-568a-9ab3-7d62-6506a7392696	6275	Črni Kal
00050000-568a-9ab3-8d55-1f30a28bdedf	5274	Črni Vrh nad Idrijo
00050000-568a-9ab3-763e-eb29a21108bc	5262	Črniče
00050000-568a-9ab3-041c-f4e89a6c66a1	8340	Črnomelj
00050000-568a-9ab3-dca4-61a9b54b2252	6271	Dekani
00050000-568a-9ab3-f43e-0647aa84f847	5210	Deskle
00050000-568a-9ab3-18b4-9f5186e97331	2253	Destrnik
00050000-568a-9ab3-ea21-5266c890697b	6215	Divača
00050000-568a-9ab3-f447-aaa25f3ffac2	1233	Dob
00050000-568a-9ab3-c4db-cd4d6ac9582f	3224	Dobje pri Planini
00050000-568a-9ab3-b933-79db5cc34cd5	8257	Dobova
00050000-568a-9ab3-0d19-edda34abb0d0	1423	Dobovec
00050000-568a-9ab3-84fb-8e09b5d0f040	5263	Dobravlje
00050000-568a-9ab3-b6e5-3881f011e600	3204	Dobrna
00050000-568a-9ab3-3ba0-afe112cb142a	8211	Dobrnič
00050000-568a-9ab3-2744-393fe05b7e9b	1356	Dobrova
00050000-568a-9ab3-7c2e-3d56e320f115	9223	Dobrovnik/Dobronak 
00050000-568a-9ab3-3b5c-e19f3f857f0a	5212	Dobrovo v Brdih
00050000-568a-9ab3-735e-5d195638b9bf	1431	Dol pri Hrastniku
00050000-568a-9ab3-c6e5-1240da97e8ba	1262	Dol pri Ljubljani
00050000-568a-9ab3-efc1-2d978c616841	1273	Dole pri Litiji
00050000-568a-9ab3-d8c4-c1f44081458a	1331	Dolenja vas
00050000-568a-9ab3-7796-537686d211e0	8350	Dolenjske Toplice
00050000-568a-9ab3-c6cd-4552002cf3a6	1230	Domžale
00050000-568a-9ab3-38bd-26a75cae8159	2252	Dornava
00050000-568a-9ab3-b974-02586d466935	5294	Dornberk
00050000-568a-9ab3-714f-27340078070d	1319	Draga
00050000-568a-9ab3-fe15-4b0ce3c471ef	8343	Dragatuš
00050000-568a-9ab3-bed7-2f6ce86d5951	3222	Dramlje
00050000-568a-9ab3-c7e9-4491149113d5	2370	Dravograd
00050000-568a-9ab3-7560-e2096640e73d	4203	Duplje
00050000-568a-9ab3-003c-18558139b95a	6221	Dutovlje
00050000-568a-9ab3-1bcf-b911375e8742	8361	Dvor
00050000-568a-9ab3-c3dd-9080b5c02feb	2343	Fala
00050000-568a-9ab3-b060-a004dcfacd23	9208	Fokovci
00050000-568a-9ab3-bf5e-fb53c08d9bc6	2313	Fram
00050000-568a-9ab3-f159-960fd0495112	3213	Frankolovo
00050000-568a-9ab3-f0ca-682ec7633c6f	1274	Gabrovka
00050000-568a-9ab3-a4b8-dda6bc69f93e	8254	Globoko
00050000-568a-9ab3-f2c5-27d307afc3eb	5275	Godovič
00050000-568a-9ab3-521f-c96e8027ff09	4204	Golnik
00050000-568a-9ab3-3c5e-2ad3027fccab	3303	Gomilsko
00050000-568a-9ab3-60f1-156cd4b76506	4224	Gorenja vas
00050000-568a-9ab3-0123-f6917ffb9e94	3263	Gorica pri Slivnici
00050000-568a-9ab3-de56-83c42df13d1f	2272	Gorišnica
00050000-568a-9ab3-2947-6219b2bdcc0a	9250	Gornja Radgona
00050000-568a-9ab3-771e-0a9f339ee390	3342	Gornji Grad
00050000-568a-9ab3-1ee9-0fccf372218a	4282	Gozd Martuljek
00050000-568a-9ab3-d814-7dc0d72cae13	6272	Gračišče
00050000-568a-9ab3-c61c-4b1f683a0d17	9264	Grad
00050000-568a-9ab3-41c6-e103b3877e8d	8332	Gradac
00050000-568a-9ab3-1c19-e0364e1749c1	1384	Grahovo
00050000-568a-9ab3-d2a5-7268870e1eda	5242	Grahovo ob Bači
00050000-568a-9ab3-4172-4f01c3a3e547	5251	Grgar
00050000-568a-9ab3-bf3e-15434ce59078	3302	Griže
00050000-568a-9ab3-c6ca-a5071804c313	3231	Grobelno
00050000-568a-9ab3-86ce-6280f5b08dc9	1290	Grosuplje
00050000-568a-9ab3-97ff-6fb710094e60	2288	Hajdina
00050000-568a-9ab3-ef5a-48ddb436c0eb	8362	Hinje
00050000-568a-9ab3-15c6-23d1b701e85b	2311	Hoče
00050000-568a-9ab3-4bfb-ffdf7341b566	9205	Hodoš/Hodos
00050000-568a-9ab3-d692-6feb6917f1e0	1354	Horjul
00050000-568a-9ab3-5728-683166813ad1	1372	Hotedršica
00050000-568a-9ab3-a6ef-ecd4ca478be0	1430	Hrastnik
00050000-568a-9ab3-6286-717bab96ba3a	6225	Hruševje
00050000-568a-9ab3-2851-8fe848ef37fc	4276	Hrušica
00050000-568a-9ab3-c51d-8928b96b7131	5280	Idrija
00050000-568a-9ab3-d9e4-2f0b7ffc0a7f	1292	Ig
00050000-568a-9ab3-aa4e-d09667c43b55	6250	Ilirska Bistrica
00050000-568a-9ab3-3706-f90f912deaed	6251	Ilirska Bistrica-Trnovo
00050000-568a-9ab3-0f73-eb9d47cac26a	1295	Ivančna Gorica
00050000-568a-9ab3-9496-2f22125f2ea6	2259	Ivanjkovci
00050000-568a-9ab3-6972-62d57ea1db49	1411	Izlake
00050000-568a-9ab3-a1fc-f487f173e4e7	6310	Izola/Isola
00050000-568a-9ab3-f39e-c73ccd21e122	2222	Jakobski Dol
00050000-568a-9ab3-9098-06bf16b33aed	2221	Jarenina
00050000-568a-9ab3-c71a-3ceed0b8e1ff	6254	Jelšane
00050000-568a-9ab3-cf77-fca22912eb56	4270	Jesenice
00050000-568a-9ab3-a2a0-45d2c3eb48dd	8261	Jesenice na Dolenjskem
00050000-568a-9ab3-7bc7-ad7aa215fe19	3273	Jurklošter
00050000-568a-9ab3-2f16-9e7ce57de99a	2223	Jurovski Dol
00050000-568a-9ab3-a0a2-dfac15050d98	2256	Juršinci
00050000-568a-9ab3-559a-9f9e22247ca1	5214	Kal nad Kanalom
00050000-568a-9ab3-ebb7-ee0cb5f542e5	3233	Kalobje
00050000-568a-9ab3-81a9-acdbc62b4560	4246	Kamna Gorica
00050000-568a-9ab3-a4fd-bb76549c17f1	2351	Kamnica
00050000-568a-9ab3-856e-64e6c303d2e2	1241	Kamnik
00050000-568a-9ab3-1ddd-c88e9c252874	5213	Kanal
00050000-568a-9ab3-0b18-1778c7aefb1d	8258	Kapele
00050000-568a-9ab3-148c-62544b7008be	2362	Kapla
00050000-568a-9ab3-7630-52493036c7d3	2325	Kidričevo
00050000-568a-9ab3-5b6e-75ffca79d0ed	1412	Kisovec
00050000-568a-9ab3-af0a-109949ed2e40	6253	Knežak
00050000-568a-9ab3-4aac-b18ea8f36044	5222	Kobarid
00050000-568a-9ab3-f2da-c666173758a6	9227	Kobilje
00050000-568a-9ab3-ff81-624e89c4df84	1330	Kočevje
00050000-568a-9ab3-0d6d-912203f8da14	1338	Kočevska Reka
00050000-568a-9ab3-00a4-30e624945dd0	2276	Kog
00050000-568a-9ab3-75f4-40ff0e2b6150	5211	Kojsko
00050000-568a-9ab3-95df-5766d35ee11e	6223	Komen
00050000-568a-9ab3-751b-f3cf6cc87034	1218	Komenda
00050000-568a-9ab3-1083-6d6a84438793	6000	Koper/Capodistria 
00050000-568a-9ab3-759e-8918c93d868c	6001	Koper/Capodistria - poštni predali
00050000-568a-9ab3-7544-0c202b423406	8282	Koprivnica
00050000-568a-9ab3-dcae-b711c61d8d90	5296	Kostanjevica na Krasu
00050000-568a-9ab3-3ac0-1669e7b52350	8311	Kostanjevica na Krki
00050000-568a-9ab3-b8c1-ec3e7c0be36a	1336	Kostel
00050000-568a-9ab3-9843-5af865f35c05	6256	Košana
00050000-568a-9ab3-083b-e41cff79743b	2394	Kotlje
00050000-568a-9ab3-5c98-e3d4d1873bc4	6240	Kozina
00050000-568a-9ab3-357a-dbd6af1131db	3260	Kozje
00050000-568a-9ab3-7c94-90ec1dd47741	4000	Kranj 
00050000-568a-9ab3-dbf2-6d9e6bf21b7e	4001	Kranj - poštni predali
00050000-568a-9ab3-a001-299bfa822602	4280	Kranjska Gora
00050000-568a-9ab3-6a52-08e9253705d8	1281	Kresnice
00050000-568a-9ab3-372e-c1a8f3c5b86b	4294	Križe
00050000-568a-9ab3-d35e-92b2f612f9b7	9206	Križevci
00050000-568a-9ab3-3531-3cf819335798	9242	Križevci pri Ljutomeru
00050000-568a-9ab3-5ac0-3a743c21390e	1301	Krka
00050000-568a-9ab3-79cc-01d10d9ed3f7	8296	Krmelj
00050000-568a-9ab3-815d-d8b927b473f6	4245	Kropa
00050000-568a-9ab3-2f65-d2202b253400	8262	Krška vas
00050000-568a-9ab3-645a-b75e9cb63201	8270	Krško
00050000-568a-9ab3-07e1-f1f411b84874	9263	Kuzma
00050000-568a-9ab3-2b91-7b9b8704c098	2318	Laporje
00050000-568a-9ab3-29dd-428f9f54e0ad	3270	Laško
00050000-568a-9ab3-d4e7-6c3be12ff8ce	1219	Laze v Tuhinju
00050000-568a-9ab3-f298-f7d78c1ad32f	2230	Lenart v Slovenskih goricah
00050000-568a-9ab3-14ef-1a33d8c79698	9220	Lendava/Lendva
00050000-568a-9ab3-91e3-6ab98d439376	4248	Lesce
00050000-568a-9ab3-a1ce-fc2cf939fd11	3261	Lesično
00050000-568a-9ab3-9cf2-d5b8b0b3cd42	8273	Leskovec pri Krškem
00050000-568a-9ab3-6317-2a0b596e6424	2372	Libeliče
00050000-568a-9ab3-c273-ec5fa94afba7	2341	Limbuš
00050000-568a-9ab3-7cdc-07da7d1c4aee	1270	Litija
00050000-568a-9ab3-af93-60d732ca87a2	3202	Ljubečna
00050000-568a-9ab3-0e08-600705ec2533	1000	Ljubljana 
00050000-568a-9ab3-960c-d29d5c1b9943	1001	Ljubljana - poštni predali
00050000-568a-9ab3-3d18-96c25fd7773b	1231	Ljubljana - Črnuče
00050000-568a-9ab3-85c4-e05bc474a026	1261	Ljubljana - Dobrunje
00050000-568a-9ab3-1060-8f96a766b136	1260	Ljubljana - Polje
00050000-568a-9ab3-24b4-3110b1d177ca	1210	Ljubljana - Šentvid
00050000-568a-9ab3-791e-789ac08cd48f	1211	Ljubljana - Šmartno
00050000-568a-9ab3-1a69-7a1a1c1b2a2c	3333	Ljubno ob Savinji
00050000-568a-9ab3-2cc2-8035a2d8e775	9240	Ljutomer
00050000-568a-9ab3-b53a-9dbe5280269e	3215	Loče
00050000-568a-9ab3-25d0-c953b86f2b55	5231	Log pod Mangartom
00050000-568a-9ab3-d48d-00d477472bc2	1358	Log pri Brezovici
00050000-568a-9ab3-01df-31ddfa0689d5	1370	Logatec
00050000-568a-9ab3-e6ae-709263429e59	1371	Logatec
00050000-568a-9ab3-365d-3b13b5dec39c	1434	Loka pri Zidanem Mostu
00050000-568a-9ab3-eed2-f06b3a782c6e	3223	Loka pri Žusmu
00050000-568a-9ab3-66e6-eb0c85b1473b	6219	Lokev
00050000-568a-9ab3-f01e-a329f90e2bb5	1318	Loški Potok
00050000-568a-9ab3-851a-d2e8e60856a2	2324	Lovrenc na Dravskem polju
00050000-568a-9ab3-c6bd-551983db7c67	2344	Lovrenc na Pohorju
00050000-568a-9ab3-6a5d-dda37d66352f	3334	Luče
00050000-568a-9ab3-4f75-659c357cb7f6	1225	Lukovica
00050000-568a-9ab3-3e80-f30137020544	9202	Mačkovci
00050000-568a-9ab3-b66d-a0f39e7a142c	2322	Majšperk
00050000-568a-9ab3-f4ee-c8d83253f00f	2321	Makole
00050000-568a-9ab3-4d6e-383db0f13675	9243	Mala Nedelja
00050000-568a-9ab3-cea2-ecb0442dacae	2229	Malečnik
00050000-568a-9ab3-91f3-7fc2706fc0b7	6273	Marezige
00050000-568a-9ab3-1cde-00e6cd1f4676	2000	Maribor 
00050000-568a-9ab3-9f39-e46d4088a88d	2001	Maribor - poštni predali
00050000-568a-9ab3-0046-44855c08050d	2206	Marjeta na Dravskem polju
00050000-568a-9ab3-5ea8-978aef801f7e	2281	Markovci
00050000-568a-9ab3-a8d7-d147219ed4ee	9221	Martjanci
00050000-568a-9ab3-110f-5b84d2b86fc9	6242	Materija
00050000-568a-9ab3-8f3e-445c102b0976	4211	Mavčiče
00050000-568a-9ab3-af5a-0412987d2d76	1215	Medvode
00050000-568a-9ab3-60ea-3dc44e216cd3	1234	Mengeš
00050000-568a-9ab3-1b48-534d84a05493	8330	Metlika
00050000-568a-9ab3-8b1b-c523b06ab566	2392	Mežica
00050000-568a-9ab3-4206-0c84c1e57a29	2204	Miklavž na Dravskem polju
00050000-568a-9ab3-03f2-3879c23fd1d6	2275	Miklavž pri Ormožu
00050000-568a-9ab3-295b-ab7fa4eb2d1f	5291	Miren
00050000-568a-9ab3-4f07-ff753c2c7527	8233	Mirna
00050000-568a-9ab3-dae0-de504f6dfc4e	8216	Mirna Peč
00050000-568a-9ab3-f7e1-8c783455b096	2382	Mislinja
00050000-568a-9ab3-1c35-348711d65a2a	4281	Mojstrana
00050000-568a-9ab3-ecb1-29e488218c9b	8230	Mokronog
00050000-568a-9ab3-3d81-add4d6aa54d9	1251	Moravče
00050000-568a-9ab3-a19c-a260a66c4816	9226	Moravske Toplice
00050000-568a-9ab3-7514-a7bbc3703ba7	5216	Most na Soči
00050000-568a-9ab3-7bc8-46957f0128c6	1221	Motnik
00050000-568a-9ab3-45f0-b1fcaa0aca94	3330	Mozirje
00050000-568a-9ab3-a3f6-c23450e99635	9000	Murska Sobota 
00050000-568a-9ab3-5c6a-53ad14b388bd	9001	Murska Sobota - poštni predali
00050000-568a-9ab3-0488-fb12a1f483f2	2366	Muta
00050000-568a-9ab3-c41d-7f16b3c19dfe	4202	Naklo
00050000-568a-9ab3-7f85-4a1f1bf180f2	3331	Nazarje
00050000-568a-9ab3-5eb6-9486e08c914c	1357	Notranje Gorice
00050000-568a-9ab3-4b3e-58412e6f6dbb	3203	Nova Cerkev
00050000-568a-9ab3-7e55-7043767c80d1	5000	Nova Gorica 
00050000-568a-9ab3-afd3-f585c720e36e	5001	Nova Gorica - poštni predali
00050000-568a-9ab3-1002-860f8cb73bf4	1385	Nova vas
00050000-568a-9ab3-4367-7be7804f3f4a	8000	Novo mesto
00050000-568a-9ab3-1563-95cfbfffa197	8001	Novo mesto - poštni predali
00050000-568a-9ab3-03f9-df12b93080e5	6243	Obrov
00050000-568a-9ab3-2b71-07f1ef4c168d	9233	Odranci
00050000-568a-9ab3-2e75-0b87ba22256a	2317	Oplotnica
00050000-568a-9ab3-d825-5a300bc9e0f1	2312	Orehova vas
00050000-568a-9ab3-fbed-064ec2d8f8da	2270	Ormož
00050000-568a-9ab3-b01e-8afc5f175524	1316	Ortnek
00050000-568a-9ab3-cdfc-3e8fc557e4bf	1337	Osilnica
00050000-568a-9ab3-ad90-93d60e0a97e0	8222	Otočec
00050000-568a-9ab3-9cfe-3ff7785a7bc4	2361	Ožbalt
00050000-568a-9ab3-4fb2-dd72f16a1df2	2231	Pernica
00050000-568a-9ab3-0231-d1e86cb43fe2	2211	Pesnica pri Mariboru
00050000-568a-9ab3-ec16-0c3340b5ea04	9203	Petrovci
00050000-568a-9ab3-f4a1-c45b1a92ad12	3301	Petrovče
00050000-568a-9ab3-3664-bd39368ae5a7	6330	Piran/Pirano
00050000-568a-9ab3-3fa3-189b25ef227b	8255	Pišece
00050000-568a-9ab3-9f6a-aea0bf1242f1	6257	Pivka
00050000-568a-9ab3-7383-ec73bc195412	6232	Planina
00050000-568a-9ab3-b870-39752142b164	3225	Planina pri Sevnici
00050000-568a-9ab3-9230-3cbcfb598a9c	6276	Pobegi
00050000-568a-9ab3-bfe7-4c4f36415ae7	8312	Podbočje
00050000-568a-9ab3-07a5-db23bcacbdfa	5243	Podbrdo
00050000-568a-9ab3-aedb-414bd4e67a44	3254	Podčetrtek
00050000-568a-9ab3-0331-207497313a2a	2273	Podgorci
00050000-568a-9ab3-bdac-faf7df0d97fb	6216	Podgorje
00050000-568a-9ab3-3091-15820fa1934e	2381	Podgorje pri Slovenj Gradcu
00050000-568a-9ab3-762a-15d46f766bc1	6244	Podgrad
00050000-568a-9ab3-8990-1ad1d160fe1a	1414	Podkum
00050000-568a-9ab3-b374-878cc34890c6	2286	Podlehnik
00050000-568a-9ab3-f2c4-d399f2815258	5272	Podnanos
00050000-568a-9ab3-5338-4e1bcc3eb456	4244	Podnart
00050000-568a-9ab3-eec7-0df773ff3773	3241	Podplat
00050000-568a-9ab3-9f27-e3fd611797af	3257	Podsreda
00050000-568a-9ab3-9bef-fff7083f613e	2363	Podvelka
00050000-568a-9ab3-414f-7150d7a5944d	2208	Pohorje
00050000-568a-9ab3-332c-946caaaef99f	2257	Polenšak
00050000-568a-9ab3-ae34-55f71c6cbd88	1355	Polhov Gradec
00050000-568a-9ab3-2b26-7c986cb856ee	4223	Poljane nad Škofjo Loko
00050000-568a-9ab3-364d-875fe385ee50	2319	Poljčane
00050000-568a-9ab3-f998-34d22f977a4b	1272	Polšnik
00050000-568a-9ab3-a749-6e4ed002c3a1	3313	Polzela
00050000-568a-9ab3-7305-b1f65d34d9fb	3232	Ponikva
00050000-568a-9ab3-e1e7-576610558d81	6320	Portorož/Portorose
00050000-568a-9ab3-a7d5-87f6f1db3c06	6230	Postojna
00050000-568a-9ab3-a8c3-257e24ff5696	2331	Pragersko
00050000-568a-9ab3-7aed-34a4b6905f07	3312	Prebold
00050000-568a-9ab3-4cff-10ce4c55c6cf	4205	Preddvor
00050000-568a-9ab3-3554-289ec0066cd3	6255	Prem
00050000-568a-9ab3-3987-53c321184295	1352	Preserje
00050000-568a-9ab3-0e8a-657d329c0745	6258	Prestranek
00050000-568a-9ab3-9a1c-b08a4573236d	2391	Prevalje
00050000-568a-9ab3-ac30-9f5ffcf532cd	3262	Prevorje
00050000-568a-9ab3-65c7-35f1c0e9bd1e	1276	Primskovo 
00050000-568a-9ab3-2e3c-3340467f00f8	3253	Pristava pri Mestinju
00050000-568a-9ab3-d4e5-f2ccc4237e01	9207	Prosenjakovci/Partosfalva
00050000-568a-9ab3-d347-a96d80a5577e	5297	Prvačina
00050000-568a-9ab3-5c22-7dc5b355a54b	2250	Ptuj
00050000-568a-9ab3-423c-d44c001c44a9	2323	Ptujska Gora
00050000-568a-9ab3-4930-d4d44d6cd828	9201	Puconci
00050000-568a-9ab3-0e05-bc1b909e71e4	2327	Rače
00050000-568a-9ab3-97f6-186c833b4fe3	1433	Radeče
00050000-568a-9ab3-1635-77cc98366d8b	9252	Radenci
00050000-568a-9ab3-1057-29735a7a95c5	2360	Radlje ob Dravi
00050000-568a-9ab3-70d8-76306d0351b8	1235	Radomlje
00050000-568a-9ab3-bec4-1eeaf22dd017	4240	Radovljica
00050000-568a-9ab3-55ad-256ebadb402b	8274	Raka
00050000-568a-9ab3-d79b-45d8505e0e78	1381	Rakek
00050000-568a-9ab3-7dc6-f8d71a666f81	4283	Rateče - Planica
00050000-568a-9ab3-f571-199f1011673f	2390	Ravne na Koroškem
00050000-568a-9ab3-e54a-1025dc8e6025	9246	Razkrižje
00050000-568a-9ab3-2666-83629b1117a4	3332	Rečica ob Savinji
00050000-568a-9ab3-8faf-3f03c216552e	5292	Renče
00050000-568a-9ab3-fbf7-8430334fa887	1310	Ribnica
00050000-568a-9ab3-539b-08030068ebb1	2364	Ribnica na Pohorju
00050000-568a-9ab3-4c24-e2fe05fdaad3	3272	Rimske Toplice
00050000-568a-9ab3-abc5-266b76288eee	1314	Rob
00050000-568a-9ab3-5aa0-8da101eb547c	5215	Ročinj
00050000-568a-9ab3-a762-e762f271d5e2	3250	Rogaška Slatina
00050000-568a-9ab3-f896-fe0e0549f00c	9262	Rogašovci
00050000-568a-9ab3-d183-9e8af2a9cca0	3252	Rogatec
00050000-568a-9ab3-2a33-04ff062b7f91	1373	Rovte
00050000-568a-9ab3-8322-00ba21c4ee2c	2342	Ruše
00050000-568a-9ab3-c3e3-7f279eecb9e8	1282	Sava
00050000-568a-9ab3-7cac-9be157ac2e09	6333	Sečovlje/Sicciole
00050000-568a-9ab3-25aa-23967786fd54	4227	Selca
00050000-568a-9ab3-13d2-bd1b066fa45d	2352	Selnica ob Dravi
00050000-568a-9ab3-febd-4e5d82bd160b	8333	Semič
00050000-568a-9ab3-3b34-15cdb833b039	8281	Senovo
00050000-568a-9ab3-137d-0381ad6306e5	6224	Senožeče
00050000-568a-9ab3-274f-b72c11de7ec1	8290	Sevnica
00050000-568a-9ab3-9e55-b8c111fa33eb	6210	Sežana
00050000-568a-9ab3-b549-6795de9a426c	2214	Sladki Vrh
00050000-568a-9ab3-319b-4bcf2aca44b3	5283	Slap ob Idrijci
00050000-568a-9ab3-98e6-573ce086a3d5	2380	Slovenj Gradec
00050000-568a-9ab3-c110-db4dc3d24359	2310	Slovenska Bistrica
00050000-568a-9ab3-80ef-12164522076c	3210	Slovenske Konjice
00050000-568a-9ab3-388f-90a7043c9500	1216	Smlednik
00050000-568a-9ab3-a5b1-ff68363000d2	5232	Soča
00050000-568a-9ab3-88a0-b04f3962a9e1	1317	Sodražica
00050000-568a-9ab3-23e6-ccbc3f3b4a59	3335	Solčava
00050000-568a-9ab3-c9de-493361dd5c6c	5250	Solkan
00050000-568a-9ab3-6852-3dfe978ab20c	4229	Sorica
00050000-568a-9ab3-c0e5-3c0272b86e98	4225	Sovodenj
00050000-568a-9ab3-e352-bbc94179edd6	5281	Spodnja Idrija
00050000-568a-9ab3-51d3-096550e7bb7d	2241	Spodnji Duplek
00050000-568a-9ab3-547b-e0c430378376	9245	Spodnji Ivanjci
00050000-568a-9ab3-39c6-628c7cbdea57	2277	Središče ob Dravi
00050000-568a-9ab3-cf40-91467f002c0d	4267	Srednja vas v Bohinju
00050000-568a-9ab3-79e5-46327573f26a	8256	Sromlje 
00050000-568a-9ab3-0599-9defffd9e5c9	5224	Srpenica
00050000-568a-9ab3-4d4b-aa310acc42f1	1242	Stahovica
00050000-568a-9ab3-d829-896e3fc0e963	1332	Stara Cerkev
00050000-568a-9ab3-b6d5-929584b1306f	8342	Stari trg ob Kolpi
00050000-568a-9ab3-25f1-046c710cec38	1386	Stari trg pri Ložu
00050000-568a-9ab3-937e-e13cfebb0450	2205	Starše
00050000-568a-9ab3-5da5-0f3f0b5dc083	2289	Stoperce
00050000-568a-9ab3-cd61-10b87dd29b5f	8322	Stopiče
00050000-568a-9ab3-9262-44b30cf05067	3206	Stranice
00050000-568a-9ab3-2f51-9a11341bc566	8351	Straža
00050000-568a-9ab3-2b00-79e2f54c1db3	1313	Struge
00050000-568a-9ab3-27c1-87302f692521	8293	Studenec
00050000-568a-9ab3-74f1-76aacc7afae9	8331	Suhor
00050000-568a-9ab3-2e33-b28b59e202b1	2233	Sv. Ana v Slovenskih goricah
00050000-568a-9ab3-d9f7-0b48fe399439	2235	Sv. Trojica v Slovenskih goricah
00050000-568a-9ab3-8194-5f042c082f3b	2353	Sveti Duh na Ostrem Vrhu
00050000-568a-9ab3-8b06-1c961096acc1	9244	Sveti Jurij ob Ščavnici
00050000-568a-9ab3-ed9e-ee370a470662	3264	Sveti Štefan
00050000-568a-9ab3-a221-f97b2c0e382f	2258	Sveti Tomaž
00050000-568a-9ab3-9072-2eca5f1ddde4	9204	Šalovci
00050000-568a-9ab3-a756-d480bfd46b57	5261	Šempas
00050000-568a-9ab3-3d2d-e5efd4d2c85a	5290	Šempeter pri Gorici
00050000-568a-9ab3-40a1-e56c3af6874b	3311	Šempeter v Savinjski dolini
00050000-568a-9ab3-f007-161b26032bab	4208	Šenčur
00050000-568a-9ab3-0917-4800a53e44bd	2212	Šentilj v Slovenskih goricah
00050000-568a-9ab3-2837-6f6a0860080f	8297	Šentjanž
00050000-568a-9ab3-079a-508bcdb6cb1d	2373	Šentjanž pri Dravogradu
00050000-568a-9ab3-3465-e123734beab3	8310	Šentjernej
00050000-568a-9ab3-bf21-13bcfa3d88dc	3230	Šentjur
00050000-568a-9ab3-3682-f2afd6280de1	3271	Šentrupert
00050000-568a-9ab3-6096-fa1110baa2b4	8232	Šentrupert
00050000-568a-9ab3-4570-4b9bb6739c45	1296	Šentvid pri Stični
00050000-568a-9ab3-5c41-ba3a4dc0374e	8275	Škocjan
00050000-568a-9ab3-ab7e-ec95201e4a55	6281	Škofije
00050000-568a-9ab3-4ea0-1369723ad38f	4220	Škofja Loka
00050000-568a-9ab3-0c9d-e5452a8742b7	3211	Škofja vas
00050000-568a-9ab3-4047-8e6cbae96fa7	1291	Škofljica
00050000-568a-9ab3-e624-169698fbac8d	6274	Šmarje
00050000-568a-9ab3-aebd-62beec2b8853	1293	Šmarje - Sap
00050000-568a-9ab3-a60b-5b59f51f1ed6	3240	Šmarje pri Jelšah
00050000-568a-9ab3-5050-672327b67c3e	8220	Šmarješke Toplice
00050000-568a-9ab3-73b1-b870a99f6d15	2315	Šmartno na Pohorju
00050000-568a-9ab3-3e0a-c635d2b9c762	3341	Šmartno ob Dreti
00050000-568a-9ab3-6cf7-7e74f5ce6334	3327	Šmartno ob Paki
00050000-568a-9ab3-3346-512a14f62bd0	1275	Šmartno pri Litiji
00050000-568a-9ab3-87cf-c562af299ec8	2383	Šmartno pri Slovenj Gradcu
00050000-568a-9ab3-d102-d5736602fa22	3201	Šmartno v Rožni dolini
00050000-568a-9ab3-3063-66969fc1cfe6	3325	Šoštanj
00050000-568a-9ab3-9857-f5ef9dd4a3cc	6222	Štanjel
00050000-568a-9ab3-a580-7676fdf0f749	3220	Štore
00050000-568a-9ab3-3623-aad1fa759932	3304	Tabor
00050000-568a-9ab3-8945-180d5458433a	3221	Teharje
00050000-568a-9ab3-f891-5f4bb659bad6	9251	Tišina
00050000-568a-9ab3-4c98-31f7b8677283	5220	Tolmin
00050000-568a-9ab3-7f1d-e47926a9c4fb	3326	Topolšica
00050000-568a-9ab3-e453-cc1498387713	2371	Trbonje
00050000-568a-9ab3-1769-c7e313a67591	1420	Trbovlje
00050000-568a-9ab3-a045-a4364944da9b	8231	Trebelno 
00050000-568a-9ab3-f8e0-7dacbe57149a	8210	Trebnje
00050000-568a-9ab3-a44e-2592dd97bddc	5252	Trnovo pri Gorici
00050000-568a-9ab3-fb64-7ac969a91dd8	2254	Trnovska vas
00050000-568a-9ab3-0bad-e7a216e0b621	1222	Trojane
00050000-568a-9ab3-acf4-25c6448ffa78	1236	Trzin
00050000-568a-9ab3-b002-160818c68a64	4290	Tržič
00050000-568a-9ab3-dcb8-bf415b42f0a5	8295	Tržišče
00050000-568a-9ab3-80e7-f8fc28609439	1311	Turjak
00050000-568a-9ab3-f841-dc1b6b5ead2a	9224	Turnišče
00050000-568a-9ab3-266d-8e7627c81e17	8323	Uršna sela
00050000-568a-9ab3-dcd1-b85411ce65f6	1252	Vače
00050000-568a-9ab3-0c18-6cf5220fbd1f	3320	Velenje 
00050000-568a-9ab3-dc8e-4d4f68e031c5	3322	Velenje - poštni predali
00050000-568a-9ab3-11e7-1f56200c283a	8212	Velika Loka
00050000-568a-9ab3-bd19-5e38a4c075b3	2274	Velika Nedelja
00050000-568a-9ab3-6f4b-b8bc5f193ec8	9225	Velika Polana
00050000-568a-9ab3-1e02-5bf96663ae01	1315	Velike Lašče
00050000-568a-9ab3-abf4-951ca4eae489	8213	Veliki Gaber
00050000-568a-9ab3-5a34-b9b3fc2d2024	9241	Veržej
00050000-568a-9ab3-9593-2e5a036e8259	1312	Videm - Dobrepolje
00050000-568a-9ab3-2cf5-027221b761f6	2284	Videm pri Ptuju
00050000-568a-9ab3-4d2a-831d8be1a41f	8344	Vinica
00050000-568a-9ab3-6f19-fab746d84783	5271	Vipava
00050000-568a-9ab3-14d0-30cf68e928f0	4212	Visoko
00050000-568a-9ab3-7c6a-228b02d8300e	1294	Višnja Gora
00050000-568a-9ab3-531c-ec62d867bfa0	3205	Vitanje
00050000-568a-9ab3-2510-706155f4a3db	2255	Vitomarci
00050000-568a-9ab3-85e4-852a0c1a4988	1217	Vodice
00050000-568a-9ab3-1c6c-80e29b052ad8	3212	Vojnik\t
00050000-568a-9ab3-8c59-5f0bfb4cbfbd	5293	Volčja Draga
00050000-568a-9ab3-1082-1eae42507e99	2232	Voličina
00050000-568a-9ab3-35a9-44498ae1a31f	3305	Vransko
00050000-568a-9ab3-cfb3-715f8ff0dcfa	6217	Vremski Britof
00050000-568a-9ab3-52da-ea433b73e1cb	1360	Vrhnika
00050000-568a-9ab3-c9f7-c041d1b5c7fc	2365	Vuhred
00050000-568a-9ab3-ea44-cbd2b13b2242	2367	Vuzenica
00050000-568a-9ab3-2abb-496b89d4297f	8292	Zabukovje 
00050000-568a-9ab3-b11d-366457118929	1410	Zagorje ob Savi
00050000-568a-9ab3-a4ec-b7db86b730e4	1303	Zagradec
00050000-568a-9ab3-fab4-82c8510d9534	2283	Zavrč
00050000-568a-9ab3-238f-a9241e16fb59	8272	Zdole 
00050000-568a-9ab3-8e22-4c2e2adb6517	4201	Zgornja Besnica
00050000-568a-9ab3-9148-0041f25fbc2b	2242	Zgornja Korena
00050000-568a-9ab3-d2a2-19bc260400dc	2201	Zgornja Kungota
00050000-568a-9ab3-4436-88d3a2bab645	2316	Zgornja Ložnica
00050000-568a-9ab3-c23f-a34db5906b0c	2314	Zgornja Polskava
00050000-568a-9ab3-ebc0-c0198d508fc3	2213	Zgornja Velka
00050000-568a-9ab3-bbc9-27fbb86c73a8	4247	Zgornje Gorje
00050000-568a-9ab3-e784-3af5115489cf	4206	Zgornje Jezersko
00050000-568a-9ab3-495f-27fd8c473b78	2285	Zgornji Leskovec
00050000-568a-9ab3-5612-8d547a74139f	1432	Zidani Most
00050000-568a-9ab3-8beb-8d0e2e1bb9c5	3214	Zreče
00050000-568a-9ab3-edda-aff74864d749	4209	Žabnica
00050000-568a-9ab3-9a01-21ca3d82d7b2	3310	Žalec
00050000-568a-9ab3-fef9-966b823d914a	4228	Železniki
00050000-568a-9ab3-853b-1c20bfd77887	2287	Žetale
00050000-568a-9ab3-a1f0-f71b3cf145e7	4226	Žiri
00050000-568a-9ab3-6945-4fd9e63075c9	4274	Žirovnica
00050000-568a-9ab3-8f9c-ea0253ecf028	8360	Žužemberk
\.


--
-- TOC entry 3173 (class 0 OID 34365032)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 34364600)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 34364348)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-568a-9ab7-7d15-ea990ec506d8	00080000-568a-9ab7-5b17-3b7acf7dfd0b	\N	00040000-568a-9ab3-1fc7-8c8414cfa151	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-568a-9ab7-e358-bea74f8c870c	00080000-568a-9ab7-5b17-3b7acf7dfd0b	\N	00040000-568a-9ab3-1fc7-8c8414cfa151	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-568a-9ab7-396e-532ff958337a	00080000-568a-9ab7-b7d7-dff739cd3496	\N	00040000-568a-9ab3-1fc7-8c8414cfa151	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3135 (class 0 OID 34364492)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-568a-9ab4-2bec-a0c7ea4c959a	novo leto	1	1	\N	t
00430000-568a-9ab4-e225-6d86e0ad7928	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-568a-9ab4-6edf-5d185bcafc72	dan upora proti okupatorju	27	4	\N	t
00430000-568a-9ab4-d813-f2eb184d8005	praznik dela	1	5	\N	t
00430000-568a-9ab4-6b23-d9e275400c70	praznik dela	2	5	\N	t
00430000-568a-9ab4-adf9-67e96fbc6ea5	dan Primoža Trubarja	8	6	\N	f
00430000-568a-9ab4-d16e-a3d6661cdba8	dan državnosti	25	6	\N	t
00430000-568a-9ab4-a513-3d22821cf9ea	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-568a-9ab4-5da2-72a25854935d	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-568a-9ab4-5d23-013e15eb1319	dan suverenosti	25	10	\N	f
00430000-568a-9ab4-4f72-15e43b408918	dan spomina na mrtve	1	11	\N	t
00430000-568a-9ab4-5202-a08b94201cc4	dan Rudolfa Maistra	23	11	\N	f
00430000-568a-9ab4-76cd-0406436c879c	božič	25	12	\N	t
00430000-568a-9ab4-c36b-09dea5bfa247	dan samostojnosti in enotnosti	26	12	\N	t
00430000-568a-9ab4-c224-871b457f8fe8	Marijino vnebovzetje	15	8	\N	t
00430000-568a-9ab4-98cc-8dce48e9dce9	dan reformacije	31	10	\N	t
00430000-568a-9ab4-bd80-3e9e10b63f6b	velikonočna nedelja	27	3	2016	t
00430000-568a-9ab4-9e4b-49b89bc3efac	velikonočna nedelja	16	4	2017	t
00430000-568a-9ab4-c214-7a82fc75a7d7	velikonočna nedelja	1	4	2018	t
00430000-568a-9ab4-cdf9-071c554d55a6	velikonočna nedelja	21	4	2019	t
00430000-568a-9ab4-58b8-b43e8b914c48	velikonočna nedelja	12	4	2020	t
00430000-568a-9ab4-e3ad-8a86ec31b85d	velikonočna nedelja	4	4	2021	t
00430000-568a-9ab4-8fa4-994a8f1dcfba	velikonočna nedelja	17	4	2022	t
00430000-568a-9ab4-e179-bdd633f4750b	velikonočna nedelja	9	4	2023	t
00430000-568a-9ab4-9e36-c75ed8a2ae91	velikonočna nedelja	31	3	2024	t
00430000-568a-9ab4-d608-2d73e637528d	velikonočna nedelja	20	4	2025	t
00430000-568a-9ab4-e112-64f9aec4f8b1	velikonočna nedelja	5	4	2026	t
00430000-568a-9ab4-b940-3c7decde8cad	velikonočna nedelja	28	3	2027	t
00430000-568a-9ab4-737f-01c728d41228	velikonočna nedelja	16	4	2028	t
00430000-568a-9ab4-9410-262f56f032e0	velikonočna nedelja	1	4	2029	t
00430000-568a-9ab4-a153-dfa40cc78448	velikonočna nedelja	21	4	2030	t
00430000-568a-9ab4-dfb2-9ec591d4583a	velikonočni ponedeljek	28	3	2016	t
00430000-568a-9ab4-58f8-34eac45a0574	velikonočni ponedeljek	17	4	2017	t
00430000-568a-9ab4-943c-031f65ced6e7	velikonočni ponedeljek	2	4	2018	t
00430000-568a-9ab4-dc25-8cc2b6a9b5da	velikonočni ponedeljek	22	4	2019	t
00430000-568a-9ab4-077a-18b10cc72376	velikonočni ponedeljek	13	4	2020	t
00430000-568a-9ab4-2c6c-f61bb5f0d509	velikonočni ponedeljek	5	4	2021	t
00430000-568a-9ab4-c667-9de1e4359853	velikonočni ponedeljek	18	4	2022	t
00430000-568a-9ab4-d011-ad6998ae7c89	velikonočni ponedeljek	10	4	2023	t
00430000-568a-9ab4-08f4-456d87f7a2a0	velikonočni ponedeljek	1	4	2024	t
00430000-568a-9ab4-13ed-5c5cea25ec10	velikonočni ponedeljek	21	4	2025	t
00430000-568a-9ab4-3f93-c30449a46324	velikonočni ponedeljek	6	4	2026	t
00430000-568a-9ab4-c553-ee568622ed59	velikonočni ponedeljek	29	3	2027	t
00430000-568a-9ab4-1c25-d1c4d28d4eab	velikonočni ponedeljek	17	4	2028	t
00430000-568a-9ab4-08af-84728b7b4a1c	velikonočni ponedeljek	2	4	2029	t
00430000-568a-9ab4-9e70-72427ef7c3ea	velikonočni ponedeljek	22	4	2030	t
00430000-568a-9ab4-15b7-04c287d71eab	binkoštna nedelja - binkošti	15	5	2016	t
00430000-568a-9ab4-eac8-8ab9a8e4043a	binkoštna nedelja - binkošti	4	6	2017	t
00430000-568a-9ab4-e70b-35ffd94bde1b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-568a-9ab4-5cff-ff93c1729b7b	binkoštna nedelja - binkošti	9	6	2019	t
00430000-568a-9ab4-d286-433c25449baa	binkoštna nedelja - binkošti	31	5	2020	t
00430000-568a-9ab4-6d61-acab66023030	binkoštna nedelja - binkošti	23	5	2021	t
00430000-568a-9ab4-d240-a3cab7c24a73	binkoštna nedelja - binkošti	5	6	2022	t
00430000-568a-9ab4-7298-6a5f2e5a97d6	binkoštna nedelja - binkošti	28	5	2023	t
00430000-568a-9ab4-3f7a-da43f9ec1860	binkoštna nedelja - binkošti	19	5	2024	t
00430000-568a-9ab4-a605-8f26d780da26	binkoštna nedelja - binkošti	8	6	2025	t
00430000-568a-9ab4-3c97-9f7c171f3dea	binkoštna nedelja - binkošti	24	5	2026	t
00430000-568a-9ab4-1adf-17bb8acc0f34	binkoštna nedelja - binkošti	16	5	2027	t
00430000-568a-9ab4-3c02-9ecb034ed70e	binkoštna nedelja - binkošti	4	6	2028	t
00430000-568a-9ab4-7c98-616e91b0cdc6	binkoštna nedelja - binkošti	20	5	2029	t
00430000-568a-9ab4-08d4-8a19d74b2c60	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3131 (class 0 OID 34364452)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 34364464)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 34364612)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 34365046)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 34365056)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-568a-9ab7-8026-b681dd434f98	00080000-568a-9ab7-53d0-951d2deca8d3	0987	AK
00190000-568a-9ab7-1c7a-5d28d6fa6dd7	00080000-568a-9ab7-b7d7-dff739cd3496	0989	AK
00190000-568a-9ab7-5623-d16712b045e0	00080000-568a-9ab7-540f-ca13ed6ea82b	0986	AK
00190000-568a-9ab7-e97b-3cd1a9fcf529	00080000-568a-9ab7-ab67-95c0b32b062a	0984	AK
00190000-568a-9ab7-2a43-fd6e3ef60c46	00080000-568a-9ab7-3a22-248a8278776d	0983	AK
00190000-568a-9ab7-6675-aeabaaa208c7	00080000-568a-9ab7-b417-119e897abe40	0982	AK
00190000-568a-9ab9-491e-ec8184c2b507	00080000-568a-9ab9-9084-ee265c1bfe32	1001	AK
\.


--
-- TOC entry 3172 (class 0 OID 34364945)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-568a-9ab7-1882-ab87fe33ad63	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3176 (class 0 OID 34365064)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 34364641)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-568a-9ab6-320e-f39ab813a267	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-568a-9ab6-a744-0d69f1ce3f82	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-568a-9ab6-eaf3-8415ae46d67e	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-568a-9ab6-3bd5-b18da8a64c0c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-568a-9ab6-d6a9-7d3113de8143	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-568a-9ab6-f223-64cc68f6148d	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-568a-9ab6-c183-63ac5aae2769	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3144 (class 0 OID 34364585)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 34364575)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 34364783)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 34364713)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 34364426)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 34364188)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-568a-9ab9-9084-ee265c1bfe32	00010000-568a-9ab5-026a-f863e0564b3a	2016-01-04 17:15:53	INS	a:0:{}
2	App\\Entity\\Option	00000000-568a-9ab9-614b-90440df04859	00010000-568a-9ab5-026a-f863e0564b3a	2016-01-04 17:15:53	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-568a-9ab9-491e-ec8184c2b507	00010000-568a-9ab5-026a-f863e0564b3a	2016-01-04 17:15:53	INS	a:0:{}
\.


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3153 (class 0 OID 34364654)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 34364226)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-568a-9ab4-f507-da3d59d76757	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-568a-9ab4-8270-ac4b2a904c04	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-568a-9ab4-bf3c-57a53822d21b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-568a-9ab4-4626-4731c47ad4ef	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-568a-9ab4-f525-398104bb73b9	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-568a-9ab4-9599-f4b7a1a7f99c	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-568a-9ab4-ac72-0f20e3ad43a1	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-568a-9ab4-62ef-4786ddfb2115	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-568a-9ab4-8a58-b7ea348ecda3	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-568a-9ab4-4df8-6e4242ff267b	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-568a-9ab4-2705-10a8c8e71ec3	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-568a-9ab4-2ec8-f041abd6c79c	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-568a-9ab4-97c9-45841a79cf6d	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-568a-9ab4-e490-e364220df3e2	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-568a-9ab4-ea49-98b0446a662d	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-568a-9ab4-405b-ee2e57aa7446	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-568a-9ab4-1456-e81d1cc3ffb4	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-568a-9ab4-b9f0-6d213740ae18	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-568a-9ab4-94a4-079597b5c261	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-568a-9ab4-d445-c04e580304c3	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-568a-9ab4-c2dc-6f0a1ac03e01	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-568a-9ab4-afed-bd51141019c5	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-568a-9ab4-5b39-70693f38f5cd	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-568a-9ab4-1892-062ec836d827	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-568a-9ab4-0585-86913375f7b4	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-568a-9ab4-f5a5-576e3a4b3f35	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-568a-9ab4-4c4e-b6e9fbc2f1f2	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-568a-9ab4-d4c8-f4c38435d05b	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-568a-9ab4-6d06-990b379e329c	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-568a-9ab4-32b4-c08d6b93714e	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-568a-9ab4-764f-acc9a65316da	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-568a-9ab4-3b3e-8b45882a2aff	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-568a-9ab4-57dc-2f78f4ee7610	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-568a-9ab4-ab78-50fcb02bdde6	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-568a-9ab4-3ed8-f991290bda33	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-568a-9ab4-78f4-53ebfdeebfb1	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-568a-9ab4-84b7-61fc3c03dc5a	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-568a-9ab4-e5cb-c83e2493f34f	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-568a-9ab4-f82f-9d2d2b74c20f	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-568a-9ab4-5ab4-5a7204fe255e	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-568a-9ab4-b022-cdfa4ca9f00b	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-568a-9ab4-c412-76660cdf0b0c	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-568a-9ab4-82a0-3391004fdf2c	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-568a-9ab4-23d5-89161a3f416e	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-568a-9ab4-480a-fc609376745d	direktor	minimalne pravice za direktorja	t
00020000-568a-9ab4-0ebf-8a608764b21f	arhivar	arhivar	t
00020000-568a-9ab4-844d-7165bae3b792	dramaturg	dramaturg	t
00020000-568a-9ab4-af30-eb5dc6e307e4	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-568a-9ab4-b4b6-fffdb5658cd0	poslovni-sekretar	poslovni sekretar	t
00020000-568a-9ab4-6b80-b7f26bef5543	vodja-tehnike	vodja tehnike	t
00020000-568a-9ab4-895c-cda21d96ff45	racunovodja	računovodja	t
00020000-568a-9ab6-1b9b-cee2eced14e3	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-568a-9ab6-2548-fd3cbb63b33d	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-9101-aa2b03d9603e	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-e671-67bd105015a6	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-f06c-b92e23a1bdf8	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-0d00-d1c94db5174f	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-72d0-bdefac2c3b28	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-38ca-43aa2ba68758	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-4624-610c40381284	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-c673-15ce421dc015	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-4a11-196cb1109961	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-a513-45dda6656915	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-be31-48fb84efbf3b	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-dc21-a3ccac484cde	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-0fec-e9671e57023e	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-0c68-125273afc7ef	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-fda4-a742db619165	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-cdde-ca54377ad710	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-8f9c-9f8e71e6d35f	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-0e21-c9744ebb6ed7	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-568a-9ab6-d1d1-2406dbe31e9a	Trr-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-dc6d-97a4feb89701	Trr-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-6d93-4d547cd09665	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-bb45-f3721a940652	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-6584-f8e3a7fb9357	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-38e7-9a1b0083d431	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-3170-26b5e4b52a93	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-351e-672caad909fd	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-fb4f-6c842a461141	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-91af-7a22cfc0e513	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-719f-a526b491bca4	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-7cc1-357041113571	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab6-b34c-0c586ac34a46	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab7-d4a6-f291b5d23641	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab7-c09e-49ddba55adfc	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab7-35fb-6a7f6913b4ff	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-568a-9ab7-8b7e-eadfe01610df	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-568a-9ab7-6635-0df063434d65	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-568a-9ab7-bc12-0de3d2ed1e66	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3110 (class 0 OID 34364210)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-568a-9ab5-aaa3-3da88ccfba1d	00020000-568a-9ab4-bf3c-57a53822d21b
00010000-568a-9ab5-026a-f863e0564b3a	00020000-568a-9ab4-bf3c-57a53822d21b
00010000-568a-9ab7-33c7-e7bd905cfdb7	00020000-568a-9ab6-1b9b-cee2eced14e3
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-2548-fd3cbb63b33d
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-0d00-d1c94db5174f
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-c673-15ce421dc015
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-a513-45dda6656915
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-dc21-a3ccac484cde
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-8f9c-9f8e71e6d35f
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-e671-67bd105015a6
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-d1d1-2406dbe31e9a
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-bb45-f3721a940652
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-38e7-9a1b0083d431
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-351e-672caad909fd
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab6-91af-7a22cfc0e513
00010000-568a-9ab7-7ff0-9145f973a0ca	00020000-568a-9ab7-d4a6-f291b5d23641
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-2548-fd3cbb63b33d
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-9101-aa2b03d9603e
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-e671-67bd105015a6
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-f06c-b92e23a1bdf8
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-dc21-a3ccac484cde
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-fda4-a742db619165
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-d1d1-2406dbe31e9a
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-bb45-f3721a940652
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-38e7-9a1b0083d431
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-351e-672caad909fd
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab6-91af-7a22cfc0e513
00010000-568a-9ab7-198e-5df40f6d1c58	00020000-568a-9ab7-d4a6-f291b5d23641
00010000-568a-9ab7-d3a1-a18eff5e64a8	00020000-568a-9ab6-2548-fd3cbb63b33d
00010000-568a-9ab7-d3a1-a18eff5e64a8	00020000-568a-9ab6-9101-aa2b03d9603e
00010000-568a-9ab7-d3a1-a18eff5e64a8	00020000-568a-9ab6-e671-67bd105015a6
00010000-568a-9ab7-d3a1-a18eff5e64a8	00020000-568a-9ab6-f06c-b92e23a1bdf8
00010000-568a-9ab7-d3a1-a18eff5e64a8	00020000-568a-9ab6-a513-45dda6656915
00010000-568a-9ab7-d3a1-a18eff5e64a8	00020000-568a-9ab6-dc21-a3ccac484cde
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-9101-aa2b03d9603e
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-72d0-bdefac2c3b28
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-4a11-196cb1109961
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-be31-48fb84efbf3b
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-a513-45dda6656915
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-cdde-ca54377ad710
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-dc21-a3ccac484cde
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-0fec-e9671e57023e
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-d1d1-2406dbe31e9a
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-dc6d-97a4feb89701
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-bb45-f3721a940652
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-6584-f8e3a7fb9357
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-38e7-9a1b0083d431
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-3170-26b5e4b52a93
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-351e-672caad909fd
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-fb4f-6c842a461141
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-91af-7a22cfc0e513
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab6-719f-a526b491bca4
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab7-d4a6-f291b5d23641
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab7-c09e-49ddba55adfc
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab7-8b7e-eadfe01610df
00010000-568a-9ab7-f4d9-eed46b181730	00020000-568a-9ab7-6635-0df063434d65
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-9101-aa2b03d9603e
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-72d0-bdefac2c3b28
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-4624-610c40381284
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-4a11-196cb1109961
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-be31-48fb84efbf3b
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-a513-45dda6656915
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-cdde-ca54377ad710
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-dc21-a3ccac484cde
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-0fec-e9671e57023e
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-0c68-125273afc7ef
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-d1d1-2406dbe31e9a
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-dc6d-97a4feb89701
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-6d93-4d547cd09665
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-bb45-f3721a940652
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-6584-f8e3a7fb9357
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-38e7-9a1b0083d431
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-3170-26b5e4b52a93
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-351e-672caad909fd
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-fb4f-6c842a461141
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-91af-7a22cfc0e513
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab6-719f-a526b491bca4
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab7-d4a6-f291b5d23641
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab7-c09e-49ddba55adfc
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab7-35fb-6a7f6913b4ff
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab7-8b7e-eadfe01610df
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab7-6635-0df063434d65
00010000-568a-9ab7-77ed-9cd10519fb2f	00020000-568a-9ab7-bc12-0de3d2ed1e66
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-9101-aa2b03d9603e
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-e671-67bd105015a6
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-72d0-bdefac2c3b28
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-38ca-43aa2ba68758
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-4624-610c40381284
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-0d00-d1c94db5174f
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-4a11-196cb1109961
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-be31-48fb84efbf3b
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-a513-45dda6656915
00010000-568a-9ab7-0e9f-0818a2b134e4	00020000-568a-9ab6-cdde-ca54377ad710
00010000-568a-9ab7-a769-502483c0b6b1	00020000-568a-9ab6-2548-fd3cbb63b33d
00010000-568a-9ab7-a769-502483c0b6b1	00020000-568a-9ab6-f06c-b92e23a1bdf8
00010000-568a-9ab7-a769-502483c0b6b1	00020000-568a-9ab6-0d00-d1c94db5174f
00010000-568a-9ab7-a769-502483c0b6b1	00020000-568a-9ab6-c673-15ce421dc015
00010000-568a-9ab7-a769-502483c0b6b1	00020000-568a-9ab6-a513-45dda6656915
00010000-568a-9ab7-a769-502483c0b6b1	00020000-568a-9ab6-dc21-a3ccac484cde
00010000-568a-9ab7-a769-502483c0b6b1	00020000-568a-9ab6-8f9c-9f8e71e6d35f
00010000-568a-9ab7-a769-502483c0b6b1	00020000-568a-9ab6-7cc1-357041113571
00010000-568a-9ab7-a717-9593d50a29ca	00020000-568a-9ab6-0e21-c9744ebb6ed7
00010000-568a-9ab7-5ae3-c61224711ace	00020000-568a-9ab4-480a-fc609376745d
00010000-568a-9ab7-cf47-b92a6c89561e	00020000-568a-9ab4-0ebf-8a608764b21f
00010000-568a-9ab7-a5ee-5763a8df2069	00020000-568a-9ab4-844d-7165bae3b792
00010000-568a-9ab7-5cd5-9e472b8ee44e	00020000-568a-9ab4-af30-eb5dc6e307e4
00010000-568a-9ab7-eb0f-4d033bc2459e	00020000-568a-9ab4-b4b6-fffdb5658cd0
00010000-568a-9ab7-8009-7256849bcfbb	00020000-568a-9ab4-6b80-b7f26bef5543
00010000-568a-9ab7-a863-9f739ebdb251	00020000-568a-9ab4-895c-cda21d96ff45
\.


--
-- TOC entry 3155 (class 0 OID 34364668)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 34364606)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 34364552)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-568a-9ab7-63dc-06f3f7ae68ce	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-568a-9ab7-1245-9a2b128f255d	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-568a-9ab7-3ae5-386f5968dd82	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3106 (class 0 OID 34364175)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-568a-9ab3-9fe2-321408514161	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-568a-9ab3-f67c-4cf60c8b2bea	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-568a-9ab3-af06-466eec1ed3c3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-568a-9ab3-db9b-460ad6418d34	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-568a-9ab3-cae9-8a166fe06b0d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3105 (class 0 OID 34364167)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-568a-9ab3-5318-b78cf2886249	00230000-568a-9ab3-db9b-460ad6418d34	popa
00240000-568a-9ab3-87a0-9c334d66857e	00230000-568a-9ab3-db9b-460ad6418d34	oseba
00240000-568a-9ab3-3059-19dbc430c6c1	00230000-568a-9ab3-db9b-460ad6418d34	tippopa
00240000-568a-9ab3-9c76-a6cf7e699a53	00230000-568a-9ab3-db9b-460ad6418d34	organizacijskaenota
00240000-568a-9ab3-9654-a2f3cfa5c460	00230000-568a-9ab3-db9b-460ad6418d34	sezona
00240000-568a-9ab3-1d1d-fc9111c16e9f	00230000-568a-9ab3-db9b-460ad6418d34	tipvaje
00240000-568a-9ab3-96f5-8c803ab14a70	00230000-568a-9ab3-f67c-4cf60c8b2bea	prostor
00240000-568a-9ab3-4303-8e529ef808a2	00230000-568a-9ab3-db9b-460ad6418d34	besedilo
00240000-568a-9ab3-3322-b80e0592a752	00230000-568a-9ab3-db9b-460ad6418d34	uprizoritev
00240000-568a-9ab3-f7af-80c735e65f19	00230000-568a-9ab3-db9b-460ad6418d34	funkcija
00240000-568a-9ab3-6a14-3192fdb146bf	00230000-568a-9ab3-db9b-460ad6418d34	tipfunkcije
00240000-568a-9ab3-2c94-889d087b6da3	00230000-568a-9ab3-db9b-460ad6418d34	alternacija
00240000-568a-9ab3-b4fe-e6fced7e0bae	00230000-568a-9ab3-9fe2-321408514161	pogodba
00240000-568a-9ab3-22ed-09877494f619	00230000-568a-9ab3-db9b-460ad6418d34	zaposlitev
00240000-568a-9ab3-d822-af397b5032cd	00230000-568a-9ab3-db9b-460ad6418d34	zvrstuprizoritve
00240000-568a-9ab3-caf5-ed264d0f3119	00230000-568a-9ab3-9fe2-321408514161	programdela
00240000-568a-9ab3-1c7d-53145e7bd8fa	00230000-568a-9ab3-db9b-460ad6418d34	zapis
\.


--
-- TOC entry 3104 (class 0 OID 34364162)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
6f2e0cdb-4f09-4bf1-a1a3-a2b2bf64d890	00240000-568a-9ab3-5318-b78cf2886249	0	1001
\.


--
-- TOC entry 3161 (class 0 OID 34364730)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-568a-9ab7-13cc-e5e60ed843f4	000e0000-568a-9ab7-c037-2c4fab7a0db3	00080000-568a-9ab7-5b17-3b7acf7dfd0b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-568a-9ab4-fb3e-3652ca35a901
00270000-568a-9ab7-3ae0-56b61d080b73	000e0000-568a-9ab7-c037-2c4fab7a0db3	00080000-568a-9ab7-5b17-3b7acf7dfd0b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-568a-9ab4-fb3e-3652ca35a901
\.


--
-- TOC entry 3120 (class 0 OID 34364310)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 34364562)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-568a-9ab8-56a7-f380f726f9e6	00180000-568a-9ab7-6d8c-fd3f16e6ab13	000c0000-568a-9ab7-a1f2-81357d8ad00c	00090000-568a-9ab7-f585-c75cf1e6263b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-9ab8-1bb4-82bc215b514d	00180000-568a-9ab7-6d8c-fd3f16e6ab13	000c0000-568a-9ab7-4fca-4c0880899ba9	00090000-568a-9ab7-7a50-465028260ceb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-9ab8-da18-ea09a8005634	00180000-568a-9ab7-6d8c-fd3f16e6ab13	000c0000-568a-9ab7-c6ce-a94b63457ae7	00090000-568a-9ab7-9610-0912a197dc34	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-9ab8-209a-40b99eddd04c	00180000-568a-9ab7-6d8c-fd3f16e6ab13	000c0000-568a-9ab7-f7c6-b36d6e96ebf1	00090000-568a-9ab7-e767-00e0830ce87a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-9ab8-ac75-5d1805c9d318	00180000-568a-9ab7-6d8c-fd3f16e6ab13	000c0000-568a-9ab7-7d10-8ffd618452d6	00090000-568a-9ab7-542f-26f006f8c1c7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568a-9ab8-0871-9c07ef858db3	00180000-568a-9ab7-a5c5-01934b79b9b7	\N	00090000-568a-9ab7-542f-26f006f8c1c7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-568a-9ab8-24aa-6dc3fe550776	00180000-568a-9ab7-a5c5-01934b79b9b7	\N	00090000-568a-9ab7-7a50-465028260ceb	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3164 (class 0 OID 34364771)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-568a-9ab3-7e61-0a78782ab8ac	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-568a-9ab3-7bfa-b0f921d5cabc	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-568a-9ab3-d9b1-18abf86e5057	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-568a-9ab3-4fd5-c7fd6cb7aeba	04	Režija	Režija	Režija	umetnik	30
000f0000-568a-9ab3-56a2-fd52e8501093	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-568a-9ab3-ab3e-b82b6445567d	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-568a-9ab3-cb3a-4c1af4f074a3	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-568a-9ab3-f9da-d00c05a75a60	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-568a-9ab3-66cc-a46bf62a2f0e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-568a-9ab3-0491-7bd28df321bb	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-568a-9ab3-e410-579faefd5e57	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-568a-9ab3-5749-f5506019c147	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-568a-9ab3-6c82-41e94845b111	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-568a-9ab3-406a-ac524283ad4f	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-568a-9ab3-3b6e-514b816a0975	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-568a-9ab3-2508-e2220f85b599	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-568a-9ab3-9bf9-f0c06e9b95f7	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-568a-9ab3-520b-0a3eb56caf41	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3117 (class 0 OID 34364261)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-568a-9ab6-406e-789431f0eb81	0001	šola	osnovna ali srednja šola
00400000-568a-9ab6-1279-ce7203a65996	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-568a-9ab6-eed1-7afd79177aa3	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3177 (class 0 OID 34365076)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-568a-9ab3-50a6-fd8bbbfaf040	01	Velika predstava	f	1.00	1.00
002b0000-568a-9ab3-9039-b832bcd185da	02	Mala predstava	f	0.50	0.50
002b0000-568a-9ab3-a924-b6ecada957e9	03	Mala koprodukcija	t	0.40	1.00
002b0000-568a-9ab3-6213-cca0228647ed	04	Srednja koprodukcija	t	0.70	2.00
002b0000-568a-9ab3-bc7d-ded65cb090a1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3140 (class 0 OID 34364542)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-568a-9ab3-ed82-fea4d71673e5	0001	prva vaja	prva vaja
00420000-568a-9ab3-2ac1-de50f8070d29	0002	tehnična vaja	tehnična vaja
00420000-568a-9ab3-b677-bcc067f68ae3	0003	lučna vaja	lučna vaja
00420000-568a-9ab3-6d9a-1e415f1d127b	0004	kostumska vaja	kostumska vaja
00420000-568a-9ab3-1c5f-f781bfb3dd00	0005	foto vaja	foto vaja
00420000-568a-9ab3-b395-147a20f117c1	0006	1. glavna vaja	1. glavna vaja
00420000-568a-9ab3-ce31-005ccd963676	0007	2. glavna vaja	2. glavna vaja
00420000-568a-9ab3-ba64-f09418a03c28	0008	1. generalka	1. generalka
00420000-568a-9ab3-3c37-dc3fce61aba8	0009	2. generalka	2. generalka
00420000-568a-9ab3-d570-74286e342cdf	0010	odprta generalka	odprta generalka
00420000-568a-9ab3-a6d1-92532c65b4c9	0011	obnovitvena vaja	obnovitvena vaja
00420000-568a-9ab3-1fd9-46f4926b03db	0012	italijanka	krajša "obnovitvena" vaja
00420000-568a-9ab3-66d9-8754c19d5723	0013	pevska vaja	pevska vaja
00420000-568a-9ab3-01e8-d1a1b86326d1	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-568a-9ab3-4d5c-e233c72e9cb7	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3126 (class 0 OID 34364383)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 34364197)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-568a-9ab5-026a-f863e0564b3a	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO.LjztL5LSGUebCChdD3.MDaqvKignA6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-588a-0edd11562de2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-d2b9-fdf31bfa7e04	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-91fa-f0c94e668efe	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-cbfe-9d11fc0016d5	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-a830-036a0c2a25db	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-b1e5-808563d684a3	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-d5df-f651a7f104e1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-c8a5-57b89db7fa5c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-863a-9fdefeca71c5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-33c7-e7bd905cfdb7	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-f371-a1fc6c3503c4	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-7ff0-9145f973a0ca	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-198e-5df40f6d1c58	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-d3a1-a18eff5e64a8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-f4d9-eed46b181730	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-77ed-9cd10519fb2f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-0e9f-0818a2b134e4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-a769-502483c0b6b1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-a717-9593d50a29ca	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-5ae3-c61224711ace	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-cf47-b92a6c89561e	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-a5ee-5763a8df2069	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-5cd5-9e472b8ee44e	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-eb0f-4d033bc2459e	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-8009-7256849bcfbb	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-568a-9ab7-a863-9f739ebdb251	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-568a-9ab5-aaa3-3da88ccfba1d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3168 (class 0 OID 34364821)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-568a-9ab7-5f00-9d8cf5972771	00160000-568a-9ab6-ec99-120d134f903e	\N	00140000-568a-9ab3-5213-efaf56c253fd	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-568a-9ab6-d6a9-7d3113de8143
000e0000-568a-9ab7-c037-2c4fab7a0db3	00160000-568a-9ab6-bec5-f209e7fc1a18	\N	00140000-568a-9ab3-17d0-9c948d19babe	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-568a-9ab6-f223-64cc68f6148d
000e0000-568a-9ab7-33f1-11430f478e8a	\N	\N	00140000-568a-9ab3-17d0-9c948d19babe	00190000-568a-9ab7-8026-b681dd434f98	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-568a-9ab6-d6a9-7d3113de8143
000e0000-568a-9ab7-1457-5a98860f1aed	\N	\N	00140000-568a-9ab3-17d0-9c948d19babe	00190000-568a-9ab7-8026-b681dd434f98	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-568a-9ab6-d6a9-7d3113de8143
000e0000-568a-9ab7-86ed-d9bdf16968c9	\N	\N	00140000-568a-9ab3-17d0-9c948d19babe	00190000-568a-9ab7-8026-b681dd434f98	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-fc16-ed05abe57167	\N	\N	00140000-568a-9ab3-17d0-9c948d19babe	00190000-568a-9ab7-8026-b681dd434f98	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-e3c1-1cb54b1cc52d	\N	\N	00140000-568a-9ab3-3115-b8ee056c0235	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-781a-be88bbd33e59	\N	\N	00140000-568a-9ab3-3115-b8ee056c0235	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-04ca-25bcaf036050	\N	\N	00140000-568a-9ab3-3115-b8ee056c0235	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-9fc1-397c47df5c02	\N	\N	00140000-568a-9ab3-3115-b8ee056c0235	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-8683-14778035ec60	\N	\N	00140000-568a-9ab3-3115-b8ee056c0235	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-d7b8-54086ea56e00	\N	\N	00140000-568a-9ab3-3115-b8ee056c0235	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-3fdd-4efc03d4de2a	\N	\N	00140000-568a-9ab3-3115-b8ee056c0235	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-6705-1ecd2430c6f7	\N	\N	00140000-568a-9ab3-3115-b8ee056c0235	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
000e0000-568a-9ab7-ca82-589164e0626c	\N	\N	00140000-568a-9ab3-3115-b8ee056c0235	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568a-9ab6-320e-f39ab813a267
\.


--
-- TOC entry 3134 (class 0 OID 34364482)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-568a-9ab7-d183-f8ccde7c5b2f	\N	000e0000-568a-9ab7-c037-2c4fab7a0db3	1	
00200000-568a-9ab7-ae8c-ddc4a85aed12	\N	000e0000-568a-9ab7-c037-2c4fab7a0db3	2	
00200000-568a-9ab7-7f98-3414b932e734	\N	000e0000-568a-9ab7-c037-2c4fab7a0db3	3	
00200000-568a-9ab7-2898-ff27b3abd971	\N	000e0000-568a-9ab7-c037-2c4fab7a0db3	4	
00200000-568a-9ab7-5c86-2fd56ef933c7	\N	000e0000-568a-9ab7-c037-2c4fab7a0db3	5	
\.


--
-- TOC entry 3151 (class 0 OID 34364633)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 34364744)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-568a-9ab4-3546-e8b362caf57c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-568a-9ab4-62eb-ed71d55e7e0a	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-568a-9ab4-f831-45e13f96a69e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-568a-9ab4-594b-34d933625d80	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-568a-9ab4-3762-41a9c6db96e1	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-568a-9ab4-270e-11484d65b4ea	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-568a-9ab4-a706-a4f7c2e7d5b2	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-568a-9ab4-0657-0c714122589d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-568a-9ab4-fb3e-3652ca35a901	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-568a-9ab4-9e60-73af1e508800	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-568a-9ab4-ca87-1fed6a3566eb	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-568a-9ab4-6dab-6dbf7a3050de	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-568a-9ab4-15ca-bf3dbfc1e59d	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-568a-9ab4-3c20-10f08924898a	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-568a-9ab4-5714-fa24b6668652	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-568a-9ab4-59e7-0e06c90bed70	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-568a-9ab4-32a5-9724b66e020b	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-568a-9ab4-f79c-9e5cf6acd620	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-568a-9ab4-2d6a-488557cfa089	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-568a-9ab4-38ab-c64b5c6b3ce3	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-568a-9ab4-85b6-0c84218a83b1	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-568a-9ab4-b389-430ade185c85	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-568a-9ab4-4708-81ca76da2196	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-568a-9ab4-2854-0ca4cd58be3d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-568a-9ab4-1495-dc6b490020bd	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-568a-9ab4-7d67-4bba97811e51	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-568a-9ab4-104a-e1323767f11a	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-568a-9ab4-db9c-eaf10c536dcc	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3180 (class 0 OID 34365126)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 34365095)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 34365138)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 34364706)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-568a-9ab7-6b49-8b2363d59cf3	00090000-568a-9ab7-7a50-465028260ceb	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-9ab7-bff9-6319f628b8ee	00090000-568a-9ab7-9610-0912a197dc34	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-9ab7-0742-55f0bdc88f7c	00090000-568a-9ab7-3ab0-76e6e165bbc5	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-9ab7-7d51-486aa99e39d5	00090000-568a-9ab7-811c-697742704112	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-9ab7-4504-1da74103775b	00090000-568a-9ab7-103d-6f3a8f6128db	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-568a-9ab7-0f68-0c2a26aa8182	00090000-568a-9ab7-54a7-083c7346b006	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3137 (class 0 OID 34364526)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 34364811)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-568a-9ab3-5213-efaf56c253fd	01	Drama	drama (SURS 01)
00140000-568a-9ab3-a22e-6a289162985f	02	Opera	opera (SURS 02)
00140000-568a-9ab3-54f9-36494251aa21	03	Balet	balet (SURS 03)
00140000-568a-9ab3-3e99-175b2ce8a6d4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-568a-9ab3-3115-b8ee056c0235	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-568a-9ab3-17d0-9c948d19babe	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-568a-9ab3-7c5b-91dd9b76d077	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3157 (class 0 OID 34364696)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 2606 OID 34364260)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 34364870)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 34364860)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 34364251)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 34364727)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 34364769)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 34365179)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 34364514)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 34364536)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 34364541)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 34365093)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 34364409)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 34364939)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 34364692)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 34364480)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 34364447)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 34364423)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 34364598)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 34365156)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2873 (class 2606 OID 34365163)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2880 (class 2606 OID 34365187)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 33138688)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2737 (class 2606 OID 34364625)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 34364381)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 34364279)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 34364343)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 34364306)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 34364240)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2588 (class 2606 OID 34364225)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 34364631)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 34364667)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 34364806)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 34364334)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 34364369)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 34365044)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 34364604)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 34364359)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 34364499)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 34364468)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2666 (class 2606 OID 34364460)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 34364616)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 34365053)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 34365061)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 34365031)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 34365074)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 34364649)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 34364589)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 34364580)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 34364793)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 34364720)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 34364435)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 34364196)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 34364658)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 34364214)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2590 (class 2606 OID 34364234)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 34364676)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 34364611)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 34364560)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 34364184)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 34364172)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 34364166)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 34364740)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 34364315)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 34364571)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 34364780)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 34364268)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 34365086)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 34364549)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 34364394)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 34364209)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 34364839)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 34364489)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 34364639)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 34364752)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 34365136)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2859 (class 2606 OID 34365120)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 34365144)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 34364710)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 34364530)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 34364819)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 34364704)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 1259 OID 34364524)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2683 (class 1259 OID 34364525)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2684 (class 1259 OID 34364523)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2685 (class 1259 OID 34364522)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2686 (class 1259 OID 34364521)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2780 (class 1259 OID 34364741)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2781 (class 1259 OID 34364742)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2782 (class 1259 OID 34364743)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2866 (class 1259 OID 34365158)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2867 (class 1259 OID 34365157)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2617 (class 1259 OID 34364336)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2618 (class 1259 OID 34364337)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2738 (class 1259 OID 34364632)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2853 (class 1259 OID 34365124)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2854 (class 1259 OID 34365123)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2855 (class 1259 OID 34365125)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2856 (class 1259 OID 34365122)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2857 (class 1259 OID 34365121)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2732 (class 1259 OID 34364618)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2733 (class 1259 OID 34364617)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2674 (class 1259 OID 34364490)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2675 (class 1259 OID 34364491)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2762 (class 1259 OID 34364693)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2763 (class 1259 OID 34364695)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2764 (class 1259 OID 34364694)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2649 (class 1259 OID 34364425)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 34364424)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2844 (class 1259 OID 34365075)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2796 (class 1259 OID 34364808)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2797 (class 1259 OID 34364809)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2798 (class 1259 OID 34364810)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2863 (class 1259 OID 34365145)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2805 (class 1259 OID 34364844)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2806 (class 1259 OID 34364841)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2807 (class 1259 OID 34364845)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2808 (class 1259 OID 34364843)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2809 (class 1259 OID 34364842)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2639 (class 1259 OID 34364396)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2640 (class 1259 OID 34364395)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2608 (class 1259 OID 34364309)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2750 (class 1259 OID 34364659)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2592 (class 1259 OID 34364241)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2593 (class 1259 OID 34364242)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2755 (class 1259 OID 34364679)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2756 (class 1259 OID 34364678)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2757 (class 1259 OID 34364677)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2622 (class 1259 OID 34364346)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2623 (class 1259 OID 34364345)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2624 (class 1259 OID 34364347)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2662 (class 1259 OID 34364463)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2663 (class 1259 OID 34364461)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2664 (class 1259 OID 34364462)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2572 (class 1259 OID 34364174)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2712 (class 1259 OID 34364584)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2713 (class 1259 OID 34364582)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2714 (class 1259 OID 34364581)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2715 (class 1259 OID 34364583)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 34364215)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2584 (class 1259 OID 34364216)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2741 (class 1259 OID 34364640)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2876 (class 1259 OID 34365180)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2778 (class 1259 OID 34364729)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2779 (class 1259 OID 34364728)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2877 (class 1259 OID 34365188)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2878 (class 1259 OID 34365189)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2727 (class 1259 OID 34364605)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2772 (class 1259 OID 34364721)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2773 (class 1259 OID 34364722)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2826 (class 1259 OID 34364944)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2827 (class 1259 OID 34364943)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2828 (class 1259 OID 34364940)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2829 (class 1259 OID 34364941)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2830 (class 1259 OID 34364942)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2628 (class 1259 OID 34364361)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 34364360)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2630 (class 1259 OID 34364362)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2744 (class 1259 OID 34364653)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2745 (class 1259 OID 34364652)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2836 (class 1259 OID 34365054)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2837 (class 1259 OID 34365055)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2819 (class 1259 OID 34364874)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2820 (class 1259 OID 34364875)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2821 (class 1259 OID 34364872)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2822 (class 1259 OID 34364873)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2768 (class 1259 OID 34364711)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2769 (class 1259 OID 34364712)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2718 (class 1259 OID 34364593)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2719 (class 1259 OID 34364592)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2720 (class 1259 OID 34364590)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2721 (class 1259 OID 34364591)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2815 (class 1259 OID 34364862)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2816 (class 1259 OID 34364861)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2653 (class 1259 OID 34364436)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2656 (class 1259 OID 34364450)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2657 (class 1259 OID 34364449)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2658 (class 1259 OID 34364448)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2659 (class 1259 OID 34364451)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2673 (class 1259 OID 34364481)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2667 (class 1259 OID 34364469)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2668 (class 1259 OID 34364470)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2833 (class 1259 OID 34365045)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2852 (class 1259 OID 34365094)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2870 (class 1259 OID 34365164)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2871 (class 1259 OID 34365165)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2604 (class 1259 OID 34364281)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2605 (class 1259 OID 34364280)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2613 (class 1259 OID 34364316)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 34364317)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 34364531)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2707 (class 1259 OID 34364574)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2708 (class 1259 OID 34364573)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2709 (class 1259 OID 34364572)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2687 (class 1259 OID 34364516)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2688 (class 1259 OID 34364517)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2689 (class 1259 OID 34364520)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2690 (class 1259 OID 34364515)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2691 (class 1259 OID 34364519)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2692 (class 1259 OID 34364518)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2621 (class 1259 OID 34364335)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2602 (class 1259 OID 34364269)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 34364270)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2645 (class 1259 OID 34364410)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 34364412)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2647 (class 1259 OID 34364411)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2648 (class 1259 OID 34364413)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2726 (class 1259 OID 34364599)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2801 (class 1259 OID 34364807)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2810 (class 1259 OID 34364840)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2792 (class 1259 OID 34364781)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 34364782)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2611 (class 1259 OID 34364307)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 34364308)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2765 (class 1259 OID 34364705)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2578 (class 1259 OID 34364185)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 34364382)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2627 (class 1259 OID 34364344)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 34364173)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2849 (class 1259 OID 34365087)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2748 (class 1259 OID 34364651)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2749 (class 1259 OID 34364650)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 34364550)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 34364551)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2823 (class 1259 OID 34364871)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 34364370)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2802 (class 1259 OID 34364820)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2860 (class 1259 OID 34365137)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2842 (class 1259 OID 34365062)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2843 (class 1259 OID 34365063)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 34364770)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2706 (class 1259 OID 34364561)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 34364235)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2920 (class 2606 OID 34365360)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2919 (class 2606 OID 34365365)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2914 (class 2606 OID 34365390)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2916 (class 2606 OID 34365380)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2921 (class 2606 OID 34365355)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2917 (class 2606 OID 34365375)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2915 (class 2606 OID 34365385)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2918 (class 2606 OID 34365370)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2957 (class 2606 OID 34365560)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2956 (class 2606 OID 34365565)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 34365570)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2989 (class 2606 OID 34365735)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2990 (class 2606 OID 34365730)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2893 (class 2606 OID 34365245)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2892 (class 2606 OID 34365250)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2938 (class 2606 OID 34365475)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2984 (class 2606 OID 34365715)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2985 (class 2606 OID 34365710)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 34365720)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2986 (class 2606 OID 34365705)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2987 (class 2606 OID 34365700)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2936 (class 2606 OID 34365470)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2937 (class 2606 OID 34365465)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2913 (class 2606 OID 34365345)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2912 (class 2606 OID 34365350)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 34365515)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 34365525)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2947 (class 2606 OID 34365520)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2902 (class 2606 OID 34365300)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 34365295)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2934 (class 2606 OID 34365455)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 34365690)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2960 (class 2606 OID 34365575)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 34365580)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 34365585)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2988 (class 2606 OID 34365725)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2962 (class 2606 OID 34365605)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2965 (class 2606 OID 34365590)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2961 (class 2606 OID 34365610)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2963 (class 2606 OID 34365600)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2964 (class 2606 OID 34365595)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2900 (class 2606 OID 34365290)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 34365285)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 34365230)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2889 (class 2606 OID 34365225)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 34365495)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 34365205)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2884 (class 2606 OID 34365210)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2943 (class 2606 OID 34365510)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2944 (class 2606 OID 34365505)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2945 (class 2606 OID 34365500)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2895 (class 2606 OID 34365260)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2896 (class 2606 OID 34365255)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2894 (class 2606 OID 34365265)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2906 (class 2606 OID 34365325)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 34365315)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2907 (class 2606 OID 34365320)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2881 (class 2606 OID 34365190)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2926 (class 2606 OID 34365430)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2928 (class 2606 OID 34365420)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2929 (class 2606 OID 34365415)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2927 (class 2606 OID 34365425)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2883 (class 2606 OID 34365195)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 34365200)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2939 (class 2606 OID 34365480)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2993 (class 2606 OID 34365750)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2953 (class 2606 OID 34365555)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2954 (class 2606 OID 34365550)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2995 (class 2606 OID 34365755)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2994 (class 2606 OID 34365760)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2935 (class 2606 OID 34365460)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2952 (class 2606 OID 34365540)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2951 (class 2606 OID 34365545)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2972 (class 2606 OID 34365665)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 34365660)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2976 (class 2606 OID 34365645)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 34365650)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2974 (class 2606 OID 34365655)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2898 (class 2606 OID 34365275)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 34365270)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2897 (class 2606 OID 34365280)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 34365490)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2941 (class 2606 OID 34365485)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2979 (class 2606 OID 34365675)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2978 (class 2606 OID 34365680)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2969 (class 2606 OID 34365635)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2968 (class 2606 OID 34365640)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2971 (class 2606 OID 34365625)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2970 (class 2606 OID 34365630)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2950 (class 2606 OID 34365530)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 34365535)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2930 (class 2606 OID 34365450)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2931 (class 2606 OID 34365445)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2933 (class 2606 OID 34365435)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2932 (class 2606 OID 34365440)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2966 (class 2606 OID 34365620)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 34365615)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2904 (class 2606 OID 34365305)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2905 (class 2606 OID 34365310)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 34365340)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2910 (class 2606 OID 34365330)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2909 (class 2606 OID 34365335)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2977 (class 2606 OID 34365670)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2980 (class 2606 OID 34365685)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2982 (class 2606 OID 34365695)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2992 (class 2606 OID 34365740)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2991 (class 2606 OID 34365745)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2886 (class 2606 OID 34365220)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2887 (class 2606 OID 34365215)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2891 (class 2606 OID 34365235)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 34365240)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2922 (class 2606 OID 34365395)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2923 (class 2606 OID 34365410)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2924 (class 2606 OID 34365405)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2925 (class 2606 OID 34365400)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-04 17:15:56 CET

--
-- PostgreSQL database dump complete
--

