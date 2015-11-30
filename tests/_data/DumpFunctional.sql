--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-30 09:20:53 CET

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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 30073243)
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
-- TOC entry 237 (class 1259 OID 30073857)
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
-- TOC entry 236 (class 1259 OID 30073840)
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
-- TOC entry 182 (class 1259 OID 30073236)
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
-- TOC entry 181 (class 1259 OID 30073234)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 30073717)
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
-- TOC entry 230 (class 1259 OID 30073747)
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
-- TOC entry 251 (class 1259 OID 30074150)
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
-- TOC entry 203 (class 1259 OID 30073491)
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
-- TOC entry 205 (class 1259 OID 30073523)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30073528)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 30074072)
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
-- TOC entry 194 (class 1259 OID 30073388)
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
-- TOC entry 238 (class 1259 OID 30073870)
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
-- TOC entry 223 (class 1259 OID 30073671)
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
-- TOC entry 200 (class 1259 OID 30073462)
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
-- TOC entry 197 (class 1259 OID 30073428)
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
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 30073405)
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
-- TOC entry 212 (class 1259 OID 30073585)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 30074130)
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
-- TOC entry 250 (class 1259 OID 30074143)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 30074165)
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
-- TOC entry 216 (class 1259 OID 30073610)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 30073362)
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
-- TOC entry 185 (class 1259 OID 30073262)
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
-- TOC entry 189 (class 1259 OID 30073329)
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
-- TOC entry 186 (class 1259 OID 30073273)
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
-- TOC entry 178 (class 1259 OID 30073208)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 30073227)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30073617)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 30073651)
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
-- TOC entry 233 (class 1259 OID 30073788)
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
-- TOC entry 188 (class 1259 OID 30073309)
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
-- TOC entry 191 (class 1259 OID 30073354)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 30074016)
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
-- TOC entry 213 (class 1259 OID 30073591)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 30073339)
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
-- TOC entry 202 (class 1259 OID 30073483)
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
-- TOC entry 198 (class 1259 OID 30073443)
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
-- TOC entry 199 (class 1259 OID 30073455)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30073603)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 30074030)
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
-- TOC entry 242 (class 1259 OID 30074040)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 30073939)
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
-- TOC entry 243 (class 1259 OID 30074048)
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
-- TOC entry 219 (class 1259 OID 30073632)
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
-- TOC entry 211 (class 1259 OID 30073576)
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
-- TOC entry 210 (class 1259 OID 30073566)
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
-- TOC entry 232 (class 1259 OID 30073777)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 30073707)
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
-- TOC entry 196 (class 1259 OID 30073417)
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
-- TOC entry 175 (class 1259 OID 30073179)
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
-- TOC entry 174 (class 1259 OID 30073177)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 30073645)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 30073217)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 30073201)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 30073659)
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
-- TOC entry 214 (class 1259 OID 30073597)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 30073543)
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
-- TOC entry 173 (class 1259 OID 30073166)
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
-- TOC entry 172 (class 1259 OID 30073158)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 30073153)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 30073724)
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
-- TOC entry 187 (class 1259 OID 30073301)
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
-- TOC entry 209 (class 1259 OID 30073553)
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
-- TOC entry 231 (class 1259 OID 30073765)
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
-- TOC entry 184 (class 1259 OID 30073252)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 30074060)
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
-- TOC entry 207 (class 1259 OID 30073533)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 30073374)
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
-- TOC entry 176 (class 1259 OID 30073188)
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
-- TOC entry 235 (class 1259 OID 30073815)
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
-- TOC entry 201 (class 1259 OID 30073473)
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
-- TOC entry 218 (class 1259 OID 30073624)
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
-- TOC entry 229 (class 1259 OID 30073738)
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
-- TOC entry 247 (class 1259 OID 30074110)
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
-- TOC entry 246 (class 1259 OID 30074079)
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
-- TOC entry 248 (class 1259 OID 30074122)
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
-- TOC entry 225 (class 1259 OID 30073696)
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
-- TOC entry 204 (class 1259 OID 30073517)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 30073805)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 30073686)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 30073239)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 30073182)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 30073243)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-565c-06e2-c571-a6657a2a6fec	10	30	Otroci	Abonma za otroke	200
000a0000-565c-06e2-53bb-cc539516c1f7	20	60	Mladina	Abonma za mladino	400
000a0000-565c-06e2-5c6e-124bf6e65ecc	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 30073857)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-565c-06e3-33fd-aa9b655084df	000d0000-565c-06e3-0ad8-e191700860dd	\N	00090000-565c-06e2-8146-9be834a36bda	000b0000-565c-06e2-082b-102c1485ce1d	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-565c-06e3-4b98-ca07b9cbb469	000d0000-565c-06e3-95b9-3ff3ac78d975	00100000-565c-06e2-7d07-5c0d496fa29a	00090000-565c-06e2-3e6b-b61470ac7a2d	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-565c-06e3-c120-14a9970922df	000d0000-565c-06e3-68dd-149f112a3573	00100000-565c-06e2-06a9-7bafeeb6bb0b	00090000-565c-06e2-5d10-ca5cc9e38272	\N	0003	t	\N	2015-11-30	\N	2	t	\N	f	f
000c0000-565c-06e3-2863-7512361e74ab	000d0000-565c-06e3-e124-19956feeb43a	\N	00090000-565c-06e2-ca35-e7aedb1e8eed	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-565c-06e3-e356-a875cfdeaeee	000d0000-565c-06e3-e8ec-3f6a77beb5ef	\N	00090000-565c-06e2-5857-5f55a1c747ce	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-565c-06e3-955d-fae1e3f01100	000d0000-565c-06e3-d32f-7e2d2853cda4	\N	00090000-565c-06e2-37b8-04c9dda78ed4	000b0000-565c-06e2-bab0-37c10c446175	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-565c-06e3-d3cd-261b161a1831	000d0000-565c-06e3-cb77-ced68920799e	00100000-565c-06e2-4828-395756b48d0b	00090000-565c-06e2-5aa2-fa2e309b134c	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-565c-06e3-a734-0d4bb7e30bc3	000d0000-565c-06e3-62ac-fc163d83b46e	\N	00090000-565c-06e2-3d4e-0c99df22d2dd	000b0000-565c-06e2-f0d7-1ba8388f5a90	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-565c-06e3-fc54-9e9a2ea0433f	000d0000-565c-06e3-cb77-ced68920799e	00100000-565c-06e2-f7dc-48ec402978d7	00090000-565c-06e2-91a9-86cb3a86115b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-565c-06e3-864a-ba39b5257480	000d0000-565c-06e3-cb77-ced68920799e	00100000-565c-06e2-6daa-aa4338c7aebe	00090000-565c-06e2-8e96-2aeaf477180e	\N	0010	t	\N	2015-11-30	\N	16	f	\N	f	t
000c0000-565c-06e3-8c30-36ab8ea78b0e	000d0000-565c-06e3-cb77-ced68920799e	00100000-565c-06e2-fb5c-dd43ae4243e3	00090000-565c-06e2-b40b-bf67e9b7bb7b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-565c-06e3-635a-157ed80c72eb	000d0000-565c-06e3-3af6-6e7a37012def	00100000-565c-06e2-7d07-5c0d496fa29a	00090000-565c-06e2-3e6b-b61470ac7a2d	000b0000-565c-06e2-48a8-98e0bd2eabbf	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 30073840)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 30073236)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3151 (class 0 OID 30073717)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-565c-06e3-e258-43229a55c757	00160000-565c-06e2-3b6d-81dac97efba0	00090000-565c-06e2-5a75-5717fef75243	aizv	10	t
003d0000-565c-06e3-d8b3-d8a44c0294f9	00160000-565c-06e2-3b6d-81dac97efba0	00090000-565c-06e2-481a-97ef7cb06dac	apri	14	t
003d0000-565c-06e3-ea92-bf4901594f3d	00160000-565c-06e2-a956-f034a4571f9a	00090000-565c-06e2-d82a-e9ff08d812db	aizv	11	t
003d0000-565c-06e3-fed2-08ffc37f2ee5	00160000-565c-06e2-5b25-5cd81448e5d3	00090000-565c-06e2-90e6-ade56a2778a7	aizv	12	t
003d0000-565c-06e3-399b-a29788c39c44	00160000-565c-06e2-3b6d-81dac97efba0	00090000-565c-06e2-5a78-e96497b1010b	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 30073747)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-565c-06e2-3b6d-81dac97efba0	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-565c-06e2-a956-f034a4571f9a	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-565c-06e2-5b25-5cd81448e5d3	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 30074150)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 30073491)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-565c-06e3-5de7-7b4f8f1c2458	\N	\N	00200000-565c-06e3-c8fa-e5dddba9cc95	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-565c-06e3-613a-23f101cfe0ea	\N	\N	00200000-565c-06e3-eedf-c209b438bebc	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-565c-06e3-c8e1-4451dffdda46	\N	\N	00200000-565c-06e3-b67e-0514419f9dd0	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-565c-06e3-5207-b047173b3f27	\N	\N	00200000-565c-06e3-abc5-715614e18fdd	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-565c-06e3-ed02-63992ffbdd84	\N	\N	00200000-565c-06e3-50cb-c226b9d0336d	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 30073523)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 30073528)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 30074072)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 30073388)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-565c-06e0-138e-bc940f650e98	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-565c-06e0-b598-b6b39d9e5c66	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-565c-06e0-cd25-a66d42d989bf	AL	ALB	008	Albania 	Albanija	\N
00040000-565c-06e0-f25a-7fb18f248c89	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-565c-06e0-2869-9dd4f48b712f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-565c-06e0-9b46-a38a2faf0a1d	AD	AND	020	Andorra 	Andora	\N
00040000-565c-06e0-53f3-2d04b70eeeb6	AO	AGO	024	Angola 	Angola	\N
00040000-565c-06e0-29d8-9e70a99482f7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-565c-06e0-9fe3-5b10ff02ea18	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-565c-06e0-7f21-bbf02b6eec4b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-565c-06e0-0877-422740d14568	AR	ARG	032	Argentina 	Argenitna	\N
00040000-565c-06e0-bdac-28cb8b9d9993	AM	ARM	051	Armenia 	Armenija	\N
00040000-565c-06e0-eea0-c9dfa5421b11	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-565c-06e0-2d92-92b87ef00cec	AU	AUS	036	Australia 	Avstralija	\N
00040000-565c-06e0-cc6f-1f248daedb9d	AT	AUT	040	Austria 	Avstrija	\N
00040000-565c-06e0-dd9e-b55458b34358	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-565c-06e0-431e-bba058948537	BS	BHS	044	Bahamas 	Bahami	\N
00040000-565c-06e0-5efc-5cdae6e77484	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-565c-06e0-be46-8111a9d18b04	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-565c-06e0-d41d-f0a7912504ce	BB	BRB	052	Barbados 	Barbados	\N
00040000-565c-06e0-cf74-909cdaf63ad3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-565c-06e0-3a5c-2bbf9bd08b7f	BE	BEL	056	Belgium 	Belgija	\N
00040000-565c-06e0-3ae7-ccf405e90863	BZ	BLZ	084	Belize 	Belize	\N
00040000-565c-06e0-64f2-a6020f39c54a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-565c-06e0-d0bb-64b944e456e9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-565c-06e0-0ca2-a18f749c50d8	BT	BTN	064	Bhutan 	Butan	\N
00040000-565c-06e0-656a-1af1e42cef51	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-565c-06e0-6839-4fd36ce9b881	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-565c-06e0-9e76-e5bb916cc878	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-565c-06e0-2ba6-4e9cd35336ce	BW	BWA	072	Botswana 	Bocvana	\N
00040000-565c-06e0-bce4-c6763d542162	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-565c-06e0-7b0d-ce99f536b563	BR	BRA	076	Brazil 	Brazilija	\N
00040000-565c-06e0-4c40-dfe080e68f79	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-565c-06e0-cde9-9f4409a32e9a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-565c-06e0-f87e-60345ee7a5f8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-565c-06e0-65c9-3be6a95846b1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-565c-06e0-5e84-667726786507	BI	BDI	108	Burundi 	Burundi 	\N
00040000-565c-06e0-8045-e5d1709bf248	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-565c-06e0-102c-ec3e80d732a3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-565c-06e0-2f6c-dcd36bbafb5b	CA	CAN	124	Canada 	Kanada	\N
00040000-565c-06e0-cbfb-e308322aa464	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-565c-06e0-fd02-b202b683838a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-565c-06e0-e989-d2d23fef2056	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-565c-06e0-962f-09ef089238bb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-565c-06e0-92f0-6cbe282c024b	CL	CHL	152	Chile 	Čile	\N
00040000-565c-06e0-c55a-77c76c615597	CN	CHN	156	China 	Kitajska	\N
00040000-565c-06e0-aa1c-ec5c4151a926	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-565c-06e0-2433-754c68da8f5d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-565c-06e0-f848-c8ca03fc5cd6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-565c-06e0-3a21-5b8ec831b25d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-565c-06e0-1b3d-457be48ed7d7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-565c-06e0-1011-c58239f29861	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-565c-06e0-c79e-9105f73d30dc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-565c-06e0-1e93-81698c900437	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-565c-06e0-3d61-05dc870e3234	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-565c-06e0-ca18-53c220339d94	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-565c-06e0-20af-c76f509e014a	CU	CUB	192	Cuba 	Kuba	\N
00040000-565c-06e0-f83e-97eb1d395bd8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-565c-06e0-4beb-652728583335	CY	CYP	196	Cyprus 	Ciper	\N
00040000-565c-06e0-2d30-8e08abb02223	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-565c-06e0-1c2b-038974c04603	DK	DNK	208	Denmark 	Danska	\N
00040000-565c-06e0-a356-4e995205cc99	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-565c-06e0-23cb-5b79b6e134c0	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-565c-06e0-f706-a05e69de33be	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-565c-06e0-c071-ffc4d4a5b3c3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-565c-06e0-874c-5768fe982fb2	EG	EGY	818	Egypt 	Egipt	\N
00040000-565c-06e0-94a9-cd3c1911fc25	SV	SLV	222	El Salvador 	Salvador	\N
00040000-565c-06e0-cbb2-c94d4c7f68e4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-565c-06e0-955e-ceea8e780dc9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-565c-06e0-bfef-88728982be2d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-565c-06e0-a41f-f7ddd3c37821	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-565c-06e0-1edb-ff425d2f587b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-565c-06e0-974a-920bc493160d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-565c-06e0-93cb-3b6d4a7d9818	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-565c-06e0-c7c9-7d97b3ca6310	FI	FIN	246	Finland 	Finska	\N
00040000-565c-06e0-e881-27a990953088	FR	FRA	250	France 	Francija	\N
00040000-565c-06e0-8246-0ac7c0c69d8f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-565c-06e0-2b7a-f71995ca7f53	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-565c-06e0-b458-d73894d574b1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-565c-06e0-63db-486668d4b7c4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-565c-06e0-8248-956400e41b7a	GA	GAB	266	Gabon 	Gabon	\N
00040000-565c-06e0-ca07-ec306afa4700	GM	GMB	270	Gambia 	Gambija	\N
00040000-565c-06e0-a694-8a99b9877b6c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-565c-06e0-cf25-67e8bee2412a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-565c-06e0-a58d-735e3758d120	GH	GHA	288	Ghana 	Gana	\N
00040000-565c-06e0-7fa6-1dbf6897629b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-565c-06e0-7a73-dfce279be690	GR	GRC	300	Greece 	Grčija	\N
00040000-565c-06e0-1a89-e92cb3d69175	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-565c-06e0-f88c-dd0781075a16	GD	GRD	308	Grenada 	Grenada	\N
00040000-565c-06e0-dc4c-da318c2048a2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-565c-06e0-c849-6df11e5341c5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-565c-06e0-2bb1-7b4a6922c470	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-565c-06e0-4965-94d377a1c71f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-565c-06e0-1c12-3e3418d025f6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-565c-06e0-e472-3067aa5f392e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-565c-06e0-9e6a-49afd3a6230a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-565c-06e0-fbd1-5d9131ab9422	HT	HTI	332	Haiti 	Haiti	\N
00040000-565c-06e0-a1e8-9882040b2f9f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-565c-06e0-ab50-9010e50d8962	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-565c-06e0-6bf3-a542c5104278	HN	HND	340	Honduras 	Honduras	\N
00040000-565c-06e0-9035-d53ace0326b9	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-565c-06e0-de3f-75e2357d9db4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-565c-06e0-076c-a7f323c85b75	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-565c-06e0-1014-cb2f189382db	IN	IND	356	India 	Indija	\N
00040000-565c-06e0-2fa1-341dd1e8ff11	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-565c-06e0-4ebf-8137297cbfc0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-565c-06e0-48cf-29a8689b03b2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-565c-06e0-7661-c8c001375f14	IE	IRL	372	Ireland 	Irska	\N
00040000-565c-06e0-9a8c-89b79786090a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-565c-06e0-73d3-076d3397bc18	IL	ISR	376	Israel 	Izrael	\N
00040000-565c-06e0-e95c-65ae82e8fa16	IT	ITA	380	Italy 	Italija	\N
00040000-565c-06e0-4dc0-8f022640f916	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-565c-06e0-ffe3-0e3eaa8820b5	JP	JPN	392	Japan 	Japonska	\N
00040000-565c-06e0-2e78-535c2ec7f824	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-565c-06e0-0e1a-79b9ff6240cc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-565c-06e0-c463-41183fcdfb07	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-565c-06e0-a227-d06d49697ac6	KE	KEN	404	Kenya 	Kenija	\N
00040000-565c-06e0-e1f4-df92d4c6de44	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-565c-06e0-7cff-857d8aa1cb42	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-565c-06e0-19a5-29b9d09f3679	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-565c-06e0-12eb-03d5295fbc45	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-565c-06e0-cacc-257fb265139a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-565c-06e0-b624-3d2ffaf39c0f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-565c-06e0-0b4c-60d26dd48187	LV	LVA	428	Latvia 	Latvija	\N
00040000-565c-06e0-5f44-d2e4d41cf443	LB	LBN	422	Lebanon 	Libanon	\N
00040000-565c-06e0-f894-57d3989856e0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-565c-06e0-a3fc-c8a664787cb9	LR	LBR	430	Liberia 	Liberija	\N
00040000-565c-06e0-da23-6862a1ac8025	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-565c-06e0-1d11-90da37bc9407	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-565c-06e0-8874-bf2cf28661c7	LT	LTU	440	Lithuania 	Litva	\N
00040000-565c-06e0-ab46-a2d823cef998	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-565c-06e0-f273-09b068b60a31	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-565c-06e0-939c-dc145d87a990	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-565c-06e0-862c-a30d72d94fbb	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-565c-06e0-e07c-e12597b54620	MW	MWI	454	Malawi 	Malavi	\N
00040000-565c-06e0-fdf9-4e12c8936487	MY	MYS	458	Malaysia 	Malezija	\N
00040000-565c-06e0-059a-d651e0ed9eda	MV	MDV	462	Maldives 	Maldivi	\N
00040000-565c-06e0-3657-af400b6c0120	ML	MLI	466	Mali 	Mali	\N
00040000-565c-06e0-49be-7ce351b6a864	MT	MLT	470	Malta 	Malta	\N
00040000-565c-06e0-12dd-2f8420e9a177	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-565c-06e0-76c0-0c4b8d48ad19	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-565c-06e0-4091-b6e2cb7690e9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-565c-06e0-480f-100a8b037f78	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-565c-06e0-f6eb-7f45e654d77c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-565c-06e0-9037-8e449771f640	MX	MEX	484	Mexico 	Mehika	\N
00040000-565c-06e0-a5c9-7a7a04fccc52	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-565c-06e0-f0c6-b9485f37b608	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-565c-06e0-7761-2f15bfca4290	MC	MCO	492	Monaco 	Monako	\N
00040000-565c-06e0-32dd-cf3a21e29b1a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-565c-06e0-0b85-d393c09f08a2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-565c-06e0-a368-71be89005ba0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-565c-06e0-a337-8eddd270bb0f	MA	MAR	504	Morocco 	Maroko	\N
00040000-565c-06e0-f578-d036adaaf97b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-565c-06e0-d27b-94b765bae620	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-565c-06e0-672b-28d64d7eb3af	NA	NAM	516	Namibia 	Namibija	\N
00040000-565c-06e0-cdea-512d7d2b42ab	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-565c-06e0-19ee-7cf3436c7d04	NP	NPL	524	Nepal 	Nepal	\N
00040000-565c-06e0-1521-4c08fcf57d1a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-565c-06e0-810f-21380a8a186c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-565c-06e0-4dc9-88ff7bc00f41	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-565c-06e0-13c8-f3c5a1aad1a5	NE	NER	562	Niger 	Niger 	\N
00040000-565c-06e0-a2d2-bd1b88a8689d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-565c-06e0-d71f-296543e9e085	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-565c-06e0-0b7b-658029a3eab6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-565c-06e0-ab99-dd5530c014cb	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-565c-06e0-2e73-1b34afcce76f	NO	NOR	578	Norway 	Norveška	\N
00040000-565c-06e0-2113-a53b91d7f757	OM	OMN	512	Oman 	Oman	\N
00040000-565c-06e0-9efe-10d5b67ef921	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-565c-06e0-a038-abc53a3b262c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-565c-06e0-b860-01538e3ede82	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-565c-06e0-51e2-d703d8839aed	PA	PAN	591	Panama 	Panama	\N
00040000-565c-06e0-f005-c2f58dd660c4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-565c-06e0-d074-2822c2c19862	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-565c-06e0-5cbc-161b4f0a4b88	PE	PER	604	Peru 	Peru	\N
00040000-565c-06e0-231c-6b84f8e5d862	PH	PHL	608	Philippines 	Filipini	\N
00040000-565c-06e0-cd50-5e2ca82dac70	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-565c-06e0-4111-ed64ce775608	PL	POL	616	Poland 	Poljska	\N
00040000-565c-06e0-57b2-04cbcc97feb7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-565c-06e0-7c95-ea498f285316	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-565c-06e0-2e3b-0b38d666a8ae	QA	QAT	634	Qatar 	Katar	\N
00040000-565c-06e0-c1c8-0521597d96d3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-565c-06e0-18d1-f805e6cbccd6	RO	ROU	642	Romania 	Romunija	\N
00040000-565c-06e0-d8b5-d607498715bb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-565c-06e0-0c1c-e2b01ea40e00	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-565c-06e0-8c49-d2348391393e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-565c-06e0-e89b-680c6e1ab860	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-565c-06e0-629d-887f5a88a309	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-565c-06e0-ae0a-0bee3eb94bb1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-565c-06e0-a571-4b812712f5c1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-565c-06e0-c940-bbff3a852a6d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-565c-06e0-d7ff-99c37e5ce0fe	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-565c-06e0-8d4a-6d5b9fc3d0fb	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-565c-06e0-6bd0-b97dd3c375be	SM	SMR	674	San Marino 	San Marino	\N
00040000-565c-06e0-a1a0-8bbcd8b1f086	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-565c-06e0-2c09-9410509d094d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-565c-06e0-e62c-9d203bfa4516	SN	SEN	686	Senegal 	Senegal	\N
00040000-565c-06e0-75bc-f84175f069cd	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-565c-06e0-7939-6504617df042	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-565c-06e0-0048-cd273fb02a50	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-565c-06e0-8c67-5a9bc29d1f30	SG	SGP	702	Singapore 	Singapur	\N
00040000-565c-06e0-26c1-bbdf3b0b77c9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-565c-06e0-49f6-c04c2379e9ce	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-565c-06e0-f2b9-bc58b7522ea1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-565c-06e0-4ab8-f9bb6fca3418	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-565c-06e0-fbaf-3dcec0aad598	SO	SOM	706	Somalia 	Somalija	\N
00040000-565c-06e0-c5cc-6506d0062620	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-565c-06e0-8a58-bcaab38c5b11	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-565c-06e0-02a8-085e6876e2e9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-565c-06e0-4789-f10619f80408	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-565c-06e0-8d3a-017d51993fa9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-565c-06e0-0ad5-bd1b19c9f0a5	SD	SDN	729	Sudan 	Sudan	\N
00040000-565c-06e0-c352-83bd7c69dde6	SR	SUR	740	Suriname 	Surinam	\N
00040000-565c-06e0-b71a-87ecc15f8852	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-565c-06e0-0a5e-88eae694e1ad	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-565c-06e0-9b9c-5c5597c6f534	SE	SWE	752	Sweden 	Švedska	\N
00040000-565c-06e0-edce-b38962610843	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-565c-06e0-e724-e5cd96025958	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-565c-06e0-601d-c95a920c1d82	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-565c-06e0-732a-ba7e7eb5614b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-565c-06e0-acb0-106497309107	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-565c-06e0-fb8e-385b6f0304b0	TH	THA	764	Thailand 	Tajska	\N
00040000-565c-06e0-1c9d-82fe5e9f53ed	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-565c-06e0-ab32-45f3d9dcc861	TG	TGO	768	Togo 	Togo	\N
00040000-565c-06e0-56b1-460adc51cafd	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-565c-06e0-5e10-746aac7dd41f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-565c-06e0-c73e-345c9ecf62d6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-565c-06e0-c4da-9edf12ee5a0b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-565c-06e0-555b-857590856ff5	TR	TUR	792	Turkey 	Turčija	\N
00040000-565c-06e0-a5ce-861c8a497bb2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-565c-06e0-8fb6-d4a6a2dabef8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565c-06e0-3680-cadcc577b0bd	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-565c-06e0-7b38-69c14acd968c	UG	UGA	800	Uganda 	Uganda	\N
00040000-565c-06e0-1670-c92e11537ccb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-565c-06e0-9feb-f6fd296850af	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-565c-06e0-67a3-2468d4428604	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-565c-06e0-ee97-7a5e152f0d78	US	USA	840	United States 	Združene države Amerike	\N
00040000-565c-06e0-d6d1-c4d79706d65b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-565c-06e0-5b76-e456f6df02be	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-565c-06e0-33f6-b1bf97ada34c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-565c-06e0-3b4d-f85e0c377439	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-565c-06e0-90ee-061045dff40f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-565c-06e0-b1e8-cc89a43289de	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-565c-06e0-4a1b-cbee6a436d86	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-565c-06e0-caff-aa256dfe05b8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-565c-06e0-8dd5-549599ed237d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-565c-06e0-6655-0b17d6655d20	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-565c-06e0-5294-0b5d3bb803bb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-565c-06e0-e718-54fbd749f270	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-565c-06e0-30d1-9a232bc27d14	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 30073870)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-565c-06e3-9743-c2b1ca3961d1	000e0000-565c-06e3-75cc-6d487bd37606	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565c-06df-1d29-fe6df061a4aa	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565c-06e3-3cd9-7d263b078087	000e0000-565c-06e3-ff3c-a303ceaf1e21	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565c-06df-2154-2bebcf34c9ae	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-565c-06e3-4723-9bd09d224e3a	000e0000-565c-06e3-1360-7fc6ace6036f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-565c-06df-1d29-fe6df061a4aa	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565c-06e3-f745-1f61e2ebe919	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-565c-06e3-7dcf-37c45c77d352	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 30073671)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-565c-06e3-cb77-ced68920799e	000e0000-565c-06e3-ff3c-a303ceaf1e21	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-565c-06df-04f1-cc82dd639580
000d0000-565c-06e3-0ad8-e191700860dd	000e0000-565c-06e3-ff3c-a303ceaf1e21	000c0000-565c-06e3-33fd-aa9b655084df	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-565c-06df-04f1-cc82dd639580
000d0000-565c-06e3-95b9-3ff3ac78d975	000e0000-565c-06e3-ff3c-a303ceaf1e21	000c0000-565c-06e3-4b98-ca07b9cbb469	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-565c-06df-966a-754c4c2b9b28
000d0000-565c-06e3-68dd-149f112a3573	000e0000-565c-06e3-ff3c-a303ceaf1e21	000c0000-565c-06e3-c120-14a9970922df	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-565c-06df-d476-a8a69fb109a5
000d0000-565c-06e3-e124-19956feeb43a	000e0000-565c-06e3-ff3c-a303ceaf1e21	000c0000-565c-06e3-2863-7512361e74ab	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-565c-06df-f068-479600f780be
000d0000-565c-06e3-e8ec-3f6a77beb5ef	000e0000-565c-06e3-ff3c-a303ceaf1e21	000c0000-565c-06e3-e356-a875cfdeaeee	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-565c-06df-f068-479600f780be
000d0000-565c-06e3-d32f-7e2d2853cda4	000e0000-565c-06e3-ff3c-a303ceaf1e21	000c0000-565c-06e3-955d-fae1e3f01100	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-565c-06df-04f1-cc82dd639580
000d0000-565c-06e3-62ac-fc163d83b46e	000e0000-565c-06e3-ff3c-a303ceaf1e21	000c0000-565c-06e3-a734-0d4bb7e30bc3	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-565c-06df-8e66-e5e5ad7bf472
000d0000-565c-06e3-3af6-6e7a37012def	000e0000-565c-06e3-ff3c-a303ceaf1e21	000c0000-565c-06e3-635a-157ed80c72eb	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-565c-06df-8db0-cca77cf60327
\.


