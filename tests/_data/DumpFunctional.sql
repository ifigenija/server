--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-17 14:58:44 CET

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
-- TOC entry 183 (class 1259 OID 27701303)
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
-- TOC entry 237 (class 1259 OID 27701917)
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
-- TOC entry 236 (class 1259 OID 27701900)
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
-- TOC entry 182 (class 1259 OID 27701296)
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
-- TOC entry 181 (class 1259 OID 27701294)
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
-- TOC entry 227 (class 1259 OID 27701777)
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
-- TOC entry 230 (class 1259 OID 27701807)
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
-- TOC entry 251 (class 1259 OID 27702208)
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
-- TOC entry 203 (class 1259 OID 27701551)
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
-- TOC entry 205 (class 1259 OID 27701583)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 27701588)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 27702130)
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
-- TOC entry 194 (class 1259 OID 27701448)
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
-- TOC entry 238 (class 1259 OID 27701930)
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
-- TOC entry 223 (class 1259 OID 27701731)
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
-- TOC entry 200 (class 1259 OID 27701522)
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
-- TOC entry 197 (class 1259 OID 27701488)
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
-- TOC entry 195 (class 1259 OID 27701465)
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
-- TOC entry 212 (class 1259 OID 27701645)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 27702188)
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
-- TOC entry 250 (class 1259 OID 27702201)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 27702223)
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
-- TOC entry 216 (class 1259 OID 27701670)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 27701422)
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
-- TOC entry 185 (class 1259 OID 27701322)
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
-- TOC entry 189 (class 1259 OID 27701389)
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
-- TOC entry 186 (class 1259 OID 27701333)
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
-- TOC entry 178 (class 1259 OID 27701268)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 27701287)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 27701677)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 27701711)
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
-- TOC entry 233 (class 1259 OID 27701848)
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
-- TOC entry 188 (class 1259 OID 27701369)
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
-- TOC entry 191 (class 1259 OID 27701414)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 27702075)
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
-- TOC entry 213 (class 1259 OID 27701651)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 27701399)
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
-- TOC entry 202 (class 1259 OID 27701543)
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
-- TOC entry 198 (class 1259 OID 27701503)
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
-- TOC entry 199 (class 1259 OID 27701515)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 27701663)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 27702089)
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
-- TOC entry 242 (class 1259 OID 27702099)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 27701998)
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
-- TOC entry 243 (class 1259 OID 27702107)
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
-- TOC entry 219 (class 1259 OID 27701692)
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
-- TOC entry 211 (class 1259 OID 27701636)
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
-- TOC entry 210 (class 1259 OID 27701626)
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
-- TOC entry 232 (class 1259 OID 27701837)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 27701767)
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
-- TOC entry 196 (class 1259 OID 27701477)
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
-- TOC entry 175 (class 1259 OID 27701239)
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
-- TOC entry 174 (class 1259 OID 27701237)
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
-- TOC entry 220 (class 1259 OID 27701705)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 27701277)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 27701261)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 27701719)
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
-- TOC entry 214 (class 1259 OID 27701657)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 27701603)
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
-- TOC entry 173 (class 1259 OID 27701226)
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
-- TOC entry 172 (class 1259 OID 27701218)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 27701213)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 27701784)
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
-- TOC entry 187 (class 1259 OID 27701361)
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
-- TOC entry 209 (class 1259 OID 27701613)
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
-- TOC entry 231 (class 1259 OID 27701825)
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
-- TOC entry 184 (class 1259 OID 27701312)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 27702118)
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
-- TOC entry 207 (class 1259 OID 27701593)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 27701434)
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
-- TOC entry 176 (class 1259 OID 27701248)
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
-- TOC entry 235 (class 1259 OID 27701875)
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
-- TOC entry 201 (class 1259 OID 27701533)
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
-- TOC entry 218 (class 1259 OID 27701684)
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
-- TOC entry 229 (class 1259 OID 27701798)
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
-- TOC entry 247 (class 1259 OID 27702168)
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
-- TOC entry 246 (class 1259 OID 27702137)
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
-- TOC entry 248 (class 1259 OID 27702180)
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
-- TOC entry 225 (class 1259 OID 27701756)
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
-- TOC entry 204 (class 1259 OID 27701577)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 27701865)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 27701746)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 27701299)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 27701242)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 27701303)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-564b-3290-1abf-7dff59c175c1	10	30	Otroci	Abonma za otroke	200
000a0000-564b-3290-33d2-101b4b4de340	20	60	Mladina	Abonma za mladino	400
000a0000-564b-3290-9995-dcefa8390395	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 27701917)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-564b-3291-44a4-33d964000893	000d0000-564b-3291-335c-1105cb35b758	\N	00090000-564b-3291-8404-387f4b4740bc	000b0000-564b-3291-b0c1-67047e702e62	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-564b-3291-c8f9-dced0a373642	000d0000-564b-3291-b502-ab7c82f5f209	00100000-564b-3291-47af-ae7759d940e6	00090000-564b-3291-9dd8-3d762fcc76f3	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-564b-3291-1e86-6fabdc27534d	000d0000-564b-3291-00f2-3f7b16f33267	00100000-564b-3291-327c-c376ea6fafbd	00090000-564b-3291-6c9f-cc8104d73337	\N	0003	t	\N	2015-11-17	\N	2	t	\N	f	f
000c0000-564b-3291-6367-d4dbb210f45d	000d0000-564b-3291-6d82-35798b9e5752	\N	00090000-564b-3291-5311-cb22bfcca5df	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-564b-3291-ba4c-fbfd65ab1981	000d0000-564b-3291-d6e7-b199cdd302a3	\N	00090000-564b-3291-2b1c-d70c554ea0b0	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-564b-3291-3dfd-bcbf90fd1f74	000d0000-564b-3291-b72f-16d44abcc0b7	\N	00090000-564b-3291-3e74-edc8854222dd	000b0000-564b-3291-3c7f-bfa1c953765e	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-564b-3291-d6ef-d26951ff38d0	000d0000-564b-3291-9ef6-af6fe724daf8	00100000-564b-3291-c5e9-7efc5da80236	00090000-564b-3291-e634-cb9e5ae8f057	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-564b-3291-566b-947aca48b954	000d0000-564b-3291-3270-fbe3b8f7a0ca	\N	00090000-564b-3291-dfc5-aef8bc0a4e0f	000b0000-564b-3291-b8d9-251ea2417e5b	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-564b-3291-1f70-de784ad124ed	000d0000-564b-3291-9ef6-af6fe724daf8	00100000-564b-3291-05f4-2cbfd7ad7703	00090000-564b-3291-5d7a-8e90b6812ca7	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-564b-3291-53fb-977a7f0843a3	000d0000-564b-3291-9ef6-af6fe724daf8	00100000-564b-3291-a0a2-f9150432456e	00090000-564b-3291-19a9-b9b9b520bb58	\N	0010	t	\N	2015-11-17	\N	16	f	\N	f	t
000c0000-564b-3291-6fa5-73b0572bb006	000d0000-564b-3291-9ef6-af6fe724daf8	00100000-564b-3291-736f-9a2780006178	00090000-564b-3291-f563-3d421c6f632e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-564b-3291-7c97-9a9a9afc02ea	000d0000-564b-3291-cd9f-e14a2f5d12f7	00100000-564b-3291-47af-ae7759d940e6	00090000-564b-3291-9dd8-3d762fcc76f3	000b0000-564b-3291-1d7f-fa005bd16252	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 27701900)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 27701296)
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
-- TOC entry 3149 (class 0 OID 27701777)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-564b-3291-1b77-18351430d357	00160000-564b-3290-cdd8-202b4ec73cb1	00090000-564b-3291-7e7a-6e845b689e0c	aizv	10	t
003d0000-564b-3291-1f21-2e19c289a8d8	00160000-564b-3290-cdd8-202b4ec73cb1	00090000-564b-3291-34f6-edfeeb7e79bf	apri	14	t
003d0000-564b-3291-64c8-c13257f0fd17	00160000-564b-3290-be1d-37078574458a	00090000-564b-3291-e850-99f97a84e55c	aizv	11	t
003d0000-564b-3291-25c0-1449344b3aa8	00160000-564b-3290-0b8b-24ff6064c6d2	00090000-564b-3291-5367-0f0df6e5fdfc	aizv	12	t
003d0000-564b-3291-acd8-6fa2771ca23a	00160000-564b-3290-cdd8-202b4ec73cb1	00090000-564b-3291-8625-fa02c9f84da1	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 27701807)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-564b-3290-cdd8-202b4ec73cb1	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-564b-3290-be1d-37078574458a	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-564b-3290-0b8b-24ff6064c6d2	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 27702208)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 27701551)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-564b-3291-b732-5a0690f75043	\N	\N	00200000-564b-3291-efa1-3a926ab79725	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-564b-3291-ddf1-428aeb3ff9e9	\N	\N	00200000-564b-3291-dfae-230935dbca3c	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-564b-3291-a9df-cc2420b0b11f	\N	\N	00200000-564b-3291-34a4-79c4e3ddf25c	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-564b-3291-ec0b-bd20f10e83ee	\N	\N	00200000-564b-3291-bcf8-df7da3d06a47	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-564b-3291-673e-a9ded33488b1	\N	\N	00200000-564b-3291-fd50-15fdf5d8e8ad	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 27701583)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 27701588)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 27702130)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 27701448)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-564b-328e-b127-5bf40ab7aeb1	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-564b-328e-fac8-9b0d2e4e25c5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-564b-328e-c5a9-5afa12c87168	AL	ALB	008	Albania 	Albanija	\N
00040000-564b-328e-5b8a-2b9bcec0d20f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-564b-328e-e8d5-ca744a876868	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-564b-328e-742f-ee12ea20e45b	AD	AND	020	Andorra 	Andora	\N
00040000-564b-328e-01a5-e45cacdb440b	AO	AGO	024	Angola 	Angola	\N
00040000-564b-328e-bad7-7d1b98597ba1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-564b-328e-760e-7269ed53be71	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-564b-328e-0cbe-33ea6f937d86	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-564b-328e-2da1-34f5d37e8685	AR	ARG	032	Argentina 	Argenitna	\N
00040000-564b-328e-1f34-93cf5742ec71	AM	ARM	051	Armenia 	Armenija	\N
00040000-564b-328e-cfd3-4497ad0eab9c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-564b-328e-e1ba-b2ca0946e0bc	AU	AUS	036	Australia 	Avstralija	\N
00040000-564b-328e-bcb0-902bdb612abb	AT	AUT	040	Austria 	Avstrija	\N
00040000-564b-328e-b4f4-b6bb65dbc952	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-564b-328e-c6a7-9c81f4aedc5a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-564b-328e-f3a8-0082cd10ef42	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-564b-328e-d7f1-13ef561e7a55	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-564b-328e-98d5-c08671a4fd92	BB	BRB	052	Barbados 	Barbados	\N
00040000-564b-328e-3f98-28e4c40f4a61	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-564b-328e-4696-bc6935669efe	BE	BEL	056	Belgium 	Belgija	\N
00040000-564b-328e-bc89-7fa9303b71ce	BZ	BLZ	084	Belize 	Belize	\N
00040000-564b-328e-3517-cbb54a825ada	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-564b-328e-59a8-16b391c446ed	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-564b-328e-4aac-a6ff2ff2252f	BT	BTN	064	Bhutan 	Butan	\N
00040000-564b-328e-ca66-0803925f171b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-564b-328e-3d20-b9b27a38aca4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-564b-328e-e0d8-557265b5ea2e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-564b-328e-8b85-fdd4f422e6e3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-564b-328e-8c6b-bdeff9df8983	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-564b-328e-3734-5a32daf0ec28	BR	BRA	076	Brazil 	Brazilija	\N
00040000-564b-328e-914d-9697dbada296	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-564b-328e-9b68-5acf453a76f9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-564b-328e-3c13-35fffbe8b556	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-564b-328e-097a-c9c63c6d189d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-564b-328e-2dba-8e925bdf0432	BI	BDI	108	Burundi 	Burundi 	\N
00040000-564b-328e-f691-63d3c61767a3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-564b-328e-b926-305cee82df03	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-564b-328e-cab8-f8f8b5f3bdde	CA	CAN	124	Canada 	Kanada	\N
00040000-564b-328e-74cb-f3e048fdb8dd	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-564b-328e-086b-03d4bd333447	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-564b-328e-2933-ed87c1a8cf12	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-564b-328e-57ad-aae82ffb21bf	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-564b-328e-19c4-37465a0e4397	CL	CHL	152	Chile 	Čile	\N
00040000-564b-328e-5c58-1dab6bc9f2e5	CN	CHN	156	China 	Kitajska	\N
00040000-564b-328e-07d6-e0b1f826821b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-564b-328e-9673-ff380fff6288	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-564b-328e-4d35-711a890d14fa	CO	COL	170	Colombia 	Kolumbija	\N
00040000-564b-328e-b6f4-e644fbb59711	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-564b-328e-873a-96cb6b074783	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-564b-328e-15f8-6149849a499a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-564b-328e-cdf4-b179eeb8139a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-564b-328e-5182-49b74ae29df2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-564b-328e-0d84-57f1c52a0e37	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-564b-328e-7da0-293b1009c49d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-564b-328e-a5ce-1c38e699ca04	CU	CUB	192	Cuba 	Kuba	\N
00040000-564b-328e-ac00-9ccc951460d5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-564b-328e-87fb-7374bfed4dde	CY	CYP	196	Cyprus 	Ciper	\N
00040000-564b-328e-1a13-c222cc93eb78	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-564b-328e-eb42-1c5694183aea	DK	DNK	208	Denmark 	Danska	\N
00040000-564b-328e-3160-3ebbccbfa8bd	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-564b-328e-b2c0-94d9dc6d5a21	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-564b-328e-2596-4dd39f63b0cf	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-564b-328e-1537-1cfb3e59174c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-564b-328e-009b-9cab9e6cf047	EG	EGY	818	Egypt 	Egipt	\N
00040000-564b-328e-6792-daae173dd014	SV	SLV	222	El Salvador 	Salvador	\N
00040000-564b-328e-3986-99b42bcb8f05	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-564b-328e-a27a-72a2e186f80f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-564b-328e-a080-fcb5faacc807	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-564b-328e-895a-a49078345e84	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-564b-328e-ea63-0548313ae59f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-564b-328e-c5dc-b57c97070ae0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-564b-328e-1370-094b445e22c0	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-564b-328e-4198-a588fc0d91bb	FI	FIN	246	Finland 	Finska	\N
00040000-564b-328e-00be-e8e194b63237	FR	FRA	250	France 	Francija	\N
00040000-564b-328e-c531-659ee96c7d60	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-564b-328e-f642-010793ae8d7a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-564b-328e-9c34-92d8f656a3f6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-564b-328e-171b-942300c14731	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-564b-328e-f450-fc9875109103	GA	GAB	266	Gabon 	Gabon	\N
00040000-564b-328e-bc24-f4457c87eecd	GM	GMB	270	Gambia 	Gambija	\N
00040000-564b-328e-5bc3-716a491aecb1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-564b-328e-7385-a45272a81689	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-564b-328e-f518-ac8c1ae3302a	GH	GHA	288	Ghana 	Gana	\N
00040000-564b-328e-d084-980c3d59135c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-564b-328e-7244-5c679538cc32	GR	GRC	300	Greece 	Grčija	\N
00040000-564b-328e-b046-63e347857b2e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-564b-328e-932b-28b3ffe8649e	GD	GRD	308	Grenada 	Grenada	\N
00040000-564b-328e-380a-386972493872	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-564b-328e-4868-5b34fa99247d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-564b-328e-e3a1-9b9cf4dad0c3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-564b-328e-4fdb-cae93a9c8f23	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-564b-328e-cb3d-c1a892305e57	GN	GIN	324	Guinea 	Gvineja	\N
00040000-564b-328e-dcdf-c54db60dfa36	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-564b-328e-0c09-3fc59d7805b4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-564b-328e-bed8-8ed3f769c51b	HT	HTI	332	Haiti 	Haiti	\N
00040000-564b-328e-7f4c-49a1be9dbae2	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-564b-328e-3867-ab43e7dafe9a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-564b-328e-f761-2eaf9ea20e6e	HN	HND	340	Honduras 	Honduras	\N
00040000-564b-328e-0ae5-bf5de7ced994	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-564b-328e-7464-8d28f94d0b78	HU	HUN	348	Hungary 	Madžarska	\N
00040000-564b-328e-a463-e9406ee06d68	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-564b-328e-cc24-0cd14db860d9	IN	IND	356	India 	Indija	\N
00040000-564b-328e-ab9f-6674803a206f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-564b-328e-4ecd-c447e894b3b7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-564b-328e-ebcc-5c86c4d8535c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-564b-328e-d102-c9a982698c46	IE	IRL	372	Ireland 	Irska	\N
00040000-564b-328e-e5ed-1735e7d6bcca	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-564b-328e-0bc8-6e6f443c07b1	IL	ISR	376	Israel 	Izrael	\N
00040000-564b-328e-529e-594acd5cc2dd	IT	ITA	380	Italy 	Italija	\N
00040000-564b-328e-2ed3-8d186499cfa1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-564b-328e-3d16-4f0c55f5e63f	JP	JPN	392	Japan 	Japonska	\N
00040000-564b-328e-c95c-a51fdbb4c3f7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-564b-328e-b327-39a0f801a194	JO	JOR	400	Jordan 	Jordanija	\N
00040000-564b-328e-a586-18ebe7644a44	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-564b-328e-edd9-a5dd7faa1d46	KE	KEN	404	Kenya 	Kenija	\N
00040000-564b-328e-ad8a-a336de2689c5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-564b-328e-7352-689c44418341	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-564b-328e-79cc-c292948cf0b8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-564b-328e-bda2-f6489f43c909	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-564b-328e-0889-c9e7b1518ff1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-564b-328e-ffeb-661db0ac031d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-564b-328e-b028-f3bf6a00a8c2	LV	LVA	428	Latvia 	Latvija	\N
00040000-564b-328e-7eee-9c7b034a41c0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-564b-328e-ee7f-9e9b1eff9e14	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-564b-328e-d8c0-2f36123968c8	LR	LBR	430	Liberia 	Liberija	\N
00040000-564b-328e-43a0-70a0143a706c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-564b-328e-83d2-18a913fc6e07	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-564b-328e-f7a4-0b53f29846d5	LT	LTU	440	Lithuania 	Litva	\N
00040000-564b-328e-625b-0563792a87fe	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-564b-328e-ab69-290c17451b69	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-564b-328e-239e-53b8251371bb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-564b-328e-6227-66b1e60e47b7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-564b-328e-21d7-d9958e674ff0	MW	MWI	454	Malawi 	Malavi	\N
00040000-564b-328e-907f-488ee1773546	MY	MYS	458	Malaysia 	Malezija	\N
00040000-564b-328e-5392-a143bf178eaa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-564b-328e-dd81-ab4ec5cf3e62	ML	MLI	466	Mali 	Mali	\N
00040000-564b-328e-aee4-e671f4741e0b	MT	MLT	470	Malta 	Malta	\N
00040000-564b-328e-d9bd-2d7f6315e8ab	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-564b-328e-2642-b5c6931ddbd3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-564b-328e-98de-3c44be06e8d3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-564b-328e-dd6e-512613c67426	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-564b-328e-32f9-ec38c311bf89	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-564b-328e-71ca-ac245777fa75	MX	MEX	484	Mexico 	Mehika	\N
00040000-564b-328e-a0c1-f51fbf0f17e1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-564b-328e-ab87-d4aeb51adc17	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-564b-328e-5df3-ad09885e42b3	MC	MCO	492	Monaco 	Monako	\N
00040000-564b-328e-a26c-3e17d190a17e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-564b-328e-639c-4c37e2ee0cdb	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-564b-328e-891c-e77b2ae7f62a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-564b-328e-fdf4-85a839688408	MA	MAR	504	Morocco 	Maroko	\N
00040000-564b-328e-0137-bb7cd3996663	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-564b-328e-f0e0-6e61e6c3b113	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-564b-328e-4da0-d2f359cfb5a0	NA	NAM	516	Namibia 	Namibija	\N
00040000-564b-328e-d1ec-031f480fe5cd	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-564b-328e-2817-b187896addf8	NP	NPL	524	Nepal 	Nepal	\N
00040000-564b-328e-ab55-60c40a57b6ad	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-564b-328e-478a-c801601c8a0c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-564b-328e-5cb6-93a2a114e451	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-564b-328e-4343-ff3e68639132	NE	NER	562	Niger 	Niger 	\N
00040000-564b-328e-5384-91e6c350ab78	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-564b-328e-0a5d-d4615590e80d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-564b-328e-b20f-d3dc4bdbe64c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-564b-328e-5c54-3a0e8380137d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-564b-328e-7635-20c12e1ea70c	NO	NOR	578	Norway 	Norveška	\N
00040000-564b-328e-54f3-597ab52f2b8b	OM	OMN	512	Oman 	Oman	\N
00040000-564b-328e-24c4-b143c3b9d4bd	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-564b-328e-61b5-8a60feb248a6	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-564b-328e-fe7f-3d1329a9ee30	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-564b-328e-3b36-e6848c52832b	PA	PAN	591	Panama 	Panama	\N
00040000-564b-328e-4afc-bb55c5d4f01a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-564b-328e-79e9-6dba24166c61	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-564b-328e-e318-5c829435511d	PE	PER	604	Peru 	Peru	\N
00040000-564b-328e-d81d-e9d2d94efb4d	PH	PHL	608	Philippines 	Filipini	\N
00040000-564b-328e-ab60-7cfa4a769a0d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-564b-328e-bf1c-97d6614b1993	PL	POL	616	Poland 	Poljska	\N
00040000-564b-328e-80d6-d6a2165b5af0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-564b-328e-e496-a701a8d14541	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-564b-328e-e813-54dd170ba4aa	QA	QAT	634	Qatar 	Katar	\N
00040000-564b-328e-9c64-f3f7bad4c7e7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-564b-328e-b205-72bd2c4e655e	RO	ROU	642	Romania 	Romunija	\N
00040000-564b-328e-2914-eca043b72bb8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-564b-328e-ccff-c2bd188c2156	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-564b-328e-2661-02fcf795cf63	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-564b-328e-d04f-c65e55069e24	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-564b-328e-c4a7-f697f0ae4672	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-564b-328e-f10b-85794779a189	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-564b-328e-16de-4a4edc0f06a8	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-564b-328e-dabe-9ddfa94e11f2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-564b-328e-bbe5-a9bf71b0fd06	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-564b-328e-eb2a-e6d6e9405df5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-564b-328e-ee2d-e362aa35d159	SM	SMR	674	San Marino 	San Marino	\N
00040000-564b-328e-dfe3-309a20814c37	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-564b-328e-96b3-13a37a396eb6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-564b-328e-294c-17a8522e18bd	SN	SEN	686	Senegal 	Senegal	\N
00040000-564b-328e-0629-fffd3a5b63a7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-564b-328e-c110-9b3e6684c706	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-564b-328e-4a78-c272f41356c3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-564b-328e-6ba8-1a662b209a5b	SG	SGP	702	Singapore 	Singapur	\N
00040000-564b-328e-6f72-99ecb1fd8b81	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-564b-328e-dc03-07140a766d8f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-564b-328e-e819-6412f0afd00d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-564b-328e-73c6-cc4094ee943d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-564b-328e-fafa-a465e44da037	SO	SOM	706	Somalia 	Somalija	\N
00040000-564b-328e-619c-0855ad50abcf	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-564b-328e-6a14-4f25da916fb0	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-564b-328e-2232-c8905a4677a5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-564b-328e-b546-93c90f195190	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-564b-328e-a272-88a81e2d0498	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-564b-328e-b17c-93f0d785ae9d	SD	SDN	729	Sudan 	Sudan	\N
00040000-564b-328e-0476-b5007f6d7f13	SR	SUR	740	Suriname 	Surinam	\N
00040000-564b-328e-4e9b-d792dc72427e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-564b-328e-1e20-fc4f58e9cc06	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-564b-328e-6eca-07fbbf80d727	SE	SWE	752	Sweden 	Švedska	\N
00040000-564b-328e-2bd6-09794fe7ed3b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-564b-328e-67ed-2a48aee6505d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-564b-328e-5f57-422c22ac7595	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-564b-328e-6b43-fff970f855b2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-564b-328e-09bf-1971ee50354d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-564b-328e-0521-9c51ea2e225a	TH	THA	764	Thailand 	Tajska	\N
00040000-564b-328e-9196-ff6345346c18	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-564b-328e-efb0-fca911c07b41	TG	TGO	768	Togo 	Togo	\N
00040000-564b-328e-7bfb-2af1b92919bf	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-564b-328e-ffe0-62c3c577f2f6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-564b-328e-546c-401815c708fd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-564b-328e-952a-43e09c136499	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-564b-328e-3b29-576a91eb1064	TR	TUR	792	Turkey 	Turčija	\N
00040000-564b-328e-9644-d364cf9efd03	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-564b-328e-4de0-9132d686b0dc	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564b-328e-3e41-6df0edbc1106	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-564b-328e-3dbb-1260830cedb1	UG	UGA	800	Uganda 	Uganda	\N
00040000-564b-328e-8d4a-b547d8e33c96	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-564b-328e-565c-94fc518380a4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-564b-328e-37bc-ca8b5f362cc4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-564b-328e-3b9a-0773fc8f82f7	US	USA	840	United States 	Združene države Amerike	\N
00040000-564b-328e-cc6e-38ba606ac228	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-564b-328e-c710-4814f20133c5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-564b-328e-3768-d9616ae93e80	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-564b-328e-d5fd-fa98b3be47f4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-564b-328e-9825-8cd024e6ee71	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-564b-328e-7299-450489d1b10e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-564b-328e-4b46-8a7fc786eef8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564b-328e-9531-2f0d33ab37fb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-564b-328e-1bbd-c7939ac95a61	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-564b-328e-2767-9fb9080dab91	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-564b-328e-524e-943b6cbee4eb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-564b-328e-9f16-dfb23832ac5c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-564b-328e-201f-6ad9b16cf30d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 27701930)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-564b-3291-e495-d609c62ecaa3	000e0000-564b-3291-a46c-444eb5aa8cda	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564b-328e-aaeb-da6bb8cfac61	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564b-3291-ac2b-65a9f0490e82	000e0000-564b-3291-0dd5-1036694d33bf	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564b-328e-c10b-693753ba2be4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564b-3291-10b2-5211ce58a150	000e0000-564b-3291-6fbc-cd4ed7f7fc88	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564b-328e-aaeb-da6bb8cfac61	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564b-3291-9a57-74dd0294b062	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564b-3291-bd11-c7dd1d556756	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 27701731)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-564b-3291-9ef6-af6fe724daf8	000e0000-564b-3291-0dd5-1036694d33bf	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-564b-328e-7019-b5bcf8faa639
000d0000-564b-3291-335c-1105cb35b758	000e0000-564b-3291-0dd5-1036694d33bf	000c0000-564b-3291-44a4-33d964000893	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-564b-328e-7019-b5bcf8faa639
000d0000-564b-3291-b502-ab7c82f5f209	000e0000-564b-3291-0dd5-1036694d33bf	000c0000-564b-3291-c8f9-dced0a373642	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-564b-328e-4cb3-8b6880e01664
000d0000-564b-3291-00f2-3f7b16f33267	000e0000-564b-3291-0dd5-1036694d33bf	000c0000-564b-3291-1e86-6fabdc27534d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-564b-328e-264c-d3c3b5b7ab5e
000d0000-564b-3291-6d82-35798b9e5752	000e0000-564b-3291-0dd5-1036694d33bf	000c0000-564b-3291-6367-d4dbb210f45d	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-564b-328e-010c-60ad969b8b79
000d0000-564b-3291-d6e7-b199cdd302a3	000e0000-564b-3291-0dd5-1036694d33bf	000c0000-564b-3291-ba4c-fbfd65ab1981	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-564b-328e-010c-60ad969b8b79
000d0000-564b-3291-b72f-16d44abcc0b7	000e0000-564b-3291-0dd5-1036694d33bf	000c0000-564b-3291-3dfd-bcbf90fd1f74	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-564b-328e-7019-b5bcf8faa639
000d0000-564b-3291-3270-fbe3b8f7a0ca	000e0000-564b-3291-0dd5-1036694d33bf	000c0000-564b-3291-566b-947aca48b954	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-564b-328e-4f16-d23041ec4dd0
000d0000-564b-3291-cd9f-e14a2f5d12f7	000e0000-564b-3291-0dd5-1036694d33bf	000c0000-564b-3291-7c97-9a9a9afc02ea	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-564b-328e-332c-a1674cdd486f
\.


