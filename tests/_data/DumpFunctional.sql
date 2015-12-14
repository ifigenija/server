--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-14 14:58:41 CET

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
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 32124772)
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
-- TOC entry 237 (class 1259 OID 32125387)
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
-- TOC entry 236 (class 1259 OID 32125370)
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
-- TOC entry 182 (class 1259 OID 32124765)
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
-- TOC entry 181 (class 1259 OID 32124763)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 32125247)
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
-- TOC entry 230 (class 1259 OID 32125277)
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
-- TOC entry 251 (class 1259 OID 32125684)
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
-- TOC entry 203 (class 1259 OID 32125020)
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
-- TOC entry 205 (class 1259 OID 32125052)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32125057)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32125606)
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
-- TOC entry 194 (class 1259 OID 32124917)
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
-- TOC entry 238 (class 1259 OID 32125400)
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
-- TOC entry 223 (class 1259 OID 32125200)
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
-- TOC entry 200 (class 1259 OID 32124991)
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
-- TOC entry 197 (class 1259 OID 32124957)
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
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 32124934)
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
-- TOC entry 212 (class 1259 OID 32125114)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32125664)
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
-- TOC entry 250 (class 1259 OID 32125677)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32125699)
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
-- TOC entry 216 (class 1259 OID 32125139)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32124891)
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
-- TOC entry 185 (class 1259 OID 32124791)
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
-- TOC entry 189 (class 1259 OID 32124858)
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
-- TOC entry 186 (class 1259 OID 32124802)
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
-- TOC entry 178 (class 1259 OID 32124737)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32124756)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32125146)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32125180)
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
-- TOC entry 233 (class 1259 OID 32125318)
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
-- TOC entry 188 (class 1259 OID 32124838)
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
-- TOC entry 191 (class 1259 OID 32124883)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32125550)
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
-- TOC entry 213 (class 1259 OID 32125120)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32124868)
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
-- TOC entry 202 (class 1259 OID 32125012)
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
-- TOC entry 198 (class 1259 OID 32124972)
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
-- TOC entry 199 (class 1259 OID 32124984)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32125132)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32125564)
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
-- TOC entry 242 (class 1259 OID 32125574)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32125469)
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
-- TOC entry 243 (class 1259 OID 32125582)
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
-- TOC entry 219 (class 1259 OID 32125161)
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
-- TOC entry 211 (class 1259 OID 32125105)
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
-- TOC entry 210 (class 1259 OID 32125095)
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
-- TOC entry 232 (class 1259 OID 32125307)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32125237)
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
-- TOC entry 196 (class 1259 OID 32124946)
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
-- TOC entry 175 (class 1259 OID 32124708)
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
-- TOC entry 174 (class 1259 OID 32124706)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 32125174)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32124746)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32124730)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32125188)
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
-- TOC entry 214 (class 1259 OID 32125126)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32125072)
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
-- TOC entry 173 (class 1259 OID 32124695)
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
-- TOC entry 172 (class 1259 OID 32124687)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32124682)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32125254)
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
-- TOC entry 187 (class 1259 OID 32124830)
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
-- TOC entry 209 (class 1259 OID 32125082)
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
-- TOC entry 231 (class 1259 OID 32125295)
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
-- TOC entry 184 (class 1259 OID 32124781)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32125594)
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
-- TOC entry 207 (class 1259 OID 32125062)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32124903)
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
-- TOC entry 176 (class 1259 OID 32124717)
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
-- TOC entry 235 (class 1259 OID 32125345)
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
-- TOC entry 201 (class 1259 OID 32125002)
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
-- TOC entry 218 (class 1259 OID 32125153)
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
-- TOC entry 229 (class 1259 OID 32125268)
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
-- TOC entry 247 (class 1259 OID 32125644)
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
-- TOC entry 246 (class 1259 OID 32125613)
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
-- TOC entry 248 (class 1259 OID 32125656)
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
-- TOC entry 225 (class 1259 OID 32125226)
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
-- TOC entry 204 (class 1259 OID 32125046)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32125335)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32125216)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32124768)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32124711)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3112 (class 0 OID 32124772)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-566e-cb0e-a48a-feaf6c0b1ba7	10	30	Otroci	Abonma za otroke	200
000a0000-566e-cb0e-8118-00673b4bdd70	20	60	Mladina	Abonma za mladino	400
000a0000-566e-cb0e-357d-783e7a537cb5	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3166 (class 0 OID 32125387)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-566e-cb0e-bbe7-afbc6e107bb5	000d0000-566e-cb0e-17e5-eecf696b4816	\N	00090000-566e-cb0e-4a98-63801bfc55ae	000b0000-566e-cb0e-120e-761cf34acb89	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-566e-cb0e-bc31-3ec630b7bcaf	000d0000-566e-cb0e-aca7-6bca9605699e	00100000-566e-cb0e-5ee6-07180f342264	00090000-566e-cb0e-6e7c-afc87e6172a2	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-566e-cb0e-0878-51cd82e91a78	000d0000-566e-cb0e-17f8-44c0488cf962	00100000-566e-cb0e-3760-2bc12add82e7	00090000-566e-cb0e-0909-00649c841acb	\N	0003	t	\N	2015-12-14	\N	2	t	\N	f	f
000c0000-566e-cb0e-2226-0503903c4e88	000d0000-566e-cb0e-bb7a-bc51d179dcde	\N	00090000-566e-cb0e-8300-2ada8b5c9745	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-566e-cb0e-d7c1-61459a1d0e32	000d0000-566e-cb0e-8819-549b6900e597	\N	00090000-566e-cb0e-2dd2-c9d57a233b38	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-566e-cb0e-f83b-cba838a969cd	000d0000-566e-cb0e-2cf4-00101769f2d8	\N	00090000-566e-cb0e-f9e0-b63f2965401f	000b0000-566e-cb0e-9635-6db534ed508b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-566e-cb0e-bb9c-e45bb8035e96	000d0000-566e-cb0e-86af-3afd89f0b472	00100000-566e-cb0e-a052-8a51eb8c2a2a	00090000-566e-cb0e-cef9-94720153c51a	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-566e-cb0e-c39a-55397ebd7907	000d0000-566e-cb0e-fd5e-082d2ac8488d	\N	00090000-566e-cb0e-be4b-6a753b81a5a0	000b0000-566e-cb0e-4ed1-9ceee2cb8218	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-566e-cb0e-a447-afe88bc39c75	000d0000-566e-cb0e-86af-3afd89f0b472	00100000-566e-cb0e-ae66-ef42a8349c90	00090000-566e-cb0e-3ce3-db64f68d6e1d	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-566e-cb0e-5714-3c91e51aee6e	000d0000-566e-cb0e-86af-3afd89f0b472	00100000-566e-cb0e-928d-e2e8da4e7aa7	00090000-566e-cb0e-e133-a562e10711b2	\N	0010	t	\N	2015-12-14	\N	16	f	\N	f	t
000c0000-566e-cb0e-e3f7-d3f8e026f0bd	000d0000-566e-cb0e-86af-3afd89f0b472	00100000-566e-cb0e-1f07-c714dd6a4b1c	00090000-566e-cb0e-87a2-8c05802d9b38	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-566e-cb0e-21ab-1e65a75f2084	000d0000-566e-cb0e-c3bc-e31cd4334892	00100000-566e-cb0e-5ee6-07180f342264	00090000-566e-cb0e-6e7c-afc87e6172a2	000b0000-566e-cb0e-80d1-e20757650970	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3165 (class 0 OID 32125370)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32124765)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3156 (class 0 OID 32125247)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-566e-cb0e-3bd1-6dfd84368b68	00160000-566e-cb0e-4f37-f6ecf73c74ce	00090000-566e-cb0e-b5f0-872da3b195e1	aizv	10	t
003d0000-566e-cb0e-f8eb-cf71734d4032	00160000-566e-cb0e-4f37-f6ecf73c74ce	00090000-566e-cb0e-31bd-0e9eca95670e	apri	14	t
003d0000-566e-cb0e-7c65-78259d3343b7	00160000-566e-cb0e-104d-0fe222fb9f24	00090000-566e-cb0e-e47b-08f3f268ebd0	aizv	11	t
003d0000-566e-cb0e-a748-6ef1c22ed3ed	00160000-566e-cb0e-cb9c-28c6c39c2c95	00090000-566e-cb0e-a315-e11684a54d32	aizv	12	t
003d0000-566e-cb0e-dc22-e885280387a0	00160000-566e-cb0e-4f37-f6ecf73c74ce	00090000-566e-cb0e-6897-055874af1027	apri	18	f
\.


--
-- TOC entry 3159 (class 0 OID 32125277)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-566e-cb0e-4f37-f6ecf73c74ce	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-566e-cb0e-104d-0fe222fb9f24	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-566e-cb0e-cb9c-28c6c39c2c95	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3180 (class 0 OID 32125684)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32125020)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-566e-cb0e-9adc-9e340a6ff0cc	\N	\N	00200000-566e-cb0e-6e7a-f21557043af8	\N	\N	\N	00220000-566e-cb0e-0b90-dd71df022ec8	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-566e-cb0e-5a30-46c008d9c177	\N	\N	00200000-566e-cb0e-c7ea-01458b1a9d5b	\N	\N	\N	00220000-566e-cb0e-0b90-dd71df022ec8	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-566e-cb0e-738d-dcbe1162df8d	\N	\N	00200000-566e-cb0e-3399-f9874191be37	\N	\N	\N	00220000-566e-cb0e-e917-3febe32eaec8	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-566e-cb0e-80a5-6a4f19362ef8	\N	\N	00200000-566e-cb0e-c14c-78dab7cee912	\N	\N	\N	00220000-566e-cb0e-5419-76dc1be379f9	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-566e-cb0e-6c67-941403934430	\N	\N	00200000-566e-cb0e-515b-3c81812da9fb	\N	\N	\N	00220000-566e-cb0e-5b66-4c9216de48af	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3134 (class 0 OID 32125052)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 32125057)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 32125606)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 32124917)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-566e-cb0b-6cd8-56f8539c9e0c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-566e-cb0b-416b-da8965c89b00	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-566e-cb0b-5d7d-13e98888a2ab	AL	ALB	008	Albania 	Albanija	\N
00040000-566e-cb0b-a426-4777d80cb642	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-566e-cb0b-5f18-baad5391aad3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-566e-cb0b-cc7d-47b3365af3ce	AD	AND	020	Andorra 	Andora	\N
00040000-566e-cb0b-4c32-bd8f8c47d69d	AO	AGO	024	Angola 	Angola	\N
00040000-566e-cb0b-a021-5ecef3d99598	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-566e-cb0b-3a16-9dfdf703df83	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-566e-cb0b-d76d-2dc7b4957dba	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-566e-cb0b-73df-d496643b6e05	AR	ARG	032	Argentina 	Argenitna	\N
00040000-566e-cb0b-4690-c07b44a128a0	AM	ARM	051	Armenia 	Armenija	\N
00040000-566e-cb0b-f636-fec18531e4a0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-566e-cb0b-ca32-41bc616ecec2	AU	AUS	036	Australia 	Avstralija	\N
00040000-566e-cb0b-2787-428e0457a833	AT	AUT	040	Austria 	Avstrija	\N
00040000-566e-cb0b-3a83-0cbf4914f6d1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-566e-cb0b-9bf1-b438d030124d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-566e-cb0b-5604-4fcb42ef5dfb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-566e-cb0b-096b-03bca4d5104e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-566e-cb0b-56a4-5182ff9dc8de	BB	BRB	052	Barbados 	Barbados	\N
00040000-566e-cb0b-2b45-63a6fd05c955	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-566e-cb0b-6e66-4ff6113aa73d	BE	BEL	056	Belgium 	Belgija	\N
00040000-566e-cb0b-795b-2c99136080c8	BZ	BLZ	084	Belize 	Belize	\N
00040000-566e-cb0b-d4a3-90934b2e0706	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-566e-cb0b-744f-e1ceb29e6638	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-566e-cb0b-707b-9966ac92ea60	BT	BTN	064	Bhutan 	Butan	\N
00040000-566e-cb0b-6726-265cd5057149	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-566e-cb0b-30ef-b3470a590ab8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-566e-cb0b-2a9b-0a31accdaa78	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-566e-cb0b-95a3-e49435fcbee7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-566e-cb0b-ea29-aebb3e6f5bc3	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-566e-cb0b-d58c-fd7889c5dec6	BR	BRA	076	Brazil 	Brazilija	\N
00040000-566e-cb0b-ace2-f3eda36dbb1d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-566e-cb0b-177c-dbfea61c8142	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-566e-cb0b-51e3-b5a7af1b04ca	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-566e-cb0b-a810-95a19d57c938	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-566e-cb0b-4708-02920893f5f8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-566e-cb0b-d635-7e925b1069fb	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-566e-cb0b-2bd4-d73a92be9599	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-566e-cb0b-08be-448d21359474	CA	CAN	124	Canada 	Kanada	\N
00040000-566e-cb0b-a2cc-e43d4d4b78b8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-566e-cb0b-8317-030d067444c8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-566e-cb0b-4fea-71d3cb165b3a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-566e-cb0b-cc37-4d7d5575808f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-566e-cb0b-3a70-1f527ac1fe6d	CL	CHL	152	Chile 	Čile	\N
00040000-566e-cb0b-57f1-116700ba8617	CN	CHN	156	China 	Kitajska	\N
00040000-566e-cb0b-af0f-eccbd153c132	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-566e-cb0b-f401-77c21cd4418d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-566e-cb0b-dcd3-b2fb40bf1b37	CO	COL	170	Colombia 	Kolumbija	\N
00040000-566e-cb0b-7793-4cd2b9d18c04	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-566e-cb0b-94b6-2bedb746410b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-566e-cb0b-b946-5adeec7ec4f4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-566e-cb0b-46b6-4eacb965457b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-566e-cb0b-6cc2-bafb354fa06d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-566e-cb0b-7d12-5beb92b0c508	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-566e-cb0b-6168-a8d0b1f5935f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-566e-cb0b-de42-3795d8ceaca7	CU	CUB	192	Cuba 	Kuba	\N
00040000-566e-cb0b-693e-8f75732b4b80	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-566e-cb0b-5fd7-c97fa8e71123	CY	CYP	196	Cyprus 	Ciper	\N
00040000-566e-cb0b-93c2-e504cb885507	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-566e-cb0b-e3c1-7667c8188581	DK	DNK	208	Denmark 	Danska	\N
00040000-566e-cb0b-387c-a66669952de7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-566e-cb0b-4058-a3546581b29b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-566e-cb0b-4992-5c41f8a05c54	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-566e-cb0b-7988-10ebdf7109ba	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-566e-cb0b-f13f-e396586e933b	EG	EGY	818	Egypt 	Egipt	\N
00040000-566e-cb0b-c668-727f360e3580	SV	SLV	222	El Salvador 	Salvador	\N
00040000-566e-cb0b-4ce4-0ef5039f87a8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-566e-cb0b-0645-1eed762f4356	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-566e-cb0b-2603-575b0d536058	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-566e-cb0b-0dd3-84aeac1d869d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-566e-cb0b-059a-1d243afd3495	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-566e-cb0b-ec54-097e3f413690	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-566e-cb0b-953b-cc588aea079a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-566e-cb0b-29b4-fd10692a4a8f	FI	FIN	246	Finland 	Finska	\N
00040000-566e-cb0b-16d5-d9d884075881	FR	FRA	250	France 	Francija	\N
00040000-566e-cb0b-eefc-f4aa56b84dea	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-566e-cb0b-9adc-64ad6c9d564f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-566e-cb0b-8e01-9021f81c0d60	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-566e-cb0b-5503-33eaa6325fb9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-566e-cb0b-e47c-be6fcc684d09	GA	GAB	266	Gabon 	Gabon	\N
00040000-566e-cb0b-366a-1e8e1a281c9e	GM	GMB	270	Gambia 	Gambija	\N
00040000-566e-cb0b-bbcd-fb9b58686e1b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-566e-cb0b-b525-f4c73af403d8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-566e-cb0b-0fe8-b15742fc73ad	GH	GHA	288	Ghana 	Gana	\N
00040000-566e-cb0b-fc48-763e4ff781f9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-566e-cb0b-5e5e-46581b0d9836	GR	GRC	300	Greece 	Grčija	\N
00040000-566e-cb0b-560c-b2fdd299f82f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-566e-cb0b-5607-54a18dc7fa6b	GD	GRD	308	Grenada 	Grenada	\N
00040000-566e-cb0b-2e13-bde95ab81ed6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-566e-cb0b-6099-1272bce59ca4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-566e-cb0b-9b7b-92727bd50fd1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-566e-cb0b-6660-cd08da5cbbee	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-566e-cb0b-6ceb-605bb45719ea	GN	GIN	324	Guinea 	Gvineja	\N
00040000-566e-cb0b-98f0-73e20265a2cf	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-566e-cb0b-2727-030568369fb0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-566e-cb0b-3bbc-b45d054786ee	HT	HTI	332	Haiti 	Haiti	\N
00040000-566e-cb0b-57ab-0aa0cc0b1e30	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-566e-cb0b-8b60-798c09685267	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-566e-cb0b-ccb7-0e67e5578d8d	HN	HND	340	Honduras 	Honduras	\N
00040000-566e-cb0b-8f72-230cde558988	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-566e-cb0b-d4dc-721ef90e14a8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-566e-cb0b-3fe7-69a0a9e59628	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-566e-cb0b-b35f-ec71295788f8	IN	IND	356	India 	Indija	\N
00040000-566e-cb0b-131f-6389be17dc21	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-566e-cb0b-21e9-c25cb41be00a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-566e-cb0b-8c1a-82b5b0b37663	IQ	IRQ	368	Iraq 	Irak	\N
00040000-566e-cb0b-49d1-b8ae5c1fce16	IE	IRL	372	Ireland 	Irska	\N
00040000-566e-cb0b-5d25-facbaad82537	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-566e-cb0b-add2-f8c4dfe1c417	IL	ISR	376	Israel 	Izrael	\N
00040000-566e-cb0b-0db1-479e8c21f643	IT	ITA	380	Italy 	Italija	\N
00040000-566e-cb0b-25b5-cd7d07a99a2c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-566e-cb0b-d1f2-c0fb4087886f	JP	JPN	392	Japan 	Japonska	\N
00040000-566e-cb0b-d06c-3bbf2288f80d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-566e-cb0b-61ea-3bae9fadf385	JO	JOR	400	Jordan 	Jordanija	\N
00040000-566e-cb0b-f8e2-464c8f028da7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-566e-cb0b-ef48-53dc3543dd12	KE	KEN	404	Kenya 	Kenija	\N
00040000-566e-cb0b-eba2-63722aabfc23	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-566e-cb0b-11bc-9b09522fa7fe	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-566e-cb0b-7348-dbb33292e0fd	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-566e-cb0b-1207-b536d211ba0f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-566e-cb0b-8cb0-1a08f5ddafe1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-566e-cb0b-68f2-73c981e2f25d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-566e-cb0b-4ca8-c5c85de436e2	LV	LVA	428	Latvia 	Latvija	\N
00040000-566e-cb0b-d217-4d7df484cc81	LB	LBN	422	Lebanon 	Libanon	\N
00040000-566e-cb0b-4829-f0cbc48d54e0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-566e-cb0b-4f11-4dd005fdf88d	LR	LBR	430	Liberia 	Liberija	\N
00040000-566e-cb0b-e631-d57b774d4fc7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-566e-cb0b-c92b-5bf3a8b867d7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-566e-cb0b-f892-660d5626c71a	LT	LTU	440	Lithuania 	Litva	\N
00040000-566e-cb0b-7403-d40a66ee2f3d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-566e-cb0b-3e79-6bd834ef99ef	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-566e-cb0b-577f-c58baa19bb3e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-566e-cb0b-d8ef-8ce0c424df59	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-566e-cb0b-efab-1e6006191c9f	MW	MWI	454	Malawi 	Malavi	\N
00040000-566e-cb0b-e172-328dfea2bd0e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-566e-cb0b-4106-dea05026ae79	MV	MDV	462	Maldives 	Maldivi	\N
00040000-566e-cb0b-9508-3dd82afdfd8a	ML	MLI	466	Mali 	Mali	\N
00040000-566e-cb0b-7961-600a6b408b27	MT	MLT	470	Malta 	Malta	\N
00040000-566e-cb0b-07a3-a9566d93ea41	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-566e-cb0b-4fe6-0c11196a4a62	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-566e-cb0b-65f3-d2d30e299fd8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-566e-cb0b-dd4d-0857fe23869b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-566e-cb0b-1279-a7cc4f8d42a1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-566e-cb0b-6b15-07265f0c9064	MX	MEX	484	Mexico 	Mehika	\N
00040000-566e-cb0b-7294-c1b91c434f0d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-566e-cb0b-dab9-e630a610f919	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-566e-cb0b-4fbd-4cd8a0e67a3b	MC	MCO	492	Monaco 	Monako	\N
00040000-566e-cb0b-706b-db8a741c8f38	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-566e-cb0b-5e7b-2fd0b608620d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-566e-cb0b-8ae6-cd3442213c10	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-566e-cb0b-b5aa-b887a6ff7a56	MA	MAR	504	Morocco 	Maroko	\N
00040000-566e-cb0b-4d8a-ef293f09767f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-566e-cb0b-685b-350745c37bab	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-566e-cb0b-3407-07ef27f51ac1	NA	NAM	516	Namibia 	Namibija	\N
00040000-566e-cb0b-d61c-22b28bc2a91c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-566e-cb0b-a172-a00bb98cad97	NP	NPL	524	Nepal 	Nepal	\N
00040000-566e-cb0b-1ca5-fcfab9c06099	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-566e-cb0b-490c-0e1826ad40af	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-566e-cb0b-fe07-961e9981a3e3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-566e-cb0b-ceab-bb891461dcb9	NE	NER	562	Niger 	Niger 	\N
00040000-566e-cb0b-411a-15b14fd86be8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-566e-cb0b-2056-88863f2fcc33	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-566e-cb0b-eb5b-af0574a1550b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-566e-cb0b-6df4-eadcf229ae70	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-566e-cb0b-5105-4919ca1f3f8a	NO	NOR	578	Norway 	Norveška	\N
00040000-566e-cb0b-a8fb-b4843b287200	OM	OMN	512	Oman 	Oman	\N
00040000-566e-cb0b-97d1-855c8b95a759	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-566e-cb0b-039a-3aacc0dc225a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-566e-cb0b-7195-b553e9e9f7b1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-566e-cb0b-ffc6-748eaedc7075	PA	PAN	591	Panama 	Panama	\N
00040000-566e-cb0b-9071-e7d4e1a9bb04	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-566e-cb0b-ffe9-580b94791dfd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-566e-cb0b-eabd-e0bfc8cf21b2	PE	PER	604	Peru 	Peru	\N
00040000-566e-cb0b-e72e-eee0c5b72eb0	PH	PHL	608	Philippines 	Filipini	\N
00040000-566e-cb0b-ffbf-14a7469c3978	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-566e-cb0b-4947-ded6ddfcaf2e	PL	POL	616	Poland 	Poljska	\N
00040000-566e-cb0b-a618-8853d7b2111d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-566e-cb0b-10a8-0217f4703655	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-566e-cb0b-e720-41dca38ab328	QA	QAT	634	Qatar 	Katar	\N
00040000-566e-cb0b-23f0-a941335c44d1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-566e-cb0b-dd66-f0c836948abc	RO	ROU	642	Romania 	Romunija	\N
00040000-566e-cb0b-4bbb-abf2d4524e3a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-566e-cb0b-8686-a75d29ec87bf	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-566e-cb0b-9303-47b391d28c56	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-566e-cb0b-d8e9-e0986f7c1711	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-566e-cb0b-4abf-1969cb8ffbd3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-566e-cb0b-645d-fa21f6a79df8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-566e-cb0b-094f-84e026e19e6c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-566e-cb0b-ae6c-add04e61096b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-566e-cb0b-2338-d084eaee8d43	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-566e-cb0b-d155-2ca852bbf786	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-566e-cb0b-99f9-7e1d287c66c1	SM	SMR	674	San Marino 	San Marino	\N
00040000-566e-cb0b-5d83-b51b562c2e68	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-566e-cb0b-9e16-ca3e1d0eb848	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-566e-cb0b-6ca4-b32596e006a1	SN	SEN	686	Senegal 	Senegal	\N
00040000-566e-cb0b-dac1-94d24d2dae63	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-566e-cb0b-f881-b11389f3ea39	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-566e-cb0b-0cfb-9d97a89cf1e8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-566e-cb0b-023c-50e2d91d30aa	SG	SGP	702	Singapore 	Singapur	\N
00040000-566e-cb0b-03f7-a5be7b7800b5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-566e-cb0b-6393-1eddf83e392b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-566e-cb0b-a49e-08dd0e808645	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-566e-cb0b-f7a3-d7008f849310	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-566e-cb0b-05df-72241e833681	SO	SOM	706	Somalia 	Somalija	\N
00040000-566e-cb0b-31c0-bcc0232b5b16	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-566e-cb0b-4449-03576ba994a9	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-566e-cb0b-274b-3a7d17902c4b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-566e-cb0b-b2f1-97f9876e8a8f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-566e-cb0b-5aa9-b3636e9e43fd	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-566e-cb0b-ecc0-fbc16a41b90f	SD	SDN	729	Sudan 	Sudan	\N
00040000-566e-cb0b-6c0b-0a5285f3d581	SR	SUR	740	Suriname 	Surinam	\N
00040000-566e-cb0b-2f59-1cac711bce79	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-566e-cb0b-04e3-db4ad8b30868	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-566e-cb0b-8414-65df2a95fb1c	SE	SWE	752	Sweden 	Švedska	\N
00040000-566e-cb0b-45da-b5c89df9ac3f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-566e-cb0b-08a0-a3f5a9512eff	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-566e-cb0b-d35d-cdd8876c9649	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-566e-cb0b-26d9-6b478366e32c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-566e-cb0b-775e-28aebe1aba07	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-566e-cb0b-4342-b632422e8b5d	TH	THA	764	Thailand 	Tajska	\N
00040000-566e-cb0b-2374-11d5fd04f583	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-566e-cb0b-9943-0bd2b95465f7	TG	TGO	768	Togo 	Togo	\N
00040000-566e-cb0b-872d-1095c81a0d63	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-566e-cb0b-9481-e6e683f7156f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-566e-cb0b-f240-4a274c323b7e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-566e-cb0b-f8f0-c2ba0d3dc0bd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-566e-cb0b-6fe8-ab5667eb3742	TR	TUR	792	Turkey 	Turčija	\N
00040000-566e-cb0b-2a61-ca46b1f2d85e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-566e-cb0b-5dad-ffa1e80ba649	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-566e-cb0b-d328-35e89043a940	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-566e-cb0b-afb2-a41958ab26cd	UG	UGA	800	Uganda 	Uganda	\N
00040000-566e-cb0b-a6c2-38814a21b10a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-566e-cb0b-e7df-b1fc25bfe4ef	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-566e-cb0b-2b21-976b421fce15	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-566e-cb0b-a377-9fe6d7c53fcf	US	USA	840	United States 	Združene države Amerike	\N
00040000-566e-cb0b-58bb-b418c95d0fb1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-566e-cb0b-4038-6bcd8d0667a9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-566e-cb0b-8bc1-8c4675930a11	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-566e-cb0b-d36e-288e2508bb00	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-566e-cb0b-b630-536bf74e55ba	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-566e-cb0b-e390-74b39dd9e722	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-566e-cb0b-088f-7a5f1eb5cc0e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-566e-cb0b-c426-de70546a91e3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-566e-cb0b-bff7-26e866d7b80c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-566e-cb0b-efda-a6994226a8d6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-566e-cb0b-05ae-aa757e9e6c7b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-566e-cb0b-0ea6-88be60e3dcf7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-566e-cb0b-3728-290136a996c8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3167 (class 0 OID 32125400)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-566e-cb0e-c0f8-8d2fcda8e00f	000e0000-566e-cb0e-f229-3c9c2836de75	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566e-cb0b-70f0-45d8740a9705	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-566e-cb0e-8dc6-947935e892c5	000e0000-566e-cb0e-0727-f043aa27cc87	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566e-cb0b-da0a-bba242ea983a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-566e-cb0e-6c98-ceb5aaa206fa	000e0000-566e-cb0e-e7d7-45415ad1c193	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566e-cb0b-70f0-45d8740a9705	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-566e-cb0e-f5a6-acf978950373	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-566e-cb0e-175c-76cad0942393	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3152 (class 0 OID 32125200)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-566e-cb0e-17e5-eecf696b4816	000e0000-566e-cb0e-0727-f043aa27cc87	000c0000-566e-cb0e-bbe7-afbc6e107bb5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-566e-cb0b-ae33-56caa59fc93a
000d0000-566e-cb0e-aca7-6bca9605699e	000e0000-566e-cb0e-0727-f043aa27cc87	000c0000-566e-cb0e-bc31-3ec630b7bcaf	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-566e-cb0b-7f72-b7f2b2b35a6f
000d0000-566e-cb0e-17f8-44c0488cf962	000e0000-566e-cb0e-0727-f043aa27cc87	000c0000-566e-cb0e-0878-51cd82e91a78	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-566e-cb0b-a5da-ed377f7334f7
000d0000-566e-cb0e-bb7a-bc51d179dcde	000e0000-566e-cb0e-0727-f043aa27cc87	000c0000-566e-cb0e-2226-0503903c4e88	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-566e-cb0b-41ce-b4cbfd208eb1
000d0000-566e-cb0e-8819-549b6900e597	000e0000-566e-cb0e-0727-f043aa27cc87	000c0000-566e-cb0e-d7c1-61459a1d0e32	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-566e-cb0b-41ce-b4cbfd208eb1
000d0000-566e-cb0e-2cf4-00101769f2d8	000e0000-566e-cb0e-0727-f043aa27cc87	000c0000-566e-cb0e-f83b-cba838a969cd	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-566e-cb0b-ae33-56caa59fc93a
000d0000-566e-cb0e-86af-3afd89f0b472	000e0000-566e-cb0e-0727-f043aa27cc87	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-566e-cb0b-ae33-56caa59fc93a
000d0000-566e-cb0e-fd5e-082d2ac8488d	000e0000-566e-cb0e-0727-f043aa27cc87	000c0000-566e-cb0e-c39a-55397ebd7907	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-566e-cb0b-0714-602ef6801c2b
000d0000-566e-cb0e-c3bc-e31cd4334892	000e0000-566e-cb0e-0727-f043aa27cc87	000c0000-566e-cb0e-21ab-1e65a75f2084	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-566e-cb0b-97dc-882559308b0d
\.


