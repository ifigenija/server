--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-29 18:14:44 CET

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
-- TOC entry 183 (class 1259 OID 33316429)
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
-- TOC entry 237 (class 1259 OID 33317044)
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
-- TOC entry 236 (class 1259 OID 33317027)
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
-- TOC entry 182 (class 1259 OID 33316422)
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
-- TOC entry 181 (class 1259 OID 33316420)
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
-- TOC entry 227 (class 1259 OID 33316904)
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
-- TOC entry 230 (class 1259 OID 33316934)
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
-- TOC entry 251 (class 1259 OID 33317347)
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
-- TOC entry 203 (class 1259 OID 33316677)
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
-- TOC entry 205 (class 1259 OID 33316709)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 33316714)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 33317269)
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
-- TOC entry 194 (class 1259 OID 33316574)
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
-- TOC entry 238 (class 1259 OID 33317057)
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
-- TOC entry 223 (class 1259 OID 33316857)
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
-- TOC entry 200 (class 1259 OID 33316648)
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
-- TOC entry 197 (class 1259 OID 33316614)
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
-- TOC entry 195 (class 1259 OID 33316591)
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
-- TOC entry 212 (class 1259 OID 33316771)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 33317327)
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
-- TOC entry 250 (class 1259 OID 33317340)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 33317362)
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
-- TOC entry 216 (class 1259 OID 33316796)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 33316548)
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
-- TOC entry 185 (class 1259 OID 33316448)
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
-- TOC entry 189 (class 1259 OID 33316515)
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
-- TOC entry 186 (class 1259 OID 33316459)
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
-- TOC entry 178 (class 1259 OID 33316394)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 33316413)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 33316803)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 33316837)
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
-- TOC entry 233 (class 1259 OID 33316975)
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
-- TOC entry 188 (class 1259 OID 33316495)
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
-- TOC entry 191 (class 1259 OID 33316540)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 33317213)
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
-- TOC entry 213 (class 1259 OID 33316777)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 33316525)
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
-- TOC entry 202 (class 1259 OID 33316669)
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
-- TOC entry 198 (class 1259 OID 33316629)
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
-- TOC entry 199 (class 1259 OID 33316641)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 33316789)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 33317227)
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
-- TOC entry 242 (class 1259 OID 33317237)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 33317126)
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
-- TOC entry 243 (class 1259 OID 33317245)
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
-- TOC entry 219 (class 1259 OID 33316818)
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
-- TOC entry 211 (class 1259 OID 33316762)
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
-- TOC entry 210 (class 1259 OID 33316752)
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
-- TOC entry 232 (class 1259 OID 33316964)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 33316894)
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
-- TOC entry 196 (class 1259 OID 33316603)
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
-- TOC entry 175 (class 1259 OID 33316365)
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
-- TOC entry 174 (class 1259 OID 33316363)
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
-- TOC entry 220 (class 1259 OID 33316831)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 33316403)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 33316387)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 33316845)
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
-- TOC entry 214 (class 1259 OID 33316783)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 33316729)
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
-- TOC entry 173 (class 1259 OID 33316352)
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
-- TOC entry 172 (class 1259 OID 33316344)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 33316339)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 33316911)
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
-- TOC entry 187 (class 1259 OID 33316487)
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
-- TOC entry 209 (class 1259 OID 33316739)
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
-- TOC entry 231 (class 1259 OID 33316952)
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
-- TOC entry 184 (class 1259 OID 33316438)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 33317257)
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
-- TOC entry 207 (class 1259 OID 33316719)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 33316560)
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
-- TOC entry 176 (class 1259 OID 33316374)
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
-- TOC entry 235 (class 1259 OID 33317002)
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
-- TOC entry 201 (class 1259 OID 33316659)
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
-- TOC entry 218 (class 1259 OID 33316810)
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
-- TOC entry 229 (class 1259 OID 33316925)
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
-- TOC entry 247 (class 1259 OID 33317307)
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
-- TOC entry 246 (class 1259 OID 33317276)
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
-- TOC entry 248 (class 1259 OID 33317319)
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
-- TOC entry 225 (class 1259 OID 33316883)
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
-- TOC entry 204 (class 1259 OID 33316703)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 33316992)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 33316873)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 33316425)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 33316368)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 33316429)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5682-bf81-fc58-e84678fb9972	10	30	Otroci	Abonma za otroke	200
000a0000-5682-bf81-bb77-8522ceb7b26c	20	60	Mladina	Abonma za mladino	400
000a0000-5682-bf81-e008-d9b31e3ea015	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 33317044)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5682-bf81-7ef4-b440d418adb0	000d0000-5682-bf81-ac9a-f0c553a853fb	\N	00090000-5682-bf81-90f3-42c1540d7049	000b0000-5682-bf81-ab1a-5e2ce70f8cf5	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5682-bf81-945b-71f5d1cb7a68	000d0000-5682-bf81-f2a1-da6b7424640e	00100000-5682-bf81-fe56-cab606b118b6	00090000-5682-bf81-24e2-710a29e8936b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5682-bf81-89be-ec21a36f47ed	000d0000-5682-bf81-c8a8-bbd9d839cbaf	00100000-5682-bf81-178d-0fd2a28cc0c1	00090000-5682-bf81-1583-f5c1abf906f8	\N	0003	t	\N	2015-12-29	\N	2	t	\N	f	f
000c0000-5682-bf81-c490-895a9cc69159	000d0000-5682-bf81-4d7a-5db380f2c6b0	\N	00090000-5682-bf81-22bd-207060f36053	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5682-bf81-f134-ee57ba9d2377	000d0000-5682-bf81-336b-9c6d9e99c664	\N	00090000-5682-bf81-a4fa-46dbc640f1c5	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5682-bf81-4ec4-d1703d706333	000d0000-5682-bf81-b9f4-248842970606	\N	00090000-5682-bf81-76cf-4b99d259a377	000b0000-5682-bf81-c03d-4fd916e0a175	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5682-bf81-4573-bf33677520b5	000d0000-5682-bf81-b297-255ea4dedb0a	00100000-5682-bf81-b003-9d6bd16171ad	00090000-5682-bf81-4f12-1379b26d8036	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5682-bf81-817d-390020970e22	000d0000-5682-bf81-1b89-3bfe6a8eec8b	\N	00090000-5682-bf81-3d64-6b31a41fbb8a	000b0000-5682-bf81-cac4-35298fdefcf6	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5682-bf81-9b86-f0ce6cd88594	000d0000-5682-bf81-b297-255ea4dedb0a	00100000-5682-bf81-b135-47a057106c25	00090000-5682-bf81-25e0-0f1cd6babd2c	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5682-bf81-fd94-15907c06913b	000d0000-5682-bf81-b297-255ea4dedb0a	00100000-5682-bf81-bb22-43d71103c376	00090000-5682-bf81-7850-43abc21b11ce	\N	0010	t	\N	2015-12-29	\N	16	f	\N	f	t
000c0000-5682-bf81-0d58-6ca01233347b	000d0000-5682-bf81-b297-255ea4dedb0a	00100000-5682-bf81-2655-8239f59fdf47	00090000-5682-bf81-f8ff-a63be720a180	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5682-bf81-daf9-e507b148cfcd	000d0000-5682-bf81-491e-dfddb9f0edc4	00100000-5682-bf81-fe56-cab606b118b6	00090000-5682-bf81-24e2-710a29e8936b	000b0000-5682-bf81-d0c4-312b84c6b420	0012	t	\N	\N	\N	2	t	\N	t	t
000c0000-5682-bf81-f7b6-7004b3f8db78	000d0000-5682-bf81-1490-9ebd64ee45bd	\N	00090000-5682-bf81-3d64-6b31a41fbb8a	\N	0013	f	\N	\N	\N	2	t	\N	f	t
000c0000-5682-bf81-dfc6-03f159a8084f	000d0000-5682-bf81-1490-9ebd64ee45bd	\N	00090000-5682-bf81-2e28-944c51bd9550	\N	0014	f	\N	\N	\N	2	f	\N	f	t
000c0000-5682-bf81-ca44-4675dab4012d	000d0000-5682-bf81-e0e9-df8ef9f85ff9	00100000-5682-bf81-178d-0fd2a28cc0c1	00090000-5682-bf81-1583-f5c1abf906f8	\N	0015	t	\N	\N	\N	2	t	\N	f	t
000c0000-5682-bf81-75d9-8331feb82709	000d0000-5682-bf81-e0e9-df8ef9f85ff9	\N	00090000-5682-bf81-2e28-944c51bd9550	\N	0016	f	\N	\N	\N	2	f	\N	f	t
000c0000-5682-bf81-1b3d-7d1d833ce859	000d0000-5682-bf81-e7b3-f1f352c160a7	\N	00090000-5682-bf81-2e28-944c51bd9550	\N	0017	f	\N	\N	\N	2	t	\N	f	t
000c0000-5682-bf81-9f3d-f326fb3ab9a3	000d0000-5682-bf81-e7b3-f1f352c160a7	\N	00090000-5682-bf81-3d64-6b31a41fbb8a	\N	0018	f	\N	\N	\N	2	f	\N	f	t
000c0000-5682-bf81-96c2-b506df22e93a	000d0000-5682-bf81-c582-56123ff1a35a	00100000-5682-bf81-b003-9d6bd16171ad	00090000-5682-bf81-4f12-1379b26d8036	\N	0019	t	\N	\N	\N	2	t	\N	f	t
000c0000-5682-bf81-b8c0-da582b6788a7	000d0000-5682-bf81-c582-56123ff1a35a	\N	00090000-5682-bf81-2e28-944c51bd9550	\N	0020	f	\N	\N	\N	2	f	\N	f	t
000c0000-5682-bf81-3f38-9574874fc2d4	000d0000-5682-bf81-0baa-8c33d3198323	\N	00090000-5682-bf81-2e28-944c51bd9550	\N	0021	f	\N	\N	\N	2	t	\N	f	t
000c0000-5682-bf81-d8e2-625be8820c45	000d0000-5682-bf81-0baa-8c33d3198323	00100000-5682-bf81-b003-9d6bd16171ad	00090000-5682-bf81-4f12-1379b26d8036	\N	0022	t	\N	\N	\N	2	f	\N	f	t
000c0000-5682-bf81-e9ef-aecd6b7ceb2e	000d0000-5682-bf81-43aa-09531fa4531e	\N	00090000-5682-bf81-2e28-944c51bd9550	\N	0023	f	\N	\N	\N	2	t	\N	f	t
000c0000-5682-bf81-6c44-df46fab8faee	000d0000-5682-bf81-ab6b-6810ab999fa8	\N	00090000-5682-bf81-3d64-6b31a41fbb8a	\N	0024	f	\N	\N	\N	2	t	\N	f	t
000c0000-5682-bf81-798c-c4f8f1b8519c	000d0000-5682-bf81-0ca7-ae6a4fc46f76	\N	00090000-5682-bf81-3d64-6b31a41fbb8a	\N	0025	f	\N	\N	\N	2	t	\N	f	t
000c0000-5682-bf81-492e-4b72998dcfcb	000d0000-5682-bf81-0ca7-ae6a4fc46f76	00100000-5682-bf81-178d-0fd2a28cc0c1	00090000-5682-bf81-1583-f5c1abf906f8	\N	0026	t	\N	\N	\N	2	f	\N	f	t
000c0000-5682-bf81-a7fd-013e89771e98	000d0000-5682-bf81-ff63-6603a88edce9	\N	00090000-5682-bf81-a03f-de4f69259d30	\N	0027	f	\N	\N	\N	2	t	\N	f	t
000c0000-5682-bf81-7d59-0ae9629c623b	000d0000-5682-bf81-ff63-6603a88edce9	\N	00090000-5682-bf81-620e-e9816dc32e9b	\N	0028	f	\N	\N	\N	2	f	\N	f	t
000c0000-5682-bf81-4419-f31de5c14889	000d0000-5682-bf81-7456-3fdb8e9a8508	\N	00090000-5682-bf81-3d64-6b31a41fbb8a	\N	0029	f	\N	\N	\N	1	t	\N	f	t
000c0000-5682-bf81-be31-3ce3905a7403	000d0000-5682-bf81-7456-3fdb8e9a8508	00100000-5682-bf81-178d-0fd2a28cc0c1	00090000-5682-bf81-1583-f5c1abf906f8	\N	0030	t	\N	\N	\N	2	f	\N	f	t
000c0000-5682-bf81-a136-abd5757bdf9d	000d0000-5682-bf81-7456-3fdb8e9a8508	\N	00090000-5682-bf81-620e-e9816dc32e9b	\N	0031	f	\N	\N	\N	3	f	\N	f	t
000c0000-5682-bf81-9f6a-edee954f7ede	000d0000-5682-bf81-7456-3fdb8e9a8508	\N	00090000-5682-bf81-a03f-de4f69259d30	\N	0032	f	\N	\N	\N	4	f	\N	f	t
000c0000-5682-bf81-3fdc-f2924deb503d	000d0000-5682-bf81-0a7e-c3cde605f2df	\N	00090000-5682-bf81-3d64-6b31a41fbb8a	\N	0033	f	\N	\N	\N	4	t	\N	f	t
000c0000-5682-bf81-ef24-11826eb31b08	000d0000-5682-bf81-78a0-198e1138c9b7	00100000-5682-bf81-178d-0fd2a28cc0c1	00090000-5682-bf81-1583-f5c1abf906f8	\N	0034	t	\N	\N	\N	4	t	\N	f	t
000c0000-5682-bf81-64fa-31571a89468a	000d0000-5682-bf81-78a0-198e1138c9b7	\N	00090000-5682-bf81-2e28-944c51bd9550	\N	0035	f	\N	\N	\N	4	f	\N	f	t
\.