--
-- TOC entry 3122 (class 0 OID 27701522)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 27701488)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 27701465)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-564b-3291-b550-98d804233f18	00080000-564b-3291-8788-04f2bd526f67	00090000-564b-3291-19a9-b9b9b520bb58	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 27701645)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 27702188)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-564b-3291-cbac-666165af29ae	00010000-564b-328e-919d-fe417d0ba4fd	\N	Prva mapa	Root mapa	2015-11-17 14:58:41	2015-11-17 14:58:41	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 27702201)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 27702223)
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
-- TOC entry 3138 (class 0 OID 27701670)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 27701422)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-564b-328e-3d1b-1f4bba993ad3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-564b-328e-52b9-1af345ea8f6b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-564b-328e-3dc1-b2a14ac73abe	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-564b-328e-4b3a-6fdc597f6ad0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-564b-328e-76a4-44b9a12b5978	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-564b-328e-3ca6-5d1ed91af57e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-564b-328e-0cca-b4757a83030f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-564b-328e-be52-d0b15419f528	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564b-328e-b1b7-2277bfd01a66	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564b-328e-8a79-8e21b76785cb	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-564b-328e-9275-65764de1bbc7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-564b-328e-4a00-ac89971f8491	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-564b-328e-c29b-95e2c2f364f1	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-564b-328e-0057-5ce308e3f0fc	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-564b-3290-6e79-d1fcb577aaf4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-564b-3290-f4f5-a6c567c3521e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-564b-3290-40c8-9df67adf62c4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-564b-3290-151c-9a36a551fb55	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-564b-3290-53d4-4a28599a3132	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-564b-3292-3bcd-a091d4b7194a	application.tenant.maticnopodjetje	string	s:36:"00080000-564b-3292-eb25-2d8594499fe6";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 27701322)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-564b-3290-49bc-cf9b330a623b	00000000-564b-3290-6e79-d1fcb577aaf4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-564b-3290-65b2-46e9cbf73fbb	00000000-564b-3290-6e79-d1fcb577aaf4	00010000-564b-328e-919d-fe417d0ba4fd	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-564b-3290-93cb-cdb1259fdbfe	00000000-564b-3290-f4f5-a6c567c3521e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 27701389)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-564b-3291-6efb-c0a4091a1b30	\N	00100000-564b-3291-47af-ae7759d940e6	00100000-564b-3291-327c-c376ea6fafbd	01	Gledališče Nimbis
00410000-564b-3291-3ab2-86ecdf90e8ff	00410000-564b-3291-6efb-c0a4091a1b30	00100000-564b-3291-47af-ae7759d940e6	00100000-564b-3291-327c-c376ea6fafbd	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 27701333)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-564b-3291-8404-387f4b4740bc	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-564b-3291-5311-cb22bfcca5df	00010000-564b-3290-72c4-b482e07439d4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-564b-3291-6c9f-cc8104d73337	00010000-564b-3290-fe90-488e0843c404	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-564b-3291-5d7a-8e90b6812ca7	00010000-564b-3290-7d7a-a13032054e88	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-564b-3291-c487-e3e0055fa039	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-564b-3291-3e74-edc8854222dd	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-564b-3291-f563-3d421c6f632e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-564b-3291-e634-cb9e5ae8f057	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-564b-3291-19a9-b9b9b520bb58	00010000-564b-3290-c268-ced0ded25780	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-564b-3291-9dd8-3d762fcc76f3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-564b-3291-f844-b1fdf8267fa3	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564b-3291-2b1c-d70c554ea0b0	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-564b-3291-dfc5-aef8bc0a4e0f	00010000-564b-3290-5edb-4ff801698e4b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564b-3291-7e7a-6e845b689e0c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-564b-3291-34f6-edfeeb7e79bf	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-564b-3291-e850-99f97a84e55c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-564b-3291-5367-0f0df6e5fdfc	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564b-3291-8625-fa02c9f84da1	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564b-3291-35ad-f9dee6fbeed0	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-564b-3291-2913-dc1bc8874c40	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-564b-3291-33c8-38cc0eb27631	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 27701268)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-564b-328e-0caf-89e68194699c	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-564b-328e-33be-257d9192bcb1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-564b-328e-1172-8fb9a21fa539	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-564b-328e-ed69-af8b599f9ca2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-564b-328e-91b3-7d6fc44824d2	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-564b-328e-1381-d875cee2bbfb	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-564b-328e-21ac-88094b12e0a0	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-564b-328e-c30b-bd66d7868da0	Abonma-read	Abonma - branje	t
00030000-564b-328e-d30d-23f617f1931a	Abonma-write	Abonma - spreminjanje	t
00030000-564b-328e-4377-cc3c84835aaa	Alternacija-read	Alternacija - branje	t
00030000-564b-328e-5b1f-a0b94e2feef8	Alternacija-write	Alternacija - spreminjanje	t
00030000-564b-328e-3ce7-e1c07edd2d84	Arhivalija-read	Arhivalija - branje	t
00030000-564b-328e-d216-e5cbc0f9fb4f	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-564b-328e-faa9-e84b36b4244b	AuthStorage-read	AuthStorage - branje	t
00030000-564b-328e-8963-21abbca84bd2	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-564b-328e-80ea-1f115c572aa1	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-564b-328e-66ac-be52acc0e820	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-564b-328e-e650-2880f1d99e2f	Besedilo-read	Besedilo - branje	t
00030000-564b-328e-2461-c81f7da86e65	Besedilo-write	Besedilo - spreminjanje	t
00030000-564b-328e-2aa8-ba9ef0c0b04a	Dogodek-read	Dogodek - branje	t
00030000-564b-328e-06ee-fbefcfda8887	Dogodek-write	Dogodek - spreminjanje	t
00030000-564b-328e-5b41-d3d637636081	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-564b-328e-94a0-e816e6f4dae9	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-564b-328e-e232-85cd7aa7db92	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-564b-328e-3d82-2810fd6fdb8a	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-564b-328e-ed04-356917427d89	DogodekTrait-read	DogodekTrait - branje	t
00030000-564b-328e-6003-e6567874243d	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-564b-328e-b42a-13b8d0fc5123	DrugiVir-read	DrugiVir - branje	t
00030000-564b-328e-578e-facf898e3da8	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-564b-328e-e2da-924eb6a5a247	Drzava-read	Drzava - branje	t
00030000-564b-328e-8b02-71334395d7bf	Drzava-write	Drzava - spreminjanje	t
00030000-564b-328e-05e5-b2213360ec71	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-564b-328e-39cc-851ac3517a61	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-564b-328e-f2d0-c1f2e7f87267	Funkcija-read	Funkcija - branje	t
00030000-564b-328e-bd4d-e60a2b2b5325	Funkcija-write	Funkcija - spreminjanje	t
00030000-564b-328e-b7e4-845d942b3092	Gostovanje-read	Gostovanje - branje	t
00030000-564b-328e-5bbe-5e0bbb604a8d	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-564b-328e-3142-01a9933f7852	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-564b-328e-0508-04afbd160b9d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-564b-328e-6d81-eff082e76625	Kupec-read	Kupec - branje	t
00030000-564b-328e-6817-9d699b587a70	Kupec-write	Kupec - spreminjanje	t
00030000-564b-328e-2db5-20626dda519c	NacinPlacina-read	NacinPlacina - branje	t
00030000-564b-328e-99b7-cec49d8075df	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-564b-328e-6a23-8de8aa62af4f	Option-read	Option - branje	t
00030000-564b-328e-2822-c2abf6576b98	Option-write	Option - spreminjanje	t
00030000-564b-328e-e5c5-d9fa8b924bf9	OptionValue-read	OptionValue - branje	t
00030000-564b-328e-e5b3-31a5cc5eb067	OptionValue-write	OptionValue - spreminjanje	t
00030000-564b-328e-58e3-51df8dc0fc73	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-564b-328e-4742-adf4158bf130	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-564b-328e-2b4f-50ebd2988765	Oseba-read	Oseba - branje	t
00030000-564b-328e-817b-4bc99673b91f	Oseba-write	Oseba - spreminjanje	t
00030000-564b-328e-4027-1d8fa06b9f94	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-564b-328e-e807-42c1c2d604d2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-564b-328e-ee46-6e9881275df2	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-564b-328e-c0f0-522f357314a1	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-564b-328e-9e2e-b8afa61c3da7	Pogodba-read	Pogodba - branje	t
00030000-564b-328e-b055-8594ccd22fb4	Pogodba-write	Pogodba - spreminjanje	t
00030000-564b-328e-0854-33678a264127	Popa-read	Popa - branje	t
00030000-564b-328e-8d2f-ae937e7388e7	Popa-write	Popa - spreminjanje	t
00030000-564b-328e-114c-d9586e12adc4	Posta-read	Posta - branje	t
00030000-564b-328e-32be-6acca8106ee5	Posta-write	Posta - spreminjanje	t
00030000-564b-328e-4437-cc878fdbcdd8	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-564b-328e-515b-574fecd4641a	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-564b-328e-a374-e8ae584ac41d	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-564b-328e-a13e-732665a3d026	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-564b-328e-cfbc-6a35a1335d2a	PostniNaslov-read	PostniNaslov - branje	t
00030000-564b-328e-806f-e6ce504d97a5	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-564b-328e-af78-36dd78dcd28f	Praznik-read	Praznik - branje	t
00030000-564b-328e-bd94-acdcbe450d61	Praznik-write	Praznik - spreminjanje	t
00030000-564b-328e-c261-0687f71fd212	Predstava-read	Predstava - branje	t
00030000-564b-328e-07ef-2b24967b4abd	Predstava-write	Predstava - spreminjanje	t
00030000-564b-328e-7100-63ab6ea6e81e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-564b-328e-baf2-fd73411e216a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-564b-328e-cc30-8ad70f27f749	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-564b-328e-24a1-6f73c8ceae73	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-564b-328e-7212-64011200e720	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-564b-328e-09e3-273e47a02f5c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-564b-328e-dcfa-659f1bfb7388	ProgramDela-read	ProgramDela - branje	t
00030000-564b-328e-3367-40551c691b8c	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-564b-328e-bb61-10eae0e6800d	ProgramFestival-read	ProgramFestival - branje	t
00030000-564b-328e-aa54-6e6a0aefad14	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-564b-328e-854d-a3b0ec23f466	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-564b-328e-fbb3-be39d7f2c911	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-564b-328e-0f3f-1919f2273669	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-564b-328e-e8f1-314ea059e281	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-564b-328e-7f4e-32d681ad2c7e	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-564b-328e-c03a-eea6f4e2dcc0	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-564b-328e-787e-c102ea3a4234	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-564b-328e-72b6-f6389e27856c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-564b-328e-7279-ac2eb3af2d82	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-564b-328e-a1d1-b62f4ec4d165	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-564b-328e-929a-62bcf41664b3	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-564b-328e-47de-b4db76628c25	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-564b-328e-aad1-f98ff5f6c7bd	ProgramRazno-read	ProgramRazno - branje	t
00030000-564b-328e-a537-2f425b00439f	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-564b-328e-d04a-a9700fd1a56a	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-564b-328e-b147-a91411b0e034	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-564b-328e-aecc-ebed38e942bb	Prostor-read	Prostor - branje	t
00030000-564b-328e-2fed-b73ac156d09e	Prostor-write	Prostor - spreminjanje	t
00030000-564b-328e-3550-854f8ee48b3d	Racun-read	Racun - branje	t
00030000-564b-328e-185b-b682b9a76e81	Racun-write	Racun - spreminjanje	t
00030000-564b-328e-f8a4-1107b889b9db	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-564b-328e-8e89-3d34b69a4d0b	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-564b-328e-fcf0-4bc2d23fd737	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-564b-328e-e775-768b0c5a573a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-564b-328e-4a46-aff145613315	Rekvizit-read	Rekvizit - branje	t
00030000-564b-328e-a499-2fd1f3ef818d	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-564b-328e-c680-f49afdebfcaa	Revizija-read	Revizija - branje	t
00030000-564b-328e-2637-d4aa97317dc6	Revizija-write	Revizija - spreminjanje	t
00030000-564b-328e-2309-83191c1a273c	Rezervacija-read	Rezervacija - branje	t
00030000-564b-328e-38d0-93a1c1e31aaa	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-564b-328e-3bec-359cbef3168a	SedezniRed-read	SedezniRed - branje	t
00030000-564b-328e-0d85-0004ceae1935	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-564b-328e-7496-3f3202dfd0c4	Sedez-read	Sedez - branje	t
00030000-564b-328e-75cd-879d81d365f4	Sedez-write	Sedez - spreminjanje	t
00030000-564b-328e-3ea5-ace3da510358	Sezona-read	Sezona - branje	t
00030000-564b-328e-ac83-9544b5eefc51	Sezona-write	Sezona - spreminjanje	t
00030000-564b-328e-9302-f7c2f08c4666	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-564b-328e-6354-8e23ffe5d2e2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-564b-328e-b5c0-832754a67897	Stevilcenje-read	Stevilcenje - branje	t
00030000-564b-328e-4163-8a96df069d3b	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-564b-328e-af1b-f52637fb6ae2	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-564b-328e-71ef-b5ffc0f401d3	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-564b-328e-7ce2-9a18daaf3450	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-564b-328e-7c9c-000205f95f6a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-564b-328e-32e1-85c53b33201d	Telefonska-read	Telefonska - branje	t
00030000-564b-328e-0f32-80ee56b588a8	Telefonska-write	Telefonska - spreminjanje	t
00030000-564b-328e-5aad-082287b53999	TerminStoritve-read	TerminStoritve - branje	t
00030000-564b-328e-54be-bc83145d5f27	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-564b-328e-f2c6-82b3f1f98248	TipFunkcije-read	TipFunkcije - branje	t
00030000-564b-328e-a0bc-6e0d591a81ce	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-564b-328e-0539-554dd1c0a26a	TipPopa-read	TipPopa - branje	t
00030000-564b-328e-06c9-ec46acaee5c4	TipPopa-write	TipPopa - spreminjanje	t
00030000-564b-328e-d19b-dc04b06f4e97	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-564b-328e-8aaf-87fc32b87253	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-564b-328e-dd72-44faf74bbbb8	TipVaje-read	TipVaje - branje	t
00030000-564b-328e-6698-27e8ba98c58b	TipVaje-write	TipVaje - spreminjanje	t
00030000-564b-328e-12b0-f4be93f55d4d	Trr-read	Trr - branje	t
00030000-564b-328e-5153-0e47e103c5bc	Trr-write	Trr - spreminjanje	t
00030000-564b-328e-ca26-b4c0ef3a7968	Uprizoritev-read	Uprizoritev - branje	t
00030000-564b-328e-5eea-4e1b2a046e55	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-564b-328e-9ccc-92ced1753f41	Vaja-read	Vaja - branje	t
00030000-564b-328e-f5a8-371582eb23d1	Vaja-write	Vaja - spreminjanje	t
00030000-564b-328e-1f60-1695ee1da5c2	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-564b-328e-fb4d-e7f014a2c550	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-564b-328e-e1e3-58cf9fb2342b	VrstaStroska-read	VrstaStroska - branje	t
00030000-564b-328e-820f-1a339f7d6802	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-564b-328e-59e0-b3036a6944bc	Zaposlitev-read	Zaposlitev - branje	t
00030000-564b-328e-d27a-ac21eb2e300a	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-564b-328e-12a9-825fe5f7a37d	Zasedenost-read	Zasedenost - branje	t
00030000-564b-328e-3eda-52134a7eca7e	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-564b-328e-4113-5e1aa5168dcc	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-564b-328e-d840-5bd1ab7bdd70	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-564b-328e-4403-6f0a8d9d9c9e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-564b-328e-b966-1221ed45ceae	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-564b-328e-3c6f-9e71a5b999d3	Job-read	Branje opravil - samo zase - branje	t
00030000-564b-328e-41b5-e28ef0b2ebc9	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-564b-328e-d07c-2202234996e8	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-564b-328e-9a34-ef780bd61403	Report-read	Report - branje	t
00030000-564b-328e-260e-4166d90f5be5	Report-write	Report - spreminjanje	t
00030000-564b-328e-541f-010fa0470ca3	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-564b-328e-7453-6d6bc99f3689	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-564b-328e-3124-ea26c153f855	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-564b-328e-983d-e46be8dd8c7e	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-564b-328e-993d-ea42d6f89549	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-564b-328e-f075-3307ee999943	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-564b-328e-5c70-31d7b513231a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-564b-328e-ea6a-5a1e72b06261	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-564b-328e-95cd-04b88fbe41dc	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564b-328e-3455-7cea296fc441	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564b-328e-4c0d-2d65802890ce	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-564b-328e-36cb-be50721279f8	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-564b-328e-ba46-1dad5f66b1e1	Datoteka-write	Datoteka - spreminjanje	t
00030000-564b-328e-e1fe-dccc4701ed05	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 27701287)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-564b-328e-0dc7-2b68286d2c60	00030000-564b-328e-33be-257d9192bcb1
00020000-564b-328e-b9b1-06fb9225e8cc	00030000-564b-328e-e2da-924eb6a5a247
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-c30b-bd66d7868da0
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-d30d-23f617f1931a
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-4377-cc3c84835aaa
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-5b1f-a0b94e2feef8
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-3ce7-e1c07edd2d84
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-2aa8-ba9ef0c0b04a
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-ed69-af8b599f9ca2
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-06ee-fbefcfda8887
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-e2da-924eb6a5a247
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-8b02-71334395d7bf
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-f2d0-c1f2e7f87267
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-bd4d-e60a2b2b5325
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-b7e4-845d942b3092
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-5bbe-5e0bbb604a8d
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-3142-01a9933f7852
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-0508-04afbd160b9d
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-6a23-8de8aa62af4f
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-e5c5-d9fa8b924bf9
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-2b4f-50ebd2988765
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-817b-4bc99673b91f
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-0854-33678a264127
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-8d2f-ae937e7388e7
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-114c-d9586e12adc4
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-32be-6acca8106ee5
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-cfbc-6a35a1335d2a
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-806f-e6ce504d97a5
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-c261-0687f71fd212
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-07ef-2b24967b4abd
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-7212-64011200e720
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-09e3-273e47a02f5c
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-aecc-ebed38e942bb
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-2fed-b73ac156d09e
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-fcf0-4bc2d23fd737
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-e775-768b0c5a573a
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-4a46-aff145613315
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-a499-2fd1f3ef818d
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-3ea5-ace3da510358
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-ac83-9544b5eefc51
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-f2c6-82b3f1f98248
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-ca26-b4c0ef3a7968
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-5eea-4e1b2a046e55
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-9ccc-92ced1753f41
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-f5a8-371582eb23d1
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-12a9-825fe5f7a37d
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-3eda-52134a7eca7e
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-4113-5e1aa5168dcc
00020000-564b-328e-bf26-5195fa28bd15	00030000-564b-328e-4403-6f0a8d9d9c9e
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-c30b-bd66d7868da0
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-3ce7-e1c07edd2d84
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-2aa8-ba9ef0c0b04a
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-e2da-924eb6a5a247
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-b7e4-845d942b3092
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-3142-01a9933f7852
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-0508-04afbd160b9d
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-6a23-8de8aa62af4f
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-e5c5-d9fa8b924bf9
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-2b4f-50ebd2988765
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-817b-4bc99673b91f
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-0854-33678a264127
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-114c-d9586e12adc4
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-cfbc-6a35a1335d2a
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-806f-e6ce504d97a5
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-c261-0687f71fd212
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-aecc-ebed38e942bb
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-fcf0-4bc2d23fd737
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-4a46-aff145613315
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-3ea5-ace3da510358
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-32e1-85c53b33201d
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-0f32-80ee56b588a8
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-12b0-f4be93f55d4d
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-5153-0e47e103c5bc
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-59e0-b3036a6944bc
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-d27a-ac21eb2e300a
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-4113-5e1aa5168dcc
00020000-564b-328e-a26a-6a35c51ce4ef	00030000-564b-328e-4403-6f0a8d9d9c9e
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-c30b-bd66d7868da0
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-4377-cc3c84835aaa
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-3ce7-e1c07edd2d84
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-d216-e5cbc0f9fb4f
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-e650-2880f1d99e2f
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-5b41-d3d637636081
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-2aa8-ba9ef0c0b04a
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-e2da-924eb6a5a247
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-f2d0-c1f2e7f87267
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-b7e4-845d942b3092
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-3142-01a9933f7852
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-6a23-8de8aa62af4f
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-e5c5-d9fa8b924bf9
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-2b4f-50ebd2988765
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-0854-33678a264127
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-114c-d9586e12adc4
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-c261-0687f71fd212
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-7212-64011200e720
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-aecc-ebed38e942bb
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-fcf0-4bc2d23fd737
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-4a46-aff145613315
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-3ea5-ace3da510358
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-f2c6-82b3f1f98248
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-9ccc-92ced1753f41
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-12a9-825fe5f7a37d
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-4113-5e1aa5168dcc
00020000-564b-328e-bd3b-888fdf0c6190	00030000-564b-328e-4403-6f0a8d9d9c9e
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-c30b-bd66d7868da0
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-d30d-23f617f1931a
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-5b1f-a0b94e2feef8
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-3ce7-e1c07edd2d84
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-2aa8-ba9ef0c0b04a
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-e2da-924eb6a5a247
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-b7e4-845d942b3092
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-6a23-8de8aa62af4f
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-e5c5-d9fa8b924bf9
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-0854-33678a264127
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-114c-d9586e12adc4
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-c261-0687f71fd212
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-aecc-ebed38e942bb
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-fcf0-4bc2d23fd737
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-4a46-aff145613315
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-3ea5-ace3da510358
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-f2c6-82b3f1f98248
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-4113-5e1aa5168dcc
00020000-564b-328e-946a-f7b821d552c7	00030000-564b-328e-4403-6f0a8d9d9c9e
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-c30b-bd66d7868da0
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-3ce7-e1c07edd2d84
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-2aa8-ba9ef0c0b04a
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-e2da-924eb6a5a247
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-b7e4-845d942b3092
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-6a23-8de8aa62af4f
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-e5c5-d9fa8b924bf9
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-0854-33678a264127
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-114c-d9586e12adc4
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-c261-0687f71fd212
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-aecc-ebed38e942bb
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-fcf0-4bc2d23fd737
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-4a46-aff145613315
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-3ea5-ace3da510358
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-5aad-082287b53999
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-1172-8fb9a21fa539
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-f2c6-82b3f1f98248
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-4113-5e1aa5168dcc
00020000-564b-328e-0e20-18c729c5b899	00030000-564b-328e-4403-6f0a8d9d9c9e
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-0caf-89e68194699c
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-33be-257d9192bcb1
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-c30b-bd66d7868da0
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-d30d-23f617f1931a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-4377-cc3c84835aaa
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-5b1f-a0b94e2feef8
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-3ce7-e1c07edd2d84
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-d216-e5cbc0f9fb4f
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-80ea-1f115c572aa1
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-66ac-be52acc0e820
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-e650-2880f1d99e2f
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-2461-c81f7da86e65
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-5b41-d3d637636081
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-94a0-e816e6f4dae9
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-2aa8-ba9ef0c0b04a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-ed69-af8b599f9ca2
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-06ee-fbefcfda8887
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-b42a-13b8d0fc5123
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-578e-facf898e3da8
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-e2da-924eb6a5a247
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-8b02-71334395d7bf
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-05e5-b2213360ec71
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-39cc-851ac3517a61
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-f2d0-c1f2e7f87267
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-bd4d-e60a2b2b5325
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-b7e4-845d942b3092
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-5bbe-5e0bbb604a8d
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-3142-01a9933f7852
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-0508-04afbd160b9d
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-6d81-eff082e76625
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-6817-9d699b587a70
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-2db5-20626dda519c
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-99b7-cec49d8075df
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-6a23-8de8aa62af4f
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-e5c5-d9fa8b924bf9
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-e5b3-31a5cc5eb067
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-2822-c2abf6576b98
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-58e3-51df8dc0fc73
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-4742-adf4158bf130
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-2b4f-50ebd2988765
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-91b3-7d6fc44824d2
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-817b-4bc99673b91f
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-4027-1d8fa06b9f94
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-e807-42c1c2d604d2
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-ee46-6e9881275df2
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-c0f0-522f357314a1
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-9e2e-b8afa61c3da7
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-b055-8594ccd22fb4
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-0854-33678a264127
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-8d2f-ae937e7388e7
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-114c-d9586e12adc4
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-4437-cc878fdbcdd8
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-515b-574fecd4641a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-a374-e8ae584ac41d
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-a13e-732665a3d026
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-32be-6acca8106ee5
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-cfbc-6a35a1335d2a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-806f-e6ce504d97a5
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-af78-36dd78dcd28f
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-bd94-acdcbe450d61
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-c261-0687f71fd212
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-07ef-2b24967b4abd
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-7100-63ab6ea6e81e
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-baf2-fd73411e216a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-cc30-8ad70f27f749
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-24a1-6f73c8ceae73
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-7212-64011200e720
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-09e3-273e47a02f5c
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-1381-d875cee2bbfb
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-dcfa-659f1bfb7388
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-21ac-88094b12e0a0
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-3367-40551c691b8c
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-bb61-10eae0e6800d
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-aa54-6e6a0aefad14
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-854d-a3b0ec23f466
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-fbb3-be39d7f2c911
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-0f3f-1919f2273669
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-e8f1-314ea059e281
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-7f4e-32d681ad2c7e
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-c03a-eea6f4e2dcc0
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-787e-c102ea3a4234
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-72b6-f6389e27856c
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-7279-ac2eb3af2d82
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-a1d1-b62f4ec4d165
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-929a-62bcf41664b3
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-47de-b4db76628c25
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-aad1-f98ff5f6c7bd
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-a537-2f425b00439f
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-d04a-a9700fd1a56a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-b147-a91411b0e034
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-aecc-ebed38e942bb
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-2fed-b73ac156d09e
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-3550-854f8ee48b3d
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-185b-b682b9a76e81
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-f8a4-1107b889b9db
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-8e89-3d34b69a4d0b
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-fcf0-4bc2d23fd737
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-e775-768b0c5a573a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-4a46-aff145613315
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-a499-2fd1f3ef818d
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-c680-f49afdebfcaa
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-2637-d4aa97317dc6
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-2309-83191c1a273c
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-38d0-93a1c1e31aaa
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-3bec-359cbef3168a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-0d85-0004ceae1935
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-7496-3f3202dfd0c4
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-75cd-879d81d365f4
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-3ea5-ace3da510358
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-ac83-9544b5eefc51
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-9302-f7c2f08c4666
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-6354-8e23ffe5d2e2
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-b5c0-832754a67897
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-af1b-f52637fb6ae2
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-71ef-b5ffc0f401d3
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-4163-8a96df069d3b
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-7ce2-9a18daaf3450
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-7c9c-000205f95f6a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-32e1-85c53b33201d
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-0f32-80ee56b588a8
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-5aad-082287b53999
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-1172-8fb9a21fa539
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-54be-bc83145d5f27
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-f2c6-82b3f1f98248
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-a0bc-6e0d591a81ce
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-0539-554dd1c0a26a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-06c9-ec46acaee5c4
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-d19b-dc04b06f4e97
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-8aaf-87fc32b87253
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-dd72-44faf74bbbb8
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-6698-27e8ba98c58b
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-12b0-f4be93f55d4d
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-5153-0e47e103c5bc
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-ca26-b4c0ef3a7968
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-5eea-4e1b2a046e55
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-9ccc-92ced1753f41
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-f5a8-371582eb23d1
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-1f60-1695ee1da5c2
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-fb4d-e7f014a2c550
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-e1e3-58cf9fb2342b
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-820f-1a339f7d6802
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-59e0-b3036a6944bc
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-d27a-ac21eb2e300a
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-12a9-825fe5f7a37d
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-3eda-52134a7eca7e
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-4113-5e1aa5168dcc
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-d840-5bd1ab7bdd70
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-4403-6f0a8d9d9c9e
00020000-564b-3290-e7e8-8503a6e5c940	00030000-564b-328e-b966-1221ed45ceae
00020000-564b-3290-6a34-9f16834b3677	00030000-564b-328e-3455-7cea296fc441
00020000-564b-3290-441d-a4587335541b	00030000-564b-328e-95cd-04b88fbe41dc
00020000-564b-3290-bb74-8635ecedf81a	00030000-564b-328e-5eea-4e1b2a046e55
00020000-564b-3290-8983-cf1fa645ebc9	00030000-564b-328e-ca26-b4c0ef3a7968
00020000-564b-3290-467c-0bbc80e69b53	00030000-564b-328e-7453-6d6bc99f3689
00020000-564b-3290-820f-c771b9c7d583	00030000-564b-328e-3124-ea26c153f855
00020000-564b-3290-6357-8ad79cccbd61	00030000-564b-328e-983d-e46be8dd8c7e
00020000-564b-3290-5dfc-2ac8fd336357	00030000-564b-328e-541f-010fa0470ca3
00020000-564b-3290-cd8f-95b0420f2962	00030000-564b-328e-f075-3307ee999943
00020000-564b-3290-6d48-db7b50df6b2b	00030000-564b-328e-993d-ea42d6f89549
00020000-564b-3290-4860-d21127aabb0b	00030000-564b-328e-ea6a-5a1e72b06261
00020000-564b-3290-a566-97804067890f	00030000-564b-328e-5c70-31d7b513231a
00020000-564b-3290-8109-f01761b3f9ba	00030000-564b-328e-817b-4bc99673b91f
00020000-564b-3290-85db-41e94d70f454	00030000-564b-328e-2b4f-50ebd2988765
00020000-564b-3290-742a-2062a5e0fa20	00030000-564b-328e-ba46-1dad5f66b1e1
00020000-564b-3290-6e2f-1041cab8f52e	00030000-564b-328e-e1fe-dccc4701ed05
\.


