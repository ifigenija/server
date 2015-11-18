--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-18 16:19:01 CET

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
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 28404298)
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
-- TOC entry 237 (class 1259 OID 28404912)
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
-- TOC entry 236 (class 1259 OID 28404895)
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
-- TOC entry 182 (class 1259 OID 28404291)
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
-- TOC entry 181 (class 1259 OID 28404289)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 28404772)
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
-- TOC entry 230 (class 1259 OID 28404802)
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
-- TOC entry 251 (class 1259 OID 28405203)
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
-- TOC entry 203 (class 1259 OID 28404546)
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
-- TOC entry 205 (class 1259 OID 28404578)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 28404583)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 28405125)
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
-- TOC entry 194 (class 1259 OID 28404443)
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
-- TOC entry 238 (class 1259 OID 28404925)
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
-- TOC entry 223 (class 1259 OID 28404726)
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
-- TOC entry 200 (class 1259 OID 28404517)
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
-- TOC entry 197 (class 1259 OID 28404483)
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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 28404460)
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
-- TOC entry 212 (class 1259 OID 28404640)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 28405183)
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
-- TOC entry 250 (class 1259 OID 28405196)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 28405218)
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
-- TOC entry 216 (class 1259 OID 28404665)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 28404417)
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
-- TOC entry 185 (class 1259 OID 28404317)
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
-- TOC entry 189 (class 1259 OID 28404384)
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
-- TOC entry 186 (class 1259 OID 28404328)
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
-- TOC entry 178 (class 1259 OID 28404263)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 28404282)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 28404672)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 28404706)
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
-- TOC entry 233 (class 1259 OID 28404843)
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
-- TOC entry 188 (class 1259 OID 28404364)
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
-- TOC entry 191 (class 1259 OID 28404409)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 28405070)
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
-- TOC entry 213 (class 1259 OID 28404646)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 28404394)
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
-- TOC entry 202 (class 1259 OID 28404538)
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
-- TOC entry 198 (class 1259 OID 28404498)
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
-- TOC entry 199 (class 1259 OID 28404510)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 28404658)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 28405084)
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
-- TOC entry 242 (class 1259 OID 28405094)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 28404993)
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
-- TOC entry 243 (class 1259 OID 28405102)
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
-- TOC entry 219 (class 1259 OID 28404687)
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
-- TOC entry 211 (class 1259 OID 28404631)
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
-- TOC entry 210 (class 1259 OID 28404621)
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
-- TOC entry 232 (class 1259 OID 28404832)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 28404762)
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
-- TOC entry 196 (class 1259 OID 28404472)
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
-- TOC entry 175 (class 1259 OID 28404234)
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
-- TOC entry 174 (class 1259 OID 28404232)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 28404700)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 28404272)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 28404256)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 28404714)
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
-- TOC entry 214 (class 1259 OID 28404652)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 28404598)
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
-- TOC entry 173 (class 1259 OID 28404221)
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
-- TOC entry 172 (class 1259 OID 28404213)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 28404208)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 28404779)
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
-- TOC entry 187 (class 1259 OID 28404356)
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
-- TOC entry 209 (class 1259 OID 28404608)
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
-- TOC entry 231 (class 1259 OID 28404820)
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
-- TOC entry 184 (class 1259 OID 28404307)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 28405113)
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
-- TOC entry 207 (class 1259 OID 28404588)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 28404429)
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
-- TOC entry 176 (class 1259 OID 28404243)
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
-- TOC entry 235 (class 1259 OID 28404870)
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
-- TOC entry 201 (class 1259 OID 28404528)
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
-- TOC entry 218 (class 1259 OID 28404679)
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
-- TOC entry 229 (class 1259 OID 28404793)
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
-- TOC entry 247 (class 1259 OID 28405163)
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
-- TOC entry 246 (class 1259 OID 28405132)
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
-- TOC entry 248 (class 1259 OID 28405175)
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
-- TOC entry 225 (class 1259 OID 28404751)
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
-- TOC entry 204 (class 1259 OID 28404572)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 28404860)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 28404741)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 28404294)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 28404237)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 28404298)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-564c-96e0-2852-1a80c3b916e0	10	30	Otroci	Abonma za otroke	200
000a0000-564c-96e0-809f-2d0f1f084f53	20	60	Mladina	Abonma za mladino	400
000a0000-564c-96e0-7652-5296179ebf9c	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 28404912)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-564c-96e1-cbd7-b5dcee086b2e	000d0000-564c-96e1-7f45-216e2f6cf4e5	\N	00090000-564c-96e1-4f62-06a0ee8aeb1e	000b0000-564c-96e1-956d-fe6026d402cd	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-564c-96e1-7b06-d3bd4280e947	000d0000-564c-96e1-0b80-e559444d80f3	00100000-564c-96e1-ce4d-22618e92fd3a	00090000-564c-96e1-3d8a-778595f97da3	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-564c-96e1-2b43-89e464e55a32	000d0000-564c-96e1-7164-0f699a11f5b5	00100000-564c-96e1-20ad-4109c04c0626	00090000-564c-96e1-2921-74d01e5fc665	\N	0003	t	\N	2015-11-18	\N	2	t	\N	f	f
000c0000-564c-96e1-843c-3ab47a4d03cc	000d0000-564c-96e1-7a52-23be44c3de12	\N	00090000-564c-96e1-bd28-1a8e7829fd8b	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-564c-96e1-b8f8-942c9adae7b9	000d0000-564c-96e1-38da-4106223d086f	\N	00090000-564c-96e1-5874-860ca064baea	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-564c-96e1-a1d7-3a3bfa814147	000d0000-564c-96e1-8c23-48f058eeef9b	\N	00090000-564c-96e1-9619-b4ce2148b0a9	000b0000-564c-96e1-9531-1818cd11c81d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-564c-96e1-be03-886517d34571	000d0000-564c-96e1-ef0d-910597f5fc5d	00100000-564c-96e1-5ef6-f1a06e1fe06e	00090000-564c-96e1-7c53-5aa63a87f4cd	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-564c-96e1-bd17-94dcb8eadd61	000d0000-564c-96e1-8616-1e8ff73bb265	\N	00090000-564c-96e1-84a6-16c52acb9105	000b0000-564c-96e1-83ab-bee46e4a1b4b	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-564c-96e1-d25e-7c97c9e7f5a4	000d0000-564c-96e1-ef0d-910597f5fc5d	00100000-564c-96e1-41fe-5267d9a14843	00090000-564c-96e1-3c35-3e9767a6f4aa	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-564c-96e1-fbcf-0aec19af2590	000d0000-564c-96e1-ef0d-910597f5fc5d	00100000-564c-96e1-c8f9-bcdc8f1b6b9e	00090000-564c-96e1-856a-c7f032eece1c	\N	0010	t	\N	2015-11-18	\N	16	f	\N	f	t
000c0000-564c-96e1-fa64-f3d17105a2af	000d0000-564c-96e1-ef0d-910597f5fc5d	00100000-564c-96e1-0ba8-4c08b78d0ba5	00090000-564c-96e1-3385-17ca000edd7d	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-564c-96e1-252c-c3072b204a80	000d0000-564c-96e1-8ceb-5051e895b08c	00100000-564c-96e1-ce4d-22618e92fd3a	00090000-564c-96e1-3d8a-778595f97da3	000b0000-564c-96e1-c3f8-e71e6ca84c1a	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 28404895)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 28404291)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3149 (class 0 OID 28404772)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-564c-96e1-ae54-0e4bb8ee7f53	00160000-564c-96e0-9d9a-0e4e998c35c2	00090000-564c-96e1-9248-7869558d3398	aizv	10	t
003d0000-564c-96e1-7a94-c2a721c7b862	00160000-564c-96e0-9d9a-0e4e998c35c2	00090000-564c-96e1-7a10-770572df2245	apri	14	t
003d0000-564c-96e1-a39a-e0b61c1504d1	00160000-564c-96e0-895a-78bc3885eb45	00090000-564c-96e1-2828-edd17a9a8c89	aizv	11	t
003d0000-564c-96e1-109d-8a0a2af4e274	00160000-564c-96e0-1479-763fc568bcb0	00090000-564c-96e1-d0cb-8b01b4bb4d1e	aizv	12	t
003d0000-564c-96e1-37f3-c7027c15c86b	00160000-564c-96e0-9d9a-0e4e998c35c2	00090000-564c-96e1-b28d-0d69f2147f18	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 28404802)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-564c-96e0-9d9a-0e4e998c35c2	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-564c-96e0-895a-78bc3885eb45	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-564c-96e0-1479-763fc568bcb0	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 28405203)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 28404546)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-564c-96e1-e451-ae09bb5fdfca	\N	\N	00200000-564c-96e1-3732-eebcdd8e9f16	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-564c-96e1-b89b-938fb94723bd	\N	\N	00200000-564c-96e1-26ae-319e1b63b15a	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-564c-96e1-f1c5-ae730e93e016	\N	\N	00200000-564c-96e1-6046-2b68859f0174	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-564c-96e1-4c0e-ff488598787b	\N	\N	00200000-564c-96e1-ecff-459f66407b62	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-564c-96e1-831f-52fee3be14f8	\N	\N	00200000-564c-96e1-cfbe-85ef5aaf9d4d	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 28404578)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 28404583)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 28405125)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 28404443)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-564c-96de-485b-deb6bd4ed38b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-564c-96de-2335-c04101642454	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-564c-96de-fc07-c7be93754043	AL	ALB	008	Albania 	Albanija	\N
00040000-564c-96de-b98e-6fe6fe239117	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-564c-96de-9526-de274ccc7110	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-564c-96de-185a-9dc331f4ddea	AD	AND	020	Andorra 	Andora	\N
00040000-564c-96de-b9e6-17cb68a7f53a	AO	AGO	024	Angola 	Angola	\N
00040000-564c-96de-abcc-adf3a7657bb3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-564c-96de-997f-532b7eeb50b3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-564c-96de-e431-7a1d381d1c08	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-564c-96de-2564-1414c9f257b0	AR	ARG	032	Argentina 	Argenitna	\N
00040000-564c-96de-5cd0-db0b43589932	AM	ARM	051	Armenia 	Armenija	\N
00040000-564c-96de-ba02-bef561c44968	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-564c-96de-8084-fa0f376e7df6	AU	AUS	036	Australia 	Avstralija	\N
00040000-564c-96de-5bc5-4446578e40e8	AT	AUT	040	Austria 	Avstrija	\N
00040000-564c-96de-d460-1d7a4451f309	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-564c-96de-1f20-88581a177821	BS	BHS	044	Bahamas 	Bahami	\N
00040000-564c-96de-5e84-c61731c6043e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-564c-96de-fd1d-66b6e159d366	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-564c-96de-7c20-a86de61c004b	BB	BRB	052	Barbados 	Barbados	\N
00040000-564c-96de-c971-795929d4b8f6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-564c-96de-0371-54593c3010d4	BE	BEL	056	Belgium 	Belgija	\N
00040000-564c-96de-33cb-ac45aa41f0a1	BZ	BLZ	084	Belize 	Belize	\N
00040000-564c-96de-e671-e027a4e2b9d4	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-564c-96de-92fe-ca22582dbcf4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-564c-96de-175f-f28359c94ffa	BT	BTN	064	Bhutan 	Butan	\N
00040000-564c-96de-7e1f-ca384bf36581	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-564c-96de-66a6-8008da09cade	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-564c-96de-3ee8-758034762b4d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-564c-96de-04e8-86db3596e7a4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-564c-96de-20b6-80b4ff1332f9	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-564c-96de-4074-2136f3d338bb	BR	BRA	076	Brazil 	Brazilija	\N
00040000-564c-96de-6402-45a5839775b6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-564c-96de-dbf5-e9cb15fd03de	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-564c-96de-76c5-66ffc434f58f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-564c-96de-6f1a-c344b4b3f5c0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-564c-96de-0a44-571bca7ead50	BI	BDI	108	Burundi 	Burundi 	\N
00040000-564c-96de-cbd1-4121d2f5c47a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-564c-96de-302d-d4851c85d418	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-564c-96de-e43d-ffa11845094a	CA	CAN	124	Canada 	Kanada	\N
00040000-564c-96de-7ec5-792ccfc31074	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-564c-96de-ec53-81cd400ea004	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-564c-96de-81c1-9ef78b803bbe	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-564c-96de-97b5-219284957cca	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-564c-96de-3486-e714c1d8b6ac	CL	CHL	152	Chile 	Čile	\N
00040000-564c-96de-5aa8-742810199b3c	CN	CHN	156	China 	Kitajska	\N
00040000-564c-96de-4273-3b8b0d5ab325	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-564c-96de-b50b-802ea869ea41	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-564c-96de-7f7f-0e088a89dd80	CO	COL	170	Colombia 	Kolumbija	\N
00040000-564c-96de-4274-547209b1dfc6	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-564c-96de-ca64-99c27aa930dc	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-564c-96de-fc7d-9233602cf519	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-564c-96de-827a-a1b51c5923ca	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-564c-96de-e6ce-dcb8984042dc	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-564c-96de-b3a8-3050e1d23c48	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-564c-96de-9556-4d525a9e971d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-564c-96de-d3c8-45abefc7de18	CU	CUB	192	Cuba 	Kuba	\N
00040000-564c-96de-514d-23a9d9de0cad	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-564c-96de-4566-b7b3d5fb93b9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-564c-96de-15be-b5a4bb0defc2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-564c-96de-c5b8-02dacae158be	DK	DNK	208	Denmark 	Danska	\N
00040000-564c-96de-02c6-1b7766b61df0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-564c-96de-de7e-5ccf300795ab	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-564c-96de-db7f-9573cc05f348	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-564c-96de-70d5-6965bd5bbfae	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-564c-96de-e138-9f739e1d5dce	EG	EGY	818	Egypt 	Egipt	\N
00040000-564c-96de-86b3-28ed2588a5a6	SV	SLV	222	El Salvador 	Salvador	\N
00040000-564c-96de-ac5d-06c4509c41f8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-564c-96de-8f8c-890aac3e726c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-564c-96de-e988-92c725bf8cf8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-564c-96de-3422-759aa2a11c05	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-564c-96de-2aed-f813f9876551	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-564c-96de-641f-173d684dc76a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-564c-96de-21d2-582d5a1f954c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-564c-96de-4a3c-d4646ea849ed	FI	FIN	246	Finland 	Finska	\N
00040000-564c-96de-bee4-2bbbcd1ec040	FR	FRA	250	France 	Francija	\N
00040000-564c-96de-fdc2-53ca41628dfa	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-564c-96de-b44b-748200ddf7ba	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-564c-96de-a14c-d9fdfe0ce909	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-564c-96de-1097-5986045fda1d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-564c-96de-3cdc-bf7288bba202	GA	GAB	266	Gabon 	Gabon	\N
00040000-564c-96de-bf65-d41a82d24a16	GM	GMB	270	Gambia 	Gambija	\N
00040000-564c-96de-4ee0-ee4244e1973f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-564c-96de-85f1-4b5d3cb6669b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-564c-96de-8b61-2e0434f51a98	GH	GHA	288	Ghana 	Gana	\N
00040000-564c-96de-5eab-03e1396cd1a3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-564c-96de-fc95-47e0f24b2729	GR	GRC	300	Greece 	Grčija	\N
00040000-564c-96de-19c4-2093d123cdea	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-564c-96de-a92e-e52129197ef6	GD	GRD	308	Grenada 	Grenada	\N
00040000-564c-96de-a02f-08608f6f747c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-564c-96de-d3ff-c2cf12452d05	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-564c-96de-f932-fee751b06da6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-564c-96de-f151-7ccb035e4109	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-564c-96de-0177-0b1dc34999c0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-564c-96de-f63e-c75fe004342f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-564c-96de-435a-839189b15cf8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-564c-96de-6b76-16b5831259f4	HT	HTI	332	Haiti 	Haiti	\N
00040000-564c-96de-aa6c-0bb5792a4dfd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-564c-96de-c27e-400bad8b787f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-564c-96de-1a83-99aeca235546	HN	HND	340	Honduras 	Honduras	\N
00040000-564c-96de-3e5b-ac0124e6c6bd	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-564c-96de-e2ab-6d23290026bb	HU	HUN	348	Hungary 	Madžarska	\N
00040000-564c-96de-fcb8-6acf213f4a2d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-564c-96de-d08e-6f0abb0ee55a	IN	IND	356	India 	Indija	\N
00040000-564c-96de-c451-f74672c24bc9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-564c-96de-7506-36960ee16cbe	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-564c-96de-d294-9438b6b68944	IQ	IRQ	368	Iraq 	Irak	\N
00040000-564c-96de-3dac-02f3eb3268f9	IE	IRL	372	Ireland 	Irska	\N
00040000-564c-96de-fd27-5b8ff1f38e64	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-564c-96de-108c-6fbb3d935479	IL	ISR	376	Israel 	Izrael	\N
00040000-564c-96de-420c-4503665e6b26	IT	ITA	380	Italy 	Italija	\N
00040000-564c-96de-a09b-8addf2dfeca3	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-564c-96de-0d35-c458d75caebe	JP	JPN	392	Japan 	Japonska	\N
00040000-564c-96de-20b1-040681dc6dd8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-564c-96de-80c1-22f6f8cad310	JO	JOR	400	Jordan 	Jordanija	\N
00040000-564c-96de-7397-300f35a58674	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-564c-96de-972d-caa4b4c8a77c	KE	KEN	404	Kenya 	Kenija	\N
00040000-564c-96de-a1a4-ff53da93a8df	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-564c-96de-f39c-7a35b698557c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-564c-96de-979f-3b8e45b93388	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-564c-96de-fe80-2f7f1646bc9f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-564c-96de-a6f0-fdaa6a57047c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-564c-96de-a630-7d6a36cd2315	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-564c-96de-654d-e3dda78c75bd	LV	LVA	428	Latvia 	Latvija	\N
00040000-564c-96de-97b1-d498e0af630d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-564c-96de-09f2-d2fab7d53ff9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-564c-96de-afcc-8193ba9dd8d3	LR	LBR	430	Liberia 	Liberija	\N
00040000-564c-96de-22a0-deb2b10e51d5	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-564c-96de-a6bf-d427053a1c96	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-564c-96de-68bf-3df72bc28632	LT	LTU	440	Lithuania 	Litva	\N
00040000-564c-96de-221a-2f6df4b72bb8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-564c-96de-a952-3ceaa52b7eea	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-564c-96de-ae12-a9b77dc8e84d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-564c-96de-5a23-58ced07564f6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-564c-96de-a578-59af75e09755	MW	MWI	454	Malawi 	Malavi	\N
00040000-564c-96de-d760-d4176637a90c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-564c-96de-ca5e-d7e95f7c20c0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-564c-96de-98fb-474b7cef1ab0	ML	MLI	466	Mali 	Mali	\N
00040000-564c-96de-2d25-d54415464266	MT	MLT	470	Malta 	Malta	\N
00040000-564c-96de-2a00-3acbd422c53a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-564c-96de-e8d2-df4c9e49965c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-564c-96de-5185-69d6e5f4a80b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-564c-96de-6599-334bb10a5750	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-564c-96de-5f24-d1afb51fc218	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-564c-96de-a494-bebaee1b1e98	MX	MEX	484	Mexico 	Mehika	\N
00040000-564c-96de-7136-2f7f468e3157	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-564c-96de-8cb1-a7cf190467f8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-564c-96de-4000-c51285844a69	MC	MCO	492	Monaco 	Monako	\N
00040000-564c-96de-9b54-f383189bf526	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-564c-96de-a4e1-a7a8dc376d0d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-564c-96de-5d49-8c1e91f07c3f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-564c-96de-9a37-86e746943108	MA	MAR	504	Morocco 	Maroko	\N
00040000-564c-96de-d5bc-664b8aabb0ef	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-564c-96de-558a-aae9b4a3fe45	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-564c-96de-aaf4-c0741d109eca	NA	NAM	516	Namibia 	Namibija	\N
00040000-564c-96de-115e-621a43a8d264	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-564c-96de-172b-36b55d3124db	NP	NPL	524	Nepal 	Nepal	\N
00040000-564c-96de-dbea-0ca07ad3321b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-564c-96de-dacf-00dfa48118be	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-564c-96de-f141-41d617d58333	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-564c-96de-dd2a-a2e8a3dfff9f	NE	NER	562	Niger 	Niger 	\N
00040000-564c-96de-5884-d8b2a4ef2b10	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-564c-96de-3d09-2bf6587dfe6a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-564c-96de-da97-a1e41364fcdd	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-564c-96de-d708-3538864cd5cd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-564c-96de-7cfc-a9fe3aaccf82	NO	NOR	578	Norway 	Norveška	\N
00040000-564c-96de-3e7b-e4287e29349a	OM	OMN	512	Oman 	Oman	\N
00040000-564c-96de-f320-7f0856575f99	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-564c-96de-a46d-7565b7f9791d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-564c-96de-977b-58439dec7a80	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-564c-96de-ea6b-0aa533edc3e6	PA	PAN	591	Panama 	Panama	\N
00040000-564c-96de-0d55-17feb4b330d4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-564c-96de-5822-e87a9226779f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-564c-96de-3e00-0a4aeb1c9869	PE	PER	604	Peru 	Peru	\N
00040000-564c-96de-604b-18d68fd7108b	PH	PHL	608	Philippines 	Filipini	\N
00040000-564c-96de-4c8f-c85125fe2b9b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-564c-96de-6ec0-4bc5ba51163d	PL	POL	616	Poland 	Poljska	\N
00040000-564c-96de-cc77-79b2fd61c4d2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-564c-96de-4dbc-66b5794f58a7	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-564c-96de-ea31-f18736e34dc7	QA	QAT	634	Qatar 	Katar	\N
00040000-564c-96de-2b59-ad9de00c2cdf	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-564c-96de-1ade-487c8abea5f1	RO	ROU	642	Romania 	Romunija	\N
00040000-564c-96de-7eae-43cabf24a991	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-564c-96de-5a72-ec27478ef375	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-564c-96de-3b7f-128a13633a17	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-564c-96de-5d70-1a83ce86e96b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-564c-96de-1643-0af42ee23fed	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-564c-96de-77a8-dcdc4b396059	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-564c-96de-8693-96cd41226664	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-564c-96de-3eac-18605bf4b07b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-564c-96de-6d00-aa854ad6a858	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-564c-96de-809b-cb9dde914721	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-564c-96de-cb39-18c5631db48d	SM	SMR	674	San Marino 	San Marino	\N
00040000-564c-96de-760b-a30171be2a18	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-564c-96de-60a4-22a76095bc6a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-564c-96de-80d8-c250ee3b0efd	SN	SEN	686	Senegal 	Senegal	\N
00040000-564c-96de-e52b-c519cff7cb04	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-564c-96de-a665-ac5de5165e7a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-564c-96de-f229-9e01c3b028b0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-564c-96de-43f3-5d4b25cb4f29	SG	SGP	702	Singapore 	Singapur	\N
00040000-564c-96de-8b44-c708663a4e34	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-564c-96de-5ed5-c1d3e2a059ff	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-564c-96de-3cd5-e97b97c6f891	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-564c-96de-191a-bf271aae1761	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-564c-96de-c658-3a9f3c078545	SO	SOM	706	Somalia 	Somalija	\N
00040000-564c-96de-357b-339437b3c92d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-564c-96de-48a9-e5fda5064ac8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-564c-96de-7162-8155789504ca	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-564c-96de-055f-d269285e5c85	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-564c-96de-ee4c-1caccc71fd96	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-564c-96de-e167-2646b99bd0f8	SD	SDN	729	Sudan 	Sudan	\N
00040000-564c-96de-2ea3-ab8fcf78430a	SR	SUR	740	Suriname 	Surinam	\N
00040000-564c-96de-c517-39f941ce8976	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-564c-96de-30b2-44bcbaad4f7a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-564c-96de-21da-c03b9b28fffa	SE	SWE	752	Sweden 	Švedska	\N
00040000-564c-96de-96c0-a4ada7a7711b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-564c-96de-6940-7dcdd38d17ca	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-564c-96de-cbf9-706f7cda122f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-564c-96de-af8c-b08c7ea987c9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-564c-96de-afaf-a2ebb9f16afb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-564c-96de-ee93-d298e56bd4e4	TH	THA	764	Thailand 	Tajska	\N
00040000-564c-96de-e835-ab611786a2df	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-564c-96de-5327-701a5d42586a	TG	TGO	768	Togo 	Togo	\N
00040000-564c-96de-b0c8-eb31a4f4f015	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-564c-96de-f1f2-f3ee6810f14a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-564c-96de-67cb-aa6ef992834c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-564c-96de-8d99-899492e86a03	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-564c-96de-1367-023af508e5dd	TR	TUR	792	Turkey 	Turčija	\N
00040000-564c-96de-7884-f6d5f5d318b9	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-564c-96de-449f-7b00f34ad679	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564c-96de-0ceb-1d554b048e1f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-564c-96de-7d99-ba0542f01be0	UG	UGA	800	Uganda 	Uganda	\N
00040000-564c-96de-9eca-27d79ca25246	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-564c-96de-e468-adc1f4844bf2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-564c-96de-cef8-5c1f952c2bdf	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-564c-96de-5fdf-891eddcd39a1	US	USA	840	United States 	Združene države Amerike	\N
00040000-564c-96de-fcf1-1a97b6f7a0f7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-564c-96de-91d2-4fd693e7227a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-564c-96de-7f0c-181a4e8db2c2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-564c-96de-c8cc-8a10e92aad94	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-564c-96de-931d-9a0ab754c0a8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-564c-96de-6124-677c7ea519f6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-564c-96de-f05c-69babc398c05	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564c-96de-a3bb-80227a03f846	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-564c-96de-1cf4-8517acec9710	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-564c-96de-e18b-202d93b32da9	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-564c-96de-afa8-bbec2c428458	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-564c-96de-dd5f-acf2a53fe7ae	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-564c-96de-6935-1a0bc7faef5b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 28404925)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-564c-96e1-7033-819faab6e42c	000e0000-564c-96e1-2a1b-153b16e4aea7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564c-96de-fc99-4db0e5f4fc25	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564c-96e1-927c-b46cdf53f1cc	000e0000-564c-96e1-53a9-f5690158d722	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564c-96de-76fe-4d2cdc224348	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564c-96e1-dedd-8885a502cae4	000e0000-564c-96e1-0b95-88e3c1307013	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564c-96de-fc99-4db0e5f4fc25	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564c-96e1-ac07-b88eaad6efb6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564c-96e1-9f07-ad48ec40fbf7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 28404726)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-564c-96e1-ef0d-910597f5fc5d	000e0000-564c-96e1-53a9-f5690158d722	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-564c-96de-be70-218fdbb2b75a
000d0000-564c-96e1-7f45-216e2f6cf4e5	000e0000-564c-96e1-53a9-f5690158d722	000c0000-564c-96e1-cbd7-b5dcee086b2e	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-564c-96de-be70-218fdbb2b75a
000d0000-564c-96e1-0b80-e559444d80f3	000e0000-564c-96e1-53a9-f5690158d722	000c0000-564c-96e1-7b06-d3bd4280e947	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-564c-96de-c970-8446c0023c0c
000d0000-564c-96e1-7164-0f699a11f5b5	000e0000-564c-96e1-53a9-f5690158d722	000c0000-564c-96e1-2b43-89e464e55a32	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-564c-96de-9832-5846a556c1c7
000d0000-564c-96e1-7a52-23be44c3de12	000e0000-564c-96e1-53a9-f5690158d722	000c0000-564c-96e1-843c-3ab47a4d03cc	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-564c-96de-0540-38a82244fee0
000d0000-564c-96e1-38da-4106223d086f	000e0000-564c-96e1-53a9-f5690158d722	000c0000-564c-96e1-b8f8-942c9adae7b9	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-564c-96de-0540-38a82244fee0
000d0000-564c-96e1-8c23-48f058eeef9b	000e0000-564c-96e1-53a9-f5690158d722	000c0000-564c-96e1-a1d7-3a3bfa814147	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-564c-96de-be70-218fdbb2b75a
000d0000-564c-96e1-8616-1e8ff73bb265	000e0000-564c-96e1-53a9-f5690158d722	000c0000-564c-96e1-bd17-94dcb8eadd61	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-564c-96de-6b79-b844ca4b24c2
000d0000-564c-96e1-8ceb-5051e895b08c	000e0000-564c-96e1-53a9-f5690158d722	000c0000-564c-96e1-252c-c3072b204a80	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-564c-96de-e3f6-25ef5c78898b
\.