--
-- TOC entry 3129 (class 0 OID 32124991)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 32124957)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 32124934)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-566e-cb0e-39b1-066ef590f517	00080000-566e-cb0e-b4bb-7073af8745e1	00090000-566e-cb0e-e133-a562e10711b2	AK		igralka
\.


--
-- TOC entry 3141 (class 0 OID 32125114)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 32125664)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-566e-cb0e-945d-18559d2bcb8e	00010000-566e-cb0c-f4f9-7ed3d515f755	\N	Prva mapa	Root mapa	2015-12-14 14:58:38	2015-12-14 14:58:38	R	\N	\N
\.


--
-- TOC entry 3179 (class 0 OID 32125677)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32125699)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 32028295)
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
-- TOC entry 3145 (class 0 OID 32125139)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 32124891)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-566e-cb0c-ff47-eab36fb5fb69	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-566e-cb0c-e6be-a17883560d03	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-566e-cb0c-de46-c4f91e8d2ee7	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-566e-cb0c-5b41-3d0fc51aa377	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-566e-cb0c-243f-651840c64dd2	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-566e-cb0c-b677-9a07b2c034f0	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-566e-cb0c-55f8-71c3b078793b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-566e-cb0c-7cf5-11aa72ef429f	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-566e-cb0c-61c9-52e7dbefe14e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-566e-cb0c-6474-6d20bc4114e4	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-566e-cb0c-2b8d-38774e631c73	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-566e-cb0c-3fc9-46597e8b9e84	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-566e-cb0c-9959-a3de77fbb028	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-566e-cb0c-edba-f5b4a9eca4b4	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-566e-cb0e-d414-b6458d23f45d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-566e-cb0e-2b49-85b9014f5652	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-566e-cb0e-c13d-bd315df8127e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-566e-cb0e-0437-06672f6d1bf1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-566e-cb0e-c7f9-ab4bf7305bb2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-566e-cb10-7521-3b80f5a67af7	application.tenant.maticnopodjetje	string	s:36:"00080000-566e-cb10-1d0d-4b03c20922ed";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3114 (class 0 OID 32124791)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-566e-cb0e-481a-283f7d888d2c	00000000-566e-cb0e-d414-b6458d23f45d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-566e-cb0e-4bc3-3c7b16d1d66c	00000000-566e-cb0e-d414-b6458d23f45d	00010000-566e-cb0c-f4f9-7ed3d515f755	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-566e-cb0e-0efd-a0422f8551a3	00000000-566e-cb0e-2b49-85b9014f5652	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3118 (class 0 OID 32124858)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-566e-cb0e-a716-94b1f61368a6	\N	00100000-566e-cb0e-5ee6-07180f342264	00100000-566e-cb0e-3760-2bc12add82e7	01	Gledališče Nimbis
00410000-566e-cb0e-11a8-807be8f48fe3	00410000-566e-cb0e-a716-94b1f61368a6	00100000-566e-cb0e-5ee6-07180f342264	00100000-566e-cb0e-3760-2bc12add82e7	02	Tehnika
\.


