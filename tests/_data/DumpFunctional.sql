--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-04 16:18:11 CET

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
-- TOC entry 183 (class 1259 OID 25192018)
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
-- TOC entry 237 (class 1259 OID 25192632)
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
-- TOC entry 236 (class 1259 OID 25192615)
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
-- TOC entry 182 (class 1259 OID 25192011)
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
-- TOC entry 181 (class 1259 OID 25192009)
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
-- TOC entry 227 (class 1259 OID 25192492)
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
-- TOC entry 230 (class 1259 OID 25192522)
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
-- TOC entry 251 (class 1259 OID 25192919)
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
-- TOC entry 203 (class 1259 OID 25192266)
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
-- TOC entry 205 (class 1259 OID 25192298)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25192303)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 25192845)
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
-- TOC entry 194 (class 1259 OID 25192163)
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
-- TOC entry 238 (class 1259 OID 25192645)
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
-- TOC entry 223 (class 1259 OID 25192446)
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
-- TOC entry 200 (class 1259 OID 25192237)
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
-- TOC entry 197 (class 1259 OID 25192203)
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
-- TOC entry 195 (class 1259 OID 25192180)
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
-- TOC entry 212 (class 1259 OID 25192360)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 25192900)
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
-- TOC entry 250 (class 1259 OID 25192912)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25192934)
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
-- TOC entry 170 (class 1259 OID 25157733)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 25192385)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 25192137)
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
-- TOC entry 185 (class 1259 OID 25192037)
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
-- TOC entry 189 (class 1259 OID 25192104)
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
-- TOC entry 186 (class 1259 OID 25192048)
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
-- TOC entry 178 (class 1259 OID 25191983)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 25192002)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 25192392)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 25192426)
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
-- TOC entry 233 (class 1259 OID 25192563)
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
-- TOC entry 188 (class 1259 OID 25192084)
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
-- TOC entry 191 (class 1259 OID 25192129)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 25192790)
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
-- TOC entry 213 (class 1259 OID 25192366)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 25192114)
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
-- TOC entry 202 (class 1259 OID 25192258)
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
-- TOC entry 198 (class 1259 OID 25192218)
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
-- TOC entry 199 (class 1259 OID 25192230)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25192378)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 25192804)
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
-- TOC entry 242 (class 1259 OID 25192814)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 25192713)
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
-- TOC entry 243 (class 1259 OID 25192822)
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
-- TOC entry 219 (class 1259 OID 25192407)
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
-- TOC entry 211 (class 1259 OID 25192351)
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
-- TOC entry 210 (class 1259 OID 25192341)
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
-- TOC entry 232 (class 1259 OID 25192552)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 25192482)
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
-- TOC entry 196 (class 1259 OID 25192192)
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
-- TOC entry 175 (class 1259 OID 25191954)
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
-- TOC entry 174 (class 1259 OID 25191952)
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
-- TOC entry 220 (class 1259 OID 25192420)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 25191992)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 25191976)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25192434)
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
-- TOC entry 214 (class 1259 OID 25192372)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 25192318)
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
-- TOC entry 173 (class 1259 OID 25191941)
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
-- TOC entry 172 (class 1259 OID 25191933)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 25191928)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 25192499)
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
-- TOC entry 187 (class 1259 OID 25192076)
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
-- TOC entry 209 (class 1259 OID 25192328)
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
-- TOC entry 231 (class 1259 OID 25192540)
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
-- TOC entry 184 (class 1259 OID 25192027)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 25192833)
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
-- TOC entry 207 (class 1259 OID 25192308)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 25192149)
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
-- TOC entry 176 (class 1259 OID 25191963)
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
-- TOC entry 235 (class 1259 OID 25192590)
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
-- TOC entry 201 (class 1259 OID 25192248)
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
-- TOC entry 218 (class 1259 OID 25192399)
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
-- TOC entry 229 (class 1259 OID 25192513)
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
-- TOC entry 247 (class 1259 OID 25192880)
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
-- TOC entry 246 (class 1259 OID 25192852)
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
-- TOC entry 248 (class 1259 OID 25192892)
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
-- TOC entry 225 (class 1259 OID 25192471)
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
-- TOC entry 204 (class 1259 OID 25192292)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 25192580)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 25192461)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 25192014)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 25191957)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 25192018)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-563a-21b0-238b-2a65c2b7517c	10	30	Otroci	Abonma za otroke	200
000a0000-563a-21b0-6ef8-c71708a7972f	20	60	Mladina	Abonma za mladino	400
000a0000-563a-21b0-ec6b-86d8508d23ad	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3155 (class 0 OID 25192632)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-563a-21b0-e3dd-fce338785cfc	000d0000-563a-21b0-4705-b45908734baa	\N	00090000-563a-21b0-55b4-4f319e713636	000b0000-563a-21b0-b2f1-5df055f7e571	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-563a-21b0-e47a-a20efcc98e7d	000d0000-563a-21b0-bd7c-e3e1036610ee	00100000-563a-21b0-71c9-5dc0f75ca740	00090000-563a-21b0-15ab-f5f89033b481	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-563a-21b0-06b9-3e822c568213	000d0000-563a-21b0-2420-583276059b5e	00100000-563a-21b0-340d-04a6c36ae043	00090000-563a-21b0-4b49-a17aef35c2bd	\N	0003	t	\N	2015-11-04	\N	2	t	\N	f	f
000c0000-563a-21b0-407f-c9337cb86fd5	000d0000-563a-21b0-581c-1813d662833e	\N	00090000-563a-21b0-8fd3-e83aac658b68	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-563a-21b0-ac04-d939defd3f2e	000d0000-563a-21b0-3b20-775ee636157d	\N	00090000-563a-21b0-9617-13a43425c50a	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-563a-21b0-e4f4-603c762494e1	000d0000-563a-21b0-5b8f-77f5d1523983	\N	00090000-563a-21b0-23ca-2b2ea6486f79	000b0000-563a-21b0-ad7b-4bf26f2f0bed	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-563a-21b0-964a-177e083d1b59	000d0000-563a-21b0-906b-9b7b15fc9dc5	00100000-563a-21b0-726f-90b0c2a5f040	00090000-563a-21b0-f936-9d3ef34686d8	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-563a-21b0-ce2c-dc9783fdcb1a	000d0000-563a-21b0-dafe-b02123ee1e50	\N	00090000-563a-21b0-e908-8f900e681800	000b0000-563a-21b0-6998-e4616ae59e1b	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-563a-21b0-7fec-dd5c86029388	000d0000-563a-21b0-906b-9b7b15fc9dc5	00100000-563a-21b0-9598-63b5c6427be3	00090000-563a-21b0-f06e-9be737f5aa64	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-563a-21b0-63bc-6ff7521f8067	000d0000-563a-21b0-906b-9b7b15fc9dc5	00100000-563a-21b0-6394-008753fc48c1	00090000-563a-21b0-6fbe-f2bacd44cac7	\N	0010	t	\N	2015-11-04	\N	16	f	\N	f	t
000c0000-563a-21b0-7775-26ebe0ad7ded	000d0000-563a-21b0-906b-9b7b15fc9dc5	00100000-563a-21b0-e317-b301b1e481b4	00090000-563a-21b0-049a-16124e95c94e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-563a-21b0-272c-d5cfcc578234	000d0000-563a-21b0-78d5-ae3f0c091349	00100000-563a-21b0-71c9-5dc0f75ca740	00090000-563a-21b0-15ab-f5f89033b481	000b0000-563a-21b0-7729-f0085b93f227	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3154 (class 0 OID 25192615)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 25192011)
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
-- TOC entry 3145 (class 0 OID 25192492)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-563a-21b0-dba5-b3b62143e5c4	00160000-563a-21b0-c56d-f77396085055	00090000-563a-21b0-3c30-b06478e9c617	aizv	10	t
003d0000-563a-21b0-3a61-3577b80846bb	00160000-563a-21b0-c56d-f77396085055	00090000-563a-21b0-4057-6093a4dd53eb	apri	14	t
003d0000-563a-21b0-4108-090fd841ade6	00160000-563a-21b0-2e84-3041376ca026	00090000-563a-21b0-f4da-0a2c961a6a13	aizv	11	t
003d0000-563a-21b0-3b65-fabf61a0307e	00160000-563a-21b0-3311-7d6878ed1a62	00090000-563a-21b0-de55-c6227f1e4a12	aizv	12	t
003d0000-563a-21b0-0faf-9a0cf7b211c3	00160000-563a-21b0-c56d-f77396085055	00090000-563a-21b0-2cdf-b1ee3b34fcd2	apri	18	f
\.


