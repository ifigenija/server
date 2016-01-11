--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-11 16:57:34 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 255 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 255
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 35052926)
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
-- TOC entry 239 (class 1259 OID 35053554)
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
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 238 (class 1259 OID 35053537)
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
-- TOC entry 182 (class 1259 OID 35052919)
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
-- TOC entry 181 (class 1259 OID 35052917)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 229 (class 1259 OID 35053414)
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
-- TOC entry 232 (class 1259 OID 35053444)
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
-- TOC entry 253 (class 1259 OID 35053857)
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
-- TOC entry 210 (class 1259 OID 35053249)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    tipdodatka_id uuid,
    trajanje integer,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 35053174)
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
-- TOC entry 205 (class 1259 OID 35053206)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 35053211)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 35053779)
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
-- TOC entry 194 (class 1259 OID 35053071)
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
-- TOC entry 240 (class 1259 OID 35053567)
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
-- TOC entry 225 (class 1259 OID 35053371)
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
-- TOC entry 200 (class 1259 OID 35053145)
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
-- TOC entry 197 (class 1259 OID 35053111)
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
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 35053088)
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
-- TOC entry 214 (class 1259 OID 35053285)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 251 (class 1259 OID 35053837)
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
-- TOC entry 252 (class 1259 OID 35053850)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 35053872)
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
-- TOC entry 170 (class 1259 OID 34548309)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 35053310)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 35053045)
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
-- TOC entry 185 (class 1259 OID 35052945)
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
-- TOC entry 189 (class 1259 OID 35053012)
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
-- TOC entry 186 (class 1259 OID 35052956)
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
-- TOC entry 178 (class 1259 OID 35052891)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 35052910)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 35053317)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 35053351)
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
-- TOC entry 235 (class 1259 OID 35053485)
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
-- TOC entry 188 (class 1259 OID 35052992)
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
-- TOC entry 191 (class 1259 OID 35053037)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 35053723)
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
-- TOC entry 215 (class 1259 OID 35053291)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 35053022)
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
-- TOC entry 202 (class 1259 OID 35053166)
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
-- TOC entry 198 (class 1259 OID 35053126)
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
-- TOC entry 199 (class 1259 OID 35053138)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 35053303)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 35053737)
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
-- TOC entry 244 (class 1259 OID 35053747)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 241 (class 1259 OID 35053636)
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
-- TOC entry 245 (class 1259 OID 35053755)
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
-- TOC entry 221 (class 1259 OID 35053332)
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
-- TOC entry 213 (class 1259 OID 35053276)
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
-- TOC entry 212 (class 1259 OID 35053266)
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
-- TOC entry 234 (class 1259 OID 35053474)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 35053404)
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
-- TOC entry 196 (class 1259 OID 35053100)
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
-- TOC entry 175 (class 1259 OID 35052862)
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
-- TOC entry 174 (class 1259 OID 35052860)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 222 (class 1259 OID 35053345)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 35052900)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 35052884)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 35053359)
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
-- TOC entry 216 (class 1259 OID 35053297)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 35053226)
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
-- TOC entry 173 (class 1259 OID 35052849)
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
-- TOC entry 172 (class 1259 OID 35052841)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 35052836)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 230 (class 1259 OID 35053421)
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
-- TOC entry 187 (class 1259 OID 35052984)
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
-- TOC entry 209 (class 1259 OID 35053236)
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
-- TOC entry 211 (class 1259 OID 35053256)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 233 (class 1259 OID 35053462)
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
-- TOC entry 184 (class 1259 OID 35052935)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 246 (class 1259 OID 35053767)
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
-- TOC entry 207 (class 1259 OID 35053216)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 35053057)
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
-- TOC entry 176 (class 1259 OID 35052871)
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
-- TOC entry 237 (class 1259 OID 35053512)
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
-- TOC entry 201 (class 1259 OID 35053156)
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
-- TOC entry 220 (class 1259 OID 35053324)
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
-- TOC entry 231 (class 1259 OID 35053435)
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
-- TOC entry 249 (class 1259 OID 35053817)
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
-- TOC entry 248 (class 1259 OID 35053786)
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
-- TOC entry 250 (class 1259 OID 35053829)
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
-- TOC entry 227 (class 1259 OID 35053397)
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
-- TOC entry 204 (class 1259 OID 35053200)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 236 (class 1259 OID 35053502)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 226 (class 1259 OID 35053387)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2250 (class 2604 OID 35052922)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 35052865)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3135 (class 0 OID 35052926)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5693-d0eb-8bd7-7a35919a90a4	10	30	Otroci	Abonma za otroke	200
000a0000-5693-d0eb-61c3-fac46dd3ffbd	20	60	Mladina	Abonma za mladino	400
000a0000-5693-d0eb-eba9-fd7b01c8ecea	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3191 (class 0 OID 35053554)
-- Dependencies: 239
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5693-d0eb-49b0-9190bba15bf5	000d0000-5693-d0eb-7797-fd751550f905	\N	00090000-5693-d0eb-4cfe-4e0ed0e0f5c7	000b0000-5693-d0eb-10dc-1505b0e27ac2	0001	f	\N	\N	\N	3	t	t	t
000c0000-5693-d0eb-e7dd-d0f439cfcdeb	000d0000-5693-d0eb-0fa8-a35d6aa2f7f0	00100000-5693-d0eb-66cd-27b1371fe6ab	00090000-5693-d0eb-0aae-1fb1a4f5c75a	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5693-d0eb-b870-402925f21521	000d0000-5693-d0eb-7579-12995bbac14f	00100000-5693-d0eb-1d41-e9c2bf456e4a	00090000-5693-d0eb-3e04-13a7671e256d	\N	0003	t	\N	2016-01-11	\N	2	t	f	f
000c0000-5693-d0eb-1282-61eee87d653d	000d0000-5693-d0eb-0e96-8429f6b26a38	\N	00090000-5693-d0eb-07b4-5850984db8eb	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5693-d0eb-744d-a93fc97d67d0	000d0000-5693-d0eb-2c43-37c44c3a0101	\N	00090000-5693-d0eb-1fda-e5c6b6b0dd7f	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5693-d0eb-2afe-85b5f8a0f7a9	000d0000-5693-d0eb-24ec-54c3fae15b09	\N	00090000-5693-d0eb-437e-e51413ec9d61	000b0000-5693-d0eb-425c-56ee590983c9	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5693-d0eb-f4e1-a94550ee6743	000d0000-5693-d0eb-7674-d92868046b3d	00100000-5693-d0eb-ae37-53ee81a7148b	00090000-5693-d0eb-8a7b-5c0f133a9123	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5693-d0eb-0f9e-42fcbb3bf3ae	000d0000-5693-d0eb-b585-68107e37629d	\N	00090000-5693-d0eb-10de-67bba0477509	000b0000-5693-d0eb-063e-894fac7e2b5c	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5693-d0eb-03a8-f9c90f5ab5c4	000d0000-5693-d0eb-7674-d92868046b3d	00100000-5693-d0eb-917c-ae8aab369183	00090000-5693-d0eb-8b97-d143747b90a5	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	f	t
000c0000-5693-d0eb-698d-911c2fb8d946	000d0000-5693-d0eb-7674-d92868046b3d	00100000-5693-d0eb-74a7-307114a8333f	00090000-5693-d0eb-0816-5257930aa271	\N	0010	t	\N	2016-01-11	\N	16	f	f	t
000c0000-5693-d0eb-1b95-70ae762785fa	000d0000-5693-d0eb-7674-d92868046b3d	00100000-5693-d0eb-eede-a4199e9548d1	00090000-5693-d0eb-40a0-a50ffee4ce69	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5693-d0eb-511f-f9c657c42656	000d0000-5693-d0eb-da04-9e2db2767853	00100000-5693-d0eb-66cd-27b1371fe6ab	00090000-5693-d0eb-0aae-1fb1a4f5c75a	000b0000-5693-d0eb-39b8-edb4ae4334cf	0012	t	\N	\N	\N	2	t	t	t
000c0000-5693-d0eb-95ab-29cb0c613d05	000d0000-5693-d0eb-c167-b78842080bb5	\N	00090000-5693-d0eb-10de-67bba0477509	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5693-d0eb-c36e-39f19e7485dc	000d0000-5693-d0eb-c167-b78842080bb5	\N	00090000-5693-d0eb-e06b-7719c9a8637e	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5693-d0eb-ed22-a96d693a8fd4	000d0000-5693-d0eb-ec98-ede46790afc8	00100000-5693-d0eb-1d41-e9c2bf456e4a	00090000-5693-d0eb-3e04-13a7671e256d	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5693-d0eb-0175-f84e1feed698	000d0000-5693-d0eb-ec98-ede46790afc8	\N	00090000-5693-d0eb-e06b-7719c9a8637e	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5693-d0eb-43c4-0572a4832af2	000d0000-5693-d0eb-5af9-be7f4f3ccdee	\N	00090000-5693-d0eb-e06b-7719c9a8637e	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5693-d0eb-ff30-c9b3f4cd64f1	000d0000-5693-d0eb-5af9-be7f4f3ccdee	\N	00090000-5693-d0eb-10de-67bba0477509	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5693-d0eb-4b99-4990d957359e	000d0000-5693-d0eb-3c9d-b70e9e1ba978	00100000-5693-d0eb-ae37-53ee81a7148b	00090000-5693-d0eb-8a7b-5c0f133a9123	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5693-d0eb-f62f-685bdf4881b2	000d0000-5693-d0eb-3c9d-b70e9e1ba978	\N	00090000-5693-d0eb-e06b-7719c9a8637e	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5693-d0eb-56ba-f226972f63fd	000d0000-5693-d0eb-d88e-5a06970ad68b	\N	00090000-5693-d0eb-e06b-7719c9a8637e	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5693-d0eb-e269-24f8056ab313	000d0000-5693-d0eb-d88e-5a06970ad68b	00100000-5693-d0eb-ae37-53ee81a7148b	00090000-5693-d0eb-8a7b-5c0f133a9123	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5693-d0eb-7204-3756b238bafb	000d0000-5693-d0eb-07eb-b309244ff9ff	\N	00090000-5693-d0eb-e06b-7719c9a8637e	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5693-d0eb-0cbc-dc32bad28a20	000d0000-5693-d0eb-8880-ccdf494ccf0e	\N	00090000-5693-d0eb-10de-67bba0477509	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5693-d0eb-1b9a-1de690f8aeae	000d0000-5693-d0eb-11d9-22eab29f077a	\N	00090000-5693-d0eb-10de-67bba0477509	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5693-d0eb-c1bd-28f864902110	000d0000-5693-d0eb-11d9-22eab29f077a	00100000-5693-d0eb-1d41-e9c2bf456e4a	00090000-5693-d0eb-3e04-13a7671e256d	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5693-d0eb-626f-7348f0d94596	000d0000-5693-d0eb-db05-1036c6c46919	\N	00090000-5693-d0eb-ea9d-986df7233cc2	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5693-d0eb-5ab9-8fb87db28f2a	000d0000-5693-d0eb-db05-1036c6c46919	\N	00090000-5693-d0eb-7698-be4b1261d918	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5693-d0eb-be78-941f50371ef5	000d0000-5693-d0eb-17bd-65111125e6a0	\N	00090000-5693-d0eb-10de-67bba0477509	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5693-d0eb-d7b5-580c2fdf4aba	000d0000-5693-d0eb-17bd-65111125e6a0	00100000-5693-d0eb-1d41-e9c2bf456e4a	00090000-5693-d0eb-3e04-13a7671e256d	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5693-d0eb-7fbd-ad2ebd479e8f	000d0000-5693-d0eb-17bd-65111125e6a0	\N	00090000-5693-d0eb-7698-be4b1261d918	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5693-d0eb-b24d-9eaad3b90d7b	000d0000-5693-d0eb-17bd-65111125e6a0	\N	00090000-5693-d0eb-ea9d-986df7233cc2	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5693-d0eb-2e55-077e73c1f291	000d0000-5693-d0eb-7ac5-f43d06cf6f76	\N	00090000-5693-d0eb-10de-67bba0477509	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5693-d0eb-8928-ba41b370bb6d	000d0000-5693-d0eb-cee2-11a170e745b4	00100000-5693-d0eb-1d41-e9c2bf456e4a	00090000-5693-d0eb-3e04-13a7671e256d	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5693-d0eb-c075-744960461c36	000d0000-5693-d0eb-cee2-11a170e745b4	\N	00090000-5693-d0eb-e06b-7719c9a8637e	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3190 (class 0 OID 35053537)
-- Dependencies: 238
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 35052919)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3181 (class 0 OID 35053414)
-- Dependencies: 229
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5693-d0eb-f666-3ad66eb1066b	00160000-5693-d0ea-47d6-6dfa122beba4	00090000-5693-d0eb-7698-be4b1261d918	aizv	10	t
003d0000-5693-d0eb-8c04-72ac2fb36fc7	00160000-5693-d0ea-47d6-6dfa122beba4	00090000-5693-d0eb-be75-c2556541edcc	apri	14	t
003d0000-5693-d0eb-3a70-99f63d6f1a0f	00160000-5693-d0ea-4553-48cc389f0272	00090000-5693-d0eb-ea9d-986df7233cc2	aizv	11	t
003d0000-5693-d0eb-5474-46c37d2f7a8b	00160000-5693-d0ea-64d2-9cdcdfa9004c	00090000-5693-d0eb-4010-ff9b407eedf8	aizv	12	t
003d0000-5693-d0eb-ebe2-d1cb2f3431d8	00160000-5693-d0ea-47d6-6dfa122beba4	00090000-5693-d0eb-e06b-7719c9a8637e	apri	18	f
\.