--
-- TOC entry 3115 (class 0 OID 32124802)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-566e-cb0e-4a98-63801bfc55ae	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-566e-cb0e-8300-2ada8b5c9745	00010000-566e-cb0e-c2ea-ae4b616d1aad	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-566e-cb0e-0909-00649c841acb	00010000-566e-cb0e-9d1f-ce5ba96a70c8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-566e-cb0e-3ce3-db64f68d6e1d	00010000-566e-cb0e-a7ea-a2576b6cfa91	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-566e-cb0e-fc99-ec838b44c404	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-566e-cb0e-f9e0-b63f2965401f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-566e-cb0e-87a2-8c05802d9b38	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-566e-cb0e-cef9-94720153c51a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-566e-cb0e-e133-a562e10711b2	00010000-566e-cb0e-e9b6-d732b4cd5f46	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-566e-cb0e-6e7c-afc87e6172a2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-566e-cb0e-62a9-e8ee2f9ad1e8	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-566e-cb0e-2dd2-c9d57a233b38	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-566e-cb0e-be4b-6a753b81a5a0	00010000-566e-cb0e-8eef-7313a81e1106	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-566e-cb0e-b5f0-872da3b195e1	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cb0e-31bd-0e9eca95670e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cb0e-e47b-08f3f268ebd0	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cb0e-a315-e11684a54d32	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-566e-cb0e-6897-055874af1027	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-566e-cb0e-26b2-686156a6424b	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cb0e-153c-c29ee12538c1	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cb0e-caa8-a0303cfba540	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3107 (class 0 OID 32124737)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-566e-cb0c-01d1-6b4437bd3d1f	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-566e-cb0c-cf9c-4eb5f8e77a86	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-566e-cb0c-7dc3-5a512514657b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-566e-cb0c-9c2b-39e8f1435d9c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-566e-cb0c-8c39-de9a3de2ae18	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-566e-cb0c-ffcd-776b975ff316	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-566e-cb0c-3bcf-03e3552f2c63	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-566e-cb0c-a304-f2042a995562	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-566e-cb0c-f182-4fd0ebb34e86	Abonma-read	Abonma - branje	t
00030000-566e-cb0c-a45b-84609b646d9c	Abonma-write	Abonma - spreminjanje	t
00030000-566e-cb0c-42f0-5904bc82589f	Alternacija-read	Alternacija - branje	t
00030000-566e-cb0c-3abf-b385480439ce	Alternacija-write	Alternacija - spreminjanje	t
00030000-566e-cb0c-15c7-e32bc96ba17c	Arhivalija-read	Arhivalija - branje	t
00030000-566e-cb0c-1067-a8d6afb90e5b	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-566e-cb0c-2f49-b652c18d33d7	AuthStorage-read	AuthStorage - branje	t
00030000-566e-cb0c-1cbf-9947c35fcc0e	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-566e-cb0c-1e95-c1390a69ec4c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-566e-cb0c-5fd1-fd3ee1c4ef51	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-566e-cb0c-f03b-693d59bd3eb2	Besedilo-read	Besedilo - branje	t
00030000-566e-cb0c-66c4-62a6133d93d7	Besedilo-write	Besedilo - spreminjanje	t
00030000-566e-cb0c-19e0-5c09c0d34522	Dogodek-read	Dogodek - branje	t
00030000-566e-cb0c-24a5-da5c266d66b4	Dogodek-write	Dogodek - spreminjanje	t
00030000-566e-cb0c-6f3e-504a5d7c69b3	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-566e-cb0c-463e-eef00897f388	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-566e-cb0c-cee3-91cdb7f0748f	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-566e-cb0c-50b8-7c6c294306a2	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-566e-cb0c-8e48-97dc33b4957f	DogodekTrait-read	DogodekTrait - branje	t
00030000-566e-cb0c-7fa4-2824d40b5b1f	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-566e-cb0c-f542-9a5c5d380188	DrugiVir-read	DrugiVir - branje	t
00030000-566e-cb0c-6f4e-48a7cfb43dab	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-566e-cb0c-8bee-e4b34c58dc91	Drzava-read	Drzava - branje	t
00030000-566e-cb0c-3197-d85969d9e8fb	Drzava-write	Drzava - spreminjanje	t
00030000-566e-cb0c-868b-4cdea890c985	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-566e-cb0c-8ab4-903b6819cf3e	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-566e-cb0c-aad8-ef552e910ad0	Funkcija-read	Funkcija - branje	t
00030000-566e-cb0c-bc83-cd9982bbdb37	Funkcija-write	Funkcija - spreminjanje	t
00030000-566e-cb0c-6bb9-9d31ed02463e	Gostovanje-read	Gostovanje - branje	t
00030000-566e-cb0c-bb0a-e6643753c547	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-566e-cb0c-3de1-65e98609457f	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-566e-cb0c-3275-d920c71a9232	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-566e-cb0c-c269-ceb5f11c4670	Kupec-read	Kupec - branje	t
00030000-566e-cb0c-e3b5-238273995158	Kupec-write	Kupec - spreminjanje	t
00030000-566e-cb0c-fbb6-da4ac78d84b4	NacinPlacina-read	NacinPlacina - branje	t
00030000-566e-cb0c-6d38-bd65d246458c	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-566e-cb0c-491f-96fc4390d91c	Option-read	Option - branje	t
00030000-566e-cb0c-4492-3e245281df08	Option-write	Option - spreminjanje	t
00030000-566e-cb0c-5cf1-a5dfbc842269	OptionValue-read	OptionValue - branje	t
00030000-566e-cb0c-4808-09cadc4a1e29	OptionValue-write	OptionValue - spreminjanje	t
00030000-566e-cb0c-35ce-c14a20672ca1	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-566e-cb0c-ea86-614920d7de89	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-566e-cb0c-984c-ba54a5512f24	Oseba-read	Oseba - branje	t
00030000-566e-cb0c-1365-59cb920191ac	Oseba-write	Oseba - spreminjanje	t
00030000-566e-cb0c-c1cd-d038dbc8bee8	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-566e-cb0c-1776-5de6d5351f19	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-566e-cb0c-8399-8ef129993aff	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-566e-cb0c-7623-6cf59b5b652f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-566e-cb0c-e348-4ad887fa9f57	Pogodba-read	Pogodba - branje	t
00030000-566e-cb0c-3a53-641bd01edf65	Pogodba-write	Pogodba - spreminjanje	t
00030000-566e-cb0c-47d3-55c4f41ac482	Popa-read	Popa - branje	t
00030000-566e-cb0c-eb51-a5c443c8fa8f	Popa-write	Popa - spreminjanje	t
00030000-566e-cb0c-0cb9-c8f517590c16	Posta-read	Posta - branje	t
00030000-566e-cb0c-e461-0fc147a812cf	Posta-write	Posta - spreminjanje	t
00030000-566e-cb0c-6156-583179c984a0	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-566e-cb0c-2289-b59110a7723e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-566e-cb0c-3fcf-890e675d0f64	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-566e-cb0c-c6e1-c33fda917357	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-566e-cb0c-3831-d93d537feaa4	PostniNaslov-read	PostniNaslov - branje	t
00030000-566e-cb0c-d13f-157eeeb9981f	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-566e-cb0c-0da2-6bcf3897c6e7	Praznik-read	Praznik - branje	t
00030000-566e-cb0c-43f3-466e56fc6c6a	Praznik-write	Praznik - spreminjanje	t
00030000-566e-cb0c-ce61-31e80be07957	Predstava-read	Predstava - branje	t
00030000-566e-cb0c-9f7c-eb7dcf4bd052	Predstava-write	Predstava - spreminjanje	t
00030000-566e-cb0c-d72e-ef051bc6cb6b	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-566e-cb0c-01c8-26b347a5d334	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-566e-cb0c-4def-2f2c693ab7ab	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-566e-cb0c-33b2-4eb67590823d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-566e-cb0c-8849-aa6fa934bcd2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-566e-cb0c-cd90-6d772a0673f9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-566e-cb0c-3747-e9bc4f107e2c	ProgramDela-read	ProgramDela - branje	t
00030000-566e-cb0c-3dd8-d9fac4045460	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-566e-cb0c-c4f0-2cb3bc6f336d	ProgramFestival-read	ProgramFestival - branje	t
00030000-566e-cb0c-1cb5-cf06a3e935db	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-566e-cb0c-c6c8-242005de95d3	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-566e-cb0c-88b5-45d293bb20b3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-566e-cb0c-115f-abe81d987cb5	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-566e-cb0c-8e87-6153abb80f1a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-566e-cb0c-2098-300a58c43784	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-566e-cb0c-573e-875ecb8805ec	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-566e-cb0c-6a00-1f71c5879e5a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-566e-cb0c-0ffd-41d3d1f47310	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-566e-cb0c-c5d8-ace939fde62e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-566e-cb0c-165f-240ee8f2c316	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-566e-cb0c-da4d-f15ed4435e0d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-566e-cb0c-9591-912c5c022fb0	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-566e-cb0c-526b-50c86bb915d6	ProgramRazno-read	ProgramRazno - branje	t
00030000-566e-cb0c-68cf-5a5592e4da14	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-566e-cb0c-1a39-d1c7291a20ca	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-566e-cb0c-7611-380aca44c0ff	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-566e-cb0c-68c0-3528544dd629	Prostor-read	Prostor - branje	t
00030000-566e-cb0c-d97f-a80b27649a14	Prostor-write	Prostor - spreminjanje	t
00030000-566e-cb0c-9661-3ab2da7c0709	Racun-read	Racun - branje	t
00030000-566e-cb0c-ebbc-d24052adec33	Racun-write	Racun - spreminjanje	t
00030000-566e-cb0c-1b21-5f2ae1f71348	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-566e-cb0c-4dd9-ac2aa8ec6598	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-566e-cb0c-08b3-646e1af4b8b5	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-566e-cb0c-f932-14c1a45fea9c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-566e-cb0c-3fe2-018d6fd4de76	Rekvizit-read	Rekvizit - branje	t
00030000-566e-cb0c-50c0-66ad7b77a47f	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-566e-cb0c-a982-e46aedb9d780	Revizija-read	Revizija - branje	t
00030000-566e-cb0c-7d07-5dc5e6e9e9a9	Revizija-write	Revizija - spreminjanje	t
00030000-566e-cb0c-566a-6dd025ad9d6c	Rezervacija-read	Rezervacija - branje	t
00030000-566e-cb0c-a9aa-5c0c7e6a3a27	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-566e-cb0c-e343-d3ef23d90d1b	SedezniRed-read	SedezniRed - branje	t
00030000-566e-cb0c-6753-e4bb6e96cd44	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-566e-cb0c-37f1-4161fbf48e53	Sedez-read	Sedez - branje	t
00030000-566e-cb0c-5b5e-4bc1fd629c25	Sedez-write	Sedez - spreminjanje	t
00030000-566e-cb0c-a372-b0deb2656217	Sezona-read	Sezona - branje	t
00030000-566e-cb0c-295f-9fdf117b99fd	Sezona-write	Sezona - spreminjanje	t
00030000-566e-cb0c-1de9-962a3e830cc8	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-566e-cb0c-1523-c4a133b7f323	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-566e-cb0c-5773-9a185390a56c	Telefonska-read	Telefonska - branje	t
00030000-566e-cb0c-00f7-2766b2429a44	Telefonska-write	Telefonska - spreminjanje	t
00030000-566e-cb0c-63fa-a14b9a638b7b	TerminStoritve-read	TerminStoritve - branje	t
00030000-566e-cb0c-9b6b-e1505e1b146b	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-566e-cb0c-77ef-5a23c6041415	TipFunkcije-read	TipFunkcije - branje	t
00030000-566e-cb0c-89f7-085dba84db87	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-566e-cb0c-6333-50833b4857a8	TipPopa-read	TipPopa - branje	t
00030000-566e-cb0c-9758-01a418ed930c	TipPopa-write	TipPopa - spreminjanje	t
00030000-566e-cb0c-8247-b567ab0d5081	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-566e-cb0c-a586-4b57ccfc9a16	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-566e-cb0c-d645-9e80a40c3e48	TipVaje-read	TipVaje - branje	t
00030000-566e-cb0c-4e6a-a0fd9197e83b	TipVaje-write	TipVaje - spreminjanje	t
00030000-566e-cb0c-52d0-7b110f8d826c	Trr-read	Trr - branje	t
00030000-566e-cb0c-725d-ed7102b4160a	Trr-write	Trr - spreminjanje	t
00030000-566e-cb0c-7433-187c8bf4099b	Uprizoritev-read	Uprizoritev - branje	t
00030000-566e-cb0c-9e55-1b5c7170ea91	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-566e-cb0c-c941-3993776fba01	Vaja-read	Vaja - branje	t
00030000-566e-cb0c-eeab-83e4738c34dc	Vaja-write	Vaja - spreminjanje	t
00030000-566e-cb0c-c60f-b2b54739a593	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-566e-cb0c-a3b1-561dde11bc54	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-566e-cb0c-21ca-5041e71146b0	VrstaStroska-read	VrstaStroska - branje	t
00030000-566e-cb0c-1fdb-f33d6b164254	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-566e-cb0c-1108-44f23cb5e20b	Zaposlitev-read	Zaposlitev - branje	t
00030000-566e-cb0c-1a04-95cd71264dfd	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-566e-cb0c-2b04-08e227f3dc84	Zasedenost-read	Zasedenost - branje	t
00030000-566e-cb0c-74ff-f6bec534e9d0	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-566e-cb0c-268a-db47e65b0b7c	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-566e-cb0c-9adb-c4f7bdad5b2f	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-566e-cb0c-f00a-6b2a6cb812a1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-566e-cb0c-80bf-7963a10ecdba	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-566e-cb0c-731c-01a70bb64cfb	Job-read	Branje opravil - samo zase - branje	t
00030000-566e-cb0c-f39e-f42d5daca400	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-566e-cb0c-0f67-e3ebeb334030	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-566e-cb0c-ff92-29f4fc4f1805	Report-read	Report - branje	t
00030000-566e-cb0c-c89b-5a2212f98fcc	Report-write	Report - spreminjanje	t
00030000-566e-cb0c-372d-41385787ab9c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-566e-cb0c-b1cd-fe62b2acaf34	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-566e-cb0c-6f84-ebf6f421cee9	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-566e-cb0c-7074-cf7ccc4d34a7	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-566e-cb0c-e3b5-11f2704fb4d2	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-566e-cb0c-1803-eb27c46e2366	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-566e-cb0c-1e3f-72fe368a1bb9	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-566e-cb0c-5572-d98a5cb8b94a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-566e-cb0c-2c61-9ae6b93f7380	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-566e-cb0c-5f3a-c5b19b72e9b7	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-566e-cb0c-1325-6aa365695529	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-566e-cb0c-37a1-a3039ca1f165	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-566e-cb0c-7f6c-215a5f83b8bf	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-566e-cb0c-86ea-592b1533a4df	Datoteka-write	Datoteka - spreminjanje	t
00030000-566e-cb0c-676f-4a541cf59bda	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3109 (class 0 OID 32124756)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-566e-cb0c-77fd-f6149a03e560	00030000-566e-cb0c-cf9c-4eb5f8e77a86
00020000-566e-cb0c-77fd-f6149a03e560	00030000-566e-cb0c-01d1-6b4437bd3d1f
00020000-566e-cb0c-f333-b7ad3ec48441	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-5fd1-fd3ee1c4ef51
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-66c4-62a6133d93d7
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-86ea-592b1533a4df
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-5f3a-c5b19b72e9b7
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-1e95-c1390a69ec4c
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-f03b-693d59bd3eb2
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-2c1b-2915bc24055d	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-df81-17f2e003a7a6	00030000-566e-cb0c-1e95-c1390a69ec4c
00020000-566e-cb0c-df81-17f2e003a7a6	00030000-566e-cb0c-f03b-693d59bd3eb2
00020000-566e-cb0c-df81-17f2e003a7a6	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-df81-17f2e003a7a6	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-df81-17f2e003a7a6	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-8d6c-197aa9cd9279	00030000-566e-cb0c-1108-44f23cb5e20b
00020000-566e-cb0c-8d6c-197aa9cd9279	00030000-566e-cb0c-1a04-95cd71264dfd
00020000-566e-cb0c-8d6c-197aa9cd9279	00030000-566e-cb0c-ffcd-776b975ff316
00020000-566e-cb0c-8d6c-197aa9cd9279	00030000-566e-cb0c-8c39-de9a3de2ae18
00020000-566e-cb0c-8d6c-197aa9cd9279	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-8d6c-197aa9cd9279	00030000-566e-cb0c-1365-59cb920191ac
00020000-566e-cb0c-8d6c-197aa9cd9279	00030000-566e-cb0c-35ce-c14a20672ca1
00020000-566e-cb0c-e009-0d895de98760	00030000-566e-cb0c-1108-44f23cb5e20b
00020000-566e-cb0c-e009-0d895de98760	00030000-566e-cb0c-ffcd-776b975ff316
00020000-566e-cb0c-e009-0d895de98760	00030000-566e-cb0c-35ce-c14a20672ca1
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-1365-59cb920191ac
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-3831-d93d537feaa4
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-d13f-157eeeb9981f
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-5773-9a185390a56c
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-00f7-2766b2429a44
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-86ea-592b1533a4df
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-5f3a-c5b19b72e9b7
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-44fa-8b382110dfb7	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0c-20de-0254d204116d	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-20de-0254d204116d	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-20de-0254d204116d	00030000-566e-cb0c-3831-d93d537feaa4
00020000-566e-cb0c-20de-0254d204116d	00030000-566e-cb0c-5773-9a185390a56c
00020000-566e-cb0c-20de-0254d204116d	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-20de-0254d204116d	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-20de-0254d204116d	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-e689-c35524e701ad	00030000-566e-cb0c-1365-59cb920191ac
00020000-566e-cb0c-e689-c35524e701ad	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-e689-c35524e701ad	00030000-566e-cb0c-ffcd-776b975ff316
00020000-566e-cb0c-e689-c35524e701ad	00030000-566e-cb0c-8c39-de9a3de2ae18
00020000-566e-cb0c-e689-c35524e701ad	00030000-566e-cb0c-52d0-7b110f8d826c
00020000-566e-cb0c-e689-c35524e701ad	00030000-566e-cb0c-725d-ed7102b4160a
00020000-566e-cb0c-e689-c35524e701ad	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-3856-b03449190556	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-3856-b03449190556	00030000-566e-cb0c-ffcd-776b975ff316
00020000-566e-cb0c-3856-b03449190556	00030000-566e-cb0c-52d0-7b110f8d826c
00020000-566e-cb0c-3856-b03449190556	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-5773-9a185390a56c
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-3831-d93d537feaa4
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-52d0-7b110f8d826c
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-3de1-65e98609457f
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-00f7-2766b2429a44
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-d13f-157eeeb9981f
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-725d-ed7102b4160a
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-eb51-a5c443c8fa8f
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-86ea-592b1533a4df
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-5f3a-c5b19b72e9b7
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-3275-d920c71a9232
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-cd90-6d772a0673f9
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-82aa-1e50df2b0a09	00030000-566e-cb0c-6333-50833b4857a8
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-5773-9a185390a56c
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-3831-d93d537feaa4
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-52d0-7b110f8d826c
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-3de1-65e98609457f
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	00030000-566e-cb0c-6333-50833b4857a8
00020000-566e-cb0c-36cf-90f97e22a8dd	00030000-566e-cb0c-6333-50833b4857a8
00020000-566e-cb0c-36cf-90f97e22a8dd	00030000-566e-cb0c-9758-01a418ed930c
00020000-566e-cb0c-6d6c-ec4ee4f345d6	00030000-566e-cb0c-6333-50833b4857a8
00020000-566e-cb0c-5307-ec481df0f79b	00030000-566e-cb0c-0cb9-c8f517590c16
00020000-566e-cb0c-5307-ec481df0f79b	00030000-566e-cb0c-e461-0fc147a812cf
00020000-566e-cb0c-cf51-455796765163	00030000-566e-cb0c-0cb9-c8f517590c16
00020000-566e-cb0c-d151-79cee820ac40	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-d151-79cee820ac40	00030000-566e-cb0c-3197-d85969d9e8fb
00020000-566e-cb0c-8736-44cd05f84382	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-3acd-c0ba8784ddb7	00030000-566e-cb0c-f00a-6b2a6cb812a1
00020000-566e-cb0c-3acd-c0ba8784ddb7	00030000-566e-cb0c-80bf-7963a10ecdba
00020000-566e-cb0c-26dc-ac27827b2d6e	00030000-566e-cb0c-f00a-6b2a6cb812a1
00020000-566e-cb0c-5301-795c7230f4dd	00030000-566e-cb0c-268a-db47e65b0b7c
00020000-566e-cb0c-5301-795c7230f4dd	00030000-566e-cb0c-9adb-c4f7bdad5b2f
00020000-566e-cb0c-ec80-fa43ed275a03	00030000-566e-cb0c-268a-db47e65b0b7c
00020000-566e-cb0c-cfe0-1a7248cabf0a	00030000-566e-cb0c-f182-4fd0ebb34e86
00020000-566e-cb0c-cfe0-1a7248cabf0a	00030000-566e-cb0c-a45b-84609b646d9c
00020000-566e-cb0c-57d3-e835362b6124	00030000-566e-cb0c-f182-4fd0ebb34e86
00020000-566e-cb0c-8bb5-d70236464c6b	00030000-566e-cb0c-68c0-3528544dd629
00020000-566e-cb0c-8bb5-d70236464c6b	00030000-566e-cb0c-d97f-a80b27649a14
00020000-566e-cb0c-8bb5-d70236464c6b	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0c-8bb5-d70236464c6b	00030000-566e-cb0c-3831-d93d537feaa4
00020000-566e-cb0c-8bb5-d70236464c6b	00030000-566e-cb0c-d13f-157eeeb9981f
00020000-566e-cb0c-8bb5-d70236464c6b	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-535f-a051d8e08af2	00030000-566e-cb0c-68c0-3528544dd629
00020000-566e-cb0c-535f-a051d8e08af2	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0c-535f-a051d8e08af2	00030000-566e-cb0c-3831-d93d537feaa4
00020000-566e-cb0c-aa9c-d16dea3b1a0c	00030000-566e-cb0c-21ca-5041e71146b0
00020000-566e-cb0c-aa9c-d16dea3b1a0c	00030000-566e-cb0c-1fdb-f33d6b164254
00020000-566e-cb0c-7b9e-4e013569dbd7	00030000-566e-cb0c-21ca-5041e71146b0
00020000-566e-cb0c-a63c-4ad6c12f4e36	00030000-566e-cb0c-ea86-614920d7de89
00020000-566e-cb0c-a63c-4ad6c12f4e36	00030000-566e-cb0c-35ce-c14a20672ca1
00020000-566e-cb0c-a63c-4ad6c12f4e36	00030000-566e-cb0c-1108-44f23cb5e20b
00020000-566e-cb0c-a63c-4ad6c12f4e36	00030000-566e-cb0c-86ea-592b1533a4df
00020000-566e-cb0c-a63c-4ad6c12f4e36	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-a63c-4ad6c12f4e36	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0c-a63c-4ad6c12f4e36	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-a63c-4ad6c12f4e36	00030000-566e-cb0c-5f3a-c5b19b72e9b7
00020000-566e-cb0c-a63c-4ad6c12f4e36	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-7609-7376978b0e58	00030000-566e-cb0c-35ce-c14a20672ca1
00020000-566e-cb0c-7609-7376978b0e58	00030000-566e-cb0c-1108-44f23cb5e20b
00020000-566e-cb0c-7609-7376978b0e58	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-7609-7376978b0e58	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-7609-7376978b0e58	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-30b1-f9b2402bf8db	00030000-566e-cb0c-d645-9e80a40c3e48
00020000-566e-cb0c-30b1-f9b2402bf8db	00030000-566e-cb0c-4e6a-a0fd9197e83b
00020000-566e-cb0c-6e77-1dff14ba0a57	00030000-566e-cb0c-d645-9e80a40c3e48
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-3bcf-03e3552f2c63
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-a304-f2042a995562
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-3747-e9bc4f107e2c
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-3dd8-d9fac4045460
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-c4f0-2cb3bc6f336d
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-1cb5-cf06a3e935db
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-c6c8-242005de95d3
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-88b5-45d293bb20b3
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-115f-abe81d987cb5
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-8e87-6153abb80f1a
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-2098-300a58c43784
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-573e-875ecb8805ec
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-6a00-1f71c5879e5a
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-0ffd-41d3d1f47310
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-c5d8-ace939fde62e
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-165f-240ee8f2c316
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-da4d-f15ed4435e0d
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-9591-912c5c022fb0
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-526b-50c86bb915d6
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-68cf-5a5592e4da14
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-1a39-d1c7291a20ca
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-7611-380aca44c0ff
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-33b2-4eb67590823d
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-6f4e-48a7cfb43dab
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-2289-b59110a7723e
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-f39e-f42d5daca400
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-f542-9a5c5d380188
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-4def-2f2c693ab7ab
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-6156-583179c984a0
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-21ca-5041e71146b0
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-1de9-962a3e830cc8
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-aad8-ef552e910ad0
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-42f0-5904bc82589f
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-77ef-5a23c6041415
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-e348-4ad887fa9f57
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-86ea-592b1533a4df
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-5f3a-c5b19b72e9b7
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-731c-01a70bb64cfb
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-b500-f05e5cd89a0d	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-3747-e9bc4f107e2c
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-c4f0-2cb3bc6f336d
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-c6c8-242005de95d3
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-115f-abe81d987cb5
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-2098-300a58c43784
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-6a00-1f71c5879e5a
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-c5d8-ace939fde62e
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-da4d-f15ed4435e0d
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-526b-50c86bb915d6
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-1a39-d1c7291a20ca
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-4def-2f2c693ab7ab
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-f542-9a5c5d380188
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-6156-583179c984a0
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-731c-01a70bb64cfb
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-6a5e-a30add72ad15	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-9e55-1b5c7170ea91
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-42f0-5904bc82589f
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-3abf-b385480439ce
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-f03b-693d59bd3eb2
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-aad8-ef552e910ad0
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-bc83-cd9982bbdb37
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-77ef-5a23c6041415
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-86ea-592b1533a4df
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-c1c3-19101d953ae5	00030000-566e-cb0c-5f3a-c5b19b72e9b7
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-42f0-5904bc82589f
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-f03b-693d59bd3eb2
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-aad8-ef552e910ad0
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-77ef-5a23c6041415
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0c-ef15-23d6227fc389	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-42f0-5904bc82589f
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-3abf-b385480439ce
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-aad8-ef552e910ad0
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-ffcd-776b975ff316
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-8c39-de9a3de2ae18
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-e348-4ad887fa9f57
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-3a53-641bd01edf65
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-1de9-962a3e830cc8
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-1523-c4a133b7f323
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-77ef-5a23c6041415
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-52d0-7b110f8d826c
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0c-8d79-3b275b33f8bd	00030000-566e-cb0c-1108-44f23cb5e20b
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-42f0-5904bc82589f
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-aad8-ef552e910ad0
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-ffcd-776b975ff316
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-e348-4ad887fa9f57
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-1de9-962a3e830cc8
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-77ef-5a23c6041415
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-52d0-7b110f8d826c
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0c-df19-44f09a5a37b0	00030000-566e-cb0c-1108-44f23cb5e20b
00020000-566e-cb0c-d3cb-1db6c154a08d	00030000-566e-cb0c-1de9-962a3e830cc8
00020000-566e-cb0c-d3cb-1db6c154a08d	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0c-d3cb-1db6c154a08d	00030000-566e-cb0c-aad8-ef552e910ad0
00020000-566e-cb0c-d3cb-1db6c154a08d	00030000-566e-cb0c-e348-4ad887fa9f57
00020000-566e-cb0c-d3cb-1db6c154a08d	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0c-d3cb-1db6c154a08d	00030000-566e-cb0c-77ef-5a23c6041415
00020000-566e-cb0c-d3cb-1db6c154a08d	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-df8c-893d703a5a96	00030000-566e-cb0c-1de9-962a3e830cc8
00020000-566e-cb0c-df8c-893d703a5a96	00030000-566e-cb0c-1523-c4a133b7f323
00020000-566e-cb0c-df8c-893d703a5a96	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0c-df8c-893d703a5a96	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0c-7757-520d2f16dcf0	00030000-566e-cb0c-1de9-962a3e830cc8
00020000-566e-cb0c-7757-520d2f16dcf0	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-f182-4fd0ebb34e86
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-42f0-5904bc82589f
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-1e95-c1390a69ec4c
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-5fd1-fd3ee1c4ef51
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-f03b-693d59bd3eb2
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-66c4-62a6133d93d7
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-86ea-592b1533a4df
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-aad8-ef552e910ad0
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-3de1-65e98609457f
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-35ce-c14a20672ca1
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-1365-59cb920191ac
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-0cb9-c8f517590c16
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-3831-d93d537feaa4
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-d13f-157eeeb9981f
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-68c0-3528544dd629
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-5773-9a185390a56c
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-00f7-2766b2429a44
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-77ef-5a23c6041415
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-6333-50833b4857a8
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-d645-9e80a40c3e48
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-52d0-7b110f8d826c
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-21ca-5041e71146b0
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-5f3a-c5b19b72e9b7
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-1108-44f23cb5e20b
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-268a-db47e65b0b7c
00020000-566e-cb0c-00be-1632dba4d6e6	00030000-566e-cb0c-f00a-6b2a6cb812a1
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-01d1-6b4437bd3d1f
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-cf9c-4eb5f8e77a86
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-f182-4fd0ebb34e86
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-a45b-84609b646d9c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-42f0-5904bc82589f
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3abf-b385480439ce
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-15c7-e32bc96ba17c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1067-a8d6afb90e5b
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-2f49-b652c18d33d7
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1cbf-9947c35fcc0e
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1e95-c1390a69ec4c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-5fd1-fd3ee1c4ef51
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-f03b-693d59bd3eb2
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-66c4-62a6133d93d7
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-86ea-592b1533a4df
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-19e0-5c09c0d34522
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-9c2b-39e8f1435d9c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-24a5-da5c266d66b4
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-6f3e-504a5d7c69b3
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-463e-eef00897f388
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-cee3-91cdb7f0748f
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-50b8-7c6c294306a2
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-f542-9a5c5d380188
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-6f4e-48a7cfb43dab
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-8bee-e4b34c58dc91
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3197-d85969d9e8fb
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-868b-4cdea890c985
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-8ab4-903b6819cf3e
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-aad8-ef552e910ad0
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-bc83-cd9982bbdb37
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-6bb9-9d31ed02463e
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-bb0a-e6643753c547
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-0f67-e3ebeb334030
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-731c-01a70bb64cfb
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-f39e-f42d5daca400
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3de1-65e98609457f
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3275-d920c71a9232
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-c269-ceb5f11c4670
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-e3b5-238273995158
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-b1cd-fe62b2acaf34
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-6f84-ebf6f421cee9
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-7074-cf7ccc4d34a7
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-e3b5-11f2704fb4d2
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1e3f-72fe368a1bb9
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1803-eb27c46e2366
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-fbb6-da4ac78d84b4
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-6d38-bd65d246458c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-491f-96fc4390d91c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-4492-3e245281df08
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-5cf1-a5dfbc842269
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-4808-09cadc4a1e29
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-35ce-c14a20672ca1
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-ea86-614920d7de89
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-8c39-de9a3de2ae18
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1365-59cb920191ac
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-c1cd-d038dbc8bee8
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1776-5de6d5351f19
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-8399-8ef129993aff
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-7623-6cf59b5b652f
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-e348-4ad887fa9f57
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3a53-641bd01edf65
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-eb51-a5c443c8fa8f
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-0cb9-c8f517590c16
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-e461-0fc147a812cf
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-6156-583179c984a0
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-2289-b59110a7723e
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3fcf-890e675d0f64
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-c6e1-c33fda917357
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3831-d93d537feaa4
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-d13f-157eeeb9981f
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-0da2-6bcf3897c6e7
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-43f3-466e56fc6c6a
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-ce61-31e80be07957
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-9f7c-eb7dcf4bd052
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-d72e-ef051bc6cb6b
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-01c8-26b347a5d334
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-4def-2f2c693ab7ab
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-33b2-4eb67590823d
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-8849-aa6fa934bcd2
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-cd90-6d772a0673f9
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3bcf-03e3552f2c63
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3747-e9bc4f107e2c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-a304-f2042a995562
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3dd8-d9fac4045460
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-c4f0-2cb3bc6f336d
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1cb5-cf06a3e935db
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-c6c8-242005de95d3
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-88b5-45d293bb20b3
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-115f-abe81d987cb5
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-8e87-6153abb80f1a
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-2098-300a58c43784
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-573e-875ecb8805ec
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-6a00-1f71c5879e5a
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-0ffd-41d3d1f47310
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-c5d8-ace939fde62e
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-165f-240ee8f2c316
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-da4d-f15ed4435e0d
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-9591-912c5c022fb0
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-526b-50c86bb915d6
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-68cf-5a5592e4da14
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1a39-d1c7291a20ca
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-7611-380aca44c0ff
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-68c0-3528544dd629
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-d97f-a80b27649a14
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-9661-3ab2da7c0709
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-ebbc-d24052adec33
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1b21-5f2ae1f71348
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-4dd9-ac2aa8ec6598
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-3fe2-018d6fd4de76
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-50c0-66ad7b77a47f
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-08b3-646e1af4b8b5
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-f932-14c1a45fea9c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-ff92-29f4fc4f1805
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-c89b-5a2212f98fcc
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-a982-e46aedb9d780
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-7d07-5dc5e6e9e9a9
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-566a-6dd025ad9d6c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-a9aa-5c0c7e6a3a27
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-37f1-4161fbf48e53
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-5b5e-4bc1fd629c25
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-e343-d3ef23d90d1b
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-6753-e4bb6e96cd44
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-a372-b0deb2656217
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-295f-9fdf117b99fd
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-372d-41385787ab9c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1de9-962a3e830cc8
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1523-c4a133b7f323
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-5773-9a185390a56c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-00f7-2766b2429a44
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-63fa-a14b9a638b7b
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-7dc3-5a512514657b
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-9b6b-e1505e1b146b
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-77ef-5a23c6041415
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-89f7-085dba84db87
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-6333-50833b4857a8
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-9758-01a418ed930c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-8247-b567ab0d5081
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-a586-4b57ccfc9a16
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-d645-9e80a40c3e48
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-4e6a-a0fd9197e83b
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-52d0-7b110f8d826c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-725d-ed7102b4160a
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-9e55-1b5c7170ea91
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-c941-3993776fba01
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-eeab-83e4738c34dc
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-c60f-b2b54739a593
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-a3b1-561dde11bc54
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-21ca-5041e71146b0
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1fdb-f33d6b164254
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-7f6c-215a5f83b8bf
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-37a1-a3039ca1f165
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-5f3a-c5b19b72e9b7
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1108-44f23cb5e20b
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-1a04-95cd71264dfd
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-2b04-08e227f3dc84
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-74ff-f6bec534e9d0
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-268a-db47e65b0b7c
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-9adb-c4f7bdad5b2f
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-f00a-6b2a6cb812a1
00020000-566e-cb0e-8171-e6023518d755	00030000-566e-cb0c-80bf-7963a10ecdba
00020000-566e-cb0e-eb3c-8360e1f7baa2	00030000-566e-cb0c-1325-6aa365695529
00020000-566e-cb0e-b36e-7d7a14236ea7	00030000-566e-cb0c-5f3a-c5b19b72e9b7
00020000-566e-cb0e-743a-b8a9f0d19ea2	00030000-566e-cb0c-9e55-1b5c7170ea91
00020000-566e-cb0e-bfb9-fc2eb8065183	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0e-d233-06fdb964958f	00030000-566e-cb0c-6f84-ebf6f421cee9
00020000-566e-cb0e-b810-3a14a3ca6f68	00030000-566e-cb0c-7074-cf7ccc4d34a7
00020000-566e-cb0e-ca45-38e6e2966a1f	00030000-566e-cb0c-e3b5-11f2704fb4d2
00020000-566e-cb0e-3468-03ef6e250bbd	00030000-566e-cb0c-b1cd-fe62b2acaf34
00020000-566e-cb0e-6fbe-0bfc7f377eba	00030000-566e-cb0c-1e3f-72fe368a1bb9
00020000-566e-cb0e-11e8-6db9443e4011	00030000-566e-cb0c-1803-eb27c46e2366
00020000-566e-cb0e-5529-b435197d8baa	00030000-566e-cb0c-2c61-9ae6b93f7380
00020000-566e-cb0e-ea03-e1dbdd2b4283	00030000-566e-cb0c-5572-d98a5cb8b94a
00020000-566e-cb0e-c6d7-f7d9ca069ca6	00030000-566e-cb0c-984c-ba54a5512f24
00020000-566e-cb0e-9cf7-8b81a9aa6d0e	00030000-566e-cb0c-1365-59cb920191ac
00020000-566e-cb0e-2fe4-038a4684f4b7	00030000-566e-cb0c-8c39-de9a3de2ae18
00020000-566e-cb0e-9afd-b7e8950d3467	00030000-566e-cb0c-ffcd-776b975ff316
00020000-566e-cb0e-9e56-df9258d7317e	00030000-566e-cb0c-86ea-592b1533a4df
00020000-566e-cb0e-e519-102fced76db6	00030000-566e-cb0c-676f-4a541cf59bda
00020000-566e-cb0e-13ed-d05d7638dad1	00030000-566e-cb0c-47d3-55c4f41ac482
00020000-566e-cb0e-13ed-d05d7638dad1	00030000-566e-cb0c-eb51-a5c443c8fa8f
00020000-566e-cb0e-13ed-d05d7638dad1	00030000-566e-cb0c-7433-187c8bf4099b
00020000-566e-cb0e-0836-13c2e7607326	00030000-566e-cb0c-52d0-7b110f8d826c
00020000-566e-cb0e-433a-9d17d89db733	00030000-566e-cb0c-725d-ed7102b4160a
00020000-566e-cb0e-7649-e2be983d7b66	00030000-566e-cb0c-372d-41385787ab9c
00020000-566e-cb0e-ed11-4f518e141e24	00030000-566e-cb0c-5773-9a185390a56c
00020000-566e-cb0e-e092-d9f0b8a30523	00030000-566e-cb0c-00f7-2766b2429a44
00020000-566e-cb0e-e677-517222283cd3	00030000-566e-cb0c-3831-d93d537feaa4
00020000-566e-cb0e-e784-15c2c27c412a	00030000-566e-cb0c-d13f-157eeeb9981f
00020000-566e-cb0e-287f-7b8c1b989e3c	00030000-566e-cb0c-1108-44f23cb5e20b
00020000-566e-cb0e-42a8-5b999408d961	00030000-566e-cb0c-1a04-95cd71264dfd
00020000-566e-cb0e-1df0-72bf7b2d5e67	00030000-566e-cb0c-e348-4ad887fa9f57
00020000-566e-cb0e-9cf3-12cd325855cf	00030000-566e-cb0c-3a53-641bd01edf65
00020000-566e-cb0e-9c83-3b37f665a3b2	00030000-566e-cb0c-1de9-962a3e830cc8
00020000-566e-cb0e-2f9f-c2da2105118b	00030000-566e-cb0c-1523-c4a133b7f323
00020000-566e-cb0e-6e72-6590e4b85d1f	00030000-566e-cb0c-42f0-5904bc82589f
00020000-566e-cb0e-93df-caf3843a602c	00030000-566e-cb0c-3abf-b385480439ce
\.