--
-- TOC entry 3148 (class 0 OID 25192522)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-563a-21b0-c56d-f77396085055	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-563a-21b0-2e84-3041376ca026	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-563a-21b0-3311-7d6878ed1a62	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3169 (class 0 OID 25192919)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 25192266)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-563a-21b0-d94c-9a018cfe527b	\N	\N	00200000-563a-21b0-8d44-8ca0aaa52783	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-563a-21b0-4dd0-82d0d6bdc0d7	\N	\N	00200000-563a-21b0-5377-fdc2ab98c6a3	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-563a-21b0-233b-0db0aa82f60e	\N	\N	00200000-563a-21b0-e3d8-cb08cfc3caa4	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-563a-21b0-86d7-7d62c7a1e3a5	\N	\N	00200000-563a-21b0-f50e-79435b3400e5	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-563a-21b0-f460-15e3443d0a6d	\N	\N	00200000-563a-21b0-e45b-4eda9114d225	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3123 (class 0 OID 25192298)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 25192303)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 25192845)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 25192163)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-563a-21ae-3834-33214a0ad1a5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-563a-21ae-2b1a-a4530e764513	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-563a-21ae-18f9-7b793c5c7839	AL	ALB	008	Albania 	Albanija	\N
00040000-563a-21ae-f176-59cbbf38155d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-563a-21ae-3393-ff4f12ef03da	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-563a-21ae-ac55-0a63cabb0580	AD	AND	020	Andorra 	Andora	\N
00040000-563a-21ae-ae5a-eda9ef9d5bd8	AO	AGO	024	Angola 	Angola	\N
00040000-563a-21ae-2fe1-135a1b3afaf1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-563a-21ae-37d7-ca6dac2bffbb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-563a-21ae-0176-dbe54f496010	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-563a-21ae-7da3-6b849eaf4b50	AR	ARG	032	Argentina 	Argenitna	\N
00040000-563a-21ae-6295-a282f1ae0ce8	AM	ARM	051	Armenia 	Armenija	\N
00040000-563a-21ae-8865-30c1f394e60e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-563a-21ae-1acf-2b2fbff94768	AU	AUS	036	Australia 	Avstralija	\N
00040000-563a-21ae-1644-69ad46f776a7	AT	AUT	040	Austria 	Avstrija	\N
00040000-563a-21ae-0782-035b3ac6da8b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-563a-21ae-f86c-df81519b260f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-563a-21ae-5472-85b55c74ca26	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-563a-21ae-01dc-722ff371c4eb	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-563a-21ae-d972-1a04b437b96d	BB	BRB	052	Barbados 	Barbados	\N
00040000-563a-21ae-b60e-55b7b51aa05a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-563a-21ae-6250-8556e354f524	BE	BEL	056	Belgium 	Belgija	\N
00040000-563a-21ae-2a01-9d6adc242a62	BZ	BLZ	084	Belize 	Belize	\N
00040000-563a-21ae-a3d7-466d183b5f87	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-563a-21ae-740b-e3150592ae4b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-563a-21ae-eedf-5c1d7dfcb79d	BT	BTN	064	Bhutan 	Butan	\N
00040000-563a-21ae-bbae-3288b1f67e04	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-563a-21ae-3e08-04002c7505ba	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-563a-21ae-ba2b-f7ec234379fc	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-563a-21ae-b9a8-5438e92bf282	BW	BWA	072	Botswana 	Bocvana	\N
00040000-563a-21ae-30fb-10b4168be10a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-563a-21ae-7459-2bc49df08c56	BR	BRA	076	Brazil 	Brazilija	\N
00040000-563a-21ae-dceb-9a8cebc1d796	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-563a-21ae-b49a-05946b49e2f8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-563a-21ae-8898-9a18d1d57c1f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-563a-21ae-ee3b-a11de488edc9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-563a-21ae-8ebe-10d149bc89cc	BI	BDI	108	Burundi 	Burundi 	\N
00040000-563a-21ae-fe0d-45d86e50936a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-563a-21ae-f190-6771faef1509	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-563a-21ae-e3f3-139ac8419864	CA	CAN	124	Canada 	Kanada	\N
00040000-563a-21ae-ad21-4be6dadeb050	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-563a-21ae-893b-6d6cb7e0a339	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-563a-21ae-753d-1bb7f9e9d3fb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-563a-21ae-85e3-468f324c4c4c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-563a-21ae-0810-d6f119057ab2	CL	CHL	152	Chile 	Čile	\N
00040000-563a-21ae-b4dd-bb47289c96e7	CN	CHN	156	China 	Kitajska	\N
00040000-563a-21ae-121f-78fe671b1013	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-563a-21ae-f72d-bf4cb64e2cc0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-563a-21ae-d59f-7f56096d790c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-563a-21ae-3d3e-4bb1bbed8ac4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-563a-21ae-fc40-cb12c8119988	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-563a-21ae-8965-5eff72c8801d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-563a-21ae-6065-99cadbd8e147	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-563a-21ae-897e-06fbbdcd79c0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-563a-21ae-6d4d-aaf4121dbaa5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-563a-21ae-46d8-79fbfcc23bee	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-563a-21ae-d947-accd76c8c389	CU	CUB	192	Cuba 	Kuba	\N
00040000-563a-21ae-6ba5-a281cb4c1afb	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-563a-21ae-f999-8842780514af	CY	CYP	196	Cyprus 	Ciper	\N
00040000-563a-21ae-d95a-72cf47b09213	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-563a-21ae-35c8-7fcf19b77cb0	DK	DNK	208	Denmark 	Danska	\N
00040000-563a-21ae-d5d1-fbb7da337e23	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-563a-21ae-df8b-f9ee1125661f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-563a-21ae-0f66-e5131f4e2c33	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-563a-21ae-d6e5-5f5666c1c743	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-563a-21ae-b873-986f0530b146	EG	EGY	818	Egypt 	Egipt	\N
00040000-563a-21ae-954f-2c702cbc9689	SV	SLV	222	El Salvador 	Salvador	\N
00040000-563a-21ae-49f4-61cb571655ce	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-563a-21ae-96ce-d01143038736	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-563a-21ae-bfa4-965b82d5a1dd	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-563a-21ae-7468-a870b5629de6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-563a-21ae-f9a9-b77203b308dc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-563a-21ae-844d-8efedfef563f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-563a-21ae-f895-5d2f13e3ab4a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-563a-21ae-9569-3fbcdbb6d1db	FI	FIN	246	Finland 	Finska	\N
00040000-563a-21ae-983c-2cf5a3edd72c	FR	FRA	250	France 	Francija	\N
00040000-563a-21ae-ad84-03a8ac513b8a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-563a-21ae-0199-edf81b7d915e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-563a-21ae-b173-f07daf432eb2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-563a-21ae-6015-38f2a72dead6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-563a-21ae-2a98-8cb0e28eb1ac	GA	GAB	266	Gabon 	Gabon	\N
00040000-563a-21ae-f3d3-3f8f4f908c42	GM	GMB	270	Gambia 	Gambija	\N
00040000-563a-21ae-439b-061947e43e59	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-563a-21ae-5fef-64c0fbd3aada	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-563a-21ae-0323-c5897efa7e04	GH	GHA	288	Ghana 	Gana	\N
00040000-563a-21ae-bfeb-6ded2a89ccb3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-563a-21ae-bb33-0ec3ee4a8a18	GR	GRC	300	Greece 	Grčija	\N
00040000-563a-21ae-2984-7c48c6a1ec5a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-563a-21ae-2625-6ad9ca79e0e2	GD	GRD	308	Grenada 	Grenada	\N
00040000-563a-21ae-8552-3f80549ff2f8	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-563a-21ae-7ac7-9e09f64f37e4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-563a-21ae-dce4-f57c199f6ed8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-563a-21ae-99d9-8168c9362277	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-563a-21ae-9f7e-32a1ec665441	GN	GIN	324	Guinea 	Gvineja	\N
00040000-563a-21ae-464a-ce9becd92fbc	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-563a-21ae-5a76-72da8d402329	GY	GUY	328	Guyana 	Gvajana	\N
00040000-563a-21ae-bcc4-3273e0594cac	HT	HTI	332	Haiti 	Haiti	\N
00040000-563a-21ae-5d9c-2fcfb7050ca0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-563a-21ae-08f0-b57d8bc77795	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-563a-21ae-7272-8c6e7268bf95	HN	HND	340	Honduras 	Honduras	\N
00040000-563a-21ae-daa3-66a0ad22a572	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-563a-21ae-d2b9-f07067690748	HU	HUN	348	Hungary 	Madžarska	\N
00040000-563a-21ae-e557-c5fdc03a2cd1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-563a-21ae-2a20-715b925d59cf	IN	IND	356	India 	Indija	\N
00040000-563a-21ae-a11a-328969070587	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-563a-21ae-b8ba-ede8ec841142	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-563a-21ae-b8aa-f63f4a1efc6d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-563a-21ae-c112-e40e5e2d5e12	IE	IRL	372	Ireland 	Irska	\N
00040000-563a-21ae-48ad-981e9b5dd0d3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-563a-21ae-70b3-94864bf4aeff	IL	ISR	376	Israel 	Izrael	\N
00040000-563a-21ae-87ae-e3812ed0da73	IT	ITA	380	Italy 	Italija	\N
00040000-563a-21ae-36b0-c8a61d394595	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-563a-21ae-beb5-29580fcbda30	JP	JPN	392	Japan 	Japonska	\N
00040000-563a-21ae-25ff-a9ceec0081c4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-563a-21ae-f3a2-0ba8fcaf16bd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-563a-21ae-5be6-d2cfb5f99353	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-563a-21ae-67c3-77ae98c72f06	KE	KEN	404	Kenya 	Kenija	\N
00040000-563a-21ae-ba95-dc9f029e5f6b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-563a-21ae-f61c-e090dac9ff85	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-563a-21ae-55b3-794b7fcb9d8b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-563a-21ae-57c7-5d17ed87b14a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-563a-21ae-abaa-2200e14b8562	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-563a-21ae-06ba-1615109aa21d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-563a-21ae-49af-2cc56d170bd4	LV	LVA	428	Latvia 	Latvija	\N
00040000-563a-21ae-4e53-69bdb5d6f4eb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-563a-21ae-a4a7-0a292814763c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-563a-21ae-431a-10af49349d5e	LR	LBR	430	Liberia 	Liberija	\N
00040000-563a-21ae-a27f-a2e7aa93739d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-563a-21ae-04ce-0dce14439599	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-563a-21ae-c40b-06c68a644958	LT	LTU	440	Lithuania 	Litva	\N
00040000-563a-21ae-a7c8-9efe7f1d866a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-563a-21ae-3303-d7de11d25c33	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-563a-21ae-86bb-d1f58fcfe758	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-563a-21ae-4253-f15d196ceb94	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-563a-21ae-2599-3af618654a75	MW	MWI	454	Malawi 	Malavi	\N
00040000-563a-21ae-b3e0-36fb28cd3e40	MY	MYS	458	Malaysia 	Malezija	\N
00040000-563a-21ae-fde4-ef7ab756da18	MV	MDV	462	Maldives 	Maldivi	\N
00040000-563a-21ae-d368-c0b2e1336484	ML	MLI	466	Mali 	Mali	\N
00040000-563a-21ae-81c5-511f586ead78	MT	MLT	470	Malta 	Malta	\N
00040000-563a-21ae-2bf9-de102a6ae945	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-563a-21ae-e661-277e3eef86b7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-563a-21ae-0c11-9e0485eaa262	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-563a-21ae-3c66-5461f6d9e1b8	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-563a-21ae-3a61-be1993656633	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-563a-21ae-d15f-7bfc4f0ad171	MX	MEX	484	Mexico 	Mehika	\N
00040000-563a-21ae-05e2-c56379f0fdd7	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-563a-21ae-0b53-07a1341b908e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-563a-21ae-4572-11a25d8ff555	MC	MCO	492	Monaco 	Monako	\N
00040000-563a-21ae-54ae-890b6a3dd33c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-563a-21ae-acfe-ebea7a0ba2c0	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-563a-21ae-c91a-989fb95655df	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-563a-21ae-faae-13fc9cd383f0	MA	MAR	504	Morocco 	Maroko	\N
00040000-563a-21ae-c0b8-932abe23cf6c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-563a-21ae-357a-278471d36c82	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-563a-21ae-774b-4f24f661d083	NA	NAM	516	Namibia 	Namibija	\N
00040000-563a-21ae-a04f-cafaf48ba57c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-563a-21ae-9717-f3653c2593cc	NP	NPL	524	Nepal 	Nepal	\N
00040000-563a-21ae-1207-25e3f5659638	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-563a-21ae-eada-3eb7a3192805	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-563a-21ae-22de-dd29aae73ec6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-563a-21ae-c322-3b978220ee11	NE	NER	562	Niger 	Niger 	\N
00040000-563a-21ae-8278-6fef77798488	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-563a-21ae-eb7e-13d0922d8f7b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-563a-21ae-88a8-198eecc3ebb1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-563a-21ae-a283-3204ae16675b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-563a-21ae-5c96-ae872f21647d	NO	NOR	578	Norway 	Norveška	\N
00040000-563a-21ae-a749-c7f54cccbc81	OM	OMN	512	Oman 	Oman	\N
00040000-563a-21ae-076c-0bf89b549015	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-563a-21ae-3274-082fc620e360	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-563a-21ae-9da3-0a84d20d3a60	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-563a-21ae-4bc6-0f2381e82bad	PA	PAN	591	Panama 	Panama	\N
00040000-563a-21ae-160c-86d8208de169	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-563a-21ae-c517-7250f7cad8fd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-563a-21ae-3061-cdadd94b72ec	PE	PER	604	Peru 	Peru	\N
00040000-563a-21ae-c4c6-afb093f2f08c	PH	PHL	608	Philippines 	Filipini	\N
00040000-563a-21ae-5058-c56eb31647b1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-563a-21ae-7e77-ff77ba094188	PL	POL	616	Poland 	Poljska	\N
00040000-563a-21ae-6360-62995a7b2c0e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-563a-21ae-1c9c-27a9def40a7a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-563a-21ae-c83f-c21230fb77fb	QA	QAT	634	Qatar 	Katar	\N
00040000-563a-21ae-cd0b-63c01058bd2d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-563a-21ae-527b-dbc9354faa59	RO	ROU	642	Romania 	Romunija	\N
00040000-563a-21ae-c063-332f850ac95d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-563a-21ae-3ef7-24eeee4a1dae	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-563a-21ae-3547-7726cefbd547	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-563a-21ae-7a30-823f72c6ac86	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-563a-21ae-c6c7-0ba291441ffd	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-563a-21ae-9548-4b881d45316d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-563a-21ae-d25d-9f94d7e5a7dd	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-563a-21ae-ea36-7f452d8e980c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-563a-21ae-cd7e-1aa70dc26d24	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-563a-21ae-1f89-d9455ee8fe75	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-563a-21ae-bc12-5bf7009b8aab	SM	SMR	674	San Marino 	San Marino	\N
00040000-563a-21ae-96b2-92d3b261bced	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-563a-21ae-e6f3-2a2e170095d8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-563a-21ae-8aee-f76c5fe6eadd	SN	SEN	686	Senegal 	Senegal	\N
00040000-563a-21ae-567b-de8770ae062a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-563a-21ae-b713-845538c1e559	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-563a-21ae-7cbe-db76ea6697ba	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-563a-21ae-731b-3b26e94b86dd	SG	SGP	702	Singapore 	Singapur	\N
00040000-563a-21ae-1f9b-cb7dbac92956	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-563a-21ae-5ee1-799f6bf286ca	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-563a-21ae-8b9a-90e66775e5bb	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-563a-21ae-d337-74bd6619aefc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-563a-21ae-094b-d39d417652e4	SO	SOM	706	Somalia 	Somalija	\N
00040000-563a-21ae-c112-9237de5cf5aa	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-563a-21ae-2643-8a2ec6b42dd6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-563a-21ae-2114-f9553f094cf5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-563a-21ae-abef-ef18da77cc6e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-563a-21ae-e175-d2067fb61dde	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-563a-21ae-5762-9ea702a31a56	SD	SDN	729	Sudan 	Sudan	\N
00040000-563a-21ae-d2d5-bcac6408504c	SR	SUR	740	Suriname 	Surinam	\N
00040000-563a-21ae-a2dd-0b5f51b9945f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-563a-21ae-4df2-4072740561d9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-563a-21ae-da5f-cc9e60fc5fd7	SE	SWE	752	Sweden 	Švedska	\N
00040000-563a-21ae-190d-b492e5224d0a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-563a-21ae-0680-1620f4f5d1f9	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-563a-21ae-ace5-48c4bd031c75	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-563a-21ae-f5c3-9611c4000cd9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-563a-21ae-2903-b6678bbeab9a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-563a-21ae-1329-dee346b5c359	TH	THA	764	Thailand 	Tajska	\N
00040000-563a-21ae-eb62-c95c957a4684	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-563a-21ae-38a5-ecf77911a019	TG	TGO	768	Togo 	Togo	\N
00040000-563a-21ae-de7a-dc6256a024dd	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-563a-21ae-df29-9225d87e8713	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-563a-21ae-8f4f-2889ec4b1dcd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-563a-21ae-0624-794ac65a655a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-563a-21ae-5269-b920c12b794b	TR	TUR	792	Turkey 	Turčija	\N
00040000-563a-21ae-465e-1b0bc6b30cf3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-563a-21ae-06bc-6f245bde1fb6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563a-21ae-71d6-99452b0773b0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-563a-21ae-e532-93d081f276e8	UG	UGA	800	Uganda 	Uganda	\N
00040000-563a-21ae-02aa-03898830283b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-563a-21ae-c1c6-68000499a528	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-563a-21ae-1800-f5ac9bd86d9a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-563a-21ae-356a-3494caa07dc0	US	USA	840	United States 	Združene države Amerike	\N
00040000-563a-21ae-b919-66ac263ad17b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-563a-21ae-24bc-d7ba4280afdf	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-563a-21ae-a419-95a2c0fd55d5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-563a-21ae-752a-af1ebdfe7e08	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-563a-21ae-c427-9edb0ea5d7da	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-563a-21ae-1e52-43d8830e628e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-563a-21ae-8bce-27296069f89f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563a-21ae-8468-9545a2aca87e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-563a-21ae-fe43-e17b47482a92	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-563a-21ae-4617-fe8fe1cf3099	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-563a-21ae-d838-b160b4d58625	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-563a-21ae-1bef-ed02624d359e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-563a-21ae-eeae-c0bed00b82a7	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 25192645)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-563a-21b0-5366-b527d8d9784f	000e0000-563a-21b0-d1fa-be2801aa4953	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563a-21ae-fad3-c421834b0985	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563a-21b0-c57e-6347ffe69a6f	000e0000-563a-21b0-2b62-58c22c36210d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563a-21ae-c075-fb9efec9c687	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563a-21b0-96e0-46bb810bf31d	000e0000-563a-21b0-350e-acf193f42e68	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563a-21ae-fad3-c421834b0985	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563a-21b0-1ebb-418093721f18	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563a-21b0-40af-6190303bf0fc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 25192446)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-563a-21b0-906b-9b7b15fc9dc5	000e0000-563a-21b0-2b62-58c22c36210d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-563a-21ae-72f7-7e5f9ce2eab4
000d0000-563a-21b0-4705-b45908734baa	000e0000-563a-21b0-2b62-58c22c36210d	000c0000-563a-21b0-e3dd-fce338785cfc	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-563a-21ae-72f7-7e5f9ce2eab4
000d0000-563a-21b0-bd7c-e3e1036610ee	000e0000-563a-21b0-2b62-58c22c36210d	000c0000-563a-21b0-e47a-a20efcc98e7d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-563a-21ae-42f5-0ab8376aa5e6
000d0000-563a-21b0-2420-583276059b5e	000e0000-563a-21b0-2b62-58c22c36210d	000c0000-563a-21b0-06b9-3e822c568213	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-563a-21ae-fc79-221a0adc15c3
000d0000-563a-21b0-581c-1813d662833e	000e0000-563a-21b0-2b62-58c22c36210d	000c0000-563a-21b0-407f-c9337cb86fd5	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-563a-21ae-bf4b-1b939fe1f698
000d0000-563a-21b0-3b20-775ee636157d	000e0000-563a-21b0-2b62-58c22c36210d	000c0000-563a-21b0-ac04-d939defd3f2e	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-563a-21ae-bf4b-1b939fe1f698
000d0000-563a-21b0-5b8f-77f5d1523983	000e0000-563a-21b0-2b62-58c22c36210d	000c0000-563a-21b0-e4f4-603c762494e1	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-563a-21ae-72f7-7e5f9ce2eab4
000d0000-563a-21b0-dafe-b02123ee1e50	000e0000-563a-21b0-2b62-58c22c36210d	000c0000-563a-21b0-ce2c-dc9783fdcb1a	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-563a-21ae-c4d6-d3680462bce3
000d0000-563a-21b0-78d5-ae3f0c091349	000e0000-563a-21b0-2b62-58c22c36210d	000c0000-563a-21b0-272c-d5cfcc578234	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-563a-21ae-3635-ba43cdeae412
\.


--
-- TOC entry 3118 (class 0 OID 25192237)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 25192203)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 25192180)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-563a-21b0-d6b2-5a89898bbb3a	00080000-563a-21b0-da53-a592e058d073	00090000-563a-21b0-6fbe-f2bacd44cac7	AK		igralka
\.


--
-- TOC entry 3130 (class 0 OID 25192360)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 25192900)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 25192912)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 25192934)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 25157733)
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
\.


--
-- TOC entry 3134 (class 0 OID 25192385)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 25192137)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-563a-21ae-14b3-a6c8ce18c954	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-563a-21ae-4c85-f0f4340f4317	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-563a-21ae-2f73-64d46868f11d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-563a-21ae-e119-c9da82204d22	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-563a-21ae-b8c8-e41357ea9553	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-563a-21ae-8b80-935921503481	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-563a-21ae-cfff-19409369d8ad	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-563a-21ae-ffb0-18407bc46207	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563a-21ae-0fac-47c7e6264eb7	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563a-21ae-e9d9-61d673ba2fd5	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-563a-21ae-5010-b8bc551b8a36	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-563a-21ae-cc50-38fc26dd3117	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-563a-21ae-1245-857ff66e4f0d	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-563a-21ae-1d72-1c89516fb431	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-563a-21ae-a299-593dfb821531	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-563a-21b0-fbcb-8f000493b8aa	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-563a-21b0-09a8-76e6222f59d9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-563a-21b0-8e8c-5ebe1c79a50d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-563a-21b0-a460-d1c863cae265	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-563a-21b0-73b2-c5dcdebc9985	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-563a-21b2-67a7-6f7c6216dfa3	application.tenant.maticnopodjetje	string	s:36:"00080000-563a-21b2-66df-bef035858893";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 25192037)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-563a-21b0-93b5-50a8519b0aa2	00000000-563a-21b0-fbcb-8f000493b8aa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-563a-21b0-a3e3-af97559dcdc3	00000000-563a-21b0-fbcb-8f000493b8aa	00010000-563a-21ae-82a2-ff5401251c68	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-563a-21b0-284f-40cebef632ff	00000000-563a-21b0-09a8-76e6222f59d9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3107 (class 0 OID 25192104)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-563a-21b0-af91-e5946d91a742	\N	00100000-563a-21b0-71c9-5dc0f75ca740	00100000-563a-21b0-340d-04a6c36ae043	01	Gledališče Nimbis
00410000-563a-21b0-9e58-cc15594e0585	00410000-563a-21b0-af91-e5946d91a742	00100000-563a-21b0-71c9-5dc0f75ca740	00100000-563a-21b0-340d-04a6c36ae043	02	Tehnika
\.