--
-- TOC entry 3184 (class 0 OID 35053444)
-- Dependencies: 232
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5693-d0ea-47d6-6dfa122beba4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5693-d0ea-4553-48cc389f0272	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5693-d0ea-64d2-9cdcdfa9004c	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3205 (class 0 OID 35053857)
-- Dependencies: 253
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 35053249)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, tipdodatka_id, trajanje, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 35053174)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5693-d0eb-12e2-4249860e1d66	\N	\N	00200000-5693-d0eb-d923-bb734e8df1f3	\N	\N	\N	00220000-5693-d0ea-ffe0-66e41343ff55	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5693-d0eb-7071-5e123e31950e	\N	\N	00200000-5693-d0eb-31e5-3d33a9dbff7a	\N	\N	\N	00220000-5693-d0ea-ffe0-66e41343ff55	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5693-d0eb-708f-9efac839d163	\N	\N	00200000-5693-d0eb-6b3a-41e5fe80b6f7	\N	\N	\N	00220000-5693-d0ea-43e6-1e7b17306d7e	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5693-d0eb-6c2e-d683399c0055	\N	\N	00200000-5693-d0eb-64cb-c424fa503271	\N	\N	\N	00220000-5693-d0ea-f3d5-67fd2edd9d8c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5693-d0eb-fcec-fcef326803f0	\N	\N	00200000-5693-d0eb-6753-3af957a0fb83	\N	\N	\N	00220000-5693-d0ea-a83a-ca70b0ba9219	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3157 (class 0 OID 35053206)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 35053211)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 35053779)
-- Dependencies: 247
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 35053071)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5693-d0e7-db98-9d79274d512f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5693-d0e7-0694-094b4c030abb	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5693-d0e7-1723-4c503e8f9242	AL	ALB	008	Albania 	Albanija	\N
00040000-5693-d0e7-301f-11cc8e6f8755	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5693-d0e7-dd4b-82433894fdef	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5693-d0e7-bad7-3b40c5c72c4e	AD	AND	020	Andorra 	Andora	\N
00040000-5693-d0e7-274b-af5cbd65ecdc	AO	AGO	024	Angola 	Angola	\N
00040000-5693-d0e7-99c2-24ad99d6ba4c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5693-d0e7-497a-1105304b20ab	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5693-d0e7-80b2-e7823574bf0a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5693-d0e7-20a4-0787f2848612	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5693-d0e7-9dd0-03f75cbaac4d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5693-d0e7-26ec-6c407f3a44dc	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5693-d0e7-2aad-04a754e4394d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5693-d0e7-c760-e1e626281a28	AT	AUT	040	Austria 	Avstrija	\N
00040000-5693-d0e7-1ade-08a10c8df8e5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5693-d0e7-7bf3-2a69ea2b1cd0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5693-d0e7-2474-4fa803824d4a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5693-d0e7-e4f2-d3009000797a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5693-d0e7-4f4d-4e1123a24619	BB	BRB	052	Barbados 	Barbados	\N
00040000-5693-d0e7-ebea-b2cf468706a4	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5693-d0e7-3f16-045d3d812588	BE	BEL	056	Belgium 	Belgija	\N
00040000-5693-d0e7-4057-33bc5f49040d	BZ	BLZ	084	Belize 	Belize	\N
00040000-5693-d0e7-71e3-91dab37cc2e3	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5693-d0e7-099b-926bc5b221e7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5693-d0e7-c7a9-bc95fb1379d8	BT	BTN	064	Bhutan 	Butan	\N
00040000-5693-d0e7-7804-2376a9125524	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5693-d0e7-3b3e-0305947883ab	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5693-d0e7-6c7c-1f356318582a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5693-d0e7-d7a2-a27cb50ce8a6	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5693-d0e7-c318-f27c843955d7	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5693-d0e7-b4b3-26c9384f47cc	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5693-d0e7-fa2e-4a76cad5e632	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5693-d0e7-9978-3bfaa628cb07	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5693-d0e7-3a27-9f4a8b86b981	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5693-d0e7-72ee-4440d06cad3e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5693-d0e7-5646-bc775ff54609	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5693-d0e7-b714-23057ad5da32	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5693-d0e7-dda4-d7cc3bad470c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5693-d0e7-7a5f-c122a5351779	CA	CAN	124	Canada 	Kanada	\N
00040000-5693-d0e7-74aa-fa837491a6f1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5693-d0e7-cdd5-1f2fcf4e6e1d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5693-d0e7-b9e3-3c860ad64c6f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5693-d0e7-f371-542dac06aa20	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5693-d0e7-e457-0c6406effa9f	CL	CHL	152	Chile 	Čile	\N
00040000-5693-d0e7-28d5-5e89587cd2b8	CN	CHN	156	China 	Kitajska	\N
00040000-5693-d0e7-9e0a-61cadb965218	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5693-d0e7-4ef2-82be4ea9bc08	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5693-d0e7-999d-c08531fab295	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5693-d0e7-b9fb-d8050177ee8c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5693-d0e7-f07f-d5dc300e4066	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5693-d0e7-b7d8-b4eeef3f1d76	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5693-d0e7-8364-8f4ac4fe5a7b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5693-d0e7-47c3-f0fde19d6962	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5693-d0e7-4686-85760521c2fc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5693-d0e7-c156-e15064b3bb36	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5693-d0e7-0797-1622749acc1f	CU	CUB	192	Cuba 	Kuba	\N
00040000-5693-d0e7-e038-dba726400251	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5693-d0e7-e663-f757c6282528	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5693-d0e7-62c8-0dd8ef7efe00	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5693-d0e7-f178-1ca65a6bcf88	DK	DNK	208	Denmark 	Danska	\N
00040000-5693-d0e7-8f00-c789a547a350	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5693-d0e7-582d-29da2d2baf1e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5693-d0e7-b484-34fe71733567	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5693-d0e7-3116-540b1726beb7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5693-d0e7-567e-ce2727b2ed1f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5693-d0e7-8f14-9194e1b7cd7f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5693-d0e7-3511-d8a05abf9440	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5693-d0e7-e1a2-22a47c8ca6b2	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5693-d0e7-f79a-99f47ee4ce23	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5693-d0e7-b7a6-2d7e2891db34	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5693-d0e7-0a47-0c07380d534f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5693-d0e7-dc2e-2da395a43003	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5693-d0e7-1def-267a50971e75	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5693-d0e7-efc7-0a4760128025	FI	FIN	246	Finland 	Finska	\N
00040000-5693-d0e7-0df1-ef78abd44153	FR	FRA	250	France 	Francija	\N
00040000-5693-d0e7-b38e-5b9f75afccdd	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5693-d0e7-ec5f-e5901d788ec9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5693-d0e7-dc4f-1e053a167907	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5693-d0e7-5f39-bced15fb0f09	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5693-d0e7-5372-0a0832484358	GA	GAB	266	Gabon 	Gabon	\N
00040000-5693-d0e7-2986-7f9eb45281f9	GM	GMB	270	Gambia 	Gambija	\N
00040000-5693-d0e7-da99-18e39d0ed7b3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5693-d0e7-cda4-53b0ec68cbba	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5693-d0e7-b377-9ab6c6d4f2b1	GH	GHA	288	Ghana 	Gana	\N
00040000-5693-d0e7-306f-70a74001eea1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5693-d0e7-ffd9-a10e205d6173	GR	GRC	300	Greece 	Grčija	\N
00040000-5693-d0e7-4b9e-459d47467963	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5693-d0e7-2557-7c6fa732a945	GD	GRD	308	Grenada 	Grenada	\N
00040000-5693-d0e7-9bbd-b14caf42307c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5693-d0e7-d500-95170c1979aa	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5693-d0e7-19b0-11f67be39a05	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5693-d0e7-2a56-1bd4a132ba34	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5693-d0e7-3def-717adc9b8c27	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5693-d0e7-79c1-c3fa6d426d3c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5693-d0e7-8354-2413d5d6f45e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5693-d0e7-698d-b1f2a199855f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5693-d0e7-e5b8-768edb953b83	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5693-d0e7-79a2-3999030ea9c8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5693-d0e7-6971-30826b6ded4b	HN	HND	340	Honduras 	Honduras	\N
00040000-5693-d0e7-3b24-fa8a1565dd25	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5693-d0e7-a5b1-9d1fa8a88fc4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5693-d0e7-dda4-774a387201c3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5693-d0e7-18e1-8fbd11a2b29e	IN	IND	356	India 	Indija	\N
00040000-5693-d0e7-9fc3-0faa339b3954	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5693-d0e7-f09c-6387c3195145	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5693-d0e7-150e-763ecb98a589	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5693-d0e7-b7c9-a72d636ff67d	IE	IRL	372	Ireland 	Irska	\N
00040000-5693-d0e7-db8b-b593862f383b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5693-d0e7-533f-5b709e920371	IL	ISR	376	Israel 	Izrael	\N
00040000-5693-d0e7-ec46-12cf86c88635	IT	ITA	380	Italy 	Italija	\N
00040000-5693-d0e7-650f-181295c0e4df	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5693-d0e7-bf74-e0d1ed949a5b	JP	JPN	392	Japan 	Japonska	\N
00040000-5693-d0e7-a0f6-03397f5f7caf	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5693-d0e7-75bd-03da90c89159	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5693-d0e7-b8c8-c6945756c88d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5693-d0e7-4abf-45dd71ce36a8	KE	KEN	404	Kenya 	Kenija	\N
00040000-5693-d0e7-28a5-bc602aff4bb5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5693-d0e7-1a97-881e13c14fc1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5693-d0e7-abfe-650102ef225a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5693-d0e7-30ce-57bd22dd2a64	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5693-d0e7-6844-9f65d9ea9f87	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5693-d0e7-9e78-a50da1b3f551	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5693-d0e7-dafe-acd1981e425f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5693-d0e7-a5d7-53d21f4de6ca	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5693-d0e7-5013-d065f1490223	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5693-d0e7-8db8-e7e6b37f516e	LR	LBR	430	Liberia 	Liberija	\N
00040000-5693-d0e7-6ee5-78daf18882d0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5693-d0e7-8ce2-f6e583c31661	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5693-d0e7-b139-b180e2f3e888	LT	LTU	440	Lithuania 	Litva	\N
00040000-5693-d0e7-0eae-1eeb115769ab	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5693-d0e7-dccb-9a1b43e88c4f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5693-d0e7-975c-9e7e75b48490	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5693-d0e7-8753-c7ef576a3066	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5693-d0e7-57e4-428a8bf99f0a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5693-d0e7-f0f3-51d65efc286d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5693-d0e7-8f36-6f83a632d63d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5693-d0e7-96d9-594b4ec73a3e	ML	MLI	466	Mali 	Mali	\N
00040000-5693-d0e7-6f19-f982ef2913d6	MT	MLT	470	Malta 	Malta	\N
00040000-5693-d0e7-ab38-afb029e7b433	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5693-d0e7-2cfc-2a6f9c3b3d1d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5693-d0e7-8042-3289c756600a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5693-d0e7-fd6c-0e847bd9bd09	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5693-d0e7-c7b9-cc8d0a9afca0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5693-d0e7-174f-f5c67f31f453	MX	MEX	484	Mexico 	Mehika	\N
00040000-5693-d0e7-4abe-e7d7e2bd21a0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5693-d0e7-04d5-4fd38764a4e1	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5693-d0e7-9f67-fe9adb0beb80	MC	MCO	492	Monaco 	Monako	\N
00040000-5693-d0e7-dd80-696c153894d5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5693-d0e7-c72c-29eff887dd6d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5693-d0e7-34ff-0e3b9e8a0d1d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5693-d0e7-7958-1f87f02713a2	MA	MAR	504	Morocco 	Maroko	\N
00040000-5693-d0e7-252f-fb922c219bd8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5693-d0e7-a16d-8ccb364ecffa	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5693-d0e7-7113-d0cc89c49c30	NA	NAM	516	Namibia 	Namibija	\N
00040000-5693-d0e7-93b8-4fbfed77acb2	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5693-d0e7-9eff-4d3cc9e2550b	NP	NPL	524	Nepal 	Nepal	\N
00040000-5693-d0e7-c5a5-a24229cccf08	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5693-d0e7-0b0f-748d2e09cb48	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5693-d0e7-0a8e-30884cc5ec5e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5693-d0e7-b721-5978f4c5fe2c	NE	NER	562	Niger 	Niger 	\N
00040000-5693-d0e7-c67c-2bb9028632f4	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5693-d0e7-8641-fe3dcf3c4f51	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5693-d0e7-257b-6d4fa39d4ef3	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5693-d0e7-fe91-c6e3985855d6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5693-d0e7-1754-f448b5adb8e3	NO	NOR	578	Norway 	Norveška	\N
00040000-5693-d0e7-8b1a-07cbbde3e5b9	OM	OMN	512	Oman 	Oman	\N
00040000-5693-d0e7-3a49-2ed567353eb6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5693-d0e7-af3f-d2f8eac47bb2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5693-d0e7-7a4a-e895cf0f1e2b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5693-d0e7-77fd-ec66a947a98c	PA	PAN	591	Panama 	Panama	\N
00040000-5693-d0e7-f45b-2a74db7d97c6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5693-d0e7-391b-df4aed6d53c3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5693-d0e7-4091-5fd156c137c6	PE	PER	604	Peru 	Peru	\N
00040000-5693-d0e7-cbca-0dbb978af0bc	PH	PHL	608	Philippines 	Filipini	\N
00040000-5693-d0e7-518b-5e6d35912b0d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5693-d0e7-5eb6-b81e98e2bb0c	PL	POL	616	Poland 	Poljska	\N
00040000-5693-d0e7-1e78-14f6d1140d64	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5693-d0e7-724e-19814ef6e798	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5693-d0e7-c84b-9c4e1a86db35	QA	QAT	634	Qatar 	Katar	\N
00040000-5693-d0e7-7302-90577325c3a0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5693-d0e7-0540-0a5843c6c37f	RO	ROU	642	Romania 	Romunija	\N
00040000-5693-d0e7-4468-57c83025b5f7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5693-d0e7-ca97-8f2983c95a65	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5693-d0e7-09cb-43ec5d2ace1e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5693-d0e7-7ad3-187616838f1f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5693-d0e7-46c9-2c177effb1c0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5693-d0e7-0b3e-550faa32c95c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5693-d0e7-8e3f-e86a856f92d8	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5693-d0e7-2758-9f3ec3d3f8c3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5693-d0e7-8533-8f2aa4155d82	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5693-d0e7-6864-9e4d0f20eb3e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5693-d0e7-dac9-67636d794c77	SM	SMR	674	San Marino 	San Marino	\N
00040000-5693-d0e7-b9d0-1e7b1b517835	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5693-d0e7-45ba-9fc6f2092a01	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5693-d0e7-9921-34e4738b0f06	SN	SEN	686	Senegal 	Senegal	\N
00040000-5693-d0e7-884d-d99178487eab	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5693-d0e7-6500-76340bcda0e3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5693-d0e7-4041-eb59efe8b0e8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5693-d0e7-2160-476b170f5b97	SG	SGP	702	Singapore 	Singapur	\N
00040000-5693-d0e7-e812-5f681a15929f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5693-d0e7-ced2-a03985d38238	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5693-d0e7-41a7-25afd6bee612	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5693-d0e7-7261-c50af9ca8c0f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5693-d0e7-8849-e418bb05b048	SO	SOM	706	Somalia 	Somalija	\N
00040000-5693-d0e7-97ba-a56a6b0f64b5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5693-d0e7-d606-14d275757b26	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5693-d0e7-9d50-b5c4f8f54b37	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5693-d0e7-d80c-b3213cc3aed6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5693-d0e7-219a-bac165539133	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5693-d0e7-6faf-bc5c90d9ce69	SD	SDN	729	Sudan 	Sudan	\N
00040000-5693-d0e7-54b7-d58d5c5bea45	SR	SUR	740	Suriname 	Surinam	\N
00040000-5693-d0e7-b00b-f666255b52e5	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5693-d0e7-0a49-700a8d68ee22	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5693-d0e7-fd9a-8131f53cb1a5	SE	SWE	752	Sweden 	Švedska	\N
00040000-5693-d0e7-3168-51cb5a25fbe1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5693-d0e7-ca8a-b55e6508dd17	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5693-d0e7-4c47-26abd3b39a00	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5693-d0e7-95f8-b43655997ee3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5693-d0e7-1f15-94c461f193c5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5693-d0e7-0357-d877589e21ac	TH	THA	764	Thailand 	Tajska	\N
00040000-5693-d0e7-c716-c61fd5445cc1	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5693-d0e7-20b2-647852240ee6	TG	TGO	768	Togo 	Togo	\N
00040000-5693-d0e7-30da-8477546d590b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5693-d0e7-a026-b08c6357e29b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5693-d0e7-698e-cb376b584e9a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5693-d0e7-76e1-6c49fa95353c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5693-d0e7-ca27-546bc8dd5b22	TR	TUR	792	Turkey 	Turčija	\N
00040000-5693-d0e7-db1b-04b5e21084bb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5693-d0e7-805d-ad0659c7bbf0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5693-d0e7-1986-0b8c4d67c8d2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5693-d0e7-277f-a04ca3ed5fbc	UG	UGA	800	Uganda 	Uganda	\N
00040000-5693-d0e7-6950-86c4ed4231be	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5693-d0e7-3875-2254c8815d19	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5693-d0e7-e5ae-abfe4571e16a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5693-d0e7-9822-26e79284f7f4	US	USA	840	United States 	Združene države Amerike	\N
00040000-5693-d0e7-1ae3-91a5690b22a9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5693-d0e7-bf33-5189ef266565	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5693-d0e7-ad46-6085aae17f69	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5693-d0e7-c0d3-94ae9661ee0e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5693-d0e7-fe39-14bd4b4ebc1b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5693-d0e7-1d01-be9c1603f449	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5693-d0e7-53d6-60414ec12fc1	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5693-d0e7-005f-6a991cf495e1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5693-d0e7-ddcd-c87caf572995	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5693-d0e7-13f0-4648c501a87d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5693-d0e7-fd80-65ea69122771	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5693-d0e7-6826-821998235e0a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5693-d0e7-0d33-9372a24c0a2d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3192 (class 0 OID 35053567)
-- Dependencies: 240
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5693-d0eb-810a-679c75ea05f6	000e0000-5693-d0eb-8aec-13a6cc03a444	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5693-d0e7-1b55-d3a83358d85b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5693-d0eb-c714-0b1f49a8db62	000e0000-5693-d0eb-f842-409b98971a43	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5693-d0e7-a11c-5de74b7d67ef	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5693-d0eb-fded-26bfa223f411	000e0000-5693-d0eb-7797-a8d1bb345995	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5693-d0e7-1b55-d3a83358d85b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5693-d0eb-0ab8-ee5c0b278517	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5693-d0eb-83e8-a3c583d77d43	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3177 (class 0 OID 35053371)
-- Dependencies: 225
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5693-d0eb-cefe-fa8bbcfe8d7a	000e0000-5693-d0eb-7ced-3ba1abd90388	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	0	000f0000-5693-d0e7-0f19-860d0e4b4e73
000d0000-5693-d0eb-8307-e939e26789ab	000e0000-5693-d0eb-7ced-3ba1abd90388	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	0	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-7797-fd751550f905	000e0000-5693-d0eb-f842-409b98971a43	000c0000-5693-d0eb-49b0-9190bba15bf5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5693-d0e7-0f19-860d0e4b4e73
000d0000-5693-d0eb-0fa8-a35d6aa2f7f0	000e0000-5693-d0eb-f842-409b98971a43	000c0000-5693-d0eb-e7dd-d0f439cfcdeb	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-7579-12995bbac14f	000e0000-5693-d0eb-f842-409b98971a43	000c0000-5693-d0eb-b870-402925f21521	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5693-d0e7-6107-7c2a0e0294a3
000d0000-5693-d0eb-0e96-8429f6b26a38	000e0000-5693-d0eb-f842-409b98971a43	000c0000-5693-d0eb-1282-61eee87d653d	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5693-d0e7-179d-42f7585d5589
000d0000-5693-d0eb-2c43-37c44c3a0101	000e0000-5693-d0eb-f842-409b98971a43	000c0000-5693-d0eb-744d-a93fc97d67d0	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5693-d0e7-179d-42f7585d5589
000d0000-5693-d0eb-24ec-54c3fae15b09	000e0000-5693-d0eb-f842-409b98971a43	000c0000-5693-d0eb-2afe-85b5f8a0f7a9	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5693-d0e7-0f19-860d0e4b4e73
000d0000-5693-d0eb-7674-d92868046b3d	000e0000-5693-d0eb-f842-409b98971a43	000c0000-5693-d0eb-03a8-f9c90f5ab5c4	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5693-d0e7-0f19-860d0e4b4e73
000d0000-5693-d0eb-b585-68107e37629d	000e0000-5693-d0eb-f842-409b98971a43	000c0000-5693-d0eb-0f9e-42fcbb3bf3ae	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5693-d0e7-c7de-8770d9b88595
000d0000-5693-d0eb-da04-9e2db2767853	000e0000-5693-d0eb-f842-409b98971a43	000c0000-5693-d0eb-511f-f9c657c42656	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5693-d0e7-9417-f9af04761c97
000d0000-5693-d0eb-c167-b78842080bb5	000e0000-5693-d0eb-6ced-130e182ecc57	000c0000-5693-d0eb-95ab-29cb0c613d05	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	2	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-ec98-ede46790afc8	000e0000-5693-d0eb-4255-5d3185d245ea	000c0000-5693-d0eb-ed22-a96d693a8fd4	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	2	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-5af9-be7f4f3ccdee	000e0000-5693-d0eb-4255-5d3185d245ea	000c0000-5693-d0eb-43c4-0572a4832af2	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	2	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-3c9d-b70e9e1ba978	000e0000-5693-d0eb-0509-7815f4fe6583	000c0000-5693-d0eb-4b99-4990d957359e	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	2	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-d88e-5a06970ad68b	000e0000-5693-d0eb-8634-c8cb5e429512	000c0000-5693-d0eb-56ba-f226972f63fd	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	2	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-07eb-b309244ff9ff	000e0000-5693-d0eb-88fc-8d75c282a9ca	000c0000-5693-d0eb-7204-3756b238bafb	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	1	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-8880-ccdf494ccf0e	000e0000-5693-d0eb-3e8b-a9ea00b0d182	000c0000-5693-d0eb-0cbc-dc32bad28a20	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	1	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-11d9-22eab29f077a	000e0000-5693-d0eb-4e9d-ecb524d03e16	000c0000-5693-d0eb-1b9a-1de690f8aeae	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	2	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-db05-1036c6c46919	000e0000-5693-d0eb-0b00-5b589dcb4f20	000c0000-5693-d0eb-626f-7348f0d94596	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	2	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-17bd-65111125e6a0	000e0000-5693-d0eb-0b00-5b589dcb4f20	000c0000-5693-d0eb-be78-941f50371ef5	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	4	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-7ac5-f43d06cf6f76	000e0000-5693-d0eb-26ca-9e57b527097c	000c0000-5693-d0eb-2e55-077e73c1f291	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	1	000f0000-5693-d0e7-662c-9d991f48b04c
000d0000-5693-d0eb-cee2-11a170e745b4	000e0000-5693-d0eb-26ca-9e57b527097c	000c0000-5693-d0eb-8928-ba41b370bb6d	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	2	000f0000-5693-d0e7-662c-9d991f48b04c
\.


--
-- TOC entry 3152 (class 0 OID 35053145)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 35053111)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 35053088)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5693-d0eb-8898-f45b14c1ae75	00080000-5693-d0eb-3d72-42802596c3b1	00090000-5693-d0eb-0816-5257930aa271	AK		igralka
\.


--
-- TOC entry 3166 (class 0 OID 35053285)
-- Dependencies: 214
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 35053837)
-- Dependencies: 251
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5693-d0eb-0451-86b0fc0d0530	00010000-5693-d0e9-a252-33433cf36bc3	\N	Prva mapa	Root mapa	2016-01-11 16:57:31	2016-01-11 16:57:31	R	\N	\N
\.


--
-- TOC entry 3204 (class 0 OID 35053850)
-- Dependencies: 252
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 35053872)
-- Dependencies: 254
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 34548309)
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
20151229153831
\.


--
-- TOC entry 3170 (class 0 OID 35053310)
-- Dependencies: 218
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 35053045)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5693-d0e9-905e-386a8bdec407	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5693-d0e9-480a-e06a3e8b84dd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5693-d0e9-0244-3d9297c95915	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5693-d0e9-7418-72f16ad5daa8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5693-d0e9-5631-a3a446b423b3	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5693-d0e9-7e7b-0cd361303b43	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5693-d0e9-674a-bdc56a7ce10b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5693-d0e9-da62-2ad10e04a002	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5693-d0e9-c814-2599077d0c02	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5693-d0e9-f09a-015aefafa141	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5693-d0e9-3bd0-9db6455b3d56	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5693-d0e9-aec5-85afbd46ef7e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5693-d0e9-7038-9bbf8acccc6e	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5693-d0e9-1739-4af82630174f	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5693-d0ea-ab79-fce244e670f7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5693-d0ea-c3a7-9717a69a8b34	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5693-d0ea-535b-3bb75a52db7e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5693-d0ea-6080-e550c56325de	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5693-d0ea-caa8-6361a0ce60bf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5693-d0ed-ddf0-aa45167791c3	application.tenant.maticnopodjetje	string	s:36:"00080000-5693-d0ed-56e9-b61899877ea0";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3137 (class 0 OID 35052945)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5693-d0ea-6d09-7251c2707b73	00000000-5693-d0ea-ab79-fce244e670f7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5693-d0ea-5d44-601896f8bf5d	00000000-5693-d0ea-ab79-fce244e670f7	00010000-5693-d0e9-a252-33433cf36bc3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5693-d0ea-bb06-0d6510c14eb2	00000000-5693-d0ea-c3a7-9717a69a8b34	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3141 (class 0 OID 35053012)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5693-d0eb-1614-7045ca343861	\N	00100000-5693-d0eb-66cd-27b1371fe6ab	00100000-5693-d0eb-1d41-e9c2bf456e4a	01	Gledališče Nimbis
00410000-5693-d0eb-c79d-63b08267cacf	00410000-5693-d0eb-1614-7045ca343861	00100000-5693-d0eb-66cd-27b1371fe6ab	00100000-5693-d0eb-1d41-e9c2bf456e4a	02	Tehnika
\.


