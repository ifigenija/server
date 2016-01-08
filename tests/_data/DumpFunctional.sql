--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-08 15:46:00 CET

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
-- TOC entry 183 (class 1259 OID 34767274)
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
-- TOC entry 239 (class 1259 OID 34767902)
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
    aktivna boolean,
    opomba text,
    sort integer,
    privzeti boolean,
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 238 (class 1259 OID 34767885)
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
-- TOC entry 182 (class 1259 OID 34767267)
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
-- TOC entry 181 (class 1259 OID 34767265)
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
-- TOC entry 229 (class 1259 OID 34767762)
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
-- TOC entry 232 (class 1259 OID 34767792)
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
-- TOC entry 253 (class 1259 OID 34768205)
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
-- TOC entry 210 (class 1259 OID 34767597)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    tipdodatka_id uuid,
    trajanje integer,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 34767522)
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
-- TOC entry 205 (class 1259 OID 34767554)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 34767559)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 34768127)
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
-- TOC entry 194 (class 1259 OID 34767419)
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
-- TOC entry 240 (class 1259 OID 34767915)
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
-- TOC entry 225 (class 1259 OID 34767719)
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
-- TOC entry 200 (class 1259 OID 34767493)
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
-- TOC entry 197 (class 1259 OID 34767459)
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
-- TOC entry 195 (class 1259 OID 34767436)
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
-- TOC entry 214 (class 1259 OID 34767633)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 251 (class 1259 OID 34768185)
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
-- TOC entry 252 (class 1259 OID 34768198)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 34768220)
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
-- TOC entry 218 (class 1259 OID 34767658)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 34767393)
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
-- TOC entry 185 (class 1259 OID 34767293)
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
-- TOC entry 189 (class 1259 OID 34767360)
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
-- TOC entry 186 (class 1259 OID 34767304)
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
-- TOC entry 178 (class 1259 OID 34767239)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 34767258)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 34767665)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 34767699)
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
-- TOC entry 235 (class 1259 OID 34767833)
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
-- TOC entry 188 (class 1259 OID 34767340)
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
-- TOC entry 191 (class 1259 OID 34767385)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 34768071)
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
-- TOC entry 215 (class 1259 OID 34767639)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 34767370)
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
-- TOC entry 202 (class 1259 OID 34767514)
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
-- TOC entry 198 (class 1259 OID 34767474)
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
-- TOC entry 199 (class 1259 OID 34767486)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 34767651)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 34768085)
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
-- TOC entry 244 (class 1259 OID 34768095)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 241 (class 1259 OID 34767984)
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
-- TOC entry 245 (class 1259 OID 34768103)
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
-- TOC entry 221 (class 1259 OID 34767680)
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
-- TOC entry 213 (class 1259 OID 34767624)
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
-- TOC entry 212 (class 1259 OID 34767614)
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
-- TOC entry 234 (class 1259 OID 34767822)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 34767752)
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
-- TOC entry 196 (class 1259 OID 34767448)
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
-- TOC entry 175 (class 1259 OID 34767210)
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
-- TOC entry 174 (class 1259 OID 34767208)
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
-- TOC entry 222 (class 1259 OID 34767693)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 34767248)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 34767232)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 34767707)
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
-- TOC entry 216 (class 1259 OID 34767645)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 34767574)
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
-- TOC entry 173 (class 1259 OID 34767197)
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
-- TOC entry 172 (class 1259 OID 34767189)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 34767184)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 230 (class 1259 OID 34767769)
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
-- TOC entry 187 (class 1259 OID 34767332)
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
-- TOC entry 209 (class 1259 OID 34767584)
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
-- TOC entry 211 (class 1259 OID 34767604)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 233 (class 1259 OID 34767810)
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
-- TOC entry 184 (class 1259 OID 34767283)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 246 (class 1259 OID 34768115)
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
-- TOC entry 207 (class 1259 OID 34767564)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 34767405)
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
-- TOC entry 176 (class 1259 OID 34767219)
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
-- TOC entry 237 (class 1259 OID 34767860)
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
-- TOC entry 201 (class 1259 OID 34767504)
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
-- TOC entry 220 (class 1259 OID 34767672)
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
-- TOC entry 231 (class 1259 OID 34767783)
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
-- TOC entry 249 (class 1259 OID 34768165)
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
-- TOC entry 248 (class 1259 OID 34768134)
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
-- TOC entry 250 (class 1259 OID 34768177)
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
-- TOC entry 227 (class 1259 OID 34767745)
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
-- TOC entry 204 (class 1259 OID 34767548)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 236 (class 1259 OID 34767850)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 226 (class 1259 OID 34767735)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2250 (class 2604 OID 34767270)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 34767213)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3135 (class 0 OID 34767274)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-568f-cba3-f2a1-dbd00330edf2	10	30	Otroci	Abonma za otroke	200
000a0000-568f-cba3-0ace-7a729b6a1aa1	20	60	Mladina	Abonma za mladino	400
000a0000-568f-cba3-c852-5a11daf7ce84	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3191 (class 0 OID 34767902)
-- Dependencies: 239
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, aktivna, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-568f-cba4-8527-359f4f393818	000d0000-568f-cba4-676a-c9f051dfe42a	\N	00090000-568f-cba4-7ae5-7cee65fd333d	000b0000-568f-cba4-e3e4-689ad56d31dc	0001	f	\N	\N	\N	\N	3	t	t	t
000c0000-568f-cba4-35f6-d9344a6813db	000d0000-568f-cba4-9789-bcc2cb1538ce	00100000-568f-cba4-6257-a8785a43e748	00090000-568f-cba4-c49d-bc6ae30dcf67	\N	0002	t	2016-01-01	\N	\N	\N	8	t	f	f
000c0000-568f-cba4-66d9-fa6fbbcf24ff	000d0000-568f-cba4-e28a-7a8eacd48f98	00100000-568f-cba4-32d3-6c66f7ad66f1	00090000-568f-cba4-e234-293eda0bb51a	\N	0003	t	\N	2016-01-08	\N	\N	2	t	f	f
000c0000-568f-cba4-380f-0528954b13e4	000d0000-568f-cba4-992e-e56e387b77c7	\N	00090000-568f-cba4-d4d1-8d64ea69557e	\N	0004	f	2016-01-01	2016-01-01	\N	\N	26	t	f	f
000c0000-568f-cba4-3314-8d05d297f536	000d0000-568f-cba4-b648-18ffe75dfd03	\N	00090000-568f-cba4-4c05-01a7ef753513	\N	0005	f	2016-01-01	2016-01-01	\N	\N	7	t	f	f
000c0000-568f-cba4-2017-43956b1f30c9	000d0000-568f-cba4-2b8f-da8890b5cf2d	\N	00090000-568f-cba4-b29a-3ea80ae809d5	000b0000-568f-cba4-8a32-3b758ded2ee7	0006	f	2016-01-01	2016-01-01	\N	\N	1	t	t	t
000c0000-568f-cba4-c1de-1c1f59fee15b	000d0000-568f-cba4-1587-0d7b14e2f9a6	00100000-568f-cba4-b7f3-7c51ef47554d	00090000-568f-cba4-a2e5-0f4af5cba94b	\N	0007	t	2016-01-01	2016-01-01	\N	\N	14	f	f	t
000c0000-568f-cba4-c7b5-a1bb787c7042	000d0000-568f-cba4-fd9e-4e2db9a697e4	\N	00090000-568f-cba4-d224-c8cc5fd2479d	000b0000-568f-cba4-12be-959f6fe9918f	0008	f	2016-01-01	2016-01-01	\N	\N	12	t	t	t
000c0000-568f-cba4-a21d-51c995cc99b4	000d0000-568f-cba4-1587-0d7b14e2f9a6	00100000-568f-cba4-5ecb-69c1c1a00487	00090000-568f-cba4-e93f-8c9e5b0f42b5	\N	0009	t	2017-01-01	2017-01-01	\N	\N	15	t	f	t
000c0000-568f-cba4-a6b8-c96134d3f74d	000d0000-568f-cba4-1587-0d7b14e2f9a6	00100000-568f-cba4-8094-affe0ebfc942	00090000-568f-cba4-6c70-a4a9f87e0dc8	\N	0010	t	\N	2016-01-08	\N	\N	16	f	f	t
000c0000-568f-cba4-dceb-48c8b76ebcf3	000d0000-568f-cba4-1587-0d7b14e2f9a6	00100000-568f-cba4-a800-71d7d2fb477c	00090000-568f-cba4-872f-ab03acc73f97	\N	0011	t	2017-01-01	\N	\N	\N	17	f	f	t
000c0000-568f-cba4-b705-e1b41f23a8a7	000d0000-568f-cba4-89a3-9582c2d0568f	00100000-568f-cba4-6257-a8785a43e748	00090000-568f-cba4-c49d-bc6ae30dcf67	000b0000-568f-cba4-b738-ca763d1f5ec0	0012	t	\N	\N	\N	\N	2	t	t	t
000c0000-568f-cba4-cd48-40197b40c98e	000d0000-568f-cba4-f41a-a38180245144	\N	00090000-568f-cba4-d224-c8cc5fd2479d	\N	0013	f	\N	\N	\N	\N	2	t	f	t
000c0000-568f-cba4-b2ea-8a3408b6538b	000d0000-568f-cba4-f41a-a38180245144	\N	00090000-568f-cba4-9abb-49dae5e66e0f	\N	0014	f	\N	\N	\N	\N	2	f	f	t
000c0000-568f-cba4-2768-57fa5bc93346	000d0000-568f-cba4-a0f0-3619c1b16cb4	00100000-568f-cba4-32d3-6c66f7ad66f1	00090000-568f-cba4-e234-293eda0bb51a	\N	0015	t	\N	\N	\N	\N	2	t	f	t
000c0000-568f-cba4-bb7b-86cdaa8dec1a	000d0000-568f-cba4-a0f0-3619c1b16cb4	\N	00090000-568f-cba4-9abb-49dae5e66e0f	\N	0016	f	\N	\N	\N	\N	2	f	f	t
000c0000-568f-cba4-f15b-dfe8315926f6	000d0000-568f-cba4-9566-67e5924a6a3e	\N	00090000-568f-cba4-9abb-49dae5e66e0f	\N	0017	f	\N	\N	\N	\N	2	t	f	t
000c0000-568f-cba4-b563-982306ad3b7c	000d0000-568f-cba4-9566-67e5924a6a3e	\N	00090000-568f-cba4-d224-c8cc5fd2479d	\N	0018	f	\N	\N	\N	\N	2	f	f	t
000c0000-568f-cba4-28d7-363578c0b037	000d0000-568f-cba4-efc5-038f9dc55d88	00100000-568f-cba4-b7f3-7c51ef47554d	00090000-568f-cba4-a2e5-0f4af5cba94b	\N	0019	t	\N	\N	\N	\N	2	t	f	t
000c0000-568f-cba4-ae10-f4516c5dc492	000d0000-568f-cba4-efc5-038f9dc55d88	\N	00090000-568f-cba4-9abb-49dae5e66e0f	\N	0020	f	\N	\N	\N	\N	2	f	f	t
000c0000-568f-cba4-93c4-de629110ff94	000d0000-568f-cba4-5e76-ceace5d67606	\N	00090000-568f-cba4-9abb-49dae5e66e0f	\N	0021	f	\N	\N	\N	\N	2	t	f	t
000c0000-568f-cba4-6ddd-08a1dbba7f28	000d0000-568f-cba4-5e76-ceace5d67606	00100000-568f-cba4-b7f3-7c51ef47554d	00090000-568f-cba4-a2e5-0f4af5cba94b	\N	0022	t	\N	\N	\N	\N	2	f	f	t
000c0000-568f-cba5-e94f-0192ee4db37a	000d0000-568f-cba4-16bc-15b7118a298c	\N	00090000-568f-cba4-9abb-49dae5e66e0f	\N	0023	f	\N	\N	\N	\N	2	t	f	t
000c0000-568f-cba5-2f90-6a58ca310751	000d0000-568f-cba4-4bf4-48640004a111	\N	00090000-568f-cba4-d224-c8cc5fd2479d	\N	0024	f	\N	\N	\N	\N	2	t	f	t
000c0000-568f-cba5-663a-a9e126d5ed7a	000d0000-568f-cba4-f65b-b73d320f9993	\N	00090000-568f-cba4-d224-c8cc5fd2479d	\N	0025	f	\N	\N	\N	\N	2	t	f	t
000c0000-568f-cba5-245e-cd735333505f	000d0000-568f-cba4-f65b-b73d320f9993	00100000-568f-cba4-32d3-6c66f7ad66f1	00090000-568f-cba4-e234-293eda0bb51a	\N	0026	t	\N	\N	\N	\N	2	f	f	t
000c0000-568f-cba5-9522-f7b3f8bcaf0b	000d0000-568f-cba4-8f64-1ab9a8c1f087	\N	00090000-568f-cba4-ace8-127bcb5f0643	\N	0027	f	\N	\N	\N	\N	2	t	f	t
000c0000-568f-cba5-5442-1652050efaee	000d0000-568f-cba4-8f64-1ab9a8c1f087	\N	00090000-568f-cba4-e5f5-b4e8b1cf7644	\N	0028	f	\N	\N	\N	\N	2	f	f	t
000c0000-568f-cba5-438a-366465c58fb9	000d0000-568f-cba4-1fa2-8ea8078bcc58	\N	00090000-568f-cba4-d224-c8cc5fd2479d	\N	0029	f	\N	\N	\N	\N	1	t	f	t
000c0000-568f-cba5-3466-289fc47fe7b1	000d0000-568f-cba4-1fa2-8ea8078bcc58	00100000-568f-cba4-32d3-6c66f7ad66f1	00090000-568f-cba4-e234-293eda0bb51a	\N	0030	t	\N	\N	\N	\N	2	f	f	t
000c0000-568f-cba5-44ab-2e2c6c9fcde4	000d0000-568f-cba4-1fa2-8ea8078bcc58	\N	00090000-568f-cba4-e5f5-b4e8b1cf7644	\N	0031	f	\N	\N	\N	\N	3	f	f	t
000c0000-568f-cba5-11e4-0f72bd4aa997	000d0000-568f-cba4-1fa2-8ea8078bcc58	\N	00090000-568f-cba4-ace8-127bcb5f0643	\N	0032	f	\N	\N	\N	\N	4	f	f	t
000c0000-568f-cba5-20fe-55f2ac542507	000d0000-568f-cba4-974d-9a60d21a4b5b	\N	00090000-568f-cba4-d224-c8cc5fd2479d	\N	0033	f	\N	\N	\N	\N	4	t	f	t
000c0000-568f-cba5-9a4b-66ad8a692f56	000d0000-568f-cba4-0b0d-799f2510d10d	00100000-568f-cba4-32d3-6c66f7ad66f1	00090000-568f-cba4-e234-293eda0bb51a	\N	0034	t	\N	\N	\N	\N	4	t	f	t
000c0000-568f-cba5-2b41-c56f3012f697	000d0000-568f-cba4-0b0d-799f2510d10d	\N	00090000-568f-cba4-9abb-49dae5e66e0f	\N	0035	f	\N	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3190 (class 0 OID 34767885)
-- Dependencies: 238
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 34767267)
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
-- TOC entry 3181 (class 0 OID 34767762)
-- Dependencies: 229
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-568f-cba4-3f02-9e67fbe3f26e	00160000-568f-cba3-b355-bc6be44a2dd3	00090000-568f-cba4-e5f5-b4e8b1cf7644	aizv	10	t
003d0000-568f-cba4-3aeb-22729a3f2de3	00160000-568f-cba3-b355-bc6be44a2dd3	00090000-568f-cba4-eff1-b32203b54d0e	apri	14	t
003d0000-568f-cba4-99e3-4fe744c0e039	00160000-568f-cba3-54aa-761e1cb76e47	00090000-568f-cba4-ace8-127bcb5f0643	aizv	11	t
003d0000-568f-cba4-ed42-826440188e71	00160000-568f-cba3-13a2-291713692438	00090000-568f-cba4-3343-e9c1e20bbcba	aizv	12	t
003d0000-568f-cba4-e100-2957f453ac06	00160000-568f-cba3-b355-bc6be44a2dd3	00090000-568f-cba4-9abb-49dae5e66e0f	apri	18	f
\.