--
-- TOC entry 3139 (class 0 OID 27701677)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 27701711)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 27701848)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-564b-3291-b0c1-67047e702e62	00090000-564b-3291-8404-387f4b4740bc	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-564b-3291-3c7f-bfa1c953765e	00090000-564b-3291-3e74-edc8854222dd	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-564b-3291-b8d9-251ea2417e5b	00090000-564b-3291-dfc5-aef8bc0a4e0f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-564b-3291-1d7f-fa005bd16252	00090000-564b-3291-9dd8-3d762fcc76f3	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 27701369)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-564b-3291-8788-04f2bd526f67	\N	00040000-564b-328e-e819-6412f0afd00d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564b-3291-baaa-4762d57caa17	\N	00040000-564b-328e-e819-6412f0afd00d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-564b-3291-5476-61e7fc68eee4	\N	00040000-564b-328e-e819-6412f0afd00d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564b-3291-0664-05e634a896f9	\N	00040000-564b-328e-e819-6412f0afd00d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564b-3291-ccff-1d25def96fc0	\N	00040000-564b-328e-e819-6412f0afd00d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564b-3291-bcc6-2aa4178ed263	\N	00040000-564b-328e-2da1-34f5d37e8685	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564b-3291-0b3d-b5dac03ce2a1	\N	00040000-564b-328e-7da0-293b1009c49d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564b-3291-d31d-1f1ec06e63f6	\N	00040000-564b-328e-bcb0-902bdb612abb	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564b-3291-1de1-7c182925ca00	\N	00040000-564b-328e-7385-a45272a81689	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564b-3292-eb25-2d8594499fe6	\N	00040000-564b-328e-e819-6412f0afd00d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 27701414)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-564b-328d-6c57-5eb4d9b75646	8341	Adlešiči
00050000-564b-328d-0071-238067a307ab	5270	Ajdovščina
00050000-564b-328d-fee9-f7acabba7be6	6280	Ankaran/Ancarano
00050000-564b-328d-d8da-9faf9ff07dbf	9253	Apače
00050000-564b-328d-36f2-4f1e4fe90fba	8253	Artiče
00050000-564b-328d-f701-d0a9b964631e	4275	Begunje na Gorenjskem
00050000-564b-328d-fae6-d2a09df32c75	1382	Begunje pri Cerknici
00050000-564b-328d-5e77-faf856584b77	9231	Beltinci
00050000-564b-328d-6f7f-ab64e0a721da	2234	Benedikt
00050000-564b-328d-9a25-7ed43a9e47dd	2345	Bistrica ob Dravi
00050000-564b-328d-a264-24b434339ed9	3256	Bistrica ob Sotli
00050000-564b-328d-73e7-be4251999b71	8259	Bizeljsko
00050000-564b-328d-b128-86ae6f4002e9	1223	Blagovica
00050000-564b-328d-e4f5-f8db6d4bfcb9	8283	Blanca
00050000-564b-328d-5d30-04ff8b128e01	4260	Bled
00050000-564b-328d-409c-d2a2b4d36472	4273	Blejska Dobrava
00050000-564b-328d-5c82-eaa909de986d	9265	Bodonci
00050000-564b-328d-d670-23216ced5953	9222	Bogojina
00050000-564b-328d-a9e9-7138a11cdbc5	4263	Bohinjska Bela
00050000-564b-328d-a0d8-f99ae6b44926	4264	Bohinjska Bistrica
00050000-564b-328d-dae9-5a4e1058d902	4265	Bohinjsko jezero
00050000-564b-328d-bbda-86e22e7e1bc9	1353	Borovnica
00050000-564b-328d-f089-0a0d295cbe29	8294	Boštanj
00050000-564b-328d-6076-2daf9183608b	5230	Bovec
00050000-564b-328d-2db5-1501cca61687	5295	Branik
00050000-564b-328d-c09f-6825ea4f0aa0	3314	Braslovče
00050000-564b-328d-3ef6-b25e5fa99e07	5223	Breginj
00050000-564b-328d-f0c4-f69813dd0125	8280	Brestanica
00050000-564b-328d-b44d-975a61cf0a74	2354	Bresternica
00050000-564b-328d-b879-acab46e1b383	4243	Brezje
00050000-564b-328d-5eb4-3f01a88f844c	1351	Brezovica pri Ljubljani
00050000-564b-328d-96bd-6494e2d169e1	8250	Brežice
00050000-564b-328d-161b-95eb17c918f7	4210	Brnik - Aerodrom
00050000-564b-328d-f998-177471b09ce7	8321	Brusnice
00050000-564b-328d-26d7-efabc42e9ae8	3255	Buče
00050000-564b-328d-d63a-ab7e1e73c9c8	8276	Bučka 
00050000-564b-328d-086f-842888598f40	9261	Cankova
00050000-564b-328d-f2cb-36e5bbfa65c9	3000	Celje 
00050000-564b-328d-89ee-e6d2db239780	3001	Celje - poštni predali
00050000-564b-328d-ff05-e4a772ad0831	4207	Cerklje na Gorenjskem
00050000-564b-328d-90c1-630ff83d9d76	8263	Cerklje ob Krki
00050000-564b-328d-dc1b-71dc40f06b50	1380	Cerknica
00050000-564b-328d-0cc7-822bc4a9eff1	5282	Cerkno
00050000-564b-328d-8f6f-9173ab19d415	2236	Cerkvenjak
00050000-564b-328d-9852-b2f20e08b57a	2215	Ceršak
00050000-564b-328d-1cd7-edbf065d0463	2326	Cirkovce
00050000-564b-328d-a62c-0ce8a0e1a7b6	2282	Cirkulane
00050000-564b-328d-877d-6f6b889f96af	5273	Col
00050000-564b-328d-e36c-793907b1db43	8251	Čatež ob Savi
00050000-564b-328d-57ac-fb30d12e6932	1413	Čemšenik
00050000-564b-328d-3507-d5bcc33b4f21	5253	Čepovan
00050000-564b-328d-9c5f-d6e39e153f51	9232	Črenšovci
00050000-564b-328d-2ec2-d81e8ff13112	2393	Črna na Koroškem
00050000-564b-328d-d5d5-aad391d094a8	6275	Črni Kal
00050000-564b-328d-288d-9748e0dbd099	5274	Črni Vrh nad Idrijo
00050000-564b-328d-feb7-773223ce0111	5262	Črniče
00050000-564b-328d-1402-532739d4ac0a	8340	Črnomelj
00050000-564b-328d-1541-08664553bf99	6271	Dekani
00050000-564b-328d-5d08-50b24b6bce0b	5210	Deskle
00050000-564b-328d-791c-deec1d16a576	2253	Destrnik
00050000-564b-328d-e7b3-b1d476d3f370	6215	Divača
00050000-564b-328d-55ea-04246b2594ae	1233	Dob
00050000-564b-328d-639f-db609b3cbf28	3224	Dobje pri Planini
00050000-564b-328d-dba7-e9440d3f5a3c	8257	Dobova
00050000-564b-328d-2552-4336a268a184	1423	Dobovec
00050000-564b-328d-31f4-d588c5307944	5263	Dobravlje
00050000-564b-328d-9acb-ab6a6f3f1067	3204	Dobrna
00050000-564b-328d-8e92-85ad0edba898	8211	Dobrnič
00050000-564b-328d-48b4-9516b96a28b7	1356	Dobrova
00050000-564b-328d-12de-3cb56cfe86de	9223	Dobrovnik/Dobronak 
00050000-564b-328d-5894-8ec35faf40f6	5212	Dobrovo v Brdih
00050000-564b-328d-9725-a35edacc1fe0	1431	Dol pri Hrastniku
00050000-564b-328d-60f5-d711634e0936	1262	Dol pri Ljubljani
00050000-564b-328d-21ee-ed3f66cebbdc	1273	Dole pri Litiji
00050000-564b-328d-d399-579d5ca9da4a	1331	Dolenja vas
00050000-564b-328d-160c-0f616309fe7e	8350	Dolenjske Toplice
00050000-564b-328d-72dd-c20abc83672b	1230	Domžale
00050000-564b-328d-419b-c11b0bcc6b26	2252	Dornava
00050000-564b-328d-7fe5-4d4ce9728b28	5294	Dornberk
00050000-564b-328d-3cbc-9904149f0761	1319	Draga
00050000-564b-328d-f953-80e8486d0e5a	8343	Dragatuš
00050000-564b-328d-e00e-8507c5bfc514	3222	Dramlje
00050000-564b-328d-b368-504bc317aa9d	2370	Dravograd
00050000-564b-328d-11be-0cbd2e3ca198	4203	Duplje
00050000-564b-328d-a3ad-1cf6d7a1dcdb	6221	Dutovlje
00050000-564b-328d-aca6-700dedb1c0ca	8361	Dvor
00050000-564b-328d-17b1-76de7eda084c	2343	Fala
00050000-564b-328d-d667-4d055f4d3b51	9208	Fokovci
00050000-564b-328d-0bb3-49fb649d2b40	2313	Fram
00050000-564b-328d-427c-3906129325d6	3213	Frankolovo
00050000-564b-328d-7b91-91f07136c0b8	1274	Gabrovka
00050000-564b-328d-1593-d49ca2ba409b	8254	Globoko
00050000-564b-328d-8e18-f0e4dcad7c74	5275	Godovič
00050000-564b-328d-5bed-f78076327991	4204	Golnik
00050000-564b-328d-1520-2ddada2403cf	3303	Gomilsko
00050000-564b-328d-a9df-75082f03f786	4224	Gorenja vas
00050000-564b-328d-9f43-55d22adbf391	3263	Gorica pri Slivnici
00050000-564b-328d-c066-84ab41ce8b90	2272	Gorišnica
00050000-564b-328d-d8c9-2f694e0921ab	9250	Gornja Radgona
00050000-564b-328d-9ebf-ed6f57b46c6d	3342	Gornji Grad
00050000-564b-328d-8bea-bd7b784f2b4c	4282	Gozd Martuljek
00050000-564b-328d-a89d-45c7a44930c7	6272	Gračišče
00050000-564b-328d-e8e0-b4797f6f2f7b	9264	Grad
00050000-564b-328d-b9e5-d0c199cae051	8332	Gradac
00050000-564b-328d-20d8-7a7b8ab796df	1384	Grahovo
00050000-564b-328d-cd99-a82d50a3b07a	5242	Grahovo ob Bači
00050000-564b-328d-da83-0033d15e57d0	5251	Grgar
00050000-564b-328d-8061-abe0f6920776	3302	Griže
00050000-564b-328d-ff84-24c43bd65bee	3231	Grobelno
00050000-564b-328d-2e3f-b5065b506f72	1290	Grosuplje
00050000-564b-328d-9e26-280ade8c9a73	2288	Hajdina
00050000-564b-328d-0d0a-80e3e6cb34a3	8362	Hinje
00050000-564b-328d-403a-a04f942ab6db	2311	Hoče
00050000-564b-328d-59ac-26686aecc0b0	9205	Hodoš/Hodos
00050000-564b-328d-d2f6-d0da1193e164	1354	Horjul
00050000-564b-328d-4981-aaff760812fc	1372	Hotedršica
00050000-564b-328d-573b-a486eb4e959d	1430	Hrastnik
00050000-564b-328d-2475-ddf363210134	6225	Hruševje
00050000-564b-328d-9873-cf16585c3dff	4276	Hrušica
00050000-564b-328d-dc14-a2b123c65c2e	5280	Idrija
00050000-564b-328d-ccce-6c141a809dd9	1292	Ig
00050000-564b-328d-6abf-6c5397960cc4	6250	Ilirska Bistrica
00050000-564b-328d-fa21-96a8f4804fcd	6251	Ilirska Bistrica-Trnovo
00050000-564b-328d-636b-5017ad844198	1295	Ivančna Gorica
00050000-564b-328d-584f-b0958708e55b	2259	Ivanjkovci
00050000-564b-328d-25a2-55042d221eb7	1411	Izlake
00050000-564b-328d-79e2-8440b1fc1552	6310	Izola/Isola
00050000-564b-328d-ad6e-242ac6d3807f	2222	Jakobski Dol
00050000-564b-328d-cd23-10312fa9639a	2221	Jarenina
00050000-564b-328d-f1dd-60b55ba007c0	6254	Jelšane
00050000-564b-328d-ba98-2a09a2745a1b	4270	Jesenice
00050000-564b-328d-4dae-ec7fabd47dd5	8261	Jesenice na Dolenjskem
00050000-564b-328d-dc42-c72e35b88724	3273	Jurklošter
00050000-564b-328d-b811-eaa374f09561	2223	Jurovski Dol
00050000-564b-328d-194e-f3b897c2a6ac	2256	Juršinci
00050000-564b-328d-0759-0ad63f406145	5214	Kal nad Kanalom
00050000-564b-328d-ded6-199545ac6def	3233	Kalobje
00050000-564b-328d-8978-060dd81f6896	4246	Kamna Gorica
00050000-564b-328d-bf0b-fe185d7ad504	2351	Kamnica
00050000-564b-328d-b009-1bfd1875bc16	1241	Kamnik
00050000-564b-328d-b560-9dfc9ebf6e0e	5213	Kanal
00050000-564b-328d-391e-55dedc11935a	8258	Kapele
00050000-564b-328d-62f6-3a8aefb93e72	2362	Kapla
00050000-564b-328d-55fb-e72917fb842f	2325	Kidričevo
00050000-564b-328d-eae9-eac34f70d7a7	1412	Kisovec
00050000-564b-328d-2e97-4794a15665db	6253	Knežak
00050000-564b-328d-e8b2-27d5f9204c4c	5222	Kobarid
00050000-564b-328d-75cc-1013241ef615	9227	Kobilje
00050000-564b-328d-07cf-449582c155a0	1330	Kočevje
00050000-564b-328d-3237-af6873d6aad6	1338	Kočevska Reka
00050000-564b-328d-f7eb-d6e36a9fc40c	2276	Kog
00050000-564b-328d-012d-64a85ac0badf	5211	Kojsko
00050000-564b-328d-ecbe-8a3671cbd1fc	6223	Komen
00050000-564b-328d-bd9a-a1e4bdd26b51	1218	Komenda
00050000-564b-328d-6bb5-531847484cfe	6000	Koper/Capodistria 
00050000-564b-328d-e1d2-f8eca1907714	6001	Koper/Capodistria - poštni predali
00050000-564b-328d-6896-7234712036b3	8282	Koprivnica
00050000-564b-328d-0e2c-84ff22828649	5296	Kostanjevica na Krasu
00050000-564b-328d-e46d-b86a13711cdd	8311	Kostanjevica na Krki
00050000-564b-328d-47d4-29ca1f4a5b14	1336	Kostel
00050000-564b-328d-ee24-8d7f98ac4796	6256	Košana
00050000-564b-328d-48df-8657573f8a4d	2394	Kotlje
00050000-564b-328d-d167-c82d33ca888d	6240	Kozina
00050000-564b-328d-d1ea-d196a157ec3f	3260	Kozje
00050000-564b-328d-a44b-97852649a1f0	4000	Kranj 
00050000-564b-328d-3c07-337896efeb16	4001	Kranj - poštni predali
00050000-564b-328d-d3b2-c878967c6c85	4280	Kranjska Gora
00050000-564b-328d-0884-d79a9b1bdd6e	1281	Kresnice
00050000-564b-328d-ce81-6d3964b31613	4294	Križe
00050000-564b-328d-755c-a2eb2aab99dc	9206	Križevci
00050000-564b-328d-2bed-9def1b802035	9242	Križevci pri Ljutomeru
00050000-564b-328d-03fa-74152750c328	1301	Krka
00050000-564b-328d-1d9d-5f7a8ee80482	8296	Krmelj
00050000-564b-328d-0da6-0367556b1b13	4245	Kropa
00050000-564b-328d-c530-1ab22eb7118a	8262	Krška vas
00050000-564b-328d-741c-8b317387ed54	8270	Krško
00050000-564b-328d-1e5e-e9798ac07eab	9263	Kuzma
00050000-564b-328d-771e-6b0994bdc48f	2318	Laporje
00050000-564b-328d-5fe7-1fb604dd98e4	3270	Laško
00050000-564b-328d-bd59-f568c854cd7e	1219	Laze v Tuhinju
00050000-564b-328d-b3d1-dfe43d8ee7ef	2230	Lenart v Slovenskih goricah
00050000-564b-328d-e1c5-3e10716e3a36	9220	Lendava/Lendva
00050000-564b-328d-a138-4396cf29abfe	4248	Lesce
00050000-564b-328d-7379-500ec259a4b3	3261	Lesično
00050000-564b-328d-4062-a9d8236c3a92	8273	Leskovec pri Krškem
00050000-564b-328d-aff1-980414766878	2372	Libeliče
00050000-564b-328d-e26c-fadc9321b7f3	2341	Limbuš
00050000-564b-328d-89ca-be6e94403fd9	1270	Litija
00050000-564b-328d-13e9-cb5a5941f74e	3202	Ljubečna
00050000-564b-328d-61f1-ac08170fe496	1000	Ljubljana 
00050000-564b-328d-7cf2-74d936124362	1001	Ljubljana - poštni predali
00050000-564b-328d-7b21-b66379b9e77d	1231	Ljubljana - Črnuče
00050000-564b-328d-ab2d-7dd39276f8dd	1261	Ljubljana - Dobrunje
00050000-564b-328d-bcdb-51f4773aecfa	1260	Ljubljana - Polje
00050000-564b-328d-d88e-84d534da571d	1210	Ljubljana - Šentvid
00050000-564b-328d-2cc0-34f65715e1e8	1211	Ljubljana - Šmartno
00050000-564b-328d-f116-0a15e78b2ade	3333	Ljubno ob Savinji
00050000-564b-328d-40f4-a0e1ea26c49e	9240	Ljutomer
00050000-564b-328d-80c3-d28e9c7e6319	3215	Loče
00050000-564b-328d-9947-f56feb2a289b	5231	Log pod Mangartom
00050000-564b-328d-2671-7d2fca549e48	1358	Log pri Brezovici
00050000-564b-328d-d1f8-1420087f3fdb	1370	Logatec
00050000-564b-328d-84f5-60e26fd61787	1371	Logatec
00050000-564b-328d-4f50-41de62bff3ac	1434	Loka pri Zidanem Mostu
00050000-564b-328d-1ada-2a7c72ae1f9b	3223	Loka pri Žusmu
00050000-564b-328d-8621-b1f7888fbaa0	6219	Lokev
00050000-564b-328d-03a6-974c47127948	1318	Loški Potok
00050000-564b-328d-9458-0789b512425f	2324	Lovrenc na Dravskem polju
00050000-564b-328d-b7d2-757ba37fa036	2344	Lovrenc na Pohorju
00050000-564b-328d-762f-651f3e1bb466	3334	Luče
00050000-564b-328d-ade2-216c67b1a82d	1225	Lukovica
00050000-564b-328d-8324-221f097b15d8	9202	Mačkovci
00050000-564b-328d-f616-a6c139fc6036	2322	Majšperk
00050000-564b-328d-45b1-8450e7a1c675	2321	Makole
00050000-564b-328d-e51f-93bf8b0671d4	9243	Mala Nedelja
00050000-564b-328d-7f6c-6adffe65b337	2229	Malečnik
00050000-564b-328d-ef0d-ec1c54cec278	6273	Marezige
00050000-564b-328d-9f03-f335a031319c	2000	Maribor 
00050000-564b-328d-78ef-ba66372a9ba0	2001	Maribor - poštni predali
00050000-564b-328d-7b97-6af38212b86d	2206	Marjeta na Dravskem polju
00050000-564b-328d-1fe3-52add87eaeeb	2281	Markovci
00050000-564b-328d-b7a2-38666cb45915	9221	Martjanci
00050000-564b-328d-6146-3ea762298758	6242	Materija
00050000-564b-328d-951e-b35b0161f558	4211	Mavčiče
00050000-564b-328d-4e8a-2b5ab5015386	1215	Medvode
00050000-564b-328d-a853-0943937741d8	1234	Mengeš
00050000-564b-328d-f7f7-4948db34a7f9	8330	Metlika
00050000-564b-328d-b95f-7b8980be3228	2392	Mežica
00050000-564b-328d-ad9e-71e2033f5ea3	2204	Miklavž na Dravskem polju
00050000-564b-328d-4167-fe439cfb8ca7	2275	Miklavž pri Ormožu
00050000-564b-328d-e3e3-c05a2b94dfa7	5291	Miren
00050000-564b-328d-09f6-f168b28d848a	8233	Mirna
00050000-564b-328d-4437-a26d02340ca6	8216	Mirna Peč
00050000-564b-328d-8efb-5f58be95ea46	2382	Mislinja
00050000-564b-328d-ac67-54fb113e97c4	4281	Mojstrana
00050000-564b-328d-b4c5-343143d01565	8230	Mokronog
00050000-564b-328d-7018-e6e0e9452e6f	1251	Moravče
00050000-564b-328d-0c84-38dfdedc57fb	9226	Moravske Toplice
00050000-564b-328d-0940-c8dfb908e50d	5216	Most na Soči
00050000-564b-328d-2c24-898fbd93f392	1221	Motnik
00050000-564b-328d-d0f6-364d0198ab46	3330	Mozirje
00050000-564b-328d-b46b-de9bcba8be7e	9000	Murska Sobota 
00050000-564b-328d-dcbb-28c2a42d5156	9001	Murska Sobota - poštni predali
00050000-564b-328d-9122-04791ab6d85c	2366	Muta
00050000-564b-328d-9e03-78ad484136bc	4202	Naklo
00050000-564b-328d-8f3a-8a1a804d60a6	3331	Nazarje
00050000-564b-328d-df80-67f6fcd90a4b	1357	Notranje Gorice
00050000-564b-328d-3ed5-28f6f5e9adbe	3203	Nova Cerkev
00050000-564b-328d-92a8-e9e1516e83eb	5000	Nova Gorica 
00050000-564b-328d-2c15-203df74850f8	5001	Nova Gorica - poštni predali
00050000-564b-328d-6bc3-5552fb6e36bd	1385	Nova vas
00050000-564b-328d-5e7d-5dd768228518	8000	Novo mesto
00050000-564b-328d-b61d-9269c85f927e	8001	Novo mesto - poštni predali
00050000-564b-328d-cdd8-e5f492dced68	6243	Obrov
00050000-564b-328d-73c2-7eadb117c6c7	9233	Odranci
00050000-564b-328d-f329-62f029ea19a4	2317	Oplotnica
00050000-564b-328d-b95e-eb0114d02ce7	2312	Orehova vas
00050000-564b-328d-52c1-24d64bc6ef0b	2270	Ormož
00050000-564b-328d-4555-1187f39139ae	1316	Ortnek
00050000-564b-328d-de7e-72ed83be1ece	1337	Osilnica
00050000-564b-328d-d27d-e1072019e278	8222	Otočec
00050000-564b-328d-d8a4-2dfbd434e8fc	2361	Ožbalt
00050000-564b-328d-4bc5-378e47dcaa2a	2231	Pernica
00050000-564b-328d-9e90-b9cf26be0f2f	2211	Pesnica pri Mariboru
00050000-564b-328d-51a9-b174cbda2f44	9203	Petrovci
00050000-564b-328d-0693-314e79114d53	3301	Petrovče
00050000-564b-328d-5422-0125c71a7468	6330	Piran/Pirano
00050000-564b-328d-2bfb-e432a720ebb8	8255	Pišece
00050000-564b-328d-109b-0a34abad7cd1	6257	Pivka
00050000-564b-328d-9b23-42f1760c9494	6232	Planina
00050000-564b-328d-5de4-28a0a9f5b1e6	3225	Planina pri Sevnici
00050000-564b-328d-1fff-6a707bc42d30	6276	Pobegi
00050000-564b-328d-272f-4bc1de06fb54	8312	Podbočje
00050000-564b-328d-5d11-b91a962526a8	5243	Podbrdo
00050000-564b-328d-98cc-76c8994a6a53	3254	Podčetrtek
00050000-564b-328d-c183-552e5d939ee7	2273	Podgorci
00050000-564b-328d-f6c2-86187353b3fd	6216	Podgorje
00050000-564b-328d-7dc6-3a176967a483	2381	Podgorje pri Slovenj Gradcu
00050000-564b-328d-427e-c3a9195ecc11	6244	Podgrad
00050000-564b-328d-ed4d-2c445eb74c53	1414	Podkum
00050000-564b-328d-dfa2-452a38c1c51c	2286	Podlehnik
00050000-564b-328d-6cfd-365e9f554cf0	5272	Podnanos
00050000-564b-328d-c5ea-a87353ab8cbb	4244	Podnart
00050000-564b-328d-5da3-f60a540cbb41	3241	Podplat
00050000-564b-328d-e509-869f60ef0360	3257	Podsreda
00050000-564b-328d-bec7-0ee6f7d6a581	2363	Podvelka
00050000-564b-328d-15ca-7fc7c9de65c6	2208	Pohorje
00050000-564b-328d-c13c-7e68f9e0415f	2257	Polenšak
00050000-564b-328d-3479-3ea73e6062d5	1355	Polhov Gradec
00050000-564b-328d-0aa0-0778101941c0	4223	Poljane nad Škofjo Loko
00050000-564b-328d-9cf6-b5a225a985fd	2319	Poljčane
00050000-564b-328d-fb43-c8a859df04ae	1272	Polšnik
00050000-564b-328d-6cac-b297a887f02b	3313	Polzela
00050000-564b-328d-760f-6abe41b6f007	3232	Ponikva
00050000-564b-328d-14d8-a6a1fa1e389c	6320	Portorož/Portorose
00050000-564b-328d-978d-8b2388be3c5f	6230	Postojna
00050000-564b-328d-2c4a-3d332b290194	2331	Pragersko
00050000-564b-328d-e542-399b5929d36e	3312	Prebold
00050000-564b-328d-e364-fd9b8c29c385	4205	Preddvor
00050000-564b-328d-6449-76f9e0abb503	6255	Prem
00050000-564b-328d-5b89-add66150cef2	1352	Preserje
00050000-564b-328d-1661-3f077ce11d4e	6258	Prestranek
00050000-564b-328d-2c55-4b8cc50fe2ca	2391	Prevalje
00050000-564b-328d-9b5a-9b135d9ec7aa	3262	Prevorje
00050000-564b-328d-c7b5-ae959464467a	1276	Primskovo 
00050000-564b-328d-97bf-afe6063ba8cc	3253	Pristava pri Mestinju
00050000-564b-328d-651e-a579b6275ad9	9207	Prosenjakovci/Partosfalva
00050000-564b-328d-804e-c03f6b49e5a2	5297	Prvačina
00050000-564b-328d-c601-d8f39daf508b	2250	Ptuj
00050000-564b-328d-bf99-4039487cbf26	2323	Ptujska Gora
00050000-564b-328d-c04d-f1a8dc4ccfe1	9201	Puconci
00050000-564b-328d-43ee-ec3eab23c5c6	2327	Rače
00050000-564b-328d-3229-57f617960c68	1433	Radeče
00050000-564b-328d-026c-174fbbf2a149	9252	Radenci
00050000-564b-328d-e57e-b527ed85cd12	2360	Radlje ob Dravi
00050000-564b-328d-944e-8152193badf6	1235	Radomlje
00050000-564b-328d-f4e1-140aa739b9c9	4240	Radovljica
00050000-564b-328d-a0ef-3ecad948ae54	8274	Raka
00050000-564b-328d-a8f6-ea2f4ab12426	1381	Rakek
00050000-564b-328d-c2b5-e195de4193d1	4283	Rateče - Planica
00050000-564b-328d-c4cd-99d29f6714d8	2390	Ravne na Koroškem
00050000-564b-328d-8728-c27b3306fb72	9246	Razkrižje
00050000-564b-328d-c8df-6518f8224523	3332	Rečica ob Savinji
00050000-564b-328d-e2e8-f4830320f5cc	5292	Renče
00050000-564b-328d-e64a-b924cc4829f8	1310	Ribnica
00050000-564b-328d-ddc5-3b7915fe7381	2364	Ribnica na Pohorju
00050000-564b-328d-69da-cb820a464cc7	3272	Rimske Toplice
00050000-564b-328d-298e-0edb6653f226	1314	Rob
00050000-564b-328d-ba47-f3f86612f09d	5215	Ročinj
00050000-564b-328d-26a4-7075dffce7b8	3250	Rogaška Slatina
00050000-564b-328d-13ff-faed3e7058dd	9262	Rogašovci
00050000-564b-328d-b46a-c1751de0be24	3252	Rogatec
00050000-564b-328d-69f9-645b639c77ca	1373	Rovte
00050000-564b-328d-9af4-aaa85af982ad	2342	Ruše
00050000-564b-328d-4fa0-98988a6b8c59	1282	Sava
00050000-564b-328d-a468-227d857b4eee	6333	Sečovlje/Sicciole
00050000-564b-328d-a383-11751c024741	4227	Selca
00050000-564b-328d-0ec4-ea2910a5cbe9	2352	Selnica ob Dravi
00050000-564b-328d-c640-0b370945b520	8333	Semič
00050000-564b-328d-1c03-11f2089ef9a0	8281	Senovo
00050000-564b-328d-e8a0-a9044091912c	6224	Senožeče
00050000-564b-328d-f867-a150b95d9c48	8290	Sevnica
00050000-564b-328d-cf18-847fe325a127	6210	Sežana
00050000-564b-328d-1cc5-048bb2a8eba9	2214	Sladki Vrh
00050000-564b-328d-6a7f-180831145bd9	5283	Slap ob Idrijci
00050000-564b-328d-fec3-29d2bc7b4054	2380	Slovenj Gradec
00050000-564b-328d-7a4b-a7f05340e25c	2310	Slovenska Bistrica
00050000-564b-328d-a747-94d4bce1fc89	3210	Slovenske Konjice
00050000-564b-328d-6256-7e7a73983a90	1216	Smlednik
00050000-564b-328d-42a9-2ec681d79baa	5232	Soča
00050000-564b-328d-190e-561584ed45ff	1317	Sodražica
00050000-564b-328d-4655-311a0313afe2	3335	Solčava
00050000-564b-328d-781a-4b1227ba3e5b	5250	Solkan
00050000-564b-328d-a0a2-99716dce5eb4	4229	Sorica
00050000-564b-328d-c6fa-ebb3974cbf9a	4225	Sovodenj
00050000-564b-328d-2743-676ab2886263	5281	Spodnja Idrija
00050000-564b-328d-3996-2955a2c3d874	2241	Spodnji Duplek
00050000-564b-328d-9c16-0362e91e5cc7	9245	Spodnji Ivanjci
00050000-564b-328d-b34e-d20a3e340538	2277	Središče ob Dravi
00050000-564b-328d-d4e5-52cccefa8c77	4267	Srednja vas v Bohinju
00050000-564b-328d-b586-ee40b914c985	8256	Sromlje 
00050000-564b-328d-1321-4887561f8e07	5224	Srpenica
00050000-564b-328d-2811-491dbe76e1d0	1242	Stahovica
00050000-564b-328d-9dd9-be3cea7d56ff	1332	Stara Cerkev
00050000-564b-328d-08cd-7efab103b9a3	8342	Stari trg ob Kolpi
00050000-564b-328d-41d9-60502e12dbb3	1386	Stari trg pri Ložu
00050000-564b-328d-22f3-394fb07c050c	2205	Starše
00050000-564b-328d-185b-6c4a2cf21e6f	2289	Stoperce
00050000-564b-328d-fb3e-84db04c8ef8c	8322	Stopiče
00050000-564b-328d-749e-35e3d5e2fb27	3206	Stranice
00050000-564b-328d-90fb-0533cf68515d	8351	Straža
00050000-564b-328d-47b0-52e988501639	1313	Struge
00050000-564b-328d-9307-6bdc39931876	8293	Studenec
00050000-564b-328d-d910-8900397921cb	8331	Suhor
00050000-564b-328d-a733-795f5f0267b0	2233	Sv. Ana v Slovenskih goricah
00050000-564b-328d-c61c-66811b78fe3a	2235	Sv. Trojica v Slovenskih goricah
00050000-564b-328d-def3-ecb0cce69aef	2353	Sveti Duh na Ostrem Vrhu
00050000-564b-328d-9c0f-c8d7fc13b520	9244	Sveti Jurij ob Ščavnici
00050000-564b-328d-77b5-6a28a5bb8400	3264	Sveti Štefan
00050000-564b-328d-26e9-435867057efe	2258	Sveti Tomaž
00050000-564b-328d-fab5-9d85cf11f7a6	9204	Šalovci
00050000-564b-328d-1b8b-7c1bbb212e38	5261	Šempas
00050000-564b-328d-a9ac-c044cdcaa189	5290	Šempeter pri Gorici
00050000-564b-328d-0bf6-f71fc3e84d29	3311	Šempeter v Savinjski dolini
00050000-564b-328d-1c03-3062ed071b6c	4208	Šenčur
00050000-564b-328d-0723-32974605ee09	2212	Šentilj v Slovenskih goricah
00050000-564b-328d-a4f9-8995d246316c	8297	Šentjanž
00050000-564b-328d-823b-f7f19cd3dc74	2373	Šentjanž pri Dravogradu
00050000-564b-328d-30c6-7aaf0873c8d3	8310	Šentjernej
00050000-564b-328d-d0e8-a50a5d293fe3	3230	Šentjur
00050000-564b-328d-e420-86f2ad3892a2	3271	Šentrupert
00050000-564b-328d-7cce-9c7e69951c93	8232	Šentrupert
00050000-564b-328d-d1e2-5cff2d74b9a1	1296	Šentvid pri Stični
00050000-564b-328d-568f-65c2d9d74207	8275	Škocjan
00050000-564b-328d-ae68-2916aed168e1	6281	Škofije
00050000-564b-328d-0c42-345816fccfda	4220	Škofja Loka
00050000-564b-328d-7bf5-0cf1f5a4ff42	3211	Škofja vas
00050000-564b-328d-3298-fce2cf1f5548	1291	Škofljica
00050000-564b-328d-035f-e52437feec8f	6274	Šmarje
00050000-564b-328d-4517-2c08b20c8d40	1293	Šmarje - Sap
00050000-564b-328d-1a89-45bb33f4f838	3240	Šmarje pri Jelšah
00050000-564b-328d-6134-6e5687cba6f3	8220	Šmarješke Toplice
00050000-564b-328d-e069-0e822b02b6f7	2315	Šmartno na Pohorju
00050000-564b-328d-2222-6081afb577d0	3341	Šmartno ob Dreti
00050000-564b-328d-8918-9eb65d8ed4ea	3327	Šmartno ob Paki
00050000-564b-328d-ae07-7b867f80b30b	1275	Šmartno pri Litiji
00050000-564b-328d-129c-e8f873b176de	2383	Šmartno pri Slovenj Gradcu
00050000-564b-328d-79b3-76b0ed8c4bbf	3201	Šmartno v Rožni dolini
00050000-564b-328d-8697-0390fd9082f2	3325	Šoštanj
00050000-564b-328d-702c-0c9b00515191	6222	Štanjel
00050000-564b-328d-9de7-0020fad55c2a	3220	Štore
00050000-564b-328d-a3d8-673070c0a73e	3304	Tabor
00050000-564b-328d-bd7f-2aae8cc28aa1	3221	Teharje
00050000-564b-328d-2826-1299f3e51235	9251	Tišina
00050000-564b-328d-8d18-e492d4594a08	5220	Tolmin
00050000-564b-328d-ffc8-5b1afce6104d	3326	Topolšica
00050000-564b-328d-f991-5f9d4d1fd29b	2371	Trbonje
00050000-564b-328d-02eb-79e920f65a99	1420	Trbovlje
00050000-564b-328d-a3eb-061a10b85002	8231	Trebelno 
00050000-564b-328d-ec5e-8a817f1732c6	8210	Trebnje
00050000-564b-328d-83d2-9c5055fd45cb	5252	Trnovo pri Gorici
00050000-564b-328e-4f63-fd84aa3bb88c	2254	Trnovska vas
00050000-564b-328e-5697-9f9751c32b6c	1222	Trojane
00050000-564b-328e-b418-956948de0f2d	1236	Trzin
00050000-564b-328e-d797-d8992bfbf415	4290	Tržič
00050000-564b-328e-6342-ff5c5df0ad6b	8295	Tržišče
00050000-564b-328e-6115-4e3482cfa657	1311	Turjak
00050000-564b-328e-b07b-4cf520b04217	9224	Turnišče
00050000-564b-328e-5740-ad3f1b2cd9cd	8323	Uršna sela
00050000-564b-328e-a0d7-e2efc8b49b18	1252	Vače
00050000-564b-328e-d8c5-3eb958d2152d	3320	Velenje 
00050000-564b-328e-b007-362e90cf7345	3322	Velenje - poštni predali
00050000-564b-328e-7c10-8d76d8b2866e	8212	Velika Loka
00050000-564b-328e-b7df-a965988c05cb	2274	Velika Nedelja
00050000-564b-328e-b505-8ce9d98ff47c	9225	Velika Polana
00050000-564b-328e-2fa4-c56f5c9c0df6	1315	Velike Lašče
00050000-564b-328e-54b8-63bdb69c9e3d	8213	Veliki Gaber
00050000-564b-328e-4d29-1c1728e7a47f	9241	Veržej
00050000-564b-328e-c81d-e4e3a0afa134	1312	Videm - Dobrepolje
00050000-564b-328e-17f9-cd56eb1659a9	2284	Videm pri Ptuju
00050000-564b-328e-4ad5-e24dcf50a7b3	8344	Vinica
00050000-564b-328e-d65c-36a5f2cf06a0	5271	Vipava
00050000-564b-328e-89b4-cfcf39b4d97b	4212	Visoko
00050000-564b-328e-b614-a3291c859a43	1294	Višnja Gora
00050000-564b-328e-249b-ffbfb0f910a7	3205	Vitanje
00050000-564b-328e-3f7f-f69ebafea896	2255	Vitomarci
00050000-564b-328e-792b-4824d0aea63a	1217	Vodice
00050000-564b-328e-74bf-663af25aa990	3212	Vojnik\t
00050000-564b-328e-85d2-188c81ed8793	5293	Volčja Draga
00050000-564b-328e-f2b7-589e690108ba	2232	Voličina
00050000-564b-328e-7d0c-7d5164c769e9	3305	Vransko
00050000-564b-328e-8877-1a9a33df32a0	6217	Vremski Britof
00050000-564b-328e-894a-2d440546b860	1360	Vrhnika
00050000-564b-328e-f978-c5940f5b0f58	2365	Vuhred
00050000-564b-328e-ce9e-a5dcf98549df	2367	Vuzenica
00050000-564b-328e-a201-9d8f884532c9	8292	Zabukovje 
00050000-564b-328e-a87f-076255863efa	1410	Zagorje ob Savi
00050000-564b-328e-31db-1489ade79ab0	1303	Zagradec
00050000-564b-328e-dd34-738c583ef6ce	2283	Zavrč
00050000-564b-328e-065a-86818de2e0b5	8272	Zdole 
00050000-564b-328e-9041-3da415fae5ab	4201	Zgornja Besnica
00050000-564b-328e-8008-c2a6d0eb099e	2242	Zgornja Korena
00050000-564b-328e-6ef6-834d07ed2dd6	2201	Zgornja Kungota
00050000-564b-328e-a1b6-0b3a5067531b	2316	Zgornja Ložnica
00050000-564b-328e-bf6f-a5f87f9075cf	2314	Zgornja Polskava
00050000-564b-328e-0ff1-d1a385d95205	2213	Zgornja Velka
00050000-564b-328e-b27b-63ed1a0eee08	4247	Zgornje Gorje
00050000-564b-328e-75e9-147e599b535c	4206	Zgornje Jezersko
00050000-564b-328e-fa0b-580a4465fe13	2285	Zgornji Leskovec
00050000-564b-328e-37f2-8387eba94ac0	1432	Zidani Most
00050000-564b-328e-c0cc-9f72581f2cce	3214	Zreče
00050000-564b-328e-1521-f1da5e40b76e	4209	Žabnica
00050000-564b-328e-760d-bb03c2edd97a	3310	Žalec
00050000-564b-328e-3876-73e981ede881	4228	Železniki
00050000-564b-328e-cc83-8be3520ffaae	2287	Žetale
00050000-564b-328e-2c1d-946f10ff1876	4226	Žiri
00050000-564b-328e-77fe-152e50b0d45a	4274	Žirovnica
00050000-564b-328e-d6ab-1c996a64b9bd	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 27702075)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 27701651)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 27701399)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-564b-3291-4f16-8f48dd43fcc0	00080000-564b-3291-8788-04f2bd526f67	\N	00040000-564b-328e-e819-6412f0afd00d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-564b-3291-c54f-7c74c7ee744d	00080000-564b-3291-8788-04f2bd526f67	\N	00040000-564b-328e-e819-6412f0afd00d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-564b-3291-075e-c7db6e7dba52	00080000-564b-3291-baaa-4762d57caa17	\N	00040000-564b-328e-e819-6412f0afd00d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 27701543)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-564b-328e-7164-aa92191bcfd8	novo leto	1	1	\N	t
00430000-564b-328e-9d81-b6be7b39dc0d	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-564b-328e-209f-f43cc7756cbd	dan upora proti okupatorju	27	4	\N	t
00430000-564b-328e-a063-6b70aabe3652	praznik dela	1	5	\N	t
00430000-564b-328e-65b8-58674f3df7f6	praznik dela	2	5	\N	t
00430000-564b-328e-58ee-ea3012c31bdc	dan Primoža Trubarja	8	6	\N	f
00430000-564b-328e-6a42-3c0fc5ef1663	dan državnosti	25	6	\N	t
00430000-564b-328e-f865-ed34859885a9	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-564b-328e-de14-6fde6cb8d8f3	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-564b-328e-8ccd-53f75e501fe9	dan suverenosti	25	10	\N	f
00430000-564b-328e-90a2-f09fe34b395c	dan spomina na mrtve	1	11	\N	t
00430000-564b-328e-b7cc-b730944be429	dan Rudolfa Maistra	23	11	\N	f
00430000-564b-328e-30cf-376ce4b0e4cb	božič	25	12	\N	t
00430000-564b-328e-3d6c-4c28b4272936	dan samostojnosti in enotnosti	26	12	\N	t
00430000-564b-328e-1a78-bab874d9512e	Marijino vnebovzetje	15	8	\N	t
00430000-564b-328e-94a0-94d7e3a71a94	dan reformacije	31	10	\N	t
00430000-564b-328e-a243-89445ec7c20d	velikonočna nedelja	27	3	2016	t
00430000-564b-328e-e936-a25d07de3f97	velikonočna nedelja	16	4	2017	t
00430000-564b-328e-f8ff-623f429e0630	velikonočna nedelja	1	4	2018	t
00430000-564b-328e-9c32-ea6b712ed74f	velikonočna nedelja	21	4	2019	t
00430000-564b-328e-f1b9-2419537ec123	velikonočna nedelja	12	4	2020	t
00430000-564b-328e-13e7-ddda9096800b	velikonočna nedelja	4	4	2021	t
00430000-564b-328e-5624-cc43d9757bed	velikonočna nedelja	17	4	2022	t
00430000-564b-328e-e580-c956165d2045	velikonočna nedelja	9	4	2023	t
00430000-564b-328e-9153-773e0cf65af4	velikonočna nedelja	31	3	2024	t
00430000-564b-328e-681a-7760a4134788	velikonočna nedelja	20	4	2025	t
00430000-564b-328e-a744-3bed79cc2640	velikonočna nedelja	5	4	2026	t
00430000-564b-328e-950a-f0e4148d30d6	velikonočna nedelja	28	3	2027	t
00430000-564b-328e-0855-57672f0fc626	velikonočna nedelja	16	4	2028	t
00430000-564b-328e-70db-7b03702b07cb	velikonočna nedelja	1	4	2029	t
00430000-564b-328e-7b05-2df638be1c31	velikonočna nedelja	21	4	2030	t
00430000-564b-328e-1981-17c4a2d82f35	velikonočni ponedeljek	28	3	2016	t
00430000-564b-328e-69b5-fe92bc8f9ff0	velikonočni ponedeljek	17	4	2017	t
00430000-564b-328e-fe93-7b6face9b617	velikonočni ponedeljek	2	4	2018	t
00430000-564b-328e-66fe-a1e167db277f	velikonočni ponedeljek	22	4	2019	t
00430000-564b-328e-5074-25d9e58c2ee3	velikonočni ponedeljek	13	4	2020	t
00430000-564b-328e-19fa-24da028266d0	velikonočni ponedeljek	5	4	2021	t
00430000-564b-328e-6caf-85e6c1df7785	velikonočni ponedeljek	18	4	2022	t
00430000-564b-328e-99f7-77d883b8e156	velikonočni ponedeljek	10	4	2023	t
00430000-564b-328e-a5af-a6390a8f43a3	velikonočni ponedeljek	1	4	2024	t
00430000-564b-328e-02f6-a54825251c03	velikonočni ponedeljek	21	4	2025	t
00430000-564b-328e-6807-c7b47e7acd2d	velikonočni ponedeljek	6	4	2026	t
00430000-564b-328e-d32b-72ee6863c87c	velikonočni ponedeljek	29	3	2027	t
00430000-564b-328e-85d4-d437c75c6d69	velikonočni ponedeljek	17	4	2028	t
00430000-564b-328e-ecd3-a318da25cc07	velikonočni ponedeljek	2	4	2029	t
00430000-564b-328e-236f-f0b16fa56451	velikonočni ponedeljek	22	4	2030	t
00430000-564b-328e-09c1-8f19486b663b	binkoštna nedelja - binkošti	15	5	2016	t
00430000-564b-328e-3411-682765adf4bf	binkoštna nedelja - binkošti	4	6	2017	t
00430000-564b-328e-4cc6-77325077cb28	binkoštna nedelja - binkošti	20	5	2018	t
00430000-564b-328e-0369-10c10efa578f	binkoštna nedelja - binkošti	9	6	2019	t
00430000-564b-328e-1044-e0f05fa8637a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-564b-328e-2b9d-6d3a02d63cd8	binkoštna nedelja - binkošti	23	5	2021	t
00430000-564b-328e-dd08-e2d893eaa37c	binkoštna nedelja - binkošti	5	6	2022	t
00430000-564b-328e-fe2f-6309fd974c96	binkoštna nedelja - binkošti	28	5	2023	t
00430000-564b-328e-4dc2-a97c764b7c44	binkoštna nedelja - binkošti	19	5	2024	t
00430000-564b-328e-b1ba-b988e83f3b86	binkoštna nedelja - binkošti	8	6	2025	t
00430000-564b-328e-55ff-c97b09c1fee8	binkoštna nedelja - binkošti	24	5	2026	t
00430000-564b-328e-6a52-9ebc589ebc0a	binkoštna nedelja - binkošti	16	5	2027	t
00430000-564b-328e-5cc4-ef7949fb7a6f	binkoštna nedelja - binkošti	4	6	2028	t
00430000-564b-328e-20c8-5ecd92c1e552	binkoštna nedelja - binkošti	20	5	2029	t
00430000-564b-328e-4a75-dfe070fcbef3	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 27701503)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 27701515)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 27701663)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 27702089)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 27702099)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-564b-3291-d069-ef4bd9cf4b69	00080000-564b-3291-5476-61e7fc68eee4	0987	AK
00190000-564b-3291-b2a9-2a255c3d8783	00080000-564b-3291-baaa-4762d57caa17	0989	AK
00190000-564b-3291-90cc-03d487796fa2	00080000-564b-3291-0664-05e634a896f9	0986	AK
00190000-564b-3291-56a5-2cf22f16d965	00080000-564b-3291-bcc6-2aa4178ed263	0984	AK
00190000-564b-3291-33c4-c2152e6254e6	00080000-564b-3291-0b3d-b5dac03ce2a1	0983	AK
00190000-564b-3291-7282-b1d94b2511b6	00080000-564b-3291-d31d-1f1ec06e63f6	0982	AK
00190000-564b-3292-81b9-a3f5b21a5309	00080000-564b-3292-eb25-2d8594499fe6	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 27701998)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-564b-3291-f4b4-11b773cffe9c	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 27702107)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 27701692)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-564b-3290-5062-480c01532402	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-564b-3290-dba7-e616f01038d0	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-564b-3290-17f4-7a303399ce84	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-564b-3290-eece-9f2f832bb30b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-564b-3290-33fa-412ad03a2bac	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-564b-3290-07bd-8a442e3a3033	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-564b-3290-b809-67bc0f3304a9	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 27701636)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 27701626)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 27701837)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 27701767)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 27701477)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 27701239)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-564b-3292-eb25-2d8594499fe6	00010000-564b-328e-5713-033412484734	2015-11-17 14:58:42	INS	a:0:{}
2	App\\Entity\\Option	00000000-564b-3292-3bcd-a091d4b7194a	00010000-564b-328e-5713-033412484734	2015-11-17 14:58:42	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-564b-3292-81b9-a3f5b21a5309	00010000-564b-328e-5713-033412484734	2015-11-17 14:58:42	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 27701705)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 27701277)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-564b-328e-0dc7-2b68286d2c60	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-564b-328e-b9b1-06fb9225e8cc	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-564b-328e-b51a-4a8062440d67	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-564b-328e-7b00-d451db7b33fb	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-564b-328e-bf26-5195fa28bd15	planer	Planer dogodkov v koledarju	t
00020000-564b-328e-a26a-6a35c51ce4ef	kadrovska	Kadrovska služba	t
00020000-564b-328e-bd3b-888fdf0c6190	arhivar	Ažuriranje arhivalij	t
00020000-564b-328e-946a-f7b821d552c7	igralec	Igralec	t
00020000-564b-328e-0e20-18c729c5b899	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-564b-3290-e7e8-8503a6e5c940	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-564b-3290-6a34-9f16834b3677	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-564b-3290-441d-a4587335541b	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-564b-3290-bb74-8635ecedf81a	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-564b-3290-8983-cf1fa645ebc9	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-564b-3290-467c-0bbc80e69b53	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-564b-3290-820f-c771b9c7d583	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-564b-3290-6357-8ad79cccbd61	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-564b-3290-5dfc-2ac8fd336357	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-564b-3290-cd8f-95b0420f2962	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-564b-3290-6d48-db7b50df6b2b	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-564b-3290-4860-d21127aabb0b	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-564b-3290-a566-97804067890f	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-564b-3290-8109-f01761b3f9ba	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-564b-3290-85db-41e94d70f454	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-564b-3290-742a-2062a5e0fa20	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-564b-3290-6e2f-1041cab8f52e	Datoteka-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3099 (class 0 OID 27701261)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-564b-328e-919d-fe417d0ba4fd	00020000-564b-328e-b51a-4a8062440d67
00010000-564b-328e-5713-033412484734	00020000-564b-328e-b51a-4a8062440d67
00010000-564b-3290-884a-e3b5463fb2dd	00020000-564b-3290-e7e8-8503a6e5c940
00010000-564b-3290-ce6a-5d4f219d1c79	00020000-564b-3290-6a34-9f16834b3677
00010000-564b-3290-ce6a-5d4f219d1c79	00020000-564b-3290-467c-0bbc80e69b53
00010000-564b-3290-ce6a-5d4f219d1c79	00020000-564b-3290-cd8f-95b0420f2962
00010000-564b-3290-ce6a-5d4f219d1c79	00020000-564b-3290-4860-d21127aabb0b
00010000-564b-3290-ce6a-5d4f219d1c79	00020000-564b-3290-85db-41e94d70f454
00010000-564b-3290-ce6a-5d4f219d1c79	00020000-564b-3290-6e2f-1041cab8f52e
00010000-564b-3290-e3b2-73b02364eae3	00020000-564b-3290-441d-a4587335541b
00010000-564b-3290-e3b2-73b02364eae3	00020000-564b-3290-820f-c771b9c7d583
00010000-564b-3290-e3b2-73b02364eae3	00020000-564b-3290-6d48-db7b50df6b2b
00010000-564b-3290-e3b2-73b02364eae3	00020000-564b-3290-a566-97804067890f
00010000-564b-3290-e3b2-73b02364eae3	00020000-564b-3290-742a-2062a5e0fa20
00010000-564b-3290-2eab-bb27a08b695f	00020000-564b-3290-441d-a4587335541b
00010000-564b-3290-2eab-bb27a08b695f	00020000-564b-3290-820f-c771b9c7d583
00010000-564b-3290-2eab-bb27a08b695f	00020000-564b-3290-5dfc-2ac8fd336357
00010000-564b-3290-2eab-bb27a08b695f	00020000-564b-3290-6d48-db7b50df6b2b
00010000-564b-3290-2eab-bb27a08b695f	00020000-564b-3290-a566-97804067890f
00010000-564b-3290-2eab-bb27a08b695f	00020000-564b-3290-742a-2062a5e0fa20
00010000-564b-3290-0fc6-bb9240a3f137	00020000-564b-3290-441d-a4587335541b
00010000-564b-3290-0fc6-bb9240a3f137	00020000-564b-3290-bb74-8635ecedf81a
00010000-564b-3290-0fc6-bb9240a3f137	00020000-564b-3290-820f-c771b9c7d583
00010000-564b-3290-0fc6-bb9240a3f137	00020000-564b-3290-6357-8ad79cccbd61
00010000-564b-3290-0fc6-bb9240a3f137	00020000-564b-3290-5dfc-2ac8fd336357
00010000-564b-3290-0fc6-bb9240a3f137	00020000-564b-3290-467c-0bbc80e69b53
00010000-564b-3290-0fc6-bb9240a3f137	00020000-564b-3290-6d48-db7b50df6b2b
00010000-564b-3290-0fc6-bb9240a3f137	00020000-564b-3290-a566-97804067890f
00010000-564b-3290-0fc6-bb9240a3f137	00020000-564b-3290-742a-2062a5e0fa20
00010000-564b-3290-c244-0d45fe0e74f5	00020000-564b-3290-6a34-9f16834b3677
00010000-564b-3290-c244-0d45fe0e74f5	00020000-564b-3290-8983-cf1fa645ebc9
00010000-564b-3290-c244-0d45fe0e74f5	00020000-564b-3290-467c-0bbc80e69b53
00010000-564b-3290-c244-0d45fe0e74f5	00020000-564b-3290-cd8f-95b0420f2962
00010000-564b-3290-c244-0d45fe0e74f5	00020000-564b-3290-4860-d21127aabb0b
00010000-564b-3290-c244-0d45fe0e74f5	00020000-564b-3290-85db-41e94d70f454
00010000-564b-3290-c244-0d45fe0e74f5	00020000-564b-3290-6e2f-1041cab8f52e
\.