--
-- TOC entry 3104 (class 0 OID 25192048)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-563a-21b0-55b4-4f319e713636	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-563a-21b0-8fd3-e83aac658b68	00010000-563a-21b0-9410-badc4f4a8cb0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-563a-21b0-4b49-a17aef35c2bd	00010000-563a-21b0-3ab7-4817bbd68a18	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-563a-21b0-f06e-9be737f5aa64	00010000-563a-21b0-5e2b-e99bc19062e3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-563a-21b0-b1f5-5241d4f0ba1e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-563a-21b0-23ca-2b2ea6486f79	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-563a-21b0-049a-16124e95c94e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-563a-21b0-f936-9d3ef34686d8	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-563a-21b0-6fbe-f2bacd44cac7	00010000-563a-21b0-29ec-f81b775dd4fb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-563a-21b0-15ab-f5f89033b481	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-563a-21b0-6b16-7ff8fa4f66ac	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563a-21b0-9617-13a43425c50a	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-563a-21b0-e908-8f900e681800	00010000-563a-21b0-c3bf-86244a43c34b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563a-21b0-3c30-b06478e9c617	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-21b0-4057-6093a4dd53eb	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-21b0-f4da-0a2c961a6a13	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-21b0-de55-c6227f1e4a12	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563a-21b0-2cdf-b1ee3b34fcd2	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563a-21b0-0352-7efcf288b79c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-21b0-5856-9f27b3a7c0b8	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-21b0-6cf8-5a0f8d369cdb	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3096 (class 0 OID 25191983)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-563a-21ae-4eec-2d30256ff31c	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-563a-21ae-cab0-7ee3331213ea	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-563a-21ae-695f-f8145e0e52b7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-563a-21ae-3038-e87dd44043fc	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-563a-21ae-af40-4e075b984a58	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-563a-21ae-4623-9d3f4c4016f6	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-563a-21ae-e328-d19ab6290677	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-563a-21ae-dc5f-f7fcd26a4626	Abonma-read	Abonma - branje	t
00030000-563a-21ae-62ce-afedcccf89d3	Abonma-write	Abonma - spreminjanje	t
00030000-563a-21ae-6423-81f52a6bd72f	Alternacija-read	Alternacija - branje	t
00030000-563a-21ae-eef0-262c11baa84a	Alternacija-write	Alternacija - spreminjanje	t
00030000-563a-21ae-f5ae-9f419572105c	Arhivalija-read	Arhivalija - branje	t
00030000-563a-21ae-0524-992622af3fc9	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-563a-21ae-818d-5930666fea1a	AuthStorage-read	AuthStorage - branje	t
00030000-563a-21ae-875a-112884808697	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-563a-21ae-8dcc-39b3f1be4dfc	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-563a-21ae-d223-0f260b706570	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-563a-21ae-9ae7-742b07d86f79	Besedilo-read	Besedilo - branje	t
00030000-563a-21ae-5d5f-2439d1dc91b9	Besedilo-write	Besedilo - spreminjanje	t
00030000-563a-21ae-50d3-c0223b2c38b6	Dogodek-read	Dogodek - branje	t
00030000-563a-21ae-3ee1-4a5a78bf299a	Dogodek-write	Dogodek - spreminjanje	t
00030000-563a-21ae-a77b-f220faf87a84	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-563a-21ae-f19f-5b45bd9c3bce	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-563a-21ae-5435-e29295a1c373	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-563a-21ae-5227-d181a71d65a9	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-563a-21ae-931a-0fb4e05e99ba	DogodekTrait-read	DogodekTrait - branje	t
00030000-563a-21ae-13bf-bca6ca87c2f6	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-563a-21ae-a5e0-4edcac9e5a53	DrugiVir-read	DrugiVir - branje	t
00030000-563a-21ae-a08a-0cf97160f270	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-563a-21ae-3998-1bf6ab7837b8	Drzava-read	Drzava - branje	t
00030000-563a-21ae-c218-8a1d20581ff3	Drzava-write	Drzava - spreminjanje	t
00030000-563a-21ae-0446-01e8b7faca86	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-563a-21ae-1778-3edd0c5940ab	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-563a-21ae-2380-24579a1037b4	Funkcija-read	Funkcija - branje	t
00030000-563a-21ae-356e-132c30ba6125	Funkcija-write	Funkcija - spreminjanje	t
00030000-563a-21ae-56bd-fe654142f056	Gostovanje-read	Gostovanje - branje	t
00030000-563a-21ae-c226-888c039d6791	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-563a-21ae-464e-c83cbddf0b3d	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-563a-21ae-187d-f92040c057e6	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-563a-21ae-300d-14122c4c731d	Kupec-read	Kupec - branje	t
00030000-563a-21ae-ca2c-3d8eb8cf4ba2	Kupec-write	Kupec - spreminjanje	t
00030000-563a-21ae-bb58-4145377f21f2	NacinPlacina-read	NacinPlacina - branje	t
00030000-563a-21ae-aed1-03c68191c1fa	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-563a-21ae-4815-9dc520e70909	Option-read	Option - branje	t
00030000-563a-21ae-a1f0-4d29ce62c1f2	Option-write	Option - spreminjanje	t
00030000-563a-21ae-e684-1fde70892fb3	OptionValue-read	OptionValue - branje	t
00030000-563a-21ae-b3ff-0cc6a354e153	OptionValue-write	OptionValue - spreminjanje	t
00030000-563a-21ae-e138-4c34686fa951	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-563a-21ae-b254-86b65f59084f	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-563a-21ae-7447-eff2843fc931	Oseba-read	Oseba - branje	t
00030000-563a-21ae-2f39-d542dd9c1c76	Oseba-write	Oseba - spreminjanje	t
00030000-563a-21ae-9595-9b3e3739bf93	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-563a-21ae-9d1d-fe455fadce5d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-563a-21ae-8ceb-9f5fec84ed9a	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-563a-21ae-62fd-0b3b97b63c38	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-563a-21ae-88cc-47dacb2c2a6b	Pogodba-read	Pogodba - branje	t
00030000-563a-21ae-b4a6-a57a80e513ad	Pogodba-write	Pogodba - spreminjanje	t
00030000-563a-21ae-157e-71d956bce533	Popa-read	Popa - branje	t
00030000-563a-21ae-8203-5df17ac0029c	Popa-write	Popa - spreminjanje	t
00030000-563a-21ae-6f6e-c41d29c3cdde	Posta-read	Posta - branje	t
00030000-563a-21ae-bfa6-79cd130bf8b3	Posta-write	Posta - spreminjanje	t
00030000-563a-21ae-642f-90ed89181290	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-563a-21ae-5b90-b2ed8731545b	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-563a-21ae-1417-8e734dc88b3f	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-563a-21ae-697f-269d85746eab	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-563a-21ae-7852-521621d292a5	PostniNaslov-read	PostniNaslov - branje	t
00030000-563a-21ae-0531-26b0c47bcda7	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-563a-21ae-e262-3032d9687589	Praznik-read	Praznik - branje	t
00030000-563a-21ae-2cc3-02868420ea3d	Praznik-write	Praznik - spreminjanje	t
00030000-563a-21ae-a246-72d9d2caebfc	Predstava-read	Predstava - branje	t
00030000-563a-21ae-7bd1-8b9ace6df235	Predstava-write	Predstava - spreminjanje	t
00030000-563a-21ae-27ab-7063917a2a0a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-563a-21ae-d0e7-1b6d925ebf3f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-563a-21ae-0b58-0fc9b646cc58	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-563a-21ae-75a8-2711f60d0a45	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-563a-21ae-fe42-fa2dfbcaaa04	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-563a-21ae-a046-fd03be0d39a3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-563a-21ae-646e-f68e3127a9b1	ProgramDela-read	ProgramDela - branje	t
00030000-563a-21ae-d3d3-be9508f1305b	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-563a-21ae-df50-827fcdeb321c	ProgramFestival-read	ProgramFestival - branje	t
00030000-563a-21ae-09eb-5007e7079506	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-563a-21ae-b006-02fb0a3684b7	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-563a-21ae-ed67-b87dca8290e9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-563a-21ae-79f7-6396de8b4f42	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-563a-21ae-eb08-8cc69fb66350	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-563a-21ae-05df-a33dad08bc68	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-563a-21ae-7f4e-3dd3c9073aab	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-563a-21ae-9603-251fa6592849	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-563a-21ae-c755-4fdf983fb1c7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-563a-21ae-702d-448d5de86b03	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-563a-21ae-55ee-714e8c179594	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-563a-21ae-2635-7f9ca6958859	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-563a-21ae-7fe8-df4fa45220aa	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-563a-21ae-8010-b4f2d77ffecb	ProgramRazno-read	ProgramRazno - branje	t
00030000-563a-21ae-a37d-0a48a68d1739	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-563a-21ae-90d0-3c3a6c5d436c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-563a-21ae-0834-8c584daf6c37	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-563a-21ae-aee2-7725e0d39d02	Prostor-read	Prostor - branje	t
00030000-563a-21ae-41fc-cdb955d632a3	Prostor-write	Prostor - spreminjanje	t
00030000-563a-21ae-cef3-4fb52cb85878	Racun-read	Racun - branje	t
00030000-563a-21ae-2261-cd641f4140c9	Racun-write	Racun - spreminjanje	t
00030000-563a-21ae-dceb-0b29ece28648	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-563a-21ae-3249-a3ffa9516c87	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-563a-21ae-78f9-1bb288159d8c	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-563a-21ae-da0a-78e1a85b3712	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-563a-21ae-5149-1e38f81fe5ad	Rekvizit-read	Rekvizit - branje	t
00030000-563a-21ae-b5db-fedbb6f7ce1d	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-563a-21ae-5da9-980a3eb74069	Revizija-read	Revizija - branje	t
00030000-563a-21ae-7576-18e4b0e1f2c8	Revizija-write	Revizija - spreminjanje	t
00030000-563a-21ae-fcfe-cd0cd1d07166	Rezervacija-read	Rezervacija - branje	t
00030000-563a-21ae-261e-fe6b6c2ce5e5	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-563a-21ae-0426-287c83fee7cc	SedezniRed-read	SedezniRed - branje	t
00030000-563a-21ae-0993-0f1af5ebcc6c	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-563a-21ae-d177-3989ef2788f1	Sedez-read	Sedez - branje	t
00030000-563a-21ae-e8bc-2a9d045abceb	Sedez-write	Sedez - spreminjanje	t
00030000-563a-21ae-2f9c-cdada077efe5	Sezona-read	Sezona - branje	t
00030000-563a-21ae-517e-71e2e4b4e371	Sezona-write	Sezona - spreminjanje	t
00030000-563a-21ae-a3ab-1ce229821fc6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-563a-21ae-b03d-abeda54729f1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-563a-21ae-d917-86d6bf1b0f8f	Stevilcenje-read	Stevilcenje - branje	t
00030000-563a-21ae-2f9e-8e7075e3577a	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-563a-21ae-5aae-13cdcf2f52c8	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-563a-21ae-5e34-a4ba67811778	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-563a-21ae-3549-0b96125b21e4	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-563a-21ae-3a82-7435a5c89016	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-563a-21ae-bf59-c774b01a0f5f	Telefonska-read	Telefonska - branje	t
00030000-563a-21ae-deeb-9d92f4d0fd54	Telefonska-write	Telefonska - spreminjanje	t
00030000-563a-21ae-9018-1e590fb4e48c	TerminStoritve-read	TerminStoritve - branje	t
00030000-563a-21ae-f80e-3db007182986	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-563a-21ae-d3c9-b0cd8f989efd	TipFunkcije-read	TipFunkcije - branje	t
00030000-563a-21ae-d144-0982fa86d7b6	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-563a-21ae-7abc-8fb9f31df9be	TipPopa-read	TipPopa - branje	t
00030000-563a-21ae-f5cc-effed44d9df9	TipPopa-write	TipPopa - spreminjanje	t
00030000-563a-21ae-dc9e-a3fb386f59a4	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-563a-21ae-ad3e-5f08a09d5fc5	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-563a-21ae-1dc2-a752e83b925d	TipVaje-read	TipVaje - branje	t
00030000-563a-21ae-ffb2-c8eb5986fc63	TipVaje-write	TipVaje - spreminjanje	t
00030000-563a-21ae-3b4c-f3e6ade92693	Trr-read	Trr - branje	t
00030000-563a-21ae-8c11-6963a3d71537	Trr-write	Trr - spreminjanje	t
00030000-563a-21ae-fe59-bea641ef6536	Uprizoritev-read	Uprizoritev - branje	t
00030000-563a-21ae-a611-6c3ed8fea666	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-563a-21ae-6d19-3bbad31e30cd	Vaja-read	Vaja - branje	t
00030000-563a-21ae-0040-a5c0f3a30160	Vaja-write	Vaja - spreminjanje	t
00030000-563a-21ae-6c13-a4a78451aafe	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-563a-21ae-b7f1-45dbacf7fcdd	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-563a-21ae-78b6-cbdc7d80f5d7	VrstaStroska-read	VrstaStroska - branje	t
00030000-563a-21ae-d374-f0499c0481fc	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-563a-21ae-b029-1586518a6e48	Zaposlitev-read	Zaposlitev - branje	t
00030000-563a-21ae-06f0-d5318256fca7	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-563a-21ae-a73c-c31fe61f87c9	Zasedenost-read	Zasedenost - branje	t
00030000-563a-21ae-8e5a-e492c7dba92f	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-563a-21ae-7dfa-7a0a528393eb	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-563a-21ae-cbf6-88df4269341b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-563a-21ae-edb9-aa741847a569	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-563a-21ae-ef0f-a6a6ad984f5b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-563a-21ae-7562-f32e4bf1c5d3	Job-read	Branje opravil - samo zase - branje	t
00030000-563a-21ae-79ee-4a6ca05a35ed	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-563a-21ae-ef4b-16d686e2afbf	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-563a-21ae-f395-e6bc769ca0ae	Report-read	Report - branje	t
00030000-563a-21ae-10d8-e2fb0476bb88	Report-write	Report - spreminjanje	t
00030000-563a-21ae-e63d-229b11f5ca55	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-563a-21ae-1cc1-771ef754b275	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-563a-21ae-9c5b-de111bed461e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-563a-21ae-2ffb-e9d76e5de12d	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-563a-21ae-fcb8-7b4a54d0483c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-563a-21ae-1493-b4142c604d03	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-563a-21ae-d965-8abbfa8058d3	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563a-21ae-e0c2-2aadb3c55c8a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563a-21ae-4e06-414d19a22eb8	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-563a-21ae-c03b-dd31aef1f05a	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-563a-21ae-f6b0-d7663ab8ad69	Datoteka-write	Datoteka - spreminjanje	t
00030000-563a-21ae-33e4-14e2605132ac	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 25192002)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-563a-21ae-ccff-3bef29596d90	00030000-563a-21ae-cab0-7ee3331213ea
00020000-563a-21ae-b918-4f16cf269ea7	00030000-563a-21ae-3998-1bf6ab7837b8
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-dc5f-f7fcd26a4626
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-62ce-afedcccf89d3
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-6423-81f52a6bd72f
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-eef0-262c11baa84a
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-f5ae-9f419572105c
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-50d3-c0223b2c38b6
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-3038-e87dd44043fc
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-3ee1-4a5a78bf299a
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-3998-1bf6ab7837b8
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-c218-8a1d20581ff3
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-2380-24579a1037b4
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-356e-132c30ba6125
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-56bd-fe654142f056
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-c226-888c039d6791
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-464e-c83cbddf0b3d
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-187d-f92040c057e6
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-4815-9dc520e70909
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-e684-1fde70892fb3
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-7447-eff2843fc931
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-2f39-d542dd9c1c76
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-157e-71d956bce533
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-8203-5df17ac0029c
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-6f6e-c41d29c3cdde
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-bfa6-79cd130bf8b3
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-7852-521621d292a5
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-0531-26b0c47bcda7
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-a246-72d9d2caebfc
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-7bd1-8b9ace6df235
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-fe42-fa2dfbcaaa04
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-a046-fd03be0d39a3
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-aee2-7725e0d39d02
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-41fc-cdb955d632a3
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-78f9-1bb288159d8c
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-da0a-78e1a85b3712
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-5149-1e38f81fe5ad
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-b5db-fedbb6f7ce1d
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-2f9c-cdada077efe5
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-517e-71e2e4b4e371
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-d3c9-b0cd8f989efd
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-fe59-bea641ef6536
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-a611-6c3ed8fea666
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-6d19-3bbad31e30cd
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-0040-a5c0f3a30160
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-a73c-c31fe61f87c9
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-8e5a-e492c7dba92f
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-7dfa-7a0a528393eb
00020000-563a-21ae-5147-614779ecc018	00030000-563a-21ae-edb9-aa741847a569
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-dc5f-f7fcd26a4626
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-f5ae-9f419572105c
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-50d3-c0223b2c38b6
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-3998-1bf6ab7837b8
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-56bd-fe654142f056
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-464e-c83cbddf0b3d
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-187d-f92040c057e6
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-4815-9dc520e70909
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-e684-1fde70892fb3
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-7447-eff2843fc931
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-2f39-d542dd9c1c76
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-157e-71d956bce533
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-6f6e-c41d29c3cdde
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-7852-521621d292a5
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-0531-26b0c47bcda7
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-a246-72d9d2caebfc
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-aee2-7725e0d39d02
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-78f9-1bb288159d8c
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-5149-1e38f81fe5ad
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-2f9c-cdada077efe5
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-bf59-c774b01a0f5f
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-deeb-9d92f4d0fd54
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-3b4c-f3e6ade92693
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-8c11-6963a3d71537
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-b029-1586518a6e48
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-06f0-d5318256fca7
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-7dfa-7a0a528393eb
00020000-563a-21ae-ecd4-dc03706f06be	00030000-563a-21ae-edb9-aa741847a569
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-dc5f-f7fcd26a4626
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-6423-81f52a6bd72f
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-f5ae-9f419572105c
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-0524-992622af3fc9
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-9ae7-742b07d86f79
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-a77b-f220faf87a84
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-50d3-c0223b2c38b6
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-3998-1bf6ab7837b8
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-2380-24579a1037b4
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-56bd-fe654142f056
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-464e-c83cbddf0b3d
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-4815-9dc520e70909
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-e684-1fde70892fb3
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-7447-eff2843fc931
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-157e-71d956bce533
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-6f6e-c41d29c3cdde
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-a246-72d9d2caebfc
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-fe42-fa2dfbcaaa04
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-aee2-7725e0d39d02
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-78f9-1bb288159d8c
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-5149-1e38f81fe5ad
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-2f9c-cdada077efe5
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-d3c9-b0cd8f989efd
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-6d19-3bbad31e30cd
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-a73c-c31fe61f87c9
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-7dfa-7a0a528393eb
00020000-563a-21ae-cb85-1d052fd2ef68	00030000-563a-21ae-edb9-aa741847a569
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-dc5f-f7fcd26a4626
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-62ce-afedcccf89d3
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-eef0-262c11baa84a
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-f5ae-9f419572105c
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-50d3-c0223b2c38b6
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-3998-1bf6ab7837b8
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-56bd-fe654142f056
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-4815-9dc520e70909
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-e684-1fde70892fb3
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-157e-71d956bce533
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-6f6e-c41d29c3cdde
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-a246-72d9d2caebfc
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-aee2-7725e0d39d02
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-78f9-1bb288159d8c
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-5149-1e38f81fe5ad
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-2f9c-cdada077efe5
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-d3c9-b0cd8f989efd
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-7dfa-7a0a528393eb
00020000-563a-21ae-892e-c55ee64977d4	00030000-563a-21ae-edb9-aa741847a569
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-dc5f-f7fcd26a4626
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-f5ae-9f419572105c
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-50d3-c0223b2c38b6
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-3998-1bf6ab7837b8
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-56bd-fe654142f056
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-4815-9dc520e70909
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-e684-1fde70892fb3
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-157e-71d956bce533
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-6f6e-c41d29c3cdde
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-a246-72d9d2caebfc
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-aee2-7725e0d39d02
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-78f9-1bb288159d8c
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-5149-1e38f81fe5ad
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-2f9c-cdada077efe5
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-9018-1e590fb4e48c
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-695f-f8145e0e52b7
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-d3c9-b0cd8f989efd
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-7dfa-7a0a528393eb
00020000-563a-21ae-4ca4-3bf505d3c97c	00030000-563a-21ae-edb9-aa741847a569
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-4eec-2d30256ff31c
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-cab0-7ee3331213ea
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-dc5f-f7fcd26a4626
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-62ce-afedcccf89d3
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-6423-81f52a6bd72f
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-eef0-262c11baa84a
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-f5ae-9f419572105c
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-0524-992622af3fc9
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-8dcc-39b3f1be4dfc
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-d223-0f260b706570
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-9ae7-742b07d86f79
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-5d5f-2439d1dc91b9
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a77b-f220faf87a84
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-f19f-5b45bd9c3bce
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-50d3-c0223b2c38b6
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-3038-e87dd44043fc
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-3ee1-4a5a78bf299a
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a5e0-4edcac9e5a53
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a08a-0cf97160f270
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-3998-1bf6ab7837b8
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-c218-8a1d20581ff3
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-0446-01e8b7faca86
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-1778-3edd0c5940ab
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-2380-24579a1037b4
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-356e-132c30ba6125
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-56bd-fe654142f056
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-c226-888c039d6791
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-464e-c83cbddf0b3d
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-187d-f92040c057e6
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-300d-14122c4c731d
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-ca2c-3d8eb8cf4ba2
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-bb58-4145377f21f2
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-aed1-03c68191c1fa
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-4815-9dc520e70909
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-e684-1fde70892fb3
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-b3ff-0cc6a354e153
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a1f0-4d29ce62c1f2
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-e138-4c34686fa951
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-b254-86b65f59084f
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-7447-eff2843fc931
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-af40-4e075b984a58
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-2f39-d542dd9c1c76
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-9595-9b3e3739bf93
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-9d1d-fe455fadce5d
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-8ceb-9f5fec84ed9a
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-62fd-0b3b97b63c38
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-88cc-47dacb2c2a6b
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-b4a6-a57a80e513ad
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-157e-71d956bce533
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-8203-5df17ac0029c
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-6f6e-c41d29c3cdde
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-642f-90ed89181290
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-5b90-b2ed8731545b
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-1417-8e734dc88b3f
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-697f-269d85746eab
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-bfa6-79cd130bf8b3
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-7852-521621d292a5
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-0531-26b0c47bcda7
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-e262-3032d9687589
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-2cc3-02868420ea3d
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a246-72d9d2caebfc
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-7bd1-8b9ace6df235
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-27ab-7063917a2a0a
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-d0e7-1b6d925ebf3f
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-0b58-0fc9b646cc58
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-75a8-2711f60d0a45
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-fe42-fa2dfbcaaa04
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a046-fd03be0d39a3
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-4623-9d3f4c4016f6
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-646e-f68e3127a9b1
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-e328-d19ab6290677
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-d3d3-be9508f1305b
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-df50-827fcdeb321c
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-09eb-5007e7079506
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-b006-02fb0a3684b7
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-ed67-b87dca8290e9
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-79f7-6396de8b4f42
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-eb08-8cc69fb66350
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-05df-a33dad08bc68
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-7f4e-3dd3c9073aab
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-9603-251fa6592849
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-c755-4fdf983fb1c7
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-702d-448d5de86b03
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-55ee-714e8c179594
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-2635-7f9ca6958859
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-7fe8-df4fa45220aa
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-8010-b4f2d77ffecb
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a37d-0a48a68d1739
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-90d0-3c3a6c5d436c
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-0834-8c584daf6c37
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-aee2-7725e0d39d02
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-41fc-cdb955d632a3
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-cef3-4fb52cb85878
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-2261-cd641f4140c9
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-dceb-0b29ece28648
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-3249-a3ffa9516c87
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-78f9-1bb288159d8c
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-da0a-78e1a85b3712
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-5149-1e38f81fe5ad
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-b5db-fedbb6f7ce1d
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-5da9-980a3eb74069
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-7576-18e4b0e1f2c8
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-fcfe-cd0cd1d07166
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-261e-fe6b6c2ce5e5
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-0426-287c83fee7cc
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-0993-0f1af5ebcc6c
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-d177-3989ef2788f1
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-e8bc-2a9d045abceb
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-2f9c-cdada077efe5
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-517e-71e2e4b4e371
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a3ab-1ce229821fc6
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-b03d-abeda54729f1
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-d917-86d6bf1b0f8f
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-5aae-13cdcf2f52c8
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-5e34-a4ba67811778
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-2f9e-8e7075e3577a
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-3549-0b96125b21e4
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-3a82-7435a5c89016
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-bf59-c774b01a0f5f
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-deeb-9d92f4d0fd54
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-9018-1e590fb4e48c
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-695f-f8145e0e52b7
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-f80e-3db007182986
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-d3c9-b0cd8f989efd
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-d144-0982fa86d7b6
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-7abc-8fb9f31df9be
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-f5cc-effed44d9df9
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-dc9e-a3fb386f59a4
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-ad3e-5f08a09d5fc5
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-1dc2-a752e83b925d
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-ffb2-c8eb5986fc63
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-3b4c-f3e6ade92693
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-8c11-6963a3d71537
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-fe59-bea641ef6536
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a611-6c3ed8fea666
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-6d19-3bbad31e30cd
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-0040-a5c0f3a30160
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-6c13-a4a78451aafe
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-b7f1-45dbacf7fcdd
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-78b6-cbdc7d80f5d7
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-d374-f0499c0481fc
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-b029-1586518a6e48
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-06f0-d5318256fca7
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-a73c-c31fe61f87c9
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-8e5a-e492c7dba92f
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-7dfa-7a0a528393eb
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-cbf6-88df4269341b
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-edb9-aa741847a569
00020000-563a-21b0-45b6-3914fea76139	00030000-563a-21ae-ef0f-a6a6ad984f5b
\.


