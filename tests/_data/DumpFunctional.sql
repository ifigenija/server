--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-12 12:02:19 CET

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
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 255
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 35340017)
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
-- TOC entry 239 (class 1259 OID 35340644)
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
-- TOC entry 238 (class 1259 OID 35340627)
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
-- TOC entry 182 (class 1259 OID 35340010)
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
-- TOC entry 181 (class 1259 OID 35340008)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 229 (class 1259 OID 35340504)
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
-- TOC entry 232 (class 1259 OID 35340534)
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
-- TOC entry 253 (class 1259 OID 35340947)
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
-- TOC entry 210 (class 1259 OID 35340340)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    tipdodatka_id uuid,
    trajanje integer,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 35340265)
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
-- TOC entry 205 (class 1259 OID 35340297)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 35340302)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 35340869)
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
-- TOC entry 194 (class 1259 OID 35340162)
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
-- TOC entry 240 (class 1259 OID 35340657)
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
-- TOC entry 225 (class 1259 OID 35340462)
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
-- TOC entry 200 (class 1259 OID 35340236)
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
-- TOC entry 197 (class 1259 OID 35340202)
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
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 35340179)
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
-- TOC entry 214 (class 1259 OID 35340376)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 251 (class 1259 OID 35340927)
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
-- TOC entry 252 (class 1259 OID 35340940)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 35340962)
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
-- TOC entry 218 (class 1259 OID 35340401)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 35340136)
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
-- TOC entry 185 (class 1259 OID 35340036)
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
-- TOC entry 189 (class 1259 OID 35340103)
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
-- TOC entry 186 (class 1259 OID 35340047)
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
-- TOC entry 178 (class 1259 OID 35339982)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 35340001)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 35340408)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 35340442)
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
-- TOC entry 235 (class 1259 OID 35340575)
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
-- TOC entry 188 (class 1259 OID 35340083)
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
-- TOC entry 191 (class 1259 OID 35340128)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 35340813)
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
-- TOC entry 215 (class 1259 OID 35340382)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 35340113)
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
-- TOC entry 202 (class 1259 OID 35340257)
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
-- TOC entry 198 (class 1259 OID 35340217)
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
-- TOC entry 199 (class 1259 OID 35340229)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 35340394)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 35340827)
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
-- TOC entry 244 (class 1259 OID 35340837)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 241 (class 1259 OID 35340726)
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
-- TOC entry 245 (class 1259 OID 35340845)
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
-- TOC entry 221 (class 1259 OID 35340423)
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
-- TOC entry 213 (class 1259 OID 35340367)
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
-- TOC entry 212 (class 1259 OID 35340357)
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
-- TOC entry 234 (class 1259 OID 35340564)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 35340494)
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
-- TOC entry 196 (class 1259 OID 35340191)
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
-- TOC entry 175 (class 1259 OID 35339953)
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
-- TOC entry 174 (class 1259 OID 35339951)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 222 (class 1259 OID 35340436)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 35339991)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 35339975)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 35340450)
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
-- TOC entry 216 (class 1259 OID 35340388)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 35340317)
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
-- TOC entry 173 (class 1259 OID 35339940)
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
-- TOC entry 172 (class 1259 OID 35339932)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 35339927)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 230 (class 1259 OID 35340511)
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
-- TOC entry 187 (class 1259 OID 35340075)
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
-- TOC entry 209 (class 1259 OID 35340327)
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
-- TOC entry 211 (class 1259 OID 35340347)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 233 (class 1259 OID 35340552)
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
-- TOC entry 184 (class 1259 OID 35340026)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 246 (class 1259 OID 35340857)
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
-- TOC entry 207 (class 1259 OID 35340307)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 35340148)
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
-- TOC entry 176 (class 1259 OID 35339962)
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
-- TOC entry 237 (class 1259 OID 35340602)
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
-- TOC entry 201 (class 1259 OID 35340247)
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
-- TOC entry 220 (class 1259 OID 35340415)
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
-- TOC entry 231 (class 1259 OID 35340525)
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
-- TOC entry 249 (class 1259 OID 35340907)
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
-- TOC entry 248 (class 1259 OID 35340876)
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
-- TOC entry 250 (class 1259 OID 35340919)
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
-- TOC entry 227 (class 1259 OID 35340487)
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
-- TOC entry 204 (class 1259 OID 35340291)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 236 (class 1259 OID 35340592)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 226 (class 1259 OID 35340477)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2250 (class 2604 OID 35340013)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 35339956)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3134 (class 0 OID 35340017)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5694-dd38-701d-01e7f0a1f235	10	30	Otroci	Abonma za otroke	200
000a0000-5694-dd38-f869-06e822c4adde	20	60	Mladina	Abonma za mladino	400
000a0000-5694-dd38-08fe-be5acba5dd87	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3190 (class 0 OID 35340644)
-- Dependencies: 239
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5694-dd39-a821-9310db588f4d	000d0000-5694-dd38-bb4a-6ef36782ea04	\N	00090000-5694-dd38-f208-36d2b72d4eb8	000b0000-5694-dd38-e782-da7940af23ee	0001	f	\N	\N	\N	3	t	t	t
000c0000-5694-dd39-e74d-2698d7c11a71	000d0000-5694-dd38-5688-113f38b5693b	00100000-5694-dd38-65d1-77f1e1fd8d72	00090000-5694-dd38-f194-c39982a01da9	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5694-dd39-d1a8-e0d57def3905	000d0000-5694-dd38-3cb0-626b7de9101c	00100000-5694-dd38-c5d5-3e9738518b8a	00090000-5694-dd38-a696-cc9fe1965139	\N	0003	t	\N	2016-01-12	\N	2	t	f	f
000c0000-5694-dd39-3f9a-747f588c2409	000d0000-5694-dd38-c652-1bf0dd316d43	\N	00090000-5694-dd38-95b4-1ab0cd21f00e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5694-dd39-9af8-fac7b9102836	000d0000-5694-dd38-cfef-9d53e0d2e99a	\N	00090000-5694-dd38-6148-8bbe16246e90	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5694-dd39-a959-e53a76e0eac4	000d0000-5694-dd38-6bdd-c8a0b1905e57	\N	00090000-5694-dd38-bffb-14529bc0eed4	000b0000-5694-dd38-d569-86c626d7105d	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5694-dd39-3c45-df225fc7884d	000d0000-5694-dd38-52b1-ab22e69d7ec2	00100000-5694-dd38-ea62-b08298c0f141	00090000-5694-dd38-ef56-c76a6919b313	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5694-dd39-a00d-83e8cf6ed8ee	000d0000-5694-dd38-55f4-e71c1fd84268	\N	00090000-5694-dd38-9e2e-c6bf96a8c9c8	000b0000-5694-dd38-3a54-3804363307e0	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5694-dd39-95f2-9fbbfdde5cae	000d0000-5694-dd38-52b1-ab22e69d7ec2	00100000-5694-dd38-6e69-b518416039e7	00090000-5694-dd38-df4e-dfe3c9ca6bb6	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5694-dd39-19c5-51e2621b5d2e	000d0000-5694-dd38-52b1-ab22e69d7ec2	00100000-5694-dd38-e1cb-47982cd1dda1	00090000-5694-dd38-c2b7-9bb31b0c0ff7	\N	0010	t	\N	2016-01-12	\N	16	f	f	t
000c0000-5694-dd39-08ac-730d78520f95	000d0000-5694-dd38-52b1-ab22e69d7ec2	00100000-5694-dd38-d29a-2693b6aaaa28	00090000-5694-dd38-d4ee-1847b1ee81ef	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5694-dd39-ff86-39bf60daf09d	000d0000-5694-dd38-8c6d-c00e22afacb8	00100000-5694-dd38-65d1-77f1e1fd8d72	00090000-5694-dd38-f194-c39982a01da9	000b0000-5694-dd38-ce39-f1400e3baee5	0012	t	\N	\N	\N	2	t	t	t
000c0000-5694-dd39-ce54-da18045838a9	000d0000-5694-dd38-656b-d80a0dde1185	\N	00090000-5694-dd38-9e2e-c6bf96a8c9c8	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5694-dd39-bc28-6e96f166c152	000d0000-5694-dd38-656b-d80a0dde1185	\N	00090000-5694-dd38-7ba2-176ed1646d01	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5694-dd39-181a-dd56e0dcf374	000d0000-5694-dd38-ab71-53b2a958c889	00100000-5694-dd38-c5d5-3e9738518b8a	00090000-5694-dd38-a696-cc9fe1965139	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5694-dd39-e1c2-fe72935e1a91	000d0000-5694-dd38-ab71-53b2a958c889	\N	00090000-5694-dd38-7ba2-176ed1646d01	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5694-dd39-02fb-eb07cc0a75d2	000d0000-5694-dd38-0cf5-96552296351b	\N	00090000-5694-dd38-7ba2-176ed1646d01	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5694-dd39-4684-532840d4c929	000d0000-5694-dd38-0cf5-96552296351b	\N	00090000-5694-dd38-9e2e-c6bf96a8c9c8	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5694-dd39-059e-73d76b56337c	000d0000-5694-dd38-ebe0-484081ea49f9	00100000-5694-dd38-ea62-b08298c0f141	00090000-5694-dd38-ef56-c76a6919b313	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5694-dd39-8e6e-42051a11efa2	000d0000-5694-dd38-ebe0-484081ea49f9	\N	00090000-5694-dd38-7ba2-176ed1646d01	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5694-dd39-af8c-d1e7d749e548	000d0000-5694-dd38-3496-7c4067bc3638	\N	00090000-5694-dd38-7ba2-176ed1646d01	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5694-dd39-2fc9-1d303749eb21	000d0000-5694-dd38-3496-7c4067bc3638	00100000-5694-dd38-ea62-b08298c0f141	00090000-5694-dd38-ef56-c76a6919b313	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5694-dd39-c951-b5b35e24a582	000d0000-5694-dd38-6716-614ee4f451c0	\N	00090000-5694-dd38-7ba2-176ed1646d01	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5694-dd39-5189-9431b7f5cb2e	000d0000-5694-dd38-fd27-1ab94dfac550	\N	00090000-5694-dd38-9e2e-c6bf96a8c9c8	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5694-dd39-c08d-ca4ba51878b1	000d0000-5694-dd38-fb19-b10bb6d3eb13	\N	00090000-5694-dd38-9e2e-c6bf96a8c9c8	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5694-dd39-f186-fe4dc26e015b	000d0000-5694-dd38-fb19-b10bb6d3eb13	00100000-5694-dd38-c5d5-3e9738518b8a	00090000-5694-dd38-a696-cc9fe1965139	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5694-dd39-905a-bbde1abf4cb2	000d0000-5694-dd38-b104-4ed3d8dbb804	\N	00090000-5694-dd38-09db-0380b7230f12	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5694-dd39-78b1-ae471cfc641f	000d0000-5694-dd38-b104-4ed3d8dbb804	\N	00090000-5694-dd38-d18b-8d5f4ba0403c	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5694-dd39-dcff-6b5936696151	000d0000-5694-dd38-35d9-c19e8fab45a8	\N	00090000-5694-dd38-9e2e-c6bf96a8c9c8	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5694-dd39-3a37-c075914a001b	000d0000-5694-dd38-35d9-c19e8fab45a8	00100000-5694-dd38-c5d5-3e9738518b8a	00090000-5694-dd38-a696-cc9fe1965139	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5694-dd39-3912-75c591a49b43	000d0000-5694-dd38-35d9-c19e8fab45a8	\N	00090000-5694-dd38-d18b-8d5f4ba0403c	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5694-dd39-c117-4c472e0f5157	000d0000-5694-dd38-35d9-c19e8fab45a8	\N	00090000-5694-dd38-09db-0380b7230f12	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5694-dd39-c55d-cf645cd654f4	000d0000-5694-dd38-0961-0952b9c40e71	\N	00090000-5694-dd38-9e2e-c6bf96a8c9c8	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5694-dd39-c34d-86a15fecc233	000d0000-5694-dd38-2002-cf60874075a3	00100000-5694-dd38-c5d5-3e9738518b8a	00090000-5694-dd38-a696-cc9fe1965139	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5694-dd39-ce0d-f24a53705172	000d0000-5694-dd38-2002-cf60874075a3	\N	00090000-5694-dd38-7ba2-176ed1646d01	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3189 (class 0 OID 35340627)
-- Dependencies: 238
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 35340010)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3180 (class 0 OID 35340504)
-- Dependencies: 229
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5694-dd38-9160-90bfa669338e	00160000-5694-dd38-543d-2b16953c2fe0	00090000-5694-dd38-d18b-8d5f4ba0403c	aizv	10	t
003d0000-5694-dd38-416e-cb41597cb88e	00160000-5694-dd38-543d-2b16953c2fe0	00090000-5694-dd38-e43f-acfc094f42e5	apri	14	t
003d0000-5694-dd38-ee42-1e504fac7367	00160000-5694-dd38-735d-13131cc0f26e	00090000-5694-dd38-09db-0380b7230f12	aizv	11	t
003d0000-5694-dd38-2b73-58202a7188ee	00160000-5694-dd38-91d0-00b67ec4f15e	00090000-5694-dd38-fc9c-f828d11703f1	aizv	12	t
003d0000-5694-dd38-93b1-1c75bfa23ed3	00160000-5694-dd38-543d-2b16953c2fe0	00090000-5694-dd38-7ba2-176ed1646d01	apri	18	f
\.