--
-- TOC entry 3184 (class 0 OID 34767792)
-- Dependencies: 232
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-568f-cba3-b355-bc6be44a2dd3	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-568f-cba3-54aa-761e1cb76e47	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-568f-cba3-13a2-291713692438	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3205 (class 0 OID 34768205)
-- Dependencies: 253
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 34767597)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, tipdodatka_id, trajanje, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 34767522)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-568f-cba4-d610-417a2a3aa2af	\N	\N	00200000-568f-cba4-a591-9b304790405a	\N	\N	\N	00220000-568f-cba3-8030-132e90b069f2	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-568f-cba4-a65c-21bee0fa5c19	\N	\N	00200000-568f-cba4-d841-85edd036db78	\N	\N	\N	00220000-568f-cba3-8030-132e90b069f2	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-568f-cba4-7f45-0dc3117d67b3	\N	\N	00200000-568f-cba4-b71e-163a464a89d2	\N	\N	\N	00220000-568f-cba3-81f5-f9444c8a7dce	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-568f-cba4-5fb8-445830a9ca6d	\N	\N	00200000-568f-cba4-6ac2-e699a2395ad4	\N	\N	\N	00220000-568f-cba3-387f-3aa324811879	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-568f-cba4-b8e0-2b2ecadacbf8	\N	\N	00200000-568f-cba4-aebd-0409c0d5867c	\N	\N	\N	00220000-568f-cba3-d8d8-222fad7f95d8	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3157 (class 0 OID 34767554)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 34767559)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 34768127)
-- Dependencies: 247
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 34767419)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-568f-cba0-4046-e945b8ee749c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-568f-cba0-14fb-c71ac0173f5f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-568f-cba0-8096-46a8541a36db	AL	ALB	008	Albania 	Albanija	\N
00040000-568f-cba0-f5e8-15192d2dd1ae	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-568f-cba0-31fa-af0b6483f7b8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-568f-cba0-064a-8aeeee854725	AD	AND	020	Andorra 	Andora	\N
00040000-568f-cba0-4143-5f48047a32a7	AO	AGO	024	Angola 	Angola	\N
00040000-568f-cba0-f0ec-ae92b02e301c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-568f-cba0-63b6-b01c2630ab71	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-568f-cba0-1d53-7d26dd809d15	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-568f-cba0-8198-8db617ec78c1	AR	ARG	032	Argentina 	Argenitna	\N
00040000-568f-cba0-8488-52e613002eff	AM	ARM	051	Armenia 	Armenija	\N
00040000-568f-cba0-eea5-e05f19d27531	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-568f-cba0-34bf-0211605f6655	AU	AUS	036	Australia 	Avstralija	\N
00040000-568f-cba0-6798-6b434e632d4d	AT	AUT	040	Austria 	Avstrija	\N
00040000-568f-cba0-8a78-993a48ac4c53	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-568f-cba0-b22b-34b00a335bbb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-568f-cba0-f0a8-c6582d12f239	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-568f-cba0-e209-bb6bb793064f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-568f-cba0-8e94-44c04241c28b	BB	BRB	052	Barbados 	Barbados	\N
00040000-568f-cba0-3647-78feb313d2f6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-568f-cba0-5337-7aa6d8da2a5e	BE	BEL	056	Belgium 	Belgija	\N
00040000-568f-cba0-f2e4-9c3bc58fc25c	BZ	BLZ	084	Belize 	Belize	\N
00040000-568f-cba0-49a2-43cd54f879fd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-568f-cba0-b8d0-ae91285d47b5	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-568f-cba0-5f6d-29a9df150e78	BT	BTN	064	Bhutan 	Butan	\N
00040000-568f-cba0-4192-d1ef21482691	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-568f-cba0-ce03-c1ed934c8899	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-568f-cba0-be8a-052f04c51946	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-568f-cba0-abe1-2f951ccda626	BW	BWA	072	Botswana 	Bocvana	\N
00040000-568f-cba0-0c0e-2e322b7aaf57	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-568f-cba0-061c-a62864255985	BR	BRA	076	Brazil 	Brazilija	\N
00040000-568f-cba0-8b28-3b6b1f87626f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-568f-cba0-ae53-1021069f6470	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-568f-cba0-36e8-00ff7602465f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-568f-cba0-32ee-bfdf86064553	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-568f-cba0-c4dd-be03c815ed6c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-568f-cba0-67ce-5bdc20105e0f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-568f-cba0-553b-fae8c62d4d03	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-568f-cba0-79ac-a9ad28c92dbf	CA	CAN	124	Canada 	Kanada	\N
00040000-568f-cba0-7f0d-92e8f7f4cdb6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-568f-cba0-7c1d-1b95f3508dc4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-568f-cba0-0020-61232703359d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-568f-cba0-abdc-d486ccae9b07	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-568f-cba0-605d-9c1a1f579067	CL	CHL	152	Chile 	Čile	\N
00040000-568f-cba0-9b9b-ed03a7cffc48	CN	CHN	156	China 	Kitajska	\N
00040000-568f-cba0-33d3-5e919a071eac	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-568f-cba0-c249-e29f3d64c6b9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-568f-cba0-8241-3d65655b1036	CO	COL	170	Colombia 	Kolumbija	\N
00040000-568f-cba0-7469-6e14f9369b00	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-568f-cba0-64f4-9f6e8dca7fcb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-568f-cba0-3d77-219ba4fb860e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-568f-cba0-f3d6-b9386cc5bc3e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-568f-cba0-06c6-85eca32b28a0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-568f-cba0-ae4b-db2767db9ac1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-568f-cba0-dbf2-eb9069f3124e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-568f-cba0-f1fd-e326622015b5	CU	CUB	192	Cuba 	Kuba	\N
00040000-568f-cba0-90ba-006eb04eeda0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-568f-cba0-ac6e-e8444afb2293	CY	CYP	196	Cyprus 	Ciper	\N
00040000-568f-cba0-e924-681465c0fbf9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-568f-cba0-8df7-07858689214a	DK	DNK	208	Denmark 	Danska	\N
00040000-568f-cba0-dc6d-c0429ac8e4a2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-568f-cba0-5039-1bce46ca4875	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-568f-cba0-1076-c64b898bedf2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-568f-cba0-5392-3585e229703c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-568f-cba0-8a35-da50f8620e20	EG	EGY	818	Egypt 	Egipt	\N
00040000-568f-cba0-0e93-ce6bac6fcbed	SV	SLV	222	El Salvador 	Salvador	\N
00040000-568f-cba0-1d2c-d0fd93b8d29f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-568f-cba0-f7b1-f88e2491a3a5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-568f-cba0-cb7b-8d4a568ebfae	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-568f-cba0-6f6e-b24c9ec4df0f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-568f-cba0-d411-eb66b1ba166f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-568f-cba0-0054-016b23a08834	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-568f-cba0-b51b-fd4becf60fe0	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-568f-cba0-230d-be382fc31ded	FI	FIN	246	Finland 	Finska	\N
00040000-568f-cba0-80c1-4398231a3bd5	FR	FRA	250	France 	Francija	\N
00040000-568f-cba0-4444-a285bc4bf2f5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-568f-cba0-d291-b47c333a2c02	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-568f-cba0-ae9a-e9cd90ec3552	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-568f-cba0-a4c6-3fc2190f1270	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-568f-cba0-71e4-59e2da5822a2	GA	GAB	266	Gabon 	Gabon	\N
00040000-568f-cba0-c4a5-f1f3e2b586f8	GM	GMB	270	Gambia 	Gambija	\N
00040000-568f-cba0-5c12-0b71e86c50d5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-568f-cba0-bb72-fefa634088f0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-568f-cba0-2efb-6c7d4304b2f4	GH	GHA	288	Ghana 	Gana	\N
00040000-568f-cba0-4c8d-139292a06f32	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-568f-cba0-eae2-d85596f91750	GR	GRC	300	Greece 	Grčija	\N
00040000-568f-cba0-1464-71dc0a5b2d8e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-568f-cba0-cc37-1336de547d51	GD	GRD	308	Grenada 	Grenada	\N
00040000-568f-cba0-0b2b-7adca0fe9d11	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-568f-cba0-a993-38b01682e413	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-568f-cba0-d416-337ea7b14624	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-568f-cba0-3f28-8308b0bfd02f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-568f-cba0-2926-c6a53226b696	GN	GIN	324	Guinea 	Gvineja	\N
00040000-568f-cba0-ff50-faf300ac5a42	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-568f-cba0-8779-95a9b1d646d1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-568f-cba0-2be6-fe482dfdc085	HT	HTI	332	Haiti 	Haiti	\N
00040000-568f-cba0-9bbc-63383c5bf0ec	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-568f-cba0-a4e8-6015fdfce21f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-568f-cba0-1d58-0d6a008ef08a	HN	HND	340	Honduras 	Honduras	\N
00040000-568f-cba0-79fd-bd4884a44415	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-568f-cba0-c1ef-1614603764b7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-568f-cba0-814b-43845fb0681d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-568f-cba0-fcd8-7dc3bc296f5c	IN	IND	356	India 	Indija	\N
00040000-568f-cba0-0fbb-fc66a8e12bf4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-568f-cba0-446d-00fda27e557c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-568f-cba0-f882-88602cac3fbd	IQ	IRQ	368	Iraq 	Irak	\N
00040000-568f-cba0-ebbd-fe244bd79ed0	IE	IRL	372	Ireland 	Irska	\N
00040000-568f-cba0-255a-1bbfc27dd531	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-568f-cba0-10a7-0eac81ebdd2a	IL	ISR	376	Israel 	Izrael	\N
00040000-568f-cba0-0f1e-f5611d924499	IT	ITA	380	Italy 	Italija	\N
00040000-568f-cba0-9faa-28c08ae4c764	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-568f-cba0-32d4-08c142676ebc	JP	JPN	392	Japan 	Japonska	\N
00040000-568f-cba0-719a-574eb137873b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-568f-cba0-b8ff-81c829a31950	JO	JOR	400	Jordan 	Jordanija	\N
00040000-568f-cba0-14c4-5ca4f3c595a1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-568f-cba0-eea0-502fa58407e6	KE	KEN	404	Kenya 	Kenija	\N
00040000-568f-cba0-e6c4-c11b411c5619	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-568f-cba0-75b5-7428c696a481	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-568f-cba0-7b96-6b398a99b036	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-568f-cba0-6817-bd5e61752fc4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-568f-cba0-af86-0f09a9162ab9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-568f-cba0-9817-4ccb6cf9f2d8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-568f-cba0-ad61-821260a983b4	LV	LVA	428	Latvia 	Latvija	\N
00040000-568f-cba0-3af2-fa263c5023fe	LB	LBN	422	Lebanon 	Libanon	\N
00040000-568f-cba0-75ac-8416aec2e409	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-568f-cba0-c664-6c7642d31ead	LR	LBR	430	Liberia 	Liberija	\N
00040000-568f-cba0-d76c-1d639a9541b6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-568f-cba0-b1dd-0d76602cba72	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-568f-cba0-1f08-13feabedd53e	LT	LTU	440	Lithuania 	Litva	\N
00040000-568f-cba0-e78e-cc28237cf85b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-568f-cba0-ff0f-090a4c759a74	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-568f-cba0-17d2-91ce11b8a81d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-568f-cba0-edff-80c0f66c8073	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-568f-cba0-0ea2-ab129633e226	MW	MWI	454	Malawi 	Malavi	\N
00040000-568f-cba0-b4c3-84beaa71198c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-568f-cba0-f925-bb4054f2b19e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-568f-cba0-3280-1499fd471eb8	ML	MLI	466	Mali 	Mali	\N
00040000-568f-cba0-9e82-2e15284e2558	MT	MLT	470	Malta 	Malta	\N
00040000-568f-cba0-31e7-33195338a607	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-568f-cba0-3b7e-c873dc22d20d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-568f-cba0-6d96-7dabd4fa4ebf	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-568f-cba0-e260-db86c81eaab0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-568f-cba0-84e7-7996aad99bf9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-568f-cba0-fec2-c33301422c72	MX	MEX	484	Mexico 	Mehika	\N
00040000-568f-cba0-5c14-0b29363cd7b1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-568f-cba0-8f0f-551569dfd44d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-568f-cba0-e255-888b9a9e1ce5	MC	MCO	492	Monaco 	Monako	\N
00040000-568f-cba0-4b6d-82862d4054d8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-568f-cba0-518d-ff7802a4db6a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-568f-cba0-1b31-808507983178	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-568f-cba0-75ca-eb4a16aac3ef	MA	MAR	504	Morocco 	Maroko	\N
00040000-568f-cba0-aee1-e244cc9b37f8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-568f-cba0-57c7-03fcbd4a0384	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-568f-cba0-c8fe-00df237ee2fe	NA	NAM	516	Namibia 	Namibija	\N
00040000-568f-cba0-c88c-a66f140ea51f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-568f-cba0-24b2-169d01734dd6	NP	NPL	524	Nepal 	Nepal	\N
00040000-568f-cba0-2fa1-860664832799	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-568f-cba0-f817-3b05d2a98260	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-568f-cba0-9e7c-56691aa62888	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-568f-cba0-688e-328126e8fe28	NE	NER	562	Niger 	Niger 	\N
00040000-568f-cba0-182f-cf38bd7bddcc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-568f-cba0-8291-832226229707	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-568f-cba0-f39c-5a25a705700f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-568f-cba0-41a7-d4afaeb33d34	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-568f-cba0-31ac-f519fbf8df3d	NO	NOR	578	Norway 	Norveška	\N
00040000-568f-cba0-358a-0ca961354179	OM	OMN	512	Oman 	Oman	\N
00040000-568f-cba0-1baf-d56b92bc5197	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-568f-cba0-b187-4cbc96fa1647	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-568f-cba0-e429-fb2325832d5f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-568f-cba0-375b-889d119f93bd	PA	PAN	591	Panama 	Panama	\N
00040000-568f-cba0-cac1-e5f988ff2dfa	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-568f-cba0-1cc6-02bd42736651	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-568f-cba0-810d-8c23a3db928d	PE	PER	604	Peru 	Peru	\N
00040000-568f-cba0-5af1-afc0746aaa71	PH	PHL	608	Philippines 	Filipini	\N
00040000-568f-cba0-4713-5386f44ba296	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-568f-cba0-7941-91047723eeae	PL	POL	616	Poland 	Poljska	\N
00040000-568f-cba0-4a9b-9f1dc8f11f0b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-568f-cba0-8748-5118e4e536c3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-568f-cba0-3e45-fc73d3976b9e	QA	QAT	634	Qatar 	Katar	\N
00040000-568f-cba0-e05e-556aa7d25e43	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-568f-cba0-ece2-c554a191cc18	RO	ROU	642	Romania 	Romunija	\N
00040000-568f-cba0-9a20-50d6eacbf21f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-568f-cba0-07cc-d34fb70e6f20	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-568f-cba0-9e9a-555c45086d14	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-568f-cba0-7c61-cc3356044440	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-568f-cba0-178d-1a0499f462b0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-568f-cba0-9a0c-a20890d4be5e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-568f-cba0-1770-99ea3f2f0330	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-568f-cba0-d407-2242fc327365	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-568f-cba0-b049-5c197a11cd26	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-568f-cba0-8c78-a5b7a35046fc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-568f-cba0-dfda-89a8f47c850d	SM	SMR	674	San Marino 	San Marino	\N
00040000-568f-cba0-8f5c-806fe938f6d4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-568f-cba0-0204-1b5b87776417	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-568f-cba0-6a0c-7ca992b32c2d	SN	SEN	686	Senegal 	Senegal	\N
00040000-568f-cba0-30ac-aa202b6ce2e7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-568f-cba0-73ce-b93d3ec16dda	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-568f-cba0-d631-80dee4f416cf	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-568f-cba0-1d5f-dcfac040a181	SG	SGP	702	Singapore 	Singapur	\N
00040000-568f-cba0-2acb-0b1ef6d82f6a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-568f-cba0-c28f-fc36e01d1342	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-568f-cba0-0177-967aa8001d78	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-568f-cba0-c3dd-962e8350c337	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-568f-cba0-52ca-40a479bc1532	SO	SOM	706	Somalia 	Somalija	\N
00040000-568f-cba0-6610-fce4f654b490	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-568f-cba0-644f-5d5efd8c2f18	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-568f-cba0-9cd0-d41deff35c3e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-568f-cba0-770a-1c5bac8f5f2e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-568f-cba0-de8d-8b17719ee6ad	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-568f-cba0-a562-cecec8070f38	SD	SDN	729	Sudan 	Sudan	\N
00040000-568f-cba0-0bca-8782f73ca3d0	SR	SUR	740	Suriname 	Surinam	\N
00040000-568f-cba0-a3e6-9a4edb558734	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-568f-cba0-78c7-a1b134d0a2dc	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-568f-cba0-f54a-2d716fa70251	SE	SWE	752	Sweden 	Švedska	\N
00040000-568f-cba0-9a6e-bb3a34db3743	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-568f-cba0-8e26-3749e48f56f5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-568f-cba0-a3fb-07291edde909	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-568f-cba0-5942-9f155518c2a9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-568f-cba0-7d77-eb5f75ce5bcf	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-568f-cba0-d79f-c022e04b74f9	TH	THA	764	Thailand 	Tajska	\N
00040000-568f-cba0-6e13-9f18ff37f4bc	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-568f-cba0-fd08-86e3957a5d1b	TG	TGO	768	Togo 	Togo	\N
00040000-568f-cba0-181d-9f1ac2869060	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-568f-cba0-5506-0d7c1fbd1076	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-568f-cba0-4168-6681a97c18f1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-568f-cba0-58a1-9c3dcf61cb9e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-568f-cba0-663d-d7ac4284571c	TR	TUR	792	Turkey 	Turčija	\N
00040000-568f-cba0-3083-62c984833849	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-568f-cba0-ba12-61621d74aa27	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-568f-cba0-b039-ee4092a056ce	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-568f-cba0-f283-6de9cab59195	UG	UGA	800	Uganda 	Uganda	\N
00040000-568f-cba0-a631-8f4f791ddd0d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-568f-cba0-023e-7f0d45b43e0e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-568f-cba0-262e-a20f0de6dbc9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-568f-cba0-a4d7-ac52c46da46a	US	USA	840	United States 	Združene države Amerike	\N
00040000-568f-cba0-5336-0f611d8a0df9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-568f-cba0-f151-8ae631f4fbb8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-568f-cba0-1ca3-b0e70384d4d3	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-568f-cba0-9783-f4906f5d5a85	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-568f-cba0-89df-3668871a6496	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-568f-cba0-9c4b-e5e826d7023c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-568f-cba0-1119-8138ec289530	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-568f-cba0-f7ad-0124dc134e86	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-568f-cba0-d960-2229f722eba3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-568f-cba0-f588-6ad4b917ea3c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-568f-cba0-a66d-8f7d918b65ad	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-568f-cba0-cfbf-ed771d4b9ce0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-568f-cba0-5163-a5411cf6245d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3192 (class 0 OID 34767915)
-- Dependencies: 240
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-568f-cba4-a733-60ff8734375f	000e0000-568f-cba4-a0ce-6b3f4cc58a35	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568f-cba0-dd49-ec59bd7b95c9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-568f-cba4-2569-1f216352ea81	000e0000-568f-cba4-8cba-61249837624f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568f-cba0-caad-487c4aa49586	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-568f-cba4-1d61-2c886711ebd3	000e0000-568f-cba4-d745-972040f647f8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-568f-cba0-dd49-ec59bd7b95c9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-568f-cba4-ddb3-be34147446e4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-568f-cba4-f152-605ce3002822	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3177 (class 0 OID 34767719)
-- Dependencies: 225
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-568f-cba4-3a88-55e2c6053803	000e0000-568f-cba4-1ed3-e16682165320	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	0	000f0000-568f-cba0-fd71-59893b4206e2
000d0000-568f-cba4-4117-96665383bed2	000e0000-568f-cba4-1ed3-e16682165320	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	0	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-676a-c9f051dfe42a	000e0000-568f-cba4-8cba-61249837624f	000c0000-568f-cba4-8527-359f4f393818	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-568f-cba0-fd71-59893b4206e2
000d0000-568f-cba4-9789-bcc2cb1538ce	000e0000-568f-cba4-8cba-61249837624f	000c0000-568f-cba4-35f6-d9344a6813db	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-e28a-7a8eacd48f98	000e0000-568f-cba4-8cba-61249837624f	000c0000-568f-cba4-66d9-fa6fbbcf24ff	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-568f-cba0-986c-e420ca9a6a87
000d0000-568f-cba4-992e-e56e387b77c7	000e0000-568f-cba4-8cba-61249837624f	000c0000-568f-cba4-380f-0528954b13e4	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-568f-cba0-875b-eeb24629fbf8
000d0000-568f-cba4-b648-18ffe75dfd03	000e0000-568f-cba4-8cba-61249837624f	000c0000-568f-cba4-3314-8d05d297f536	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-568f-cba0-875b-eeb24629fbf8
000d0000-568f-cba4-2b8f-da8890b5cf2d	000e0000-568f-cba4-8cba-61249837624f	000c0000-568f-cba4-2017-43956b1f30c9	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-568f-cba0-fd71-59893b4206e2
000d0000-568f-cba4-1587-0d7b14e2f9a6	000e0000-568f-cba4-8cba-61249837624f	000c0000-568f-cba4-a21d-51c995cc99b4	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-568f-cba0-fd71-59893b4206e2
000d0000-568f-cba4-fd9e-4e2db9a697e4	000e0000-568f-cba4-8cba-61249837624f	000c0000-568f-cba4-c7b5-a1bb787c7042	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-568f-cba0-7862-aec76068f155
000d0000-568f-cba4-89a3-9582c2d0568f	000e0000-568f-cba4-8cba-61249837624f	000c0000-568f-cba4-b705-e1b41f23a8a7	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-568f-cba0-f2f3-a0136a07a3e0
000d0000-568f-cba4-f41a-a38180245144	000e0000-568f-cba4-6261-97da9aef9575	000c0000-568f-cba4-cd48-40197b40c98e	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	2	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-a0f0-3619c1b16cb4	000e0000-568f-cba4-5f7f-7a6f08cb1287	000c0000-568f-cba4-2768-57fa5bc93346	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	2	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-9566-67e5924a6a3e	000e0000-568f-cba4-5f7f-7a6f08cb1287	000c0000-568f-cba4-f15b-dfe8315926f6	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	2	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-efc5-038f9dc55d88	000e0000-568f-cba4-b74a-2df5da0b4f09	000c0000-568f-cba4-28d7-363578c0b037	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	2	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-5e76-ceace5d67606	000e0000-568f-cba4-0308-4186f391c593	000c0000-568f-cba4-93c4-de629110ff94	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	2	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-16bc-15b7118a298c	000e0000-568f-cba4-d611-033df9e52de2	000c0000-568f-cba5-e94f-0192ee4db37a	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	1	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-4bf4-48640004a111	000e0000-568f-cba4-8cd7-c2a0d3fbb34d	000c0000-568f-cba5-2f90-6a58ca310751	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	1	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-f65b-b73d320f9993	000e0000-568f-cba4-5c0e-c6e0175d134d	000c0000-568f-cba5-663a-a9e126d5ed7a	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	2	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-8f64-1ab9a8c1f087	000e0000-568f-cba4-5fd1-7224bb1ffd28	000c0000-568f-cba5-9522-f7b3f8bcaf0b	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	2	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-1fa2-8ea8078bcc58	000e0000-568f-cba4-5fd1-7224bb1ffd28	000c0000-568f-cba5-438a-366465c58fb9	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	4	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-974d-9a60d21a4b5b	000e0000-568f-cba4-d37e-9ea8bd080760	000c0000-568f-cba5-20fe-55f2ac542507	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	1	000f0000-568f-cba0-884e-55b9308e206d
000d0000-568f-cba4-0b0d-799f2510d10d	000e0000-568f-cba4-d37e-9ea8bd080760	000c0000-568f-cba5-9a4b-66ad8a692f56	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	2	000f0000-568f-cba0-884e-55b9308e206d
\.


--
-- TOC entry 3152 (class 0 OID 34767493)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 34767459)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 34767436)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-568f-cba4-eb36-02c5d5d67423	00080000-568f-cba4-45c4-0a6f355c065a	00090000-568f-cba4-6c70-a4a9f87e0dc8	AK		igralka
\.


--
-- TOC entry 3166 (class 0 OID 34767633)
-- Dependencies: 214
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 34768185)
-- Dependencies: 251
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-568f-cba4-11e3-f7cf903f5019	00010000-568f-cba2-abd1-a0e4457a5191	\N	Prva mapa	Root mapa	2016-01-08 15:45:56	2016-01-08 15:45:56	R	\N	\N
\.


--
-- TOC entry 3204 (class 0 OID 34768198)
-- Dependencies: 252
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 34768220)
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
-- TOC entry 3170 (class 0 OID 34767658)
-- Dependencies: 218
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 34767393)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-568f-cba2-bc46-32e295cef3d4	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-568f-cba2-8e62-f17a1d563668	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-568f-cba2-658a-2442dd0d80e3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-568f-cba2-273b-851b20e2527a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-568f-cba2-34a8-c73f83316c3d	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-568f-cba2-e2b9-021f18a07506	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-568f-cba2-28f1-1cf689fdd9bd	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-568f-cba2-7201-cd1f4abf2600	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-568f-cba2-0946-0ab4153c2d50	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-568f-cba2-6952-ad166e074e9d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-568f-cba2-59b7-f0c2da98da08	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-568f-cba2-4162-0d0c9b42039c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-568f-cba2-f88e-4bdf8a3fa28c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-568f-cba2-de44-4056cc5a8d75	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-568f-cba3-8bd4-c54c6aa25ae6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-568f-cba3-fb72-c42cae87131e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-568f-cba3-c64c-7257998f95cc	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-568f-cba3-fef2-56dfbf4def40	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-568f-cba3-52c4-2760a4dfa8ce	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-568f-cba6-1635-99765fffd93a	application.tenant.maticnopodjetje	string	s:36:"00080000-568f-cba6-497a-5ae7d56f8065";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3137 (class 0 OID 34767293)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-568f-cba3-2f21-bbc8e2cf6b93	00000000-568f-cba3-8bd4-c54c6aa25ae6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-568f-cba3-0360-8586f2a59fb8	00000000-568f-cba3-8bd4-c54c6aa25ae6	00010000-568f-cba2-abd1-a0e4457a5191	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-568f-cba3-1440-fb716ea541c0	00000000-568f-cba3-fb72-c42cae87131e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3141 (class 0 OID 34767360)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-568f-cba4-099f-1ca1c80fde76	\N	00100000-568f-cba4-6257-a8785a43e748	00100000-568f-cba4-32d3-6c66f7ad66f1	01	Gledališče Nimbis
00410000-568f-cba4-ee9f-ce37201fb361	00410000-568f-cba4-099f-1ca1c80fde76	00100000-568f-cba4-6257-a8785a43e748	00100000-568f-cba4-32d3-6c66f7ad66f1	02	Tehnika
\.