--
-- TOC entry 3144 (class 0 OID 27701719)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 27701657)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 27701603)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-564b-3290-8fb8-e5b3a18c008a	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-564b-3290-5276-041e2c135fba	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-564b-3290-2eaf-d1d547dd51ea	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 27701226)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-564b-328e-0632-d50c5082a2e0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-564b-328e-05a7-cd806b13d379	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-564b-328e-306d-c22e21e52bbe	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-564b-328e-f7fe-4b080190cd6e	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-564b-328e-ac12-4fb9b32f9a2b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 27701218)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-564b-328e-0203-c89e698b48f3	00230000-564b-328e-f7fe-4b080190cd6e	popa
00240000-564b-328e-24ce-12d7c7ce3e7e	00230000-564b-328e-f7fe-4b080190cd6e	oseba
00240000-564b-328e-ec08-b346b8b57d40	00230000-564b-328e-f7fe-4b080190cd6e	tippopa
00240000-564b-328e-a889-0791f48e85b0	00230000-564b-328e-f7fe-4b080190cd6e	organizacijskaenota
00240000-564b-328e-c71a-8185817fba02	00230000-564b-328e-f7fe-4b080190cd6e	sezona
00240000-564b-328e-84d8-f4399b402471	00230000-564b-328e-f7fe-4b080190cd6e	tipvaje
00240000-564b-328e-0ee8-6609d023e0c5	00230000-564b-328e-05a7-cd806b13d379	prostor
00240000-564b-328e-655d-2049201f176d	00230000-564b-328e-f7fe-4b080190cd6e	besedilo
00240000-564b-328e-fb2a-9861e7d9ffc8	00230000-564b-328e-f7fe-4b080190cd6e	uprizoritev
00240000-564b-328e-9027-3b2ddf29c15d	00230000-564b-328e-f7fe-4b080190cd6e	funkcija
00240000-564b-328e-f633-2355a1162931	00230000-564b-328e-f7fe-4b080190cd6e	tipfunkcije
00240000-564b-328e-f2de-fe0d4d550c8f	00230000-564b-328e-f7fe-4b080190cd6e	alternacija
00240000-564b-328e-0b65-135fdf28614c	00230000-564b-328e-0632-d50c5082a2e0	pogodba
00240000-564b-328e-e29b-fcf94507f4fd	00230000-564b-328e-f7fe-4b080190cd6e	zaposlitev
00240000-564b-328e-edf5-bbdefa6710a8	00230000-564b-328e-f7fe-4b080190cd6e	zvrstuprizoritve
00240000-564b-328e-666d-01c6eb8a9dcf	00230000-564b-328e-0632-d50c5082a2e0	programdela
00240000-564b-328e-15f7-84d933227efa	00230000-564b-328e-f7fe-4b080190cd6e	zapis
\.