--
-- TOC entry 3138 (class 0 OID 35052956)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5693-d0eb-4cfe-4e0ed0e0f5c7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5693-d0eb-07b4-5850984db8eb	00010000-5693-d0eb-0d67-e38505965005	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5693-d0eb-3e04-13a7671e256d	00010000-5693-d0eb-bb12-376b049ad59b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5693-d0eb-8b97-d143747b90a5	00010000-5693-d0eb-750c-9a252ae15e8a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5693-d0eb-7a38-fe213103c7b3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5693-d0eb-437e-e51413ec9d61	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5693-d0eb-40a0-a50ffee4ce69	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5693-d0eb-8a7b-5c0f133a9123	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5693-d0eb-0816-5257930aa271	00010000-5693-d0eb-7f90-8ad137c98817	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5693-d0eb-0aae-1fb1a4f5c75a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5693-d0eb-dfff-c6fdfd60a4fa	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5693-d0eb-1fda-e5c6b6b0dd7f	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5693-d0eb-10de-67bba0477509	00010000-5693-d0eb-2345-2a1a189bc380	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5693-d0eb-7698-be4b1261d918	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-d0eb-be75-c2556541edcc	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-d0eb-ea9d-986df7233cc2	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-d0eb-4010-ff9b407eedf8	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5693-d0eb-e06b-7719c9a8637e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5693-d0eb-d0b1-32b0d56119c7	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-d0eb-d28f-2510e3c774fe	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5693-d0eb-4c7d-ad7521691744	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3130 (class 0 OID 35052891)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5693-d0e8-bc7d-639d18dc50a2	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5693-d0e8-793d-3d9d8f08380c	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5693-d0e8-d43d-3e4e9c84c5b6	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5693-d0e8-b1f9-85c98a30c18b	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5693-d0e8-2a08-70d921a4b8dc	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5693-d0e8-a725-9c5766a41fe8	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5693-d0e8-a84e-2823fa62ccc0	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5693-d0e8-4eee-6e9c52177ade	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5693-d0e8-77fa-f403f713adc9	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5693-d0e8-0f63-1e2b3a3fb86f	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5693-d0e8-0655-d24522e318e1	Abonma-read	Abonma - branje	t
00030000-5693-d0e8-e927-e6b1543369df	Abonma-write	Abonma - spreminjanje	t
00030000-5693-d0e8-1529-8d3c08653709	Alternacija-read	Alternacija - branje	t
00030000-5693-d0e8-8a93-f1028d7b3494	Alternacija-write	Alternacija - spreminjanje	t
00030000-5693-d0e8-334c-c5af4b449c94	Arhivalija-read	Arhivalija - branje	t
00030000-5693-d0e8-4c3b-3b7f51397446	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5693-d0e8-677b-7243cfbab36a	AuthStorage-read	AuthStorage - branje	t
00030000-5693-d0e8-d35b-0b265e5f304c	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5693-d0e8-2430-a9dc5280114b	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5693-d0e8-0cdf-c483701f643e	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5693-d0e8-c3e1-9f5e119c9b3a	Besedilo-read	Besedilo - branje	t
00030000-5693-d0e8-cdfb-e47acf0656a8	Besedilo-write	Besedilo - spreminjanje	t
00030000-5693-d0e8-b058-e345ce56757b	Dodatek-read	Dodatek - branje	t
00030000-5693-d0e8-990c-9cb74829247d	Dodatek-write	Dodatek - spreminjanje	t
00030000-5693-d0e8-9dc4-de28f704ead2	Dogodek-read	Dogodek - branje	t
00030000-5693-d0e8-f1a9-25e21ca0216e	Dogodek-write	Dogodek - spreminjanje	t
00030000-5693-d0e8-0c60-8f41365a9ff5	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5693-d0e8-8bb0-ccdb75578b6e	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5693-d0e8-9ac9-8c695c4e4437	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5693-d0e8-39fa-d70fe1ceecf9	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5693-d0e8-e636-205699a58131	DogodekTrait-read	DogodekTrait - branje	t
00030000-5693-d0e8-7114-d49f44a68448	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5693-d0e8-74c1-2a82c82b38b3	DrugiVir-read	DrugiVir - branje	t
00030000-5693-d0e8-38ed-925fa5ef09b2	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5693-d0e8-8c20-55db83a9237f	Drzava-read	Drzava - branje	t
00030000-5693-d0e8-0839-9d7bc222466a	Drzava-write	Drzava - spreminjanje	t
00030000-5693-d0e8-7fe3-ccdf876f3aa6	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5693-d0e8-017c-04253a2987d0	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5693-d0e8-b6ec-30033fb76b2e	Funkcija-read	Funkcija - branje	t
00030000-5693-d0e8-7752-70990fce31aa	Funkcija-write	Funkcija - spreminjanje	t
00030000-5693-d0e8-b595-ec3b636e6f09	Gostovanje-read	Gostovanje - branje	t
00030000-5693-d0e8-e094-884c54b3b88a	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5693-d0e8-33e9-418a20ed0006	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5693-d0e8-eb5f-126617d102f1	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5693-d0e8-681f-a089c6dd254a	Kupec-read	Kupec - branje	t
00030000-5693-d0e8-e678-4cb30dd0e59e	Kupec-write	Kupec - spreminjanje	t
00030000-5693-d0e8-730a-608d56086446	NacinPlacina-read	NacinPlacina - branje	t
00030000-5693-d0e8-4198-b5669c3f9479	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5693-d0e8-ac9b-87215a0cec5d	Option-read	Option - branje	t
00030000-5693-d0e8-7474-44273a69192e	Option-write	Option - spreminjanje	t
00030000-5693-d0e8-5a47-a774768bf050	OptionValue-read	OptionValue - branje	t
00030000-5693-d0e8-1a81-ab041bf9db64	OptionValue-write	OptionValue - spreminjanje	t
00030000-5693-d0e8-71d5-30f15079c9ac	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5693-d0e8-166a-80d380f4fb1d	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5693-d0e8-7dda-3ab168c35a86	Oseba-read	Oseba - branje	t
00030000-5693-d0e8-f085-527b2f0a6488	Oseba-write	Oseba - spreminjanje	t
00030000-5693-d0e8-b3a0-cc9678928b90	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5693-d0e8-dce2-f81470999095	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5693-d0e8-0210-4988c9f99134	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5693-d0e8-4098-ac6b65423587	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5693-d0e8-a875-813fce1e207c	Pogodba-read	Pogodba - branje	t
00030000-5693-d0e8-663c-48e8397a88a7	Pogodba-write	Pogodba - spreminjanje	t
00030000-5693-d0e8-7119-76402f0f5f5e	Popa-read	Popa - branje	t
00030000-5693-d0e8-d39c-3d1eb656025e	Popa-write	Popa - spreminjanje	t
00030000-5693-d0e8-71be-64c5ff90a9ac	Posta-read	Posta - branje	t
00030000-5693-d0e8-6bf0-020d8410f04e	Posta-write	Posta - spreminjanje	t
00030000-5693-d0e8-c56b-00e06d85fa56	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5693-d0e8-ccb9-f049744e4ca5	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5693-d0e8-a7d2-c2c3739a7cf6	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5693-d0e8-4f60-06712e0ca3d7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5693-d0e8-4396-7cdae89e9699	PostniNaslov-read	PostniNaslov - branje	t
00030000-5693-d0e8-9ea6-6dd138e74b7b	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5693-d0e8-06eb-21bd207e3ca9	Praznik-read	Praznik - branje	t
00030000-5693-d0e8-2d51-73551d85f1fb	Praznik-write	Praznik - spreminjanje	t
00030000-5693-d0e8-8870-18b2999f876c	Predstava-read	Predstava - branje	t
00030000-5693-d0e8-bd18-8206ab75abe4	Predstava-write	Predstava - spreminjanje	t
00030000-5693-d0e8-5f9e-d9b1d6d4c630	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5693-d0e8-8233-a9e626fd41d4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5693-d0e8-b8d5-654f5f0b7c2a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5693-d0e8-7231-65b13b9bc26b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5693-d0e8-ceb0-216484e1d9a4	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5693-d0e8-48ab-763d3f7ecfaa	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5693-d0e8-d558-3afaebef3a87	ProgramDela-read	ProgramDela - branje	t
00030000-5693-d0e8-bded-edc12f62624f	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5693-d0e8-877e-3639fc46d54a	ProgramFestival-read	ProgramFestival - branje	t
00030000-5693-d0e8-ba19-80e971366de7	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5693-d0e8-0073-f19f9c58c5d6	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5693-d0e8-62e3-6d3e70f48707	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5693-d0e8-583b-5448f0e022ea	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5693-d0e8-7a6b-27e9362ea7c1	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5693-d0e8-1cd6-269852bf792e	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5693-d0e8-fe5b-50efbfcb7acf	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5693-d0e8-67b0-6c16cc1f1a10	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5693-d0e8-c018-975b773bcec5	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5693-d0e8-1498-18a84b47e57a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5693-d0e8-d21d-c5af6427c869	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5693-d0e8-65a0-56512d7643fd	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5693-d0e8-b26b-979d86460660	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5693-d0e8-6788-69c3ebc5180b	ProgramRazno-read	ProgramRazno - branje	t
00030000-5693-d0e8-6353-36977396a91c	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5693-d0e8-3a44-3d94e6a0ab2b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5693-d0e8-1834-ec8fbd694de4	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5693-d0e8-fc96-f5dd7ba84063	Prostor-read	Prostor - branje	t
00030000-5693-d0e8-c039-f656efbbef17	Prostor-write	Prostor - spreminjanje	t
00030000-5693-d0e8-6c44-468ff657711c	Racun-read	Racun - branje	t
00030000-5693-d0e8-3179-16bf44e12732	Racun-write	Racun - spreminjanje	t
00030000-5693-d0e8-577f-843873693a0d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5693-d0e8-dfb9-ff7e3fd505b3	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5693-d0e8-f71e-9c6e43812163	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5693-d0e8-326c-4800d3e5324b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5693-d0e8-5b53-fa92f12c3e14	Rekvizit-read	Rekvizit - branje	t
00030000-5693-d0e8-fa78-8ac348272639	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5693-d0e8-eb39-67f7ee39f318	Revizija-read	Revizija - branje	t
00030000-5693-d0e8-9d6c-77602a9fb0c4	Revizija-write	Revizija - spreminjanje	t
00030000-5693-d0e8-c2ea-ce601acaa5e8	Rezervacija-read	Rezervacija - branje	t
00030000-5693-d0e8-e8b1-f646b4bab437	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5693-d0e8-7259-c5e9feac26d8	SedezniRed-read	SedezniRed - branje	t
00030000-5693-d0e8-b37d-40b59156340c	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5693-d0e8-15df-fa4979d37fdc	Sedez-read	Sedez - branje	t
00030000-5693-d0e8-cf5e-fffb5983ce5d	Sedez-write	Sedez - spreminjanje	t
00030000-5693-d0e8-c0de-3c1088ec9ae7	Sezona-read	Sezona - branje	t
00030000-5693-d0e8-e7bf-816332775695	Sezona-write	Sezona - spreminjanje	t
00030000-5693-d0e8-10c6-73993ef3f5dd	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5693-d0e8-a601-d8056e1ce7ab	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5693-d0e8-eccc-4755c8172c71	Telefonska-read	Telefonska - branje	t
00030000-5693-d0e8-f788-e4a961945f5a	Telefonska-write	Telefonska - spreminjanje	t
00030000-5693-d0e8-1280-db3555b71c9a	TerminStoritve-read	TerminStoritve - branje	t
00030000-5693-d0e8-0343-8f01f852932b	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5693-d0e8-beb4-79a50f918c53	TipDodatka-read	TipDodatka - branje	t
00030000-5693-d0e8-7718-9e124e94d29d	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5693-d0e8-39d3-e2cb2d4c63e2	TipFunkcije-read	TipFunkcije - branje	t
00030000-5693-d0e8-680d-0990f359a07b	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5693-d0e8-65f9-e508b00c9f6c	TipPopa-read	TipPopa - branje	t
00030000-5693-d0e8-0052-f34f303f5d17	TipPopa-write	TipPopa - spreminjanje	t
00030000-5693-d0e8-ecda-e451e9334f9c	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5693-d0e8-36bc-c2578638c5f5	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5693-d0e8-5db3-ba474954e217	TipVaje-read	TipVaje - branje	t
00030000-5693-d0e8-d3ef-47bd97cd6c0b	TipVaje-write	TipVaje - spreminjanje	t
00030000-5693-d0e8-3e9b-af902ebc9ba3	Trr-read	Trr - branje	t
00030000-5693-d0e8-e18a-4aa601146078	Trr-write	Trr - spreminjanje	t
00030000-5693-d0e8-1cb5-4da667937655	Uprizoritev-read	Uprizoritev - branje	t
00030000-5693-d0e8-0668-7163abb31da7	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5693-d0e8-f76b-5a5347f4dd03	Vaja-read	Vaja - branje	t
00030000-5693-d0e8-ab34-302da5c3e8b2	Vaja-write	Vaja - spreminjanje	t
00030000-5693-d0e8-6f7f-7a369422fdfc	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5693-d0e8-3c38-51a67e8a5fad	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5693-d0e8-f3a9-e3e3473d427b	VrstaStroska-read	VrstaStroska - branje	t
00030000-5693-d0e8-8a53-4b2b1949ec00	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5693-d0e8-3722-5dfa70e678d3	Zaposlitev-read	Zaposlitev - branje	t
00030000-5693-d0e8-c7b4-05fe8a40d4b4	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5693-d0e8-f0a7-03687bc75f11	Zasedenost-read	Zasedenost - branje	t
00030000-5693-d0e8-fb48-a88c5ae60d5b	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5693-d0e8-7324-29f791b27d4d	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5693-d0e8-aca3-ab141819af95	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5693-d0e8-f8c2-a6b1b4dcae65	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5693-d0e8-0a46-d7dc366458fe	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5693-d0e8-4ac0-405a79bd9462	Job-read	Branje opravil - samo zase - branje	t
00030000-5693-d0e8-dca4-4cc42d951dd4	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5693-d0e8-8aca-cb5e2641bbd2	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5693-d0e8-9bb6-2b6984c1e846	Report-read	Report - branje	t
00030000-5693-d0e8-229e-3a4c1babe951	Report-write	Report - spreminjanje	t
00030000-5693-d0e8-e49a-4a4704a557bf	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5693-d0e8-ff2a-54a9f4e56788	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5693-d0e8-6b89-35873c4a67b9	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5693-d0e8-a6b8-190678ffe0f5	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5693-d0e8-00cd-6b3a1dc0e996	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5693-d0e8-cc16-4dcdccc15aa5	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5693-d0e8-5d8e-e6fb9fd40a96	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5693-d0e8-af70-158a00edddb5	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5693-d0e8-0bdf-9c7bcff9e52a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5693-d0e8-7c62-6a0bc7456ae0	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5693-d0e8-18ef-f5a361b7876d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5693-d0e8-0f88-ccb5a70dc758	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5693-d0e8-0588-f893175fbb2d	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5693-d0e8-abdf-10f144b662c5	Datoteka-write	Datoteka - spreminjanje	t
00030000-5693-d0e8-b642-a272bda61d8c	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3132 (class 0 OID 35052910)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5693-d0e8-14fb-27d8d9f0400c	00030000-5693-d0e8-793d-3d9d8f08380c
00020000-5693-d0e8-14fb-27d8d9f0400c	00030000-5693-d0e8-bc7d-639d18dc50a2
00020000-5693-d0e8-764e-f214d1b38d0d	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-0cdf-c483701f643e
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-cdfb-e47acf0656a8
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-2430-a9dc5280114b
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-1f9f-71566878a07f	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-ba28-ba6e8d0bef09	00030000-5693-d0e8-2430-a9dc5280114b
00020000-5693-d0e8-ba28-ba6e8d0bef09	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-ba28-ba6e8d0bef09	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-ba28-ba6e8d0bef09	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-ba28-ba6e8d0bef09	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-ba28-ba6e8d0bef09	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-491d-451e06ef1b7b	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-491d-451e06ef1b7b	00030000-5693-d0e8-c7b4-05fe8a40d4b4
00020000-5693-d0e8-491d-451e06ef1b7b	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-491d-451e06ef1b7b	00030000-5693-d0e8-2a08-70d921a4b8dc
00020000-5693-d0e8-491d-451e06ef1b7b	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-491d-451e06ef1b7b	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-491d-451e06ef1b7b	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-2b50-1019e859be6e	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-2b50-1019e859be6e	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-2b50-1019e859be6e	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-0705-8774fbe59d1a	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-0705-8774fbe59d1a	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-0705-8774fbe59d1a	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-0705-8774fbe59d1a	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-0705-8774fbe59d1a	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-0705-8774fbe59d1a	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-0705-8774fbe59d1a	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-0705-8774fbe59d1a	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-ae69-d07b26fe91cb	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-ae69-d07b26fe91cb	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-ae69-d07b26fe91cb	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-ae69-d07b26fe91cb	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-2a08-70d921a4b8dc
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-e18a-4aa601146078
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-9ea6-6dd138e74b7b
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-f788-e4a961945f5a
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-57a6-001600ed0afc	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-bfef-a442a0fba142	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-bfef-a442a0fba142	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-bfef-a442a0fba142	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-bfef-a442a0fba142	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-bfef-a442a0fba142	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-bfef-a442a0fba142	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-bfef-a442a0fba142	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-f788-e4a961945f5a
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-9ea6-6dd138e74b7b
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-e18a-4aa601146078
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-d39c-3d1eb656025e
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-eb5f-126617d102f1
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-48ab-763d3f7ecfaa
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-2848-1f252d6346a7	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-e703-c661c2a79a6b	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-320d-8dc171d2b14a	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-320d-8dc171d2b14a	00030000-5693-d0e8-0052-f34f303f5d17
00020000-5693-d0e8-f7dc-78247df25253	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-b052-c24b0077a828	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0e8-b052-c24b0077a828	00030000-5693-d0e8-6bf0-020d8410f04e
00020000-5693-d0e8-0119-a6238b1fcfb5	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0e8-630a-0325f152ba44	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-630a-0325f152ba44	00030000-5693-d0e8-0839-9d7bc222466a
00020000-5693-d0e8-09d8-85dab0e6977b	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-398f-6ac0f5828902	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0e8-398f-6ac0f5828902	00030000-5693-d0e8-0a46-d7dc366458fe
00020000-5693-d0e8-398d-406277cc5a5b	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0e8-4cf5-6e2524fba1cf	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0e8-4cf5-6e2524fba1cf	00030000-5693-d0e8-aca3-ab141819af95
00020000-5693-d0e8-262d-8eae9b3af8fe	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0e8-74f4-160392cb124b	00030000-5693-d0e8-0655-d24522e318e1
00020000-5693-d0e8-74f4-160392cb124b	00030000-5693-d0e8-e927-e6b1543369df
00020000-5693-d0e8-a412-781c3c19ddff	00030000-5693-d0e8-0655-d24522e318e1
00020000-5693-d0e8-c8cd-e5256d4b5e61	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0e8-c8cd-e5256d4b5e61	00030000-5693-d0e8-c039-f656efbbef17
00020000-5693-d0e8-c8cd-e5256d4b5e61	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-c8cd-e5256d4b5e61	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-c8cd-e5256d4b5e61	00030000-5693-d0e8-9ea6-6dd138e74b7b
00020000-5693-d0e8-c8cd-e5256d4b5e61	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-3180-71bf3c9e4099	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0e8-3180-71bf3c9e4099	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-3180-71bf3c9e4099	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-35b7-603cc6f7f902	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-35b7-603cc6f7f902	00030000-5693-d0e8-8a53-4b2b1949ec00
00020000-5693-d0e8-3bd9-2e0c75ef2e14	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-9f0d-56b67c30b0eb	00030000-5693-d0e8-166a-80d380f4fb1d
00020000-5693-d0e8-9f0d-56b67c30b0eb	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-9f0d-56b67c30b0eb	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-9f0d-56b67c30b0eb	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-9f0d-56b67c30b0eb	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-9f0d-56b67c30b0eb	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-9f0d-56b67c30b0eb	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-9f0d-56b67c30b0eb	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-9f0d-56b67c30b0eb	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-1f60-917f310a31e6	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-1f60-917f310a31e6	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-1f60-917f310a31e6	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-1f60-917f310a31e6	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-1f60-917f310a31e6	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-a900-ce9962394652	00030000-5693-d0e8-5db3-ba474954e217
00020000-5693-d0e8-a900-ce9962394652	00030000-5693-d0e8-d3ef-47bd97cd6c0b
00020000-5693-d0e8-312d-51ad3f961fee	00030000-5693-d0e8-5db3-ba474954e217
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-a84e-2823fa62ccc0
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-4eee-6e9c52177ade
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-d558-3afaebef3a87
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-bded-edc12f62624f
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-877e-3639fc46d54a
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-ba19-80e971366de7
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-0073-f19f9c58c5d6
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-62e3-6d3e70f48707
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-583b-5448f0e022ea
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-7a6b-27e9362ea7c1
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-1cd6-269852bf792e
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-fe5b-50efbfcb7acf
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-67b0-6c16cc1f1a10
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-c018-975b773bcec5
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-1498-18a84b47e57a
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-d21d-c5af6427c869
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-65a0-56512d7643fd
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-b26b-979d86460660
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-6788-69c3ebc5180b
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-6353-36977396a91c
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-3a44-3d94e6a0ab2b
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-1834-ec8fbd694de4
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-7231-65b13b9bc26b
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-38ed-925fa5ef09b2
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-ccb9-f049744e4ca5
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-dca4-4cc42d951dd4
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-74c1-2a82c82b38b3
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-b8d5-654f5f0b7c2a
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-c56b-00e06d85fa56
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-4ac0-405a79bd9462
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-1ba4-762b29e17b40	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-d558-3afaebef3a87
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-877e-3639fc46d54a
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-0073-f19f9c58c5d6
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-583b-5448f0e022ea
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-1cd6-269852bf792e
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-67b0-6c16cc1f1a10
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-1498-18a84b47e57a
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-65a0-56512d7643fd
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-6788-69c3ebc5180b
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-3a44-3d94e6a0ab2b
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-b8d5-654f5f0b7c2a
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-74c1-2a82c82b38b3
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-c56b-00e06d85fa56
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-4ac0-405a79bd9462
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-e47e-1bc23fa534a2	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-0668-7163abb31da7
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-77fa-f403f713adc9
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-7752-70990fce31aa
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-0f63-1e2b3a3fb86f
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-2870-e42d121f915c	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-6803-4d45187048f7	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-a9de-02e0cf924b90	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-a9de-02e0cf924b90	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0e8-a9de-02e0cf924b90	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-a9de-02e0cf924b90	00030000-5693-d0e8-7752-70990fce31aa
00020000-5693-d0e8-a9de-02e0cf924b90	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-a9de-02e0cf924b90	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-a9de-02e0cf924b90	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-a9de-02e0cf924b90	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-77fa-f403f713adc9
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-2a08-70d921a4b8dc
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-663c-48e8397a88a7
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-a601-d8056e1ce7ab
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-db25-70c359d832ea	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-1757-1ee700992cbb	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-3728-734cf215ca96	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-3728-734cf215ca96	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-3728-734cf215ca96	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-3728-734cf215ca96	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0e8-3728-734cf215ca96	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-3728-734cf215ca96	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-3728-734cf215ca96	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-6621-0a337d2523f2	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-6621-0a337d2523f2	00030000-5693-d0e8-a601-d8056e1ce7ab
00020000-5693-d0e8-6621-0a337d2523f2	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-6621-0a337d2523f2	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-62aa-3126c6a6a871	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-62aa-3126c6a6a871	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-0655-d24522e318e1
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-77fa-f403f713adc9
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-2430-a9dc5280114b
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-0cdf-c483701f643e
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-cdfb-e47acf0656a8
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-74c1-2a82c82b38b3
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-38ed-925fa5ef09b2
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-7752-70990fce31aa
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-0f63-1e2b3a3fb86f
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-4ac0-405a79bd9462
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-dca4-4cc42d951dd4
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-2a08-70d921a4b8dc
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-663c-48e8397a88a7
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-c56b-00e06d85fa56
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-ccb9-f049744e4ca5
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-b8d5-654f5f0b7c2a
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-7231-65b13b9bc26b
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-a84e-2823fa62ccc0
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-d558-3afaebef3a87
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-4eee-6e9c52177ade
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-bded-edc12f62624f
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-877e-3639fc46d54a
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-ba19-80e971366de7
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-0073-f19f9c58c5d6
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-62e3-6d3e70f48707
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-583b-5448f0e022ea
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-7a6b-27e9362ea7c1
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-1cd6-269852bf792e
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-fe5b-50efbfcb7acf
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-67b0-6c16cc1f1a10
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-c018-975b773bcec5
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-1498-18a84b47e57a
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-d21d-c5af6427c869
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-65a0-56512d7643fd
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-b26b-979d86460660
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-6788-69c3ebc5180b
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-6353-36977396a91c
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-3a44-3d94e6a0ab2b
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-1834-ec8fbd694de4
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-a601-d8056e1ce7ab
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-5db3-ba474954e217
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-0668-7163abb31da7
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0e8-a53d-446a5e896001	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-0655-d24522e318e1
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-2430-a9dc5280114b
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-0cdf-c483701f643e
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-cdfb-e47acf0656a8
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-5db3-ba474954e217
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0e8-c4c1-ab6913973ea4	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-0655-d24522e318e1
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-77fa-f403f713adc9
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-2430-a9dc5280114b
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-0cdf-c483701f643e
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-cdfb-e47acf0656a8
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-7752-70990fce31aa
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-0f63-1e2b3a3fb86f
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-5db3-ba474954e217
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-0668-7163abb31da7
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0e8-2f63-e242c21dd0f3	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-77fa-f403f713adc9
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-2430-a9dc5280114b
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-0cdf-c483701f643e
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-cdfb-e47acf0656a8
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-74c1-2a82c82b38b3
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-38ed-925fa5ef09b2
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-7752-70990fce31aa
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-0f63-1e2b3a3fb86f
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-4ac0-405a79bd9462
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-dca4-4cc42d951dd4
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-eb5f-126617d102f1
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-2a08-70d921a4b8dc
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-663c-48e8397a88a7
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-d39c-3d1eb656025e
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-c56b-00e06d85fa56
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-ccb9-f049744e4ca5
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-9ea6-6dd138e74b7b
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-b8d5-654f5f0b7c2a
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-7231-65b13b9bc26b
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-48ab-763d3f7ecfaa
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-a84e-2823fa62ccc0
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-d558-3afaebef3a87
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-4eee-6e9c52177ade
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-bded-edc12f62624f
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-877e-3639fc46d54a
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-ba19-80e971366de7
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-0073-f19f9c58c5d6
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-62e3-6d3e70f48707
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-583b-5448f0e022ea
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-7a6b-27e9362ea7c1
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-1cd6-269852bf792e
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-fe5b-50efbfcb7acf
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-67b0-6c16cc1f1a10
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-c018-975b773bcec5
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-1498-18a84b47e57a
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-d21d-c5af6427c869
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-65a0-56512d7643fd
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-b26b-979d86460660
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-6788-69c3ebc5180b
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-6353-36977396a91c
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-3a44-3d94e6a0ab2b
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-1834-ec8fbd694de4
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-a601-d8056e1ce7ab
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-f788-e4a961945f5a
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-e18a-4aa601146078
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-0668-7163abb31da7
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-c7b4-05fe8a40d4b4
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0e8-c687-23d21ef146cb	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-0655-d24522e318e1
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-77fa-f403f713adc9
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-2430-a9dc5280114b
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-0cdf-c483701f643e
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-cdfb-e47acf0656a8
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-7752-70990fce31aa
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-0f63-1e2b3a3fb86f
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-eb5f-126617d102f1
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-2a08-70d921a4b8dc
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-d39c-3d1eb656025e
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-9ea6-6dd138e74b7b
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-48ab-763d3f7ecfaa
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-f788-e4a961945f5a
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-5db3-ba474954e217
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-e18a-4aa601146078
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-0668-7163abb31da7
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-c7b4-05fe8a40d4b4
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0e8-373a-6ff1a843727c	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-0655-d24522e318e1
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-2430-a9dc5280114b
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-7752-70990fce31aa
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-5db3-ba474954e217
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0e8-d4ed-264c7092e34e	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-0655-d24522e318e1
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-77fa-f403f713adc9
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-74c1-2a82c82b38b3
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-38ed-925fa5ef09b2
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-4ac0-405a79bd9462
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-dca4-4cc42d951dd4
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-eb5f-126617d102f1
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-166a-80d380f4fb1d
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-2a08-70d921a4b8dc
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-663c-48e8397a88a7
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-d39c-3d1eb656025e
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-c56b-00e06d85fa56
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-ccb9-f049744e4ca5
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-9ea6-6dd138e74b7b
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-b8d5-654f5f0b7c2a
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-7231-65b13b9bc26b
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-48ab-763d3f7ecfaa
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-a84e-2823fa62ccc0
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-d558-3afaebef3a87
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-4eee-6e9c52177ade
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-bded-edc12f62624f
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-877e-3639fc46d54a
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-ba19-80e971366de7
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-0073-f19f9c58c5d6
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-62e3-6d3e70f48707
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-583b-5448f0e022ea
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-7a6b-27e9362ea7c1
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-1cd6-269852bf792e
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-fe5b-50efbfcb7acf
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-67b0-6c16cc1f1a10
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-c018-975b773bcec5
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-1498-18a84b47e57a
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-d21d-c5af6427c869
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-65a0-56512d7643fd
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-b26b-979d86460660
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-6788-69c3ebc5180b
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-6353-36977396a91c
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-3a44-3d94e6a0ab2b
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-1834-ec8fbd694de4
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-a601-d8056e1ce7ab
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-f788-e4a961945f5a
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-5db3-ba474954e217
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-e18a-4aa601146078
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-8a53-4b2b1949ec00
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-c7b4-05fe8a40d4b4
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0e8-d596-a1d8dc0b86a6	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-bc7d-639d18dc50a2
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-793d-3d9d8f08380c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0655-d24522e318e1
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-e927-e6b1543369df
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-77fa-f403f713adc9
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-334c-c5af4b449c94
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-4c3b-3b7f51397446
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-677b-7243cfbab36a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-d35b-0b265e5f304c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-2430-a9dc5280114b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0cdf-c483701f643e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-c3e1-9f5e119c9b3a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-cdfb-e47acf0656a8
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-9dc4-de28f704ead2
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-b1f9-85c98a30c18b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0c60-8f41365a9ff5
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-8bb0-ccdb75578b6e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-9ac9-8c695c4e4437
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-39fa-d70fe1ceecf9
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-e636-205699a58131
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7114-d49f44a68448
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-f1a9-25e21ca0216e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-74c1-2a82c82b38b3
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-38ed-925fa5ef09b2
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-8c20-55db83a9237f
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0839-9d7bc222466a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7fe3-ccdf876f3aa6
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-017c-04253a2987d0
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0f63-1e2b3a3fb86f
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7752-70990fce31aa
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-b595-ec3b636e6f09
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-e094-884c54b3b88a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-8aca-cb5e2641bbd2
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-4ac0-405a79bd9462
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-dca4-4cc42d951dd4
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-33e9-418a20ed0006
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-eb5f-126617d102f1
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-681f-a089c6dd254a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-e678-4cb30dd0e59e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-5d8e-e6fb9fd40a96
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-cc16-4dcdccc15aa5
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-ff2a-54a9f4e56788
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-6b89-35873c4a67b9
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-a6b8-190678ffe0f5
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-00cd-6b3a1dc0e996
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-730a-608d56086446
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-4198-b5669c3f9479
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-ac9b-87215a0cec5d
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-5a47-a774768bf050
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-1a81-ab041bf9db64
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7474-44273a69192e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-71d5-30f15079c9ac
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-166a-80d380f4fb1d
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-2a08-70d921a4b8dc
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-b3a0-cc9678928b90
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-dce2-f81470999095
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0210-4988c9f99134
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-4098-ac6b65423587
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-663c-48e8397a88a7
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-d39c-3d1eb656025e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-71be-64c5ff90a9ac
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-c56b-00e06d85fa56
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-ccb9-f049744e4ca5
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-a7d2-c2c3739a7cf6
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-4f60-06712e0ca3d7
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-6bf0-020d8410f04e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-9ea6-6dd138e74b7b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-06eb-21bd207e3ca9
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-2d51-73551d85f1fb
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-8870-18b2999f876c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-bd18-8206ab75abe4
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-5f9e-d9b1d6d4c630
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-8233-a9e626fd41d4
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-b8d5-654f5f0b7c2a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7231-65b13b9bc26b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-ceb0-216484e1d9a4
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-48ab-763d3f7ecfaa
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-a84e-2823fa62ccc0
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-d558-3afaebef3a87
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-4eee-6e9c52177ade
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-bded-edc12f62624f
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-877e-3639fc46d54a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-ba19-80e971366de7
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0073-f19f9c58c5d6
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-62e3-6d3e70f48707
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-583b-5448f0e022ea
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7a6b-27e9362ea7c1
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-1cd6-269852bf792e
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-fe5b-50efbfcb7acf
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-67b0-6c16cc1f1a10
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-c018-975b773bcec5
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-1498-18a84b47e57a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-d21d-c5af6427c869
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-65a0-56512d7643fd
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-b26b-979d86460660
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-6788-69c3ebc5180b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-6353-36977396a91c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-3a44-3d94e6a0ab2b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-1834-ec8fbd694de4
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-fc96-f5dd7ba84063
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-c039-f656efbbef17
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-6c44-468ff657711c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-3179-16bf44e12732
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-577f-843873693a0d
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-dfb9-ff7e3fd505b3
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-f71e-9c6e43812163
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-326c-4800d3e5324b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-5b53-fa92f12c3e14
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-fa78-8ac348272639
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-9bb6-2b6984c1e846
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-229e-3a4c1babe951
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-eb39-67f7ee39f318
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-9d6c-77602a9fb0c4
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-c2ea-ce601acaa5e8
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-e8b1-f646b4bab437
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7259-c5e9feac26d8
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-b37d-40b59156340c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-15df-fa4979d37fdc
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-cf5e-fffb5983ce5d
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-c0de-3c1088ec9ae7
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-e7bf-816332775695
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-e49a-4a4704a557bf
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-a601-d8056e1ce7ab
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-f788-e4a961945f5a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-1280-db3555b71c9a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-d43d-3e4e9c84c5b6
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0343-8f01f852932b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-39d3-e2cb2d4c63e2
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-680d-0990f359a07b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-65f9-e508b00c9f6c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0052-f34f303f5d17
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-ecda-e451e9334f9c
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-36bc-c2578638c5f5
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-5db3-ba474954e217
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-d3ef-47bd97cd6c0b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-e18a-4aa601146078
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0668-7163abb31da7
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-f76b-5a5347f4dd03
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-ab34-302da5c3e8b2
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-6f7f-7a369422fdfc
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-3c38-51a67e8a5fad
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-f3a9-e3e3473d427b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-8a53-4b2b1949ec00
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0588-f893175fbb2d
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0f88-ccb5a70dc758
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-c7b4-05fe8a40d4b4
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-f0a7-03687bc75f11
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-fb48-a88c5ae60d5b
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-7324-29f791b27d4d
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-aca3-ab141819af95
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-f8c2-a6b1b4dcae65
00020000-5693-d0ea-10e1-a434fbffb950	00030000-5693-d0e8-0a46-d7dc366458fe
00020000-5693-d0ea-bb67-e7b0093c39a1	00030000-5693-d0e8-18ef-f5a361b7876d
00020000-5693-d0ea-b002-df254e83187d	00030000-5693-d0e8-7c62-6a0bc7456ae0
00020000-5693-d0ea-2049-1126dc9137c5	00030000-5693-d0e8-0668-7163abb31da7
00020000-5693-d0ea-9bf7-13f047479569	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0ea-6855-8e7c6213e2ba	00030000-5693-d0e8-6b89-35873c4a67b9
00020000-5693-d0ea-14be-9daffaab36f3	00030000-5693-d0e8-a6b8-190678ffe0f5
00020000-5693-d0ea-1c4b-312f98053ce0	00030000-5693-d0e8-00cd-6b3a1dc0e996
00020000-5693-d0ea-751a-2b92af024ece	00030000-5693-d0e8-ff2a-54a9f4e56788
00020000-5693-d0ea-74c4-73b1c4fbfd15	00030000-5693-d0e8-5d8e-e6fb9fd40a96
00020000-5693-d0ea-561d-c14644478dd3	00030000-5693-d0e8-cc16-4dcdccc15aa5
00020000-5693-d0ea-9b8d-8a3af0fc8d7e	00030000-5693-d0e8-0bdf-9c7bcff9e52a
00020000-5693-d0ea-47f9-e6e27c361fb6	00030000-5693-d0e8-af70-158a00edddb5
00020000-5693-d0ea-ee55-134700794ae6	00030000-5693-d0e8-7dda-3ab168c35a86
00020000-5693-d0ea-b20a-d9080a68d7a1	00030000-5693-d0e8-f085-527b2f0a6488
00020000-5693-d0ea-9228-e095bcc91b74	00030000-5693-d0e8-2a08-70d921a4b8dc
00020000-5693-d0ea-a74c-a736cfc14748	00030000-5693-d0e8-a725-9c5766a41fe8
00020000-5693-d0ea-ab3e-c9920c6340c6	00030000-5693-d0e8-abdf-10f144b662c5
00020000-5693-d0ea-ceb0-bb5a7e046089	00030000-5693-d0e8-b642-a272bda61d8c
00020000-5693-d0ea-1a43-58def7de2e54	00030000-5693-d0e8-7119-76402f0f5f5e
00020000-5693-d0ea-1a43-58def7de2e54	00030000-5693-d0e8-d39c-3d1eb656025e
00020000-5693-d0ea-1a43-58def7de2e54	00030000-5693-d0e8-1cb5-4da667937655
00020000-5693-d0ea-1cf5-176ea13d26c5	00030000-5693-d0e8-3e9b-af902ebc9ba3
00020000-5693-d0ea-02d7-ad0d92d8b6d4	00030000-5693-d0e8-e18a-4aa601146078
00020000-5693-d0ea-de57-85aae31f1e2c	00030000-5693-d0e8-e49a-4a4704a557bf
00020000-5693-d0ea-2381-fba54b71acd5	00030000-5693-d0e8-eccc-4755c8172c71
00020000-5693-d0ea-2d92-4ae933019315	00030000-5693-d0e8-f788-e4a961945f5a
00020000-5693-d0ea-be18-201276d84a48	00030000-5693-d0e8-4396-7cdae89e9699
00020000-5693-d0ea-7279-2f09772d9b3e	00030000-5693-d0e8-9ea6-6dd138e74b7b
00020000-5693-d0ea-411b-2182a71efe50	00030000-5693-d0e8-3722-5dfa70e678d3
00020000-5693-d0ea-925b-ddc7af80765e	00030000-5693-d0e8-c7b4-05fe8a40d4b4
00020000-5693-d0ea-3f13-0c3cdf0f1b18	00030000-5693-d0e8-a875-813fce1e207c
00020000-5693-d0ea-f600-abf1dd68f145	00030000-5693-d0e8-663c-48e8397a88a7
00020000-5693-d0ea-3534-ccb23ad5770b	00030000-5693-d0e8-10c6-73993ef3f5dd
00020000-5693-d0ea-5c9b-53751a3c7cce	00030000-5693-d0e8-a601-d8056e1ce7ab
00020000-5693-d0ea-e59e-32b8a8c86904	00030000-5693-d0e8-1529-8d3c08653709
00020000-5693-d0ea-9cae-109819928454	00030000-5693-d0e8-8a93-f1028d7b3494
00020000-5693-d0ea-9d13-d4ba66bb93f4	00030000-5693-d0e8-77fa-f403f713adc9
00020000-5693-d0ea-66ea-d3de008555c9	00030000-5693-d0e8-b6ec-30033fb76b2e
00020000-5693-d0ea-7988-4f7fdce4d292	00030000-5693-d0e8-7752-70990fce31aa
00020000-5693-d0ea-da69-d231c2d518d2	00030000-5693-d0e8-0f63-1e2b3a3fb86f
\.