--
-- TOC entry 3171 (class 0 OID 33317027)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 33316422)
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
-- TOC entry 3162 (class 0 OID 33316904)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5682-bf81-9333-2be02a12e5f5	00160000-5682-bf80-6328-df108dc2f2e0	00090000-5682-bf81-620e-e9816dc32e9b	aizv	10	t
003d0000-5682-bf81-1239-9c2f8a5edd50	00160000-5682-bf80-6328-df108dc2f2e0	00090000-5682-bf81-ccf0-52ab4cb8af89	apri	14	t
003d0000-5682-bf81-ad81-e446f0b591d0	00160000-5682-bf80-5058-2475cae7637d	00090000-5682-bf81-a03f-de4f69259d30	aizv	11	t
003d0000-5682-bf81-7e83-9db79d627c3f	00160000-5682-bf80-19ca-0ab40564940c	00090000-5682-bf81-bc21-4e2e117c43c8	aizv	12	t
003d0000-5682-bf81-0bc6-62e1634f0960	00160000-5682-bf80-6328-df108dc2f2e0	00090000-5682-bf81-2e28-944c51bd9550	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 33316934)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5682-bf80-6328-df108dc2f2e0	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5682-bf80-5058-2475cae7637d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5682-bf80-19ca-0ab40564940c	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 33317347)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 33316677)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5682-bf81-7e16-ef3a0289e6d4	\N	\N	00200000-5682-bf81-6e95-63ecea291d27	\N	\N	\N	00220000-5682-bf80-33d2-e237d18ae91f	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5682-bf81-dd03-700b3d07d220	\N	\N	00200000-5682-bf81-8afd-96fdbaea813d	\N	\N	\N	00220000-5682-bf80-33d2-e237d18ae91f	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5682-bf81-64af-079133c47ee1	\N	\N	00200000-5682-bf81-ebe9-9efe3fe52b4d	\N	\N	\N	00220000-5682-bf80-4320-3d4295c42512	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5682-bf81-6598-b59429f83fc7	\N	\N	00200000-5682-bf81-1eb7-4a5cf65322b5	\N	\N	\N	00220000-5682-bf80-b21b-264eefcd1527	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5682-bf81-1dc4-6ae7c440d279	\N	\N	00200000-5682-bf81-747a-33bd97b7f07c	\N	\N	\N	00220000-5682-bf80-310f-d6eff1bb45d1	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 33316709)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 33316714)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 33317269)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 33316574)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5682-bf7e-7284-9e08db8a720c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5682-bf7e-be32-97e4735ffcc6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5682-bf7e-6914-1b227f9be9f1	AL	ALB	008	Albania 	Albanija	\N
00040000-5682-bf7e-09f8-cf5f217b05e4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5682-bf7e-6904-d0f3626ef458	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5682-bf7e-c294-2f92ed628eeb	AD	AND	020	Andorra 	Andora	\N
00040000-5682-bf7e-efbe-d8973c0d44a7	AO	AGO	024	Angola 	Angola	\N
00040000-5682-bf7e-e022-0325cef2d913	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5682-bf7e-7346-0c9185063e69	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5682-bf7e-ecc9-69add31dc05c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5682-bf7e-b96c-859d8307db90	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5682-bf7e-caa9-c98fea44bc5b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5682-bf7e-6a97-ef3f03de5e2a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5682-bf7e-643a-b64bbb12cb01	AU	AUS	036	Australia 	Avstralija	\N
00040000-5682-bf7e-526c-cd79725dd86b	AT	AUT	040	Austria 	Avstrija	\N
00040000-5682-bf7e-9b09-4b3613b830ba	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5682-bf7e-41af-06049ae7a7c7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5682-bf7e-d9f9-f820b726c4ef	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5682-bf7e-8687-5bbbb833bf44	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5682-bf7e-03c2-a0ac60a0eb2b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5682-bf7e-75cc-e28dcd94b23f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5682-bf7e-3d0f-403ec6c39ac9	BE	BEL	056	Belgium 	Belgija	\N
00040000-5682-bf7e-b129-1bd8bc98fed1	BZ	BLZ	084	Belize 	Belize	\N
00040000-5682-bf7e-1827-162ac2de1af4	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5682-bf7e-9002-9ec242c77bc8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5682-bf7e-bb8a-757361a1ba37	BT	BTN	064	Bhutan 	Butan	\N
00040000-5682-bf7e-87d9-187e91db957f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5682-bf7e-494a-93f7ff97cb1c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5682-bf7e-0bcf-cd66810c6a65	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5682-bf7e-ff76-5b5c06fc5469	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5682-bf7e-c71c-11e5f3d55939	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5682-bf7e-7d0e-9bf9c5526c31	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5682-bf7e-6707-10decd414760	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5682-bf7e-e72e-4466e430c3a3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5682-bf7e-e5a8-112dd5c2489f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5682-bf7e-9796-4b14a5f6eb84	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5682-bf7e-9cb0-c00f946e5eeb	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5682-bf7e-8742-870a0b2e4b71	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5682-bf7e-3fa3-5b1449365344	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5682-bf7e-03a0-7e0b02f268b5	CA	CAN	124	Canada 	Kanada	\N
00040000-5682-bf7e-c31f-fd86d9ccba01	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5682-bf7e-13a4-7ac62c6efbb8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5682-bf7e-ed15-cc02e54a1059	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5682-bf7e-c842-f944c305d2b3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5682-bf7e-f1bf-bf65d84c2318	CL	CHL	152	Chile 	Čile	\N
00040000-5682-bf7e-ef06-4a15a6e49040	CN	CHN	156	China 	Kitajska	\N
00040000-5682-bf7e-4283-ffa5a6f4e502	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5682-bf7e-965b-513c3d441106	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5682-bf7e-bb0a-3d497ccca16a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5682-bf7e-b32c-76fd08058be9	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5682-bf7e-6d55-e813863aa9e2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5682-bf7e-b938-a52477945129	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5682-bf7e-553a-f43331846a4c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5682-bf7e-0dca-6f9d55efce0d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5682-bf7e-af0a-00ec16ff9d36	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5682-bf7e-ef2b-b5bfbf143899	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5682-bf7e-0b69-5f1cba2a6e1b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5682-bf7e-e7c9-a4fe59963196	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5682-bf7e-7ea6-33fd65f98b3a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5682-bf7e-f349-2a5641ad642d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5682-bf7e-835a-7e14cefd9052	DK	DNK	208	Denmark 	Danska	\N
00040000-5682-bf7e-164f-8d1a12a349a9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5682-bf7e-b919-5bb81b5d6b69	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5682-bf7e-7ad1-51a439690246	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5682-bf7e-b34e-87a41adf29c9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5682-bf7e-5042-15974c8c2c73	EG	EGY	818	Egypt 	Egipt	\N
00040000-5682-bf7e-b8f4-b9588c38e9f1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5682-bf7e-3bbe-bc33dcfa11be	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5682-bf7e-550c-448a5e7cac67	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5682-bf7e-eda1-ee25c9305f25	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5682-bf7e-e364-462c5ff390c3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5682-bf7e-907d-0524a87fda44	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5682-bf7e-03c6-5fef1b4ee24d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5682-bf7e-13a9-4f8e2e04294e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5682-bf7e-5cda-2486af8a87f2	FI	FIN	246	Finland 	Finska	\N
00040000-5682-bf7e-3fb7-55840efdbb10	FR	FRA	250	France 	Francija	\N
00040000-5682-bf7e-be47-71e7b46cc47e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5682-bf7e-9f33-1fce5db6c230	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5682-bf7e-1ad9-2bf163a6219b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5682-bf7e-18dc-d8bb921b8bf9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5682-bf7e-da69-a364c82745cf	GA	GAB	266	Gabon 	Gabon	\N
00040000-5682-bf7e-f903-08223b2040ab	GM	GMB	270	Gambia 	Gambija	\N
00040000-5682-bf7e-fe9c-c9be3fac322a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5682-bf7e-fbb5-005fa177ed2c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5682-bf7e-c77f-31d766763851	GH	GHA	288	Ghana 	Gana	\N
00040000-5682-bf7e-73d5-769db0e22b62	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5682-bf7e-eba6-cfd580f1bf2b	GR	GRC	300	Greece 	Grčija	\N
00040000-5682-bf7e-9f25-70ef18b0dec1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5682-bf7e-644b-2311476fb625	GD	GRD	308	Grenada 	Grenada	\N
00040000-5682-bf7e-1ac6-d2edee78e92a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5682-bf7e-1168-6770679f2ab1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5682-bf7e-8e37-2889a7ce2269	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5682-bf7e-7d28-6fabff937c0e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5682-bf7e-1de0-6821552bd2bd	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5682-bf7e-fd67-ce4fca697e7a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5682-bf7e-0194-add136931823	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5682-bf7e-6a4a-715e50165890	HT	HTI	332	Haiti 	Haiti	\N
00040000-5682-bf7e-daaf-91772ebcbe92	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5682-bf7e-0328-95af4d133451	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5682-bf7e-ae52-90b4093a261f	HN	HND	340	Honduras 	Honduras	\N
00040000-5682-bf7e-ada7-f170002174d8	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5682-bf7e-6a86-bfe2bf2e6730	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5682-bf7e-04f4-5e8d6b5790bf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5682-bf7e-03af-d9e7261f612e	IN	IND	356	India 	Indija	\N
00040000-5682-bf7e-0531-a0644dcc0f0c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5682-bf7e-b187-e37f31616a86	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5682-bf7e-e37b-edcf506249a2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5682-bf7e-117e-e2a1b6ba417f	IE	IRL	372	Ireland 	Irska	\N
00040000-5682-bf7e-2d04-cc597bff53bd	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5682-bf7e-13f9-cfea3b8e12f0	IL	ISR	376	Israel 	Izrael	\N
00040000-5682-bf7e-a2b9-502280703ba8	IT	ITA	380	Italy 	Italija	\N
00040000-5682-bf7e-7c72-e0b03dfc71f9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5682-bf7e-7975-2057148538ed	JP	JPN	392	Japan 	Japonska	\N
00040000-5682-bf7e-b2e9-22f9e03dc3e3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5682-bf7e-6406-6232006d020b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5682-bf7e-2823-fc12175d290d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5682-bf7e-d365-a9916e59e09b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5682-bf7e-7217-9dd0c8fdb3e3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5682-bf7e-b856-ab5bb6c856a8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5682-bf7e-56f9-1909b2fcdd51	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5682-bf7e-6eed-d5f5ff32e7ad	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5682-bf7e-4eb5-20aa96b9a092	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5682-bf7e-7892-81adbe6178c0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5682-bf7e-9458-919a6afbbd1a	LV	LVA	428	Latvia 	Latvija	\N
00040000-5682-bf7e-d434-31a0f1da287c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5682-bf7e-a3f5-e7361cf0b132	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5682-bf7e-730d-1ee3b7c0169d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5682-bf7e-1165-fc622a9978fc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5682-bf7e-3990-313cef935f51	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5682-bf7e-dace-3cdc9d196597	LT	LTU	440	Lithuania 	Litva	\N
00040000-5682-bf7e-52d5-2c7479e3472b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5682-bf7e-8b8f-b314e7565b92	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5682-bf7e-5e4c-f5a8bdf7291e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5682-bf7e-b76b-0f4ad1c73f0a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5682-bf7e-af79-5169590c49f8	MW	MWI	454	Malawi 	Malavi	\N
00040000-5682-bf7e-ba93-b6845817e8d3	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5682-bf7e-1c47-cac6376b6359	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5682-bf7e-097b-011167af432f	ML	MLI	466	Mali 	Mali	\N
00040000-5682-bf7e-7db0-60fbb36e5406	MT	MLT	470	Malta 	Malta	\N
00040000-5682-bf7e-7706-89e24dbc7ea0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5682-bf7e-4d0f-ef2c81c3b1fb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5682-bf7e-16d4-076e9e8627d0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5682-bf7e-e3e5-c24c4e7ea37d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5682-bf7e-8cf7-050bad496b6d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5682-bf7e-48b1-125b3179bb2e	MX	MEX	484	Mexico 	Mehika	\N
00040000-5682-bf7e-ff28-0b27d690d74a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5682-bf7e-edc5-c89662176516	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5682-bf7e-4296-a402c8568871	MC	MCO	492	Monaco 	Monako	\N
00040000-5682-bf7e-9a61-38b3e8897cfe	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5682-bf7e-ea4e-2b2edb18ff96	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5682-bf7e-0cc9-e4e8c039addd	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5682-bf7e-a6be-4cc1aff157b0	MA	MAR	504	Morocco 	Maroko	\N
00040000-5682-bf7e-32a2-70bd203353c3	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5682-bf7e-f25c-777aaf393efd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5682-bf7e-183e-c74ea7390b01	NA	NAM	516	Namibia 	Namibija	\N
00040000-5682-bf7e-86a5-c6b10da55699	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5682-bf7e-56a3-61b99b8c6645	NP	NPL	524	Nepal 	Nepal	\N
00040000-5682-bf7e-2c2d-ba057b263f7c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5682-bf7e-37ca-dfafd35e8548	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5682-bf7e-3099-9534725ab8a0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5682-bf7e-5160-918c316c354d	NE	NER	562	Niger 	Niger 	\N
00040000-5682-bf7e-164f-34864391c203	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5682-bf7e-e511-217385a28509	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5682-bf7e-c053-074622fa8e0b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5682-bf7e-be53-e57010475ed6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5682-bf7e-5b5d-25898d78aec8	NO	NOR	578	Norway 	Norveška	\N
00040000-5682-bf7e-12b5-449f846f2090	OM	OMN	512	Oman 	Oman	\N
00040000-5682-bf7e-33b6-bddab39bc0b3	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5682-bf7e-722a-324d19582fac	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5682-bf7e-b2fb-20b6877b81a8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5682-bf7e-2070-b3e49f8dab92	PA	PAN	591	Panama 	Panama	\N
00040000-5682-bf7e-75a9-3d1c62f49338	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5682-bf7e-3904-da7805518901	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5682-bf7e-4b81-ae284feeb64c	PE	PER	604	Peru 	Peru	\N
00040000-5682-bf7e-bc8e-9551956f3375	PH	PHL	608	Philippines 	Filipini	\N
00040000-5682-bf7e-b7ad-08f12d332106	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5682-bf7e-964e-f6ea1fc652d9	PL	POL	616	Poland 	Poljska	\N
00040000-5682-bf7e-ae9b-9aacd8cb9cb3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5682-bf7e-a74b-6bfe86a732e0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5682-bf7e-e0f2-29cb7648d10d	QA	QAT	634	Qatar 	Katar	\N
00040000-5682-bf7e-ea9f-1ab6f77b5b15	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5682-bf7e-90c7-0843e4ecab19	RO	ROU	642	Romania 	Romunija	\N
00040000-5682-bf7e-3058-8c7ab28e19ab	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5682-bf7e-92a6-b57cb43c9a2b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5682-bf7e-e010-08ecf049d392	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5682-bf7e-6430-ecf1f33f570b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5682-bf7e-d63a-c538e4dbd858	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5682-bf7e-59cc-286b57554092	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5682-bf7e-0cd9-2b3bf9e8e90b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5682-bf7e-2e40-50237aed4d0f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5682-bf7e-32a7-c9f645244011	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5682-bf7e-9f69-b1cbb198065d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5682-bf7e-22b5-960f7188c73f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5682-bf7e-87b8-073a8b5100d0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5682-bf7e-12b9-bef568294821	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5682-bf7e-bf06-c83195b742c6	SN	SEN	686	Senegal 	Senegal	\N
00040000-5682-bf7e-11bb-c82956599f49	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5682-bf7e-1069-8daecf4c05d9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5682-bf7e-9209-47389109401d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5682-bf7e-77c5-0d468dfad501	SG	SGP	702	Singapore 	Singapur	\N
00040000-5682-bf7e-ae30-d69e61d4753a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5682-bf7e-444b-4c2be2e1bbd8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5682-bf7e-2c1c-b7f684692fd9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5682-bf7e-8112-251c5ead855a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5682-bf7e-5e87-b41f44fd85f2	SO	SOM	706	Somalia 	Somalija	\N
00040000-5682-bf7e-5227-449944fc6688	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5682-bf7e-53f8-32ee75255c47	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5682-bf7e-4046-9841bdafa23a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5682-bf7e-6933-e22680841629	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5682-bf7e-5bf9-3faaed186546	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5682-bf7e-c143-96753f5a4112	SD	SDN	729	Sudan 	Sudan	\N
00040000-5682-bf7e-783d-155873f78267	SR	SUR	740	Suriname 	Surinam	\N
00040000-5682-bf7e-daa8-3ad737b53515	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5682-bf7e-e297-25746b117b7c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5682-bf7e-ae5c-6718f3d8b713	SE	SWE	752	Sweden 	Švedska	\N
00040000-5682-bf7e-d50b-0ca014af5a9a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5682-bf7e-f9bc-44e284e21f2c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5682-bf7e-1f73-e42548bfb5de	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5682-bf7e-caba-e042e9835479	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5682-bf7e-5d1b-fe2c892cfc6f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5682-bf7e-94ca-c5131059970d	TH	THA	764	Thailand 	Tajska	\N
00040000-5682-bf7e-07dd-c9e5284b1f49	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5682-bf7e-c724-a46a898236f4	TG	TGO	768	Togo 	Togo	\N
00040000-5682-bf7e-9636-741c00acf50d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5682-bf7e-09e8-5a7e2a0e8ae7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5682-bf7e-dfce-60357bb1ec91	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5682-bf7e-be26-8ada74163bc3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5682-bf7e-4229-e279623a7fc5	TR	TUR	792	Turkey 	Turčija	\N
00040000-5682-bf7e-051a-71ffab467138	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5682-bf7e-106c-c7460ae4294a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5682-bf7e-becf-a5e255f1120f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5682-bf7e-9995-782950fb09ed	UG	UGA	800	Uganda 	Uganda	\N
00040000-5682-bf7e-d285-1365e3bdbc3d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5682-bf7e-e951-293c7ddc8368	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5682-bf7e-6d05-d060e120b535	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5682-bf7e-1713-a2219c0c8420	US	USA	840	United States 	Združene države Amerike	\N
00040000-5682-bf7e-2d2f-9b690c5413d4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5682-bf7e-0826-8b2a4c3937af	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5682-bf7e-a383-0ed209e482df	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5682-bf7e-83cf-b7c6d0100338	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5682-bf7e-6d35-f9adf4006134	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5682-bf7e-0375-851dd25a4aae	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5682-bf7e-8813-6ff844d4b04b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5682-bf7e-1186-720979ada534	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5682-bf7e-98fd-d818a87c3db8	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5682-bf7e-6f74-7b3565aa38cf	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5682-bf7e-46c3-83068133b668	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5682-bf7e-f8d8-b6a651b9409e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5682-bf7e-24aa-26bc3d78a49e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 33317057)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5682-bf81-93c9-e21f8a964778	000e0000-5682-bf81-beec-7fc66709b480	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5682-bf7e-f665-b25c0592bed1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5682-bf81-0c20-1409bf8a9c87	000e0000-5682-bf81-220e-761be178dedd	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5682-bf7e-7387-d768faa032ff	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5682-bf81-f18d-b4537305e570	000e0000-5682-bf81-5e72-4c55f2d64bc2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5682-bf7e-f665-b25c0592bed1	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5682-bf81-10b2-7b68da08c8c1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5682-bf81-b1d6-4e44632dcd49	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 33316857)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5682-bf81-a857-716df2fa317a	000e0000-5682-bf81-4492-da6ef6e458cc	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	0	000f0000-5682-bf7e-85ee-15ee96adb7a0
000d0000-5682-bf81-788f-0ec2d76e50f4	000e0000-5682-bf81-4492-da6ef6e458cc	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	0	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-ac9a-f0c553a853fb	000e0000-5682-bf81-220e-761be178dedd	000c0000-5682-bf81-7ef4-b440d418adb0	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5682-bf7e-85ee-15ee96adb7a0
000d0000-5682-bf81-f2a1-da6b7424640e	000e0000-5682-bf81-220e-761be178dedd	000c0000-5682-bf81-945b-71f5d1cb7a68	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-c8a8-bbd9d839cbaf	000e0000-5682-bf81-220e-761be178dedd	000c0000-5682-bf81-89be-ec21a36f47ed	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5682-bf7e-b82b-5faba33364f8
000d0000-5682-bf81-4d7a-5db380f2c6b0	000e0000-5682-bf81-220e-761be178dedd	000c0000-5682-bf81-c490-895a9cc69159	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5682-bf7e-c6cd-e3be3b0c8702
000d0000-5682-bf81-336b-9c6d9e99c664	000e0000-5682-bf81-220e-761be178dedd	000c0000-5682-bf81-f134-ee57ba9d2377	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5682-bf7e-c6cd-e3be3b0c8702
000d0000-5682-bf81-b9f4-248842970606	000e0000-5682-bf81-220e-761be178dedd	000c0000-5682-bf81-4ec4-d1703d706333	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5682-bf7e-85ee-15ee96adb7a0
000d0000-5682-bf81-b297-255ea4dedb0a	000e0000-5682-bf81-220e-761be178dedd	000c0000-5682-bf81-9b86-f0ce6cd88594	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5682-bf7e-85ee-15ee96adb7a0
000d0000-5682-bf81-1b89-3bfe6a8eec8b	000e0000-5682-bf81-220e-761be178dedd	000c0000-5682-bf81-817d-390020970e22	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5682-bf7e-2180-1008ad3f6766
000d0000-5682-bf81-491e-dfddb9f0edc4	000e0000-5682-bf81-220e-761be178dedd	000c0000-5682-bf81-daf9-e507b148cfcd	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5682-bf7e-8cdb-8ad6f04815a3
000d0000-5682-bf81-1490-9ebd64ee45bd	000e0000-5682-bf81-e451-2be57f9fb64e	000c0000-5682-bf81-f7b6-7004b3f8db78	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	2	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-e0e9-df8ef9f85ff9	000e0000-5682-bf81-d2be-c2a1fbffdb92	000c0000-5682-bf81-ca44-4675dab4012d	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	2	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-e7b3-f1f352c160a7	000e0000-5682-bf81-d2be-c2a1fbffdb92	000c0000-5682-bf81-1b3d-7d1d833ce859	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	2	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-c582-56123ff1a35a	000e0000-5682-bf81-01e2-ae32a4dff897	000c0000-5682-bf81-96c2-b506df22e93a	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	2	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-0baa-8c33d3198323	000e0000-5682-bf81-aa92-4b9672d8c3e1	000c0000-5682-bf81-3f38-9574874fc2d4	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	2	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-43aa-09531fa4531e	000e0000-5682-bf81-c2f0-af6e8954c862	000c0000-5682-bf81-e9ef-aecd6b7ceb2e	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	1	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-ab6b-6810ab999fa8	000e0000-5682-bf81-db7e-67518a50956c	000c0000-5682-bf81-6c44-df46fab8faee	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	1	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-0ca7-ae6a4fc46f76	000e0000-5682-bf81-d0b8-8d3da7370f42	000c0000-5682-bf81-798c-c4f8f1b8519c	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	2	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-ff63-6603a88edce9	000e0000-5682-bf81-6477-f56d0c47e607	000c0000-5682-bf81-a7fd-013e89771e98	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	2	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-7456-3fdb8e9a8508	000e0000-5682-bf81-6477-f56d0c47e607	000c0000-5682-bf81-4419-f31de5c14889	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	4	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-0a7e-c3cde605f2df	000e0000-5682-bf81-f3c0-59a6cfe60c2e	000c0000-5682-bf81-3fdc-f2924deb503d	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	1	000f0000-5682-bf7e-322f-77eed52974c8
000d0000-5682-bf81-78a0-198e1138c9b7	000e0000-5682-bf81-f3c0-59a6cfe60c2e	000c0000-5682-bf81-ef24-11826eb31b08	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	2	000f0000-5682-bf7e-322f-77eed52974c8
\.