--
-- TOC entry 3093 (class 0 OID 27701213)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b1d0c6b6-1d4a-4e1b-8bbe-fc2b3e01cedd	00240000-564b-328e-0203-c89e698b48f3	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 27701784)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-564b-3291-8b27-b24862803a0a	000e0000-564b-3291-0dd5-1036694d33bf	00080000-564b-3291-8788-04f2bd526f67	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-564b-328e-50b7-55bc50953a51
00270000-564b-3291-56b3-dccff3987b86	000e0000-564b-3291-0dd5-1036694d33bf	00080000-564b-3291-8788-04f2bd526f67	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-564b-328e-50b7-55bc50953a51
\.


--
-- TOC entry 3109 (class 0 OID 27701361)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 27701613)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-564b-3291-1d4a-fb1adf89fa18	00180000-564b-3291-b732-5a0690f75043	000c0000-564b-3291-44a4-33d964000893	00090000-564b-3291-8404-387f4b4740bc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564b-3291-c13e-d19de6329049	00180000-564b-3291-b732-5a0690f75043	000c0000-564b-3291-c8f9-dced0a373642	00090000-564b-3291-9dd8-3d762fcc76f3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564b-3291-d33a-95fecf6a36a0	00180000-564b-3291-b732-5a0690f75043	000c0000-564b-3291-1e86-6fabdc27534d	00090000-564b-3291-6c9f-cc8104d73337	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564b-3291-8a04-2e769fb8d755	00180000-564b-3291-b732-5a0690f75043	000c0000-564b-3291-6367-d4dbb210f45d	00090000-564b-3291-5311-cb22bfcca5df	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564b-3291-1785-8be55c32c326	00180000-564b-3291-b732-5a0690f75043	000c0000-564b-3291-ba4c-fbfd65ab1981	00090000-564b-3291-2b1c-d70c554ea0b0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564b-3291-fa11-9472f1c24e94	00180000-564b-3291-a9df-cc2420b0b11f	\N	00090000-564b-3291-2b1c-d70c554ea0b0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-564b-3291-a5c8-9f347770a4ed	00180000-564b-3291-a9df-cc2420b0b11f	\N	00090000-564b-3291-9dd8-3d762fcc76f3	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 27701825)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-564b-328e-332c-a1674cdd486f	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-564b-328e-ab02-b934ffb9a225	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-564b-328e-804d-35cfb8ce13a3	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-564b-328e-4cb3-8b6880e01664	04	Režija	Režija	Režija	umetnik	30
000f0000-564b-328e-5a31-92fc3cce466f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-564b-328e-2510-fcb91a0bbbe0	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-564b-328e-b1a5-cc1493521227	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-564b-328e-32ce-6822c5cb9918	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-564b-328e-3d23-9d28799439d8	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-564b-328e-fd8e-a3569ce85fc8	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-564b-328e-4f16-d23041ec4dd0	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-564b-328e-3734-400fa49fe084	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-564b-328e-e0ee-3d7112cad102	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-564b-328e-9910-ae1533f618b3	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-564b-328e-7019-b5bcf8faa639	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-564b-328e-4c48-5c819d03a9a6	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-564b-328e-010c-60ad969b8b79	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-564b-328e-264c-d3c3b5b7ab5e	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 27701312)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-564b-3290-e8ff-c231926b36f9	0001	šola	osnovna ali srednja šola
00400000-564b-3290-1402-f97aeec3ab36	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-564b-3290-50b4-d92d4876a2cb	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 27702118)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-564b-328e-3744-38f30b2c97f1	01	Velika predstava	f	1.00	1.00
002b0000-564b-328e-3389-8972be850912	02	Mala predstava	f	0.50	0.50
002b0000-564b-328e-fe59-e28046595d98	03	Mala koprodukcija	t	0.40	1.00
002b0000-564b-328e-aaeb-da6bb8cfac61	04	Srednja koprodukcija	t	0.70	2.00
002b0000-564b-328e-c10b-693753ba2be4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 27701593)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-564b-328e-9110-5395aecf961f	0001	prva vaja	prva vaja
00420000-564b-328e-96d4-f86910d46b79	0002	tehnična vaja	tehnična vaja
00420000-564b-328e-8e7f-64feea948283	0003	lučna vaja	lučna vaja
00420000-564b-328e-34b8-7f9015f91def	0004	kostumska vaja	kostumska vaja
00420000-564b-328e-b25f-6cca4653bde7	0005	foto vaja	foto vaja
00420000-564b-328e-6987-6df7a8f6c0d4	0006	1. glavna vaja	1. glavna vaja
00420000-564b-328e-8bb5-8fb049f7ee3c	0007	2. glavna vaja	2. glavna vaja
00420000-564b-328e-ad0b-e4fc6f3592d1	0008	1. generalka	1. generalka
00420000-564b-328e-42c7-7bdcef142430	0009	2. generalka	2. generalka
00420000-564b-328e-d548-e2b0b4dacf5d	0010	odprta generalka	odprta generalka
00420000-564b-328e-8e62-38adf45f18eb	0011	obnovitvena vaja	obnovitvena vaja
00420000-564b-328e-ab58-b1943afd9389	0012	pevska vaja	pevska vaja
00420000-564b-328e-fae9-2ae0296915ba	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-564b-328e-3ab4-b3909d4b5ba7	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 27701434)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 27701248)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-564b-328e-5713-033412484734	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROq22i7wrk32HNP.953Q25.3X5MqiKL1W	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-564b-3290-fe90-488e0843c404	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-564b-3290-72c4-b482e07439d4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-564b-3290-c268-ced0ded25780	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-564b-3290-5edb-4ff801698e4b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-564b-3290-7d7a-a13032054e88	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-564b-3290-9250-859f8ceb7600	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-564b-3290-3e82-17e34d6a1f4d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-564b-3290-95c3-e7c379aec0fd	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-564b-3290-037a-1a85c00d6141	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-564b-3290-884a-e3b5463fb2dd	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-564b-3290-544a-8629c14e6a64	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-564b-3290-ce6a-5d4f219d1c79	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-564b-3290-e3b2-73b02364eae3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-564b-3290-2eab-bb27a08b695f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-564b-3290-0fc6-bb9240a3f137	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-564b-3290-c244-0d45fe0e74f5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-564b-328e-919d-fe417d0ba4fd	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 27701875)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-564b-3291-a46c-444eb5aa8cda	00160000-564b-3290-cdd8-202b4ec73cb1	\N	00140000-564b-328e-24cc-582ffb9d42a3	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-564b-3290-33fa-412ad03a2bac
000e0000-564b-3291-0dd5-1036694d33bf	00160000-564b-3290-0b8b-24ff6064c6d2	\N	00140000-564b-328e-fb1e-039acec3223f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-564b-3290-07bd-8a442e3a3033
000e0000-564b-3291-6fbc-cd4ed7f7fc88	\N	\N	00140000-564b-328e-fb1e-039acec3223f	00190000-564b-3291-d069-ef4bd9cf4b69	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564b-3290-33fa-412ad03a2bac
000e0000-564b-3291-c458-b28ec036da7f	\N	\N	00140000-564b-328e-fb1e-039acec3223f	00190000-564b-3291-d069-ef4bd9cf4b69	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564b-3290-33fa-412ad03a2bac
000e0000-564b-3291-da40-87f163d695b4	\N	\N	00140000-564b-328e-fb1e-039acec3223f	00190000-564b-3291-d069-ef4bd9cf4b69	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-564b-3290-5062-480c01532402
000e0000-564b-3291-5eec-c4444e6d4ac8	\N	\N	00140000-564b-328e-fb1e-039acec3223f	00190000-564b-3291-d069-ef4bd9cf4b69	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-564b-3290-5062-480c01532402
\.