--
-- TOC entry 3171 (class 0 OID 35053317)
-- Dependencies: 219
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 35053351)
-- Dependencies: 223
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 35053485)
-- Dependencies: 235
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5693-d0eb-10dc-1505b0e27ac2	00090000-5693-d0eb-4cfe-4e0ed0e0f5c7	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5693-d0eb-425c-56ee590983c9	00090000-5693-d0eb-437e-e51413ec9d61	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5693-d0eb-063e-894fac7e2b5c	00090000-5693-d0eb-10de-67bba0477509	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5693-d0eb-39b8-edb4ae4334cf	00090000-5693-d0eb-0aae-1fb1a4f5c75a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3140 (class 0 OID 35052992)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5693-d0eb-3d72-42802596c3b1	\N	00040000-5693-d0e7-41a7-25afd6bee612	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-d0eb-220e-4b7ab8551e8c	\N	00040000-5693-d0e7-41a7-25afd6bee612	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5693-d0eb-efe0-96a9bb19d5ae	\N	00040000-5693-d0e7-41a7-25afd6bee612	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-d0eb-8565-669bde5b7fd8	\N	00040000-5693-d0e7-41a7-25afd6bee612	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-d0eb-dffd-68e8621bdec5	\N	00040000-5693-d0e7-41a7-25afd6bee612	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-d0eb-5027-16ba8da0d8f4	\N	00040000-5693-d0e7-20a4-0787f2848612	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-d0eb-6e3b-69e908661c22	\N	00040000-5693-d0e7-c156-e15064b3bb36	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-d0eb-bb9d-364e75ebe3cc	\N	00040000-5693-d0e7-c760-e1e626281a28	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-d0eb-d0ae-9656ccd4c337	\N	00040000-5693-d0e7-cda4-53b0ec68cbba	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5693-d0ed-56e9-b61899877ea0	\N	00040000-5693-d0e7-41a7-25afd6bee612	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3143 (class 0 OID 35053037)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5693-d0e7-5ff9-aa3ab2e02e25	8341	Adlešiči
00050000-5693-d0e7-9338-2ddd63e0fbf8	5270	Ajdovščina
00050000-5693-d0e7-57a7-5640d2a294a7	6280	Ankaran/Ancarano
00050000-5693-d0e7-6dd5-fd2a9b101b37	9253	Apače
00050000-5693-d0e7-510d-ce4cc161475d	8253	Artiče
00050000-5693-d0e7-228c-8f5fd1fe6c62	4275	Begunje na Gorenjskem
00050000-5693-d0e7-c0a5-7991c647a04e	1382	Begunje pri Cerknici
00050000-5693-d0e7-0e70-f85da141b355	9231	Beltinci
00050000-5693-d0e7-399c-681b2a816434	2234	Benedikt
00050000-5693-d0e7-5b5e-ce0ec9da275d	2345	Bistrica ob Dravi
00050000-5693-d0e7-32c4-69d10616214b	3256	Bistrica ob Sotli
00050000-5693-d0e7-7336-7acb625e5c2b	8259	Bizeljsko
00050000-5693-d0e7-b93b-29adc6214337	1223	Blagovica
00050000-5693-d0e7-3bd2-4c5c582a5d44	8283	Blanca
00050000-5693-d0e7-ea61-96fcd49f0741	4260	Bled
00050000-5693-d0e7-a5ad-5d2c6c702fa4	4273	Blejska Dobrava
00050000-5693-d0e7-72a1-c166ba102aaf	9265	Bodonci
00050000-5693-d0e7-cc3a-c4650abcba9d	9222	Bogojina
00050000-5693-d0e7-a20d-9145dbbed84b	4263	Bohinjska Bela
00050000-5693-d0e7-65ad-cf7033af6e29	4264	Bohinjska Bistrica
00050000-5693-d0e7-3410-49fbee8157f8	4265	Bohinjsko jezero
00050000-5693-d0e7-3b14-ac6f93191e16	1353	Borovnica
00050000-5693-d0e7-fb61-5024ea662a54	8294	Boštanj
00050000-5693-d0e7-299d-844207b3360f	5230	Bovec
00050000-5693-d0e7-1093-6183825398fc	5295	Branik
00050000-5693-d0e7-e549-2b6b1be88a71	3314	Braslovče
00050000-5693-d0e7-a132-251e33406320	5223	Breginj
00050000-5693-d0e7-7fd9-7638d3fb4465	8280	Brestanica
00050000-5693-d0e7-1f0a-0e9aaf1534f8	2354	Bresternica
00050000-5693-d0e7-8eb6-56e5b894857f	4243	Brezje
00050000-5693-d0e7-702b-dfe4ccf40717	1351	Brezovica pri Ljubljani
00050000-5693-d0e7-a7f8-42bf7c1681e7	8250	Brežice
00050000-5693-d0e7-f575-f0b905d1d2ad	4210	Brnik - Aerodrom
00050000-5693-d0e7-5c55-ec9cbbe4507b	8321	Brusnice
00050000-5693-d0e7-dbe7-f00e3a5ebb5a	3255	Buče
00050000-5693-d0e7-f350-2f7820101419	8276	Bučka 
00050000-5693-d0e7-ec72-3778b7f8d1ea	9261	Cankova
00050000-5693-d0e7-a4d7-23c0bee2a205	3000	Celje 
00050000-5693-d0e7-2586-ff072332dfea	3001	Celje - poštni predali
00050000-5693-d0e7-80b1-83310b704dd6	4207	Cerklje na Gorenjskem
00050000-5693-d0e7-632c-4d0949638273	8263	Cerklje ob Krki
00050000-5693-d0e7-82f0-a90058a0889c	1380	Cerknica
00050000-5693-d0e7-5a76-c9829d989111	5282	Cerkno
00050000-5693-d0e7-0d07-addd8e04fe37	2236	Cerkvenjak
00050000-5693-d0e7-9867-293e9d6cb48f	2215	Ceršak
00050000-5693-d0e7-229e-e0ec429ee30d	2326	Cirkovce
00050000-5693-d0e7-4fbf-1d37da420de8	2282	Cirkulane
00050000-5693-d0e7-a6eb-c424cbd0450e	5273	Col
00050000-5693-d0e7-829e-ee0686696040	8251	Čatež ob Savi
00050000-5693-d0e7-fe25-8a0d74eb4756	1413	Čemšenik
00050000-5693-d0e7-d665-e3e077eab6d1	5253	Čepovan
00050000-5693-d0e7-a359-db75b05475b9	9232	Črenšovci
00050000-5693-d0e7-82e1-0c6ef9c8adf6	2393	Črna na Koroškem
00050000-5693-d0e7-31f7-eaa209959747	6275	Črni Kal
00050000-5693-d0e7-6de7-ad01e84d5bd8	5274	Črni Vrh nad Idrijo
00050000-5693-d0e7-d39b-88a22e4eb2ff	5262	Črniče
00050000-5693-d0e7-1663-af9fcf0d7a10	8340	Črnomelj
00050000-5693-d0e7-a5b8-db28ef4e8452	6271	Dekani
00050000-5693-d0e7-62ba-89c8e2ad84b0	5210	Deskle
00050000-5693-d0e7-7eb6-a2f3640a3037	2253	Destrnik
00050000-5693-d0e7-44fc-827d6d25fca6	6215	Divača
00050000-5693-d0e7-57d9-eec9e059171a	1233	Dob
00050000-5693-d0e7-b2b3-797d16b597fb	3224	Dobje pri Planini
00050000-5693-d0e7-2a1a-934fd5173a12	8257	Dobova
00050000-5693-d0e7-e877-dc180061806d	1423	Dobovec
00050000-5693-d0e7-389d-6ba80927af6c	5263	Dobravlje
00050000-5693-d0e7-a38a-e786a798fa2c	3204	Dobrna
00050000-5693-d0e7-0366-65c03f8a8df4	8211	Dobrnič
00050000-5693-d0e7-040f-2693d5106839	1356	Dobrova
00050000-5693-d0e7-99ec-103a1cfe6dad	9223	Dobrovnik/Dobronak 
00050000-5693-d0e7-9c44-2bf212da1543	5212	Dobrovo v Brdih
00050000-5693-d0e7-df24-069366df735b	1431	Dol pri Hrastniku
00050000-5693-d0e7-c4be-dc145c108f2c	1262	Dol pri Ljubljani
00050000-5693-d0e7-6e49-a762aaddb4d7	1273	Dole pri Litiji
00050000-5693-d0e7-d751-be47e51bf3ef	1331	Dolenja vas
00050000-5693-d0e7-b92d-fd9fdd22f8cf	8350	Dolenjske Toplice
00050000-5693-d0e7-b755-ff7eb753acfd	1230	Domžale
00050000-5693-d0e7-d9df-bdc90d773a9e	2252	Dornava
00050000-5693-d0e7-1276-ff0281cc4b9d	5294	Dornberk
00050000-5693-d0e7-30b9-e093e873ae90	1319	Draga
00050000-5693-d0e7-87b8-eea30731a9ca	8343	Dragatuš
00050000-5693-d0e7-90a9-6261a6fdb6fa	3222	Dramlje
00050000-5693-d0e7-e660-f5e52ba257c5	2370	Dravograd
00050000-5693-d0e7-10ae-8076152c35a0	4203	Duplje
00050000-5693-d0e7-f2d2-3ed909aa1e97	6221	Dutovlje
00050000-5693-d0e7-7af5-060b0ebaa866	8361	Dvor
00050000-5693-d0e7-f312-9cc547b3fcb8	2343	Fala
00050000-5693-d0e7-a4f2-3f57f7d65c95	9208	Fokovci
00050000-5693-d0e7-6d37-e19cc0d85aff	2313	Fram
00050000-5693-d0e7-48fc-ef7fa4250ca8	3213	Frankolovo
00050000-5693-d0e7-95e4-44d69ade5c55	1274	Gabrovka
00050000-5693-d0e7-0f81-87bf4086f675	8254	Globoko
00050000-5693-d0e7-e4a9-b5aa71bccb65	5275	Godovič
00050000-5693-d0e7-0471-b360268cba44	4204	Golnik
00050000-5693-d0e7-b56d-b6852d498726	3303	Gomilsko
00050000-5693-d0e7-3fe0-a8a8c67ac76c	4224	Gorenja vas
00050000-5693-d0e7-3aab-dee63993cba5	3263	Gorica pri Slivnici
00050000-5693-d0e7-ff42-9d02d8064d6e	2272	Gorišnica
00050000-5693-d0e7-41b7-2d3764e6adf7	9250	Gornja Radgona
00050000-5693-d0e7-8f8e-7fa47f55bc08	3342	Gornji Grad
00050000-5693-d0e7-18e3-38a2280ee42b	4282	Gozd Martuljek
00050000-5693-d0e7-91a1-037388ebb435	6272	Gračišče
00050000-5693-d0e7-ec5e-ca04d85874be	9264	Grad
00050000-5693-d0e7-b770-55619820a73f	8332	Gradac
00050000-5693-d0e7-6c94-817cb09a83db	1384	Grahovo
00050000-5693-d0e7-90bd-bbe6e48a7aa3	5242	Grahovo ob Bači
00050000-5693-d0e7-2505-7f92b012bef8	5251	Grgar
00050000-5693-d0e7-46b2-e959fe42f31d	3302	Griže
00050000-5693-d0e7-38f4-fbff270ad496	3231	Grobelno
00050000-5693-d0e7-7c90-9feeb0893ddc	1290	Grosuplje
00050000-5693-d0e7-4563-727228516e03	2288	Hajdina
00050000-5693-d0e7-8da8-5b68c3f43a6a	8362	Hinje
00050000-5693-d0e7-8130-c3e551c59006	2311	Hoče
00050000-5693-d0e7-5539-b6e5e6e8bfe6	9205	Hodoš/Hodos
00050000-5693-d0e7-2822-07f5adab889c	1354	Horjul
00050000-5693-d0e7-dfa9-3247a0cc199c	1372	Hotedršica
00050000-5693-d0e7-df02-a1b646ce3fbe	1430	Hrastnik
00050000-5693-d0e7-a2a7-e6af1bb3e5be	6225	Hruševje
00050000-5693-d0e7-a6e8-64f96ce06a78	4276	Hrušica
00050000-5693-d0e7-9137-60593c0b2d6c	5280	Idrija
00050000-5693-d0e7-b912-778a7ac720af	1292	Ig
00050000-5693-d0e7-80bc-c6521d923d2f	6250	Ilirska Bistrica
00050000-5693-d0e7-b0a8-07485a89310e	6251	Ilirska Bistrica-Trnovo
00050000-5693-d0e7-0138-725da5ad9d2a	1295	Ivančna Gorica
00050000-5693-d0e7-daee-286e759975b2	2259	Ivanjkovci
00050000-5693-d0e7-5315-68e59465d0a2	1411	Izlake
00050000-5693-d0e7-1be1-298d612c9549	6310	Izola/Isola
00050000-5693-d0e7-17f5-39321d15c68c	2222	Jakobski Dol
00050000-5693-d0e7-9c71-7131c8865044	2221	Jarenina
00050000-5693-d0e7-67a9-4f387ecd6147	6254	Jelšane
00050000-5693-d0e7-7dbb-a7250ee0e2f4	4270	Jesenice
00050000-5693-d0e7-25d5-69191108068e	8261	Jesenice na Dolenjskem
00050000-5693-d0e7-6a1d-302058894cb2	3273	Jurklošter
00050000-5693-d0e7-be4e-e2809ff6cb85	2223	Jurovski Dol
00050000-5693-d0e7-b5eb-fc1e2a8216da	2256	Juršinci
00050000-5693-d0e7-d45c-47609ef7b015	5214	Kal nad Kanalom
00050000-5693-d0e7-c90d-60f724460646	3233	Kalobje
00050000-5693-d0e7-4815-e421eb033d1d	4246	Kamna Gorica
00050000-5693-d0e7-4ff1-7b2a16271ffd	2351	Kamnica
00050000-5693-d0e7-4224-52e4be8ccdaa	1241	Kamnik
00050000-5693-d0e7-c91e-d2af427636b1	5213	Kanal
00050000-5693-d0e7-55b3-5cf8fb62d634	8258	Kapele
00050000-5693-d0e7-b103-232468aebe95	2362	Kapla
00050000-5693-d0e7-fe4a-f0b47f2dbb1d	2325	Kidričevo
00050000-5693-d0e7-31bf-b8389baf6a7c	1412	Kisovec
00050000-5693-d0e7-734c-5c40da10869e	6253	Knežak
00050000-5693-d0e7-b7b7-30f50cb60458	5222	Kobarid
00050000-5693-d0e7-bf7f-9047004330ba	9227	Kobilje
00050000-5693-d0e7-87ab-4628c0751f48	1330	Kočevje
00050000-5693-d0e7-86d2-5dc75c393ef5	1338	Kočevska Reka
00050000-5693-d0e7-10b5-dc91f8538399	2276	Kog
00050000-5693-d0e7-c684-db1b85231473	5211	Kojsko
00050000-5693-d0e7-8f23-defc916e94e6	6223	Komen
00050000-5693-d0e7-1ffc-6ef3c0801254	1218	Komenda
00050000-5693-d0e7-4b2f-e7b1e01f8122	6000	Koper/Capodistria 
00050000-5693-d0e7-be04-f1d119ba0189	6001	Koper/Capodistria - poštni predali
00050000-5693-d0e7-5133-027fc04b7752	8282	Koprivnica
00050000-5693-d0e7-fcbd-5fb872c538f1	5296	Kostanjevica na Krasu
00050000-5693-d0e7-b74e-cf6aa179b1ab	8311	Kostanjevica na Krki
00050000-5693-d0e7-9329-9687d8e94934	1336	Kostel
00050000-5693-d0e7-868a-2064d2c9e98f	6256	Košana
00050000-5693-d0e7-9062-8993a6b8bd61	2394	Kotlje
00050000-5693-d0e7-f44c-c5c301f8d304	6240	Kozina
00050000-5693-d0e7-7d8a-ed66485f5a04	3260	Kozje
00050000-5693-d0e7-1806-14726f925012	4000	Kranj 
00050000-5693-d0e7-4462-93bddab281b9	4001	Kranj - poštni predali
00050000-5693-d0e7-f694-2157c70bdd76	4280	Kranjska Gora
00050000-5693-d0e7-576a-a1cf367d360c	1281	Kresnice
00050000-5693-d0e7-4ae5-e7bb24f81e0d	4294	Križe
00050000-5693-d0e7-bd45-e8a5446bcfa7	9206	Križevci
00050000-5693-d0e7-9815-c86b080a0c74	9242	Križevci pri Ljutomeru
00050000-5693-d0e7-0632-a77b898f3a9f	1301	Krka
00050000-5693-d0e7-1119-dd6d8da2c408	8296	Krmelj
00050000-5693-d0e7-4d69-5cb173f2f738	4245	Kropa
00050000-5693-d0e7-94de-779884e38e13	8262	Krška vas
00050000-5693-d0e7-fb67-86833136bde8	8270	Krško
00050000-5693-d0e7-636f-437f8d0a345a	9263	Kuzma
00050000-5693-d0e7-a2e3-6fde324dd5c7	2318	Laporje
00050000-5693-d0e7-0438-513145c45d30	3270	Laško
00050000-5693-d0e7-0cfd-6b1627da3f51	1219	Laze v Tuhinju
00050000-5693-d0e7-d58d-bddcfeb02db4	2230	Lenart v Slovenskih goricah
00050000-5693-d0e7-2290-2cc51de86f73	9220	Lendava/Lendva
00050000-5693-d0e7-8597-2849dade0a33	4248	Lesce
00050000-5693-d0e7-0b89-c5de92182916	3261	Lesično
00050000-5693-d0e7-bcaf-6ba28428f24c	8273	Leskovec pri Krškem
00050000-5693-d0e7-b6ed-2c76483289bc	2372	Libeliče
00050000-5693-d0e7-94c6-ec29e4d2b3e3	2341	Limbuš
00050000-5693-d0e7-de1a-f04fc30c7f84	1270	Litija
00050000-5693-d0e7-5a22-3eec3b41e713	3202	Ljubečna
00050000-5693-d0e7-abea-dadfaf5ea8d4	1000	Ljubljana 
00050000-5693-d0e7-a188-e0fd788c7acc	1001	Ljubljana - poštni predali
00050000-5693-d0e7-5fc4-fc71d3838b60	1231	Ljubljana - Črnuče
00050000-5693-d0e7-29cf-44283c7416f6	1261	Ljubljana - Dobrunje
00050000-5693-d0e7-5fc2-e03511be0731	1260	Ljubljana - Polje
00050000-5693-d0e7-5165-1190b3ce93e0	1210	Ljubljana - Šentvid
00050000-5693-d0e7-ca33-ede7e1262fe5	1211	Ljubljana - Šmartno
00050000-5693-d0e7-55f0-f791588f911d	3333	Ljubno ob Savinji
00050000-5693-d0e7-0bad-c187ba784732	9240	Ljutomer
00050000-5693-d0e7-09d0-82d1848efa0b	3215	Loče
00050000-5693-d0e7-3560-43190b57d90f	5231	Log pod Mangartom
00050000-5693-d0e7-2d8d-febddf210d0e	1358	Log pri Brezovici
00050000-5693-d0e7-7c95-468cf6bbbbf7	1370	Logatec
00050000-5693-d0e7-0332-9ea0aaa1f9e9	1371	Logatec
00050000-5693-d0e7-828b-4bdad2d9e3f4	1434	Loka pri Zidanem Mostu
00050000-5693-d0e7-6695-87c586f5b0b6	3223	Loka pri Žusmu
00050000-5693-d0e7-5399-222be3a7c60f	6219	Lokev
00050000-5693-d0e7-f4b7-20b790116fd2	1318	Loški Potok
00050000-5693-d0e7-4e23-d30f24c2bc49	2324	Lovrenc na Dravskem polju
00050000-5693-d0e7-ad02-9abbe9e9f4bc	2344	Lovrenc na Pohorju
00050000-5693-d0e7-761e-1f841d46cb53	3334	Luče
00050000-5693-d0e7-3471-30988897c8a0	1225	Lukovica
00050000-5693-d0e7-0af5-712d75edf8dc	9202	Mačkovci
00050000-5693-d0e7-717e-19b2d1c644da	2322	Majšperk
00050000-5693-d0e7-ab10-dc3f163d0925	2321	Makole
00050000-5693-d0e7-91b3-2b7f4dbc5bae	9243	Mala Nedelja
00050000-5693-d0e7-174e-cd98ce932c64	2229	Malečnik
00050000-5693-d0e7-0b44-30b176103dec	6273	Marezige
00050000-5693-d0e7-afb3-283635145051	2000	Maribor 
00050000-5693-d0e7-1614-66efd5d6cc09	2001	Maribor - poštni predali
00050000-5693-d0e7-2324-a97e6afc117b	2206	Marjeta na Dravskem polju
00050000-5693-d0e7-4bf2-18d5fadf64fa	2281	Markovci
00050000-5693-d0e7-6e78-fd982c93595b	9221	Martjanci
00050000-5693-d0e7-1472-1580b96a9d62	6242	Materija
00050000-5693-d0e7-6b44-d7479ff0cf02	4211	Mavčiče
00050000-5693-d0e7-6fed-af066cfa3ce3	1215	Medvode
00050000-5693-d0e7-c8f3-2529f19dfa60	1234	Mengeš
00050000-5693-d0e7-d2cc-d88db85f6568	8330	Metlika
00050000-5693-d0e7-7957-52b2b138f7c5	2392	Mežica
00050000-5693-d0e7-6eda-6d64d98788db	2204	Miklavž na Dravskem polju
00050000-5693-d0e7-0d19-031979026c11	2275	Miklavž pri Ormožu
00050000-5693-d0e7-f26e-5c46a91d8b0e	5291	Miren
00050000-5693-d0e7-d802-447eaa52063b	8233	Mirna
00050000-5693-d0e7-3cc1-e72306a37929	8216	Mirna Peč
00050000-5693-d0e7-c6c6-c7c1ef35e0f9	2382	Mislinja
00050000-5693-d0e7-67bc-e40bdf0e5067	4281	Mojstrana
00050000-5693-d0e7-d505-c9ff12a57eb8	8230	Mokronog
00050000-5693-d0e7-92a1-45068ef7cac3	1251	Moravče
00050000-5693-d0e7-a155-976cf7ac8b2c	9226	Moravske Toplice
00050000-5693-d0e7-b24b-99e02ec7f8e0	5216	Most na Soči
00050000-5693-d0e7-eb7f-079ffd185612	1221	Motnik
00050000-5693-d0e7-f690-9111cd642429	3330	Mozirje
00050000-5693-d0e7-c96a-d5e97e436707	9000	Murska Sobota 
00050000-5693-d0e7-decf-c06b2203c0ad	9001	Murska Sobota - poštni predali
00050000-5693-d0e7-80c6-e47d63846b5a	2366	Muta
00050000-5693-d0e7-241d-1372c8de2761	4202	Naklo
00050000-5693-d0e7-9146-5d4e09f4bf4f	3331	Nazarje
00050000-5693-d0e7-34c5-33b7a361a501	1357	Notranje Gorice
00050000-5693-d0e7-f0a2-ccf95d46db31	3203	Nova Cerkev
00050000-5693-d0e7-9d8e-82cb5ee1b273	5000	Nova Gorica 
00050000-5693-d0e7-7a0c-2dce49ba273c	5001	Nova Gorica - poštni predali
00050000-5693-d0e7-b0ca-b2760a839537	1385	Nova vas
00050000-5693-d0e7-0d02-21097aa5b3cc	8000	Novo mesto
00050000-5693-d0e7-1659-d314dd108755	8001	Novo mesto - poštni predali
00050000-5693-d0e7-babd-e34d88455d8b	6243	Obrov
00050000-5693-d0e7-a420-39affda2ad29	9233	Odranci
00050000-5693-d0e7-7d13-07d695f86cc1	2317	Oplotnica
00050000-5693-d0e7-c086-bc8be7835418	2312	Orehova vas
00050000-5693-d0e7-bb26-4f19b7ea012c	2270	Ormož
00050000-5693-d0e7-2c10-a5d8ce1f44f2	1316	Ortnek
00050000-5693-d0e7-6220-89be852883f4	1337	Osilnica
00050000-5693-d0e7-3739-7f1df54e284c	8222	Otočec
00050000-5693-d0e7-7dca-0b20bb4c25ef	2361	Ožbalt
00050000-5693-d0e7-5839-a11811191c13	2231	Pernica
00050000-5693-d0e7-3a78-5d1301ec68a9	2211	Pesnica pri Mariboru
00050000-5693-d0e7-3be5-ec3c7a12666e	9203	Petrovci
00050000-5693-d0e7-18cd-be2c6be1becb	3301	Petrovče
00050000-5693-d0e7-7218-1ea32a6f6c93	6330	Piran/Pirano
00050000-5693-d0e7-684f-318b267b9d87	8255	Pišece
00050000-5693-d0e7-961c-d0093c135ccf	6257	Pivka
00050000-5693-d0e7-9567-c7cef898fa20	6232	Planina
00050000-5693-d0e7-a9b5-aeb0386a5d26	3225	Planina pri Sevnici
00050000-5693-d0e7-7452-b7525b50a321	6276	Pobegi
00050000-5693-d0e7-f666-789ebbbd7dfc	8312	Podbočje
00050000-5693-d0e7-ec50-908b836e2c06	5243	Podbrdo
00050000-5693-d0e7-7b79-61a468611c54	3254	Podčetrtek
00050000-5693-d0e7-54d0-93c9f9a5e264	2273	Podgorci
00050000-5693-d0e7-e6ed-0ee0f16c6670	6216	Podgorje
00050000-5693-d0e7-a454-edddf333468e	2381	Podgorje pri Slovenj Gradcu
00050000-5693-d0e7-7619-75714fa3515c	6244	Podgrad
00050000-5693-d0e7-f86f-ef80a35ee923	1414	Podkum
00050000-5693-d0e7-aedb-d310ac7bcc35	2286	Podlehnik
00050000-5693-d0e7-8920-caed6c127642	5272	Podnanos
00050000-5693-d0e7-49ce-d27b0a02c5e0	4244	Podnart
00050000-5693-d0e7-0fce-efb2d7ab4e80	3241	Podplat
00050000-5693-d0e7-0bea-5451e686305f	3257	Podsreda
00050000-5693-d0e7-e319-17dafc229720	2363	Podvelka
00050000-5693-d0e7-82bc-c7ab8c62ae3f	2208	Pohorje
00050000-5693-d0e7-3b10-2c21b827df3e	2257	Polenšak
00050000-5693-d0e7-f89f-1b9e95eca955	1355	Polhov Gradec
00050000-5693-d0e7-13ca-b42d68cc5efc	4223	Poljane nad Škofjo Loko
00050000-5693-d0e7-ee26-2a1c78c53cd4	2319	Poljčane
00050000-5693-d0e7-1fca-7f4b87709727	1272	Polšnik
00050000-5693-d0e7-737e-33300e550a75	3313	Polzela
00050000-5693-d0e7-cf4f-99b965193e54	3232	Ponikva
00050000-5693-d0e7-61cf-def8b04ab3cf	6320	Portorož/Portorose
00050000-5693-d0e7-eaeb-55e68831e098	6230	Postojna
00050000-5693-d0e7-4b18-8bdadbae1d0c	2331	Pragersko
00050000-5693-d0e7-48ad-8cf58dd1b381	3312	Prebold
00050000-5693-d0e7-18b5-942a47b3cad2	4205	Preddvor
00050000-5693-d0e7-0943-5e1dbe214122	6255	Prem
00050000-5693-d0e7-2e20-172d1ea53bc2	1352	Preserje
00050000-5693-d0e7-e5d0-a63300604406	6258	Prestranek
00050000-5693-d0e7-c7a4-22f742e08212	2391	Prevalje
00050000-5693-d0e7-604c-154ca063fe1b	3262	Prevorje
00050000-5693-d0e7-af80-83c6c6dd13a8	1276	Primskovo 
00050000-5693-d0e7-9d06-49b20674d5bf	3253	Pristava pri Mestinju
00050000-5693-d0e7-cf11-7791dcab3a78	9207	Prosenjakovci/Partosfalva
00050000-5693-d0e7-45e7-cadec92de5ad	5297	Prvačina
00050000-5693-d0e7-8b7b-c0b00959b62b	2250	Ptuj
00050000-5693-d0e7-3689-097f018a7b96	2323	Ptujska Gora
00050000-5693-d0e7-d7cb-020e98b8a7a0	9201	Puconci
00050000-5693-d0e7-7997-5cb452e33e36	2327	Rače
00050000-5693-d0e7-fe05-e34390492a9a	1433	Radeče
00050000-5693-d0e7-d235-69d4945382ea	9252	Radenci
00050000-5693-d0e7-2feb-8d8016bda537	2360	Radlje ob Dravi
00050000-5693-d0e7-4dab-0cf9fdc2425a	1235	Radomlje
00050000-5693-d0e7-6fc4-8297857856ac	4240	Radovljica
00050000-5693-d0e7-0960-bcbe971177ba	8274	Raka
00050000-5693-d0e7-4316-05c8a47f69ae	1381	Rakek
00050000-5693-d0e7-d653-519006c48a50	4283	Rateče - Planica
00050000-5693-d0e7-f22a-8929647ce4c7	2390	Ravne na Koroškem
00050000-5693-d0e7-1af4-8db2d74d707c	9246	Razkrižje
00050000-5693-d0e7-cd64-66a8f93fa405	3332	Rečica ob Savinji
00050000-5693-d0e7-576e-4cd86cb7f48e	5292	Renče
00050000-5693-d0e7-beff-20fd1b4bd93c	1310	Ribnica
00050000-5693-d0e7-2269-38702efc9935	2364	Ribnica na Pohorju
00050000-5693-d0e7-d70a-5c0e4c6c5b1c	3272	Rimske Toplice
00050000-5693-d0e7-8b14-0202362060a7	1314	Rob
00050000-5693-d0e7-cbce-7bbda5edb7ec	5215	Ročinj
00050000-5693-d0e7-2cf7-d2e26f31c639	3250	Rogaška Slatina
00050000-5693-d0e7-b922-e7182b21b04a	9262	Rogašovci
00050000-5693-d0e7-e8bf-9ddaa664828c	3252	Rogatec
00050000-5693-d0e7-35c5-f7f7257ae11f	1373	Rovte
00050000-5693-d0e7-e141-40f2677cd463	2342	Ruše
00050000-5693-d0e7-faa5-42899b85cbde	1282	Sava
00050000-5693-d0e7-bc3b-72f5ea05b7dd	6333	Sečovlje/Sicciole
00050000-5693-d0e7-2316-aee71f3cfb26	4227	Selca
00050000-5693-d0e7-1f92-bb83640547e6	2352	Selnica ob Dravi
00050000-5693-d0e7-b319-d5818889d8a7	8333	Semič
00050000-5693-d0e7-90d6-9922b87cf573	8281	Senovo
00050000-5693-d0e7-74de-e655bf94b213	6224	Senožeče
00050000-5693-d0e7-87a6-9c377c263334	8290	Sevnica
00050000-5693-d0e7-b71d-64e7e779dbcf	6210	Sežana
00050000-5693-d0e7-934d-926af57b7f11	2214	Sladki Vrh
00050000-5693-d0e7-c56b-39c0980d12ed	5283	Slap ob Idrijci
00050000-5693-d0e7-5da4-821be0bcba89	2380	Slovenj Gradec
00050000-5693-d0e7-2fc8-40830de5c536	2310	Slovenska Bistrica
00050000-5693-d0e7-b9e6-e212cb104faa	3210	Slovenske Konjice
00050000-5693-d0e7-24a7-b56ba2507aef	1216	Smlednik
00050000-5693-d0e7-efc4-2a03de4ca177	5232	Soča
00050000-5693-d0e7-82da-d4539311f1e1	1317	Sodražica
00050000-5693-d0e7-ddd9-801e555c54b3	3335	Solčava
00050000-5693-d0e7-2d46-1b0d1b1d21cb	5250	Solkan
00050000-5693-d0e7-efda-a9e888642fc4	4229	Sorica
00050000-5693-d0e7-dfe0-2adfb01cfca8	4225	Sovodenj
00050000-5693-d0e7-482a-1e21bd0561fa	5281	Spodnja Idrija
00050000-5693-d0e7-98d8-9319dd0ce6a7	2241	Spodnji Duplek
00050000-5693-d0e7-f4c9-0150b6307a07	9245	Spodnji Ivanjci
00050000-5693-d0e7-b878-3e7d82513dca	2277	Središče ob Dravi
00050000-5693-d0e7-0027-1772c5ab0c32	4267	Srednja vas v Bohinju
00050000-5693-d0e7-6cdf-e658d0dd6d9f	8256	Sromlje 
00050000-5693-d0e7-1cd3-e9bbd75bea2a	5224	Srpenica
00050000-5693-d0e7-e580-785f86805d0d	1242	Stahovica
00050000-5693-d0e7-6e0d-7d34c32b1017	1332	Stara Cerkev
00050000-5693-d0e7-33cb-1069b224bd2f	8342	Stari trg ob Kolpi
00050000-5693-d0e7-18e0-322f4e797a7f	1386	Stari trg pri Ložu
00050000-5693-d0e7-fa20-f6d23a19764a	2205	Starše
00050000-5693-d0e7-a4cd-29fd7b9e26ae	2289	Stoperce
00050000-5693-d0e7-0be8-18d4ed2be9cf	8322	Stopiče
00050000-5693-d0e7-ea93-82b713325f2c	3206	Stranice
00050000-5693-d0e7-f825-8c4c820d4805	8351	Straža
00050000-5693-d0e7-e533-9ba6b3e16ea5	1313	Struge
00050000-5693-d0e7-dbef-2a52e3ea82d7	8293	Studenec
00050000-5693-d0e7-7940-d3f9cf7a771a	8331	Suhor
00050000-5693-d0e7-6506-b5752b35f929	2233	Sv. Ana v Slovenskih goricah
00050000-5693-d0e7-45b3-5557b055e69a	2235	Sv. Trojica v Slovenskih goricah
00050000-5693-d0e7-1b2b-81c6d655e476	2353	Sveti Duh na Ostrem Vrhu
00050000-5693-d0e7-3d99-7001f241bc2d	9244	Sveti Jurij ob Ščavnici
00050000-5693-d0e7-62f8-69aaab2d8bb1	3264	Sveti Štefan
00050000-5693-d0e7-6e19-68a48ca8e52b	2258	Sveti Tomaž
00050000-5693-d0e7-3155-e693869c08be	9204	Šalovci
00050000-5693-d0e7-6c0b-934ac4d97695	5261	Šempas
00050000-5693-d0e7-c425-711f83e4c7e2	5290	Šempeter pri Gorici
00050000-5693-d0e7-5436-02475ada29d5	3311	Šempeter v Savinjski dolini
00050000-5693-d0e7-b1b1-87d3e8da1182	4208	Šenčur
00050000-5693-d0e7-4415-9e889999c257	2212	Šentilj v Slovenskih goricah
00050000-5693-d0e7-62da-175839282ccb	8297	Šentjanž
00050000-5693-d0e7-3549-f5c8eb259d61	2373	Šentjanž pri Dravogradu
00050000-5693-d0e7-58d7-0aaae436d94e	8310	Šentjernej
00050000-5693-d0e7-f29b-a49c6af89388	3230	Šentjur
00050000-5693-d0e7-b30c-91d8840b72fc	3271	Šentrupert
00050000-5693-d0e7-67e2-90f4839a8db0	8232	Šentrupert
00050000-5693-d0e7-c1fa-9d9b2868e95f	1296	Šentvid pri Stični
00050000-5693-d0e7-9e7e-1f174e48abf4	8275	Škocjan
00050000-5693-d0e7-3216-e8d78befef6c	6281	Škofije
00050000-5693-d0e7-c480-e752350105c8	4220	Škofja Loka
00050000-5693-d0e7-073a-a6c580ed1fbf	3211	Škofja vas
00050000-5693-d0e7-3b55-ad5d23006b2c	1291	Škofljica
00050000-5693-d0e7-9726-07a0be7d0f50	6274	Šmarje
00050000-5693-d0e7-fabc-d14da3436c6e	1293	Šmarje - Sap
00050000-5693-d0e7-56fa-59b71e75eadf	3240	Šmarje pri Jelšah
00050000-5693-d0e7-98f7-84e31e3eb02b	8220	Šmarješke Toplice
00050000-5693-d0e7-1481-3306a0c5b935	2315	Šmartno na Pohorju
00050000-5693-d0e7-cb2e-adc9cb55071e	3341	Šmartno ob Dreti
00050000-5693-d0e7-8b15-a24447f158be	3327	Šmartno ob Paki
00050000-5693-d0e7-a1cc-a23aa0234bf2	1275	Šmartno pri Litiji
00050000-5693-d0e7-121b-0f3a662ad218	2383	Šmartno pri Slovenj Gradcu
00050000-5693-d0e7-fee8-014c1d2c3247	3201	Šmartno v Rožni dolini
00050000-5693-d0e7-723f-f8d0de58072d	3325	Šoštanj
00050000-5693-d0e7-8626-7e638e751557	6222	Štanjel
00050000-5693-d0e7-8168-faf60c20bd06	3220	Štore
00050000-5693-d0e7-4e83-89eda260ef41	3304	Tabor
00050000-5693-d0e7-dd10-6bee9679a834	3221	Teharje
00050000-5693-d0e7-6d24-8333787cf2a8	9251	Tišina
00050000-5693-d0e7-33da-7bfe520875da	5220	Tolmin
00050000-5693-d0e7-a998-688f117cd94f	3326	Topolšica
00050000-5693-d0e7-c865-6b473d9c9ecb	2371	Trbonje
00050000-5693-d0e7-a337-cc2169d6b0bc	1420	Trbovlje
00050000-5693-d0e7-010b-2a804daa3d24	8231	Trebelno 
00050000-5693-d0e7-a547-8f510f822241	8210	Trebnje
00050000-5693-d0e7-73e6-6326b17a37a0	5252	Trnovo pri Gorici
00050000-5693-d0e7-a5ef-aa821f7c0724	2254	Trnovska vas
00050000-5693-d0e7-1e28-aa03687f6fd2	1222	Trojane
00050000-5693-d0e7-ecf4-bae6af161e9d	1236	Trzin
00050000-5693-d0e7-97e2-6660272c4e69	4290	Tržič
00050000-5693-d0e7-5475-777ab20a8421	8295	Tržišče
00050000-5693-d0e7-ef66-6854c79d5aa0	1311	Turjak
00050000-5693-d0e7-7cd8-fa12f178d85d	9224	Turnišče
00050000-5693-d0e7-bfc1-f705730ff882	8323	Uršna sela
00050000-5693-d0e7-cfef-20abee35e365	1252	Vače
00050000-5693-d0e7-60e0-23bd2b0af658	3320	Velenje 
00050000-5693-d0e7-c8f4-dede31400b4a	3322	Velenje - poštni predali
00050000-5693-d0e7-a5e0-b3cc81573c48	8212	Velika Loka
00050000-5693-d0e7-7122-f4fcd82c7732	2274	Velika Nedelja
00050000-5693-d0e7-735d-0d8c58b4555c	9225	Velika Polana
00050000-5693-d0e7-879d-098383be380d	1315	Velike Lašče
00050000-5693-d0e7-6f4d-1d2f9f1f4f42	8213	Veliki Gaber
00050000-5693-d0e7-006b-a8d6ecd0424d	9241	Veržej
00050000-5693-d0e7-f183-0f78122f6ee0	1312	Videm - Dobrepolje
00050000-5693-d0e7-664d-55c531cd7c5d	2284	Videm pri Ptuju
00050000-5693-d0e7-4e84-25e2d63d5f3e	8344	Vinica
00050000-5693-d0e7-6bce-42153d79dd80	5271	Vipava
00050000-5693-d0e7-e2a5-eb8a2573229c	4212	Visoko
00050000-5693-d0e7-6d7a-80771b3b79f2	1294	Višnja Gora
00050000-5693-d0e7-fdad-800f99aa55ba	3205	Vitanje
00050000-5693-d0e7-a837-8520c798c027	2255	Vitomarci
00050000-5693-d0e7-9918-12358bfc957e	1217	Vodice
00050000-5693-d0e7-4981-5f08e17654df	3212	Vojnik\t
00050000-5693-d0e7-b9f5-f52a8d3e2526	5293	Volčja Draga
00050000-5693-d0e7-5d53-378cdeab4bf6	2232	Voličina
00050000-5693-d0e7-993c-2253acb027f5	3305	Vransko
00050000-5693-d0e7-4052-774eaf277970	6217	Vremski Britof
00050000-5693-d0e7-9a02-7a3c6612b633	1360	Vrhnika
00050000-5693-d0e7-584e-e07774416107	2365	Vuhred
00050000-5693-d0e7-0ce3-622dfe4b0825	2367	Vuzenica
00050000-5693-d0e7-154f-cf7f5346cca5	8292	Zabukovje 
00050000-5693-d0e7-c6d2-391927779dff	1410	Zagorje ob Savi
00050000-5693-d0e7-6035-374bdc2a834f	1303	Zagradec
00050000-5693-d0e7-9559-e3048eb768e3	2283	Zavrč
00050000-5693-d0e7-b1ff-872a5d4f5857	8272	Zdole 
00050000-5693-d0e7-f96d-8eec75d53e29	4201	Zgornja Besnica
00050000-5693-d0e7-31c6-3b55bc5e21a2	2242	Zgornja Korena
00050000-5693-d0e7-a2ab-a25638c7cd2f	2201	Zgornja Kungota
00050000-5693-d0e7-bce9-f05ff2dfc671	2316	Zgornja Ložnica
00050000-5693-d0e7-01bc-ef3ad917f64b	2314	Zgornja Polskava
00050000-5693-d0e7-288c-41f67cc55741	2213	Zgornja Velka
00050000-5693-d0e7-64da-eb59d05bd785	4247	Zgornje Gorje
00050000-5693-d0e7-2aa6-0aa7eaec2300	4206	Zgornje Jezersko
00050000-5693-d0e7-6dee-8d79fbb94d4b	2285	Zgornji Leskovec
00050000-5693-d0e7-a261-8126eba865db	1432	Zidani Most
00050000-5693-d0e7-1adf-b1b2ae7f6639	3214	Zreče
00050000-5693-d0e7-2214-0ac760e2345c	4209	Žabnica
00050000-5693-d0e7-14b1-9522d3457e44	3310	Žalec
00050000-5693-d0e7-6314-82b26a60deaa	4228	Železniki
00050000-5693-d0e7-9014-2bfca576f6ba	2287	Žetale
00050000-5693-d0e7-7498-c35f13adad3c	4226	Žiri
00050000-5693-d0e7-5419-fa6129a2fcd4	4274	Žirovnica
00050000-5693-d0e7-9102-31bce2321435	8360	Žužemberk
\.