--
-- TOC entry 3135 (class 0 OID 33316648)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 33316614)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 33316591)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5682-bf81-9c09-9920f5354d18	00080000-5682-bf81-5cf2-0dd23c4f9c49	00090000-5682-bf81-7850-43abc21b11ce	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 33316771)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 33317327)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5682-bf81-eb75-59725f6e2a6e	00010000-5682-bf7f-0437-aad7eaee8ccc	\N	Prva mapa	Root mapa	2015-12-29 18:14:41	2015-12-29 18:14:41	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 33317340)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 33317362)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 33138684)
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
-- TOC entry 3151 (class 0 OID 33316796)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 33316548)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5682-bf7f-7d43-43f6f602f2ad	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5682-bf7f-04ba-6b107a54494e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5682-bf7f-ea3f-9d99dfe3df75	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5682-bf7f-71ed-5fa0603462a6	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5682-bf7f-ddce-80924f6ff1ea	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5682-bf7f-5077-8ba0d2170902	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5682-bf7f-94c0-6dd95c399272	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5682-bf7f-2dd6-ee4e2240cb32	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5682-bf7f-b45c-75d27cd58dde	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5682-bf7f-3b9c-d6a39d2470f3	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5682-bf7f-d9c5-14a7687082d9	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5682-bf7f-4165-afbb19724d6a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5682-bf7f-6a13-bc96279d4139	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5682-bf7f-b7c0-958b92837c34	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5682-bf80-8cc9-7bbcc9be0100	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5682-bf80-3e05-2f26d1cc88f2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5682-bf80-cf4b-4c8117ffc4a4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5682-bf80-0caf-e064de05ed0a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5682-bf80-ef79-09d615b30f97	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5682-bf83-bc13-00eca185e4ce	application.tenant.maticnopodjetje	string	s:36:"00080000-5682-bf83-3245-9dc767289ea6";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 33316448)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5682-bf80-e8cd-0d4246f00e5b	00000000-5682-bf80-8cc9-7bbcc9be0100	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5682-bf80-aa80-164f17589096	00000000-5682-bf80-8cc9-7bbcc9be0100	00010000-5682-bf7f-0437-aad7eaee8ccc	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5682-bf80-4c59-3d905463a2a8	00000000-5682-bf80-3e05-2f26d1cc88f2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 33316515)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5682-bf81-6a6b-73ff2840e8c7	\N	00100000-5682-bf81-fe56-cab606b118b6	00100000-5682-bf81-178d-0fd2a28cc0c1	01	Gledališče Nimbis
00410000-5682-bf81-19fe-24a8c744395c	00410000-5682-bf81-6a6b-73ff2840e8c7	00100000-5682-bf81-fe56-cab606b118b6	00100000-5682-bf81-178d-0fd2a28cc0c1	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 33316459)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5682-bf81-90f3-42c1540d7049	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5682-bf81-22bd-207060f36053	00010000-5682-bf81-fd29-227ab93d50c9	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5682-bf81-1583-f5c1abf906f8	00010000-5682-bf81-0385-af625281217e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5682-bf81-25e0-0f1cd6babd2c	00010000-5682-bf81-8d3f-8c0a9671cd3f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5682-bf81-6858-af9a90cb06d0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5682-bf81-76cf-4b99d259a377	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5682-bf81-f8ff-a63be720a180	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5682-bf81-4f12-1379b26d8036	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5682-bf81-7850-43abc21b11ce	00010000-5682-bf81-0882-5c5b126aebef	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5682-bf81-24e2-710a29e8936b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5682-bf81-71f5-88e414d006d6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5682-bf81-a4fa-46dbc640f1c5	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5682-bf81-3d64-6b31a41fbb8a	00010000-5682-bf81-93f4-42dbf5809fa1	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5682-bf81-620e-e9816dc32e9b	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-bf81-ccf0-52ab4cb8af89	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-bf81-a03f-de4f69259d30	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-bf81-bc21-4e2e117c43c8	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5682-bf81-2e28-944c51bd9550	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5682-bf81-a832-7c46521d22d5	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-bf81-d482-4c10fd335228	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5682-bf81-b988-829e9f714d5c	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 33316394)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5682-bf7e-3178-3c61492bd5d4	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5682-bf7e-e318-f76bc515442d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5682-bf7e-faa3-5d71ac40f21c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5682-bf7e-9e26-c55798e34014	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5682-bf7e-21cf-12544f4cc4a6	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5682-bf7e-3ac6-6d957e13c0ad	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5682-bf7e-17bd-4463b9e8dd23	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5682-bf7e-c4ca-18c879e74326	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5682-bf7e-4a6e-8a922402f223	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5682-bf7e-df06-917520b11995	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5682-bf7e-4e11-0750b7566221	Abonma-read	Abonma - branje	t
00030000-5682-bf7e-a638-5df0885a7928	Abonma-write	Abonma - spreminjanje	t
00030000-5682-bf7e-9874-d8cf53b23a90	Alternacija-read	Alternacija - branje	t
00030000-5682-bf7e-bfd1-04774814eeec	Alternacija-write	Alternacija - spreminjanje	t
00030000-5682-bf7e-b03a-80cc926f3e06	Arhivalija-read	Arhivalija - branje	t
00030000-5682-bf7e-4403-cb5937d79151	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5682-bf7e-a57f-fb2695d1badb	AuthStorage-read	AuthStorage - branje	t
00030000-5682-bf7e-717d-b3fe2beb0eed	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5682-bf7e-ac09-15173a63391c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5682-bf7e-1c55-8948fb10f158	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5682-bf7e-8d04-95b756a4a0e1	Besedilo-read	Besedilo - branje	t
00030000-5682-bf7e-8ac0-13173b4efec0	Besedilo-write	Besedilo - spreminjanje	t
00030000-5682-bf7e-d2ac-494b2aa106ff	Dogodek-read	Dogodek - branje	t
00030000-5682-bf7e-7dc8-596acf00b481	Dogodek-write	Dogodek - spreminjanje	t
00030000-5682-bf7e-6c1a-4060d68d6ecd	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5682-bf7e-3348-5228655cf489	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5682-bf7e-2d01-aa6c389023ba	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5682-bf7e-39c7-16d17e865b2a	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5682-bf7e-b28d-95a7523c7511	DogodekTrait-read	DogodekTrait - branje	t
00030000-5682-bf7e-48f7-381835093f16	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5682-bf7e-b8c8-87f6ac395a24	DrugiVir-read	DrugiVir - branje	t
00030000-5682-bf7e-f5f0-c0c0a542b8c7	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5682-bf7e-c220-e5d03d84163f	Drzava-read	Drzava - branje	t
00030000-5682-bf7e-4349-8a5a3af53c6c	Drzava-write	Drzava - spreminjanje	t
00030000-5682-bf7e-ba3a-2a988789d09e	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5682-bf7e-0fe4-e70c69fabe42	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5682-bf7e-b97d-9120af09990a	Funkcija-read	Funkcija - branje	t
00030000-5682-bf7e-51ec-53b3cc01183d	Funkcija-write	Funkcija - spreminjanje	t
00030000-5682-bf7e-be0e-79f407d3a6d6	Gostovanje-read	Gostovanje - branje	t
00030000-5682-bf7e-e4b2-eee5857bb0d6	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5682-bf7e-0813-22c377b13c48	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5682-bf7e-025b-cdf2bfa40733	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5682-bf7e-3890-43eb139ce1a0	Kupec-read	Kupec - branje	t
00030000-5682-bf7e-b984-13688cd8e129	Kupec-write	Kupec - spreminjanje	t
00030000-5682-bf7e-afde-10858e9c73d9	NacinPlacina-read	NacinPlacina - branje	t
00030000-5682-bf7e-d856-c7fb0b8edf30	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5682-bf7e-e45e-f622cf3a9f86	Option-read	Option - branje	t
00030000-5682-bf7e-60db-bb62640ffc98	Option-write	Option - spreminjanje	t
00030000-5682-bf7e-36b8-a7697acdc89a	OptionValue-read	OptionValue - branje	t
00030000-5682-bf7e-a4e3-2f3321797bcf	OptionValue-write	OptionValue - spreminjanje	t
00030000-5682-bf7e-112d-2c14860bdd39	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5682-bf7e-7c7b-df779cf246e7	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5682-bf7e-4c59-54a4092ce4b6	Oseba-read	Oseba - branje	t
00030000-5682-bf7e-bd13-d28798dc1989	Oseba-write	Oseba - spreminjanje	t
00030000-5682-bf7e-521d-75aa29a92a35	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5682-bf7e-b902-debd3845a829	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5682-bf7e-91ef-ea7e7abe1b38	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5682-bf7e-1188-44f5a2ef7a65	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5682-bf7e-6441-b9db3f1e3f89	Pogodba-read	Pogodba - branje	t
00030000-5682-bf7e-5d16-04ac458fdc41	Pogodba-write	Pogodba - spreminjanje	t
00030000-5682-bf7e-9a1e-69b5a3043303	Popa-read	Popa - branje	t
00030000-5682-bf7e-bec4-cffad5ebff17	Popa-write	Popa - spreminjanje	t
00030000-5682-bf7e-370e-c36ab863aa95	Posta-read	Posta - branje	t
00030000-5682-bf7e-4ca9-95b468cf0457	Posta-write	Posta - spreminjanje	t
00030000-5682-bf7e-c6fd-e63da096bad8	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5682-bf7e-8b71-1ad613d94eae	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5682-bf7e-a5bb-a4dd1ccc2643	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5682-bf7e-53f3-3488c1a7d60a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5682-bf7e-d87d-5261f870ae30	PostniNaslov-read	PostniNaslov - branje	t
00030000-5682-bf7e-9a58-9c2ec95ba843	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5682-bf7e-6c79-afa93e97f36e	Praznik-read	Praznik - branje	t
00030000-5682-bf7e-4a19-86c85b4763b2	Praznik-write	Praznik - spreminjanje	t
00030000-5682-bf7e-5145-e64a40fc430a	Predstava-read	Predstava - branje	t
00030000-5682-bf7e-20fe-a73b9af840a3	Predstava-write	Predstava - spreminjanje	t
00030000-5682-bf7e-4017-dfeb863fa477	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5682-bf7e-9471-8e85692d465b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5682-bf7e-1195-392c69146064	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5682-bf7e-e0b1-4b929ca797c0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5682-bf7e-1a92-cb4e15ef58f5	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5682-bf7e-fa9e-a68a63bd0623	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5682-bf7e-c776-656bad08dbc9	ProgramDela-read	ProgramDela - branje	t
00030000-5682-bf7e-1fef-019fe219d741	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5682-bf7e-edd8-4be081b74adb	ProgramFestival-read	ProgramFestival - branje	t
00030000-5682-bf7e-67b1-5431dc394c0c	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5682-bf7e-7edb-9ba061bf82cf	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5682-bf7e-fcc6-bccd2fe3a186	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5682-bf7e-3f31-78349aed5bff	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5682-bf7e-df0c-64d168023e88	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5682-bf7e-54f1-5db407b879dc	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5682-bf7e-1364-174ec41f29f1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5682-bf7e-72c8-b703e0c7c8a9	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5682-bf7e-f6e1-103a58ec69c2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5682-bf7e-b409-1df007f7db08	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5682-bf7e-7177-e507c14be38e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5682-bf7e-7f60-9ade4ef936ab	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5682-bf7e-00f1-8ca548367588	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5682-bf7e-2dfe-25f661ff4d11	ProgramRazno-read	ProgramRazno - branje	t
00030000-5682-bf7e-8fd6-dfa98c047b4a	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5682-bf7e-ebd3-c97acfb3bf62	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5682-bf7e-5a56-43c578dd8368	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5682-bf7e-f7a0-46d29233ccce	Prostor-read	Prostor - branje	t
00030000-5682-bf7e-532c-f0a5ef3940e0	Prostor-write	Prostor - spreminjanje	t
00030000-5682-bf7e-ed20-4ddf2f9949f9	Racun-read	Racun - branje	t
00030000-5682-bf7e-2849-c37539a5553d	Racun-write	Racun - spreminjanje	t
00030000-5682-bf7e-e37f-c3c6786377de	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5682-bf7e-7176-1c09b7424687	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5682-bf7e-f9f0-ac95e4218462	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5682-bf7e-029b-4e812e76e79f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5682-bf7e-dc8b-dad2ca4a3099	Rekvizit-read	Rekvizit - branje	t
00030000-5682-bf7e-a7e5-5870299067fd	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5682-bf7e-3eb2-fe2ca140bb9b	Revizija-read	Revizija - branje	t
00030000-5682-bf7e-5b26-55ca10099e5a	Revizija-write	Revizija - spreminjanje	t
00030000-5682-bf7e-80ad-bbeeae857ff8	Rezervacija-read	Rezervacija - branje	t
00030000-5682-bf7e-990d-390669e861f9	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5682-bf7e-fa63-930c1d71dc9d	SedezniRed-read	SedezniRed - branje	t
00030000-5682-bf7e-f8ac-809e0332d5cc	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5682-bf7e-fad6-51456ca8447e	Sedez-read	Sedez - branje	t
00030000-5682-bf7e-7838-07c06c061c64	Sedez-write	Sedez - spreminjanje	t
00030000-5682-bf7e-09e5-88f8c8d284c3	Sezona-read	Sezona - branje	t
00030000-5682-bf7e-a6dc-17d22a23a57e	Sezona-write	Sezona - spreminjanje	t
00030000-5682-bf7e-0b44-d09a5e9b55ca	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5682-bf7e-2a91-f4d82f7a6ea6	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5682-bf7e-debf-545ed17a7143	Telefonska-read	Telefonska - branje	t
00030000-5682-bf7e-ae2c-9b21f539ca2b	Telefonska-write	Telefonska - spreminjanje	t
00030000-5682-bf7e-36c2-0cbda7cf37bb	TerminStoritve-read	TerminStoritve - branje	t
00030000-5682-bf7e-92b8-51916967da7f	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5682-bf7e-9b70-40544e50ccaf	TipFunkcije-read	TipFunkcije - branje	t
00030000-5682-bf7e-44bb-11312fe3e8b9	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5682-bf7e-bcde-94b43e9da92c	TipPopa-read	TipPopa - branje	t
00030000-5682-bf7e-3b67-49b4f1180d24	TipPopa-write	TipPopa - spreminjanje	t
00030000-5682-bf7e-b75a-c168893a3102	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5682-bf7e-40c0-fbf48c13ff0c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5682-bf7e-ba46-aef1535a696e	TipVaje-read	TipVaje - branje	t
00030000-5682-bf7e-c0de-95e05f0554b1	TipVaje-write	TipVaje - spreminjanje	t
00030000-5682-bf7e-9c49-f5d4b2f4aedf	Trr-read	Trr - branje	t
00030000-5682-bf7e-5b2b-bdaa5f09c163	Trr-write	Trr - spreminjanje	t
00030000-5682-bf7e-661b-01316a69dfa0	Uprizoritev-read	Uprizoritev - branje	t
00030000-5682-bf7e-070e-e5a655d4c2b9	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5682-bf7e-8ada-b013ae54cdc1	Vaja-read	Vaja - branje	t
00030000-5682-bf7e-1dab-265f0ac46617	Vaja-write	Vaja - spreminjanje	t
00030000-5682-bf7e-0748-ee98f3edb74a	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5682-bf7e-c7a2-c59783127c61	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5682-bf7e-6ce5-489ba3b843bf	VrstaStroska-read	VrstaStroska - branje	t
00030000-5682-bf7e-04e8-10e0d2a576ca	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5682-bf7e-c97d-d0e95a966da2	Zaposlitev-read	Zaposlitev - branje	t
00030000-5682-bf7e-3bca-b2b9fdaa694f	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5682-bf7e-cd2f-6c2bbb3bafa3	Zasedenost-read	Zasedenost - branje	t
00030000-5682-bf7e-c1a4-10cf3610316d	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5682-bf7e-5109-258c610855c7	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5682-bf7e-eaa8-5449d668a233	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5682-bf7e-c75a-73f98334c03c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5682-bf7e-1532-a265c52065b8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5682-bf7e-7273-2b7e9443c148	Job-read	Branje opravil - samo zase - branje	t
00030000-5682-bf7e-5d1a-884aedad64e8	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5682-bf7e-92e8-b19bdf652c9d	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5682-bf7e-3407-8cb5eb2fdf1b	Report-read	Report - branje	t
00030000-5682-bf7e-4726-3184b7db4018	Report-write	Report - spreminjanje	t
00030000-5682-bf7e-727b-59d0cb809893	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5682-bf7e-3a41-0b0e75f66504	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5682-bf7e-538c-86040ce31edc	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5682-bf7e-7259-11711c8a11a6	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5682-bf7e-5542-ed5b7b87bf06	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5682-bf7e-0d9a-e5bad0ba4edf	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5682-bf7e-bd7d-58288ee515ee	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5682-bf7e-8c7a-c54a60c0f077	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5682-bf7e-47f6-ebf8e21ba0ab	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5682-bf7e-356c-5a4aa7a68c77	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5682-bf7e-9a13-c314c824d532	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5682-bf7e-768b-4a5752a43100	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5682-bf7e-d8e0-6b0f5833afb9	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5682-bf7e-a1a5-04eee5e35e2d	Datoteka-write	Datoteka - spreminjanje	t
00030000-5682-bf7e-f16f-16b41a9eab7f	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 33316413)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5682-bf7e-e936-a397798dc8ff	00030000-5682-bf7e-e318-f76bc515442d
00020000-5682-bf7e-e936-a397798dc8ff	00030000-5682-bf7e-3178-3c61492bd5d4
00020000-5682-bf7e-ffda-431ad4fdd7eb	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-1c55-8948fb10f158
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-8ac0-13173b4efec0
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-ac09-15173a63391c
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-75bc-c77a5f6d095d	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7e-3550-45169b6fe385	00030000-5682-bf7e-ac09-15173a63391c
00020000-5682-bf7e-3550-45169b6fe385	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7e-3550-45169b6fe385	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7e-3550-45169b6fe385	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-3550-45169b6fe385	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7e-3550-45169b6fe385	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7e-d53a-fbd8d878a1c6	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7e-d53a-fbd8d878a1c6	00030000-5682-bf7e-3bca-b2b9fdaa694f
00020000-5682-bf7e-d53a-fbd8d878a1c6	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7e-d53a-fbd8d878a1c6	00030000-5682-bf7e-21cf-12544f4cc4a6
00020000-5682-bf7e-d53a-fbd8d878a1c6	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7e-d53a-fbd8d878a1c6	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7e-d53a-fbd8d878a1c6	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7e-39e2-02ed2902b6ee	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7e-39e2-02ed2902b6ee	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7e-39e2-02ed2902b6ee	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7e-5add-9c9cade1bc7f	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7e-5add-9c9cade1bc7f	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7e-5add-9c9cade1bc7f	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7e-5add-9c9cade1bc7f	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7e-5add-9c9cade1bc7f	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7e-5add-9c9cade1bc7f	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7e-5add-9c9cade1bc7f	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-5add-9c9cade1bc7f	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7e-2459-341fc9a0db24	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7e-2459-341fc9a0db24	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7e-2459-341fc9a0db24	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7e-2459-341fc9a0db24	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-21cf-12544f4cc4a6
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-5b2b-bdaa5f09c163
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-9a58-9c2ec95ba843
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-ae2c-9b21f539ca2b
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7e-1916-702a04a97fff	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-b71d-18d9d36eccae	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7e-b71d-18d9d36eccae	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7e-b71d-18d9d36eccae	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7e-b71d-18d9d36eccae	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7e-b71d-18d9d36eccae	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7e-b71d-18d9d36eccae	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7e-b71d-18d9d36eccae	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-ae2c-9b21f539ca2b
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-9a58-9c2ec95ba843
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-5b2b-bdaa5f09c163
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-bec4-cffad5ebff17
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-025b-cdf2bfa40733
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-fa9e-a68a63bd0623
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7e-4779-046f01b03606	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7e-783c-82109329fbee	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7e-7d76-0791bc506a1f	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7e-7d76-0791bc506a1f	00030000-5682-bf7e-3b67-49b4f1180d24
00020000-5682-bf7e-701d-77bb6bf50c5a	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7e-5dd7-5e77f92a7a0f	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf7e-5dd7-5e77f92a7a0f	00030000-5682-bf7e-4ca9-95b468cf0457
00020000-5682-bf7e-7aad-ca06a933582a	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf7e-4c77-2df37949457d	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7e-4c77-2df37949457d	00030000-5682-bf7e-4349-8a5a3af53c6c
00020000-5682-bf7e-127f-fc2b7afdbc5f	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7e-2824-aa5466840d48	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf7e-2824-aa5466840d48	00030000-5682-bf7e-1532-a265c52065b8
00020000-5682-bf7e-a1b0-e4131dc5f5c8	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf7e-1c80-27fa87fa7716	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf7e-1c80-27fa87fa7716	00030000-5682-bf7e-eaa8-5449d668a233
00020000-5682-bf7e-9af0-af5deddce748	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf7e-413d-80fdf4f59121	00030000-5682-bf7e-4e11-0750b7566221
00020000-5682-bf7e-413d-80fdf4f59121	00030000-5682-bf7e-a638-5df0885a7928
00020000-5682-bf7e-aa31-76aa9efe9bc1	00030000-5682-bf7e-4e11-0750b7566221
00020000-5682-bf7e-8545-45ca07d25e95	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf7e-8545-45ca07d25e95	00030000-5682-bf7e-532c-f0a5ef3940e0
00020000-5682-bf7e-8545-45ca07d25e95	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7e-8545-45ca07d25e95	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7e-8545-45ca07d25e95	00030000-5682-bf7e-9a58-9c2ec95ba843
00020000-5682-bf7e-8545-45ca07d25e95	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7e-2b76-2da10fed3625	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf7e-2b76-2da10fed3625	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7e-2b76-2da10fed3625	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7e-c50b-09c81e63a083	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7e-c50b-09c81e63a083	00030000-5682-bf7e-04e8-10e0d2a576ca
00020000-5682-bf7e-d506-11eae09c9372	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7e-dada-c9c5656d1a39	00030000-5682-bf7e-7c7b-df779cf246e7
00020000-5682-bf7e-dada-c9c5656d1a39	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7e-dada-c9c5656d1a39	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7e-dada-c9c5656d1a39	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7e-dada-c9c5656d1a39	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7e-dada-c9c5656d1a39	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7e-dada-c9c5656d1a39	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-dada-c9c5656d1a39	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7e-dada-c9c5656d1a39	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7e-5337-c45d6f465dc8	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7e-5337-c45d6f465dc8	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7e-5337-c45d6f465dc8	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7e-5337-c45d6f465dc8	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7e-5337-c45d6f465dc8	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7e-01e0-08868e715266	00030000-5682-bf7e-ba46-aef1535a696e
00020000-5682-bf7e-01e0-08868e715266	00030000-5682-bf7e-c0de-95e05f0554b1
00020000-5682-bf7e-ad8e-cc4956e23b30	00030000-5682-bf7e-ba46-aef1535a696e
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-17bd-4463b9e8dd23
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-c4ca-18c879e74326
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-c776-656bad08dbc9
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-1fef-019fe219d741
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-edd8-4be081b74adb
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-67b1-5431dc394c0c
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-7edb-9ba061bf82cf
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-fcc6-bccd2fe3a186
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-3f31-78349aed5bff
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-df0c-64d168023e88
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-54f1-5db407b879dc
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-1364-174ec41f29f1
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-72c8-b703e0c7c8a9
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-f6e1-103a58ec69c2
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-b409-1df007f7db08
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-7177-e507c14be38e
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-7f60-9ade4ef936ab
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-00f1-8ca548367588
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-2dfe-25f661ff4d11
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-8fd6-dfa98c047b4a
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-ebd3-c97acfb3bf62
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-5a56-43c578dd8368
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-e0b1-4b929ca797c0
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-f5f0-c0c0a542b8c7
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-8b71-1ad613d94eae
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-5d1a-884aedad64e8
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-b8c8-87f6ac395a24
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-1195-392c69146064
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-c6fd-e63da096bad8
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-7273-2b7e9443c148
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-c8b7-b20d24e30310	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-c776-656bad08dbc9
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-edd8-4be081b74adb
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-7edb-9ba061bf82cf
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-3f31-78349aed5bff
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-54f1-5db407b879dc
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-72c8-b703e0c7c8a9
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-b409-1df007f7db08
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-7f60-9ade4ef936ab
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-2dfe-25f661ff4d11
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-ebd3-c97acfb3bf62
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-1195-392c69146064
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-b8c8-87f6ac395a24
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-c6fd-e63da096bad8
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-7273-2b7e9443c148
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-b515-bfddd8fd71e1	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-070e-e5a655d4c2b9
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-4a6e-8a922402f223
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-51ec-53b3cc01183d
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-df06-917520b11995
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-ac6a-639974dd0467	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7f-f028-b22166394293	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-ffe0-fb535c1a2b60	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-ffe0-fb535c1a2b60	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf7f-ffe0-fb535c1a2b60	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-ffe0-fb535c1a2b60	00030000-5682-bf7e-51ec-53b3cc01183d
00020000-5682-bf7f-ffe0-fb535c1a2b60	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-ffe0-fb535c1a2b60	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-ffe0-fb535c1a2b60	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-ffe0-fb535c1a2b60	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-4a6e-8a922402f223
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-21cf-12544f4cc4a6
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-5d16-04ac458fdc41
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-2a91-f4d82f7a6ea6
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-4238-bbd3e98e0320	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-7a54-8d63d9ba4cc5	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7f-5162-cad8433681a4	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-5162-cad8433681a4	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-5162-cad8433681a4	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-5162-cad8433681a4	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf7f-5162-cad8433681a4	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-5162-cad8433681a4	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-5162-cad8433681a4	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-e6ac-2c5befdaeb1a	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-e6ac-2c5befdaeb1a	00030000-5682-bf7e-2a91-f4d82f7a6ea6
00020000-5682-bf7f-e6ac-2c5befdaeb1a	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-e6ac-2c5befdaeb1a	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-cbb3-078eea40a3dd	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-cbb3-078eea40a3dd	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-4e11-0750b7566221
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-4a6e-8a922402f223
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-ac09-15173a63391c
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-1c55-8948fb10f158
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-8ac0-13173b4efec0
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-b8c8-87f6ac395a24
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-f5f0-c0c0a542b8c7
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-51ec-53b3cc01183d
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-df06-917520b11995
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-7273-2b7e9443c148
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-5d1a-884aedad64e8
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-21cf-12544f4cc4a6
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-5d16-04ac458fdc41
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-c6fd-e63da096bad8
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-8b71-1ad613d94eae
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-1195-392c69146064
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-e0b1-4b929ca797c0
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-17bd-4463b9e8dd23
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-c776-656bad08dbc9
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-c4ca-18c879e74326
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-1fef-019fe219d741
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-edd8-4be081b74adb
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-67b1-5431dc394c0c
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-7edb-9ba061bf82cf
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-fcc6-bccd2fe3a186
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-3f31-78349aed5bff
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-df0c-64d168023e88
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-54f1-5db407b879dc
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-1364-174ec41f29f1
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-72c8-b703e0c7c8a9
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-f6e1-103a58ec69c2
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-b409-1df007f7db08
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-7177-e507c14be38e
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-7f60-9ade4ef936ab
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-00f1-8ca548367588
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-2dfe-25f661ff4d11
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-8fd6-dfa98c047b4a
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-ebd3-c97acfb3bf62
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-5a56-43c578dd8368
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-2a91-f4d82f7a6ea6
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-ba46-aef1535a696e
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-070e-e5a655d4c2b9
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf7f-6db2-22f8c92648de	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-4e11-0750b7566221
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-ac09-15173a63391c
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-1c55-8948fb10f158
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-8ac0-13173b4efec0
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-ba46-aef1535a696e
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf7f-5341-8fb79c288cbe	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-4e11-0750b7566221
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-4a6e-8a922402f223
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-ac09-15173a63391c
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-1c55-8948fb10f158
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-8ac0-13173b4efec0
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-51ec-53b3cc01183d
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-df06-917520b11995
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-ba46-aef1535a696e
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-070e-e5a655d4c2b9
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf7f-f182-c204c8bd2e5b	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-4a6e-8a922402f223
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-ac09-15173a63391c
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-1c55-8948fb10f158
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-8ac0-13173b4efec0
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-b8c8-87f6ac395a24
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-f5f0-c0c0a542b8c7
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-51ec-53b3cc01183d
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-df06-917520b11995
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-7273-2b7e9443c148
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-5d1a-884aedad64e8
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-025b-cdf2bfa40733
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-21cf-12544f4cc4a6
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-5d16-04ac458fdc41
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-bec4-cffad5ebff17
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-c6fd-e63da096bad8
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-8b71-1ad613d94eae
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-9a58-9c2ec95ba843
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-1195-392c69146064
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-e0b1-4b929ca797c0
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-fa9e-a68a63bd0623
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-17bd-4463b9e8dd23
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-c776-656bad08dbc9
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-c4ca-18c879e74326
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-1fef-019fe219d741
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-edd8-4be081b74adb
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-67b1-5431dc394c0c
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-7edb-9ba061bf82cf
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-fcc6-bccd2fe3a186
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-3f31-78349aed5bff
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-df0c-64d168023e88
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-54f1-5db407b879dc
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-1364-174ec41f29f1
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-72c8-b703e0c7c8a9
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-f6e1-103a58ec69c2
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-b409-1df007f7db08
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-7177-e507c14be38e
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-7f60-9ade4ef936ab
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-00f1-8ca548367588
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-2dfe-25f661ff4d11
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-8fd6-dfa98c047b4a
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-ebd3-c97acfb3bf62
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-5a56-43c578dd8368
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-2a91-f4d82f7a6ea6
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-ae2c-9b21f539ca2b
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-5b2b-bdaa5f09c163
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-070e-e5a655d4c2b9
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-3bca-b2b9fdaa694f
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf7f-863c-a6b157040701	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-4e11-0750b7566221
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-4a6e-8a922402f223
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-ac09-15173a63391c
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-1c55-8948fb10f158
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-8ac0-13173b4efec0
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-51ec-53b3cc01183d
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-df06-917520b11995
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-025b-cdf2bfa40733
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-21cf-12544f4cc4a6
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-bec4-cffad5ebff17
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-9a58-9c2ec95ba843
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-fa9e-a68a63bd0623
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-ae2c-9b21f539ca2b
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-ba46-aef1535a696e
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-5b2b-bdaa5f09c163
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-070e-e5a655d4c2b9
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-3bca-b2b9fdaa694f
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf7f-564f-fcc710a59d70	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-4e11-0750b7566221
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-ac09-15173a63391c
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-51ec-53b3cc01183d
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-ba46-aef1535a696e
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf7f-9428-16392ab7a7db	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-4e11-0750b7566221
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-4a6e-8a922402f223
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-b8c8-87f6ac395a24
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-f5f0-c0c0a542b8c7
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-7273-2b7e9443c148
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-5d1a-884aedad64e8
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-025b-cdf2bfa40733
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-7c7b-df779cf246e7
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-21cf-12544f4cc4a6
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-5d16-04ac458fdc41
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-bec4-cffad5ebff17
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-c6fd-e63da096bad8
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-8b71-1ad613d94eae
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-9a58-9c2ec95ba843
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-1195-392c69146064
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-e0b1-4b929ca797c0
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-fa9e-a68a63bd0623
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-17bd-4463b9e8dd23
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-c776-656bad08dbc9
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-c4ca-18c879e74326
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-1fef-019fe219d741
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-edd8-4be081b74adb
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-67b1-5431dc394c0c
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-7edb-9ba061bf82cf
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-fcc6-bccd2fe3a186
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-3f31-78349aed5bff
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-df0c-64d168023e88
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-54f1-5db407b879dc
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-1364-174ec41f29f1
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-72c8-b703e0c7c8a9
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-f6e1-103a58ec69c2
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-b409-1df007f7db08
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-7177-e507c14be38e
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-7f60-9ade4ef936ab
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-00f1-8ca548367588
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-2dfe-25f661ff4d11
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-8fd6-dfa98c047b4a
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-ebd3-c97acfb3bf62
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-5a56-43c578dd8368
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-2a91-f4d82f7a6ea6
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-ae2c-9b21f539ca2b
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-ba46-aef1535a696e
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-5b2b-bdaa5f09c163
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-04e8-10e0d2a576ca
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-3bca-b2b9fdaa694f
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf7f-bb19-7cf44502962e	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3178-3c61492bd5d4
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-e318-f76bc515442d
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-4e11-0750b7566221
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-a638-5df0885a7928
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-4a6e-8a922402f223
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-b03a-80cc926f3e06
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-4403-cb5937d79151
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-a57f-fb2695d1badb
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-717d-b3fe2beb0eed
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-ac09-15173a63391c
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-1c55-8948fb10f158
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-8d04-95b756a4a0e1
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-8ac0-13173b4efec0
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-d2ac-494b2aa106ff
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-9e26-c55798e34014
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-6c1a-4060d68d6ecd
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3348-5228655cf489
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-2d01-aa6c389023ba
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-39c7-16d17e865b2a
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-b28d-95a7523c7511
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-48f7-381835093f16
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-7dc8-596acf00b481
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-b8c8-87f6ac395a24
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-f5f0-c0c0a542b8c7
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-c220-e5d03d84163f
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-4349-8a5a3af53c6c
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-ba3a-2a988789d09e
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-0fe4-e70c69fabe42
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-df06-917520b11995
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-51ec-53b3cc01183d
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-be0e-79f407d3a6d6
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-e4b2-eee5857bb0d6
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-92e8-b19bdf652c9d
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-7273-2b7e9443c148
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-5d1a-884aedad64e8
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-0813-22c377b13c48
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-025b-cdf2bfa40733
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3890-43eb139ce1a0
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-b984-13688cd8e129
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-bd7d-58288ee515ee
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-0d9a-e5bad0ba4edf
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3a41-0b0e75f66504
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-538c-86040ce31edc
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-7259-11711c8a11a6
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-5542-ed5b7b87bf06
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-afde-10858e9c73d9
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-d856-c7fb0b8edf30
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-e45e-f622cf3a9f86
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-36b8-a7697acdc89a
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-a4e3-2f3321797bcf
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-60db-bb62640ffc98
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-112d-2c14860bdd39
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-7c7b-df779cf246e7
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-21cf-12544f4cc4a6
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-521d-75aa29a92a35
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-b902-debd3845a829
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-91ef-ea7e7abe1b38
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-1188-44f5a2ef7a65
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-5d16-04ac458fdc41
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-bec4-cffad5ebff17
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-370e-c36ab863aa95
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-c6fd-e63da096bad8
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-8b71-1ad613d94eae
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-a5bb-a4dd1ccc2643
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-53f3-3488c1a7d60a
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-4ca9-95b468cf0457
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-9a58-9c2ec95ba843
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-6c79-afa93e97f36e
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-4a19-86c85b4763b2
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-5145-e64a40fc430a
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-20fe-a73b9af840a3
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-4017-dfeb863fa477
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-9471-8e85692d465b
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-1195-392c69146064
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-e0b1-4b929ca797c0
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-1a92-cb4e15ef58f5
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-fa9e-a68a63bd0623
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-17bd-4463b9e8dd23
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-c776-656bad08dbc9
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-c4ca-18c879e74326
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-1fef-019fe219d741
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-edd8-4be081b74adb
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-67b1-5431dc394c0c
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-7edb-9ba061bf82cf
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-fcc6-bccd2fe3a186
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3f31-78349aed5bff
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-df0c-64d168023e88
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-54f1-5db407b879dc
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-1364-174ec41f29f1
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-72c8-b703e0c7c8a9
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-f6e1-103a58ec69c2
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-b409-1df007f7db08
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-7177-e507c14be38e
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-7f60-9ade4ef936ab
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-00f1-8ca548367588
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-2dfe-25f661ff4d11
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-8fd6-dfa98c047b4a
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-ebd3-c97acfb3bf62
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-5a56-43c578dd8368
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-f7a0-46d29233ccce
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-532c-f0a5ef3940e0
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-ed20-4ddf2f9949f9
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-2849-c37539a5553d
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-e37f-c3c6786377de
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-7176-1c09b7424687
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-f9f0-ac95e4218462
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-029b-4e812e76e79f
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-dc8b-dad2ca4a3099
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-a7e5-5870299067fd
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3407-8cb5eb2fdf1b
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-4726-3184b7db4018
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3eb2-fe2ca140bb9b
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-5b26-55ca10099e5a
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-80ad-bbeeae857ff8
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-990d-390669e861f9
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-fa63-930c1d71dc9d
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-f8ac-809e0332d5cc
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-fad6-51456ca8447e
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-7838-07c06c061c64
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-09e5-88f8c8d284c3
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-a6dc-17d22a23a57e
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-727b-59d0cb809893
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-2a91-f4d82f7a6ea6
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-ae2c-9b21f539ca2b
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-36c2-0cbda7cf37bb
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-faa3-5d71ac40f21c
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-92b8-51916967da7f
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-9b70-40544e50ccaf
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-44bb-11312fe3e8b9
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-bcde-94b43e9da92c
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3b67-49b4f1180d24
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-b75a-c168893a3102
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-40c0-fbf48c13ff0c
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-ba46-aef1535a696e
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-c0de-95e05f0554b1
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-5b2b-bdaa5f09c163
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-070e-e5a655d4c2b9
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-8ada-b013ae54cdc1
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-1dab-265f0ac46617
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-0748-ee98f3edb74a
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-c7a2-c59783127c61
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-6ce5-489ba3b843bf
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-04e8-10e0d2a576ca
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-d8e0-6b0f5833afb9
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-768b-4a5752a43100
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-3bca-b2b9fdaa694f
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-cd2f-6c2bbb3bafa3
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-c1a4-10cf3610316d
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-5109-258c610855c7
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-eaa8-5449d668a233
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-c75a-73f98334c03c
00020000-5682-bf80-c235-d25870f18d5d	00030000-5682-bf7e-1532-a265c52065b8
00020000-5682-bf80-958e-049797e6d5e4	00030000-5682-bf7e-9a13-c314c824d532
00020000-5682-bf80-decc-0f3d8d29dc9e	00030000-5682-bf7e-356c-5a4aa7a68c77
00020000-5682-bf80-a2b0-38682a276e54	00030000-5682-bf7e-070e-e5a655d4c2b9
00020000-5682-bf80-652e-cfd8c87c1bf1	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf80-dbf1-eab3d118e1e2	00030000-5682-bf7e-538c-86040ce31edc
00020000-5682-bf80-5659-4caed3e2fe85	00030000-5682-bf7e-7259-11711c8a11a6
00020000-5682-bf80-518a-9901ac401999	00030000-5682-bf7e-5542-ed5b7b87bf06
00020000-5682-bf80-e5e5-2a00bff1ea58	00030000-5682-bf7e-3a41-0b0e75f66504
00020000-5682-bf80-d1ec-83a5deed4e39	00030000-5682-bf7e-bd7d-58288ee515ee
00020000-5682-bf80-516a-f27bcdd21051	00030000-5682-bf7e-0d9a-e5bad0ba4edf
00020000-5682-bf80-1536-339e3b50d85a	00030000-5682-bf7e-47f6-ebf8e21ba0ab
00020000-5682-bf80-c7b8-57f03297d943	00030000-5682-bf7e-8c7a-c54a60c0f077
00020000-5682-bf80-dd39-494b85311dd7	00030000-5682-bf7e-4c59-54a4092ce4b6
00020000-5682-bf80-1413-77ad0546f6e0	00030000-5682-bf7e-bd13-d28798dc1989
00020000-5682-bf80-b1ed-6c3395fd3d6b	00030000-5682-bf7e-21cf-12544f4cc4a6
00020000-5682-bf80-0f56-366cfc1e0ed0	00030000-5682-bf7e-3ac6-6d957e13c0ad
00020000-5682-bf80-53f7-a538f69a4ec8	00030000-5682-bf7e-a1a5-04eee5e35e2d
00020000-5682-bf80-8271-0bc096f98218	00030000-5682-bf7e-f16f-16b41a9eab7f
00020000-5682-bf81-4924-ca5429c84776	00030000-5682-bf7e-9a1e-69b5a3043303
00020000-5682-bf81-4924-ca5429c84776	00030000-5682-bf7e-bec4-cffad5ebff17
00020000-5682-bf81-4924-ca5429c84776	00030000-5682-bf7e-661b-01316a69dfa0
00020000-5682-bf81-0dd9-9c75a00c154d	00030000-5682-bf7e-9c49-f5d4b2f4aedf
00020000-5682-bf81-2e2e-a1b166edead0	00030000-5682-bf7e-5b2b-bdaa5f09c163
00020000-5682-bf81-f5bf-58e6c8f37686	00030000-5682-bf7e-727b-59d0cb809893
00020000-5682-bf81-a667-33803aa4dac3	00030000-5682-bf7e-debf-545ed17a7143
00020000-5682-bf81-1458-fced452f47d0	00030000-5682-bf7e-ae2c-9b21f539ca2b
00020000-5682-bf81-26b0-1f2a8bab4904	00030000-5682-bf7e-d87d-5261f870ae30
00020000-5682-bf81-20a9-6e32e958955b	00030000-5682-bf7e-9a58-9c2ec95ba843
00020000-5682-bf81-6450-897bca8521de	00030000-5682-bf7e-c97d-d0e95a966da2
00020000-5682-bf81-2c47-da3907b290af	00030000-5682-bf7e-3bca-b2b9fdaa694f
00020000-5682-bf81-6718-1537c3023fe0	00030000-5682-bf7e-6441-b9db3f1e3f89
00020000-5682-bf81-033a-9bd5b628375e	00030000-5682-bf7e-5d16-04ac458fdc41
00020000-5682-bf81-1e85-af6b2688b566	00030000-5682-bf7e-0b44-d09a5e9b55ca
00020000-5682-bf81-fefc-353de128be42	00030000-5682-bf7e-2a91-f4d82f7a6ea6
00020000-5682-bf81-d2da-1366a01cdd67	00030000-5682-bf7e-9874-d8cf53b23a90
00020000-5682-bf81-de22-3960c0930bcc	00030000-5682-bf7e-bfd1-04774814eeec
00020000-5682-bf81-1c51-0094f0bbe689	00030000-5682-bf7e-4a6e-8a922402f223
00020000-5682-bf81-7687-e9d51d93a948	00030000-5682-bf7e-b97d-9120af09990a
00020000-5682-bf81-91c1-d5d2bea3a0cc	00030000-5682-bf7e-51ec-53b3cc01183d
00020000-5682-bf81-ae32-a9a27314e55c	00030000-5682-bf7e-df06-917520b11995
\.


