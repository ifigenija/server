--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-24 11:48:55 CET

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
-- TOC entry 183 (class 1259 OID 32893097)
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
-- TOC entry 237 (class 1259 OID 32893712)
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
-- TOC entry 236 (class 1259 OID 32893695)
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
-- TOC entry 182 (class 1259 OID 32893090)
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
-- TOC entry 181 (class 1259 OID 32893088)
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
-- TOC entry 227 (class 1259 OID 32893572)
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
-- TOC entry 230 (class 1259 OID 32893602)
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
-- TOC entry 251 (class 1259 OID 32894015)
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
-- TOC entry 203 (class 1259 OID 32893345)
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
-- TOC entry 205 (class 1259 OID 32893377)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32893382)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32893937)
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
-- TOC entry 194 (class 1259 OID 32893242)
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
-- TOC entry 238 (class 1259 OID 32893725)
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
-- TOC entry 223 (class 1259 OID 32893525)
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
-- TOC entry 200 (class 1259 OID 32893316)
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
-- TOC entry 197 (class 1259 OID 32893282)
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
-- TOC entry 195 (class 1259 OID 32893259)
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
-- TOC entry 212 (class 1259 OID 32893439)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32893995)
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
-- TOC entry 250 (class 1259 OID 32894008)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32894030)
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
-- TOC entry 216 (class 1259 OID 32893464)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32893216)
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
-- TOC entry 185 (class 1259 OID 32893116)
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
-- TOC entry 189 (class 1259 OID 32893183)
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
-- TOC entry 186 (class 1259 OID 32893127)
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
-- TOC entry 178 (class 1259 OID 32893062)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32893081)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32893471)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32893505)
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
-- TOC entry 233 (class 1259 OID 32893643)
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
-- TOC entry 188 (class 1259 OID 32893163)
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
-- TOC entry 191 (class 1259 OID 32893208)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32893881)
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
-- TOC entry 213 (class 1259 OID 32893445)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32893193)
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
-- TOC entry 202 (class 1259 OID 32893337)
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
-- TOC entry 198 (class 1259 OID 32893297)
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
-- TOC entry 199 (class 1259 OID 32893309)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32893457)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32893895)
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
-- TOC entry 242 (class 1259 OID 32893905)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32893794)
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
-- TOC entry 243 (class 1259 OID 32893913)
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
-- TOC entry 219 (class 1259 OID 32893486)
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
-- TOC entry 211 (class 1259 OID 32893430)
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
-- TOC entry 210 (class 1259 OID 32893420)
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
-- TOC entry 232 (class 1259 OID 32893632)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32893562)
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
-- TOC entry 196 (class 1259 OID 32893271)
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
-- TOC entry 175 (class 1259 OID 32893033)
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
-- TOC entry 174 (class 1259 OID 32893031)
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
-- TOC entry 220 (class 1259 OID 32893499)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32893071)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32893055)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32893513)
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
-- TOC entry 214 (class 1259 OID 32893451)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32893397)
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
-- TOC entry 173 (class 1259 OID 32893020)
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
-- TOC entry 172 (class 1259 OID 32893012)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32893007)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32893579)
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
-- TOC entry 187 (class 1259 OID 32893155)
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
-- TOC entry 209 (class 1259 OID 32893407)
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
-- TOC entry 231 (class 1259 OID 32893620)
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
-- TOC entry 184 (class 1259 OID 32893106)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32893925)
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
-- TOC entry 207 (class 1259 OID 32893387)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32893228)
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
-- TOC entry 176 (class 1259 OID 32893042)
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
-- TOC entry 235 (class 1259 OID 32893670)
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
-- TOC entry 201 (class 1259 OID 32893327)
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
-- TOC entry 218 (class 1259 OID 32893478)
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
-- TOC entry 229 (class 1259 OID 32893593)
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
-- TOC entry 247 (class 1259 OID 32893975)
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
-- TOC entry 246 (class 1259 OID 32893944)
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
-- TOC entry 248 (class 1259 OID 32893987)
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
-- TOC entry 225 (class 1259 OID 32893551)
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
-- TOC entry 204 (class 1259 OID 32893371)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32893660)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32893541)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32893093)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32893036)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32893097)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-567b-cd94-96c3-91ec9477b435	10	30	Otroci	Abonma za otroke	200
000a0000-567b-cd94-1b6d-a9a52d6114c5	20	60	Mladina	Abonma za mladino	400
000a0000-567b-cd94-7656-f68ef562e380	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32893712)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-567b-cd95-04ae-67354927ee06	000d0000-567b-cd95-424e-efdd2c674c86	\N	00090000-567b-cd94-6262-af008aef903b	000b0000-567b-cd94-d6a0-f08020eaed02	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-567b-cd95-d8c7-f6ebb8a9a830	000d0000-567b-cd95-cfb9-eef3bd0752bd	00100000-567b-cd94-5bad-8956afbc4a2a	00090000-567b-cd94-70ce-a03df9136071	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-567b-cd95-7125-31d12b040f80	000d0000-567b-cd95-7bae-e71fbe323c2c	00100000-567b-cd94-f28d-8a910dc51fa5	00090000-567b-cd94-d19a-60172ace9d15	\N	0003	t	\N	2015-12-24	\N	2	t	\N	f	f
000c0000-567b-cd95-e185-b56b33ed3068	000d0000-567b-cd95-4161-b8d6ddb05e2c	\N	00090000-567b-cd94-7d41-1b435a224175	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-567b-cd95-27d6-a55ddf4e8114	000d0000-567b-cd95-b3f1-e650f1347dbc	\N	00090000-567b-cd94-bc08-edfe688f0683	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-567b-cd95-2410-e3a897cfe81d	000d0000-567b-cd95-b777-39f0518aebd2	\N	00090000-567b-cd94-07f1-64bb0f60d62b	000b0000-567b-cd94-4d65-f776f2f3ad00	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-567b-cd95-14d8-372fa322b2f1	000d0000-567b-cd95-8856-ad828397b973	00100000-567b-cd94-c96a-8b76ff0a9885	00090000-567b-cd94-6145-0ce67c5755a1	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-567b-cd95-3b96-37781e7be608	000d0000-567b-cd95-240e-9403ebe6b9cb	\N	00090000-567b-cd94-d0c4-99a18de3b59a	000b0000-567b-cd94-675e-16e12f050175	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-567b-cd95-2d73-9eae1ff31841	000d0000-567b-cd95-8856-ad828397b973	00100000-567b-cd94-4415-86cd2194adb3	00090000-567b-cd94-75b8-d2a826ecf64d	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-567b-cd95-2c26-b500be77669e	000d0000-567b-cd95-8856-ad828397b973	00100000-567b-cd94-404f-919501a22062	00090000-567b-cd94-f6af-093c0f7a0bc9	\N	0010	t	\N	2015-12-24	\N	16	f	\N	f	t
000c0000-567b-cd95-6d12-33552b330752	000d0000-567b-cd95-8856-ad828397b973	00100000-567b-cd94-26d4-cd29837a9100	00090000-567b-cd94-8070-5e687d6906cb	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-567b-cd95-e292-c00199cd1b26	000d0000-567b-cd95-acb8-131809052694	00100000-567b-cd94-5bad-8956afbc4a2a	00090000-567b-cd94-70ce-a03df9136071	000b0000-567b-cd94-b484-090dfd0036e0	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32893695)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32893090)
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
-- TOC entry 3162 (class 0 OID 32893572)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-567b-cd94-e483-74784b2b58c9	00160000-567b-cd94-5116-19d36c78a3f9	00090000-567b-cd94-2794-ae039e0d435e	aizv	10	t
003d0000-567b-cd94-b14b-d5028f043cbb	00160000-567b-cd94-5116-19d36c78a3f9	00090000-567b-cd94-7779-fbfdd650d116	apri	14	t
003d0000-567b-cd94-8978-98c804dce897	00160000-567b-cd94-efa4-d0ca9f64dc04	00090000-567b-cd94-1a3a-504dd9a72b13	aizv	11	t
003d0000-567b-cd94-453f-70be1063f54b	00160000-567b-cd94-bac8-d81b637904a9	00090000-567b-cd94-3aa9-ba383d57e220	aizv	12	t
003d0000-567b-cd94-f22c-a7b4a9b8a058	00160000-567b-cd94-5116-19d36c78a3f9	00090000-567b-cd94-7269-8b9e96abb577	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32893602)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-567b-cd94-5116-19d36c78a3f9	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-567b-cd94-efa4-d0ca9f64dc04	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-567b-cd94-bac8-d81b637904a9	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32894015)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32893345)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-567b-cd95-0f63-6c76a41e0931	\N	\N	00200000-567b-cd95-38e7-3d57f361375a	\N	\N	\N	00220000-567b-cd94-2dc3-c5a690f0f306	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-567b-cd95-d7d9-05d2fee0cc9a	\N	\N	00200000-567b-cd95-c594-a5bdc9d5fdcb	\N	\N	\N	00220000-567b-cd94-2dc3-c5a690f0f306	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-567b-cd95-cf32-e52cfe7deab8	\N	\N	00200000-567b-cd95-4222-3923df817d4e	\N	\N	\N	00220000-567b-cd94-669f-0766e2b2da86	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-567b-cd95-536f-f6cc884b9277	\N	\N	00200000-567b-cd95-bbfa-2e44b6e81752	\N	\N	\N	00220000-567b-cd94-aec6-b12217446857	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-567b-cd95-b693-4eb831b1c9ce	\N	\N	00200000-567b-cd95-df11-ed0148ae11ba	\N	\N	\N	00220000-567b-cd94-cc42-17d1944c8e5c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32893377)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32893382)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32893937)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32893242)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-567b-cd91-5baa-cd3c9e2fecac	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-567b-cd91-e1a4-3296e82f5635	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-567b-cd91-7f37-708a381d0be6	AL	ALB	008	Albania 	Albanija	\N
00040000-567b-cd91-b6bf-8b90c450bfa7	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-567b-cd91-7207-db7ae05a1984	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-567b-cd91-4edf-06c8d4a01165	AD	AND	020	Andorra 	Andora	\N
00040000-567b-cd91-ace3-63b3932f0177	AO	AGO	024	Angola 	Angola	\N
00040000-567b-cd91-33f9-305266f8e567	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-567b-cd91-447d-0d71bacd8f06	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-567b-cd91-e67f-360738e636ac	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-567b-cd91-cb4e-71b020aaaa7b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-567b-cd91-941f-fbaa77cf369b	AM	ARM	051	Armenia 	Armenija	\N
00040000-567b-cd91-f665-a8372bdb8bb1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-567b-cd91-fc1e-f9a197e06d33	AU	AUS	036	Australia 	Avstralija	\N
00040000-567b-cd91-01e4-47c3bb946980	AT	AUT	040	Austria 	Avstrija	\N
00040000-567b-cd91-b780-481e29fc7bba	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-567b-cd91-6cea-f104e26ae9ad	BS	BHS	044	Bahamas 	Bahami	\N
00040000-567b-cd91-53dc-079f9f6c2862	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-567b-cd91-3234-454d8c33bdc9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-567b-cd91-db47-47e6d9d5cf22	BB	BRB	052	Barbados 	Barbados	\N
00040000-567b-cd91-6b5f-75b01471eaa9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-567b-cd91-33f0-3e7844db741d	BE	BEL	056	Belgium 	Belgija	\N
00040000-567b-cd91-91d5-ccacd37d1398	BZ	BLZ	084	Belize 	Belize	\N
00040000-567b-cd91-cab7-153e3d6c7a2b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-567b-cd91-9be4-d94644e5fa31	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-567b-cd91-519c-cf1fbdf4d48f	BT	BTN	064	Bhutan 	Butan	\N
00040000-567b-cd91-60a5-35c09f18a7df	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-567b-cd91-657c-acdda8e2121b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-567b-cd91-5bc8-14023e66a445	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-567b-cd91-7d3d-441d26cbb3fb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-567b-cd91-08fa-7fdb39840c86	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-567b-cd91-3440-3d29d4b43ecf	BR	BRA	076	Brazil 	Brazilija	\N
00040000-567b-cd91-7df2-a9bccb4b903e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-567b-cd91-8bb6-70f0733da258	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-567b-cd91-d2b5-c427c5106b37	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-567b-cd91-7e35-82969e464e92	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-567b-cd91-9a30-f5d73d063f7f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-567b-cd91-6608-d0b5d066f2d5	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-567b-cd91-72b7-86ab7a65a721	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-567b-cd91-6c45-b3f9b6a0f1bb	CA	CAN	124	Canada 	Kanada	\N
00040000-567b-cd91-11a4-72963ab47b03	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-567b-cd91-48b7-bfce929387d2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-567b-cd91-e8db-1559033363fb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-567b-cd91-7df7-a4d36bef528e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-567b-cd91-f495-4b4a0af692f6	CL	CHL	152	Chile 	Čile	\N
00040000-567b-cd91-6361-896d03202a64	CN	CHN	156	China 	Kitajska	\N
00040000-567b-cd91-a7f1-59b8735bcd08	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-567b-cd91-58a2-9da48262eb63	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-567b-cd91-fd24-21122b919628	CO	COL	170	Colombia 	Kolumbija	\N
00040000-567b-cd91-84f1-b605fa5e5680	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-567b-cd91-2ef6-3f32d4e9f35d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-567b-cd91-0eac-5586f9b82d09	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-567b-cd91-90f9-207c5213f45f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-567b-cd91-7a70-7f051ade757e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-567b-cd91-33a8-0b0796391eec	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-567b-cd91-1a22-9ad4b5535f2c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-567b-cd91-e5bb-2a222e1e16e9	CU	CUB	192	Cuba 	Kuba	\N
00040000-567b-cd91-0561-d251dc2c48fc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-567b-cd91-8130-d4f90f5ab014	CY	CYP	196	Cyprus 	Ciper	\N
00040000-567b-cd91-49e3-55b2db59c78e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-567b-cd91-7e50-7308ddae519d	DK	DNK	208	Denmark 	Danska	\N
00040000-567b-cd91-e5d6-c8a345a3c8f4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-567b-cd91-257b-db8171921ec8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-567b-cd91-825c-a7812a35fa00	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-567b-cd91-cd17-02e0967524cb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-567b-cd91-9be8-388a6a54eeff	EG	EGY	818	Egypt 	Egipt	\N
00040000-567b-cd91-6846-a46aa3712e70	SV	SLV	222	El Salvador 	Salvador	\N
00040000-567b-cd91-60fb-469771a7b032	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-567b-cd91-f9d8-500d81d0837d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-567b-cd91-badf-72fe35d87aa8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-567b-cd91-e3d7-6227480626f4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-567b-cd91-5aef-9927fea2c8d3	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-567b-cd91-069a-a289de906405	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-567b-cd91-344e-15affc5e4148	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-567b-cd91-5714-7de591127995	FI	FIN	246	Finland 	Finska	\N
00040000-567b-cd91-1191-dfc0ca74b7f8	FR	FRA	250	France 	Francija	\N
00040000-567b-cd91-5455-210fc94725fb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-567b-cd92-03d5-0455df708fad	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-567b-cd91-9e0e-ff790f8f7667	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-567b-cd91-a4e1-9bbdedca4898	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-567b-cd91-3135-05b8dfeddcf0	GA	GAB	266	Gabon 	Gabon	\N
00040000-567b-cd91-5f3f-df5d7877a069	GM	GMB	270	Gambia 	Gambija	\N
00040000-567b-cd91-89ea-277a53e9aaa7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-567b-cd91-6c99-b2ebd61fb28a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-567b-cd91-627a-be1c68895c05	GH	GHA	288	Ghana 	Gana	\N
00040000-567b-cd91-6cf9-d8e1e1923af2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-567b-cd91-ce0b-9339aa817747	GR	GRC	300	Greece 	Grčija	\N
00040000-567b-cd91-6efb-6f792f4aa902	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-567b-cd91-afae-b46d76d8cd31	GD	GRD	308	Grenada 	Grenada	\N
00040000-567b-cd91-3da0-446c619d66d1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-567b-cd91-841e-0b7631d7c9d5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-567b-cd92-35e0-9e7eaefbdd44	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-567b-cd92-52bf-f332ce971d73	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-567b-cd92-3259-0603bd9d6e4f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-567b-cd92-33fe-e2d3d7ad3295	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-567b-cd92-4a60-76f3bfffd903	GY	GUY	328	Guyana 	Gvajana	\N
00040000-567b-cd92-b096-4c4a889631e0	HT	HTI	332	Haiti 	Haiti	\N
00040000-567b-cd92-5759-446cc5db3fa9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-567b-cd92-0400-b28c6768ad24	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-567b-cd92-790b-4fcb96292d9c	HN	HND	340	Honduras 	Honduras	\N
00040000-567b-cd92-f6ca-1034ca3a1147	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-567b-cd92-78f7-8190229ec06d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-567b-cd92-b745-d98e2fbc8dad	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-567b-cd92-689a-3cfbaee991bf	IN	IND	356	India 	Indija	\N
00040000-567b-cd92-0537-8780b9a44f85	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-567b-cd92-601b-625abe0cdcaf	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-567b-cd92-ba5a-c07b36ec04c7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-567b-cd92-ac14-12ad89fc4a6a	IE	IRL	372	Ireland 	Irska	\N
00040000-567b-cd92-7490-fea231324aef	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-567b-cd92-2edd-6d8a171a97d4	IL	ISR	376	Israel 	Izrael	\N
00040000-567b-cd92-7f7a-55538be5314f	IT	ITA	380	Italy 	Italija	\N
00040000-567b-cd92-34bd-d947b5afb045	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-567b-cd92-cfc8-cd1a940b7d98	JP	JPN	392	Japan 	Japonska	\N
00040000-567b-cd92-78c5-98330d821610	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-567b-cd92-99e9-1178aa8b92b1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-567b-cd92-b447-a2bd6f367a94	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-567b-cd92-4dbd-eb1c2f8716c6	KE	KEN	404	Kenya 	Kenija	\N
00040000-567b-cd92-90b0-565897d72e17	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-567b-cd92-8953-1895002372de	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-567b-cd92-c52c-b2382a7b07c3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-567b-cd92-33da-054e99841e13	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-567b-cd92-d20f-63cb6b89c642	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-567b-cd92-436e-2739da5343ae	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-567b-cd92-c1a3-a5aaab8419ce	LV	LVA	428	Latvia 	Latvija	\N
00040000-567b-cd92-7822-4059e5308736	LB	LBN	422	Lebanon 	Libanon	\N
00040000-567b-cd92-7617-21611d061449	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-567b-cd92-f804-18ac96e6a2c9	LR	LBR	430	Liberia 	Liberija	\N
00040000-567b-cd92-1600-e9c34defe4d2	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-567b-cd92-a008-1662b3606aa8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-567b-cd92-dba0-833979e2e9d0	LT	LTU	440	Lithuania 	Litva	\N
00040000-567b-cd92-5019-20d16745c5f0	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-567b-cd92-8d57-6bfc8920cacd	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-567b-cd92-aad5-0e9d0df33364	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-567b-cd92-692e-4f7e92a22ea6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-567b-cd92-3663-52b2b3ecfd65	MW	MWI	454	Malawi 	Malavi	\N
00040000-567b-cd92-1f88-01d15b0cc913	MY	MYS	458	Malaysia 	Malezija	\N
00040000-567b-cd92-c0fa-6f02ccf9eb66	MV	MDV	462	Maldives 	Maldivi	\N
00040000-567b-cd92-c03f-5f405fad199a	ML	MLI	466	Mali 	Mali	\N
00040000-567b-cd92-0ea9-5a80c694b867	MT	MLT	470	Malta 	Malta	\N
00040000-567b-cd92-9f50-31e01585ee65	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-567b-cd92-2ba7-3755b541a2ea	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-567b-cd92-6133-f4b654e58277	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-567b-cd92-591e-006171de70b0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-567b-cd92-77af-4985e76fb27a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-567b-cd92-03e7-c6e38dbbe9d3	MX	MEX	484	Mexico 	Mehika	\N
00040000-567b-cd92-72aa-069e7c1c8f72	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-567b-cd92-c838-adb40c13c1c0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-567b-cd92-efaf-17e1cf404368	MC	MCO	492	Monaco 	Monako	\N
00040000-567b-cd92-fd65-c7e6b1986cbe	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-567b-cd92-e695-4fb7add9c8c5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-567b-cd92-2ad8-19b627a26723	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-567b-cd92-2ec5-53cb09615448	MA	MAR	504	Morocco 	Maroko	\N
00040000-567b-cd92-e158-ccd641c9530d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-567b-cd92-0a94-f1922820d41b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-567b-cd92-96fe-10b46aab72b4	NA	NAM	516	Namibia 	Namibija	\N
00040000-567b-cd92-1d10-31446a505cd7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-567b-cd92-eb2f-78d9ffc24b82	NP	NPL	524	Nepal 	Nepal	\N
00040000-567b-cd92-99cf-692cbdd555dc	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-567b-cd92-8ff7-626c7bd481a9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-567b-cd92-4cbc-38273d044523	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-567b-cd92-0ec3-d427fbc15adf	NE	NER	562	Niger 	Niger 	\N
00040000-567b-cd92-7ce0-7e485b9ff76e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-567b-cd92-b1f9-08b83335c098	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-567b-cd92-0386-4520a32e1f8e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-567b-cd92-3044-bd82457ad9d4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-567b-cd92-e0d2-3bcb987ff556	NO	NOR	578	Norway 	Norveška	\N
00040000-567b-cd92-9ead-31fb2da8422f	OM	OMN	512	Oman 	Oman	\N
00040000-567b-cd92-6093-95515c797e2b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-567b-cd92-0f92-156faa7bc9b3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-567b-cd92-211e-f62aa175d84c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-567b-cd92-08d1-01721c404cad	PA	PAN	591	Panama 	Panama	\N
00040000-567b-cd92-d77d-dd3eaf35c2ac	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-567b-cd92-c125-8168ea2b956c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-567b-cd92-ee2b-82d2db4cccbb	PE	PER	604	Peru 	Peru	\N
00040000-567b-cd92-c1bb-101ad2755770	PH	PHL	608	Philippines 	Filipini	\N
00040000-567b-cd92-688f-e4fad5574ffd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-567b-cd92-28c2-699898010e4d	PL	POL	616	Poland 	Poljska	\N
00040000-567b-cd92-5381-75027d3aa84b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-567b-cd92-c167-2a24af754c41	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-567b-cd92-3130-c18605f051fc	QA	QAT	634	Qatar 	Katar	\N
00040000-567b-cd92-766e-ea9b6b7cde41	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-567b-cd92-c1f5-17e8d05e2ac1	RO	ROU	642	Romania 	Romunija	\N
00040000-567b-cd92-7f60-174384e00299	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-567b-cd92-358d-bb6bda755c09	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-567b-cd92-4d40-7cebc2dc91b7	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-567b-cd92-3348-6e1f1e3226ab	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-567b-cd92-dae3-d70fa7d1c342	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-567b-cd92-6fd3-d8e351fdab7b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-567b-cd92-1cbb-f1560fc0b150	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-567b-cd92-20bd-791137c49e92	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-567b-cd92-2e4d-d0f94aa49546	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-567b-cd92-6271-d1a648ac0e1f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-567b-cd92-e37c-c01544788b7f	SM	SMR	674	San Marino 	San Marino	\N
00040000-567b-cd92-70b4-0fbaffc2cbc5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-567b-cd92-35aa-d9260d0ac3af	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-567b-cd92-4960-e5fc65b2ce23	SN	SEN	686	Senegal 	Senegal	\N
00040000-567b-cd92-ff73-d91e9302596c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-567b-cd92-8327-aca7a3e7ac8d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-567b-cd92-b45d-a8d4ad8faacf	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-567b-cd92-19ab-3cd9e19fc8f2	SG	SGP	702	Singapore 	Singapur	\N
00040000-567b-cd92-c454-74f5111d4ff9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-567b-cd92-ee09-b095b96d0dd4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-567b-cd92-ef32-bfe9285705be	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-567b-cd92-c9fa-ffad5a5ad726	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-567b-cd92-e23c-5ae0131f2b04	SO	SOM	706	Somalia 	Somalija	\N
00040000-567b-cd92-9a3b-8af3070f1200	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-567b-cd92-a11e-ed9e371aa3d0	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-567b-cd92-f290-83117c6514bf	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-567b-cd92-4189-f408e4faa181	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-567b-cd92-62ad-360092c815b9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-567b-cd92-ef73-cd2ed4e38f64	SD	SDN	729	Sudan 	Sudan	\N
00040000-567b-cd92-5fb2-f84078dda6a5	SR	SUR	740	Suriname 	Surinam	\N
00040000-567b-cd92-406b-bcb49d4c5d4f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-567b-cd92-ba80-ede61037b65f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-567b-cd92-8054-a582303c5463	SE	SWE	752	Sweden 	Švedska	\N
00040000-567b-cd92-b2cf-83d4432d7396	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-567b-cd92-4aa4-b4974d1728f5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-567b-cd92-ca6d-62473a100133	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-567b-cd92-8e9d-860fcdac4324	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-567b-cd92-626e-5b7f0cfdd77f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-567b-cd92-6002-8750f7ed6dbd	TH	THA	764	Thailand 	Tajska	\N
00040000-567b-cd92-31da-72fd9e7c55d6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-567b-cd92-f4d3-d4e53ae7c7a2	TG	TGO	768	Togo 	Togo	\N
00040000-567b-cd92-b934-7c97cc825c3a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-567b-cd92-b938-216b4daf5506	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-567b-cd92-4739-2ebb30c216c0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-567b-cd92-9165-7c78908b38f7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-567b-cd92-c957-f867e78f0a93	TR	TUR	792	Turkey 	Turčija	\N
00040000-567b-cd92-2acf-c588456bb002	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-567b-cd92-4e67-c3b2cfa49c0c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-567b-cd92-bc90-f8a763a04804	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-567b-cd92-b7f2-c7270205c950	UG	UGA	800	Uganda 	Uganda	\N
00040000-567b-cd92-dacf-6cce58464cc4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-567b-cd92-f569-f3040c78d4e4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-567b-cd92-b39d-27cf8f085809	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-567b-cd92-d303-1e48d9119609	US	USA	840	United States 	Združene države Amerike	\N
00040000-567b-cd92-5573-4ce6c2bcfeca	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-567b-cd92-6b6b-7ad20de0d238	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-567b-cd92-e895-54ff7d90f1f6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-567b-cd92-7eaf-ef28767c6d65	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-567b-cd92-22d2-ee1fb63fa993	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-567b-cd92-55bc-9210681dbf04	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-567b-cd92-e77b-1de17ffb1a48	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-567b-cd92-8242-fb889916258f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-567b-cd92-4965-a643aab4faee	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-567b-cd92-fc1e-257f0c84b2f5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-567b-cd92-c9f2-94fb9a14f5b2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-567b-cd92-bd08-95d1b3f3bce2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-567b-cd92-3733-e4519482475a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32893725)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-567b-cd95-84bc-0d6fe818f86c	000e0000-567b-cd95-ffe7-df0794591a66	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-567b-cd91-d16b-49c055243023	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-567b-cd95-9c4b-1f4992cfb6a1	000e0000-567b-cd95-9788-08c1e7f591f7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-567b-cd91-bcc7-d68e566980e2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-567b-cd95-23ca-01d76e4880ae	000e0000-567b-cd95-398d-22984514bdd0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-567b-cd91-d16b-49c055243023	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-567b-cd95-60bc-229141145f15	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-567b-cd95-6c40-57982eb15235	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32893525)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-567b-cd95-424e-efdd2c674c86	000e0000-567b-cd95-9788-08c1e7f591f7	000c0000-567b-cd95-04ae-67354927ee06	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-567b-cd91-0d7d-5aed79c948e8
000d0000-567b-cd95-cfb9-eef3bd0752bd	000e0000-567b-cd95-9788-08c1e7f591f7	000c0000-567b-cd95-d8c7-f6ebb8a9a830	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-567b-cd91-3ad3-ec6071bc27de
000d0000-567b-cd95-7bae-e71fbe323c2c	000e0000-567b-cd95-9788-08c1e7f591f7	000c0000-567b-cd95-7125-31d12b040f80	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-567b-cd91-74b9-3b32c6fda663
000d0000-567b-cd95-4161-b8d6ddb05e2c	000e0000-567b-cd95-9788-08c1e7f591f7	000c0000-567b-cd95-e185-b56b33ed3068	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-567b-cd91-7865-977c641c5aa8
000d0000-567b-cd95-b3f1-e650f1347dbc	000e0000-567b-cd95-9788-08c1e7f591f7	000c0000-567b-cd95-27d6-a55ddf4e8114	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-567b-cd91-7865-977c641c5aa8
000d0000-567b-cd95-b777-39f0518aebd2	000e0000-567b-cd95-9788-08c1e7f591f7	000c0000-567b-cd95-2410-e3a897cfe81d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-567b-cd91-0d7d-5aed79c948e8
000d0000-567b-cd95-8856-ad828397b973	000e0000-567b-cd95-9788-08c1e7f591f7	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-567b-cd91-0d7d-5aed79c948e8
000d0000-567b-cd95-240e-9403ebe6b9cb	000e0000-567b-cd95-9788-08c1e7f591f7	000c0000-567b-cd95-3b96-37781e7be608	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-567b-cd91-2967-413f45379b69
000d0000-567b-cd95-acb8-131809052694	000e0000-567b-cd95-9788-08c1e7f591f7	000c0000-567b-cd95-e292-c00199cd1b26	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-567b-cd91-02b0-f50ec033018f
\.