--
-- TOC entry 3146 (class 0 OID 32125146)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32125180)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 32125318)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-566e-cb0e-120e-761cf34acb89	00090000-566e-cb0e-4a98-63801bfc55ae	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-566e-cb0e-9635-6db534ed508b	00090000-566e-cb0e-f9e0-b63f2965401f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-566e-cb0e-4ed1-9ceee2cb8218	00090000-566e-cb0e-be4b-6a753b81a5a0	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-566e-cb0e-80d1-e20757650970	00090000-566e-cb0e-6e7c-afc87e6172a2	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3117 (class 0 OID 32124838)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-566e-cb0e-b4bb-7073af8745e1	\N	00040000-566e-cb0b-a49e-08dd0e808645	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cb0e-68dc-9e664e328341	\N	00040000-566e-cb0b-a49e-08dd0e808645	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-566e-cb0e-6946-356b1b45f2f6	\N	00040000-566e-cb0b-a49e-08dd0e808645	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cb0e-62e4-aaf37dabee2f	\N	00040000-566e-cb0b-a49e-08dd0e808645	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cb0e-9027-0e3120ea8f8d	\N	00040000-566e-cb0b-a49e-08dd0e808645	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cb0e-9d3c-4f294a6b12fe	\N	00040000-566e-cb0b-73df-d496643b6e05	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cb0e-dd6f-798fbc88cf00	\N	00040000-566e-cb0b-6168-a8d0b1f5935f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cb0e-fd6e-751eb985856b	\N	00040000-566e-cb0b-2787-428e0457a833	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cb0e-3f67-464127b8ab2e	\N	00040000-566e-cb0b-b525-f4c73af403d8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cb10-1d0d-4b03c20922ed	\N	00040000-566e-cb0b-a49e-08dd0e808645	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3120 (class 0 OID 32124883)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-566e-cb0b-56ea-9c73aee9887b	8341	Adlešiči
00050000-566e-cb0b-ea88-719863e05a1f	5270	Ajdovščina
00050000-566e-cb0b-33ac-4e408404bab2	6280	Ankaran/Ancarano
00050000-566e-cb0b-2bad-12998992a768	9253	Apače
00050000-566e-cb0b-a1ef-ea1f56c42cf9	8253	Artiče
00050000-566e-cb0b-a373-2cfb83b457d8	4275	Begunje na Gorenjskem
00050000-566e-cb0b-602a-86d1eded2f07	1382	Begunje pri Cerknici
00050000-566e-cb0b-70f3-8f2b2e8cab30	9231	Beltinci
00050000-566e-cb0b-162b-99a5f80fdbd0	2234	Benedikt
00050000-566e-cb0b-ce1c-dd0470cd8649	2345	Bistrica ob Dravi
00050000-566e-cb0b-b599-cb3be035612a	3256	Bistrica ob Sotli
00050000-566e-cb0b-caa7-57d1ad345bb2	8259	Bizeljsko
00050000-566e-cb0b-c057-6f1e22bcdd41	1223	Blagovica
00050000-566e-cb0b-8d72-6c0d705f208b	8283	Blanca
00050000-566e-cb0b-2a09-558c26bebec2	4260	Bled
00050000-566e-cb0b-7c19-e07def2ccf4a	4273	Blejska Dobrava
00050000-566e-cb0b-c720-6465a1cd6889	9265	Bodonci
00050000-566e-cb0b-57fa-3fa527a3550c	9222	Bogojina
00050000-566e-cb0b-2206-c6eb0056c4d8	4263	Bohinjska Bela
00050000-566e-cb0b-3ad8-48e05d7011a9	4264	Bohinjska Bistrica
00050000-566e-cb0b-9d14-973404ab8432	4265	Bohinjsko jezero
00050000-566e-cb0b-a0f6-233ef72b7840	1353	Borovnica
00050000-566e-cb0b-14cb-48f31fedd115	8294	Boštanj
00050000-566e-cb0b-35ca-077bf4c070bc	5230	Bovec
00050000-566e-cb0b-1051-bc9c1545877b	5295	Branik
00050000-566e-cb0b-3a4f-88101f196856	3314	Braslovče
00050000-566e-cb0b-b776-d98254e2fc2f	5223	Breginj
00050000-566e-cb0b-2b41-a702933b2cb7	8280	Brestanica
00050000-566e-cb0b-4c25-0ea433352fda	2354	Bresternica
00050000-566e-cb0b-e024-878c0984a38c	4243	Brezje
00050000-566e-cb0b-34ac-e411caa1b3c0	1351	Brezovica pri Ljubljani
00050000-566e-cb0b-f1d8-9cd55b6af1a4	8250	Brežice
00050000-566e-cb0b-75a0-6ba48fc5de93	4210	Brnik - Aerodrom
00050000-566e-cb0b-1fba-ebeeff5bac4e	8321	Brusnice
00050000-566e-cb0b-e8a4-031188348f0a	3255	Buče
00050000-566e-cb0b-398a-21222a458eb1	8276	Bučka 
00050000-566e-cb0b-a2b2-4c76e043a365	9261	Cankova
00050000-566e-cb0b-6186-415b119e52cb	3000	Celje 
00050000-566e-cb0b-6a7b-f096e8484a32	3001	Celje - poštni predali
00050000-566e-cb0b-35f3-c6f7a3028020	4207	Cerklje na Gorenjskem
00050000-566e-cb0b-c349-eee3d3279260	8263	Cerklje ob Krki
00050000-566e-cb0b-3495-761b02feb97e	1380	Cerknica
00050000-566e-cb0b-bc15-83fbb8e8ddff	5282	Cerkno
00050000-566e-cb0b-64fa-f7525cc701b9	2236	Cerkvenjak
00050000-566e-cb0b-f0ba-9e61892f5dbe	2215	Ceršak
00050000-566e-cb0b-fa22-80dc3835f5be	2326	Cirkovce
00050000-566e-cb0b-af74-f9d283802520	2282	Cirkulane
00050000-566e-cb0b-ffdd-30040a05d784	5273	Col
00050000-566e-cb0b-9b0c-6c78c1969f6c	8251	Čatež ob Savi
00050000-566e-cb0b-3b47-b4330a1eb269	1413	Čemšenik
00050000-566e-cb0b-3910-a5843e12adc8	5253	Čepovan
00050000-566e-cb0b-e8bf-cb938027eca6	9232	Črenšovci
00050000-566e-cb0b-a041-250cc2de354e	2393	Črna na Koroškem
00050000-566e-cb0b-f365-a74ce27e04ad	6275	Črni Kal
00050000-566e-cb0b-4dc7-ca61bd3c744e	5274	Črni Vrh nad Idrijo
00050000-566e-cb0b-8aa0-8da7f977bb70	5262	Črniče
00050000-566e-cb0b-aa82-59f2ef8618a0	8340	Črnomelj
00050000-566e-cb0b-6b96-5be8b40e52fa	6271	Dekani
00050000-566e-cb0b-6de9-e73c77edf450	5210	Deskle
00050000-566e-cb0b-1aa5-b7f537c2f4d5	2253	Destrnik
00050000-566e-cb0b-96f2-709d689ff090	6215	Divača
00050000-566e-cb0b-1266-5f2bd6abbba8	1233	Dob
00050000-566e-cb0b-1c1e-6c13282f3454	3224	Dobje pri Planini
00050000-566e-cb0b-45e1-1ec58544814d	8257	Dobova
00050000-566e-cb0b-8d80-4da8d221f791	1423	Dobovec
00050000-566e-cb0b-b872-27de47fa98ed	5263	Dobravlje
00050000-566e-cb0b-2db8-cfba90512c42	3204	Dobrna
00050000-566e-cb0b-f281-43e05f1c74f7	8211	Dobrnič
00050000-566e-cb0b-7af1-136c3d9966c1	1356	Dobrova
00050000-566e-cb0b-9fa2-c30899c2421e	9223	Dobrovnik/Dobronak 
00050000-566e-cb0b-83a6-5b912ce7f563	5212	Dobrovo v Brdih
00050000-566e-cb0b-500d-54dce45a4775	1431	Dol pri Hrastniku
00050000-566e-cb0b-bbb6-27fe7e29bf71	1262	Dol pri Ljubljani
00050000-566e-cb0b-eeaf-3706f1a34556	1273	Dole pri Litiji
00050000-566e-cb0b-61f6-e88f47b14bc1	1331	Dolenja vas
00050000-566e-cb0b-a516-030ec4ad4d4b	8350	Dolenjske Toplice
00050000-566e-cb0b-9926-f90c431d4b0b	1230	Domžale
00050000-566e-cb0b-cb1f-109b67d2eb2d	2252	Dornava
00050000-566e-cb0b-361d-ecdfd4cccb1e	5294	Dornberk
00050000-566e-cb0b-03fc-7ede9cd530f6	1319	Draga
00050000-566e-cb0b-dde3-cb347ad506ce	8343	Dragatuš
00050000-566e-cb0b-bb7a-a18db820d1f0	3222	Dramlje
00050000-566e-cb0b-39a4-96853c8c9110	2370	Dravograd
00050000-566e-cb0b-6bcb-a34a2d748f9d	4203	Duplje
00050000-566e-cb0b-073a-995138b85a9b	6221	Dutovlje
00050000-566e-cb0b-3890-95ad0eb94028	8361	Dvor
00050000-566e-cb0b-212c-0db7e4085788	2343	Fala
00050000-566e-cb0b-9135-95903e586ca1	9208	Fokovci
00050000-566e-cb0b-0552-58195c00cdb0	2313	Fram
00050000-566e-cb0b-35bc-08316dfeba84	3213	Frankolovo
00050000-566e-cb0b-e4dc-2f11797395b7	1274	Gabrovka
00050000-566e-cb0b-aca8-c39d454d2773	8254	Globoko
00050000-566e-cb0b-daba-7b0dd5c8082c	5275	Godovič
00050000-566e-cb0b-57fa-bdea9300ac8c	4204	Golnik
00050000-566e-cb0b-7b5b-9ffb89220002	3303	Gomilsko
00050000-566e-cb0b-1c51-4fc54857722d	4224	Gorenja vas
00050000-566e-cb0b-9e68-7cec5798f2bd	3263	Gorica pri Slivnici
00050000-566e-cb0b-ba67-ac0358ea30ec	2272	Gorišnica
00050000-566e-cb0b-bad9-4ecfc69c0b34	9250	Gornja Radgona
00050000-566e-cb0b-1a48-6a9525672429	3342	Gornji Grad
00050000-566e-cb0b-abc0-c95a1d83a89f	4282	Gozd Martuljek
00050000-566e-cb0b-fb93-cbcbc6ae44f1	6272	Gračišče
00050000-566e-cb0b-a532-84ac9f8030cc	9264	Grad
00050000-566e-cb0b-ebc5-e74ea81b221f	8332	Gradac
00050000-566e-cb0b-0fd1-31fe79b0ba62	1384	Grahovo
00050000-566e-cb0b-d4f8-9a8224bcbe48	5242	Grahovo ob Bači
00050000-566e-cb0b-7f3a-254d9481e145	5251	Grgar
00050000-566e-cb0b-b432-903cedbe6db0	3302	Griže
00050000-566e-cb0b-3797-0b00f2fe1496	3231	Grobelno
00050000-566e-cb0b-d211-a9b583b8dfd2	1290	Grosuplje
00050000-566e-cb0b-e6a0-ea387a04d5eb	2288	Hajdina
00050000-566e-cb0b-1e85-2a6082e3f33a	8362	Hinje
00050000-566e-cb0b-d59e-dbcdf3635615	2311	Hoče
00050000-566e-cb0b-a70a-d53e15e9149c	9205	Hodoš/Hodos
00050000-566e-cb0b-271e-7fca022a877a	1354	Horjul
00050000-566e-cb0b-c00d-b97a74c4e0b0	1372	Hotedršica
00050000-566e-cb0b-daae-74a53b08b782	1430	Hrastnik
00050000-566e-cb0b-622c-277c3ecae7c6	6225	Hruševje
00050000-566e-cb0b-4039-58608c5a2438	4276	Hrušica
00050000-566e-cb0b-34bc-d6be91d678ff	5280	Idrija
00050000-566e-cb0b-2aba-11a1d8306dba	1292	Ig
00050000-566e-cb0b-0ede-24fcc02e64d6	6250	Ilirska Bistrica
00050000-566e-cb0b-238e-90e6609eb424	6251	Ilirska Bistrica-Trnovo
00050000-566e-cb0b-e0eb-d08966844a55	1295	Ivančna Gorica
00050000-566e-cb0b-3039-c22e3464816a	2259	Ivanjkovci
00050000-566e-cb0b-6ec7-e3a86fbfc4e5	1411	Izlake
00050000-566e-cb0b-03be-745275964d18	6310	Izola/Isola
00050000-566e-cb0b-fe2b-a534d54f5f1c	2222	Jakobski Dol
00050000-566e-cb0b-f697-a8fda2ddf9ad	2221	Jarenina
00050000-566e-cb0b-4462-39d2a20068d7	6254	Jelšane
00050000-566e-cb0b-1816-4b981d8f361b	4270	Jesenice
00050000-566e-cb0b-8082-0133c9ff159b	8261	Jesenice na Dolenjskem
00050000-566e-cb0b-834d-c1c550c2c7c7	3273	Jurklošter
00050000-566e-cb0b-78b1-12dc17af7b0a	2223	Jurovski Dol
00050000-566e-cb0b-a027-dc8618b65d7a	2256	Juršinci
00050000-566e-cb0b-6c6d-e033189fc6fb	5214	Kal nad Kanalom
00050000-566e-cb0b-21c0-3a5872f0fa97	3233	Kalobje
00050000-566e-cb0b-ba6e-eea14323c82e	4246	Kamna Gorica
00050000-566e-cb0b-3d81-cfe33475a1e0	2351	Kamnica
00050000-566e-cb0b-fad8-be52b8f6a634	1241	Kamnik
00050000-566e-cb0b-000c-5d0c00f18483	5213	Kanal
00050000-566e-cb0b-20c3-a715f3115e8a	8258	Kapele
00050000-566e-cb0b-5837-c5dff2eeef57	2362	Kapla
00050000-566e-cb0b-f833-c0501fc09370	2325	Kidričevo
00050000-566e-cb0b-0d27-b1476a1585fe	1412	Kisovec
00050000-566e-cb0b-e3ae-94a92ff60215	6253	Knežak
00050000-566e-cb0b-4f43-c5dd6f28e077	5222	Kobarid
00050000-566e-cb0b-9d2e-29383cb24de4	9227	Kobilje
00050000-566e-cb0b-4285-4968d78d9ae8	1330	Kočevje
00050000-566e-cb0b-1995-23e4ea0410fc	1338	Kočevska Reka
00050000-566e-cb0b-0303-6898a7f75571	2276	Kog
00050000-566e-cb0b-d2da-db71ff7717ec	5211	Kojsko
00050000-566e-cb0b-e536-3d807c5b308a	6223	Komen
00050000-566e-cb0b-bb23-1c75633e1796	1218	Komenda
00050000-566e-cb0b-6fb8-b07f1983f83a	6000	Koper/Capodistria 
00050000-566e-cb0b-840e-dd432e9bd440	6001	Koper/Capodistria - poštni predali
00050000-566e-cb0b-d8c6-ee2cc99c3fed	8282	Koprivnica
00050000-566e-cb0b-735d-9dca22635f43	5296	Kostanjevica na Krasu
00050000-566e-cb0b-ad37-d63343e38ac2	8311	Kostanjevica na Krki
00050000-566e-cb0b-167f-3f0061ba8383	1336	Kostel
00050000-566e-cb0b-26c8-5c2a9a59e3d9	6256	Košana
00050000-566e-cb0b-d3cd-70eadd5cd978	2394	Kotlje
00050000-566e-cb0b-e3b7-5a25ceace925	6240	Kozina
00050000-566e-cb0b-4c9d-a4de49b2c316	3260	Kozje
00050000-566e-cb0b-17d6-dcf999f13ed7	4000	Kranj 
00050000-566e-cb0b-0433-383ebda0968a	4001	Kranj - poštni predali
00050000-566e-cb0b-805e-c6257ae6a332	4280	Kranjska Gora
00050000-566e-cb0b-da5f-a5493842eb0c	1281	Kresnice
00050000-566e-cb0b-de1f-bc21ad9d272f	4294	Križe
00050000-566e-cb0b-5eca-b5919149d700	9206	Križevci
00050000-566e-cb0b-8ef5-7a257914b64d	9242	Križevci pri Ljutomeru
00050000-566e-cb0b-e8fc-a7ed58b3a117	1301	Krka
00050000-566e-cb0b-4b3d-f257e1f390dc	8296	Krmelj
00050000-566e-cb0b-05d6-be0c5c0bf4aa	4245	Kropa
00050000-566e-cb0b-cdf8-89994eddffd0	8262	Krška vas
00050000-566e-cb0b-3092-041adeb5e686	8270	Krško
00050000-566e-cb0b-c88d-aa12da987512	9263	Kuzma
00050000-566e-cb0b-461d-638fd4835b72	2318	Laporje
00050000-566e-cb0b-aa7c-4f5ebf159940	3270	Laško
00050000-566e-cb0b-5083-2386fbe58672	1219	Laze v Tuhinju
00050000-566e-cb0b-ab8a-1fff3521a7bb	2230	Lenart v Slovenskih goricah
00050000-566e-cb0b-9982-db2bbf758ed9	9220	Lendava/Lendva
00050000-566e-cb0b-1f9b-321b35544d77	4248	Lesce
00050000-566e-cb0b-279b-c89315dc37bd	3261	Lesično
00050000-566e-cb0b-9d31-6671129cfff1	8273	Leskovec pri Krškem
00050000-566e-cb0b-3a74-0302300d8145	2372	Libeliče
00050000-566e-cb0b-837e-5ac03a5f424f	2341	Limbuš
00050000-566e-cb0b-6912-e5e22fb30060	1270	Litija
00050000-566e-cb0b-e550-2aa54dcc62d9	3202	Ljubečna
00050000-566e-cb0b-e9ab-5b6a1dece29d	1000	Ljubljana 
00050000-566e-cb0b-4404-0adc55b459ba	1001	Ljubljana - poštni predali
00050000-566e-cb0b-2d00-aea26aa9c765	1231	Ljubljana - Črnuče
00050000-566e-cb0b-5aab-9754c509d8e0	1261	Ljubljana - Dobrunje
00050000-566e-cb0b-7ce2-c09e9c0ed332	1260	Ljubljana - Polje
00050000-566e-cb0b-96c9-56df7d532431	1210	Ljubljana - Šentvid
00050000-566e-cb0b-0361-48e27317023d	1211	Ljubljana - Šmartno
00050000-566e-cb0b-2517-72d4026f39bf	3333	Ljubno ob Savinji
00050000-566e-cb0b-08ab-03e54a344d28	9240	Ljutomer
00050000-566e-cb0b-d459-ab5cf7c85fc9	3215	Loče
00050000-566e-cb0b-6cba-00e3aef9d85c	5231	Log pod Mangartom
00050000-566e-cb0b-bb2c-c7df8ac1c8be	1358	Log pri Brezovici
00050000-566e-cb0b-3fef-9c9fca5eef59	1370	Logatec
00050000-566e-cb0b-82d5-6fe953b17ce2	1371	Logatec
00050000-566e-cb0b-4108-2527de08c40a	1434	Loka pri Zidanem Mostu
00050000-566e-cb0b-3613-c3f445886620	3223	Loka pri Žusmu
00050000-566e-cb0b-3be0-775de4a5f6cf	6219	Lokev
00050000-566e-cb0b-4e07-ffa969d937e7	1318	Loški Potok
00050000-566e-cb0b-3d67-a770cd4c9a9f	2324	Lovrenc na Dravskem polju
00050000-566e-cb0b-7750-6854bca41d66	2344	Lovrenc na Pohorju
00050000-566e-cb0b-28fb-e10e03d45552	3334	Luče
00050000-566e-cb0b-7ee6-916da591510b	1225	Lukovica
00050000-566e-cb0b-613e-0f6c47a0ec27	9202	Mačkovci
00050000-566e-cb0b-addc-e4144b03776c	2322	Majšperk
00050000-566e-cb0b-abce-50183cac8efc	2321	Makole
00050000-566e-cb0b-0642-b4a6eb467797	9243	Mala Nedelja
00050000-566e-cb0b-fd3f-6405baf7242c	2229	Malečnik
00050000-566e-cb0b-2d29-39e5750bee1c	6273	Marezige
00050000-566e-cb0b-deb2-1ca10fcb3070	2000	Maribor 
00050000-566e-cb0b-7ef7-11f9cee26a3b	2001	Maribor - poštni predali
00050000-566e-cb0b-bb63-ccc205e2e748	2206	Marjeta na Dravskem polju
00050000-566e-cb0b-dd2f-dda3f1e25ce8	2281	Markovci
00050000-566e-cb0b-f7be-0324a0502a70	9221	Martjanci
00050000-566e-cb0b-e5b5-e38a5b643830	6242	Materija
00050000-566e-cb0b-b4b8-85972a8fd59d	4211	Mavčiče
00050000-566e-cb0b-c890-96b1083a33b7	1215	Medvode
00050000-566e-cb0b-485b-272413e182c8	1234	Mengeš
00050000-566e-cb0b-2b22-32622f919717	8330	Metlika
00050000-566e-cb0b-a1c9-1f65c879b050	2392	Mežica
00050000-566e-cb0b-b75f-ce6b679d58c6	2204	Miklavž na Dravskem polju
00050000-566e-cb0b-822f-428bcdc620d9	2275	Miklavž pri Ormožu
00050000-566e-cb0b-a8da-1d3443d71128	5291	Miren
00050000-566e-cb0b-c117-e91415eb3619	8233	Mirna
00050000-566e-cb0b-5f29-9ffd3aff9b22	8216	Mirna Peč
00050000-566e-cb0b-2e1c-3ac0d61916f1	2382	Mislinja
00050000-566e-cb0b-b6c9-ba0ab0e46c86	4281	Mojstrana
00050000-566e-cb0b-63f0-a36984f297f7	8230	Mokronog
00050000-566e-cb0b-6626-d1017a656102	1251	Moravče
00050000-566e-cb0b-5918-8ea3b380adff	9226	Moravske Toplice
00050000-566e-cb0b-0be7-047962b9bb36	5216	Most na Soči
00050000-566e-cb0b-6f92-b24d49331ed4	1221	Motnik
00050000-566e-cb0b-30e0-74850ba8976b	3330	Mozirje
00050000-566e-cb0b-5767-1942ee664dce	9000	Murska Sobota 
00050000-566e-cb0b-2945-5ba40b990af7	9001	Murska Sobota - poštni predali
00050000-566e-cb0b-49f3-0252798e7a0d	2366	Muta
00050000-566e-cb0b-f8b1-edecd894f7e7	4202	Naklo
00050000-566e-cb0b-5bf8-82bc6dc83006	3331	Nazarje
00050000-566e-cb0b-4551-3bbc45a45439	1357	Notranje Gorice
00050000-566e-cb0b-df5d-b760067cde7c	3203	Nova Cerkev
00050000-566e-cb0b-a1e1-4b2833221bb1	5000	Nova Gorica 
00050000-566e-cb0b-e74b-d05032fea405	5001	Nova Gorica - poštni predali
00050000-566e-cb0b-180d-ebd9e2973fc7	1385	Nova vas
00050000-566e-cb0b-2630-b896a5a8e4f8	8000	Novo mesto
00050000-566e-cb0b-599f-9c23dc42a8c5	8001	Novo mesto - poštni predali
00050000-566e-cb0b-d818-16043cae1332	6243	Obrov
00050000-566e-cb0b-120c-2558cee61c43	9233	Odranci
00050000-566e-cb0b-3989-74a9697c1d2f	2317	Oplotnica
00050000-566e-cb0b-57a6-5115b3b8ed54	2312	Orehova vas
00050000-566e-cb0b-a965-5388726fbcb1	2270	Ormož
00050000-566e-cb0b-3cd8-29aa239d64fa	1316	Ortnek
00050000-566e-cb0b-9f4b-c1f86a3c3f7a	1337	Osilnica
00050000-566e-cb0b-d45c-cec0bca53af9	8222	Otočec
00050000-566e-cb0b-701b-486ed283e7b9	2361	Ožbalt
00050000-566e-cb0b-9eff-cdd2418b7ada	2231	Pernica
00050000-566e-cb0b-65de-5967c2d537f9	2211	Pesnica pri Mariboru
00050000-566e-cb0b-8ead-aa477c596a45	9203	Petrovci
00050000-566e-cb0b-f161-969bc36abed4	3301	Petrovče
00050000-566e-cb0b-5df4-0d2def87c160	6330	Piran/Pirano
00050000-566e-cb0b-f858-cabd1b973903	8255	Pišece
00050000-566e-cb0b-3a85-9ebf9e856bc5	6257	Pivka
00050000-566e-cb0b-985b-83df58598242	6232	Planina
00050000-566e-cb0b-3a9a-dfa1264e2933	3225	Planina pri Sevnici
00050000-566e-cb0b-b0f2-3d51f10f783b	6276	Pobegi
00050000-566e-cb0b-c123-12a90c1d6725	8312	Podbočje
00050000-566e-cb0b-34f5-7c566ab8d95e	5243	Podbrdo
00050000-566e-cb0b-11e2-28ab17dfb032	3254	Podčetrtek
00050000-566e-cb0b-192d-31a3d4720147	2273	Podgorci
00050000-566e-cb0b-ec9e-cbfbeb42c30c	6216	Podgorje
00050000-566e-cb0b-d59e-5a3124a1b820	2381	Podgorje pri Slovenj Gradcu
00050000-566e-cb0b-9641-add292ae003d	6244	Podgrad
00050000-566e-cb0b-1655-8ae5c471341e	1414	Podkum
00050000-566e-cb0b-9876-a0682ad3d3d7	2286	Podlehnik
00050000-566e-cb0b-ba9a-49b64dc784fe	5272	Podnanos
00050000-566e-cb0b-58f9-33ba6bf92c03	4244	Podnart
00050000-566e-cb0b-a0de-9a86e5df7b35	3241	Podplat
00050000-566e-cb0b-fcc2-e018eb561cbe	3257	Podsreda
00050000-566e-cb0b-b9d5-cd7a7599b537	2363	Podvelka
00050000-566e-cb0b-7c4d-4a2ade3813cb	2208	Pohorje
00050000-566e-cb0b-8690-3455de3662eb	2257	Polenšak
00050000-566e-cb0b-cf5a-425a6c98ad46	1355	Polhov Gradec
00050000-566e-cb0b-df6d-9e136c9c733b	4223	Poljane nad Škofjo Loko
00050000-566e-cb0b-16a2-376d9b7d17cf	2319	Poljčane
00050000-566e-cb0b-19cf-a70b7c8c3568	1272	Polšnik
00050000-566e-cb0b-0155-8addae6a01cf	3313	Polzela
00050000-566e-cb0b-ceaa-6a3ef14fc7c5	3232	Ponikva
00050000-566e-cb0b-9892-118997bdf2a6	6320	Portorož/Portorose
00050000-566e-cb0b-9988-c729a2ed3429	6230	Postojna
00050000-566e-cb0b-3aba-27a0307d40da	2331	Pragersko
00050000-566e-cb0b-d489-38efa492b380	3312	Prebold
00050000-566e-cb0b-4ff8-c2a8b22c2d0d	4205	Preddvor
00050000-566e-cb0b-f1f3-fb00300dcfd1	6255	Prem
00050000-566e-cb0b-7abe-fad960df7038	1352	Preserje
00050000-566e-cb0b-fa63-224f7cd18425	6258	Prestranek
00050000-566e-cb0b-d729-9330b6f12edb	2391	Prevalje
00050000-566e-cb0b-cfb0-058fb15b3b52	3262	Prevorje
00050000-566e-cb0b-79b9-e1fbdd67bbfd	1276	Primskovo 
00050000-566e-cb0b-c713-9e91aa769605	3253	Pristava pri Mestinju
00050000-566e-cb0b-5949-d02814578434	9207	Prosenjakovci/Partosfalva
00050000-566e-cb0b-f3f7-7933b9fef4d8	5297	Prvačina
00050000-566e-cb0b-999b-42cea683f652	2250	Ptuj
00050000-566e-cb0b-42fe-a62b52ec4128	2323	Ptujska Gora
00050000-566e-cb0b-0cda-2181aec56387	9201	Puconci
00050000-566e-cb0b-009f-d3707455500a	2327	Rače
00050000-566e-cb0b-4d88-7d87beeb6254	1433	Radeče
00050000-566e-cb0b-06f9-0c530e7175db	9252	Radenci
00050000-566e-cb0b-a29a-9c89028e1dda	2360	Radlje ob Dravi
00050000-566e-cb0b-9e13-c49908b2a16e	1235	Radomlje
00050000-566e-cb0b-06d6-33cfdf452f49	4240	Radovljica
00050000-566e-cb0b-42fa-59f0a521d391	8274	Raka
00050000-566e-cb0b-4907-c076b403531d	1381	Rakek
00050000-566e-cb0b-89e9-07761d099dea	4283	Rateče - Planica
00050000-566e-cb0b-a7b9-bbdb875a06d3	2390	Ravne na Koroškem
00050000-566e-cb0b-faf4-bd16d745c3ea	9246	Razkrižje
00050000-566e-cb0b-c1e3-c9b3dc54e50f	3332	Rečica ob Savinji
00050000-566e-cb0b-e1c3-55f3541b58ea	5292	Renče
00050000-566e-cb0b-e088-3d14a80342a4	1310	Ribnica
00050000-566e-cb0b-a6b5-0222b4d6f296	2364	Ribnica na Pohorju
00050000-566e-cb0b-789b-827d6389ac94	3272	Rimske Toplice
00050000-566e-cb0b-8121-06cac70172d5	1314	Rob
00050000-566e-cb0b-aad0-5265e7e6133e	5215	Ročinj
00050000-566e-cb0b-98a6-68bd84ae04f8	3250	Rogaška Slatina
00050000-566e-cb0b-c9fa-92e051f20093	9262	Rogašovci
00050000-566e-cb0b-b82b-72d121a11679	3252	Rogatec
00050000-566e-cb0b-b353-5a51af53208a	1373	Rovte
00050000-566e-cb0b-38c3-971658a8559d	2342	Ruše
00050000-566e-cb0b-5f3f-80702cfc4a94	1282	Sava
00050000-566e-cb0b-4346-a339817d57d7	6333	Sečovlje/Sicciole
00050000-566e-cb0b-70f5-01674109e692	4227	Selca
00050000-566e-cb0b-1396-1ed1b2778696	2352	Selnica ob Dravi
00050000-566e-cb0b-10a1-1bdfc0fbe6b1	8333	Semič
00050000-566e-cb0b-fff6-82d2fbab4ab2	8281	Senovo
00050000-566e-cb0b-ee4d-b97f227fb5d7	6224	Senožeče
00050000-566e-cb0b-936c-47274624d04e	8290	Sevnica
00050000-566e-cb0b-771a-de3a33bb69b5	6210	Sežana
00050000-566e-cb0b-8944-2814fb872d0b	2214	Sladki Vrh
00050000-566e-cb0b-6e2d-a9d68cc4ed62	5283	Slap ob Idrijci
00050000-566e-cb0b-392e-c243b42b4309	2380	Slovenj Gradec
00050000-566e-cb0b-eab2-f651a880cbb0	2310	Slovenska Bistrica
00050000-566e-cb0b-ad16-b90f545ef31e	3210	Slovenske Konjice
00050000-566e-cb0b-64b7-0a7b7b1104aa	1216	Smlednik
00050000-566e-cb0b-4e2c-4aa09418273c	5232	Soča
00050000-566e-cb0b-6e5a-164086debb83	1317	Sodražica
00050000-566e-cb0b-5a20-102869495680	3335	Solčava
00050000-566e-cb0b-f4fd-d3cfa4f42907	5250	Solkan
00050000-566e-cb0b-b50f-9657adae50e0	4229	Sorica
00050000-566e-cb0b-71c0-9320e47e3143	4225	Sovodenj
00050000-566e-cb0b-c6b0-e9083d3f3d24	5281	Spodnja Idrija
00050000-566e-cb0b-b7a2-3cfa47174fe2	2241	Spodnji Duplek
00050000-566e-cb0b-738e-04cd1ea5262d	9245	Spodnji Ivanjci
00050000-566e-cb0b-2120-6da39b6cfbf9	2277	Središče ob Dravi
00050000-566e-cb0b-d237-d4a69f88e55a	4267	Srednja vas v Bohinju
00050000-566e-cb0b-1c54-95f4bac67474	8256	Sromlje 
00050000-566e-cb0b-4dce-be27298714a4	5224	Srpenica
00050000-566e-cb0b-2963-f437d9cca171	1242	Stahovica
00050000-566e-cb0b-4989-20d977e693fa	1332	Stara Cerkev
00050000-566e-cb0b-cdc8-472e2a5cce0e	8342	Stari trg ob Kolpi
00050000-566e-cb0b-2759-675ed00ca45a	1386	Stari trg pri Ložu
00050000-566e-cb0b-0a70-1918bc5d2183	2205	Starše
00050000-566e-cb0b-4935-5344c458d27a	2289	Stoperce
00050000-566e-cb0b-9afd-aa24b1ead56a	8322	Stopiče
00050000-566e-cb0b-40fb-42f497b2016a	3206	Stranice
00050000-566e-cb0b-8c16-cd81037b53fa	8351	Straža
00050000-566e-cb0b-ba26-7c6cef14a2c4	1313	Struge
00050000-566e-cb0b-776c-5c56bcc96fa0	8293	Studenec
00050000-566e-cb0b-6c9e-9ca2b736ae91	8331	Suhor
00050000-566e-cb0b-26c1-c37a24f814db	2233	Sv. Ana v Slovenskih goricah
00050000-566e-cb0b-f246-eb259ef959fa	2235	Sv. Trojica v Slovenskih goricah
00050000-566e-cb0b-bdd6-3a0868d0ee7b	2353	Sveti Duh na Ostrem Vrhu
00050000-566e-cb0b-5f4a-57bd0a3c8e44	9244	Sveti Jurij ob Ščavnici
00050000-566e-cb0b-32e7-32c5ae634fa0	3264	Sveti Štefan
00050000-566e-cb0b-17eb-cea09758c61a	2258	Sveti Tomaž
00050000-566e-cb0b-2b33-41703d142765	9204	Šalovci
00050000-566e-cb0b-6f3b-0d098a685a18	5261	Šempas
00050000-566e-cb0b-cdfd-80613fd04847	5290	Šempeter pri Gorici
00050000-566e-cb0b-8093-32a1196d47c4	3311	Šempeter v Savinjski dolini
00050000-566e-cb0b-1ec9-c4d2fe9a3436	4208	Šenčur
00050000-566e-cb0b-2f47-c74cb61e769c	2212	Šentilj v Slovenskih goricah
00050000-566e-cb0b-4222-a2293129ac9e	8297	Šentjanž
00050000-566e-cb0b-bcfb-8165df7d6102	2373	Šentjanž pri Dravogradu
00050000-566e-cb0b-4412-9f2bc53e09bd	8310	Šentjernej
00050000-566e-cb0b-c18e-6a6c4133c056	3230	Šentjur
00050000-566e-cb0b-5f2f-07430e69c392	3271	Šentrupert
00050000-566e-cb0b-24a3-f48a0cbcfbb9	8232	Šentrupert
00050000-566e-cb0b-7d2b-53701184dcf8	1296	Šentvid pri Stični
00050000-566e-cb0b-94cc-be8b51f086e1	8275	Škocjan
00050000-566e-cb0b-1bcd-c1b6309232b8	6281	Škofije
00050000-566e-cb0b-cc53-c5b0154cfb2b	4220	Škofja Loka
00050000-566e-cb0b-463c-c45706e317f8	3211	Škofja vas
00050000-566e-cb0b-6259-774115a180b0	1291	Škofljica
00050000-566e-cb0b-e901-55e719ff3a5a	6274	Šmarje
00050000-566e-cb0b-ecf2-1068a0d36dec	1293	Šmarje - Sap
00050000-566e-cb0b-1cd8-55066d38a71f	3240	Šmarje pri Jelšah
00050000-566e-cb0b-107c-1c094a0f2d71	8220	Šmarješke Toplice
00050000-566e-cb0b-b0fa-66fb4e90c9b7	2315	Šmartno na Pohorju
00050000-566e-cb0b-876f-d146ce15f2f5	3341	Šmartno ob Dreti
00050000-566e-cb0b-5955-bbb0f1165491	3327	Šmartno ob Paki
00050000-566e-cb0b-ca8e-386749d5ecdc	1275	Šmartno pri Litiji
00050000-566e-cb0b-6fcb-18327eade22a	2383	Šmartno pri Slovenj Gradcu
00050000-566e-cb0b-f209-609b40e4f8cd	3201	Šmartno v Rožni dolini
00050000-566e-cb0b-345c-02d697a027be	3325	Šoštanj
00050000-566e-cb0b-13a7-adcc6b69e3cd	6222	Štanjel
00050000-566e-cb0b-c15e-5d848d9b4999	3220	Štore
00050000-566e-cb0b-0527-a84ac074be1b	3304	Tabor
00050000-566e-cb0b-14c8-0b35f9901e41	3221	Teharje
00050000-566e-cb0b-d649-ba13ea6ca707	9251	Tišina
00050000-566e-cb0b-521f-3e9a55ed4691	5220	Tolmin
00050000-566e-cb0b-a33d-ea8e944ab421	3326	Topolšica
00050000-566e-cb0b-b6ad-e532dd3b5046	2371	Trbonje
00050000-566e-cb0b-2e71-673b559a132b	1420	Trbovlje
00050000-566e-cb0b-1510-aa0fa3e6485f	8231	Trebelno 
00050000-566e-cb0b-590a-e77375069d17	8210	Trebnje
00050000-566e-cb0b-91ab-1c2fd2b098af	5252	Trnovo pri Gorici
00050000-566e-cb0b-c1eb-de06c946e356	2254	Trnovska vas
00050000-566e-cb0b-ea6a-b9c034d731df	1222	Trojane
00050000-566e-cb0b-7347-e1d94953b086	1236	Trzin
00050000-566e-cb0b-054a-7023a89680fe	4290	Tržič
00050000-566e-cb0b-a39c-414ce26fc1e8	8295	Tržišče
00050000-566e-cb0b-221c-76350712001f	1311	Turjak
00050000-566e-cb0b-4aa5-c7c4780fdc9e	9224	Turnišče
00050000-566e-cb0b-0c6e-7e42123c1cd5	8323	Uršna sela
00050000-566e-cb0b-c1da-9fa7bec715aa	1252	Vače
00050000-566e-cb0b-53f1-8c394d9b32e7	3320	Velenje 
00050000-566e-cb0b-63a2-ec591d11f794	3322	Velenje - poštni predali
00050000-566e-cb0b-cef6-6fd741199000	8212	Velika Loka
00050000-566e-cb0b-d452-66894bd2162f	2274	Velika Nedelja
00050000-566e-cb0b-d853-6cfb9771f146	9225	Velika Polana
00050000-566e-cb0b-5a8a-d383b5d906c4	1315	Velike Lašče
00050000-566e-cb0b-9099-2978b7b63ad0	8213	Veliki Gaber
00050000-566e-cb0b-bdf8-d37974235d4e	9241	Veržej
00050000-566e-cb0b-ffb5-2e364af71ee5	1312	Videm - Dobrepolje
00050000-566e-cb0b-a776-e2d3b43d1080	2284	Videm pri Ptuju
00050000-566e-cb0b-2677-86fa4267c90b	8344	Vinica
00050000-566e-cb0b-207c-73896e7eaa9e	5271	Vipava
00050000-566e-cb0b-8ab1-8167ec648f5f	4212	Visoko
00050000-566e-cb0b-51ec-0d2217afa323	1294	Višnja Gora
00050000-566e-cb0b-8faa-c5b3c76e1772	3205	Vitanje
00050000-566e-cb0b-64c7-6c36a623c36d	2255	Vitomarci
00050000-566e-cb0b-76c7-17ef016348fd	1217	Vodice
00050000-566e-cb0b-e67c-15b483516ad4	3212	Vojnik\t
00050000-566e-cb0b-b9a4-f9c34a2b1ed3	5293	Volčja Draga
00050000-566e-cb0b-677f-81baa87e624e	2232	Voličina
00050000-566e-cb0b-f8c2-00ca7cf9b984	3305	Vransko
00050000-566e-cb0b-9efa-274e89fbf2e2	6217	Vremski Britof
00050000-566e-cb0b-8e00-6fc991d4b20f	1360	Vrhnika
00050000-566e-cb0b-8a13-82cdd536af9e	2365	Vuhred
00050000-566e-cb0b-344d-34a62deac8f9	2367	Vuzenica
00050000-566e-cb0b-67a4-6ab51a65ff6b	8292	Zabukovje 
00050000-566e-cb0b-dc72-4f58e2c76bd7	1410	Zagorje ob Savi
00050000-566e-cb0b-3c90-7e211ca860ea	1303	Zagradec
00050000-566e-cb0b-dc1e-702f835248a5	2283	Zavrč
00050000-566e-cb0b-15dc-42e8cf7f53fc	8272	Zdole 
00050000-566e-cb0b-9313-de5dcad201ab	4201	Zgornja Besnica
00050000-566e-cb0b-6a13-415ecb6c9139	2242	Zgornja Korena
00050000-566e-cb0b-1f6e-21ce617475f3	2201	Zgornja Kungota
00050000-566e-cb0b-44cd-371c253f30de	2316	Zgornja Ložnica
00050000-566e-cb0b-b971-1e7851a78049	2314	Zgornja Polskava
00050000-566e-cb0b-664e-9995aeb10179	2213	Zgornja Velka
00050000-566e-cb0b-bd62-a3cdc56c4c65	4247	Zgornje Gorje
00050000-566e-cb0b-aa33-7c728bb1f9ee	4206	Zgornje Jezersko
00050000-566e-cb0b-ff69-1eafaf57186b	2285	Zgornji Leskovec
00050000-566e-cb0b-2969-a113e1defbdd	1432	Zidani Most
00050000-566e-cb0b-e452-96bb730e9775	3214	Zreče
00050000-566e-cb0b-cad9-824c7865ea8f	4209	Žabnica
00050000-566e-cb0b-be05-0be63c2f9537	3310	Žalec
00050000-566e-cb0b-6491-c23a649ce5b3	4228	Železniki
00050000-566e-cb0b-759a-ecb47decc64f	2287	Žetale
00050000-566e-cb0b-c213-92abe7382739	4226	Žiri
00050000-566e-cb0b-10b8-389a4f265f9e	4274	Žirovnica
00050000-566e-cb0b-81dc-99e2da2672a6	8360	Žužemberk
\.