--
-- TOC entry 3122 (class 0 OID 28404517)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 28404483)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 28404460)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-564c-96e1-c16b-9513b6493708	00080000-564c-96e1-9224-f588a053942c	00090000-564c-96e1-856a-c7f032eece1c	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 28404640)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 28405183)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-564c-96e1-9942-09aa2cec3274	00010000-564c-96df-4238-4133a10733d9	\N	Prva mapa	Root mapa	2015-11-18 16:18:57	2015-11-18 16:18:57	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 28405196)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 28405218)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 25231831)
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
-- TOC entry 3138 (class 0 OID 28404665)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 28404417)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-564c-96df-d947-f5f30f831f3a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-564c-96df-5167-f4e2e38020c7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-564c-96df-1a4a-8e5ba3d99958	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-564c-96df-a181-d1608ebe9a57	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-564c-96df-7c7e-934d7990bd2f	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-564c-96df-7f5e-3740fc6c3ee3	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-564c-96df-dfa3-dad68374e583	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-564c-96df-2405-57e5cd80eb91	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564c-96df-8e9f-49097cb39b8d	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564c-96df-6365-becf13e3b3b4	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-564c-96df-7611-659ee7e779d4	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-564c-96df-4a76-94f599cc7f6c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-564c-96df-3610-4ab77b42bb1a	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-564c-96df-5f39-27ffc3d62345	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-564c-96e0-08b7-438e85517755	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-564c-96e0-d7a2-879506117d53	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-564c-96e0-41e2-a2292e19f6bf	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-564c-96e0-1fc1-c44339d3ee9f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-564c-96e0-6d5e-bb2fd28656fe	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-564c-96e3-438e-782d1b392fe3	application.tenant.maticnopodjetje	string	s:36:"00080000-564c-96e3-a040-2c94b6fba31f";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 28404317)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-564c-96e0-8a2e-4409b4c186c1	00000000-564c-96e0-08b7-438e85517755	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-564c-96e0-2294-7064224cdacd	00000000-564c-96e0-08b7-438e85517755	00010000-564c-96df-4238-4133a10733d9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-564c-96e0-dfb4-05c9cf066cbb	00000000-564c-96e0-d7a2-879506117d53	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 28404384)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-564c-96e1-0bcd-9f59d39587c4	\N	00100000-564c-96e1-ce4d-22618e92fd3a	00100000-564c-96e1-20ad-4109c04c0626	01	Gledališče Nimbis
00410000-564c-96e1-d076-d76db887b741	00410000-564c-96e1-0bcd-9f59d39587c4	00100000-564c-96e1-ce4d-22618e92fd3a	00100000-564c-96e1-20ad-4109c04c0626	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 28404328)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-564c-96e1-4f62-06a0ee8aeb1e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-564c-96e1-bd28-1a8e7829fd8b	00010000-564c-96e0-d9f3-c62a7d0c05bb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-564c-96e1-2921-74d01e5fc665	00010000-564c-96e0-5391-af4f05aa1936	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-564c-96e1-3c35-3e9767a6f4aa	00010000-564c-96e0-51ca-a4458523e397	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-564c-96e1-0d4b-dbcd16f5a7be	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-564c-96e1-9619-b4ce2148b0a9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-564c-96e1-3385-17ca000edd7d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-564c-96e1-7c53-5aa63a87f4cd	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-564c-96e1-856a-c7f032eece1c	00010000-564c-96e0-8f65-6408a3d21bfb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-564c-96e1-3d8a-778595f97da3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-564c-96e1-daaa-d74963294aea	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564c-96e1-5874-860ca064baea	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-564c-96e1-84a6-16c52acb9105	00010000-564c-96e0-ac3f-38f4615d765c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564c-96e1-9248-7869558d3398	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-96e1-7a10-770572df2245	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-96e1-2828-edd17a9a8c89	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-96e1-d0cb-8b01b4bb4d1e	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564c-96e1-b28d-0d69f2147f18	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564c-96e1-9f06-9708a07d7b1f	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-96e1-b3cd-8dc95f1da604	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-564c-96e1-cdf9-ac138ddb4cae	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 28404263)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-564c-96de-350c-ad4b1e069de4	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-564c-96de-94cd-800d253dec68	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-564c-96de-b7fe-2cb5f9d901d1	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-564c-96de-7c08-af1560ed81d0	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-564c-96de-3066-f926e1f7d7c4	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-564c-96de-984f-5f1c710e6185	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-564c-96de-0e29-36b7d28261cb	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-564c-96de-9deb-7caadbbcdc1c	Abonma-read	Abonma - branje	t
00030000-564c-96de-ea4f-d8e3b0b430b0	Abonma-write	Abonma - spreminjanje	t
00030000-564c-96de-f3bf-a757ff3b7249	Alternacija-read	Alternacija - branje	t
00030000-564c-96de-fe5d-c75ac20b49fe	Alternacija-write	Alternacija - spreminjanje	t
00030000-564c-96de-6c69-daa5a2913f15	Arhivalija-read	Arhivalija - branje	t
00030000-564c-96de-111f-0e2a35c1b45a	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-564c-96de-7d59-e9cd99dd3c02	AuthStorage-read	AuthStorage - branje	t
00030000-564c-96de-47f6-508e7d949184	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-564c-96de-fa48-a6d2bda97596	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-564c-96de-bd4f-21d85957640a	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-564c-96de-8214-77974a1ac7fc	Besedilo-read	Besedilo - branje	t
00030000-564c-96de-a99e-e4836099daab	Besedilo-write	Besedilo - spreminjanje	t
00030000-564c-96de-9e6f-d6dfc97ea4ca	Dogodek-read	Dogodek - branje	t
00030000-564c-96de-8bc9-aadc51946938	Dogodek-write	Dogodek - spreminjanje	t
00030000-564c-96de-1064-8a714c3c0318	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-564c-96de-88ee-8949aade6d95	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-564c-96de-4904-556a86049339	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-564c-96de-8b3c-de293121e191	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-564c-96de-80ae-68ea46d7447a	DogodekTrait-read	DogodekTrait - branje	t
00030000-564c-96de-d86d-74c381797e66	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-564c-96de-f57d-1e50afd0b1d7	DrugiVir-read	DrugiVir - branje	t
00030000-564c-96de-1c6a-3776a5eb3aad	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-564c-96de-a56d-52e8b6f7768a	Drzava-read	Drzava - branje	t
00030000-564c-96de-2bb0-de0d7637933b	Drzava-write	Drzava - spreminjanje	t
00030000-564c-96de-60c5-9b24d33b224c	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-564c-96de-4a00-df216b36f331	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-564c-96de-8738-91510a9d3048	Funkcija-read	Funkcija - branje	t
00030000-564c-96de-90e1-5e22cfa0100e	Funkcija-write	Funkcija - spreminjanje	t
00030000-564c-96de-db49-274247577f05	Gostovanje-read	Gostovanje - branje	t
00030000-564c-96de-32bf-34446de8a6ec	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-564c-96de-34ed-6f9b859e5c26	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-564c-96de-1754-85f1a6b4f7f5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-564c-96de-557b-c5796ee8f6d2	Kupec-read	Kupec - branje	t
00030000-564c-96de-205c-c10dead0270d	Kupec-write	Kupec - spreminjanje	t
00030000-564c-96de-2a26-8e5527c5085e	NacinPlacina-read	NacinPlacina - branje	t
00030000-564c-96de-94e5-72f87813c94c	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-564c-96de-c68f-069a35dafa7b	Option-read	Option - branje	t
00030000-564c-96de-b15a-e43ba5627c07	Option-write	Option - spreminjanje	t
00030000-564c-96de-0e7a-008d6e882e03	OptionValue-read	OptionValue - branje	t
00030000-564c-96de-9057-47c6ae3f7dde	OptionValue-write	OptionValue - spreminjanje	t
00030000-564c-96de-097a-70f65d02e7ef	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-564c-96de-6ff4-a4bd22cafb0c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-564c-96de-cfee-d7f898d033de	Oseba-read	Oseba - branje	t
00030000-564c-96de-7cda-4bcd790b8de1	Oseba-write	Oseba - spreminjanje	t
00030000-564c-96de-363e-2177a8974a6a	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-564c-96de-a5f9-f07cf20fa7ee	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-564c-96de-8bd6-6c677686c2b6	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-564c-96de-0557-971536d28fce	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-564c-96de-f5ba-562df2b560c6	Pogodba-read	Pogodba - branje	t
00030000-564c-96de-71b8-68890cdab2c7	Pogodba-write	Pogodba - spreminjanje	t
00030000-564c-96de-02b2-eddfe2445836	Popa-read	Popa - branje	t
00030000-564c-96de-faf0-efa007ed1bdc	Popa-write	Popa - spreminjanje	t
00030000-564c-96de-ce83-950a2bc0a098	Posta-read	Posta - branje	t
00030000-564c-96de-12a2-c985b1bf74b8	Posta-write	Posta - spreminjanje	t
00030000-564c-96de-ba80-bd33358bcac4	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-564c-96de-340d-a65a382e3138	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-564c-96de-7f67-d336fcc5ef45	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-564c-96de-6f6c-733ad6bb2c13	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-564c-96de-5307-7e91c1b8ab4a	PostniNaslov-read	PostniNaslov - branje	t
00030000-564c-96de-0a09-bbcc7a6316a4	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-564c-96de-cfcc-333083d66737	Praznik-read	Praznik - branje	t
00030000-564c-96de-8cc7-0663263e0b50	Praznik-write	Praznik - spreminjanje	t
00030000-564c-96de-b5de-652264d4676b	Predstava-read	Predstava - branje	t
00030000-564c-96de-15dc-ab14ef29b821	Predstava-write	Predstava - spreminjanje	t
00030000-564c-96de-0196-ab8e2e664e2c	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-564c-96de-f84e-fc8a0b5e8002	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-564c-96de-de07-4584991ac14d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-564c-96de-ef3d-f4c78998dcae	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-564c-96de-db14-0acd06b75657	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-564c-96de-5e09-0fd86ef3989a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-564c-96de-aaa6-a6a64e589a9f	ProgramDela-read	ProgramDela - branje	t
00030000-564c-96de-1d5e-bb861b61c9d2	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-564c-96de-930f-bfca427f6643	ProgramFestival-read	ProgramFestival - branje	t
00030000-564c-96de-da66-de292e0386f4	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-564c-96de-ec48-0a98fa2b3d9c	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-564c-96de-4244-369371a76353	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-564c-96de-b4a3-4d9e8998380b	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-564c-96de-2247-01370f205b11	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-564c-96de-59d4-7be99699f947	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-564c-96de-7149-b2a95fe2ae38	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-564c-96de-ebca-13703e603fcd	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-564c-96de-aaaa-8dc46efc4c3b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-564c-96de-a173-2cc1e268c884	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-564c-96de-e887-20bee5c60a64	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-564c-96de-d611-52ec4c7d5c7d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-564c-96de-b1c8-57cfda074982	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-564c-96de-6df8-4d825bc8fb9c	ProgramRazno-read	ProgramRazno - branje	t
00030000-564c-96de-9ead-da53c27143f3	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-564c-96de-1180-362035c1410b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-564c-96de-7641-6ce2e19ec784	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-564c-96de-f495-a3f517c00c4b	Prostor-read	Prostor - branje	t
00030000-564c-96de-104b-9508317f82a1	Prostor-write	Prostor - spreminjanje	t
00030000-564c-96de-3c1f-e531a8f44ec5	Racun-read	Racun - branje	t
00030000-564c-96de-2084-1fde11ec8fe2	Racun-write	Racun - spreminjanje	t
00030000-564c-96de-e77d-97c069266018	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-564c-96de-dc7f-d055ff7a5b7f	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-564c-96de-7bd4-ec7464a10978	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-564c-96de-ee09-3530a9dc24cc	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-564c-96de-2518-888230f426a9	Rekvizit-read	Rekvizit - branje	t
00030000-564c-96de-8d6a-4403a8b9497e	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-564c-96de-618c-863b0266349d	Revizija-read	Revizija - branje	t
00030000-564c-96de-8e10-6c43efef0eb1	Revizija-write	Revizija - spreminjanje	t
00030000-564c-96de-72f7-32386b0f52db	Rezervacija-read	Rezervacija - branje	t
00030000-564c-96de-3cf1-a4a2900f4340	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-564c-96de-668f-4b0b7d134a2e	SedezniRed-read	SedezniRed - branje	t
00030000-564c-96de-8b35-0866ae7a6da3	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-564c-96de-8462-3cd9f7031c39	Sedez-read	Sedez - branje	t
00030000-564c-96de-e4e4-0d5e2986f59a	Sedez-write	Sedez - spreminjanje	t
00030000-564c-96de-07c5-771b9032f703	Sezona-read	Sezona - branje	t
00030000-564c-96de-c33d-f961760f7b49	Sezona-write	Sezona - spreminjanje	t
00030000-564c-96de-0d0a-68eb3a45200e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-564c-96de-d8e1-3d2e7ee1da49	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-564c-96de-5bff-31957e21e8e9	Stevilcenje-read	Stevilcenje - branje	t
00030000-564c-96de-a977-766074147743	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-564c-96de-3284-977718d17e90	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-564c-96de-65fb-2cdddd00ca23	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-564c-96de-624d-0ba3bf7eae87	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-564c-96de-d6ef-4fa583578743	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-564c-96de-e9a1-66dff889f0c4	Telefonska-read	Telefonska - branje	t
00030000-564c-96de-11b4-946150b845b7	Telefonska-write	Telefonska - spreminjanje	t
00030000-564c-96de-10c1-5a41594b82b7	TerminStoritve-read	TerminStoritve - branje	t
00030000-564c-96de-58d9-34c0f3b3adb1	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-564c-96de-1634-df7bcdd1b4a4	TipFunkcije-read	TipFunkcije - branje	t
00030000-564c-96de-a600-d1f88e61823e	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-564c-96de-292d-8fb58421d685	TipPopa-read	TipPopa - branje	t
00030000-564c-96de-8765-05798f1c7ce3	TipPopa-write	TipPopa - spreminjanje	t
00030000-564c-96de-11e5-ad3b6555dc62	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-564c-96de-8ed8-5d694b5cfa50	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-564c-96de-813f-8b7d5a916f5c	TipVaje-read	TipVaje - branje	t
00030000-564c-96de-e461-a077684ec7d3	TipVaje-write	TipVaje - spreminjanje	t
00030000-564c-96de-b74a-de97abb44dd7	Trr-read	Trr - branje	t
00030000-564c-96de-2b56-2d4bc5bbbd3f	Trr-write	Trr - spreminjanje	t
00030000-564c-96de-44cb-bea40d1303df	Uprizoritev-read	Uprizoritev - branje	t
00030000-564c-96de-7ab1-ed7770808bc2	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-564c-96de-cddc-4b6f568ccab3	Vaja-read	Vaja - branje	t
00030000-564c-96de-a3b5-dbbb65228953	Vaja-write	Vaja - spreminjanje	t
00030000-564c-96de-b716-3558e272d478	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-564c-96de-932b-513b60eaeb85	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-564c-96de-43c1-582edbe90c1f	VrstaStroska-read	VrstaStroska - branje	t
00030000-564c-96de-c584-cb944f72394b	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-564c-96de-c4b5-97e778ea9906	Zaposlitev-read	Zaposlitev - branje	t
00030000-564c-96de-486d-64a1a4704876	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-564c-96de-d9f4-c78a6f1e9e16	Zasedenost-read	Zasedenost - branje	t
00030000-564c-96de-e4ca-77abf30f2d0e	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-564c-96de-920f-67b235b77c79	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-564c-96de-989b-3217f304d9bc	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-564c-96de-1d75-a8428b5d7925	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-564c-96de-5339-753ce7996a1c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-564c-96de-7ed7-d73b4ced1fcd	Job-read	Branje opravil - samo zase - branje	t
00030000-564c-96de-2030-a70be782e223	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-564c-96de-85bd-a210740ad88b	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-564c-96de-2d73-85e0af168f71	Report-read	Report - branje	t
00030000-564c-96de-161d-802024d51cb2	Report-write	Report - spreminjanje	t
00030000-564c-96de-3752-cace601a84fe	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-564c-96de-37dc-265f9f1d6ec1	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-564c-96de-2a5c-45c60e1ff90e	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-564c-96de-cc13-7d7997591163	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-564c-96de-e713-fc78780739ec	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-564c-96de-0049-0a294475f9e4	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-564c-96de-c639-a5bb11179873	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-564c-96de-c21a-ec39a6629760	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-564c-96de-b2e9-4068b90e4e78	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564c-96de-3563-9dba27285070	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564c-96de-a169-90ef8f39784f	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-564c-96de-fd21-d08cb432dfe1	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-564c-96de-2915-0d25fb2fad3c	Datoteka-write	Datoteka - spreminjanje	t
00030000-564c-96de-f06d-48c2f7adb3d5	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 28404282)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-564c-96de-d5a7-a35c16b7f76f	00030000-564c-96de-94cd-800d253dec68
00020000-564c-96de-6d67-8297ade1f4ce	00030000-564c-96de-a56d-52e8b6f7768a
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-9deb-7caadbbcdc1c
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-ea4f-d8e3b0b430b0
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-f3bf-a757ff3b7249
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-fe5d-c75ac20b49fe
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-6c69-daa5a2913f15
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-9e6f-d6dfc97ea4ca
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-7c08-af1560ed81d0
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-8bc9-aadc51946938
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-a56d-52e8b6f7768a
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-2bb0-de0d7637933b
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-8738-91510a9d3048
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-90e1-5e22cfa0100e
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-db49-274247577f05
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-32bf-34446de8a6ec
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-34ed-6f9b859e5c26
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-1754-85f1a6b4f7f5
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-c68f-069a35dafa7b
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-0e7a-008d6e882e03
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-cfee-d7f898d033de
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-7cda-4bcd790b8de1
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-02b2-eddfe2445836
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-faf0-efa007ed1bdc
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-ce83-950a2bc0a098
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-12a2-c985b1bf74b8
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-5307-7e91c1b8ab4a
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-0a09-bbcc7a6316a4
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-b5de-652264d4676b
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-15dc-ab14ef29b821
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-db14-0acd06b75657
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-5e09-0fd86ef3989a
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-f495-a3f517c00c4b
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-104b-9508317f82a1
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-7bd4-ec7464a10978
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-ee09-3530a9dc24cc
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-2518-888230f426a9
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-8d6a-4403a8b9497e
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-07c5-771b9032f703
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-c33d-f961760f7b49
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-1634-df7bcdd1b4a4
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-44cb-bea40d1303df
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-7ab1-ed7770808bc2
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-cddc-4b6f568ccab3
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-a3b5-dbbb65228953
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-d9f4-c78a6f1e9e16
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-e4ca-77abf30f2d0e
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-920f-67b235b77c79
00020000-564c-96de-3740-948d9a259059	00030000-564c-96de-1d75-a8428b5d7925
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-9deb-7caadbbcdc1c
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-6c69-daa5a2913f15
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-9e6f-d6dfc97ea4ca
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-a56d-52e8b6f7768a
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-db49-274247577f05
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-34ed-6f9b859e5c26
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-1754-85f1a6b4f7f5
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-c68f-069a35dafa7b
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-0e7a-008d6e882e03
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-cfee-d7f898d033de
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-7cda-4bcd790b8de1
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-02b2-eddfe2445836
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-ce83-950a2bc0a098
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-5307-7e91c1b8ab4a
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-0a09-bbcc7a6316a4
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-b5de-652264d4676b
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-f495-a3f517c00c4b
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-7bd4-ec7464a10978
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-2518-888230f426a9
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-07c5-771b9032f703
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-e9a1-66dff889f0c4
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-11b4-946150b845b7
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-b74a-de97abb44dd7
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-2b56-2d4bc5bbbd3f
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-c4b5-97e778ea9906
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-486d-64a1a4704876
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-920f-67b235b77c79
00020000-564c-96de-bf79-a29b2ac04325	00030000-564c-96de-1d75-a8428b5d7925
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-9deb-7caadbbcdc1c
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-f3bf-a757ff3b7249
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-6c69-daa5a2913f15
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-111f-0e2a35c1b45a
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-8214-77974a1ac7fc
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-1064-8a714c3c0318
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-9e6f-d6dfc97ea4ca
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-a56d-52e8b6f7768a
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-8738-91510a9d3048
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-db49-274247577f05
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-34ed-6f9b859e5c26
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-c68f-069a35dafa7b
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-0e7a-008d6e882e03
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-cfee-d7f898d033de
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-02b2-eddfe2445836
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-ce83-950a2bc0a098
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-b5de-652264d4676b
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-db14-0acd06b75657
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-f495-a3f517c00c4b
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-7bd4-ec7464a10978
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-2518-888230f426a9
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-07c5-771b9032f703
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-1634-df7bcdd1b4a4
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-cddc-4b6f568ccab3
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-d9f4-c78a6f1e9e16
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-920f-67b235b77c79
00020000-564c-96de-cef9-9e718661b9c2	00030000-564c-96de-1d75-a8428b5d7925
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-9deb-7caadbbcdc1c
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-ea4f-d8e3b0b430b0
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-fe5d-c75ac20b49fe
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-6c69-daa5a2913f15
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-9e6f-d6dfc97ea4ca
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-a56d-52e8b6f7768a
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-db49-274247577f05
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-c68f-069a35dafa7b
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-0e7a-008d6e882e03
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-02b2-eddfe2445836
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-ce83-950a2bc0a098
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-b5de-652264d4676b
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-f495-a3f517c00c4b
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-7bd4-ec7464a10978
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-2518-888230f426a9
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-07c5-771b9032f703
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-1634-df7bcdd1b4a4
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-920f-67b235b77c79
00020000-564c-96de-4c51-47f8b25b7664	00030000-564c-96de-1d75-a8428b5d7925
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-9deb-7caadbbcdc1c
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-6c69-daa5a2913f15
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-9e6f-d6dfc97ea4ca
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-a56d-52e8b6f7768a
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-db49-274247577f05
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-c68f-069a35dafa7b
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-0e7a-008d6e882e03
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-02b2-eddfe2445836
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-ce83-950a2bc0a098
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-b5de-652264d4676b
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-f495-a3f517c00c4b
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-7bd4-ec7464a10978
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-2518-888230f426a9
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-07c5-771b9032f703
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-10c1-5a41594b82b7
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-b7fe-2cb5f9d901d1
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-1634-df7bcdd1b4a4
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-920f-67b235b77c79
00020000-564c-96de-1e71-d2442c1bf72f	00030000-564c-96de-1d75-a8428b5d7925
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-350c-ad4b1e069de4
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-94cd-800d253dec68
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-9deb-7caadbbcdc1c
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-ea4f-d8e3b0b430b0
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-f3bf-a757ff3b7249
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-fe5d-c75ac20b49fe
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-6c69-daa5a2913f15
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-111f-0e2a35c1b45a
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-fa48-a6d2bda97596
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-bd4f-21d85957640a
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8214-77974a1ac7fc
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-a99e-e4836099daab
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-1064-8a714c3c0318
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-88ee-8949aade6d95
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-9e6f-d6dfc97ea4ca
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-7c08-af1560ed81d0
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8bc9-aadc51946938
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-f57d-1e50afd0b1d7
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-1c6a-3776a5eb3aad
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-a56d-52e8b6f7768a
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-2bb0-de0d7637933b
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-60c5-9b24d33b224c
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-4a00-df216b36f331
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8738-91510a9d3048
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-90e1-5e22cfa0100e
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-db49-274247577f05
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-32bf-34446de8a6ec
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-34ed-6f9b859e5c26
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-1754-85f1a6b4f7f5
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-557b-c5796ee8f6d2
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-205c-c10dead0270d
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-2a26-8e5527c5085e
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-94e5-72f87813c94c
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-c68f-069a35dafa7b
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-0e7a-008d6e882e03
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-9057-47c6ae3f7dde
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-b15a-e43ba5627c07
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-097a-70f65d02e7ef
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-6ff4-a4bd22cafb0c
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-cfee-d7f898d033de
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-3066-f926e1f7d7c4
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-7cda-4bcd790b8de1
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-363e-2177a8974a6a
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-a5f9-f07cf20fa7ee
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8bd6-6c677686c2b6
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-0557-971536d28fce
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-f5ba-562df2b560c6
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-71b8-68890cdab2c7
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-02b2-eddfe2445836
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-faf0-efa007ed1bdc
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-ce83-950a2bc0a098
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-ba80-bd33358bcac4
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-340d-a65a382e3138
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-7f67-d336fcc5ef45
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-6f6c-733ad6bb2c13
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-12a2-c985b1bf74b8
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-5307-7e91c1b8ab4a
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-0a09-bbcc7a6316a4
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-cfcc-333083d66737
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8cc7-0663263e0b50
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-b5de-652264d4676b
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-15dc-ab14ef29b821
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-0196-ab8e2e664e2c
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-f84e-fc8a0b5e8002
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-de07-4584991ac14d
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-ef3d-f4c78998dcae
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-db14-0acd06b75657
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-5e09-0fd86ef3989a
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-984f-5f1c710e6185
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-aaa6-a6a64e589a9f
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-0e29-36b7d28261cb
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-1d5e-bb861b61c9d2
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-930f-bfca427f6643
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-da66-de292e0386f4
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-ec48-0a98fa2b3d9c
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-4244-369371a76353
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-b4a3-4d9e8998380b
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-2247-01370f205b11
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-59d4-7be99699f947
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-7149-b2a95fe2ae38
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-ebca-13703e603fcd
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-aaaa-8dc46efc4c3b
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-a173-2cc1e268c884
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-e887-20bee5c60a64
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-d611-52ec4c7d5c7d
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-b1c8-57cfda074982
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-6df8-4d825bc8fb9c
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-9ead-da53c27143f3
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-1180-362035c1410b
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-7641-6ce2e19ec784
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-f495-a3f517c00c4b
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-104b-9508317f82a1
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-3c1f-e531a8f44ec5
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-2084-1fde11ec8fe2
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-e77d-97c069266018
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-dc7f-d055ff7a5b7f
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-7bd4-ec7464a10978
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-ee09-3530a9dc24cc
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-2518-888230f426a9
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8d6a-4403a8b9497e
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-618c-863b0266349d
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8e10-6c43efef0eb1
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-72f7-32386b0f52db
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-3cf1-a4a2900f4340
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-668f-4b0b7d134a2e
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8b35-0866ae7a6da3
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8462-3cd9f7031c39
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-e4e4-0d5e2986f59a
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-07c5-771b9032f703
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-c33d-f961760f7b49
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-0d0a-68eb3a45200e
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-d8e1-3d2e7ee1da49
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-5bff-31957e21e8e9
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-3284-977718d17e90
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-65fb-2cdddd00ca23
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-a977-766074147743
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-624d-0ba3bf7eae87
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-d6ef-4fa583578743
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-e9a1-66dff889f0c4
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-11b4-946150b845b7
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-10c1-5a41594b82b7
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-b7fe-2cb5f9d901d1
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-58d9-34c0f3b3adb1
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-1634-df7bcdd1b4a4
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-a600-d1f88e61823e
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-292d-8fb58421d685
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8765-05798f1c7ce3
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-11e5-ad3b6555dc62
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-8ed8-5d694b5cfa50
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-813f-8b7d5a916f5c
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-e461-a077684ec7d3
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-b74a-de97abb44dd7
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-2b56-2d4bc5bbbd3f
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-44cb-bea40d1303df
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-7ab1-ed7770808bc2
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-cddc-4b6f568ccab3
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-a3b5-dbbb65228953
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-b716-3558e272d478
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-932b-513b60eaeb85
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-43c1-582edbe90c1f
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-c584-cb944f72394b
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-c4b5-97e778ea9906
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-486d-64a1a4704876
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-d9f4-c78a6f1e9e16
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-e4ca-77abf30f2d0e
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-920f-67b235b77c79
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-989b-3217f304d9bc
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-1d75-a8428b5d7925
00020000-564c-96e0-5bde-e99557f18f1c	00030000-564c-96de-5339-753ce7996a1c
00020000-564c-96e0-76be-cf8a3828e7b4	00030000-564c-96de-3563-9dba27285070
00020000-564c-96e0-a5f7-6b3be768f95a	00030000-564c-96de-b2e9-4068b90e4e78
00020000-564c-96e0-55a9-013e9880c854	00030000-564c-96de-7ab1-ed7770808bc2
00020000-564c-96e0-7d00-e406f7bf1f9e	00030000-564c-96de-44cb-bea40d1303df
00020000-564c-96e0-ce07-aabc61d5daf1	00030000-564c-96de-37dc-265f9f1d6ec1
00020000-564c-96e0-911e-ff009b365598	00030000-564c-96de-2a5c-45c60e1ff90e
00020000-564c-96e0-3e4f-999c819c8a3b	00030000-564c-96de-cc13-7d7997591163
00020000-564c-96e0-357b-1099191e01a5	00030000-564c-96de-3752-cace601a84fe
00020000-564c-96e0-af38-9d02b6993f0e	00030000-564c-96de-0049-0a294475f9e4
00020000-564c-96e0-2624-19e92d912817	00030000-564c-96de-e713-fc78780739ec
00020000-564c-96e0-b1be-9c3103763918	00030000-564c-96de-c21a-ec39a6629760
00020000-564c-96e0-2125-dc9dd8d29772	00030000-564c-96de-c639-a5bb11179873
00020000-564c-96e0-14e7-1c6ccc7b0bda	00030000-564c-96de-7cda-4bcd790b8de1
00020000-564c-96e0-bde7-90166ed3821e	00030000-564c-96de-cfee-d7f898d033de
00020000-564c-96e0-628a-edba4f4fea53	00030000-564c-96de-2915-0d25fb2fad3c
00020000-564c-96e0-1829-a178f3d5bacd	00030000-564c-96de-f06d-48c2f7adb3d5
\.