--
-- TOC entry 3183 (class 0 OID 35340534)
-- Dependencies: 232
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5694-dd38-543d-2b16953c2fe0	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5694-dd38-735d-13131cc0f26e	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5694-dd38-91d0-00b67ec4f15e	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3204 (class 0 OID 35340947)
-- Dependencies: 253
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 35340340)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, tipdodatka_id, trajanje, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 35340265)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5694-dd38-50a8-2af521ffcca0	\N	\N	00200000-5694-dd38-890b-60dea045ff07	\N	\N	\N	00220000-5694-dd38-b37d-dc8012796bb1	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5694-dd38-d98d-13f4390bdb96	\N	\N	00200000-5694-dd38-c9d1-08b3532a56e3	\N	\N	\N	00220000-5694-dd38-b37d-dc8012796bb1	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5694-dd38-f8a7-c90a03404859	\N	\N	00200000-5694-dd38-4435-485779d5ed1b	\N	\N	\N	00220000-5694-dd38-b4c4-ba18e771acdc	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5694-dd39-d734-9bd79fb2d0d7	\N	\N	00200000-5694-dd38-e58a-009d9bb9f6d2	\N	\N	\N	00220000-5694-dd38-2f5b-898395914909	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5694-dd39-1efb-87098974adbf	\N	\N	00200000-5694-dd38-599b-595685ef7c3f	\N	\N	\N	00220000-5694-dd38-7bbe-e98c5f8c691e	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3156 (class 0 OID 35340297)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 35340302)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 35340869)
-- Dependencies: 247
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 35340162)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5694-dd35-e80b-7ce3a36025d6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5694-dd35-75db-47710fd06b7f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5694-dd35-575c-535839ad1310	AL	ALB	008	Albania 	Albanija	\N
00040000-5694-dd35-34c7-044cdcca9961	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5694-dd35-01e9-92aeff070ae9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5694-dd35-3c7c-16da3c00be9e	AD	AND	020	Andorra 	Andora	\N
00040000-5694-dd35-cfba-99aadc24acc5	AO	AGO	024	Angola 	Angola	\N
00040000-5694-dd35-295d-d46b16332261	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5694-dd35-5546-8d18c319a5ae	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5694-dd35-5950-2c53c470744a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5694-dd35-7e22-74309507536c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5694-dd35-517e-6123b0cb0a5a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5694-dd35-8b43-c575633ccffa	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5694-dd35-4546-53f2a116ec7d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5694-dd35-a385-9e54fabb0fa4	AT	AUT	040	Austria 	Avstrija	\N
00040000-5694-dd35-9185-446a538e6579	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5694-dd35-1e3e-90e0734a37c8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5694-dd35-dc41-06f568997b0d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5694-dd35-fcc0-94c151ab7e64	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5694-dd35-f722-e2ad748838a0	BB	BRB	052	Barbados 	Barbados	\N
00040000-5694-dd35-2a81-389017cb1d3d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5694-dd35-6c91-8ece5ca152a8	BE	BEL	056	Belgium 	Belgija	\N
00040000-5694-dd35-388c-cacf16c14602	BZ	BLZ	084	Belize 	Belize	\N
00040000-5694-dd35-eeba-578714546349	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5694-dd35-4d36-ad64b39cdc4d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5694-dd35-d8b4-4d4dd4aabbd0	BT	BTN	064	Bhutan 	Butan	\N
00040000-5694-dd35-ceb4-dad627c246f6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5694-dd35-a10c-780fa01c4097	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5694-dd35-6d66-754d9594d117	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5694-dd35-c3fd-e0944f7c5e54	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5694-dd35-f798-4400d3d30eac	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5694-dd35-816e-dbb8072a1d7e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5694-dd35-e162-434dd9763779	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5694-dd35-e29f-8984b062bb82	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5694-dd35-19c9-de42d717943b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5694-dd35-2be8-8309195f29fe	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5694-dd35-204c-5d7dcccf58ee	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5694-dd35-8e4d-6b612d065008	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5694-dd35-9a27-3c01d23399b7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5694-dd35-f7ec-3ba593bd4ff5	CA	CAN	124	Canada 	Kanada	\N
00040000-5694-dd35-b2e8-5f8f27f19907	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5694-dd35-06e0-a5dd7b894656	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5694-dd35-c03d-2ca08592565e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5694-dd35-6f3f-67fe438c9c70	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5694-dd35-71a9-6ad5ce624247	CL	CHL	152	Chile 	Čile	\N
00040000-5694-dd35-2f7e-8f5329eaf02a	CN	CHN	156	China 	Kitajska	\N
00040000-5694-dd35-2a7b-13559b0ae33c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5694-dd35-460a-7bba974d9cbf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5694-dd35-f41b-a5b5ae9e477d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5694-dd35-a539-e586c441b7ab	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5694-dd35-6494-cecaa00e2b9f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5694-dd35-e8f7-e9dc292df9d9	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5694-dd35-d41e-e695f4dcba81	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5694-dd35-1cd7-85b1152882c2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5694-dd35-431d-ab68cf6139ec	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5694-dd35-b52a-7d6afff398df	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5694-dd35-7a6c-30a79a27129e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5694-dd35-8df4-08325b706b42	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5694-dd35-bd29-66fe5f380ace	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5694-dd35-ccc1-34951f7b8ab4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5694-dd35-4ae2-e883af077590	DK	DNK	208	Denmark 	Danska	\N
00040000-5694-dd35-d22a-e3e91cac801e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5694-dd35-151c-119cedde954f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5694-dd35-844a-4cfa766a83f5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5694-dd35-ecb5-591999d7c93c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5694-dd35-1855-4c02c3892e13	EG	EGY	818	Egypt 	Egipt	\N
00040000-5694-dd35-5ea4-3975b39df422	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5694-dd35-c05e-8d3f603ffc69	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5694-dd35-d9bb-3fe990f5248f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5694-dd35-3b48-75644c1487dd	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5694-dd35-459d-3f4299b04005	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5694-dd35-5aa5-bb2f1e2554e6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5694-dd35-acbd-c039ed75fdd2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5694-dd35-6d87-8f2e9be87992	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5694-dd35-d833-ffd887bdf860	FI	FIN	246	Finland 	Finska	\N
00040000-5694-dd35-84a4-f6ecac7bc419	FR	FRA	250	France 	Francija	\N
00040000-5694-dd35-293c-c8611c8cd4cd	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5694-dd35-b9d8-9dd2ad0d9297	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5694-dd35-8bc4-b4dca50d58e5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5694-dd35-2c88-8c8ad05d0ea2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5694-dd35-8916-e44c5a9f33d3	GA	GAB	266	Gabon 	Gabon	\N
00040000-5694-dd35-3541-26c7ab8057be	GM	GMB	270	Gambia 	Gambija	\N
00040000-5694-dd35-68f7-434651b70ff9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5694-dd35-ad57-f4e55a79a5da	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5694-dd35-c21a-aefc9e42c075	GH	GHA	288	Ghana 	Gana	\N
00040000-5694-dd35-7194-758add5671fe	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5694-dd35-67dd-ab55d0bd7b6f	GR	GRC	300	Greece 	Grčija	\N
00040000-5694-dd35-e81b-cb1850620c0e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5694-dd35-e940-d9c1ec0e2024	GD	GRD	308	Grenada 	Grenada	\N
00040000-5694-dd35-6983-c7e29474fa48	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5694-dd35-f712-b4bc54eb9366	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5694-dd35-eabe-e0ce3e2e2158	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5694-dd35-69bf-05e0c88ea013	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5694-dd35-79de-1bc9c13df007	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5694-dd35-de13-71d8ba4d3733	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5694-dd35-fae9-3cad1f1ad0dc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5694-dd35-eec5-632fc95c5619	HT	HTI	332	Haiti 	Haiti	\N
00040000-5694-dd35-d1d7-e3dba8006fbf	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5694-dd35-5839-5b566584905a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5694-dd35-5af6-05be76803d19	HN	HND	340	Honduras 	Honduras	\N
00040000-5694-dd35-6bf2-798281125776	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5694-dd35-f6d7-23307a776e01	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5694-dd35-5f46-21f90e1a454f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5694-dd35-6f28-1c7427cca3aa	IN	IND	356	India 	Indija	\N
00040000-5694-dd35-97fd-5de07c91b9f7	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5694-dd35-1f36-3151b9a68df9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5694-dd35-bb17-a0c968bd67bb	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5694-dd35-d54e-e16616209dc9	IE	IRL	372	Ireland 	Irska	\N
00040000-5694-dd35-4545-90c8c5c9717c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5694-dd35-5ae6-55f23cbd80eb	IL	ISR	376	Israel 	Izrael	\N
00040000-5694-dd35-9dec-fcf3545df537	IT	ITA	380	Italy 	Italija	\N
00040000-5694-dd35-2dde-d959c72d36bd	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5694-dd35-a61a-3d35e9629305	JP	JPN	392	Japan 	Japonska	\N
00040000-5694-dd35-fa9f-b13fb3699711	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5694-dd35-2cc1-31bafee16702	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5694-dd35-b7aa-694638c9fc81	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5694-dd35-a707-4d96bcca38dc	KE	KEN	404	Kenya 	Kenija	\N
00040000-5694-dd35-5af8-14955c957064	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5694-dd35-9030-e5c7b1989e39	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5694-dd35-98f4-a38db287515d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5694-dd35-09b7-08e701cdd1cb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5694-dd35-a09e-846e7e1d00f8	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5694-dd35-4d75-f2ab7808c118	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5694-dd35-73e0-fc36fd5e5e37	LV	LVA	428	Latvia 	Latvija	\N
00040000-5694-dd35-d24e-ec14efcb94ac	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5694-dd35-2a10-6d67de39e329	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5694-dd35-719b-c5a7336bed29	LR	LBR	430	Liberia 	Liberija	\N
00040000-5694-dd35-4c2e-d2da046f2c6a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5694-dd35-7a47-148ea4a6933f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5694-dd35-13e6-fe9057c09fcc	LT	LTU	440	Lithuania 	Litva	\N
00040000-5694-dd35-457f-6220f52d2e7e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5694-dd35-ed76-0c507c8a58a2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5694-dd35-93e8-1f696c46d756	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5694-dd35-1f32-ed74c1580bb8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5694-dd35-54b8-df6f2871f285	MW	MWI	454	Malawi 	Malavi	\N
00040000-5694-dd35-1655-d2cd7b5a290c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5694-dd35-85a0-7eb40ac6c876	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5694-dd35-39ed-5407609e0ee4	ML	MLI	466	Mali 	Mali	\N
00040000-5694-dd35-cef6-c2e57111ba38	MT	MLT	470	Malta 	Malta	\N
00040000-5694-dd35-a200-c3de7df1bd0d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5694-dd35-75d4-9be806cfe7c4	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5694-dd35-a81f-d96a7c6942c7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5694-dd35-3425-1f1cfadd8806	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5694-dd35-ccf8-dc08bb2d3fbd	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5694-dd35-25be-065117ecdd75	MX	MEX	484	Mexico 	Mehika	\N
00040000-5694-dd35-d9ee-06bfcc46f73f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5694-dd35-579f-08321f4b1e00	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5694-dd35-d22d-dabe1d7b7db9	MC	MCO	492	Monaco 	Monako	\N
00040000-5694-dd35-ac95-093d15145aa7	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5694-dd35-61f1-995581adf3d8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5694-dd35-a1aa-ade55bc7901d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5694-dd35-31f8-585a14ee00f8	MA	MAR	504	Morocco 	Maroko	\N
00040000-5694-dd35-9cd7-e3f02afdf326	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5694-dd35-0a22-fe85766f05e2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5694-dd35-e744-e514ae07ece3	NA	NAM	516	Namibia 	Namibija	\N
00040000-5694-dd35-e65e-a9fe184ba735	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5694-dd35-4913-509bc8b3a519	NP	NPL	524	Nepal 	Nepal	\N
00040000-5694-dd35-99b9-f3fdabea8e70	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5694-dd35-1c99-ac152969b2f9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5694-dd35-af20-ab5227c667c8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5694-dd35-ff3c-d7456275fd6b	NE	NER	562	Niger 	Niger 	\N
00040000-5694-dd35-32b2-5afb8988d00c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5694-dd35-2376-40bf44b0761c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5694-dd35-f6fb-7f3eea0848fa	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5694-dd35-0541-c26579be258d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5694-dd35-6c4c-abab5d5136a7	NO	NOR	578	Norway 	Norveška	\N
00040000-5694-dd35-d6fb-068d4a76926d	OM	OMN	512	Oman 	Oman	\N
00040000-5694-dd35-f604-45441e05afda	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5694-dd35-7dce-4955b59283e8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5694-dd35-2e29-899424151bac	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5694-dd35-5e27-dc09d167cc7a	PA	PAN	591	Panama 	Panama	\N
00040000-5694-dd35-2bd2-fb3934980fc5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5694-dd35-5a19-e38d0f16e13c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5694-dd35-8e02-b426e1c3bd74	PE	PER	604	Peru 	Peru	\N
00040000-5694-dd35-da8e-efea5c428551	PH	PHL	608	Philippines 	Filipini	\N
00040000-5694-dd35-a1b3-330a24903ed8	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5694-dd35-b25c-fb5e88c5631f	PL	POL	616	Poland 	Poljska	\N
00040000-5694-dd35-2104-0bc61a50896f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5694-dd35-a05b-bb05dee64042	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5694-dd35-8dba-f930b8334b47	QA	QAT	634	Qatar 	Katar	\N
00040000-5694-dd35-0dc9-8877281d99e7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5694-dd35-4a24-813961d3f9e1	RO	ROU	642	Romania 	Romunija	\N
00040000-5694-dd35-243e-d1d647b52231	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5694-dd35-89aa-fdb0957f1956	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5694-dd35-4415-c1e522b1c151	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5694-dd35-5eb1-a2300baa1dc9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5694-dd35-86e1-696d95a95342	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5694-dd35-07ef-8126f1f73b0e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5694-dd35-bf11-d0f62d25bdaa	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5694-dd35-5355-e4f712bb2d90	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5694-dd35-c41f-49863a662a8d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5694-dd35-cffc-25c117e6f637	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5694-dd35-e503-f1da85c99230	SM	SMR	674	San Marino 	San Marino	\N
00040000-5694-dd35-6cf8-0ef586038fa1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5694-dd35-2fcd-61960bd16857	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5694-dd35-8e1c-dcf3a6572004	SN	SEN	686	Senegal 	Senegal	\N
00040000-5694-dd35-c03b-6db54884556e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5694-dd35-a1e6-5ca24ff4e7c4	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5694-dd35-efde-77e936194e44	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5694-dd35-3555-bd4cb5d2bb25	SG	SGP	702	Singapore 	Singapur	\N
00040000-5694-dd35-859f-fc894b136933	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5694-dd35-b381-98bd9d9517d1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5694-dd35-0612-346b8a116715	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5694-dd35-5ab6-0054a099628b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5694-dd35-2db1-565468fc7536	SO	SOM	706	Somalia 	Somalija	\N
00040000-5694-dd35-685b-26dd9458a3d2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5694-dd35-9f02-425f408843a1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5694-dd35-2ef8-b83b1af697b0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5694-dd35-d07f-2b9d4d8a0275	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5694-dd35-b93f-f6a6392dc88f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5694-dd35-ee9f-b4734cb1e590	SD	SDN	729	Sudan 	Sudan	\N
00040000-5694-dd35-0d86-fc70345e3b04	SR	SUR	740	Suriname 	Surinam	\N
00040000-5694-dd35-90d2-b03c82c3f8a4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5694-dd35-9672-5cde5b39ce16	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5694-dd35-223c-92143763b38c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5694-dd35-1edb-2a674fc97e52	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5694-dd35-879d-b1d41c573c39	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5694-dd35-595f-a2dbaae2c03a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5694-dd35-b0ce-4345610af76f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5694-dd35-69c9-85c0ca0bf49e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5694-dd35-7cb0-e60ad16e011c	TH	THA	764	Thailand 	Tajska	\N
00040000-5694-dd35-28fa-fc38f15386c6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5694-dd35-e642-04f5dfe935eb	TG	TGO	768	Togo 	Togo	\N
00040000-5694-dd35-c297-fec5d8093d4b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5694-dd35-e850-42fc0d18429e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5694-dd35-2c67-40f2402548a1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5694-dd35-9b2c-d054c08dd25c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5694-dd35-0b3f-304126779a7a	TR	TUR	792	Turkey 	Turčija	\N
00040000-5694-dd35-c4fa-8a9189e804b9	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5694-dd35-6e15-a1abe34d3f9f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5694-dd35-1f02-ee11116ac195	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5694-dd35-d305-66a17e42756d	UG	UGA	800	Uganda 	Uganda	\N
00040000-5694-dd35-c6f3-be780c799aff	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5694-dd35-e557-0ce14968439e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5694-dd35-79d2-e94b88470df1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5694-dd35-1436-cd9736242cfb	US	USA	840	United States 	Združene države Amerike	\N
00040000-5694-dd35-7227-5cbf39364203	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5694-dd35-5844-90a9821eca92	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5694-dd35-38e7-ca6f02fca0d0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5694-dd35-bca8-b345c9b58226	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5694-dd35-53fd-9bfec836e048	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5694-dd35-1060-be1e3ea5aedc	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5694-dd35-f95f-778ed2b4d3b0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5694-dd35-a7ee-fdf1199ddbea	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5694-dd35-7251-e010832f6504	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5694-dd35-49ae-9f906842644e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5694-dd35-2009-9d6e11b99a4d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5694-dd35-c929-d607c142635c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5694-dd35-1106-943aa4b0f760	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3191 (class 0 OID 35340657)
-- Dependencies: 240
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5694-dd38-fc5a-e8dedcb18aac	000e0000-5694-dd38-50e8-0e352a8c81b0	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-dd35-bd66-f31b7c24fa89	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5694-dd38-7399-ffcc53cb59cb	000e0000-5694-dd38-c234-3d3f07bfbb4e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-dd35-0b64-ad3bf125739f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5694-dd38-913c-62735e307197	000e0000-5694-dd38-3e83-5531f8a93780	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-dd35-bd66-f31b7c24fa89	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5694-dd39-8869-aa4ba61e27d3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5694-dd39-6be3-3a2fae6237c4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3176 (class 0 OID 35340462)
-- Dependencies: 225
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5694-dd38-fc8c-93abe160a362	000e0000-5694-dd38-d837-ff601467d279	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5694-dd35-f14b-b22a250b3459
000d0000-5694-dd38-bdcc-82fbe81da167	000e0000-5694-dd38-d837-ff601467d279	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-bb4a-6ef36782ea04	000e0000-5694-dd38-c234-3d3f07bfbb4e	000c0000-5694-dd39-a821-9310db588f4d	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5694-dd35-f14b-b22a250b3459
000d0000-5694-dd38-5688-113f38b5693b	000e0000-5694-dd38-c234-3d3f07bfbb4e	000c0000-5694-dd39-e74d-2698d7c11a71	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-3cb0-626b7de9101c	000e0000-5694-dd38-c234-3d3f07bfbb4e	000c0000-5694-dd39-d1a8-e0d57def3905	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5694-dd35-48f6-9037d8808af9
000d0000-5694-dd38-c652-1bf0dd316d43	000e0000-5694-dd38-c234-3d3f07bfbb4e	000c0000-5694-dd39-3f9a-747f588c2409	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5694-dd35-1221-a0916bd1a77f
000d0000-5694-dd38-cfef-9d53e0d2e99a	000e0000-5694-dd38-c234-3d3f07bfbb4e	000c0000-5694-dd39-9af8-fac7b9102836	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5694-dd35-1221-a0916bd1a77f
000d0000-5694-dd38-6bdd-c8a0b1905e57	000e0000-5694-dd38-c234-3d3f07bfbb4e	000c0000-5694-dd39-a959-e53a76e0eac4	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5694-dd35-f14b-b22a250b3459
000d0000-5694-dd38-52b1-ab22e69d7ec2	000e0000-5694-dd38-c234-3d3f07bfbb4e	000c0000-5694-dd39-95f2-9fbbfdde5cae	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5694-dd35-f14b-b22a250b3459
000d0000-5694-dd38-55f4-e71c1fd84268	000e0000-5694-dd38-c234-3d3f07bfbb4e	000c0000-5694-dd39-a00d-83e8cf6ed8ee	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5694-dd35-143f-d18f38da07d3
000d0000-5694-dd38-8c6d-c00e22afacb8	000e0000-5694-dd38-c234-3d3f07bfbb4e	000c0000-5694-dd39-ff86-39bf60daf09d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5694-dd35-8579-05d6b5f897ff
000d0000-5694-dd38-656b-d80a0dde1185	000e0000-5694-dd38-90f3-b16bda46ef4e	000c0000-5694-dd39-ce54-da18045838a9	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-ab71-53b2a958c889	000e0000-5694-dd38-3416-e3e1fd6a55c4	000c0000-5694-dd39-181a-dd56e0dcf374	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-0cf5-96552296351b	000e0000-5694-dd38-3416-e3e1fd6a55c4	000c0000-5694-dd39-02fb-eb07cc0a75d2	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-ebe0-484081ea49f9	000e0000-5694-dd38-1995-7304976a4932	000c0000-5694-dd39-059e-73d76b56337c	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-3496-7c4067bc3638	000e0000-5694-dd38-68ef-695a7f49c38b	000c0000-5694-dd39-af8c-d1e7d749e548	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-6716-614ee4f451c0	000e0000-5694-dd38-926f-1cc4431fa7ab	000c0000-5694-dd39-c951-b5b35e24a582	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-fd27-1ab94dfac550	000e0000-5694-dd38-d84c-cb510191ff4d	000c0000-5694-dd39-5189-9431b7f5cb2e	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-fb19-b10bb6d3eb13	000e0000-5694-dd38-3396-8385bcacabde	000c0000-5694-dd39-c08d-ca4ba51878b1	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-b104-4ed3d8dbb804	000e0000-5694-dd38-fc63-3d4f9af28653	000c0000-5694-dd39-905a-bbde1abf4cb2	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-35d9-c19e8fab45a8	000e0000-5694-dd38-fc63-3d4f9af28653	000c0000-5694-dd39-dcff-6b5936696151	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-0961-0952b9c40e71	000e0000-5694-dd38-7a63-e0c8dff1ac16	000c0000-5694-dd39-c55d-cf645cd654f4	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
000d0000-5694-dd38-2002-cf60874075a3	000e0000-5694-dd38-7a63-e0c8dff1ac16	000c0000-5694-dd39-c34d-86a15fecc233	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5694-dd35-999f-8cce4c63192d
\.


--
-- TOC entry 3151 (class 0 OID 35340236)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 35340202)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 35340179)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5694-dd38-29e4-be4feec62b6c	00080000-5694-dd38-efe5-35aa65828f54	00090000-5694-dd38-c2b7-9bb31b0c0ff7	AK		igralka
\.


--
-- TOC entry 3165 (class 0 OID 35340376)
-- Dependencies: 214
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 35340927)
-- Dependencies: 251
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5694-dd38-ff1a-6c39e97fddd6	00010000-5694-dd36-8929-3dd8d399f42c	\N	Prva mapa	Root mapa	2016-01-12 12:02:16	2016-01-12 12:02:16	R	\N	\N
\.


--
-- TOC entry 3203 (class 0 OID 35340940)
-- Dependencies: 252
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 35340962)
-- Dependencies: 254
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 34548309)
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
-- TOC entry 3169 (class 0 OID 35340401)
-- Dependencies: 218
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 35340136)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5694-dd36-a9e7-fb00c123fa0c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5694-dd36-0737-f85bcaa98b56	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5694-dd36-a689-990715a32937	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5694-dd36-1494-fbded3e2f5c3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5694-dd36-7ae9-b86ae3439a50	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5694-dd36-0265-767a45fdd535	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5694-dd36-c61c-bcda38fc0e4e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5694-dd36-2d87-2d2303518eae	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5694-dd36-459d-3453ec470fb8	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5694-dd36-4460-576895a77759	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5694-dd36-0cf7-147813b18c75	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5694-dd36-f6b1-eb435c8f3d2a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5694-dd36-6984-798fa535f31b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5694-dd36-2909-85df0c5118fb	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5694-dd38-9e8c-a7f35a63b108	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5694-dd38-29b2-d50965d35a0e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5694-dd38-a3a8-45352480489f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5694-dd38-f84a-fd5cf5cc4ef9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5694-dd38-9faa-1a31c8253310	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5694-dd3a-c697-2e891f8814f5	application.tenant.maticnopodjetje	string	s:36:"00080000-5694-dd3a-cf29-2adacd03e0cb";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3136 (class 0 OID 35340036)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5694-dd38-01ed-f36a9fe4c785	00000000-5694-dd38-9e8c-a7f35a63b108	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5694-dd38-5203-3df5a9470f83	00000000-5694-dd38-9e8c-a7f35a63b108	00010000-5694-dd36-8929-3dd8d399f42c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5694-dd38-b61a-657e9c3e7a88	00000000-5694-dd38-29b2-d50965d35a0e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3140 (class 0 OID 35340103)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5694-dd38-e20f-b8ea0c2d971b	\N	00100000-5694-dd38-65d1-77f1e1fd8d72	00100000-5694-dd38-c5d5-3e9738518b8a	01	Gledališče Nimbis
00410000-5694-dd38-de4c-4c449d7818cd	00410000-5694-dd38-e20f-b8ea0c2d971b	00100000-5694-dd38-65d1-77f1e1fd8d72	00100000-5694-dd38-c5d5-3e9738518b8a	02	Tehnika
\.