--
-- TOC entry 3169 (class 0 OID 32125550)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 32125120)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 32124868)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-566e-cb0e-e25c-22ff62e2da1c	00080000-566e-cb0e-b4bb-7073af8745e1	\N	00040000-566e-cb0b-a49e-08dd0e808645	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-566e-cb0e-42ee-fb5ac42d706d	00080000-566e-cb0e-b4bb-7073af8745e1	\N	00040000-566e-cb0b-a49e-08dd0e808645	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-566e-cb0e-e889-4a4f799db8ea	00080000-566e-cb0e-68dc-9e664e328341	\N	00040000-566e-cb0b-a49e-08dd0e808645	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3131 (class 0 OID 32125012)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-566e-cb0b-0a3a-e46b16f1e98a	novo leto	1	1	\N	t
00430000-566e-cb0b-526d-8efd8a0d4d3f	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-566e-cb0b-4c22-9b6747cd0738	dan upora proti okupatorju	27	4	\N	t
00430000-566e-cb0b-c3d7-427883deb644	praznik dela	1	5	\N	t
00430000-566e-cb0b-1b0f-72955063154c	praznik dela	2	5	\N	t
00430000-566e-cb0b-4587-7486f3571c77	dan Primoža Trubarja	8	6	\N	f
00430000-566e-cb0b-bc6b-c0c646479891	dan državnosti	25	6	\N	t
00430000-566e-cb0b-d91e-8efd6fdd30ff	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-566e-cb0b-c618-22eab667dab4	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-566e-cb0c-9139-cf07ef0cfef7	dan suverenosti	25	10	\N	f
00430000-566e-cb0c-d684-7008d59bba2b	dan spomina na mrtve	1	11	\N	t
00430000-566e-cb0c-1149-5f0900007b25	dan Rudolfa Maistra	23	11	\N	f
00430000-566e-cb0c-ecb2-b195697dd0e6	božič	25	12	\N	t
00430000-566e-cb0c-ca25-e0c013305997	dan samostojnosti in enotnosti	26	12	\N	t
00430000-566e-cb0c-cd03-88dcb199a481	Marijino vnebovzetje	15	8	\N	t
00430000-566e-cb0c-7da7-1486c36619cf	dan reformacije	31	10	\N	t
00430000-566e-cb0c-6c08-fd08167500e2	velikonočna nedelja	27	3	2016	t
00430000-566e-cb0c-ab2c-da0e6be8dd7a	velikonočna nedelja	16	4	2017	t
00430000-566e-cb0c-0235-015b254b6a3c	velikonočna nedelja	1	4	2018	t
00430000-566e-cb0c-5d4c-50996f0807f0	velikonočna nedelja	21	4	2019	t
00430000-566e-cb0c-d5b8-058c8b9d7cce	velikonočna nedelja	12	4	2020	t
00430000-566e-cb0c-ec79-55c966c64415	velikonočna nedelja	4	4	2021	t
00430000-566e-cb0c-c8cf-ebac44458d9b	velikonočna nedelja	17	4	2022	t
00430000-566e-cb0c-9838-7a9c6740c11e	velikonočna nedelja	9	4	2023	t
00430000-566e-cb0c-f368-498814bdf408	velikonočna nedelja	31	3	2024	t
00430000-566e-cb0c-348a-bdc79499cc8a	velikonočna nedelja	20	4	2025	t
00430000-566e-cb0c-16e5-3b6df1728e63	velikonočna nedelja	5	4	2026	t
00430000-566e-cb0c-b6c5-27184bece6ca	velikonočna nedelja	28	3	2027	t
00430000-566e-cb0c-1792-6d0b549f0977	velikonočna nedelja	16	4	2028	t
00430000-566e-cb0c-c211-ab7d7d10e389	velikonočna nedelja	1	4	2029	t
00430000-566e-cb0c-33d0-909bb2ad1262	velikonočna nedelja	21	4	2030	t
00430000-566e-cb0c-a6c8-28060ec2b90e	velikonočni ponedeljek	28	3	2016	t
00430000-566e-cb0c-387a-722b76f211d9	velikonočni ponedeljek	17	4	2017	t
00430000-566e-cb0c-4665-d808b852a093	velikonočni ponedeljek	2	4	2018	t
00430000-566e-cb0c-01ef-ee877b057724	velikonočni ponedeljek	22	4	2019	t
00430000-566e-cb0c-e7e7-3a1e09204b3c	velikonočni ponedeljek	13	4	2020	t
00430000-566e-cb0c-ee41-224b7aa7b75c	velikonočni ponedeljek	5	4	2021	t
00430000-566e-cb0c-1dba-94c4f22aac10	velikonočni ponedeljek	18	4	2022	t
00430000-566e-cb0c-497a-4cfc61d14962	velikonočni ponedeljek	10	4	2023	t
00430000-566e-cb0c-df67-3651c583656c	velikonočni ponedeljek	1	4	2024	t
00430000-566e-cb0c-7b31-ae73c0dafa02	velikonočni ponedeljek	21	4	2025	t
00430000-566e-cb0c-10d8-3bb83dec798b	velikonočni ponedeljek	6	4	2026	t
00430000-566e-cb0c-66fb-960d55d9f4d0	velikonočni ponedeljek	29	3	2027	t
00430000-566e-cb0c-e565-e44e0f178758	velikonočni ponedeljek	17	4	2028	t
00430000-566e-cb0c-8a1a-ae9caff50f8a	velikonočni ponedeljek	2	4	2029	t
00430000-566e-cb0c-9018-d5c9eaef6565	velikonočni ponedeljek	22	4	2030	t
00430000-566e-cb0c-e460-3f9edb152831	binkoštna nedelja - binkošti	15	5	2016	t
00430000-566e-cb0c-05dc-fa5f3d894185	binkoštna nedelja - binkošti	4	6	2017	t
00430000-566e-cb0c-38d1-c99c56dc6b2b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-566e-cb0c-5a47-b41e41b94c84	binkoštna nedelja - binkošti	9	6	2019	t
00430000-566e-cb0c-ebfc-82efa55876ad	binkoštna nedelja - binkošti	31	5	2020	t
00430000-566e-cb0c-5e9f-e8fb579856eb	binkoštna nedelja - binkošti	23	5	2021	t
00430000-566e-cb0c-5ddb-37ef18e3457d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-566e-cb0c-0fae-8b94e05dee37	binkoštna nedelja - binkošti	28	5	2023	t
00430000-566e-cb0c-8ceb-cdb539d26f72	binkoštna nedelja - binkošti	19	5	2024	t
00430000-566e-cb0c-8f67-a70f4956d352	binkoštna nedelja - binkošti	8	6	2025	t
00430000-566e-cb0c-7af5-b08199ed36cf	binkoštna nedelja - binkošti	24	5	2026	t
00430000-566e-cb0c-2fb4-89b84f2ca3f7	binkoštna nedelja - binkošti	16	5	2027	t
00430000-566e-cb0c-94fe-a2c25c3517f9	binkoštna nedelja - binkošti	4	6	2028	t
00430000-566e-cb0c-03bc-922e643dfb2d	binkoštna nedelja - binkošti	20	5	2029	t
00430000-566e-cb0c-4845-de7026b99ea8	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3127 (class 0 OID 32124972)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 32124984)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32125132)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 32125564)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 32125574)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-566e-cb0e-bb95-a9e4b0b498ed	00080000-566e-cb0e-6946-356b1b45f2f6	0987	AK
00190000-566e-cb0e-23e0-1a16688cb1b2	00080000-566e-cb0e-68dc-9e664e328341	0989	AK
00190000-566e-cb0e-e050-bc8d038ac449	00080000-566e-cb0e-62e4-aaf37dabee2f	0986	AK
00190000-566e-cb0e-de12-dcd5ba01b004	00080000-566e-cb0e-9d3c-4f294a6b12fe	0984	AK
00190000-566e-cb0e-9900-07badbdbed74	00080000-566e-cb0e-dd6f-798fbc88cf00	0983	AK
00190000-566e-cb0e-781f-dba749e8f759	00080000-566e-cb0e-fd6e-751eb985856b	0982	AK
00190000-566e-cb10-6f80-8dcc0e172cb8	00080000-566e-cb10-1d0d-4b03c20922ed	1001	AK
\.