--
-- TOC entry 3138 (class 0 OID 34767304)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-568f-cba4-7ae5-7cee65fd333d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-568f-cba4-d4d1-8d64ea69557e	00010000-568f-cba3-bfa9-9b97e522b47a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-568f-cba4-e234-293eda0bb51a	00010000-568f-cba3-91e0-6c883bac6171	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-568f-cba4-e93f-8c9e5b0f42b5	00010000-568f-cba3-bbc2-2be9d6e400c9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-568f-cba4-bb76-70b03b5d65d7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-568f-cba4-b29a-3ea80ae809d5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-568f-cba4-872f-ab03acc73f97	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-568f-cba4-a2e5-0f4af5cba94b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-568f-cba4-6c70-a4a9f87e0dc8	00010000-568f-cba3-fb48-87f8ea4396d7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-568f-cba4-c49d-bc6ae30dcf67	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-568f-cba4-a70c-153429fb123e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-568f-cba4-4c05-01a7ef753513	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-568f-cba4-d224-c8cc5fd2479d	00010000-568f-cba3-07dc-9930c6aefb66	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-568f-cba4-e5f5-b4e8b1cf7644	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-568f-cba4-eff1-b32203b54d0e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-568f-cba4-ace8-127bcb5f0643	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-568f-cba4-3343-e9c1e20bbcba	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-568f-cba4-9abb-49dae5e66e0f	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-568f-cba4-8c6a-260c1bdaa57c	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-568f-cba4-d912-efdc620e9d74	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-568f-cba4-15e4-0024af40b75f	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3130 (class 0 OID 34767239)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-568f-cba1-3d29-cad9ae1bfe37	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-568f-cba1-cebf-df5573c83dd1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-568f-cba1-9ace-376e23c03903	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-568f-cba1-51a4-448e67aedc86	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-568f-cba1-d7f8-c04e7fde0c62	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-568f-cba1-0b8f-b055a6d140ae	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-568f-cba1-656b-7fc5ca4ade87	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-568f-cba1-3d3b-b6c7636a280d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-568f-cba1-94b5-a450606d3048	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-568f-cba1-e73f-247f08f21b07	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-568f-cba1-89e7-c1a23bf15a5f	Abonma-read	Abonma - branje	t
00030000-568f-cba1-6ac8-ec5dd8ccba9b	Abonma-write	Abonma - spreminjanje	t
00030000-568f-cba1-6c62-2ddea00ffc7a	Alternacija-read	Alternacija - branje	t
00030000-568f-cba1-489d-2acfc0299c37	Alternacija-write	Alternacija - spreminjanje	t
00030000-568f-cba1-9ee7-fd64eb46a192	Arhivalija-read	Arhivalija - branje	t
00030000-568f-cba1-aac2-e05675cd61fb	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-568f-cba1-4264-0bdfd935ba11	AuthStorage-read	AuthStorage - branje	t
00030000-568f-cba1-403e-009758d5631c	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-568f-cba1-2aca-1d8e195c9772	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-568f-cba1-e65d-750600ea238a	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-568f-cba1-ea73-6a6f2d7ed8e7	Besedilo-read	Besedilo - branje	t
00030000-568f-cba1-4255-c746c6c05395	Besedilo-write	Besedilo - spreminjanje	t
00030000-568f-cba1-b4f6-6c9a98ebf25e	Dodatek-read	Dodatek - branje	t
00030000-568f-cba1-c386-8f81fe87c3a3	Dodatek-write	Dodatek - spreminjanje	t
00030000-568f-cba1-b99c-e7234d132ba4	Dogodek-read	Dogodek - branje	t
00030000-568f-cba1-68a7-21fdc022a7f9	Dogodek-write	Dogodek - spreminjanje	t
00030000-568f-cba1-4073-b6f6b9b096cc	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-568f-cba1-8ea2-bfe415266d52	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-568f-cba1-7cf8-7934e5b45296	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-568f-cba1-e7f3-a6e90d3a2c44	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-568f-cba1-9323-158b15758a0d	DogodekTrait-read	DogodekTrait - branje	t
00030000-568f-cba1-15c4-f357cb75ef5c	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-568f-cba1-7a2f-60be706349cd	DrugiVir-read	DrugiVir - branje	t
00030000-568f-cba1-7cbe-fa4445051303	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-568f-cba1-3dc4-5496d80dd42e	Drzava-read	Drzava - branje	t
00030000-568f-cba1-d23f-3227bedafa1a	Drzava-write	Drzava - spreminjanje	t
00030000-568f-cba1-ae84-ecb07c9642a6	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-568f-cba1-c52b-30698228a4ed	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-568f-cba1-aef6-4898566e38ab	Funkcija-read	Funkcija - branje	t
00030000-568f-cba1-d5da-273831c51011	Funkcija-write	Funkcija - spreminjanje	t
00030000-568f-cba1-8181-2323839e56df	Gostovanje-read	Gostovanje - branje	t
00030000-568f-cba1-90b9-f82beff077db	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-568f-cba1-9de1-493c2fa4b8f4	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-568f-cba1-9dfd-f7e3e4846a8e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-568f-cba1-a416-b5887fccdbfe	Kupec-read	Kupec - branje	t
00030000-568f-cba1-0406-e703343c2cc2	Kupec-write	Kupec - spreminjanje	t
00030000-568f-cba1-3a1a-cef30c849846	NacinPlacina-read	NacinPlacina - branje	t
00030000-568f-cba1-600f-cc6123c1ea82	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-568f-cba1-90b5-d2cc3f8f966d	Option-read	Option - branje	t
00030000-568f-cba1-2646-ab5c002166f7	Option-write	Option - spreminjanje	t
00030000-568f-cba1-bfd4-34875e488037	OptionValue-read	OptionValue - branje	t
00030000-568f-cba1-b14c-4f6653189561	OptionValue-write	OptionValue - spreminjanje	t
00030000-568f-cba1-edeb-2767526db29f	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-568f-cba1-c271-420e14ab136b	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-568f-cba1-fead-15e247589d88	Oseba-read	Oseba - branje	t
00030000-568f-cba1-d3f5-8b7981afc86f	Oseba-write	Oseba - spreminjanje	t
00030000-568f-cba1-ab7c-d8825350fad9	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-568f-cba1-df01-143f2bfd41fd	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-568f-cba1-d8cb-a5026e1deda2	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-568f-cba1-3201-f33830510faa	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-568f-cba1-604d-3b0319de0f60	Pogodba-read	Pogodba - branje	t
00030000-568f-cba1-0bdf-4770f9daec1d	Pogodba-write	Pogodba - spreminjanje	t
00030000-568f-cba1-a563-17082a79027b	Popa-read	Popa - branje	t
00030000-568f-cba1-328d-3a92846ca9e8	Popa-write	Popa - spreminjanje	t
00030000-568f-cba1-a180-5f8d0abb7d11	Posta-read	Posta - branje	t
00030000-568f-cba1-ce64-861a1a201deb	Posta-write	Posta - spreminjanje	t
00030000-568f-cba1-0d33-19251649c344	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-568f-cba1-4853-c04743fadbc7	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-568f-cba1-880e-46fcac7c69ac	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-568f-cba1-0c73-1326cc5de947	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-568f-cba1-59ea-4def0f5a7286	PostniNaslov-read	PostniNaslov - branje	t
00030000-568f-cba1-0fd3-2f2bfd9a59e4	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-568f-cba1-f829-c23d24051451	Praznik-read	Praznik - branje	t
00030000-568f-cba1-c166-9cb18031ecce	Praznik-write	Praznik - spreminjanje	t
00030000-568f-cba1-b9ef-549cd5484542	Predstava-read	Predstava - branje	t
00030000-568f-cba1-90a8-2b85d6d200f7	Predstava-write	Predstava - spreminjanje	t
00030000-568f-cba1-7e82-da8c240dc57e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-568f-cba1-7e01-ee1b4e219b82	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-568f-cba1-7ff8-d0f4323ef117	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-568f-cba1-88d8-bfdf5b7a2f06	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-568f-cba1-a438-310e62a913ac	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-568f-cba1-4473-e2fa7a2c1cb5	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-568f-cba1-b0a1-a0f024c02f89	ProgramDela-read	ProgramDela - branje	t
00030000-568f-cba1-bc2f-0968c9ac01f9	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-568f-cba1-50ce-24f0262873b5	ProgramFestival-read	ProgramFestival - branje	t
00030000-568f-cba1-3c62-b5f9a65e940e	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-568f-cba1-0f3e-87ffb29d32ec	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-568f-cba1-438f-a8715cd1ecaa	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-568f-cba1-ea89-bf7c76d7857d	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-568f-cba1-f6e2-a8998d3843a3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-568f-cba1-b519-a7e6fa854492	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-568f-cba1-d362-7d001554e16d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-568f-cba1-d7f9-3e4712da432f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-568f-cba1-033f-43bf1a0f5830	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-568f-cba1-5bcc-823169d5a6e1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-568f-cba1-d911-c87f496f75da	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-568f-cba1-6a2b-9a3c0880925a	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-568f-cba1-539a-5d2131acb8f1	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-568f-cba1-6a93-4314ef6f8cf0	ProgramRazno-read	ProgramRazno - branje	t
00030000-568f-cba1-49a8-7c5b9fc16b00	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-568f-cba1-802a-b66ec9e117eb	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-568f-cba1-110e-a39d37a17441	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-568f-cba1-0cb3-bf0417a9d55c	Prostor-read	Prostor - branje	t
00030000-568f-cba1-1d9b-13ef7c598537	Prostor-write	Prostor - spreminjanje	t
00030000-568f-cba1-5af0-31a1e44aef43	Racun-read	Racun - branje	t
00030000-568f-cba1-bc35-d08ae42f4848	Racun-write	Racun - spreminjanje	t
00030000-568f-cba1-172b-d147774281aa	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-568f-cba1-9b72-0e91a2bd7e1b	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-568f-cba1-b6f2-cba258c5f139	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-568f-cba1-2e99-6a8558c39c44	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-568f-cba1-dc49-fa35f8da7842	Rekvizit-read	Rekvizit - branje	t
00030000-568f-cba1-4479-8c91247ebdc1	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-568f-cba1-0268-0e3090d56646	Revizija-read	Revizija - branje	t
00030000-568f-cba1-662e-bc7efbb4d4b1	Revizija-write	Revizija - spreminjanje	t
00030000-568f-cba1-e8d1-c87d4be98707	Rezervacija-read	Rezervacija - branje	t
00030000-568f-cba1-4325-7941c6f95153	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-568f-cba1-eace-f2ddf155b02b	SedezniRed-read	SedezniRed - branje	t
00030000-568f-cba1-a7a8-04818a8cf5ab	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-568f-cba1-0e41-c2b036199fef	Sedez-read	Sedez - branje	t
00030000-568f-cba1-bcbd-f972b9a0ec8d	Sedez-write	Sedez - spreminjanje	t
00030000-568f-cba1-ccc3-725a30e9e5ab	Sezona-read	Sezona - branje	t
00030000-568f-cba1-7d46-7a68729e69b1	Sezona-write	Sezona - spreminjanje	t
00030000-568f-cba1-8261-dd9219e200b6	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-568f-cba1-8c53-f0c03f50a791	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-568f-cba1-6581-814c67a2a88e	Telefonska-read	Telefonska - branje	t
00030000-568f-cba1-9842-29c15bac3df5	Telefonska-write	Telefonska - spreminjanje	t
00030000-568f-cba1-9731-826104618a43	TerminStoritve-read	TerminStoritve - branje	t
00030000-568f-cba1-5b0d-805d1a03b99a	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-568f-cba1-ce62-a3a8e7870aa7	TipDodatka-read	TipDodatka - branje	t
00030000-568f-cba1-a740-60bb1085cc6e	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-568f-cba1-1ac4-76db102afece	TipFunkcije-read	TipFunkcije - branje	t
00030000-568f-cba1-1e8f-b12936220d3a	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-568f-cba1-be11-4619f9686f95	TipPopa-read	TipPopa - branje	t
00030000-568f-cba1-2b76-15d35a4996e0	TipPopa-write	TipPopa - spreminjanje	t
00030000-568f-cba1-db29-8a3a175aeef1	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-568f-cba1-319b-cc44239c2a1d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-568f-cba1-42c4-2c0e60758577	TipVaje-read	TipVaje - branje	t
00030000-568f-cba1-0adc-ce0401e17569	TipVaje-write	TipVaje - spreminjanje	t
00030000-568f-cba1-49af-4c1530c4c7cf	Trr-read	Trr - branje	t
00030000-568f-cba1-0d0c-182de78ee3ff	Trr-write	Trr - spreminjanje	t
00030000-568f-cba1-41fa-426a6615179b	Uprizoritev-read	Uprizoritev - branje	t
00030000-568f-cba1-b0cf-626fe3f89660	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-568f-cba1-79cf-ac4cf1e44f80	Vaja-read	Vaja - branje	t
00030000-568f-cba1-f4d0-f6a14ccad406	Vaja-write	Vaja - spreminjanje	t
00030000-568f-cba1-e17e-4f899fd4f783	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-568f-cba1-7f59-173fe4d5af29	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-568f-cba1-65af-8c948b92f354	VrstaStroska-read	VrstaStroska - branje	t
00030000-568f-cba1-5559-706f26bf4e3a	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-568f-cba1-7346-e0dbc096edf2	Zaposlitev-read	Zaposlitev - branje	t
00030000-568f-cba1-c1b7-88269adb1b72	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-568f-cba1-14f0-bc02b56de8b5	Zasedenost-read	Zasedenost - branje	t
00030000-568f-cba1-662f-d36f0cb9c727	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-568f-cba1-e137-176b9f74d931	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-568f-cba1-43a8-de7518663adf	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-568f-cba1-4620-f0fae5cc986e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-568f-cba1-377e-49c51c8d912f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-568f-cba1-17e1-049029bfa6c0	Job-read	Branje opravil - samo zase - branje	t
00030000-568f-cba1-3738-c2847bcdd126	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-568f-cba1-b4f7-31572fc60c75	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-568f-cba1-8b4b-051bf4811084	Report-read	Report - branje	t
00030000-568f-cba1-01f9-d832c9b332e5	Report-write	Report - spreminjanje	t
00030000-568f-cba1-1446-8bf570157d16	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-568f-cba1-f87c-ec77c818beee	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-568f-cba1-bcc0-910b48c2d852	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-568f-cba1-7ed9-859f71c901a3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-568f-cba1-5c96-a26f2c8587c9	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-568f-cba1-03bc-4bc06d0aed1a	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-568f-cba1-db0b-ccadd6f037e6	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-568f-cba1-80f3-395896a89d08	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-568f-cba1-da1d-9dbe98c95997	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-568f-cba1-332e-8ec8e647c644	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-568f-cba1-e0f6-7870c5954ef2	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-568f-cba1-83de-ff0ab4cc3353	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-568f-cba1-78a3-0188449b3a8b	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-568f-cba1-8758-091e6dfc8c7d	Datoteka-write	Datoteka - spreminjanje	t
00030000-568f-cba1-1d4b-212e452ddadb	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3132 (class 0 OID 34767258)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-568f-cba1-32bc-0577d9566385	00030000-568f-cba1-cebf-df5573c83dd1
00020000-568f-cba1-32bc-0577d9566385	00030000-568f-cba1-3d29-cad9ae1bfe37
00020000-568f-cba1-11ce-7ac1efddf313	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-e65d-750600ea238a
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-4255-c746c6c05395
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-2aca-1d8e195c9772
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-ff08-f3b469f761a5	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-8fbe-23f3756444be	00030000-568f-cba1-2aca-1d8e195c9772
00020000-568f-cba1-8fbe-23f3756444be	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-8fbe-23f3756444be	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-8fbe-23f3756444be	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-8fbe-23f3756444be	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-8fbe-23f3756444be	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-d719-7017c22542cf	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-d719-7017c22542cf	00030000-568f-cba1-c1b7-88269adb1b72
00020000-568f-cba1-d719-7017c22542cf	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-d719-7017c22542cf	00030000-568f-cba1-d7f8-c04e7fde0c62
00020000-568f-cba1-d719-7017c22542cf	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-d719-7017c22542cf	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-d719-7017c22542cf	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-0cc1-2d9a2eff2113	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-0cc1-2d9a2eff2113	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-0cc1-2d9a2eff2113	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-e8f3-5320fd19b394	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-e8f3-5320fd19b394	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-e8f3-5320fd19b394	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-e8f3-5320fd19b394	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-e8f3-5320fd19b394	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-e8f3-5320fd19b394	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-e8f3-5320fd19b394	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-e8f3-5320fd19b394	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-ade0-4681097df694	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-ade0-4681097df694	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-ade0-4681097df694	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-ade0-4681097df694	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-d7f8-c04e7fde0c62
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-0d0c-182de78ee3ff
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-0fd3-2f2bfd9a59e4
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-9842-29c15bac3df5
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-468d-0413a80871df	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-291f-85480e7b17e4	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-291f-85480e7b17e4	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-291f-85480e7b17e4	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-291f-85480e7b17e4	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-291f-85480e7b17e4	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-291f-85480e7b17e4	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-291f-85480e7b17e4	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-9842-29c15bac3df5
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-0fd3-2f2bfd9a59e4
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-0d0c-182de78ee3ff
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-328d-3a92846ca9e8
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-9dfd-f7e3e4846a8e
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-4473-e2fa7a2c1cb5
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-c3da-b0ac5dff4d36	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-bb9f-8d36c37adc73	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-8ac9-6739902dd664	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-8ac9-6739902dd664	00030000-568f-cba1-2b76-15d35a4996e0
00020000-568f-cba1-61f7-7740f74f01bc	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-279d-79e0bee5f65b	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba1-279d-79e0bee5f65b	00030000-568f-cba1-ce64-861a1a201deb
00020000-568f-cba1-237d-c6d7461e4c51	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba1-9234-9352d6eab4f7	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-9234-9352d6eab4f7	00030000-568f-cba1-d23f-3227bedafa1a
00020000-568f-cba1-585b-27f102f65f85	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-b187-b8c2827e890c	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba1-b187-b8c2827e890c	00030000-568f-cba1-377e-49c51c8d912f
00020000-568f-cba1-da22-0b01f4080636	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba1-e0e2-c0547faca3c1	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba1-e0e2-c0547faca3c1	00030000-568f-cba1-43a8-de7518663adf
00020000-568f-cba1-01c1-524e21cc1baf	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba1-29e6-c48da4749d3e	00030000-568f-cba1-89e7-c1a23bf15a5f
00020000-568f-cba1-29e6-c48da4749d3e	00030000-568f-cba1-6ac8-ec5dd8ccba9b
00020000-568f-cba1-6706-ffa0026d9138	00030000-568f-cba1-89e7-c1a23bf15a5f
00020000-568f-cba1-04d4-ec792bcd5699	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba1-04d4-ec792bcd5699	00030000-568f-cba1-1d9b-13ef7c598537
00020000-568f-cba1-04d4-ec792bcd5699	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-04d4-ec792bcd5699	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-04d4-ec792bcd5699	00030000-568f-cba1-0fd3-2f2bfd9a59e4
00020000-568f-cba1-04d4-ec792bcd5699	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-50cd-1530f8dfa82c	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba1-50cd-1530f8dfa82c	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-50cd-1530f8dfa82c	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-67f6-065a0c2b3663	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-67f6-065a0c2b3663	00030000-568f-cba1-5559-706f26bf4e3a
00020000-568f-cba1-d844-c244d5286bc8	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-0f71-d24724344b72	00030000-568f-cba1-c271-420e14ab136b
00020000-568f-cba1-0f71-d24724344b72	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-0f71-d24724344b72	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-0f71-d24724344b72	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-0f71-d24724344b72	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-0f71-d24724344b72	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-0f71-d24724344b72	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-0f71-d24724344b72	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-0f71-d24724344b72	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-50fe-a61b40238462	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-50fe-a61b40238462	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-50fe-a61b40238462	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-50fe-a61b40238462	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-50fe-a61b40238462	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-134d-f66b21331a06	00030000-568f-cba1-42c4-2c0e60758577
00020000-568f-cba1-134d-f66b21331a06	00030000-568f-cba1-0adc-ce0401e17569
00020000-568f-cba1-f054-020d963a800b	00030000-568f-cba1-42c4-2c0e60758577
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-656b-7fc5ca4ade87
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-3d3b-b6c7636a280d
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-b0a1-a0f024c02f89
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-bc2f-0968c9ac01f9
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-50ce-24f0262873b5
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-3c62-b5f9a65e940e
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-0f3e-87ffb29d32ec
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-438f-a8715cd1ecaa
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-ea89-bf7c76d7857d
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-f6e2-a8998d3843a3
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-b519-a7e6fa854492
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-d362-7d001554e16d
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-d7f9-3e4712da432f
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-033f-43bf1a0f5830
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-5bcc-823169d5a6e1
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-d911-c87f496f75da
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-6a2b-9a3c0880925a
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-539a-5d2131acb8f1
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-6a93-4314ef6f8cf0
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-49a8-7c5b9fc16b00
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-802a-b66ec9e117eb
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-110e-a39d37a17441
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-88d8-bfdf5b7a2f06
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-7cbe-fa4445051303
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-4853-c04743fadbc7
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-3738-c2847bcdd126
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-7a2f-60be706349cd
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-7ff8-d0f4323ef117
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-0d33-19251649c344
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-17e1-049029bfa6c0
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-435c-b51ff46c9174	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-b0a1-a0f024c02f89
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-50ce-24f0262873b5
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-0f3e-87ffb29d32ec
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-ea89-bf7c76d7857d
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-b519-a7e6fa854492
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-d7f9-3e4712da432f
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-5bcc-823169d5a6e1
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-6a2b-9a3c0880925a
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-6a93-4314ef6f8cf0
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-802a-b66ec9e117eb
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-7ff8-d0f4323ef117
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-7a2f-60be706349cd
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-0d33-19251649c344
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-17e1-049029bfa6c0
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-3a2e-d1d83fbf1384	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-b0cf-626fe3f89660
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-94b5-a450606d3048
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-d5da-273831c51011
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-e73f-247f08f21b07
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-7a67-90cf1aee5556	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-bc3a-d3be71619377	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-7dae-97f1fc197818	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-7dae-97f1fc197818	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba1-7dae-97f1fc197818	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-7dae-97f1fc197818	00030000-568f-cba1-d5da-273831c51011
00020000-568f-cba1-7dae-97f1fc197818	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-7dae-97f1fc197818	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-7dae-97f1fc197818	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-7dae-97f1fc197818	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-94b5-a450606d3048
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-d7f8-c04e7fde0c62
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-0bdf-4770f9daec1d
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-8c53-f0c03f50a791
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-40be-cf5df8d7b4b0	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-60d2-e01dfde8eb74	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-866c-2a81322c571a	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-866c-2a81322c571a	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-866c-2a81322c571a	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-866c-2a81322c571a	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba1-866c-2a81322c571a	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-866c-2a81322c571a	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-866c-2a81322c571a	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-7356-f4c5a65e0c06	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-7356-f4c5a65e0c06	00030000-568f-cba1-8c53-f0c03f50a791
00020000-568f-cba1-7356-f4c5a65e0c06	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-7356-f4c5a65e0c06	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-6c6e-fdbecd4e5872	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-6c6e-fdbecd4e5872	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-89e7-c1a23bf15a5f
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-94b5-a450606d3048
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-2aca-1d8e195c9772
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-e65d-750600ea238a
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-4255-c746c6c05395
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-7a2f-60be706349cd
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-7cbe-fa4445051303
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-d5da-273831c51011
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-e73f-247f08f21b07
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-17e1-049029bfa6c0
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-3738-c2847bcdd126
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-d7f8-c04e7fde0c62
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-0bdf-4770f9daec1d
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-0d33-19251649c344
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-4853-c04743fadbc7
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-7ff8-d0f4323ef117
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-88d8-bfdf5b7a2f06
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-656b-7fc5ca4ade87
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-b0a1-a0f024c02f89
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-3d3b-b6c7636a280d
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-bc2f-0968c9ac01f9
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-50ce-24f0262873b5
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-3c62-b5f9a65e940e
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-0f3e-87ffb29d32ec
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-438f-a8715cd1ecaa
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-ea89-bf7c76d7857d
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-f6e2-a8998d3843a3
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-b519-a7e6fa854492
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-d362-7d001554e16d
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-d7f9-3e4712da432f
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-033f-43bf1a0f5830
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-5bcc-823169d5a6e1
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-d911-c87f496f75da
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-6a2b-9a3c0880925a
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-539a-5d2131acb8f1
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-6a93-4314ef6f8cf0
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-49a8-7c5b9fc16b00
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-802a-b66ec9e117eb
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-110e-a39d37a17441
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-8c53-f0c03f50a791
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-42c4-2c0e60758577
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-b0cf-626fe3f89660
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba1-ebff-82fdfc3afee5	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-89e7-c1a23bf15a5f
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-2aca-1d8e195c9772
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-e65d-750600ea238a
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-4255-c746c6c05395
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-42c4-2c0e60758577
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba1-03ba-0f90979965ef	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-89e7-c1a23bf15a5f
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-94b5-a450606d3048
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-2aca-1d8e195c9772
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-e65d-750600ea238a
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-4255-c746c6c05395
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-d5da-273831c51011
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-e73f-247f08f21b07
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-42c4-2c0e60758577
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-b0cf-626fe3f89660
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba1-48a6-848db6e444e1	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-94b5-a450606d3048
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-2aca-1d8e195c9772
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-e65d-750600ea238a
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-4255-c746c6c05395
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-7a2f-60be706349cd
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-7cbe-fa4445051303
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-d5da-273831c51011
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-e73f-247f08f21b07
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-17e1-049029bfa6c0
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-3738-c2847bcdd126
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-9dfd-f7e3e4846a8e
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-d7f8-c04e7fde0c62
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-0bdf-4770f9daec1d
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-328d-3a92846ca9e8
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-0d33-19251649c344
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-4853-c04743fadbc7
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-0fd3-2f2bfd9a59e4
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-7ff8-d0f4323ef117
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-88d8-bfdf5b7a2f06
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-4473-e2fa7a2c1cb5
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-656b-7fc5ca4ade87
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-b0a1-a0f024c02f89
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-3d3b-b6c7636a280d
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-bc2f-0968c9ac01f9
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-50ce-24f0262873b5
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-3c62-b5f9a65e940e
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-0f3e-87ffb29d32ec
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-438f-a8715cd1ecaa
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-ea89-bf7c76d7857d
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-f6e2-a8998d3843a3
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-b519-a7e6fa854492
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-d362-7d001554e16d
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-d7f9-3e4712da432f
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-033f-43bf1a0f5830
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-5bcc-823169d5a6e1
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-d911-c87f496f75da
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-6a2b-9a3c0880925a
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-539a-5d2131acb8f1
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-6a93-4314ef6f8cf0
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-49a8-7c5b9fc16b00
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-802a-b66ec9e117eb
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-110e-a39d37a17441
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-8c53-f0c03f50a791
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-9842-29c15bac3df5
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-0d0c-182de78ee3ff
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-b0cf-626fe3f89660
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-c1b7-88269adb1b72
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba1-94b6-493804c33389	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-89e7-c1a23bf15a5f
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-94b5-a450606d3048
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-2aca-1d8e195c9772
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-e65d-750600ea238a
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-4255-c746c6c05395
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-d5da-273831c51011
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-e73f-247f08f21b07
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-9dfd-f7e3e4846a8e
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-d7f8-c04e7fde0c62
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-328d-3a92846ca9e8
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-0fd3-2f2bfd9a59e4
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-4473-e2fa7a2c1cb5
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-9842-29c15bac3df5
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-42c4-2c0e60758577
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-0d0c-182de78ee3ff
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-b0cf-626fe3f89660
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-c1b7-88269adb1b72
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba1-7c9e-5dd0ec6c5d49	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-89e7-c1a23bf15a5f
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-2aca-1d8e195c9772
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-d5da-273831c51011
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-42c4-2c0e60758577
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba1-1f11-9ae86f90bae5	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-89e7-c1a23bf15a5f
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-94b5-a450606d3048
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-7a2f-60be706349cd
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-7cbe-fa4445051303
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-17e1-049029bfa6c0
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-3738-c2847bcdd126
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-9dfd-f7e3e4846a8e
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-c271-420e14ab136b
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-d7f8-c04e7fde0c62
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-0bdf-4770f9daec1d
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-328d-3a92846ca9e8
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-0d33-19251649c344
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-4853-c04743fadbc7
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-0fd3-2f2bfd9a59e4
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-7ff8-d0f4323ef117
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-88d8-bfdf5b7a2f06
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-4473-e2fa7a2c1cb5
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-656b-7fc5ca4ade87
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-b0a1-a0f024c02f89
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-3d3b-b6c7636a280d
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-bc2f-0968c9ac01f9
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-50ce-24f0262873b5
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-3c62-b5f9a65e940e
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-0f3e-87ffb29d32ec
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-438f-a8715cd1ecaa
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-ea89-bf7c76d7857d
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-f6e2-a8998d3843a3
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-b519-a7e6fa854492
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-d362-7d001554e16d
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-d7f9-3e4712da432f
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-033f-43bf1a0f5830
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-5bcc-823169d5a6e1
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-d911-c87f496f75da
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-6a2b-9a3c0880925a
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-539a-5d2131acb8f1
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-6a93-4314ef6f8cf0
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-49a8-7c5b9fc16b00
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-802a-b66ec9e117eb
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-110e-a39d37a17441
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-8c53-f0c03f50a791
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-9842-29c15bac3df5
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-42c4-2c0e60758577
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-0d0c-182de78ee3ff
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-5559-706f26bf4e3a
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-c1b7-88269adb1b72
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba1-9c54-c2d8a3dec1d6	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-3d29-cad9ae1bfe37
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-cebf-df5573c83dd1
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-89e7-c1a23bf15a5f
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-6ac8-ec5dd8ccba9b
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-94b5-a450606d3048
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-9ee7-fd64eb46a192
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-aac2-e05675cd61fb
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-4264-0bdfd935ba11
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-403e-009758d5631c
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-2aca-1d8e195c9772
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-e65d-750600ea238a
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-ea73-6a6f2d7ed8e7
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-4255-c746c6c05395
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-b99c-e7234d132ba4
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-51a4-448e67aedc86
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-4073-b6f6b9b096cc
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-8ea2-bfe415266d52
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7cf8-7934e5b45296
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-e7f3-a6e90d3a2c44
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-9323-158b15758a0d
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-15c4-f357cb75ef5c
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-68a7-21fdc022a7f9
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7a2f-60be706349cd
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7cbe-fa4445051303
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-3dc4-5496d80dd42e
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-d23f-3227bedafa1a
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-ae84-ecb07c9642a6
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-c52b-30698228a4ed
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-e73f-247f08f21b07
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-d5da-273831c51011
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-8181-2323839e56df
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-90b9-f82beff077db
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-b4f7-31572fc60c75
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-17e1-049029bfa6c0
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-3738-c2847bcdd126
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-9de1-493c2fa4b8f4
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-9dfd-f7e3e4846a8e
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-a416-b5887fccdbfe
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0406-e703343c2cc2
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-db0b-ccadd6f037e6
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-03bc-4bc06d0aed1a
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-f87c-ec77c818beee
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-bcc0-910b48c2d852
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7ed9-859f71c901a3
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-5c96-a26f2c8587c9
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-3a1a-cef30c849846
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-600f-cc6123c1ea82
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-90b5-d2cc3f8f966d
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-bfd4-34875e488037
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-b14c-4f6653189561
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-2646-ab5c002166f7
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-edeb-2767526db29f
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-c271-420e14ab136b
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-d7f8-c04e7fde0c62
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-ab7c-d8825350fad9
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-df01-143f2bfd41fd
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-d8cb-a5026e1deda2
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-3201-f33830510faa
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0bdf-4770f9daec1d
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-328d-3a92846ca9e8
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-a180-5f8d0abb7d11
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0d33-19251649c344
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-4853-c04743fadbc7
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-880e-46fcac7c69ac
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0c73-1326cc5de947
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-ce64-861a1a201deb
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0fd3-2f2bfd9a59e4
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-f829-c23d24051451
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-c166-9cb18031ecce
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-b9ef-549cd5484542
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-90a8-2b85d6d200f7
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7e82-da8c240dc57e
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7e01-ee1b4e219b82
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7ff8-d0f4323ef117
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-88d8-bfdf5b7a2f06
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-a438-310e62a913ac
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-4473-e2fa7a2c1cb5
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-656b-7fc5ca4ade87
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-b0a1-a0f024c02f89
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-3d3b-b6c7636a280d
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-bc2f-0968c9ac01f9
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-50ce-24f0262873b5
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-3c62-b5f9a65e940e
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0f3e-87ffb29d32ec
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-438f-a8715cd1ecaa
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-ea89-bf7c76d7857d
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-f6e2-a8998d3843a3
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-b519-a7e6fa854492
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-d362-7d001554e16d
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-d7f9-3e4712da432f
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-033f-43bf1a0f5830
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-5bcc-823169d5a6e1
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-d911-c87f496f75da
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-6a2b-9a3c0880925a
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-539a-5d2131acb8f1
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-6a93-4314ef6f8cf0
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-49a8-7c5b9fc16b00
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-802a-b66ec9e117eb
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-110e-a39d37a17441
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0cb3-bf0417a9d55c
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-1d9b-13ef7c598537
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-5af0-31a1e44aef43
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-bc35-d08ae42f4848
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-172b-d147774281aa
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-9b72-0e91a2bd7e1b
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-b6f2-cba258c5f139
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-2e99-6a8558c39c44
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-dc49-fa35f8da7842
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-4479-8c91247ebdc1
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-8b4b-051bf4811084
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-01f9-d832c9b332e5
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0268-0e3090d56646
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-662e-bc7efbb4d4b1
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-e8d1-c87d4be98707
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-4325-7941c6f95153
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-eace-f2ddf155b02b
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-a7a8-04818a8cf5ab
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0e41-c2b036199fef
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-bcbd-f972b9a0ec8d
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-ccc3-725a30e9e5ab
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7d46-7a68729e69b1
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-1446-8bf570157d16
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-8c53-f0c03f50a791
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-9842-29c15bac3df5
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-9731-826104618a43
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-9ace-376e23c03903
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-5b0d-805d1a03b99a
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-1ac4-76db102afece
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-1e8f-b12936220d3a
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-be11-4619f9686f95
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-2b76-15d35a4996e0
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-db29-8a3a175aeef1
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-319b-cc44239c2a1d
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-42c4-2c0e60758577
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0adc-ce0401e17569
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-0d0c-182de78ee3ff
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-b0cf-626fe3f89660
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-79cf-ac4cf1e44f80
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-f4d0-f6a14ccad406
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-e17e-4f899fd4f783
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7f59-173fe4d5af29
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-65af-8c948b92f354
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-5559-706f26bf4e3a
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-78a3-0188449b3a8b
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-83de-ff0ab4cc3353
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-c1b7-88269adb1b72
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-14f0-bc02b56de8b5
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-662f-d36f0cb9c727
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-e137-176b9f74d931
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-43a8-de7518663adf
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-4620-f0fae5cc986e
00020000-568f-cba3-0956-e76e937233d5	00030000-568f-cba1-377e-49c51c8d912f
00020000-568f-cba3-7f66-948d4de07b98	00030000-568f-cba1-e0f6-7870c5954ef2
00020000-568f-cba3-4e77-28f43a7fea88	00030000-568f-cba1-332e-8ec8e647c644
00020000-568f-cba3-67f7-0a819189cba0	00030000-568f-cba1-b0cf-626fe3f89660
00020000-568f-cba3-d104-6a6e9cb57245	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba3-ba77-e90661234d18	00030000-568f-cba1-bcc0-910b48c2d852
00020000-568f-cba3-747c-70e436c4e03e	00030000-568f-cba1-7ed9-859f71c901a3
00020000-568f-cba3-7f5d-4649fe1ce298	00030000-568f-cba1-5c96-a26f2c8587c9
00020000-568f-cba3-e4cc-f414b5b072fe	00030000-568f-cba1-f87c-ec77c818beee
00020000-568f-cba3-cfa5-eefa35b790db	00030000-568f-cba1-db0b-ccadd6f037e6
00020000-568f-cba3-d1ce-78a0207e4a47	00030000-568f-cba1-03bc-4bc06d0aed1a
00020000-568f-cba3-e656-18b7b5c42a62	00030000-568f-cba1-da1d-9dbe98c95997
00020000-568f-cba3-51c8-0638fbfe67e1	00030000-568f-cba1-80f3-395896a89d08
00020000-568f-cba3-4125-29324d49e161	00030000-568f-cba1-fead-15e247589d88
00020000-568f-cba3-c570-b389678477f7	00030000-568f-cba1-d3f5-8b7981afc86f
00020000-568f-cba3-4545-c28c5ae4be28	00030000-568f-cba1-d7f8-c04e7fde0c62
00020000-568f-cba3-c4a6-67b9ef12c23c	00030000-568f-cba1-0b8f-b055a6d140ae
00020000-568f-cba3-d9ab-8165681ee3f9	00030000-568f-cba1-8758-091e6dfc8c7d
00020000-568f-cba3-37e0-fb9da28a5fcf	00030000-568f-cba1-1d4b-212e452ddadb
00020000-568f-cba3-e783-7f8d2084b52d	00030000-568f-cba1-a563-17082a79027b
00020000-568f-cba3-e783-7f8d2084b52d	00030000-568f-cba1-328d-3a92846ca9e8
00020000-568f-cba3-e783-7f8d2084b52d	00030000-568f-cba1-41fa-426a6615179b
00020000-568f-cba3-8aeb-b6c92931edc8	00030000-568f-cba1-49af-4c1530c4c7cf
00020000-568f-cba3-8624-3d0b6654b74f	00030000-568f-cba1-0d0c-182de78ee3ff
00020000-568f-cba3-751a-608214bdbd84	00030000-568f-cba1-1446-8bf570157d16
00020000-568f-cba3-be7e-8e3a4b3b4946	00030000-568f-cba1-6581-814c67a2a88e
00020000-568f-cba3-9963-9d44bbe4dfcc	00030000-568f-cba1-9842-29c15bac3df5
00020000-568f-cba3-b723-755ed4edc80c	00030000-568f-cba1-59ea-4def0f5a7286
00020000-568f-cba3-dfea-e607e3c34aad	00030000-568f-cba1-0fd3-2f2bfd9a59e4
00020000-568f-cba3-b1d2-47e8d3a12f38	00030000-568f-cba1-7346-e0dbc096edf2
00020000-568f-cba3-bdb8-c2a49474de4b	00030000-568f-cba1-c1b7-88269adb1b72
00020000-568f-cba3-84ab-cb6426fea533	00030000-568f-cba1-604d-3b0319de0f60
00020000-568f-cba3-23c4-cbff2a694676	00030000-568f-cba1-0bdf-4770f9daec1d
00020000-568f-cba3-3cb6-c08964137226	00030000-568f-cba1-8261-dd9219e200b6
00020000-568f-cba3-3f99-81ba35fb2686	00030000-568f-cba1-8c53-f0c03f50a791
00020000-568f-cba3-6422-99ad6b8fbfae	00030000-568f-cba1-6c62-2ddea00ffc7a
00020000-568f-cba3-1acc-d263883f3f9e	00030000-568f-cba1-489d-2acfc0299c37
00020000-568f-cba3-34b0-6441fab199e4	00030000-568f-cba1-94b5-a450606d3048
00020000-568f-cba3-15db-38f7fb0e940e	00030000-568f-cba1-aef6-4898566e38ab
00020000-568f-cba3-4726-cc22715a1d5d	00030000-568f-cba1-d5da-273831c51011
00020000-568f-cba3-7802-25e3f9999ef2	00030000-568f-cba1-e73f-247f08f21b07
\.