--
-- TOC entry 3137 (class 0 OID 35340047)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5694-dd38-f208-36d2b72d4eb8	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5694-dd38-95b4-1ab0cd21f00e	00010000-5694-dd38-6f38-fe4f0824288a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5694-dd38-a696-cc9fe1965139	00010000-5694-dd38-9122-cbc0c4eb1fb2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5694-dd38-df4e-dfe3c9ca6bb6	00010000-5694-dd38-607f-057cb0e700a6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5694-dd38-50a6-3315a4bd287c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5694-dd38-bffb-14529bc0eed4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5694-dd38-d4ee-1847b1ee81ef	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5694-dd38-ef56-c76a6919b313	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5694-dd38-c2b7-9bb31b0c0ff7	00010000-5694-dd38-295c-2899604aa47e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5694-dd38-f194-c39982a01da9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5694-dd38-cec4-e558c164ce7f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5694-dd38-6148-8bbe16246e90	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5694-dd38-9e2e-c6bf96a8c9c8	00010000-5694-dd38-8380-c1da736f7352	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5694-dd38-d18b-8d5f4ba0403c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-dd38-e43f-acfc094f42e5	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-dd38-09db-0380b7230f12	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-dd38-fc9c-f828d11703f1	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5694-dd38-7ba2-176ed1646d01	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5694-dd38-0e29-3cfd153dbbca	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-dd38-f403-6925931e414c	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-dd38-143d-8dd201c88f0c	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3129 (class 0 OID 35339982)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5694-dd36-c118-3cab3a53f1eb	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5694-dd36-08ca-21fec62a20c2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5694-dd36-138f-4fa3f70b14b2	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5694-dd36-3ea9-aeddf32d0951	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5694-dd36-6795-f3f4ecf41b36	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5694-dd36-1025-e8bb02cb236d	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5694-dd36-03a8-e7019c0ae625	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5694-dd36-f323-af4de5179b56	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5694-dd36-9e52-728aca1ae944	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5694-dd36-40d3-d4ceb73f3ac9	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5694-dd36-07d3-712757f798a1	Abonma-read	Abonma - branje	t
00030000-5694-dd36-f980-f00e23c5af24	Abonma-write	Abonma - spreminjanje	t
00030000-5694-dd36-defb-3ebf49d00c6e	Alternacija-read	Alternacija - branje	t
00030000-5694-dd36-f7f4-d160ed5236d1	Alternacija-write	Alternacija - spreminjanje	t
00030000-5694-dd36-6d9d-4a0b37f5e2b0	Arhivalija-read	Arhivalija - branje	t
00030000-5694-dd36-c4b3-1bd24c2fa2fa	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5694-dd36-704a-bb981fa731b8	AuthStorage-read	AuthStorage - branje	t
00030000-5694-dd36-9534-dc9f24f17ea9	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5694-dd36-c475-123eb2d8a5ab	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5694-dd36-84b7-e8fb906e1e6a	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5694-dd36-2242-a23c7ba22056	Besedilo-read	Besedilo - branje	t
00030000-5694-dd36-f3f6-a8d88513f708	Besedilo-write	Besedilo - spreminjanje	t
00030000-5694-dd36-638f-fe6ebc1804f7	Dodatek-read	Dodatek - branje	t
00030000-5694-dd36-f8f7-9d36b88d5fcf	Dodatek-write	Dodatek - spreminjanje	t
00030000-5694-dd36-1521-bb60efb19c7f	Dogodek-read	Dogodek - branje	t
00030000-5694-dd36-5cea-e08f4a44aa41	Dogodek-write	Dogodek - spreminjanje	t
00030000-5694-dd36-1f12-aff44644248f	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5694-dd36-bd59-b3d77337c089	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5694-dd36-0bbe-00f7fc53b5a4	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5694-dd36-0d21-780352ba44f8	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5694-dd36-faca-00dd7581e11e	DogodekTrait-read	DogodekTrait - branje	t
00030000-5694-dd36-d987-22bcd48280ba	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5694-dd36-949c-8f77d20ddbd1	DrugiVir-read	DrugiVir - branje	t
00030000-5694-dd36-d693-bda96914b12d	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5694-dd36-4ba1-8bdda2dcf2a5	Drzava-read	Drzava - branje	t
00030000-5694-dd36-c53e-60435bd06ce4	Drzava-write	Drzava - spreminjanje	t
00030000-5694-dd36-5e6f-644dcd094846	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5694-dd36-0e97-16c1621f7135	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5694-dd36-8ee3-38fc48a52c1f	Funkcija-read	Funkcija - branje	t
00030000-5694-dd36-61e5-ceaea79544c0	Funkcija-write	Funkcija - spreminjanje	t
00030000-5694-dd36-451c-ddff427f5b06	Gostovanje-read	Gostovanje - branje	t
00030000-5694-dd36-ab37-7bef530a23e5	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5694-dd36-ad35-0ec4cea9c185	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5694-dd36-929b-76c45a35cc93	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5694-dd36-daf2-c22f5e82a1b3	Kupec-read	Kupec - branje	t
00030000-5694-dd36-b44e-f45fc43d7b45	Kupec-write	Kupec - spreminjanje	t
00030000-5694-dd36-b652-d4c509ed380c	NacinPlacina-read	NacinPlacina - branje	t
00030000-5694-dd36-c821-1879536fdbe3	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5694-dd36-8564-32f74d1f89e4	Option-read	Option - branje	t
00030000-5694-dd36-ad8e-76d758a9db14	Option-write	Option - spreminjanje	t
00030000-5694-dd36-78ce-3ad495fc7577	OptionValue-read	OptionValue - branje	t
00030000-5694-dd36-1e89-2ce70c348fc7	OptionValue-write	OptionValue - spreminjanje	t
00030000-5694-dd36-974f-be4a5eae30e1	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5694-dd36-7db0-8dfe7c59f61c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5694-dd36-1858-faf971e4236c	Oseba-read	Oseba - branje	t
00030000-5694-dd36-56c8-2057d449e3f4	Oseba-write	Oseba - spreminjanje	t
00030000-5694-dd36-6de7-9b9ab10f5d73	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5694-dd36-07fe-cde4a7eb176c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5694-dd36-8217-db829dce7c1e	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5694-dd36-8b62-8b6fef16509e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5694-dd36-51c9-3f17f9b08bfd	Pogodba-read	Pogodba - branje	t
00030000-5694-dd36-0be7-91f0d69ee2f0	Pogodba-write	Pogodba - spreminjanje	t
00030000-5694-dd36-dd0c-ab1adc17dead	Popa-read	Popa - branje	t
00030000-5694-dd36-9542-bd563e2e7341	Popa-write	Popa - spreminjanje	t
00030000-5694-dd36-f78e-eabf2ed6d8fa	Posta-read	Posta - branje	t
00030000-5694-dd36-354d-2b2dc77e6d0e	Posta-write	Posta - spreminjanje	t
00030000-5694-dd36-fa07-0228c4c48dc0	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5694-dd36-68f1-171c921f72bb	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5694-dd36-258c-fd0c3934e8d4	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5694-dd36-956a-de16cde7bc57	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5694-dd36-1ff9-1a21ac539e38	PostniNaslov-read	PostniNaslov - branje	t
00030000-5694-dd36-8c96-aa31715bd94d	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5694-dd36-1b51-dc37b0f716e6	Praznik-read	Praznik - branje	t
00030000-5694-dd36-1162-656558fe036c	Praznik-write	Praznik - spreminjanje	t
00030000-5694-dd36-3d20-a88cb3124e6c	Predstava-read	Predstava - branje	t
00030000-5694-dd36-ac7b-359e127cdfca	Predstava-write	Predstava - spreminjanje	t
00030000-5694-dd36-b6f9-0e83dc69c129	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5694-dd36-70c9-cc0e61ca8b2b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5694-dd36-1ec1-cf6a2e1df2cd	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5694-dd36-dd7e-c87e76457432	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5694-dd36-ddeb-b9985038fbdf	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5694-dd36-911f-9e355c6cfb63	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5694-dd36-55d5-1e454ce7841b	ProgramDela-read	ProgramDela - branje	t
00030000-5694-dd36-146e-794b26296c53	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5694-dd36-54d9-9b2e4d0642e2	ProgramFestival-read	ProgramFestival - branje	t
00030000-5694-dd36-0804-bac4379d2f87	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5694-dd36-ae11-9321f62c5b73	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5694-dd36-8b36-96a142de6f2f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5694-dd36-9f8f-b0a23f37f4e0	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5694-dd36-932f-412853fa62cc	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5694-dd36-8ecf-f1d6eaf0268a	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5694-dd36-7c32-564e5fa30e5e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5694-dd36-8852-ff4eba3dd5fc	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5694-dd36-9ede-655f9fe77dfb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5694-dd36-1f39-e21209851968	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5694-dd36-6764-30f0af0eff1d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5694-dd36-b4f3-4e06b6c35f63	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5694-dd36-28aa-e9cc86a47891	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5694-dd36-3368-8246d579635e	ProgramRazno-read	ProgramRazno - branje	t
00030000-5694-dd36-8b86-c3e33f0c5ea1	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5694-dd36-9923-cfc0f4f90526	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5694-dd36-0a4b-071db27a9f73	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5694-dd36-c8e7-b1a01a940747	Prostor-read	Prostor - branje	t
00030000-5694-dd36-899e-93a573897dee	Prostor-write	Prostor - spreminjanje	t
00030000-5694-dd36-2f80-cacfd26cb2d0	Racun-read	Racun - branje	t
00030000-5694-dd36-4394-059d81aec04b	Racun-write	Racun - spreminjanje	t
00030000-5694-dd36-b889-7d39ca5a4344	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5694-dd36-7f13-ecd90b9ff3a3	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5694-dd36-1e0c-87f14014872b	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5694-dd36-91f2-a74879a8b0f3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5694-dd36-df7d-b4c4559ff616	Rekvizit-read	Rekvizit - branje	t
00030000-5694-dd36-4037-fccdc3909326	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5694-dd36-430a-15c23128e12f	Revizija-read	Revizija - branje	t
00030000-5694-dd36-2c1e-4b19332f205e	Revizija-write	Revizija - spreminjanje	t
00030000-5694-dd36-1799-166ea10e4373	Rezervacija-read	Rezervacija - branje	t
00030000-5694-dd36-7c6a-a427ee3cd750	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5694-dd36-fa4a-066712a08a9d	SedezniRed-read	SedezniRed - branje	t
00030000-5694-dd36-6bd5-0973fb643630	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5694-dd36-578f-4d2f9b74c449	Sedez-read	Sedez - branje	t
00030000-5694-dd36-f9b5-d1448fdfd9b4	Sedez-write	Sedez - spreminjanje	t
00030000-5694-dd36-f1de-9c0624fd6ac1	Sezona-read	Sezona - branje	t
00030000-5694-dd36-4417-bbf7bb2283ad	Sezona-write	Sezona - spreminjanje	t
00030000-5694-dd36-9cbd-8fd4734812d2	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5694-dd36-0f2e-34ff6af7a08c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5694-dd36-2fad-561489447492	Telefonska-read	Telefonska - branje	t
00030000-5694-dd36-4490-1ab6078f8cc4	Telefonska-write	Telefonska - spreminjanje	t
00030000-5694-dd36-bbe8-58c09c36a61c	TerminStoritve-read	TerminStoritve - branje	t
00030000-5694-dd36-e178-cbdaee0bec92	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5694-dd36-5194-ef735c6318f1	TipDodatka-read	TipDodatka - branje	t
00030000-5694-dd36-fd07-026c90fee997	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5694-dd36-4fbf-d57703f61637	TipFunkcije-read	TipFunkcije - branje	t
00030000-5694-dd36-0505-5eea1752f301	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5694-dd36-e528-fb2eef74cf6f	TipPopa-read	TipPopa - branje	t
00030000-5694-dd36-177c-7b7a588e03fb	TipPopa-write	TipPopa - spreminjanje	t
00030000-5694-dd36-4160-b3630d508f96	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5694-dd36-5a06-09bd5317139d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5694-dd36-9d55-7c570ccc2949	TipVaje-read	TipVaje - branje	t
00030000-5694-dd36-7281-0051f6c1515c	TipVaje-write	TipVaje - spreminjanje	t
00030000-5694-dd36-f9ad-91f1b4e8d29c	Trr-read	Trr - branje	t
00030000-5694-dd36-cb04-2a7f70a1766b	Trr-write	Trr - spreminjanje	t
00030000-5694-dd36-5eb7-400df0522dc4	Uprizoritev-read	Uprizoritev - branje	t
00030000-5694-dd36-2c44-f4584a4b0515	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5694-dd36-3905-e3e97ab24828	Vaja-read	Vaja - branje	t
00030000-5694-dd36-cbb3-21122949e29b	Vaja-write	Vaja - spreminjanje	t
00030000-5694-dd36-70c8-9b4d99176687	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5694-dd36-cde7-35d12452c7d0	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5694-dd36-b022-dfc8543046a5	VrstaStroska-read	VrstaStroska - branje	t
00030000-5694-dd36-271f-375a63d608ce	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5694-dd36-8ec3-a6407068ae49	Zaposlitev-read	Zaposlitev - branje	t
00030000-5694-dd36-ac03-8c3211ab6633	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5694-dd36-779e-56a49ec7776b	Zasedenost-read	Zasedenost - branje	t
00030000-5694-dd36-f031-6c6285472112	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5694-dd36-f1b6-4cfda38d5107	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5694-dd36-44e7-ccd5665e458a	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5694-dd36-0d92-93fe61eabaa1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5694-dd36-e05f-743042f99e0d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5694-dd36-4aec-dda45e0c1c44	Job-read	Branje opravil - samo zase - branje	t
00030000-5694-dd36-d7c3-b04ac7e93854	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5694-dd36-73ed-b31dcfd7f264	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5694-dd36-8e06-94d7e8a42dac	Report-read	Report - branje	t
00030000-5694-dd36-a090-8590dca21bf5	Report-write	Report - spreminjanje	t
00030000-5694-dd36-9e6a-97e90be0cde0	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5694-dd36-6190-f381eeaccb39	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5694-dd36-9f0d-5ca1f51d0646	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5694-dd36-91ea-0683b7bcc83f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5694-dd36-1c34-09b4f1bf3ed9	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5694-dd36-d397-6d7902f03dd1	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5694-dd36-7f3e-3a0aa47c1cc8	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5694-dd36-6b1b-184722628253	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5694-dd36-a2be-0a5de4b8355e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5694-dd36-452c-73c8ff546aa1	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5694-dd36-da1f-10591bb9f726	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5694-dd36-e993-995189598560	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5694-dd36-a092-430e29bd8b63	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5694-dd36-870b-bd09a26eb8a1	Datoteka-write	Datoteka - spreminjanje	t
00030000-5694-dd36-9b60-1be92a4b93dd	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3131 (class 0 OID 35340001)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5694-dd36-8704-c5a36bd92f76	00030000-5694-dd36-08ca-21fec62a20c2
00020000-5694-dd36-8704-c5a36bd92f76	00030000-5694-dd36-c118-3cab3a53f1eb
00020000-5694-dd36-f878-da0b3519a0ea	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-84b7-e8fb906e1e6a
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-f3f6-a8d88513f708
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-c475-123eb2d8a5ab
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-a245-95556848f026	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-82b0-7fc96dd84f1c	00030000-5694-dd36-c475-123eb2d8a5ab
00020000-5694-dd36-82b0-7fc96dd84f1c	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-82b0-7fc96dd84f1c	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-82b0-7fc96dd84f1c	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-82b0-7fc96dd84f1c	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-82b0-7fc96dd84f1c	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-f5c2-c48f36f53215	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-f5c2-c48f36f53215	00030000-5694-dd36-ac03-8c3211ab6633
00020000-5694-dd36-f5c2-c48f36f53215	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-f5c2-c48f36f53215	00030000-5694-dd36-6795-f3f4ecf41b36
00020000-5694-dd36-f5c2-c48f36f53215	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-f5c2-c48f36f53215	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-f5c2-c48f36f53215	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-f6ae-1d36bbcb1854	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-f6ae-1d36bbcb1854	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-f6ae-1d36bbcb1854	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-6cd7-d15621878f2b	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-6cd7-d15621878f2b	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-6cd7-d15621878f2b	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-6cd7-d15621878f2b	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-6cd7-d15621878f2b	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-6cd7-d15621878f2b	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-6cd7-d15621878f2b	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-6cd7-d15621878f2b	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-ac37-34c55836119c	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-ac37-34c55836119c	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-ac37-34c55836119c	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-ac37-34c55836119c	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-6795-f3f4ecf41b36
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-cb04-2a7f70a1766b
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-8c96-aa31715bd94d
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-4490-1ab6078f8cc4
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-da2d-dfce902b7061	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-ff55-dfbda78d6e6d	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-ff55-dfbda78d6e6d	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-ff55-dfbda78d6e6d	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-ff55-dfbda78d6e6d	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-ff55-dfbda78d6e6d	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-ff55-dfbda78d6e6d	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-ff55-dfbda78d6e6d	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-4490-1ab6078f8cc4
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-8c96-aa31715bd94d
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-cb04-2a7f70a1766b
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-9542-bd563e2e7341
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-929b-76c45a35cc93
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-911f-9e355c6cfb63
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-acbe-6c95d66fd241	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-4578-6adc56f04a71	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-e84e-0b83d9f363af	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-e84e-0b83d9f363af	00030000-5694-dd36-177c-7b7a588e03fb
00020000-5694-dd36-d84c-017d7d9f04f3	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-0056-f7df56b82b50	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd36-0056-f7df56b82b50	00030000-5694-dd36-354d-2b2dc77e6d0e
00020000-5694-dd36-9b9f-9f9b0f75b2fa	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd36-87be-0f9888b7f88c	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-87be-0f9888b7f88c	00030000-5694-dd36-c53e-60435bd06ce4
00020000-5694-dd36-4608-780474c470b8	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-dac6-fd357abcebde	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd36-dac6-fd357abcebde	00030000-5694-dd36-e05f-743042f99e0d
00020000-5694-dd36-893d-871e15403a65	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd36-baae-1a1fa4edf8e1	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd36-baae-1a1fa4edf8e1	00030000-5694-dd36-44e7-ccd5665e458a
00020000-5694-dd36-d3bd-a7965f3700e9	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd36-82ec-c8bc4eb95885	00030000-5694-dd36-07d3-712757f798a1
00020000-5694-dd36-82ec-c8bc4eb95885	00030000-5694-dd36-f980-f00e23c5af24
00020000-5694-dd36-cc9c-2e88665f4f35	00030000-5694-dd36-07d3-712757f798a1
00020000-5694-dd36-f4e4-c061a94c01b6	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd36-f4e4-c061a94c01b6	00030000-5694-dd36-899e-93a573897dee
00020000-5694-dd36-f4e4-c061a94c01b6	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-f4e4-c061a94c01b6	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-f4e4-c061a94c01b6	00030000-5694-dd36-8c96-aa31715bd94d
00020000-5694-dd36-f4e4-c061a94c01b6	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-c485-aa050ea00363	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd36-c485-aa050ea00363	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-c485-aa050ea00363	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-8e5a-b8312406298f	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-8e5a-b8312406298f	00030000-5694-dd36-271f-375a63d608ce
00020000-5694-dd36-48de-3c2e9a93c4a2	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-68fa-857ac352392c	00030000-5694-dd36-7db0-8dfe7c59f61c
00020000-5694-dd36-68fa-857ac352392c	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-68fa-857ac352392c	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-68fa-857ac352392c	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-68fa-857ac352392c	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-68fa-857ac352392c	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-68fa-857ac352392c	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-68fa-857ac352392c	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-68fa-857ac352392c	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-011b-908cad8a11a5	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-011b-908cad8a11a5	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-011b-908cad8a11a5	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-011b-908cad8a11a5	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-011b-908cad8a11a5	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-eb89-b84da76aed60	00030000-5694-dd36-9d55-7c570ccc2949
00020000-5694-dd36-eb89-b84da76aed60	00030000-5694-dd36-7281-0051f6c1515c
00020000-5694-dd36-5263-c43c8a98f15e	00030000-5694-dd36-9d55-7c570ccc2949
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-03a8-e7019c0ae625
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-f323-af4de5179b56
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-55d5-1e454ce7841b
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-146e-794b26296c53
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-54d9-9b2e4d0642e2
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-0804-bac4379d2f87
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-ae11-9321f62c5b73
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-8b36-96a142de6f2f
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-9f8f-b0a23f37f4e0
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-932f-412853fa62cc
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-8ecf-f1d6eaf0268a
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-7c32-564e5fa30e5e
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-8852-ff4eba3dd5fc
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-9ede-655f9fe77dfb
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-1f39-e21209851968
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-6764-30f0af0eff1d
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-b4f3-4e06b6c35f63
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-28aa-e9cc86a47891
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-3368-8246d579635e
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-8b86-c3e33f0c5ea1
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-9923-cfc0f4f90526
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-0a4b-071db27a9f73
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-dd7e-c87e76457432
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-d693-bda96914b12d
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-68f1-171c921f72bb
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-d7c3-b04ac7e93854
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-949c-8f77d20ddbd1
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-1ec1-cf6a2e1df2cd
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-fa07-0228c4c48dc0
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-4aec-dda45e0c1c44
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-ada5-7b4510dfeb01	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-55d5-1e454ce7841b
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-54d9-9b2e4d0642e2
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-ae11-9321f62c5b73
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-9f8f-b0a23f37f4e0
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-8ecf-f1d6eaf0268a
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-8852-ff4eba3dd5fc
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-1f39-e21209851968
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-b4f3-4e06b6c35f63
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-3368-8246d579635e
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-9923-cfc0f4f90526
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-1ec1-cf6a2e1df2cd
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-949c-8f77d20ddbd1
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-fa07-0228c4c48dc0
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-4aec-dda45e0c1c44
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-47ee-5d7fe1794bfe	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-2c44-f4584a4b0515
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-9e52-728aca1ae944
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-61e5-ceaea79544c0
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-40d3-d4ceb73f3ac9
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-2f22-c5ce43e70e64	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-ae0f-eaaf81d2f0dc	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-46db-47309432af52	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-46db-47309432af52	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd36-46db-47309432af52	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-46db-47309432af52	00030000-5694-dd36-61e5-ceaea79544c0
00020000-5694-dd36-46db-47309432af52	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-46db-47309432af52	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-46db-47309432af52	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-46db-47309432af52	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-9e52-728aca1ae944
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-6795-f3f4ecf41b36
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-0be7-91f0d69ee2f0
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-0f2e-34ff6af7a08c
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-3441-aae25859bc44	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-428a-2bf9d352b4b9	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-ddf6-ae2b5e79ab14	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-ddf6-ae2b5e79ab14	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-ddf6-ae2b5e79ab14	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-ddf6-ae2b5e79ab14	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd36-ddf6-ae2b5e79ab14	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-ddf6-ae2b5e79ab14	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-ddf6-ae2b5e79ab14	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-116e-ef988f86f019	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-116e-ef988f86f019	00030000-5694-dd36-0f2e-34ff6af7a08c
00020000-5694-dd36-116e-ef988f86f019	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-116e-ef988f86f019	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-d636-5ca4d9355121	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-d636-5ca4d9355121	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-07d3-712757f798a1
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-9e52-728aca1ae944
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-c475-123eb2d8a5ab
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-84b7-e8fb906e1e6a
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-f3f6-a8d88513f708
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-949c-8f77d20ddbd1
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-d693-bda96914b12d
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-61e5-ceaea79544c0
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-40d3-d4ceb73f3ac9
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-4aec-dda45e0c1c44
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-d7c3-b04ac7e93854
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-6795-f3f4ecf41b36
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-0be7-91f0d69ee2f0
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-fa07-0228c4c48dc0
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-68f1-171c921f72bb
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-1ec1-cf6a2e1df2cd
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-dd7e-c87e76457432
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-03a8-e7019c0ae625
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-55d5-1e454ce7841b
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-f323-af4de5179b56
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-146e-794b26296c53
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-54d9-9b2e4d0642e2
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-0804-bac4379d2f87
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-ae11-9321f62c5b73
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-8b36-96a142de6f2f
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-9f8f-b0a23f37f4e0
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-932f-412853fa62cc
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-8ecf-f1d6eaf0268a
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-7c32-564e5fa30e5e
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-8852-ff4eba3dd5fc
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-9ede-655f9fe77dfb
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-1f39-e21209851968
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-6764-30f0af0eff1d
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-b4f3-4e06b6c35f63
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-28aa-e9cc86a47891
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-3368-8246d579635e
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-8b86-c3e33f0c5ea1
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-9923-cfc0f4f90526
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-0a4b-071db27a9f73
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-0f2e-34ff6af7a08c
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-9d55-7c570ccc2949
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-2c44-f4584a4b0515
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd36-0d9d-9a56cad28c99	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-07d3-712757f798a1
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-c475-123eb2d8a5ab
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-84b7-e8fb906e1e6a
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-f3f6-a8d88513f708
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-9d55-7c570ccc2949
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd36-1409-aee259237316	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-07d3-712757f798a1
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-9e52-728aca1ae944
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-c475-123eb2d8a5ab
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-84b7-e8fb906e1e6a
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-f3f6-a8d88513f708
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-61e5-ceaea79544c0
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-40d3-d4ceb73f3ac9
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-9d55-7c570ccc2949
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-2c44-f4584a4b0515
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd36-ae5b-b1b064d4ed37	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-9e52-728aca1ae944
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-c475-123eb2d8a5ab
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-84b7-e8fb906e1e6a
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-f3f6-a8d88513f708
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-949c-8f77d20ddbd1
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-d693-bda96914b12d
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-61e5-ceaea79544c0
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-40d3-d4ceb73f3ac9
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-4aec-dda45e0c1c44
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-d7c3-b04ac7e93854
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-929b-76c45a35cc93
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-6795-f3f4ecf41b36
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-0be7-91f0d69ee2f0
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-9542-bd563e2e7341
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-fa07-0228c4c48dc0
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-68f1-171c921f72bb
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-8c96-aa31715bd94d
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-1ec1-cf6a2e1df2cd
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-dd7e-c87e76457432
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-911f-9e355c6cfb63
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-03a8-e7019c0ae625
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-55d5-1e454ce7841b
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-f323-af4de5179b56
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-146e-794b26296c53
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-54d9-9b2e4d0642e2
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-0804-bac4379d2f87
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-ae11-9321f62c5b73
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-8b36-96a142de6f2f
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-9f8f-b0a23f37f4e0
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-932f-412853fa62cc
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-8ecf-f1d6eaf0268a
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-7c32-564e5fa30e5e
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-8852-ff4eba3dd5fc
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-9ede-655f9fe77dfb
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-1f39-e21209851968
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-6764-30f0af0eff1d
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-b4f3-4e06b6c35f63
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-28aa-e9cc86a47891
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-3368-8246d579635e
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-8b86-c3e33f0c5ea1
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-9923-cfc0f4f90526
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-0a4b-071db27a9f73
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-0f2e-34ff6af7a08c
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-4490-1ab6078f8cc4
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-cb04-2a7f70a1766b
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-2c44-f4584a4b0515
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-ac03-8c3211ab6633
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd36-ac73-bdf1fbf211f0	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-07d3-712757f798a1
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-9e52-728aca1ae944
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-c475-123eb2d8a5ab
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-84b7-e8fb906e1e6a
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-f3f6-a8d88513f708
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-61e5-ceaea79544c0
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-40d3-d4ceb73f3ac9
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-929b-76c45a35cc93
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-6795-f3f4ecf41b36
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-9542-bd563e2e7341
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-8c96-aa31715bd94d
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-911f-9e355c6cfb63
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-4490-1ab6078f8cc4
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-9d55-7c570ccc2949
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-cb04-2a7f70a1766b
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-2c44-f4584a4b0515
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-ac03-8c3211ab6633
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd36-c11c-468e21d3b158	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-07d3-712757f798a1
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-c475-123eb2d8a5ab
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-61e5-ceaea79544c0
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-9d55-7c570ccc2949
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd36-9153-4f5963cb4ad6	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-07d3-712757f798a1
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-9e52-728aca1ae944
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-949c-8f77d20ddbd1
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-d693-bda96914b12d
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-4aec-dda45e0c1c44
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-d7c3-b04ac7e93854
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-929b-76c45a35cc93
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-7db0-8dfe7c59f61c
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-6795-f3f4ecf41b36
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-0be7-91f0d69ee2f0
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-9542-bd563e2e7341
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-fa07-0228c4c48dc0
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-68f1-171c921f72bb
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-8c96-aa31715bd94d
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-1ec1-cf6a2e1df2cd
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-dd7e-c87e76457432
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-911f-9e355c6cfb63
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-03a8-e7019c0ae625
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-55d5-1e454ce7841b
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-f323-af4de5179b56
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-146e-794b26296c53
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-54d9-9b2e4d0642e2
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-0804-bac4379d2f87
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-ae11-9321f62c5b73
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-8b36-96a142de6f2f
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-9f8f-b0a23f37f4e0
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-932f-412853fa62cc
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-8ecf-f1d6eaf0268a
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-7c32-564e5fa30e5e
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-8852-ff4eba3dd5fc
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-9ede-655f9fe77dfb
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-1f39-e21209851968
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-6764-30f0af0eff1d
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-b4f3-4e06b6c35f63
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-28aa-e9cc86a47891
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-3368-8246d579635e
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-8b86-c3e33f0c5ea1
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-9923-cfc0f4f90526
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-0a4b-071db27a9f73
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-0f2e-34ff6af7a08c
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-4490-1ab6078f8cc4
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-9d55-7c570ccc2949
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-cb04-2a7f70a1766b
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-271f-375a63d608ce
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-ac03-8c3211ab6633
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd36-991b-94ef4e8edc0b	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-c118-3cab3a53f1eb
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-08ca-21fec62a20c2
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-07d3-712757f798a1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f980-f00e23c5af24
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9e52-728aca1ae944
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-6d9d-4a0b37f5e2b0
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-c4b3-1bd24c2fa2fa
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-704a-bb981fa731b8
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9534-dc9f24f17ea9
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-c475-123eb2d8a5ab
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-84b7-e8fb906e1e6a
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-2242-a23c7ba22056
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f3f6-a8d88513f708
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1521-bb60efb19c7f
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-3ea9-aeddf32d0951
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1f12-aff44644248f
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-bd59-b3d77337c089
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-0bbe-00f7fc53b5a4
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-0d21-780352ba44f8
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-faca-00dd7581e11e
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-d987-22bcd48280ba
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-5cea-e08f4a44aa41
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-949c-8f77d20ddbd1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-d693-bda96914b12d
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-4ba1-8bdda2dcf2a5
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-c53e-60435bd06ce4
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-5e6f-644dcd094846
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-0e97-16c1621f7135
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-40d3-d4ceb73f3ac9
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-61e5-ceaea79544c0
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-451c-ddff427f5b06
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-ab37-7bef530a23e5
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-73ed-b31dcfd7f264
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-4aec-dda45e0c1c44
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-d7c3-b04ac7e93854
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-ad35-0ec4cea9c185
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-929b-76c45a35cc93
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-daf2-c22f5e82a1b3
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-b44e-f45fc43d7b45
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-7f3e-3a0aa47c1cc8
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-d397-6d7902f03dd1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-6190-f381eeaccb39
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9f0d-5ca1f51d0646
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-91ea-0683b7bcc83f
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1c34-09b4f1bf3ed9
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-b652-d4c509ed380c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-c821-1879536fdbe3
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8564-32f74d1f89e4
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-78ce-3ad495fc7577
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1e89-2ce70c348fc7
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-ad8e-76d758a9db14
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-974f-be4a5eae30e1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-7db0-8dfe7c59f61c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-6795-f3f4ecf41b36
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-6de7-9b9ab10f5d73
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-07fe-cde4a7eb176c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8217-db829dce7c1e
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8b62-8b6fef16509e
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-0be7-91f0d69ee2f0
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9542-bd563e2e7341
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f78e-eabf2ed6d8fa
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-fa07-0228c4c48dc0
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-68f1-171c921f72bb
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-258c-fd0c3934e8d4
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-956a-de16cde7bc57
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-354d-2b2dc77e6d0e
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8c96-aa31715bd94d
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1b51-dc37b0f716e6
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1162-656558fe036c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-3d20-a88cb3124e6c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-ac7b-359e127cdfca
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-b6f9-0e83dc69c129
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-70c9-cc0e61ca8b2b
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1ec1-cf6a2e1df2cd
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-dd7e-c87e76457432
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-ddeb-b9985038fbdf
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-911f-9e355c6cfb63
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-03a8-e7019c0ae625
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-55d5-1e454ce7841b
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f323-af4de5179b56
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-146e-794b26296c53
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-54d9-9b2e4d0642e2
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-0804-bac4379d2f87
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-ae11-9321f62c5b73
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8b36-96a142de6f2f
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9f8f-b0a23f37f4e0
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-932f-412853fa62cc
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8ecf-f1d6eaf0268a
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-7c32-564e5fa30e5e
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8852-ff4eba3dd5fc
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9ede-655f9fe77dfb
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1f39-e21209851968
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-6764-30f0af0eff1d
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-b4f3-4e06b6c35f63
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-28aa-e9cc86a47891
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-3368-8246d579635e
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8b86-c3e33f0c5ea1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9923-cfc0f4f90526
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-0a4b-071db27a9f73
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-c8e7-b1a01a940747
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-899e-93a573897dee
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-2f80-cacfd26cb2d0
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-4394-059d81aec04b
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-b889-7d39ca5a4344
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-7f13-ecd90b9ff3a3
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1e0c-87f14014872b
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-91f2-a74879a8b0f3
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-df7d-b4c4559ff616
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-4037-fccdc3909326
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8e06-94d7e8a42dac
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-a090-8590dca21bf5
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-430a-15c23128e12f
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-2c1e-4b19332f205e
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-1799-166ea10e4373
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-7c6a-a427ee3cd750
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-fa4a-066712a08a9d
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-6bd5-0973fb643630
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-578f-4d2f9b74c449
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f9b5-d1448fdfd9b4
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f1de-9c0624fd6ac1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-4417-bbf7bb2283ad
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9e6a-97e90be0cde0
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-0f2e-34ff6af7a08c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-4490-1ab6078f8cc4
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-bbe8-58c09c36a61c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-138f-4fa3f70b14b2
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-e178-cbdaee0bec92
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-4fbf-d57703f61637
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-0505-5eea1752f301
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-e528-fb2eef74cf6f
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-177c-7b7a588e03fb
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-4160-b3630d508f96
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-5a06-09bd5317139d
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-9d55-7c570ccc2949
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-7281-0051f6c1515c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-cb04-2a7f70a1766b
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-2c44-f4584a4b0515
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-3905-e3e97ab24828
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-cbb3-21122949e29b
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-70c8-9b4d99176687
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-cde7-35d12452c7d0
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-b022-dfc8543046a5
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-271f-375a63d608ce
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-a092-430e29bd8b63
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-e993-995189598560
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-ac03-8c3211ab6633
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-779e-56a49ec7776b
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f031-6c6285472112
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-f1b6-4cfda38d5107
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-44e7-ccd5665e458a
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-0d92-93fe61eabaa1
00020000-5694-dd38-1742-d6c253655d11	00030000-5694-dd36-e05f-743042f99e0d
00020000-5694-dd38-f5bc-f3d1fba3d69f	00030000-5694-dd36-da1f-10591bb9f726
00020000-5694-dd38-066e-33b20f7c22a8	00030000-5694-dd36-452c-73c8ff546aa1
00020000-5694-dd38-7f5e-fe2bb5a2bac0	00030000-5694-dd36-2c44-f4584a4b0515
00020000-5694-dd38-c67c-14297d8ecca8	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd38-7135-2817e0ca794c	00030000-5694-dd36-9f0d-5ca1f51d0646
00020000-5694-dd38-5412-490b2b9f35e9	00030000-5694-dd36-91ea-0683b7bcc83f
00020000-5694-dd38-6a97-1251db3bb750	00030000-5694-dd36-1c34-09b4f1bf3ed9
00020000-5694-dd38-3eb7-2ba303674c32	00030000-5694-dd36-6190-f381eeaccb39
00020000-5694-dd38-5542-79e8e8dcc8c6	00030000-5694-dd36-7f3e-3a0aa47c1cc8
00020000-5694-dd38-0519-a085c56ca916	00030000-5694-dd36-d397-6d7902f03dd1
00020000-5694-dd38-ca08-3980d10d7f7f	00030000-5694-dd36-a2be-0a5de4b8355e
00020000-5694-dd38-63b2-2eddbe68b871	00030000-5694-dd36-6b1b-184722628253
00020000-5694-dd38-b795-11c8a588e88e	00030000-5694-dd36-1858-faf971e4236c
00020000-5694-dd38-0dd8-3ee07c363630	00030000-5694-dd36-56c8-2057d449e3f4
00020000-5694-dd38-f844-e0b8dca68b4d	00030000-5694-dd36-6795-f3f4ecf41b36
00020000-5694-dd38-0edb-e7a7fdb2a85a	00030000-5694-dd36-1025-e8bb02cb236d
00020000-5694-dd38-61bc-95687658e2ac	00030000-5694-dd36-870b-bd09a26eb8a1
00020000-5694-dd38-7294-aae32e72e974	00030000-5694-dd36-9b60-1be92a4b93dd
00020000-5694-dd38-16aa-0f0ddf4d588f	00030000-5694-dd36-dd0c-ab1adc17dead
00020000-5694-dd38-16aa-0f0ddf4d588f	00030000-5694-dd36-9542-bd563e2e7341
00020000-5694-dd38-16aa-0f0ddf4d588f	00030000-5694-dd36-5eb7-400df0522dc4
00020000-5694-dd38-235d-a7e4f7e8efa5	00030000-5694-dd36-f9ad-91f1b4e8d29c
00020000-5694-dd38-00b6-a60465424778	00030000-5694-dd36-cb04-2a7f70a1766b
00020000-5694-dd38-1da4-47fe4fc84480	00030000-5694-dd36-9e6a-97e90be0cde0
00020000-5694-dd38-fae2-ad8e4602f111	00030000-5694-dd36-2fad-561489447492
00020000-5694-dd38-0114-5c8f9e7024ba	00030000-5694-dd36-4490-1ab6078f8cc4
00020000-5694-dd38-09fb-c9d09582a29e	00030000-5694-dd36-1ff9-1a21ac539e38
00020000-5694-dd38-3b1d-ebccf5fda4a9	00030000-5694-dd36-8c96-aa31715bd94d
00020000-5694-dd38-33d7-f90894ec8fa3	00030000-5694-dd36-8ec3-a6407068ae49
00020000-5694-dd38-cfb1-ee792ed80fd6	00030000-5694-dd36-ac03-8c3211ab6633
00020000-5694-dd38-e58c-724411bb2433	00030000-5694-dd36-51c9-3f17f9b08bfd
00020000-5694-dd38-af08-547509b0d965	00030000-5694-dd36-0be7-91f0d69ee2f0
00020000-5694-dd38-28b6-cfe990c7347b	00030000-5694-dd36-9cbd-8fd4734812d2
00020000-5694-dd38-ff1d-ff0eecfa9fb6	00030000-5694-dd36-0f2e-34ff6af7a08c
00020000-5694-dd38-9e92-91f999582155	00030000-5694-dd36-defb-3ebf49d00c6e
00020000-5694-dd38-e5b9-8e47d965a89f	00030000-5694-dd36-f7f4-d160ed5236d1
00020000-5694-dd38-b08c-288cb1d30eb5	00030000-5694-dd36-9e52-728aca1ae944
00020000-5694-dd38-6a7d-910cf33537ce	00030000-5694-dd36-8ee3-38fc48a52c1f
00020000-5694-dd38-bbd1-8c696bac5479	00030000-5694-dd36-61e5-ceaea79544c0
00020000-5694-dd38-05b8-a2561d6ebfc4	00030000-5694-dd36-40d3-d4ceb73f3ac9
\.