--
-- TOC entry 3135 (class 0 OID 32893316)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32893282)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32893259)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-567b-cd94-26ea-253c959c2613	00080000-567b-cd94-ae04-ceea59ab50f9	00090000-567b-cd94-f6af-093c0f7a0bc9	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32893439)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32893995)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-567b-cd94-49c3-09a134f30331	00010000-567b-cd93-60c9-ae8d3ec7240b	\N	Prva mapa	Root mapa	2015-12-24 11:48:52	2015-12-24 11:48:52	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32894008)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32894030)
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
-- TOC entry 3151 (class 0 OID 32893464)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32893216)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-567b-cd93-70ca-b2a3f05c8486	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-567b-cd93-2b2d-18ac2563f2b1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-567b-cd93-4148-a934f816a3f6	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-567b-cd93-80dd-1fb278b8747c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-567b-cd93-ad8c-8da8b173d8f2	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-567b-cd93-5ae5-6d4a490b957c	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-567b-cd93-52eb-c807cd421064	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-567b-cd93-90a3-72a0734a560d	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-567b-cd93-461e-23d82f074a08	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-567b-cd93-a161-bd581b0a08bf	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-567b-cd93-b447-e498c65a3326	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-567b-cd93-98b0-a27735505613	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-567b-cd93-3b1c-7b77a5098a23	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-567b-cd93-d7ef-b5fa4658dac0	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-567b-cd94-0443-f910f4b760fb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-567b-cd94-f314-41919c08eb27	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-567b-cd94-6c5f-dede3e293790	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-567b-cd94-2e60-d702704c02f4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-567b-cd94-78f9-aab7f0f60351	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-567b-cd96-b3f1-9003a6693809	application.tenant.maticnopodjetje	string	s:36:"00080000-567b-cd96-cdae-6590b89c74c7";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32893116)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-567b-cd94-ea75-98f39fac29eb	00000000-567b-cd94-0443-f910f4b760fb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-567b-cd94-5852-6f71f3057037	00000000-567b-cd94-0443-f910f4b760fb	00010000-567b-cd93-60c9-ae8d3ec7240b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-567b-cd94-9de2-dc3acf0f9020	00000000-567b-cd94-f314-41919c08eb27	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32893183)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-567b-cd94-badb-5371c0e0fdf6	\N	00100000-567b-cd94-5bad-8956afbc4a2a	00100000-567b-cd94-f28d-8a910dc51fa5	01	Gledališče Nimbis
00410000-567b-cd94-a62a-4c95167a4fd1	00410000-567b-cd94-badb-5371c0e0fdf6	00100000-567b-cd94-5bad-8956afbc4a2a	00100000-567b-cd94-f28d-8a910dc51fa5	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32893127)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-567b-cd94-6262-af008aef903b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-567b-cd94-7d41-1b435a224175	00010000-567b-cd94-9cdf-09599fbc56eb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-567b-cd94-d19a-60172ace9d15	00010000-567b-cd94-0afb-a32599212202	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-567b-cd94-75b8-d2a826ecf64d	00010000-567b-cd94-41b1-5f3a060875b3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-567b-cd94-fe53-0d68ba9f6abe	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-567b-cd94-07f1-64bb0f60d62b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-567b-cd94-8070-5e687d6906cb	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-567b-cd94-6145-0ce67c5755a1	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-567b-cd94-f6af-093c0f7a0bc9	00010000-567b-cd94-7872-23b6be75d6aa	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-567b-cd94-70ce-a03df9136071	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-567b-cd94-21ad-dabd89a60749	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-567b-cd94-bc08-edfe688f0683	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-567b-cd94-d0c4-99a18de3b59a	00010000-567b-cd94-d7b1-c82a87af5f8c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-567b-cd94-2794-ae039e0d435e	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-567b-cd94-7779-fbfdd650d116	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-567b-cd94-1a3a-504dd9a72b13	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-567b-cd94-3aa9-ba383d57e220	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-567b-cd94-7269-8b9e96abb577	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-567b-cd94-c497-a2c99378cfb1	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-567b-cd94-a1f1-bd30e4f01461	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-567b-cd94-d3c0-c9e1efb7566c	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32893062)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-567b-cd92-c6ba-1333d3842b29	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-567b-cd92-c55f-368418d6a160	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-567b-cd92-27df-08e530dee21d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-567b-cd92-125f-a1f819cef949	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-567b-cd92-5baa-b34f9cb8ce9e	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-567b-cd92-68e2-a40664d6c6c3	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-567b-cd92-e998-4ca3b21f055d	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-567b-cd92-3537-10d7461412bb	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-567b-cd92-7845-baf411f9630d	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-567b-cd92-07e9-acb6884033b2	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-567b-cd92-9d5b-7fdaffa725d2	Abonma-read	Abonma - branje	t
00030000-567b-cd92-ae73-401672ce5650	Abonma-write	Abonma - spreminjanje	t
00030000-567b-cd92-ee3c-5a59ddb411b7	Alternacija-read	Alternacija - branje	t
00030000-567b-cd92-362c-fa9535444b7f	Alternacija-write	Alternacija - spreminjanje	t
00030000-567b-cd92-5051-15842ded69b1	Arhivalija-read	Arhivalija - branje	t
00030000-567b-cd92-de47-22beab9bd958	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-567b-cd92-96dc-63bb78537604	AuthStorage-read	AuthStorage - branje	t
00030000-567b-cd92-b67e-455db99ee357	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-567b-cd92-506d-835e8cec2f8f	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-567b-cd92-410b-e270012c540e	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-567b-cd92-ef44-d1f50a755c49	Besedilo-read	Besedilo - branje	t
00030000-567b-cd92-31f5-ee3ef8ec3c10	Besedilo-write	Besedilo - spreminjanje	t
00030000-567b-cd92-52ff-1fc0f84d0ff9	Dogodek-read	Dogodek - branje	t
00030000-567b-cd92-cefc-07786624a3ac	Dogodek-write	Dogodek - spreminjanje	t
00030000-567b-cd92-55a2-ac5ecada0846	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-567b-cd92-ad04-cf3ab349b905	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-567b-cd92-e194-687790662cb7	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-567b-cd92-b499-d8214a212acf	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-567b-cd92-f333-79852ecfcbe8	DogodekTrait-read	DogodekTrait - branje	t
00030000-567b-cd92-b824-23cc255aaa91	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-567b-cd92-adba-716207815642	DrugiVir-read	DrugiVir - branje	t
00030000-567b-cd92-a537-19e2a43aa0ee	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-567b-cd92-9e7a-7c9c25277427	Drzava-read	Drzava - branje	t
00030000-567b-cd92-78e8-5ea2f29e7bff	Drzava-write	Drzava - spreminjanje	t
00030000-567b-cd92-4051-53c1436732ce	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-567b-cd92-eb6f-fe9dbdc97202	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-567b-cd92-7da1-a4e957c61b38	Funkcija-read	Funkcija - branje	t
00030000-567b-cd92-0216-cda1ca54ca4f	Funkcija-write	Funkcija - spreminjanje	t
00030000-567b-cd92-acb4-923f1356f2f7	Gostovanje-read	Gostovanje - branje	t
00030000-567b-cd92-3052-70468477a5f5	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-567b-cd92-2ed0-346e45375a1b	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-567b-cd92-cc85-16f9fd723b63	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-567b-cd92-849a-74d45873176b	Kupec-read	Kupec - branje	t
00030000-567b-cd92-df58-31e01c782a58	Kupec-write	Kupec - spreminjanje	t
00030000-567b-cd92-deac-1a577c0ea144	NacinPlacina-read	NacinPlacina - branje	t
00030000-567b-cd92-5d50-9e2df790309d	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-567b-cd92-e714-8647c3586ef1	Option-read	Option - branje	t
00030000-567b-cd92-26ab-a95ae56a0f9d	Option-write	Option - spreminjanje	t
00030000-567b-cd92-9c11-6afb2d38cffb	OptionValue-read	OptionValue - branje	t
00030000-567b-cd92-267c-2c143b348f80	OptionValue-write	OptionValue - spreminjanje	t
00030000-567b-cd92-4003-cbfc7cd9198a	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-567b-cd92-c299-8b7a53b70fc5	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-567b-cd92-c2e8-45024a0da3b9	Oseba-read	Oseba - branje	t
00030000-567b-cd92-d11d-5e5b5859dca7	Oseba-write	Oseba - spreminjanje	t
00030000-567b-cd92-cb9e-614119c0e816	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-567b-cd92-4da5-9b1670219674	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-567b-cd92-3ebb-7e94d5654246	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-567b-cd92-c93d-7c6f7cab6d8d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-567b-cd92-5134-730c97957f76	Pogodba-read	Pogodba - branje	t
00030000-567b-cd92-bcfe-4dfd1f0d1e9e	Pogodba-write	Pogodba - spreminjanje	t
00030000-567b-cd92-0865-e0be31857a0c	Popa-read	Popa - branje	t
00030000-567b-cd92-66ca-54a5d778f4db	Popa-write	Popa - spreminjanje	t
00030000-567b-cd92-5adb-de14cccc3705	Posta-read	Posta - branje	t
00030000-567b-cd92-2762-08e752a55f1f	Posta-write	Posta - spreminjanje	t
00030000-567b-cd92-bd67-c5e87a4b5892	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-567b-cd92-cdcb-97d938c50042	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-567b-cd92-94f6-1842cfab47da	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-567b-cd92-854e-5508d062d622	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-567b-cd92-2f7d-a98b1080094e	PostniNaslov-read	PostniNaslov - branje	t
00030000-567b-cd92-d78a-bd61b31d9cc9	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-567b-cd92-550d-b80a1a0ec744	Praznik-read	Praznik - branje	t
00030000-567b-cd92-3bc8-6bdb577b2d0d	Praznik-write	Praznik - spreminjanje	t
00030000-567b-cd92-41ed-08158716c9f3	Predstava-read	Predstava - branje	t
00030000-567b-cd92-e226-27a2979bd36d	Predstava-write	Predstava - spreminjanje	t
00030000-567b-cd92-117b-e0903f14bf4c	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-567b-cd92-f6dc-88699ecf9964	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-567b-cd92-b864-7bce2d32e06e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-567b-cd92-7641-79b4e2d824a9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-567b-cd92-e621-1d6e253267a9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-567b-cd92-bf72-5478478f0e3d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-567b-cd92-3459-150dbb9df5ac	ProgramDela-read	ProgramDela - branje	t
00030000-567b-cd92-115b-473e69d0c13b	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-567b-cd92-8bca-f3e8422343af	ProgramFestival-read	ProgramFestival - branje	t
00030000-567b-cd92-99d5-36ed6a1433ae	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-567b-cd92-9d9a-a12c6ae5e2bf	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-567b-cd92-d73e-7cec6058ba51	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-567b-cd92-825a-a4ffa69b9d24	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-567b-cd92-b242-57c0550290d3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-567b-cd92-fca4-4bbec3ce7ccb	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-567b-cd92-84dd-aa3a242e483d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-567b-cd92-c20d-4d34be2b0a0e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-567b-cd92-b9e6-fade87510df2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-567b-cd92-5ea3-a490867dbc9c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-567b-cd92-9f58-10269d6e1877	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-567b-cd92-1a78-0aa196f0cdf7	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-567b-cd92-349f-d624b74bdcf2	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-567b-cd92-e41c-616d6aef0269	ProgramRazno-read	ProgramRazno - branje	t
00030000-567b-cd92-a67d-f75d5252f5cb	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-567b-cd92-cade-5c4268f8f76f	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-567b-cd92-5253-61df235e540f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-567b-cd92-a153-349505bc8fc4	Prostor-read	Prostor - branje	t
00030000-567b-cd92-241a-0499c4e50343	Prostor-write	Prostor - spreminjanje	t
00030000-567b-cd92-98ae-ab7cd38eb4fe	Racun-read	Racun - branje	t
00030000-567b-cd92-9495-d3f861859e17	Racun-write	Racun - spreminjanje	t
00030000-567b-cd92-cd9b-7e881fc5e749	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-567b-cd92-e24b-983f25570966	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-567b-cd92-892d-d2b8e2d4dec6	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-567b-cd92-3706-c5e304786332	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-567b-cd92-b2d9-8a092722445d	Rekvizit-read	Rekvizit - branje	t
00030000-567b-cd92-3c12-eb57de9cf384	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-567b-cd92-46f8-451ef2970703	Revizija-read	Revizija - branje	t
00030000-567b-cd92-e19c-77db8ec111a8	Revizija-write	Revizija - spreminjanje	t
00030000-567b-cd92-7f9c-e9e4c92b3756	Rezervacija-read	Rezervacija - branje	t
00030000-567b-cd92-3c52-9e3e40a84ddb	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-567b-cd92-e7e2-32387841c201	SedezniRed-read	SedezniRed - branje	t
00030000-567b-cd92-067f-91f101e5bbea	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-567b-cd92-bdb2-aeda469cd399	Sedez-read	Sedez - branje	t
00030000-567b-cd92-d8c3-a12087442548	Sedez-write	Sedez - spreminjanje	t
00030000-567b-cd92-b1f1-4dfec095e1f5	Sezona-read	Sezona - branje	t
00030000-567b-cd92-e696-bd3435bc2eef	Sezona-write	Sezona - spreminjanje	t
00030000-567b-cd92-e3db-37becd159866	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-567b-cd92-25e9-4364ae90b7ae	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-567b-cd92-264e-e1c77c49ef36	Telefonska-read	Telefonska - branje	t
00030000-567b-cd92-f06e-5c132152e2e5	Telefonska-write	Telefonska - spreminjanje	t
00030000-567b-cd92-e596-da431f299d2c	TerminStoritve-read	TerminStoritve - branje	t
00030000-567b-cd92-d468-386fd4036a27	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-567b-cd92-275d-ea0c20ebf1c5	TipFunkcije-read	TipFunkcije - branje	t
00030000-567b-cd92-d8ee-217a4513b051	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-567b-cd92-63a1-c6c06f5db7c7	TipPopa-read	TipPopa - branje	t
00030000-567b-cd92-4daa-21e57c4908ea	TipPopa-write	TipPopa - spreminjanje	t
00030000-567b-cd92-e52c-3874c73d25ea	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-567b-cd92-ce4b-a210a6ce2d33	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-567b-cd92-334c-0c04e0ca7102	TipVaje-read	TipVaje - branje	t
00030000-567b-cd92-0b23-004eb45d6ec5	TipVaje-write	TipVaje - spreminjanje	t
00030000-567b-cd92-79e2-93b0134a6f06	Trr-read	Trr - branje	t
00030000-567b-cd92-f0d4-3590495fe532	Trr-write	Trr - spreminjanje	t
00030000-567b-cd92-4c9f-a0a5606b6656	Uprizoritev-read	Uprizoritev - branje	t
00030000-567b-cd92-6d2c-30e936b5ede0	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-567b-cd92-ced0-86ba3088090b	Vaja-read	Vaja - branje	t
00030000-567b-cd92-593a-d225ba4c19e5	Vaja-write	Vaja - spreminjanje	t
00030000-567b-cd92-16f3-4cb72aba5fab	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-567b-cd92-6753-ebd600999797	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-567b-cd92-83c5-d03af52ea9eb	VrstaStroska-read	VrstaStroska - branje	t
00030000-567b-cd92-1d3b-3cfc03cff3c3	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-567b-cd92-83c1-36817ca31438	Zaposlitev-read	Zaposlitev - branje	t
00030000-567b-cd92-4522-ca9978de6a15	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-567b-cd92-a2f3-efd08ab5b2b0	Zasedenost-read	Zasedenost - branje	t
00030000-567b-cd92-d4db-ce3c492486af	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-567b-cd92-cd92-fcd39bdc75fd	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-567b-cd92-7863-a56d3182e495	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-567b-cd92-3261-ba16d0bbb049	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-567b-cd92-2335-d08039df1506	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-567b-cd92-70c1-cec8fdba8108	Job-read	Branje opravil - samo zase - branje	t
00030000-567b-cd92-50f0-40d426907a27	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-567b-cd92-4eb8-4226cb236090	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-567b-cd92-668e-f28d4afa579a	Report-read	Report - branje	t
00030000-567b-cd92-99d1-87413e0612f0	Report-write	Report - spreminjanje	t
00030000-567b-cd92-e788-6b348317c2d8	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-567b-cd92-53bb-d204296779bd	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-567b-cd92-59a3-a996c0754d10	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-567b-cd92-2664-bddc6f610585	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-567b-cd92-5269-ec0e178443b5	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-567b-cd92-2625-70baaab0684d	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-567b-cd92-6ac8-2d2cda487466	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-567b-cd92-be31-5bca2d3c9854	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-567b-cd92-c19e-faa418af6854	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-567b-cd92-8d8f-3f2d9f76e1e4	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-567b-cd92-569c-c5b764337e18	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-567b-cd92-bb6d-f480c27a59e1	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-567b-cd92-df83-c6b2480c48f9	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-567b-cd92-b320-397eb4ec744b	Datoteka-write	Datoteka - spreminjanje	t
00030000-567b-cd92-c381-1320044fc0b7	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32893081)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-567b-cd92-a9d3-65d4716b0295	00030000-567b-cd92-c55f-368418d6a160
00020000-567b-cd92-a9d3-65d4716b0295	00030000-567b-cd92-c6ba-1333d3842b29
00020000-567b-cd92-7953-5b56e9afe972	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-410b-e270012c540e
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-31f5-ee3ef8ec3c10
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-506d-835e8cec2f8f
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-41a3-d955d40dfcd2	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-acdf-0eb33b5ddd33	00030000-567b-cd92-506d-835e8cec2f8f
00020000-567b-cd92-acdf-0eb33b5ddd33	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-acdf-0eb33b5ddd33	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-acdf-0eb33b5ddd33	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-acdf-0eb33b5ddd33	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-acdf-0eb33b5ddd33	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-845c-707e0cc8dfcb	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-845c-707e0cc8dfcb	00030000-567b-cd92-4522-ca9978de6a15
00020000-567b-cd92-845c-707e0cc8dfcb	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-845c-707e0cc8dfcb	00030000-567b-cd92-5baa-b34f9cb8ce9e
00020000-567b-cd92-845c-707e0cc8dfcb	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-845c-707e0cc8dfcb	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-845c-707e0cc8dfcb	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-eaed-438b770fcb5b	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-eaed-438b770fcb5b	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-eaed-438b770fcb5b	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-6832-1345ab6cfcd6	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-6832-1345ab6cfcd6	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-6832-1345ab6cfcd6	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-6832-1345ab6cfcd6	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-6832-1345ab6cfcd6	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-6832-1345ab6cfcd6	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-6832-1345ab6cfcd6	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-6832-1345ab6cfcd6	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-dfe8-56eb26ac5745	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-dfe8-56eb26ac5745	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-dfe8-56eb26ac5745	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-dfe8-56eb26ac5745	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-5baa-b34f9cb8ce9e
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-f0d4-3590495fe532
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-d78a-bd61b31d9cc9
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-f06e-5c132152e2e5
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-3a67-008ea0df2a15	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-8193-af8774bea69b	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-8193-af8774bea69b	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-8193-af8774bea69b	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-8193-af8774bea69b	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-8193-af8774bea69b	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-8193-af8774bea69b	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-8193-af8774bea69b	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-f06e-5c132152e2e5
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-d78a-bd61b31d9cc9
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-f0d4-3590495fe532
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-66ca-54a5d778f4db
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-cc85-16f9fd723b63
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-bf72-5478478f0e3d
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-8acb-f668c47b1dae	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-862d-c7202b55aaec	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-c196-49539d6309ec	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-c196-49539d6309ec	00030000-567b-cd92-4daa-21e57c4908ea
00020000-567b-cd92-1bc1-b6973152f624	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-4d6f-fa06bb9e4050	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd92-4d6f-fa06bb9e4050	00030000-567b-cd92-2762-08e752a55f1f
00020000-567b-cd92-80f4-864fc7523df4	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd92-1a93-ad4eb8d4ceaf	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-1a93-ad4eb8d4ceaf	00030000-567b-cd92-78e8-5ea2f29e7bff
00020000-567b-cd92-bfbc-34491b9e6d2a	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-5e46-878209c1471d	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd92-5e46-878209c1471d	00030000-567b-cd92-2335-d08039df1506
00020000-567b-cd92-5722-c8b5edf20781	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd92-1b28-4aa5eb7897ed	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd92-1b28-4aa5eb7897ed	00030000-567b-cd92-7863-a56d3182e495
00020000-567b-cd92-b74b-d212abf01dd7	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd92-549d-87058b81e6f5	00030000-567b-cd92-9d5b-7fdaffa725d2
00020000-567b-cd92-549d-87058b81e6f5	00030000-567b-cd92-ae73-401672ce5650
00020000-567b-cd92-3c18-55a5919b69ed	00030000-567b-cd92-9d5b-7fdaffa725d2
00020000-567b-cd92-4153-23bc0820c856	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd92-4153-23bc0820c856	00030000-567b-cd92-241a-0499c4e50343
00020000-567b-cd92-4153-23bc0820c856	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-4153-23bc0820c856	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-4153-23bc0820c856	00030000-567b-cd92-d78a-bd61b31d9cc9
00020000-567b-cd92-4153-23bc0820c856	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-91e6-48984d801b94	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd92-91e6-48984d801b94	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-91e6-48984d801b94	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-5758-ce984c349070	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-5758-ce984c349070	00030000-567b-cd92-1d3b-3cfc03cff3c3
00020000-567b-cd92-ce24-06ddfc38c9d3	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-e786-e87eb7beba36	00030000-567b-cd92-c299-8b7a53b70fc5
00020000-567b-cd92-e786-e87eb7beba36	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-e786-e87eb7beba36	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-e786-e87eb7beba36	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-e786-e87eb7beba36	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-e786-e87eb7beba36	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-e786-e87eb7beba36	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-e786-e87eb7beba36	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-e786-e87eb7beba36	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-2526-c023baa36251	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-2526-c023baa36251	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-2526-c023baa36251	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-2526-c023baa36251	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-2526-c023baa36251	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-5973-359c789b1025	00030000-567b-cd92-334c-0c04e0ca7102
00020000-567b-cd92-5973-359c789b1025	00030000-567b-cd92-0b23-004eb45d6ec5
00020000-567b-cd92-a0da-e0c70f20be30	00030000-567b-cd92-334c-0c04e0ca7102
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-e998-4ca3b21f055d
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-3537-10d7461412bb
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-3459-150dbb9df5ac
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-115b-473e69d0c13b
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-8bca-f3e8422343af
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-99d5-36ed6a1433ae
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-9d9a-a12c6ae5e2bf
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-d73e-7cec6058ba51
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-825a-a4ffa69b9d24
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-b242-57c0550290d3
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-fca4-4bbec3ce7ccb
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-84dd-aa3a242e483d
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-c20d-4d34be2b0a0e
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-b9e6-fade87510df2
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-5ea3-a490867dbc9c
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-9f58-10269d6e1877
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-1a78-0aa196f0cdf7
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-349f-d624b74bdcf2
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-e41c-616d6aef0269
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-a67d-f75d5252f5cb
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-cade-5c4268f8f76f
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-5253-61df235e540f
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-7641-79b4e2d824a9
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-a537-19e2a43aa0ee
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-cdcb-97d938c50042
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-50f0-40d426907a27
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-adba-716207815642
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-b864-7bce2d32e06e
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-bd67-c5e87a4b5892
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-70c1-cec8fdba8108
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-0657-2329423d4bac	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-3459-150dbb9df5ac
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-8bca-f3e8422343af
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-9d9a-a12c6ae5e2bf
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-825a-a4ffa69b9d24
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-fca4-4bbec3ce7ccb
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-c20d-4d34be2b0a0e
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-5ea3-a490867dbc9c
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-1a78-0aa196f0cdf7
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-e41c-616d6aef0269
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-cade-5c4268f8f76f
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-b864-7bce2d32e06e
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-adba-716207815642
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-bd67-c5e87a4b5892
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-70c1-cec8fdba8108
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-5e61-4972ac63618d	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-6d2c-30e936b5ede0
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-7845-baf411f9630d
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-0216-cda1ca54ca4f
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-07e9-acb6884033b2
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-5279-fdf8ea4e3e7f	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-d7ec-4b9244967fb8	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-6fee-a6f018fa99b6	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-6fee-a6f018fa99b6	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd92-6fee-a6f018fa99b6	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-6fee-a6f018fa99b6	00030000-567b-cd92-0216-cda1ca54ca4f
00020000-567b-cd92-6fee-a6f018fa99b6	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-6fee-a6f018fa99b6	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-6fee-a6f018fa99b6	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-6fee-a6f018fa99b6	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-7845-baf411f9630d
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-5baa-b34f9cb8ce9e
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-bcfe-4dfd1f0d1e9e
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-25e9-4364ae90b7ae
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-bd07-3a7e065024d9	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-7614-2f49fff7da37	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-1d1f-c5d97145a025	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-1d1f-c5d97145a025	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-1d1f-c5d97145a025	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-1d1f-c5d97145a025	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd92-1d1f-c5d97145a025	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-1d1f-c5d97145a025	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-1d1f-c5d97145a025	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-1bb0-c6e73a086a68	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-1bb0-c6e73a086a68	00030000-567b-cd92-25e9-4364ae90b7ae
00020000-567b-cd92-1bb0-c6e73a086a68	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-1bb0-c6e73a086a68	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-6f03-8ca486a84f5c	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-6f03-8ca486a84f5c	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-9d5b-7fdaffa725d2
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-7845-baf411f9630d
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-506d-835e8cec2f8f
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-410b-e270012c540e
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-31f5-ee3ef8ec3c10
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-adba-716207815642
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-a537-19e2a43aa0ee
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-0216-cda1ca54ca4f
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-07e9-acb6884033b2
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-70c1-cec8fdba8108
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-50f0-40d426907a27
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-5baa-b34f9cb8ce9e
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-bcfe-4dfd1f0d1e9e
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-bd67-c5e87a4b5892
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-cdcb-97d938c50042
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-b864-7bce2d32e06e
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-7641-79b4e2d824a9
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-e998-4ca3b21f055d
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-3459-150dbb9df5ac
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-3537-10d7461412bb
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-115b-473e69d0c13b
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-8bca-f3e8422343af
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-99d5-36ed6a1433ae
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-9d9a-a12c6ae5e2bf
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-d73e-7cec6058ba51
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-825a-a4ffa69b9d24
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-b242-57c0550290d3
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-fca4-4bbec3ce7ccb
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-84dd-aa3a242e483d
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-c20d-4d34be2b0a0e
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-b9e6-fade87510df2
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-5ea3-a490867dbc9c
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-9f58-10269d6e1877
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-1a78-0aa196f0cdf7
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-349f-d624b74bdcf2
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-e41c-616d6aef0269
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-a67d-f75d5252f5cb
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-cade-5c4268f8f76f
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-5253-61df235e540f
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-25e9-4364ae90b7ae
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-334c-0c04e0ca7102
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-6d2c-30e936b5ede0
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd92-b5d7-26faf5b98d78	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-9d5b-7fdaffa725d2
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-506d-835e8cec2f8f
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-410b-e270012c540e
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-31f5-ee3ef8ec3c10
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-334c-0c04e0ca7102
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd92-3891-f9c6910d2442	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-9d5b-7fdaffa725d2
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-7845-baf411f9630d
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-506d-835e8cec2f8f
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-410b-e270012c540e
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-31f5-ee3ef8ec3c10
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-0216-cda1ca54ca4f
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-07e9-acb6884033b2
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-334c-0c04e0ca7102
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-6d2c-30e936b5ede0
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd92-c5c8-17180da0d6b3	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-7845-baf411f9630d
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-506d-835e8cec2f8f
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-410b-e270012c540e
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-31f5-ee3ef8ec3c10
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-adba-716207815642
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-a537-19e2a43aa0ee
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-0216-cda1ca54ca4f
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-07e9-acb6884033b2
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-70c1-cec8fdba8108
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-50f0-40d426907a27
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-cc85-16f9fd723b63
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-5baa-b34f9cb8ce9e
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-bcfe-4dfd1f0d1e9e
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-66ca-54a5d778f4db
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-bd67-c5e87a4b5892
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-cdcb-97d938c50042
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-d78a-bd61b31d9cc9
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-b864-7bce2d32e06e
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-7641-79b4e2d824a9
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-bf72-5478478f0e3d
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-e998-4ca3b21f055d
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-3459-150dbb9df5ac
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-3537-10d7461412bb
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-115b-473e69d0c13b
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-8bca-f3e8422343af
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-99d5-36ed6a1433ae
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-9d9a-a12c6ae5e2bf
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-d73e-7cec6058ba51
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-825a-a4ffa69b9d24
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-b242-57c0550290d3
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-fca4-4bbec3ce7ccb
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-84dd-aa3a242e483d
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-c20d-4d34be2b0a0e
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-b9e6-fade87510df2
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-5ea3-a490867dbc9c
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-9f58-10269d6e1877
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-1a78-0aa196f0cdf7
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-349f-d624b74bdcf2
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-e41c-616d6aef0269
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-a67d-f75d5252f5cb
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-cade-5c4268f8f76f
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-5253-61df235e540f
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-25e9-4364ae90b7ae
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-f06e-5c132152e2e5
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-f0d4-3590495fe532
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-6d2c-30e936b5ede0
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-4522-ca9978de6a15
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd92-7e4a-6bf17d4f3e80	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-9d5b-7fdaffa725d2
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-7845-baf411f9630d
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-506d-835e8cec2f8f
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-410b-e270012c540e
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-31f5-ee3ef8ec3c10
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-0216-cda1ca54ca4f
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-07e9-acb6884033b2
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-cc85-16f9fd723b63
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-5baa-b34f9cb8ce9e
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-66ca-54a5d778f4db
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-d78a-bd61b31d9cc9
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-bf72-5478478f0e3d
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-f06e-5c132152e2e5
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-334c-0c04e0ca7102
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-f0d4-3590495fe532
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-6d2c-30e936b5ede0
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-4522-ca9978de6a15
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd92-6357-4f3688ac9bd7	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-9d5b-7fdaffa725d2
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-506d-835e8cec2f8f
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-0216-cda1ca54ca4f
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-334c-0c04e0ca7102
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd92-722f-ba182767f123	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-9d5b-7fdaffa725d2
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-7845-baf411f9630d
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-adba-716207815642
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-a537-19e2a43aa0ee
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-70c1-cec8fdba8108
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-50f0-40d426907a27
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-cc85-16f9fd723b63
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-c299-8b7a53b70fc5
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-5baa-b34f9cb8ce9e
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-bcfe-4dfd1f0d1e9e
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-66ca-54a5d778f4db
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-bd67-c5e87a4b5892
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-cdcb-97d938c50042
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-d78a-bd61b31d9cc9
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-b864-7bce2d32e06e
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-7641-79b4e2d824a9
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-bf72-5478478f0e3d
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-e998-4ca3b21f055d
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-3459-150dbb9df5ac
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-3537-10d7461412bb
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-115b-473e69d0c13b
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-8bca-f3e8422343af
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-99d5-36ed6a1433ae
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-9d9a-a12c6ae5e2bf
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-d73e-7cec6058ba51
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-825a-a4ffa69b9d24
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-b242-57c0550290d3
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-fca4-4bbec3ce7ccb
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-84dd-aa3a242e483d
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-c20d-4d34be2b0a0e
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-b9e6-fade87510df2
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-5ea3-a490867dbc9c
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-9f58-10269d6e1877
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-1a78-0aa196f0cdf7
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-349f-d624b74bdcf2
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-e41c-616d6aef0269
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-a67d-f75d5252f5cb
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-cade-5c4268f8f76f
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-5253-61df235e540f
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-25e9-4364ae90b7ae
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-f06e-5c132152e2e5
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-334c-0c04e0ca7102
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-f0d4-3590495fe532
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-1d3b-3cfc03cff3c3
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-4522-ca9978de6a15
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd92-ba95-acc1979befa0	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-c6ba-1333d3842b29
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-c55f-368418d6a160
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-9d5b-7fdaffa725d2
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-ae73-401672ce5650
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-7845-baf411f9630d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-5051-15842ded69b1
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-de47-22beab9bd958
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-96dc-63bb78537604
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-b67e-455db99ee357
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-506d-835e8cec2f8f
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-410b-e270012c540e
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-ef44-d1f50a755c49
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-31f5-ee3ef8ec3c10
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-52ff-1fc0f84d0ff9
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-125f-a1f819cef949
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-55a2-ac5ecada0846
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-ad04-cf3ab349b905
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e194-687790662cb7
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-b499-d8214a212acf
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-f333-79852ecfcbe8
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-b824-23cc255aaa91
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-cefc-07786624a3ac
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-adba-716207815642
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-a537-19e2a43aa0ee
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-9e7a-7c9c25277427
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-78e8-5ea2f29e7bff
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-4051-53c1436732ce
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-eb6f-fe9dbdc97202
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-07e9-acb6884033b2
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-0216-cda1ca54ca4f
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-acb4-923f1356f2f7
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-3052-70468477a5f5
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-4eb8-4226cb236090
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-70c1-cec8fdba8108
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-50f0-40d426907a27
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-2ed0-346e45375a1b
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-cc85-16f9fd723b63
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-849a-74d45873176b
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-df58-31e01c782a58
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-6ac8-2d2cda487466
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-2625-70baaab0684d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-53bb-d204296779bd
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-59a3-a996c0754d10
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-2664-bddc6f610585
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-5269-ec0e178443b5
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-deac-1a577c0ea144
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-5d50-9e2df790309d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e714-8647c3586ef1
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-9c11-6afb2d38cffb
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-267c-2c143b348f80
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-26ab-a95ae56a0f9d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-4003-cbfc7cd9198a
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-c299-8b7a53b70fc5
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-5baa-b34f9cb8ce9e
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-cb9e-614119c0e816
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-4da5-9b1670219674
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-3ebb-7e94d5654246
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-c93d-7c6f7cab6d8d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-bcfe-4dfd1f0d1e9e
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-66ca-54a5d778f4db
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-5adb-de14cccc3705
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-bd67-c5e87a4b5892
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-cdcb-97d938c50042
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-94f6-1842cfab47da
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-854e-5508d062d622
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-2762-08e752a55f1f
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-d78a-bd61b31d9cc9
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-550d-b80a1a0ec744
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-3bc8-6bdb577b2d0d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-41ed-08158716c9f3
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e226-27a2979bd36d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-117b-e0903f14bf4c
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-f6dc-88699ecf9964
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-b864-7bce2d32e06e
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-7641-79b4e2d824a9
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e621-1d6e253267a9
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-bf72-5478478f0e3d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e998-4ca3b21f055d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-3459-150dbb9df5ac
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-3537-10d7461412bb
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-115b-473e69d0c13b
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-8bca-f3e8422343af
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-99d5-36ed6a1433ae
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-9d9a-a12c6ae5e2bf
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-d73e-7cec6058ba51
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-825a-a4ffa69b9d24
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-b242-57c0550290d3
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-fca4-4bbec3ce7ccb
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-84dd-aa3a242e483d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-c20d-4d34be2b0a0e
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-b9e6-fade87510df2
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-5ea3-a490867dbc9c
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-9f58-10269d6e1877
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-1a78-0aa196f0cdf7
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-349f-d624b74bdcf2
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e41c-616d6aef0269
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-a67d-f75d5252f5cb
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-cade-5c4268f8f76f
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-5253-61df235e540f
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-a153-349505bc8fc4
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-241a-0499c4e50343
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-98ae-ab7cd38eb4fe
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-9495-d3f861859e17
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-cd9b-7e881fc5e749
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e24b-983f25570966
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-892d-d2b8e2d4dec6
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-3706-c5e304786332
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-b2d9-8a092722445d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-3c12-eb57de9cf384
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-668e-f28d4afa579a
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-99d1-87413e0612f0
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-46f8-451ef2970703
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e19c-77db8ec111a8
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-7f9c-e9e4c92b3756
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-3c52-9e3e40a84ddb
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e7e2-32387841c201
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-067f-91f101e5bbea
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-bdb2-aeda469cd399
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-d8c3-a12087442548
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-b1f1-4dfec095e1f5
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e696-bd3435bc2eef
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e788-6b348317c2d8
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-25e9-4364ae90b7ae
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-f06e-5c132152e2e5
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e596-da431f299d2c
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-27df-08e530dee21d
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-d468-386fd4036a27
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-275d-ea0c20ebf1c5
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-d8ee-217a4513b051
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-63a1-c6c06f5db7c7
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-4daa-21e57c4908ea
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-e52c-3874c73d25ea
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-ce4b-a210a6ce2d33
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-334c-0c04e0ca7102
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-0b23-004eb45d6ec5
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-f0d4-3590495fe532
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-6d2c-30e936b5ede0
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-ced0-86ba3088090b
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-593a-d225ba4c19e5
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-16f3-4cb72aba5fab
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-6753-ebd600999797
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-83c5-d03af52ea9eb
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-1d3b-3cfc03cff3c3
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-df83-c6b2480c48f9
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-bb6d-f480c27a59e1
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-4522-ca9978de6a15
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-a2f3-efd08ab5b2b0
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-d4db-ce3c492486af
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-cd92-fcd39bdc75fd
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-7863-a56d3182e495
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-3261-ba16d0bbb049
00020000-567b-cd94-e002-989c2c784a96	00030000-567b-cd92-2335-d08039df1506
00020000-567b-cd94-35cb-d2807780888a	00030000-567b-cd92-569c-c5b764337e18
00020000-567b-cd94-96ba-fcaeb6431d95	00030000-567b-cd92-8d8f-3f2d9f76e1e4
00020000-567b-cd94-a9b4-0568ebbc23d2	00030000-567b-cd92-6d2c-30e936b5ede0
00020000-567b-cd94-d920-285c7cdf5c12	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd94-2375-b31e8c49208b	00030000-567b-cd92-59a3-a996c0754d10
00020000-567b-cd94-6389-1a005a103636	00030000-567b-cd92-2664-bddc6f610585
00020000-567b-cd94-ef43-3a3fc5dfa538	00030000-567b-cd92-5269-ec0e178443b5
00020000-567b-cd94-7b3c-fa0e4b9f6136	00030000-567b-cd92-53bb-d204296779bd
00020000-567b-cd94-39b3-24fea5b658a0	00030000-567b-cd92-6ac8-2d2cda487466
00020000-567b-cd94-c217-ca1d15071b16	00030000-567b-cd92-2625-70baaab0684d
00020000-567b-cd94-0802-96b3ec7f49e3	00030000-567b-cd92-c19e-faa418af6854
00020000-567b-cd94-41f3-6c6387fbc410	00030000-567b-cd92-be31-5bca2d3c9854
00020000-567b-cd94-6ce6-d790552d7682	00030000-567b-cd92-c2e8-45024a0da3b9
00020000-567b-cd94-1290-7d9719453529	00030000-567b-cd92-d11d-5e5b5859dca7
00020000-567b-cd94-eb16-40d5df81c7ad	00030000-567b-cd92-5baa-b34f9cb8ce9e
00020000-567b-cd94-995f-e49eba75b618	00030000-567b-cd92-68e2-a40664d6c6c3
00020000-567b-cd94-eb4b-96560529ff30	00030000-567b-cd92-b320-397eb4ec744b
00020000-567b-cd94-45b7-1b76ea7c18ce	00030000-567b-cd92-c381-1320044fc0b7
00020000-567b-cd94-0026-821091355c7e	00030000-567b-cd92-0865-e0be31857a0c
00020000-567b-cd94-0026-821091355c7e	00030000-567b-cd92-66ca-54a5d778f4db
00020000-567b-cd94-0026-821091355c7e	00030000-567b-cd92-4c9f-a0a5606b6656
00020000-567b-cd94-384a-a12c859e48e2	00030000-567b-cd92-79e2-93b0134a6f06
00020000-567b-cd94-20e2-91cfb7a1bdcb	00030000-567b-cd92-f0d4-3590495fe532
00020000-567b-cd94-efb0-38b4883421e7	00030000-567b-cd92-e788-6b348317c2d8
00020000-567b-cd94-f135-7fd800a77ca5	00030000-567b-cd92-264e-e1c77c49ef36
00020000-567b-cd94-2f16-d41b7c608ffa	00030000-567b-cd92-f06e-5c132152e2e5
00020000-567b-cd94-ba32-80e3a90f2774	00030000-567b-cd92-2f7d-a98b1080094e
00020000-567b-cd94-9c35-d4fd80a2cee3	00030000-567b-cd92-d78a-bd61b31d9cc9
00020000-567b-cd94-4b4d-4b16a719ab3c	00030000-567b-cd92-83c1-36817ca31438
00020000-567b-cd94-7677-6decbc70ddf3	00030000-567b-cd92-4522-ca9978de6a15
00020000-567b-cd94-7d57-a844d5dd3702	00030000-567b-cd92-5134-730c97957f76
00020000-567b-cd94-4745-a5bd85232411	00030000-567b-cd92-bcfe-4dfd1f0d1e9e
00020000-567b-cd94-5b35-9c5d749f7655	00030000-567b-cd92-e3db-37becd159866
00020000-567b-cd94-f0f0-1e2bd5b5b487	00030000-567b-cd92-25e9-4364ae90b7ae
00020000-567b-cd94-46e8-e6f29dcdda8b	00030000-567b-cd92-ee3c-5a59ddb411b7
00020000-567b-cd94-82a4-e174e062b9b0	00030000-567b-cd92-362c-fa9535444b7f
00020000-567b-cd94-d196-120c73edf39d	00030000-567b-cd92-7845-baf411f9630d
00020000-567b-cd94-6022-668912c0b59d	00030000-567b-cd92-7da1-a4e957c61b38
00020000-567b-cd94-315f-2a7ea6a30e1b	00030000-567b-cd92-0216-cda1ca54ca4f
00020000-567b-cd94-c4a3-cd2ced538d76	00030000-567b-cd92-07e9-acb6884033b2
\.