--
-- TOC entry 3152 (class 0 OID 33316803)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 33316837)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 33316975)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5682-bf81-ab1a-5e2ce70f8cf5	00090000-5682-bf81-90f3-42c1540d7049	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5682-bf81-c03d-4fd916e0a175	00090000-5682-bf81-76cf-4b99d259a377	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5682-bf81-cac4-35298fdefcf6	00090000-5682-bf81-3d64-6b31a41fbb8a	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5682-bf81-d0c4-312b84c6b420	00090000-5682-bf81-24e2-710a29e8936b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 33316495)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5682-bf81-5cf2-0dd23c4f9c49	\N	00040000-5682-bf7e-2c1c-b7f684692fd9	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-bf81-7e2c-07fac418c7e6	\N	00040000-5682-bf7e-2c1c-b7f684692fd9	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5682-bf81-cb70-4ccedabae1a2	\N	00040000-5682-bf7e-2c1c-b7f684692fd9	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-bf81-51e1-55c73a555d57	\N	00040000-5682-bf7e-2c1c-b7f684692fd9	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-bf81-4cb5-1c6a762397db	\N	00040000-5682-bf7e-2c1c-b7f684692fd9	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-bf81-7ace-1f98ce2e4dec	\N	00040000-5682-bf7e-b96c-859d8307db90	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-bf81-47bf-a5332b67ef7a	\N	00040000-5682-bf7e-ef2b-b5bfbf143899	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-bf81-e19a-b787cb35b7b3	\N	00040000-5682-bf7e-526c-cd79725dd86b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-bf81-9d85-f4e878cf6e24	\N	00040000-5682-bf7e-fbb5-005fa177ed2c	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5682-bf83-3245-9dc767289ea6	\N	00040000-5682-bf7e-2c1c-b7f684692fd9	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 33316540)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5682-bf7d-620e-76509dbd32c5	8341	Adlešiči
00050000-5682-bf7d-d8f6-dc13ae5c3b96	5270	Ajdovščina
00050000-5682-bf7d-5c95-2e809d7da48d	6280	Ankaran/Ancarano
00050000-5682-bf7d-a09a-e6ff4a1f292d	9253	Apače
00050000-5682-bf7d-20dd-b218316ab49c	8253	Artiče
00050000-5682-bf7d-e2f6-eabb279aec57	4275	Begunje na Gorenjskem
00050000-5682-bf7d-0d5d-233aba2f00e5	1382	Begunje pri Cerknici
00050000-5682-bf7d-b161-c0ddc578dfa9	9231	Beltinci
00050000-5682-bf7d-91af-f574df495742	2234	Benedikt
00050000-5682-bf7d-53d3-3839821063a3	2345	Bistrica ob Dravi
00050000-5682-bf7d-8e0a-f9e5961645ff	3256	Bistrica ob Sotli
00050000-5682-bf7d-99f9-6dc353b96ef7	8259	Bizeljsko
00050000-5682-bf7d-7590-716debbbc3db	1223	Blagovica
00050000-5682-bf7d-70b0-21baac4a164a	8283	Blanca
00050000-5682-bf7d-22e7-0884b306c142	4260	Bled
00050000-5682-bf7d-55f8-1ab78913cebc	4273	Blejska Dobrava
00050000-5682-bf7d-2b73-e4516f05199d	9265	Bodonci
00050000-5682-bf7d-a058-29732bc434ec	9222	Bogojina
00050000-5682-bf7d-b9d3-6f8974defe56	4263	Bohinjska Bela
00050000-5682-bf7d-127b-4c0208169e0a	4264	Bohinjska Bistrica
00050000-5682-bf7d-496f-a7bc08739492	4265	Bohinjsko jezero
00050000-5682-bf7d-9e6b-44c75c8c0ebe	1353	Borovnica
00050000-5682-bf7d-e2ab-0e5c909df722	8294	Boštanj
00050000-5682-bf7d-64da-2ed1075b00d9	5230	Bovec
00050000-5682-bf7d-4d7d-afb8632e0042	5295	Branik
00050000-5682-bf7d-c59e-5a268a431e7c	3314	Braslovče
00050000-5682-bf7d-258c-81f7609dd75d	5223	Breginj
00050000-5682-bf7d-b8b7-dc375a3609b2	8280	Brestanica
00050000-5682-bf7d-4394-fd997d1ec646	2354	Bresternica
00050000-5682-bf7d-fb62-53399d080cf4	4243	Brezje
00050000-5682-bf7d-7ec7-13a6f97ba94c	1351	Brezovica pri Ljubljani
00050000-5682-bf7d-9c6a-ddd65307344c	8250	Brežice
00050000-5682-bf7d-ff06-75635f90cc6d	4210	Brnik - Aerodrom
00050000-5682-bf7d-ff21-505841996881	8321	Brusnice
00050000-5682-bf7d-22e9-7095ace3165c	3255	Buče
00050000-5682-bf7d-413e-78490278370d	8276	Bučka 
00050000-5682-bf7d-9375-ab3faf89e9ad	9261	Cankova
00050000-5682-bf7d-c2bf-6cd6492d662a	3000	Celje 
00050000-5682-bf7d-e598-86dfe3622b94	3001	Celje - poštni predali
00050000-5682-bf7d-8ea1-779e8275ad47	4207	Cerklje na Gorenjskem
00050000-5682-bf7d-98f4-5bab7c76ae19	8263	Cerklje ob Krki
00050000-5682-bf7d-67f3-336a7eb8b0eb	1380	Cerknica
00050000-5682-bf7d-00c9-f53f7e7e5bf5	5282	Cerkno
00050000-5682-bf7d-80c3-6e122762609d	2236	Cerkvenjak
00050000-5682-bf7d-ed93-427d26e4ffbc	2215	Ceršak
00050000-5682-bf7d-6431-43fc46c6c17f	2326	Cirkovce
00050000-5682-bf7d-6b40-2e40128df9fb	2282	Cirkulane
00050000-5682-bf7d-4b55-273e8ac10046	5273	Col
00050000-5682-bf7d-8ba3-9a7b9a0c5843	8251	Čatež ob Savi
00050000-5682-bf7d-3c56-cde198cbc2c3	1413	Čemšenik
00050000-5682-bf7d-2784-8fa98ed68cfd	5253	Čepovan
00050000-5682-bf7d-c418-39c80474e3ab	9232	Črenšovci
00050000-5682-bf7d-d9dc-15b8325c3a11	2393	Črna na Koroškem
00050000-5682-bf7d-5b03-74bec86686f4	6275	Črni Kal
00050000-5682-bf7d-89ea-a90db67612a4	5274	Črni Vrh nad Idrijo
00050000-5682-bf7d-0771-11b14a38761a	5262	Črniče
00050000-5682-bf7d-bd8e-dfc470025001	8340	Črnomelj
00050000-5682-bf7d-b640-51512914934f	6271	Dekani
00050000-5682-bf7d-316f-ded8e34d13bb	5210	Deskle
00050000-5682-bf7d-01b4-3dd641d9972a	2253	Destrnik
00050000-5682-bf7d-0474-0a34f65bc0ea	6215	Divača
00050000-5682-bf7d-5d66-7de108372775	1233	Dob
00050000-5682-bf7d-de5d-cae05b7aa415	3224	Dobje pri Planini
00050000-5682-bf7d-31e5-71c7f5630b48	8257	Dobova
00050000-5682-bf7d-19ac-9070d9880ef7	1423	Dobovec
00050000-5682-bf7d-bc34-b1ec112a2562	5263	Dobravlje
00050000-5682-bf7d-76fd-7dfb34caf0c5	3204	Dobrna
00050000-5682-bf7d-d6f2-484ff9c9ab7a	8211	Dobrnič
00050000-5682-bf7d-4544-22612a392f70	1356	Dobrova
00050000-5682-bf7d-0c3a-18e986456a2a	9223	Dobrovnik/Dobronak 
00050000-5682-bf7d-3681-aca404fdadce	5212	Dobrovo v Brdih
00050000-5682-bf7d-e38f-3a1e54ce25a7	1431	Dol pri Hrastniku
00050000-5682-bf7d-179f-858399c9a1bd	1262	Dol pri Ljubljani
00050000-5682-bf7d-cef7-2e72f9b718f9	1273	Dole pri Litiji
00050000-5682-bf7d-38bf-7dff1ee7253d	1331	Dolenja vas
00050000-5682-bf7d-deb9-5f4d65ee9f5e	8350	Dolenjske Toplice
00050000-5682-bf7d-d5f0-a633b665e932	1230	Domžale
00050000-5682-bf7d-4719-17de43132c43	2252	Dornava
00050000-5682-bf7d-0421-e61931805d40	5294	Dornberk
00050000-5682-bf7d-a2cb-f2a64a630401	1319	Draga
00050000-5682-bf7d-2ad8-8f78d61cd5bd	8343	Dragatuš
00050000-5682-bf7d-af1b-ea6d2c67f8c4	3222	Dramlje
00050000-5682-bf7d-16b1-252425de05c6	2370	Dravograd
00050000-5682-bf7d-c48b-80048ea821b6	4203	Duplje
00050000-5682-bf7d-2933-3a77fea0bf0b	6221	Dutovlje
00050000-5682-bf7d-38ce-77b951a55311	8361	Dvor
00050000-5682-bf7d-072f-aee214dc6a01	2343	Fala
00050000-5682-bf7d-9fe3-c2671d40c3d3	9208	Fokovci
00050000-5682-bf7d-f58f-94e257720593	2313	Fram
00050000-5682-bf7d-0ecb-3aa4c45b5d48	3213	Frankolovo
00050000-5682-bf7d-bf27-65c3b9f46149	1274	Gabrovka
00050000-5682-bf7d-04bd-1e6ab7737772	8254	Globoko
00050000-5682-bf7d-9b0f-6aadb5d3dcd4	5275	Godovič
00050000-5682-bf7d-3df0-e813e831df9f	4204	Golnik
00050000-5682-bf7d-a655-7751eb894dfd	3303	Gomilsko
00050000-5682-bf7d-5c1f-f05ecba1277d	4224	Gorenja vas
00050000-5682-bf7d-640a-83c62f93584f	3263	Gorica pri Slivnici
00050000-5682-bf7d-c89f-9d49adec4bd0	2272	Gorišnica
00050000-5682-bf7d-5ff3-07214922483a	9250	Gornja Radgona
00050000-5682-bf7d-b499-c645bae1af21	3342	Gornji Grad
00050000-5682-bf7d-ed85-40b22a50d592	4282	Gozd Martuljek
00050000-5682-bf7d-ee57-a570d997f8d0	6272	Gračišče
00050000-5682-bf7d-8db9-59e814056f1c	9264	Grad
00050000-5682-bf7d-a4d4-921f10d07116	8332	Gradac
00050000-5682-bf7d-2deb-d1858b09d055	1384	Grahovo
00050000-5682-bf7d-82b3-c600cb6c099b	5242	Grahovo ob Bači
00050000-5682-bf7d-a8d8-46fcb5f77fb6	5251	Grgar
00050000-5682-bf7d-ba9b-a44fececa3b4	3302	Griže
00050000-5682-bf7d-39d9-a627b801a2f6	3231	Grobelno
00050000-5682-bf7d-e02c-71c79f01c149	1290	Grosuplje
00050000-5682-bf7d-d46c-bb0af6bb5a66	2288	Hajdina
00050000-5682-bf7d-8b3b-12f86d3b54d4	8362	Hinje
00050000-5682-bf7d-7d14-37619a6e4423	2311	Hoče
00050000-5682-bf7d-1acb-abac52627160	9205	Hodoš/Hodos
00050000-5682-bf7d-4b9d-082444bf955c	1354	Horjul
00050000-5682-bf7d-2eea-6a356fda99de	1372	Hotedršica
00050000-5682-bf7d-d1ee-f3904268cbf6	1430	Hrastnik
00050000-5682-bf7d-f7b8-0bad42964a45	6225	Hruševje
00050000-5682-bf7d-20a7-285503e403a5	4276	Hrušica
00050000-5682-bf7d-0ffd-f321a4552c70	5280	Idrija
00050000-5682-bf7d-1461-b61aa8e0df21	1292	Ig
00050000-5682-bf7d-8299-99b9787dfa46	6250	Ilirska Bistrica
00050000-5682-bf7d-7377-8db16c64259a	6251	Ilirska Bistrica-Trnovo
00050000-5682-bf7d-18cd-98d7f5172600	1295	Ivančna Gorica
00050000-5682-bf7d-a489-1379ad742a4b	2259	Ivanjkovci
00050000-5682-bf7d-399f-96cdbba3a0c8	1411	Izlake
00050000-5682-bf7d-b19c-1feee1e43dac	6310	Izola/Isola
00050000-5682-bf7d-900d-074a8d52f9d7	2222	Jakobski Dol
00050000-5682-bf7d-2d9f-5dd6b729f328	2221	Jarenina
00050000-5682-bf7d-c988-bb8c4ac38da5	6254	Jelšane
00050000-5682-bf7d-1103-a3fcc7fd4c47	4270	Jesenice
00050000-5682-bf7d-d224-2c8c183da1e6	8261	Jesenice na Dolenjskem
00050000-5682-bf7d-d343-b2c0001b2181	3273	Jurklošter
00050000-5682-bf7d-cfd1-6bb1a9ac972b	2223	Jurovski Dol
00050000-5682-bf7d-0245-db560227ced3	2256	Juršinci
00050000-5682-bf7d-a01b-68cd131513ab	5214	Kal nad Kanalom
00050000-5682-bf7d-3351-945396af886c	3233	Kalobje
00050000-5682-bf7d-cb51-e49c77b8b835	4246	Kamna Gorica
00050000-5682-bf7d-b933-cc4460dc598a	2351	Kamnica
00050000-5682-bf7d-7743-ef67ce3b8716	1241	Kamnik
00050000-5682-bf7d-5370-77397f274bd4	5213	Kanal
00050000-5682-bf7d-c76e-a45d7d5cbe6b	8258	Kapele
00050000-5682-bf7d-3ebb-fc621d66577e	2362	Kapla
00050000-5682-bf7d-7f9d-f1469d6ea6ea	2325	Kidričevo
00050000-5682-bf7d-81e4-5e619538d3e3	1412	Kisovec
00050000-5682-bf7d-bc86-4d5b05f62b25	6253	Knežak
00050000-5682-bf7d-4f3c-4833d4e70896	5222	Kobarid
00050000-5682-bf7d-a645-826d427d4634	9227	Kobilje
00050000-5682-bf7d-8ff7-f23b5dae6399	1330	Kočevje
00050000-5682-bf7d-5709-49fb9670cdd2	1338	Kočevska Reka
00050000-5682-bf7d-e01e-c9ada95d6baf	2276	Kog
00050000-5682-bf7d-ddc3-0ac98f448300	5211	Kojsko
00050000-5682-bf7d-00ee-cc4e99ce2d7d	6223	Komen
00050000-5682-bf7d-d8a0-ec406e479053	1218	Komenda
00050000-5682-bf7d-f33b-570b1abc965c	6000	Koper/Capodistria 
00050000-5682-bf7d-30ce-8cbd6d29d400	6001	Koper/Capodistria - poštni predali
00050000-5682-bf7d-fa2e-c8a0e73fd844	8282	Koprivnica
00050000-5682-bf7d-c5b8-b08df9ed7e8e	5296	Kostanjevica na Krasu
00050000-5682-bf7d-a46e-82b04c674299	8311	Kostanjevica na Krki
00050000-5682-bf7d-bc3a-d60145c7da55	1336	Kostel
00050000-5682-bf7d-fd62-d9b09972ade4	6256	Košana
00050000-5682-bf7d-3c3c-80d83bc72ab5	2394	Kotlje
00050000-5682-bf7d-932c-bf787f7edb34	6240	Kozina
00050000-5682-bf7d-2336-9a8e3e13b792	3260	Kozje
00050000-5682-bf7d-1003-04e92d91b8c3	4000	Kranj 
00050000-5682-bf7d-7ee0-30efede7ab58	4001	Kranj - poštni predali
00050000-5682-bf7d-2d28-4d78e1c22807	4280	Kranjska Gora
00050000-5682-bf7d-ea41-fe12c8c9be3a	1281	Kresnice
00050000-5682-bf7d-1a11-e2864f9f38f2	4294	Križe
00050000-5682-bf7d-348e-7e60009106dc	9206	Križevci
00050000-5682-bf7d-1ffb-926f90a45cb4	9242	Križevci pri Ljutomeru
00050000-5682-bf7d-c34b-18ea319ee88e	1301	Krka
00050000-5682-bf7d-b25e-cdb6486a0e80	8296	Krmelj
00050000-5682-bf7d-a5de-89db6721c599	4245	Kropa
00050000-5682-bf7d-bca4-e694ceac70fe	8262	Krška vas
00050000-5682-bf7d-c5b2-06732f8594b0	8270	Krško
00050000-5682-bf7d-4c7a-1602d6f4e95a	9263	Kuzma
00050000-5682-bf7d-c8b1-82e4e59ad89e	2318	Laporje
00050000-5682-bf7d-27a7-cbb8d8870706	3270	Laško
00050000-5682-bf7d-1e39-6b7f35308a18	1219	Laze v Tuhinju
00050000-5682-bf7d-a02f-ca3fe2930515	2230	Lenart v Slovenskih goricah
00050000-5682-bf7d-c806-b716f0d111a3	9220	Lendava/Lendva
00050000-5682-bf7d-872b-f114b7f1af05	4248	Lesce
00050000-5682-bf7d-c642-349a89a28a4a	3261	Lesično
00050000-5682-bf7d-fc4c-408675c591d0	8273	Leskovec pri Krškem
00050000-5682-bf7d-8bd3-862590eacaa5	2372	Libeliče
00050000-5682-bf7d-b37b-fb2f7bbb04b8	2341	Limbuš
00050000-5682-bf7d-3015-df93d4fa1132	1270	Litija
00050000-5682-bf7d-af31-bf1883a6e064	3202	Ljubečna
00050000-5682-bf7d-000b-ba76dcdfb003	1000	Ljubljana 
00050000-5682-bf7d-7846-267cb24d2086	1001	Ljubljana - poštni predali
00050000-5682-bf7d-da83-97b521e64fdf	1231	Ljubljana - Črnuče
00050000-5682-bf7d-3aa2-96274bd98e3b	1261	Ljubljana - Dobrunje
00050000-5682-bf7d-eaac-d1cc16b11204	1260	Ljubljana - Polje
00050000-5682-bf7d-fd99-173750fff87c	1210	Ljubljana - Šentvid
00050000-5682-bf7d-f9dc-bb6f69b84aaa	1211	Ljubljana - Šmartno
00050000-5682-bf7d-9b49-72843ff3df5c	3333	Ljubno ob Savinji
00050000-5682-bf7d-c18a-ee47b5ee6424	9240	Ljutomer
00050000-5682-bf7d-cb3a-e9abf8f815db	3215	Loče
00050000-5682-bf7d-8eaa-f142f3065552	5231	Log pod Mangartom
00050000-5682-bf7d-3fda-72b2973e8468	1358	Log pri Brezovici
00050000-5682-bf7d-3437-9350e60782f7	1370	Logatec
00050000-5682-bf7d-e758-2f9befe60e06	1371	Logatec
00050000-5682-bf7d-6d3f-9a5e28255666	1434	Loka pri Zidanem Mostu
00050000-5682-bf7d-9469-72e2ad79e294	3223	Loka pri Žusmu
00050000-5682-bf7d-a847-880d459f9ba0	6219	Lokev
00050000-5682-bf7d-6b1d-9e55b6521dcf	1318	Loški Potok
00050000-5682-bf7d-fb83-4f3d008b0970	2324	Lovrenc na Dravskem polju
00050000-5682-bf7d-ceee-525f14bedfd2	2344	Lovrenc na Pohorju
00050000-5682-bf7d-4d1b-2c25c2eb5d85	3334	Luče
00050000-5682-bf7d-7377-e13068861215	1225	Lukovica
00050000-5682-bf7d-f77b-056b286d542a	9202	Mačkovci
00050000-5682-bf7d-4eb5-4e8e5f33a804	2322	Majšperk
00050000-5682-bf7d-9d86-986e41d0d640	2321	Makole
00050000-5682-bf7d-6c4a-63af7a65c07a	9243	Mala Nedelja
00050000-5682-bf7d-b853-df0260853999	2229	Malečnik
00050000-5682-bf7d-7159-9aa0c5c1471b	6273	Marezige
00050000-5682-bf7d-4262-cdfc5735475a	2000	Maribor 
00050000-5682-bf7d-3a30-fbd5e03f97f0	2001	Maribor - poštni predali
00050000-5682-bf7d-c76c-7150ae1ae8f0	2206	Marjeta na Dravskem polju
00050000-5682-bf7d-dbec-223f40cf8397	2281	Markovci
00050000-5682-bf7d-b3b7-a317a0ede197	9221	Martjanci
00050000-5682-bf7d-a116-3ba0b0639af4	6242	Materija
00050000-5682-bf7d-dcb7-ed84fef78ce1	4211	Mavčiče
00050000-5682-bf7d-4910-1477fe508279	1215	Medvode
00050000-5682-bf7d-2259-291368626905	1234	Mengeš
00050000-5682-bf7d-0111-e35633fc0c9b	8330	Metlika
00050000-5682-bf7d-c810-da56ed2e4dba	2392	Mežica
00050000-5682-bf7d-3c17-0e2d76a3efaf	2204	Miklavž na Dravskem polju
00050000-5682-bf7d-eaa1-4ec0d8ab7f40	2275	Miklavž pri Ormožu
00050000-5682-bf7d-9087-a08d03f3b614	5291	Miren
00050000-5682-bf7d-ef31-82f86ab80957	8233	Mirna
00050000-5682-bf7d-1fe3-10ad34a8dd11	8216	Mirna Peč
00050000-5682-bf7d-537b-a1212ab025dc	2382	Mislinja
00050000-5682-bf7d-876c-f239f30aa6f9	4281	Mojstrana
00050000-5682-bf7d-d79e-f9729485c550	8230	Mokronog
00050000-5682-bf7d-5c4b-14429d663961	1251	Moravče
00050000-5682-bf7d-ff57-ed34f7f8f80d	9226	Moravske Toplice
00050000-5682-bf7d-2110-4e9617648704	5216	Most na Soči
00050000-5682-bf7d-5519-de1aee68f584	1221	Motnik
00050000-5682-bf7d-5afd-c87c55684e19	3330	Mozirje
00050000-5682-bf7d-22a4-94b197c96dc3	9000	Murska Sobota 
00050000-5682-bf7d-1de1-f0369f7001db	9001	Murska Sobota - poštni predali
00050000-5682-bf7e-f923-d44a2946323d	2366	Muta
00050000-5682-bf7e-f8db-5ec9826be9d7	4202	Naklo
00050000-5682-bf7e-acdb-e6517d4070b4	3331	Nazarje
00050000-5682-bf7e-bcc1-5594118ecf8f	1357	Notranje Gorice
00050000-5682-bf7e-f63e-86007ebbbe86	3203	Nova Cerkev
00050000-5682-bf7e-aa4a-4621c394bf4c	5000	Nova Gorica 
00050000-5682-bf7e-60d3-534a71508f69	5001	Nova Gorica - poštni predali
00050000-5682-bf7e-7d19-5bd493647fc1	1385	Nova vas
00050000-5682-bf7e-1089-722cdf8ade2d	8000	Novo mesto
00050000-5682-bf7e-324b-5f57a46e047b	8001	Novo mesto - poštni predali
00050000-5682-bf7e-212a-01886e15078c	6243	Obrov
00050000-5682-bf7e-75d7-27d3c08dfa1f	9233	Odranci
00050000-5682-bf7e-9ce1-db19e48fe0bc	2317	Oplotnica
00050000-5682-bf7e-fb7a-140e2eb8327d	2312	Orehova vas
00050000-5682-bf7e-8c10-cf1d636ff53a	2270	Ormož
00050000-5682-bf7e-215c-cae6bdbb3320	1316	Ortnek
00050000-5682-bf7e-ff41-4589560177d4	1337	Osilnica
00050000-5682-bf7e-131b-caa15d355707	8222	Otočec
00050000-5682-bf7e-965e-3b6c89b81725	2361	Ožbalt
00050000-5682-bf7e-6e44-a0375e324502	2231	Pernica
00050000-5682-bf7e-795a-026e32574430	2211	Pesnica pri Mariboru
00050000-5682-bf7e-fd68-dc8de4ee861f	9203	Petrovci
00050000-5682-bf7e-b7ce-56b48162729f	3301	Petrovče
00050000-5682-bf7e-f1c1-1c10338f795c	6330	Piran/Pirano
00050000-5682-bf7e-23bb-d8abcd8f799a	8255	Pišece
00050000-5682-bf7e-1948-efbbc81ff023	6257	Pivka
00050000-5682-bf7e-08df-19c9d2b0d338	6232	Planina
00050000-5682-bf7e-3c95-2927348364ea	3225	Planina pri Sevnici
00050000-5682-bf7e-dc03-9dafb5480642	6276	Pobegi
00050000-5682-bf7e-507c-1e51d2dd043e	8312	Podbočje
00050000-5682-bf7e-d5d2-0046c65998b8	5243	Podbrdo
00050000-5682-bf7e-6764-836253cac022	3254	Podčetrtek
00050000-5682-bf7e-3f81-cd8299ac2b99	2273	Podgorci
00050000-5682-bf7e-a39f-ec609cf70b4a	6216	Podgorje
00050000-5682-bf7e-2bb0-9eb043125c77	2381	Podgorje pri Slovenj Gradcu
00050000-5682-bf7e-f2ee-61fb7c68e8d2	6244	Podgrad
00050000-5682-bf7e-379d-7c9ade693804	1414	Podkum
00050000-5682-bf7e-0595-01f4a34ea14f	2286	Podlehnik
00050000-5682-bf7e-b902-c89b1f3fa6a6	5272	Podnanos
00050000-5682-bf7e-fedb-f2e5384c2fd2	4244	Podnart
00050000-5682-bf7e-a6d3-06f036ce58fe	3241	Podplat
00050000-5682-bf7e-ef8f-6491fcf5ee70	3257	Podsreda
00050000-5682-bf7e-f606-f321f7950029	2363	Podvelka
00050000-5682-bf7e-99e6-462b1ceae2cb	2208	Pohorje
00050000-5682-bf7e-4019-558e33a7ba36	2257	Polenšak
00050000-5682-bf7e-c88a-cb572426beca	1355	Polhov Gradec
00050000-5682-bf7e-133d-74e763bb2324	4223	Poljane nad Škofjo Loko
00050000-5682-bf7e-6f28-6720e36ae5e7	2319	Poljčane
00050000-5682-bf7e-8a0e-427d96b02d92	1272	Polšnik
00050000-5682-bf7e-51d0-fc6ba141b8bb	3313	Polzela
00050000-5682-bf7e-7673-5ed2eb9cc254	3232	Ponikva
00050000-5682-bf7e-252a-4e5d3e7f3e1e	6320	Portorož/Portorose
00050000-5682-bf7e-2bdf-dc0035e00e2e	6230	Postojna
00050000-5682-bf7e-5e3d-3db5bc4a1393	2331	Pragersko
00050000-5682-bf7e-738e-2d7c3eab2033	3312	Prebold
00050000-5682-bf7e-d09f-a7eb750335af	4205	Preddvor
00050000-5682-bf7e-646c-31a9bad340e5	6255	Prem
00050000-5682-bf7e-8659-8479117311e5	1352	Preserje
00050000-5682-bf7e-d4db-8a1494887abd	6258	Prestranek
00050000-5682-bf7e-7a76-c8b6ac7b83c4	2391	Prevalje
00050000-5682-bf7e-1b1f-6ee8d9945bfe	3262	Prevorje
00050000-5682-bf7e-46fd-5c1659323907	1276	Primskovo 
00050000-5682-bf7e-595b-ac360c1ecaa2	3253	Pristava pri Mestinju
00050000-5682-bf7e-166d-657cd2376c24	9207	Prosenjakovci/Partosfalva
00050000-5682-bf7e-8143-55b5df4c9d06	5297	Prvačina
00050000-5682-bf7e-72d5-f37ee6ff7834	2250	Ptuj
00050000-5682-bf7e-8aca-d477174ab628	2323	Ptujska Gora
00050000-5682-bf7e-8b07-2cda09bf0659	9201	Puconci
00050000-5682-bf7e-9676-223e0a6b9a7c	2327	Rače
00050000-5682-bf7e-0cd5-504628c426c3	1433	Radeče
00050000-5682-bf7e-6a4e-54cf042af20b	9252	Radenci
00050000-5682-bf7e-ea02-4f04110a9bd5	2360	Radlje ob Dravi
00050000-5682-bf7e-5205-47e2debc8571	1235	Radomlje
00050000-5682-bf7e-ea3f-538302f3239e	4240	Radovljica
00050000-5682-bf7e-5a94-f1dc95aed2b5	8274	Raka
00050000-5682-bf7e-45f2-5be35994a319	1381	Rakek
00050000-5682-bf7e-0988-5a857c13880a	4283	Rateče - Planica
00050000-5682-bf7e-efeb-b1f66de76943	2390	Ravne na Koroškem
00050000-5682-bf7e-c307-95d64d6fc5eb	9246	Razkrižje
00050000-5682-bf7e-3579-93c28e39130a	3332	Rečica ob Savinji
00050000-5682-bf7e-4341-53eb90c51eb7	5292	Renče
00050000-5682-bf7e-b429-7fa8aef059ca	1310	Ribnica
00050000-5682-bf7e-3955-7e36d9ea13d5	2364	Ribnica na Pohorju
00050000-5682-bf7e-74b5-4b43371273ba	3272	Rimske Toplice
00050000-5682-bf7e-227b-c6eaad397eee	1314	Rob
00050000-5682-bf7e-a286-98a3d8c3946f	5215	Ročinj
00050000-5682-bf7e-7434-82d5e973c025	3250	Rogaška Slatina
00050000-5682-bf7e-077e-84e7d38da934	9262	Rogašovci
00050000-5682-bf7e-e8e7-b7fba0a385dc	3252	Rogatec
00050000-5682-bf7e-65f8-d1f8b123c098	1373	Rovte
00050000-5682-bf7e-b12e-c2aad1818905	2342	Ruše
00050000-5682-bf7e-962d-8e97e74b4a9e	1282	Sava
00050000-5682-bf7e-02c1-d612bc06dd7c	6333	Sečovlje/Sicciole
00050000-5682-bf7e-e73a-84a7cb51d2f3	4227	Selca
00050000-5682-bf7e-204d-78619c4fa5b0	2352	Selnica ob Dravi
00050000-5682-bf7e-40bb-c277f89c430f	8333	Semič
00050000-5682-bf7e-33dc-f652fe87020a	8281	Senovo
00050000-5682-bf7e-ac91-e5255391a85c	6224	Senožeče
00050000-5682-bf7e-e843-e22dbeee3b8d	8290	Sevnica
00050000-5682-bf7e-8e47-3d54a67545d3	6210	Sežana
00050000-5682-bf7e-8d66-4894c6ff4c01	2214	Sladki Vrh
00050000-5682-bf7e-3f4e-9aa3eb8bc3b0	5283	Slap ob Idrijci
00050000-5682-bf7e-ccb3-00d9a2cc5550	2380	Slovenj Gradec
00050000-5682-bf7e-4f2d-04a428e007fd	2310	Slovenska Bistrica
00050000-5682-bf7e-9f36-385148ba8a92	3210	Slovenske Konjice
00050000-5682-bf7e-2bce-a38b2c8f2319	1216	Smlednik
00050000-5682-bf7e-538f-0ab6754a8f9d	5232	Soča
00050000-5682-bf7e-08f2-172bb5090d44	1317	Sodražica
00050000-5682-bf7e-b318-714479cc0043	3335	Solčava
00050000-5682-bf7e-053d-46521b7a4133	5250	Solkan
00050000-5682-bf7e-06ea-9aac3fd65dc6	4229	Sorica
00050000-5682-bf7e-b493-3eb20606172f	4225	Sovodenj
00050000-5682-bf7e-7921-ac503ff70234	5281	Spodnja Idrija
00050000-5682-bf7e-b962-32aa1d3a642f	2241	Spodnji Duplek
00050000-5682-bf7e-02d9-64d9fac1fd30	9245	Spodnji Ivanjci
00050000-5682-bf7e-ac9b-807af482e320	2277	Središče ob Dravi
00050000-5682-bf7e-c981-aacb30fb8739	4267	Srednja vas v Bohinju
00050000-5682-bf7e-b762-547591c316e6	8256	Sromlje 
00050000-5682-bf7e-0365-93108361334b	5224	Srpenica
00050000-5682-bf7e-e961-ebe8988a2595	1242	Stahovica
00050000-5682-bf7e-f0f7-13a7989d6afc	1332	Stara Cerkev
00050000-5682-bf7e-2438-eaf27b53db61	8342	Stari trg ob Kolpi
00050000-5682-bf7e-5dcf-16b38cfad7f2	1386	Stari trg pri Ložu
00050000-5682-bf7e-8e2b-b13b95eabd7e	2205	Starše
00050000-5682-bf7e-7e72-85d09e98f88f	2289	Stoperce
00050000-5682-bf7e-3355-2e5c3d74444d	8322	Stopiče
00050000-5682-bf7e-4c21-eec6480f29d0	3206	Stranice
00050000-5682-bf7e-eb66-5f6e3dd27e80	8351	Straža
00050000-5682-bf7e-49d1-bc4bda0244d3	1313	Struge
00050000-5682-bf7e-3479-99307eca2077	8293	Studenec
00050000-5682-bf7e-f7ad-764a8e2bec8f	8331	Suhor
00050000-5682-bf7e-80c0-1231d70a0a38	2233	Sv. Ana v Slovenskih goricah
00050000-5682-bf7e-f3f3-854004336ca9	2235	Sv. Trojica v Slovenskih goricah
00050000-5682-bf7e-aaf4-e9f3e35db8af	2353	Sveti Duh na Ostrem Vrhu
00050000-5682-bf7e-5e80-20e2120066a4	9244	Sveti Jurij ob Ščavnici
00050000-5682-bf7e-0f84-8e7495628ce1	3264	Sveti Štefan
00050000-5682-bf7e-e900-414a948d041e	2258	Sveti Tomaž
00050000-5682-bf7e-0733-ce09c7bc5e6e	9204	Šalovci
00050000-5682-bf7e-b593-0eaf2e98aeed	5261	Šempas
00050000-5682-bf7e-a367-d47b8539af9c	5290	Šempeter pri Gorici
00050000-5682-bf7e-70bb-4e522a9d539b	3311	Šempeter v Savinjski dolini
00050000-5682-bf7e-1bbc-26f579e5b341	4208	Šenčur
00050000-5682-bf7e-55bb-8784366527be	2212	Šentilj v Slovenskih goricah
00050000-5682-bf7e-5455-f440e3714d5f	8297	Šentjanž
00050000-5682-bf7e-9d94-9d79a56a8cc8	2373	Šentjanž pri Dravogradu
00050000-5682-bf7e-b8c1-06fd619631bf	8310	Šentjernej
00050000-5682-bf7e-e21b-363719c356e7	3230	Šentjur
00050000-5682-bf7e-2cc8-5b087d22c730	3271	Šentrupert
00050000-5682-bf7e-c0f2-b107ff04c802	8232	Šentrupert
00050000-5682-bf7e-9a62-dbba3c70b5b1	1296	Šentvid pri Stični
00050000-5682-bf7e-fe93-11e0f8e51d39	8275	Škocjan
00050000-5682-bf7e-f251-236d28e90764	6281	Škofije
00050000-5682-bf7e-4564-f390d7957337	4220	Škofja Loka
00050000-5682-bf7e-4e5b-f1bec0807024	3211	Škofja vas
00050000-5682-bf7e-eb1e-6af0a3da98ba	1291	Škofljica
00050000-5682-bf7e-57e2-4da973e15cb4	6274	Šmarje
00050000-5682-bf7e-32bb-07686d9a9524	1293	Šmarje - Sap
00050000-5682-bf7e-af4f-6bdd211bbfe1	3240	Šmarje pri Jelšah
00050000-5682-bf7e-14cc-e3472c9f8d6d	8220	Šmarješke Toplice
00050000-5682-bf7e-ac02-c4e4a756ba71	2315	Šmartno na Pohorju
00050000-5682-bf7e-59b8-c11919290d6d	3341	Šmartno ob Dreti
00050000-5682-bf7e-f946-32aed8f6b1c8	3327	Šmartno ob Paki
00050000-5682-bf7e-94ee-c70dc184c244	1275	Šmartno pri Litiji
00050000-5682-bf7e-3967-aede60f938ed	2383	Šmartno pri Slovenj Gradcu
00050000-5682-bf7e-cf94-491c3378893a	3201	Šmartno v Rožni dolini
00050000-5682-bf7e-8848-aab3587e2f6d	3325	Šoštanj
00050000-5682-bf7e-9dee-0697c85fa049	6222	Štanjel
00050000-5682-bf7e-f370-305cac69fed9	3220	Štore
00050000-5682-bf7e-ec54-10678e52b76f	3304	Tabor
00050000-5682-bf7e-95b9-aedb02b1fcc6	3221	Teharje
00050000-5682-bf7e-18f4-d7115fc74e0a	9251	Tišina
00050000-5682-bf7e-bc2c-82bb07e58db1	5220	Tolmin
00050000-5682-bf7e-99dd-8d09bcebb78d	3326	Topolšica
00050000-5682-bf7e-20a7-07005287dc65	2371	Trbonje
00050000-5682-bf7e-6bb6-f182a16de0e8	1420	Trbovlje
00050000-5682-bf7e-ac4f-6c50fda567f9	8231	Trebelno 
00050000-5682-bf7e-f738-e46c4b4a2d30	8210	Trebnje
00050000-5682-bf7e-7b1c-25afcc2a4d3d	5252	Trnovo pri Gorici
00050000-5682-bf7e-2ca4-ec4cf3597f34	2254	Trnovska vas
00050000-5682-bf7e-ec1e-66aa7dea490e	1222	Trojane
00050000-5682-bf7e-c0fb-b12c50a86574	1236	Trzin
00050000-5682-bf7e-112e-3c81b65eab93	4290	Tržič
00050000-5682-bf7e-fec8-75b50836c42c	8295	Tržišče
00050000-5682-bf7e-3f02-b6e0406133f3	1311	Turjak
00050000-5682-bf7e-fc47-45c1d5bf12c0	9224	Turnišče
00050000-5682-bf7e-691c-a0a043bdd622	8323	Uršna sela
00050000-5682-bf7e-6df0-bb614ea15b84	1252	Vače
00050000-5682-bf7e-1b47-4fcbee7c6a1f	3320	Velenje 
00050000-5682-bf7e-cde7-5c3291b9c83e	3322	Velenje - poštni predali
00050000-5682-bf7e-773e-7da763149017	8212	Velika Loka
00050000-5682-bf7e-625e-476fd9140861	2274	Velika Nedelja
00050000-5682-bf7e-7fd8-ccf25b1cb88b	9225	Velika Polana
00050000-5682-bf7e-24e3-0736018288d2	1315	Velike Lašče
00050000-5682-bf7e-459e-fbc7d5727c9e	8213	Veliki Gaber
00050000-5682-bf7e-727f-9c0de299e551	9241	Veržej
00050000-5682-bf7e-55f5-4df3189e952a	1312	Videm - Dobrepolje
00050000-5682-bf7e-8901-2040b7e1bc6e	2284	Videm pri Ptuju
00050000-5682-bf7e-b224-9fb734f0f572	8344	Vinica
00050000-5682-bf7e-9992-aba2bc5e7ed4	5271	Vipava
00050000-5682-bf7e-aea2-71cd613fe741	4212	Visoko
00050000-5682-bf7e-3b96-fa8e1a662844	1294	Višnja Gora
00050000-5682-bf7e-95cc-bf03c96c958e	3205	Vitanje
00050000-5682-bf7e-ee0e-f118b6b6ef4c	2255	Vitomarci
00050000-5682-bf7e-099f-dc296ae8807e	1217	Vodice
00050000-5682-bf7e-e007-6aa7396f938e	3212	Vojnik\t
00050000-5682-bf7e-4af0-1df25c33cef5	5293	Volčja Draga
00050000-5682-bf7e-17ce-301325acc482	2232	Voličina
00050000-5682-bf7e-6332-efae729ebbdb	3305	Vransko
00050000-5682-bf7e-01d6-0d4f011b2f72	6217	Vremski Britof
00050000-5682-bf7e-988e-50c0c4314856	1360	Vrhnika
00050000-5682-bf7e-13cc-ec8969480909	2365	Vuhred
00050000-5682-bf7e-cae4-1e36ef1a4c46	2367	Vuzenica
00050000-5682-bf7e-5cc7-5f182d81200a	8292	Zabukovje 
00050000-5682-bf7e-0fcc-7a0645e34adb	1410	Zagorje ob Savi
00050000-5682-bf7e-dec2-799ba03d61f5	1303	Zagradec
00050000-5682-bf7e-bb8c-d4d32c67c923	2283	Zavrč
00050000-5682-bf7e-866d-e82e04554472	8272	Zdole 
00050000-5682-bf7e-a94e-1bb44ab3a7a5	4201	Zgornja Besnica
00050000-5682-bf7e-8504-a97c120e09bb	2242	Zgornja Korena
00050000-5682-bf7e-f8f6-a3eecfbb2ef3	2201	Zgornja Kungota
00050000-5682-bf7e-ce57-242ffc9b9bda	2316	Zgornja Ložnica
00050000-5682-bf7e-eddb-13058a412ba2	2314	Zgornja Polskava
00050000-5682-bf7e-9021-dc3e28f88fc2	2213	Zgornja Velka
00050000-5682-bf7e-1b9c-2d6d0ae901d1	4247	Zgornje Gorje
00050000-5682-bf7e-4be1-ddc0987b67af	4206	Zgornje Jezersko
00050000-5682-bf7e-9434-f91707be2572	2285	Zgornji Leskovec
00050000-5682-bf7e-17fb-fb5bb187eb7d	1432	Zidani Most
00050000-5682-bf7e-72c1-2f325eb1e798	3214	Zreče
00050000-5682-bf7e-394e-2606855cb515	4209	Žabnica
00050000-5682-bf7e-f8da-c92286617634	3310	Žalec
00050000-5682-bf7e-b858-1b7f4464370f	4228	Železniki
00050000-5682-bf7e-457a-dedd6ce9fd44	2287	Žetale
00050000-5682-bf7e-4796-7ccd4de5661a	4226	Žiri
00050000-5682-bf7e-5780-cef479bb8ea8	4274	Žirovnica
00050000-5682-bf7e-41d1-81b8bf1dc763	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 33317213)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 33316777)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 33316525)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5682-bf81-5f91-69c20b03c97c	00080000-5682-bf81-5cf2-0dd23c4f9c49	\N	00040000-5682-bf7e-2c1c-b7f684692fd9	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5682-bf81-e4cf-4ba90e3a0795	00080000-5682-bf81-5cf2-0dd23c4f9c49	\N	00040000-5682-bf7e-2c1c-b7f684692fd9	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5682-bf81-96ec-6c97cc95c11d	00080000-5682-bf81-7e2c-07fac418c7e6	\N	00040000-5682-bf7e-2c1c-b7f684692fd9	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 33316669)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5682-bf7e-5d20-318ff4280d51	novo leto	1	1	\N	t
00430000-5682-bf7e-5635-101e08b4aad9	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5682-bf7e-99d3-ab7a3f10f0b9	dan upora proti okupatorju	27	4	\N	t
00430000-5682-bf7e-5482-ffa644b643f1	praznik dela	1	5	\N	t
00430000-5682-bf7e-0502-de21ee2faa1e	praznik dela	2	5	\N	t
00430000-5682-bf7e-7d87-9816463b5370	dan Primoža Trubarja	8	6	\N	f
00430000-5682-bf7e-28c6-523d9c3c7cc0	dan državnosti	25	6	\N	t
00430000-5682-bf7e-b74e-45c91970ebdc	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5682-bf7e-45fe-2a6dd09bcb29	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5682-bf7e-9ff2-538b647dbf24	dan suverenosti	25	10	\N	f
00430000-5682-bf7e-b5d3-1433db91cf73	dan spomina na mrtve	1	11	\N	t
00430000-5682-bf7e-d03e-e1c76ef6c08b	dan Rudolfa Maistra	23	11	\N	f
00430000-5682-bf7e-89bb-3d829634d869	božič	25	12	\N	t
00430000-5682-bf7e-6de0-8c77b076ce07	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5682-bf7e-c344-be91c7d44dc4	Marijino vnebovzetje	15	8	\N	t
00430000-5682-bf7e-f930-94b2a1b02d1a	dan reformacije	31	10	\N	t
00430000-5682-bf7e-113c-8a82736db293	velikonočna nedelja	27	3	2016	t
00430000-5682-bf7e-8ff9-9827ac6ae48a	velikonočna nedelja	16	4	2017	t
00430000-5682-bf7e-6c5c-fdd10480239b	velikonočna nedelja	1	4	2018	t
00430000-5682-bf7e-a529-ea4924cc6ae5	velikonočna nedelja	21	4	2019	t
00430000-5682-bf7e-bddc-3f64f969d16f	velikonočna nedelja	12	4	2020	t
00430000-5682-bf7e-ce24-2ee11e1eb8d3	velikonočna nedelja	4	4	2021	t
00430000-5682-bf7e-a868-69e2e52b7192	velikonočna nedelja	17	4	2022	t
00430000-5682-bf7e-b298-ce410466aa30	velikonočna nedelja	9	4	2023	t
00430000-5682-bf7e-8b3f-f035b940ea7a	velikonočna nedelja	31	3	2024	t
00430000-5682-bf7e-b565-3e00f801ef18	velikonočna nedelja	20	4	2025	t
00430000-5682-bf7e-15ba-5b4ad1e70bf8	velikonočna nedelja	5	4	2026	t
00430000-5682-bf7e-c90b-139c3c184369	velikonočna nedelja	28	3	2027	t
00430000-5682-bf7e-4ed4-3014d9351718	velikonočna nedelja	16	4	2028	t
00430000-5682-bf7e-4b25-b729a4bce1b0	velikonočna nedelja	1	4	2029	t
00430000-5682-bf7e-a427-cdfc6c095700	velikonočna nedelja	21	4	2030	t
00430000-5682-bf7e-31f6-07a928eb8af1	velikonočni ponedeljek	28	3	2016	t
00430000-5682-bf7e-c687-d71760f3e323	velikonočni ponedeljek	17	4	2017	t
00430000-5682-bf7e-1e93-435d67f6e28d	velikonočni ponedeljek	2	4	2018	t
00430000-5682-bf7e-da51-c53cd49d8b46	velikonočni ponedeljek	22	4	2019	t
00430000-5682-bf7e-df1e-1401ff6a9fe9	velikonočni ponedeljek	13	4	2020	t
00430000-5682-bf7e-4aea-990590784331	velikonočni ponedeljek	5	4	2021	t
00430000-5682-bf7e-9301-658dc666b7da	velikonočni ponedeljek	18	4	2022	t
00430000-5682-bf7e-5779-af302e81986e	velikonočni ponedeljek	10	4	2023	t
00430000-5682-bf7e-87de-65d1c5117cd6	velikonočni ponedeljek	1	4	2024	t
00430000-5682-bf7e-9087-0a29f8f61dab	velikonočni ponedeljek	21	4	2025	t
00430000-5682-bf7e-58b9-24d95fc6fac9	velikonočni ponedeljek	6	4	2026	t
00430000-5682-bf7e-16d5-45a94ef60f5a	velikonočni ponedeljek	29	3	2027	t
00430000-5682-bf7e-e727-48f1a9aa306a	velikonočni ponedeljek	17	4	2028	t
00430000-5682-bf7e-d339-33134632ab3d	velikonočni ponedeljek	2	4	2029	t
00430000-5682-bf7e-27a3-af1732c651d5	velikonočni ponedeljek	22	4	2030	t
00430000-5682-bf7e-143e-ede7f2dc4b78	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5682-bf7e-ee9f-a057bbc3cdf6	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5682-bf7e-adfc-402a10362895	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5682-bf7e-804a-8983b5319bce	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5682-bf7e-2280-12185e7475dd	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5682-bf7e-d5b8-30ebffde9ad6	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5682-bf7e-a214-114ea020e441	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5682-bf7e-8431-6d3cb6a2ac22	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5682-bf7e-a75e-3a37c43ca135	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5682-bf7e-805c-f5268275dbc4	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5682-bf7e-9556-019575d7d75f	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5682-bf7e-652b-8fc001d7794e	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5682-bf7e-2157-cb6f3bf41603	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5682-bf7e-b29a-e26c27ed6bbc	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5682-bf7e-6e8b-baa2aaaa7b98	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 33316629)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 33316641)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 33316789)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 33317227)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 33317237)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5682-bf81-ccab-c99ee25b5997	00080000-5682-bf81-cb70-4ccedabae1a2	0987	AK
00190000-5682-bf81-c248-050db0b16fd1	00080000-5682-bf81-7e2c-07fac418c7e6	0989	AK
00190000-5682-bf81-2c77-31d2b15ff0b1	00080000-5682-bf81-51e1-55c73a555d57	0986	AK
00190000-5682-bf81-23e6-dc883c34324a	00080000-5682-bf81-7ace-1f98ce2e4dec	0984	AK
00190000-5682-bf81-f6a7-61ef54c7cdcd	00080000-5682-bf81-47bf-a5332b67ef7a	0983	AK
00190000-5682-bf81-b93a-05a7898950d9	00080000-5682-bf81-e19a-b787cb35b7b3	0982	AK
00190000-5682-bf83-b28d-10d585692d01	00080000-5682-bf83-3245-9dc767289ea6	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 33317126)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5682-bf81-5f18-9c5b419c09d3	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 33317245)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 33316818)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5682-bf80-fcae-8ae598c76a6f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5682-bf80-4320-3d4295c42512	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5682-bf80-b21b-264eefcd1527	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5682-bf80-0952-a9e94b3629d5	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5682-bf80-33d2-e237d18ae91f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5682-bf80-310f-d6eff1bb45d1	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5682-bf80-e2c1-e25cbbca720c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 33316762)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 33316752)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 33316964)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 33316894)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 33316603)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 33316365)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5682-bf83-3245-9dc767289ea6	00010000-5682-bf7f-3f18-c49e924de3d6	2015-12-29 18:14:43	INS	a:0:{}
2	App\\Entity\\Option	00000000-5682-bf83-bc13-00eca185e4ce	00010000-5682-bf7f-3f18-c49e924de3d6	2015-12-29 18:14:43	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5682-bf83-b28d-10d585692d01	00010000-5682-bf7f-3f18-c49e924de3d6	2015-12-29 18:14:43	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 33316831)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 33316403)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5682-bf7e-e936-a397798dc8ff	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5682-bf7e-ffda-431ad4fdd7eb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5682-bf7e-6ee2-6734db4d7cf3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5682-bf7e-80df-42f2bee2fa67	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5682-bf7e-75bc-c77a5f6d095d	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5682-bf7e-3550-45169b6fe385	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5682-bf7e-d53a-fbd8d878a1c6	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5682-bf7e-39e2-02ed2902b6ee	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5682-bf7e-5add-9c9cade1bc7f	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-bf7e-2459-341fc9a0db24	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-bf7e-1916-702a04a97fff	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-bf7e-b71d-18d9d36eccae	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5682-bf7e-4779-046f01b03606	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5682-bf7e-783c-82109329fbee	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5682-bf7e-7d76-0791bc506a1f	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5682-bf7e-701d-77bb6bf50c5a	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5682-bf7e-5dd7-5e77f92a7a0f	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5682-bf7e-7aad-ca06a933582a	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5682-bf7e-4c77-2df37949457d	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5682-bf7e-127f-fc2b7afdbc5f	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5682-bf7e-2824-aa5466840d48	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5682-bf7e-a1b0-e4131dc5f5c8	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5682-bf7e-1c80-27fa87fa7716	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5682-bf7e-9af0-af5deddce748	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5682-bf7e-413d-80fdf4f59121	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5682-bf7e-aa31-76aa9efe9bc1	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5682-bf7e-8545-45ca07d25e95	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5682-bf7e-2b76-2da10fed3625	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5682-bf7e-c50b-09c81e63a083	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5682-bf7e-d506-11eae09c9372	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5682-bf7e-dada-c9c5656d1a39	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5682-bf7e-5337-c45d6f465dc8	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5682-bf7e-01e0-08868e715266	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5682-bf7e-ad8e-cc4956e23b30	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5682-bf7f-c8b7-b20d24e30310	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5682-bf7f-b515-bfddd8fd71e1	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5682-bf7f-ac6a-639974dd0467	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5682-bf7f-f028-b22166394293	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5682-bf7f-ffe0-fb535c1a2b60	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5682-bf7f-4238-bbd3e98e0320	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5682-bf7f-7a54-8d63d9ba4cc5	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5682-bf7f-5162-cad8433681a4	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5682-bf7f-e6ac-2c5befdaeb1a	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5682-bf7f-cbb3-078eea40a3dd	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5682-bf7f-6db2-22f8c92648de	direktor	minimalne pravice za direktorja	t
00020000-5682-bf7f-5341-8fb79c288cbe	arhivar	arhivar	t
00020000-5682-bf7f-f182-c204c8bd2e5b	dramaturg	dramaturg	t
00020000-5682-bf7f-863c-a6b157040701	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5682-bf7f-564f-fcc710a59d70	poslovni-sekretar	poslovni sekretar	t
00020000-5682-bf7f-9428-16392ab7a7db	vodja-tehnike	vodja tehnike	t
00020000-5682-bf7f-bb19-7cf44502962e	racunovodja	računovodja	t
00020000-5682-bf80-c235-d25870f18d5d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5682-bf80-958e-049797e6d5e4	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-decc-0f3d8d29dc9e	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-a2b0-38682a276e54	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-652e-cfd8c87c1bf1	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-dbf1-eab3d118e1e2	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-5659-4caed3e2fe85	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-518a-9901ac401999	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-e5e5-2a00bff1ea58	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-d1ec-83a5deed4e39	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-516a-f27bcdd21051	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-1536-339e3b50d85a	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-c7b8-57f03297d943	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-dd39-494b85311dd7	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-1413-77ad0546f6e0	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-b1ed-6c3395fd3d6b	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-0f56-366cfc1e0ed0	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-53f7-a538f69a4ec8	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf80-8271-0bc096f98218	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-4924-ca5429c84776	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5682-bf81-0dd9-9c75a00c154d	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-2e2e-a1b166edead0	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-f5bf-58e6c8f37686	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-a667-33803aa4dac3	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-1458-fced452f47d0	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-26b0-1f2a8bab4904	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-20a9-6e32e958955b	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-6450-897bca8521de	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-2c47-da3907b290af	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-6718-1537c3023fe0	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-033a-9bd5b628375e	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-1e85-af6b2688b566	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-fefc-353de128be42	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-d2da-1366a01cdd67	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-de22-3960c0930bcc	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-1c51-0094f0bbe689	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-7687-e9d51d93a948	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-91c1-d5d2bea3a0cc	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5682-bf81-ae32-a9a27314e55c	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 33316387)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5682-bf7f-0437-aad7eaee8ccc	00020000-5682-bf7e-6ee2-6734db4d7cf3
00010000-5682-bf7f-3f18-c49e924de3d6	00020000-5682-bf7e-6ee2-6734db4d7cf3
00010000-5682-bf81-9e2e-39dd57675cb5	00020000-5682-bf80-c235-d25870f18d5d
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf80-958e-049797e6d5e4
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf80-dbf1-eab3d118e1e2
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf80-d1ec-83a5deed4e39
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf80-1536-339e3b50d85a
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf80-dd39-494b85311dd7
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf80-8271-0bc096f98218
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf80-a2b0-38682a276e54
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf81-0dd9-9c75a00c154d
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf81-a667-33803aa4dac3
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf81-26b0-1f2a8bab4904
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf81-6450-897bca8521de
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf81-6718-1537c3023fe0
00010000-5682-bf81-082e-0d4f0d7b658c	00020000-5682-bf81-d2da-1366a01cdd67
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf80-958e-049797e6d5e4
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf80-decc-0f3d8d29dc9e
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf80-a2b0-38682a276e54
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf80-652e-cfd8c87c1bf1
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf80-dd39-494b85311dd7
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf80-0f56-366cfc1e0ed0
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf81-0dd9-9c75a00c154d
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf81-a667-33803aa4dac3
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf81-26b0-1f2a8bab4904
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf81-6450-897bca8521de
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf81-6718-1537c3023fe0
00010000-5682-bf81-0eda-88f7ba4a7678	00020000-5682-bf81-d2da-1366a01cdd67
00010000-5682-bf81-7c89-54d12d4afb27	00020000-5682-bf80-958e-049797e6d5e4
00010000-5682-bf81-7c89-54d12d4afb27	00020000-5682-bf80-decc-0f3d8d29dc9e
00010000-5682-bf81-7c89-54d12d4afb27	00020000-5682-bf80-a2b0-38682a276e54
00010000-5682-bf81-7c89-54d12d4afb27	00020000-5682-bf80-652e-cfd8c87c1bf1
00010000-5682-bf81-7c89-54d12d4afb27	00020000-5682-bf80-1536-339e3b50d85a
00010000-5682-bf81-7c89-54d12d4afb27	00020000-5682-bf80-dd39-494b85311dd7
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf80-decc-0f3d8d29dc9e
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf80-5659-4caed3e2fe85
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf80-516a-f27bcdd21051
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf80-c7b8-57f03297d943
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf80-1536-339e3b50d85a
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf80-53f7-a538f69a4ec8
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf80-dd39-494b85311dd7
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf80-1413-77ad0546f6e0
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-0dd9-9c75a00c154d
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-2e2e-a1b166edead0
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-a667-33803aa4dac3
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-1458-fced452f47d0
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-26b0-1f2a8bab4904
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-20a9-6e32e958955b
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-6450-897bca8521de
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-2c47-da3907b290af
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-6718-1537c3023fe0
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-033a-9bd5b628375e
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-d2da-1366a01cdd67
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-de22-3960c0930bcc
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-7687-e9d51d93a948
00010000-5682-bf81-d32e-d08ea8d0b675	00020000-5682-bf81-91c1-d5d2bea3a0cc
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-decc-0f3d8d29dc9e
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-5659-4caed3e2fe85
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-e5e5-2a00bff1ea58
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-516a-f27bcdd21051
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-c7b8-57f03297d943
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-1536-339e3b50d85a
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-53f7-a538f69a4ec8
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-dd39-494b85311dd7
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-1413-77ad0546f6e0
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf80-b1ed-6c3395fd3d6b
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-0dd9-9c75a00c154d
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-2e2e-a1b166edead0
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-f5bf-58e6c8f37686
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-a667-33803aa4dac3
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-1458-fced452f47d0
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-26b0-1f2a8bab4904
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-20a9-6e32e958955b
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-6450-897bca8521de
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-2c47-da3907b290af
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-6718-1537c3023fe0
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-033a-9bd5b628375e
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-d2da-1366a01cdd67
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-de22-3960c0930bcc
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-1c51-0094f0bbe689
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-7687-e9d51d93a948
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-91c1-d5d2bea3a0cc
00010000-5682-bf81-62ce-0d320e6a5b5f	00020000-5682-bf81-ae32-a9a27314e55c
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-decc-0f3d8d29dc9e
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-a2b0-38682a276e54
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-5659-4caed3e2fe85
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-518a-9901ac401999
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-e5e5-2a00bff1ea58
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-dbf1-eab3d118e1e2
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-516a-f27bcdd21051
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-c7b8-57f03297d943
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-1536-339e3b50d85a
00010000-5682-bf81-10c1-598cd0239337	00020000-5682-bf80-53f7-a538f69a4ec8
00010000-5682-bf81-e40d-fea9d93b8d4f	00020000-5682-bf80-958e-049797e6d5e4
00010000-5682-bf81-e40d-fea9d93b8d4f	00020000-5682-bf80-652e-cfd8c87c1bf1
00010000-5682-bf81-e40d-fea9d93b8d4f	00020000-5682-bf80-dbf1-eab3d118e1e2
00010000-5682-bf81-e40d-fea9d93b8d4f	00020000-5682-bf80-d1ec-83a5deed4e39
00010000-5682-bf81-e40d-fea9d93b8d4f	00020000-5682-bf80-1536-339e3b50d85a
00010000-5682-bf81-e40d-fea9d93b8d4f	00020000-5682-bf80-dd39-494b85311dd7
00010000-5682-bf81-e40d-fea9d93b8d4f	00020000-5682-bf80-8271-0bc096f98218
00010000-5682-bf81-e40d-fea9d93b8d4f	00020000-5682-bf81-1e85-af6b2688b566
00010000-5682-bf81-0587-24cb8fb42ddb	00020000-5682-bf81-4924-ca5429c84776
00010000-5682-bf81-a761-cf9afa3bd0cf	00020000-5682-bf7f-6db2-22f8c92648de
00010000-5682-bf81-1bac-c6741e974753	00020000-5682-bf7f-5341-8fb79c288cbe
00010000-5682-bf81-c2d0-f3447979374e	00020000-5682-bf7f-f182-c204c8bd2e5b
00010000-5682-bf81-1810-ac34f238a3eb	00020000-5682-bf7f-863c-a6b157040701
00010000-5682-bf81-d42d-157d093a9a6e	00020000-5682-bf7f-564f-fcc710a59d70
00010000-5682-bf81-043c-cb9b853c76dc	00020000-5682-bf7f-9428-16392ab7a7db
00010000-5682-bf81-cc61-82c8e3512cc4	00020000-5682-bf7f-bb19-7cf44502962e
\.