--
-- TOC entry 3168 (class 0 OID 32125469)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-566e-cb0e-0f73-dec4346ecd65	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3172 (class 0 OID 32125582)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32125161)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-566e-cb0e-1806-68efd2bda20a	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-566e-cb0e-e917-3febe32eaec8	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-566e-cb0e-5419-76dc1be379f9	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-566e-cb0e-bdeb-2a591cf8080a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-566e-cb0e-0b90-dd71df022ec8	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-566e-cb0e-5b66-4c9216de48af	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-566e-cb0e-6608-141ec5766282	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3140 (class 0 OID 32125105)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 32125095)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32125307)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 32125237)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32124946)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 32124708)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-566e-cb10-1d0d-4b03c20922ed	00010000-566e-cb0c-6064-29af6d0bd048	2015-12-14 14:58:40	INS	a:0:{}
2	App\\Entity\\Option	00000000-566e-cb10-7521-3b80f5a67af7	00010000-566e-cb0c-6064-29af6d0bd048	2015-12-14 14:58:40	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-566e-cb10-6f80-8dcc0e172cb8	00010000-566e-cb0c-6064-29af6d0bd048	2015-12-14 14:58:40	INS	a:0:{}
\.


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3149 (class 0 OID 32125174)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 32124746)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-566e-cb0c-77fd-f6149a03e560	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-566e-cb0c-f333-b7ad3ec48441	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-566e-cb0c-f42d-e030991cfb58	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-566e-cb0c-2e17-69d523c21d46	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-566e-cb0c-2c1b-2915bc24055d	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-566e-cb0c-df81-17f2e003a7a6	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-566e-cb0c-8d6c-197aa9cd9279	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-566e-cb0c-e009-0d895de98760	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-566e-cb0c-44fa-8b382110dfb7	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-cb0c-20de-0254d204116d	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-cb0c-e689-c35524e701ad	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-cb0c-3856-b03449190556	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-cb0c-82aa-1e50df2b0a09	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-566e-cb0c-f5c6-9ae3b20fcf4f	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-566e-cb0c-36cf-90f97e22a8dd	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-566e-cb0c-6d6c-ec4ee4f345d6	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-566e-cb0c-5307-ec481df0f79b	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-566e-cb0c-cf51-455796765163	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-566e-cb0c-d151-79cee820ac40	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-566e-cb0c-8736-44cd05f84382	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-566e-cb0c-3acd-c0ba8784ddb7	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-566e-cb0c-26dc-ac27827b2d6e	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-566e-cb0c-5301-795c7230f4dd	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-566e-cb0c-ec80-fa43ed275a03	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-566e-cb0c-cfe0-1a7248cabf0a	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-566e-cb0c-57d3-e835362b6124	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-566e-cb0c-8bb5-d70236464c6b	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-566e-cb0c-535f-a051d8e08af2	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-566e-cb0c-aa9c-d16dea3b1a0c	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-566e-cb0c-7b9e-4e013569dbd7	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-566e-cb0c-a63c-4ad6c12f4e36	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-566e-cb0c-7609-7376978b0e58	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-566e-cb0c-30b1-f9b2402bf8db	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-566e-cb0c-6e77-1dff14ba0a57	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-566e-cb0c-b500-f05e5cd89a0d	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-566e-cb0c-6a5e-a30add72ad15	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-566e-cb0c-c1c3-19101d953ae5	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-566e-cb0c-ef15-23d6227fc389	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-566e-cb0c-8d79-3b275b33f8bd	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-566e-cb0c-df19-44f09a5a37b0	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-566e-cb0c-d3cb-1db6c154a08d	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-566e-cb0c-df8c-893d703a5a96	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-566e-cb0c-7757-520d2f16dcf0	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-566e-cb0c-00be-1632dba4d6e6	arhivar	arhivar	t
00020000-566e-cb0e-8171-e6023518d755	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-566e-cb0e-eb3c-8360e1f7baa2	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-b36e-7d7a14236ea7	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-743a-b8a9f0d19ea2	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-bfb9-fc2eb8065183	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-d233-06fdb964958f	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-b810-3a14a3ca6f68	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-ca45-38e6e2966a1f	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-3468-03ef6e250bbd	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-6fbe-0bfc7f377eba	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-11e8-6db9443e4011	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-5529-b435197d8baa	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-ea03-e1dbdd2b4283	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-c6d7-f7d9ca069ca6	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-9cf7-8b81a9aa6d0e	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-2fe4-038a4684f4b7	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-9afd-b7e8950d3467	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-9e56-df9258d7317e	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-e519-102fced76db6	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-13ed-d05d7638dad1	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-566e-cb0e-0836-13c2e7607326	Trr-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-433a-9d17d89db733	Trr-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-7649-e2be983d7b66	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-ed11-4f518e141e24	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-e092-d9f0b8a30523	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-e677-517222283cd3	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-e784-15c2c27c412a	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-287f-7b8c1b989e3c	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-42a8-5b999408d961	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-1df0-72bf7b2d5e67	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-9cf3-12cd325855cf	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-9c83-3b37f665a3b2	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-2f9f-c2da2105118b	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-6e72-6590e4b85d1f	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-566e-cb0e-93df-caf3843a602c	Alternacija-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3106 (class 0 OID 32124730)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-566e-cb0c-f4f9-7ed3d515f755	00020000-566e-cb0c-f42d-e030991cfb58
00010000-566e-cb0c-6064-29af6d0bd048	00020000-566e-cb0c-f42d-e030991cfb58
00010000-566e-cb0e-b681-2258eb8863df	00020000-566e-cb0e-8171-e6023518d755
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-eb3c-8360e1f7baa2
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-d233-06fdb964958f
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-6fbe-0bfc7f377eba
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-5529-b435197d8baa
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-c6d7-f7d9ca069ca6
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-e519-102fced76db6
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-743a-b8a9f0d19ea2
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-0836-13c2e7607326
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-ed11-4f518e141e24
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-e677-517222283cd3
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-287f-7b8c1b989e3c
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-1df0-72bf7b2d5e67
00010000-566e-cb0e-696b-a0ba27fbcde3	00020000-566e-cb0e-6e72-6590e4b85d1f
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-eb3c-8360e1f7baa2
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-b36e-7d7a14236ea7
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-743a-b8a9f0d19ea2
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-bfb9-fc2eb8065183
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-c6d7-f7d9ca069ca6
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-9afd-b7e8950d3467
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-0836-13c2e7607326
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-ed11-4f518e141e24
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-e677-517222283cd3
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-287f-7b8c1b989e3c
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-1df0-72bf7b2d5e67
00010000-566e-cb0e-4165-989f25f5db08	00020000-566e-cb0e-6e72-6590e4b85d1f
00010000-566e-cb0e-43df-86feefb47fd3	00020000-566e-cb0e-eb3c-8360e1f7baa2
00010000-566e-cb0e-43df-86feefb47fd3	00020000-566e-cb0e-b36e-7d7a14236ea7
00010000-566e-cb0e-43df-86feefb47fd3	00020000-566e-cb0e-743a-b8a9f0d19ea2
00010000-566e-cb0e-43df-86feefb47fd3	00020000-566e-cb0e-bfb9-fc2eb8065183
00010000-566e-cb0e-43df-86feefb47fd3	00020000-566e-cb0e-5529-b435197d8baa
00010000-566e-cb0e-43df-86feefb47fd3	00020000-566e-cb0e-c6d7-f7d9ca069ca6
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-b36e-7d7a14236ea7
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-b810-3a14a3ca6f68
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-11e8-6db9443e4011
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-ea03-e1dbdd2b4283
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-5529-b435197d8baa
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-9e56-df9258d7317e
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-c6d7-f7d9ca069ca6
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-9cf7-8b81a9aa6d0e
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-0836-13c2e7607326
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-433a-9d17d89db733
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-ed11-4f518e141e24
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-e092-d9f0b8a30523
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-e677-517222283cd3
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-e784-15c2c27c412a
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-287f-7b8c1b989e3c
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-42a8-5b999408d961
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-1df0-72bf7b2d5e67
00010000-566e-cb0e-1a32-e28b1999bd41	00020000-566e-cb0e-9cf3-12cd325855cf
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-b36e-7d7a14236ea7
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-b810-3a14a3ca6f68
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-3468-03ef6e250bbd
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-11e8-6db9443e4011
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-ea03-e1dbdd2b4283
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-5529-b435197d8baa
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-9e56-df9258d7317e
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-c6d7-f7d9ca069ca6
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-9cf7-8b81a9aa6d0e
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-2fe4-038a4684f4b7
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-0836-13c2e7607326
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-433a-9d17d89db733
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-7649-e2be983d7b66
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-ed11-4f518e141e24
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-e092-d9f0b8a30523
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-e677-517222283cd3
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-e784-15c2c27c412a
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-287f-7b8c1b989e3c
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-42a8-5b999408d961
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-1df0-72bf7b2d5e67
00010000-566e-cb0e-6357-1389aef63255	00020000-566e-cb0e-9cf3-12cd325855cf
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-b36e-7d7a14236ea7
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-743a-b8a9f0d19ea2
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-b810-3a14a3ca6f68
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-ca45-38e6e2966a1f
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-3468-03ef6e250bbd
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-d233-06fdb964958f
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-11e8-6db9443e4011
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-ea03-e1dbdd2b4283
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-5529-b435197d8baa
00010000-566e-cb0e-733e-ce6ae9767e5a	00020000-566e-cb0e-9e56-df9258d7317e
00010000-566e-cb0e-5d8a-6b2bfadee3e7	00020000-566e-cb0e-eb3c-8360e1f7baa2
00010000-566e-cb0e-5d8a-6b2bfadee3e7	00020000-566e-cb0e-bfb9-fc2eb8065183
00010000-566e-cb0e-5d8a-6b2bfadee3e7	00020000-566e-cb0e-d233-06fdb964958f
00010000-566e-cb0e-5d8a-6b2bfadee3e7	00020000-566e-cb0e-6fbe-0bfc7f377eba
00010000-566e-cb0e-5d8a-6b2bfadee3e7	00020000-566e-cb0e-5529-b435197d8baa
00010000-566e-cb0e-5d8a-6b2bfadee3e7	00020000-566e-cb0e-c6d7-f7d9ca069ca6
00010000-566e-cb0e-5d8a-6b2bfadee3e7	00020000-566e-cb0e-e519-102fced76db6
00010000-566e-cb0e-5d8a-6b2bfadee3e7	00020000-566e-cb0e-9c83-3b37f665a3b2
00010000-566e-cb0e-8964-8c84d0eae807	00020000-566e-cb0e-13ed-d05d7638dad1
\.