--
-- TOC entry 3152 (class 0 OID 32893471)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32893505)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32893643)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-567b-cd94-d6a0-f08020eaed02	00090000-567b-cd94-6262-af008aef903b	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-567b-cd94-4d65-f776f2f3ad00	00090000-567b-cd94-07f1-64bb0f60d62b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-567b-cd94-675e-16e12f050175	00090000-567b-cd94-d0c4-99a18de3b59a	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-567b-cd94-b484-090dfd0036e0	00090000-567b-cd94-70ce-a03df9136071	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32893163)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-567b-cd94-ae04-ceea59ab50f9	\N	00040000-567b-cd92-ef32-bfe9285705be	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567b-cd94-ed7a-dd6ae723e3b9	\N	00040000-567b-cd92-ef32-bfe9285705be	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-567b-cd94-d655-63f94fccb385	\N	00040000-567b-cd92-ef32-bfe9285705be	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567b-cd94-8e7f-6bcdaa3a439a	\N	00040000-567b-cd92-ef32-bfe9285705be	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567b-cd94-792b-5bef4314df58	\N	00040000-567b-cd92-ef32-bfe9285705be	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567b-cd94-44f9-671dd111af8f	\N	00040000-567b-cd91-cb4e-71b020aaaa7b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567b-cd94-8e25-4fee697b78a6	\N	00040000-567b-cd91-1a22-9ad4b5535f2c	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567b-cd94-1182-75d0f0ada7da	\N	00040000-567b-cd91-01e4-47c3bb946980	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567b-cd94-435c-e0f329dd3f0e	\N	00040000-567b-cd91-6c99-b2ebd61fb28a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567b-cd96-cdae-6590b89c74c7	\N	00040000-567b-cd92-ef32-bfe9285705be	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32893208)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-567b-cd91-8140-a79004f1da53	8341	Adlešiči
00050000-567b-cd91-b6b0-3b4e1bd3a9d7	5270	Ajdovščina
00050000-567b-cd91-94d4-9aa0f468fa5d	6280	Ankaran/Ancarano
00050000-567b-cd91-3d6c-437259da7871	9253	Apače
00050000-567b-cd91-01d3-1a2771899e4b	8253	Artiče
00050000-567b-cd91-ec79-ef2a43557602	4275	Begunje na Gorenjskem
00050000-567b-cd91-ff10-d68f620780e4	1382	Begunje pri Cerknici
00050000-567b-cd91-4d79-211cc1b478d3	9231	Beltinci
00050000-567b-cd91-c9d9-f610d10a3a6a	2234	Benedikt
00050000-567b-cd91-9440-63f03c6f3f13	2345	Bistrica ob Dravi
00050000-567b-cd91-5201-a29dcf7ae1b9	3256	Bistrica ob Sotli
00050000-567b-cd91-d900-dc7846487d11	8259	Bizeljsko
00050000-567b-cd91-a4b8-241c3913160a	1223	Blagovica
00050000-567b-cd91-4c80-2f1cf1aef159	8283	Blanca
00050000-567b-cd91-4632-1dba105b3570	4260	Bled
00050000-567b-cd91-04f0-444bbb075a01	4273	Blejska Dobrava
00050000-567b-cd91-23c9-7300ed8c0d44	9265	Bodonci
00050000-567b-cd91-a065-5ad7f37c03d4	9222	Bogojina
00050000-567b-cd91-e988-1682c39077c5	4263	Bohinjska Bela
00050000-567b-cd91-5854-3627e2e2d843	4264	Bohinjska Bistrica
00050000-567b-cd91-d766-38dae7ca28ee	4265	Bohinjsko jezero
00050000-567b-cd91-6c47-e25cb4222c18	1353	Borovnica
00050000-567b-cd91-f608-121273c2a819	8294	Boštanj
00050000-567b-cd91-6dbb-d643cd050f8a	5230	Bovec
00050000-567b-cd91-b8e7-0ae2a1294bf7	5295	Branik
00050000-567b-cd91-33f7-a176f65e5ae3	3314	Braslovče
00050000-567b-cd91-657c-9f0745300856	5223	Breginj
00050000-567b-cd91-9511-8f495c98d614	8280	Brestanica
00050000-567b-cd91-c6da-2a78c0e1037e	2354	Bresternica
00050000-567b-cd91-14bb-2060d356d3cd	4243	Brezje
00050000-567b-cd91-e3d5-7e3933e13a51	1351	Brezovica pri Ljubljani
00050000-567b-cd91-df23-54260749402c	8250	Brežice
00050000-567b-cd91-aa3d-964c908bcb65	4210	Brnik - Aerodrom
00050000-567b-cd91-78d7-676b6bb534a2	8321	Brusnice
00050000-567b-cd91-f5c6-6935a2cf4d7c	3255	Buče
00050000-567b-cd91-e9f8-165c649a4fba	8276	Bučka 
00050000-567b-cd91-39f7-80f013604e61	9261	Cankova
00050000-567b-cd91-cbe2-010e0e08a56d	3000	Celje 
00050000-567b-cd91-0ba9-201c4e12ea73	3001	Celje - poštni predali
00050000-567b-cd91-3cd3-6a7fdb8c647e	4207	Cerklje na Gorenjskem
00050000-567b-cd91-4fab-2f38bf2c4f12	8263	Cerklje ob Krki
00050000-567b-cd91-f396-4896e0101d95	1380	Cerknica
00050000-567b-cd91-18b5-2bee95887314	5282	Cerkno
00050000-567b-cd91-9c31-4d83de42d515	2236	Cerkvenjak
00050000-567b-cd91-5873-f64aa7d7b208	2215	Ceršak
00050000-567b-cd91-6b5f-ccf94205c8d5	2326	Cirkovce
00050000-567b-cd91-581d-95d0b68c32d4	2282	Cirkulane
00050000-567b-cd91-73ca-eb3e407e4b23	5273	Col
00050000-567b-cd91-16f7-21df4f1c039e	8251	Čatež ob Savi
00050000-567b-cd91-3cad-6072a2809869	1413	Čemšenik
00050000-567b-cd91-ec75-fea694c6825a	5253	Čepovan
00050000-567b-cd91-9efd-e81772380779	9232	Črenšovci
00050000-567b-cd91-185d-a281019db13f	2393	Črna na Koroškem
00050000-567b-cd91-594b-1e11b79e4020	6275	Črni Kal
00050000-567b-cd91-02bd-e5e782a90d9f	5274	Črni Vrh nad Idrijo
00050000-567b-cd91-7458-726bea2e73b8	5262	Črniče
00050000-567b-cd91-039a-07745d5543aa	8340	Črnomelj
00050000-567b-cd91-25f6-3049680fd817	6271	Dekani
00050000-567b-cd91-32a9-d3b691706707	5210	Deskle
00050000-567b-cd91-7de5-8844be85c758	2253	Destrnik
00050000-567b-cd91-3d5b-bcb9049ca177	6215	Divača
00050000-567b-cd91-ce98-50937719b661	1233	Dob
00050000-567b-cd91-3b91-8e66e2b9ff06	3224	Dobje pri Planini
00050000-567b-cd91-683c-a4b334a11320	8257	Dobova
00050000-567b-cd91-6c1f-e9a58fc2116f	1423	Dobovec
00050000-567b-cd91-9c41-69fe08399e40	5263	Dobravlje
00050000-567b-cd91-3752-0e1308fa7346	3204	Dobrna
00050000-567b-cd91-86ec-f6da1b23f92c	8211	Dobrnič
00050000-567b-cd91-83c3-dddc3722e9d2	1356	Dobrova
00050000-567b-cd91-8423-b8da27ae2556	9223	Dobrovnik/Dobronak 
00050000-567b-cd91-f24d-4705c5734d6b	5212	Dobrovo v Brdih
00050000-567b-cd91-3877-55ec7deb5eaa	1431	Dol pri Hrastniku
00050000-567b-cd91-904d-bbf1cb7b4cf2	1262	Dol pri Ljubljani
00050000-567b-cd91-b285-90adf0007b60	1273	Dole pri Litiji
00050000-567b-cd91-3671-81033b8c1ad4	1331	Dolenja vas
00050000-567b-cd91-c72d-f6c73c1a32b8	8350	Dolenjske Toplice
00050000-567b-cd91-ae6d-51d059ab9c02	1230	Domžale
00050000-567b-cd91-7c87-2ea902277e83	2252	Dornava
00050000-567b-cd91-bdf8-47ebc2db7e93	5294	Dornberk
00050000-567b-cd91-34d1-b6c7401fc3b3	1319	Draga
00050000-567b-cd91-0e42-a0f9e60f0760	8343	Dragatuš
00050000-567b-cd91-8ad7-a9007d98e2e6	3222	Dramlje
00050000-567b-cd91-5b9b-340b09f63793	2370	Dravograd
00050000-567b-cd91-ea52-acf1652916c5	4203	Duplje
00050000-567b-cd91-9e2e-01f64213feee	6221	Dutovlje
00050000-567b-cd91-2492-b73c4ff8427a	8361	Dvor
00050000-567b-cd91-06c8-4b76a1720224	2343	Fala
00050000-567b-cd91-8921-6990cd8051f5	9208	Fokovci
00050000-567b-cd91-5f07-16e9f3b6c7f3	2313	Fram
00050000-567b-cd91-3ec3-2821dfc27fb5	3213	Frankolovo
00050000-567b-cd91-d8e4-0c8c7e3d4cab	1274	Gabrovka
00050000-567b-cd91-8d35-c51d246ce8e8	8254	Globoko
00050000-567b-cd91-cce2-0a55b3767eba	5275	Godovič
00050000-567b-cd91-1199-69ad946f1d55	4204	Golnik
00050000-567b-cd91-e564-140bf36b30df	3303	Gomilsko
00050000-567b-cd91-0efd-099b13c31200	4224	Gorenja vas
00050000-567b-cd91-f808-1328dc5b83f4	3263	Gorica pri Slivnici
00050000-567b-cd91-67eb-9e22519684a5	2272	Gorišnica
00050000-567b-cd91-5dbd-888fbf0c3033	9250	Gornja Radgona
00050000-567b-cd91-a065-bc55a8bb4cc4	3342	Gornji Grad
00050000-567b-cd91-069c-b8ce8321fc9a	4282	Gozd Martuljek
00050000-567b-cd91-1b62-4ba30e619489	6272	Gračišče
00050000-567b-cd91-9909-38eb48716a35	9264	Grad
00050000-567b-cd91-8350-13bc2c0b2e23	8332	Gradac
00050000-567b-cd91-ed4f-9197e296426b	1384	Grahovo
00050000-567b-cd91-e32d-f2143df7bf1c	5242	Grahovo ob Bači
00050000-567b-cd91-ae34-1d9f1fe71852	5251	Grgar
00050000-567b-cd91-752f-e4ae089aad85	3302	Griže
00050000-567b-cd91-6321-3e4c49d4965e	3231	Grobelno
00050000-567b-cd91-340c-3711b6485935	1290	Grosuplje
00050000-567b-cd91-f08a-59a596676061	2288	Hajdina
00050000-567b-cd91-fa26-b4a59cc94b44	8362	Hinje
00050000-567b-cd91-b3c3-7ea5b488f5fd	2311	Hoče
00050000-567b-cd91-264e-607c5e4a1e90	9205	Hodoš/Hodos
00050000-567b-cd91-4864-e509e2421ed6	1354	Horjul
00050000-567b-cd91-8701-736a3724c0ca	1372	Hotedršica
00050000-567b-cd91-b832-80081daa9a81	1430	Hrastnik
00050000-567b-cd91-fd80-00c017456370	6225	Hruševje
00050000-567b-cd91-18d7-c3a513b70149	4276	Hrušica
00050000-567b-cd91-a904-c5c210b2daa4	5280	Idrija
00050000-567b-cd91-f3ee-7c913811646f	1292	Ig
00050000-567b-cd91-9935-b1d060a8d8da	6250	Ilirska Bistrica
00050000-567b-cd91-71f1-e36c98075851	6251	Ilirska Bistrica-Trnovo
00050000-567b-cd91-489e-401ebdc353ea	1295	Ivančna Gorica
00050000-567b-cd91-984c-dd5868115711	2259	Ivanjkovci
00050000-567b-cd91-fa48-d97386ce7d37	1411	Izlake
00050000-567b-cd91-e2cb-1d58f1684351	6310	Izola/Isola
00050000-567b-cd91-4f92-e09ab1a30d6c	2222	Jakobski Dol
00050000-567b-cd91-d4ca-293189378fd1	2221	Jarenina
00050000-567b-cd91-44b7-6cf738c9eb16	6254	Jelšane
00050000-567b-cd91-f769-1dfa54579453	4270	Jesenice
00050000-567b-cd91-b64e-b5cec612b179	8261	Jesenice na Dolenjskem
00050000-567b-cd91-5f00-797173f1d92e	3273	Jurklošter
00050000-567b-cd91-bc74-19dfac1be9eb	2223	Jurovski Dol
00050000-567b-cd91-8ecf-7b16176cb0aa	2256	Juršinci
00050000-567b-cd91-c09e-54db6410f4a0	5214	Kal nad Kanalom
00050000-567b-cd91-b202-82c7d73c000a	3233	Kalobje
00050000-567b-cd91-008e-0cdd04a3bcba	4246	Kamna Gorica
00050000-567b-cd91-1904-657376e4e0a7	2351	Kamnica
00050000-567b-cd91-f2de-5b116c9ce39e	1241	Kamnik
00050000-567b-cd91-04e8-15589e1b3a30	5213	Kanal
00050000-567b-cd91-e2ef-fd18e3cc3d89	8258	Kapele
00050000-567b-cd91-1320-b54be6ee56c8	2362	Kapla
00050000-567b-cd91-c05a-bf19db4a9a04	2325	Kidričevo
00050000-567b-cd91-a362-7193b20abe00	1412	Kisovec
00050000-567b-cd91-d4e3-f60ece584a5d	6253	Knežak
00050000-567b-cd91-4bcd-941744b343ae	5222	Kobarid
00050000-567b-cd91-2341-2f0f5292fed1	9227	Kobilje
00050000-567b-cd91-555a-67c68e42a8d9	1330	Kočevje
00050000-567b-cd91-8902-4de81972458f	1338	Kočevska Reka
00050000-567b-cd91-3c1b-f26391a6fa50	2276	Kog
00050000-567b-cd91-2e28-7ff59d65193d	5211	Kojsko
00050000-567b-cd91-bdb7-321f6d372a1f	6223	Komen
00050000-567b-cd91-220e-efc940a44758	1218	Komenda
00050000-567b-cd91-f304-acbc324316b1	6000	Koper/Capodistria 
00050000-567b-cd91-d4f9-69f7c080d20b	6001	Koper/Capodistria - poštni predali
00050000-567b-cd91-129c-025289b99496	8282	Koprivnica
00050000-567b-cd91-fe5f-6097228bcb6e	5296	Kostanjevica na Krasu
00050000-567b-cd91-d22d-36c41613433a	8311	Kostanjevica na Krki
00050000-567b-cd91-40de-4645ffc02bd0	1336	Kostel
00050000-567b-cd91-e9fb-9bd3e8a605ef	6256	Košana
00050000-567b-cd91-da88-61ca86acd0e2	2394	Kotlje
00050000-567b-cd91-7524-53906db79cda	6240	Kozina
00050000-567b-cd91-d29f-5b9538c888b7	3260	Kozje
00050000-567b-cd91-9919-bf266fdfa4b6	4000	Kranj 
00050000-567b-cd91-ea0c-8ecb6c664cc2	4001	Kranj - poštni predali
00050000-567b-cd91-1152-88bea817d3c7	4280	Kranjska Gora
00050000-567b-cd91-30c6-68dbd2753f65	1281	Kresnice
00050000-567b-cd91-1fa1-49993e202489	4294	Križe
00050000-567b-cd91-48db-7ba576e93a2c	9206	Križevci
00050000-567b-cd91-a254-208040fe3d82	9242	Križevci pri Ljutomeru
00050000-567b-cd91-826c-95e3637bc710	1301	Krka
00050000-567b-cd91-eaed-0ffcff1fe1c1	8296	Krmelj
00050000-567b-cd91-2385-51da7a181a5e	4245	Kropa
00050000-567b-cd91-9fe3-a66ed8230acc	8262	Krška vas
00050000-567b-cd91-606d-5a551d4df8f4	8270	Krško
00050000-567b-cd91-a062-40ff03536118	9263	Kuzma
00050000-567b-cd91-0bea-8ce556f819a9	2318	Laporje
00050000-567b-cd91-01c2-ea7d10a1dfab	3270	Laško
00050000-567b-cd91-c048-49a60cf1bf88	1219	Laze v Tuhinju
00050000-567b-cd91-847f-e71347a7f2a6	2230	Lenart v Slovenskih goricah
00050000-567b-cd91-2428-138b625458ad	9220	Lendava/Lendva
00050000-567b-cd91-7e7e-fc1a65c74cde	4248	Lesce
00050000-567b-cd91-12cc-6cafba6be009	3261	Lesično
00050000-567b-cd91-1f0e-1ba066faf407	8273	Leskovec pri Krškem
00050000-567b-cd91-3a93-a9f5636d0710	2372	Libeliče
00050000-567b-cd91-2b3d-c7fd536cf1ea	2341	Limbuš
00050000-567b-cd91-b52d-a16251f2aeec	1270	Litija
00050000-567b-cd91-4cbf-b8bb2e815c9a	3202	Ljubečna
00050000-567b-cd91-ce24-730e801a7b9f	1000	Ljubljana 
00050000-567b-cd91-969e-cc64804d6399	1001	Ljubljana - poštni predali
00050000-567b-cd91-b8ea-ab05ecff0689	1231	Ljubljana - Črnuče
00050000-567b-cd91-f0c6-6ab8eacfdb84	1261	Ljubljana - Dobrunje
00050000-567b-cd91-e96b-28bef79c6112	1260	Ljubljana - Polje
00050000-567b-cd91-c21d-26219ffc3d1c	1210	Ljubljana - Šentvid
00050000-567b-cd91-3c5c-92e88520b535	1211	Ljubljana - Šmartno
00050000-567b-cd91-667e-8d78d5ef5056	3333	Ljubno ob Savinji
00050000-567b-cd91-2e1e-59e50d79238c	9240	Ljutomer
00050000-567b-cd91-0716-a440838cbf03	3215	Loče
00050000-567b-cd91-b46b-3077d1a2b5fe	5231	Log pod Mangartom
00050000-567b-cd91-ea7b-ec18bfb301a4	1358	Log pri Brezovici
00050000-567b-cd91-831e-7804619dd840	1370	Logatec
00050000-567b-cd91-6458-12d00b6e40a7	1371	Logatec
00050000-567b-cd91-9ca0-1d08cbea22f9	1434	Loka pri Zidanem Mostu
00050000-567b-cd91-2e10-d62de3a36f67	3223	Loka pri Žusmu
00050000-567b-cd91-967a-2c13b819d26d	6219	Lokev
00050000-567b-cd91-72b7-b162a3bae88b	1318	Loški Potok
00050000-567b-cd91-df10-5c37c375bfc1	2324	Lovrenc na Dravskem polju
00050000-567b-cd91-f24f-061b8deb12c7	2344	Lovrenc na Pohorju
00050000-567b-cd91-d037-a7af6d7c945b	3334	Luče
00050000-567b-cd91-42d3-3c38c77c5d2c	1225	Lukovica
00050000-567b-cd91-6d3f-1d338e2e7a7c	9202	Mačkovci
00050000-567b-cd91-3565-6c0400d85c4e	2322	Majšperk
00050000-567b-cd91-5014-36e6e99a15c9	2321	Makole
00050000-567b-cd91-f643-fe5a60f0f2ac	9243	Mala Nedelja
00050000-567b-cd91-ca98-66448aefd61e	2229	Malečnik
00050000-567b-cd91-7155-07af85358359	6273	Marezige
00050000-567b-cd91-e638-09b8801ae118	2000	Maribor 
00050000-567b-cd91-7442-7747269151ba	2001	Maribor - poštni predali
00050000-567b-cd91-01b0-6b97596826c1	2206	Marjeta na Dravskem polju
00050000-567b-cd91-6a73-42f7aeefea3a	2281	Markovci
00050000-567b-cd91-0241-093fd4c0aabc	9221	Martjanci
00050000-567b-cd91-22a6-9b2adf1fc964	6242	Materija
00050000-567b-cd91-bab1-b848f4e3d5ee	4211	Mavčiče
00050000-567b-cd91-e1c1-bb385ad70c0c	1215	Medvode
00050000-567b-cd91-93d5-62c6c61b5d28	1234	Mengeš
00050000-567b-cd91-36f3-b12959474238	8330	Metlika
00050000-567b-cd91-dccb-78dfe36e4b28	2392	Mežica
00050000-567b-cd91-ec57-78e003463684	2204	Miklavž na Dravskem polju
00050000-567b-cd91-136b-99e790e4582b	2275	Miklavž pri Ormožu
00050000-567b-cd91-203f-13f748097fbc	5291	Miren
00050000-567b-cd91-631b-5aee4892acc0	8233	Mirna
00050000-567b-cd91-d87a-633f27876e04	8216	Mirna Peč
00050000-567b-cd91-bc75-757276aaddfb	2382	Mislinja
00050000-567b-cd91-6c07-e785c80a2f9f	4281	Mojstrana
00050000-567b-cd91-f7ea-5e558e262280	8230	Mokronog
00050000-567b-cd91-58e0-10fb28b248c8	1251	Moravče
00050000-567b-cd91-81dc-6c20a8c229b2	9226	Moravske Toplice
00050000-567b-cd91-71a6-f9963c16c646	5216	Most na Soči
00050000-567b-cd91-1812-d49f1eaf588f	1221	Motnik
00050000-567b-cd91-713a-5a14a3e526c7	3330	Mozirje
00050000-567b-cd91-d5bb-756516b1a95f	9000	Murska Sobota 
00050000-567b-cd91-d158-75ded5946263	9001	Murska Sobota - poštni predali
00050000-567b-cd91-f201-476e90fdf08c	2366	Muta
00050000-567b-cd91-eaa9-5c7fdbaff50b	4202	Naklo
00050000-567b-cd91-846a-017bad657bf0	3331	Nazarje
00050000-567b-cd91-87bd-6ffc67fbdbad	1357	Notranje Gorice
00050000-567b-cd91-b15b-d0149aaaad49	3203	Nova Cerkev
00050000-567b-cd91-0434-6c74c444a3f9	5000	Nova Gorica 
00050000-567b-cd91-59b8-d56e137a6a93	5001	Nova Gorica - poštni predali
00050000-567b-cd91-ac3d-6e7ca6052cd1	1385	Nova vas
00050000-567b-cd91-5a81-23e2cf4e15dc	8000	Novo mesto
00050000-567b-cd91-1838-0ff0e9204ddf	8001	Novo mesto - poštni predali
00050000-567b-cd91-5da1-4c63506c0ed4	6243	Obrov
00050000-567b-cd91-dd2d-910c76bb1a47	9233	Odranci
00050000-567b-cd91-b0ee-bdb8cf48b141	2317	Oplotnica
00050000-567b-cd91-bb39-5b8b10df6716	2312	Orehova vas
00050000-567b-cd91-95e1-a6626a18b427	2270	Ormož
00050000-567b-cd91-68a8-5c353f59512a	1316	Ortnek
00050000-567b-cd91-9173-af0cb730007c	1337	Osilnica
00050000-567b-cd91-8148-b9172e812c97	8222	Otočec
00050000-567b-cd91-9128-10195e021d14	2361	Ožbalt
00050000-567b-cd91-5aa4-1b89ee16aea2	2231	Pernica
00050000-567b-cd91-9407-72ff508fabec	2211	Pesnica pri Mariboru
00050000-567b-cd91-7a35-5d888f58af3c	9203	Petrovci
00050000-567b-cd91-0efa-f03efee6a3a5	3301	Petrovče
00050000-567b-cd91-4a1d-19ae12f77b48	6330	Piran/Pirano
00050000-567b-cd91-3898-5110a4f9aceb	8255	Pišece
00050000-567b-cd91-b29e-3f46d61aa7d2	6257	Pivka
00050000-567b-cd91-973a-3a7dd10d99db	6232	Planina
00050000-567b-cd91-9a7f-d3a85a7100bb	3225	Planina pri Sevnici
00050000-567b-cd91-9282-2691a7964a30	6276	Pobegi
00050000-567b-cd91-8660-d061c3c720ee	8312	Podbočje
00050000-567b-cd91-508d-0e1928818d78	5243	Podbrdo
00050000-567b-cd91-d190-79f9e7b09035	3254	Podčetrtek
00050000-567b-cd91-464a-454b8dc689da	2273	Podgorci
00050000-567b-cd91-81fa-a34617364db2	6216	Podgorje
00050000-567b-cd91-9e62-7d48f04b6b14	2381	Podgorje pri Slovenj Gradcu
00050000-567b-cd91-fc20-bb22e6ade087	6244	Podgrad
00050000-567b-cd91-b6f3-849d2255f45d	1414	Podkum
00050000-567b-cd91-212f-a6e1417d666b	2286	Podlehnik
00050000-567b-cd91-1d9d-e0c489c227f0	5272	Podnanos
00050000-567b-cd91-ab5e-7e0292c24a4c	4244	Podnart
00050000-567b-cd91-82d0-a4829379d8f9	3241	Podplat
00050000-567b-cd91-a7d5-e1306479c194	3257	Podsreda
00050000-567b-cd91-423d-5d59bbe8258f	2363	Podvelka
00050000-567b-cd91-2459-c5c50948affb	2208	Pohorje
00050000-567b-cd91-e08e-87c60a4562e3	2257	Polenšak
00050000-567b-cd91-5c4b-d295905750a3	1355	Polhov Gradec
00050000-567b-cd91-0978-c39c0cec5de0	4223	Poljane nad Škofjo Loko
00050000-567b-cd91-2d42-ad7a9a0ea807	2319	Poljčane
00050000-567b-cd91-a2fa-ce8eb18f2969	1272	Polšnik
00050000-567b-cd91-d9db-f1872c4b4bf0	3313	Polzela
00050000-567b-cd91-6659-5c47cbab8032	3232	Ponikva
00050000-567b-cd91-fbf3-c86720548df3	6320	Portorož/Portorose
00050000-567b-cd91-b98e-eb81d2a71e3e	6230	Postojna
00050000-567b-cd91-c4b3-e4c87583296b	2331	Pragersko
00050000-567b-cd91-69de-f3c1a219f899	3312	Prebold
00050000-567b-cd91-5fe6-72eaa52a8413	4205	Preddvor
00050000-567b-cd91-7e92-bacd0969642d	6255	Prem
00050000-567b-cd91-58c8-c8da86cce732	1352	Preserje
00050000-567b-cd91-eb37-5ebdb0166c3b	6258	Prestranek
00050000-567b-cd91-5bbe-ce8a0108ea0d	2391	Prevalje
00050000-567b-cd91-a9ca-595606a02175	3262	Prevorje
00050000-567b-cd91-8e9e-a109307cf5fc	1276	Primskovo 
00050000-567b-cd91-5303-9118ae59df40	3253	Pristava pri Mestinju
00050000-567b-cd91-a40a-02b2e542ae3e	9207	Prosenjakovci/Partosfalva
00050000-567b-cd91-ce7d-3f7a93d296c9	5297	Prvačina
00050000-567b-cd91-8cab-39105739311e	2250	Ptuj
00050000-567b-cd91-838b-6c23e0672c45	2323	Ptujska Gora
00050000-567b-cd91-9702-5cabccb47b1f	9201	Puconci
00050000-567b-cd91-32e0-1ab692f5ab49	2327	Rače
00050000-567b-cd91-64e1-02dea9494b75	1433	Radeče
00050000-567b-cd91-ce5a-4f7722cad725	9252	Radenci
00050000-567b-cd91-5c67-e03a8d9b5f01	2360	Radlje ob Dravi
00050000-567b-cd91-0758-770bf4b65795	1235	Radomlje
00050000-567b-cd91-dab1-23c2de1cf4ab	4240	Radovljica
00050000-567b-cd91-5c2d-ae12f2106688	8274	Raka
00050000-567b-cd91-9cca-0517311913d1	1381	Rakek
00050000-567b-cd91-285b-1ee17372ef25	4283	Rateče - Planica
00050000-567b-cd91-f370-8f1df7486ce4	2390	Ravne na Koroškem
00050000-567b-cd91-c001-2c1b9568adf4	9246	Razkrižje
00050000-567b-cd91-dea0-d9834fa9d97b	3332	Rečica ob Savinji
00050000-567b-cd91-6068-22a13a37a399	5292	Renče
00050000-567b-cd91-4f9d-9618822624d3	1310	Ribnica
00050000-567b-cd91-f83e-a239a850eee7	2364	Ribnica na Pohorju
00050000-567b-cd91-b75a-1404b6121b1e	3272	Rimske Toplice
00050000-567b-cd91-cb05-9a3001dccf62	1314	Rob
00050000-567b-cd91-6e92-bc19dc63050d	5215	Ročinj
00050000-567b-cd91-2583-e80301a58c59	3250	Rogaška Slatina
00050000-567b-cd91-2718-2244a4512824	9262	Rogašovci
00050000-567b-cd91-3406-761db1a1f459	3252	Rogatec
00050000-567b-cd91-3d11-a3c73b34da46	1373	Rovte
00050000-567b-cd91-e952-6b209759c2dc	2342	Ruše
00050000-567b-cd91-fd72-ebc6480ee30d	1282	Sava
00050000-567b-cd91-25c8-84ce3b03cbc9	6333	Sečovlje/Sicciole
00050000-567b-cd91-48ee-00594acc2c3e	4227	Selca
00050000-567b-cd91-d6f3-2223eec551ac	2352	Selnica ob Dravi
00050000-567b-cd91-508b-a0180b47bd3e	8333	Semič
00050000-567b-cd91-61da-1a220a041982	8281	Senovo
00050000-567b-cd91-a716-1ec4013ae8c1	6224	Senožeče
00050000-567b-cd91-df31-f9e661f6026e	8290	Sevnica
00050000-567b-cd91-6aa5-a49efcf7eba6	6210	Sežana
00050000-567b-cd91-23e4-235c930c1719	2214	Sladki Vrh
00050000-567b-cd91-dbe8-7162b9bf9b52	5283	Slap ob Idrijci
00050000-567b-cd91-053f-6ef9e576e7ad	2380	Slovenj Gradec
00050000-567b-cd91-51f8-4dc0b8090aef	2310	Slovenska Bistrica
00050000-567b-cd91-c0d5-70ec358d1cdd	3210	Slovenske Konjice
00050000-567b-cd91-dc45-bbd122046838	1216	Smlednik
00050000-567b-cd91-ae8c-9942661897e8	5232	Soča
00050000-567b-cd91-d93f-c5e33a746461	1317	Sodražica
00050000-567b-cd91-daae-6c62a78f5ca5	3335	Solčava
00050000-567b-cd91-cbe4-9b57e55519a1	5250	Solkan
00050000-567b-cd91-9706-f137c96baa48	4229	Sorica
00050000-567b-cd91-5483-b3527079f682	4225	Sovodenj
00050000-567b-cd91-71d0-489cb4f9bb7e	5281	Spodnja Idrija
00050000-567b-cd91-d87f-a2169eef28b8	2241	Spodnji Duplek
00050000-567b-cd91-93f1-4bfdb5f74001	9245	Spodnji Ivanjci
00050000-567b-cd91-1385-39e029281344	2277	Središče ob Dravi
00050000-567b-cd91-9a00-9e3adea4777a	4267	Srednja vas v Bohinju
00050000-567b-cd91-70db-865a0cb4c78d	8256	Sromlje 
00050000-567b-cd91-146e-e4f77af6c88a	5224	Srpenica
00050000-567b-cd91-295f-95977f3db395	1242	Stahovica
00050000-567b-cd91-6a1c-bf93cb5670f6	1332	Stara Cerkev
00050000-567b-cd91-d04f-90b3bd6e3ef3	8342	Stari trg ob Kolpi
00050000-567b-cd91-3bbd-81bb20c0baab	1386	Stari trg pri Ložu
00050000-567b-cd91-a39b-b08553a11d3f	2205	Starše
00050000-567b-cd91-0960-1055933f8c5c	2289	Stoperce
00050000-567b-cd91-845a-5bc99d881395	8322	Stopiče
00050000-567b-cd91-63a9-8e7e1d89da4e	3206	Stranice
00050000-567b-cd91-2acf-a9f4c0704bd5	8351	Straža
00050000-567b-cd91-c67c-cf9154c94e03	1313	Struge
00050000-567b-cd91-b60c-ae21f1dba151	8293	Studenec
00050000-567b-cd91-dad0-948baf25028d	8331	Suhor
00050000-567b-cd91-a34f-f9897f26358b	2233	Sv. Ana v Slovenskih goricah
00050000-567b-cd91-9706-a9587307a24b	2235	Sv. Trojica v Slovenskih goricah
00050000-567b-cd91-9897-1bec95c56c55	2353	Sveti Duh na Ostrem Vrhu
00050000-567b-cd91-4580-8bc0e9639755	9244	Sveti Jurij ob Ščavnici
00050000-567b-cd91-c7ce-3297f34937ce	3264	Sveti Štefan
00050000-567b-cd91-9fc0-196f1ef1fb6f	2258	Sveti Tomaž
00050000-567b-cd91-b245-6b3894693bb0	9204	Šalovci
00050000-567b-cd91-9f9c-8181c144d31d	5261	Šempas
00050000-567b-cd91-99ce-81f770a45449	5290	Šempeter pri Gorici
00050000-567b-cd91-4b0b-604540494a44	3311	Šempeter v Savinjski dolini
00050000-567b-cd91-b36e-782cbecba4df	4208	Šenčur
00050000-567b-cd91-a50e-d5b5bae6e5ed	2212	Šentilj v Slovenskih goricah
00050000-567b-cd91-1b48-0f9e6bb0d471	8297	Šentjanž
00050000-567b-cd91-bddd-0bc7406df666	2373	Šentjanž pri Dravogradu
00050000-567b-cd91-d2f5-6b65da60617e	8310	Šentjernej
00050000-567b-cd91-3984-dee60b545b94	3230	Šentjur
00050000-567b-cd91-11ff-dcc8c8127b9d	3271	Šentrupert
00050000-567b-cd91-fa59-90ad9719a12f	8232	Šentrupert
00050000-567b-cd91-de2f-a5c6933e81a8	1296	Šentvid pri Stični
00050000-567b-cd91-d360-0bd44442fd2f	8275	Škocjan
00050000-567b-cd91-190f-75d5fd858de2	6281	Škofije
00050000-567b-cd91-bd38-bea9bf151b25	4220	Škofja Loka
00050000-567b-cd91-c3ad-21c88f908499	3211	Škofja vas
00050000-567b-cd91-9a6d-666206705030	1291	Škofljica
00050000-567b-cd91-9469-5611b55d04b0	6274	Šmarje
00050000-567b-cd91-382f-0a9b41515994	1293	Šmarje - Sap
00050000-567b-cd91-f85e-28f9623c1718	3240	Šmarje pri Jelšah
00050000-567b-cd91-4928-18622964705e	8220	Šmarješke Toplice
00050000-567b-cd91-6976-0380885eb235	2315	Šmartno na Pohorju
00050000-567b-cd91-04aa-82894a0de9b8	3341	Šmartno ob Dreti
00050000-567b-cd91-6486-8956967b8d58	3327	Šmartno ob Paki
00050000-567b-cd91-6bd9-631c86b5b165	1275	Šmartno pri Litiji
00050000-567b-cd91-5b15-7daaab6963bd	2383	Šmartno pri Slovenj Gradcu
00050000-567b-cd91-f0d5-14910ee00d20	3201	Šmartno v Rožni dolini
00050000-567b-cd91-1c44-52cb6f986cc2	3325	Šoštanj
00050000-567b-cd91-4d77-7fb886fef3cc	6222	Štanjel
00050000-567b-cd91-c412-789c87b8b9e5	3220	Štore
00050000-567b-cd91-562a-21e0e1d0a25f	3304	Tabor
00050000-567b-cd91-678b-526e2b95c054	3221	Teharje
00050000-567b-cd91-c419-3d91f3569ace	9251	Tišina
00050000-567b-cd91-e8f3-c7c0bfd5799f	5220	Tolmin
00050000-567b-cd91-6c16-2cecc0f938c6	3326	Topolšica
00050000-567b-cd91-98ec-1592a5495437	2371	Trbonje
00050000-567b-cd91-ed4b-664dce8a44a8	1420	Trbovlje
00050000-567b-cd91-4799-8796fe011a71	8231	Trebelno 
00050000-567b-cd91-e836-812b33fc9c13	8210	Trebnje
00050000-567b-cd91-fad3-5c5d8a2ae05d	5252	Trnovo pri Gorici
00050000-567b-cd91-da35-3afce18471ce	2254	Trnovska vas
00050000-567b-cd91-daa6-c2867b4cf52c	1222	Trojane
00050000-567b-cd91-f9fc-47d106d3d26a	1236	Trzin
00050000-567b-cd91-56bc-8e43d5bad23a	4290	Tržič
00050000-567b-cd91-f5b0-84bc0f997c73	8295	Tržišče
00050000-567b-cd91-cf58-e85ad30b463b	1311	Turjak
00050000-567b-cd91-6d4d-e0aedef4fc0e	9224	Turnišče
00050000-567b-cd91-9666-bb4bf6c4d328	8323	Uršna sela
00050000-567b-cd91-b2d0-6bd06a139525	1252	Vače
00050000-567b-cd91-3ebe-a1c5610f542e	3320	Velenje 
00050000-567b-cd91-4c0f-1f1653804147	3322	Velenje - poštni predali
00050000-567b-cd91-808f-1c3d06470746	8212	Velika Loka
00050000-567b-cd91-71af-1ce916678718	2274	Velika Nedelja
00050000-567b-cd91-4bd4-ca23cbd5a7c6	9225	Velika Polana
00050000-567b-cd91-dcaf-98522630063a	1315	Velike Lašče
00050000-567b-cd91-3b33-bafcf75f3382	8213	Veliki Gaber
00050000-567b-cd91-92ef-054ce7d11054	9241	Veržej
00050000-567b-cd91-91bc-4a89c60b19d2	1312	Videm - Dobrepolje
00050000-567b-cd91-e9ec-82f6ffc1f076	2284	Videm pri Ptuju
00050000-567b-cd91-1173-0c387052567c	8344	Vinica
00050000-567b-cd91-430a-d2828578a143	5271	Vipava
00050000-567b-cd91-1d2e-2667501b8896	4212	Visoko
00050000-567b-cd91-ffd1-255728ee81dd	1294	Višnja Gora
00050000-567b-cd91-0d7c-ec2657d2d6b7	3205	Vitanje
00050000-567b-cd91-e172-bb1a86eb4535	2255	Vitomarci
00050000-567b-cd91-797b-4c3a2cd0bec9	1217	Vodice
00050000-567b-cd91-e974-1fdcd7321843	3212	Vojnik\t
00050000-567b-cd91-b696-22cb1c7e06e0	5293	Volčja Draga
00050000-567b-cd91-55f6-b7a5d920df51	2232	Voličina
00050000-567b-cd91-febe-5d0b4e10ee7b	3305	Vransko
00050000-567b-cd91-250a-cea0adbf79cc	6217	Vremski Britof
00050000-567b-cd91-a29b-a61994a2426b	1360	Vrhnika
00050000-567b-cd91-d0c3-e64cc9ec50ce	2365	Vuhred
00050000-567b-cd91-ff5b-719e1445040f	2367	Vuzenica
00050000-567b-cd91-5678-9448cffea7ec	8292	Zabukovje 
00050000-567b-cd91-2ea8-6e186a9f8fdd	1410	Zagorje ob Savi
00050000-567b-cd91-15a1-f3d90cec099d	1303	Zagradec
00050000-567b-cd91-d3e2-862871e38b8f	2283	Zavrč
00050000-567b-cd91-f492-035b3889be93	8272	Zdole 
00050000-567b-cd91-7de6-24ada4b2d7c8	4201	Zgornja Besnica
00050000-567b-cd91-485c-a83bbc79d8eb	2242	Zgornja Korena
00050000-567b-cd91-5ef4-0e445edee048	2201	Zgornja Kungota
00050000-567b-cd91-9ea9-d46920793234	2316	Zgornja Ložnica
00050000-567b-cd91-9807-a4122008eed8	2314	Zgornja Polskava
00050000-567b-cd91-d54d-24f420a3f7ba	2213	Zgornja Velka
00050000-567b-cd91-ca33-26bce709c4ed	4247	Zgornje Gorje
00050000-567b-cd91-9694-d94e4467859b	4206	Zgornje Jezersko
00050000-567b-cd91-faab-8f36de79a8e2	2285	Zgornji Leskovec
00050000-567b-cd91-816b-d704cefe964b	1432	Zidani Most
00050000-567b-cd91-015f-5a7d429d61ae	3214	Zreče
00050000-567b-cd91-5cb2-775e2f6abc4d	4209	Žabnica
00050000-567b-cd91-67a8-8b183fe6a1d4	3310	Žalec
00050000-567b-cd91-a65a-182b0785f4df	4228	Železniki
00050000-567b-cd91-741d-8ade6404c23a	2287	Žetale
00050000-567b-cd91-b437-5a88c68a2b90	4226	Žiri
00050000-567b-cd91-2f40-1f34096acbda	4274	Žirovnica
00050000-567b-cd91-4699-dc4c8320f6ba	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32893881)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32893445)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32893193)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-567b-cd94-430f-c3da45c3487b	00080000-567b-cd94-ae04-ceea59ab50f9	\N	00040000-567b-cd92-ef32-bfe9285705be	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-567b-cd94-fce0-8de1e39f9908	00080000-567b-cd94-ae04-ceea59ab50f9	\N	00040000-567b-cd92-ef32-bfe9285705be	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-567b-cd94-5079-9d94e16beaf6	00080000-567b-cd94-ed7a-dd6ae723e3b9	\N	00040000-567b-cd92-ef32-bfe9285705be	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32893337)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-567b-cd92-7d75-98afa80d8fdc	novo leto	1	1	\N	t
00430000-567b-cd92-7a72-95b4ea8694f2	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-567b-cd92-2ba9-c4568dc5c9c8	dan upora proti okupatorju	27	4	\N	t
00430000-567b-cd92-e356-e4048cf03377	praznik dela	1	5	\N	t
00430000-567b-cd92-3fc2-25720aa36e00	praznik dela	2	5	\N	t
00430000-567b-cd92-7a1f-3dee514ba411	dan Primoža Trubarja	8	6	\N	f
00430000-567b-cd92-e7f9-816f29652c82	dan državnosti	25	6	\N	t
00430000-567b-cd92-14a8-4b498e7cd4e0	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-567b-cd92-a9ac-956cde0e826f	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-567b-cd92-7b9e-05f9da078c67	dan suverenosti	25	10	\N	f
00430000-567b-cd92-d7b5-0d56b2522fa9	dan spomina na mrtve	1	11	\N	t
00430000-567b-cd92-c7d8-a56f0a9d1f12	dan Rudolfa Maistra	23	11	\N	f
00430000-567b-cd92-62b2-1e0f9fa5415f	božič	25	12	\N	t
00430000-567b-cd92-032b-768c51c0cb17	dan samostojnosti in enotnosti	26	12	\N	t
00430000-567b-cd92-4d76-45cc8e569a82	Marijino vnebovzetje	15	8	\N	t
00430000-567b-cd92-52c9-7d0c8a689419	dan reformacije	31	10	\N	t
00430000-567b-cd92-0a6d-d6f0208a7ab9	velikonočna nedelja	27	3	2016	t
00430000-567b-cd92-6b81-9e6e5b34260b	velikonočna nedelja	16	4	2017	t
00430000-567b-cd92-a5fa-da6752c46096	velikonočna nedelja	1	4	2018	t
00430000-567b-cd92-5465-b3db5b330d09	velikonočna nedelja	21	4	2019	t
00430000-567b-cd92-c6e5-0ab867e31a55	velikonočna nedelja	12	4	2020	t
00430000-567b-cd92-adbf-1689f761b8cb	velikonočna nedelja	4	4	2021	t
00430000-567b-cd92-1824-ad2e5f127def	velikonočna nedelja	17	4	2022	t
00430000-567b-cd92-9282-238b54079fa0	velikonočna nedelja	9	4	2023	t
00430000-567b-cd92-3fdb-cb1113d0b445	velikonočna nedelja	31	3	2024	t
00430000-567b-cd92-6581-39a6e2b9bb8d	velikonočna nedelja	20	4	2025	t
00430000-567b-cd92-372e-9b94b0575b47	velikonočna nedelja	5	4	2026	t
00430000-567b-cd92-b8e3-5cdc86f17081	velikonočna nedelja	28	3	2027	t
00430000-567b-cd92-4f0e-047ffbd33b01	velikonočna nedelja	16	4	2028	t
00430000-567b-cd92-f2fe-41888b686bb0	velikonočna nedelja	1	4	2029	t
00430000-567b-cd92-9d4f-c72dcdbedd62	velikonočna nedelja	21	4	2030	t
00430000-567b-cd92-83be-8548f4151317	velikonočni ponedeljek	28	3	2016	t
00430000-567b-cd92-cb2e-41b88e20d3a6	velikonočni ponedeljek	17	4	2017	t
00430000-567b-cd92-7cf3-297749cd405e	velikonočni ponedeljek	2	4	2018	t
00430000-567b-cd92-8947-29af37b126ea	velikonočni ponedeljek	22	4	2019	t
00430000-567b-cd92-ee67-210b21c13335	velikonočni ponedeljek	13	4	2020	t
00430000-567b-cd92-1a9c-5f5d97e375ae	velikonočni ponedeljek	5	4	2021	t
00430000-567b-cd92-3226-2369e6e50519	velikonočni ponedeljek	18	4	2022	t
00430000-567b-cd92-8d43-60f5323aa6d9	velikonočni ponedeljek	10	4	2023	t
00430000-567b-cd92-f712-2aebd660f319	velikonočni ponedeljek	1	4	2024	t
00430000-567b-cd92-8e5c-57c8422d98b5	velikonočni ponedeljek	21	4	2025	t
00430000-567b-cd92-df4c-255eaac9c0b7	velikonočni ponedeljek	6	4	2026	t
00430000-567b-cd92-d019-eee354b4a7e1	velikonočni ponedeljek	29	3	2027	t
00430000-567b-cd92-ac1a-155dbef67ebe	velikonočni ponedeljek	17	4	2028	t
00430000-567b-cd92-f221-70c697e63dc0	velikonočni ponedeljek	2	4	2029	t
00430000-567b-cd92-d871-7be34c3dd27a	velikonočni ponedeljek	22	4	2030	t
00430000-567b-cd92-6316-24043093bd18	binkoštna nedelja - binkošti	15	5	2016	t
00430000-567b-cd92-02b4-ef6afaa42d57	binkoštna nedelja - binkošti	4	6	2017	t
00430000-567b-cd92-4b9e-8c8b85c60f90	binkoštna nedelja - binkošti	20	5	2018	t
00430000-567b-cd92-9dd6-6dde45c0bee0	binkoštna nedelja - binkošti	9	6	2019	t
00430000-567b-cd92-6bfb-17ced007631a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-567b-cd92-4668-74f8381b33f0	binkoštna nedelja - binkošti	23	5	2021	t
00430000-567b-cd92-4e31-59f6bc358f4e	binkoštna nedelja - binkošti	5	6	2022	t
00430000-567b-cd92-92e3-d0d8d53aaadb	binkoštna nedelja - binkošti	28	5	2023	t
00430000-567b-cd92-362a-b35b1e245673	binkoštna nedelja - binkošti	19	5	2024	t
00430000-567b-cd92-7fa6-ba0c4886415f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-567b-cd92-189a-3f5dc5238273	binkoštna nedelja - binkošti	24	5	2026	t
00430000-567b-cd92-3d51-ce3435f2d826	binkoštna nedelja - binkošti	16	5	2027	t
00430000-567b-cd92-121a-c5c12b834df0	binkoštna nedelja - binkošti	4	6	2028	t
00430000-567b-cd92-779b-65946d5621e9	binkoštna nedelja - binkošti	20	5	2029	t
00430000-567b-cd92-a066-01c9d2d8e9a6	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32893297)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32893309)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32893457)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32893895)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32893905)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-567b-cd94-b775-ed01deadaa60	00080000-567b-cd94-d655-63f94fccb385	0987	AK
00190000-567b-cd94-878c-bd856c4437b2	00080000-567b-cd94-ed7a-dd6ae723e3b9	0989	AK
00190000-567b-cd94-99c5-69b5fbd5c31c	00080000-567b-cd94-8e7f-6bcdaa3a439a	0986	AK
00190000-567b-cd94-49fe-ac74f9a44dd6	00080000-567b-cd94-44f9-671dd111af8f	0984	AK
00190000-567b-cd94-3a4c-145f5cb22af1	00080000-567b-cd94-8e25-4fee697b78a6	0983	AK
00190000-567b-cd94-8c09-4b3ed7462457	00080000-567b-cd94-1182-75d0f0ada7da	0982	AK
00190000-567b-cd96-e935-8338792ae555	00080000-567b-cd96-cdae-6590b89c74c7	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32893794)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-567b-cd95-bc46-f68e5f4fd69b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32893913)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32893486)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-567b-cd94-f54a-58efa47d6ed4	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-567b-cd94-669f-0766e2b2da86	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-567b-cd94-aec6-b12217446857	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-567b-cd94-7703-54b5c9d78889	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-567b-cd94-2dc3-c5a690f0f306	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-567b-cd94-cc42-17d1944c8e5c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-567b-cd94-eb50-719cf3d243cb	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32893430)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32893420)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32893632)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32893562)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32893271)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32893033)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-567b-cd96-cdae-6590b89c74c7	00010000-567b-cd93-5f8b-3bee1c61699f	2015-12-24 11:48:54	INS	a:0:{}
2	App\\Entity\\Option	00000000-567b-cd96-b3f1-9003a6693809	00010000-567b-cd93-5f8b-3bee1c61699f	2015-12-24 11:48:54	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-567b-cd96-e935-8338792ae555	00010000-567b-cd93-5f8b-3bee1c61699f	2015-12-24 11:48:54	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32893499)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32893071)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-567b-cd92-a9d3-65d4716b0295	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-567b-cd92-7953-5b56e9afe972	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-567b-cd92-87e0-521fbba34a86	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-567b-cd92-4dff-00b7d0d56136	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-567b-cd92-41a3-d955d40dfcd2	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-567b-cd92-acdf-0eb33b5ddd33	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-567b-cd92-845c-707e0cc8dfcb	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-567b-cd92-eaed-438b770fcb5b	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-567b-cd92-6832-1345ab6cfcd6	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-567b-cd92-dfe8-56eb26ac5745	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-567b-cd92-3a67-008ea0df2a15	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-567b-cd92-8193-af8774bea69b	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-567b-cd92-8acb-f668c47b1dae	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-567b-cd92-862d-c7202b55aaec	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-567b-cd92-c196-49539d6309ec	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-567b-cd92-1bc1-b6973152f624	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-567b-cd92-4d6f-fa06bb9e4050	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-567b-cd92-80f4-864fc7523df4	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-567b-cd92-1a93-ad4eb8d4ceaf	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-567b-cd92-bfbc-34491b9e6d2a	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-567b-cd92-5e46-878209c1471d	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-567b-cd92-5722-c8b5edf20781	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-567b-cd92-1b28-4aa5eb7897ed	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-567b-cd92-b74b-d212abf01dd7	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-567b-cd92-549d-87058b81e6f5	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-567b-cd92-3c18-55a5919b69ed	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-567b-cd92-4153-23bc0820c856	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-567b-cd92-91e6-48984d801b94	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-567b-cd92-5758-ce984c349070	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-567b-cd92-ce24-06ddfc38c9d3	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-567b-cd92-e786-e87eb7beba36	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-567b-cd92-2526-c023baa36251	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-567b-cd92-5973-359c789b1025	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-567b-cd92-a0da-e0c70f20be30	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-567b-cd92-0657-2329423d4bac	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-567b-cd92-5e61-4972ac63618d	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-567b-cd92-5279-fdf8ea4e3e7f	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-567b-cd92-d7ec-4b9244967fb8	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-567b-cd92-6fee-a6f018fa99b6	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-567b-cd92-bd07-3a7e065024d9	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-567b-cd92-7614-2f49fff7da37	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-567b-cd92-1d1f-c5d97145a025	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-567b-cd92-1bb0-c6e73a086a68	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-567b-cd92-6f03-8ca486a84f5c	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-567b-cd92-b5d7-26faf5b98d78	direktor	minimalne pravice za direktorja	t
00020000-567b-cd92-3891-f9c6910d2442	arhivar	arhivar	t
00020000-567b-cd92-c5c8-17180da0d6b3	dramaturg	dramaturg	t
00020000-567b-cd92-7e4a-6bf17d4f3e80	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-567b-cd92-6357-4f3688ac9bd7	poslovni-sekretar	poslovni sekretar	t
00020000-567b-cd92-722f-ba182767f123	vodja-tehnike	vodja tehnike	t
00020000-567b-cd92-ba95-acc1979befa0	racunovodja	računovodja	t
00020000-567b-cd94-e002-989c2c784a96	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-567b-cd94-35cb-d2807780888a	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-96ba-fcaeb6431d95	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-a9b4-0568ebbc23d2	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-d920-285c7cdf5c12	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-2375-b31e8c49208b	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-6389-1a005a103636	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-ef43-3a3fc5dfa538	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-7b3c-fa0e4b9f6136	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-39b3-24fea5b658a0	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-c217-ca1d15071b16	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-0802-96b3ec7f49e3	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-41f3-6c6387fbc410	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-6ce6-d790552d7682	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-1290-7d9719453529	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-eb16-40d5df81c7ad	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-995f-e49eba75b618	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-eb4b-96560529ff30	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-45b7-1b76ea7c18ce	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-0026-821091355c7e	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-567b-cd94-384a-a12c859e48e2	Trr-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-20e2-91cfb7a1bdcb	Trr-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-efb0-38b4883421e7	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-f135-7fd800a77ca5	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-2f16-d41b7c608ffa	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-ba32-80e3a90f2774	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-9c35-d4fd80a2cee3	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-4b4d-4b16a719ab3c	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-7677-6decbc70ddf3	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-7d57-a844d5dd3702	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-4745-a5bd85232411	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-5b35-9c5d749f7655	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-f0f0-1e2bd5b5b487	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-46e8-e6f29dcdda8b	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-82a4-e174e062b9b0	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-d196-120c73edf39d	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-6022-668912c0b59d	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-315f-2a7ea6a30e1b	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-567b-cd94-c4a3-cd2ced538d76	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32893055)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-567b-cd93-60c9-ae8d3ec7240b	00020000-567b-cd92-87e0-521fbba34a86
00010000-567b-cd93-5f8b-3bee1c61699f	00020000-567b-cd92-87e0-521fbba34a86
00010000-567b-cd94-7645-3746fa510c07	00020000-567b-cd94-e002-989c2c784a96
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-35cb-d2807780888a
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-2375-b31e8c49208b
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-39b3-24fea5b658a0
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-0802-96b3ec7f49e3
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-6ce6-d790552d7682
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-45b7-1b76ea7c18ce
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-a9b4-0568ebbc23d2
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-384a-a12c859e48e2
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-f135-7fd800a77ca5
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-ba32-80e3a90f2774
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-4b4d-4b16a719ab3c
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-7d57-a844d5dd3702
00010000-567b-cd94-7157-3e7e869ee710	00020000-567b-cd94-46e8-e6f29dcdda8b
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-35cb-d2807780888a
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-96ba-fcaeb6431d95
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-a9b4-0568ebbc23d2
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-d920-285c7cdf5c12
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-6ce6-d790552d7682
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-995f-e49eba75b618
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-384a-a12c859e48e2
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-f135-7fd800a77ca5
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-ba32-80e3a90f2774
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-4b4d-4b16a719ab3c
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-7d57-a844d5dd3702
00010000-567b-cd94-cfab-25fba82a3fdc	00020000-567b-cd94-46e8-e6f29dcdda8b
00010000-567b-cd94-1d4f-ccdb2c77dc60	00020000-567b-cd94-35cb-d2807780888a
00010000-567b-cd94-1d4f-ccdb2c77dc60	00020000-567b-cd94-96ba-fcaeb6431d95
00010000-567b-cd94-1d4f-ccdb2c77dc60	00020000-567b-cd94-a9b4-0568ebbc23d2
00010000-567b-cd94-1d4f-ccdb2c77dc60	00020000-567b-cd94-d920-285c7cdf5c12
00010000-567b-cd94-1d4f-ccdb2c77dc60	00020000-567b-cd94-0802-96b3ec7f49e3
00010000-567b-cd94-1d4f-ccdb2c77dc60	00020000-567b-cd94-6ce6-d790552d7682
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-96ba-fcaeb6431d95
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-6389-1a005a103636
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-c217-ca1d15071b16
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-41f3-6c6387fbc410
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-0802-96b3ec7f49e3
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-eb4b-96560529ff30
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-6ce6-d790552d7682
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-1290-7d9719453529
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-384a-a12c859e48e2
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-20e2-91cfb7a1bdcb
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-f135-7fd800a77ca5
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-2f16-d41b7c608ffa
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-ba32-80e3a90f2774
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-9c35-d4fd80a2cee3
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-4b4d-4b16a719ab3c
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-7677-6decbc70ddf3
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-7d57-a844d5dd3702
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-4745-a5bd85232411
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-46e8-e6f29dcdda8b
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-82a4-e174e062b9b0
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-6022-668912c0b59d
00010000-567b-cd94-c10b-ee7d028547a2	00020000-567b-cd94-315f-2a7ea6a30e1b
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-96ba-fcaeb6431d95
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-6389-1a005a103636
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-7b3c-fa0e4b9f6136
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-c217-ca1d15071b16
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-41f3-6c6387fbc410
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-0802-96b3ec7f49e3
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-eb4b-96560529ff30
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-6ce6-d790552d7682
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-1290-7d9719453529
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-eb16-40d5df81c7ad
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-384a-a12c859e48e2
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-20e2-91cfb7a1bdcb
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-efb0-38b4883421e7
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-f135-7fd800a77ca5
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-2f16-d41b7c608ffa
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-ba32-80e3a90f2774
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-9c35-d4fd80a2cee3
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-4b4d-4b16a719ab3c
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-7677-6decbc70ddf3
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-7d57-a844d5dd3702
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-4745-a5bd85232411
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-46e8-e6f29dcdda8b
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-82a4-e174e062b9b0
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-d196-120c73edf39d
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-6022-668912c0b59d
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-315f-2a7ea6a30e1b
00010000-567b-cd94-4cd5-6a3146984dcf	00020000-567b-cd94-c4a3-cd2ced538d76
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-96ba-fcaeb6431d95
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-a9b4-0568ebbc23d2
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-6389-1a005a103636
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-ef43-3a3fc5dfa538
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-7b3c-fa0e4b9f6136
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-2375-b31e8c49208b
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-c217-ca1d15071b16
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-41f3-6c6387fbc410
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-0802-96b3ec7f49e3
00010000-567b-cd94-8a12-3d67801e03f5	00020000-567b-cd94-eb4b-96560529ff30
00010000-567b-cd94-7025-1c4055f77899	00020000-567b-cd94-35cb-d2807780888a
00010000-567b-cd94-7025-1c4055f77899	00020000-567b-cd94-d920-285c7cdf5c12
00010000-567b-cd94-7025-1c4055f77899	00020000-567b-cd94-2375-b31e8c49208b
00010000-567b-cd94-7025-1c4055f77899	00020000-567b-cd94-39b3-24fea5b658a0
00010000-567b-cd94-7025-1c4055f77899	00020000-567b-cd94-0802-96b3ec7f49e3
00010000-567b-cd94-7025-1c4055f77899	00020000-567b-cd94-6ce6-d790552d7682
00010000-567b-cd94-7025-1c4055f77899	00020000-567b-cd94-45b7-1b76ea7c18ce
00010000-567b-cd94-7025-1c4055f77899	00020000-567b-cd94-5b35-9c5d749f7655
00010000-567b-cd94-9bab-7cbebf9568a8	00020000-567b-cd94-0026-821091355c7e
00010000-567b-cd94-2e97-e258dc98ffcc	00020000-567b-cd92-b5d7-26faf5b98d78
00010000-567b-cd94-9da6-8ac789c8aab1	00020000-567b-cd92-3891-f9c6910d2442
00010000-567b-cd94-7b9e-31effd5136b9	00020000-567b-cd92-c5c8-17180da0d6b3
00010000-567b-cd94-7c87-b2afab1ff464	00020000-567b-cd92-7e4a-6bf17d4f3e80
00010000-567b-cd94-4781-754ab0c1cada	00020000-567b-cd92-6357-4f3688ac9bd7
00010000-567b-cd94-6af6-59daf4bab0d2	00020000-567b-cd92-722f-ba182767f123
00010000-567b-cd94-8eba-b823d99bde0e	00020000-567b-cd92-ba95-acc1979befa0
\.