--
-- TOC entry 3135 (class 0 OID 25192392)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 25192426)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 25192563)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-563a-21b0-b2f1-5df055f7e571	00090000-563a-21b0-55b4-4f319e713636	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-563a-21b0-ad7b-4bf26f2f0bed	00090000-563a-21b0-23ca-2b2ea6486f79	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-563a-21b0-6998-e4616ae59e1b	00090000-563a-21b0-e908-8f900e681800	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-563a-21b0-7729-f0085b93f227	00090000-563a-21b0-15ab-f5f89033b481	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3106 (class 0 OID 25192084)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-563a-21b0-da53-a592e058d073	\N	00040000-563a-21ae-8b9a-90e66775e5bb	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-21b0-37df-d6d31e083c4a	\N	00040000-563a-21ae-8b9a-90e66775e5bb	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-563a-21b0-a432-03225ba98560	\N	00040000-563a-21ae-8b9a-90e66775e5bb	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-21b0-46ff-9e4b49aece2f	\N	00040000-563a-21ae-8b9a-90e66775e5bb	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-21b0-dc4c-355761f43b53	\N	00040000-563a-21ae-8b9a-90e66775e5bb	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-21b0-fc2a-4245e30baa91	\N	00040000-563a-21ae-7da3-6b849eaf4b50	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-21b0-00f6-a0d0b6c67869	\N	00040000-563a-21ae-46d8-79fbfcc23bee	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-21b0-9c0f-8e4f855f0f57	\N	00040000-563a-21ae-1644-69ad46f776a7	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-21b0-3cbc-f304e95ea13c	\N	00040000-563a-21ae-5fef-64c0fbd3aada	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-21b2-66df-bef035858893	\N	00040000-563a-21ae-8b9a-90e66775e5bb	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 25192129)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-563a-21ad-a7a1-2fe37e697ab5	8341	Adlešiči
00050000-563a-21ad-62c0-58c136a5559d	5270	Ajdovščina
00050000-563a-21ad-6827-d254a2139a50	6280	Ankaran/Ancarano
00050000-563a-21ad-4f59-5ce91282b7ba	9253	Apače
00050000-563a-21ad-5c78-5a7e531af548	8253	Artiče
00050000-563a-21ad-43e6-0e243c30ef42	4275	Begunje na Gorenjskem
00050000-563a-21ad-cefc-6867b4b6bfbc	1382	Begunje pri Cerknici
00050000-563a-21ad-760c-7fe66571baea	9231	Beltinci
00050000-563a-21ad-3593-2e3a87520a12	2234	Benedikt
00050000-563a-21ad-5822-d2deb87f07ee	2345	Bistrica ob Dravi
00050000-563a-21ad-f8af-6b30a7227f82	3256	Bistrica ob Sotli
00050000-563a-21ad-9be3-0b158cb24432	8259	Bizeljsko
00050000-563a-21ad-ac62-9b87490acda6	1223	Blagovica
00050000-563a-21ad-3a07-a9520c9c468e	8283	Blanca
00050000-563a-21ad-c402-3a1328a050f6	4260	Bled
00050000-563a-21ad-a6da-d6ff3582fe8b	4273	Blejska Dobrava
00050000-563a-21ad-099d-af301d5443bd	9265	Bodonci
00050000-563a-21ad-6953-2c24c4fbc43d	9222	Bogojina
00050000-563a-21ad-1374-37aae735e7dd	4263	Bohinjska Bela
00050000-563a-21ad-62c0-3f20f3718f0b	4264	Bohinjska Bistrica
00050000-563a-21ad-a70e-46db92a2eeb5	4265	Bohinjsko jezero
00050000-563a-21ad-e20f-a1e0b9b2c0b8	1353	Borovnica
00050000-563a-21ad-5f41-92790370e0db	8294	Boštanj
00050000-563a-21ad-276e-3cbc61faabbe	5230	Bovec
00050000-563a-21ad-1b80-0930faeb40b6	5295	Branik
00050000-563a-21ad-bcaa-b89faec511cd	3314	Braslovče
00050000-563a-21ad-1ec4-1729ede74449	5223	Breginj
00050000-563a-21ad-c020-863b4cc14ed6	8280	Brestanica
00050000-563a-21ad-c88a-546aeb18789d	2354	Bresternica
00050000-563a-21ad-27ac-b85b8543219b	4243	Brezje
00050000-563a-21ad-563e-1773abb80770	1351	Brezovica pri Ljubljani
00050000-563a-21ad-80e6-feff00feabab	8250	Brežice
00050000-563a-21ad-b9f1-aeb93938ed80	4210	Brnik - Aerodrom
00050000-563a-21ad-9548-b0e4894134ef	8321	Brusnice
00050000-563a-21ad-8606-f176df89e8c2	3255	Buče
00050000-563a-21ad-14de-34976a784f2f	8276	Bučka 
00050000-563a-21ad-db77-fca367d6b318	9261	Cankova
00050000-563a-21ad-9f87-54677c33760d	3000	Celje 
00050000-563a-21ad-a2fd-c5be5ff1a02c	3001	Celje - poštni predali
00050000-563a-21ad-8358-35aa46f48af3	4207	Cerklje na Gorenjskem
00050000-563a-21ad-32e5-d5e0d1b27188	8263	Cerklje ob Krki
00050000-563a-21ad-37a1-909662588edd	1380	Cerknica
00050000-563a-21ad-d074-245730127e1a	5282	Cerkno
00050000-563a-21ad-1aa9-70c10c503fd2	2236	Cerkvenjak
00050000-563a-21ad-e1c4-caf7e6b9e591	2215	Ceršak
00050000-563a-21ad-2471-3e976e44ba7a	2326	Cirkovce
00050000-563a-21ad-1388-380fcaccd5b0	2282	Cirkulane
00050000-563a-21ad-6d7f-b41e97156c4d	5273	Col
00050000-563a-21ad-d1db-794e88c6e2bd	8251	Čatež ob Savi
00050000-563a-21ad-4088-29d751f946f7	1413	Čemšenik
00050000-563a-21ad-7be1-783ab3c63400	5253	Čepovan
00050000-563a-21ad-64b0-5a2968022d9a	9232	Črenšovci
00050000-563a-21ad-cc67-8ff69dee7754	2393	Črna na Koroškem
00050000-563a-21ad-f967-e48abb419d92	6275	Črni Kal
00050000-563a-21ad-0fba-c0bf5be53afa	5274	Črni Vrh nad Idrijo
00050000-563a-21ad-2c30-2c55f7bcdf7b	5262	Črniče
00050000-563a-21ad-8be2-1e76a8d0140f	8340	Črnomelj
00050000-563a-21ad-3192-65af5442a286	6271	Dekani
00050000-563a-21ad-a743-3df6bd92659a	5210	Deskle
00050000-563a-21ad-81e8-e2915386e6a9	2253	Destrnik
00050000-563a-21ad-e7bb-dcf29bb7bba7	6215	Divača
00050000-563a-21ad-3924-9831b27a575e	1233	Dob
00050000-563a-21ad-4449-bea834e6b502	3224	Dobje pri Planini
00050000-563a-21ad-6f3a-d347767c30dc	8257	Dobova
00050000-563a-21ad-b81b-deb26cb3a050	1423	Dobovec
00050000-563a-21ad-ca25-b780341c34d5	5263	Dobravlje
00050000-563a-21ad-3686-18bc54cccdd0	3204	Dobrna
00050000-563a-21ad-db33-76c27ce34d98	8211	Dobrnič
00050000-563a-21ad-a11b-070514547ea1	1356	Dobrova
00050000-563a-21ad-979d-e0fdb2ee801b	9223	Dobrovnik/Dobronak 
00050000-563a-21ad-1b61-9adc81f29621	5212	Dobrovo v Brdih
00050000-563a-21ad-9ce9-6d3bfd8cc281	1431	Dol pri Hrastniku
00050000-563a-21ad-650a-66a08aa0144f	1262	Dol pri Ljubljani
00050000-563a-21ad-f3ed-315fdbc45cff	1273	Dole pri Litiji
00050000-563a-21ad-064f-36e0aaa37851	1331	Dolenja vas
00050000-563a-21ad-4395-6fcc0cad888f	8350	Dolenjske Toplice
00050000-563a-21ad-6af0-4bf0b417765f	1230	Domžale
00050000-563a-21ad-fde8-35987051ece5	2252	Dornava
00050000-563a-21ad-e854-e9febec560da	5294	Dornberk
00050000-563a-21ad-6a08-aa168285c501	1319	Draga
00050000-563a-21ad-3727-765948670a38	8343	Dragatuš
00050000-563a-21ad-4b69-bd943c1adfb8	3222	Dramlje
00050000-563a-21ad-3261-c9b9fafe70ed	2370	Dravograd
00050000-563a-21ad-6483-f864ec2d8135	4203	Duplje
00050000-563a-21ad-07e0-57beb862a4dd	6221	Dutovlje
00050000-563a-21ad-1f2c-3978c3f394b8	8361	Dvor
00050000-563a-21ad-ffee-0315f2abe1f5	2343	Fala
00050000-563a-21ad-a4c8-990fc1fe2b7b	9208	Fokovci
00050000-563a-21ad-0357-dccf6f979b96	2313	Fram
00050000-563a-21ad-e31b-7fb4297bd2da	3213	Frankolovo
00050000-563a-21ad-63a6-3db95eba9ab0	1274	Gabrovka
00050000-563a-21ad-063d-e1bf35fa6c52	8254	Globoko
00050000-563a-21ad-2f84-f21165c104ea	5275	Godovič
00050000-563a-21ad-c9c6-b85bf55f7026	4204	Golnik
00050000-563a-21ad-122f-47a85732c5bb	3303	Gomilsko
00050000-563a-21ad-99cc-f4e76eee0a2f	4224	Gorenja vas
00050000-563a-21ad-32ac-bd8a1a286042	3263	Gorica pri Slivnici
00050000-563a-21ad-4a2d-2bc90ca63e6b	2272	Gorišnica
00050000-563a-21ad-1299-dc9533cca3bc	9250	Gornja Radgona
00050000-563a-21ad-17e3-66caed73b687	3342	Gornji Grad
00050000-563a-21ad-b12e-ede48c509b71	4282	Gozd Martuljek
00050000-563a-21ad-f5f7-6cf21a40579c	6272	Gračišče
00050000-563a-21ad-1ff3-d66f06685cd6	9264	Grad
00050000-563a-21ad-894a-92e4ee303826	8332	Gradac
00050000-563a-21ad-78df-5b905ee91e4c	1384	Grahovo
00050000-563a-21ad-a688-25d0a3bb1ecb	5242	Grahovo ob Bači
00050000-563a-21ad-f151-e5c7323a7b5d	5251	Grgar
00050000-563a-21ad-e7f5-9d92f423963e	3302	Griže
00050000-563a-21ad-8143-03e0707a9f55	3231	Grobelno
00050000-563a-21ad-20d6-dd1e0a4d13dc	1290	Grosuplje
00050000-563a-21ad-391c-149af90788b3	2288	Hajdina
00050000-563a-21ad-f8c0-f32482a2ae2b	8362	Hinje
00050000-563a-21ad-c93e-68bb9d02396e	2311	Hoče
00050000-563a-21ad-f28a-5eda4d975195	9205	Hodoš/Hodos
00050000-563a-21ad-d8e8-e734e388b398	1354	Horjul
00050000-563a-21ad-c269-059f9c92e68c	1372	Hotedršica
00050000-563a-21ad-44d4-01e54453bb04	1430	Hrastnik
00050000-563a-21ad-0a49-4352fda59f3b	6225	Hruševje
00050000-563a-21ad-9f73-712b52c72331	4276	Hrušica
00050000-563a-21ad-030a-7d0b4fd1add5	5280	Idrija
00050000-563a-21ad-33ae-7481e09624cc	1292	Ig
00050000-563a-21ad-1e0c-9d4a734863f7	6250	Ilirska Bistrica
00050000-563a-21ad-f368-29fa0eba88ac	6251	Ilirska Bistrica-Trnovo
00050000-563a-21ad-27ec-87e7186f6cef	1295	Ivančna Gorica
00050000-563a-21ad-ceea-9f7fdec2e9c0	2259	Ivanjkovci
00050000-563a-21ad-a1c1-9851523898c5	1411	Izlake
00050000-563a-21ad-01eb-6282a5c8d870	6310	Izola/Isola
00050000-563a-21ad-c24e-79200053308a	2222	Jakobski Dol
00050000-563a-21ad-84f7-c0eafbe109e4	2221	Jarenina
00050000-563a-21ad-99a3-f99238e57d64	6254	Jelšane
00050000-563a-21ad-5354-4719b260b6f4	4270	Jesenice
00050000-563a-21ad-7206-94752ec7b7fb	8261	Jesenice na Dolenjskem
00050000-563a-21ad-f854-e5da082fa49e	3273	Jurklošter
00050000-563a-21ad-1c10-e1d15af254a0	2223	Jurovski Dol
00050000-563a-21ad-f362-792db1906e11	2256	Juršinci
00050000-563a-21ad-8f3f-9c62d0c02991	5214	Kal nad Kanalom
00050000-563a-21ad-fef0-300b14f6c7bf	3233	Kalobje
00050000-563a-21ad-4a0f-0e6c042bd772	4246	Kamna Gorica
00050000-563a-21ad-5477-44b933710c71	2351	Kamnica
00050000-563a-21ad-676f-0670b9f53737	1241	Kamnik
00050000-563a-21ad-319a-b394ef97478d	5213	Kanal
00050000-563a-21ad-edfa-d748fb142de6	8258	Kapele
00050000-563a-21ad-37d7-ddb19cfba1a2	2362	Kapla
00050000-563a-21ad-681c-032a956d68b3	2325	Kidričevo
00050000-563a-21ad-7bb5-99c1f661a7d9	1412	Kisovec
00050000-563a-21ad-2f77-6d7bbd8ca757	6253	Knežak
00050000-563a-21ad-e788-913f86aa2077	5222	Kobarid
00050000-563a-21ad-0b5c-d59a545514cd	9227	Kobilje
00050000-563a-21ad-ffad-3520f095d361	1330	Kočevje
00050000-563a-21ad-d8b9-f450dbc375f4	1338	Kočevska Reka
00050000-563a-21ad-c31d-f7dc7b3c6fa6	2276	Kog
00050000-563a-21ad-17fe-5ccdc8045db7	5211	Kojsko
00050000-563a-21ad-a6ac-36ffbe7b5300	6223	Komen
00050000-563a-21ad-4d00-5cb8a7e8d386	1218	Komenda
00050000-563a-21ad-eb92-ac566448de4e	6000	Koper/Capodistria 
00050000-563a-21ad-ef54-94ac07b8b11a	6001	Koper/Capodistria - poštni predali
00050000-563a-21ad-06a6-43b85c7fa4c6	8282	Koprivnica
00050000-563a-21ad-a423-cb004f82aba0	5296	Kostanjevica na Krasu
00050000-563a-21ad-1fd2-c8528319c60f	8311	Kostanjevica na Krki
00050000-563a-21ad-a19a-c7d6e1b06965	1336	Kostel
00050000-563a-21ad-3b64-37eeadc5f2c6	6256	Košana
00050000-563a-21ad-4c89-7ecd4e0fbfc9	2394	Kotlje
00050000-563a-21ad-184c-382f037a2150	6240	Kozina
00050000-563a-21ad-b5f4-791753444807	3260	Kozje
00050000-563a-21ad-b01e-f2f87dc5ee10	4000	Kranj 
00050000-563a-21ad-4468-4489cfc94ebd	4001	Kranj - poštni predali
00050000-563a-21ad-a2fc-447db19a2c80	4280	Kranjska Gora
00050000-563a-21ad-5935-fdae6ef3b55f	1281	Kresnice
00050000-563a-21ad-f27a-2e3ad85481b1	4294	Križe
00050000-563a-21ad-a51a-621232755593	9206	Križevci
00050000-563a-21ad-c6a7-86f0b4f16f21	9242	Križevci pri Ljutomeru
00050000-563a-21ad-8e91-bb10a58a3a69	1301	Krka
00050000-563a-21ad-b702-548b600d0f86	8296	Krmelj
00050000-563a-21ad-48c2-153173587e44	4245	Kropa
00050000-563a-21ad-4d26-41cc02c8250d	8262	Krška vas
00050000-563a-21ad-db83-93eab0e5587e	8270	Krško
00050000-563a-21ad-0202-fd677b84de85	9263	Kuzma
00050000-563a-21ad-005a-5915a99fdb80	2318	Laporje
00050000-563a-21ad-2f02-1194eb27cdde	3270	Laško
00050000-563a-21ad-94de-e6ef544bebac	1219	Laze v Tuhinju
00050000-563a-21ad-cf7d-ad8c192bb45e	2230	Lenart v Slovenskih goricah
00050000-563a-21ad-14b7-409e34c0c687	9220	Lendava/Lendva
00050000-563a-21ad-89b9-c2b6fe2cce4a	4248	Lesce
00050000-563a-21ad-f981-018cd767d159	3261	Lesično
00050000-563a-21ad-272b-5c269cd31ebf	8273	Leskovec pri Krškem
00050000-563a-21ad-cda4-3679e7473699	2372	Libeliče
00050000-563a-21ad-fecf-4aec3957a3ec	2341	Limbuš
00050000-563a-21ad-5a07-1809f690f59b	1270	Litija
00050000-563a-21ad-766f-7fc3218cae7e	3202	Ljubečna
00050000-563a-21ad-7830-b4e142e40150	1000	Ljubljana 
00050000-563a-21ad-c6f4-6c04ac8efb41	1001	Ljubljana - poštni predali
00050000-563a-21ad-4c17-7be2d173e48e	1231	Ljubljana - Črnuče
00050000-563a-21ad-0d11-7fcc10bdcafb	1261	Ljubljana - Dobrunje
00050000-563a-21ad-10f5-ad3be999e109	1260	Ljubljana - Polje
00050000-563a-21ad-bf37-06405688b995	1210	Ljubljana - Šentvid
00050000-563a-21ad-9a05-b2b9ababb066	1211	Ljubljana - Šmartno
00050000-563a-21ad-b52b-5b91a39e9fc4	3333	Ljubno ob Savinji
00050000-563a-21ad-abb8-55e6f0d71c2b	9240	Ljutomer
00050000-563a-21ad-4d0f-ac8b266c2f8d	3215	Loče
00050000-563a-21ad-2b07-bf38984dd6c9	5231	Log pod Mangartom
00050000-563a-21ad-d812-c2c344e0cb7b	1358	Log pri Brezovici
00050000-563a-21ad-9794-a72bf52762b0	1370	Logatec
00050000-563a-21ad-c3ef-d7619bf12c5e	1371	Logatec
00050000-563a-21ad-c3d0-fcb40470b1c0	1434	Loka pri Zidanem Mostu
00050000-563a-21ad-1a99-95d890d6d083	3223	Loka pri Žusmu
00050000-563a-21ad-70f8-5b446708f827	6219	Lokev
00050000-563a-21ad-96d1-bd28aa73d39d	1318	Loški Potok
00050000-563a-21ad-fb35-671e167fd305	2324	Lovrenc na Dravskem polju
00050000-563a-21ad-fbd4-31a51734b915	2344	Lovrenc na Pohorju
00050000-563a-21ad-65c0-278c10f223e4	3334	Luče
00050000-563a-21ad-68c5-9101e1031075	1225	Lukovica
00050000-563a-21ad-b8d9-6b0ecee27bd1	9202	Mačkovci
00050000-563a-21ad-d4e7-89f560947fcf	2322	Majšperk
00050000-563a-21ad-13f0-da05120cc54e	2321	Makole
00050000-563a-21ad-017b-e9c19265076f	9243	Mala Nedelja
00050000-563a-21ad-0ac2-452b9c6bf0a0	2229	Malečnik
00050000-563a-21ad-7506-79c9b1ec5749	6273	Marezige
00050000-563a-21ad-7119-0dae741dd577	2000	Maribor 
00050000-563a-21ad-59a1-9c9cda4dd9f3	2001	Maribor - poštni predali
00050000-563a-21ad-67d1-1c8a0c21d304	2206	Marjeta na Dravskem polju
00050000-563a-21ad-989b-3ba80c9b5f41	2281	Markovci
00050000-563a-21ad-077d-50a7c4df68d8	9221	Martjanci
00050000-563a-21ad-c671-c7cd035a233f	6242	Materija
00050000-563a-21ad-9384-c55f780941b5	4211	Mavčiče
00050000-563a-21ad-f185-27c538bd8a49	1215	Medvode
00050000-563a-21ad-8c22-2895882165f6	1234	Mengeš
00050000-563a-21ad-a955-cf0a32651921	8330	Metlika
00050000-563a-21ad-7361-dd7c590ea600	2392	Mežica
00050000-563a-21ad-72a7-2b2b06ebbfbd	2204	Miklavž na Dravskem polju
00050000-563a-21ad-2ace-f8d3b14723cf	2275	Miklavž pri Ormožu
00050000-563a-21ad-a08e-7e972ae3c26b	5291	Miren
00050000-563a-21ad-f928-4d5d4e33b2b7	8233	Mirna
00050000-563a-21ad-379b-b8e8991e17db	8216	Mirna Peč
00050000-563a-21ad-7a0c-6aa7afe33406	2382	Mislinja
00050000-563a-21ad-6f45-9a3e2fd1c051	4281	Mojstrana
00050000-563a-21ad-2b1b-f9121d002906	8230	Mokronog
00050000-563a-21ad-44eb-9eda434af934	1251	Moravče
00050000-563a-21ad-ae50-650f45eb0246	9226	Moravske Toplice
00050000-563a-21ad-16d0-a919c9803d42	5216	Most na Soči
00050000-563a-21ad-434d-d967eb5abb63	1221	Motnik
00050000-563a-21ad-c2f2-db7f40af1514	3330	Mozirje
00050000-563a-21ad-f81a-41a5f2c59ffe	9000	Murska Sobota 
00050000-563a-21ad-882a-d9090800ec78	9001	Murska Sobota - poštni predali
00050000-563a-21ad-757b-aadf692cc9d3	2366	Muta
00050000-563a-21ad-612b-289a7b9dd9c1	4202	Naklo
00050000-563a-21ad-d0e2-669a251db242	3331	Nazarje
00050000-563a-21ad-cec2-3e7b8740bfcb	1357	Notranje Gorice
00050000-563a-21ad-ef7f-41339df0f9a9	3203	Nova Cerkev
00050000-563a-21ad-cfa6-d3ea678ae038	5000	Nova Gorica 
00050000-563a-21ad-21c2-91441014d477	5001	Nova Gorica - poštni predali
00050000-563a-21ad-1832-d782f777fc64	1385	Nova vas
00050000-563a-21ad-0b1b-83634cc7cf2f	8000	Novo mesto
00050000-563a-21ad-b942-e7d9a57640ea	8001	Novo mesto - poštni predali
00050000-563a-21ad-18b1-47bda45b3ce5	6243	Obrov
00050000-563a-21ad-2131-14057eed1921	9233	Odranci
00050000-563a-21ad-0197-31c8e1bf4c16	2317	Oplotnica
00050000-563a-21ad-ae46-78b2513cd011	2312	Orehova vas
00050000-563a-21ad-b161-7b2056535221	2270	Ormož
00050000-563a-21ad-cceb-b584049ece23	1316	Ortnek
00050000-563a-21ad-e2ff-758080acb34c	1337	Osilnica
00050000-563a-21ad-754e-f61c2a4982c5	8222	Otočec
00050000-563a-21ad-3b5b-90b3c2e01f86	2361	Ožbalt
00050000-563a-21ad-3e80-c5c2f160460e	2231	Pernica
00050000-563a-21ad-be45-8b104066116f	2211	Pesnica pri Mariboru
00050000-563a-21ad-29dd-7f7bb25f63fe	9203	Petrovci
00050000-563a-21ad-c0db-271b50ba2f8b	3301	Petrovče
00050000-563a-21ad-4d69-8fe319358fbb	6330	Piran/Pirano
00050000-563a-21ad-109d-d6818bfe8504	8255	Pišece
00050000-563a-21ad-939d-810e555e54c2	6257	Pivka
00050000-563a-21ad-32fa-ad2757cb7edf	6232	Planina
00050000-563a-21ad-135a-5636558bc884	3225	Planina pri Sevnici
00050000-563a-21ad-ef38-8ecf3c2e0773	6276	Pobegi
00050000-563a-21ad-b53f-c795d50edfbc	8312	Podbočje
00050000-563a-21ad-e9bb-bf30a94fb8e0	5243	Podbrdo
00050000-563a-21ad-89b0-519f020f06ac	3254	Podčetrtek
00050000-563a-21ad-15bb-37008fecf716	2273	Podgorci
00050000-563a-21ad-0bb9-dc3aa21b3bf5	6216	Podgorje
00050000-563a-21ad-e68f-36b1e7fa512e	2381	Podgorje pri Slovenj Gradcu
00050000-563a-21ad-0f05-329db1ac46b2	6244	Podgrad
00050000-563a-21ad-f6ad-7dd2ce3cf8f7	1414	Podkum
00050000-563a-21ad-4b87-73d3b7609ed9	2286	Podlehnik
00050000-563a-21ad-66fb-bae489a4c8f7	5272	Podnanos
00050000-563a-21ad-cbff-798fc06d46f0	4244	Podnart
00050000-563a-21ad-923d-b4837dce7a92	3241	Podplat
00050000-563a-21ad-bc9d-e726e00e72b8	3257	Podsreda
00050000-563a-21ad-a557-d58bb56ffa64	2363	Podvelka
00050000-563a-21ad-d6e7-317ad6c6ef4a	2208	Pohorje
00050000-563a-21ad-44b7-40985e638cc5	2257	Polenšak
00050000-563a-21ae-e054-4a10437f78bf	1355	Polhov Gradec
00050000-563a-21ae-3cdf-8d60e3d18870	4223	Poljane nad Škofjo Loko
00050000-563a-21ae-af5e-25842c5269f7	2319	Poljčane
00050000-563a-21ae-c187-1a135276ead4	1272	Polšnik
00050000-563a-21ae-70ee-51e22ca077a6	3313	Polzela
00050000-563a-21ae-e48d-6ba8ccc941b1	3232	Ponikva
00050000-563a-21ae-7a94-94e3baca19d2	6320	Portorož/Portorose
00050000-563a-21ae-a184-4bb9ea4892a8	6230	Postojna
00050000-563a-21ae-7595-2b9c1be69960	2331	Pragersko
00050000-563a-21ae-f19d-cae95291399d	3312	Prebold
00050000-563a-21ae-0506-9476e263f3cd	4205	Preddvor
00050000-563a-21ae-6002-fa61b5b4700c	6255	Prem
00050000-563a-21ae-3bc4-a2bdbc4b5ac3	1352	Preserje
00050000-563a-21ae-c85a-81e1e27772f6	6258	Prestranek
00050000-563a-21ae-d49b-6648d203d9ff	2391	Prevalje
00050000-563a-21ae-ffd0-157ac5c9a39d	3262	Prevorje
00050000-563a-21ae-dc25-d9a5144cfc59	1276	Primskovo 
00050000-563a-21ae-5183-afdf0c47fd95	3253	Pristava pri Mestinju
00050000-563a-21ae-bd06-e4a434852e33	9207	Prosenjakovci/Partosfalva
00050000-563a-21ae-23ab-8872e7a661de	5297	Prvačina
00050000-563a-21ae-d84e-109c8ffd70cc	2250	Ptuj
00050000-563a-21ae-3a09-368a6a638cd3	2323	Ptujska Gora
00050000-563a-21ae-86f8-9e4e014b5aaa	9201	Puconci
00050000-563a-21ae-6968-b85e2c32b2e0	2327	Rače
00050000-563a-21ae-4880-191c6b9a0044	1433	Radeče
00050000-563a-21ae-3f5e-f6ec455aa449	9252	Radenci
00050000-563a-21ae-00d5-18b038cdf8f7	2360	Radlje ob Dravi
00050000-563a-21ae-b40f-036d3a31e6ed	1235	Radomlje
00050000-563a-21ae-0d90-4ae6e948bb78	4240	Radovljica
00050000-563a-21ae-a85a-00f4b4c4f0e6	8274	Raka
00050000-563a-21ae-6cf8-5aaa5a1c94cb	1381	Rakek
00050000-563a-21ae-9590-c367a72efc9a	4283	Rateče - Planica
00050000-563a-21ae-a760-3574c7e8b494	2390	Ravne na Koroškem
00050000-563a-21ae-fbb3-ea7bec0759e7	9246	Razkrižje
00050000-563a-21ae-126d-afe0de196c37	3332	Rečica ob Savinji
00050000-563a-21ae-af0b-5e7e04052241	5292	Renče
00050000-563a-21ae-6642-1ec5d3384509	1310	Ribnica
00050000-563a-21ae-8e6b-f91717a8849d	2364	Ribnica na Pohorju
00050000-563a-21ae-4bf7-22f0052809cf	3272	Rimske Toplice
00050000-563a-21ae-037f-5571b2919367	1314	Rob
00050000-563a-21ae-4366-eedba281f9e3	5215	Ročinj
00050000-563a-21ae-3651-e9318a3a30ac	3250	Rogaška Slatina
00050000-563a-21ae-d6d6-f9638a39e444	9262	Rogašovci
00050000-563a-21ae-7917-1e8a3c79d24d	3252	Rogatec
00050000-563a-21ae-8bce-fe09bab48c1a	1373	Rovte
00050000-563a-21ae-483d-86c606496a20	2342	Ruše
00050000-563a-21ae-5973-c0613a912920	1282	Sava
00050000-563a-21ae-4874-8c641809c58a	6333	Sečovlje/Sicciole
00050000-563a-21ae-4402-62150c88d8dc	4227	Selca
00050000-563a-21ae-460c-e475ab9d55a8	2352	Selnica ob Dravi
00050000-563a-21ae-b256-58a74e479ef4	8333	Semič
00050000-563a-21ae-4e2b-ff24130b8578	8281	Senovo
00050000-563a-21ae-60da-eefa859a47d7	6224	Senožeče
00050000-563a-21ae-a8e0-d33c18b20d8f	8290	Sevnica
00050000-563a-21ae-c7f5-a02b2059377b	6210	Sežana
00050000-563a-21ae-cc97-171959054e2e	2214	Sladki Vrh
00050000-563a-21ae-50a8-8675ff66a969	5283	Slap ob Idrijci
00050000-563a-21ae-e368-648dde04b36b	2380	Slovenj Gradec
00050000-563a-21ae-2adb-3c7a0e605b1a	2310	Slovenska Bistrica
00050000-563a-21ae-ee54-d0e9c57d7fcb	3210	Slovenske Konjice
00050000-563a-21ae-3baa-383794a441ac	1216	Smlednik
00050000-563a-21ae-876c-c22428420262	5232	Soča
00050000-563a-21ae-8af2-90342fbfd866	1317	Sodražica
00050000-563a-21ae-7cff-9cf3948986a6	3335	Solčava
00050000-563a-21ae-7c61-32c5a13248cd	5250	Solkan
00050000-563a-21ae-ba82-bf43b82e3b01	4229	Sorica
00050000-563a-21ae-4fe0-9d308d142aa1	4225	Sovodenj
00050000-563a-21ae-73ad-abe521002f21	5281	Spodnja Idrija
00050000-563a-21ae-5321-6fe323e8a297	2241	Spodnji Duplek
00050000-563a-21ae-3a16-abcf7388329c	9245	Spodnji Ivanjci
00050000-563a-21ae-7b7c-55b4d5ba1bd1	2277	Središče ob Dravi
00050000-563a-21ae-bbcd-91bc5c85b550	4267	Srednja vas v Bohinju
00050000-563a-21ae-50a1-06a1a1cf51e3	8256	Sromlje 
00050000-563a-21ae-e0e0-a6f338776827	5224	Srpenica
00050000-563a-21ae-f19b-3af3a846aa10	1242	Stahovica
00050000-563a-21ae-c2ad-366eed735089	1332	Stara Cerkev
00050000-563a-21ae-d37e-efd91f06263f	8342	Stari trg ob Kolpi
00050000-563a-21ae-73ef-7e4f1e81a31f	1386	Stari trg pri Ložu
00050000-563a-21ae-3775-30b5ba4e19d5	2205	Starše
00050000-563a-21ae-4f1e-1f20c4964344	2289	Stoperce
00050000-563a-21ae-4383-7a85fb1611b2	8322	Stopiče
00050000-563a-21ae-1a89-049d9853911e	3206	Stranice
00050000-563a-21ae-fa3f-33a373c6b381	8351	Straža
00050000-563a-21ae-2a88-6318000210ac	1313	Struge
00050000-563a-21ae-8610-7ebce1cac877	8293	Studenec
00050000-563a-21ae-e5db-05e42c542d9c	8331	Suhor
00050000-563a-21ae-0d32-b6376cef137b	2233	Sv. Ana v Slovenskih goricah
00050000-563a-21ae-3055-804b138683eb	2235	Sv. Trojica v Slovenskih goricah
00050000-563a-21ae-517a-039c57b09d05	2353	Sveti Duh na Ostrem Vrhu
00050000-563a-21ae-b4d6-a9098a41ce50	9244	Sveti Jurij ob Ščavnici
00050000-563a-21ae-4751-657e0cc6aed7	3264	Sveti Štefan
00050000-563a-21ae-9af4-051ef20c1259	2258	Sveti Tomaž
00050000-563a-21ae-8dbd-2c80f0b42197	9204	Šalovci
00050000-563a-21ae-a030-beb184f06978	5261	Šempas
00050000-563a-21ae-58c0-064c2f694306	5290	Šempeter pri Gorici
00050000-563a-21ae-a6f7-130cff5990e2	3311	Šempeter v Savinjski dolini
00050000-563a-21ae-9d7a-c69d0391d4c9	4208	Šenčur
00050000-563a-21ae-13fb-01bc2e69d3c2	2212	Šentilj v Slovenskih goricah
00050000-563a-21ae-30dd-b27d4e14fc4b	8297	Šentjanž
00050000-563a-21ae-8c04-0459b6937730	2373	Šentjanž pri Dravogradu
00050000-563a-21ae-c2f7-4c27d1afafa3	8310	Šentjernej
00050000-563a-21ae-4b36-338ed43a6940	3230	Šentjur
00050000-563a-21ae-cdfa-421fbb46cb56	3271	Šentrupert
00050000-563a-21ae-443a-55e8a2ceb727	8232	Šentrupert
00050000-563a-21ae-1161-761eab18253b	1296	Šentvid pri Stični
00050000-563a-21ae-cb0f-37c23bf91334	8275	Škocjan
00050000-563a-21ae-8aa0-daa67dbe4898	6281	Škofije
00050000-563a-21ae-0fd5-14acc8991844	4220	Škofja Loka
00050000-563a-21ae-00f7-99fa431ef0f6	3211	Škofja vas
00050000-563a-21ae-22be-aa9fdcc781a4	1291	Škofljica
00050000-563a-21ae-fe0b-9a3d1e312d16	6274	Šmarje
00050000-563a-21ae-2c3a-1f12210cb1f3	1293	Šmarje - Sap
00050000-563a-21ae-75bc-b82e5ad44939	3240	Šmarje pri Jelšah
00050000-563a-21ae-b204-47925200443e	8220	Šmarješke Toplice
00050000-563a-21ae-b80b-4894bd12bcdc	2315	Šmartno na Pohorju
00050000-563a-21ae-eedc-e3bb2d0ce036	3341	Šmartno ob Dreti
00050000-563a-21ae-d176-aedc15ad22b4	3327	Šmartno ob Paki
00050000-563a-21ae-c4e8-15b171479959	1275	Šmartno pri Litiji
00050000-563a-21ae-65b2-685add38dada	2383	Šmartno pri Slovenj Gradcu
00050000-563a-21ae-8008-1c2bb7b4eec7	3201	Šmartno v Rožni dolini
00050000-563a-21ae-97dc-5fe540e6eee1	3325	Šoštanj
00050000-563a-21ae-171c-ade8bb473ddc	6222	Štanjel
00050000-563a-21ae-94ac-b3af4d42cb5a	3220	Štore
00050000-563a-21ae-9e51-780524b1b62c	3304	Tabor
00050000-563a-21ae-f288-fe7ffd2f474c	3221	Teharje
00050000-563a-21ae-3313-fc548b47721d	9251	Tišina
00050000-563a-21ae-9a02-f8e9dc156cf4	5220	Tolmin
00050000-563a-21ae-f722-bad9608b3c9f	3326	Topolšica
00050000-563a-21ae-e50e-2f3e1eefb87d	2371	Trbonje
00050000-563a-21ae-e943-e94979dcfffc	1420	Trbovlje
00050000-563a-21ae-917c-62dfa9a3536e	8231	Trebelno 
00050000-563a-21ae-5129-f7c14b43ce98	8210	Trebnje
00050000-563a-21ae-a21d-91eba3956939	5252	Trnovo pri Gorici
00050000-563a-21ae-dff0-33de81cda7d4	2254	Trnovska vas
00050000-563a-21ae-9fe9-acb2dbbdc1f1	1222	Trojane
00050000-563a-21ae-5679-5aabda64b78a	1236	Trzin
00050000-563a-21ae-878f-cc1917a39123	4290	Tržič
00050000-563a-21ae-7f9f-e1a9a47625b0	8295	Tržišče
00050000-563a-21ae-b256-5ceeff138666	1311	Turjak
00050000-563a-21ae-7a63-963ab19049d1	9224	Turnišče
00050000-563a-21ae-4ec0-8d04a3897580	8323	Uršna sela
00050000-563a-21ae-8459-8db7683f8626	1252	Vače
00050000-563a-21ae-cd4c-098730c047e3	3320	Velenje 
00050000-563a-21ae-a2c0-02f81acbefd3	3322	Velenje - poštni predali
00050000-563a-21ae-ca4e-c717cc234af3	8212	Velika Loka
00050000-563a-21ae-bae8-949dbec28a95	2274	Velika Nedelja
00050000-563a-21ae-6dff-f635bf0c7f95	9225	Velika Polana
00050000-563a-21ae-9d8a-1fbd6a9b3907	1315	Velike Lašče
00050000-563a-21ae-4b92-3f05e87eb747	8213	Veliki Gaber
00050000-563a-21ae-25ed-8b14a0c04afa	9241	Veržej
00050000-563a-21ae-9267-c7c6b6b1323f	1312	Videm - Dobrepolje
00050000-563a-21ae-e406-82ca6a3b4f0d	2284	Videm pri Ptuju
00050000-563a-21ae-f1f5-a8af08eb86a0	8344	Vinica
00050000-563a-21ae-240e-188fc997272c	5271	Vipava
00050000-563a-21ae-4557-f0ae9bf7d229	4212	Visoko
00050000-563a-21ae-1b49-76fbcd91cfd8	1294	Višnja Gora
00050000-563a-21ae-b347-32db2b159bb8	3205	Vitanje
00050000-563a-21ae-cdf9-f168e002c707	2255	Vitomarci
00050000-563a-21ae-7903-1e86d0c58917	1217	Vodice
00050000-563a-21ae-0e7d-352c4d203ccc	3212	Vojnik\t
00050000-563a-21ae-252b-065ba8186516	5293	Volčja Draga
00050000-563a-21ae-de04-f1861d70faea	2232	Voličina
00050000-563a-21ae-acfa-38dff4df74bc	3305	Vransko
00050000-563a-21ae-b39a-605f70e2ba7e	6217	Vremski Britof
00050000-563a-21ae-62a5-9ffb7a737d6e	1360	Vrhnika
00050000-563a-21ae-486a-afd82c566b58	2365	Vuhred
00050000-563a-21ae-4d62-c4cca8ba188b	2367	Vuzenica
00050000-563a-21ae-0e3c-702ed85f7cb4	8292	Zabukovje 
00050000-563a-21ae-a588-1f16e94ee36e	1410	Zagorje ob Savi
00050000-563a-21ae-1648-eef015d4ebe4	1303	Zagradec
00050000-563a-21ae-1a8f-032ce3e7f283	2283	Zavrč
00050000-563a-21ae-319c-495ce6b35aa3	8272	Zdole 
00050000-563a-21ae-291c-7831120a9512	4201	Zgornja Besnica
00050000-563a-21ae-aa48-4bf757b5805a	2242	Zgornja Korena
00050000-563a-21ae-5de1-ca46816952e1	2201	Zgornja Kungota
00050000-563a-21ae-9902-030a0ba24d72	2316	Zgornja Ložnica
00050000-563a-21ae-51da-b88ffe9862ea	2314	Zgornja Polskava
00050000-563a-21ae-87fe-5280ea3fee07	2213	Zgornja Velka
00050000-563a-21ae-c2ed-91586382d698	4247	Zgornje Gorje
00050000-563a-21ae-e297-fc30ed2e8c56	4206	Zgornje Jezersko
00050000-563a-21ae-cf75-d8b75e201e8c	2285	Zgornji Leskovec
00050000-563a-21ae-aaf5-6783c85c68a7	1432	Zidani Most
00050000-563a-21ae-92c8-3fa23452ecc8	3214	Zreče
00050000-563a-21ae-c59b-fef699a885e7	4209	Žabnica
00050000-563a-21ae-7e7b-b45802f2b209	3310	Žalec
00050000-563a-21ae-7967-8df314ec8d64	4228	Železniki
00050000-563a-21ae-420e-9d251b6dce3b	2287	Žetale
00050000-563a-21ae-ddf1-1e8f5f51c35d	4226	Žiri
00050000-563a-21ae-cd93-6c6bc24e68da	4274	Žirovnica
00050000-563a-21ae-e08a-3aff19de9661	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 25192790)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 25192366)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 25192114)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-563a-21b0-76fb-300027cac283	00080000-563a-21b0-da53-a592e058d073	\N	00040000-563a-21ae-8b9a-90e66775e5bb	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-563a-21b0-3ef6-0fc85e6e27d1	00080000-563a-21b0-da53-a592e058d073	\N	00040000-563a-21ae-8b9a-90e66775e5bb	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-563a-21b0-84bd-4a176a5ce3d4	00080000-563a-21b0-37df-d6d31e083c4a	\N	00040000-563a-21ae-8b9a-90e66775e5bb	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3120 (class 0 OID 25192258)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-563a-21ae-2d3e-97a0034666bf	novo leto	1	1	\N	t
00430000-563a-21ae-7d16-fba2dcea7263	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-563a-21ae-b4d7-938c3190820b	dan upora proti okupatorju	27	4	\N	t
00430000-563a-21ae-2cef-77c35f29c161	praznik dela	1	5	\N	t
00430000-563a-21ae-5b1f-68134c5a3084	praznik dela	2	5	\N	t
00430000-563a-21ae-b3a9-0db2e5771a16	dan Primoža Trubarja	8	6	\N	f
00430000-563a-21ae-3541-1aa061015d46	dan državnosti	25	6	\N	t
00430000-563a-21ae-a227-65bb7156fc33	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-563a-21ae-aa06-5594a3e99296	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-563a-21ae-95e0-23059a90a88e	dan suverenosti	25	10	\N	f
00430000-563a-21ae-c8f4-063c36abe793	dan spomina na mrtve	1	11	\N	t
00430000-563a-21ae-4719-2caf05a222e7	dan Rudolfa Maistra	23	11	\N	f
00430000-563a-21ae-9c6a-1b6f66849a76	božič	25	12	\N	t
00430000-563a-21ae-1477-fecea503209b	dan samostojnosti in enotnosti	26	12	\N	t
00430000-563a-21ae-a53e-8734ff29e93f	Marijino vnebovzetje	15	8	\N	t
00430000-563a-21ae-b17d-65f8a1d03844	dan reformacije	31	10	\N	t
00430000-563a-21ae-0944-e1deb697fa49	velikonočna nedelja	27	3	2016	t
00430000-563a-21ae-aaf8-d5f1dcc303c6	velikonočna nedelja	16	4	2017	t
00430000-563a-21ae-a2db-5e3a93c7d053	velikonočna nedelja	1	4	2018	t
00430000-563a-21ae-f7ef-8130fae6e088	velikonočna nedelja	21	4	2019	t
00430000-563a-21ae-5675-bd2fc454440c	velikonočna nedelja	12	4	2020	t
00430000-563a-21ae-872d-d802f98d5ce1	velikonočna nedelja	4	4	2021	t
00430000-563a-21ae-7030-6c07b7b032cc	velikonočna nedelja	17	4	2022	t
00430000-563a-21ae-97c7-dc316b7fa845	velikonočna nedelja	9	4	2023	t
00430000-563a-21ae-a0a7-b5ef63bc1dfa	velikonočna nedelja	31	3	2024	t
00430000-563a-21ae-84d4-3fa2b60e6a96	velikonočna nedelja	20	4	2025	t
00430000-563a-21ae-05f5-3d900e7dc5e8	velikonočna nedelja	5	4	2026	t
00430000-563a-21ae-43d1-d140e5bb7a1f	velikonočna nedelja	28	3	2027	t
00430000-563a-21ae-426a-b4ecdad61801	velikonočna nedelja	16	4	2028	t
00430000-563a-21ae-119e-184c3a28c191	velikonočna nedelja	1	4	2029	t
00430000-563a-21ae-6c08-58a5e9c7ca2e	velikonočna nedelja	21	4	2030	t
00430000-563a-21ae-0143-32106fe06ac3	velikonočni ponedeljek	28	3	2016	t
00430000-563a-21ae-a059-65676630f6bb	velikonočni ponedeljek	17	4	2017	t
00430000-563a-21ae-eade-b60f264e87c5	velikonočni ponedeljek	2	4	2018	t
00430000-563a-21ae-fabe-959c39e723f9	velikonočni ponedeljek	22	4	2019	t
00430000-563a-21ae-35db-c6355f14476c	velikonočni ponedeljek	13	4	2020	t
00430000-563a-21ae-5659-dce92d77b352	velikonočni ponedeljek	5	4	2021	t
00430000-563a-21ae-b3a0-e8c42340e5ae	velikonočni ponedeljek	18	4	2022	t
00430000-563a-21ae-64b4-c81602d6f45a	velikonočni ponedeljek	10	4	2023	t
00430000-563a-21ae-cce5-4d0f5ada823f	velikonočni ponedeljek	1	4	2024	t
00430000-563a-21ae-b776-55e20b76dd3b	velikonočni ponedeljek	21	4	2025	t
00430000-563a-21ae-fa9b-df96c6063a48	velikonočni ponedeljek	6	4	2026	t
00430000-563a-21ae-5b5b-137bd0bb7450	velikonočni ponedeljek	29	3	2027	t
00430000-563a-21ae-f066-f655e7d2bb35	velikonočni ponedeljek	17	4	2028	t
00430000-563a-21ae-efa1-8bcdd66873d2	velikonočni ponedeljek	2	4	2029	t
00430000-563a-21ae-2188-2352c991d634	velikonočni ponedeljek	22	4	2030	t
00430000-563a-21ae-b6b9-fd3cfbf66f3c	binkoštna nedelja - binkošti	15	5	2016	t
00430000-563a-21ae-b571-be60c01ed6a5	binkoštna nedelja - binkošti	4	6	2017	t
00430000-563a-21ae-afe2-10e48bce4dae	binkoštna nedelja - binkošti	20	5	2018	t
00430000-563a-21ae-51ba-a225aafa6945	binkoštna nedelja - binkošti	9	6	2019	t
00430000-563a-21ae-b849-27d30f63c387	binkoštna nedelja - binkošti	31	5	2020	t
00430000-563a-21ae-0e6f-36f84883b8e3	binkoštna nedelja - binkošti	23	5	2021	t
00430000-563a-21ae-b44b-0da765ec780b	binkoštna nedelja - binkošti	5	6	2022	t
00430000-563a-21ae-f640-96b9f377dc23	binkoštna nedelja - binkošti	28	5	2023	t
00430000-563a-21ae-89dc-467b86d2a757	binkoštna nedelja - binkošti	19	5	2024	t
00430000-563a-21ae-08c2-e900fb985b37	binkoštna nedelja - binkošti	8	6	2025	t
00430000-563a-21ae-05dc-94b116b02a65	binkoštna nedelja - binkošti	24	5	2026	t
00430000-563a-21ae-59e0-352404e55b79	binkoštna nedelja - binkošti	16	5	2027	t
00430000-563a-21ae-95b8-b60bee951d85	binkoštna nedelja - binkošti	4	6	2028	t
00430000-563a-21ae-2d76-b0497a4c78e0	binkoštna nedelja - binkošti	20	5	2029	t
00430000-563a-21ae-5d8e-66c8b6ae2611	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 25192218)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 25192230)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 25192378)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 25192804)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 25192814)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-563a-21b0-2eab-3a2c2994e7bb	00080000-563a-21b0-a432-03225ba98560	0987	AK
00190000-563a-21b0-df6a-7f0ccb8c52dd	00080000-563a-21b0-37df-d6d31e083c4a	0989	AK
00190000-563a-21b0-881f-0f5d6dfef574	00080000-563a-21b0-46ff-9e4b49aece2f	0986	AK
00190000-563a-21b0-4b7b-bacdc28299a3	00080000-563a-21b0-fc2a-4245e30baa91	0984	AK
00190000-563a-21b0-f379-80bda78b6931	00080000-563a-21b0-00f6-a0d0b6c67869	0983	AK
00190000-563a-21b0-29be-39e884bdda4d	00080000-563a-21b0-9c0f-8e4f855f0f57	0982	AK
00190000-563a-21b2-c56d-5051a16e2b9a	00080000-563a-21b2-66df-bef035858893	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 25192713)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-563a-21b0-4caf-85b7e7d63fe6	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3161 (class 0 OID 25192822)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 25192407)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-563a-21b0-ffb1-d980533f6f3e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-563a-21b0-cf40-223e2c25d0f5	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-563a-21b0-a3b6-94c3dc5e9deb	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-563a-21b0-ad58-a47d6ed7d0c1	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-563a-21b0-6067-8e9f283ce075	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-563a-21b0-55f9-50c8b6bc1c68	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-563a-21b0-00df-82bc645e9f53	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3129 (class 0 OID 25192351)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 25192341)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 25192552)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 25192482)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 25192192)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 25191954)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-563a-21b2-66df-bef035858893	00010000-563a-21ae-c266-e04fe5dd80f8	2015-11-04 16:18:10	INS	a:0:{}
2	App\\Entity\\Option	00000000-563a-21b2-67a7-6f7c6216dfa3	00010000-563a-21ae-c266-e04fe5dd80f8	2015-11-04 16:18:10	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-563a-21b2-c56d-5051a16e2b9a	00010000-563a-21ae-c266-e04fe5dd80f8	2015-11-04 16:18:10	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 25192420)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 25191992)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-563a-21ae-ccff-3bef29596d90	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-563a-21ae-b918-4f16cf269ea7	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-563a-21ae-e657-decb5a96f79f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-563a-21ae-b8ae-84f2a83e2bd7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-563a-21ae-5147-614779ecc018	planer	Planer dogodkov v koledarju	t
00020000-563a-21ae-ecd4-dc03706f06be	kadrovska	Kadrovska služba	t
00020000-563a-21ae-cb85-1d052fd2ef68	arhivar	Ažuriranje arhivalij	t
00020000-563a-21ae-892e-c55ee64977d4	igralec	Igralec	t
00020000-563a-21ae-4ca4-3bf505d3c97c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-563a-21b0-45b6-3914fea76139	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3095 (class 0 OID 25191976)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-563a-21ae-82a2-ff5401251c68	00020000-563a-21ae-e657-decb5a96f79f
00010000-563a-21ae-c266-e04fe5dd80f8	00020000-563a-21ae-e657-decb5a96f79f
00010000-563a-21b0-ed86-1c0b58961f50	00020000-563a-21b0-45b6-3914fea76139
\.