--
-- TOC entry 3170 (class 0 OID 35340408)
-- Dependencies: 219
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 35340442)
-- Dependencies: 223
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 35340575)
-- Dependencies: 235
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5694-dd38-e782-da7940af23ee	00090000-5694-dd38-f208-36d2b72d4eb8	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5694-dd38-d569-86c626d7105d	00090000-5694-dd38-bffb-14529bc0eed4	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5694-dd38-3a54-3804363307e0	00090000-5694-dd38-9e2e-c6bf96a8c9c8	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5694-dd38-ce39-f1400e3baee5	00090000-5694-dd38-f194-c39982a01da9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3139 (class 0 OID 35340083)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5694-dd38-efe5-35aa65828f54	\N	00040000-5694-dd35-0612-346b8a116715	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-dd38-7b11-12da8c006c53	\N	00040000-5694-dd35-0612-346b8a116715	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5694-dd38-e9ac-1d3eca40751f	\N	00040000-5694-dd35-0612-346b8a116715	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-dd38-ff16-74aad7654ee0	\N	00040000-5694-dd35-0612-346b8a116715	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-dd38-5fc3-e50ffdfe815a	\N	00040000-5694-dd35-0612-346b8a116715	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-dd38-86e7-542edbad133b	\N	00040000-5694-dd35-7e22-74309507536c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-dd38-43dc-ed1911318dd1	\N	00040000-5694-dd35-b52a-7d6afff398df	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-dd38-a9f6-5d5ac1e8a527	\N	00040000-5694-dd35-a385-9e54fabb0fa4	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-dd38-e7e8-5822e9558b72	\N	00040000-5694-dd35-ad57-f4e55a79a5da	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-dd3a-cf29-2adacd03e0cb	\N	00040000-5694-dd35-0612-346b8a116715	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3142 (class 0 OID 35340128)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5694-dd35-2dad-fa8764000816	8341	Adlešiči
00050000-5694-dd35-f4a2-7600b5526fda	5270	Ajdovščina
00050000-5694-dd35-3d70-cdfe1ebb603b	6280	Ankaran/Ancarano
00050000-5694-dd35-8f95-edceafc5d266	9253	Apače
00050000-5694-dd35-f61f-1c562ae740c8	8253	Artiče
00050000-5694-dd35-1d63-5f0569bf6ac0	4275	Begunje na Gorenjskem
00050000-5694-dd35-634c-4ace619af13b	1382	Begunje pri Cerknici
00050000-5694-dd35-fe70-4024f9b8c27b	9231	Beltinci
00050000-5694-dd35-aa1d-5fbebcb8ca78	2234	Benedikt
00050000-5694-dd35-378d-567d276d80fc	2345	Bistrica ob Dravi
00050000-5694-dd35-791a-d050c38502de	3256	Bistrica ob Sotli
00050000-5694-dd35-b6a6-0ccda8f608c4	8259	Bizeljsko
00050000-5694-dd35-78bb-e61896329150	1223	Blagovica
00050000-5694-dd35-3b29-5e84aa30f9d7	8283	Blanca
00050000-5694-dd35-897b-e4c3f02a7ed7	4260	Bled
00050000-5694-dd35-b980-781312ed9185	4273	Blejska Dobrava
00050000-5694-dd35-42f6-669e319e0196	9265	Bodonci
00050000-5694-dd35-214d-c1bdec43d05e	9222	Bogojina
00050000-5694-dd35-b2ca-b44363c81d9d	4263	Bohinjska Bela
00050000-5694-dd35-10ce-7440ecdad45e	4264	Bohinjska Bistrica
00050000-5694-dd35-101f-e8b5b9b482a3	4265	Bohinjsko jezero
00050000-5694-dd35-5a5e-fb21ef30078a	1353	Borovnica
00050000-5694-dd35-788b-59bb88f6e5dd	8294	Boštanj
00050000-5694-dd35-57e2-0b9bb87026af	5230	Bovec
00050000-5694-dd35-6afe-b25eeb49772a	5295	Branik
00050000-5694-dd35-5403-0294ac0cd6f7	3314	Braslovče
00050000-5694-dd35-83a9-3c578b608f8f	5223	Breginj
00050000-5694-dd35-c602-cf8cc6d19a69	8280	Brestanica
00050000-5694-dd35-10ba-79f96a16a7fd	2354	Bresternica
00050000-5694-dd35-f43c-24c15043a43a	4243	Brezje
00050000-5694-dd35-c27e-e61169bbb564	1351	Brezovica pri Ljubljani
00050000-5694-dd35-c1ca-0bb3e4dddad6	8250	Brežice
00050000-5694-dd35-70c4-e516b34ef2d8	4210	Brnik - Aerodrom
00050000-5694-dd35-bc11-bd215129d474	8321	Brusnice
00050000-5694-dd35-248d-52c55e166312	3255	Buče
00050000-5694-dd35-32bc-3515c178fd15	8276	Bučka 
00050000-5694-dd35-852e-a53347670953	9261	Cankova
00050000-5694-dd35-28e5-c5b2deea45fb	3000	Celje 
00050000-5694-dd35-c7b0-e7c8e1e6dc2c	3001	Celje - poštni predali
00050000-5694-dd35-3c4f-e105301df137	4207	Cerklje na Gorenjskem
00050000-5694-dd35-9a76-0a6a913daea3	8263	Cerklje ob Krki
00050000-5694-dd35-52ce-eb7c40d9a6b6	1380	Cerknica
00050000-5694-dd35-7629-41901c199bd8	5282	Cerkno
00050000-5694-dd35-d34b-b78e243f806f	2236	Cerkvenjak
00050000-5694-dd35-2b19-7c0cc418ab25	2215	Ceršak
00050000-5694-dd35-43d5-19deeeef9458	2326	Cirkovce
00050000-5694-dd35-3a56-eefdd4985057	2282	Cirkulane
00050000-5694-dd35-53d4-1a339f992b39	5273	Col
00050000-5694-dd35-c5fb-1831232062fe	8251	Čatež ob Savi
00050000-5694-dd35-58c2-d739992a1f9a	1413	Čemšenik
00050000-5694-dd35-45f5-a6389b23f947	5253	Čepovan
00050000-5694-dd35-e6b9-eca2016ace54	9232	Črenšovci
00050000-5694-dd35-ba13-36f20c125f96	2393	Črna na Koroškem
00050000-5694-dd35-c2d8-ed08c53fcd02	6275	Črni Kal
00050000-5694-dd35-2f78-4f6e260297ce	5274	Črni Vrh nad Idrijo
00050000-5694-dd35-ba22-24dc1b12f01d	5262	Črniče
00050000-5694-dd35-bd33-1727a35060af	8340	Črnomelj
00050000-5694-dd35-305b-56ff41c30636	6271	Dekani
00050000-5694-dd35-4371-23714e039103	5210	Deskle
00050000-5694-dd35-e128-22fb6e8875c3	2253	Destrnik
00050000-5694-dd35-ecbf-2c2694c186a4	6215	Divača
00050000-5694-dd35-2779-57fd5827d74e	1233	Dob
00050000-5694-dd35-7694-aa6039e99dff	3224	Dobje pri Planini
00050000-5694-dd35-65e3-650974e296fe	8257	Dobova
00050000-5694-dd35-a5b2-23ed3ce93d2c	1423	Dobovec
00050000-5694-dd35-f854-a5501bc95ade	5263	Dobravlje
00050000-5694-dd35-4e8c-8528a7481c82	3204	Dobrna
00050000-5694-dd35-afa6-aaaa5c12f244	8211	Dobrnič
00050000-5694-dd35-6008-9a6f40a1fa49	1356	Dobrova
00050000-5694-dd35-e745-dc3e87722f32	9223	Dobrovnik/Dobronak 
00050000-5694-dd35-27fa-2cf95a0999b2	5212	Dobrovo v Brdih
00050000-5694-dd35-771f-92c4e4fc687a	1431	Dol pri Hrastniku
00050000-5694-dd35-097f-4a9089214d1e	1262	Dol pri Ljubljani
00050000-5694-dd35-a296-1a8f0840f011	1273	Dole pri Litiji
00050000-5694-dd35-27dc-915c59b2c3cf	1331	Dolenja vas
00050000-5694-dd35-3521-b051be88a81b	8350	Dolenjske Toplice
00050000-5694-dd35-4e15-c7f6d57c633a	1230	Domžale
00050000-5694-dd35-9d66-d24e9680f341	2252	Dornava
00050000-5694-dd35-2595-c6a20c4d5097	5294	Dornberk
00050000-5694-dd35-1912-e567367cde62	1319	Draga
00050000-5694-dd35-d0d8-920e02bab7d8	8343	Dragatuš
00050000-5694-dd35-c48c-df3c9d54cfd2	3222	Dramlje
00050000-5694-dd35-b361-611570977b81	2370	Dravograd
00050000-5694-dd35-e8fd-356f15ba7ae9	4203	Duplje
00050000-5694-dd35-2743-45b857969f1b	6221	Dutovlje
00050000-5694-dd35-5c45-a4d3bf9b9957	8361	Dvor
00050000-5694-dd35-683f-c815f82494ae	2343	Fala
00050000-5694-dd35-ee6a-d9162539c199	9208	Fokovci
00050000-5694-dd35-ea3f-911322e6a193	2313	Fram
00050000-5694-dd35-24b6-0308e57843ca	3213	Frankolovo
00050000-5694-dd35-2c5d-4ce7a3e4d3b9	1274	Gabrovka
00050000-5694-dd35-546c-1bf9e2e7cd9a	8254	Globoko
00050000-5694-dd35-71fb-dc29e1eeff2e	5275	Godovič
00050000-5694-dd35-2661-89f7bb47afe2	4204	Golnik
00050000-5694-dd35-351b-327f2082095e	3303	Gomilsko
00050000-5694-dd35-ce00-0d5a531db757	4224	Gorenja vas
00050000-5694-dd35-98cc-a33c4d7c4a40	3263	Gorica pri Slivnici
00050000-5694-dd35-59f5-8131ba6d97dd	2272	Gorišnica
00050000-5694-dd35-6eab-849f2481f1e2	9250	Gornja Radgona
00050000-5694-dd35-192d-5a198e06d58a	3342	Gornji Grad
00050000-5694-dd35-b189-ea78ca147c6a	4282	Gozd Martuljek
00050000-5694-dd35-7798-ed9b057c9c43	6272	Gračišče
00050000-5694-dd35-a27c-963130982775	9264	Grad
00050000-5694-dd35-6c6a-4fd64e61212b	8332	Gradac
00050000-5694-dd35-1a3a-af4ede0f68a4	1384	Grahovo
00050000-5694-dd35-f1c9-2af483060523	5242	Grahovo ob Bači
00050000-5694-dd35-1960-2e09e3333b99	5251	Grgar
00050000-5694-dd35-4414-f8a309fa2e5d	3302	Griže
00050000-5694-dd35-7ca2-35c6f1812eca	3231	Grobelno
00050000-5694-dd35-94ba-fbf81809a04b	1290	Grosuplje
00050000-5694-dd35-12a1-911e431d2de8	2288	Hajdina
00050000-5694-dd35-f632-6ffea27dd87c	8362	Hinje
00050000-5694-dd35-d256-ffe895ffe5b3	2311	Hoče
00050000-5694-dd35-8917-014737f6d3f8	9205	Hodoš/Hodos
00050000-5694-dd35-51d3-166070fffa7a	1354	Horjul
00050000-5694-dd35-7299-8f513826499d	1372	Hotedršica
00050000-5694-dd35-d0fd-b254454548f3	1430	Hrastnik
00050000-5694-dd35-8643-4382125788ae	6225	Hruševje
00050000-5694-dd35-37e4-4f0b33c9f893	4276	Hrušica
00050000-5694-dd35-015c-8c422ce3bc20	5280	Idrija
00050000-5694-dd35-8614-4e81980b2a68	1292	Ig
00050000-5694-dd35-c194-c761eb5b426c	6250	Ilirska Bistrica
00050000-5694-dd35-9c9a-389637dae1c5	6251	Ilirska Bistrica-Trnovo
00050000-5694-dd35-5ef4-bbd9e0d9777c	1295	Ivančna Gorica
00050000-5694-dd35-7f9b-4470c6b225c5	2259	Ivanjkovci
00050000-5694-dd35-fbc8-7eb0f7abea9e	1411	Izlake
00050000-5694-dd35-c31b-65e3d0381835	6310	Izola/Isola
00050000-5694-dd35-5fa7-031f0458d726	2222	Jakobski Dol
00050000-5694-dd35-26c8-776a03531365	2221	Jarenina
00050000-5694-dd35-831a-b63e8b36961f	6254	Jelšane
00050000-5694-dd35-70cd-c3cdc28d8f56	4270	Jesenice
00050000-5694-dd35-17aa-aba447c0febd	8261	Jesenice na Dolenjskem
00050000-5694-dd35-f6ea-00edda908b84	3273	Jurklošter
00050000-5694-dd35-e526-90b2c2988f57	2223	Jurovski Dol
00050000-5694-dd35-a192-f7211015e07c	2256	Juršinci
00050000-5694-dd35-294c-dfa2d5c98159	5214	Kal nad Kanalom
00050000-5694-dd35-e01e-acbc5a1ccdff	3233	Kalobje
00050000-5694-dd35-6d30-33d0e877fc27	4246	Kamna Gorica
00050000-5694-dd35-b5cd-f6fdc128db1a	2351	Kamnica
00050000-5694-dd35-ef7a-33e72d637dbe	1241	Kamnik
00050000-5694-dd35-8383-ced02fe2363b	5213	Kanal
00050000-5694-dd35-dbf7-33fc6fb3ad44	8258	Kapele
00050000-5694-dd35-724c-699c9aa6177e	2362	Kapla
00050000-5694-dd35-94cb-fee50f0bf8df	2325	Kidričevo
00050000-5694-dd35-5b62-d2c1392079d8	1412	Kisovec
00050000-5694-dd35-22a1-756161cc47db	6253	Knežak
00050000-5694-dd35-c544-b8ccc4adce28	5222	Kobarid
00050000-5694-dd35-c7ed-bf82de39510a	9227	Kobilje
00050000-5694-dd35-02e1-2b9f56821084	1330	Kočevje
00050000-5694-dd35-0279-c2a6725a8f03	1338	Kočevska Reka
00050000-5694-dd35-7b8a-f3716fcb07df	2276	Kog
00050000-5694-dd35-1aa4-d5717cac5ec3	5211	Kojsko
00050000-5694-dd35-80b0-af7f54f10022	6223	Komen
00050000-5694-dd35-3a38-0b47bbdcd607	1218	Komenda
00050000-5694-dd35-d99d-a6b0e7857e64	6000	Koper/Capodistria 
00050000-5694-dd35-bed4-a9c0c83b99a5	6001	Koper/Capodistria - poštni predali
00050000-5694-dd35-803b-94f6b868db03	8282	Koprivnica
00050000-5694-dd35-9594-d6a78487eee9	5296	Kostanjevica na Krasu
00050000-5694-dd35-7c26-59b2542bb6e3	8311	Kostanjevica na Krki
00050000-5694-dd35-4e49-f35ff4af32c0	1336	Kostel
00050000-5694-dd35-adaa-f4deb9659377	6256	Košana
00050000-5694-dd35-03fd-3ca255baa5a2	2394	Kotlje
00050000-5694-dd35-ee2f-067c5e4eac38	6240	Kozina
00050000-5694-dd35-a055-da64c8c1c430	3260	Kozje
00050000-5694-dd35-38eb-4b6cf89b268a	4000	Kranj 
00050000-5694-dd35-5c3b-b623f348ebe9	4001	Kranj - poštni predali
00050000-5694-dd35-3302-f80a2d31b4ba	4280	Kranjska Gora
00050000-5694-dd35-aafb-e4688a54cf24	1281	Kresnice
00050000-5694-dd35-f32f-1e2cdd9468c0	4294	Križe
00050000-5694-dd35-5050-c1bdc60ed41d	9206	Križevci
00050000-5694-dd35-3cdd-8fbc238fb59a	9242	Križevci pri Ljutomeru
00050000-5694-dd35-6df8-48c49f854fdf	1301	Krka
00050000-5694-dd35-9682-fc33af3bc5c1	8296	Krmelj
00050000-5694-dd35-819b-3990ae8a1526	4245	Kropa
00050000-5694-dd35-c5cf-54a64cf78eab	8262	Krška vas
00050000-5694-dd35-4e4d-cf3ab75dfdfb	8270	Krško
00050000-5694-dd35-0b87-869ac1979fe8	9263	Kuzma
00050000-5694-dd35-a596-d3242cdc6426	2318	Laporje
00050000-5694-dd35-9e7e-393419960223	3270	Laško
00050000-5694-dd35-89dc-79007ba3292a	1219	Laze v Tuhinju
00050000-5694-dd35-7973-8a233def2d75	2230	Lenart v Slovenskih goricah
00050000-5694-dd35-f76f-99fd4f3fae58	9220	Lendava/Lendva
00050000-5694-dd35-6c38-deaca44dc4a9	4248	Lesce
00050000-5694-dd35-5ef1-7886d6b3774a	3261	Lesično
00050000-5694-dd35-4ee9-4f2f81a744d7	8273	Leskovec pri Krškem
00050000-5694-dd35-1e4e-4e1c16d30640	2372	Libeliče
00050000-5694-dd35-e2b1-fb1e8bb03048	2341	Limbuš
00050000-5694-dd35-8c5f-97134ccbd39b	1270	Litija
00050000-5694-dd35-9af1-a298f9b771cb	3202	Ljubečna
00050000-5694-dd35-a8f2-a5ebe531f750	1000	Ljubljana 
00050000-5694-dd35-57c4-2a1970169c8a	1001	Ljubljana - poštni predali
00050000-5694-dd35-b03a-140b60019f38	1231	Ljubljana - Črnuče
00050000-5694-dd35-3a4e-f3e1a566a45f	1261	Ljubljana - Dobrunje
00050000-5694-dd35-f2cf-d4743513d088	1260	Ljubljana - Polje
00050000-5694-dd35-4f6a-fb6e2bb0c032	1210	Ljubljana - Šentvid
00050000-5694-dd35-224e-8da758f7a300	1211	Ljubljana - Šmartno
00050000-5694-dd35-0b58-1ae3bb8adb4a	3333	Ljubno ob Savinji
00050000-5694-dd35-88c9-a18330e72f19	9240	Ljutomer
00050000-5694-dd35-7600-2b488b3dc593	3215	Loče
00050000-5694-dd35-f4c6-8a6eaea22d81	5231	Log pod Mangartom
00050000-5694-dd35-604c-91fb8a62d20b	1358	Log pri Brezovici
00050000-5694-dd35-28ef-5da70cdf2e44	1370	Logatec
00050000-5694-dd35-640e-c585535fd006	1371	Logatec
00050000-5694-dd35-be78-148d2ddacae6	1434	Loka pri Zidanem Mostu
00050000-5694-dd35-783d-a0ee10c68f09	3223	Loka pri Žusmu
00050000-5694-dd35-b599-2b13466f051f	6219	Lokev
00050000-5694-dd35-f114-dc737ee195d6	1318	Loški Potok
00050000-5694-dd35-e8d7-d5b09befaf03	2324	Lovrenc na Dravskem polju
00050000-5694-dd35-26d2-14667e465679	2344	Lovrenc na Pohorju
00050000-5694-dd35-1833-21b88508909e	3334	Luče
00050000-5694-dd35-a04a-a4b7b20780e7	1225	Lukovica
00050000-5694-dd35-14b7-9049270fb4b7	9202	Mačkovci
00050000-5694-dd35-6631-f3a7e60b3199	2322	Majšperk
00050000-5694-dd35-266f-602233948c5d	2321	Makole
00050000-5694-dd35-cf91-7c49d84d5f18	9243	Mala Nedelja
00050000-5694-dd35-4c58-171099b549c7	2229	Malečnik
00050000-5694-dd35-0a9e-b39ae1ab3677	6273	Marezige
00050000-5694-dd35-08d0-41ad07bfb38b	2000	Maribor 
00050000-5694-dd35-56b2-acc114e104cb	2001	Maribor - poštni predali
00050000-5694-dd35-a965-062036ee35d6	2206	Marjeta na Dravskem polju
00050000-5694-dd35-80d9-efc95599b900	2281	Markovci
00050000-5694-dd35-8a6f-919e66839a8f	9221	Martjanci
00050000-5694-dd35-0c76-4df5c2040f1d	6242	Materija
00050000-5694-dd35-7ecf-194e7705f819	4211	Mavčiče
00050000-5694-dd35-c8ac-0bccec8dfe70	1215	Medvode
00050000-5694-dd35-1f30-67255d488df7	1234	Mengeš
00050000-5694-dd35-6f80-e90236718df4	8330	Metlika
00050000-5694-dd35-1618-139e8dd215e1	2392	Mežica
00050000-5694-dd35-31cc-d2b4c9f03a23	2204	Miklavž na Dravskem polju
00050000-5694-dd35-080b-c90916dcd7ae	2275	Miklavž pri Ormožu
00050000-5694-dd35-c011-5faf0941675d	5291	Miren
00050000-5694-dd35-5b8d-177037cdf98c	8233	Mirna
00050000-5694-dd35-68e8-a78c46a6702c	8216	Mirna Peč
00050000-5694-dd35-e7fd-1efc0080c482	2382	Mislinja
00050000-5694-dd35-26b2-177e67219970	4281	Mojstrana
00050000-5694-dd35-dbe0-111d7c23b560	8230	Mokronog
00050000-5694-dd35-2d5e-fc8d788a03f8	1251	Moravče
00050000-5694-dd35-bc5a-b6b740a0a484	9226	Moravske Toplice
00050000-5694-dd35-df86-d10074b7e3c0	5216	Most na Soči
00050000-5694-dd35-eed0-10bbf7ded2a6	1221	Motnik
00050000-5694-dd35-e42e-d89b21f2b47a	3330	Mozirje
00050000-5694-dd35-d17f-e6d50ca59dd4	9000	Murska Sobota 
00050000-5694-dd35-85ea-cc7d49675be3	9001	Murska Sobota - poštni predali
00050000-5694-dd35-4672-7691d8ce7ae9	2366	Muta
00050000-5694-dd35-a6b9-85e411dfa6ed	4202	Naklo
00050000-5694-dd35-2500-eb5debbe4e5d	3331	Nazarje
00050000-5694-dd35-b550-cda17c005e7e	1357	Notranje Gorice
00050000-5694-dd35-5d93-2ca2d214fe74	3203	Nova Cerkev
00050000-5694-dd35-0f36-642516d203e1	5000	Nova Gorica 
00050000-5694-dd35-eb0c-644d15758ce1	5001	Nova Gorica - poštni predali
00050000-5694-dd35-dead-49640efea4cb	1385	Nova vas
00050000-5694-dd35-7d30-5f5f40db8958	8000	Novo mesto
00050000-5694-dd35-48c6-b7851e3faf98	8001	Novo mesto - poštni predali
00050000-5694-dd35-7cbf-39044b44f711	6243	Obrov
00050000-5694-dd35-2e96-ac6b080abc36	9233	Odranci
00050000-5694-dd35-c392-e0b388e931fb	2317	Oplotnica
00050000-5694-dd35-3189-c1489626364c	2312	Orehova vas
00050000-5694-dd35-a0b6-e89fe2c28227	2270	Ormož
00050000-5694-dd35-4fcb-a973acfb68e6	1316	Ortnek
00050000-5694-dd35-b450-aff91e09f7fa	1337	Osilnica
00050000-5694-dd35-8a24-56faaf2bb71e	8222	Otočec
00050000-5694-dd35-0e5f-37d065374ee1	2361	Ožbalt
00050000-5694-dd35-8565-5089cdaee79c	2231	Pernica
00050000-5694-dd35-8b84-f4461ac12954	2211	Pesnica pri Mariboru
00050000-5694-dd35-312b-2d643720a8ae	9203	Petrovci
00050000-5694-dd35-56bd-d1f928483b2d	3301	Petrovče
00050000-5694-dd35-7fd2-c914520668c8	6330	Piran/Pirano
00050000-5694-dd35-bf1a-888dbb4438da	8255	Pišece
00050000-5694-dd35-475e-9a9c82873011	6257	Pivka
00050000-5694-dd35-2e29-d9ac32eaf9f5	6232	Planina
00050000-5694-dd35-97aa-30a21eb37dea	3225	Planina pri Sevnici
00050000-5694-dd35-8a19-29dcb6609252	6276	Pobegi
00050000-5694-dd35-0b03-3662a59c6e20	8312	Podbočje
00050000-5694-dd35-601e-d1b8373fb1e5	5243	Podbrdo
00050000-5694-dd35-8e91-be9a5258ca86	3254	Podčetrtek
00050000-5694-dd35-24a4-1395a1062f75	2273	Podgorci
00050000-5694-dd35-93c7-6ab47024227f	6216	Podgorje
00050000-5694-dd35-5fc9-d47e7845103b	2381	Podgorje pri Slovenj Gradcu
00050000-5694-dd35-0381-f2cf587bccda	6244	Podgrad
00050000-5694-dd35-304f-7d2cf43c792a	1414	Podkum
00050000-5694-dd35-c094-ea86faef503b	2286	Podlehnik
00050000-5694-dd35-3902-cccd3e763882	5272	Podnanos
00050000-5694-dd35-9e00-2a21ba4ba346	4244	Podnart
00050000-5694-dd35-8538-38d5790209cb	3241	Podplat
00050000-5694-dd35-dbcd-ef6a9d91c01a	3257	Podsreda
00050000-5694-dd35-acf2-5f7fb7a15e42	2363	Podvelka
00050000-5694-dd35-5fbc-925fe5483bee	2208	Pohorje
00050000-5694-dd35-7a74-7cdd03333572	2257	Polenšak
00050000-5694-dd35-e08c-9388a9fcf66e	1355	Polhov Gradec
00050000-5694-dd35-0b07-a32087a4c130	4223	Poljane nad Škofjo Loko
00050000-5694-dd35-517e-a9273efdb768	2319	Poljčane
00050000-5694-dd35-5d97-1b8da5719945	1272	Polšnik
00050000-5694-dd35-d319-978d890a227a	3313	Polzela
00050000-5694-dd35-a84f-c6c82423db42	3232	Ponikva
00050000-5694-dd35-2ae7-6211d1511dd2	6320	Portorož/Portorose
00050000-5694-dd35-98e3-3eae1c65b860	6230	Postojna
00050000-5694-dd35-63e9-d1637e8a369b	2331	Pragersko
00050000-5694-dd35-882f-1a5c69d840c1	3312	Prebold
00050000-5694-dd35-24a8-46297f9aca66	4205	Preddvor
00050000-5694-dd35-c90b-111a4ad041ca	6255	Prem
00050000-5694-dd35-4235-1e03c0cd0490	1352	Preserje
00050000-5694-dd35-970b-284b86d06d39	6258	Prestranek
00050000-5694-dd35-e96d-94a68c23a017	2391	Prevalje
00050000-5694-dd35-3695-e4b6169b1c26	3262	Prevorje
00050000-5694-dd35-0011-149e7b17b2df	1276	Primskovo 
00050000-5694-dd35-3733-ee5dde1d225d	3253	Pristava pri Mestinju
00050000-5694-dd35-c517-2f3562013e19	9207	Prosenjakovci/Partosfalva
00050000-5694-dd35-3e93-2b4b4af24722	5297	Prvačina
00050000-5694-dd35-6fd9-be6282b2c9ed	2250	Ptuj
00050000-5694-dd35-8f62-3ff9f485d2ae	2323	Ptujska Gora
00050000-5694-dd35-c66a-ccdcec326c5f	9201	Puconci
00050000-5694-dd35-5c0a-a792484acb7d	2327	Rače
00050000-5694-dd35-4610-25bad96eb6ef	1433	Radeče
00050000-5694-dd35-3d3d-622c2b498079	9252	Radenci
00050000-5694-dd35-2176-9f853c604ff1	2360	Radlje ob Dravi
00050000-5694-dd35-8c48-8a6e1c08ab33	1235	Radomlje
00050000-5694-dd35-2a3f-860102440db9	4240	Radovljica
00050000-5694-dd35-bf46-81cacf0ab727	8274	Raka
00050000-5694-dd35-8397-e99690078a3d	1381	Rakek
00050000-5694-dd35-0657-5aac89398abb	4283	Rateče - Planica
00050000-5694-dd35-a9df-bfe38c8f7a47	2390	Ravne na Koroškem
00050000-5694-dd35-191c-ac2f07cd8ed3	9246	Razkrižje
00050000-5694-dd35-eaca-a154c77464d3	3332	Rečica ob Savinji
00050000-5694-dd35-6a49-ef001ec9785a	5292	Renče
00050000-5694-dd35-eff6-90ad54ef756f	1310	Ribnica
00050000-5694-dd35-739a-3fb6a750fea4	2364	Ribnica na Pohorju
00050000-5694-dd35-1115-c7c0c6f1249d	3272	Rimske Toplice
00050000-5694-dd35-b8ea-07efa22bfa17	1314	Rob
00050000-5694-dd35-d8fa-a64cfe27cb84	5215	Ročinj
00050000-5694-dd35-a550-5c03ae656d74	3250	Rogaška Slatina
00050000-5694-dd35-4ca4-ace3808c4b05	9262	Rogašovci
00050000-5694-dd35-434d-88becae1fd3b	3252	Rogatec
00050000-5694-dd35-20f2-ef3821d11398	1373	Rovte
00050000-5694-dd35-86df-60beb953a3f0	2342	Ruše
00050000-5694-dd35-0476-b5eec3731675	1282	Sava
00050000-5694-dd35-4218-c30ff84008e1	6333	Sečovlje/Sicciole
00050000-5694-dd35-2b60-4ba174d4809b	4227	Selca
00050000-5694-dd35-c2d3-f7849be33efc	2352	Selnica ob Dravi
00050000-5694-dd35-b7b4-7cf8889fafd7	8333	Semič
00050000-5694-dd35-87d6-5b5545d43ffc	8281	Senovo
00050000-5694-dd35-bd95-abe5d5c0c9be	6224	Senožeče
00050000-5694-dd35-be15-8c65baf1487e	8290	Sevnica
00050000-5694-dd35-f237-7a38541a915e	6210	Sežana
00050000-5694-dd35-1f75-a0e3d6c67bbf	2214	Sladki Vrh
00050000-5694-dd35-ea32-e44b066879fb	5283	Slap ob Idrijci
00050000-5694-dd35-d878-73d967e386ae	2380	Slovenj Gradec
00050000-5694-dd35-2ff1-7439cc719f4f	2310	Slovenska Bistrica
00050000-5694-dd35-f261-cc8d7fc2cb37	3210	Slovenske Konjice
00050000-5694-dd35-be50-e4e025ac9016	1216	Smlednik
00050000-5694-dd35-ee2b-d627b83fa2ed	5232	Soča
00050000-5694-dd35-6282-74941315ca37	1317	Sodražica
00050000-5694-dd35-dcc6-69811f063162	3335	Solčava
00050000-5694-dd35-6778-79cc810e6d95	5250	Solkan
00050000-5694-dd35-c8a4-0a0ce59041c5	4229	Sorica
00050000-5694-dd35-9b86-117413d7d83c	4225	Sovodenj
00050000-5694-dd35-268b-ad5d6e2c5a04	5281	Spodnja Idrija
00050000-5694-dd35-e9cd-50e07650825f	2241	Spodnji Duplek
00050000-5694-dd35-d186-359a9d7bc88a	9245	Spodnji Ivanjci
00050000-5694-dd35-d3b9-85e91f51066e	2277	Središče ob Dravi
00050000-5694-dd35-dff8-7d88b9ec88cb	4267	Srednja vas v Bohinju
00050000-5694-dd35-59b7-c0f60181a77a	8256	Sromlje 
00050000-5694-dd35-e9a0-104b27c56097	5224	Srpenica
00050000-5694-dd35-ce42-9985628a6e40	1242	Stahovica
00050000-5694-dd35-c8cb-63518ffd2a3c	1332	Stara Cerkev
00050000-5694-dd35-41cb-b66afe7ad614	8342	Stari trg ob Kolpi
00050000-5694-dd35-ee68-a62fe52bc409	1386	Stari trg pri Ložu
00050000-5694-dd35-8ded-8d54f6b24c5b	2205	Starše
00050000-5694-dd35-4ea7-e858573a3351	2289	Stoperce
00050000-5694-dd35-a973-42be6893447d	8322	Stopiče
00050000-5694-dd35-2019-47108996f635	3206	Stranice
00050000-5694-dd35-820a-c18c9e739f8f	8351	Straža
00050000-5694-dd35-ca05-70f556e6f698	1313	Struge
00050000-5694-dd35-92ad-731da16b3c33	8293	Studenec
00050000-5694-dd35-cc2d-9d0f160c8a52	8331	Suhor
00050000-5694-dd35-5c17-9339c4919f7c	2233	Sv. Ana v Slovenskih goricah
00050000-5694-dd35-19b4-2554d65b221d	2235	Sv. Trojica v Slovenskih goricah
00050000-5694-dd35-7b17-df94bd73d35c	2353	Sveti Duh na Ostrem Vrhu
00050000-5694-dd35-eaeb-88183cb48c45	9244	Sveti Jurij ob Ščavnici
00050000-5694-dd35-c09e-da6d38324911	3264	Sveti Štefan
00050000-5694-dd35-9e08-f0c168ee4186	2258	Sveti Tomaž
00050000-5694-dd35-2839-a9b0e596c13b	9204	Šalovci
00050000-5694-dd35-76f7-b7baf87907f8	5261	Šempas
00050000-5694-dd35-1021-1d4b608f369a	5290	Šempeter pri Gorici
00050000-5694-dd35-da0b-927b4029ce95	3311	Šempeter v Savinjski dolini
00050000-5694-dd35-e00b-e846e848746b	4208	Šenčur
00050000-5694-dd35-3249-7d952eb0474c	2212	Šentilj v Slovenskih goricah
00050000-5694-dd35-0aa6-7012a341f548	8297	Šentjanž
00050000-5694-dd35-bed9-0f6a55ef9768	2373	Šentjanž pri Dravogradu
00050000-5694-dd35-b2fd-f68fb10fd94b	8310	Šentjernej
00050000-5694-dd35-b87a-653197beec11	3230	Šentjur
00050000-5694-dd35-e224-6396c4156403	3271	Šentrupert
00050000-5694-dd35-5e93-91bc5db8fcd0	8232	Šentrupert
00050000-5694-dd35-364c-2634862d6d2c	1296	Šentvid pri Stični
00050000-5694-dd35-e773-2f0206212405	8275	Škocjan
00050000-5694-dd35-3f97-810724ace70c	6281	Škofije
00050000-5694-dd35-a5ad-22c48c3476fc	4220	Škofja Loka
00050000-5694-dd35-190e-f9b13ac5ebcc	3211	Škofja vas
00050000-5694-dd35-63ed-1d2b8c51767c	1291	Škofljica
00050000-5694-dd35-ea26-13f9207282a6	6274	Šmarje
00050000-5694-dd35-ed2f-849ab590a41f	1293	Šmarje - Sap
00050000-5694-dd35-a2be-9a379ae8fb90	3240	Šmarje pri Jelšah
00050000-5694-dd35-7f58-5175215d946e	8220	Šmarješke Toplice
00050000-5694-dd35-a1b5-2f1295b64246	2315	Šmartno na Pohorju
00050000-5694-dd35-1699-f8e12f98e6fa	3341	Šmartno ob Dreti
00050000-5694-dd35-aaa5-3903a353c80f	3327	Šmartno ob Paki
00050000-5694-dd35-9b59-3e1fe0cddce6	1275	Šmartno pri Litiji
00050000-5694-dd35-dcdf-2823bd099b14	2383	Šmartno pri Slovenj Gradcu
00050000-5694-dd35-c282-b46050f8cb1f	3201	Šmartno v Rožni dolini
00050000-5694-dd35-df82-c40dc63ce772	3325	Šoštanj
00050000-5694-dd35-7ad3-63ba117de834	6222	Štanjel
00050000-5694-dd35-5002-bab8d053c3e0	3220	Štore
00050000-5694-dd35-c567-f89202bbbce9	3304	Tabor
00050000-5694-dd35-6d16-6123a1c84206	3221	Teharje
00050000-5694-dd35-d76b-f40f8f980aa1	9251	Tišina
00050000-5694-dd35-4e49-9e31d7b2a67b	5220	Tolmin
00050000-5694-dd35-92f5-598fd071faa6	3326	Topolšica
00050000-5694-dd35-7a8e-07e337af48f4	2371	Trbonje
00050000-5694-dd35-7be5-667d0eeb0184	1420	Trbovlje
00050000-5694-dd35-b25a-a3c618023fad	8231	Trebelno 
00050000-5694-dd35-8ab6-b32560cb52b6	8210	Trebnje
00050000-5694-dd35-6e8b-3a6c0b3116cc	5252	Trnovo pri Gorici
00050000-5694-dd35-4223-bceeb2ef7737	2254	Trnovska vas
00050000-5694-dd35-a8e6-b38d84c95a60	1222	Trojane
00050000-5694-dd35-3f03-7ffc8fb5c7d9	1236	Trzin
00050000-5694-dd35-e604-b31f547c4c61	4290	Tržič
00050000-5694-dd35-b8dc-5c7a5eedf80f	8295	Tržišče
00050000-5694-dd35-41cf-accf7aea6768	1311	Turjak
00050000-5694-dd35-11ac-e33eb4535144	9224	Turnišče
00050000-5694-dd35-d455-832cb2546d2e	8323	Uršna sela
00050000-5694-dd35-7847-9600c03bab5a	1252	Vače
00050000-5694-dd35-6ee1-25f0e790c502	3320	Velenje 
00050000-5694-dd35-eb1d-a5d1788a9ff5	3322	Velenje - poštni predali
00050000-5694-dd35-fbba-3bafb33ac3d2	8212	Velika Loka
00050000-5694-dd35-fba3-f0ccd669b208	2274	Velika Nedelja
00050000-5694-dd35-4ff4-15a28d1237c0	9225	Velika Polana
00050000-5694-dd35-66dd-92d96f7708e1	1315	Velike Lašče
00050000-5694-dd35-96b1-700710c8ebbc	8213	Veliki Gaber
00050000-5694-dd35-4a9e-ecca048d56bd	9241	Veržej
00050000-5694-dd35-8f30-44e1ebef5c7b	1312	Videm - Dobrepolje
00050000-5694-dd35-e2d2-4ce563ebb1f4	2284	Videm pri Ptuju
00050000-5694-dd35-0e20-44f9bc008acc	8344	Vinica
00050000-5694-dd35-f12e-183ddb0ba4e8	5271	Vipava
00050000-5694-dd35-4554-e1ff46d69484	4212	Visoko
00050000-5694-dd35-3693-f4ff6bda0c49	1294	Višnja Gora
00050000-5694-dd35-bdf5-6571e53f126e	3205	Vitanje
00050000-5694-dd35-be43-7e75c56ea67c	2255	Vitomarci
00050000-5694-dd35-b016-814a4f19ed25	1217	Vodice
00050000-5694-dd35-f409-58e5e08b5251	3212	Vojnik\t
00050000-5694-dd35-95f7-e2b3f6e481f6	5293	Volčja Draga
00050000-5694-dd35-b66c-1784d5036f15	2232	Voličina
00050000-5694-dd35-d359-229db3a6711a	3305	Vransko
00050000-5694-dd35-f644-d3542579fb53	6217	Vremski Britof
00050000-5694-dd35-9c04-70d54c63f7b7	1360	Vrhnika
00050000-5694-dd35-0f1a-1e206f27b3ee	2365	Vuhred
00050000-5694-dd35-82e3-fa576d17f8dc	2367	Vuzenica
00050000-5694-dd35-75c2-cb8df6572724	8292	Zabukovje 
00050000-5694-dd35-9d9b-c7aa0712647b	1410	Zagorje ob Savi
00050000-5694-dd35-3ca4-6a3b2f110f65	1303	Zagradec
00050000-5694-dd35-f872-ea5643c02d11	2283	Zavrč
00050000-5694-dd35-4669-5c1078b7bf16	8272	Zdole 
00050000-5694-dd35-fb7b-bdadc72bad8e	4201	Zgornja Besnica
00050000-5694-dd35-a388-8b53e75f4e8d	2242	Zgornja Korena
00050000-5694-dd35-1576-4ce52d2bf406	2201	Zgornja Kungota
00050000-5694-dd35-f7d1-b9b11810fd5a	2316	Zgornja Ložnica
00050000-5694-dd35-52d3-3a30818e2211	2314	Zgornja Polskava
00050000-5694-dd35-91c9-2320ce63795b	2213	Zgornja Velka
00050000-5694-dd35-5e6d-547ec347de96	4247	Zgornje Gorje
00050000-5694-dd35-2827-a42bd7f1c2b8	4206	Zgornje Jezersko
00050000-5694-dd35-362d-a70c0e742d1f	2285	Zgornji Leskovec
00050000-5694-dd35-c114-41e2f58046ef	1432	Zidani Most
00050000-5694-dd35-6b26-402ce58ac2aa	3214	Zreče
00050000-5694-dd35-ec23-a789030ff869	4209	Žabnica
00050000-5694-dd35-b928-ed3be97a4703	3310	Žalec
00050000-5694-dd35-0552-a60ab98f4b01	4228	Železniki
00050000-5694-dd35-eff2-b6e33b1f9ff5	2287	Žetale
00050000-5694-dd35-f5ea-0ece2a9560b2	4226	Žiri
00050000-5694-dd35-0d09-620e2fc464c4	4274	Žirovnica
00050000-5694-dd35-4945-67b89c06cd2c	8360	Žužemberk
\.