--
-- TOC entry 3157 (class 0 OID 32893513)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32893451)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32893397)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-567b-cd94-94e1-fce7deede89a	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-567b-cd94-cf0b-6f58fc3ce7df	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-567b-cd94-e836-0a02ae241f06	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32893020)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-567b-cd91-f0be-3d9212edf844	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-567b-cd91-73e4-8cba3e6cd0fa	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-567b-cd91-76a3-9f05f3e5dfa6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-567b-cd91-64ba-5c01386974fc	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-567b-cd91-0dec-cc4c08698995	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32893012)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-567b-cd91-9897-c884c456be4f	00230000-567b-cd91-64ba-5c01386974fc	popa
00240000-567b-cd91-256b-2d8c0c6f2a92	00230000-567b-cd91-64ba-5c01386974fc	oseba
00240000-567b-cd91-08ad-7ac1744af6bd	00230000-567b-cd91-64ba-5c01386974fc	tippopa
00240000-567b-cd91-9b86-8d268f3e2b28	00230000-567b-cd91-64ba-5c01386974fc	organizacijskaenota
00240000-567b-cd91-41eb-031f479d5863	00230000-567b-cd91-64ba-5c01386974fc	sezona
00240000-567b-cd91-c61d-6609551add08	00230000-567b-cd91-64ba-5c01386974fc	tipvaje
00240000-567b-cd91-48cc-82f132f7cad2	00230000-567b-cd91-73e4-8cba3e6cd0fa	prostor
00240000-567b-cd91-f97d-05ce0e831f2f	00230000-567b-cd91-64ba-5c01386974fc	besedilo
00240000-567b-cd91-3ca4-aab1c34f9f93	00230000-567b-cd91-64ba-5c01386974fc	uprizoritev
00240000-567b-cd91-4a8c-1e675fcfe672	00230000-567b-cd91-64ba-5c01386974fc	funkcija
00240000-567b-cd91-21b3-bc023f9b7434	00230000-567b-cd91-64ba-5c01386974fc	tipfunkcije
00240000-567b-cd91-11a6-71f9a1c0ed10	00230000-567b-cd91-64ba-5c01386974fc	alternacija
00240000-567b-cd91-62d7-6ee5f1f70069	00230000-567b-cd91-f0be-3d9212edf844	pogodba
00240000-567b-cd91-1f07-4f6f259e17bd	00230000-567b-cd91-64ba-5c01386974fc	zaposlitev
00240000-567b-cd91-7d28-2f15310fc450	00230000-567b-cd91-64ba-5c01386974fc	zvrstuprizoritve
00240000-567b-cd91-9e29-bb905ed4064d	00230000-567b-cd91-f0be-3d9212edf844	programdela
00240000-567b-cd91-4983-816501c5dcd3	00230000-567b-cd91-64ba-5c01386974fc	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32893007)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
548f8d48-b142-46ea-bd39-eb18187e49f8	00240000-567b-cd91-9897-c884c456be4f	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32893579)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-567b-cd95-efb0-3e7c74422ba2	000e0000-567b-cd95-9788-08c1e7f591f7	00080000-567b-cd94-ae04-ceea59ab50f9	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-567b-cd92-c6c1-21231984bbee
00270000-567b-cd95-a17a-29e0985f3069	000e0000-567b-cd95-9788-08c1e7f591f7	00080000-567b-cd94-ae04-ceea59ab50f9	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-567b-cd92-c6c1-21231984bbee
\.