--
-- TOC entry 3140 (class 0 OID 25192434)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 25192372)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 25192318)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-563a-21b0-fce8-f8edc21dd6a0	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-563a-21b0-cb5d-27e72e056552	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-563a-21b0-b716-a33887c7232d	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3091 (class 0 OID 25191941)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-563a-21ae-8ed3-e6c59b86002c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-563a-21ae-2bb0-d8775e4b1aa1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-563a-21ae-b895-b12c37d9af0a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-563a-21ae-e0ba-1717c5b7d12b	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-563a-21ae-9fba-4f1d6b5afb0f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 25191933)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-563a-21ae-c3ae-641397bef2a5	00230000-563a-21ae-e0ba-1717c5b7d12b	popa
00240000-563a-21ae-e5b1-514ac8f196d0	00230000-563a-21ae-e0ba-1717c5b7d12b	oseba
00240000-563a-21ae-dd25-49a2d954be1c	00230000-563a-21ae-e0ba-1717c5b7d12b	tippopa
00240000-563a-21ae-488b-c4b6ae3a489b	00230000-563a-21ae-e0ba-1717c5b7d12b	organizacijskaenota
00240000-563a-21ae-2e95-52b27024f7da	00230000-563a-21ae-e0ba-1717c5b7d12b	sezona
00240000-563a-21ae-6e4c-150d1b51c258	00230000-563a-21ae-e0ba-1717c5b7d12b	tipvaje
00240000-563a-21ae-1571-30eeba0f8024	00230000-563a-21ae-2bb0-d8775e4b1aa1	prostor
00240000-563a-21ae-d4ba-bb74bf9d9cd2	00230000-563a-21ae-e0ba-1717c5b7d12b	besedilo
00240000-563a-21ae-82b6-ef72c92fb7c7	00230000-563a-21ae-e0ba-1717c5b7d12b	uprizoritev
00240000-563a-21ae-e7bc-4e5e4a77548b	00230000-563a-21ae-e0ba-1717c5b7d12b	funkcija
00240000-563a-21ae-7fa6-4ada5cd4be8d	00230000-563a-21ae-e0ba-1717c5b7d12b	tipfunkcije
00240000-563a-21ae-79b3-124f3ca354e9	00230000-563a-21ae-e0ba-1717c5b7d12b	alternacija
00240000-563a-21ae-e51d-600bde39d563	00230000-563a-21ae-8ed3-e6c59b86002c	pogodba
00240000-563a-21ae-5f84-c86cefe951a4	00230000-563a-21ae-e0ba-1717c5b7d12b	zaposlitev
00240000-563a-21ae-ca8e-c8026b35deaa	00230000-563a-21ae-e0ba-1717c5b7d12b	zvrstuprizoritve
00240000-563a-21ae-4f8a-b3fc47a1ef2d	00230000-563a-21ae-8ed3-e6c59b86002c	programdela
00240000-563a-21ae-c157-e79b123bb3c8	00230000-563a-21ae-e0ba-1717c5b7d12b	zapis
\.