--
-- TOC entry 3193 (class 0 OID 35340813)
-- Dependencies: 242
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 35340382)
-- Dependencies: 215
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 35340113)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5694-dd38-75d1-ecd4edacf95c	00080000-5694-dd38-efe5-35aa65828f54	\N	00040000-5694-dd35-0612-346b8a116715	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5694-dd38-9489-23341b13b4db	00080000-5694-dd38-efe5-35aa65828f54	\N	00040000-5694-dd35-0612-346b8a116715	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5694-dd38-0b7a-28086bd697cb	00080000-5694-dd38-7b11-12da8c006c53	\N	00040000-5694-dd35-0612-346b8a116715	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3153 (class 0 OID 35340257)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5694-dd35-6845-623b8c533496	novo leto	1	1	\N	t
00430000-5694-dd35-91df-00c2b5928cd4	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5694-dd35-8b48-295e9706c654	dan upora proti okupatorju	27	4	\N	t
00430000-5694-dd35-9e2d-87e667d39013	praznik dela	1	5	\N	t
00430000-5694-dd35-9fba-9aea80dd30d9	praznik dela	2	5	\N	t
00430000-5694-dd35-dc24-04dfeb22ced0	dan Primoža Trubarja	8	6	\N	f
00430000-5694-dd35-fed8-9335271cd188	dan državnosti	25	6	\N	t
00430000-5694-dd35-29e8-54b1b8d86248	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5694-dd35-7f0c-81471df08833	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5694-dd35-9325-12d89b4642d4	dan suverenosti	25	10	\N	f
00430000-5694-dd35-0a22-5c165c1ec708	dan spomina na mrtve	1	11	\N	t
00430000-5694-dd35-c5ca-f94a5ac5359e	dan Rudolfa Maistra	23	11	\N	f
00430000-5694-dd35-89a3-42c37628f6e1	božič	25	12	\N	t
00430000-5694-dd35-ce1b-57b7ba4b57fa	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5694-dd35-c787-8a7c42d04c11	Marijino vnebovzetje	15	8	\N	t
00430000-5694-dd35-d1e4-cdb4626d2942	dan reformacije	31	10	\N	t
00430000-5694-dd35-539f-7a22928770a4	velikonočna nedelja	27	3	2016	t
00430000-5694-dd35-a094-d270084d4026	velikonočna nedelja	16	4	2017	t
00430000-5694-dd35-fbd8-9853a279fd9c	velikonočna nedelja	1	4	2018	t
00430000-5694-dd35-fd41-deea7c0a7074	velikonočna nedelja	21	4	2019	t
00430000-5694-dd35-ce75-a6515b53a93c	velikonočna nedelja	12	4	2020	t
00430000-5694-dd35-f9ad-00ff336e8914	velikonočna nedelja	4	4	2021	t
00430000-5694-dd35-5fe1-50a666ef4808	velikonočna nedelja	17	4	2022	t
00430000-5694-dd35-f0e6-880e45abd587	velikonočna nedelja	9	4	2023	t
00430000-5694-dd35-1f29-9f935eaa7e59	velikonočna nedelja	31	3	2024	t
00430000-5694-dd35-a1ac-97aefb77a73a	velikonočna nedelja	20	4	2025	t
00430000-5694-dd35-a5d5-459a401d0ee5	velikonočna nedelja	5	4	2026	t
00430000-5694-dd35-804a-b5e7ae893147	velikonočna nedelja	28	3	2027	t
00430000-5694-dd35-1aa7-07e1a8a6cf22	velikonočna nedelja	16	4	2028	t
00430000-5694-dd35-0635-8d4ab7a74d24	velikonočna nedelja	1	4	2029	t
00430000-5694-dd35-61fc-15ed989e674d	velikonočna nedelja	21	4	2030	t
00430000-5694-dd35-d96c-a9bd0a4de58c	velikonočni ponedeljek	28	3	2016	t
00430000-5694-dd35-88b1-9de32f13c4db	velikonočni ponedeljek	17	4	2017	t
00430000-5694-dd35-1d97-689b982c4837	velikonočni ponedeljek	2	4	2018	t
00430000-5694-dd35-131f-5b480c0c06d5	velikonočni ponedeljek	22	4	2019	t
00430000-5694-dd35-20cf-4f539b17f275	velikonočni ponedeljek	13	4	2020	t
00430000-5694-dd35-38a4-b0afdee4d1d3	velikonočni ponedeljek	5	4	2021	t
00430000-5694-dd35-0b23-604c925e091c	velikonočni ponedeljek	18	4	2022	t
00430000-5694-dd35-f084-4e2b1e23f06c	velikonočni ponedeljek	10	4	2023	t
00430000-5694-dd35-18e4-b806815538a7	velikonočni ponedeljek	1	4	2024	t
00430000-5694-dd35-9cff-447a8991807e	velikonočni ponedeljek	21	4	2025	t
00430000-5694-dd35-276e-d8d41f8ac59b	velikonočni ponedeljek	6	4	2026	t
00430000-5694-dd35-aa43-d18659af8453	velikonočni ponedeljek	29	3	2027	t
00430000-5694-dd35-34cd-31ddbaf66824	velikonočni ponedeljek	17	4	2028	t
00430000-5694-dd35-fe58-2f939f36321a	velikonočni ponedeljek	2	4	2029	t
00430000-5694-dd35-60ff-5d61362db596	velikonočni ponedeljek	22	4	2030	t
00430000-5694-dd35-86e9-b5b622e97966	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5694-dd36-54ba-b2b3cb0eb5ad	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5694-dd36-29fa-e6a5bbf234d1	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5694-dd36-43d0-beac941a2765	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5694-dd36-eafa-b296729f15fd	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5694-dd36-1b49-03dcb87b8ca7	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5694-dd36-b897-605a8d3a0aa6	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5694-dd36-bdbd-8157b5f434eb	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5694-dd36-a1a3-0569d5370f82	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5694-dd36-71a6-f89e7831a14c	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5694-dd36-23de-398c8718e52d	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5694-dd36-672d-53bb7655d0ef	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5694-dd36-07dd-6c27dff5c24e	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5694-dd36-e52f-991fa576be6e	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5694-dd36-fe0e-0b376ddf5c8f	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3149 (class 0 OID 35340217)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 35340229)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 35340394)
-- Dependencies: 217
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 35340827)
-- Dependencies: 243
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 35340837)
-- Dependencies: 244
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5694-dd38-140b-cbb23cbc110e	00080000-5694-dd38-e9ac-1d3eca40751f	0987	AK
00190000-5694-dd38-7876-23c292ae3acc	00080000-5694-dd38-7b11-12da8c006c53	0989	AK
00190000-5694-dd38-aa6f-c4f013031c63	00080000-5694-dd38-ff16-74aad7654ee0	0986	AK
00190000-5694-dd38-5cea-8865ad066516	00080000-5694-dd38-86e7-542edbad133b	0984	AK
00190000-5694-dd38-fcbf-823c3433ba4d	00080000-5694-dd38-43dc-ed1911318dd1	0983	AK
00190000-5694-dd38-449a-cb7c249f5841	00080000-5694-dd38-a9f6-5d5ac1e8a527	0982	AK
00190000-5694-dd3a-f536-230e362007c7	00080000-5694-dd3a-cf29-2adacd03e0cb	1001	AK
\.