--
-- TOC entry 3171 (class 0 OID 34767665)
-- Dependencies: 219
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 34767699)
-- Dependencies: 223
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 34767833)
-- Dependencies: 235
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-568f-cba4-e3e4-689ad56d31dc	00090000-568f-cba4-7ae5-7cee65fd333d	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-568f-cba4-8a32-3b758ded2ee7	00090000-568f-cba4-b29a-3ea80ae809d5	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-568f-cba4-12be-959f6fe9918f	00090000-568f-cba4-d224-c8cc5fd2479d	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-568f-cba4-b738-ca763d1f5ec0	00090000-568f-cba4-c49d-bc6ae30dcf67	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3140 (class 0 OID 34767340)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-568f-cba4-45c4-0a6f355c065a	\N	00040000-568f-cba0-0177-967aa8001d78	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568f-cba4-b085-ba5ff413b998	\N	00040000-568f-cba0-0177-967aa8001d78	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-568f-cba4-0465-c2ae7401ad24	\N	00040000-568f-cba0-0177-967aa8001d78	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568f-cba4-3661-aa05d903fc5a	\N	00040000-568f-cba0-0177-967aa8001d78	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568f-cba4-a06b-f9f0179688f2	\N	00040000-568f-cba0-0177-967aa8001d78	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568f-cba4-b2d3-70207367a664	\N	00040000-568f-cba0-8198-8db617ec78c1	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568f-cba4-6510-11b2528bb03f	\N	00040000-568f-cba0-dbf2-eb9069f3124e	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568f-cba4-55ec-dfbc39a1e646	\N	00040000-568f-cba0-6798-6b434e632d4d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568f-cba4-f821-bb92e618ad06	\N	00040000-568f-cba0-bb72-fefa634088f0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-568f-cba6-497a-5ae7d56f8065	\N	00040000-568f-cba0-0177-967aa8001d78	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3143 (class 0 OID 34767385)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-568f-cb9f-355c-6451416fc832	8341	Adlešiči
00050000-568f-cb9f-56bb-8272b94fb341	5270	Ajdovščina
00050000-568f-cb9f-b74f-0bd8d3ebb2eb	6280	Ankaran/Ancarano
00050000-568f-cb9f-6e8f-b0bfb697e240	9253	Apače
00050000-568f-cb9f-bb35-6ca3113dbe08	8253	Artiče
00050000-568f-cb9f-4632-09705452ec8a	4275	Begunje na Gorenjskem
00050000-568f-cb9f-b0a7-c332b08a8b68	1382	Begunje pri Cerknici
00050000-568f-cb9f-d6c5-ebc2aaee4823	9231	Beltinci
00050000-568f-cb9f-303d-2eafb79d1412	2234	Benedikt
00050000-568f-cb9f-73ea-11920ec719a4	2345	Bistrica ob Dravi
00050000-568f-cb9f-9c22-5a7ef947729a	3256	Bistrica ob Sotli
00050000-568f-cb9f-fee3-490e53597189	8259	Bizeljsko
00050000-568f-cb9f-a1d2-055716c3f574	1223	Blagovica
00050000-568f-cb9f-9714-d3d7de3f541b	8283	Blanca
00050000-568f-cb9f-bef9-e74cdd4c22e4	4260	Bled
00050000-568f-cb9f-c4c8-832ca79dc08d	4273	Blejska Dobrava
00050000-568f-cb9f-1cb3-46f2a9c7754f	9265	Bodonci
00050000-568f-cb9f-1ec5-210eab8aeef9	9222	Bogojina
00050000-568f-cb9f-3848-365187d5cf6d	4263	Bohinjska Bela
00050000-568f-cb9f-1845-9314a3cde08f	4264	Bohinjska Bistrica
00050000-568f-cb9f-980e-a18c1d96806f	4265	Bohinjsko jezero
00050000-568f-cb9f-04f4-93487ae7ab1a	1353	Borovnica
00050000-568f-cb9f-107c-bdc84856f2fd	8294	Boštanj
00050000-568f-cb9f-19af-b6a1313de2de	5230	Bovec
00050000-568f-cb9f-f574-754a9115c8e2	5295	Branik
00050000-568f-cb9f-f4e6-04d22f682486	3314	Braslovče
00050000-568f-cb9f-499d-bd033193ccaa	5223	Breginj
00050000-568f-cb9f-17af-e6274186719c	8280	Brestanica
00050000-568f-cb9f-ad3b-bc08645470d3	2354	Bresternica
00050000-568f-cb9f-5d2b-6ae490ddc89d	4243	Brezje
00050000-568f-cb9f-0b2d-c160a834536e	1351	Brezovica pri Ljubljani
00050000-568f-cb9f-b6c8-9e7216781714	8250	Brežice
00050000-568f-cb9f-d952-08599dd48861	4210	Brnik - Aerodrom
00050000-568f-cb9f-b6be-82f4e79e1ab6	8321	Brusnice
00050000-568f-cb9f-9fe2-7eac2b5fd5a3	3255	Buče
00050000-568f-cb9f-275c-3483f5d8d97d	8276	Bučka 
00050000-568f-cb9f-1c9b-daabf1e51894	9261	Cankova
00050000-568f-cb9f-6939-75ab6813973b	3000	Celje 
00050000-568f-cb9f-a70f-e943ef8f0463	3001	Celje - poštni predali
00050000-568f-cb9f-21ba-e607734533c9	4207	Cerklje na Gorenjskem
00050000-568f-cb9f-21c3-0ddb23be145d	8263	Cerklje ob Krki
00050000-568f-cb9f-baad-1f01df1b5bf2	1380	Cerknica
00050000-568f-cb9f-29d1-1dc2e4e043d2	5282	Cerkno
00050000-568f-cb9f-8d38-11472bbb5527	2236	Cerkvenjak
00050000-568f-cb9f-526f-857f49924a0a	2215	Ceršak
00050000-568f-cb9f-e341-a6b24f32b4f8	2326	Cirkovce
00050000-568f-cb9f-16b7-f035fb786e90	2282	Cirkulane
00050000-568f-cb9f-f2e4-465a8048090c	5273	Col
00050000-568f-cb9f-1ebb-d0fa23004546	8251	Čatež ob Savi
00050000-568f-cb9f-98fe-a4f86992ae67	1413	Čemšenik
00050000-568f-cb9f-c274-dddf4c0fd37f	5253	Čepovan
00050000-568f-cb9f-1f80-283c0553d770	9232	Črenšovci
00050000-568f-cb9f-a99b-19b8b82276a7	2393	Črna na Koroškem
00050000-568f-cb9f-5e40-87d47898e116	6275	Črni Kal
00050000-568f-cb9f-124e-88ace09a381b	5274	Črni Vrh nad Idrijo
00050000-568f-cb9f-9f2a-befe3e639d19	5262	Črniče
00050000-568f-cb9f-96f6-e65db410115a	8340	Črnomelj
00050000-568f-cb9f-7bff-9d16d8c7b7e9	6271	Dekani
00050000-568f-cb9f-9675-fe7848da61f2	5210	Deskle
00050000-568f-cb9f-0ca6-e3f82d72b971	2253	Destrnik
00050000-568f-cb9f-5fe9-130033e52a06	6215	Divača
00050000-568f-cb9f-08f7-8448d1b47dd4	1233	Dob
00050000-568f-cb9f-5fc6-b4948bc91eb3	3224	Dobje pri Planini
00050000-568f-cb9f-46a8-b95e60525881	8257	Dobova
00050000-568f-cb9f-fded-d14825218f6b	1423	Dobovec
00050000-568f-cb9f-f98d-c15eae7e568d	5263	Dobravlje
00050000-568f-cb9f-1bd4-9ef8755e667c	3204	Dobrna
00050000-568f-cb9f-8836-0e402f2b655f	8211	Dobrnič
00050000-568f-cb9f-6cf6-55494d00562f	1356	Dobrova
00050000-568f-cb9f-2e17-d1031e983dbd	9223	Dobrovnik/Dobronak 
00050000-568f-cb9f-6e78-47d6670f6c7d	5212	Dobrovo v Brdih
00050000-568f-cb9f-08a4-cb869d6c7fde	1431	Dol pri Hrastniku
00050000-568f-cb9f-43fd-a010037d95be	1262	Dol pri Ljubljani
00050000-568f-cb9f-1f6f-ff6234ea0ed3	1273	Dole pri Litiji
00050000-568f-cb9f-e793-ee150685833e	1331	Dolenja vas
00050000-568f-cb9f-ec9f-94e07d2d1d7d	8350	Dolenjske Toplice
00050000-568f-cb9f-0fed-73d9f14519c5	1230	Domžale
00050000-568f-cb9f-efd8-ee544282f567	2252	Dornava
00050000-568f-cb9f-a600-bd5c402d6d38	5294	Dornberk
00050000-568f-cb9f-6d23-0b0095a2da94	1319	Draga
00050000-568f-cb9f-526a-6a86d1fa26b3	8343	Dragatuš
00050000-568f-cb9f-b434-f0079174b287	3222	Dramlje
00050000-568f-cb9f-7a78-667cad399175	2370	Dravograd
00050000-568f-cb9f-e2f4-4d6f6a445910	4203	Duplje
00050000-568f-cb9f-9843-d4ab8c13128e	6221	Dutovlje
00050000-568f-cb9f-c1d2-87fe6588f795	8361	Dvor
00050000-568f-cb9f-c13a-69329eee8716	2343	Fala
00050000-568f-cb9f-fe16-75b3f7fa4030	9208	Fokovci
00050000-568f-cb9f-9ee8-39f2e9ed64b6	2313	Fram
00050000-568f-cb9f-300a-416a0d77a3a5	3213	Frankolovo
00050000-568f-cb9f-0662-4bb0834c125c	1274	Gabrovka
00050000-568f-cb9f-a390-1700695a1e33	8254	Globoko
00050000-568f-cb9f-9230-e3b8a80f09ec	5275	Godovič
00050000-568f-cb9f-b208-0c57142c396d	4204	Golnik
00050000-568f-cb9f-9a78-939df7c43574	3303	Gomilsko
00050000-568f-cb9f-c5e5-8308c80f2404	4224	Gorenja vas
00050000-568f-cb9f-0a1d-f0f604dd13a7	3263	Gorica pri Slivnici
00050000-568f-cb9f-a74e-a3b465513a4c	2272	Gorišnica
00050000-568f-cb9f-5108-f918a08610b6	9250	Gornja Radgona
00050000-568f-cb9f-2593-8405c82aa776	3342	Gornji Grad
00050000-568f-cb9f-eb71-60a697513ca7	4282	Gozd Martuljek
00050000-568f-cb9f-5c6a-74be41d6a42f	6272	Gračišče
00050000-568f-cb9f-db30-4378369802e4	9264	Grad
00050000-568f-cb9f-8dca-7c91b296f701	8332	Gradac
00050000-568f-cb9f-ae7d-2c03c7eba457	1384	Grahovo
00050000-568f-cb9f-3ffb-78aefb2895bd	5242	Grahovo ob Bači
00050000-568f-cb9f-ab63-59d0e9045317	5251	Grgar
00050000-568f-cb9f-a815-5e743bb74557	3302	Griže
00050000-568f-cb9f-46cb-304727011d6f	3231	Grobelno
00050000-568f-cb9f-15e7-2e8673ab0538	1290	Grosuplje
00050000-568f-cb9f-54d2-9f54254a1637	2288	Hajdina
00050000-568f-cb9f-eda3-07a6a999e7ea	8362	Hinje
00050000-568f-cba0-1c0f-f3316d03eba9	2311	Hoče
00050000-568f-cba0-b86d-1bbe4ba58c4b	9205	Hodoš/Hodos
00050000-568f-cba0-6ff4-9882d9fed174	1354	Horjul
00050000-568f-cba0-68f2-d303248fe761	1372	Hotedršica
00050000-568f-cba0-5427-3ad644795819	1430	Hrastnik
00050000-568f-cba0-2c59-55891556556d	6225	Hruševje
00050000-568f-cba0-81f8-a2cdd969f713	4276	Hrušica
00050000-568f-cba0-3062-20f821eeeca4	5280	Idrija
00050000-568f-cba0-11ba-1d6fbdf4364c	1292	Ig
00050000-568f-cba0-79b4-26a5d7576ba2	6250	Ilirska Bistrica
00050000-568f-cba0-c040-a5edb6b016e1	6251	Ilirska Bistrica-Trnovo
00050000-568f-cba0-567a-af3410d04f69	1295	Ivančna Gorica
00050000-568f-cba0-5634-c172092b09c3	2259	Ivanjkovci
00050000-568f-cba0-59b3-26cffa156c70	1411	Izlake
00050000-568f-cba0-9946-e9836bc8bc8c	6310	Izola/Isola
00050000-568f-cba0-e525-80123064e6d8	2222	Jakobski Dol
00050000-568f-cba0-8bad-0c13e802c7fd	2221	Jarenina
00050000-568f-cba0-fa4f-77c28d7256ec	6254	Jelšane
00050000-568f-cba0-59cc-0159967c3445	4270	Jesenice
00050000-568f-cba0-5d12-b569c815eaa9	8261	Jesenice na Dolenjskem
00050000-568f-cba0-a001-18bd80ee7752	3273	Jurklošter
00050000-568f-cba0-4c0b-7ba037920926	2223	Jurovski Dol
00050000-568f-cba0-e70b-fd4424a15d1b	2256	Juršinci
00050000-568f-cba0-4faa-9f0f21a3cde7	5214	Kal nad Kanalom
00050000-568f-cba0-e63a-6e8ee65cf560	3233	Kalobje
00050000-568f-cba0-07c1-597166946b98	4246	Kamna Gorica
00050000-568f-cba0-2691-0b2d7730fe3a	2351	Kamnica
00050000-568f-cba0-6ba3-6e19144d9f5f	1241	Kamnik
00050000-568f-cba0-7e10-68bdbed14794	5213	Kanal
00050000-568f-cba0-4f79-5f164a2f739d	8258	Kapele
00050000-568f-cba0-cb88-e9a49f0c5120	2362	Kapla
00050000-568f-cba0-cf6c-501db4669f6e	2325	Kidričevo
00050000-568f-cba0-3236-66a3b9ad82eb	1412	Kisovec
00050000-568f-cba0-6aa0-06aa73c9f178	6253	Knežak
00050000-568f-cba0-0baf-f4416a9f391e	5222	Kobarid
00050000-568f-cba0-2896-2a852447d974	9227	Kobilje
00050000-568f-cba0-2538-5cb4153df511	1330	Kočevje
00050000-568f-cba0-9af4-69609e302d18	1338	Kočevska Reka
00050000-568f-cba0-7c7a-69b6a09ee46a	2276	Kog
00050000-568f-cba0-0718-70b4301fa3cb	5211	Kojsko
00050000-568f-cba0-f017-9b92e0a5b5de	6223	Komen
00050000-568f-cba0-348d-1c82e7f73392	1218	Komenda
00050000-568f-cba0-dbec-d225e553c591	6000	Koper/Capodistria 
00050000-568f-cba0-9ac7-a700098a1d83	6001	Koper/Capodistria - poštni predali
00050000-568f-cba0-b6c2-4b257aefec5d	8282	Koprivnica
00050000-568f-cba0-3163-b495bfdafd55	5296	Kostanjevica na Krasu
00050000-568f-cba0-8df1-c7ce8a775e53	8311	Kostanjevica na Krki
00050000-568f-cba0-22eb-1ccf8a6d4fec	1336	Kostel
00050000-568f-cba0-25c0-90ed435ee86f	6256	Košana
00050000-568f-cba0-0ee1-912aa4540d1b	2394	Kotlje
00050000-568f-cba0-7dd9-5a38067129cf	6240	Kozina
00050000-568f-cba0-8da8-8d54139e87b2	3260	Kozje
00050000-568f-cba0-0df0-0042c871d3bf	4000	Kranj 
00050000-568f-cba0-cd65-9b8e765ab476	4001	Kranj - poštni predali
00050000-568f-cba0-d9ee-f4c1ed77549d	4280	Kranjska Gora
00050000-568f-cba0-596b-3e22868993cb	1281	Kresnice
00050000-568f-cba0-2ba4-bd15ee07c5f1	4294	Križe
00050000-568f-cba0-45d4-640a192a5385	9206	Križevci
00050000-568f-cba0-dab2-fbb9bf3cc140	9242	Križevci pri Ljutomeru
00050000-568f-cba0-6192-c576d2cead3e	1301	Krka
00050000-568f-cba0-e32f-7be6fc89d37f	8296	Krmelj
00050000-568f-cba0-d77a-8d7bedf91f1b	4245	Kropa
00050000-568f-cba0-0472-7e85a9d70a4f	8262	Krška vas
00050000-568f-cba0-cc14-32c7a83a4319	8270	Krško
00050000-568f-cba0-897e-ce0592f106ef	9263	Kuzma
00050000-568f-cba0-1e1f-d7443feec986	2318	Laporje
00050000-568f-cba0-babc-da72caac159e	3270	Laško
00050000-568f-cba0-6f38-b340ae5291ba	1219	Laze v Tuhinju
00050000-568f-cba0-bf8d-ae48ab862e5d	2230	Lenart v Slovenskih goricah
00050000-568f-cba0-6aba-00bdf3fb4ad1	9220	Lendava/Lendva
00050000-568f-cba0-6184-67cf55828689	4248	Lesce
00050000-568f-cba0-dd81-c125d34bb284	3261	Lesično
00050000-568f-cba0-8e1a-0e32183921e1	8273	Leskovec pri Krškem
00050000-568f-cba0-8b5e-5d023825376f	2372	Libeliče
00050000-568f-cba0-c837-2e3f881c1df0	2341	Limbuš
00050000-568f-cba0-b53b-d1058bdf6aa5	1270	Litija
00050000-568f-cba0-d1b6-1b84f6490560	3202	Ljubečna
00050000-568f-cba0-4252-a774336397e2	1000	Ljubljana 
00050000-568f-cba0-c588-7c0bf645a57c	1001	Ljubljana - poštni predali
00050000-568f-cba0-6a8d-d0d2325efa53	1231	Ljubljana - Črnuče
00050000-568f-cba0-8749-06e9e925f4b4	1261	Ljubljana - Dobrunje
00050000-568f-cba0-3c1f-68c7ecaf145f	1260	Ljubljana - Polje
00050000-568f-cba0-d1ea-f60c63bf09e2	1210	Ljubljana - Šentvid
00050000-568f-cba0-d8ad-f605b8554512	1211	Ljubljana - Šmartno
00050000-568f-cba0-5e58-2cd903fe1133	3333	Ljubno ob Savinji
00050000-568f-cba0-27dd-ec141568e66b	9240	Ljutomer
00050000-568f-cba0-a329-fac579222032	3215	Loče
00050000-568f-cba0-c9f5-1086b7a93b3a	5231	Log pod Mangartom
00050000-568f-cba0-d209-8e30ad0719e3	1358	Log pri Brezovici
00050000-568f-cba0-a94e-68bfd41839a7	1370	Logatec
00050000-568f-cba0-0eaa-a3d31284c2e6	1371	Logatec
00050000-568f-cba0-2bd6-be900032e2a7	1434	Loka pri Zidanem Mostu
00050000-568f-cba0-2298-2f102be74e56	3223	Loka pri Žusmu
00050000-568f-cba0-df8a-377b025d6c9e	6219	Lokev
00050000-568f-cba0-4b3d-3d701c502bcb	1318	Loški Potok
00050000-568f-cba0-f2ac-e2037f3bfa83	2324	Lovrenc na Dravskem polju
00050000-568f-cba0-51b5-9ff9feccf4f6	2344	Lovrenc na Pohorju
00050000-568f-cba0-1df6-a92339d8a162	3334	Luče
00050000-568f-cba0-09d3-6e74a4606b92	1225	Lukovica
00050000-568f-cba0-efcc-ce3cd81df3a0	9202	Mačkovci
00050000-568f-cba0-1eae-cdef2c4fc9ff	2322	Majšperk
00050000-568f-cba0-a9eb-03cfbe3382f3	2321	Makole
00050000-568f-cba0-2871-e1e8e6b1f52c	9243	Mala Nedelja
00050000-568f-cba0-2133-7daa261ab165	2229	Malečnik
00050000-568f-cba0-7a12-99ca5c559c2a	6273	Marezige
00050000-568f-cba0-7e63-fb006f950cdd	2000	Maribor 
00050000-568f-cba0-de31-0b680c295561	2001	Maribor - poštni predali
00050000-568f-cba0-d190-83d5ca650ff8	2206	Marjeta na Dravskem polju
00050000-568f-cba0-ce8f-c92919f35065	2281	Markovci
00050000-568f-cba0-e405-f0c2dfec9e64	9221	Martjanci
00050000-568f-cba0-b15e-2960ff141a2f	6242	Materija
00050000-568f-cba0-fd80-68be1d4669f9	4211	Mavčiče
00050000-568f-cba0-3792-324cf418e701	1215	Medvode
00050000-568f-cba0-f2ce-0e062c06e11e	1234	Mengeš
00050000-568f-cba0-4fc1-34d6ea84da78	8330	Metlika
00050000-568f-cba0-dd15-dd6eb96a3a3e	2392	Mežica
00050000-568f-cba0-6983-ccbd622ac009	2204	Miklavž na Dravskem polju
00050000-568f-cba0-9e10-96bb59370602	2275	Miklavž pri Ormožu
00050000-568f-cba0-5061-837008cf6254	5291	Miren
00050000-568f-cba0-a5e7-ad8ded60be7e	8233	Mirna
00050000-568f-cba0-9f90-81f28b2040c2	8216	Mirna Peč
00050000-568f-cba0-542c-2e5364b0e982	2382	Mislinja
00050000-568f-cba0-d3a5-03096894e149	4281	Mojstrana
00050000-568f-cba0-17a4-a0eedf59d47c	8230	Mokronog
00050000-568f-cba0-9b82-ad498bf423f1	1251	Moravče
00050000-568f-cba0-f0bc-ac8385a3a112	9226	Moravske Toplice
00050000-568f-cba0-9c0a-8fa1caf049d0	5216	Most na Soči
00050000-568f-cba0-2c7b-6a7eb226328f	1221	Motnik
00050000-568f-cba0-c30f-fbe2349a331b	3330	Mozirje
00050000-568f-cba0-5b01-873d433ad306	9000	Murska Sobota 
00050000-568f-cba0-f794-4fe36b80455d	9001	Murska Sobota - poštni predali
00050000-568f-cba0-73e2-ac8fd2da9f0c	2366	Muta
00050000-568f-cba0-8b7a-2130fde2a5e5	4202	Naklo
00050000-568f-cba0-fa15-0d8ee61e09c7	3331	Nazarje
00050000-568f-cba0-5140-93656606f4e1	1357	Notranje Gorice
00050000-568f-cba0-1c4b-9161db417c2d	3203	Nova Cerkev
00050000-568f-cba0-929c-053afdf7cc70	5000	Nova Gorica 
00050000-568f-cba0-aeec-dc87b5a2b2ce	5001	Nova Gorica - poštni predali
00050000-568f-cba0-1ae4-1d98a5035011	1385	Nova vas
00050000-568f-cba0-f1cc-9ec4f6c37288	8000	Novo mesto
00050000-568f-cba0-6351-374ad92068da	8001	Novo mesto - poštni predali
00050000-568f-cba0-2cbc-1749c2de44bc	6243	Obrov
00050000-568f-cba0-da49-7f285ce52ced	9233	Odranci
00050000-568f-cba0-3391-497c508408c4	2317	Oplotnica
00050000-568f-cba0-6552-9107e4042429	2312	Orehova vas
00050000-568f-cba0-49c8-459288ae55bc	2270	Ormož
00050000-568f-cba0-4ada-d1bf76387624	1316	Ortnek
00050000-568f-cba0-0e36-9a6173b6c2e0	1337	Osilnica
00050000-568f-cba0-1852-c736adcfadc6	8222	Otočec
00050000-568f-cba0-9fae-382ddde8af16	2361	Ožbalt
00050000-568f-cba0-fcda-89e3125e161a	2231	Pernica
00050000-568f-cba0-8d20-995a265eea31	2211	Pesnica pri Mariboru
00050000-568f-cba0-734c-55d3b3fe08bb	9203	Petrovci
00050000-568f-cba0-ac41-5467f6a943f3	3301	Petrovče
00050000-568f-cba0-b2f6-2925fc5a50ec	6330	Piran/Pirano
00050000-568f-cba0-2e75-b0a2484e9053	8255	Pišece
00050000-568f-cba0-da03-89ea24ecec1f	6257	Pivka
00050000-568f-cba0-e347-9b3bc56430f8	6232	Planina
00050000-568f-cba0-aa28-19848ca838dc	3225	Planina pri Sevnici
00050000-568f-cba0-d575-cb9893f2fd14	6276	Pobegi
00050000-568f-cba0-6e99-f20f2e4d68d7	8312	Podbočje
00050000-568f-cba0-3d84-1ecb661a66c2	5243	Podbrdo
00050000-568f-cba0-0eb5-a243ae26d3bf	3254	Podčetrtek
00050000-568f-cba0-37ad-678d57854c77	2273	Podgorci
00050000-568f-cba0-a1d2-273fe350704c	6216	Podgorje
00050000-568f-cba0-2468-14441fd583be	2381	Podgorje pri Slovenj Gradcu
00050000-568f-cba0-cb85-6609ad607db8	6244	Podgrad
00050000-568f-cba0-6cb0-9d4585f78f66	1414	Podkum
00050000-568f-cba0-5c56-bf468cc988e2	2286	Podlehnik
00050000-568f-cba0-50cc-de03234556ae	5272	Podnanos
00050000-568f-cba0-4356-83d25bc0152f	4244	Podnart
00050000-568f-cba0-7903-a166cc40ca3f	3241	Podplat
00050000-568f-cba0-5ec0-60c9526593cd	3257	Podsreda
00050000-568f-cba0-ef7f-932b72d2e2f4	2363	Podvelka
00050000-568f-cba0-57b3-328a6c94cf37	2208	Pohorje
00050000-568f-cba0-cd78-d978db23fbda	2257	Polenšak
00050000-568f-cba0-1f07-d75a69a1602f	1355	Polhov Gradec
00050000-568f-cba0-51f6-a836b1c66614	4223	Poljane nad Škofjo Loko
00050000-568f-cba0-faad-3b0128de79b6	2319	Poljčane
00050000-568f-cba0-a8f2-911d33b24096	1272	Polšnik
00050000-568f-cba0-efb6-0270c061f0f2	3313	Polzela
00050000-568f-cba0-096e-e5313d624932	3232	Ponikva
00050000-568f-cba0-9aae-87b12c627fa3	6320	Portorož/Portorose
00050000-568f-cba0-84bb-0841bda0a9d7	6230	Postojna
00050000-568f-cba0-ff6a-cf82528d1c0e	2331	Pragersko
00050000-568f-cba0-4161-ec1c0567e768	3312	Prebold
00050000-568f-cba0-490e-5227a9f3ab64	4205	Preddvor
00050000-568f-cba0-d9e7-8edc9a15b539	6255	Prem
00050000-568f-cba0-b77b-61567e7f1185	1352	Preserje
00050000-568f-cba0-2323-5d53d386dfa8	6258	Prestranek
00050000-568f-cba0-d1c5-a497ebea0bd2	2391	Prevalje
00050000-568f-cba0-3f0f-edf07ce090b2	3262	Prevorje
00050000-568f-cba0-311e-c36b06693e05	1276	Primskovo 
00050000-568f-cba0-a4d6-d107eeaf2131	3253	Pristava pri Mestinju
00050000-568f-cba0-3b0f-5c1c378aa7b3	9207	Prosenjakovci/Partosfalva
00050000-568f-cba0-7348-c6ef05767af7	5297	Prvačina
00050000-568f-cba0-28e5-229b5a62467e	2250	Ptuj
00050000-568f-cba0-6833-59185397aa23	2323	Ptujska Gora
00050000-568f-cba0-2e89-5755e743a21b	9201	Puconci
00050000-568f-cba0-c23f-2370b55a4c3c	2327	Rače
00050000-568f-cba0-7925-3a4ca4cbb742	1433	Radeče
00050000-568f-cba0-017b-12952594a4a6	9252	Radenci
00050000-568f-cba0-82f7-80cde9b69949	2360	Radlje ob Dravi
00050000-568f-cba0-d46f-7f583ddf2835	1235	Radomlje
00050000-568f-cba0-c780-1b8e9c7e1cf5	4240	Radovljica
00050000-568f-cba0-05d1-b0745ebe82af	8274	Raka
00050000-568f-cba0-f4e0-72032d29e122	1381	Rakek
00050000-568f-cba0-9951-4edef7f09867	4283	Rateče - Planica
00050000-568f-cba0-a177-535a867c0ed1	2390	Ravne na Koroškem
00050000-568f-cba0-db5f-639e24d51666	9246	Razkrižje
00050000-568f-cba0-bc97-7481af041f89	3332	Rečica ob Savinji
00050000-568f-cba0-dc98-b319ab819f35	5292	Renče
00050000-568f-cba0-b067-9139459e4bb9	1310	Ribnica
00050000-568f-cba0-2e5d-795c0e172810	2364	Ribnica na Pohorju
00050000-568f-cba0-2983-f0b92cce84a9	3272	Rimske Toplice
00050000-568f-cba0-baeb-c9467cf21951	1314	Rob
00050000-568f-cba0-542e-c1f852bba3cd	5215	Ročinj
00050000-568f-cba0-6562-05fa1d298c3a	3250	Rogaška Slatina
00050000-568f-cba0-df7d-82d57b824d2f	9262	Rogašovci
00050000-568f-cba0-3170-93b8514f39b6	3252	Rogatec
00050000-568f-cba0-6d2d-7526e771ba06	1373	Rovte
00050000-568f-cba0-1466-e03a353bfd9d	2342	Ruše
00050000-568f-cba0-5e98-3a6180ca5886	1282	Sava
00050000-568f-cba0-040d-1b1622a3f953	6333	Sečovlje/Sicciole
00050000-568f-cba0-b54e-69c734eb1723	4227	Selca
00050000-568f-cba0-b608-44f8386f7be6	2352	Selnica ob Dravi
00050000-568f-cba0-1cdb-d7a133c3ffb0	8333	Semič
00050000-568f-cba0-53ba-31a679fe42ca	8281	Senovo
00050000-568f-cba0-f400-1c2a726926a4	6224	Senožeče
00050000-568f-cba0-1acf-ed3b3272493a	8290	Sevnica
00050000-568f-cba0-e556-e1678dac9f05	6210	Sežana
00050000-568f-cba0-8974-73e1dff007b9	2214	Sladki Vrh
00050000-568f-cba0-5fe1-7c6d69a7d8ec	5283	Slap ob Idrijci
00050000-568f-cba0-499e-920a28351d54	2380	Slovenj Gradec
00050000-568f-cba0-6e93-0f50e13b2f8e	2310	Slovenska Bistrica
00050000-568f-cba0-ec90-6d2421c9e326	3210	Slovenske Konjice
00050000-568f-cba0-f651-add463760a44	1216	Smlednik
00050000-568f-cba0-2904-3b47846ce953	5232	Soča
00050000-568f-cba0-9f0d-0716ebbb5b94	1317	Sodražica
00050000-568f-cba0-32b5-2188cab2179f	3335	Solčava
00050000-568f-cba0-163f-4fbbd59acd9b	5250	Solkan
00050000-568f-cba0-45ad-1d5e87730beb	4229	Sorica
00050000-568f-cba0-7fb6-2491f9e789ae	4225	Sovodenj
00050000-568f-cba0-f665-28b40f240887	5281	Spodnja Idrija
00050000-568f-cba0-34f5-4c8c765818f0	2241	Spodnji Duplek
00050000-568f-cba0-6ba0-41e14bb815a3	9245	Spodnji Ivanjci
00050000-568f-cba0-9e99-2bcb46d16aea	2277	Središče ob Dravi
00050000-568f-cba0-02de-c1b4e5008934	4267	Srednja vas v Bohinju
00050000-568f-cba0-e71d-97eb445d6654	8256	Sromlje 
00050000-568f-cba0-9424-0c331298443e	5224	Srpenica
00050000-568f-cba0-fb53-410393df6998	1242	Stahovica
00050000-568f-cba0-1914-dbfca7ccf28b	1332	Stara Cerkev
00050000-568f-cba0-34b3-a46a9425163f	8342	Stari trg ob Kolpi
00050000-568f-cba0-a2db-81741311c4a3	1386	Stari trg pri Ložu
00050000-568f-cba0-dcf2-8b6a0f574b87	2205	Starše
00050000-568f-cba0-fa10-5fc018062407	2289	Stoperce
00050000-568f-cba0-e2ab-688ecd90499d	8322	Stopiče
00050000-568f-cba0-f48b-e9103ec3a6b2	3206	Stranice
00050000-568f-cba0-318f-e7ff6b8a23ad	8351	Straža
00050000-568f-cba0-8285-bb3e3dba388c	1313	Struge
00050000-568f-cba0-3f36-2ce2648c9bc0	8293	Studenec
00050000-568f-cba0-8453-b3bd26078443	8331	Suhor
00050000-568f-cba0-2b2c-9a46211b8b70	2233	Sv. Ana v Slovenskih goricah
00050000-568f-cba0-64c6-1104ec28b0d8	2235	Sv. Trojica v Slovenskih goricah
00050000-568f-cba0-2875-36b00912d3ca	2353	Sveti Duh na Ostrem Vrhu
00050000-568f-cba0-56a5-9ad2d16c5f44	9244	Sveti Jurij ob Ščavnici
00050000-568f-cba0-6997-f0144c8a17a1	3264	Sveti Štefan
00050000-568f-cba0-0c06-79fd19d3c775	2258	Sveti Tomaž
00050000-568f-cba0-1648-da17109558b4	9204	Šalovci
00050000-568f-cba0-9692-4d78528922d7	5261	Šempas
00050000-568f-cba0-2790-8a6f036d3ad2	5290	Šempeter pri Gorici
00050000-568f-cba0-a381-54074a453c76	3311	Šempeter v Savinjski dolini
00050000-568f-cba0-ed89-d72990baedc7	4208	Šenčur
00050000-568f-cba0-9df0-668fe7f0019a	2212	Šentilj v Slovenskih goricah
00050000-568f-cba0-e339-e4830a9e3d69	8297	Šentjanž
00050000-568f-cba0-1e52-a955d045205e	2373	Šentjanž pri Dravogradu
00050000-568f-cba0-f2cb-df2d4673607b	8310	Šentjernej
00050000-568f-cba0-99b7-2ccbcd373b35	3230	Šentjur
00050000-568f-cba0-97bd-980e4c6f8d9b	3271	Šentrupert
00050000-568f-cba0-0609-46780f066e23	8232	Šentrupert
00050000-568f-cba0-3ce8-4f200ea2c2c0	1296	Šentvid pri Stični
00050000-568f-cba0-d67d-ee5c6ded2cb4	8275	Škocjan
00050000-568f-cba0-0289-f0509fe95dcb	6281	Škofije
00050000-568f-cba0-dcca-b5a19ac795f0	4220	Škofja Loka
00050000-568f-cba0-b80d-118dffaa5f58	3211	Škofja vas
00050000-568f-cba0-2703-e5b6033bf512	1291	Škofljica
00050000-568f-cba0-b561-33c840d3671a	6274	Šmarje
00050000-568f-cba0-cc70-ee44847aff20	1293	Šmarje - Sap
00050000-568f-cba0-4c89-e3fc1a06e0e8	3240	Šmarje pri Jelšah
00050000-568f-cba0-4333-4c2e1fc3b0b7	8220	Šmarješke Toplice
00050000-568f-cba0-9159-8a9685ec754c	2315	Šmartno na Pohorju
00050000-568f-cba0-1f8a-8a4cb8ab1344	3341	Šmartno ob Dreti
00050000-568f-cba0-f650-a341ed202fcd	3327	Šmartno ob Paki
00050000-568f-cba0-9d07-baf6bc77b9ca	1275	Šmartno pri Litiji
00050000-568f-cba0-6c4a-0200b45d2674	2383	Šmartno pri Slovenj Gradcu
00050000-568f-cba0-7212-2258a07eeabe	3201	Šmartno v Rožni dolini
00050000-568f-cba0-c5bc-05f9344b6df2	3325	Šoštanj
00050000-568f-cba0-a32a-1d8794777b9d	6222	Štanjel
00050000-568f-cba0-e805-990f313634a3	3220	Štore
00050000-568f-cba0-5979-a19aa7085905	3304	Tabor
00050000-568f-cba0-b722-35687171d849	3221	Teharje
00050000-568f-cba0-d520-6e58153de9cf	9251	Tišina
00050000-568f-cba0-3b87-08f2c8fcaf0a	5220	Tolmin
00050000-568f-cba0-ba68-d24f9cc74584	3326	Topolšica
00050000-568f-cba0-6612-8076a4c8d758	2371	Trbonje
00050000-568f-cba0-2d19-6968e0c5dbf0	1420	Trbovlje
00050000-568f-cba0-a51e-7ee49dbf028b	8231	Trebelno 
00050000-568f-cba0-cef7-d3b750f3ffef	8210	Trebnje
00050000-568f-cba0-62d3-f4188580e17f	5252	Trnovo pri Gorici
00050000-568f-cba0-8e7f-8ff516bc9a03	2254	Trnovska vas
00050000-568f-cba0-1761-675a0093f6a4	1222	Trojane
00050000-568f-cba0-b0c0-d54901d4a4cd	1236	Trzin
00050000-568f-cba0-6949-70e8797c4636	4290	Tržič
00050000-568f-cba0-6e89-b045cebd8d05	8295	Tržišče
00050000-568f-cba0-2262-01e14abc73b1	1311	Turjak
00050000-568f-cba0-6bfd-d843663cfe25	9224	Turnišče
00050000-568f-cba0-3063-d65d111e9287	8323	Uršna sela
00050000-568f-cba0-b585-02c360a4d76b	1252	Vače
00050000-568f-cba0-c62f-1dc22a5334ae	3320	Velenje 
00050000-568f-cba0-48eb-9a291c57dd93	3322	Velenje - poštni predali
00050000-568f-cba0-b063-c39b2de38730	8212	Velika Loka
00050000-568f-cba0-eb64-a027092994ed	2274	Velika Nedelja
00050000-568f-cba0-d62c-5661f0e0ee54	9225	Velika Polana
00050000-568f-cba0-e697-f2290a1f02c4	1315	Velike Lašče
00050000-568f-cba0-3ac1-a96c0ed0a72c	8213	Veliki Gaber
00050000-568f-cba0-29f5-d19c16072bd8	9241	Veržej
00050000-568f-cba0-cb78-2aafb41ae40a	1312	Videm - Dobrepolje
00050000-568f-cba0-0219-de09fc4b6217	2284	Videm pri Ptuju
00050000-568f-cba0-883c-30a4ec556ebc	8344	Vinica
00050000-568f-cba0-33c2-d1a958d1ce0c	5271	Vipava
00050000-568f-cba0-455e-cf44050ffb10	4212	Visoko
00050000-568f-cba0-2471-0e6aa21fb37e	1294	Višnja Gora
00050000-568f-cba0-1e05-d7026c8a4267	3205	Vitanje
00050000-568f-cba0-a313-b24bd958f7d0	2255	Vitomarci
00050000-568f-cba0-82ad-63dd56cbae2b	1217	Vodice
00050000-568f-cba0-b58b-94ab8ca90a7b	3212	Vojnik\t
00050000-568f-cba0-a630-98b93b7336a3	5293	Volčja Draga
00050000-568f-cba0-de4c-d8c8b77d1946	2232	Voličina
00050000-568f-cba0-3598-3d03da087667	3305	Vransko
00050000-568f-cba0-2699-a3b96eef7197	6217	Vremski Britof
00050000-568f-cba0-a770-d6cd85b8eebd	1360	Vrhnika
00050000-568f-cba0-876b-c88835ab402e	2365	Vuhred
00050000-568f-cba0-e5e6-1fb66e232dbe	2367	Vuzenica
00050000-568f-cba0-604f-affe6d1ac9cf	8292	Zabukovje 
00050000-568f-cba0-e1c0-20ff8aa25705	1410	Zagorje ob Savi
00050000-568f-cba0-c2fd-c422dd40d1a7	1303	Zagradec
00050000-568f-cba0-ca57-94ce13bfea28	2283	Zavrč
00050000-568f-cba0-9014-e9793616c3aa	8272	Zdole 
00050000-568f-cba0-9d43-9f74e0c4dc76	4201	Zgornja Besnica
00050000-568f-cba0-acf3-38097d3befad	2242	Zgornja Korena
00050000-568f-cba0-5bfc-8bfeb63b7d74	2201	Zgornja Kungota
00050000-568f-cba0-6ee3-1947c95f2b0d	2316	Zgornja Ložnica
00050000-568f-cba0-7397-ed47754d90eb	2314	Zgornja Polskava
00050000-568f-cba0-6756-581944b00d91	2213	Zgornja Velka
00050000-568f-cba0-2817-c386cb1d3571	4247	Zgornje Gorje
00050000-568f-cba0-6f6a-4372477a5aad	4206	Zgornje Jezersko
00050000-568f-cba0-4c77-d44c461bc431	2285	Zgornji Leskovec
00050000-568f-cba0-35a3-768b4a085514	1432	Zidani Most
00050000-568f-cba0-4c27-87cd0c7111e5	3214	Zreče
00050000-568f-cba0-6004-8d3cff087c8c	4209	Žabnica
00050000-568f-cba0-431f-e4643697c537	3310	Žalec
00050000-568f-cba0-88cd-ab7a97ab1f9b	4228	Železniki
00050000-568f-cba0-898b-d0ca8adb19f5	2287	Žetale
00050000-568f-cba0-6f6f-8779a5e232e9	4226	Žiri
00050000-568f-cba0-fa6e-f106ebbf458a	4274	Žirovnica
00050000-568f-cba0-f5f6-f2bfa211896d	8360	Žužemberk
\.