--
-- TOC entry 3157 (class 0 OID 33316845)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 33316783)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 33316729)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5682-bf81-892c-9762cb24ed78	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5682-bf81-1e01-7ae155a412b0	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5682-bf81-acb2-5428a6d0d477	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 33316352)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5682-bf7e-1d7a-d136c5de7672	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5682-bf7e-23dd-ec20b4284c57	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5682-bf7e-8841-cd1f1a2d470f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5682-bf7e-cc11-a2682c8cbebd	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5682-bf7e-1571-1a4f4266725d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 33316344)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5682-bf7e-39eb-77e4f0076b4b	00230000-5682-bf7e-cc11-a2682c8cbebd	popa
00240000-5682-bf7e-4a05-d576c958fc69	00230000-5682-bf7e-cc11-a2682c8cbebd	oseba
00240000-5682-bf7e-eeaf-7837d4bf7c84	00230000-5682-bf7e-cc11-a2682c8cbebd	tippopa
00240000-5682-bf7e-ea49-586e6b37d021	00230000-5682-bf7e-cc11-a2682c8cbebd	organizacijskaenota
00240000-5682-bf7e-ec99-776742847b44	00230000-5682-bf7e-cc11-a2682c8cbebd	sezona
00240000-5682-bf7e-0bb4-273d76d32135	00230000-5682-bf7e-cc11-a2682c8cbebd	tipvaje
00240000-5682-bf7e-8999-f48cb2eee8e4	00230000-5682-bf7e-23dd-ec20b4284c57	prostor
00240000-5682-bf7e-f308-6384cdfb0a69	00230000-5682-bf7e-cc11-a2682c8cbebd	besedilo
00240000-5682-bf7e-a3dc-228d9c441ac5	00230000-5682-bf7e-cc11-a2682c8cbebd	uprizoritev
00240000-5682-bf7e-9e47-40dc77cedbc7	00230000-5682-bf7e-cc11-a2682c8cbebd	funkcija
00240000-5682-bf7e-5472-be402961d714	00230000-5682-bf7e-cc11-a2682c8cbebd	tipfunkcije
00240000-5682-bf7e-241c-18cb4cf635bd	00230000-5682-bf7e-cc11-a2682c8cbebd	alternacija
00240000-5682-bf7e-3387-81b09d2c29ca	00230000-5682-bf7e-1d7a-d136c5de7672	pogodba
00240000-5682-bf7e-6c5c-afda6d27812f	00230000-5682-bf7e-cc11-a2682c8cbebd	zaposlitev
00240000-5682-bf7e-f0a7-41603fb38588	00230000-5682-bf7e-cc11-a2682c8cbebd	zvrstuprizoritve
00240000-5682-bf7e-c1ca-90fd0628cd8a	00230000-5682-bf7e-1d7a-d136c5de7672	programdela
00240000-5682-bf7e-d9e2-0b1a67c510a6	00230000-5682-bf7e-cc11-a2682c8cbebd	zapis
\.