--
-- TOC entry 3192 (class 0 OID 35340726)
-- Dependencies: 241
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5694-dd39-d35c-b670fcf47f2e	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3196 (class 0 OID 35340845)
-- Dependencies: 245
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 35340423)
-- Dependencies: 221
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5694-dd38-42dc-0cedf2c2f8cb	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5694-dd38-b4c4-ba18e771acdc	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5694-dd38-2f5b-898395914909	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5694-dd38-589c-0d3ad45c5b66	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5694-dd38-b37d-dc8012796bb1	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5694-dd38-7bbe-e98c5f8c691e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5694-dd38-6a46-5c3e98a06abf	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3164 (class 0 OID 35340367)
-- Dependencies: 213
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 35340357)
-- Dependencies: 212
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 35340564)
-- Dependencies: 234
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 35340494)
-- Dependencies: 228
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 35340191)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 35339953)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5694-dd3a-cf29-2adacd03e0cb	00010000-5694-dd36-4266-dc7eaea65562	2016-01-12 12:02:18	INS	a:0:{}
2	App\\Entity\\Option	00000000-5694-dd3a-c697-2e891f8814f5	00010000-5694-dd36-4266-dc7eaea65562	2016-01-12 12:02:18	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5694-dd3a-f536-230e362007c7	00010000-5694-dd36-4266-dc7eaea65562	2016-01-12 12:02:18	INS	a:0:{}
\.


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3173 (class 0 OID 35340436)
-- Dependencies: 222
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 35339991)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5694-dd36-8704-c5a36bd92f76	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5694-dd36-f878-da0b3519a0ea	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5694-dd36-a9af-06f3351509bf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5694-dd36-ce89-8367735e252b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5694-dd36-a245-95556848f026	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5694-dd36-82b0-7fc96dd84f1c	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5694-dd36-f5c2-c48f36f53215	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5694-dd36-f6ae-1d36bbcb1854	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5694-dd36-6cd7-d15621878f2b	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-dd36-ac37-34c55836119c	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-dd36-da2d-dfce902b7061	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-dd36-ff55-dfbda78d6e6d	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-dd36-acbe-6c95d66fd241	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5694-dd36-4578-6adc56f04a71	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5694-dd36-e84e-0b83d9f363af	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5694-dd36-d84c-017d7d9f04f3	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5694-dd36-0056-f7df56b82b50	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5694-dd36-9b9f-9f9b0f75b2fa	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5694-dd36-87be-0f9888b7f88c	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5694-dd36-4608-780474c470b8	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5694-dd36-dac6-fd357abcebde	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5694-dd36-893d-871e15403a65	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5694-dd36-baae-1a1fa4edf8e1	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5694-dd36-d3bd-a7965f3700e9	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5694-dd36-82ec-c8bc4eb95885	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5694-dd36-cc9c-2e88665f4f35	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5694-dd36-f4e4-c061a94c01b6	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5694-dd36-c485-aa050ea00363	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5694-dd36-8e5a-b8312406298f	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5694-dd36-48de-3c2e9a93c4a2	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5694-dd36-68fa-857ac352392c	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5694-dd36-011b-908cad8a11a5	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5694-dd36-eb89-b84da76aed60	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5694-dd36-5263-c43c8a98f15e	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5694-dd36-ada5-7b4510dfeb01	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5694-dd36-47ee-5d7fe1794bfe	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5694-dd36-2f22-c5ce43e70e64	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5694-dd36-ae0f-eaaf81d2f0dc	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5694-dd36-46db-47309432af52	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5694-dd36-3441-aae25859bc44	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5694-dd36-428a-2bf9d352b4b9	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5694-dd36-ddf6-ae2b5e79ab14	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5694-dd36-116e-ef988f86f019	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5694-dd36-d636-5ca4d9355121	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5694-dd36-0d9d-9a56cad28c99	direktor	minimalne pravice za direktorja	t
00020000-5694-dd36-1409-aee259237316	arhivar	arhivar	t
00020000-5694-dd36-ae5b-b1b064d4ed37	dramaturg	dramaturg	t
00020000-5694-dd36-ac73-bdf1fbf211f0	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5694-dd36-c11c-468e21d3b158	poslovni-sekretar	poslovni sekretar	t
00020000-5694-dd36-9153-4f5963cb4ad6	vodja-tehnike	vodja tehnike	t
00020000-5694-dd36-991b-94ef4e8edc0b	racunovodja	računovodja	t
00020000-5694-dd38-1742-d6c253655d11	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5694-dd38-f5bc-f3d1fba3d69f	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-066e-33b20f7c22a8	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-7f5e-fe2bb5a2bac0	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-c67c-14297d8ecca8	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-7135-2817e0ca794c	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-5412-490b2b9f35e9	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-6a97-1251db3bb750	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-3eb7-2ba303674c32	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-5542-79e8e8dcc8c6	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-0519-a085c56ca916	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-ca08-3980d10d7f7f	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-63b2-2eddbe68b871	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-b795-11c8a588e88e	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-0dd8-3ee07c363630	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-f844-e0b8dca68b4d	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-0edb-e7a7fdb2a85a	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-61bc-95687658e2ac	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-7294-aae32e72e974	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-16aa-0f0ddf4d588f	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5694-dd38-235d-a7e4f7e8efa5	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-00b6-a60465424778	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-1da4-47fe4fc84480	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-fae2-ad8e4602f111	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-0114-5c8f9e7024ba	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-09fb-c9d09582a29e	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-3b1d-ebccf5fda4a9	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-33d7-f90894ec8fa3	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-cfb1-ee792ed80fd6	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-e58c-724411bb2433	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-af08-547509b0d965	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-28b6-cfe990c7347b	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-ff1d-ff0eecfa9fb6	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-9e92-91f999582155	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-e5b9-8e47d965a89f	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-b08c-288cb1d30eb5	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-6a7d-910cf33537ce	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-bbd1-8c696bac5479	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5694-dd38-05b8-a2561d6ebfc4	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3128 (class 0 OID 35339975)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5694-dd36-8929-3dd8d399f42c	00020000-5694-dd36-a9af-06f3351509bf
00010000-5694-dd36-4266-dc7eaea65562	00020000-5694-dd36-a9af-06f3351509bf
00010000-5694-dd38-163f-14e352b7098f	00020000-5694-dd38-1742-d6c253655d11
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-f5bc-f3d1fba3d69f
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-7135-2817e0ca794c
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-5542-79e8e8dcc8c6
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-ca08-3980d10d7f7f
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-b795-11c8a588e88e
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-7294-aae32e72e974
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-7f5e-fe2bb5a2bac0
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-235d-a7e4f7e8efa5
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-fae2-ad8e4602f111
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-09fb-c9d09582a29e
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-33d7-f90894ec8fa3
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-e58c-724411bb2433
00010000-5694-dd38-bb53-7b0c73067a74	00020000-5694-dd38-9e92-91f999582155
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-f5bc-f3d1fba3d69f
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-066e-33b20f7c22a8
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-7f5e-fe2bb5a2bac0
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-c67c-14297d8ecca8
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-b795-11c8a588e88e
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-0edb-e7a7fdb2a85a
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-235d-a7e4f7e8efa5
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-fae2-ad8e4602f111
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-09fb-c9d09582a29e
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-33d7-f90894ec8fa3
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-e58c-724411bb2433
00010000-5694-dd38-d83a-429b4606a820	00020000-5694-dd38-9e92-91f999582155
00010000-5694-dd38-9921-7ba9eef5e6c5	00020000-5694-dd38-f5bc-f3d1fba3d69f
00010000-5694-dd38-9921-7ba9eef5e6c5	00020000-5694-dd38-066e-33b20f7c22a8
00010000-5694-dd38-9921-7ba9eef5e6c5	00020000-5694-dd38-7f5e-fe2bb5a2bac0
00010000-5694-dd38-9921-7ba9eef5e6c5	00020000-5694-dd38-c67c-14297d8ecca8
00010000-5694-dd38-9921-7ba9eef5e6c5	00020000-5694-dd38-ca08-3980d10d7f7f
00010000-5694-dd38-9921-7ba9eef5e6c5	00020000-5694-dd38-b795-11c8a588e88e
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-066e-33b20f7c22a8
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-5412-490b2b9f35e9
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-0519-a085c56ca916
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-63b2-2eddbe68b871
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-ca08-3980d10d7f7f
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-61bc-95687658e2ac
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-b795-11c8a588e88e
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-0dd8-3ee07c363630
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-235d-a7e4f7e8efa5
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-00b6-a60465424778
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-fae2-ad8e4602f111
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-0114-5c8f9e7024ba
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-09fb-c9d09582a29e
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-3b1d-ebccf5fda4a9
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-33d7-f90894ec8fa3
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-cfb1-ee792ed80fd6
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-e58c-724411bb2433
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-af08-547509b0d965
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-9e92-91f999582155
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-e5b9-8e47d965a89f
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-6a7d-910cf33537ce
00010000-5694-dd38-d904-d47706d2459b	00020000-5694-dd38-bbd1-8c696bac5479
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-066e-33b20f7c22a8
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-5412-490b2b9f35e9
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-3eb7-2ba303674c32
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-0519-a085c56ca916
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-63b2-2eddbe68b871
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-ca08-3980d10d7f7f
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-61bc-95687658e2ac
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-b795-11c8a588e88e
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-0dd8-3ee07c363630
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-f844-e0b8dca68b4d
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-235d-a7e4f7e8efa5
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-00b6-a60465424778
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-1da4-47fe4fc84480
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-fae2-ad8e4602f111
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-0114-5c8f9e7024ba
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-09fb-c9d09582a29e
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-3b1d-ebccf5fda4a9
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-33d7-f90894ec8fa3
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-cfb1-ee792ed80fd6
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-e58c-724411bb2433
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-af08-547509b0d965
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-9e92-91f999582155
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-e5b9-8e47d965a89f
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-b08c-288cb1d30eb5
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-6a7d-910cf33537ce
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-bbd1-8c696bac5479
00010000-5694-dd38-7c37-8d4d7dc5b87d	00020000-5694-dd38-05b8-a2561d6ebfc4
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-066e-33b20f7c22a8
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-7f5e-fe2bb5a2bac0
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-5412-490b2b9f35e9
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-6a97-1251db3bb750
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-3eb7-2ba303674c32
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-7135-2817e0ca794c
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-0519-a085c56ca916
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-63b2-2eddbe68b871
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-ca08-3980d10d7f7f
00010000-5694-dd38-2f84-dd4a6a58cdec	00020000-5694-dd38-61bc-95687658e2ac
00010000-5694-dd38-fba8-776f4b41fd6e	00020000-5694-dd38-f5bc-f3d1fba3d69f
00010000-5694-dd38-fba8-776f4b41fd6e	00020000-5694-dd38-c67c-14297d8ecca8
00010000-5694-dd38-fba8-776f4b41fd6e	00020000-5694-dd38-7135-2817e0ca794c
00010000-5694-dd38-fba8-776f4b41fd6e	00020000-5694-dd38-5542-79e8e8dcc8c6
00010000-5694-dd38-fba8-776f4b41fd6e	00020000-5694-dd38-ca08-3980d10d7f7f
00010000-5694-dd38-fba8-776f4b41fd6e	00020000-5694-dd38-b795-11c8a588e88e
00010000-5694-dd38-fba8-776f4b41fd6e	00020000-5694-dd38-7294-aae32e72e974
00010000-5694-dd38-fba8-776f4b41fd6e	00020000-5694-dd38-28b6-cfe990c7347b
00010000-5694-dd38-dd40-15a5c953f17c	00020000-5694-dd38-16aa-0f0ddf4d588f
00010000-5694-dd38-adc6-2415d8e00efc	00020000-5694-dd36-0d9d-9a56cad28c99
00010000-5694-dd38-9b88-dbfb7409d9a3	00020000-5694-dd36-1409-aee259237316
00010000-5694-dd38-df56-9e49ffdbfa9d	00020000-5694-dd36-ae5b-b1b064d4ed37
00010000-5694-dd38-767b-57e651a26e61	00020000-5694-dd36-ac73-bdf1fbf211f0
00010000-5694-dd38-eaf5-a79731535076	00020000-5694-dd36-c11c-468e21d3b158
00010000-5694-dd38-8ff9-1b36a4cadf87	00020000-5694-dd36-9153-4f5963cb4ad6
00010000-5694-dd38-49fd-c9f8af2d0125	00020000-5694-dd36-991b-94ef4e8edc0b
\.