--
-- TOC entry 3139 (class 0 OID 28404672)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 28404706)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 28404843)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-564c-96e1-956d-fe6026d402cd	00090000-564c-96e1-4f62-06a0ee8aeb1e	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-564c-96e1-9531-1818cd11c81d	00090000-564c-96e1-9619-b4ce2148b0a9	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-564c-96e1-83ab-bee46e4a1b4b	00090000-564c-96e1-84a6-16c52acb9105	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-564c-96e1-c3f8-e71e6ca84c1a	00090000-564c-96e1-3d8a-778595f97da3	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 28404364)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-564c-96e1-9224-f588a053942c	\N	00040000-564c-96de-3cd5-e97b97c6f891	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-96e1-6648-f61671336351	\N	00040000-564c-96de-3cd5-e97b97c6f891	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-564c-96e1-a271-b1cb88954fbe	\N	00040000-564c-96de-3cd5-e97b97c6f891	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-96e1-3335-295a1a52f96a	\N	00040000-564c-96de-3cd5-e97b97c6f891	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-96e1-c09c-14d0e3880a2f	\N	00040000-564c-96de-3cd5-e97b97c6f891	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-96e1-0e84-7099c0502bc6	\N	00040000-564c-96de-2564-1414c9f257b0	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-96e1-9799-1b602b633e90	\N	00040000-564c-96de-9556-4d525a9e971d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-96e1-a31e-2256cdea8d06	\N	00040000-564c-96de-5bc5-4446578e40e8	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-96e1-9315-f9939b391689	\N	00040000-564c-96de-85f1-4b5d3cb6669b	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564c-96e3-a040-2c94b6fba31f	\N	00040000-564c-96de-3cd5-e97b97c6f891	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 28404409)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-564c-96dd-3ec1-8a4ef1a45a67	8341	Adlešiči
00050000-564c-96dd-9ae1-61d1a7270303	5270	Ajdovščina
00050000-564c-96dd-bc04-8e1e730330e0	6280	Ankaran/Ancarano
00050000-564c-96dd-f2da-0d6be3df9b5d	9253	Apače
00050000-564c-96dd-56c0-1e186e5528bf	8253	Artiče
00050000-564c-96dd-5f85-be19e0f2f3b0	4275	Begunje na Gorenjskem
00050000-564c-96dd-6ec8-857616c644dd	1382	Begunje pri Cerknici
00050000-564c-96dd-7ec0-02fcb2e2c81b	9231	Beltinci
00050000-564c-96dd-0b89-6a944ed145ba	2234	Benedikt
00050000-564c-96dd-acc1-1717773e198f	2345	Bistrica ob Dravi
00050000-564c-96dd-a105-4c1d1f9d7a82	3256	Bistrica ob Sotli
00050000-564c-96dd-0eef-8b46e1dc657f	8259	Bizeljsko
00050000-564c-96dd-7984-252c736e37be	1223	Blagovica
00050000-564c-96dd-812d-c8281c72d819	8283	Blanca
00050000-564c-96dd-8bd9-6d92768e4667	4260	Bled
00050000-564c-96dd-c9c8-e7c90646bbb4	4273	Blejska Dobrava
00050000-564c-96dd-87cd-f946b2ab832d	9265	Bodonci
00050000-564c-96dd-de9c-65eb97e0c639	9222	Bogojina
00050000-564c-96dd-94cd-09e77b0e2fab	4263	Bohinjska Bela
00050000-564c-96dd-203b-1ae83f8063d4	4264	Bohinjska Bistrica
00050000-564c-96dd-e990-ccdbc202ad9f	4265	Bohinjsko jezero
00050000-564c-96dd-dccf-3202cfe175eb	1353	Borovnica
00050000-564c-96dd-db08-53ebf33fd29f	8294	Boštanj
00050000-564c-96dd-8f31-659cf86990c1	5230	Bovec
00050000-564c-96dd-5650-d82411cb36d7	5295	Branik
00050000-564c-96dd-74eb-6e6fcfbe4709	3314	Braslovče
00050000-564c-96dd-8593-f027f4f7b6cf	5223	Breginj
00050000-564c-96dd-1b61-ecd12cbca01d	8280	Brestanica
00050000-564c-96dd-6297-6873ddc96fcb	2354	Bresternica
00050000-564c-96dd-9790-e35270784869	4243	Brezje
00050000-564c-96dd-08e8-507cb7c9793f	1351	Brezovica pri Ljubljani
00050000-564c-96dd-1f31-e0cb134420f1	8250	Brežice
00050000-564c-96dd-7fbe-2879a6835046	4210	Brnik - Aerodrom
00050000-564c-96dd-ec6e-7c1370b31f17	8321	Brusnice
00050000-564c-96dd-acf5-4aaea195f7c3	3255	Buče
00050000-564c-96dd-506f-1387b8a699ee	8276	Bučka 
00050000-564c-96dd-1421-5b4eef8edd2a	9261	Cankova
00050000-564c-96dd-98e4-947d6b67a181	3000	Celje 
00050000-564c-96dd-dcec-6a876a743b4c	3001	Celje - poštni predali
00050000-564c-96dd-eaf4-4a74a2cbfc87	4207	Cerklje na Gorenjskem
00050000-564c-96dd-c464-5c7f7dda7a76	8263	Cerklje ob Krki
00050000-564c-96dd-eece-090c4c98c4a6	1380	Cerknica
00050000-564c-96dd-b07d-b7c8afbaca1b	5282	Cerkno
00050000-564c-96dd-1bef-c7edbcc1d01b	2236	Cerkvenjak
00050000-564c-96dd-f05d-cd15b2d7db5a	2215	Ceršak
00050000-564c-96dd-5a7a-d1a092cde366	2326	Cirkovce
00050000-564c-96dd-3843-8cba2ab50ffe	2282	Cirkulane
00050000-564c-96dd-1fd4-e8b8476be4c9	5273	Col
00050000-564c-96dd-6842-41cf87ead181	8251	Čatež ob Savi
00050000-564c-96dd-76e3-5dbc79d8b68c	1413	Čemšenik
00050000-564c-96dd-7a37-224decd97fee	5253	Čepovan
00050000-564c-96dd-cc75-ad9f9523fc31	9232	Črenšovci
00050000-564c-96dd-57c6-13f5652bec06	2393	Črna na Koroškem
00050000-564c-96dd-0a5b-5d67aa57a3df	6275	Črni Kal
00050000-564c-96dd-e4d6-26adb08cf380	5274	Črni Vrh nad Idrijo
00050000-564c-96dd-b0f2-e2874a38443a	5262	Črniče
00050000-564c-96dd-04e8-ed3dac275696	8340	Črnomelj
00050000-564c-96dd-f0f0-e08b8611cbd0	6271	Dekani
00050000-564c-96dd-ec30-b77497c8625a	5210	Deskle
00050000-564c-96dd-6254-c46c55c28c4e	2253	Destrnik
00050000-564c-96dd-005d-68210eb6bd40	6215	Divača
00050000-564c-96dd-b615-f0c9b1e793fa	1233	Dob
00050000-564c-96dd-0d43-047c6be8eff9	3224	Dobje pri Planini
00050000-564c-96dd-12b8-249398fc2ccb	8257	Dobova
00050000-564c-96dd-57ed-b253f3411e87	1423	Dobovec
00050000-564c-96dd-5f02-6fece54342b8	5263	Dobravlje
00050000-564c-96dd-870a-fc22b2fba5b2	3204	Dobrna
00050000-564c-96dd-aa1b-e692702762a2	8211	Dobrnič
00050000-564c-96dd-24ea-9de1844ca33a	1356	Dobrova
00050000-564c-96dd-1ba4-a6b588d10059	9223	Dobrovnik/Dobronak 
00050000-564c-96dd-4c40-347a9214e55a	5212	Dobrovo v Brdih
00050000-564c-96dd-ac71-9364375e3365	1431	Dol pri Hrastniku
00050000-564c-96dd-fcb3-92c83943573b	1262	Dol pri Ljubljani
00050000-564c-96dd-aabc-9a53cc8ca121	1273	Dole pri Litiji
00050000-564c-96dd-141f-ab55afb8d2e1	1331	Dolenja vas
00050000-564c-96dd-1267-4f58b8f73631	8350	Dolenjske Toplice
00050000-564c-96dd-5cfe-73bbc750cc5b	1230	Domžale
00050000-564c-96dd-c89a-a042a103f477	2252	Dornava
00050000-564c-96dd-ba31-585648e16773	5294	Dornberk
00050000-564c-96dd-9127-b8d6d8dcf4a0	1319	Draga
00050000-564c-96dd-c5ac-f763d5e44c29	8343	Dragatuš
00050000-564c-96dd-91e4-d90efa0e6bf0	3222	Dramlje
00050000-564c-96dd-1391-237aee5e11f6	2370	Dravograd
00050000-564c-96dd-ce28-a91543b96a0d	4203	Duplje
00050000-564c-96dd-4bec-b27f054004b0	6221	Dutovlje
00050000-564c-96dd-86bb-09d20f2b17f6	8361	Dvor
00050000-564c-96dd-661b-d899103516ba	2343	Fala
00050000-564c-96dd-b7bf-4fb7781d36cc	9208	Fokovci
00050000-564c-96dd-8db0-a485f5402c4f	2313	Fram
00050000-564c-96dd-9fa2-80e6023e6437	3213	Frankolovo
00050000-564c-96dd-7d2e-cc7630f25b8f	1274	Gabrovka
00050000-564c-96dd-5a5d-9f687fc46afb	8254	Globoko
00050000-564c-96dd-ed72-dbde95625ec8	5275	Godovič
00050000-564c-96dd-bb85-5ab4b79bd63b	4204	Golnik
00050000-564c-96dd-8e30-607fc7ddd339	3303	Gomilsko
00050000-564c-96dd-2278-a3a366f5bc6e	4224	Gorenja vas
00050000-564c-96dd-0c2a-f4a04db19019	3263	Gorica pri Slivnici
00050000-564c-96dd-c4c6-6de097c854e4	2272	Gorišnica
00050000-564c-96dd-435b-b99836079eff	9250	Gornja Radgona
00050000-564c-96dd-bcbd-dd1ae59dc395	3342	Gornji Grad
00050000-564c-96dd-212c-8b525af0ca0a	4282	Gozd Martuljek
00050000-564c-96dd-5274-bda633131fb2	6272	Gračišče
00050000-564c-96dd-c00f-47408f4ef8d5	9264	Grad
00050000-564c-96dd-006a-5707708ee73a	8332	Gradac
00050000-564c-96dd-d30f-658fe12f46a5	1384	Grahovo
00050000-564c-96dd-0b62-e90091e25c0a	5242	Grahovo ob Bači
00050000-564c-96dd-0653-3b5b21c45201	5251	Grgar
00050000-564c-96dd-26a1-500150a0951c	3302	Griže
00050000-564c-96dd-5e07-0f9f8d684c44	3231	Grobelno
00050000-564c-96dd-481d-64753341145a	1290	Grosuplje
00050000-564c-96dd-1b21-869c5847a168	2288	Hajdina
00050000-564c-96dd-0972-285215dfe47b	8362	Hinje
00050000-564c-96dd-90a6-be73cd51918c	2311	Hoče
00050000-564c-96dd-6c8d-c8eaaab9d2a6	9205	Hodoš/Hodos
00050000-564c-96dd-19f0-1cb2bfaa1dd1	1354	Horjul
00050000-564c-96dd-2fc2-55a6ed83e9d3	1372	Hotedršica
00050000-564c-96dd-09af-82bdebb08d0d	1430	Hrastnik
00050000-564c-96dd-4fc3-021fa631a36c	6225	Hruševje
00050000-564c-96dd-37ef-a73cf722d01a	4276	Hrušica
00050000-564c-96dd-bc27-0fdaf719dd4e	5280	Idrija
00050000-564c-96dd-0d57-2c79ab3ab321	1292	Ig
00050000-564c-96dd-db82-4586d3a4b421	6250	Ilirska Bistrica
00050000-564c-96dd-653c-a9376d5ce3f5	6251	Ilirska Bistrica-Trnovo
00050000-564c-96dd-9564-0688f92dd6ec	1295	Ivančna Gorica
00050000-564c-96dd-4a25-760ca945a494	2259	Ivanjkovci
00050000-564c-96dd-d28a-3ccd69d56542	1411	Izlake
00050000-564c-96dd-197e-1a98bdbf091f	6310	Izola/Isola
00050000-564c-96dd-6703-f9ec01921c4a	2222	Jakobski Dol
00050000-564c-96dd-ef14-f687bcd22041	2221	Jarenina
00050000-564c-96dd-94b4-5fd3c2169285	6254	Jelšane
00050000-564c-96dd-9a71-a7cbca419ef0	4270	Jesenice
00050000-564c-96dd-a69c-e378809742c1	8261	Jesenice na Dolenjskem
00050000-564c-96dd-0719-3a9bfec81993	3273	Jurklošter
00050000-564c-96dd-f74b-27677564e61c	2223	Jurovski Dol
00050000-564c-96dd-44ae-2f0c07bc488d	2256	Juršinci
00050000-564c-96dd-da7f-456a041da0f7	5214	Kal nad Kanalom
00050000-564c-96dd-c0a8-cb00a9fa2db0	3233	Kalobje
00050000-564c-96dd-f923-68ece502a83c	4246	Kamna Gorica
00050000-564c-96dd-8a5d-447d113af286	2351	Kamnica
00050000-564c-96dd-a4d6-07fc563b393b	1241	Kamnik
00050000-564c-96dd-fef7-f249fc5c3904	5213	Kanal
00050000-564c-96dd-e427-212d6acbf1dd	8258	Kapele
00050000-564c-96dd-3427-6a031b7a62f5	2362	Kapla
00050000-564c-96dd-9812-9c814078f5b2	2325	Kidričevo
00050000-564c-96dd-8cc6-8f26af703782	1412	Kisovec
00050000-564c-96dd-53d4-b608587aecbf	6253	Knežak
00050000-564c-96dd-d8d1-48a77b1c62c5	5222	Kobarid
00050000-564c-96dd-cc96-e47f41025406	9227	Kobilje
00050000-564c-96dd-d0f7-5917936d9c2b	1330	Kočevje
00050000-564c-96dd-fd83-babdd5a09abe	1338	Kočevska Reka
00050000-564c-96dd-f295-9197d4a5fc7d	2276	Kog
00050000-564c-96dd-ba66-57873c6c3da8	5211	Kojsko
00050000-564c-96dd-a5a9-7dd88fb0de03	6223	Komen
00050000-564c-96dd-c697-327dc01c2e7f	1218	Komenda
00050000-564c-96dd-7b06-a650f843fe58	6000	Koper/Capodistria 
00050000-564c-96dd-848b-26424fd64f37	6001	Koper/Capodistria - poštni predali
00050000-564c-96dd-6086-23f9e0778fbe	8282	Koprivnica
00050000-564c-96dd-ba69-00879cc843ce	5296	Kostanjevica na Krasu
00050000-564c-96dd-41b1-95c415b772c3	8311	Kostanjevica na Krki
00050000-564c-96dd-6cab-fba8d35c70ef	1336	Kostel
00050000-564c-96dd-137b-a4824bbf9399	6256	Košana
00050000-564c-96dd-dd10-e479a7a9d8d4	2394	Kotlje
00050000-564c-96dd-c109-b15b46b851b0	6240	Kozina
00050000-564c-96dd-fae8-1d2655e9cfed	3260	Kozje
00050000-564c-96dd-50b0-1fb4b34fb18c	4000	Kranj 
00050000-564c-96dd-18e1-9e2ad4a9c321	4001	Kranj - poštni predali
00050000-564c-96dd-00e2-a3c574b7c740	4280	Kranjska Gora
00050000-564c-96dd-72a4-8a049478fe7e	1281	Kresnice
00050000-564c-96dd-8c1c-fe92ef6a4b5d	4294	Križe
00050000-564c-96dd-2c9f-9310e21d2a3d	9206	Križevci
00050000-564c-96dd-c445-e63bedef39d3	9242	Križevci pri Ljutomeru
00050000-564c-96dd-35ca-2a014189f3f3	1301	Krka
00050000-564c-96dd-27b1-4538c54e6e4b	8296	Krmelj
00050000-564c-96dd-1f7d-6ba0de7b1a03	4245	Kropa
00050000-564c-96dd-1f0a-3fcd2e1777d1	8262	Krška vas
00050000-564c-96dd-17f9-51f86c57c2c4	8270	Krško
00050000-564c-96dd-5cdb-2738592543ab	9263	Kuzma
00050000-564c-96dd-0d73-e70ba3c15a9d	2318	Laporje
00050000-564c-96dd-b22e-1bda668cde11	3270	Laško
00050000-564c-96dd-b9e0-984f33abb1ae	1219	Laze v Tuhinju
00050000-564c-96dd-ca47-9328d7a6b55b	2230	Lenart v Slovenskih goricah
00050000-564c-96dd-ecbc-3e5ea3f6eef1	9220	Lendava/Lendva
00050000-564c-96dd-bb6a-dc1add559c8b	4248	Lesce
00050000-564c-96dd-9325-ebd3ab34f452	3261	Lesično
00050000-564c-96dd-8086-37adef76b8d2	8273	Leskovec pri Krškem
00050000-564c-96dd-ca0d-ed08730f5f31	2372	Libeliče
00050000-564c-96dd-3cef-f963a5b92040	2341	Limbuš
00050000-564c-96dd-2b31-9b3659ad4bef	1270	Litija
00050000-564c-96dd-4234-2f7cb627b358	3202	Ljubečna
00050000-564c-96dd-827a-5f00465d4d63	1000	Ljubljana 
00050000-564c-96dd-fbda-4081fa0cc971	1001	Ljubljana - poštni predali
00050000-564c-96dd-ad76-0dd48e3b29ac	1231	Ljubljana - Črnuče
00050000-564c-96dd-2968-ce663f5709d7	1261	Ljubljana - Dobrunje
00050000-564c-96dd-67c2-267003062e92	1260	Ljubljana - Polje
00050000-564c-96dd-654b-2d4c54e3376a	1210	Ljubljana - Šentvid
00050000-564c-96dd-b83f-a77a0444ecab	1211	Ljubljana - Šmartno
00050000-564c-96dd-241b-1d1320ea7f80	3333	Ljubno ob Savinji
00050000-564c-96dd-62c1-8c89cea83a2f	9240	Ljutomer
00050000-564c-96dd-2698-d93e0075ec88	3215	Loče
00050000-564c-96dd-5d15-372d332708e2	5231	Log pod Mangartom
00050000-564c-96dd-2d61-36b2cac377b4	1358	Log pri Brezovici
00050000-564c-96dd-da89-e906335e3962	1370	Logatec
00050000-564c-96dd-48b0-a66c7c92886b	1371	Logatec
00050000-564c-96dd-acb3-b9724e481d99	1434	Loka pri Zidanem Mostu
00050000-564c-96dd-2d98-ad8200527521	3223	Loka pri Žusmu
00050000-564c-96dd-d9b9-63645283f44b	6219	Lokev
00050000-564c-96dd-933d-641f99243858	1318	Loški Potok
00050000-564c-96dd-c728-f454ff9532a1	2324	Lovrenc na Dravskem polju
00050000-564c-96dd-0a16-1f05db128ffd	2344	Lovrenc na Pohorju
00050000-564c-96dd-1a14-3c166485d2d2	3334	Luče
00050000-564c-96dd-20c5-05279fb5aa3e	1225	Lukovica
00050000-564c-96dd-7143-5d6cdfba1b1b	9202	Mačkovci
00050000-564c-96dd-467e-462a539802af	2322	Majšperk
00050000-564c-96dd-9009-a24aa91747f4	2321	Makole
00050000-564c-96dd-5bd8-2795285d8769	9243	Mala Nedelja
00050000-564c-96dd-89de-7fd53020df0b	2229	Malečnik
00050000-564c-96dd-93f2-5deb3569943d	6273	Marezige
00050000-564c-96dd-dd0f-f7b9862dc52e	2000	Maribor 
00050000-564c-96dd-9357-e5fb9ced75f5	2001	Maribor - poštni predali
00050000-564c-96dd-1d29-8a1f50a3f33f	2206	Marjeta na Dravskem polju
00050000-564c-96dd-aa9a-a194777a9606	2281	Markovci
00050000-564c-96dd-a4a8-f2a5d9298060	9221	Martjanci
00050000-564c-96dd-583e-eb9cf3432f07	6242	Materija
00050000-564c-96dd-e46f-22a54a6e9fe7	4211	Mavčiče
00050000-564c-96dd-b48f-006be8cb1bf9	1215	Medvode
00050000-564c-96dd-0030-ed7cb17f3dc9	1234	Mengeš
00050000-564c-96dd-2a9e-195592da0473	8330	Metlika
00050000-564c-96dd-9fa3-f968013515ff	2392	Mežica
00050000-564c-96dd-d5ce-617dff6035a9	2204	Miklavž na Dravskem polju
00050000-564c-96dd-b045-28e2370003aa	2275	Miklavž pri Ormožu
00050000-564c-96dd-6c9c-5639e763b5ea	5291	Miren
00050000-564c-96dd-a522-731e192e845c	8233	Mirna
00050000-564c-96dd-d9ae-db996f112be4	8216	Mirna Peč
00050000-564c-96dd-b199-2c1e00df2c0e	2382	Mislinja
00050000-564c-96dd-5ee7-0aa25d0cbc47	4281	Mojstrana
00050000-564c-96dd-0a21-2b563eeecb80	8230	Mokronog
00050000-564c-96dd-75c2-ab20234170dc	1251	Moravče
00050000-564c-96dd-2f8a-dab61b1d7218	9226	Moravske Toplice
00050000-564c-96dd-90c3-08ad5f88adc6	5216	Most na Soči
00050000-564c-96dd-2134-fe03da2668dc	1221	Motnik
00050000-564c-96dd-e975-627e7b1061d5	3330	Mozirje
00050000-564c-96dd-9be6-40f18d66fb0b	9000	Murska Sobota 
00050000-564c-96dd-abc8-2dee5afef0ff	9001	Murska Sobota - poštni predali
00050000-564c-96dd-d233-3999bfb81c4d	2366	Muta
00050000-564c-96dd-bc8f-2f878ff1d164	4202	Naklo
00050000-564c-96dd-7e01-0a45676d09dc	3331	Nazarje
00050000-564c-96dd-fb06-fd35e9394274	1357	Notranje Gorice
00050000-564c-96dd-fae6-9023b7772e7c	3203	Nova Cerkev
00050000-564c-96dd-09a6-bfb132fa8e39	5000	Nova Gorica 
00050000-564c-96dd-50fc-61c025d666c0	5001	Nova Gorica - poštni predali
00050000-564c-96dd-e946-e1fc60eb84eb	1385	Nova vas
00050000-564c-96dd-9742-70a52abc31db	8000	Novo mesto
00050000-564c-96dd-18e8-43b211bfb14b	8001	Novo mesto - poštni predali
00050000-564c-96dd-55a0-524b94cc3caf	6243	Obrov
00050000-564c-96dd-8c82-3dfeff5bc8d1	9233	Odranci
00050000-564c-96dd-2aa1-c7f76068b058	2317	Oplotnica
00050000-564c-96dd-be9a-e7d27c075619	2312	Orehova vas
00050000-564c-96dd-765a-134635db30b7	2270	Ormož
00050000-564c-96dd-d8a8-fd4b8f509690	1316	Ortnek
00050000-564c-96dd-e7e2-24b7a21905f4	1337	Osilnica
00050000-564c-96dd-f6c0-72d4ebb60e25	8222	Otočec
00050000-564c-96dd-38c7-6a28bcaba5b1	2361	Ožbalt
00050000-564c-96dd-1a1b-512b1f7bf2e8	2231	Pernica
00050000-564c-96dd-b55a-dccf034b1bc7	2211	Pesnica pri Mariboru
00050000-564c-96dd-97fe-a64438ce4efd	9203	Petrovci
00050000-564c-96dd-d925-1f8a520c08c7	3301	Petrovče
00050000-564c-96dd-fe4f-e38d62ba0d7c	6330	Piran/Pirano
00050000-564c-96dd-767e-1f22b467b203	8255	Pišece
00050000-564c-96dd-9d47-0d35c90c541c	6257	Pivka
00050000-564c-96dd-3fd8-808655bf43ed	6232	Planina
00050000-564c-96dd-f8ea-026169dbe62e	3225	Planina pri Sevnici
00050000-564c-96dd-af29-44f8d726501b	6276	Pobegi
00050000-564c-96dd-81ca-5e848b1857b4	8312	Podbočje
00050000-564c-96dd-ff23-7c2aa1ddb00e	5243	Podbrdo
00050000-564c-96dd-b0d6-dd5b85574600	3254	Podčetrtek
00050000-564c-96dd-9319-897973d5b280	2273	Podgorci
00050000-564c-96dd-3823-a63a75834515	6216	Podgorje
00050000-564c-96dd-eedd-aaa0e3936b50	2381	Podgorje pri Slovenj Gradcu
00050000-564c-96dd-a8e5-d7a8d8191e17	6244	Podgrad
00050000-564c-96dd-b44d-734c680353ff	1414	Podkum
00050000-564c-96dd-4c99-2117cd69eaf6	2286	Podlehnik
00050000-564c-96dd-e458-41b1ffbdf993	5272	Podnanos
00050000-564c-96dd-9e99-82ca4f7f0b06	4244	Podnart
00050000-564c-96dd-7134-a2a26f5f8246	3241	Podplat
00050000-564c-96dd-3f30-04c7c356a282	3257	Podsreda
00050000-564c-96dd-66cf-fb74c62e105f	2363	Podvelka
00050000-564c-96dd-fda2-007fed2b377b	2208	Pohorje
00050000-564c-96dd-cb8d-2f032933b915	2257	Polenšak
00050000-564c-96dd-c7c0-439d4b1b2177	1355	Polhov Gradec
00050000-564c-96dd-1f83-33af76f0e288	4223	Poljane nad Škofjo Loko
00050000-564c-96dd-2667-784eab08074d	2319	Poljčane
00050000-564c-96dd-5a91-c9eeabc456b0	1272	Polšnik
00050000-564c-96dd-30b4-a062ae78ce1b	3313	Polzela
00050000-564c-96dd-e46b-898e178664e5	3232	Ponikva
00050000-564c-96dd-309c-2e508a7f446f	6320	Portorož/Portorose
00050000-564c-96dd-640f-6c10d48b844b	6230	Postojna
00050000-564c-96dd-5789-8c273ab94918	2331	Pragersko
00050000-564c-96dd-cdb4-eeb506e678e2	3312	Prebold
00050000-564c-96dd-416e-cdd2bce8f598	4205	Preddvor
00050000-564c-96dd-b1d8-1473469e288e	6255	Prem
00050000-564c-96dd-d4f3-2476dfa5201f	1352	Preserje
00050000-564c-96dd-8dd8-8d45c353d7cc	6258	Prestranek
00050000-564c-96dd-e5cd-db94cac6178a	2391	Prevalje
00050000-564c-96dd-2a17-9be3eda591fb	3262	Prevorje
00050000-564c-96dd-fc6f-dd4ac5ac41e9	1276	Primskovo 
00050000-564c-96dd-a0ac-426d8692fe9d	3253	Pristava pri Mestinju
00050000-564c-96dd-e76d-c079c48b4550	9207	Prosenjakovci/Partosfalva
00050000-564c-96dd-5173-b4b59fd3ac0b	5297	Prvačina
00050000-564c-96dd-0098-a0f4042db5b9	2250	Ptuj
00050000-564c-96dd-435b-60676fbb5a11	2323	Ptujska Gora
00050000-564c-96dd-e2dd-c1d20a6445e5	9201	Puconci
00050000-564c-96dd-b8cb-58aebb36ed15	2327	Rače
00050000-564c-96dd-b93a-32baebbb1925	1433	Radeče
00050000-564c-96dd-b392-9800fe7b49cb	9252	Radenci
00050000-564c-96dd-3dfe-8851d4ae7d89	2360	Radlje ob Dravi
00050000-564c-96dd-d996-94fc20c24b77	1235	Radomlje
00050000-564c-96dd-2e06-a6809a540e27	4240	Radovljica
00050000-564c-96dd-47cb-38ef8c0602b4	8274	Raka
00050000-564c-96dd-7115-7b943c63f001	1381	Rakek
00050000-564c-96dd-3612-7ddc5b4fa6c4	4283	Rateče - Planica
00050000-564c-96dd-371b-daf0c6df7caf	2390	Ravne na Koroškem
00050000-564c-96dd-f5fd-e0a47fe81eea	9246	Razkrižje
00050000-564c-96dd-ae5d-f49cf04a626f	3332	Rečica ob Savinji
00050000-564c-96dd-f191-cab6d9a474d0	5292	Renče
00050000-564c-96dd-a737-8e018068df47	1310	Ribnica
00050000-564c-96dd-56eb-7c7245b6f82e	2364	Ribnica na Pohorju
00050000-564c-96dd-f184-43464d336a81	3272	Rimske Toplice
00050000-564c-96dd-804d-891f2955e28c	1314	Rob
00050000-564c-96dd-f1b0-09f3b06b1733	5215	Ročinj
00050000-564c-96dd-2bd5-6e88c9e7ca6a	3250	Rogaška Slatina
00050000-564c-96dd-590b-78bc77a6bf6a	9262	Rogašovci
00050000-564c-96dd-b373-261a8bfd051f	3252	Rogatec
00050000-564c-96dd-c212-1bf83a09dca9	1373	Rovte
00050000-564c-96dd-0506-0f5cc220c057	2342	Ruše
00050000-564c-96dd-6b38-b6e612a2d13f	1282	Sava
00050000-564c-96dd-2640-8df07bbc5c7d	6333	Sečovlje/Sicciole
00050000-564c-96dd-8dfe-da97117b78a4	4227	Selca
00050000-564c-96dd-c4f5-e5351b3523b3	2352	Selnica ob Dravi
00050000-564c-96dd-6403-049c6903b19e	8333	Semič
00050000-564c-96dd-02cc-720b607da7f2	8281	Senovo
00050000-564c-96dd-73d4-0528eb40f7a8	6224	Senožeče
00050000-564c-96dd-c205-cfecab309fee	8290	Sevnica
00050000-564c-96dd-0ed1-27dde549a3c9	6210	Sežana
00050000-564c-96dd-d205-b86d5231d6a0	2214	Sladki Vrh
00050000-564c-96dd-4494-087eef6d5e70	5283	Slap ob Idrijci
00050000-564c-96dd-afb3-6eaabc9e4343	2380	Slovenj Gradec
00050000-564c-96dd-a8a4-681449c0d24e	2310	Slovenska Bistrica
00050000-564c-96dd-26e4-e2fdc7b3417b	3210	Slovenske Konjice
00050000-564c-96dd-ab9d-02bbf7d389dd	1216	Smlednik
00050000-564c-96dd-3e3e-326ad99de2cf	5232	Soča
00050000-564c-96dd-32f8-50ea106194ac	1317	Sodražica
00050000-564c-96dd-7ca8-63031a3a69c0	3335	Solčava
00050000-564c-96dd-f74d-87a95e73855b	5250	Solkan
00050000-564c-96dd-b351-fafea0d87549	4229	Sorica
00050000-564c-96dd-541a-7eee757e5733	4225	Sovodenj
00050000-564c-96dd-7d1f-780aa4c94805	5281	Spodnja Idrija
00050000-564c-96dd-4c4d-6fea473c808c	2241	Spodnji Duplek
00050000-564c-96dd-a72b-7bb28d92fd08	9245	Spodnji Ivanjci
00050000-564c-96dd-fccd-4adcc3f2e4ee	2277	Središče ob Dravi
00050000-564c-96dd-0c37-8a0c646e550d	4267	Srednja vas v Bohinju
00050000-564c-96dd-47e8-9b0d50634b7e	8256	Sromlje 
00050000-564c-96dd-acd5-6e44c522ae24	5224	Srpenica
00050000-564c-96dd-dd37-c07c023e1eca	1242	Stahovica
00050000-564c-96dd-ea46-d5d7cdcc6b6c	1332	Stara Cerkev
00050000-564c-96dd-ac46-c9ec97443645	8342	Stari trg ob Kolpi
00050000-564c-96dd-47b6-cdbec8303fb6	1386	Stari trg pri Ložu
00050000-564c-96dd-18d2-392f098bfa24	2205	Starše
00050000-564c-96dd-1088-58270c2af889	2289	Stoperce
00050000-564c-96dd-01fc-6c9132489cf7	8322	Stopiče
00050000-564c-96dd-8a1d-1ee828c7c1c7	3206	Stranice
00050000-564c-96dd-e98e-2fd00afb2977	8351	Straža
00050000-564c-96dd-203b-b8e031b927eb	1313	Struge
00050000-564c-96dd-b12a-fe54cdc6dc77	8293	Studenec
00050000-564c-96dd-ad7a-2f0d5abd55f9	8331	Suhor
00050000-564c-96dd-fc68-ec90c6d76704	2233	Sv. Ana v Slovenskih goricah
00050000-564c-96dd-76d9-c978cdbe46b9	2235	Sv. Trojica v Slovenskih goricah
00050000-564c-96dd-a0d8-ec13692da72a	2353	Sveti Duh na Ostrem Vrhu
00050000-564c-96dd-a882-5b2061731ae6	9244	Sveti Jurij ob Ščavnici
00050000-564c-96dd-b62d-6facf3600c9a	3264	Sveti Štefan
00050000-564c-96dd-1010-4dd67e193eba	2258	Sveti Tomaž
00050000-564c-96dd-58ef-a1f5f1d8ce1d	9204	Šalovci
00050000-564c-96dd-876a-2d911f600e0e	5261	Šempas
00050000-564c-96dd-192d-691885fd106a	5290	Šempeter pri Gorici
00050000-564c-96dd-70aa-1638d6262e3e	3311	Šempeter v Savinjski dolini
00050000-564c-96dd-aa82-8e3bf60e53ba	4208	Šenčur
00050000-564c-96dd-760f-502b64a70df4	2212	Šentilj v Slovenskih goricah
00050000-564c-96dd-67fe-1b2499ab5718	8297	Šentjanž
00050000-564c-96dd-0b92-96decf80e3b6	2373	Šentjanž pri Dravogradu
00050000-564c-96dd-d594-aff7adec0d27	8310	Šentjernej
00050000-564c-96dd-dd57-469b5360c138	3230	Šentjur
00050000-564c-96dd-03ca-581f006c7ed1	3271	Šentrupert
00050000-564c-96dd-3804-47b3ae03a19c	8232	Šentrupert
00050000-564c-96dd-cd9f-59daf248dc99	1296	Šentvid pri Stični
00050000-564c-96dd-2bbe-cc9e55416b39	8275	Škocjan
00050000-564c-96dd-1bb7-22e0c37038fd	6281	Škofije
00050000-564c-96dd-b1ee-955ecbbcbc65	4220	Škofja Loka
00050000-564c-96dd-622d-e437fdc8c0a9	3211	Škofja vas
00050000-564c-96dd-0856-f891169c61e8	1291	Škofljica
00050000-564c-96dd-1fa6-11e00613183f	6274	Šmarje
00050000-564c-96dd-21b9-6e7dfbe14f14	1293	Šmarje - Sap
00050000-564c-96dd-6a75-68d438693868	3240	Šmarje pri Jelšah
00050000-564c-96dd-5a93-8b467237831a	8220	Šmarješke Toplice
00050000-564c-96dd-3989-bc29d1357a9c	2315	Šmartno na Pohorju
00050000-564c-96dd-02cf-c09dcb069b0c	3341	Šmartno ob Dreti
00050000-564c-96dd-b676-4c51c6b56feb	3327	Šmartno ob Paki
00050000-564c-96dd-2048-ae4513314ceb	1275	Šmartno pri Litiji
00050000-564c-96dd-ba36-d386e55d1efe	2383	Šmartno pri Slovenj Gradcu
00050000-564c-96dd-db8a-0d69598049eb	3201	Šmartno v Rožni dolini
00050000-564c-96dd-f20e-34697d9d2511	3325	Šoštanj
00050000-564c-96dd-008a-4665e14ec182	6222	Štanjel
00050000-564c-96dd-4aa4-5e1c9b470bb1	3220	Štore
00050000-564c-96dd-1e08-a41411d62e58	3304	Tabor
00050000-564c-96dd-6b2f-955693529308	3221	Teharje
00050000-564c-96dd-c123-cea86454782c	9251	Tišina
00050000-564c-96dd-24b4-5a1e6e50839d	5220	Tolmin
00050000-564c-96dd-8589-9909776a67f0	3326	Topolšica
00050000-564c-96dd-dc34-45c89b3f62c8	2371	Trbonje
00050000-564c-96dd-67f4-cd4f637d4d52	1420	Trbovlje
00050000-564c-96dd-8fcc-1fd8a2d043a4	8231	Trebelno 
00050000-564c-96dd-0c4d-44a50b31d80c	8210	Trebnje
00050000-564c-96dd-189f-37b45231efb1	5252	Trnovo pri Gorici
00050000-564c-96dd-f531-c6dce637ee85	2254	Trnovska vas
00050000-564c-96dd-6c3c-6cd8ebefb21e	1222	Trojane
00050000-564c-96dd-96a3-5c44067ff420	1236	Trzin
00050000-564c-96dd-707b-bd56f667f797	4290	Tržič
00050000-564c-96dd-7dab-d58a44cd4905	8295	Tržišče
00050000-564c-96dd-cce7-2717e5cdd453	1311	Turjak
00050000-564c-96dd-8ae7-4877a5e592a6	9224	Turnišče
00050000-564c-96dd-af42-933ad5ee9bef	8323	Uršna sela
00050000-564c-96dd-292f-5a8b7ab85199	1252	Vače
00050000-564c-96dd-4630-0bc579a9a2b0	3320	Velenje 
00050000-564c-96dd-ffdc-525362166c07	3322	Velenje - poštni predali
00050000-564c-96dd-e95d-0966e135f445	8212	Velika Loka
00050000-564c-96dd-4b07-d21e9369f69e	2274	Velika Nedelja
00050000-564c-96dd-0efb-fc14e8e8e44d	9225	Velika Polana
00050000-564c-96dd-a3ee-4b6a90e6c702	1315	Velike Lašče
00050000-564c-96dd-f45f-f2518258aecb	8213	Veliki Gaber
00050000-564c-96dd-55e4-6a1d1098ec4d	9241	Veržej
00050000-564c-96dd-11dc-2b88e19791d4	1312	Videm - Dobrepolje
00050000-564c-96dd-f57d-cb8acd2aee66	2284	Videm pri Ptuju
00050000-564c-96dd-3c0c-a6e6385f5af9	8344	Vinica
00050000-564c-96dd-04ea-d3e35ba273b6	5271	Vipava
00050000-564c-96dd-6b19-98e8763f1068	4212	Visoko
00050000-564c-96dd-63f6-ac815ea52c05	1294	Višnja Gora
00050000-564c-96dd-f7f1-70f219d2cbfd	3205	Vitanje
00050000-564c-96dd-d590-683a784dcf63	2255	Vitomarci
00050000-564c-96dd-669d-ea8e528d8565	1217	Vodice
00050000-564c-96dd-6087-e60474e6220b	3212	Vojnik\t
00050000-564c-96dd-5c4e-08fc8e6d16b7	5293	Volčja Draga
00050000-564c-96dd-71ba-9d4e9b1b26ac	2232	Voličina
00050000-564c-96dd-dfc2-f7c38adfd3fa	3305	Vransko
00050000-564c-96dd-118d-ff3a56dfb326	6217	Vremski Britof
00050000-564c-96dd-f97f-b81ac03c75df	1360	Vrhnika
00050000-564c-96dd-f40a-74e0e5c70a64	2365	Vuhred
00050000-564c-96dd-571c-af48d4898962	2367	Vuzenica
00050000-564c-96dd-614f-e24926063ca7	8292	Zabukovje 
00050000-564c-96dd-9396-3a285adfa70f	1410	Zagorje ob Savi
00050000-564c-96dd-1c88-f5de7558eaf9	1303	Zagradec
00050000-564c-96dd-fcff-00d5af95c4a6	2283	Zavrč
00050000-564c-96dd-02c2-ce9a3ded1d7c	8272	Zdole 
00050000-564c-96dd-a5de-fe5c78428623	4201	Zgornja Besnica
00050000-564c-96dd-a71d-38866dcec9a8	2242	Zgornja Korena
00050000-564c-96dd-d395-b13deb0102e4	2201	Zgornja Kungota
00050000-564c-96dd-961b-82b0b2485dc1	2316	Zgornja Ložnica
00050000-564c-96dd-5505-0c1555fce863	2314	Zgornja Polskava
00050000-564c-96dd-0325-d3625f6d7517	2213	Zgornja Velka
00050000-564c-96dd-67fc-ad934098b0b2	4247	Zgornje Gorje
00050000-564c-96dd-3865-7d780581ea52	4206	Zgornje Jezersko
00050000-564c-96dd-fbf4-dd8d81df7a84	2285	Zgornji Leskovec
00050000-564c-96dd-dd90-9b67e841803d	1432	Zidani Most
00050000-564c-96dd-0ac1-00d491fd1310	3214	Zreče
00050000-564c-96dd-9b74-26047acddfa4	4209	Žabnica
00050000-564c-96dd-26de-45a7b22617e0	3310	Žalec
00050000-564c-96dd-14f3-0f54b24ba1a2	4228	Železniki
00050000-564c-96dd-2f3f-5d339f6e6f6a	2287	Žetale
00050000-564c-96dd-7229-1badc22dda2f	4226	Žiri
00050000-564c-96dd-318c-cb36d4b5459c	4274	Žirovnica
00050000-564c-96dd-ed62-70527ba2fe5b	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 28405070)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 28404646)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 28404394)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-564c-96e1-1f67-e420b7a18bc6	00080000-564c-96e1-9224-f588a053942c	\N	00040000-564c-96de-3cd5-e97b97c6f891	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-564c-96e1-915a-1a5dcf29dccf	00080000-564c-96e1-9224-f588a053942c	\N	00040000-564c-96de-3cd5-e97b97c6f891	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-564c-96e1-5849-f70ee90f1d1a	00080000-564c-96e1-6648-f61671336351	\N	00040000-564c-96de-3cd5-e97b97c6f891	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 28404538)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-564c-96de-3454-2e80b838987e	novo leto	1	1	\N	t
00430000-564c-96de-ffe1-c194625b251d	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-564c-96de-0250-2100e63d4a7a	dan upora proti okupatorju	27	4	\N	t
00430000-564c-96de-be4c-33a6a1883d9f	praznik dela	1	5	\N	t
00430000-564c-96de-73ae-c0df5a9edebc	praznik dela	2	5	\N	t
00430000-564c-96de-b540-7c59ac25511f	dan Primoža Trubarja	8	6	\N	f
00430000-564c-96de-013a-f3a85cf4b37e	dan državnosti	25	6	\N	t
00430000-564c-96de-5ea3-89fdb34947da	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-564c-96de-e5e6-6201254df7ba	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-564c-96de-29a0-065f1bf08bb6	dan suverenosti	25	10	\N	f
00430000-564c-96de-5d88-27b00cacb125	dan spomina na mrtve	1	11	\N	t
00430000-564c-96de-297e-3e5abf82dc38	dan Rudolfa Maistra	23	11	\N	f
00430000-564c-96de-7c5f-809d17e3e006	božič	25	12	\N	t
00430000-564c-96de-18ac-488a97d8b3ff	dan samostojnosti in enotnosti	26	12	\N	t
00430000-564c-96de-a26a-a91b7bfd0a18	Marijino vnebovzetje	15	8	\N	t
00430000-564c-96de-945d-0dcad430aa35	dan reformacije	31	10	\N	t
00430000-564c-96de-9081-ec1c1fc2c97f	velikonočna nedelja	27	3	2016	t
00430000-564c-96de-6b14-cbdaef703f30	velikonočna nedelja	16	4	2017	t
00430000-564c-96de-78eb-aaac1d37bc57	velikonočna nedelja	1	4	2018	t
00430000-564c-96de-f5b6-547621b8b5f3	velikonočna nedelja	21	4	2019	t
00430000-564c-96de-a1d3-541250205f76	velikonočna nedelja	12	4	2020	t
00430000-564c-96de-7217-e8c74faac11a	velikonočna nedelja	4	4	2021	t
00430000-564c-96de-0e61-d12459a37ca0	velikonočna nedelja	17	4	2022	t
00430000-564c-96de-0b4d-7a57f6447fe2	velikonočna nedelja	9	4	2023	t
00430000-564c-96de-8743-c0d652091839	velikonočna nedelja	31	3	2024	t
00430000-564c-96de-4059-175b9a51cc9c	velikonočna nedelja	20	4	2025	t
00430000-564c-96de-7530-8cfada4a8fcb	velikonočna nedelja	5	4	2026	t
00430000-564c-96de-a76a-2d76c2c69cfc	velikonočna nedelja	28	3	2027	t
00430000-564c-96de-ed74-0a0e4e7eaa76	velikonočna nedelja	16	4	2028	t
00430000-564c-96de-b09c-1e04090422fc	velikonočna nedelja	1	4	2029	t
00430000-564c-96de-e3ab-83bb3f243471	velikonočna nedelja	21	4	2030	t
00430000-564c-96de-4f69-d257aa85fa94	velikonočni ponedeljek	28	3	2016	t
00430000-564c-96de-ab6d-4b3fae3b6f3a	velikonočni ponedeljek	17	4	2017	t
00430000-564c-96de-bf1a-04df16efca67	velikonočni ponedeljek	2	4	2018	t
00430000-564c-96de-7800-95f975a0039f	velikonočni ponedeljek	22	4	2019	t
00430000-564c-96de-e26d-6b505bdde534	velikonočni ponedeljek	13	4	2020	t
00430000-564c-96de-7d3a-0eb84c94a3e0	velikonočni ponedeljek	5	4	2021	t
00430000-564c-96de-2671-57024da59e5e	velikonočni ponedeljek	18	4	2022	t
00430000-564c-96de-c59d-c0eb970339d4	velikonočni ponedeljek	10	4	2023	t
00430000-564c-96de-6958-d354c6c76650	velikonočni ponedeljek	1	4	2024	t
00430000-564c-96de-2a96-8163a3039621	velikonočni ponedeljek	21	4	2025	t
00430000-564c-96de-2abf-bfe28b19614d	velikonočni ponedeljek	6	4	2026	t
00430000-564c-96de-7dd9-b0a631dd13fa	velikonočni ponedeljek	29	3	2027	t
00430000-564c-96de-03f1-82760036b784	velikonočni ponedeljek	17	4	2028	t
00430000-564c-96de-80f5-c3afaf9f69d8	velikonočni ponedeljek	2	4	2029	t
00430000-564c-96de-b184-1e8e3985521d	velikonočni ponedeljek	22	4	2030	t
00430000-564c-96de-4a59-326a1a68fa2d	binkoštna nedelja - binkošti	15	5	2016	t
00430000-564c-96de-2b2f-3c4b219c5bd7	binkoštna nedelja - binkošti	4	6	2017	t
00430000-564c-96de-f67f-077c33150187	binkoštna nedelja - binkošti	20	5	2018	t
00430000-564c-96de-caf8-cd1f11f0ecc7	binkoštna nedelja - binkošti	9	6	2019	t
00430000-564c-96de-0fce-515a00f5d0bc	binkoštna nedelja - binkošti	31	5	2020	t
00430000-564c-96de-4b85-fdc733823169	binkoštna nedelja - binkošti	23	5	2021	t
00430000-564c-96de-f11d-11d97a76e341	binkoštna nedelja - binkošti	5	6	2022	t
00430000-564c-96de-7be5-cdff19482fa0	binkoštna nedelja - binkošti	28	5	2023	t
00430000-564c-96de-7279-ac17611f5216	binkoštna nedelja - binkošti	19	5	2024	t
00430000-564c-96de-be9c-a6730631a78a	binkoštna nedelja - binkošti	8	6	2025	t
00430000-564c-96de-cba6-f126df61da94	binkoštna nedelja - binkošti	24	5	2026	t
00430000-564c-96de-1f42-12dd898956e0	binkoštna nedelja - binkošti	16	5	2027	t
00430000-564c-96de-bcec-73a1c7023c4b	binkoštna nedelja - binkošti	4	6	2028	t
00430000-564c-96de-4a4b-7b146f5a2c86	binkoštna nedelja - binkošti	20	5	2029	t
00430000-564c-96de-137b-d3b8c6256b3c	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 28404498)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 28404510)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 28404658)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 28405084)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 28405094)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-564c-96e1-3acd-85b45fcb2a2c	00080000-564c-96e1-a271-b1cb88954fbe	0987	AK
00190000-564c-96e1-84e9-48cf931e85b3	00080000-564c-96e1-6648-f61671336351	0989	AK
00190000-564c-96e1-50f3-2d24574e5482	00080000-564c-96e1-3335-295a1a52f96a	0986	AK
00190000-564c-96e1-e595-04e8cffc442c	00080000-564c-96e1-0e84-7099c0502bc6	0984	AK
00190000-564c-96e1-a79c-87d2ae7f0a78	00080000-564c-96e1-9799-1b602b633e90	0983	AK
00190000-564c-96e1-1226-69cc4694c73b	00080000-564c-96e1-a31e-2256cdea8d06	0982	AK
00190000-564c-96e3-77c2-484cd98e19bb	00080000-564c-96e3-a040-2c94b6fba31f	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 28404993)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-564c-96e1-64f1-7e3f8b58a0bc	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 28405102)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 28404687)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-564c-96e0-f18d-a7e1eab83648	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-564c-96e0-f189-105268370439	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-564c-96e0-4ab6-99fe75c90d1a	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-564c-96e0-6027-fb0f31055d79	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-564c-96e0-01b5-58fcec671796	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-564c-96e0-326e-5f0521cd5ce8	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-564c-96e0-3155-6a038d28d3d2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 28404631)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 28404621)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 28404832)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 28404762)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 28404472)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 28404234)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-564c-96e3-a040-2c94b6fba31f	00010000-564c-96df-6bb4-ff6aed5700ef	2015-11-18 16:18:59	INS	a:0:{}
2	App\\Entity\\Option	00000000-564c-96e3-438e-782d1b392fe3	00010000-564c-96df-6bb4-ff6aed5700ef	2015-11-18 16:18:59	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-564c-96e3-77c2-484cd98e19bb	00010000-564c-96df-6bb4-ff6aed5700ef	2015-11-18 16:18:59	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 28404700)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 28404272)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-564c-96de-d5a7-a35c16b7f76f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-564c-96de-6d67-8297ade1f4ce	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-564c-96de-16bb-2cd05ecea91a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-564c-96de-b57a-1e260fee672a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-564c-96de-3740-948d9a259059	planer	Planer dogodkov v koledarju	t
00020000-564c-96de-bf79-a29b2ac04325	kadrovska	Kadrovska služba	t
00020000-564c-96de-cef9-9e718661b9c2	arhivar	Ažuriranje arhivalij	t
00020000-564c-96de-4c51-47f8b25b7664	igralec	Igralec	t
00020000-564c-96de-1e71-d2442c1bf72f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-564c-96e0-5bde-e99557f18f1c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-564c-96e0-76be-cf8a3828e7b4	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-a5f7-6b3be768f95a	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-55a9-013e9880c854	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-7d00-e406f7bf1f9e	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-ce07-aabc61d5daf1	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-911e-ff009b365598	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-3e4f-999c819c8a3b	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-357b-1099191e01a5	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-af38-9d02b6993f0e	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-2624-19e92d912817	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-b1be-9c3103763918	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-2125-dc9dd8d29772	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-14e7-1c6ccc7b0bda	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-bde7-90166ed3821e	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-628a-edba4f4fea53	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-564c-96e0-1829-a178f3d5bacd	Datoteka-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3099 (class 0 OID 28404256)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-564c-96df-4238-4133a10733d9	00020000-564c-96de-16bb-2cd05ecea91a
00010000-564c-96df-6bb4-ff6aed5700ef	00020000-564c-96de-16bb-2cd05ecea91a
00010000-564c-96e0-a65f-94827acbfb67	00020000-564c-96e0-5bde-e99557f18f1c
00010000-564c-96e1-faea-665a5be0c86f	00020000-564c-96e0-76be-cf8a3828e7b4
00010000-564c-96e1-faea-665a5be0c86f	00020000-564c-96e0-ce07-aabc61d5daf1
00010000-564c-96e1-faea-665a5be0c86f	00020000-564c-96e0-af38-9d02b6993f0e
00010000-564c-96e1-faea-665a5be0c86f	00020000-564c-96e0-b1be-9c3103763918
00010000-564c-96e1-faea-665a5be0c86f	00020000-564c-96e0-bde7-90166ed3821e
00010000-564c-96e1-faea-665a5be0c86f	00020000-564c-96e0-1829-a178f3d5bacd
00010000-564c-96e1-faea-665a5be0c86f	00020000-564c-96e0-55a9-013e9880c854
00010000-564c-96e1-b4ed-d839bf2f0409	00020000-564c-96e0-76be-cf8a3828e7b4
00010000-564c-96e1-b4ed-d839bf2f0409	00020000-564c-96e0-a5f7-6b3be768f95a
00010000-564c-96e1-b4ed-d839bf2f0409	00020000-564c-96e0-55a9-013e9880c854
00010000-564c-96e1-b4ed-d839bf2f0409	00020000-564c-96e0-7d00-e406f7bf1f9e
00010000-564c-96e1-b6c6-e90e57bb3154	00020000-564c-96e0-76be-cf8a3828e7b4
00010000-564c-96e1-b6c6-e90e57bb3154	00020000-564c-96e0-a5f7-6b3be768f95a
00010000-564c-96e1-b6c6-e90e57bb3154	00020000-564c-96e0-55a9-013e9880c854
00010000-564c-96e1-b6c6-e90e57bb3154	00020000-564c-96e0-7d00-e406f7bf1f9e
00010000-564c-96e1-b6c6-e90e57bb3154	00020000-564c-96e0-b1be-9c3103763918
00010000-564c-96e1-4aea-51fc5d80ddfe	00020000-564c-96e0-a5f7-6b3be768f95a
00010000-564c-96e1-4aea-51fc5d80ddfe	00020000-564c-96e0-911e-ff009b365598
00010000-564c-96e1-4aea-51fc5d80ddfe	00020000-564c-96e0-2624-19e92d912817
00010000-564c-96e1-4aea-51fc5d80ddfe	00020000-564c-96e0-2125-dc9dd8d29772
00010000-564c-96e1-4aea-51fc5d80ddfe	00020000-564c-96e0-b1be-9c3103763918
00010000-564c-96e1-4aea-51fc5d80ddfe	00020000-564c-96e0-628a-edba4f4fea53
00010000-564c-96e1-f484-4b4fb94740b2	00020000-564c-96e0-a5f7-6b3be768f95a
00010000-564c-96e1-f484-4b4fb94740b2	00020000-564c-96e0-911e-ff009b365598
00010000-564c-96e1-f484-4b4fb94740b2	00020000-564c-96e0-357b-1099191e01a5
00010000-564c-96e1-f484-4b4fb94740b2	00020000-564c-96e0-2624-19e92d912817
00010000-564c-96e1-f484-4b4fb94740b2	00020000-564c-96e0-2125-dc9dd8d29772
00010000-564c-96e1-f484-4b4fb94740b2	00020000-564c-96e0-b1be-9c3103763918
00010000-564c-96e1-f484-4b4fb94740b2	00020000-564c-96e0-628a-edba4f4fea53
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-a5f7-6b3be768f95a
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-55a9-013e9880c854
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-911e-ff009b365598
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-3e4f-999c819c8a3b
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-357b-1099191e01a5
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-ce07-aabc61d5daf1
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-2624-19e92d912817
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-2125-dc9dd8d29772
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-b1be-9c3103763918
00010000-564c-96e1-9ba3-561fb8497276	00020000-564c-96e0-628a-edba4f4fea53
00010000-564c-96e1-b972-3b22d5210adc	00020000-564c-96e0-76be-cf8a3828e7b4
00010000-564c-96e1-b972-3b22d5210adc	00020000-564c-96e0-7d00-e406f7bf1f9e
00010000-564c-96e1-b972-3b22d5210adc	00020000-564c-96e0-ce07-aabc61d5daf1
00010000-564c-96e1-b972-3b22d5210adc	00020000-564c-96e0-af38-9d02b6993f0e
00010000-564c-96e1-b972-3b22d5210adc	00020000-564c-96e0-b1be-9c3103763918
00010000-564c-96e1-b972-3b22d5210adc	00020000-564c-96e0-bde7-90166ed3821e
00010000-564c-96e1-b972-3b22d5210adc	00020000-564c-96e0-1829-a178f3d5bacd
\.