--
-- TOC entry 3194 (class 0 OID 34768071)
-- Dependencies: 242
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 34767639)
-- Dependencies: 215
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 34767370)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-568f-cba4-c8d5-56e4f8debcf1	00080000-568f-cba4-45c4-0a6f355c065a	\N	00040000-568f-cba0-0177-967aa8001d78	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-568f-cba4-9d17-cf1ccbcae714	00080000-568f-cba4-45c4-0a6f355c065a	\N	00040000-568f-cba0-0177-967aa8001d78	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-568f-cba4-b4eb-b162a91f44d4	00080000-568f-cba4-b085-ba5ff413b998	\N	00040000-568f-cba0-0177-967aa8001d78	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3154 (class 0 OID 34767514)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-568f-cba1-30fa-9f20c29d3b89	novo leto	1	1	\N	t
00430000-568f-cba1-8ed0-f8e427828870	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-568f-cba1-831f-f51067e78ab8	dan upora proti okupatorju	27	4	\N	t
00430000-568f-cba1-cded-1931be0dc3b7	praznik dela	1	5	\N	t
00430000-568f-cba1-6381-ed836924948c	praznik dela	2	5	\N	t
00430000-568f-cba1-1b9d-a51c637890dd	dan Primoža Trubarja	8	6	\N	f
00430000-568f-cba1-17b4-d0ff2c3b2aa7	dan državnosti	25	6	\N	t
00430000-568f-cba1-3aaa-f26d5e75454d	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-568f-cba1-1305-fdc998728c5f	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-568f-cba1-6e32-11b3c3390bfe	dan suverenosti	25	10	\N	f
00430000-568f-cba1-7453-c6ebf7ebd863	dan spomina na mrtve	1	11	\N	t
00430000-568f-cba1-d522-176da13a559e	dan Rudolfa Maistra	23	11	\N	f
00430000-568f-cba1-4d6d-8bd4e87ae4dc	božič	25	12	\N	t
00430000-568f-cba1-26e2-e9e96fe2900e	dan samostojnosti in enotnosti	26	12	\N	t
00430000-568f-cba1-b651-8dea6835c7e5	Marijino vnebovzetje	15	8	\N	t
00430000-568f-cba1-2439-d8a267c6cc6f	dan reformacije	31	10	\N	t
00430000-568f-cba1-aaea-d60d2dc5bc1a	velikonočna nedelja	27	3	2016	t
00430000-568f-cba1-d289-5e5410e1f9be	velikonočna nedelja	16	4	2017	t
00430000-568f-cba1-1fad-5193c84013ce	velikonočna nedelja	1	4	2018	t
00430000-568f-cba1-7ad0-a3b639842e90	velikonočna nedelja	21	4	2019	t
00430000-568f-cba1-2ba8-8b150854f46f	velikonočna nedelja	12	4	2020	t
00430000-568f-cba1-c231-2ded5afc354c	velikonočna nedelja	4	4	2021	t
00430000-568f-cba1-3263-2fdb948ef406	velikonočna nedelja	17	4	2022	t
00430000-568f-cba1-8286-06efaf726aff	velikonočna nedelja	9	4	2023	t
00430000-568f-cba1-c708-b9d4e8566559	velikonočna nedelja	31	3	2024	t
00430000-568f-cba1-67bf-96913fc3ef67	velikonočna nedelja	20	4	2025	t
00430000-568f-cba1-8040-ab06477c16b2	velikonočna nedelja	5	4	2026	t
00430000-568f-cba1-63b1-2b1128a0336b	velikonočna nedelja	28	3	2027	t
00430000-568f-cba1-ec20-c0afb7d53eeb	velikonočna nedelja	16	4	2028	t
00430000-568f-cba1-e1d6-1e721b19db48	velikonočna nedelja	1	4	2029	t
00430000-568f-cba1-6adf-b78ac519f2bf	velikonočna nedelja	21	4	2030	t
00430000-568f-cba1-2215-5f3eb4ab7ae7	velikonočni ponedeljek	28	3	2016	t
00430000-568f-cba1-2ce3-c1b3896a11e3	velikonočni ponedeljek	17	4	2017	t
00430000-568f-cba1-2c50-b38c3c2b8c4c	velikonočni ponedeljek	2	4	2018	t
00430000-568f-cba1-88b8-2507dae81a71	velikonočni ponedeljek	22	4	2019	t
00430000-568f-cba1-cbf8-6daa2837ab7d	velikonočni ponedeljek	13	4	2020	t
00430000-568f-cba1-ca3b-267d88493df4	velikonočni ponedeljek	5	4	2021	t
00430000-568f-cba1-c986-144be6f32727	velikonočni ponedeljek	18	4	2022	t
00430000-568f-cba1-7640-7626e0e7b818	velikonočni ponedeljek	10	4	2023	t
00430000-568f-cba1-7129-4eaf24323f1c	velikonočni ponedeljek	1	4	2024	t
00430000-568f-cba1-f3c1-5d0ea7a7b681	velikonočni ponedeljek	21	4	2025	t
00430000-568f-cba1-f681-d06a312ab14a	velikonočni ponedeljek	6	4	2026	t
00430000-568f-cba1-29de-18f3994c14df	velikonočni ponedeljek	29	3	2027	t
00430000-568f-cba1-b897-89c9ddd62bd8	velikonočni ponedeljek	17	4	2028	t
00430000-568f-cba1-6001-e9fa20af15e8	velikonočni ponedeljek	2	4	2029	t
00430000-568f-cba1-3ca8-ee31b8e750e3	velikonočni ponedeljek	22	4	2030	t
00430000-568f-cba1-0e07-de23563e8269	binkoštna nedelja - binkošti	15	5	2016	t
00430000-568f-cba1-d0bc-5dcb7ab8a647	binkoštna nedelja - binkošti	4	6	2017	t
00430000-568f-cba1-ed3f-9a7f513848f8	binkoštna nedelja - binkošti	20	5	2018	t
00430000-568f-cba1-6bf1-889aef8e51bb	binkoštna nedelja - binkošti	9	6	2019	t
00430000-568f-cba1-d459-c84d0c6d3616	binkoštna nedelja - binkošti	31	5	2020	t
00430000-568f-cba1-ff60-06f4b22bc081	binkoštna nedelja - binkošti	23	5	2021	t
00430000-568f-cba1-124b-207e010b3ac4	binkoštna nedelja - binkošti	5	6	2022	t
00430000-568f-cba1-6c62-3a0257982814	binkoštna nedelja - binkošti	28	5	2023	t
00430000-568f-cba1-991a-19690ebcebcc	binkoštna nedelja - binkošti	19	5	2024	t
00430000-568f-cba1-c705-bd7431282bc0	binkoštna nedelja - binkošti	8	6	2025	t
00430000-568f-cba1-62ae-c876cc9a66c8	binkoštna nedelja - binkošti	24	5	2026	t
00430000-568f-cba1-18d9-fe863eda1784	binkoštna nedelja - binkošti	16	5	2027	t
00430000-568f-cba1-a5a0-af9a722693f6	binkoštna nedelja - binkošti	4	6	2028	t
00430000-568f-cba1-62ec-2df665aebd66	binkoštna nedelja - binkošti	20	5	2029	t
00430000-568f-cba1-2c75-fe7cf4cf95a6	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3150 (class 0 OID 34767474)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 34767486)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 34767651)
-- Dependencies: 217
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 34768085)
-- Dependencies: 243
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 34768095)
-- Dependencies: 244
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-568f-cba4-2afe-cbffb8e0c0c7	00080000-568f-cba4-0465-c2ae7401ad24	0987	AK
00190000-568f-cba4-5816-241de1db3c38	00080000-568f-cba4-b085-ba5ff413b998	0989	AK
00190000-568f-cba4-5032-e9fb8bb92d6d	00080000-568f-cba4-3661-aa05d903fc5a	0986	AK
00190000-568f-cba4-1e58-e501d4de65dd	00080000-568f-cba4-b2d3-70207367a664	0984	AK
00190000-568f-cba4-8206-b726523e6958	00080000-568f-cba4-6510-11b2528bb03f	0983	AK
00190000-568f-cba4-c2d7-afa19ebba628	00080000-568f-cba4-55ec-dfbc39a1e646	0982	AK
00190000-568f-cba6-9904-26c995efd5fd	00080000-568f-cba6-497a-5ae7d56f8065	1001	AK
\.