--
-- TOC entry 3175 (class 0 OID 35340450)
-- Dependencies: 224
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 35340388)
-- Dependencies: 216
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 35340317)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5694-dd38-6923-dacfac3841b1	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5694-dd38-c205-f250d978a9b5	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5694-dd38-c7c5-e573de2633fb	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3124 (class 0 OID 35339940)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5694-dd35-eb15-80a25630051b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5694-dd35-6089-f32d8b5f790e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5694-dd35-59c2-2f1c74471e28	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5694-dd35-46e4-f25f6992ce44	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5694-dd35-299a-bac8a9e59c01	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3123 (class 0 OID 35339932)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5694-dd35-73cd-bf04301fe0f3	00230000-5694-dd35-46e4-f25f6992ce44	popa
00240000-5694-dd35-43ca-7ea3d0e7701e	00230000-5694-dd35-46e4-f25f6992ce44	oseba
00240000-5694-dd35-c7ab-cc793db55142	00230000-5694-dd35-46e4-f25f6992ce44	tippopa
00240000-5694-dd35-1c13-bf036b4eaf06	00230000-5694-dd35-46e4-f25f6992ce44	organizacijskaenota
00240000-5694-dd35-05a2-1953055875f4	00230000-5694-dd35-46e4-f25f6992ce44	sezona
00240000-5694-dd35-04f2-c4a2943d113d	00230000-5694-dd35-46e4-f25f6992ce44	tipvaje
00240000-5694-dd35-50ee-234625499941	00230000-5694-dd35-46e4-f25f6992ce44	tipdodatka
00240000-5694-dd35-f2a0-29ed6f6dd9c0	00230000-5694-dd35-6089-f32d8b5f790e	prostor
00240000-5694-dd35-19a5-254a9bfa04c4	00230000-5694-dd35-46e4-f25f6992ce44	besedilo
00240000-5694-dd35-a438-4fe63b45937e	00230000-5694-dd35-46e4-f25f6992ce44	uprizoritev
00240000-5694-dd35-6913-c8521477f49a	00230000-5694-dd35-46e4-f25f6992ce44	funkcija
00240000-5694-dd35-5e4b-edf4e29cdab5	00230000-5694-dd35-46e4-f25f6992ce44	tipfunkcije
00240000-5694-dd35-5883-2448ab229093	00230000-5694-dd35-46e4-f25f6992ce44	alternacija
00240000-5694-dd35-6ebe-939ef1f69c11	00230000-5694-dd35-eb15-80a25630051b	pogodba
00240000-5694-dd35-d7a9-7b4fa3a1e343	00230000-5694-dd35-46e4-f25f6992ce44	zaposlitev
00240000-5694-dd35-4591-f6fe57df4b6c	00230000-5694-dd35-46e4-f25f6992ce44	zvrstuprizoritve
00240000-5694-dd35-917a-7c8a7c7773b8	00230000-5694-dd35-eb15-80a25630051b	programdela
00240000-5694-dd35-fa6e-9cb6c3774c10	00230000-5694-dd35-46e4-f25f6992ce44	zapis
\.


--
-- TOC entry 3122 (class 0 OID 35339927)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ebdd7706-215c-4fa3-81b6-19870e7544cf	00240000-5694-dd35-73cd-bf04301fe0f3	0	1001
\.


--
-- TOC entry 3181 (class 0 OID 35340511)
-- Dependencies: 230
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5694-dd39-b0ce-5f083721d00a	000e0000-5694-dd38-c234-3d3f07bfbb4e	00080000-5694-dd38-efe5-35aa65828f54	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5694-dd35-b647-07f37174cba2
00270000-5694-dd39-f17b-1f3246489ac9	000e0000-5694-dd38-c234-3d3f07bfbb4e	00080000-5694-dd38-efe5-35aa65828f54	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5694-dd35-b647-07f37174cba2
\.