--
-- TOC entry 3123 (class 0 OID 27701533)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-564b-3291-efa1-3a926ab79725	\N	000e0000-564b-3291-0dd5-1036694d33bf	1	
00200000-564b-3291-dfae-230935dbca3c	\N	000e0000-564b-3291-0dd5-1036694d33bf	2	
00200000-564b-3291-34a4-79c4e3ddf25c	\N	000e0000-564b-3291-0dd5-1036694d33bf	3	
00200000-564b-3291-bcf8-df7da3d06a47	\N	000e0000-564b-3291-0dd5-1036694d33bf	4	
00200000-564b-3291-fd50-15fdf5d8e8ad	\N	000e0000-564b-3291-0dd5-1036694d33bf	5	
\.


--
-- TOC entry 3140 (class 0 OID 27701684)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 27701798)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-564b-328e-e49d-a2e10114db38	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-564b-328e-aebe-d662fe832b81	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-564b-328e-f485-9612ac577bed	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-564b-328e-ff0a-31a4dcb5aa83	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-564b-328e-9e3e-7a9caa8b187f	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-564b-328e-b5df-497d29363f0a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-564b-328e-4f3c-6a4d38d74055	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-564b-328e-53c7-539f2c99e09d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-564b-328e-50b7-55bc50953a51	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-564b-328e-3469-340be2d408e5	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-564b-328e-3665-7b43c4a6e06b	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-564b-328e-66f7-f7f349d9561b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-564b-328e-0148-8ee7b66031f2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-564b-328e-16d9-5f9d99297c75	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-564b-328e-d3a9-0fbfd9ec313c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-564b-328e-ea6d-b1ea8525c4f9	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-564b-328e-1395-666607f28918	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-564b-328e-2ea7-c54f01d61f56	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-564b-328e-7df3-f5e7d99951b7	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-564b-328e-4b8d-b4056c78a95a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-564b-328e-150d-608c461ead0c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-564b-328e-45ce-43d038cf4226	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-564b-328e-7c1c-593077714401	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-564b-328e-e71b-2ce314b4f442	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-564b-328e-d46c-c3448173bc2c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-564b-328e-498c-09835c7e53ae	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-564b-328e-61fc-e622ce693bf6	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-564b-328e-2a98-078e5299de10	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 27702168)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 27702137)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 27702180)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 27701756)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-564b-3291-47af-ae7759d940e6	00090000-564b-3291-9dd8-3d762fcc76f3	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564b-3291-327c-c376ea6fafbd	00090000-564b-3291-6c9f-cc8104d73337	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564b-3291-c5e9-7efc5da80236	00090000-564b-3291-e634-cb9e5ae8f057	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564b-3291-05f4-2cbfd7ad7703	00090000-564b-3291-5d7a-8e90b6812ca7	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564b-3291-a0a2-f9150432456e	00090000-564b-3291-19a9-b9b9b520bb58	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564b-3291-736f-9a2780006178	00090000-564b-3291-f563-3d421c6f632e	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 27701577)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 27701865)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-564b-328e-24cc-582ffb9d42a3	01	Drama	drama (SURS 01)
00140000-564b-328e-1b93-502eeaea9baf	02	Opera	opera (SURS 02)
00140000-564b-328e-2cb3-b129308658e4	03	Balet	balet (SURS 03)
00140000-564b-328e-776f-9339eacd0f02	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-564b-328e-4dee-5d2bd4ffd703	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-564b-328e-fb1e-039acec3223f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-564b-328e-8175-66a33e6683fc	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 27701746)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 27701311)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 27701924)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 27701914)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 27701302)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 27701781)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 27701823)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 27702221)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 27701565)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 27701587)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 27701592)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 27702135)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 27701460)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 27701992)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 27701742)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 27701531)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 27701498)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 27701474)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 27701649)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 27702198)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 27702205)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 27702229)
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
-- TOC entry 2726 (class 2606 OID 27701676)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 27701432)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 27701330)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 27701394)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 27701357)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 27701291)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 27701276)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 27701682)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 27701718)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 27701860)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 27701385)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 27701420)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 27702087)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 27701655)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 27701410)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 27701550)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 27701519)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 27701511)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 27701667)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 27702096)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 27702104)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 27702074)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 27702116)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 27701700)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 27701640)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 27701631)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 27701847)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 27701774)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 27701486)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 27701247)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 27701709)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 27701265)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 27701285)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 27701727)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 27701662)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 27701611)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 27701235)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 27701223)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 27701217)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 27701794)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 27701366)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 27701622)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 27701834)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 27701319)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 27702128)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 27701600)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 27701445)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 27701260)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 27701893)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 27701540)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 27701690)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 27701806)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 27702178)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 27702162)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 27702186)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 27701764)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 27701581)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 27701873)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 27701754)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 27701575)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 27701576)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 27701574)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 27701573)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 27701572)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 27701795)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 27701796)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 27701797)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 27702200)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 27702199)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 27701387)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 27701388)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 27701683)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 27702166)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 27702165)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 27702167)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 27702164)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 27702163)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 27701669)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 27701668)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 27701541)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 27701542)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 27701743)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 27701745)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 27701744)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 27701476)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 27701475)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 27702117)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 27701862)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 27701863)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 27701864)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 27702187)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 27701898)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 27701895)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 27701899)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 27701897)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 27701896)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 27701447)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 27701446)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 27701360)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 27701710)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 27701292)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 27701293)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 27701730)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 27701729)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 27701728)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 27701397)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 27701396)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 27701398)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 27701514)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 27701512)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 27701513)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 27701225)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 27701635)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 27701633)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 27701632)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 27701634)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 27701266)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 27701267)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 27701691)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 27702222)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 27701783)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 27701782)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 27702230)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 27702231)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 27701656)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 27701775)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 27701776)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 27701997)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 27701996)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 27701993)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 27701994)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 27701995)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 27701412)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 27701411)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 27701413)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 27701704)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 27701703)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 27702097)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 27702098)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 27701928)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 27701929)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 27701926)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 27701927)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 27701765)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 27701766)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 27701644)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 27701643)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 27701641)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 27701642)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 27701916)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 27701915)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 27701487)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 27701501)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 27701500)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 27701499)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 27701502)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 27701532)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 27701520)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 27701521)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 27702088)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 27702136)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 27702206)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 27702207)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 27701332)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 27701331)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 27701367)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 27701368)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 27701582)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 27701625)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 27701624)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 27701623)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 27701567)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 27701568)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 27701571)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 27701566)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 27701570)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 27701569)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 27701386)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 27701320)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 27701321)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 27701461)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 27701463)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 27701462)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 27701464)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 27701650)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 27701861)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 27701894)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 27701835)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 27701836)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 27701358)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 27701359)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 27701755)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 27701236)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 27701433)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 27701395)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 27701224)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 27702129)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 27701702)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 27701701)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 27701601)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 27701602)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 27701925)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 27701421)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 27701874)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 27702179)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 27702105)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 27702106)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 27701824)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 27701612)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 27701286)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 27702402)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 27702407)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 27702432)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 27702422)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 27702397)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 27702417)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 27702427)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 27702412)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 27702602)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 27702607)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 27702612)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 27702777)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 27702772)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 27702287)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 27702292)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 27702517)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 27702757)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 27702752)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 27702762)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 27702747)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 27702742)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 27702512)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 27702507)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 27702387)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 27702392)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 27702557)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 27702567)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 27702562)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 27702342)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 27702337)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 27702497)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 27702732)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 27702617)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 27702622)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 27702627)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 27702767)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 27702647)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 27702632)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 27702652)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 27702642)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 27702637)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 27702332)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 27702327)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 27702272)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 27702267)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 27702537)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 27702247)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 27702252)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 27702552)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 27702547)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 27702542)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 27702302)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 27702297)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 27702307)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 27702367)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 27702357)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 27702362)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 27702232)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 27702472)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 27702462)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 27702457)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 27702467)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 27702237)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 27702242)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 27702522)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 27702792)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 27702597)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 27702592)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 27702797)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 27702802)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 27702502)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 27702582)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 27702587)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 27702707)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 27702702)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 27702687)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 27702692)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 27702697)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 27702317)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 27702312)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 27702322)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 27702532)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 27702527)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 27702717)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 27702722)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 27702677)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 27702682)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 27702667)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 27702672)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 27702572)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 27702577)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 27702492)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 27702487)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 27702477)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 27702482)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 27702662)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 27702657)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 27702347)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 27702352)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 27702382)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 27702372)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 27702377)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 27702712)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 27702727)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 27702737)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 27702782)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 27702787)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 27702262)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 27702257)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 27702277)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 27702282)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 27702437)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 27702452)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 27702447)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 27702442)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-17 14:58:44 CET

--
-- PostgreSQL database dump complete
--