--
-- TOC entry 3193 (class 0 OID 34767984)
-- Dependencies: 241
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-568f-cba4-a113-faa683b84214	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3197 (class 0 OID 34768103)
-- Dependencies: 245
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 34767680)
-- Dependencies: 221
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-568f-cba3-a1e7-4c36755cbf35	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-568f-cba3-81f5-f9444c8a7dce	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-568f-cba3-387f-3aa324811879	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-568f-cba3-4e56-4e19ffbb0d48	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-568f-cba3-8030-132e90b069f2	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-568f-cba3-d8d8-222fad7f95d8	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-568f-cba3-ca4c-d425b06e7fb8	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3165 (class 0 OID 34767624)
-- Dependencies: 213
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 34767614)
-- Dependencies: 212
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 34767822)
-- Dependencies: 234
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 34767752)
-- Dependencies: 228
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 34767448)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 34767210)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-568f-cba6-497a-5ae7d56f8065	00010000-568f-cba2-cbc3-1227542d6a58	2016-01-08 15:45:58	INS	a:0:{}
2	App\\Entity\\Option	00000000-568f-cba6-1635-99765fffd93a	00010000-568f-cba2-cbc3-1227542d6a58	2016-01-08 15:45:58	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-568f-cba6-9904-26c995efd5fd	00010000-568f-cba2-cbc3-1227542d6a58	2016-01-08 15:45:58	INS	a:0:{}
\.


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3174 (class 0 OID 34767693)
-- Dependencies: 222
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 34767248)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-568f-cba1-32bc-0577d9566385	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-568f-cba1-11ce-7ac1efddf313	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-568f-cba1-884b-789a468424e9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-568f-cba1-35ec-07494fc94132	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-568f-cba1-ff08-f3b469f761a5	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-568f-cba1-8fbe-23f3756444be	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-568f-cba1-d719-7017c22542cf	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-568f-cba1-0cc1-2d9a2eff2113	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-568f-cba1-e8f3-5320fd19b394	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-568f-cba1-ade0-4681097df694	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-568f-cba1-468d-0413a80871df	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-568f-cba1-291f-85480e7b17e4	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-568f-cba1-c3da-b0ac5dff4d36	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-568f-cba1-bb9f-8d36c37adc73	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-568f-cba1-8ac9-6739902dd664	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-568f-cba1-61f7-7740f74f01bc	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-568f-cba1-279d-79e0bee5f65b	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-568f-cba1-237d-c6d7461e4c51	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-568f-cba1-9234-9352d6eab4f7	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-568f-cba1-585b-27f102f65f85	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-568f-cba1-b187-b8c2827e890c	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-568f-cba1-da22-0b01f4080636	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-568f-cba1-e0e2-c0547faca3c1	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-568f-cba1-01c1-524e21cc1baf	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-568f-cba1-29e6-c48da4749d3e	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-568f-cba1-6706-ffa0026d9138	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-568f-cba1-04d4-ec792bcd5699	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-568f-cba1-50cd-1530f8dfa82c	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-568f-cba1-67f6-065a0c2b3663	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-568f-cba1-d844-c244d5286bc8	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-568f-cba1-0f71-d24724344b72	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-568f-cba1-50fe-a61b40238462	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-568f-cba1-134d-f66b21331a06	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-568f-cba1-f054-020d963a800b	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-568f-cba1-435c-b51ff46c9174	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-568f-cba1-3a2e-d1d83fbf1384	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-568f-cba1-7a67-90cf1aee5556	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-568f-cba1-bc3a-d3be71619377	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-568f-cba1-7dae-97f1fc197818	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-568f-cba1-40be-cf5df8d7b4b0	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-568f-cba1-60d2-e01dfde8eb74	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-568f-cba1-866c-2a81322c571a	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-568f-cba1-7356-f4c5a65e0c06	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-568f-cba1-6c6e-fdbecd4e5872	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-568f-cba1-ebff-82fdfc3afee5	direktor	minimalne pravice za direktorja	t
00020000-568f-cba1-03ba-0f90979965ef	arhivar	arhivar	t
00020000-568f-cba1-48a6-848db6e444e1	dramaturg	dramaturg	t
00020000-568f-cba1-94b6-493804c33389	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-568f-cba1-7c9e-5dd0ec6c5d49	poslovni-sekretar	poslovni sekretar	t
00020000-568f-cba1-1f11-9ae86f90bae5	vodja-tehnike	vodja tehnike	t
00020000-568f-cba1-9c54-c2d8a3dec1d6	racunovodja	računovodja	t
00020000-568f-cba3-0956-e76e937233d5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-568f-cba3-7f66-948d4de07b98	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-4e77-28f43a7fea88	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-67f7-0a819189cba0	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-d104-6a6e9cb57245	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-ba77-e90661234d18	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-747c-70e436c4e03e	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-7f5d-4649fe1ce298	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-e4cc-f414b5b072fe	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-cfa5-eefa35b790db	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-d1ce-78a0207e4a47	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-e656-18b7b5c42a62	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-51c8-0638fbfe67e1	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-4125-29324d49e161	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-c570-b389678477f7	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-4545-c28c5ae4be28	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-c4a6-67b9ef12c23c	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-d9ab-8165681ee3f9	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-37e0-fb9da28a5fcf	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-e783-7f8d2084b52d	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-568f-cba3-8aeb-b6c92931edc8	Trr-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-8624-3d0b6654b74f	Trr-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-751a-608214bdbd84	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-be7e-8e3a4b3b4946	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-9963-9d44bbe4dfcc	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-b723-755ed4edc80c	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-dfea-e607e3c34aad	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-b1d2-47e8d3a12f38	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-bdb8-c2a49474de4b	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-84ab-cb6426fea533	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-23c4-cbff2a694676	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-3cb6-c08964137226	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-3f99-81ba35fb2686	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-6422-99ad6b8fbfae	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-1acc-d263883f3f9e	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-34b0-6441fab199e4	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-15db-38f7fb0e940e	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-4726-cc22715a1d5d	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-568f-cba3-7802-25e3f9999ef2	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3129 (class 0 OID 34767232)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-568f-cba2-abd1-a0e4457a5191	00020000-568f-cba1-884b-789a468424e9
00010000-568f-cba2-cbc3-1227542d6a58	00020000-568f-cba1-884b-789a468424e9
00010000-568f-cba3-18b8-4a92fb025517	00020000-568f-cba3-0956-e76e937233d5
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-7f66-948d4de07b98
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-ba77-e90661234d18
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-cfa5-eefa35b790db
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-e656-18b7b5c42a62
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-4125-29324d49e161
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-37e0-fb9da28a5fcf
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-67f7-0a819189cba0
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-8aeb-b6c92931edc8
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-be7e-8e3a4b3b4946
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-b723-755ed4edc80c
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-b1d2-47e8d3a12f38
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-84ab-cb6426fea533
00010000-568f-cba4-3995-e127a92ec4f3	00020000-568f-cba3-6422-99ad6b8fbfae
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-7f66-948d4de07b98
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-4e77-28f43a7fea88
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-67f7-0a819189cba0
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-d104-6a6e9cb57245
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-4125-29324d49e161
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-c4a6-67b9ef12c23c
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-8aeb-b6c92931edc8
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-be7e-8e3a4b3b4946
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-b723-755ed4edc80c
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-b1d2-47e8d3a12f38
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-84ab-cb6426fea533
00010000-568f-cba4-d770-9806547fecd1	00020000-568f-cba3-6422-99ad6b8fbfae
00010000-568f-cba4-2abc-4556e517b7b1	00020000-568f-cba3-7f66-948d4de07b98
00010000-568f-cba4-2abc-4556e517b7b1	00020000-568f-cba3-4e77-28f43a7fea88
00010000-568f-cba4-2abc-4556e517b7b1	00020000-568f-cba3-67f7-0a819189cba0
00010000-568f-cba4-2abc-4556e517b7b1	00020000-568f-cba3-d104-6a6e9cb57245
00010000-568f-cba4-2abc-4556e517b7b1	00020000-568f-cba3-e656-18b7b5c42a62
00010000-568f-cba4-2abc-4556e517b7b1	00020000-568f-cba3-4125-29324d49e161
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-4e77-28f43a7fea88
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-747c-70e436c4e03e
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-d1ce-78a0207e4a47
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-51c8-0638fbfe67e1
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-e656-18b7b5c42a62
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-d9ab-8165681ee3f9
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-4125-29324d49e161
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-c570-b389678477f7
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-8aeb-b6c92931edc8
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-8624-3d0b6654b74f
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-be7e-8e3a4b3b4946
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-9963-9d44bbe4dfcc
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-b723-755ed4edc80c
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-dfea-e607e3c34aad
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-b1d2-47e8d3a12f38
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-bdb8-c2a49474de4b
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-84ab-cb6426fea533
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-23c4-cbff2a694676
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-6422-99ad6b8fbfae
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-1acc-d263883f3f9e
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-15db-38f7fb0e940e
00010000-568f-cba4-78bb-986446e37f9d	00020000-568f-cba3-4726-cc22715a1d5d
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-4e77-28f43a7fea88
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-747c-70e436c4e03e
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-e4cc-f414b5b072fe
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-d1ce-78a0207e4a47
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-51c8-0638fbfe67e1
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-e656-18b7b5c42a62
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-d9ab-8165681ee3f9
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-4125-29324d49e161
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-c570-b389678477f7
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-4545-c28c5ae4be28
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-8aeb-b6c92931edc8
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-8624-3d0b6654b74f
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-751a-608214bdbd84
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-be7e-8e3a4b3b4946
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-9963-9d44bbe4dfcc
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-b723-755ed4edc80c
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-dfea-e607e3c34aad
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-b1d2-47e8d3a12f38
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-bdb8-c2a49474de4b
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-84ab-cb6426fea533
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-23c4-cbff2a694676
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-6422-99ad6b8fbfae
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-1acc-d263883f3f9e
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-34b0-6441fab199e4
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-15db-38f7fb0e940e
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-4726-cc22715a1d5d
00010000-568f-cba4-1c1e-bd72e6c62697	00020000-568f-cba3-7802-25e3f9999ef2
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-4e77-28f43a7fea88
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-67f7-0a819189cba0
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-747c-70e436c4e03e
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-7f5d-4649fe1ce298
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-e4cc-f414b5b072fe
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-ba77-e90661234d18
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-d1ce-78a0207e4a47
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-51c8-0638fbfe67e1
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-e656-18b7b5c42a62
00010000-568f-cba4-02f7-6fba7d2c69cd	00020000-568f-cba3-d9ab-8165681ee3f9
00010000-568f-cba4-26ee-225cd07b8def	00020000-568f-cba3-7f66-948d4de07b98
00010000-568f-cba4-26ee-225cd07b8def	00020000-568f-cba3-d104-6a6e9cb57245
00010000-568f-cba4-26ee-225cd07b8def	00020000-568f-cba3-ba77-e90661234d18
00010000-568f-cba4-26ee-225cd07b8def	00020000-568f-cba3-cfa5-eefa35b790db
00010000-568f-cba4-26ee-225cd07b8def	00020000-568f-cba3-e656-18b7b5c42a62
00010000-568f-cba4-26ee-225cd07b8def	00020000-568f-cba3-4125-29324d49e161
00010000-568f-cba4-26ee-225cd07b8def	00020000-568f-cba3-37e0-fb9da28a5fcf
00010000-568f-cba4-26ee-225cd07b8def	00020000-568f-cba3-3cb6-c08964137226
00010000-568f-cba4-f20b-55483b622194	00020000-568f-cba3-e783-7f8d2084b52d
00010000-568f-cba4-3f83-db512f65a751	00020000-568f-cba1-ebff-82fdfc3afee5
00010000-568f-cba4-cc17-f83f6aab568a	00020000-568f-cba1-03ba-0f90979965ef
00010000-568f-cba4-2939-733281dc4328	00020000-568f-cba1-48a6-848db6e444e1
00010000-568f-cba4-24a5-91158dbd3910	00020000-568f-cba1-94b6-493804c33389
00010000-568f-cba4-76fd-67de6fd959aa	00020000-568f-cba1-7c9e-5dd0ec6c5d49
00010000-568f-cba4-8351-134d27fceb57	00020000-568f-cba1-1f11-9ae86f90bae5
00010000-568f-cba4-81d3-f43711af90ca	00020000-568f-cba1-9c54-c2d8a3dec1d6
\.