--
-- TOC entry 3124 (class 0 OID 30073462)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 30073428)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 30073405)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-565c-06e2-acec-d6fb689af084	00080000-565c-06e2-f67e-80b5f47d76ba	00090000-565c-06e2-8e96-2aeaf477180e	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 30073585)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 30074130)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-565c-06e2-ee24-322828d50359	00010000-565c-06e0-ba52-304e19627ba4	\N	Prva mapa	Root mapa	2015-11-30 09:20:50	2015-11-30 09:20:50	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 30074143)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 30074165)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25231831)
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
-- TOC entry 3140 (class 0 OID 30073610)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 30073362)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-565c-06e0-8b97-694207187fa4	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-565c-06e0-4237-399b87f3169a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-565c-06e0-63c9-d4da060b3bb9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-565c-06e0-e3d4-abacb22e3557	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-565c-06e0-06d7-7be47b3b8d67	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-565c-06e0-f6a3-691075525c13	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-565c-06e0-c4d6-1973bfdf9284	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-565c-06e0-5d74-d846af36eb1c	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565c-06e0-ff04-4f43ebe5f0e5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-565c-06e0-ff90-216a8516dd85	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-565c-06e0-2675-58e3779f88a1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-565c-06e0-053b-6b5bc4713ff9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-565c-06e0-ad9a-911afa5747e6	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-565c-06e0-0e36-c3b9edacdd2b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-565c-06e2-028a-48aadbaa918b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-565c-06e2-be75-9c44eb2a4a84	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-565c-06e2-9e51-68262b0e1b91	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-565c-06e2-9104-f8282878f2a3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-565c-06e2-1884-a20e50389354	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-565c-06e4-913d-a119da22d664	application.tenant.maticnopodjetje	string	s:36:"00080000-565c-06e4-b05a-65c2da0ef833";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 30073262)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-565c-06e2-3b60-48d0201efa9f	00000000-565c-06e2-028a-48aadbaa918b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-565c-06e2-b91a-c3d0adf2380b	00000000-565c-06e2-028a-48aadbaa918b	00010000-565c-06e0-ba52-304e19627ba4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-565c-06e2-f76b-b421dfdb77fc	00000000-565c-06e2-be75-9c44eb2a4a84	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 30073329)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-565c-06e2-450c-de3dd378adb3	\N	00100000-565c-06e2-7d07-5c0d496fa29a	00100000-565c-06e2-06a9-7bafeeb6bb0b	01	Gledališče Nimbis
00410000-565c-06e2-e704-a11f0e211c13	00410000-565c-06e2-450c-de3dd378adb3	00100000-565c-06e2-7d07-5c0d496fa29a	00100000-565c-06e2-06a9-7bafeeb6bb0b	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 30073273)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-565c-06e2-8146-9be834a36bda	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-565c-06e2-ca35-e7aedb1e8eed	00010000-565c-06e2-ee88-3ad68bce8557	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-565c-06e2-5d10-ca5cc9e38272	00010000-565c-06e2-23fa-9b5e4677f125	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-565c-06e2-91a9-86cb3a86115b	00010000-565c-06e2-d733-f0a9c7fe55d5	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-565c-06e2-2928-6eccc46a8e02	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-565c-06e2-37b8-04c9dda78ed4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-565c-06e2-b40b-bf67e9b7bb7b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-565c-06e2-5aa2-fa2e309b134c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-565c-06e2-8e96-2aeaf477180e	00010000-565c-06e2-8447-cd97ee28f22a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-565c-06e2-3e6b-b61470ac7a2d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-565c-06e2-7b34-0e548b8e035b	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565c-06e2-5857-5f55a1c747ce	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-565c-06e2-3d4e-0c99df22d2dd	00010000-565c-06e2-587e-38edc6dab2e9	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-565c-06e2-5a75-5717fef75243	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-06e2-481a-97ef7cb06dac	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-06e2-d82a-e9ff08d812db	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-06e2-90e6-ade56a2778a7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565c-06e2-5a78-e96497b1010b	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-565c-06e2-6a17-0bfef4b70a22	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-06e2-3d17-00361e691af9	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-565c-06e2-254a-b2c4daa538a2	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 30073208)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-565c-06e0-59a1-f0683eb8f883	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-565c-06e0-67e1-a89513989078	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-565c-06e0-c70f-34b6e18c5030	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-565c-06e0-624f-521d13f3aee5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-565c-06e0-27e4-a1da18e70cbb	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-565c-06e0-650b-553498fecef4	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-565c-06e0-7e43-cc482cb133f5	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-565c-06e0-6b0f-c118499023ad	Abonma-read	Abonma - branje	t
00030000-565c-06e0-dfe3-f10b8ed56a9c	Abonma-write	Abonma - spreminjanje	t
00030000-565c-06e0-308d-7223a0610115	Alternacija-read	Alternacija - branje	t
00030000-565c-06e0-b45a-551c1265b132	Alternacija-write	Alternacija - spreminjanje	t
00030000-565c-06e0-921b-e88dc9e79efe	Arhivalija-read	Arhivalija - branje	t
00030000-565c-06e0-7684-d0a1f1ba45f1	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-565c-06e0-1362-dc379926ff34	AuthStorage-read	AuthStorage - branje	t
00030000-565c-06e0-6650-f49861826a8f	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-565c-06e0-9987-00f4aee76498	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-565c-06e0-aa9a-9c880784b961	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-565c-06e0-e1f2-22945ff20284	Besedilo-read	Besedilo - branje	t
00030000-565c-06e0-74ea-44fb6a14e877	Besedilo-write	Besedilo - spreminjanje	t
00030000-565c-06e0-e07a-16b1a4551c71	Dogodek-read	Dogodek - branje	t
00030000-565c-06e0-92d3-2fbb0b7d4690	Dogodek-write	Dogodek - spreminjanje	t
00030000-565c-06e0-b332-43f82a782931	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-565c-06e0-ef53-3ca5d2e01e6c	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-565c-06e0-13a5-b8589ba38bc4	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-565c-06e0-73e9-35c436b30ce7	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-565c-06e0-df06-6a98bd2e90e8	DogodekTrait-read	DogodekTrait - branje	t
00030000-565c-06e0-0a84-ffe237c1c2b5	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-565c-06e0-8613-a75797026e72	DrugiVir-read	DrugiVir - branje	t
00030000-565c-06e0-9769-8497af43f831	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-565c-06e0-0e0b-8ee03783c33d	Drzava-read	Drzava - branje	t
00030000-565c-06e0-06b0-25c7b9fe3db2	Drzava-write	Drzava - spreminjanje	t
00030000-565c-06e0-6b59-7d5060b73534	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-565c-06e0-6c83-1718f6c143fb	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-565c-06e0-f5bc-4715e62498df	Funkcija-read	Funkcija - branje	t
00030000-565c-06e0-a698-b7039e713852	Funkcija-write	Funkcija - spreminjanje	t
00030000-565c-06e0-8a40-2609184fc21f	Gostovanje-read	Gostovanje - branje	t
00030000-565c-06e0-1c03-59319f8653be	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-565c-06e0-b862-0163ee621dee	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-565c-06e0-0173-be7cbdca8b9b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-565c-06e0-8f52-67b48539c5d0	Kupec-read	Kupec - branje	t
00030000-565c-06e0-20b6-420be00a4b57	Kupec-write	Kupec - spreminjanje	t
00030000-565c-06e0-d1c7-57afb4736772	NacinPlacina-read	NacinPlacina - branje	t
00030000-565c-06e0-d6f4-d505899a7a09	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-565c-06e0-2b2d-e12351ef45b9	Option-read	Option - branje	t
00030000-565c-06e0-2086-a947808056fc	Option-write	Option - spreminjanje	t
00030000-565c-06e0-eabe-61ca3b94ddee	OptionValue-read	OptionValue - branje	t
00030000-565c-06e0-23d1-345fbab5ea51	OptionValue-write	OptionValue - spreminjanje	t
00030000-565c-06e0-f144-c6be8c2ea780	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-565c-06e0-dcb5-ba0040af1a2d	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-565c-06e0-75bc-1de60d0d3c78	Oseba-read	Oseba - branje	t
00030000-565c-06e0-ff27-ccc8b7512d63	Oseba-write	Oseba - spreminjanje	t
00030000-565c-06e0-a8b5-d6f7d8ea67bd	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-565c-06e0-541e-b17b0c9f42b7	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-565c-06e0-7dfe-c73e5391e5ad	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-565c-06e0-bfa0-0df5de39b428	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-565c-06e0-380d-51abe6478782	Pogodba-read	Pogodba - branje	t
00030000-565c-06e0-d6ee-251b3fd64f3f	Pogodba-write	Pogodba - spreminjanje	t
00030000-565c-06e0-d4a2-804fa9e2afd8	Popa-read	Popa - branje	t
00030000-565c-06e0-11cd-e55adfc2a3e9	Popa-write	Popa - spreminjanje	t
00030000-565c-06e0-89d8-36b78ace4cc0	Posta-read	Posta - branje	t
00030000-565c-06e0-9003-d5892b6d8000	Posta-write	Posta - spreminjanje	t
00030000-565c-06e0-6926-cd3bb37b9203	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-565c-06e0-388c-93365562f9c0	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-565c-06e0-1453-9ff623377e11	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-565c-06e0-a5a7-048e748be29f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-565c-06e0-d721-138e88c73304	PostniNaslov-read	PostniNaslov - branje	t
00030000-565c-06e0-df23-a086d23dd4b1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-565c-06e0-f5e0-c66e5a122303	Praznik-read	Praznik - branje	t
00030000-565c-06e0-7dab-e1ed536a05ff	Praznik-write	Praznik - spreminjanje	t
00030000-565c-06e0-8bac-36e12d0716b2	Predstava-read	Predstava - branje	t
00030000-565c-06e0-ac25-e0ba93c1695c	Predstava-write	Predstava - spreminjanje	t
00030000-565c-06e0-435d-b869a316d006	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-565c-06e0-97c9-a2db4f3ebd93	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-565c-06e0-01cf-e09b3a34572c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-565c-06e0-154c-265ebe729bf0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-565c-06e0-7c14-c4c89d8d3554	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-565c-06e0-0676-e6c02defbc61	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-565c-06e0-4948-0b0b18c70a37	ProgramDela-read	ProgramDela - branje	t
00030000-565c-06e0-5f05-dcc4e51e12f7	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-565c-06e0-9953-52ced4610fcb	ProgramFestival-read	ProgramFestival - branje	t
00030000-565c-06e0-7c15-2a57f793ce29	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-565c-06e0-e56b-d5d472c27962	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-565c-06e0-1732-24751136863c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-565c-06e0-1ac5-d82e3066a553	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-565c-06e0-3225-8a0837297a8d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-565c-06e0-04fe-b3ef57d4f77c	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-565c-06e0-c70a-5ee3f33c6d77	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-565c-06e0-ac4e-74238c1b6b5b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-565c-06e0-717a-5d7fb8723d15	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-565c-06e0-b831-2df105210dd2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-565c-06e0-85f6-fea474ebdc6c	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-565c-06e0-470c-d3636b9fa43c	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-565c-06e0-9102-5644718dc73d	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-565c-06e0-de9a-d65697f073f9	ProgramRazno-read	ProgramRazno - branje	t
00030000-565c-06e0-3a35-0cb4258e625a	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-565c-06e0-fb0d-d254f6b4daf6	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-565c-06e0-368e-00bd16587e23	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-565c-06e0-5bba-c9c1fdeb29d5	Prostor-read	Prostor - branje	t
00030000-565c-06e0-85b0-0a54cadced6f	Prostor-write	Prostor - spreminjanje	t
00030000-565c-06e0-f460-927d1c199412	Racun-read	Racun - branje	t
00030000-565c-06e0-ae8c-101ebd998695	Racun-write	Racun - spreminjanje	t
00030000-565c-06e0-f97e-53a3a65cb9a9	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-565c-06e0-5570-496f122294d6	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-565c-06e0-d771-6325361b0a0b	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-565c-06e0-8ffb-9eb0529021c2	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-565c-06e0-757f-6b6d4eabc41a	Rekvizit-read	Rekvizit - branje	t
00030000-565c-06e0-12ac-75f242daf1c5	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-565c-06e0-5281-5811eccd7927	Revizija-read	Revizija - branje	t
00030000-565c-06e0-f11d-1282005f0dbe	Revizija-write	Revizija - spreminjanje	t
00030000-565c-06e0-f636-4a9e63c3eedf	Rezervacija-read	Rezervacija - branje	t
00030000-565c-06e0-4aa2-f082e1e909e5	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-565c-06e0-77e9-bccc1c1f3a79	SedezniRed-read	SedezniRed - branje	t
00030000-565c-06e0-6003-a93afa38acff	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-565c-06e0-46b5-7a631d879037	Sedez-read	Sedez - branje	t
00030000-565c-06e0-c9bf-257983e2702d	Sedez-write	Sedez - spreminjanje	t
00030000-565c-06e0-ade8-5af96cac26ae	Sezona-read	Sezona - branje	t
00030000-565c-06e0-0ba7-503f364741d5	Sezona-write	Sezona - spreminjanje	t
00030000-565c-06e0-417f-3364bc40374e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-565c-06e0-af80-be78d637ddfe	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-565c-06e0-cd73-ac2e485fa126	Stevilcenje-read	Stevilcenje - branje	t
00030000-565c-06e0-abc2-22586768b298	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-565c-06e0-c8a0-0e137011a932	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-565c-06e0-1b5a-7b1a045077d6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-565c-06e0-252b-a019f1ec6d41	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-565c-06e0-9765-dfd800c271b9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-565c-06e0-e834-57d7c00f33a2	Telefonska-read	Telefonska - branje	t
00030000-565c-06e0-f364-56afb4fd3634	Telefonska-write	Telefonska - spreminjanje	t
00030000-565c-06e0-89cf-5551929fd455	TerminStoritve-read	TerminStoritve - branje	t
00030000-565c-06e0-b9cf-bc07953d8c59	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-565c-06e0-a4f9-fb5c5fe82972	TipFunkcije-read	TipFunkcije - branje	t
00030000-565c-06e0-52a6-699e07bf169a	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-565c-06e0-dcc6-4d6613c1424d	TipPopa-read	TipPopa - branje	t
00030000-565c-06e0-ed16-7d52b25b8886	TipPopa-write	TipPopa - spreminjanje	t
00030000-565c-06e0-a973-62a995569c43	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-565c-06e0-d2f3-5c47cc577d5d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-565c-06e0-f46e-6feff4a6dcfe	TipVaje-read	TipVaje - branje	t
00030000-565c-06e0-5859-0445ac3eef8b	TipVaje-write	TipVaje - spreminjanje	t
00030000-565c-06e0-e269-ccf97c053187	Trr-read	Trr - branje	t
00030000-565c-06e0-3f91-c6746f9df85a	Trr-write	Trr - spreminjanje	t
00030000-565c-06e0-8140-ff07baf8b6c2	Uprizoritev-read	Uprizoritev - branje	t
00030000-565c-06e0-2187-baf3caccdd68	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-565c-06e0-e1d9-d379a92cb766	Vaja-read	Vaja - branje	t
00030000-565c-06e0-6a74-a9a485a4cde6	Vaja-write	Vaja - spreminjanje	t
00030000-565c-06e0-83c4-0193ad0c5cbf	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-565c-06e0-dcb6-df7b3b638cb1	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-565c-06e0-6bc8-2e56bc2ab892	VrstaStroska-read	VrstaStroska - branje	t
00030000-565c-06e0-53aa-7631a4f48258	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-565c-06e0-7efd-389572ec773a	Zaposlitev-read	Zaposlitev - branje	t
00030000-565c-06e0-15b1-3add9ecf8002	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-565c-06e0-8e1a-8c9265d04e87	Zasedenost-read	Zasedenost - branje	t
00030000-565c-06e0-775f-bd0e68c3950d	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-565c-06e0-9c89-9623c32cd77e	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-565c-06e0-59c8-f56027160ae1	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-565c-06e0-d82b-b16ebf6b02c8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-565c-06e0-0910-5b7fc76e24b2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-565c-06e0-e04c-b4b872b11eb4	Job-read	Branje opravil - samo zase - branje	t
00030000-565c-06e0-f30f-b23ce71406de	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-565c-06e0-fb1b-ae875f3ab1be	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-565c-06e0-17e2-6dd32d431e2d	Report-read	Report - branje	t
00030000-565c-06e0-9ace-90e3ef53c437	Report-write	Report - spreminjanje	t
00030000-565c-06e0-e724-68463fca2491	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-565c-06e0-af1c-b3215f6a5c00	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-565c-06e0-b4d8-e81575d73e59	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-565c-06e0-0c92-3e08388cb378	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-565c-06e0-ee95-5db4c1c042ed	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-565c-06e0-87fa-3c401c3c1667	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-565c-06e0-2388-3df3d657e531	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-565c-06e0-8fa2-315bcedc534f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-565c-06e0-338f-b2e8cbb18cf0	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565c-06e0-977a-a0c6cd24b85c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-565c-06e0-9d2f-8397ae4a12de	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-565c-06e0-ddbf-b09d6143b7f2	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-565c-06e0-c5a6-37dce705f880	Datoteka-write	Datoteka - spreminjanje	t
00030000-565c-06e0-23b9-a37371d2b3fa	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 30073227)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-565c-06e0-495f-a9e7cccf18de	00030000-565c-06e0-67e1-a89513989078
00020000-565c-06e0-495f-a9e7cccf18de	00030000-565c-06e0-59a1-f0683eb8f883
00020000-565c-06e0-e9bb-e84d4fb89c72	00030000-565c-06e0-0e0b-8ee03783c33d
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-aa9a-9c880784b961
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-74ea-44fb6a14e877
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-c5a6-37dce705f880
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-2388-3df3d657e531
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-338f-b2e8cbb18cf0
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-9987-00f4aee76498
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-e1f2-22945ff20284
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-8c52-3dc6a8f14fc0	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-5dcc-0fad79c7ebe9	00030000-565c-06e0-9987-00f4aee76498
00020000-565c-06e0-5dcc-0fad79c7ebe9	00030000-565c-06e0-e1f2-22945ff20284
00020000-565c-06e0-5dcc-0fad79c7ebe9	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-5dcc-0fad79c7ebe9	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-5dcc-0fad79c7ebe9	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-ae9f-43b0e817a7e1	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e0-ae9f-43b0e817a7e1	00030000-565c-06e0-7efd-389572ec773a
00020000-565c-06e0-ae9f-43b0e817a7e1	00030000-565c-06e0-15b1-3add9ecf8002
00020000-565c-06e0-ae9f-43b0e817a7e1	00030000-565c-06e0-f144-c6be8c2ea780
00020000-565c-06e0-e273-eeeb88c14e6b	00030000-565c-06e0-7efd-389572ec773a
00020000-565c-06e0-e273-eeeb88c14e6b	00030000-565c-06e0-f144-c6be8c2ea780
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-e834-57d7c00f33a2
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-d721-138e88c73304
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-e269-ccf97c053187
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-b862-0163ee621dee
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-7c14-c4c89d8d3554
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-f364-56afb4fd3634
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-df23-a086d23dd4b1
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-2388-3df3d657e531
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-3f91-c6746f9df85a
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-11cd-e55adfc2a3e9
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-c5a6-37dce705f880
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-338f-b2e8cbb18cf0
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-0173-be7cbdca8b9b
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-0676-e6c02defbc61
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-0e0b-8ee03783c33d
00020000-565c-06e0-2f73-5ea2be60f422	00030000-565c-06e0-dcc6-4d6613c1424d
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-e834-57d7c00f33a2
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-d721-138e88c73304
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-e269-ccf97c053187
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-b862-0163ee621dee
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-7c14-c4c89d8d3554
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-0e0b-8ee03783c33d
00020000-565c-06e0-9dcd-d2cd069e30e1	00030000-565c-06e0-dcc6-4d6613c1424d
00020000-565c-06e0-4561-fc4221f88a87	00030000-565c-06e0-dcc6-4d6613c1424d
00020000-565c-06e0-4561-fc4221f88a87	00030000-565c-06e0-ed16-7d52b25b8886
00020000-565c-06e0-e468-b7e45869b944	00030000-565c-06e0-dcc6-4d6613c1424d
00020000-565c-06e0-7e19-2d91812211d8	00030000-565c-06e0-89d8-36b78ace4cc0
00020000-565c-06e0-7e19-2d91812211d8	00030000-565c-06e0-9003-d5892b6d8000
00020000-565c-06e0-bd6c-561949799cab	00030000-565c-06e0-89d8-36b78ace4cc0
00020000-565c-06e0-e001-72b88d2c0a8a	00030000-565c-06e0-0e0b-8ee03783c33d
00020000-565c-06e0-e001-72b88d2c0a8a	00030000-565c-06e0-06b0-25c7b9fe3db2
00020000-565c-06e0-7dd4-973e01e8c82a	00030000-565c-06e0-0e0b-8ee03783c33d
00020000-565c-06e0-3aa9-9d23304e0795	00030000-565c-06e0-d82b-b16ebf6b02c8
00020000-565c-06e0-3aa9-9d23304e0795	00030000-565c-06e0-0910-5b7fc76e24b2
00020000-565c-06e0-6faa-366c61411b5c	00030000-565c-06e0-d82b-b16ebf6b02c8
00020000-565c-06e0-cebd-b76daf0c5082	00030000-565c-06e0-9c89-9623c32cd77e
00020000-565c-06e0-cebd-b76daf0c5082	00030000-565c-06e0-59c8-f56027160ae1
00020000-565c-06e0-fd32-b985c4fb0657	00030000-565c-06e0-9c89-9623c32cd77e
00020000-565c-06e0-5d51-6592a7806552	00030000-565c-06e0-6b0f-c118499023ad
00020000-565c-06e0-5d51-6592a7806552	00030000-565c-06e0-dfe3-f10b8ed56a9c
00020000-565c-06e0-f4cf-2c869042955f	00030000-565c-06e0-6b0f-c118499023ad
00020000-565c-06e0-b075-72347f009415	00030000-565c-06e0-5bba-c9c1fdeb29d5
00020000-565c-06e0-b075-72347f009415	00030000-565c-06e0-85b0-0a54cadced6f
00020000-565c-06e0-b075-72347f009415	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e0-b075-72347f009415	00030000-565c-06e0-d721-138e88c73304
00020000-565c-06e0-b075-72347f009415	00030000-565c-06e0-df23-a086d23dd4b1
00020000-565c-06e0-b075-72347f009415	00030000-565c-06e0-0e0b-8ee03783c33d
00020000-565c-06e0-1bfd-e7b3208ef46f	00030000-565c-06e0-5bba-c9c1fdeb29d5
00020000-565c-06e0-1bfd-e7b3208ef46f	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e0-1bfd-e7b3208ef46f	00030000-565c-06e0-d721-138e88c73304
00020000-565c-06e0-08ac-196aec6d775b	00030000-565c-06e0-6bc8-2e56bc2ab892
00020000-565c-06e0-08ac-196aec6d775b	00030000-565c-06e0-53aa-7631a4f48258
00020000-565c-06e0-179f-d9b67f940794	00030000-565c-06e0-6bc8-2e56bc2ab892
00020000-565c-06e0-3f0b-ad75409c740e	00030000-565c-06e0-dcb5-ba0040af1a2d
00020000-565c-06e0-3f0b-ad75409c740e	00030000-565c-06e0-f144-c6be8c2ea780
00020000-565c-06e0-3f0b-ad75409c740e	00030000-565c-06e0-7efd-389572ec773a
00020000-565c-06e0-3f0b-ad75409c740e	00030000-565c-06e0-c5a6-37dce705f880
00020000-565c-06e0-3f0b-ad75409c740e	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-3f0b-ad75409c740e	00030000-565c-06e0-2388-3df3d657e531
00020000-565c-06e0-3f0b-ad75409c740e	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-3f0b-ad75409c740e	00030000-565c-06e0-338f-b2e8cbb18cf0
00020000-565c-06e0-3f0b-ad75409c740e	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-d30d-2799ce7a0e3d	00030000-565c-06e0-f144-c6be8c2ea780
00020000-565c-06e0-d30d-2799ce7a0e3d	00030000-565c-06e0-7efd-389572ec773a
00020000-565c-06e0-d30d-2799ce7a0e3d	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-d30d-2799ce7a0e3d	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-d30d-2799ce7a0e3d	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-2d94-1b09daf9b082	00030000-565c-06e0-f46e-6feff4a6dcfe
00020000-565c-06e0-2d94-1b09daf9b082	00030000-565c-06e0-5859-0445ac3eef8b
00020000-565c-06e0-7638-e01e554d3b2b	00030000-565c-06e0-f46e-6feff4a6dcfe
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-650b-553498fecef4
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-7e43-cc482cb133f5
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-4948-0b0b18c70a37
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-5f05-dcc4e51e12f7
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-9953-52ced4610fcb
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-7c15-2a57f793ce29
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-e56b-d5d472c27962
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-1732-24751136863c
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-1ac5-d82e3066a553
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-3225-8a0837297a8d
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-04fe-b3ef57d4f77c
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-c70a-5ee3f33c6d77
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-ac4e-74238c1b6b5b
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-717a-5d7fb8723d15
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-b831-2df105210dd2
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-85f6-fea474ebdc6c
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-470c-d3636b9fa43c
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-9102-5644718dc73d
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-de9a-d65697f073f9
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-3a35-0cb4258e625a
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-fb0d-d254f6b4daf6
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-368e-00bd16587e23
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-154c-265ebe729bf0
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-9769-8497af43f831
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-388c-93365562f9c0
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-8613-a75797026e72
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-01cf-e09b3a34572c
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-7c14-c4c89d8d3554
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-6926-cd3bb37b9203
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-6bc8-2e56bc2ab892
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-252b-a019f1ec6d41
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-f5bc-4715e62498df
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-308d-7223a0610115
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-a4f9-fb5c5fe82972
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-380d-51abe6478782
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-0e0b-8ee03783c33d
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-c5a6-37dce705f880
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-2388-3df3d657e531
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-338f-b2e8cbb18cf0
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-fcd1-cf5487ff6a8f	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-4948-0b0b18c70a37
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-9953-52ced4610fcb
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-e56b-d5d472c27962
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-1ac5-d82e3066a553
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-04fe-b3ef57d4f77c
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-ac4e-74238c1b6b5b
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-b831-2df105210dd2
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-470c-d3636b9fa43c
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-de9a-d65697f073f9
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-fb0d-d254f6b4daf6
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-01cf-e09b3a34572c
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-8613-a75797026e72
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-6926-cd3bb37b9203
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-0e0b-8ee03783c33d
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-17e2-6dd32d431e2d
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-c93e-e4ffd74976ea	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-2187-baf3caccdd68
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-308d-7223a0610115
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-b45a-551c1265b132
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-e1f2-22945ff20284
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-f5bc-4715e62498df
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-a698-b7039e713852
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-7c14-c4c89d8d3554
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-a4f9-fb5c5fe82972
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-c5a6-37dce705f880
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-2388-3df3d657e531
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-8e1b-7dbdc10df833	00030000-565c-06e0-338f-b2e8cbb18cf0
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-308d-7223a0610115
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-e1f2-22945ff20284
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-f5bc-4715e62498df
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-7c14-c4c89d8d3554
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-a4f9-fb5c5fe82972
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-2388-3df3d657e531
00020000-565c-06e0-0047-457e55f88c2d	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-308d-7223a0610115
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-b45a-551c1265b132
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-f5bc-4715e62498df
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-380d-51abe6478782
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-d6ee-251b3fd64f3f
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-7c14-c4c89d8d3554
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-252b-a019f1ec6d41
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-9765-dfd800c271b9
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-a4f9-fb5c5fe82972
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-e269-ccf97c053187
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e0-2c99-7ce62b16191a	00030000-565c-06e0-7efd-389572ec773a
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-308d-7223a0610115
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-f5bc-4715e62498df
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-380d-51abe6478782
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-7c14-c4c89d8d3554
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-252b-a019f1ec6d41
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-a4f9-fb5c5fe82972
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-e269-ccf97c053187
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e0-5fca-13ee770ffb20	00030000-565c-06e0-7efd-389572ec773a
00020000-565c-06e0-1900-79ed43aa9f10	00030000-565c-06e0-252b-a019f1ec6d41
00020000-565c-06e0-1900-79ed43aa9f10	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e0-1900-79ed43aa9f10	00030000-565c-06e0-f5bc-4715e62498df
00020000-565c-06e0-1900-79ed43aa9f10	00030000-565c-06e0-380d-51abe6478782
00020000-565c-06e0-1900-79ed43aa9f10	00030000-565c-06e0-7c14-c4c89d8d3554
00020000-565c-06e0-1900-79ed43aa9f10	00030000-565c-06e0-a4f9-fb5c5fe82972
00020000-565c-06e0-1900-79ed43aa9f10	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e0-b6ad-8d9c9cb827fd	00030000-565c-06e0-252b-a019f1ec6d41
00020000-565c-06e0-b6ad-8d9c9cb827fd	00030000-565c-06e0-9765-dfd800c271b9
00020000-565c-06e0-b6ad-8d9c9cb827fd	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e0-b6ad-8d9c9cb827fd	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e0-642a-f1c4be8b2bfd	00030000-565c-06e0-252b-a019f1ec6d41
00020000-565c-06e0-642a-f1c4be8b2bfd	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-59a1-f0683eb8f883
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-67e1-a89513989078
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-6b0f-c118499023ad
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-dfe3-f10b8ed56a9c
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-308d-7223a0610115
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-b45a-551c1265b132
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-921b-e88dc9e79efe
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-7684-d0a1f1ba45f1
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-1362-dc379926ff34
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-6650-f49861826a8f
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-9987-00f4aee76498
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-aa9a-9c880784b961
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-e1f2-22945ff20284
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-74ea-44fb6a14e877
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-c5a6-37dce705f880
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-e07a-16b1a4551c71
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-624f-521d13f3aee5
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-92d3-2fbb0b7d4690
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-b332-43f82a782931
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-ef53-3ca5d2e01e6c
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-13a5-b8589ba38bc4
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-73e9-35c436b30ce7
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-8613-a75797026e72
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-9769-8497af43f831
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-0e0b-8ee03783c33d
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-06b0-25c7b9fe3db2
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-6b59-7d5060b73534
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-6c83-1718f6c143fb
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f5bc-4715e62498df
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-a698-b7039e713852
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-8a40-2609184fc21f
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-1c03-59319f8653be
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-fb1b-ae875f3ab1be
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-e04c-b4b872b11eb4
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f30f-b23ce71406de
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-b862-0163ee621dee
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-0173-be7cbdca8b9b
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-8f52-67b48539c5d0
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-20b6-420be00a4b57
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-e724-68463fca2491
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-af1c-b3215f6a5c00
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-b4d8-e81575d73e59
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-0c92-3e08388cb378
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-87fa-3c401c3c1667
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-ee95-5db4c1c042ed
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-d1c7-57afb4736772
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-d6f4-d505899a7a09
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-2b2d-e12351ef45b9
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-2086-a947808056fc
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-eabe-61ca3b94ddee
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-23d1-345fbab5ea51
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f144-c6be8c2ea780
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-dcb5-ba0040af1a2d
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-27e4-a1da18e70cbb
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-ff27-ccc8b7512d63
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-a8b5-d6f7d8ea67bd
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-541e-b17b0c9f42b7
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-7dfe-c73e5391e5ad
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-bfa0-0df5de39b428
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-380d-51abe6478782
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-d6ee-251b3fd64f3f
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-11cd-e55adfc2a3e9
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-89d8-36b78ace4cc0
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-9003-d5892b6d8000
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-6926-cd3bb37b9203
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-388c-93365562f9c0
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-1453-9ff623377e11
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-a5a7-048e748be29f
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-d721-138e88c73304
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-df23-a086d23dd4b1
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f5e0-c66e5a122303
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-7dab-e1ed536a05ff
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-8bac-36e12d0716b2
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-ac25-e0ba93c1695c
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-435d-b869a316d006
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-97c9-a2db4f3ebd93
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-01cf-e09b3a34572c
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-154c-265ebe729bf0
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-7c14-c4c89d8d3554
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-0676-e6c02defbc61
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-650b-553498fecef4
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-4948-0b0b18c70a37
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-7e43-cc482cb133f5
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-5f05-dcc4e51e12f7
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-9953-52ced4610fcb
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-7c15-2a57f793ce29
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-e56b-d5d472c27962
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-1732-24751136863c
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-1ac5-d82e3066a553
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-3225-8a0837297a8d
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-04fe-b3ef57d4f77c
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-c70a-5ee3f33c6d77
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-ac4e-74238c1b6b5b
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-717a-5d7fb8723d15
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-b831-2df105210dd2
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-85f6-fea474ebdc6c
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-470c-d3636b9fa43c
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-9102-5644718dc73d
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-de9a-d65697f073f9
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-3a35-0cb4258e625a
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-fb0d-d254f6b4daf6
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-368e-00bd16587e23
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-5bba-c9c1fdeb29d5
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-85b0-0a54cadced6f
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f460-927d1c199412
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-ae8c-101ebd998695
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f97e-53a3a65cb9a9
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-5570-496f122294d6
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-757f-6b6d4eabc41a
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-12ac-75f242daf1c5
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-d771-6325361b0a0b
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-8ffb-9eb0529021c2
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-17e2-6dd32d431e2d
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-9ace-90e3ef53c437
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-5281-5811eccd7927
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f11d-1282005f0dbe
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f636-4a9e63c3eedf
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-4aa2-f082e1e909e5
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-46b5-7a631d879037
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-c9bf-257983e2702d
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-77e9-bccc1c1f3a79
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-6003-a93afa38acff
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-ade8-5af96cac26ae
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-0ba7-503f364741d5
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-cd73-ac2e485fa126
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-abc2-22586768b298
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-417f-3364bc40374e
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-af80-be78d637ddfe
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-c8a0-0e137011a932
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-1b5a-7b1a045077d6
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-252b-a019f1ec6d41
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-9765-dfd800c271b9
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-e834-57d7c00f33a2
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f364-56afb4fd3634
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-89cf-5551929fd455
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-c70f-34b6e18c5030
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-b9cf-bc07953d8c59
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-a4f9-fb5c5fe82972
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-52a6-699e07bf169a
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-dcc6-4d6613c1424d
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-ed16-7d52b25b8886
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-a973-62a995569c43
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-d2f3-5c47cc577d5d
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-f46e-6feff4a6dcfe
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-5859-0445ac3eef8b
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-e269-ccf97c053187
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-3f91-c6746f9df85a
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-2187-baf3caccdd68
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-e1d9-d379a92cb766
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-6a74-a9a485a4cde6
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-83c4-0193ad0c5cbf
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-dcb6-df7b3b638cb1
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-6bc8-2e56bc2ab892
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-53aa-7631a4f48258
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-ddbf-b09d6143b7f2
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-9d2f-8397ae4a12de
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-2388-3df3d657e531
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-338f-b2e8cbb18cf0
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-7efd-389572ec773a
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-15b1-3add9ecf8002
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-8e1a-8c9265d04e87
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-775f-bd0e68c3950d
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-9c89-9623c32cd77e
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-59c8-f56027160ae1
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-d82b-b16ebf6b02c8
00020000-565c-06e2-b564-52b5c393dded	00030000-565c-06e0-0910-5b7fc76e24b2
00020000-565c-06e2-a775-2c514f8ec76b	00030000-565c-06e0-977a-a0c6cd24b85c
00020000-565c-06e2-cb38-288f87215ccd	00030000-565c-06e0-338f-b2e8cbb18cf0
00020000-565c-06e2-474f-848f3d971fb7	00030000-565c-06e0-2187-baf3caccdd68
00020000-565c-06e2-edce-c328132e540f	00030000-565c-06e0-8140-ff07baf8b6c2
00020000-565c-06e2-cc99-76f5f8251429	00030000-565c-06e0-af1c-b3215f6a5c00
00020000-565c-06e2-e3d7-643192e17695	00030000-565c-06e0-b4d8-e81575d73e59
00020000-565c-06e2-10b9-ec5bcdea6d65	00030000-565c-06e0-0c92-3e08388cb378
00020000-565c-06e2-d8a0-0b185014704b	00030000-565c-06e0-e724-68463fca2491
00020000-565c-06e2-49fe-56599bdccca0	00030000-565c-06e0-87fa-3c401c3c1667
00020000-565c-06e2-7d14-f852ae36108c	00030000-565c-06e0-ee95-5db4c1c042ed
00020000-565c-06e2-7b43-f991d90fcf12	00030000-565c-06e0-8fa2-315bcedc534f
00020000-565c-06e2-a08f-3e4b6864ef1e	00030000-565c-06e0-2388-3df3d657e531
00020000-565c-06e2-57ba-0775605468fc	00030000-565c-06e0-ff27-ccc8b7512d63
00020000-565c-06e2-7b2f-6588c1c702d7	00030000-565c-06e0-75bc-1de60d0d3c78
00020000-565c-06e2-c844-6745d3c7b960	00030000-565c-06e0-c5a6-37dce705f880
00020000-565c-06e2-bcae-a88ea1361282	00030000-565c-06e0-23b9-a37371d2b3fa
00020000-565c-06e2-56b4-db643554d857	00030000-565c-06e0-d4a2-804fa9e2afd8
00020000-565c-06e2-56b4-db643554d857	00030000-565c-06e0-11cd-e55adfc2a3e9
00020000-565c-06e2-56b4-db643554d857	00030000-565c-06e0-8140-ff07baf8b6c2
\.