--
-- TOC entry 3144 (class 0 OID 28404714)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 28404652)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 28404598)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-564c-96e0-4e6a-cabeb6c86e88	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-564c-96e0-5b19-04770a7c28b2	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-564c-96e0-281b-3c9a39dce2c7	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 28404221)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-564c-96de-461e-0860c34ae100	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-564c-96de-a984-d353f7459f1e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-564c-96de-8517-cbde739e2cc6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-564c-96de-b577-f48d67c9c081	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-564c-96de-e141-3dfff95f9ebe	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 28404213)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-564c-96de-b4fe-0d5018635c51	00230000-564c-96de-b577-f48d67c9c081	popa
00240000-564c-96de-ccfe-5313bf6be2ed	00230000-564c-96de-b577-f48d67c9c081	oseba
00240000-564c-96de-f34f-ee98b61c0c17	00230000-564c-96de-b577-f48d67c9c081	tippopa
00240000-564c-96de-2b5c-29b33802e8b8	00230000-564c-96de-b577-f48d67c9c081	organizacijskaenota
00240000-564c-96de-5bce-b5ed5c43566a	00230000-564c-96de-b577-f48d67c9c081	sezona
00240000-564c-96de-f5c7-19321b0db9bb	00230000-564c-96de-b577-f48d67c9c081	tipvaje
00240000-564c-96de-3cb1-cffdd81e1b72	00230000-564c-96de-a984-d353f7459f1e	prostor
00240000-564c-96de-05e0-8cecefab5540	00230000-564c-96de-b577-f48d67c9c081	besedilo
00240000-564c-96de-e133-9f631bb1e9f2	00230000-564c-96de-b577-f48d67c9c081	uprizoritev
00240000-564c-96de-3fb4-098caadf54f4	00230000-564c-96de-b577-f48d67c9c081	funkcija
00240000-564c-96de-0e1b-9fe8b35665b2	00230000-564c-96de-b577-f48d67c9c081	tipfunkcije
00240000-564c-96de-733d-4b63c8966eaf	00230000-564c-96de-b577-f48d67c9c081	alternacija
00240000-564c-96de-bb93-2e701ab0a2bd	00230000-564c-96de-461e-0860c34ae100	pogodba
00240000-564c-96de-412c-371385c9cc3c	00230000-564c-96de-b577-f48d67c9c081	zaposlitev
00240000-564c-96de-7f70-1e6568d17ff4	00230000-564c-96de-b577-f48d67c9c081	zvrstuprizoritve
00240000-564c-96de-28a7-2ec976fb79bf	00230000-564c-96de-461e-0860c34ae100	programdela
00240000-564c-96de-50a2-915cc896d6e9	00230000-564c-96de-b577-f48d67c9c081	zapis
\.