--
-- TOC entry 3194 (class 0 OID 35053723)
-- Dependencies: 242
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 35053291)
-- Dependencies: 215
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 35053022)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5693-d0eb-aa96-60c61ef00637	00080000-5693-d0eb-3d72-42802596c3b1	\N	00040000-5693-d0e7-41a7-25afd6bee612	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5693-d0eb-fe72-fe7f92378f26	00080000-5693-d0eb-3d72-42802596c3b1	\N	00040000-5693-d0e7-41a7-25afd6bee612	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5693-d0eb-1ce4-12018c2ce0c7	00080000-5693-d0eb-220e-4b7ab8551e8c	\N	00040000-5693-d0e7-41a7-25afd6bee612	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3154 (class 0 OID 35053166)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5693-d0e8-239f-747a2b076095	novo leto	1	1	\N	t
00430000-5693-d0e8-ed79-9c82ce824046	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5693-d0e8-833d-63b3bbfca4b9	dan upora proti okupatorju	27	4	\N	t
00430000-5693-d0e8-0d2d-b3eb95f5a668	praznik dela	1	5	\N	t
00430000-5693-d0e8-b887-57eba98fc590	praznik dela	2	5	\N	t
00430000-5693-d0e8-4dd9-528ed79fa6e2	dan Primoža Trubarja	8	6	\N	f
00430000-5693-d0e8-7d2f-c127c005f9fc	dan državnosti	25	6	\N	t
00430000-5693-d0e8-c084-576e732684e8	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5693-d0e8-6f46-124784eb11af	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5693-d0e8-15e9-dff4a97feb29	dan suverenosti	25	10	\N	f
00430000-5693-d0e8-8a4a-440abc662c07	dan spomina na mrtve	1	11	\N	t
00430000-5693-d0e8-c173-6599ad3a50a7	dan Rudolfa Maistra	23	11	\N	f
00430000-5693-d0e8-4da9-bee0f2153053	božič	25	12	\N	t
00430000-5693-d0e8-7ff0-88a6f9d80541	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5693-d0e8-9ef9-360d363d04f6	Marijino vnebovzetje	15	8	\N	t
00430000-5693-d0e8-8d9a-62066c8df634	dan reformacije	31	10	\N	t
00430000-5693-d0e8-a1ae-0234f184b113	velikonočna nedelja	27	3	2016	t
00430000-5693-d0e8-b4a9-f5c09d2c2fa7	velikonočna nedelja	16	4	2017	t
00430000-5693-d0e8-4751-ef9b0298a8ea	velikonočna nedelja	1	4	2018	t
00430000-5693-d0e8-1fdf-0f665e6b2785	velikonočna nedelja	21	4	2019	t
00430000-5693-d0e8-c06a-997f81413f28	velikonočna nedelja	12	4	2020	t
00430000-5693-d0e8-b02d-e9ac6a0e3ed2	velikonočna nedelja	4	4	2021	t
00430000-5693-d0e8-ac5a-d1d34c095cf4	velikonočna nedelja	17	4	2022	t
00430000-5693-d0e8-1ff7-803367402478	velikonočna nedelja	9	4	2023	t
00430000-5693-d0e8-6777-037decdba308	velikonočna nedelja	31	3	2024	t
00430000-5693-d0e8-e141-6c3466c52935	velikonočna nedelja	20	4	2025	t
00430000-5693-d0e8-b534-016f0439cf7b	velikonočna nedelja	5	4	2026	t
00430000-5693-d0e8-141e-bc6c11305d6f	velikonočna nedelja	28	3	2027	t
00430000-5693-d0e8-1c75-b9548b4f8a73	velikonočna nedelja	16	4	2028	t
00430000-5693-d0e8-2916-3ce6f4db8c78	velikonočna nedelja	1	4	2029	t
00430000-5693-d0e8-042b-679cc77f2c21	velikonočna nedelja	21	4	2030	t
00430000-5693-d0e8-7646-ce14c5f38301	velikonočni ponedeljek	28	3	2016	t
00430000-5693-d0e8-7320-a6719f69a0a3	velikonočni ponedeljek	17	4	2017	t
00430000-5693-d0e8-bb16-9de05cf5f4e0	velikonočni ponedeljek	2	4	2018	t
00430000-5693-d0e8-58cd-665b5e704a7d	velikonočni ponedeljek	22	4	2019	t
00430000-5693-d0e8-9efb-68f4f067589e	velikonočni ponedeljek	13	4	2020	t
00430000-5693-d0e8-4083-f2ad106615b1	velikonočni ponedeljek	5	4	2021	t
00430000-5693-d0e8-0f45-7c2a6ba60f8a	velikonočni ponedeljek	18	4	2022	t
00430000-5693-d0e8-73d0-9da4660beff1	velikonočni ponedeljek	10	4	2023	t
00430000-5693-d0e8-dcfe-b2239a6eedad	velikonočni ponedeljek	1	4	2024	t
00430000-5693-d0e8-409d-f8d1ea9b45a2	velikonočni ponedeljek	21	4	2025	t
00430000-5693-d0e8-1582-23be3b64ba69	velikonočni ponedeljek	6	4	2026	t
00430000-5693-d0e8-537d-adb741601ca0	velikonočni ponedeljek	29	3	2027	t
00430000-5693-d0e8-ffde-12cb27268593	velikonočni ponedeljek	17	4	2028	t
00430000-5693-d0e8-a19e-5c433bfa4939	velikonočni ponedeljek	2	4	2029	t
00430000-5693-d0e8-e20c-de71e3fff86e	velikonočni ponedeljek	22	4	2030	t
00430000-5693-d0e8-d638-a18c610bf674	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5693-d0e8-a78a-9d8a3625d264	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5693-d0e8-e7c8-818a2043cd49	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5693-d0e8-de72-c6c796fce3ed	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5693-d0e8-db43-48982fad8bbd	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5693-d0e8-699c-4d51fb49c567	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5693-d0e8-6b61-4c060d70c8a0	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5693-d0e8-699e-90bf5a026301	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5693-d0e8-61c4-284906effbfc	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5693-d0e8-6070-f67f4ecd29b4	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5693-d0e8-5323-0b6d30d511d3	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5693-d0e8-aa74-ee733a57cdce	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5693-d0e8-d097-0e27bd45f7fa	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5693-d0e8-e16d-916990fe8a33	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5693-d0e8-90df-730d3d42c3fb	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3150 (class 0 OID 35053126)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 35053138)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 35053303)
-- Dependencies: 217
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 35053737)
-- Dependencies: 243
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 35053747)
-- Dependencies: 244
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5693-d0eb-2622-4441729157ba	00080000-5693-d0eb-efe0-96a9bb19d5ae	0987	AK
00190000-5693-d0eb-a6a3-a6ce39db7470	00080000-5693-d0eb-220e-4b7ab8551e8c	0989	AK
00190000-5693-d0eb-5586-f60357705f16	00080000-5693-d0eb-8565-669bde5b7fd8	0986	AK
00190000-5693-d0eb-7397-8c2b17fc2529	00080000-5693-d0eb-5027-16ba8da0d8f4	0984	AK
00190000-5693-d0eb-3517-de096f864c82	00080000-5693-d0eb-6e3b-69e908661c22	0983	AK
00190000-5693-d0eb-c86a-da0b497b7362	00080000-5693-d0eb-bb9d-364e75ebe3cc	0982	AK
00190000-5693-d0ed-26f6-27b052c4bf65	00080000-5693-d0ed-56e9-b61899877ea0	1001	AK
\.