--
-- TOC entry 3122 (class 0 OID 32893155)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32893407)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-567b-cd95-2234-0474c211258e	00180000-567b-cd95-0f63-6c76a41e0931	000c0000-567b-cd95-04ae-67354927ee06	00090000-567b-cd94-6262-af008aef903b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567b-cd95-6abb-d1adcbc2fcf5	00180000-567b-cd95-0f63-6c76a41e0931	000c0000-567b-cd95-d8c7-f6ebb8a9a830	00090000-567b-cd94-70ce-a03df9136071	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567b-cd95-d13d-4fb725527565	00180000-567b-cd95-0f63-6c76a41e0931	000c0000-567b-cd95-7125-31d12b040f80	00090000-567b-cd94-d19a-60172ace9d15	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567b-cd95-fac9-7f4e1de45b8b	00180000-567b-cd95-0f63-6c76a41e0931	000c0000-567b-cd95-e185-b56b33ed3068	00090000-567b-cd94-7d41-1b435a224175	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567b-cd95-2f0d-cc9866fa22a3	00180000-567b-cd95-0f63-6c76a41e0931	000c0000-567b-cd95-27d6-a55ddf4e8114	00090000-567b-cd94-bc08-edfe688f0683	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567b-cd95-77ae-5ce4d0f7a32a	00180000-567b-cd95-cf32-e52cfe7deab8	\N	00090000-567b-cd94-bc08-edfe688f0683	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-567b-cd95-3f3a-aaa2b4ee5ea0	00180000-567b-cd95-cf32-e52cfe7deab8	\N	00090000-567b-cd94-70ce-a03df9136071	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32893620)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-567b-cd91-02b0-f50ec033018f	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-567b-cd91-9d88-2a271e0d5194	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-567b-cd91-0b4b-cde144aac023	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-567b-cd91-3ad3-ec6071bc27de	04	Režija	Režija	Režija	umetnik	30
000f0000-567b-cd91-1052-7c7985ccf765	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-567b-cd91-17d8-8500fe93f50a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-567b-cd91-403f-d0065d69ff4c	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-567b-cd91-6b31-99641355fc64	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-567b-cd91-8f46-92d6f1fb92a2	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-567b-cd91-1891-276e65cb9a61	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-567b-cd91-2967-413f45379b69	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-567b-cd91-50ec-a2616f770676	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-567b-cd91-76a5-89745bfb0c40	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-567b-cd91-2593-7870367a3003	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-567b-cd91-0d7d-5aed79c948e8	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-567b-cd91-82e5-8c781753c8de	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-567b-cd91-7865-977c641c5aa8	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-567b-cd91-74b9-3b32c6fda663	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32893106)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-567b-cd94-6571-fda5cb475cb5	0001	šola	osnovna ali srednja šola
00400000-567b-cd94-22c5-99f049c5008d	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-567b-cd94-9fca-2bdcfa174a2b	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32893925)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-567b-cd91-062f-e7ae5c083325	01	Velika predstava	f	1.00	1.00
002b0000-567b-cd91-0b79-7480c29904ab	02	Mala predstava	f	0.50	0.50
002b0000-567b-cd91-ce4a-9c42779852a2	03	Mala koprodukcija	t	0.40	1.00
002b0000-567b-cd91-d16b-49c055243023	04	Srednja koprodukcija	t	0.70	2.00
002b0000-567b-cd91-bcc7-d68e566980e2	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32893387)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-567b-cd91-328c-8479697e8956	0001	prva vaja	prva vaja
00420000-567b-cd91-87ea-5f6e8160ca7a	0002	tehnična vaja	tehnična vaja
00420000-567b-cd91-7ec5-09e9d44a4441	0003	lučna vaja	lučna vaja
00420000-567b-cd91-ce89-ca853cebf345	0004	kostumska vaja	kostumska vaja
00420000-567b-cd91-6619-a335513f1618	0005	foto vaja	foto vaja
00420000-567b-cd91-afaa-1f4de76e7b58	0006	1. glavna vaja	1. glavna vaja
00420000-567b-cd91-b22b-41c1b166a4ee	0007	2. glavna vaja	2. glavna vaja
00420000-567b-cd91-968c-b6010d77df88	0008	1. generalka	1. generalka
00420000-567b-cd91-3a04-10a11743350c	0009	2. generalka	2. generalka
00420000-567b-cd91-2d97-1d2631885e0d	0010	odprta generalka	odprta generalka
00420000-567b-cd91-df64-0f452237dee3	0011	obnovitvena vaja	obnovitvena vaja
00420000-567b-cd91-b3b4-0a5aa6afa73c	0012	italijanka	krajša "obnovitvena" vaja
00420000-567b-cd91-e27d-989e9f8a488e	0013	pevska vaja	pevska vaja
00420000-567b-cd91-1b6e-5b89b81f5c66	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-567b-cd91-6849-65b27459d17b	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32893228)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32893042)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-567b-cd93-5f8b-3bee1c61699f	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO52ZlGMmk3C6MfhSIWqlqmn0X4miB.UW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-567b-cd94-0afb-a32599212202	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-567b-cd94-9cdf-09599fbc56eb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-567b-cd94-7872-23b6be75d6aa	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-567b-cd94-d7b1-c82a87af5f8c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-567b-cd94-41b1-5f3a060875b3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-567b-cd94-68a1-d8aa84d1fc34	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-567b-cd94-9d28-a910ecf8f42a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-567b-cd94-47d1-dbb31b716a5f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-567b-cd94-5e95-2e276d58c058	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-567b-cd94-7645-3746fa510c07	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-567b-cd94-f554-7496d6946253	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-567b-cd94-7157-3e7e869ee710	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-567b-cd94-cfab-25fba82a3fdc	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-567b-cd94-1d4f-ccdb2c77dc60	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-567b-cd94-c10b-ee7d028547a2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-567b-cd94-4cd5-6a3146984dcf	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-567b-cd94-8a12-3d67801e03f5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-567b-cd94-7025-1c4055f77899	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-567b-cd94-9bab-7cbebf9568a8	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-567b-cd94-2e97-e258dc98ffcc	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-567b-cd94-9da6-8ac789c8aab1	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-567b-cd94-7b9e-31effd5136b9	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-567b-cd94-7c87-b2afab1ff464	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-567b-cd94-4781-754ab0c1cada	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-567b-cd94-6af6-59daf4bab0d2	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-567b-cd94-8eba-b823d99bde0e	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-567b-cd93-60c9-ae8d3ec7240b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32893670)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-567b-cd95-ffe7-df0794591a66	00160000-567b-cd94-5116-19d36c78a3f9	\N	00140000-567b-cd91-829a-0b4e4577acd6	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-567b-cd94-2dc3-c5a690f0f306
000e0000-567b-cd95-9788-08c1e7f591f7	00160000-567b-cd94-bac8-d81b637904a9	\N	00140000-567b-cd91-6b34-c673c102bc22	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-567b-cd94-cc42-17d1944c8e5c
000e0000-567b-cd95-398d-22984514bdd0	\N	\N	00140000-567b-cd91-6b34-c673c102bc22	00190000-567b-cd94-b775-ed01deadaa60	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-567b-cd94-2dc3-c5a690f0f306
000e0000-567b-cd95-d59f-8cb3c7abe3da	\N	\N	00140000-567b-cd91-6b34-c673c102bc22	00190000-567b-cd94-b775-ed01deadaa60	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-567b-cd94-2dc3-c5a690f0f306
000e0000-567b-cd95-c55f-08f2b61379f7	\N	\N	00140000-567b-cd91-6b34-c673c102bc22	00190000-567b-cd94-b775-ed01deadaa60	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-567b-cd94-f54a-58efa47d6ed4
000e0000-567b-cd95-e0fe-2fef4d85e664	\N	\N	00140000-567b-cd91-6b34-c673c102bc22	00190000-567b-cd94-b775-ed01deadaa60	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-567b-cd94-f54a-58efa47d6ed4
\.