--
-- TOC entry 3093 (class 0 OID 28404208)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
cc1696c3-bdd4-4f1f-bf86-ce78f9cd5b3a	00240000-564c-96de-b4fe-0d5018635c51	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 28404779)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-564c-96e1-edcf-9283a493bef6	000e0000-564c-96e1-53a9-f5690158d722	00080000-564c-96e1-9224-f588a053942c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-564c-96de-a622-610f2fd3f87e
00270000-564c-96e1-1464-85e52e4603fd	000e0000-564c-96e1-53a9-f5690158d722	00080000-564c-96e1-9224-f588a053942c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-564c-96de-a622-610f2fd3f87e
\.


--
-- TOC entry 3109 (class 0 OID 28404356)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 28404608)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-564c-96e1-caa1-a2491b879a90	00180000-564c-96e1-e451-ae09bb5fdfca	000c0000-564c-96e1-cbd7-b5dcee086b2e	00090000-564c-96e1-4f62-06a0ee8aeb1e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-96e1-53c4-048dc00aa8ed	00180000-564c-96e1-e451-ae09bb5fdfca	000c0000-564c-96e1-7b06-d3bd4280e947	00090000-564c-96e1-3d8a-778595f97da3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-96e1-5ee8-b7aca5521db4	00180000-564c-96e1-e451-ae09bb5fdfca	000c0000-564c-96e1-2b43-89e464e55a32	00090000-564c-96e1-2921-74d01e5fc665	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-96e1-872f-fd889d06ded6	00180000-564c-96e1-e451-ae09bb5fdfca	000c0000-564c-96e1-843c-3ab47a4d03cc	00090000-564c-96e1-bd28-1a8e7829fd8b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-96e1-6c42-d7a5c9173a2b	00180000-564c-96e1-e451-ae09bb5fdfca	000c0000-564c-96e1-b8f8-942c9adae7b9	00090000-564c-96e1-5874-860ca064baea	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564c-96e1-7d5a-0d0e272905be	00180000-564c-96e1-f1c5-ae730e93e016	\N	00090000-564c-96e1-5874-860ca064baea	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-564c-96e1-331e-5ab7f197ffc0	00180000-564c-96e1-f1c5-ae730e93e016	\N	00090000-564c-96e1-3d8a-778595f97da3	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 28404820)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-564c-96de-e3f6-25ef5c78898b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-564c-96de-b6be-340886b520e8	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-564c-96de-fedf-3027f695da1c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-564c-96de-c970-8446c0023c0c	04	Režija	Režija	Režija	umetnik	30
000f0000-564c-96de-c57b-86b3624b2788	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-564c-96de-3fde-75d56861c37b	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-564c-96de-228a-2d533c812fd3	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-564c-96de-6ee1-96e07db2d5aa	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-564c-96de-2ec6-1dbc9e4d26b2	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-564c-96de-dc7f-eb6c882cf84d	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-564c-96de-6b79-b844ca4b24c2	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-564c-96de-e24e-853283d784f0	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-564c-96de-62e0-a7edb17f68a4	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-564c-96de-17d8-b5b862cc2311	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-564c-96de-be70-218fdbb2b75a	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-564c-96de-fd8e-db4f5b4ce759	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-564c-96de-0540-38a82244fee0	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-564c-96de-9832-5846a556c1c7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 28404307)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-564c-96e0-c49b-bfd7c0a8bea3	0001	šola	osnovna ali srednja šola
00400000-564c-96e0-f1f2-92dc2ef2591f	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-564c-96e0-7ee0-017827dec8d4	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 28405113)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-564c-96de-42df-46464bbb0c3a	01	Velika predstava	f	1.00	1.00
002b0000-564c-96de-db1a-551e47c0ffd6	02	Mala predstava	f	0.50	0.50
002b0000-564c-96de-e64e-2f86e0918379	03	Mala koprodukcija	t	0.40	1.00
002b0000-564c-96de-fc99-4db0e5f4fc25	04	Srednja koprodukcija	t	0.70	2.00
002b0000-564c-96de-76fe-4d2cdc224348	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 28404588)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-564c-96de-0887-b7fdc583291a	0001	prva vaja	prva vaja
00420000-564c-96de-1bd6-a9ca341a24ca	0002	tehnična vaja	tehnična vaja
00420000-564c-96de-1b8c-2f9a27845270	0003	lučna vaja	lučna vaja
00420000-564c-96de-4029-139bd021f6f5	0004	kostumska vaja	kostumska vaja
00420000-564c-96de-90d6-7c247f427e85	0005	foto vaja	foto vaja
00420000-564c-96de-2b61-a4a74d8d0490	0006	1. glavna vaja	1. glavna vaja
00420000-564c-96de-429a-225fdff455e2	0007	2. glavna vaja	2. glavna vaja
00420000-564c-96de-fcf3-1609c2c7fca5	0008	1. generalka	1. generalka
00420000-564c-96de-84ea-ed711e92365b	0009	2. generalka	2. generalka
00420000-564c-96de-c70c-31746ff5c1f0	0010	odprta generalka	odprta generalka
00420000-564c-96de-0fc7-0172effc59ea	0011	obnovitvena vaja	obnovitvena vaja
00420000-564c-96de-deef-200718f22aeb	0012	pevska vaja	pevska vaja
00420000-564c-96de-3e99-57c5b214b2d0	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-564c-96de-effb-b57e9bb61a53	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 28404429)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 28404243)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-564c-96df-6bb4-ff6aed5700ef	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JD2nFr1t717HkSz1SuhY8fnLtivDkK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-564c-96e0-5391-af4f05aa1936	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-564c-96e0-d9f3-c62a7d0c05bb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-564c-96e0-8f65-6408a3d21bfb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-564c-96e0-ac3f-38f4615d765c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-564c-96e0-51ca-a4458523e397	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-564c-96e0-ca84-2ef5dad6c0bc	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-564c-96e0-5ec0-7a51cefbd2b4	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-564c-96e0-3cf1-1e7734c855c8	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-564c-96e0-b193-8cffe9e6e689	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-564c-96e0-a65f-94827acbfb67	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-564c-96e1-4051-ed1f035a9189	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-564c-96e1-faea-665a5be0c86f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-564c-96e1-b4ed-d839bf2f0409	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-564c-96e1-b6c6-e90e57bb3154	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-564c-96e1-4aea-51fc5d80ddfe	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-564c-96e1-f484-4b4fb94740b2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-564c-96e1-9ba3-561fb8497276	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-564c-96e1-b972-3b22d5210adc	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-564c-96df-4238-4133a10733d9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 28404870)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-564c-96e1-2a1b-153b16e4aea7	00160000-564c-96e0-9d9a-0e4e998c35c2	\N	00140000-564c-96de-7f78-4fab5816e442	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-564c-96e0-01b5-58fcec671796
000e0000-564c-96e1-53a9-f5690158d722	00160000-564c-96e0-1479-763fc568bcb0	\N	00140000-564c-96de-1076-2b5bde38d4cd	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-564c-96e0-326e-5f0521cd5ce8
000e0000-564c-96e1-0b95-88e3c1307013	\N	\N	00140000-564c-96de-1076-2b5bde38d4cd	00190000-564c-96e1-3acd-85b45fcb2a2c	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564c-96e0-01b5-58fcec671796
000e0000-564c-96e1-7e4a-43312816b0b4	\N	\N	00140000-564c-96de-1076-2b5bde38d4cd	00190000-564c-96e1-3acd-85b45fcb2a2c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564c-96e0-01b5-58fcec671796
000e0000-564c-96e1-0ad7-9b71e8c2d8cd	\N	\N	00140000-564c-96de-1076-2b5bde38d4cd	00190000-564c-96e1-3acd-85b45fcb2a2c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-564c-96e0-f18d-a7e1eab83648
000e0000-564c-96e1-7e4a-e3cccd2ad765	\N	\N	00140000-564c-96de-1076-2b5bde38d4cd	00190000-564c-96e1-3acd-85b45fcb2a2c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-564c-96e0-f18d-a7e1eab83648
\.