--
-- TOC entry 3193 (class 0 OID 35053636)
-- Dependencies: 241
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5693-d0eb-33e9-a1bca3dac785	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3197 (class 0 OID 35053755)
-- Dependencies: 245
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 35053332)
-- Dependencies: 221
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5693-d0ea-fa93-60a0420e9d04	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5693-d0ea-43e6-1e7b17306d7e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5693-d0ea-f3d5-67fd2edd9d8c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5693-d0ea-9608-966590e2ab9c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5693-d0ea-ffe0-66e41343ff55	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5693-d0ea-a83a-ca70b0ba9219	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5693-d0ea-38b3-47b63d0eb2d2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3165 (class 0 OID 35053276)
-- Dependencies: 213
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 35053266)
-- Dependencies: 212
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 35053474)
-- Dependencies: 234
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 35053404)
-- Dependencies: 228
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 35053100)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 35052862)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5693-d0ed-56e9-b61899877ea0	00010000-5693-d0e9-8a8b-f5677b02e00c	2016-01-11 16:57:33	INS	a:0:{}
2	App\\Entity\\Option	00000000-5693-d0ed-ddf0-aa45167791c3	00010000-5693-d0e9-8a8b-f5677b02e00c	2016-01-11 16:57:33	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5693-d0ed-26f6-27b052c4bf65	00010000-5693-d0e9-8a8b-f5677b02e00c	2016-01-11 16:57:33	INS	a:0:{}
\.


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3174 (class 0 OID 35053345)
-- Dependencies: 222
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 35052900)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5693-d0e8-14fb-27d8d9f0400c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5693-d0e8-764e-f214d1b38d0d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5693-d0e8-4057-3165daf92ae2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5693-d0e8-0486-aa69f87da56d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5693-d0e8-1f9f-71566878a07f	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5693-d0e8-ba28-ba6e8d0bef09	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5693-d0e8-491d-451e06ef1b7b	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5693-d0e8-2b50-1019e859be6e	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5693-d0e8-0705-8774fbe59d1a	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5693-d0e8-ae69-d07b26fe91cb	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5693-d0e8-57a6-001600ed0afc	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5693-d0e8-bfef-a442a0fba142	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5693-d0e8-2848-1f252d6346a7	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5693-d0e8-e703-c661c2a79a6b	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5693-d0e8-320d-8dc171d2b14a	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5693-d0e8-f7dc-78247df25253	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5693-d0e8-b052-c24b0077a828	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5693-d0e8-0119-a6238b1fcfb5	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5693-d0e8-630a-0325f152ba44	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5693-d0e8-09d8-85dab0e6977b	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5693-d0e8-398f-6ac0f5828902	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5693-d0e8-398d-406277cc5a5b	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5693-d0e8-4cf5-6e2524fba1cf	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5693-d0e8-262d-8eae9b3af8fe	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5693-d0e8-74f4-160392cb124b	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5693-d0e8-a412-781c3c19ddff	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5693-d0e8-c8cd-e5256d4b5e61	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5693-d0e8-3180-71bf3c9e4099	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5693-d0e8-35b7-603cc6f7f902	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5693-d0e8-3bd9-2e0c75ef2e14	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5693-d0e8-9f0d-56b67c30b0eb	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5693-d0e8-1f60-917f310a31e6	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5693-d0e8-a900-ce9962394652	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5693-d0e8-312d-51ad3f961fee	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5693-d0e8-1ba4-762b29e17b40	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5693-d0e8-e47e-1bc23fa534a2	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5693-d0e8-2870-e42d121f915c	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5693-d0e8-6803-4d45187048f7	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5693-d0e8-a9de-02e0cf924b90	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5693-d0e8-db25-70c359d832ea	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5693-d0e8-1757-1ee700992cbb	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5693-d0e8-3728-734cf215ca96	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5693-d0e8-6621-0a337d2523f2	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5693-d0e8-62aa-3126c6a6a871	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5693-d0e8-a53d-446a5e896001	direktor	minimalne pravice za direktorja	t
00020000-5693-d0e8-c4c1-ab6913973ea4	arhivar	arhivar	t
00020000-5693-d0e8-2f63-e242c21dd0f3	dramaturg	dramaturg	t
00020000-5693-d0e8-c687-23d21ef146cb	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5693-d0e8-373a-6ff1a843727c	poslovni-sekretar	poslovni sekretar	t
00020000-5693-d0e8-d4ed-264c7092e34e	vodja-tehnike	vodja tehnike	t
00020000-5693-d0e8-d596-a1d8dc0b86a6	racunovodja	računovodja	t
00020000-5693-d0ea-10e1-a434fbffb950	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5693-d0ea-bb67-e7b0093c39a1	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-b002-df254e83187d	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-2049-1126dc9137c5	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-9bf7-13f047479569	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-6855-8e7c6213e2ba	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-14be-9daffaab36f3	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-1c4b-312f98053ce0	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-751a-2b92af024ece	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-74c4-73b1c4fbfd15	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-561d-c14644478dd3	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-9b8d-8a3af0fc8d7e	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-47f9-e6e27c361fb6	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-ee55-134700794ae6	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-b20a-d9080a68d7a1	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-9228-e095bcc91b74	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-a74c-a736cfc14748	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-ab3e-c9920c6340c6	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-ceb0-bb5a7e046089	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-1a43-58def7de2e54	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5693-d0ea-1cf5-176ea13d26c5	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-02d7-ad0d92d8b6d4	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-de57-85aae31f1e2c	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-2381-fba54b71acd5	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-2d92-4ae933019315	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-be18-201276d84a48	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-7279-2f09772d9b3e	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-411b-2182a71efe50	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-925b-ddc7af80765e	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-3f13-0c3cdf0f1b18	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-f600-abf1dd68f145	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-3534-ccb23ad5770b	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-5c9b-53751a3c7cce	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-e59e-32b8a8c86904	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-9cae-109819928454	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-9d13-d4ba66bb93f4	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-66ea-d3de008555c9	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-7988-4f7fdce4d292	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5693-d0ea-da69-d231c2d518d2	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3129 (class 0 OID 35052884)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5693-d0e9-a252-33433cf36bc3	00020000-5693-d0e8-4057-3165daf92ae2
00010000-5693-d0e9-8a8b-f5677b02e00c	00020000-5693-d0e8-4057-3165daf92ae2
00010000-5693-d0eb-163c-8bdd364233f6	00020000-5693-d0ea-10e1-a434fbffb950
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-bb67-e7b0093c39a1
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-6855-8e7c6213e2ba
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-74c4-73b1c4fbfd15
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-9b8d-8a3af0fc8d7e
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-ee55-134700794ae6
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-ceb0-bb5a7e046089
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-2049-1126dc9137c5
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-1cf5-176ea13d26c5
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-2381-fba54b71acd5
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-be18-201276d84a48
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-411b-2182a71efe50
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-3f13-0c3cdf0f1b18
00010000-5693-d0eb-ab0c-9a216960290d	00020000-5693-d0ea-e59e-32b8a8c86904
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-bb67-e7b0093c39a1
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-b002-df254e83187d
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-2049-1126dc9137c5
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-9bf7-13f047479569
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-ee55-134700794ae6
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-a74c-a736cfc14748
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-1cf5-176ea13d26c5
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-2381-fba54b71acd5
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-be18-201276d84a48
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-411b-2182a71efe50
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-3f13-0c3cdf0f1b18
00010000-5693-d0eb-7a45-c583444ec5d3	00020000-5693-d0ea-e59e-32b8a8c86904
00010000-5693-d0eb-204b-b75f92f5b6c4	00020000-5693-d0ea-bb67-e7b0093c39a1
00010000-5693-d0eb-204b-b75f92f5b6c4	00020000-5693-d0ea-b002-df254e83187d
00010000-5693-d0eb-204b-b75f92f5b6c4	00020000-5693-d0ea-2049-1126dc9137c5
00010000-5693-d0eb-204b-b75f92f5b6c4	00020000-5693-d0ea-9bf7-13f047479569
00010000-5693-d0eb-204b-b75f92f5b6c4	00020000-5693-d0ea-9b8d-8a3af0fc8d7e
00010000-5693-d0eb-204b-b75f92f5b6c4	00020000-5693-d0ea-ee55-134700794ae6
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-b002-df254e83187d
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-14be-9daffaab36f3
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-561d-c14644478dd3
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-47f9-e6e27c361fb6
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-9b8d-8a3af0fc8d7e
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-ab3e-c9920c6340c6
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-ee55-134700794ae6
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-b20a-d9080a68d7a1
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-1cf5-176ea13d26c5
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-02d7-ad0d92d8b6d4
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-2381-fba54b71acd5
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-2d92-4ae933019315
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-be18-201276d84a48
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-7279-2f09772d9b3e
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-411b-2182a71efe50
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-925b-ddc7af80765e
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-3f13-0c3cdf0f1b18
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-f600-abf1dd68f145
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-e59e-32b8a8c86904
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-9cae-109819928454
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-66ea-d3de008555c9
00010000-5693-d0eb-fc35-0da2e800cbde	00020000-5693-d0ea-7988-4f7fdce4d292
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-b002-df254e83187d
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-14be-9daffaab36f3
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-751a-2b92af024ece
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-561d-c14644478dd3
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-47f9-e6e27c361fb6
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-9b8d-8a3af0fc8d7e
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-ab3e-c9920c6340c6
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-ee55-134700794ae6
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-b20a-d9080a68d7a1
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-9228-e095bcc91b74
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-1cf5-176ea13d26c5
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-02d7-ad0d92d8b6d4
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-de57-85aae31f1e2c
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-2381-fba54b71acd5
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-2d92-4ae933019315
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-be18-201276d84a48
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-7279-2f09772d9b3e
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-411b-2182a71efe50
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-925b-ddc7af80765e
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-3f13-0c3cdf0f1b18
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-f600-abf1dd68f145
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-e59e-32b8a8c86904
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-9cae-109819928454
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-9d13-d4ba66bb93f4
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-66ea-d3de008555c9
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-7988-4f7fdce4d292
00010000-5693-d0eb-b7dd-02bf7f5593c7	00020000-5693-d0ea-da69-d231c2d518d2
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-b002-df254e83187d
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-2049-1126dc9137c5
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-14be-9daffaab36f3
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-1c4b-312f98053ce0
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-751a-2b92af024ece
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-6855-8e7c6213e2ba
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-561d-c14644478dd3
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-47f9-e6e27c361fb6
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-9b8d-8a3af0fc8d7e
00010000-5693-d0eb-1218-802766a7bd48	00020000-5693-d0ea-ab3e-c9920c6340c6
00010000-5693-d0eb-73ec-0c9cc40f27e1	00020000-5693-d0ea-bb67-e7b0093c39a1
00010000-5693-d0eb-73ec-0c9cc40f27e1	00020000-5693-d0ea-9bf7-13f047479569
00010000-5693-d0eb-73ec-0c9cc40f27e1	00020000-5693-d0ea-6855-8e7c6213e2ba
00010000-5693-d0eb-73ec-0c9cc40f27e1	00020000-5693-d0ea-74c4-73b1c4fbfd15
00010000-5693-d0eb-73ec-0c9cc40f27e1	00020000-5693-d0ea-9b8d-8a3af0fc8d7e
00010000-5693-d0eb-73ec-0c9cc40f27e1	00020000-5693-d0ea-ee55-134700794ae6
00010000-5693-d0eb-73ec-0c9cc40f27e1	00020000-5693-d0ea-ceb0-bb5a7e046089
00010000-5693-d0eb-73ec-0c9cc40f27e1	00020000-5693-d0ea-3534-ccb23ad5770b
00010000-5693-d0eb-118a-13680b3423de	00020000-5693-d0ea-1a43-58def7de2e54
00010000-5693-d0eb-ee46-1061c743a280	00020000-5693-d0e8-a53d-446a5e896001
00010000-5693-d0eb-068f-4c72ad4e7d05	00020000-5693-d0e8-c4c1-ab6913973ea4
00010000-5693-d0eb-902d-8f13961d31d7	00020000-5693-d0e8-2f63-e242c21dd0f3
00010000-5693-d0eb-3daa-a4f670aa2bd2	00020000-5693-d0e8-c687-23d21ef146cb
00010000-5693-d0eb-b543-0eff72fca854	00020000-5693-d0e8-373a-6ff1a843727c
00010000-5693-d0eb-b883-509c78339c13	00020000-5693-d0e8-d4ed-264c7092e34e
00010000-5693-d0eb-3ce2-b807da1762f6	00020000-5693-d0e8-d596-a1d8dc0b86a6
\.