--
-- TOC entry 3176 (class 0 OID 34767707)
-- Dependencies: 224
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 34767645)
-- Dependencies: 216
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 34767574)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-568f-cba3-3b71-89f5413147f1	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-568f-cba3-0d04-27fc989c96ed	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-568f-cba3-b954-91e2d6dba92b	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3125 (class 0 OID 34767197)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-568f-cba0-77d2-05ab89caf970	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-568f-cba0-1f08-e2326b2d75bf	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-568f-cba0-ff0b-e52391c538e8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-568f-cba0-1713-b8bd24fc2b78	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-568f-cba0-8164-b5c8015c7028	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3124 (class 0 OID 34767189)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-568f-cba0-d28f-77bbf5dd8a59	00230000-568f-cba0-1713-b8bd24fc2b78	popa
00240000-568f-cba0-629f-529da459b455	00230000-568f-cba0-1713-b8bd24fc2b78	oseba
00240000-568f-cba0-b715-c2bbb21161ba	00230000-568f-cba0-1713-b8bd24fc2b78	tippopa
00240000-568f-cba0-a00a-e2c88e087f83	00230000-568f-cba0-1713-b8bd24fc2b78	organizacijskaenota
00240000-568f-cba0-f4fd-33d9c3fcb699	00230000-568f-cba0-1713-b8bd24fc2b78	sezona
00240000-568f-cba0-2003-75a1af615014	00230000-568f-cba0-1713-b8bd24fc2b78	tipvaje
00240000-568f-cba0-bf38-a54353465485	00230000-568f-cba0-1713-b8bd24fc2b78	tipdodatka
00240000-568f-cba0-1c3f-9bc3c7e51f62	00230000-568f-cba0-1f08-e2326b2d75bf	prostor
00240000-568f-cba0-55c3-a7a2af05f3b1	00230000-568f-cba0-1713-b8bd24fc2b78	besedilo
00240000-568f-cba0-7efb-2fa9d169d8e8	00230000-568f-cba0-1713-b8bd24fc2b78	uprizoritev
00240000-568f-cba0-e12f-050c655747dd	00230000-568f-cba0-1713-b8bd24fc2b78	funkcija
00240000-568f-cba0-d7e1-29d5f015a069	00230000-568f-cba0-1713-b8bd24fc2b78	tipfunkcije
00240000-568f-cba0-2dab-e3b113c80a17	00230000-568f-cba0-1713-b8bd24fc2b78	alternacija
00240000-568f-cba0-4a28-89c77e887d82	00230000-568f-cba0-77d2-05ab89caf970	pogodba
00240000-568f-cba0-ab2a-b563cf4b66a6	00230000-568f-cba0-1713-b8bd24fc2b78	zaposlitev
00240000-568f-cba0-1781-33783fa2dc9a	00230000-568f-cba0-1713-b8bd24fc2b78	zvrstuprizoritve
00240000-568f-cba0-a342-c1bfa039eacc	00230000-568f-cba0-77d2-05ab89caf970	programdela
00240000-568f-cba0-4f69-a2fc659ae2a0	00230000-568f-cba0-1713-b8bd24fc2b78	zapis
\.


--
-- TOC entry 3123 (class 0 OID 34767184)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
bdb93c62-48f8-4cd0-a216-46a7913a38ae	00240000-568f-cba0-d28f-77bbf5dd8a59	0	1001
\.


--
-- TOC entry 3182 (class 0 OID 34767769)
-- Dependencies: 230
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-568f-cba4-d74a-5e7209a88366	000e0000-568f-cba4-8cba-61249837624f	00080000-568f-cba4-45c4-0a6f355c065a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-568f-cba1-c137-0707eb0a595c
00270000-568f-cba4-b89d-7072e2524a54	000e0000-568f-cba4-8cba-61249837624f	00080000-568f-cba4-45c4-0a6f355c065a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-568f-cba1-c137-0707eb0a595c
\.