--
-- TOC entry 3151 (class 0 OID 32125188)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32125126)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 32125072)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-566e-cb0e-ef9e-594b76bef6ee	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-566e-cb0e-41c2-7d742d18eba0	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-566e-cb0e-ceb7-0b0acb287267	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3102 (class 0 OID 32124695)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-566e-cb0b-9f36-751cc65cb274	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-566e-cb0b-2394-8cd24b1d25f8	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-566e-cb0b-7ab6-9b97fb5b67ed	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-566e-cb0b-a084-f5eadb5a20ff	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-566e-cb0b-e32f-287f345db48f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3101 (class 0 OID 32124687)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-566e-cb0b-b5cb-521936613dcc	00230000-566e-cb0b-a084-f5eadb5a20ff	popa
00240000-566e-cb0b-5d69-e31bec2a7034	00230000-566e-cb0b-a084-f5eadb5a20ff	oseba
00240000-566e-cb0b-f450-db27b06ebf76	00230000-566e-cb0b-a084-f5eadb5a20ff	tippopa
00240000-566e-cb0b-4103-83d41ac3b050	00230000-566e-cb0b-a084-f5eadb5a20ff	organizacijskaenota
00240000-566e-cb0b-b7ae-658315807b4e	00230000-566e-cb0b-a084-f5eadb5a20ff	sezona
00240000-566e-cb0b-4de8-0b9a22bee6f6	00230000-566e-cb0b-a084-f5eadb5a20ff	tipvaje
00240000-566e-cb0b-5048-f03d0b1a5925	00230000-566e-cb0b-2394-8cd24b1d25f8	prostor
00240000-566e-cb0b-58ae-4bfa198923dc	00230000-566e-cb0b-a084-f5eadb5a20ff	besedilo
00240000-566e-cb0b-05c8-93f143776694	00230000-566e-cb0b-a084-f5eadb5a20ff	uprizoritev
00240000-566e-cb0b-6adf-8b22c980a012	00230000-566e-cb0b-a084-f5eadb5a20ff	funkcija
00240000-566e-cb0b-11ff-d05ef39e1556	00230000-566e-cb0b-a084-f5eadb5a20ff	tipfunkcije
00240000-566e-cb0b-b755-00e331c609c5	00230000-566e-cb0b-a084-f5eadb5a20ff	alternacija
00240000-566e-cb0b-c050-2cc36ee9832b	00230000-566e-cb0b-9f36-751cc65cb274	pogodba
00240000-566e-cb0b-fae3-4c5799882fc5	00230000-566e-cb0b-a084-f5eadb5a20ff	zaposlitev
00240000-566e-cb0b-85c6-ce44c690cee0	00230000-566e-cb0b-a084-f5eadb5a20ff	zvrstuprizoritve
00240000-566e-cb0b-8987-2029b91f1541	00230000-566e-cb0b-9f36-751cc65cb274	programdela
00240000-566e-cb0b-5bb1-b6293a6ec571	00230000-566e-cb0b-a084-f5eadb5a20ff	zapis
\.


--
-- TOC entry 3100 (class 0 OID 32124682)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
2410e105-8698-4204-9978-64730f158bd2	00240000-566e-cb0b-b5cb-521936613dcc	0	1001
\.


--
-- TOC entry 3157 (class 0 OID 32125254)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-566e-cb0e-5f44-86c3ddefc537	000e0000-566e-cb0e-0727-f043aa27cc87	00080000-566e-cb0e-b4bb-7073af8745e1	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-566e-cb0b-b0c7-c0e47c33ec60
00270000-566e-cb0e-8a83-e35a3329bd8f	000e0000-566e-cb0e-0727-f043aa27cc87	00080000-566e-cb0e-b4bb-7073af8745e1	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-566e-cb0b-b0c7-c0e47c33ec60
\.