--
-- TOC entry 3176 (class 0 OID 35053359)
-- Dependencies: 224
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 35053297)
-- Dependencies: 216
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 35053226)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5693-d0eb-5a43-dd55d5ef3e01	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5693-d0eb-7dea-892cf506ba15	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5693-d0eb-37da-1714fd0e686f	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3125 (class 0 OID 35052849)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5693-d0e7-db1c-8eaf0988d3a9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5693-d0e7-9217-8d4a5f0a3672	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5693-d0e7-bfa8-b4ba0fd056f3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5693-d0e7-086c-4b227b5e03cb	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5693-d0e7-8cce-224fcb736226	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3124 (class 0 OID 35052841)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5693-d0e7-c751-c42186039418	00230000-5693-d0e7-086c-4b227b5e03cb	popa
00240000-5693-d0e7-72ee-5afe32c38546	00230000-5693-d0e7-086c-4b227b5e03cb	oseba
00240000-5693-d0e7-d7ff-834cdec37709	00230000-5693-d0e7-086c-4b227b5e03cb	tippopa
00240000-5693-d0e7-ab21-20513ed92d66	00230000-5693-d0e7-086c-4b227b5e03cb	organizacijskaenota
00240000-5693-d0e7-7f5b-9590e91a0243	00230000-5693-d0e7-086c-4b227b5e03cb	sezona
00240000-5693-d0e7-5579-f83762da511e	00230000-5693-d0e7-086c-4b227b5e03cb	tipvaje
00240000-5693-d0e7-638c-b43d74b1da6e	00230000-5693-d0e7-086c-4b227b5e03cb	tipdodatka
00240000-5693-d0e7-c9a9-699a60b695e0	00230000-5693-d0e7-9217-8d4a5f0a3672	prostor
00240000-5693-d0e7-5e7c-765f515f47e9	00230000-5693-d0e7-086c-4b227b5e03cb	besedilo
00240000-5693-d0e7-b3e8-6908fc128f36	00230000-5693-d0e7-086c-4b227b5e03cb	uprizoritev
00240000-5693-d0e7-8ee9-6f8473a860dc	00230000-5693-d0e7-086c-4b227b5e03cb	funkcija
00240000-5693-d0e7-fe12-0e770ee5e9a4	00230000-5693-d0e7-086c-4b227b5e03cb	tipfunkcije
00240000-5693-d0e7-1146-88193e11ee76	00230000-5693-d0e7-086c-4b227b5e03cb	alternacija
00240000-5693-d0e7-8bdd-14250c4fcf84	00230000-5693-d0e7-db1c-8eaf0988d3a9	pogodba
00240000-5693-d0e7-aa5a-abb1b938bcbc	00230000-5693-d0e7-086c-4b227b5e03cb	zaposlitev
00240000-5693-d0e7-77f9-307782245f10	00230000-5693-d0e7-086c-4b227b5e03cb	zvrstuprizoritve
00240000-5693-d0e7-3ea0-6feb056922af	00230000-5693-d0e7-db1c-8eaf0988d3a9	programdela
00240000-5693-d0e7-e65f-2641fc34a17e	00230000-5693-d0e7-086c-4b227b5e03cb	zapis
\.


--
-- TOC entry 3123 (class 0 OID 35052836)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
6c54b94e-e431-430e-ad5d-7ffb741e26ac	00240000-5693-d0e7-c751-c42186039418	0	1001
\.


--
-- TOC entry 3182 (class 0 OID 35053421)
-- Dependencies: 230
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5693-d0eb-1f8b-6b71a89f4445	000e0000-5693-d0eb-f842-409b98971a43	00080000-5693-d0eb-3d72-42802596c3b1	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5693-d0e8-9991-438bf227ca32
00270000-5693-d0eb-1960-cbc6e1200a04	000e0000-5693-d0eb-f842-409b98971a43	00080000-5693-d0eb-3d72-42802596c3b1	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5693-d0e8-9991-438bf227ca32
\.