--
-- TOC entry 3136 (class 0 OID 32893327)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-567b-cd95-38e7-3d57f361375a	\N	000e0000-567b-cd95-9788-08c1e7f591f7	1	
00200000-567b-cd95-c594-a5bdc9d5fdcb	\N	000e0000-567b-cd95-9788-08c1e7f591f7	2	
00200000-567b-cd95-4222-3923df817d4e	\N	000e0000-567b-cd95-9788-08c1e7f591f7	3	
00200000-567b-cd95-bbfa-2e44b6e81752	\N	000e0000-567b-cd95-9788-08c1e7f591f7	4	
00200000-567b-cd95-df11-ed0148ae11ba	\N	000e0000-567b-cd95-9788-08c1e7f591f7	5	
\.


--
-- TOC entry 3153 (class 0 OID 32893478)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32893593)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-567b-cd92-bbbf-ed65885b36b6	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-567b-cd92-57aa-edd78b60f981	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-567b-cd92-d1b8-7aa6fda31c13	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-567b-cd92-7a16-ef4354f25e40	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-567b-cd92-4b46-ece54f5c1916	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-567b-cd92-11af-c434da2888f2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-567b-cd92-6661-8934a0311e63	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-567b-cd92-f6dd-8e71c3ed9caf	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-567b-cd92-c6c1-21231984bbee	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-567b-cd92-9f96-067cfcc8bdbc	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-567b-cd92-398b-d2e2c98e91eb	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-567b-cd92-0bdf-9788cb7534e2	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-567b-cd92-e9bc-4fc1400cb2c0	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-567b-cd92-f1c4-dcc874a8fad8	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-567b-cd92-7275-a741e38e80f6	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-567b-cd92-f560-9bf66031dda7	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-567b-cd92-6b57-48f085a849b3	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-567b-cd92-1c42-5e075059fc85	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-567b-cd92-3ee3-3de50532d218	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-567b-cd92-fdac-d9ac93d308a1	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-567b-cd92-6019-74e775396233	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-567b-cd92-f63d-9bfda1fffc88	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-567b-cd92-84a1-9d7720fb4ebf	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-567b-cd92-f169-2ecbecb89072	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-567b-cd92-54a6-ba98e4d36faf	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-567b-cd92-fbdd-410dd830d5f8	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-567b-cd92-8363-c70a7faac332	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-567b-cd92-c366-435a21f9bafe	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32893975)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32893944)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32893987)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32893551)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-567b-cd94-5bad-8956afbc4a2a	00090000-567b-cd94-70ce-a03df9136071	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567b-cd94-f28d-8a910dc51fa5	00090000-567b-cd94-d19a-60172ace9d15	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567b-cd94-c96a-8b76ff0a9885	00090000-567b-cd94-6145-0ce67c5755a1	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567b-cd94-4415-86cd2194adb3	00090000-567b-cd94-75b8-d2a826ecf64d	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567b-cd94-404f-919501a22062	00090000-567b-cd94-f6af-093c0f7a0bc9	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567b-cd94-26d4-cd29837a9100	00090000-567b-cd94-8070-5e687d6906cb	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32893371)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32893660)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-567b-cd91-829a-0b4e4577acd6	01	Drama	drama (SURS 01)
00140000-567b-cd91-f9ad-0e58d692d9ec	02	Opera	opera (SURS 02)
00140000-567b-cd91-43ee-cbf04d6e7124	03	Balet	balet (SURS 03)
00140000-567b-cd91-054f-db6980db0579	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-567b-cd91-df95-139007e1800e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-567b-cd91-6b34-c673c102bc22	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-567b-cd91-f7d0-c773b0e1963d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32893541)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32893105)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32893719)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32893709)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32893096)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32893576)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32893618)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32894028)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32893359)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32893381)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32893386)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32893942)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32893254)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32893788)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32893537)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32893325)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32893292)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32893268)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32893443)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32894005)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32894012)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32894036)
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
-- TOC entry 2739 (class 2606 OID 32893470)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32893226)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32893124)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32893188)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32893151)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32893085)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32893070)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32893476)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32893512)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32893655)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32893179)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32893214)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32893893)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32893449)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32893204)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32893344)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32893313)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32893305)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32893461)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32893902)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32893910)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32893880)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32893923)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32893494)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32893434)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32893425)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32893642)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32893569)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32893280)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32893041)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32893503)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32893059)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32893079)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32893521)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32893456)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32893405)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32893029)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32893017)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32893011)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32893589)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32893160)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32893416)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32893629)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32893113)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32893935)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32893394)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32893239)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32893054)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32893688)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32893334)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32893484)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32893601)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32893985)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32893969)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32893993)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32893559)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32893375)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32893668)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32893549)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32893369)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32893370)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32893368)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32893367)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32893366)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32893590)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32893591)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32893592)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32894007)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32894006)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32893181)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32893182)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32893477)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32893973)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32893972)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32893974)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32893971)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32893970)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32893463)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32893462)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32893335)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32893336)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32893538)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32893540)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32893539)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32893270)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32893269)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32893924)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32893657)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32893658)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32893659)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32893994)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32893693)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32893690)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32893694)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32893692)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32893691)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32893241)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32893240)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32893154)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32893504)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32893086)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32893087)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32893524)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32893523)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32893522)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32893191)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32893190)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32893192)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32893308)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32893306)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32893307)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32893019)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32893429)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32893427)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32893426)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32893428)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32893060)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32893061)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32893485)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32894029)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32893578)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32893577)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32894037)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32894038)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32893450)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32893570)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32893571)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32893793)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32893792)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32893789)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32893790)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32893791)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32893206)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32893205)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32893207)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32893498)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32893497)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32893903)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32893904)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32893723)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32893724)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32893721)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32893722)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32893560)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32893561)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32893438)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32893437)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32893435)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32893436)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32893711)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32893710)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32893281)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32893295)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32893294)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32893293)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32893296)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32893326)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32893314)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32893315)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32893894)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32893943)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32894013)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32894014)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32893126)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32893125)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32893161)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32893162)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32893376)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32893419)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32893418)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32893417)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32893361)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32893362)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32893365)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32893360)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32893364)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32893363)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32893180)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32893114)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32893115)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32893255)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32893257)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32893256)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32893258)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32893444)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32893656)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32893689)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32893630)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32893631)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32893152)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32893153)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32893550)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32893030)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32893227)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32893189)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32893018)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32893936)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32893496)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32893495)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32893395)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32893396)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32893720)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32893215)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32893669)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32893986)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32893911)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32893912)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32893619)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32893406)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32893080)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 32894209)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 32894214)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 32894239)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 32894229)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 32894204)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 32894224)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 32894234)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 32894219)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 32894409)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32894414)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 32894419)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 32894584)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 32894579)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 32894094)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 32894099)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32894324)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 32894564)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32894559)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 32894569)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 32894554)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 32894549)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 32894319)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 32894314)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 32894194)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 32894199)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32894364)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32894374)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32894369)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 32894149)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 32894144)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32894304)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32894539)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 32894424)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32894429)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 32894434)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32894574)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 32894454)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 32894439)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 32894459)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32894449)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 32894444)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 32894139)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 32894134)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 32894079)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 32894074)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32894344)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 32894054)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 32894059)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 32894359)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32894354)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 32894349)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32894109)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 32894104)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 32894114)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 32894174)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 32894164)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32894169)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32894039)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 32894279)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 32894269)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 32894264)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 32894274)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 32894044)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 32894049)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32894329)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32894599)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 32894404)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 32894399)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 32894604)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 32894609)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32894309)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 32894389)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 32894394)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 32894514)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 32894509)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 32894494)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 32894499)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32894504)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32894124)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 32894119)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 32894129)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 32894339)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 32894334)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 32894524)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 32894529)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 32894484)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 32894489)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 32894474)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 32894479)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 32894379)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 32894384)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 32894299)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 32894294)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 32894284)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 32894289)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 32894469)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 32894464)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32894154)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32894159)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32894189)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 32894179)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 32894184)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32894519)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32894534)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32894544)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 32894589)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 32894594)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 32894069)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 32894064)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 32894084)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 32894089)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32894244)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 32894259)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32894254)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 32894249)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-24 11:48:56 CET

--
-- PostgreSQL database dump complete
--