--
-- TOC entry 3139 (class 0 OID 34767332)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 34767584)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-568f-cba5-83b5-3a102fdb216c	00180000-568f-cba4-d610-417a2a3aa2af	000c0000-568f-cba4-8527-359f4f393818	00090000-568f-cba4-7ae5-7cee65fd333d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568f-cba5-1bb6-0c369f0e36a6	00180000-568f-cba4-d610-417a2a3aa2af	000c0000-568f-cba4-35f6-d9344a6813db	00090000-568f-cba4-c49d-bc6ae30dcf67	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568f-cba5-1433-bb4e2de244fe	00180000-568f-cba4-d610-417a2a3aa2af	000c0000-568f-cba4-66d9-fa6fbbcf24ff	00090000-568f-cba4-e234-293eda0bb51a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568f-cba5-449b-88df1ef981d5	00180000-568f-cba4-d610-417a2a3aa2af	000c0000-568f-cba4-380f-0528954b13e4	00090000-568f-cba4-d4d1-8d64ea69557e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568f-cba5-ee4c-11cb46892a53	00180000-568f-cba4-d610-417a2a3aa2af	000c0000-568f-cba4-3314-8d05d297f536	00090000-568f-cba4-4c05-01a7ef753513	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-568f-cba5-6166-292ace41ec1b	00180000-568f-cba4-7f45-0dc3117d67b3	\N	00090000-568f-cba4-4c05-01a7ef753513	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-568f-cba5-6dfd-df48780f9459	00180000-568f-cba4-7f45-0dc3117d67b3	\N	00090000-568f-cba4-c49d-bc6ae30dcf67	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3163 (class 0 OID 34767604)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-568f-cba0-e713-510693d6cab5	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-568f-cba0-157d-aae542027cc2	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-568f-cba0-e1df-58e064468679	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-568f-cba0-e4bc-47369b665941	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-568f-cba0-b218-a5f78e5037d3	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-568f-cba0-b08d-b5453353676a	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3185 (class 0 OID 34767810)
-- Dependencies: 233
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-568f-cba0-f2f3-a0136a07a3e0	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-568f-cba0-41f1-acf523b9883f	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-568f-cba0-cd29-41700c3c7d8b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-568f-cba0-884e-55b9308e206d	04	Režija	Režija	Režija	umetnik	30
000f0000-568f-cba0-ced7-b5eccc4c988b	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-568f-cba0-7237-2c62acc205b6	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-568f-cba0-8523-463b8c85b769	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-568f-cba0-9a95-df2aaa4318b2	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-568f-cba0-6e7e-d64c95580869	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-568f-cba0-d9dd-41ac49bee1c4	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-568f-cba0-7862-aec76068f155	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-568f-cba0-c2de-a6ae0f7d6929	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-568f-cba0-18fe-f09a876b0ba4	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-568f-cba0-8a3c-56e418f16eb5	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-568f-cba0-fd71-59893b4206e2	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-568f-cba0-077a-96a5d2943728	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-568f-cba0-875b-eeb24629fbf8	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-568f-cba0-986c-e420ca9a6a87	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3136 (class 0 OID 34767283)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-568f-cba3-0053-a40aa989fedd	0001	šola	osnovna ali srednja šola
00400000-568f-cba3-95d4-9c17a8cf1fcc	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-568f-cba3-6f1e-11c0339611f6	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3198 (class 0 OID 34768115)
-- Dependencies: 246
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-568f-cba0-f175-ab6b5a694f9e	01	Velika predstava	f	1.00	1.00
002b0000-568f-cba0-05d2-f6867e2b9f54	02	Mala predstava	f	0.50	0.50
002b0000-568f-cba0-1f87-45344147b685	03	Mala koprodukcija	t	0.40	1.00
002b0000-568f-cba0-dd49-ec59bd7b95c9	04	Srednja koprodukcija	t	0.70	2.00
002b0000-568f-cba0-caad-487c4aa49586	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3159 (class 0 OID 34767564)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-568f-cba0-26d3-45ef2dc6dcb4	0001	prva vaja	prva vaja
00420000-568f-cba0-6bb5-1701fd73d283	0002	tehnična vaja	tehnična vaja
00420000-568f-cba0-e0b7-775cfd154c56	0003	lučna vaja	lučna vaja
00420000-568f-cba0-03b6-0aea17f8ed75	0004	kostumska vaja	kostumska vaja
00420000-568f-cba0-b8a1-0f14b435dfc1	0005	foto vaja	foto vaja
00420000-568f-cba0-617a-4241016a6c91	0006	1. glavna vaja	1. glavna vaja
00420000-568f-cba0-60cb-094a0a0ff793	0007	2. glavna vaja	2. glavna vaja
00420000-568f-cba0-8fbb-d6a08e88892f	0008	1. generalka	1. generalka
00420000-568f-cba0-7757-92f07d0632e3	0009	2. generalka	2. generalka
00420000-568f-cba0-52cf-a0f390c193ec	0010	odprta generalka	odprta generalka
00420000-568f-cba0-6aea-4ca298a548ec	0011	obnovitvena vaja	obnovitvena vaja
00420000-568f-cba0-d0fe-b3cd984013a2	0012	italijanka	krajša "obnovitvena" vaja
00420000-568f-cba0-aa72-a0003378ae60	0013	pevska vaja	pevska vaja
00420000-568f-cba0-ac5a-c1bc256b3c54	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-568f-cba0-13c9-657db67d8cee	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3145 (class 0 OID 34767405)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 34767219)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-568f-cba2-cbc3-1227542d6a58	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROtisQsEGXgyyQ5ONrZ6LINmt1ptjMGLe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-568f-cba3-91e0-6c883bac6171	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-568f-cba3-bfa9-9b97e522b47a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-568f-cba3-fb48-87f8ea4396d7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-568f-cba3-07dc-9930c6aefb66	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-568f-cba3-bbc2-2be9d6e400c9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-568f-cba3-1c7f-6eb53eb28e38	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-568f-cba3-725e-f8fc545e0e9e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-568f-cba3-4c16-b73aeb0c990d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-568f-cba3-de41-6a7d10fc3a0e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-568f-cba3-18b8-4a92fb025517	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-568f-cba3-1545-2f5951278641	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-568f-cba4-3995-e127a92ec4f3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-568f-cba4-d770-9806547fecd1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-568f-cba4-2abc-4556e517b7b1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-568f-cba4-78bb-986446e37f9d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-568f-cba4-1c1e-bd72e6c62697	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-568f-cba4-02f7-6fba7d2c69cd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-568f-cba4-26ee-225cd07b8def	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-568f-cba4-f20b-55483b622194	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-568f-cba4-3f83-db512f65a751	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-568f-cba4-cc17-f83f6aab568a	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-568f-cba4-2939-733281dc4328	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-568f-cba4-24a5-91158dbd3910	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-568f-cba4-76fd-67de6fd959aa	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-568f-cba4-8351-134d27fceb57	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-568f-cba4-81d3-f43711af90ca	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-568f-cba2-abd1-a0e4457a5191	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3189 (class 0 OID 34767860)
-- Dependencies: 237
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-568f-cba4-a0ce-6b3f4cc58a35	00160000-568f-cba3-b355-bc6be44a2dd3	\N	00140000-568f-cba0-bb4b-39ab82eff795	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-568f-cba3-8030-132e90b069f2
000e0000-568f-cba4-8cba-61249837624f	00160000-568f-cba3-13a2-291713692438	\N	00140000-568f-cba0-6992-f289afc01a7c	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-568f-cba3-d8d8-222fad7f95d8
000e0000-568f-cba4-d745-972040f647f8	\N	\N	00140000-568f-cba0-6992-f289afc01a7c	00190000-568f-cba4-2afe-cbffb8e0c0c7	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-568f-cba3-8030-132e90b069f2
000e0000-568f-cba4-eee1-4fc27722a739	\N	\N	00140000-568f-cba0-6992-f289afc01a7c	00190000-568f-cba4-2afe-cbffb8e0c0c7	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-568f-cba3-8030-132e90b069f2
000e0000-568f-cba4-1ed3-e16682165320	\N	\N	00140000-568f-cba0-6992-f289afc01a7c	00190000-568f-cba4-2afe-cbffb8e0c0c7	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-1d7e-3217611a01a4	\N	\N	00140000-568f-cba0-6992-f289afc01a7c	00190000-568f-cba4-2afe-cbffb8e0c0c7	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-6261-97da9aef9575	\N	\N	00140000-568f-cba0-2001-13b8d1dd1ce7	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-5f7f-7a6f08cb1287	\N	\N	00140000-568f-cba0-2001-13b8d1dd1ce7	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-b74a-2df5da0b4f09	\N	\N	00140000-568f-cba0-2001-13b8d1dd1ce7	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-0308-4186f391c593	\N	\N	00140000-568f-cba0-2001-13b8d1dd1ce7	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-d611-033df9e52de2	\N	\N	00140000-568f-cba0-2001-13b8d1dd1ce7	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-8cd7-c2a0d3fbb34d	\N	\N	00140000-568f-cba0-2001-13b8d1dd1ce7	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-5c0e-c6e0175d134d	\N	\N	00140000-568f-cba0-2001-13b8d1dd1ce7	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-5fd1-7224bb1ffd28	\N	\N	00140000-568f-cba0-2001-13b8d1dd1ce7	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
000e0000-568f-cba4-d37e-9ea8bd080760	\N	\N	00140000-568f-cba0-2001-13b8d1dd1ce7	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-568f-cba3-a1e7-4c36755cbf35
\.


--
-- TOC entry 3153 (class 0 OID 34767504)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-568f-cba4-a591-9b304790405a	\N	000e0000-568f-cba4-8cba-61249837624f	1	
00200000-568f-cba4-d841-85edd036db78	\N	000e0000-568f-cba4-8cba-61249837624f	2	
00200000-568f-cba4-b71e-163a464a89d2	\N	000e0000-568f-cba4-8cba-61249837624f	3	
00200000-568f-cba4-6ac2-e699a2395ad4	\N	000e0000-568f-cba4-8cba-61249837624f	4	
00200000-568f-cba4-aebd-0409c0d5867c	\N	000e0000-568f-cba4-8cba-61249837624f	5	
\.


--
-- TOC entry 3172 (class 0 OID 34767672)
-- Dependencies: 220
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 34767783)
-- Dependencies: 231
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-568f-cba1-88e2-b6494763fe48	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-568f-cba1-a11b-012e8f587935	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-568f-cba1-80cf-6262b6a1956a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-568f-cba1-5fe2-66e774b0a1cd	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-568f-cba1-6ee4-35a9908af9b0	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-568f-cba1-2ccf-fad3145e1890	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-568f-cba1-d798-bd464412b20a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-568f-cba1-7a28-4e449d80e72a	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-568f-cba1-c137-0707eb0a595c	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-568f-cba1-cbb9-b5024638c00a	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-568f-cba1-5c66-2e9961f69251	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-568f-cba1-5a74-a36e2f20bdb1	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-568f-cba1-4404-63ca67a6c944	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-568f-cba1-5e12-d73d201fe6b4	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-568f-cba1-19f5-573ee78ffce5	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-568f-cba1-2856-c4d093d33d91	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-568f-cba1-95bc-fce6363b9cc2	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-568f-cba1-31dc-770d0cfacb69	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-568f-cba1-5c86-95a95f90d1f7	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-568f-cba1-b05d-03a1661d08f2	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-568f-cba1-5f2c-e73b4d27616f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-568f-cba1-6173-fda3f5531485	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-568f-cba1-e303-fd7ac5fbf2f0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-568f-cba1-5a8a-36217bb2bf58	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-568f-cba1-3a43-2bff194f4631	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-568f-cba1-ca13-d38eec4c9ee4	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-568f-cba1-bf56-4349d5e80a90	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-568f-cba1-d9dd-90f4673ca425	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3201 (class 0 OID 34768165)
-- Dependencies: 249
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 34768134)
-- Dependencies: 248
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 34768177)
-- Dependencies: 250
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 34767745)
-- Dependencies: 227
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-568f-cba4-6257-a8785a43e748	00090000-568f-cba4-c49d-bc6ae30dcf67	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-568f-cba4-32d3-6c66f7ad66f1	00090000-568f-cba4-e234-293eda0bb51a	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-568f-cba4-b7f3-7c51ef47554d	00090000-568f-cba4-a2e5-0f4af5cba94b	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-568f-cba4-5ecb-69c1c1a00487	00090000-568f-cba4-e93f-8c9e5b0f42b5	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-568f-cba4-8094-affe0ebfc942	00090000-568f-cba4-6c70-a4a9f87e0dc8	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-568f-cba4-a800-71d7d2fb477c	00090000-568f-cba4-872f-ab03acc73f97	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3156 (class 0 OID 34767548)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 34767850)
-- Dependencies: 236
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-568f-cba0-bb4b-39ab82eff795	01	Drama	drama (SURS 01)
00140000-568f-cba0-3281-d4c2d4dacd26	02	Opera	opera (SURS 02)
00140000-568f-cba0-5de0-64c6476027b3	03	Balet	balet (SURS 03)
00140000-568f-cba0-6e7b-ee6d022a3114	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-568f-cba0-2001-13b8d1dd1ce7	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-568f-cba0-6992-f289afc01a7c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-568f-cba0-a012-3fa5e8300a31	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3178 (class 0 OID 34767735)
-- Dependencies: 226
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2608 (class 2606 OID 34767282)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 34767909)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 34767899)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 34767273)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 34767766)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 34767808)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 34768218)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 34767601)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 34767536)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 34767558)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 34767563)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 34768132)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 34767431)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 34767978)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 34767731)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 34767502)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 34767469)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 34767445)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 34767637)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 34768195)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 34768202)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2897 (class 2606 OID 34768226)
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
-- TOC entry 2754 (class 2606 OID 34767664)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 34767403)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 34767301)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 34767365)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 34767328)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 34767262)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2597 (class 2606 OID 34767247)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 34767670)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 34767706)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 34767845)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 34767356)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 34767391)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 34768083)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 34767643)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 34767381)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 34767521)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 34767490)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2675 (class 2606 OID 34767482)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 34767655)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 34768092)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 34768100)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 34768070)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 34768113)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 34767688)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 34767628)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 34767619)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 34767832)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 34767759)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 34767457)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 34767218)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 34767697)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 34767236)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2599 (class 2606 OID 34767256)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 34767715)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 34767650)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 34767582)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 34767206)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 34767194)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 34767188)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 34767779)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 34767337)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 34767593)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 34767611)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 34767819)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 34767290)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 34768125)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 34767571)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 34767416)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 34767231)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 34767878)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 34767511)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 34767678)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 34767791)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 34768175)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 34768159)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 34768183)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 34767749)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 34767552)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 34767858)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 34767743)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 1259 OID 34767546)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2692 (class 1259 OID 34767547)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2693 (class 1259 OID 34767545)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2694 (class 1259 OID 34767544)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2695 (class 1259 OID 34767543)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2797 (class 1259 OID 34767780)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2798 (class 1259 OID 34767781)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2799 (class 1259 OID 34767782)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2883 (class 1259 OID 34768197)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2884 (class 1259 OID 34768196)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2626 (class 1259 OID 34767358)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2627 (class 1259 OID 34767359)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2755 (class 1259 OID 34767671)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2870 (class 1259 OID 34768163)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2871 (class 1259 OID 34768162)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2872 (class 1259 OID 34768164)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2873 (class 1259 OID 34768161)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2874 (class 1259 OID 34768160)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2749 (class 1259 OID 34767657)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2750 (class 1259 OID 34767656)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2683 (class 1259 OID 34767512)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2684 (class 1259 OID 34767513)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2779 (class 1259 OID 34767732)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2780 (class 1259 OID 34767734)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2781 (class 1259 OID 34767733)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2658 (class 1259 OID 34767447)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 34767446)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2861 (class 1259 OID 34768114)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2813 (class 1259 OID 34767847)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2814 (class 1259 OID 34767848)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2815 (class 1259 OID 34767849)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2880 (class 1259 OID 34768184)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2822 (class 1259 OID 34767883)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2823 (class 1259 OID 34767880)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2824 (class 1259 OID 34767884)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2825 (class 1259 OID 34767882)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2826 (class 1259 OID 34767881)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2648 (class 1259 OID 34767418)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 34767417)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 34767331)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2767 (class 1259 OID 34767698)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2601 (class 1259 OID 34767263)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2602 (class 1259 OID 34767264)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2772 (class 1259 OID 34767718)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2773 (class 1259 OID 34767717)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2774 (class 1259 OID 34767716)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2631 (class 1259 OID 34767368)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2632 (class 1259 OID 34767367)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2633 (class 1259 OID 34767369)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2671 (class 1259 OID 34767485)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2672 (class 1259 OID 34767483)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 34767484)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2581 (class 1259 OID 34767196)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2729 (class 1259 OID 34767623)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2730 (class 1259 OID 34767621)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2731 (class 1259 OID 34767620)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2732 (class 1259 OID 34767622)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2592 (class 1259 OID 34767237)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 34767238)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2758 (class 1259 OID 34767679)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2893 (class 1259 OID 34768219)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2795 (class 1259 OID 34767768)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2796 (class 1259 OID 34767767)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2894 (class 1259 OID 34768227)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2895 (class 1259 OID 34768228)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2744 (class 1259 OID 34767644)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2789 (class 1259 OID 34767760)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2790 (class 1259 OID 34767761)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2843 (class 1259 OID 34767983)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2844 (class 1259 OID 34767982)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2845 (class 1259 OID 34767979)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2846 (class 1259 OID 34767980)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2847 (class 1259 OID 34767981)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2637 (class 1259 OID 34767383)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 34767382)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2639 (class 1259 OID 34767384)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2761 (class 1259 OID 34767692)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2762 (class 1259 OID 34767691)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2853 (class 1259 OID 34768093)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2854 (class 1259 OID 34768094)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2836 (class 1259 OID 34767913)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2837 (class 1259 OID 34767914)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2838 (class 1259 OID 34767911)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2839 (class 1259 OID 34767912)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2723 (class 1259 OID 34767602)
-- Name: idx_aab095ce5e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce5e15bdbd ON dodatek USING btree (terminstoritve_id);


--
-- TOC entry 2724 (class 1259 OID 34767603)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2785 (class 1259 OID 34767750)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 34767751)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2735 (class 1259 OID 34767632)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2736 (class 1259 OID 34767631)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2737 (class 1259 OID 34767629)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2738 (class 1259 OID 34767630)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2832 (class 1259 OID 34767901)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2833 (class 1259 OID 34767900)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2662 (class 1259 OID 34767458)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2665 (class 1259 OID 34767472)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2666 (class 1259 OID 34767471)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2667 (class 1259 OID 34767470)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 34767473)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2682 (class 1259 OID 34767503)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2676 (class 1259 OID 34767491)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2677 (class 1259 OID 34767492)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2850 (class 1259 OID 34768084)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2869 (class 1259 OID 34768133)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2887 (class 1259 OID 34768203)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2888 (class 1259 OID 34768204)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 34767303)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 34767302)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2622 (class 1259 OID 34767338)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 34767339)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 34767553)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 34767596)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2717 (class 1259 OID 34767595)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2718 (class 1259 OID 34767594)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2696 (class 1259 OID 34767538)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2697 (class 1259 OID 34767539)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2698 (class 1259 OID 34767542)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2699 (class 1259 OID 34767537)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2700 (class 1259 OID 34767541)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2701 (class 1259 OID 34767540)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2630 (class 1259 OID 34767357)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 34767291)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2612 (class 1259 OID 34767292)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2654 (class 1259 OID 34767432)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 34767434)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2656 (class 1259 OID 34767433)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2657 (class 1259 OID 34767435)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2743 (class 1259 OID 34767638)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 34767846)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2827 (class 1259 OID 34767879)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 34767820)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2810 (class 1259 OID 34767821)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2620 (class 1259 OID 34767329)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 34767330)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2727 (class 1259 OID 34767612)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2728 (class 1259 OID 34767613)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2782 (class 1259 OID 34767744)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 34767207)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 34767404)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2636 (class 1259 OID 34767366)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 34767195)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2866 (class 1259 OID 34768126)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2765 (class 1259 OID 34767690)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2766 (class 1259 OID 34767689)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 34767572)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 34767573)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2840 (class 1259 OID 34767910)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 34767392)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2819 (class 1259 OID 34767859)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2877 (class 1259 OID 34768176)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2859 (class 1259 OID 34768101)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2860 (class 1259 OID 34768102)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2806 (class 1259 OID 34767809)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2715 (class 1259 OID 34767583)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 34767257)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2937 (class 2606 OID 34768399)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2936 (class 2606 OID 34768404)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2931 (class 2606 OID 34768429)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2933 (class 2606 OID 34768419)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2938 (class 2606 OID 34768394)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2934 (class 2606 OID 34768414)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2932 (class 2606 OID 34768424)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2935 (class 2606 OID 34768409)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2976 (class 2606 OID 34768609)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2975 (class 2606 OID 34768614)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 34768619)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 34768784)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3009 (class 2606 OID 34768779)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 34768284)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2909 (class 2606 OID 34768289)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2957 (class 2606 OID 34768524)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3003 (class 2606 OID 34768764)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3004 (class 2606 OID 34768759)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3002 (class 2606 OID 34768769)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3005 (class 2606 OID 34768754)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3006 (class 2606 OID 34768749)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2955 (class 2606 OID 34768519)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2956 (class 2606 OID 34768514)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 34768384)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2929 (class 2606 OID 34768389)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 34768564)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 34768574)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2966 (class 2606 OID 34768569)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2919 (class 2606 OID 34768339)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 34768334)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2953 (class 2606 OID 34768504)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 34768739)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2979 (class 2606 OID 34768624)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 34768629)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 34768634)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3007 (class 2606 OID 34768774)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2981 (class 2606 OID 34768654)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2984 (class 2606 OID 34768639)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2980 (class 2606 OID 34768659)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2982 (class 2606 OID 34768649)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2983 (class 2606 OID 34768644)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2917 (class 2606 OID 34768329)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 34768324)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2905 (class 2606 OID 34768269)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2906 (class 2606 OID 34768264)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2961 (class 2606 OID 34768544)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2902 (class 2606 OID 34768244)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2901 (class 2606 OID 34768249)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2962 (class 2606 OID 34768559)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2963 (class 2606 OID 34768554)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2964 (class 2606 OID 34768549)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2912 (class 2606 OID 34768299)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2913 (class 2606 OID 34768294)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2911 (class 2606 OID 34768304)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2923 (class 2606 OID 34768364)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 34768354)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2924 (class 2606 OID 34768359)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2898 (class 2606 OID 34768229)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2945 (class 2606 OID 34768479)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2947 (class 2606 OID 34768469)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2948 (class 2606 OID 34768464)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2946 (class 2606 OID 34768474)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2900 (class 2606 OID 34768234)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 34768239)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2958 (class 2606 OID 34768529)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3012 (class 2606 OID 34768799)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2972 (class 2606 OID 34768604)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 34768599)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3014 (class 2606 OID 34768804)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3013 (class 2606 OID 34768809)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2954 (class 2606 OID 34768509)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2971 (class 2606 OID 34768589)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2970 (class 2606 OID 34768594)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2991 (class 2606 OID 34768714)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 34768709)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2995 (class 2606 OID 34768694)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2994 (class 2606 OID 34768699)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2993 (class 2606 OID 34768704)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2915 (class 2606 OID 34768314)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 34768309)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2914 (class 2606 OID 34768319)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2959 (class 2606 OID 34768539)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2960 (class 2606 OID 34768534)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2998 (class 2606 OID 34768724)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2997 (class 2606 OID 34768729)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2988 (class 2606 OID 34768684)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 34768689)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2990 (class 2606 OID 34768674)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2989 (class 2606 OID 34768679)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2944 (class 2606 OID 34768454)
-- Name: fk_aab095ce5e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce5e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2943 (class 2606 OID 34768459)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2969 (class 2606 OID 34768579)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2968 (class 2606 OID 34768584)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 34768499)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2950 (class 2606 OID 34768494)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2952 (class 2606 OID 34768484)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2951 (class 2606 OID 34768489)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2985 (class 2606 OID 34768669)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2986 (class 2606 OID 34768664)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2921 (class 2606 OID 34768344)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2922 (class 2606 OID 34768349)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2928 (class 2606 OID 34768379)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 34768369)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2926 (class 2606 OID 34768374)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2996 (class 2606 OID 34768719)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2999 (class 2606 OID 34768734)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 34768744)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3011 (class 2606 OID 34768789)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 34768794)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2903 (class 2606 OID 34768259)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2904 (class 2606 OID 34768254)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2908 (class 2606 OID 34768274)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2907 (class 2606 OID 34768279)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2939 (class 2606 OID 34768434)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 34768449)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 34768444)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2942 (class 2606 OID 34768439)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-08 15:46:00 CET

--
-- PostgreSQL database dump complete
--