--
-- TOC entry 3138 (class 0 OID 35340075)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 35340327)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5694-dd39-4b5f-7379c9847803	00180000-5694-dd38-50a8-2af521ffcca0	000c0000-5694-dd39-a821-9310db588f4d	00090000-5694-dd38-f208-36d2b72d4eb8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-dd39-4415-b0a6b38c7c71	00180000-5694-dd38-50a8-2af521ffcca0	000c0000-5694-dd39-e74d-2698d7c11a71	00090000-5694-dd38-f194-c39982a01da9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-dd39-79ff-1fd8fb1b6772	00180000-5694-dd38-50a8-2af521ffcca0	000c0000-5694-dd39-d1a8-e0d57def3905	00090000-5694-dd38-a696-cc9fe1965139	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-dd39-b445-7e9f23c2715a	00180000-5694-dd38-50a8-2af521ffcca0	000c0000-5694-dd39-3f9a-747f588c2409	00090000-5694-dd38-95b4-1ab0cd21f00e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-dd39-e813-2c2f301eb8f6	00180000-5694-dd38-50a8-2af521ffcca0	000c0000-5694-dd39-9af8-fac7b9102836	00090000-5694-dd38-6148-8bbe16246e90	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-dd39-ea23-fbc347fe157c	00180000-5694-dd38-f8a7-c90a03404859	\N	00090000-5694-dd38-6148-8bbe16246e90	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5694-dd39-7cf3-0a0d38d1910a	00180000-5694-dd38-f8a7-c90a03404859	\N	00090000-5694-dd38-f194-c39982a01da9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3162 (class 0 OID 35340347)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5694-dd35-15fb-20a1969f31c8	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5694-dd35-0d73-8498c22efd74	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5694-dd35-9f26-c7b595976f6a	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5694-dd35-b238-35e96ba877f4	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5694-dd35-232f-c0fa809f7e52	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5694-dd35-5cad-8412fb8127f9	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3184 (class 0 OID 35340552)
-- Dependencies: 233
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5694-dd35-8579-05d6b5f897ff	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5694-dd35-6c47-bba98b2d569e	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5694-dd35-6780-5cde07b4689d	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5694-dd35-999f-8cce4c63192d	04	Režija	Režija	Režija	umetnik	30
000f0000-5694-dd35-c711-d20110a09b72	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5694-dd35-b113-e052d8d979ab	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5694-dd35-20a6-53d12cb4489c	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5694-dd35-cf2d-c3c73fbf3557	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5694-dd35-5984-b2cdcc356c6e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5694-dd35-dc0b-e1b977db1e86	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5694-dd35-143f-d18f38da07d3	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5694-dd35-80f7-a91bb42578a9	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5694-dd35-1cee-af50b24751e5	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5694-dd35-97fd-d787e73cbee7	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5694-dd35-f14b-b22a250b3459	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5694-dd35-fa4a-17ef40ad89b9	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5694-dd35-1221-a0916bd1a77f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5694-dd35-48f6-9037d8808af9	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3135 (class 0 OID 35340026)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5694-dd38-dd82-f59aa39d6cd4	0001	šola	osnovna ali srednja šola
00400000-5694-dd38-d842-a8811670389e	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5694-dd38-b7a9-9288aad981e7	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3197 (class 0 OID 35340857)
-- Dependencies: 246
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5694-dd35-641b-4c53012c617d	01	Velika predstava	f	1.00	1.00
002b0000-5694-dd35-481b-0705583f15ab	02	Mala predstava	f	0.50	0.50
002b0000-5694-dd35-1f07-55b856769893	03	Mala koprodukcija	t	0.40	1.00
002b0000-5694-dd35-bd66-f31b7c24fa89	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5694-dd35-0b64-ad3bf125739f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3158 (class 0 OID 35340307)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5694-dd35-b745-b41b7284fb29	0001	prva vaja	prva vaja
00420000-5694-dd35-6310-5f8c8e0f6a18	0002	tehnična vaja	tehnična vaja
00420000-5694-dd35-233b-4c0548593514	0003	lučna vaja	lučna vaja
00420000-5694-dd35-0f59-204fd921da8f	0004	kostumska vaja	kostumska vaja
00420000-5694-dd35-8b66-7bec9b1252f7	0005	foto vaja	foto vaja
00420000-5694-dd35-45fc-66820595375b	0006	1. glavna vaja	1. glavna vaja
00420000-5694-dd35-e463-902ef36527d1	0007	2. glavna vaja	2. glavna vaja
00420000-5694-dd35-095f-1febaa02d398	0008	1. generalka	1. generalka
00420000-5694-dd35-2b4a-bfb85bf8d3dc	0009	2. generalka	2. generalka
00420000-5694-dd35-6511-11728910e26b	0010	odprta generalka	odprta generalka
00420000-5694-dd35-267b-bb80039ef9d7	0011	obnovitvena vaja	obnovitvena vaja
00420000-5694-dd35-beb0-3aee26bc4e50	0012	italijanka	krajša "obnovitvena" vaja
00420000-5694-dd35-d266-4f3063254399	0013	pevska vaja	pevska vaja
00420000-5694-dd35-ef97-efe278c37986	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5694-dd35-c6af-d9f6a31b4b19	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5694-dd35-6277-657d1afd0874	0016	orientacijska vaja	orientacijska vaja
00420000-5694-dd35-3640-e89cd2ff146f	0017	situacijska vaja	situacijska vaja
00420000-5694-dd35-8115-fc0f9d26f3ae	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3144 (class 0 OID 35340148)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 35339962)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5694-dd36-4266-dc7eaea65562	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRODK4X6uR4rEfWyRzoPRT3F8s0rgjjuxy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5694-dd38-9122-cbc0c4eb1fb2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5694-dd38-6f38-fe4f0824288a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5694-dd38-295c-2899604aa47e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5694-dd38-8380-c1da736f7352	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5694-dd38-607f-057cb0e700a6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5694-dd38-6b17-c2f41f1922e7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5694-dd38-b4af-1f72fe355230	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5694-dd38-1f83-63eac2605a9d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5694-dd38-6039-9fe04431c3ac	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5694-dd38-163f-14e352b7098f	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5694-dd38-bb26-f8fc869fb906	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5694-dd38-bb53-7b0c73067a74	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5694-dd38-d83a-429b4606a820	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5694-dd38-9921-7ba9eef5e6c5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5694-dd38-d904-d47706d2459b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5694-dd38-7c37-8d4d7dc5b87d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5694-dd38-2f84-dd4a6a58cdec	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5694-dd38-fba8-776f4b41fd6e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5694-dd38-dd40-15a5c953f17c	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5694-dd38-adc6-2415d8e00efc	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5694-dd38-9b88-dbfb7409d9a3	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5694-dd38-df56-9e49ffdbfa9d	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5694-dd38-767b-57e651a26e61	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5694-dd38-eaf5-a79731535076	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5694-dd38-8ff9-1b36a4cadf87	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5694-dd38-49fd-c9f8af2d0125	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5694-dd36-8929-3dd8d399f42c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 35340602)
-- Dependencies: 237
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5694-dd38-50e8-0e352a8c81b0	00160000-5694-dd38-543d-2b16953c2fe0	\N	00140000-5694-dd35-3315-59b3395f797a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5694-dd38-b37d-dc8012796bb1
000e0000-5694-dd38-c234-3d3f07bfbb4e	00160000-5694-dd38-91d0-00b67ec4f15e	\N	00140000-5694-dd35-3424-a9cb309d1415	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5694-dd38-7bbe-e98c5f8c691e
000e0000-5694-dd38-3e83-5531f8a93780	\N	\N	00140000-5694-dd35-3424-a9cb309d1415	00190000-5694-dd38-140b-cbb23cbc110e	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5694-dd38-b37d-dc8012796bb1
000e0000-5694-dd38-a8db-4f91baffc0eb	\N	\N	00140000-5694-dd35-3424-a9cb309d1415	00190000-5694-dd38-140b-cbb23cbc110e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5694-dd38-b37d-dc8012796bb1
000e0000-5694-dd38-d837-ff601467d279	\N	\N	00140000-5694-dd35-3424-a9cb309d1415	00190000-5694-dd38-140b-cbb23cbc110e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-f1c3-ec3e37a6ae1d	\N	\N	00140000-5694-dd35-3424-a9cb309d1415	00190000-5694-dd38-140b-cbb23cbc110e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-90f3-b16bda46ef4e	\N	\N	00140000-5694-dd35-b268-d036a757ad51	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-3416-e3e1fd6a55c4	\N	\N	00140000-5694-dd35-b268-d036a757ad51	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-1995-7304976a4932	\N	\N	00140000-5694-dd35-b268-d036a757ad51	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-68ef-695a7f49c38b	\N	\N	00140000-5694-dd35-b268-d036a757ad51	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-926f-1cc4431fa7ab	\N	\N	00140000-5694-dd35-b268-d036a757ad51	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-d84c-cb510191ff4d	\N	\N	00140000-5694-dd35-b268-d036a757ad51	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-3396-8385bcacabde	\N	\N	00140000-5694-dd35-b268-d036a757ad51	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-fc63-3d4f9af28653	\N	\N	00140000-5694-dd35-b268-d036a757ad51	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
000e0000-5694-dd38-7a63-e0c8dff1ac16	\N	\N	00140000-5694-dd35-b268-d036a757ad51	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-dd38-42dc-0cedf2c2f8cb
\.


--
-- TOC entry 3152 (class 0 OID 35340247)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5694-dd38-890b-60dea045ff07	\N	000e0000-5694-dd38-c234-3d3f07bfbb4e	1	
00200000-5694-dd38-c9d1-08b3532a56e3	\N	000e0000-5694-dd38-c234-3d3f07bfbb4e	2	
00200000-5694-dd38-4435-485779d5ed1b	\N	000e0000-5694-dd38-c234-3d3f07bfbb4e	3	
00200000-5694-dd38-e58a-009d9bb9f6d2	\N	000e0000-5694-dd38-c234-3d3f07bfbb4e	4	
00200000-5694-dd38-599b-595685ef7c3f	\N	000e0000-5694-dd38-c234-3d3f07bfbb4e	5	
\.


--
-- TOC entry 3171 (class 0 OID 35340415)
-- Dependencies: 220
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 35340525)
-- Dependencies: 231
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5694-dd35-1571-dd85646136fb	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5694-dd35-97bb-728f0f0efa41	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5694-dd35-0408-054945474a02	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5694-dd35-da86-1793536505a1	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5694-dd35-2517-7be270ae6fc6	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5694-dd35-487d-88b5139c27df	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5694-dd35-03e8-531af318d34e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5694-dd35-6fa3-3cf3f35582a1	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5694-dd35-b647-07f37174cba2	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5694-dd35-018e-bae17850d9ec	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5694-dd35-90b4-5dc4b69d6788	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5694-dd35-2f37-f074a9f15785	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5694-dd35-dbcd-f3f718a7c7e2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5694-dd35-d26b-33f17ca01815	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5694-dd35-15d1-dadf33027e19	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5694-dd35-4aae-7c65314bb372	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5694-dd35-ff66-65739e48dcf3	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5694-dd35-41a6-380ee1e79cfb	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5694-dd35-c54a-fa4409832540	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5694-dd35-dc71-e3d3d6e772e0	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5694-dd35-b86b-1fd93240e2b1	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5694-dd35-d60c-4037bb73c0dd	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5694-dd35-0a98-905c38a10aec	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5694-dd35-f811-b4850db3effc	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5694-dd35-e2e1-781ae7c93ca2	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5694-dd35-6875-2dfc7470640e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5694-dd35-1b61-6d90abfe1b25	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5694-dd35-7436-be4900246f62	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3200 (class 0 OID 35340907)
-- Dependencies: 249
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 35340876)
-- Dependencies: 248
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 35340919)
-- Dependencies: 250
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 35340487)
-- Dependencies: 227
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5694-dd38-65d1-77f1e1fd8d72	00090000-5694-dd38-f194-c39982a01da9	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-dd38-c5d5-3e9738518b8a	00090000-5694-dd38-a696-cc9fe1965139	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-dd38-ea62-b08298c0f141	00090000-5694-dd38-ef56-c76a6919b313	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-dd38-6e69-b518416039e7	00090000-5694-dd38-df4e-dfe3c9ca6bb6	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-dd38-e1cb-47982cd1dda1	00090000-5694-dd38-c2b7-9bb31b0c0ff7	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-dd38-d29a-2693b6aaaa28	00090000-5694-dd38-d4ee-1847b1ee81ef	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3155 (class 0 OID 35340291)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 35340592)
-- Dependencies: 236
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5694-dd35-3315-59b3395f797a	01	Drama	drama (SURS 01)
00140000-5694-dd35-b4ea-d5487c4ddcbe	02	Opera	opera (SURS 02)
00140000-5694-dd35-186f-39696d036e0a	03	Balet	balet (SURS 03)
00140000-5694-dd35-b630-7c40af2e078d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5694-dd35-b268-d036a757ad51	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5694-dd35-3424-a9cb309d1415	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5694-dd35-686a-ad81f8f23cce	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3177 (class 0 OID 35340477)
-- Dependencies: 226
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2607 (class 2606 OID 35340025)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 35340651)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 35340641)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 35340016)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 35340508)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 35340550)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 35340960)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 35340344)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 35340279)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 35340301)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 35340306)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 35340874)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 35340174)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 35340720)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 35340473)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 35340245)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 35340212)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 35340188)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 35340380)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2885 (class 2606 OID 35340937)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 35340944)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2896 (class 2606 OID 35340968)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2753 (class 2606 OID 35340407)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 35340146)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 35340044)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 35340108)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 35340071)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 35340005)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2596 (class 2606 OID 35339990)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 35340413)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 35340449)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 35340587)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 35340099)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 35340134)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 35340825)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 35340386)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 35340124)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 35340264)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 35340233)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2674 (class 2606 OID 35340225)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 35340398)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 35340834)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 35340842)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 35340812)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 35340855)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 35340431)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 35340371)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 35340362)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 35340574)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 35340501)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 35340200)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 35339961)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 35340440)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 35339979)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2598 (class 2606 OID 35339999)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 35340458)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 35340393)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 35340325)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 35339949)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 35339937)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 35339931)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 35340521)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 35340080)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 35340336)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 35340354)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 35340561)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 35340033)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 35340867)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 35340314)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 35340159)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 35339974)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 35340620)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 35340254)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 35340421)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 35340533)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 35340917)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 35340901)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 35340925)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 35340491)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 35340295)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 35340600)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 35340485)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 1259 OID 35340289)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2691 (class 1259 OID 35340290)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2692 (class 1259 OID 35340288)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2693 (class 1259 OID 35340287)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2694 (class 1259 OID 35340286)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2796 (class 1259 OID 35340522)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2797 (class 1259 OID 35340523)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2798 (class 1259 OID 35340524)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2882 (class 1259 OID 35340939)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2883 (class 1259 OID 35340938)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2625 (class 1259 OID 35340101)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2626 (class 1259 OID 35340102)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2754 (class 1259 OID 35340414)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2869 (class 1259 OID 35340905)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2870 (class 1259 OID 35340904)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2871 (class 1259 OID 35340906)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2872 (class 1259 OID 35340903)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2873 (class 1259 OID 35340902)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2748 (class 1259 OID 35340400)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2749 (class 1259 OID 35340399)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2682 (class 1259 OID 35340255)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2683 (class 1259 OID 35340256)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 35340474)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2779 (class 1259 OID 35340476)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2780 (class 1259 OID 35340475)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2657 (class 1259 OID 35340190)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2658 (class 1259 OID 35340189)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2860 (class 1259 OID 35340856)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2812 (class 1259 OID 35340589)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2813 (class 1259 OID 35340590)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2814 (class 1259 OID 35340591)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2879 (class 1259 OID 35340926)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2821 (class 1259 OID 35340625)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2822 (class 1259 OID 35340622)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2823 (class 1259 OID 35340626)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2824 (class 1259 OID 35340624)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2825 (class 1259 OID 35340623)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2647 (class 1259 OID 35340161)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 35340160)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2616 (class 1259 OID 35340074)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2766 (class 1259 OID 35340441)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2600 (class 1259 OID 35340006)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2601 (class 1259 OID 35340007)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2771 (class 1259 OID 35340461)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2772 (class 1259 OID 35340460)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2773 (class 1259 OID 35340459)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2630 (class 1259 OID 35340111)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2631 (class 1259 OID 35340110)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2632 (class 1259 OID 35340112)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2670 (class 1259 OID 35340228)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2671 (class 1259 OID 35340226)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 35340227)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2580 (class 1259 OID 35339939)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2728 (class 1259 OID 35340366)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2729 (class 1259 OID 35340364)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2730 (class 1259 OID 35340363)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2731 (class 1259 OID 35340365)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2591 (class 1259 OID 35339980)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2592 (class 1259 OID 35339981)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2757 (class 1259 OID 35340422)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2892 (class 1259 OID 35340961)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2794 (class 1259 OID 35340510)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2795 (class 1259 OID 35340509)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2893 (class 1259 OID 35340969)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2894 (class 1259 OID 35340970)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2743 (class 1259 OID 35340387)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2788 (class 1259 OID 35340502)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2789 (class 1259 OID 35340503)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2842 (class 1259 OID 35340725)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2843 (class 1259 OID 35340724)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2844 (class 1259 OID 35340721)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2845 (class 1259 OID 35340722)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2846 (class 1259 OID 35340723)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2636 (class 1259 OID 35340126)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 35340125)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2638 (class 1259 OID 35340127)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2760 (class 1259 OID 35340435)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2761 (class 1259 OID 35340434)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2852 (class 1259 OID 35340835)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2853 (class 1259 OID 35340836)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2835 (class 1259 OID 35340655)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2836 (class 1259 OID 35340656)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2837 (class 1259 OID 35340653)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2838 (class 1259 OID 35340654)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2722 (class 1259 OID 35340345)
-- Name: idx_aab095ce5e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce5e15bdbd ON dodatek USING btree (terminstoritve_id);


--
-- TOC entry 2723 (class 1259 OID 35340346)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2784 (class 1259 OID 35340492)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2785 (class 1259 OID 35340493)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2734 (class 1259 OID 35340375)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2735 (class 1259 OID 35340374)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2736 (class 1259 OID 35340372)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2737 (class 1259 OID 35340373)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2831 (class 1259 OID 35340643)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2832 (class 1259 OID 35340642)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2661 (class 1259 OID 35340201)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2664 (class 1259 OID 35340215)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2665 (class 1259 OID 35340214)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2666 (class 1259 OID 35340213)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2667 (class 1259 OID 35340216)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2681 (class 1259 OID 35340246)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2675 (class 1259 OID 35340234)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 35340235)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2849 (class 1259 OID 35340826)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2868 (class 1259 OID 35340875)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2886 (class 1259 OID 35340945)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2887 (class 1259 OID 35340946)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2612 (class 1259 OID 35340046)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2613 (class 1259 OID 35340045)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2621 (class 1259 OID 35340081)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2622 (class 1259 OID 35340082)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2701 (class 1259 OID 35340296)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2715 (class 1259 OID 35340339)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 35340338)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2717 (class 1259 OID 35340337)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2695 (class 1259 OID 35340281)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2696 (class 1259 OID 35340282)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2697 (class 1259 OID 35340285)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2698 (class 1259 OID 35340280)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2699 (class 1259 OID 35340284)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2700 (class 1259 OID 35340283)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2629 (class 1259 OID 35340100)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 35340034)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 35340035)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2653 (class 1259 OID 35340175)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 35340177)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2655 (class 1259 OID 35340176)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2656 (class 1259 OID 35340178)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2742 (class 1259 OID 35340381)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2817 (class 1259 OID 35340588)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2826 (class 1259 OID 35340621)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2808 (class 1259 OID 35340562)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 35340563)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2619 (class 1259 OID 35340072)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 35340073)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2726 (class 1259 OID 35340355)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 35340356)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2781 (class 1259 OID 35340486)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2586 (class 1259 OID 35339950)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 35340147)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2635 (class 1259 OID 35340109)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 35339938)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2865 (class 1259 OID 35340868)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2764 (class 1259 OID 35340433)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2765 (class 1259 OID 35340432)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2710 (class 1259 OID 35340315)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 35340316)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2839 (class 1259 OID 35340652)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 35340135)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2818 (class 1259 OID 35340601)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2876 (class 1259 OID 35340918)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2858 (class 1259 OID 35340843)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2859 (class 1259 OID 35340844)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2805 (class 1259 OID 35340551)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2714 (class 1259 OID 35340326)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 35340000)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2931 (class 2606 OID 35341141)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2932 (class 2606 OID 35341146)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2937 (class 2606 OID 35341171)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2935 (class 2606 OID 35341161)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2930 (class 2606 OID 35341136)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2934 (class 2606 OID 35341156)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2936 (class 2606 OID 35341166)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2933 (class 2606 OID 35341151)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2973 (class 2606 OID 35341351)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2974 (class 2606 OID 35341356)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 35341361)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 35341526)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3007 (class 2606 OID 35341521)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2908 (class 2606 OID 35341026)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2909 (class 2606 OID 35341031)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2956 (class 2606 OID 35341266)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3004 (class 2606 OID 35341506)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3003 (class 2606 OID 35341501)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3005 (class 2606 OID 35341511)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3002 (class 2606 OID 35341496)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3001 (class 2606 OID 35341491)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2955 (class 2606 OID 35341261)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2954 (class 2606 OID 35341256)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2928 (class 2606 OID 35341126)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2929 (class 2606 OID 35341131)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 35341306)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 35341316)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2965 (class 2606 OID 35341311)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2919 (class 2606 OID 35341081)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 35341076)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 35341246)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2999 (class 2606 OID 35341481)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2976 (class 2606 OID 35341366)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 35341371)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 35341376)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3006 (class 2606 OID 35341516)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2982 (class 2606 OID 35341396)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2979 (class 2606 OID 35341381)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2983 (class 2606 OID 35341401)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2981 (class 2606 OID 35341391)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2980 (class 2606 OID 35341386)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2917 (class 2606 OID 35341071)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 35341066)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2905 (class 2606 OID 35341011)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2904 (class 2606 OID 35341006)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2960 (class 2606 OID 35341286)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2900 (class 2606 OID 35340986)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2901 (class 2606 OID 35340991)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2963 (class 2606 OID 35341301)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2962 (class 2606 OID 35341296)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2961 (class 2606 OID 35341291)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2911 (class 2606 OID 35341041)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2910 (class 2606 OID 35341036)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2912 (class 2606 OID 35341046)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 35341106)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2922 (class 2606 OID 35341096)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 35341101)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2897 (class 2606 OID 35340971)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2947 (class 2606 OID 35341221)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2945 (class 2606 OID 35341211)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2944 (class 2606 OID 35341206)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2946 (class 2606 OID 35341216)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2898 (class 2606 OID 35340976)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 35340981)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2957 (class 2606 OID 35341271)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3011 (class 2606 OID 35341541)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2972 (class 2606 OID 35341346)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2971 (class 2606 OID 35341341)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3012 (class 2606 OID 35341546)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 35341551)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2953 (class 2606 OID 35341251)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2969 (class 2606 OID 35341331)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2970 (class 2606 OID 35341336)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2994 (class 2606 OID 35341456)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2993 (class 2606 OID 35341451)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2990 (class 2606 OID 35341436)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2991 (class 2606 OID 35341441)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2992 (class 2606 OID 35341446)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2914 (class 2606 OID 35341056)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 35341051)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2915 (class 2606 OID 35341061)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2959 (class 2606 OID 35341281)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2958 (class 2606 OID 35341276)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2996 (class 2606 OID 35341466)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2997 (class 2606 OID 35341471)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2988 (class 2606 OID 35341426)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2989 (class 2606 OID 35341431)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2986 (class 2606 OID 35341416)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2987 (class 2606 OID 35341421)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2942 (class 2606 OID 35341196)
-- Name: fk_aab095ce5e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce5e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2943 (class 2606 OID 35341201)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2967 (class 2606 OID 35341321)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2968 (class 2606 OID 35341326)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2951 (class 2606 OID 35341241)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2950 (class 2606 OID 35341236)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2948 (class 2606 OID 35341226)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2949 (class 2606 OID 35341231)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2985 (class 2606 OID 35341411)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2984 (class 2606 OID 35341406)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2920 (class 2606 OID 35341086)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2921 (class 2606 OID 35341091)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 35341121)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2925 (class 2606 OID 35341111)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2926 (class 2606 OID 35341116)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2995 (class 2606 OID 35341461)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2998 (class 2606 OID 35341476)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 35341486)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3009 (class 2606 OID 35341531)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 35341536)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2903 (class 2606 OID 35341001)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 35340996)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2906 (class 2606 OID 35341016)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2907 (class 2606 OID 35341021)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2938 (class 2606 OID 35341176)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 35341191)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 35341186)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2939 (class 2606 OID 35341181)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-12 12:02:20 CET

--
-- PostgreSQL database dump complete
--