--
-- TOC entry 3089 (class 0 OID 25191928)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e9285f01-7e83-43a4-a8b3-6cb378b5fd14	00240000-563a-21ae-c3ae-641397bef2a5	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 25192499)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-563a-21b0-976f-7cacebafc9b9	000e0000-563a-21b0-2b62-58c22c36210d	00080000-563a-21b0-da53-a592e058d073	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-563a-21ae-224f-bb2a8a1b99a1
00270000-563a-21b0-9d02-906371c3c618	000e0000-563a-21b0-2b62-58c22c36210d	00080000-563a-21b0-da53-a592e058d073	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-563a-21ae-224f-bb2a8a1b99a1
\.


--
-- TOC entry 3105 (class 0 OID 25192076)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 25192328)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-563a-21b0-d475-d4b739881c9c	00180000-563a-21b0-d94c-9a018cfe527b	000c0000-563a-21b0-e3dd-fce338785cfc	00090000-563a-21b0-55b4-4f319e713636	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-21b0-18a5-0f7b5315d76e	00180000-563a-21b0-d94c-9a018cfe527b	000c0000-563a-21b0-e47a-a20efcc98e7d	00090000-563a-21b0-15ab-f5f89033b481	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-21b0-40c3-b989ec700fad	00180000-563a-21b0-d94c-9a018cfe527b	000c0000-563a-21b0-06b9-3e822c568213	00090000-563a-21b0-4b49-a17aef35c2bd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-21b0-1d05-79322202fd81	00180000-563a-21b0-d94c-9a018cfe527b	000c0000-563a-21b0-407f-c9337cb86fd5	00090000-563a-21b0-8fd3-e83aac658b68	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-21b0-33a5-465da2d5205e	00180000-563a-21b0-d94c-9a018cfe527b	000c0000-563a-21b0-ac04-d939defd3f2e	00090000-563a-21b0-9617-13a43425c50a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-21b0-9c6f-b99ae2522d54	00180000-563a-21b0-233b-0db0aa82f60e	\N	00090000-563a-21b0-9617-13a43425c50a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-563a-21b0-702c-6e6ac9ad55af	00180000-563a-21b0-233b-0db0aa82f60e	\N	00090000-563a-21b0-15ab-f5f89033b481	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3149 (class 0 OID 25192540)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-563a-21ae-3635-ba43cdeae412	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-563a-21ae-b664-10f3584711ff	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-563a-21ae-deb1-e05a4080ff99	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-563a-21ae-42f5-0ab8376aa5e6	04	Režija	Režija	Režija	umetnik	30
000f0000-563a-21ae-ec2b-759e747e4f7f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-563a-21ae-67d6-8df10f1d23de	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-563a-21ae-bc0c-a1ea132c8222	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-563a-21ae-baaf-a8df821b5015	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-563a-21ae-8c03-93f4f5f97da3	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-563a-21ae-a0cd-40c447121f64	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-563a-21ae-c4d6-d3680462bce3	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-563a-21ae-179e-5543549f64ef	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-563a-21ae-494e-e1d977be8b20	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-563a-21ae-0d5c-7edd5dbdd43c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-563a-21ae-72f7-7e5f9ce2eab4	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-563a-21ae-7466-6f5a0f11b7b0	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-563a-21ae-bf4b-1b939fe1f698	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-563a-21ae-fc79-221a0adc15c3	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 25192027)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-563a-21b0-643c-73b850b71268	0001	šola	osnovna ali srednja šola
00400000-563a-21b0-3040-ae8f62af2f97	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-563a-21b0-6f5a-84ef905ebc31	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3162 (class 0 OID 25192833)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-563a-21ae-f2c6-c3aa368f0838	01	Velika predstava	f	1.00	1.00
002b0000-563a-21ae-17e4-c8778bf532cd	02	Mala predstava	f	0.50	0.50
002b0000-563a-21ae-94b8-c8198843ca5c	03	Mala koprodukcija	t	0.40	1.00
002b0000-563a-21ae-fad3-c421834b0985	04	Srednja koprodukcija	t	0.70	2.00
002b0000-563a-21ae-c075-fb9efec9c687	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 25192308)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-563a-21ae-3a2b-b74dd80f6f54	0001	prva vaja	prva vaja
00420000-563a-21ae-3b81-f4ce03179350	0002	tehnična vaja	tehnična vaja
00420000-563a-21ae-4292-101066b0285a	0003	lučna vaja	lučna vaja
00420000-563a-21ae-65ef-d2f45a0e54a0	0004	kostumska vaja	kostumska vaja
00420000-563a-21ae-fb82-db597eb7de5f	0005	foto vaja	foto vaja
00420000-563a-21ae-a9d4-18481b0a9749	0006	1. glavna vaja	1. glavna vaja
00420000-563a-21ae-afaf-9684797f59c7	0007	2. glavna vaja	2. glavna vaja
00420000-563a-21ae-5f1c-62ba711c8d58	0008	1. generalka	1. generalka
00420000-563a-21ae-4475-3dcb92787122	0009	2. generalka	2. generalka
00420000-563a-21ae-1559-0fa7b9b479e4	0010	odprta generalka	odprta generalka
00420000-563a-21ae-12f9-fc4d7a183492	0011	obnovitvena vaja	obnovitvena vaja
00420000-563a-21ae-dc59-8fa2308390ed	0012	pevska vaja	pevska vaja
00420000-563a-21ae-2fcb-64eab568f527	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-563a-21ae-3962-71242f00aaaa	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 25192149)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25191963)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-563a-21ae-c266-e04fe5dd80f8	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO7bkKP30upTkDmTmb7brPePJGBQcSNzu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-563a-21b0-3ab7-4817bbd68a18	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-563a-21b0-9410-badc4f4a8cb0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-563a-21b0-29ec-f81b775dd4fb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-563a-21b0-c3bf-86244a43c34b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-563a-21b0-5e2b-e99bc19062e3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-563a-21b0-919b-d8d486e79f87	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-563a-21b0-dc11-ade61776cb69	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-563a-21b0-cbab-8fbf9f36b522	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-563a-21b0-74e4-fe8f532e80ed	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-563a-21b0-ed86-1c0b58961f50	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-563a-21ae-82a2-ff5401251c68	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 25192590)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-563a-21b0-d1fa-be2801aa4953	00160000-563a-21b0-c56d-f77396085055	\N	00140000-563a-21ae-44b0-6a8b69064f16	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-563a-21b0-6067-8e9f283ce075
000e0000-563a-21b0-2b62-58c22c36210d	00160000-563a-21b0-3311-7d6878ed1a62	\N	00140000-563a-21ae-5861-4a3484c05c95	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-563a-21b0-55f9-50c8b6bc1c68
000e0000-563a-21b0-350e-acf193f42e68	\N	\N	00140000-563a-21ae-5861-4a3484c05c95	00190000-563a-21b0-2eab-3a2c2994e7bb	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563a-21b0-6067-8e9f283ce075
000e0000-563a-21b0-8271-0f8e23edfdca	\N	\N	00140000-563a-21ae-5861-4a3484c05c95	00190000-563a-21b0-2eab-3a2c2994e7bb	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563a-21b0-6067-8e9f283ce075
000e0000-563a-21b0-968e-fffd9eae917e	\N	\N	00140000-563a-21ae-5861-4a3484c05c95	00190000-563a-21b0-2eab-3a2c2994e7bb	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-563a-21b0-ffb1-d980533f6f3e
000e0000-563a-21b0-eaa3-2573e5dcad04	\N	\N	00140000-563a-21ae-5861-4a3484c05c95	00190000-563a-21b0-2eab-3a2c2994e7bb	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-563a-21b0-ffb1-d980533f6f3e
\.