--
-- TOC entry 3116 (class 0 OID 32124830)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32125082)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-566e-cb0e-e463-84a9e7c363ed	00180000-566e-cb0e-9adc-9e340a6ff0cc	000c0000-566e-cb0e-bbe7-afbc6e107bb5	00090000-566e-cb0e-4a98-63801bfc55ae	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cb0e-6e61-cb6df1ac9f6f	00180000-566e-cb0e-9adc-9e340a6ff0cc	000c0000-566e-cb0e-bc31-3ec630b7bcaf	00090000-566e-cb0e-6e7c-afc87e6172a2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cb0e-5829-9259a3ddf2b4	00180000-566e-cb0e-9adc-9e340a6ff0cc	000c0000-566e-cb0e-0878-51cd82e91a78	00090000-566e-cb0e-0909-00649c841acb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cb0e-b8d4-60dd01ac9e8a	00180000-566e-cb0e-9adc-9e340a6ff0cc	000c0000-566e-cb0e-2226-0503903c4e88	00090000-566e-cb0e-8300-2ada8b5c9745	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cb0e-15c4-56ac2fb32007	00180000-566e-cb0e-9adc-9e340a6ff0cc	000c0000-566e-cb0e-d7c1-61459a1d0e32	00090000-566e-cb0e-2dd2-c9d57a233b38	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cb0e-19c5-e722e5d0ad9a	00180000-566e-cb0e-738d-dcbe1162df8d	\N	00090000-566e-cb0e-2dd2-c9d57a233b38	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-566e-cb0e-364e-f434f8dae93d	00180000-566e-cb0e-738d-dcbe1162df8d	\N	00090000-566e-cb0e-6e7c-afc87e6172a2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3160 (class 0 OID 32125295)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-566e-cb0b-97dc-882559308b0d	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-566e-cb0b-ecf0-c7b467b01036	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-566e-cb0b-3fdc-b4de9ba1dd38	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-566e-cb0b-7f72-b7f2b2b35a6f	04	Režija	Režija	Režija	umetnik	30
000f0000-566e-cb0b-89ad-a2249ac40f1f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-566e-cb0b-c427-81de62f3ad93	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-566e-cb0b-8d4e-1dc80c6fb3ce	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-566e-cb0b-860a-76074e87c2dd	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-566e-cb0b-11b9-7110aed0a05c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-566e-cb0b-9263-e60516a74201	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-566e-cb0b-0714-602ef6801c2b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-566e-cb0b-15c3-8a662ee56ad5	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-566e-cb0b-3808-10984026534c	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-566e-cb0b-fc25-f397d91f5f11	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-566e-cb0b-ae33-56caa59fc93a	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-566e-cb0b-07d8-68d1c9de2a2b	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-566e-cb0b-41ce-b4cbfd208eb1	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-566e-cb0b-a5da-ed377f7334f7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3113 (class 0 OID 32124781)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-566e-cb0e-e43e-8fd5e68664c7	0001	šola	osnovna ali srednja šola
00400000-566e-cb0e-b4e4-c962bc63b6c2	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-566e-cb0e-4a02-99c3f9474005	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3173 (class 0 OID 32125594)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-566e-cb0b-d017-22e31aa4300f	01	Velika predstava	f	1.00	1.00
002b0000-566e-cb0b-ef2f-2f7356cf91d3	02	Mala predstava	f	0.50	0.50
002b0000-566e-cb0b-e8ed-ebead1c0523c	03	Mala koprodukcija	t	0.40	1.00
002b0000-566e-cb0b-70f0-45d8740a9705	04	Srednja koprodukcija	t	0.70	2.00
002b0000-566e-cb0b-da0a-bba242ea983a	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3136 (class 0 OID 32125062)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-566e-cb0b-0aaa-6d2fe89c3dd8	0001	prva vaja	prva vaja
00420000-566e-cb0b-a124-ad0cf699f12a	0002	tehnična vaja	tehnična vaja
00420000-566e-cb0b-93a5-143e2643b4af	0003	lučna vaja	lučna vaja
00420000-566e-cb0b-3cca-5ff74ce9982f	0004	kostumska vaja	kostumska vaja
00420000-566e-cb0b-f5bf-cbc7b066df7d	0005	foto vaja	foto vaja
00420000-566e-cb0b-5d2b-0e9f0bd6b460	0006	1. glavna vaja	1. glavna vaja
00420000-566e-cb0b-f46d-c68a7294077a	0007	2. glavna vaja	2. glavna vaja
00420000-566e-cb0b-f350-8bb8b23e946c	0008	1. generalka	1. generalka
00420000-566e-cb0b-7faf-4358459e52a4	0009	2. generalka	2. generalka
00420000-566e-cb0b-d08a-e486d62bb8c7	0010	odprta generalka	odprta generalka
00420000-566e-cb0b-800d-26b1ea5c6186	0011	obnovitvena vaja	obnovitvena vaja
00420000-566e-cb0b-b8ce-1b7303dda82c	0012	italijanka	krajša "obnovitvena" vaja
00420000-566e-cb0b-56f5-8cccc1a04d04	0013	pevska vaja	pevska vaja
00420000-566e-cb0b-ccfc-81206bd0cdd4	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-566e-cb0b-683d-c32203774c6e	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3122 (class 0 OID 32124903)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32124717)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-566e-cb0c-6064-29af6d0bd048	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROCFmbS6sCDgJ/jWkyAlEneQtlTTYrY.2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-9d1f-ce5ba96a70c8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-c2ea-ae4b616d1aad	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-e9b6-d732b4cd5f46	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-8eef-7313a81e1106	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-a7ea-a2576b6cfa91	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-423c-53fb2b46178f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-e3da-218e5acba97f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-6592-08e2db389225	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-4444-7a3baa8505b9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-b681-2258eb8863df	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-60a4-ce5eada0e6c9	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-696b-a0ba27fbcde3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-4165-989f25f5db08	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-43df-86feefb47fd3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-1a32-e28b1999bd41	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-6357-1389aef63255	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-733e-ce6ae9767e5a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-5d8a-6b2bfadee3e7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-566e-cb0e-8964-8c84d0eae807	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-566e-cb0c-f4f9-7ed3d515f755	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3164 (class 0 OID 32125345)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-566e-cb0e-f229-3c9c2836de75	00160000-566e-cb0e-4f37-f6ecf73c74ce	\N	00140000-566e-cb0b-8ea6-f80b516f2936	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-566e-cb0e-0b90-dd71df022ec8
000e0000-566e-cb0e-0727-f043aa27cc87	00160000-566e-cb0e-cb9c-28c6c39c2c95	\N	00140000-566e-cb0b-d9c7-4697ed661088	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-566e-cb0e-5b66-4c9216de48af
000e0000-566e-cb0e-e7d7-45415ad1c193	\N	\N	00140000-566e-cb0b-d9c7-4697ed661088	00190000-566e-cb0e-bb95-a9e4b0b498ed	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-566e-cb0e-0b90-dd71df022ec8
000e0000-566e-cb0e-23ba-0db39a08d6dc	\N	\N	00140000-566e-cb0b-d9c7-4697ed661088	00190000-566e-cb0e-bb95-a9e4b0b498ed	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-566e-cb0e-0b90-dd71df022ec8
000e0000-566e-cb0e-8488-2279b20267de	\N	\N	00140000-566e-cb0b-d9c7-4697ed661088	00190000-566e-cb0e-bb95-a9e4b0b498ed	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-566e-cb0e-1806-68efd2bda20a
000e0000-566e-cb0e-71cb-a619e1f2d42e	\N	\N	00140000-566e-cb0b-d9c7-4697ed661088	00190000-566e-cb0e-bb95-a9e4b0b498ed	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-566e-cb0e-1806-68efd2bda20a
\.


--
-- TOC entry 3130 (class 0 OID 32125002)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-566e-cb0e-6e7a-f21557043af8	\N	000e0000-566e-cb0e-0727-f043aa27cc87	1	
00200000-566e-cb0e-c7ea-01458b1a9d5b	\N	000e0000-566e-cb0e-0727-f043aa27cc87	2	
00200000-566e-cb0e-3399-f9874191be37	\N	000e0000-566e-cb0e-0727-f043aa27cc87	3	
00200000-566e-cb0e-c14c-78dab7cee912	\N	000e0000-566e-cb0e-0727-f043aa27cc87	4	
00200000-566e-cb0e-515b-3c81812da9fb	\N	000e0000-566e-cb0e-0727-f043aa27cc87	5	
\.


--
-- TOC entry 3147 (class 0 OID 32125153)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 32125268)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-566e-cb0b-0ddd-a68ec4027652	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-566e-cb0b-4822-3c3d868fe573	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-566e-cb0b-db13-b5450562d642	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-566e-cb0b-afcc-8f9ece7fd08d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-566e-cb0b-d2b5-6770eb1c9a27	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-566e-cb0b-0efc-b2ee8ac1a6a5	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-566e-cb0b-a471-bc5339b4c581	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-566e-cb0b-91ef-840e294eef3f	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-566e-cb0b-b0c7-c0e47c33ec60	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-566e-cb0b-6c6b-0fab2ada1002	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-566e-cb0b-aead-5078e8366196	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-566e-cb0b-99c4-275381b0b790	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-566e-cb0b-7551-a3196f5bc328	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-566e-cb0b-a183-af3546f3e3c1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-566e-cb0b-4532-79350e65b159	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-566e-cb0b-0017-e9b24ba3b4d6	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-566e-cb0b-4397-f90a3f8da9d1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-566e-cb0b-d0b2-ea8ba5528d86	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-566e-cb0b-8577-3fe24c9114e8	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-566e-cb0b-9bd3-a76c53dd19c8	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-566e-cb0b-719d-5b509583f428	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-566e-cb0b-855f-a7900c6e7df8	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-566e-cb0b-3790-5b57d119541a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-566e-cb0b-912e-62288150700d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-566e-cb0b-5871-ade1aa89e10c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-566e-cb0b-724e-ed73833da66e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-566e-cb0b-1191-dfe9f0f69ec3	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-566e-cb0b-6a90-8a6df4154c45	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3176 (class 0 OID 32125644)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 32125613)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32125656)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32125226)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-566e-cb0e-5ee6-07180f342264	00090000-566e-cb0e-6e7c-afc87e6172a2	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cb0e-3760-2bc12add82e7	00090000-566e-cb0e-0909-00649c841acb	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cb0e-a052-8a51eb8c2a2a	00090000-566e-cb0e-cef9-94720153c51a	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cb0e-ae66-ef42a8349c90	00090000-566e-cb0e-3ce3-db64f68d6e1d	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cb0e-928d-e2e8da4e7aa7	00090000-566e-cb0e-e133-a562e10711b2	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cb0e-1f07-c714dd6a4b1c	00090000-566e-cb0e-87a2-8c05802d9b38	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3133 (class 0 OID 32125046)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 32125335)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-566e-cb0b-8ea6-f80b516f2936	01	Drama	drama (SURS 01)
00140000-566e-cb0b-f7e2-c19bb120dce3	02	Opera	opera (SURS 02)
00140000-566e-cb0b-252a-e3def8851852	03	Balet	balet (SURS 03)
00140000-566e-cb0b-1be0-45b0636a56f2	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-566e-cb0b-c5be-3560423b5724	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-566e-cb0b-d9c7-4697ed661088	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-566e-cb0b-e034-d5e98491b9a5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3153 (class 0 OID 32125216)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2595 (class 2606 OID 32124780)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32125394)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 32125384)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 32124771)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32125251)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 32125293)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32125697)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 32125034)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 32125056)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 32125061)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 32125611)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 32124929)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 32125463)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 32125212)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 32125000)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32124967)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 32124943)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 32125118)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 32125674)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 32125681)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2876 (class 2606 OID 32125705)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 32028299)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2733 (class 2606 OID 32125145)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 32124901)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32124799)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32124863)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 32124826)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 32124760)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2584 (class 2606 OID 32124745)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 32125151)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 32125187)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 32125330)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 32124854)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 32124889)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 32125562)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32125124)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32124879)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 32125019)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 32124988)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2662 (class 2606 OID 32124980)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32125136)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 32125571)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32125579)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 32125549)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 32125592)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 32125169)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32125109)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32125100)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 32125317)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 32125244)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 32124955)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32124716)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 32125178)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32124734)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2586 (class 2606 OID 32124754)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 32125196)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32125131)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32125080)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32124704)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 32124692)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 32124686)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 32125264)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32124835)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32125091)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 32125304)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32124788)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 32125604)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32125069)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 32124914)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 32124729)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 32125363)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 32125009)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 32125159)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 32125276)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 32125654)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 32125638)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32125662)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 32125234)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 32125050)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 32125343)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32125224)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 1259 OID 32125044)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2679 (class 1259 OID 32125045)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2680 (class 1259 OID 32125043)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2681 (class 1259 OID 32125042)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2682 (class 1259 OID 32125041)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2776 (class 1259 OID 32125265)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2777 (class 1259 OID 32125266)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 32125267)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2862 (class 1259 OID 32125676)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2863 (class 1259 OID 32125675)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2613 (class 1259 OID 32124856)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2614 (class 1259 OID 32124857)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2734 (class 1259 OID 32125152)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2849 (class 1259 OID 32125642)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2850 (class 1259 OID 32125641)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2851 (class 1259 OID 32125643)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2852 (class 1259 OID 32125640)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2853 (class 1259 OID 32125639)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2728 (class 1259 OID 32125138)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2729 (class 1259 OID 32125137)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2670 (class 1259 OID 32125010)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2671 (class 1259 OID 32125011)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2758 (class 1259 OID 32125213)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2759 (class 1259 OID 32125215)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2760 (class 1259 OID 32125214)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2645 (class 1259 OID 32124945)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2646 (class 1259 OID 32124944)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2840 (class 1259 OID 32125593)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2792 (class 1259 OID 32125332)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2793 (class 1259 OID 32125333)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2794 (class 1259 OID 32125334)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2859 (class 1259 OID 32125663)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2801 (class 1259 OID 32125368)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2802 (class 1259 OID 32125365)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2803 (class 1259 OID 32125369)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2804 (class 1259 OID 32125367)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2805 (class 1259 OID 32125366)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2635 (class 1259 OID 32124916)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 32124915)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 32124829)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2746 (class 1259 OID 32125179)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2588 (class 1259 OID 32124761)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2589 (class 1259 OID 32124762)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2751 (class 1259 OID 32125199)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2752 (class 1259 OID 32125198)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2753 (class 1259 OID 32125197)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2618 (class 1259 OID 32124866)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2619 (class 1259 OID 32124865)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2620 (class 1259 OID 32124867)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2658 (class 1259 OID 32124983)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2659 (class 1259 OID 32124981)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 32124982)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2568 (class 1259 OID 32124694)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2708 (class 1259 OID 32125104)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2709 (class 1259 OID 32125102)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2710 (class 1259 OID 32125101)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2711 (class 1259 OID 32125103)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2579 (class 1259 OID 32124735)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2580 (class 1259 OID 32124736)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2737 (class 1259 OID 32125160)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2872 (class 1259 OID 32125698)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2774 (class 1259 OID 32125253)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2775 (class 1259 OID 32125252)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2873 (class 1259 OID 32125706)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2874 (class 1259 OID 32125707)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2723 (class 1259 OID 32125125)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2768 (class 1259 OID 32125245)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2769 (class 1259 OID 32125246)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2822 (class 1259 OID 32125468)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2823 (class 1259 OID 32125467)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2824 (class 1259 OID 32125464)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2825 (class 1259 OID 32125465)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2826 (class 1259 OID 32125466)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2624 (class 1259 OID 32124881)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 32124880)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2626 (class 1259 OID 32124882)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32125173)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 32125172)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 32125572)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2833 (class 1259 OID 32125573)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2815 (class 1259 OID 32125398)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2816 (class 1259 OID 32125399)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2817 (class 1259 OID 32125396)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2818 (class 1259 OID 32125397)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2764 (class 1259 OID 32125235)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2765 (class 1259 OID 32125236)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2714 (class 1259 OID 32125113)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2715 (class 1259 OID 32125112)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2716 (class 1259 OID 32125110)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2717 (class 1259 OID 32125111)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2811 (class 1259 OID 32125386)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2812 (class 1259 OID 32125385)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2649 (class 1259 OID 32124956)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2652 (class 1259 OID 32124970)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2653 (class 1259 OID 32124969)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2654 (class 1259 OID 32124968)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2655 (class 1259 OID 32124971)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2669 (class 1259 OID 32125001)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2663 (class 1259 OID 32124989)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2664 (class 1259 OID 32124990)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2829 (class 1259 OID 32125563)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2848 (class 1259 OID 32125612)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2866 (class 1259 OID 32125682)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 32125683)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2600 (class 1259 OID 32124801)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2601 (class 1259 OID 32124800)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2609 (class 1259 OID 32124836)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 32124837)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2689 (class 1259 OID 32125051)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2703 (class 1259 OID 32125094)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2704 (class 1259 OID 32125093)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2705 (class 1259 OID 32125092)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2683 (class 1259 OID 32125036)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2684 (class 1259 OID 32125037)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2685 (class 1259 OID 32125040)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2686 (class 1259 OID 32125035)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2687 (class 1259 OID 32125039)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2688 (class 1259 OID 32125038)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2617 (class 1259 OID 32124855)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 32124789)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 32124790)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2641 (class 1259 OID 32124930)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2642 (class 1259 OID 32124932)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2643 (class 1259 OID 32124931)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2644 (class 1259 OID 32124933)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2722 (class 1259 OID 32125119)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2797 (class 1259 OID 32125331)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2806 (class 1259 OID 32125364)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2788 (class 1259 OID 32125305)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2789 (class 1259 OID 32125306)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2607 (class 1259 OID 32124827)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 32124828)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2761 (class 1259 OID 32125225)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2574 (class 1259 OID 32124705)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 32124902)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2623 (class 1259 OID 32124864)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 32124693)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2845 (class 1259 OID 32125605)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 32125171)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2745 (class 1259 OID 32125170)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2698 (class 1259 OID 32125070)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2699 (class 1259 OID 32125071)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2819 (class 1259 OID 32125395)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 32124890)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2798 (class 1259 OID 32125344)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2856 (class 1259 OID 32125655)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2838 (class 1259 OID 32125580)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 32125581)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2785 (class 1259 OID 32125294)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2702 (class 1259 OID 32125081)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 32124755)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2916 (class 2606 OID 32125878)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2915 (class 2606 OID 32125883)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2910 (class 2606 OID 32125908)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2912 (class 2606 OID 32125898)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2917 (class 2606 OID 32125873)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2913 (class 2606 OID 32125893)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2911 (class 2606 OID 32125903)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2914 (class 2606 OID 32125888)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2953 (class 2606 OID 32126078)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2952 (class 2606 OID 32126083)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2951 (class 2606 OID 32126088)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2985 (class 2606 OID 32126253)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2986 (class 2606 OID 32126248)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 32125763)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2888 (class 2606 OID 32125768)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2934 (class 2606 OID 32125993)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2980 (class 2606 OID 32126233)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 32126228)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 32126238)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 32126223)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2983 (class 2606 OID 32126218)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2932 (class 2606 OID 32125988)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2933 (class 2606 OID 32125983)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2909 (class 2606 OID 32125863)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2908 (class 2606 OID 32125868)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 32126033)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2942 (class 2606 OID 32126043)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2943 (class 2606 OID 32126038)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2898 (class 2606 OID 32125818)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 32125813)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2930 (class 2606 OID 32125973)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 32126208)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2956 (class 2606 OID 32126093)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 32126098)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2954 (class 2606 OID 32126103)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2984 (class 2606 OID 32126243)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2958 (class 2606 OID 32126123)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2961 (class 2606 OID 32126108)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2957 (class 2606 OID 32126128)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2959 (class 2606 OID 32126118)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2960 (class 2606 OID 32126113)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2896 (class 2606 OID 32125808)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 32125803)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2884 (class 2606 OID 32125748)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2885 (class 2606 OID 32125743)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 32126013)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2881 (class 2606 OID 32125723)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2880 (class 2606 OID 32125728)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2939 (class 2606 OID 32126028)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2940 (class 2606 OID 32126023)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2941 (class 2606 OID 32126018)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2891 (class 2606 OID 32125778)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2892 (class 2606 OID 32125773)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2890 (class 2606 OID 32125783)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2902 (class 2606 OID 32125843)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 32125833)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2903 (class 2606 OID 32125838)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2877 (class 2606 OID 32125708)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2922 (class 2606 OID 32125948)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2924 (class 2606 OID 32125938)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2925 (class 2606 OID 32125933)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2923 (class 2606 OID 32125943)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2879 (class 2606 OID 32125713)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 32125718)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2935 (class 2606 OID 32125998)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2989 (class 2606 OID 32126268)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2949 (class 2606 OID 32126073)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 32126068)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2991 (class 2606 OID 32126273)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2990 (class 2606 OID 32126278)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2931 (class 2606 OID 32125978)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2948 (class 2606 OID 32126058)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2947 (class 2606 OID 32126063)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2968 (class 2606 OID 32126183)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2969 (class 2606 OID 32126178)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 32126163)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2971 (class 2606 OID 32126168)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2970 (class 2606 OID 32126173)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2894 (class 2606 OID 32125793)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 32125788)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2893 (class 2606 OID 32125798)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 32126008)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2937 (class 2606 OID 32126003)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 32126193)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2974 (class 2606 OID 32126198)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32126153)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2964 (class 2606 OID 32126158)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2967 (class 2606 OID 32126143)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2966 (class 2606 OID 32126148)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2946 (class 2606 OID 32126048)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 32126053)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2926 (class 2606 OID 32125968)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2927 (class 2606 OID 32125963)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2929 (class 2606 OID 32125953)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2928 (class 2606 OID 32125958)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2962 (class 2606 OID 32126138)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 32126133)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2900 (class 2606 OID 32125823)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2901 (class 2606 OID 32125828)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2907 (class 2606 OID 32125858)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2906 (class 2606 OID 32125848)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2905 (class 2606 OID 32125853)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2973 (class 2606 OID 32126188)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2976 (class 2606 OID 32126203)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 32126213)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 32126258)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2987 (class 2606 OID 32126263)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2882 (class 2606 OID 32125738)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2883 (class 2606 OID 32125733)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2887 (class 2606 OID 32125753)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 32125758)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 32125913)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 32125928)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 32125923)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2921 (class 2606 OID 32125918)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-14 14:58:42 CET

--
-- PostgreSQL database dump complete
--