--
-- TOC entry 3123 (class 0 OID 28404528)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-564c-96e1-3732-eebcdd8e9f16	\N	000e0000-564c-96e1-53a9-f5690158d722	1	
00200000-564c-96e1-26ae-319e1b63b15a	\N	000e0000-564c-96e1-53a9-f5690158d722	2	
00200000-564c-96e1-6046-2b68859f0174	\N	000e0000-564c-96e1-53a9-f5690158d722	3	
00200000-564c-96e1-ecff-459f66407b62	\N	000e0000-564c-96e1-53a9-f5690158d722	4	
00200000-564c-96e1-cfbe-85ef5aaf9d4d	\N	000e0000-564c-96e1-53a9-f5690158d722	5	
\.


--
-- TOC entry 3140 (class 0 OID 28404679)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 28404793)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-564c-96de-78ea-ee4727d305e2	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-564c-96de-0259-1f9c6a4169ef	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-564c-96de-ac36-b5b63c029063	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-564c-96de-2aab-afbed58e1700	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-564c-96de-9fbd-3f8601856780	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-564c-96de-83fb-d44950facfc3	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-564c-96de-2297-10ec61c9747b	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-564c-96de-4250-e53a8ace2693	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-564c-96de-a622-610f2fd3f87e	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-564c-96de-2c52-b4468afe9c2d	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-564c-96de-4b87-e4860a56216d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-564c-96de-cfa6-9e86c0c5c241	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-564c-96de-ca09-85ce0e5c1c26	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-564c-96de-828a-b728e6aa3c11	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-564c-96de-f853-2f4fa8ad696e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-564c-96de-a130-75a5b3232ae3	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-564c-96de-b41f-c8b8ddabc20b	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-564c-96de-cefb-291624168723	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-564c-96de-bc8c-30d72d81bb6d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-564c-96de-210d-0c2183c8a5ba	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-564c-96de-d4fc-ae91557eca61	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-564c-96de-68ba-dacd6add82ec	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-564c-96de-9a09-cbbf4147337b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-564c-96de-62dc-7c111b06b494	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-564c-96de-74df-e9b30d2fe716	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-564c-96de-3056-94dfecfcbb40	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-564c-96de-a36c-596eb48ff0ce	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-564c-96de-19d3-480d32ff8861	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 28405163)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 28405132)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 28405175)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 28404751)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-564c-96e1-ce4d-22618e92fd3a	00090000-564c-96e1-3d8a-778595f97da3	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-96e1-20ad-4109c04c0626	00090000-564c-96e1-2921-74d01e5fc665	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-96e1-5ef6-f1a06e1fe06e	00090000-564c-96e1-7c53-5aa63a87f4cd	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-96e1-41fe-5267d9a14843	00090000-564c-96e1-3c35-3e9767a6f4aa	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-96e1-c8f9-bcdc8f1b6b9e	00090000-564c-96e1-856a-c7f032eece1c	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564c-96e1-0ba8-4c08b78d0ba5	00090000-564c-96e1-3385-17ca000edd7d	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 28404572)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 28404860)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-564c-96de-7f78-4fab5816e442	01	Drama	drama (SURS 01)
00140000-564c-96de-5a79-a4dc9d47a75d	02	Opera	opera (SURS 02)
00140000-564c-96de-ec74-b03126d8232f	03	Balet	balet (SURS 03)
00140000-564c-96de-6794-ac95ccf6d3fc	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-564c-96de-1093-b8f6edb90030	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-564c-96de-1076-2b5bde38d4cd	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-564c-96de-dd55-e33a1aa6ad08	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 28404741)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 28404306)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 28404919)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 28404909)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 28404297)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 28404776)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 28404818)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 28405216)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 28404560)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 28404582)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 28404587)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 28405130)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 28404455)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 28404987)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 28404737)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 28404526)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 28404493)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 28404469)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 28404644)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 28405193)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 28405200)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 28405224)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2726 (class 2606 OID 28404671)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 28404427)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 28404325)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 28404389)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 28404352)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 28404286)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 28404271)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 28404677)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 28404713)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 28404855)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 28404380)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 28404415)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 28405082)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 28404650)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 28404405)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 28404545)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 28404514)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 28404506)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 28404662)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 28405091)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 28405099)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 28405069)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 28405111)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 28404695)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 28404635)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 28404626)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 28404842)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 28404769)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 28404481)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 28404242)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 28404704)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 28404260)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 28404280)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 28404722)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 28404657)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 28404606)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 28404230)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 28404218)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 28404212)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 28404789)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 28404361)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 28404617)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 28404829)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 28404314)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 28405123)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 28404595)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 28404440)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 28404255)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 28404888)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 28404535)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 28404685)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 28404801)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 28405173)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 28405157)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 28405181)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 28404759)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 28404576)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 28404868)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 28404749)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 28404570)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 28404571)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 28404569)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 28404568)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 28404567)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 28404790)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 28404791)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 28404792)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 28405195)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 28405194)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 28404382)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 28404383)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 28404678)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 28405161)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 28405160)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 28405162)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 28405159)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 28405158)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 28404664)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 28404663)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 28404536)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 28404537)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 28404738)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 28404740)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 28404739)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 28404471)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 28404470)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 28405112)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 28404857)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 28404858)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 28404859)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 28405182)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 28404893)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 28404890)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 28404894)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 28404892)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 28404891)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 28404442)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 28404441)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 28404355)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 28404705)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 28404287)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 28404288)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 28404725)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 28404724)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 28404723)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 28404392)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 28404391)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 28404393)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 28404509)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 28404507)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 28404508)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 28404220)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 28404630)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 28404628)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 28404627)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 28404629)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 28404261)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 28404262)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 28404686)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 28405217)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 28404778)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 28404777)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 28405225)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 28405226)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 28404651)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 28404770)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 28404771)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 28404992)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 28404991)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 28404988)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 28404989)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 28404990)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 28404407)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 28404406)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 28404408)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 28404699)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 28404698)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 28405092)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 28405093)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 28404923)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 28404924)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 28404921)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 28404922)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 28404760)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 28404761)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 28404639)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 28404638)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 28404636)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 28404637)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 28404911)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 28404910)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 28404482)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 28404496)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 28404495)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 28404494)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 28404497)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 28404527)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 28404515)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 28404516)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 28405083)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 28405131)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 28405201)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 28405202)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 28404327)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 28404326)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 28404362)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 28404363)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 28404577)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 28404620)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 28404619)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 28404618)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 28404562)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 28404563)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 28404566)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 28404561)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 28404565)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 28404564)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 28404381)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 28404315)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 28404316)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 28404456)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 28404458)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 28404457)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 28404459)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 28404645)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 28404856)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 28404889)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 28404830)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 28404831)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 28404353)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 28404354)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 28404750)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 28404231)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 28404428)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 28404390)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 28404219)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 28405124)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 28404697)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 28404696)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 28404596)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 28404597)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 28404920)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 28404416)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 28404869)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 28405174)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 28405100)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 28405101)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 28404819)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 28404607)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 28404281)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 28405397)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 28405402)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 28405427)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 28405417)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 28405392)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 28405412)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 28405422)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 28405407)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 28405597)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 28405602)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 28405607)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 28405772)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 28405767)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 28405282)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 28405287)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 28405512)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 28405752)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 28405747)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 28405757)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 28405742)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 28405737)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 28405507)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 28405502)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 28405382)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 28405387)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 28405552)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 28405562)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 28405557)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 28405337)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 28405332)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 28405492)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 28405727)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 28405612)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 28405617)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 28405622)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 28405762)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 28405642)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 28405627)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 28405647)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 28405637)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 28405632)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 28405327)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 28405322)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 28405267)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 28405262)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 28405532)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 28405242)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 28405247)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 28405547)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 28405542)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 28405537)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 28405297)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 28405292)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 28405302)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 28405362)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 28405352)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 28405357)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 28405227)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 28405467)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 28405457)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 28405452)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 28405462)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 28405232)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 28405237)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 28405517)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 28405787)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 28405592)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 28405587)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 28405792)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 28405797)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 28405497)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 28405577)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 28405582)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 28405702)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 28405697)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 28405682)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 28405687)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 28405692)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 28405312)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 28405307)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 28405317)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 28405527)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 28405522)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 28405712)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 28405717)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 28405672)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 28405677)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 28405662)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 28405667)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 28405567)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 28405572)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 28405487)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 28405482)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 28405472)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 28405477)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 28405657)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 28405652)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 28405342)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 28405347)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 28405377)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 28405367)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 28405372)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 28405707)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 28405722)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 28405732)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 28405777)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 28405782)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 28405257)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 28405252)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 28405272)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 28405277)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 28405432)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 28405447)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 28405442)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 28405437)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-18 16:19:01 CET

--
-- PostgreSQL database dump complete
--