--
-- TOC entry 3119 (class 0 OID 25192248)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-563a-21b0-8d44-8ca0aaa52783	\N	000e0000-563a-21b0-2b62-58c22c36210d	1	
00200000-563a-21b0-5377-fdc2ab98c6a3	\N	000e0000-563a-21b0-2b62-58c22c36210d	2	
00200000-563a-21b0-e3d8-cb08cfc3caa4	\N	000e0000-563a-21b0-2b62-58c22c36210d	3	
00200000-563a-21b0-f50e-79435b3400e5	\N	000e0000-563a-21b0-2b62-58c22c36210d	4	
00200000-563a-21b0-e45b-4eda9114d225	\N	000e0000-563a-21b0-2b62-58c22c36210d	5	
\.


--
-- TOC entry 3136 (class 0 OID 25192399)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 25192513)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-563a-21ae-65ff-29bce9bce26a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-563a-21ae-f10e-3528c031ea38	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-563a-21ae-3ce9-18af8cc2339d	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-563a-21ae-6d25-a57d1e1a1869	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-563a-21ae-7186-1adc435f1391	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-563a-21ae-f56b-53adc4a324ac	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-563a-21ae-c728-f1d508f2f20a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-563a-21ae-5bb5-97b2338bb97e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-563a-21ae-224f-bb2a8a1b99a1	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-563a-21ae-0d4a-37826248e07f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-563a-21ae-9989-ed4b1d21c16c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-563a-21ae-b4ec-fe18306d7e93	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-563a-21ae-51b0-542cd222dac1	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-563a-21ae-f640-cb9d5d6475d2	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-563a-21ae-78cd-eddaeb7d3c38	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-563a-21ae-34b8-6e95e3005804	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-563a-21ae-c692-9919f9b20bfe	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-563a-21ae-c7bb-b534a249f049	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-563a-21ae-738a-bb4734e81adb	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-563a-21ae-3fc2-0100bdd58070	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-563a-21ae-5c3c-4abc74eccf55	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-563a-21ae-8747-789f20b29861	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-563a-21ae-e463-f4b3d27fcf2e	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-563a-21ae-5be5-235c3d025592	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-563a-21ae-1f7e-b9d23193bab1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-563a-21ae-19f4-a34ca179207a	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-563a-21ae-5079-019a402bf6d1	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-563a-21ae-a3a0-b55e780529f4	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 25192880)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 25192852)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 25192892)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 25192471)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-563a-21b0-71c9-5dc0f75ca740	00090000-563a-21b0-15ab-f5f89033b481	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-21b0-340d-04a6c36ae043	00090000-563a-21b0-4b49-a17aef35c2bd	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-21b0-726f-90b0c2a5f040	00090000-563a-21b0-f936-9d3ef34686d8	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-21b0-9598-63b5c6427be3	00090000-563a-21b0-f06e-9be737f5aa64	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-21b0-6394-008753fc48c1	00090000-563a-21b0-6fbe-f2bacd44cac7	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-21b0-e317-b301b1e481b4	00090000-563a-21b0-049a-16124e95c94e	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3122 (class 0 OID 25192292)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 25192580)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-563a-21ae-44b0-6a8b69064f16	01	Drama	drama (SURS 01)
00140000-563a-21ae-8495-72e49b868c12	02	Opera	opera (SURS 02)
00140000-563a-21ae-109b-cf9333a449d4	03	Balet	balet (SURS 03)
00140000-563a-21ae-4a3d-91324e961ebe	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-563a-21ae-840f-ba01991e5f31	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-563a-21ae-5861-4a3484c05c95	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-563a-21ae-f7ac-3de1f85e856c	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 25192461)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 25192026)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25192639)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 25192629)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 25192017)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 25192496)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 25192538)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 25192932)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 25192280)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 25192302)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25192307)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25192850)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 25192175)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 25192707)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 25192457)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 25192246)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 25192213)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 25192189)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 25192364)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25192909)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25192916)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 25192940)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 25157737)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2722 (class 2606 OID 25192391)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 25192147)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 25192045)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 25192109)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 25192072)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 25192006)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 25191991)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 25192397)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 25192433)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 25192575)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 25192100)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 25192135)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 25192802)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 25192370)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 25192125)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 25192265)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 25192234)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 25192226)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 25192382)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 25192811)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 25192819)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 25192789)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 25192831)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 25192415)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 25192355)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 25192346)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 25192562)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 25192489)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 25192201)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 25191962)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 25192424)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 25191980)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 25192000)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 25192442)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 25192377)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 25192326)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 25191950)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 25191938)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 25191932)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 25192509)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 25192081)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25192337)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 25192549)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 25192034)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25192843)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 25192315)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 25192160)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 25191975)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25192608)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 25192255)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 25192405)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 25192521)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 25192890)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 25192874)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 25192898)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 25192479)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 25192296)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 25192588)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 25192469)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 25192290)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 25192291)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 25192289)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 25192288)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 25192287)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 25192510)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 25192511)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 25192512)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 25192911)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 25192910)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 25192102)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 25192103)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 25192398)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 25192878)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 25192877)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 25192879)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 25192876)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 25192875)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 25192384)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 25192383)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 25192256)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 25192257)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 25192458)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 25192460)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 25192459)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 25192191)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 25192190)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 25192832)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 25192577)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 25192578)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 25192579)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 25192899)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 25192613)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 25192610)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 25192614)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 25192612)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 25192611)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 25192162)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 25192161)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 25192075)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 25192425)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 25192007)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 25192008)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 25192445)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 25192444)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 25192443)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 25192112)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 25192111)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 25192113)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 25192229)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 25192227)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 25192228)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 25191940)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 25192350)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 25192348)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 25192347)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 25192349)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 25191981)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 25191982)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 25192406)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 25192933)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 25192498)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 25192497)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 25192941)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 25192942)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 25192371)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 25192490)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 25192491)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 25192712)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 25192711)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 25192708)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 25192709)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 25192710)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 25192127)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 25192126)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 25192128)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 25192419)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 25192418)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 25192812)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 25192813)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 25192643)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 25192644)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 25192641)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 25192642)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 25192480)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 25192481)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 25192359)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 25192358)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 25192356)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 25192357)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 25192631)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 25192630)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 25192202)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 25192216)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 25192215)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 25192214)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 25192217)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 25192247)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 25192235)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 25192236)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 25192803)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 25192851)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 25192917)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 25192918)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 25192047)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 25192046)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 25192082)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 25192083)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 25192297)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 25192340)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 25192339)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 25192338)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 25192282)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 25192283)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 25192286)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 25192281)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 25192285)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 25192284)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 25192101)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 25192035)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 25192036)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 25192176)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 25192178)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 25192177)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 25192179)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 25192365)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 25192576)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 25192609)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 25192550)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 25192551)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 25192073)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 25192074)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 25192470)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 25191951)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 25192148)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 25192110)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 25191939)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 25192844)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 25192417)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 25192416)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 25192316)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 25192317)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 25192640)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 25192136)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 25192589)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 25192891)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 25192820)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 25192821)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 25192539)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 25192327)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 25192001)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2905 (class 2606 OID 25193113)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2904 (class 2606 OID 25193118)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2899 (class 2606 OID 25193143)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2901 (class 2606 OID 25193133)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2906 (class 2606 OID 25193108)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2902 (class 2606 OID 25193128)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2900 (class 2606 OID 25193138)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2903 (class 2606 OID 25193123)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2942 (class 2606 OID 25193313)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 25193318)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2940 (class 2606 OID 25193323)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2974 (class 2606 OID 25193488)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2975 (class 2606 OID 25193483)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 25192998)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2877 (class 2606 OID 25193003)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 25193228)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2969 (class 2606 OID 25193468)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 25193463)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2968 (class 2606 OID 25193473)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 25193458)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 25193453)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2921 (class 2606 OID 25193223)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2922 (class 2606 OID 25193218)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2898 (class 2606 OID 25193098)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2897 (class 2606 OID 25193103)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 25193268)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 25193278)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 25193273)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2887 (class 2606 OID 25193053)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 25193048)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 25193208)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 25193443)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2945 (class 2606 OID 25193328)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 25193333)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2943 (class 2606 OID 25193338)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 25193478)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2947 (class 2606 OID 25193358)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 25193343)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2946 (class 2606 OID 25193363)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 25193353)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2949 (class 2606 OID 25193348)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2885 (class 2606 OID 25193043)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 25193038)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 25192983)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2874 (class 2606 OID 25192978)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 25193248)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2870 (class 2606 OID 25192958)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 25192963)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2928 (class 2606 OID 25193263)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 25193258)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 25193253)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 25193013)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2881 (class 2606 OID 25193008)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2879 (class 2606 OID 25193018)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 25193078)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 25193068)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 25193073)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 25192943)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2911 (class 2606 OID 25193183)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2913 (class 2606 OID 25193173)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2914 (class 2606 OID 25193168)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2912 (class 2606 OID 25193178)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2868 (class 2606 OID 25192948)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 25192953)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 25193233)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 25193503)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 25193308)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 25193303)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2980 (class 2606 OID 25193508)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 25193513)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 25193213)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2937 (class 2606 OID 25193293)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2936 (class 2606 OID 25193298)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 25193418)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 25193413)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 25193398)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 25193403)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 25193408)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 25193028)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 25193023)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 25193033)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2925 (class 2606 OID 25193243)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2926 (class 2606 OID 25193238)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 25193428)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2963 (class 2606 OID 25193433)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 25193388)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 25193393)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2956 (class 2606 OID 25193378)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2955 (class 2606 OID 25193383)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 25193283)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 25193288)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2915 (class 2606 OID 25193203)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2916 (class 2606 OID 25193198)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2918 (class 2606 OID 25193188)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2917 (class 2606 OID 25193193)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2951 (class 2606 OID 25193373)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 25193368)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 25193058)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 25193063)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 25193093)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2895 (class 2606 OID 25193083)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 25193088)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 25193423)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 25193438)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 25193448)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2977 (class 2606 OID 25193493)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 25193498)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 25192973)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 25192968)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2876 (class 2606 OID 25192988)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 25192993)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 25193148)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 25193163)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 25193158)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2910 (class 2606 OID 25193153)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-04 16:18:11 CET

--
-- PostgreSQL database dump complete
--