--
-- TOC entry 3139 (class 0 OID 35052984)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 35053236)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5693-d0eb-15be-8dbf889b2f30	00180000-5693-d0eb-12e2-4249860e1d66	000c0000-5693-d0eb-49b0-9190bba15bf5	00090000-5693-d0eb-4cfe-4e0ed0e0f5c7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-d0eb-728d-c84aebc83dde	00180000-5693-d0eb-12e2-4249860e1d66	000c0000-5693-d0eb-e7dd-d0f439cfcdeb	00090000-5693-d0eb-0aae-1fb1a4f5c75a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-d0eb-a48d-cee5e221d07c	00180000-5693-d0eb-12e2-4249860e1d66	000c0000-5693-d0eb-b870-402925f21521	00090000-5693-d0eb-3e04-13a7671e256d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-d0eb-9808-9b0c3dd8d940	00180000-5693-d0eb-12e2-4249860e1d66	000c0000-5693-d0eb-1282-61eee87d653d	00090000-5693-d0eb-07b4-5850984db8eb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-d0eb-bb36-9ca439cef6cb	00180000-5693-d0eb-12e2-4249860e1d66	000c0000-5693-d0eb-744d-a93fc97d67d0	00090000-5693-d0eb-1fda-e5c6b6b0dd7f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5693-d0eb-2d8e-12f5cc28f3c0	00180000-5693-d0eb-708f-9efac839d163	\N	00090000-5693-d0eb-1fda-e5c6b6b0dd7f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5693-d0eb-fbd2-f9d865195443	00180000-5693-d0eb-708f-9efac839d163	\N	00090000-5693-d0eb-0aae-1fb1a4f5c75a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3163 (class 0 OID 35053256)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5693-d0e7-e31e-86d80303fdce	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5693-d0e7-219d-947e89b5a1cc	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5693-d0e7-1afb-6aaaaadeba95	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5693-d0e7-9095-733c1d0af2c2	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5693-d0e7-f27a-981c9aceaf3b	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5693-d0e7-5532-79b2d78490aa	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3185 (class 0 OID 35053462)
-- Dependencies: 233
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5693-d0e7-9417-f9af04761c97	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5693-d0e7-566c-308e0a2d3fdd	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5693-d0e7-848f-6fdbf0119efd	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5693-d0e7-662c-9d991f48b04c	04	Režija	Režija	Režija	umetnik	30
000f0000-5693-d0e7-d6ca-028cf96e4d98	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5693-d0e7-6f52-f87ea05872f7	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5693-d0e7-c778-6e206469dff1	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5693-d0e7-07dd-88194b0ae936	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5693-d0e7-e120-18d2816994b6	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5693-d0e7-9187-fc4947f8d11b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5693-d0e7-c7de-8770d9b88595	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5693-d0e7-b1ba-0e32992f4f9c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5693-d0e7-8df9-ad6109e93892	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5693-d0e7-95ee-7516779fd2d8	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5693-d0e7-0f19-860d0e4b4e73	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5693-d0e7-10b3-8eb0077a2cd1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5693-d0e7-179d-42f7585d5589	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5693-d0e7-6107-7c2a0e0294a3	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3136 (class 0 OID 35052935)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5693-d0ea-e391-e2006b528465	0001	šola	osnovna ali srednja šola
00400000-5693-d0ea-35b6-7c2e76dde4a9	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5693-d0ea-d0ad-163613459a6c	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3198 (class 0 OID 35053767)
-- Dependencies: 246
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5693-d0e7-9425-5f40fb4646bf	01	Velika predstava	f	1.00	1.00
002b0000-5693-d0e7-6dad-3b6484581d36	02	Mala predstava	f	0.50	0.50
002b0000-5693-d0e7-ef23-63e14b254feb	03	Mala koprodukcija	t	0.40	1.00
002b0000-5693-d0e7-1b55-d3a83358d85b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5693-d0e7-a11c-5de74b7d67ef	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3159 (class 0 OID 35053216)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5693-d0e7-06df-1998149a3b26	0001	prva vaja	prva vaja
00420000-5693-d0e7-7c12-853ce1f7facc	0002	tehnična vaja	tehnična vaja
00420000-5693-d0e7-3e4e-058cdf2db4f8	0003	lučna vaja	lučna vaja
00420000-5693-d0e7-39d2-02ba25c116ba	0004	kostumska vaja	kostumska vaja
00420000-5693-d0e7-8fcd-e7c877d61b0a	0005	foto vaja	foto vaja
00420000-5693-d0e7-91e5-84aed32681e2	0006	1. glavna vaja	1. glavna vaja
00420000-5693-d0e7-c048-12751e42599f	0007	2. glavna vaja	2. glavna vaja
00420000-5693-d0e7-d9ad-77db88fb007d	0008	1. generalka	1. generalka
00420000-5693-d0e7-7d07-49b89e818edf	0009	2. generalka	2. generalka
00420000-5693-d0e7-eaf2-b730cde01b3f	0010	odprta generalka	odprta generalka
00420000-5693-d0e7-b0de-8ec3e903040f	0011	obnovitvena vaja	obnovitvena vaja
00420000-5693-d0e7-e577-f8717d0942c4	0012	italijanka	krajša "obnovitvena" vaja
00420000-5693-d0e7-b353-19f2c3555ad1	0013	pevska vaja	pevska vaja
00420000-5693-d0e7-aede-1b6efe5e5c85	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5693-d0e7-9a90-9e7b435d2830	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3145 (class 0 OID 35053057)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 35052871)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5693-d0e9-8a8b-f5677b02e00c	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROFFJHlMjpHueo4o4lRTl07/e4VyN30hS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-bb12-376b049ad59b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-0d67-e38505965005	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-7f90-8ad137c98817	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-2345-2a1a189bc380	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-750c-9a252ae15e8a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-d092-c74e937ff2de	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-520f-94918165323b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-61d5-4f6f2b4425e5	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-a825-115b3663684f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-163c-8bdd364233f6	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-0628-b08197248c8a	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-ab0c-9a216960290d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-7a45-c583444ec5d3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-204b-b75f92f5b6c4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-fc35-0da2e800cbde	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-b7dd-02bf7f5593c7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-1218-802766a7bd48	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-73ec-0c9cc40f27e1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-118a-13680b3423de	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-ee46-1061c743a280	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-068f-4c72ad4e7d05	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-902d-8f13961d31d7	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-3daa-a4f670aa2bd2	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-b543-0eff72fca854	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-b883-509c78339c13	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5693-d0eb-3ce2-b807da1762f6	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5693-d0e9-a252-33433cf36bc3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3189 (class 0 OID 35053512)
-- Dependencies: 237
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5693-d0eb-8aec-13a6cc03a444	00160000-5693-d0ea-47d6-6dfa122beba4	\N	00140000-5693-d0e7-d512-c930afc1d86e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5693-d0ea-ffe0-66e41343ff55
000e0000-5693-d0eb-f842-409b98971a43	00160000-5693-d0ea-64d2-9cdcdfa9004c	\N	00140000-5693-d0e7-c21b-091aa6f100c3	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5693-d0ea-a83a-ca70b0ba9219
000e0000-5693-d0eb-7797-a8d1bb345995	\N	\N	00140000-5693-d0e7-c21b-091aa6f100c3	00190000-5693-d0eb-2622-4441729157ba	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5693-d0ea-ffe0-66e41343ff55
000e0000-5693-d0eb-5686-3cee87579ecb	\N	\N	00140000-5693-d0e7-c21b-091aa6f100c3	00190000-5693-d0eb-2622-4441729157ba	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5693-d0ea-ffe0-66e41343ff55
000e0000-5693-d0eb-7ced-3ba1abd90388	\N	\N	00140000-5693-d0e7-c21b-091aa6f100c3	00190000-5693-d0eb-2622-4441729157ba	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-f17e-b79e21a44b33	\N	\N	00140000-5693-d0e7-c21b-091aa6f100c3	00190000-5693-d0eb-2622-4441729157ba	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-6ced-130e182ecc57	\N	\N	00140000-5693-d0e7-db34-4e68d142cc09	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-4255-5d3185d245ea	\N	\N	00140000-5693-d0e7-db34-4e68d142cc09	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-0509-7815f4fe6583	\N	\N	00140000-5693-d0e7-db34-4e68d142cc09	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-8634-c8cb5e429512	\N	\N	00140000-5693-d0e7-db34-4e68d142cc09	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-88fc-8d75c282a9ca	\N	\N	00140000-5693-d0e7-db34-4e68d142cc09	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-3e8b-a9ea00b0d182	\N	\N	00140000-5693-d0e7-db34-4e68d142cc09	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-4e9d-ecb524d03e16	\N	\N	00140000-5693-d0e7-db34-4e68d142cc09	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-0b00-5b589dcb4f20	\N	\N	00140000-5693-d0e7-db34-4e68d142cc09	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
000e0000-5693-d0eb-26ca-9e57b527097c	\N	\N	00140000-5693-d0e7-db34-4e68d142cc09	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5693-d0ea-fa93-60a0420e9d04
\.


--
-- TOC entry 3153 (class 0 OID 35053156)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5693-d0eb-d923-bb734e8df1f3	\N	000e0000-5693-d0eb-f842-409b98971a43	1	
00200000-5693-d0eb-31e5-3d33a9dbff7a	\N	000e0000-5693-d0eb-f842-409b98971a43	2	
00200000-5693-d0eb-6b3a-41e5fe80b6f7	\N	000e0000-5693-d0eb-f842-409b98971a43	3	
00200000-5693-d0eb-64cb-c424fa503271	\N	000e0000-5693-d0eb-f842-409b98971a43	4	
00200000-5693-d0eb-6753-3af957a0fb83	\N	000e0000-5693-d0eb-f842-409b98971a43	5	
\.


--
-- TOC entry 3172 (class 0 OID 35053324)
-- Dependencies: 220
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 35053435)
-- Dependencies: 231
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5693-d0e8-ee6f-4f2605b66b54	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5693-d0e8-425d-5a136ae4d0b5	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5693-d0e8-fde4-d6b72f872ec0	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5693-d0e8-eeee-6ac82f024331	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5693-d0e8-4ae2-1adde2788f27	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5693-d0e8-0224-c48a4b18c2f2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5693-d0e8-7e32-4925802ec8eb	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5693-d0e8-3e41-5d0ac5832970	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5693-d0e8-9991-438bf227ca32	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5693-d0e8-e3f7-e22361d3f29c	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5693-d0e8-d541-b2509652c65b	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5693-d0e8-502e-f5ffa72d23f0	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5693-d0e8-547f-f42077aa87f7	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5693-d0e8-8741-217e638d2843	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5693-d0e8-3856-65f815ebf04e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5693-d0e8-8f42-d1cdbcbeab1d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5693-d0e8-3d81-cb61a69f527d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5693-d0e8-b8d0-dc74113590ff	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5693-d0e8-273a-3bd3f82c41e5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5693-d0e8-f008-812265388140	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5693-d0e8-c23d-460fb0e53d17	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5693-d0e8-858b-a52edef73b0f	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5693-d0e8-2e71-7b0395f6cd57	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5693-d0e8-2538-bd0c49e471e5	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5693-d0e8-3fc8-ad0861261ab4	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5693-d0e8-8c5d-55b8abda7294	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5693-d0e8-92ac-43bf97220625	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5693-d0e8-1b7c-09d309aba3df	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3201 (class 0 OID 35053817)
-- Dependencies: 249
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 35053786)
-- Dependencies: 248
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 35053829)
-- Dependencies: 250
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 35053397)
-- Dependencies: 227
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5693-d0eb-66cd-27b1371fe6ab	00090000-5693-d0eb-0aae-1fb1a4f5c75a	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-d0eb-1d41-e9c2bf456e4a	00090000-5693-d0eb-3e04-13a7671e256d	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-d0eb-ae37-53ee81a7148b	00090000-5693-d0eb-8a7b-5c0f133a9123	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-d0eb-917c-ae8aab369183	00090000-5693-d0eb-8b97-d143747b90a5	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-d0eb-74a7-307114a8333f	00090000-5693-d0eb-0816-5257930aa271	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5693-d0eb-eede-a4199e9548d1	00090000-5693-d0eb-40a0-a50ffee4ce69	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3156 (class 0 OID 35053200)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 35053502)
-- Dependencies: 236
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5693-d0e7-d512-c930afc1d86e	01	Drama	drama (SURS 01)
00140000-5693-d0e7-1217-02dad83d3f6e	02	Opera	opera (SURS 02)
00140000-5693-d0e7-7a61-d22983347b06	03	Balet	balet (SURS 03)
00140000-5693-d0e7-820b-16be072db9a0	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5693-d0e7-db34-4e68d142cc09	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5693-d0e7-c21b-091aa6f100c3	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5693-d0e7-5652-a2c8d7917f98	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3178 (class 0 OID 35053387)
-- Dependencies: 226
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2608 (class 2606 OID 35052934)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 35053561)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 35053551)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 35052925)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 35053418)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 35053460)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 35053870)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 35053253)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 35053188)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 35053210)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 35053215)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 35053784)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 35053083)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 35053630)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 35053383)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 35053154)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 35053121)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 35053097)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 35053289)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 35053847)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 35053854)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2897 (class 2606 OID 35053878)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2754 (class 2606 OID 35053316)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 35053055)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 35052953)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 35053017)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 35052980)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 35052914)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2597 (class 2606 OID 35052899)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 35053322)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 35053358)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 35053497)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 35053008)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 35053043)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 35053735)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 35053295)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 35053033)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 35053173)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 35053142)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2675 (class 2606 OID 35053134)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 35053307)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 35053744)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 35053752)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 35053722)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 35053765)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 35053340)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 35053280)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 35053271)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 35053484)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 35053411)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 35053109)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 35052870)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 35053349)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 35052888)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2599 (class 2606 OID 35052908)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 35053367)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 35053302)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 35053234)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 35052858)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 35052846)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 35052840)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 35053431)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 35052989)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 35053245)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 35053263)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 35053471)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 35052942)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 35053777)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 35053223)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 35053068)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 35052883)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 35053530)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 35053163)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 35053330)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 35053443)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 35053827)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 35053811)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 35053835)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 35053401)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 35053204)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 35053510)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 35053395)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 1259 OID 35053198)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2692 (class 1259 OID 35053199)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2693 (class 1259 OID 35053197)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2694 (class 1259 OID 35053196)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2695 (class 1259 OID 35053195)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2797 (class 1259 OID 35053432)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2798 (class 1259 OID 35053433)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2799 (class 1259 OID 35053434)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2883 (class 1259 OID 35053849)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2884 (class 1259 OID 35053848)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2626 (class 1259 OID 35053010)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2627 (class 1259 OID 35053011)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2755 (class 1259 OID 35053323)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2870 (class 1259 OID 35053815)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2871 (class 1259 OID 35053814)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2872 (class 1259 OID 35053816)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2873 (class 1259 OID 35053813)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2874 (class 1259 OID 35053812)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2749 (class 1259 OID 35053309)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2750 (class 1259 OID 35053308)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2683 (class 1259 OID 35053164)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2684 (class 1259 OID 35053165)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2779 (class 1259 OID 35053384)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2780 (class 1259 OID 35053386)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2781 (class 1259 OID 35053385)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2658 (class 1259 OID 35053099)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 35053098)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2861 (class 1259 OID 35053766)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2813 (class 1259 OID 35053499)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2814 (class 1259 OID 35053500)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2815 (class 1259 OID 35053501)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2880 (class 1259 OID 35053836)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2822 (class 1259 OID 35053535)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2823 (class 1259 OID 35053532)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2824 (class 1259 OID 35053536)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2825 (class 1259 OID 35053534)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2826 (class 1259 OID 35053533)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2648 (class 1259 OID 35053070)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 35053069)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 35052983)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2767 (class 1259 OID 35053350)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2601 (class 1259 OID 35052915)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2602 (class 1259 OID 35052916)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2772 (class 1259 OID 35053370)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2773 (class 1259 OID 35053369)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2774 (class 1259 OID 35053368)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2631 (class 1259 OID 35053020)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2632 (class 1259 OID 35053019)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2633 (class 1259 OID 35053021)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2671 (class 1259 OID 35053137)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2672 (class 1259 OID 35053135)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 35053136)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2581 (class 1259 OID 35052848)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2729 (class 1259 OID 35053275)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2730 (class 1259 OID 35053273)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2731 (class 1259 OID 35053272)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2732 (class 1259 OID 35053274)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2592 (class 1259 OID 35052889)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 35052890)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2758 (class 1259 OID 35053331)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2893 (class 1259 OID 35053871)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2795 (class 1259 OID 35053420)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2796 (class 1259 OID 35053419)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2894 (class 1259 OID 35053879)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2895 (class 1259 OID 35053880)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2744 (class 1259 OID 35053296)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2789 (class 1259 OID 35053412)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2790 (class 1259 OID 35053413)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2843 (class 1259 OID 35053635)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2844 (class 1259 OID 35053634)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2845 (class 1259 OID 35053631)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2846 (class 1259 OID 35053632)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2847 (class 1259 OID 35053633)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2637 (class 1259 OID 35053035)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 35053034)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2639 (class 1259 OID 35053036)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2761 (class 1259 OID 35053344)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2762 (class 1259 OID 35053343)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2853 (class 1259 OID 35053745)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2854 (class 1259 OID 35053746)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2836 (class 1259 OID 35053565)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2837 (class 1259 OID 35053566)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2838 (class 1259 OID 35053563)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2839 (class 1259 OID 35053564)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2723 (class 1259 OID 35053254)
-- Name: idx_aab095ce5e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce5e15bdbd ON dodatek USING btree (terminstoritve_id);


--
-- TOC entry 2724 (class 1259 OID 35053255)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2785 (class 1259 OID 35053402)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 35053403)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2735 (class 1259 OID 35053284)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2736 (class 1259 OID 35053283)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2737 (class 1259 OID 35053281)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2738 (class 1259 OID 35053282)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2832 (class 1259 OID 35053553)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2833 (class 1259 OID 35053552)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2662 (class 1259 OID 35053110)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2665 (class 1259 OID 35053124)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2666 (class 1259 OID 35053123)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2667 (class 1259 OID 35053122)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 35053125)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2682 (class 1259 OID 35053155)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2676 (class 1259 OID 35053143)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2677 (class 1259 OID 35053144)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2850 (class 1259 OID 35053736)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2869 (class 1259 OID 35053785)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2887 (class 1259 OID 35053855)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2888 (class 1259 OID 35053856)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 35052955)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 35052954)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2622 (class 1259 OID 35052990)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 35052991)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 35053205)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 35053248)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2717 (class 1259 OID 35053247)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2718 (class 1259 OID 35053246)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2696 (class 1259 OID 35053190)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2697 (class 1259 OID 35053191)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2698 (class 1259 OID 35053194)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2699 (class 1259 OID 35053189)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2700 (class 1259 OID 35053193)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2701 (class 1259 OID 35053192)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2630 (class 1259 OID 35053009)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 35052943)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 35052944)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2654 (class 1259 OID 35053084)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 35053086)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2656 (class 1259 OID 35053085)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2657 (class 1259 OID 35053087)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2743 (class 1259 OID 35053290)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 35053498)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2827 (class 1259 OID 35053531)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 35053472)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2810 (class 1259 OID 35053473)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2620 (class 1259 OID 35052981)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 35052982)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2727 (class 1259 OID 35053264)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 35053265)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2782 (class 1259 OID 35053396)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 35052859)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 35053056)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2636 (class 1259 OID 35053018)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 35052847)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2866 (class 1259 OID 35053778)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2765 (class 1259 OID 35053342)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2766 (class 1259 OID 35053341)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 35053224)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 35053225)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2840 (class 1259 OID 35053562)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 35053044)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2819 (class 1259 OID 35053511)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2877 (class 1259 OID 35053828)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2859 (class 1259 OID 35053753)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2860 (class 1259 OID 35053754)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2806 (class 1259 OID 35053461)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2715 (class 1259 OID 35053235)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 35052909)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2932 (class 2606 OID 35054051)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2933 (class 2606 OID 35054056)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2938 (class 2606 OID 35054081)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2936 (class 2606 OID 35054071)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2931 (class 2606 OID 35054046)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2935 (class 2606 OID 35054066)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2937 (class 2606 OID 35054076)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2934 (class 2606 OID 35054061)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2974 (class 2606 OID 35054261)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2975 (class 2606 OID 35054266)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 35054271)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 35054436)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3008 (class 2606 OID 35054431)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2909 (class 2606 OID 35053936)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2910 (class 2606 OID 35053941)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2957 (class 2606 OID 35054176)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3005 (class 2606 OID 35054416)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3004 (class 2606 OID 35054411)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3006 (class 2606 OID 35054421)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3003 (class 2606 OID 35054406)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3002 (class 2606 OID 35054401)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2956 (class 2606 OID 35054171)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2955 (class 2606 OID 35054166)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2929 (class 2606 OID 35054036)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2930 (class 2606 OID 35054041)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 35054216)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 35054226)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2966 (class 2606 OID 35054221)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2920 (class 2606 OID 35053991)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 35053986)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2953 (class 2606 OID 35054156)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 35054391)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2977 (class 2606 OID 35054276)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 35054281)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2979 (class 2606 OID 35054286)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3007 (class 2606 OID 35054426)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2983 (class 2606 OID 35054306)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2980 (class 2606 OID 35054291)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2984 (class 2606 OID 35054311)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2982 (class 2606 OID 35054301)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2981 (class 2606 OID 35054296)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2918 (class 2606 OID 35053981)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2917 (class 2606 OID 35053976)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2906 (class 2606 OID 35053921)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2905 (class 2606 OID 35053916)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2961 (class 2606 OID 35054196)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2901 (class 2606 OID 35053896)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2902 (class 2606 OID 35053901)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 35054211)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2963 (class 2606 OID 35054206)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2962 (class 2606 OID 35054201)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2912 (class 2606 OID 35053951)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2911 (class 2606 OID 35053946)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2913 (class 2606 OID 35053956)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2925 (class 2606 OID 35054016)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2923 (class 2606 OID 35054006)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 35054011)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2898 (class 2606 OID 35053881)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2948 (class 2606 OID 35054131)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2946 (class 2606 OID 35054121)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2945 (class 2606 OID 35054116)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2947 (class 2606 OID 35054126)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2899 (class 2606 OID 35053886)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 35053891)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2958 (class 2606 OID 35054181)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3012 (class 2606 OID 35054451)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 35054256)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2972 (class 2606 OID 35054251)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3013 (class 2606 OID 35054456)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 35054461)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2954 (class 2606 OID 35054161)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2970 (class 2606 OID 35054241)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2971 (class 2606 OID 35054246)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2995 (class 2606 OID 35054366)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2994 (class 2606 OID 35054361)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2991 (class 2606 OID 35054346)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2992 (class 2606 OID 35054351)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2993 (class 2606 OID 35054356)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2915 (class 2606 OID 35053966)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 35053961)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 35053971)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2960 (class 2606 OID 35054191)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2959 (class 2606 OID 35054186)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2997 (class 2606 OID 35054376)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2998 (class 2606 OID 35054381)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2989 (class 2606 OID 35054336)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2990 (class 2606 OID 35054341)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2987 (class 2606 OID 35054326)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2988 (class 2606 OID 35054331)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2943 (class 2606 OID 35054106)
-- Name: fk_aab095ce5e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce5e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2944 (class 2606 OID 35054111)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2968 (class 2606 OID 35054231)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2969 (class 2606 OID 35054236)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2952 (class 2606 OID 35054151)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2951 (class 2606 OID 35054146)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2949 (class 2606 OID 35054136)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2950 (class 2606 OID 35054141)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2986 (class 2606 OID 35054321)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 35054316)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2921 (class 2606 OID 35053996)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2922 (class 2606 OID 35054001)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2928 (class 2606 OID 35054031)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 35054021)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2927 (class 2606 OID 35054026)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2996 (class 2606 OID 35054371)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2999 (class 2606 OID 35054386)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 35054396)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3010 (class 2606 OID 35054441)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3011 (class 2606 OID 35054446)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2904 (class 2606 OID 35053911)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2903 (class 2606 OID 35053906)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2907 (class 2606 OID 35053926)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 35053931)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2939 (class 2606 OID 35054086)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 35054101)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 35054096)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2940 (class 2606 OID 35054091)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-11 16:57:35 CET

--
-- PostgreSQL database dump complete
--