--
-- TOC entry 3141 (class 0 OID 30073617)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 30073651)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 30073788)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-565c-06e2-082b-102c1485ce1d	00090000-565c-06e2-8146-9be834a36bda	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-565c-06e2-bab0-37c10c446175	00090000-565c-06e2-37b8-04c9dda78ed4	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-565c-06e2-f0d7-1ba8388f5a90	00090000-565c-06e2-3d4e-0c99df22d2dd	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-565c-06e2-48a8-98e0bd2eabbf	00090000-565c-06e2-3e6b-b61470ac7a2d	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 30073309)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-565c-06e2-f67e-80b5f47d76ba	\N	00040000-565c-06e0-f2b9-bc58b7522ea1	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-06e2-ccfa-bbb813e01fd8	\N	00040000-565c-06e0-f2b9-bc58b7522ea1	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-565c-06e2-5e94-de6b2cfcd87d	\N	00040000-565c-06e0-f2b9-bc58b7522ea1	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-06e2-8dc4-fc28c692df10	\N	00040000-565c-06e0-f2b9-bc58b7522ea1	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-06e2-5864-6b67a7945b26	\N	00040000-565c-06e0-f2b9-bc58b7522ea1	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-06e2-6e43-816456607a2a	\N	00040000-565c-06e0-0877-422740d14568	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-06e2-cc96-059ea17ae431	\N	00040000-565c-06e0-ca18-53c220339d94	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-06e2-065d-f89fb05161b2	\N	00040000-565c-06e0-cc6f-1f248daedb9d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-06e2-ab22-56de99665eaa	\N	00040000-565c-06e0-cf25-67e8bee2412a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-565c-06e4-b05a-65c2da0ef833	\N	00040000-565c-06e0-f2b9-bc58b7522ea1	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 30073354)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-565c-06df-54c4-e3eb751e8d7d	8341	Adlešiči
00050000-565c-06df-bac1-bd6d20e39533	5270	Ajdovščina
00050000-565c-06df-123f-8b4aa63ae9fc	6280	Ankaran/Ancarano
00050000-565c-06df-8af6-5ee4d23bba8a	9253	Apače
00050000-565c-06df-2433-7003e524db71	8253	Artiče
00050000-565c-06df-f20a-534599144afb	4275	Begunje na Gorenjskem
00050000-565c-06df-076a-db4df09d3696	1382	Begunje pri Cerknici
00050000-565c-06df-8bbc-d5ab789eae17	9231	Beltinci
00050000-565c-06df-ef53-8abeaf715b0d	2234	Benedikt
00050000-565c-06df-074a-93d37574c466	2345	Bistrica ob Dravi
00050000-565c-06df-54d4-921154ce52dc	3256	Bistrica ob Sotli
00050000-565c-06df-cafb-d1ab370c78ba	8259	Bizeljsko
00050000-565c-06df-1dbd-52c34fee6eb2	1223	Blagovica
00050000-565c-06df-0131-7470c14bf643	8283	Blanca
00050000-565c-06df-3847-85b8d79552cf	4260	Bled
00050000-565c-06df-32ce-2e07687428dd	4273	Blejska Dobrava
00050000-565c-06df-8c25-f3101fe84885	9265	Bodonci
00050000-565c-06df-1d5a-8903211f40b9	9222	Bogojina
00050000-565c-06df-fbaf-47e829d3f1d0	4263	Bohinjska Bela
00050000-565c-06df-94b6-9770b00c727f	4264	Bohinjska Bistrica
00050000-565c-06df-5c00-6cd3eb8e8671	4265	Bohinjsko jezero
00050000-565c-06df-7b1d-9643326ae553	1353	Borovnica
00050000-565c-06df-bb70-761cbff8892f	8294	Boštanj
00050000-565c-06df-4d2e-0474c4e0caf3	5230	Bovec
00050000-565c-06df-9e4a-cc21c1e1fc9d	5295	Branik
00050000-565c-06df-0ace-38997296d28e	3314	Braslovče
00050000-565c-06df-a869-03705dde051c	5223	Breginj
00050000-565c-06df-7db0-d142d405b810	8280	Brestanica
00050000-565c-06df-c3ec-a5da715a3026	2354	Bresternica
00050000-565c-06df-f530-16352b7cc69a	4243	Brezje
00050000-565c-06df-dc55-87e5ef572a66	1351	Brezovica pri Ljubljani
00050000-565c-06df-d73c-f32f0710088f	8250	Brežice
00050000-565c-06df-1f3b-1490628d8bbd	4210	Brnik - Aerodrom
00050000-565c-06df-c350-020e0da578cc	8321	Brusnice
00050000-565c-06df-bd31-6ad2bc34a70d	3255	Buče
00050000-565c-06df-6304-b44bfc43ef1b	8276	Bučka 
00050000-565c-06df-7af9-ec56ac2e2ec8	9261	Cankova
00050000-565c-06df-c32b-84a4c5a306a0	3000	Celje 
00050000-565c-06df-2578-8179a357587c	3001	Celje - poštni predali
00050000-565c-06df-346b-1af9d6df18fb	4207	Cerklje na Gorenjskem
00050000-565c-06df-ad72-18fe554eb351	8263	Cerklje ob Krki
00050000-565c-06df-81a5-d38aff6dbe22	1380	Cerknica
00050000-565c-06df-8b22-c4dd7f081b7e	5282	Cerkno
00050000-565c-06df-0f0e-d76bf5531485	2236	Cerkvenjak
00050000-565c-06df-82c7-10984069e5b3	2215	Ceršak
00050000-565c-06df-9f63-038a7d213afb	2326	Cirkovce
00050000-565c-06df-efbe-f9677372b9dc	2282	Cirkulane
00050000-565c-06df-9952-e98662680ccd	5273	Col
00050000-565c-06df-14ae-289ea76f0bee	8251	Čatež ob Savi
00050000-565c-06df-4758-9813a6cac334	1413	Čemšenik
00050000-565c-06df-fe9a-38af8a74bc4b	5253	Čepovan
00050000-565c-06df-af06-99a27ef3a30e	9232	Črenšovci
00050000-565c-06df-a13e-d4ea444307e2	2393	Črna na Koroškem
00050000-565c-06df-d7af-3a0bba877942	6275	Črni Kal
00050000-565c-06df-7d83-5b0505ffa2de	5274	Črni Vrh nad Idrijo
00050000-565c-06df-b994-be2d0f6428e2	5262	Črniče
00050000-565c-06df-83a6-7c5460b74078	8340	Črnomelj
00050000-565c-06df-8d8a-370de5739c4e	6271	Dekani
00050000-565c-06df-9674-b937a085977d	5210	Deskle
00050000-565c-06df-b34a-8e134f82760e	2253	Destrnik
00050000-565c-06df-2f87-a6f79408591e	6215	Divača
00050000-565c-06df-c3c1-12c26b6a1734	1233	Dob
00050000-565c-06df-6d2c-161640843292	3224	Dobje pri Planini
00050000-565c-06df-c4ad-bf16a11209dd	8257	Dobova
00050000-565c-06df-3fff-4b50d04d07b9	1423	Dobovec
00050000-565c-06df-abb5-879c9e2b78a7	5263	Dobravlje
00050000-565c-06df-0aee-11b562755761	3204	Dobrna
00050000-565c-06df-6d3f-a8ba594511f5	8211	Dobrnič
00050000-565c-06df-ea54-e39750b1051a	1356	Dobrova
00050000-565c-06df-65d2-83a07d692356	9223	Dobrovnik/Dobronak 
00050000-565c-06df-5f30-7f05976b3869	5212	Dobrovo v Brdih
00050000-565c-06df-ad99-561ce2be51e0	1431	Dol pri Hrastniku
00050000-565c-06df-890b-432d867d2f34	1262	Dol pri Ljubljani
00050000-565c-06df-8185-f93ce0c8fdc7	1273	Dole pri Litiji
00050000-565c-06df-9551-b5b83549f4ca	1331	Dolenja vas
00050000-565c-06df-6fd2-6f66a5615779	8350	Dolenjske Toplice
00050000-565c-06df-a46f-d07a636a81d3	1230	Domžale
00050000-565c-06df-10ec-735d1722a6ae	2252	Dornava
00050000-565c-06df-0feb-f228af8a5a18	5294	Dornberk
00050000-565c-06df-d9fc-5b95b0210a56	1319	Draga
00050000-565c-06df-86e0-8434ff21256e	8343	Dragatuš
00050000-565c-06df-8c82-6202c8e7d4d0	3222	Dramlje
00050000-565c-06df-94e6-2a414fcbcbdd	2370	Dravograd
00050000-565c-06df-5158-b05a8d9bb062	4203	Duplje
00050000-565c-06df-9525-401b1b1ea258	6221	Dutovlje
00050000-565c-06df-3656-adbf3da619fb	8361	Dvor
00050000-565c-06df-e69b-0322d001e7be	2343	Fala
00050000-565c-06df-1b30-076f1eacaebf	9208	Fokovci
00050000-565c-06df-f09e-79024075523f	2313	Fram
00050000-565c-06df-34ab-da81c953f4bc	3213	Frankolovo
00050000-565c-06df-fe6b-3dfe12ac3c51	1274	Gabrovka
00050000-565c-06df-b37c-a182abe9cf7c	8254	Globoko
00050000-565c-06df-e6d2-b46d30087982	5275	Godovič
00050000-565c-06df-e994-b19dcf79d304	4204	Golnik
00050000-565c-06df-1a7a-f819eb09b35d	3303	Gomilsko
00050000-565c-06df-025b-d4f6052b21cf	4224	Gorenja vas
00050000-565c-06df-e300-adb84e99290b	3263	Gorica pri Slivnici
00050000-565c-06df-f140-cd7572c199a3	2272	Gorišnica
00050000-565c-06df-cd17-adb066cbcb07	9250	Gornja Radgona
00050000-565c-06df-50fa-97cb965b8e2c	3342	Gornji Grad
00050000-565c-06df-af28-c0ba750d6e2f	4282	Gozd Martuljek
00050000-565c-06df-8455-084ef16fed49	6272	Gračišče
00050000-565c-06df-dc30-6f9331506e1b	9264	Grad
00050000-565c-06df-bd31-1771bd0691ec	8332	Gradac
00050000-565c-06df-8c72-47406d921ec3	1384	Grahovo
00050000-565c-06df-3913-f085dc78b9dc	5242	Grahovo ob Bači
00050000-565c-06df-e4f6-25a8474e4f90	5251	Grgar
00050000-565c-06df-97cc-95d496db3657	3302	Griže
00050000-565c-06df-6878-c2b11248c902	3231	Grobelno
00050000-565c-06df-929c-38005bd565c3	1290	Grosuplje
00050000-565c-06df-119d-ef4df3df3e2e	2288	Hajdina
00050000-565c-06df-53c4-68cabc006f72	8362	Hinje
00050000-565c-06df-3b1f-cddc120496e6	2311	Hoče
00050000-565c-06df-8f0e-3c3c7e6669b8	9205	Hodoš/Hodos
00050000-565c-06df-726c-1901a2889428	1354	Horjul
00050000-565c-06df-6ee3-1e40890792bf	1372	Hotedršica
00050000-565c-06df-2b7c-5cd2fab04554	1430	Hrastnik
00050000-565c-06df-0b11-53f799cfe6e1	6225	Hruševje
00050000-565c-06df-933a-9b8d3fdadb28	4276	Hrušica
00050000-565c-06df-8755-cd138239b738	5280	Idrija
00050000-565c-06df-448a-5984fc3b7224	1292	Ig
00050000-565c-06df-b884-92289e943cff	6250	Ilirska Bistrica
00050000-565c-06df-8373-4f4efeadef97	6251	Ilirska Bistrica-Trnovo
00050000-565c-06df-357f-283143863f29	1295	Ivančna Gorica
00050000-565c-06df-ad8f-7a503afddaee	2259	Ivanjkovci
00050000-565c-06df-9be4-c343e9ee7f32	1411	Izlake
00050000-565c-06df-2ab5-1cec02b639c0	6310	Izola/Isola
00050000-565c-06df-7915-6a9d44a9798a	2222	Jakobski Dol
00050000-565c-06df-08fe-6b07fe7b7330	2221	Jarenina
00050000-565c-06df-3c38-857d55dbc765	6254	Jelšane
00050000-565c-06df-4677-17fc378c4bb0	4270	Jesenice
00050000-565c-06df-e95b-09d65ba6bc92	8261	Jesenice na Dolenjskem
00050000-565c-06df-42c4-8486bb94854a	3273	Jurklošter
00050000-565c-06df-3e69-77040b0d61fd	2223	Jurovski Dol
00050000-565c-06df-87e4-9c2d2779cae3	2256	Juršinci
00050000-565c-06df-1118-2ac23b0dfef1	5214	Kal nad Kanalom
00050000-565c-06df-5e76-2be5ccae1136	3233	Kalobje
00050000-565c-06df-1aa2-f82ed0c855fe	4246	Kamna Gorica
00050000-565c-06df-e323-fab0c3b91cc3	2351	Kamnica
00050000-565c-06df-0378-0feff2c2fdce	1241	Kamnik
00050000-565c-06df-4338-675a0b0509f7	5213	Kanal
00050000-565c-06df-10f7-d8ba724ea940	8258	Kapele
00050000-565c-06df-8712-bbebe7672003	2362	Kapla
00050000-565c-06df-bc71-34080d28cb2e	2325	Kidričevo
00050000-565c-06df-0197-7c0a3789b690	1412	Kisovec
00050000-565c-06df-dea3-b9b627d53880	6253	Knežak
00050000-565c-06df-8400-639e8c254b3c	5222	Kobarid
00050000-565c-06df-8b7c-b8d23e8eb37e	9227	Kobilje
00050000-565c-06df-5f3d-b9bf1e0be4aa	1330	Kočevje
00050000-565c-06df-3e66-bab63e31c120	1338	Kočevska Reka
00050000-565c-06df-8318-ca74a3be0a34	2276	Kog
00050000-565c-06df-389b-07e0102e549b	5211	Kojsko
00050000-565c-06df-d909-0c24bf9861cf	6223	Komen
00050000-565c-06df-371b-7848dd571c3d	1218	Komenda
00050000-565c-06df-1ee7-c7bcb9bad667	6000	Koper/Capodistria 
00050000-565c-06df-58e3-66e86666aa0b	6001	Koper/Capodistria - poštni predali
00050000-565c-06df-9bf0-3b31cc58312a	8282	Koprivnica
00050000-565c-06df-d19c-0a4bb23aa172	5296	Kostanjevica na Krasu
00050000-565c-06df-3f34-a83e8b96809b	8311	Kostanjevica na Krki
00050000-565c-06df-ddd9-0d847e693253	1336	Kostel
00050000-565c-06df-f4e7-289f7a08ecc2	6256	Košana
00050000-565c-06df-73ee-86e24a6c6a57	2394	Kotlje
00050000-565c-06df-4059-38f95e264dca	6240	Kozina
00050000-565c-06df-fd89-ea8fb5fac296	3260	Kozje
00050000-565c-06df-d6fb-258aa7be2a8f	4000	Kranj 
00050000-565c-06df-6e94-7ef452c49fc9	4001	Kranj - poštni predali
00050000-565c-06df-c8bd-6fe9ab6c4d92	4280	Kranjska Gora
00050000-565c-06df-fd7c-c4c8c0b2c9fb	1281	Kresnice
00050000-565c-06df-5fc0-927e8feff8cc	4294	Križe
00050000-565c-06df-94dd-f12148f8d1d7	9206	Križevci
00050000-565c-06df-f1dc-cf0487482549	9242	Križevci pri Ljutomeru
00050000-565c-06df-2d3a-a4f12b6e73ec	1301	Krka
00050000-565c-06df-db2f-94481d1f083a	8296	Krmelj
00050000-565c-06df-c39a-89d5205c77c1	4245	Kropa
00050000-565c-06df-761d-b02aa213abf6	8262	Krška vas
00050000-565c-06df-d574-ac57bdcf0769	8270	Krško
00050000-565c-06df-b6ea-88caf7911848	9263	Kuzma
00050000-565c-06df-e584-cbaf8fd83170	2318	Laporje
00050000-565c-06df-e19e-c05fa6cc164d	3270	Laško
00050000-565c-06df-e431-e032ac037752	1219	Laze v Tuhinju
00050000-565c-06df-ac3a-e79f9733ee85	2230	Lenart v Slovenskih goricah
00050000-565c-06df-8415-ee90d08b7c53	9220	Lendava/Lendva
00050000-565c-06df-4361-19c212ebfe98	4248	Lesce
00050000-565c-06df-e334-95622b21440a	3261	Lesično
00050000-565c-06df-a83f-8a0f05dcbb89	8273	Leskovec pri Krškem
00050000-565c-06df-7230-5f4d68794c56	2372	Libeliče
00050000-565c-06df-1459-44a96345eae3	2341	Limbuš
00050000-565c-06df-4087-0a781d3c8053	1270	Litija
00050000-565c-06df-77cc-46695fe7633f	3202	Ljubečna
00050000-565c-06df-1d74-337a7e218e00	1000	Ljubljana 
00050000-565c-06df-b742-b4c6d824cd25	1001	Ljubljana - poštni predali
00050000-565c-06df-ca43-557dc03830b5	1231	Ljubljana - Črnuče
00050000-565c-06df-d254-f699473e917f	1261	Ljubljana - Dobrunje
00050000-565c-06df-0be9-4a913e81ae40	1260	Ljubljana - Polje
00050000-565c-06df-6e24-5e90347c78d7	1210	Ljubljana - Šentvid
00050000-565c-06df-9b9a-d50415fbbc74	1211	Ljubljana - Šmartno
00050000-565c-06df-5425-37bfabdaca4d	3333	Ljubno ob Savinji
00050000-565c-06df-1c08-2d0474771500	9240	Ljutomer
00050000-565c-06df-fb4d-a72a6975bb21	3215	Loče
00050000-565c-06df-0b03-945c32bb4a27	5231	Log pod Mangartom
00050000-565c-06df-f2e0-208a63a91681	1358	Log pri Brezovici
00050000-565c-06df-888a-8c8f127c9dd5	1370	Logatec
00050000-565c-06df-7882-452eded00cca	1371	Logatec
00050000-565c-06df-5308-649e63b8e9f7	1434	Loka pri Zidanem Mostu
00050000-565c-06df-7ed9-447095fe397c	3223	Loka pri Žusmu
00050000-565c-06df-44a6-b6ed29ec6943	6219	Lokev
00050000-565c-06df-dfcc-c19a81352bdc	1318	Loški Potok
00050000-565c-06df-bab8-d7443cd6adef	2324	Lovrenc na Dravskem polju
00050000-565c-06df-f597-cb7010cb28e6	2344	Lovrenc na Pohorju
00050000-565c-06df-dfe6-1a52d88a8f60	3334	Luče
00050000-565c-06df-d692-c02811eb5dd3	1225	Lukovica
00050000-565c-06df-3951-10486076bc19	9202	Mačkovci
00050000-565c-06df-5f03-cdaa24377c93	2322	Majšperk
00050000-565c-06df-1b9b-a6ead5d6c335	2321	Makole
00050000-565c-06df-0427-2136ab0e3165	9243	Mala Nedelja
00050000-565c-06df-211c-43d3c114f593	2229	Malečnik
00050000-565c-06df-14cb-cd6bc66d3d5d	6273	Marezige
00050000-565c-06df-0bf8-4b3ae57256a5	2000	Maribor 
00050000-565c-06df-d34c-91f2f323c36a	2001	Maribor - poštni predali
00050000-565c-06df-a195-d2dc19c2a9fa	2206	Marjeta na Dravskem polju
00050000-565c-06df-68a6-be6cea7d0ee4	2281	Markovci
00050000-565c-06df-f599-5333f3ce5a54	9221	Martjanci
00050000-565c-06df-8a73-9fada79af11d	6242	Materija
00050000-565c-06df-241c-5db3559a3cc0	4211	Mavčiče
00050000-565c-06df-c09a-7cecd7709407	1215	Medvode
00050000-565c-06df-7a3a-569778941290	1234	Mengeš
00050000-565c-06df-7fb4-334ae3330526	8330	Metlika
00050000-565c-06df-9be7-bbef2c9365c4	2392	Mežica
00050000-565c-06df-f18f-76211b3337a4	2204	Miklavž na Dravskem polju
00050000-565c-06df-c4bb-a87990655e86	2275	Miklavž pri Ormožu
00050000-565c-06df-1183-124f7c26669a	5291	Miren
00050000-565c-06df-ff61-4b76f9fcad13	8233	Mirna
00050000-565c-06df-42ed-050a7728cf31	8216	Mirna Peč
00050000-565c-06df-ed83-413aa3df9483	2382	Mislinja
00050000-565c-06df-6ab4-09391e139e53	4281	Mojstrana
00050000-565c-06df-f876-19de696d93fa	8230	Mokronog
00050000-565c-06df-d931-4260bab49ba1	1251	Moravče
00050000-565c-06df-396b-b2e80f845e90	9226	Moravske Toplice
00050000-565c-06df-7dda-8a6bfc71b004	5216	Most na Soči
00050000-565c-06df-4bee-39c1212a27c7	1221	Motnik
00050000-565c-06df-40cb-f687375c1416	3330	Mozirje
00050000-565c-06df-216d-976d461d3e46	9000	Murska Sobota 
00050000-565c-06df-b6fb-34c7a6249021	9001	Murska Sobota - poštni predali
00050000-565c-06df-7439-d5bb994eb5bf	2366	Muta
00050000-565c-06df-d4e6-a6dbd030f7f8	4202	Naklo
00050000-565c-06df-37f5-90c834ef860e	3331	Nazarje
00050000-565c-06df-3fef-2b9d95f5756c	1357	Notranje Gorice
00050000-565c-06df-6167-b8f9e2cb66d3	3203	Nova Cerkev
00050000-565c-06df-a9a9-8b88a095acd5	5000	Nova Gorica 
00050000-565c-06df-6407-1badbcf4ceb1	5001	Nova Gorica - poštni predali
00050000-565c-06df-ace0-3409a6e4d82c	1385	Nova vas
00050000-565c-06df-c7db-8fb6abb1f0b8	8000	Novo mesto
00050000-565c-06df-787c-a7180debc096	8001	Novo mesto - poštni predali
00050000-565c-06df-e2ab-1b0167dfb247	6243	Obrov
00050000-565c-06df-b533-fbfefb9307ed	9233	Odranci
00050000-565c-06df-b512-7516fbf08d52	2317	Oplotnica
00050000-565c-06df-3e82-cca0ecc84308	2312	Orehova vas
00050000-565c-06df-17f4-4a0a90734e46	2270	Ormož
00050000-565c-06df-3239-76781d4b5496	1316	Ortnek
00050000-565c-06df-315f-23d6861450b4	1337	Osilnica
00050000-565c-06df-53a5-fbe7c9f17e86	8222	Otočec
00050000-565c-06df-4ef1-d7bdde319f34	2361	Ožbalt
00050000-565c-06df-a43d-eb71049affac	2231	Pernica
00050000-565c-06df-dfaf-24c093a4ad99	2211	Pesnica pri Mariboru
00050000-565c-06df-4519-ca4fa7014505	9203	Petrovci
00050000-565c-06df-727e-4075dbfe1cd1	3301	Petrovče
00050000-565c-06df-8944-73f84378c5bb	6330	Piran/Pirano
00050000-565c-06df-4145-865301d041ff	8255	Pišece
00050000-565c-06df-9ca1-08375324e361	6257	Pivka
00050000-565c-06df-4855-3ac003eef4b9	6232	Planina
00050000-565c-06df-e0fd-edef9ffc7a87	3225	Planina pri Sevnici
00050000-565c-06df-f52c-bf72da3c4e63	6276	Pobegi
00050000-565c-06df-2cf8-a6791445c2d1	8312	Podbočje
00050000-565c-06df-c6bd-e20bd975f602	5243	Podbrdo
00050000-565c-06df-55b9-11bdb693ebdc	3254	Podčetrtek
00050000-565c-06df-ca88-706d1ed04849	2273	Podgorci
00050000-565c-06df-490a-9f66a1ef93c8	6216	Podgorje
00050000-565c-06df-4697-0150cfb08bc5	2381	Podgorje pri Slovenj Gradcu
00050000-565c-06df-f08c-fc450f38cc73	6244	Podgrad
00050000-565c-06df-289e-f39ce21548ab	1414	Podkum
00050000-565c-06df-1e28-60c27a732dda	2286	Podlehnik
00050000-565c-06df-9a2c-a2cec751f1f3	5272	Podnanos
00050000-565c-06df-7552-d34839c8fb57	4244	Podnart
00050000-565c-06df-e61a-dcc835ec9dfe	3241	Podplat
00050000-565c-06df-a751-cd0239d17f3d	3257	Podsreda
00050000-565c-06df-657c-9b2b8f2709bf	2363	Podvelka
00050000-565c-06df-8a65-57644f337eae	2208	Pohorje
00050000-565c-06df-a787-0a2adc14d983	2257	Polenšak
00050000-565c-06df-664f-1ea9c28e4f38	1355	Polhov Gradec
00050000-565c-06df-7c4a-fe2ff0130af9	4223	Poljane nad Škofjo Loko
00050000-565c-06df-2dda-1e3ef7f812be	2319	Poljčane
00050000-565c-06df-4d7b-815185831c8f	1272	Polšnik
00050000-565c-06df-e0ba-07e69d71c343	3313	Polzela
00050000-565c-06df-4744-5e056477a8e0	3232	Ponikva
00050000-565c-06df-17fb-b24059ff7169	6320	Portorož/Portorose
00050000-565c-06df-4883-2c0aa3d816b3	6230	Postojna
00050000-565c-06df-a3ef-739719972353	2331	Pragersko
00050000-565c-06df-41ac-38546bfbb1ee	3312	Prebold
00050000-565c-06df-74cf-1e644677f48e	4205	Preddvor
00050000-565c-06df-186e-4e2309b4e677	6255	Prem
00050000-565c-06df-2872-f16211fd37ea	1352	Preserje
00050000-565c-06df-9fd9-7c84bc9e9cfb	6258	Prestranek
00050000-565c-06df-fcfd-374a537c5f3b	2391	Prevalje
00050000-565c-06df-7a9f-0ec6e467488e	3262	Prevorje
00050000-565c-06df-08da-774e0ae54af0	1276	Primskovo 
00050000-565c-06df-094c-237a78939dd6	3253	Pristava pri Mestinju
00050000-565c-06df-ba7d-a19ca86cb264	9207	Prosenjakovci/Partosfalva
00050000-565c-06df-6bea-3a0eb8972236	5297	Prvačina
00050000-565c-06df-5857-6038b0178ad8	2250	Ptuj
00050000-565c-06df-32cd-68fcef0983c1	2323	Ptujska Gora
00050000-565c-06df-23a4-cc1e9eb40a78	9201	Puconci
00050000-565c-06df-0285-c6b8c634cc08	2327	Rače
00050000-565c-06df-bda5-a658cd9cc1a5	1433	Radeče
00050000-565c-06df-6b9d-ec0180a9dbf4	9252	Radenci
00050000-565c-06df-7fe5-9a278ae4b332	2360	Radlje ob Dravi
00050000-565c-06df-7ec6-26716d35da82	1235	Radomlje
00050000-565c-06df-8b6b-2920a09e796b	4240	Radovljica
00050000-565c-06df-15dd-1781e7014e01	8274	Raka
00050000-565c-06df-f6af-da64e06f16cf	1381	Rakek
00050000-565c-06df-fc19-b2443282f772	4283	Rateče - Planica
00050000-565c-06df-2cb0-20405f38f879	2390	Ravne na Koroškem
00050000-565c-06df-2e88-35d6fdc3bc30	9246	Razkrižje
00050000-565c-06df-d1e0-063c3d813b70	3332	Rečica ob Savinji
00050000-565c-06df-35ab-5b523b0f4ab0	5292	Renče
00050000-565c-06df-808d-09ace36effa7	1310	Ribnica
00050000-565c-06df-24d1-80994d79ef41	2364	Ribnica na Pohorju
00050000-565c-06df-2770-0d9c67781d20	3272	Rimske Toplice
00050000-565c-06df-f5a4-29915e5c4a17	1314	Rob
00050000-565c-06df-d6be-195cd075a7b7	5215	Ročinj
00050000-565c-06df-1787-d21e8f83439e	3250	Rogaška Slatina
00050000-565c-06df-b7d9-290231e21c33	9262	Rogašovci
00050000-565c-06df-c723-6052a7e92ab0	3252	Rogatec
00050000-565c-06df-f636-a68b2adb4fce	1373	Rovte
00050000-565c-06df-c560-519f53e5016d	2342	Ruše
00050000-565c-06df-145f-bfc984714bcd	1282	Sava
00050000-565c-06df-cd90-0bf213a4fee8	6333	Sečovlje/Sicciole
00050000-565c-06df-d793-2583fdac375e	4227	Selca
00050000-565c-06df-96ca-4a0966cce0bf	2352	Selnica ob Dravi
00050000-565c-06df-1e0a-5ab060b6d4de	8333	Semič
00050000-565c-06df-3408-404c4b952f20	8281	Senovo
00050000-565c-06df-b5c8-36147b742d8d	6224	Senožeče
00050000-565c-06df-10fa-47090935a46d	8290	Sevnica
00050000-565c-06df-7a6d-cf0b757bd173	6210	Sežana
00050000-565c-06df-c814-6880b95d31cb	2214	Sladki Vrh
00050000-565c-06df-ead0-bcaa617d20e5	5283	Slap ob Idrijci
00050000-565c-06df-b9b1-ace307f22e01	2380	Slovenj Gradec
00050000-565c-06df-a0df-d7bfe327b608	2310	Slovenska Bistrica
00050000-565c-06df-d5e2-4e8846752f20	3210	Slovenske Konjice
00050000-565c-06df-0d88-7d00c1e419d4	1216	Smlednik
00050000-565c-06df-7352-77b7b3d7130c	5232	Soča
00050000-565c-06df-965c-a6bd7cde9bd4	1317	Sodražica
00050000-565c-06df-0a66-6b1ca53b2750	3335	Solčava
00050000-565c-06df-add2-0f62fa6efcaf	5250	Solkan
00050000-565c-06df-5312-7c651fd2d5cb	4229	Sorica
00050000-565c-06df-60a7-24178549a707	4225	Sovodenj
00050000-565c-06df-ed30-13535f4567e8	5281	Spodnja Idrija
00050000-565c-06df-6b14-8ea2b25d227c	2241	Spodnji Duplek
00050000-565c-06df-31ad-ab1dbb29e781	9245	Spodnji Ivanjci
00050000-565c-06df-16aa-0eb339afada2	2277	Središče ob Dravi
00050000-565c-06df-4ba8-6d31c1b880fd	4267	Srednja vas v Bohinju
00050000-565c-06df-0ab2-e0a9ff7bfab2	8256	Sromlje 
00050000-565c-06df-41d7-e9aaeef7d8bc	5224	Srpenica
00050000-565c-06df-28e2-afaeae69f4f8	1242	Stahovica
00050000-565c-06df-07f0-4b4728b24df0	1332	Stara Cerkev
00050000-565c-06df-cefc-f3dc9ac4a61b	8342	Stari trg ob Kolpi
00050000-565c-06df-9d81-9329a3fe8def	1386	Stari trg pri Ložu
00050000-565c-06df-eae4-2025c75d9855	2205	Starše
00050000-565c-06df-da2a-8a8b71f362b0	2289	Stoperce
00050000-565c-06df-a800-574421945dd1	8322	Stopiče
00050000-565c-06df-c41d-4a7cc1da2dd6	3206	Stranice
00050000-565c-06df-0bdc-dc70befbeb2d	8351	Straža
00050000-565c-06df-78eb-3f3067495ab4	1313	Struge
00050000-565c-06df-b7f1-8ac16fa80412	8293	Studenec
00050000-565c-06df-c950-c77adb282de9	8331	Suhor
00050000-565c-06df-68f7-7fbcce9431ec	2233	Sv. Ana v Slovenskih goricah
00050000-565c-06df-9273-20ee8cbab743	2235	Sv. Trojica v Slovenskih goricah
00050000-565c-06df-4880-af8c4cb0c0e9	2353	Sveti Duh na Ostrem Vrhu
00050000-565c-06df-c660-01f2a21829e3	9244	Sveti Jurij ob Ščavnici
00050000-565c-06df-65d9-38bb96888a11	3264	Sveti Štefan
00050000-565c-06df-56cf-440fd8fd8915	2258	Sveti Tomaž
00050000-565c-06df-5ce0-333a53591194	9204	Šalovci
00050000-565c-06df-b585-cd31961edca9	5261	Šempas
00050000-565c-06df-db7d-dfe50cab86b5	5290	Šempeter pri Gorici
00050000-565c-06df-7f8c-06774618a9ae	3311	Šempeter v Savinjski dolini
00050000-565c-06df-7a1d-c0af9588bc4d	4208	Šenčur
00050000-565c-06df-c61d-88d5060a558a	2212	Šentilj v Slovenskih goricah
00050000-565c-06df-425f-910becb897b8	8297	Šentjanž
00050000-565c-06df-99eb-84c2aef9ca2f	2373	Šentjanž pri Dravogradu
00050000-565c-06df-bc1c-d1e4bfc443d0	8310	Šentjernej
00050000-565c-06df-51e7-3b9e8a2424a9	3230	Šentjur
00050000-565c-06df-7fcf-d401be2ca7d7	3271	Šentrupert
00050000-565c-06df-13b3-a772d9d97332	8232	Šentrupert
00050000-565c-06df-ec80-ffa66950ac3c	1296	Šentvid pri Stični
00050000-565c-06df-3c48-4dcf34d78867	8275	Škocjan
00050000-565c-06df-cc17-64225235b256	6281	Škofije
00050000-565c-06df-ab28-b76fde6ba089	4220	Škofja Loka
00050000-565c-06df-e31e-7fea816c3cbd	3211	Škofja vas
00050000-565c-06df-72d5-491ac0efa473	1291	Škofljica
00050000-565c-06df-5c5c-85dc1ba79dee	6274	Šmarje
00050000-565c-06df-eca3-f2d805c1888f	1293	Šmarje - Sap
00050000-565c-06df-1ed6-83f9e294c1b3	3240	Šmarje pri Jelšah
00050000-565c-06df-0f9c-158c8c4eaf9a	8220	Šmarješke Toplice
00050000-565c-06df-162b-3d472e985a97	2315	Šmartno na Pohorju
00050000-565c-06df-7a32-752286f969a6	3341	Šmartno ob Dreti
00050000-565c-06df-2666-8261e7dedd14	3327	Šmartno ob Paki
00050000-565c-06df-5918-549f5533f01f	1275	Šmartno pri Litiji
00050000-565c-06df-0a22-fd263ed1e153	2383	Šmartno pri Slovenj Gradcu
00050000-565c-06df-daa0-e4abd52f3c01	3201	Šmartno v Rožni dolini
00050000-565c-06df-a7a0-9de2f42b7a47	3325	Šoštanj
00050000-565c-06df-5997-be4471c42f3c	6222	Štanjel
00050000-565c-06df-396f-bf62500fbc15	3220	Štore
00050000-565c-06df-b109-3bb8cecf8251	3304	Tabor
00050000-565c-06df-d045-e37f17f8fe8a	3221	Teharje
00050000-565c-06df-1494-04ab044b4739	9251	Tišina
00050000-565c-06df-3c17-7e65d5152d01	5220	Tolmin
00050000-565c-06df-1c66-ea92b6e780cc	3326	Topolšica
00050000-565c-06df-57e6-d58da9a45eb5	2371	Trbonje
00050000-565c-06df-6487-b0086fcfa9a1	1420	Trbovlje
00050000-565c-06df-0556-6f5e8d0a53d4	8231	Trebelno 
00050000-565c-06df-adfe-a2d4f90d76f7	8210	Trebnje
00050000-565c-06df-551e-499b207203a0	5252	Trnovo pri Gorici
00050000-565c-06df-8566-13e716458365	2254	Trnovska vas
00050000-565c-06df-eb59-14d6e0c1d230	1222	Trojane
00050000-565c-06df-7e16-8a628374ec14	1236	Trzin
00050000-565c-06df-1046-d2a5406ad161	4290	Tržič
00050000-565c-06df-8242-66210a34937c	8295	Tržišče
00050000-565c-06df-f4d1-d76d3098ef86	1311	Turjak
00050000-565c-06df-495a-300b3d51075b	9224	Turnišče
00050000-565c-06df-b302-63f60ca7bb85	8323	Uršna sela
00050000-565c-06df-23c9-991e7e859eaf	1252	Vače
00050000-565c-06df-038b-0faf9c059ad4	3320	Velenje 
00050000-565c-06df-c52f-b6cc918bb7b0	3322	Velenje - poštni predali
00050000-565c-06df-5d63-ffa27b0e7fb8	8212	Velika Loka
00050000-565c-06df-824a-fafc1970d341	2274	Velika Nedelja
00050000-565c-06df-97de-721080e0e18d	9225	Velika Polana
00050000-565c-06df-c802-bac9da4bdcd0	1315	Velike Lašče
00050000-565c-06df-7425-d8bf9f72032c	8213	Veliki Gaber
00050000-565c-06df-f56b-5c470ac1be68	9241	Veržej
00050000-565c-06df-de7b-c561dada8529	1312	Videm - Dobrepolje
00050000-565c-06df-2d31-562b5880b8c3	2284	Videm pri Ptuju
00050000-565c-06df-e38e-bc9b1d259a35	8344	Vinica
00050000-565c-06df-8c32-9bbc06b2308f	5271	Vipava
00050000-565c-06df-60cc-1e234334c2de	4212	Visoko
00050000-565c-06df-f4f0-eb1aaf6b0cc8	1294	Višnja Gora
00050000-565c-06df-b47d-3d9fdcc46f1a	3205	Vitanje
00050000-565c-06df-91c0-3f65f5f0cc9c	2255	Vitomarci
00050000-565c-06df-66da-d312a689d9b4	1217	Vodice
00050000-565c-06df-d61d-c8c82d089420	3212	Vojnik\t
00050000-565c-06df-7802-8552c1a57d42	5293	Volčja Draga
00050000-565c-06df-b2cd-a98877825370	2232	Voličina
00050000-565c-06df-c774-5d0e195b6051	3305	Vransko
00050000-565c-06df-b887-3367d6387bca	6217	Vremski Britof
00050000-565c-06df-2b81-eca050241d36	1360	Vrhnika
00050000-565c-06df-48ad-a48fc24e1ff4	2365	Vuhred
00050000-565c-06df-7e67-8f5bee1da37a	2367	Vuzenica
00050000-565c-06df-8a92-f44b35b3534b	8292	Zabukovje 
00050000-565c-06df-f81d-7c7f000a4646	1410	Zagorje ob Savi
00050000-565c-06df-f9ad-e47f1c76c68b	1303	Zagradec
00050000-565c-06df-fd02-1b13d5c07e50	2283	Zavrč
00050000-565c-06df-199f-a101c4753603	8272	Zdole 
00050000-565c-06df-5e56-3fa3fa0713af	4201	Zgornja Besnica
00050000-565c-06df-6c9f-5ec578a7e59d	2242	Zgornja Korena
00050000-565c-06df-4883-822d8f58329f	2201	Zgornja Kungota
00050000-565c-06df-fcc8-9b5db27e4175	2316	Zgornja Ložnica
00050000-565c-06df-9ae1-c775552acde4	2314	Zgornja Polskava
00050000-565c-06df-7797-461cf6e1c6d2	2213	Zgornja Velka
00050000-565c-06df-1bf4-a7db9d4c7c13	4247	Zgornje Gorje
00050000-565c-06df-5e89-b8a40a7dfe35	4206	Zgornje Jezersko
00050000-565c-06df-a5eb-63d6f30ab988	2285	Zgornji Leskovec
00050000-565c-06df-b287-efe1e8c5e440	1432	Zidani Most
00050000-565c-06df-79ad-db6fed9b75e3	3214	Zreče
00050000-565c-06df-3101-29c59ce4cac7	4209	Žabnica
00050000-565c-06df-af3d-0601d5c96e36	3310	Žalec
00050000-565c-06df-701c-b72ab1a32d8c	4228	Železniki
00050000-565c-06df-f782-f89f1d90b48a	2287	Žetale
00050000-565c-06df-4fa1-cd3297b1e54f	4226	Žiri
00050000-565c-06df-bdb0-2d109a522fbd	4274	Žirovnica
00050000-565c-06df-57eb-320b42469062	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 30074016)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 30073591)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 30073339)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-565c-06e2-b01d-f71096327eb5	00080000-565c-06e2-f67e-80b5f47d76ba	\N	00040000-565c-06e0-f2b9-bc58b7522ea1	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-565c-06e2-3b18-90db73ddc8c4	00080000-565c-06e2-f67e-80b5f47d76ba	\N	00040000-565c-06e0-f2b9-bc58b7522ea1	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-565c-06e2-88fd-8f97ed9c324e	00080000-565c-06e2-ccfa-bbb813e01fd8	\N	00040000-565c-06e0-f2b9-bc58b7522ea1	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 30073483)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-565c-06e0-136e-ba619264c8a2	novo leto	1	1	\N	t
00430000-565c-06e0-6f65-484ff0608c31	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-565c-06e0-155c-38f700ab8570	dan upora proti okupatorju	27	4	\N	t
00430000-565c-06e0-a640-f111ec471038	praznik dela	1	5	\N	t
00430000-565c-06e0-b9e0-f47bd4935b31	praznik dela	2	5	\N	t
00430000-565c-06e0-53c9-1624e67abb38	dan Primoža Trubarja	8	6	\N	f
00430000-565c-06e0-4a7e-d404d7108c35	dan državnosti	25	6	\N	t
00430000-565c-06e0-0ea9-60ccffca89bd	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-565c-06e0-56a1-af51bea878d0	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-565c-06e0-1d6b-3ad43aa0903d	dan suverenosti	25	10	\N	f
00430000-565c-06e0-af7c-1788ae8628be	dan spomina na mrtve	1	11	\N	t
00430000-565c-06e0-bb7f-8f8ed5fcc8ff	dan Rudolfa Maistra	23	11	\N	f
00430000-565c-06e0-3fda-3be48fac1a38	božič	25	12	\N	t
00430000-565c-06e0-9f68-a884f518e590	dan samostojnosti in enotnosti	26	12	\N	t
00430000-565c-06e0-3a96-8b9b3dcb9439	Marijino vnebovzetje	15	8	\N	t
00430000-565c-06e0-7bdf-2a3cefa7bac6	dan reformacije	31	10	\N	t
00430000-565c-06e0-9e49-46bad1e3d14c	velikonočna nedelja	27	3	2016	t
00430000-565c-06e0-41e5-45f04c0e670e	velikonočna nedelja	16	4	2017	t
00430000-565c-06e0-f7ba-7e7f5a9efe2d	velikonočna nedelja	1	4	2018	t
00430000-565c-06e0-4549-217ad66295d2	velikonočna nedelja	21	4	2019	t
00430000-565c-06e0-66ae-d937081e2ff4	velikonočna nedelja	12	4	2020	t
00430000-565c-06e0-ceb4-ec26f63ff031	velikonočna nedelja	4	4	2021	t
00430000-565c-06e0-80cf-8dc64fccbafa	velikonočna nedelja	17	4	2022	t
00430000-565c-06e0-dd2b-eca9aa8fa7ab	velikonočna nedelja	9	4	2023	t
00430000-565c-06e0-9143-1a74390c3720	velikonočna nedelja	31	3	2024	t
00430000-565c-06e0-46dd-1f9ba246766b	velikonočna nedelja	20	4	2025	t
00430000-565c-06e0-2aea-6247b8aad916	velikonočna nedelja	5	4	2026	t
00430000-565c-06e0-c638-fa031fd63df5	velikonočna nedelja	28	3	2027	t
00430000-565c-06e0-71b1-ee463e19f0f4	velikonočna nedelja	16	4	2028	t
00430000-565c-06e0-0f26-d964af7b7dfd	velikonočna nedelja	1	4	2029	t
00430000-565c-06e0-d97e-b7e3c39f6fde	velikonočna nedelja	21	4	2030	t
00430000-565c-06e0-8561-a80d12f93918	velikonočni ponedeljek	28	3	2016	t
00430000-565c-06e0-d6ba-765b2838d15f	velikonočni ponedeljek	17	4	2017	t
00430000-565c-06e0-a06a-a5ff33570fd9	velikonočni ponedeljek	2	4	2018	t
00430000-565c-06e0-7458-617755cc3eb4	velikonočni ponedeljek	22	4	2019	t
00430000-565c-06e0-00ef-9e1827a1696c	velikonočni ponedeljek	13	4	2020	t
00430000-565c-06e0-6989-44ee4c345acb	velikonočni ponedeljek	5	4	2021	t
00430000-565c-06e0-32b6-254a02deacad	velikonočni ponedeljek	18	4	2022	t
00430000-565c-06e0-7fa4-b53269b0b8d1	velikonočni ponedeljek	10	4	2023	t
00430000-565c-06e0-bc90-e1a588f2efab	velikonočni ponedeljek	1	4	2024	t
00430000-565c-06e0-f859-4b0907f18dfd	velikonočni ponedeljek	21	4	2025	t
00430000-565c-06e0-e9e9-a6c9d331c2c8	velikonočni ponedeljek	6	4	2026	t
00430000-565c-06e0-6d8a-f1cf6320b578	velikonočni ponedeljek	29	3	2027	t
00430000-565c-06e0-3430-2e0c0bce490b	velikonočni ponedeljek	17	4	2028	t
00430000-565c-06e0-77d6-6fe75df1bed0	velikonočni ponedeljek	2	4	2029	t
00430000-565c-06e0-ebbe-948d9825affc	velikonočni ponedeljek	22	4	2030	t
00430000-565c-06e0-a9ae-d9eda15961c5	binkoštna nedelja - binkošti	15	5	2016	t
00430000-565c-06e0-514a-0fd57b30d3b4	binkoštna nedelja - binkošti	4	6	2017	t
00430000-565c-06e0-8243-45f16b835856	binkoštna nedelja - binkošti	20	5	2018	t
00430000-565c-06e0-11de-aa7129141a50	binkoštna nedelja - binkošti	9	6	2019	t
00430000-565c-06e0-f883-76a6783e2ce6	binkoštna nedelja - binkošti	31	5	2020	t
00430000-565c-06e0-17af-c13d26767e91	binkoštna nedelja - binkošti	23	5	2021	t
00430000-565c-06e0-6214-d2c79d45ad55	binkoštna nedelja - binkošti	5	6	2022	t
00430000-565c-06e0-5d29-7a7251d8690e	binkoštna nedelja - binkošti	28	5	2023	t
00430000-565c-06e0-a025-fe207ebf8049	binkoštna nedelja - binkošti	19	5	2024	t
00430000-565c-06e0-2cf6-6b66f0bcb056	binkoštna nedelja - binkošti	8	6	2025	t
00430000-565c-06e0-deef-0f3e1d53ad51	binkoštna nedelja - binkošti	24	5	2026	t
00430000-565c-06e0-2bc1-994dcf0a5934	binkoštna nedelja - binkošti	16	5	2027	t
00430000-565c-06e0-8145-55cac425564e	binkoštna nedelja - binkošti	4	6	2028	t
00430000-565c-06e0-0503-9be8bc6c45d2	binkoštna nedelja - binkošti	20	5	2029	t
00430000-565c-06e0-fda5-e505525918b3	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 30073443)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 30073455)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 30073603)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 30074030)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 30074040)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-565c-06e2-a65b-c9fdaa426891	00080000-565c-06e2-5e94-de6b2cfcd87d	0987	AK
00190000-565c-06e2-1815-ff7336a2850c	00080000-565c-06e2-ccfa-bbb813e01fd8	0989	AK
00190000-565c-06e2-c73c-e6e5fbdfc065	00080000-565c-06e2-8dc4-fc28c692df10	0986	AK
00190000-565c-06e2-294a-f9130f6ffff1	00080000-565c-06e2-6e43-816456607a2a	0984	AK
00190000-565c-06e2-7eec-3cff882f248b	00080000-565c-06e2-cc96-059ea17ae431	0983	AK
00190000-565c-06e2-0c77-0572c82741c0	00080000-565c-06e2-065d-f89fb05161b2	0982	AK
00190000-565c-06e4-e7cc-e616d24ed449	00080000-565c-06e4-b05a-65c2da0ef833	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 30073939)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-565c-06e3-2a0e-7eb472998727	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 30074048)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 30073632)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-565c-06e2-b0f5-e502725489b9	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-565c-06e2-120c-a71d78ce744e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-565c-06e2-9157-2260c8bade66	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-565c-06e2-b805-acea4c38d956	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-565c-06e2-b1fa-626186373b34	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-565c-06e2-4e63-38a62e2303c2	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-565c-06e2-f9f6-83f4bd9b935c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 30073576)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 30073566)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 30073777)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 30073707)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 30073417)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 30073179)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-565c-06e4-b05a-65c2da0ef833	00010000-565c-06e0-69db-800f9b25a627	2015-11-30 09:20:52	INS	a:0:{}
2	App\\Entity\\Option	00000000-565c-06e4-913d-a119da22d664	00010000-565c-06e0-69db-800f9b25a627	2015-11-30 09:20:52	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-565c-06e4-e7cc-e616d24ed449	00010000-565c-06e0-69db-800f9b25a627	2015-11-30 09:20:52	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 30073645)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 30073217)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-565c-06e0-495f-a9e7cccf18de	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-565c-06e0-e9bb-e84d4fb89c72	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-565c-06e0-7bea-2934c41a8c68	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-565c-06e0-d44c-4ccb301f9de6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-565c-06e0-8c52-3dc6a8f14fc0	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-565c-06e0-5dcc-0fad79c7ebe9	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-565c-06e0-ae9f-43b0e817a7e1	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-565c-06e0-e273-eeeb88c14e6b	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-565c-06e0-2f73-5ea2be60f422	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-565c-06e0-9dcd-d2cd069e30e1	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-565c-06e0-4561-fc4221f88a87	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565c-06e0-e468-b7e45869b944	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-565c-06e0-7e19-2d91812211d8	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-565c-06e0-bd6c-561949799cab	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-565c-06e0-e001-72b88d2c0a8a	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-565c-06e0-7dd4-973e01e8c82a	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-565c-06e0-3aa9-9d23304e0795	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565c-06e0-6faa-366c61411b5c	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-565c-06e0-cebd-b76daf0c5082	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565c-06e0-fd32-b985c4fb0657	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-565c-06e0-5d51-6592a7806552	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-565c-06e0-f4cf-2c869042955f	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-565c-06e0-b075-72347f009415	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-565c-06e0-1bfd-e7b3208ef46f	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-565c-06e0-08ac-196aec6d775b	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-565c-06e0-179f-d9b67f940794	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-565c-06e0-3f0b-ad75409c740e	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-565c-06e0-d30d-2799ce7a0e3d	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-565c-06e0-2d94-1b09daf9b082	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-565c-06e0-7638-e01e554d3b2b	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-565c-06e0-fcd1-cf5487ff6a8f	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-565c-06e0-c93e-e4ffd74976ea	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-565c-06e0-8e1b-7dbdc10df833	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-565c-06e0-0047-457e55f88c2d	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-565c-06e0-2c99-7ce62b16191a	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-565c-06e0-5fca-13ee770ffb20	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-565c-06e0-1900-79ed43aa9f10	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-565c-06e0-b6ad-8d9c9cb827fd	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565c-06e0-642a-f1c4be8b2bfd	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-565c-06e2-b564-52b5c393dded	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-565c-06e2-a775-2c514f8ec76b	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-cb38-288f87215ccd	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-474f-848f3d971fb7	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-edce-c328132e540f	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-cc99-76f5f8251429	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-e3d7-643192e17695	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-10b9-ec5bcdea6d65	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-d8a0-0b185014704b	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-49fe-56599bdccca0	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-7d14-f852ae36108c	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-7b43-f991d90fcf12	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-a08f-3e4b6864ef1e	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-57ba-0775605468fc	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-7b2f-6588c1c702d7	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-c844-6745d3c7b960	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-bcae-a88ea1361282	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-565c-06e2-56b4-db643554d857	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3101 (class 0 OID 30073201)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-565c-06e0-ba52-304e19627ba4	00020000-565c-06e0-7bea-2934c41a8c68
00010000-565c-06e0-69db-800f9b25a627	00020000-565c-06e0-7bea-2934c41a8c68
00010000-565c-06e2-5045-082a62f8f10a	00020000-565c-06e2-b564-52b5c393dded
00010000-565c-06e2-6f89-726947d91a6b	00020000-565c-06e2-a775-2c514f8ec76b
00010000-565c-06e2-6f89-726947d91a6b	00020000-565c-06e2-cc99-76f5f8251429
00010000-565c-06e2-6f89-726947d91a6b	00020000-565c-06e2-49fe-56599bdccca0
00010000-565c-06e2-6f89-726947d91a6b	00020000-565c-06e2-7b43-f991d90fcf12
00010000-565c-06e2-6f89-726947d91a6b	00020000-565c-06e2-7b2f-6588c1c702d7
00010000-565c-06e2-6f89-726947d91a6b	00020000-565c-06e2-bcae-a88ea1361282
00010000-565c-06e2-6f89-726947d91a6b	00020000-565c-06e2-474f-848f3d971fb7
00010000-565c-06e2-3497-de38a74a95f1	00020000-565c-06e2-a775-2c514f8ec76b
00010000-565c-06e2-3497-de38a74a95f1	00020000-565c-06e2-cb38-288f87215ccd
00010000-565c-06e2-3497-de38a74a95f1	00020000-565c-06e2-474f-848f3d971fb7
00010000-565c-06e2-3497-de38a74a95f1	00020000-565c-06e2-edce-c328132e540f
00010000-565c-06e2-6860-0642cb0b0c10	00020000-565c-06e2-a775-2c514f8ec76b
00010000-565c-06e2-6860-0642cb0b0c10	00020000-565c-06e2-cb38-288f87215ccd
00010000-565c-06e2-6860-0642cb0b0c10	00020000-565c-06e2-474f-848f3d971fb7
00010000-565c-06e2-6860-0642cb0b0c10	00020000-565c-06e2-edce-c328132e540f
00010000-565c-06e2-6860-0642cb0b0c10	00020000-565c-06e2-7b43-f991d90fcf12
00010000-565c-06e2-3062-fed1a35e677e	00020000-565c-06e2-cb38-288f87215ccd
00010000-565c-06e2-3062-fed1a35e677e	00020000-565c-06e2-e3d7-643192e17695
00010000-565c-06e2-3062-fed1a35e677e	00020000-565c-06e2-7d14-f852ae36108c
00010000-565c-06e2-3062-fed1a35e677e	00020000-565c-06e2-a08f-3e4b6864ef1e
00010000-565c-06e2-3062-fed1a35e677e	00020000-565c-06e2-7b43-f991d90fcf12
00010000-565c-06e2-3062-fed1a35e677e	00020000-565c-06e2-c844-6745d3c7b960
00010000-565c-06e2-4fd0-3c4184c34594	00020000-565c-06e2-cb38-288f87215ccd
00010000-565c-06e2-4fd0-3c4184c34594	00020000-565c-06e2-e3d7-643192e17695
00010000-565c-06e2-4fd0-3c4184c34594	00020000-565c-06e2-d8a0-0b185014704b
00010000-565c-06e2-4fd0-3c4184c34594	00020000-565c-06e2-7d14-f852ae36108c
00010000-565c-06e2-4fd0-3c4184c34594	00020000-565c-06e2-a08f-3e4b6864ef1e
00010000-565c-06e2-4fd0-3c4184c34594	00020000-565c-06e2-7b43-f991d90fcf12
00010000-565c-06e2-4fd0-3c4184c34594	00020000-565c-06e2-c844-6745d3c7b960
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-cb38-288f87215ccd
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-474f-848f3d971fb7
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-e3d7-643192e17695
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-10b9-ec5bcdea6d65
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-d8a0-0b185014704b
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-cc99-76f5f8251429
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-7d14-f852ae36108c
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-a08f-3e4b6864ef1e
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-7b43-f991d90fcf12
00010000-565c-06e2-da39-46f2ebc9dd6c	00020000-565c-06e2-c844-6745d3c7b960
00010000-565c-06e2-3506-72283914eab3	00020000-565c-06e2-a775-2c514f8ec76b
00010000-565c-06e2-3506-72283914eab3	00020000-565c-06e2-edce-c328132e540f
00010000-565c-06e2-3506-72283914eab3	00020000-565c-06e2-cc99-76f5f8251429
00010000-565c-06e2-3506-72283914eab3	00020000-565c-06e2-49fe-56599bdccca0
00010000-565c-06e2-3506-72283914eab3	00020000-565c-06e2-7b43-f991d90fcf12
00010000-565c-06e2-3506-72283914eab3	00020000-565c-06e2-7b2f-6588c1c702d7
00010000-565c-06e2-3506-72283914eab3	00020000-565c-06e2-bcae-a88ea1361282
00010000-565c-06e2-0880-bca63a91f79e	00020000-565c-06e2-56b4-db643554d857
\.