--
-- TOC entry 3106 (class 0 OID 33316339)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
87fd6890-0c5e-405b-8dd1-5074393c4303	00240000-5682-bf7e-39eb-77e4f0076b4b	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 33316911)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5682-bf81-03ea-4f7e1adae777	000e0000-5682-bf81-220e-761be178dedd	00080000-5682-bf81-5cf2-0dd23c4f9c49	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5682-bf7e-f20a-332867226710
00270000-5682-bf81-69c9-5816df0a6f9e	000e0000-5682-bf81-220e-761be178dedd	00080000-5682-bf81-5cf2-0dd23c4f9c49	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5682-bf7e-f20a-332867226710
\.


--
-- TOC entry 3122 (class 0 OID 33316487)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 33316739)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5682-bf81-0708-88398e9c1d34	00180000-5682-bf81-7e16-ef3a0289e6d4	000c0000-5682-bf81-7ef4-b440d418adb0	00090000-5682-bf81-90f3-42c1540d7049	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-bf81-58b1-7351327afeba	00180000-5682-bf81-7e16-ef3a0289e6d4	000c0000-5682-bf81-945b-71f5d1cb7a68	00090000-5682-bf81-24e2-710a29e8936b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-bf81-d49e-ecfc1b999494	00180000-5682-bf81-7e16-ef3a0289e6d4	000c0000-5682-bf81-89be-ec21a36f47ed	00090000-5682-bf81-1583-f5c1abf906f8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-bf81-6a0d-7df945278c7c	00180000-5682-bf81-7e16-ef3a0289e6d4	000c0000-5682-bf81-c490-895a9cc69159	00090000-5682-bf81-22bd-207060f36053	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-bf81-edaa-5c2ff94a45c8	00180000-5682-bf81-7e16-ef3a0289e6d4	000c0000-5682-bf81-f134-ee57ba9d2377	00090000-5682-bf81-a4fa-46dbc640f1c5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5682-bf81-5efc-db9eb8e8702f	00180000-5682-bf81-64af-079133c47ee1	\N	00090000-5682-bf81-a4fa-46dbc640f1c5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5682-bf81-97b7-be24d5df8218	00180000-5682-bf81-64af-079133c47ee1	\N	00090000-5682-bf81-24e2-710a29e8936b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 33316952)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5682-bf7e-8cdb-8ad6f04815a3	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5682-bf7e-5f7d-f8cae93beaae	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5682-bf7e-daa9-a0b7e4ae9a68	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5682-bf7e-322f-77eed52974c8	04	Režija	Režija	Režija	umetnik	30
000f0000-5682-bf7e-c5cc-f68b7fcd24d9	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5682-bf7e-f763-55e2f166f8c5	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5682-bf7e-1c23-d2d7e38479f8	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5682-bf7e-dbee-ae4c25aeae50	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5682-bf7e-6ab8-aff930f5ab60	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5682-bf7e-436c-f22b9e048c2e	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5682-bf7e-2180-1008ad3f6766	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5682-bf7e-1a50-89f601839782	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5682-bf7e-a353-5d97d5a26e03	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5682-bf7e-4971-3bdae7b32b74	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5682-bf7e-85ee-15ee96adb7a0	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5682-bf7e-a23b-c8185fd69679	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5682-bf7e-c6cd-e3be3b0c8702	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5682-bf7e-b82b-5faba33364f8	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 33316438)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5682-bf80-2e8d-dfde3d77de07	0001	šola	osnovna ali srednja šola
00400000-5682-bf80-2ef9-f059dc706588	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5682-bf80-31e4-d93ccd6233fe	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 33317257)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5682-bf7e-e710-08fd8f3d8b5e	01	Velika predstava	f	1.00	1.00
002b0000-5682-bf7e-c6e2-130803bf218e	02	Mala predstava	f	0.50	0.50
002b0000-5682-bf7e-e46b-dbc7a2dc55eb	03	Mala koprodukcija	t	0.40	1.00
002b0000-5682-bf7e-f665-b25c0592bed1	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5682-bf7e-7387-d768faa032ff	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 33316719)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5682-bf7e-3586-a8063d11b6d3	0001	prva vaja	prva vaja
00420000-5682-bf7e-da9f-e777cf6b92fe	0002	tehnična vaja	tehnična vaja
00420000-5682-bf7e-7f58-d35dcc9c082f	0003	lučna vaja	lučna vaja
00420000-5682-bf7e-b7d1-bab5de7a3c96	0004	kostumska vaja	kostumska vaja
00420000-5682-bf7e-d919-e7dc25857f8b	0005	foto vaja	foto vaja
00420000-5682-bf7e-c78e-87dbf6b02878	0006	1. glavna vaja	1. glavna vaja
00420000-5682-bf7e-e723-e3f8045f7df2	0007	2. glavna vaja	2. glavna vaja
00420000-5682-bf7e-2cac-005f629beb0b	0008	1. generalka	1. generalka
00420000-5682-bf7e-f77a-8eb8bed2d979	0009	2. generalka	2. generalka
00420000-5682-bf7e-aac1-d671ecaddee5	0010	odprta generalka	odprta generalka
00420000-5682-bf7e-9be6-42707d4afef3	0011	obnovitvena vaja	obnovitvena vaja
00420000-5682-bf7e-72ec-3182611db2ce	0012	italijanka	krajša "obnovitvena" vaja
00420000-5682-bf7e-07ed-c0388d2cd410	0013	pevska vaja	pevska vaja
00420000-5682-bf7e-8c10-f8be9237a3e0	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5682-bf7e-43ab-6c271c8d6891	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 33316560)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 33316374)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5682-bf7f-3f18-c49e924de3d6	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROrLpJFYnGpwGyQsWCCqDPQdZqB97TddK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5682-bf81-0385-af625281217e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5682-bf81-fd29-227ab93d50c9	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5682-bf81-0882-5c5b126aebef	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5682-bf81-93f4-42dbf5809fa1	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5682-bf81-8d3f-8c0a9671cd3f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5682-bf81-113c-bd86dcf61961	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5682-bf81-5a2b-0d5bdbb3e042	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5682-bf81-bd84-47f8484ee793	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5682-bf81-c646-2a2f8ddd768a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5682-bf81-9e2e-39dd57675cb5	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5682-bf81-7fce-826434cfa6c6	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5682-bf81-082e-0d4f0d7b658c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5682-bf81-0eda-88f7ba4a7678	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5682-bf81-7c89-54d12d4afb27	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5682-bf81-d32e-d08ea8d0b675	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5682-bf81-62ce-0d320e6a5b5f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5682-bf81-10c1-598cd0239337	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5682-bf81-e40d-fea9d93b8d4f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5682-bf81-0587-24cb8fb42ddb	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5682-bf81-a761-cf9afa3bd0cf	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5682-bf81-1bac-c6741e974753	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5682-bf81-c2d0-f3447979374e	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5682-bf81-1810-ac34f238a3eb	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5682-bf81-d42d-157d093a9a6e	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5682-bf81-043c-cb9b853c76dc	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5682-bf81-cc61-82c8e3512cc4	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5682-bf7f-0437-aad7eaee8ccc	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 33317002)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5682-bf81-beec-7fc66709b480	00160000-5682-bf80-6328-df108dc2f2e0	\N	00140000-5682-bf7e-f1e6-1287b23f5533	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5682-bf80-33d2-e237d18ae91f
000e0000-5682-bf81-220e-761be178dedd	00160000-5682-bf80-19ca-0ab40564940c	\N	00140000-5682-bf7e-883c-ba6cf5fc1453	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5682-bf80-310f-d6eff1bb45d1
000e0000-5682-bf81-5e72-4c55f2d64bc2	\N	\N	00140000-5682-bf7e-883c-ba6cf5fc1453	00190000-5682-bf81-ccab-c99ee25b5997	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5682-bf80-33d2-e237d18ae91f
000e0000-5682-bf81-b6eb-a1eb68efd7fc	\N	\N	00140000-5682-bf7e-883c-ba6cf5fc1453	00190000-5682-bf81-ccab-c99ee25b5997	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5682-bf80-33d2-e237d18ae91f
000e0000-5682-bf81-4492-da6ef6e458cc	\N	\N	00140000-5682-bf7e-883c-ba6cf5fc1453	00190000-5682-bf81-ccab-c99ee25b5997	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-f46d-8a75cae3d66f	\N	\N	00140000-5682-bf7e-883c-ba6cf5fc1453	00190000-5682-bf81-ccab-c99ee25b5997	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-e451-2be57f9fb64e	\N	\N	00140000-5682-bf7e-033a-4886e27b6696	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-d2be-c2a1fbffdb92	\N	\N	00140000-5682-bf7e-033a-4886e27b6696	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-01e2-ae32a4dff897	\N	\N	00140000-5682-bf7e-033a-4886e27b6696	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-aa92-4b9672d8c3e1	\N	\N	00140000-5682-bf7e-033a-4886e27b6696	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-c2f0-af6e8954c862	\N	\N	00140000-5682-bf7e-033a-4886e27b6696	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-db7e-67518a50956c	\N	\N	00140000-5682-bf7e-033a-4886e27b6696	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-d0b8-8d3da7370f42	\N	\N	00140000-5682-bf7e-033a-4886e27b6696	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-6477-f56d0c47e607	\N	\N	00140000-5682-bf7e-033a-4886e27b6696	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
000e0000-5682-bf81-f3c0-59a6cfe60c2e	\N	\N	00140000-5682-bf7e-033a-4886e27b6696	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5682-bf80-fcae-8ae598c76a6f
\.