--
-- TOC entry 3146 (class 0 OID 30073659)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 30073597)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 30073543)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-565c-06e2-9a38-463a0cbb05d1	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-565c-06e2-3413-da3164136426	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-565c-06e2-16f0-6b81cee7da20	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 30073166)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-565c-06df-ca74-e1ba4aa671fa	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-565c-06df-3563-10b3470bb7d1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-565c-06df-666c-6e1ec627c724	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-565c-06df-dc6c-790eebe524d7	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-565c-06df-7c7f-c54de1eaf9ef	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 30073158)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-565c-06df-9d10-a3c3f8cd804f	00230000-565c-06df-dc6c-790eebe524d7	popa
00240000-565c-06df-a99e-7272220afcc4	00230000-565c-06df-dc6c-790eebe524d7	oseba
00240000-565c-06df-c8f4-e634af8bf0d1	00230000-565c-06df-dc6c-790eebe524d7	tippopa
00240000-565c-06df-8239-2374c5d7990b	00230000-565c-06df-dc6c-790eebe524d7	organizacijskaenota
00240000-565c-06df-3ba9-d49a216ca077	00230000-565c-06df-dc6c-790eebe524d7	sezona
00240000-565c-06df-e394-a1d5a323124e	00230000-565c-06df-dc6c-790eebe524d7	tipvaje
00240000-565c-06df-88f4-091d5fd84d7a	00230000-565c-06df-3563-10b3470bb7d1	prostor
00240000-565c-06df-3101-b08bfe33ca24	00230000-565c-06df-dc6c-790eebe524d7	besedilo
00240000-565c-06df-84b0-695f29c597c3	00230000-565c-06df-dc6c-790eebe524d7	uprizoritev
00240000-565c-06df-d2bc-810da5257859	00230000-565c-06df-dc6c-790eebe524d7	funkcija
00240000-565c-06df-e4a8-f2816e8d3ad5	00230000-565c-06df-dc6c-790eebe524d7	tipfunkcije
00240000-565c-06df-29ee-0187cddf5eed	00230000-565c-06df-dc6c-790eebe524d7	alternacija
00240000-565c-06df-0789-d8cd0be5e4b3	00230000-565c-06df-ca74-e1ba4aa671fa	pogodba
00240000-565c-06df-8a58-380bd7f6d60d	00230000-565c-06df-dc6c-790eebe524d7	zaposlitev
00240000-565c-06df-ce98-a8c211315cd7	00230000-565c-06df-dc6c-790eebe524d7	zvrstuprizoritve
00240000-565c-06e0-bbb8-05b919f5744d	00230000-565c-06df-ca74-e1ba4aa671fa	programdela
00240000-565c-06e0-1870-2158a7ff4fab	00230000-565c-06df-dc6c-790eebe524d7	zapis
\.


--
-- TOC entry 3095 (class 0 OID 30073153)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
bec35d8b-2365-429d-9503-7edeb752e094	00240000-565c-06df-9d10-a3c3f8cd804f	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 30073724)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-565c-06e3-0a98-d1145f48ab97	000e0000-565c-06e3-ff3c-a303ceaf1e21	00080000-565c-06e2-f67e-80b5f47d76ba	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-565c-06e0-177a-0071932a34c4
00270000-565c-06e3-7351-ba4e5f0d30f1	000e0000-565c-06e3-ff3c-a303ceaf1e21	00080000-565c-06e2-f67e-80b5f47d76ba	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-565c-06e0-177a-0071932a34c4
\.


--
-- TOC entry 3111 (class 0 OID 30073301)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 30073553)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-565c-06e3-addc-6a3c2b967d34	00180000-565c-06e3-5de7-7b4f8f1c2458	000c0000-565c-06e3-33fd-aa9b655084df	00090000-565c-06e2-8146-9be834a36bda	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-06e3-2040-abd1e0bf1d38	00180000-565c-06e3-5de7-7b4f8f1c2458	000c0000-565c-06e3-4b98-ca07b9cbb469	00090000-565c-06e2-3e6b-b61470ac7a2d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-06e3-e747-d1c5e1fd0f88	00180000-565c-06e3-5de7-7b4f8f1c2458	000c0000-565c-06e3-c120-14a9970922df	00090000-565c-06e2-5d10-ca5cc9e38272	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-06e3-b7dc-4c3b9c1954e5	00180000-565c-06e3-5de7-7b4f8f1c2458	000c0000-565c-06e3-2863-7512361e74ab	00090000-565c-06e2-ca35-e7aedb1e8eed	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-06e3-1cad-67630286f986	00180000-565c-06e3-5de7-7b4f8f1c2458	000c0000-565c-06e3-e356-a875cfdeaeee	00090000-565c-06e2-5857-5f55a1c747ce	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-565c-06e3-cd88-53d8c44b3862	00180000-565c-06e3-c8e1-4451dffdda46	\N	00090000-565c-06e2-5857-5f55a1c747ce	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-565c-06e3-6722-0ec2769d5b8d	00180000-565c-06e3-c8e1-4451dffdda46	\N	00090000-565c-06e2-3e6b-b61470ac7a2d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 30073765)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-565c-06df-8db0-cca77cf60327	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-565c-06df-e25b-cf585b2f27c0	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-565c-06df-e623-597eeb1bbf3e	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-565c-06df-966a-754c4c2b9b28	04	Režija	Režija	Režija	umetnik	30
000f0000-565c-06df-7c84-d9ad11912257	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-565c-06df-4ecd-35b7897262c4	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-565c-06df-773e-94f38f83ba67	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-565c-06df-5a2d-4e654b4918e9	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-565c-06df-59e2-df9b5930f076	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-565c-06df-b55a-971638e11b8b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-565c-06df-8e66-e5e5ad7bf472	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-565c-06df-bffd-6ea955b533de	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-565c-06df-8bd3-d5af358a2dfb	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-565c-06df-d8af-eb24e432a6a3	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-565c-06df-04f1-cc82dd639580	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-565c-06df-6fd4-1ae63097dd06	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-565c-06df-f068-479600f780be	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-565c-06df-d476-a8a69fb109a5	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 30073252)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-565c-06e2-c72c-d4a249148fa5	0001	šola	osnovna ali srednja šola
00400000-565c-06e2-f239-05fcb637e818	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-565c-06e2-5499-02dc8903689d	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 30074060)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-565c-06df-cb1f-f96f9cd8d972	01	Velika predstava	f	1.00	1.00
002b0000-565c-06df-2967-af2bc868e42d	02	Mala predstava	f	0.50	0.50
002b0000-565c-06df-0691-a5b57f80a363	03	Mala koprodukcija	t	0.40	1.00
002b0000-565c-06df-1d29-fe6df061a4aa	04	Srednja koprodukcija	t	0.70	2.00
002b0000-565c-06df-2154-2bebcf34c9ae	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 30073533)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-565c-06df-17e5-607bb2618345	0001	prva vaja	prva vaja
00420000-565c-06df-ce12-1d2172f13641	0002	tehnična vaja	tehnična vaja
00420000-565c-06df-d21c-efc7cf3807cc	0003	lučna vaja	lučna vaja
00420000-565c-06df-6aff-be762e33f3ca	0004	kostumska vaja	kostumska vaja
00420000-565c-06df-cbba-4a4800f1c043	0005	foto vaja	foto vaja
00420000-565c-06df-d51e-f2474e3ff486	0006	1. glavna vaja	1. glavna vaja
00420000-565c-06df-6e7f-fac54959fb43	0007	2. glavna vaja	2. glavna vaja
00420000-565c-06df-d0fb-1fdb3f0284a8	0008	1. generalka	1. generalka
00420000-565c-06df-11aa-ebd2f6cf9730	0009	2. generalka	2. generalka
00420000-565c-06df-24e1-dacc68dc513e	0010	odprta generalka	odprta generalka
00420000-565c-06df-e568-379ecc4742f8	0011	obnovitvena vaja	obnovitvena vaja
00420000-565c-06df-301e-96c5925d224f	0012	pevska vaja	pevska vaja
00420000-565c-06df-35c2-d03fca41bc68	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-565c-06df-8cc1-4fd1c4a24cad	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 30073374)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 30073188)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-565c-06e0-69db-800f9b25a627	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROLIgM1Pirx5mIcts0nLK99rwPd1YuQnS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-565c-06e2-23fa-9b5e4677f125	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-565c-06e2-ee88-3ad68bce8557	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-565c-06e2-8447-cd97ee28f22a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-565c-06e2-587e-38edc6dab2e9	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-565c-06e2-d733-f0a9c7fe55d5	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-565c-06e2-55c6-99e435b87dd3	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-565c-06e2-1008-b035df11f93f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-565c-06e2-8a7e-ee2b35b83dc9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-565c-06e2-65e9-676185f771e7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-565c-06e2-5045-082a62f8f10a	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-565c-06e2-6d84-2baeccf5d05e	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-565c-06e2-6f89-726947d91a6b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-565c-06e2-3497-de38a74a95f1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-565c-06e2-6860-0642cb0b0c10	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-565c-06e2-3062-fed1a35e677e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-565c-06e2-4fd0-3c4184c34594	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-565c-06e2-da39-46f2ebc9dd6c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-565c-06e2-3506-72283914eab3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-565c-06e2-0880-bca63a91f79e	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-565c-06e0-ba52-304e19627ba4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 30073815)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-565c-06e3-75cc-6d487bd37606	00160000-565c-06e2-3b6d-81dac97efba0	\N	00140000-565c-06e0-6c1d-4c529fa7027a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-565c-06e2-b1fa-626186373b34
000e0000-565c-06e3-ff3c-a303ceaf1e21	00160000-565c-06e2-5b25-5cd81448e5d3	\N	00140000-565c-06e0-a100-4e377a688d1a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-565c-06e2-4e63-38a62e2303c2
000e0000-565c-06e3-1360-7fc6ace6036f	\N	\N	00140000-565c-06e0-a100-4e377a688d1a	00190000-565c-06e2-a65b-c9fdaa426891	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565c-06e2-b1fa-626186373b34
000e0000-565c-06e3-8a11-d9dc8a5cb698	\N	\N	00140000-565c-06e0-a100-4e377a688d1a	00190000-565c-06e2-a65b-c9fdaa426891	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-565c-06e2-b1fa-626186373b34
000e0000-565c-06e3-a125-bead10bfba91	\N	\N	00140000-565c-06e0-a100-4e377a688d1a	00190000-565c-06e2-a65b-c9fdaa426891	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-565c-06e2-b0f5-e502725489b9
000e0000-565c-06e3-a182-b3d375985179	\N	\N	00140000-565c-06e0-a100-4e377a688d1a	00190000-565c-06e2-a65b-c9fdaa426891	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-565c-06e2-b0f5-e502725489b9
\.