--
-- TOC entry 3136 (class 0 OID 33316659)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5682-bf81-6e95-63ecea291d27	\N	000e0000-5682-bf81-220e-761be178dedd	1	
00200000-5682-bf81-8afd-96fdbaea813d	\N	000e0000-5682-bf81-220e-761be178dedd	2	
00200000-5682-bf81-ebe9-9efe3fe52b4d	\N	000e0000-5682-bf81-220e-761be178dedd	3	
00200000-5682-bf81-1eb7-4a5cf65322b5	\N	000e0000-5682-bf81-220e-761be178dedd	4	
00200000-5682-bf81-747a-33bd97b7f07c	\N	000e0000-5682-bf81-220e-761be178dedd	5	
\.


--
-- TOC entry 3153 (class 0 OID 33316810)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 33316925)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5682-bf7e-053c-58d434b82a93	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5682-bf7e-b73f-029a1ab53c12	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5682-bf7e-6b92-6b3d27fb2908	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5682-bf7e-56eb-f1d71d368005	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5682-bf7e-e3a2-1664f4f8feae	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5682-bf7e-4df3-c7878bb97f78	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5682-bf7e-c37a-3a755f8e38ce	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5682-bf7e-2c08-13c3c350df07	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5682-bf7e-f20a-332867226710	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5682-bf7e-354a-316e1cb9f421	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5682-bf7e-72a5-f5171735cade	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5682-bf7e-72fe-be2c8c734c49	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5682-bf7e-691a-c7f0753c7070	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5682-bf7e-46ef-94c1ad6f10b0	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5682-bf7e-facb-18ebb2b8eeb5	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5682-bf7e-a443-a66742aba299	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5682-bf7e-e2a0-e12042b023a2	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5682-bf7e-cf04-e51353c42f2c	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5682-bf7e-f992-505c7693816e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5682-bf7e-1ead-6f9a5cfeddbc	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5682-bf7e-51e6-01fdcccf83d9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5682-bf7e-9072-9a7c8358bc00	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5682-bf7e-6762-b65cb20e8f77	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5682-bf7e-1e74-cee9c36addf0	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5682-bf7e-e7e9-5e5385cd8e45	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5682-bf7e-48fa-b2ad9095987f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5682-bf7e-316b-53b09612d5d8	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5682-bf7e-1f35-f324593f2d98	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 33317307)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 33317276)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 33317319)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 33316883)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5682-bf81-fe56-cab606b118b6	00090000-5682-bf81-24e2-710a29e8936b	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-bf81-178d-0fd2a28cc0c1	00090000-5682-bf81-1583-f5c1abf906f8	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-bf81-b003-9d6bd16171ad	00090000-5682-bf81-4f12-1379b26d8036	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-bf81-b135-47a057106c25	00090000-5682-bf81-25e0-0f1cd6babd2c	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-bf81-bb22-43d71103c376	00090000-5682-bf81-7850-43abc21b11ce	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5682-bf81-2655-8239f59fdf47	00090000-5682-bf81-f8ff-a63be720a180	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 33316703)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 33316992)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5682-bf7e-f1e6-1287b23f5533	01	Drama	drama (SURS 01)
00140000-5682-bf7e-b2f9-bd37f0027749	02	Opera	opera (SURS 02)
00140000-5682-bf7e-865a-8f5c55adf0c8	03	Balet	balet (SURS 03)
00140000-5682-bf7e-0bc1-d9081917f734	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5682-bf7e-033a-4886e27b6696	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5682-bf7e-883c-ba6cf5fc1453	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5682-bf7e-2577-356fef664eaa	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 33316873)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 33316437)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 33317051)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 33317041)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 33316428)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 33316908)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 33316950)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 33317360)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 33316691)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 33316713)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 33316718)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 33317274)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 33316586)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 33317120)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 33316869)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 33316657)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 33316624)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 33316600)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 33316775)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 33317337)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 33317344)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 33317368)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 33138688)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 33316802)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 33316558)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 33316456)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 33316520)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 33316483)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 33316417)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 33316402)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 33316808)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 33316844)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 33316987)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 33316511)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 33316546)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 33317225)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 33316781)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 33316536)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 33316676)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 33316645)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 33316637)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 33316793)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 33317234)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 33317242)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 33317212)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 33317255)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 33316826)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 33316766)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 33316757)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 33316974)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 33316901)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 33316612)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 33316373)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 33316835)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 33316391)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 33316411)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 33316853)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 33316788)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 33316737)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 33316361)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 33316349)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 33316343)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 33316921)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 33316492)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 33316748)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 33316961)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 33316445)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 33317267)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 33316726)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 33316571)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 33316386)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 33317020)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 33316666)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 33316816)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 33316933)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 33317317)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 33317301)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 33317325)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 33316891)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 33316707)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 33317000)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 33316881)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 33316701)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 33316702)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 33316700)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 33316699)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 33316698)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 33316922)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 33316923)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 33316924)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 33317339)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 33317338)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 33316513)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 33316514)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 33316809)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 33317305)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 33317304)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 33317306)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 33317303)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 33317302)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 33316795)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 33316794)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 33316667)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 33316668)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 33316870)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 33316872)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 33316871)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 33316602)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 33316601)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 33317256)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 33316989)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 33316990)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 33316991)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 33317326)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 33317025)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 33317022)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 33317026)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 33317024)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 33317023)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 33316573)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 33316572)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 33316486)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 33316836)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 33316418)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 33316419)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 33316856)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 33316855)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 33316854)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 33316523)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 33316522)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 33316524)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 33316640)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 33316638)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 33316639)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 33316351)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 33316761)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 33316759)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 33316758)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 33316760)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 33316392)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 33316393)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 33316817)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 33317361)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 33316910)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 33316909)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 33317369)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 33317370)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 33316782)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 33316902)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 33316903)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 33317125)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 33317124)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 33317121)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 33317122)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 33317123)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 33316538)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 33316537)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 33316539)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 33316830)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 33316829)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 33317235)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 33317236)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 33317055)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 33317056)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 33317053)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 33317054)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 33316892)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 33316893)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 33316770)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 33316769)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 33316767)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 33316768)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 33317043)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 33317042)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 33316613)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 33316627)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 33316626)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 33316625)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 33316628)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 33316658)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 33316646)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 33316647)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 33317226)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 33317275)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 33317345)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 33317346)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 33316458)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 33316457)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 33316493)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 33316494)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 33316708)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 33316751)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 33316750)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 33316749)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 33316693)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 33316694)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 33316697)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 33316692)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 33316696)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 33316695)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 33316512)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 33316446)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 33316447)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 33316587)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 33316589)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 33316588)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 33316590)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 33316776)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 33316988)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 33317021)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 33316962)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 33316963)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 33316484)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 33316485)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 33316882)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 33316362)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 33316559)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 33316521)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 33316350)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 33317268)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 33316828)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 33316827)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 33316727)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 33316728)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 33317052)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 33316547)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 33317001)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 33317318)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 33317243)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 33317244)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 33316951)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 33316738)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 33316412)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 33317541)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 33317546)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 33317571)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 33317561)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 33317536)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 33317556)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 33317566)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 33317551)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 33317741)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 33317746)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 33317751)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 33317916)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 33317911)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 33317426)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 33317431)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 33317656)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 33317896)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 33317891)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 33317901)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 33317886)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 33317881)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 33317651)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 33317646)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 33317526)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 33317531)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 33317696)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 33317706)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 33317701)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 33317481)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 33317476)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 33317636)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 33317871)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 33317756)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 33317761)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 33317766)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 33317906)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 33317786)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 33317771)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 33317791)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 33317781)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 33317776)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 33317471)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 33317466)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 33317411)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 33317406)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 33317676)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 33317386)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 33317391)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 33317691)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 33317686)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 33317681)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 33317441)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 33317436)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 33317446)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 33317506)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 33317496)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 33317501)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 33317371)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 33317611)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 33317601)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 33317596)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 33317606)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 33317376)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 33317381)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 33317661)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 33317931)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 33317736)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 33317731)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 33317936)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 33317941)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 33317641)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 33317721)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 33317726)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 33317846)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 33317841)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 33317826)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 33317831)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 33317836)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 33317456)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 33317451)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 33317461)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 33317671)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 33317666)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 33317856)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 33317861)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 33317816)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 33317821)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 33317806)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 33317811)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 33317711)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 33317716)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 33317631)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 33317626)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 33317616)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 33317621)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 33317801)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 33317796)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 33317486)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 33317491)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 33317521)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 33317511)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 33317516)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 33317851)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 33317866)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 33317876)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 33317921)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 33317926)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 33317401)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 33317396)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 33317416)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 33317421)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 33317576)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 33317591)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 33317586)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 33317581)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-29 18:14:45 CET

--
-- PostgreSQL database dump complete
--