--
-- TOC entry 3125 (class 0 OID 30073473)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-565c-06e3-c8fa-e5dddba9cc95	\N	000e0000-565c-06e3-ff3c-a303ceaf1e21	1	
00200000-565c-06e3-eedf-c209b438bebc	\N	000e0000-565c-06e3-ff3c-a303ceaf1e21	2	
00200000-565c-06e3-b67e-0514419f9dd0	\N	000e0000-565c-06e3-ff3c-a303ceaf1e21	3	
00200000-565c-06e3-abc5-715614e18fdd	\N	000e0000-565c-06e3-ff3c-a303ceaf1e21	4	
00200000-565c-06e3-50cb-c226b9d0336d	\N	000e0000-565c-06e3-ff3c-a303ceaf1e21	5	
\.


--
-- TOC entry 3142 (class 0 OID 30073624)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 30073738)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-565c-06e0-3533-d0f56ef82467	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-565c-06e0-5baf-df500ddffeb4	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-565c-06e0-7c9a-988328472492	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-565c-06e0-e27f-e66068d10f3c	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-565c-06e0-5f07-b9b6a995d5b3	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-565c-06e0-029e-63bc4da8b2e4	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-565c-06e0-8074-7a1353a713cf	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-565c-06e0-1078-8f7389be8ad8	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-565c-06e0-177a-0071932a34c4	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-565c-06e0-fe94-836a004f4644	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-565c-06e0-9aa8-a66cda6c7462	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-565c-06e0-b326-e1927cb7729e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-565c-06e0-a3c3-056b70e4d573	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-565c-06e0-7fe3-ab3a74d1c576	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-565c-06e0-cbe0-b5eee860054e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-565c-06e0-b417-7a84b53d3b6d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-565c-06e0-2c7a-22a3d68d1e03	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-565c-06e0-56f5-caac0d6ea854	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-565c-06e0-e8aa-6076c88f617e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-565c-06e0-6cc0-e58cccb25247	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-565c-06e0-26c3-a70e51e424c9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-565c-06e0-bdda-ae26f4fcc90b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-565c-06e0-f6ce-88835b18f399	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-565c-06e0-e576-9a0bf65f85ab	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-565c-06e0-0659-f36ace2dbb92	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-565c-06e0-d493-59ff4f4ffee3	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-565c-06e0-1977-64757991b566	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-565c-06e0-d8db-37b4d9f3b162	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 30074110)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 30074079)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 30074122)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 30073696)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-565c-06e2-7d07-5c0d496fa29a	00090000-565c-06e2-3e6b-b61470ac7a2d	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-06e2-06a9-7bafeeb6bb0b	00090000-565c-06e2-5d10-ca5cc9e38272	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-06e2-4828-395756b48d0b	00090000-565c-06e2-5aa2-fa2e309b134c	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-06e2-f7dc-48ec402978d7	00090000-565c-06e2-91a9-86cb3a86115b	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-06e2-6daa-aa4338c7aebe	00090000-565c-06e2-8e96-2aeaf477180e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-565c-06e2-fb5c-dd43ae4243e3	00090000-565c-06e2-b40b-bf67e9b7bb7b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 30073517)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 30073805)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-565c-06e0-6c1d-4c529fa7027a	01	Drama	drama (SURS 01)
00140000-565c-06e0-41bf-6686b1e3cfc5	02	Opera	opera (SURS 02)
00140000-565c-06e0-d656-9423cbba0d67	03	Balet	balet (SURS 03)
00140000-565c-06e0-882a-f7a279151f63	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-565c-06e0-a568-31b1fa149692	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-565c-06e0-a100-4e377a688d1a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-565c-06e0-71e2-d766cb3bb679	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 30073686)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 30073251)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 30073864)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 30073854)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 30073242)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 30073721)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 30073763)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 30074163)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 30073505)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 30073527)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 30073532)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 30074077)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 30073400)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 30073933)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 30073682)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 30073471)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 30073438)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 30073414)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 30073589)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 30074140)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 30074147)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 30074171)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2728 (class 2606 OID 30073616)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 30073372)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 30073270)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 30073334)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 30073297)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 30073231)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 30073216)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 30073622)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 30073658)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 30073800)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 30073325)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 30073360)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 30074028)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 30073595)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 30073350)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 30073490)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 30073459)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 30073451)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 30073607)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30074037)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 30074045)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 30074015)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 30074058)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 30073640)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 30073580)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 30073571)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 30073787)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 30073714)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 30073426)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 30073187)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 30073649)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 30073205)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 30073225)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 30073667)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 30073602)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 30073551)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 30073175)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 30073163)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 30073157)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 30073734)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 30073306)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 30073562)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 30073774)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 30073259)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 30074070)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 30073540)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 30073385)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 30073200)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 30073833)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 30073480)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 30073630)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 30073746)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 30074120)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 30074104)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 30074128)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 30073704)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 30073521)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 30073813)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 30073694)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 30073515)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 30073516)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 30073514)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 30073513)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 30073512)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 30073735)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 30073736)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 30073737)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 30074142)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 30074141)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 30073327)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 30073328)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 30073623)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 30074108)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 30074107)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 30074109)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 30074106)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 30074105)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 30073609)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 30073608)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 30073481)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 30073482)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 30073683)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 30073685)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 30073684)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 30073416)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 30073415)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 30074059)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 30073802)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 30073803)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 30073804)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 30074129)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 30073838)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 30073835)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 30073839)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 30073837)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 30073836)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 30073387)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 30073386)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 30073300)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 30073650)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 30073232)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 30073233)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 30073670)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 30073669)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 30073668)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 30073337)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 30073336)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 30073338)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 30073454)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 30073452)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 30073453)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 30073165)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 30073575)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 30073573)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 30073572)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 30073574)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 30073206)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 30073207)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 30073631)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 30074164)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 30073723)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 30073722)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 30074172)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 30074173)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 30073596)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 30073715)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 30073716)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 30073938)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 30073937)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 30073934)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 30073935)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 30073936)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 30073352)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 30073351)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 30073353)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 30073644)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 30073643)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 30074038)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 30074039)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 30073868)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 30073869)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 30073866)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 30073867)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 30073705)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 30073706)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 30073584)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 30073583)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 30073581)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 30073582)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 30073856)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 30073855)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 30073427)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 30073441)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 30073440)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 30073439)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 30073442)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 30073472)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 30073460)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 30073461)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 30074029)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 30074078)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 30074148)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 30074149)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 30073272)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 30073271)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 30073307)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 30073308)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 30073522)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 30073565)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 30073564)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 30073563)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 30073507)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 30073508)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 30073511)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 30073506)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 30073510)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 30073509)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 30073326)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 30073260)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 30073261)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 30073401)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 30073403)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 30073402)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 30073404)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 30073590)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 30073801)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 30073834)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 30073775)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 30073776)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 30073298)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 30073299)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 30073695)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 30073176)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 30073373)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 30073335)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 30073164)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 30074071)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 30073642)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 30073641)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 30073541)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 30073542)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 30073865)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 30073361)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 30073814)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 30074121)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 30074046)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 30074047)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 30073764)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 30073552)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 30073226)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 30074344)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 30074349)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 30074374)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 30074364)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 30074339)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 30074359)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 30074369)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 30074354)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 30074544)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 30074549)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 30074554)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 30074719)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 30074714)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 30074229)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 30074234)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 30074459)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 30074699)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 30074694)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 30074704)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 30074689)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 30074684)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 30074454)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 30074449)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 30074329)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 30074334)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 30074499)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 30074509)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 30074504)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 30074284)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 30074279)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 30074439)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 30074674)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 30074559)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 30074564)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 30074569)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 30074709)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 30074589)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 30074574)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 30074594)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 30074584)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 30074579)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 30074274)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 30074269)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 30074214)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 30074209)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 30074479)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 30074189)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 30074194)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 30074494)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 30074489)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 30074484)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 30074244)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 30074239)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 30074249)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 30074309)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 30074299)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 30074304)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 30074174)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 30074414)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 30074404)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 30074399)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 30074409)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 30074179)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 30074184)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 30074464)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 30074734)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 30074539)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 30074534)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 30074739)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 30074744)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 30074444)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 30074524)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 30074529)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 30074649)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 30074644)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 30074629)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 30074634)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 30074639)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 30074259)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 30074254)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 30074264)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 30074474)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 30074469)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 30074659)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 30074664)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 30074619)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 30074624)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 30074609)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 30074614)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 30074514)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 30074519)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 30074434)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 30074429)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 30074419)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 30074424)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 30074604)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 30074599)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 30074289)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 30074294)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 30074324)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 30074314)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 30074319)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 30074654)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 30074669)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 30074679)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 30074724)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 30074729)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 30074204)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 30074199)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 30074219)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 30074224)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 30074379)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 30074394)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 30074389)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 30074384)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-30 09:20:54 CET

--
-- PostgreSQL database dump complete
--

