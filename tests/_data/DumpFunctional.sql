--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-27 08:42:48 CET

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
-- TOC entry 183 (class 1259 OID 29805252)
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
-- TOC entry 237 (class 1259 OID 29805866)
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
-- TOC entry 236 (class 1259 OID 29805849)
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
-- TOC entry 182 (class 1259 OID 29805245)
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
-- TOC entry 181 (class 1259 OID 29805243)
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
-- TOC entry 227 (class 1259 OID 29805726)
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
-- TOC entry 230 (class 1259 OID 29805756)
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
-- TOC entry 251 (class 1259 OID 29806157)
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
-- TOC entry 203 (class 1259 OID 29805500)
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
-- TOC entry 205 (class 1259 OID 29805532)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 29805537)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 29806079)
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
-- TOC entry 194 (class 1259 OID 29805397)
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
-- TOC entry 238 (class 1259 OID 29805879)
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
-- TOC entry 223 (class 1259 OID 29805680)
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
-- TOC entry 200 (class 1259 OID 29805471)
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
-- TOC entry 197 (class 1259 OID 29805437)
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
-- TOC entry 195 (class 1259 OID 29805414)
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
-- TOC entry 212 (class 1259 OID 29805594)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 29806137)
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
-- TOC entry 250 (class 1259 OID 29806150)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 29806172)
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
-- TOC entry 216 (class 1259 OID 29805619)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 29805371)
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
-- TOC entry 185 (class 1259 OID 29805271)
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
-- TOC entry 189 (class 1259 OID 29805338)
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
-- TOC entry 186 (class 1259 OID 29805282)
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
-- TOC entry 178 (class 1259 OID 29805217)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 29805236)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 29805626)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 29805660)
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
-- TOC entry 233 (class 1259 OID 29805797)
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
-- TOC entry 188 (class 1259 OID 29805318)
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
-- TOC entry 191 (class 1259 OID 29805363)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 29806024)
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
-- TOC entry 213 (class 1259 OID 29805600)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 29805348)
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
-- TOC entry 202 (class 1259 OID 29805492)
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
-- TOC entry 198 (class 1259 OID 29805452)
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
-- TOC entry 199 (class 1259 OID 29805464)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 29805612)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 29806038)
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
-- TOC entry 242 (class 1259 OID 29806048)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 29805947)
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
-- TOC entry 243 (class 1259 OID 29806056)
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
-- TOC entry 219 (class 1259 OID 29805641)
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
-- TOC entry 211 (class 1259 OID 29805585)
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
-- TOC entry 210 (class 1259 OID 29805575)
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
-- TOC entry 232 (class 1259 OID 29805786)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 29805716)
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
-- TOC entry 196 (class 1259 OID 29805426)
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
-- TOC entry 175 (class 1259 OID 29805188)
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
-- TOC entry 174 (class 1259 OID 29805186)
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
-- TOC entry 220 (class 1259 OID 29805654)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 29805226)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 29805210)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 29805668)
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
-- TOC entry 214 (class 1259 OID 29805606)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 29805552)
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
-- TOC entry 173 (class 1259 OID 29805175)
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
-- TOC entry 172 (class 1259 OID 29805167)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 29805162)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 29805733)
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
-- TOC entry 187 (class 1259 OID 29805310)
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
-- TOC entry 209 (class 1259 OID 29805562)
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
-- TOC entry 231 (class 1259 OID 29805774)
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
-- TOC entry 184 (class 1259 OID 29805261)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 29806067)
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
-- TOC entry 207 (class 1259 OID 29805542)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 29805383)
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
-- TOC entry 176 (class 1259 OID 29805197)
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
-- TOC entry 235 (class 1259 OID 29805824)
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
-- TOC entry 201 (class 1259 OID 29805482)
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
-- TOC entry 218 (class 1259 OID 29805633)
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
-- TOC entry 229 (class 1259 OID 29805747)
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
-- TOC entry 247 (class 1259 OID 29806117)
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
-- TOC entry 246 (class 1259 OID 29806086)
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
-- TOC entry 248 (class 1259 OID 29806129)
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
-- TOC entry 225 (class 1259 OID 29805705)
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
-- TOC entry 204 (class 1259 OID 29805526)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 29805814)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 29805695)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 29805248)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 29805191)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 29805252)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5658-0975-56af-507cc7ec2020	10	30	Otroci	Abonma za otroke	200
000a0000-5658-0975-36d9-786c8a366cc5	20	60	Mladina	Abonma za mladino	400
000a0000-5658-0975-f4e3-d0b6e198c06e	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 29805866)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5658-0976-e1fd-a1fe1f6fc0b5	000d0000-5658-0976-1888-a42392cc4b51	\N	00090000-5658-0975-b854-d461d2ec256f	000b0000-5658-0975-edf6-ff2c05170d8b	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5658-0976-8367-ae56f6ffcf22	000d0000-5658-0976-2ae4-24d5cfe93560	00100000-5658-0975-e3df-d76140433723	00090000-5658-0975-0e9b-2ba56ee774f9	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5658-0976-1353-d0f4f649d467	000d0000-5658-0976-5f80-925f13be5b1b	00100000-5658-0975-a3c4-c247fa4d3cae	00090000-5658-0975-2e6d-078fe4591b7f	\N	0003	t	\N	2015-11-27	\N	2	t	\N	f	f
000c0000-5658-0976-8f85-0fd2ec8a5038	000d0000-5658-0976-9bb0-6dd85f480dde	\N	00090000-5658-0975-e63a-ea582b8a13f7	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5658-0976-b5cd-909f7fd75ecc	000d0000-5658-0976-d085-3b99027dc963	\N	00090000-5658-0975-e940-9855853f6cd5	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5658-0976-c0a8-4d741241591a	000d0000-5658-0976-9567-4192d1e9b008	\N	00090000-5658-0975-d6e6-994f79534e5a	000b0000-5658-0975-59d2-01fcae6a9c74	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5658-0976-4de6-af3996921373	000d0000-5658-0976-f83e-1fb28ffba8af	00100000-5658-0975-5466-1cc4f4d36902	00090000-5658-0975-6989-ed81a5ad388d	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5658-0976-a228-a554a364eb0f	000d0000-5658-0976-04cd-20cd718c4e03	\N	00090000-5658-0975-e690-546b60cab80d	000b0000-5658-0975-de67-bebdb5c54291	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5658-0976-f49d-ba94b74896da	000d0000-5658-0976-f83e-1fb28ffba8af	00100000-5658-0975-aa2e-f26fa5fb170b	00090000-5658-0975-0e44-15475be1797d	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5658-0976-976c-6cd13a90a582	000d0000-5658-0976-f83e-1fb28ffba8af	00100000-5658-0975-18f9-11a11f5b8f14	00090000-5658-0975-c8d9-a16daa7954e5	\N	0010	t	\N	2015-11-27	\N	16	f	\N	f	t
000c0000-5658-0976-4196-00da3d894a98	000d0000-5658-0976-f83e-1fb28ffba8af	00100000-5658-0975-f637-0334e12b1099	00090000-5658-0975-e655-38890ae62ea7	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5658-0976-aa80-f98f12df1c17	000d0000-5658-0976-b1de-066dcd54b4e4	00100000-5658-0975-e3df-d76140433723	00090000-5658-0975-0e9b-2ba56ee774f9	000b0000-5658-0975-ca3b-8089a9754417	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 29805849)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 29805245)
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
-- TOC entry 3149 (class 0 OID 29805726)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5658-0976-2d0b-35e2d2924a56	00160000-5658-0975-81c3-4d6cee816e88	00090000-5658-0975-0303-9ae4d665c035	aizv	10	t
003d0000-5658-0976-ed00-cc290cc2cf5c	00160000-5658-0975-81c3-4d6cee816e88	00090000-5658-0975-226a-68f864aad018	apri	14	t
003d0000-5658-0976-c0db-f729aa1f101c	00160000-5658-0975-9c40-4fbaf7a9864b	00090000-5658-0975-7ccd-9ad5b94b1123	aizv	11	t
003d0000-5658-0976-9015-7b943f9afc99	00160000-5658-0975-680d-ec27f1f05820	00090000-5658-0975-411b-47cd1d999ed0	aizv	12	t
003d0000-5658-0976-e97b-7257cb65a0b2	00160000-5658-0975-81c3-4d6cee816e88	00090000-5658-0975-05c1-19b72b658579	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 29805756)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5658-0975-81c3-4d6cee816e88	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5658-0975-9c40-4fbaf7a9864b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5658-0975-680d-ec27f1f05820	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 29806157)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 29805500)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5658-0976-bb07-a767d113a1e2	\N	\N	00200000-5658-0976-0e00-458b52d95ed1	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5658-0976-54c4-0380e2376ac4	\N	\N	00200000-5658-0976-5c6f-717f63ab98c6	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5658-0976-5159-2ad8d914cae7	\N	\N	00200000-5658-0976-7911-4e10ceeb6288	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5658-0976-1551-477ab8b35334	\N	\N	00200000-5658-0976-ebb6-f8d9f794c159	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5658-0976-9c73-4eeb9c6753dc	\N	\N	00200000-5658-0976-0ef9-f6706868cefd	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 29805532)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 29805537)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 29806079)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 29805397)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5658-0973-edf9-2e82b5271d0b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5658-0973-3506-fdfcfaa17f3c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5658-0973-5b8e-856c05052b9d	AL	ALB	008	Albania 	Albanija	\N
00040000-5658-0973-0917-8f23ba623861	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5658-0973-ff60-0931758248a6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5658-0973-89f9-d6b7a6dc9036	AD	AND	020	Andorra 	Andora	\N
00040000-5658-0973-7433-4053a15d01b4	AO	AGO	024	Angola 	Angola	\N
00040000-5658-0973-646d-3b79bd18d79e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5658-0973-962d-84bb89309af8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5658-0973-a59c-7873ca66ab75	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5658-0973-5e7d-325480bdb37f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5658-0973-2951-2d54849d1f6a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5658-0973-2c70-5928f5748c16	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5658-0973-d528-f37a74276ff7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5658-0973-d035-8efd606f4492	AT	AUT	040	Austria 	Avstrija	\N
00040000-5658-0973-b9b8-637ef02b0c27	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5658-0973-1fa5-5c49937424c6	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5658-0973-5e73-5ba5de0e7935	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5658-0973-253c-0ed7f249a603	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5658-0973-05d7-a8fdb26fe6ba	BB	BRB	052	Barbados 	Barbados	\N
00040000-5658-0973-a628-28de4603af3b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5658-0973-c9f9-44b9cb2659c6	BE	BEL	056	Belgium 	Belgija	\N
00040000-5658-0973-d334-f4179569f4b6	BZ	BLZ	084	Belize 	Belize	\N
00040000-5658-0973-bcb2-dc80d55b6bda	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5658-0973-5c53-f7de608afc0c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5658-0973-3e6e-13695b0f0534	BT	BTN	064	Bhutan 	Butan	\N
00040000-5658-0973-2604-82f3ae07147d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5658-0973-28ac-5bc69186b593	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5658-0973-c164-c647ab1d3f97	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5658-0973-f89a-3f25a3a24cfe	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5658-0973-965d-bc916c93070d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5658-0973-cc1d-de25c2911a4a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5658-0973-3a10-79453a5d7f76	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5658-0973-d694-f10eb5d4cd47	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5658-0973-5991-1789deeb3a22	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5658-0973-e62b-af5192de6afa	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5658-0973-fecd-7a9c0827c2c3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5658-0973-661c-72fc817c9c4f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5658-0973-5a5f-c258b83fabed	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5658-0973-4a09-30138442ea7f	CA	CAN	124	Canada 	Kanada	\N
00040000-5658-0973-134d-b11a79718423	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5658-0973-2eed-47228d1abd81	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5658-0973-7f80-322b98c14cc2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5658-0973-45ce-3b8384c89c67	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5658-0973-7fd0-3d5fbcacefd5	CL	CHL	152	Chile 	Čile	\N
00040000-5658-0973-00e5-7a1b5c9ea929	CN	CHN	156	China 	Kitajska	\N
00040000-5658-0973-898c-5847f4bbbbd8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5658-0973-02d5-97ed0d71638c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5658-0973-b3c1-033627974126	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5658-0973-b35a-ea86cb88f750	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5658-0973-9c47-d0cf4eb63d70	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5658-0973-d09e-0fa25469f897	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5658-0973-706e-3dfac4468ec3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5658-0973-7ffd-6e45f17bc385	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5658-0973-2533-2e60148ff4fc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5658-0973-3ac6-613f584d47fb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5658-0973-cd56-5f075b1ce131	CU	CUB	192	Cuba 	Kuba	\N
00040000-5658-0973-2c69-5e408948953f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5658-0973-a4b7-8b9a0de0c5d9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5658-0973-03e0-3f305d9dbce5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5658-0973-8a8f-6152a6d5737c	DK	DNK	208	Denmark 	Danska	\N
00040000-5658-0973-db20-797996108a30	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5658-0973-fdd8-b8f3785e7237	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5658-0973-4b37-e9e8eb3f784a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5658-0973-1c49-a5aff57c9bc9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5658-0973-3fb6-3cd731cdcb20	EG	EGY	818	Egypt 	Egipt	\N
00040000-5658-0973-37f5-279726d9791c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5658-0973-623b-d40fb5871a65	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5658-0973-9967-a07c8e57e05e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5658-0973-7e65-1d98b615ab9e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5658-0973-eb32-594ec8d92ca7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5658-0973-bd80-9b1a2e426b7a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5658-0973-95d2-75fc91a523a0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5658-0973-6fae-a481f3f8fd48	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5658-0973-e878-5a1aec63a7c9	FI	FIN	246	Finland 	Finska	\N
00040000-5658-0973-4f2d-b145866b0bd3	FR	FRA	250	France 	Francija	\N
00040000-5658-0973-4166-751601784cf2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5658-0973-6af3-8fb5fe98aca0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5658-0973-02a4-5f8ae95640dd	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5658-0973-9ff1-ca59939afd85	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5658-0973-3b0e-233428b8d090	GA	GAB	266	Gabon 	Gabon	\N
00040000-5658-0973-7065-04e6f3e7ba77	GM	GMB	270	Gambia 	Gambija	\N
00040000-5658-0973-5f2d-64ac847f2ef6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5658-0973-b568-93bf6ed94021	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5658-0973-4163-a93b46c9f6c1	GH	GHA	288	Ghana 	Gana	\N
00040000-5658-0973-2b67-4ecdad4ce7f5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5658-0973-96bf-2b4b7981e5a8	GR	GRC	300	Greece 	Grčija	\N
00040000-5658-0973-7002-77c4596565c3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5658-0973-5d3d-f81dc3cc4605	GD	GRD	308	Grenada 	Grenada	\N
00040000-5658-0973-615d-29600135c0ba	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5658-0973-422a-51165924c1c8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5658-0973-e0c2-c63617adf6ca	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5658-0973-8c1e-977a48920f9b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5658-0973-8a77-e6aba0fbc59d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5658-0973-726e-f5d3d143d34b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5658-0973-d05a-18c599b105c0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5658-0973-4c0f-83eb5462c40c	HT	HTI	332	Haiti 	Haiti	\N
00040000-5658-0973-0895-64ea0a63f3db	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5658-0973-6bdb-8ace0b01b5ea	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5658-0973-7f70-cc78b3867a7f	HN	HND	340	Honduras 	Honduras	\N
00040000-5658-0973-f843-78fbc6a9d40d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5658-0973-c3ed-e439a2d62558	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5658-0973-36de-cb49cfa7f309	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5658-0973-ca1b-7b70abdcaa36	IN	IND	356	India 	Indija	\N
00040000-5658-0973-1ee1-19db2e61fc8f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5658-0973-954a-8e768b729b3e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5658-0973-8ea1-aba085b0705c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5658-0973-5974-8b698d6e9d3a	IE	IRL	372	Ireland 	Irska	\N
00040000-5658-0973-93e8-a59d38abe239	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5658-0973-797d-7692f0533459	IL	ISR	376	Israel 	Izrael	\N
00040000-5658-0973-393a-4844b841014f	IT	ITA	380	Italy 	Italija	\N
00040000-5658-0973-e668-fb63a961979b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5658-0973-5161-730ff80818e6	JP	JPN	392	Japan 	Japonska	\N
00040000-5658-0973-ee37-c7b03f7c4255	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5658-0973-4889-2b29b820eb74	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5658-0973-449e-ca1cba6e7efb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5658-0973-d8bd-494800264978	KE	KEN	404	Kenya 	Kenija	\N
00040000-5658-0973-07b6-24bdd0fef13a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5658-0973-b162-f922287dc137	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5658-0973-18db-f36447656ea2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5658-0973-3e25-7ff5317ed42e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5658-0973-b1e6-bfb73d30a74a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5658-0973-6a06-af5bcf655dfb	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5658-0973-f190-211b0788ceb3	LV	LVA	428	Latvia 	Latvija	\N
00040000-5658-0973-9f4c-a8871ec246eb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5658-0973-8c36-8d805d24d91b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5658-0973-077c-40d15eadb099	LR	LBR	430	Liberia 	Liberija	\N
00040000-5658-0973-7678-32669d8695a5	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5658-0973-9e73-8f1b4788cf42	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5658-0973-f162-3226cb9c58f3	LT	LTU	440	Lithuania 	Litva	\N
00040000-5658-0973-b668-211f4fc6a295	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5658-0973-1e04-c2f8f290d2c2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5658-0973-ee5e-59c6985ba4d6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5658-0973-40d3-78b733c864b2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5658-0973-f142-208e18545733	MW	MWI	454	Malawi 	Malavi	\N
00040000-5658-0973-539e-09c923a5abd6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5658-0973-5523-18a6774f173d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5658-0973-2c8f-3eb21d0db743	ML	MLI	466	Mali 	Mali	\N
00040000-5658-0973-a0b6-dd708b74c034	MT	MLT	470	Malta 	Malta	\N
00040000-5658-0973-8f03-29c3c961871c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5658-0973-c9e2-518240712319	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5658-0973-0447-5c9aa9e064fc	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5658-0973-d3b6-85c57c11945c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5658-0973-fce3-79dd68fe65dc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5658-0973-d7bf-fc7d44561def	MX	MEX	484	Mexico 	Mehika	\N
00040000-5658-0973-3e17-3815799d310c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5658-0973-49c1-138c52962ac7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5658-0973-e9c3-b89dfa2ca30c	MC	MCO	492	Monaco 	Monako	\N
00040000-5658-0973-ed7f-33f3270b65e0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5658-0973-762b-3156ee286b58	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5658-0973-9813-550c22b9fdf8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5658-0973-1987-d53336b305eb	MA	MAR	504	Morocco 	Maroko	\N
00040000-5658-0973-c14d-70b616efb52c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5658-0973-401f-e4aa6982771d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5658-0973-dace-bca39c2be38c	NA	NAM	516	Namibia 	Namibija	\N
00040000-5658-0973-94b9-9754d137c35e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5658-0973-b093-bcaed66d876b	NP	NPL	524	Nepal 	Nepal	\N
00040000-5658-0973-8ff0-626acb0b7fe7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5658-0973-3e63-50d6673ebd7d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5658-0973-65df-3fa988bfc386	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5658-0973-52fe-ca62338c1e01	NE	NER	562	Niger 	Niger 	\N
00040000-5658-0973-2dd6-abb9fee9ca7a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5658-0973-3afc-fbdd359360bc	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5658-0973-52ae-3173e16200a0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5658-0973-d289-216ab7728d95	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5658-0973-c4d7-8b4c3cb4e439	NO	NOR	578	Norway 	Norveška	\N
00040000-5658-0973-ee3a-fbf7fd63189b	OM	OMN	512	Oman 	Oman	\N
00040000-5658-0973-0536-193f6ece66e3	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5658-0973-89bd-5a06a728088b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5658-0973-8e08-47089e90e7e4	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5658-0973-bba5-b79851590a35	PA	PAN	591	Panama 	Panama	\N
00040000-5658-0973-51e0-e98e7d1d4115	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5658-0973-1914-9f10e898bcf0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5658-0973-bc86-d19b2ef98948	PE	PER	604	Peru 	Peru	\N
00040000-5658-0973-91fd-671c292c1b1e	PH	PHL	608	Philippines 	Filipini	\N
00040000-5658-0973-2931-a4eaa875e922	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5658-0973-bb83-e394efec5cea	PL	POL	616	Poland 	Poljska	\N
00040000-5658-0973-adaa-f42298132080	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5658-0973-5d00-edb78057a4c4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5658-0973-e83d-0c6f9ff70cde	QA	QAT	634	Qatar 	Katar	\N
00040000-5658-0973-35ae-1daaa2f618df	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5658-0973-cc97-0a71d90b2eea	RO	ROU	642	Romania 	Romunija	\N
00040000-5658-0973-1143-20c1fe7f2d69	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5658-0973-6910-bc5fb389707d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5658-0973-493d-b7eeaa7d8316	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5658-0973-dabb-d9c95cd11b94	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5658-0973-ee91-04bfcb21245a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5658-0973-2395-2ed1a18e91eb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5658-0973-12f2-5d3e4cb4c689	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5658-0973-6061-297b6ba4de7f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5658-0973-6663-e71840f83101	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5658-0973-aab7-bdd965b86816	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5658-0973-c3b7-23abb440ffd2	SM	SMR	674	San Marino 	San Marino	\N
00040000-5658-0973-2773-af577cd8c1e6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5658-0973-439d-9166a79037c3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5658-0973-8526-1d9ff156cb8c	SN	SEN	686	Senegal 	Senegal	\N
00040000-5658-0973-2603-cf1910441d07	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5658-0973-1a22-75cd849402af	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5658-0973-c236-e1c6b1f13340	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5658-0973-211e-c2e621524400	SG	SGP	702	Singapore 	Singapur	\N
00040000-5658-0973-8c76-5c1d16b1a79f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5658-0973-97b8-0fa2b33f929c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5658-0973-771a-b3a28fb3f6d4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5658-0973-7f66-7a1944f22712	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5658-0973-428c-6a4a1f53ab67	SO	SOM	706	Somalia 	Somalija	\N
00040000-5658-0973-74f8-209eb27c673c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5658-0973-9ad5-ba24d3b7c2bd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5658-0973-9be9-88223500b241	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5658-0973-caad-4056f53ce80d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5658-0973-d388-6e17d8553653	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5658-0973-1ab0-e9ff909285e8	SD	SDN	729	Sudan 	Sudan	\N
00040000-5658-0973-3148-ff77ad008c92	SR	SUR	740	Suriname 	Surinam	\N
00040000-5658-0973-bc40-261026223a39	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5658-0973-2d7b-0fa63ca0e1f2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5658-0973-62ed-76df1c9625c5	SE	SWE	752	Sweden 	Švedska	\N
00040000-5658-0973-987d-1026e23180ae	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5658-0973-4fa0-7a894239617f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5658-0973-d5ea-dc36bafb6163	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5658-0973-f323-3f3627c02d63	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5658-0973-7679-f325713ce1f9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5658-0973-0719-01cd5107e868	TH	THA	764	Thailand 	Tajska	\N
00040000-5658-0973-877c-d3da08432a41	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5658-0973-6633-0de971bc4932	TG	TGO	768	Togo 	Togo	\N
00040000-5658-0973-4aab-aeea105c22c8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5658-0973-78c1-2ca7acc72633	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5658-0973-6820-73b82715a493	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5658-0973-8f5a-b720b2625ca4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5658-0973-e783-b93e8ea46d08	TR	TUR	792	Turkey 	Turčija	\N
00040000-5658-0973-f6ea-63894a9f1d45	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5658-0973-6dc1-aaa621a865bb	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5658-0973-c9ac-2030899d8e3a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5658-0973-24ce-949e45b680f0	UG	UGA	800	Uganda 	Uganda	\N
00040000-5658-0973-b432-a83d1a118026	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5658-0973-33c3-2a19dcdd0a30	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5658-0973-484b-5d45bd430b33	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5658-0973-90eb-3ed3f060a658	US	USA	840	United States 	Združene države Amerike	\N
00040000-5658-0973-79f0-eac3a529efd2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5658-0973-9f92-1cdf0a9fbef9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5658-0973-cf00-e55c4545a381	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5658-0973-4997-c7723b203820	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5658-0973-2a04-a8580d0bbce7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5658-0973-b5a7-2322f47818e8	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5658-0973-d532-2910171d256a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5658-0973-ced3-005066c0b079	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5658-0973-80d5-bdf2dc82b92c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5658-0973-452a-8461d2035001	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5658-0973-c80f-f7c143c8dcee	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5658-0973-48b6-aa2e6ade882e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5658-0973-ccf1-0090fb23cc38	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 29805879)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5658-0976-7cf6-0d71e8d530fd	000e0000-5658-0976-5432-c58afe6c1912	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5658-0973-7a36-66497aef7a86	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5658-0976-854c-c411b7ed6d07	000e0000-5658-0976-441b-1ea8cd5f298c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5658-0973-625f-6a104c5d5a67	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5658-0976-1f84-462ec12e82e6	000e0000-5658-0976-6341-0e39072bb001	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5658-0973-7a36-66497aef7a86	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5658-0976-18b9-4c1b53e15f8f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5658-0976-5b6e-7cb202890c51	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 29805680)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5658-0976-f83e-1fb28ffba8af	000e0000-5658-0976-441b-1ea8cd5f298c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5658-0973-333c-5d164090ff31
000d0000-5658-0976-1888-a42392cc4b51	000e0000-5658-0976-441b-1ea8cd5f298c	000c0000-5658-0976-e1fd-a1fe1f6fc0b5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5658-0973-333c-5d164090ff31
000d0000-5658-0976-2ae4-24d5cfe93560	000e0000-5658-0976-441b-1ea8cd5f298c	000c0000-5658-0976-8367-ae56f6ffcf22	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5658-0973-3956-8a440e801a7a
000d0000-5658-0976-5f80-925f13be5b1b	000e0000-5658-0976-441b-1ea8cd5f298c	000c0000-5658-0976-1353-d0f4f649d467	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5658-0973-3f7b-a30e6daaf866
000d0000-5658-0976-9bb0-6dd85f480dde	000e0000-5658-0976-441b-1ea8cd5f298c	000c0000-5658-0976-8f85-0fd2ec8a5038	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5658-0973-afa5-e7cf6be36453
000d0000-5658-0976-d085-3b99027dc963	000e0000-5658-0976-441b-1ea8cd5f298c	000c0000-5658-0976-b5cd-909f7fd75ecc	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5658-0973-afa5-e7cf6be36453
000d0000-5658-0976-9567-4192d1e9b008	000e0000-5658-0976-441b-1ea8cd5f298c	000c0000-5658-0976-c0a8-4d741241591a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5658-0973-333c-5d164090ff31
000d0000-5658-0976-04cd-20cd718c4e03	000e0000-5658-0976-441b-1ea8cd5f298c	000c0000-5658-0976-a228-a554a364eb0f	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5658-0973-8b37-a7ba68146ca6
000d0000-5658-0976-b1de-066dcd54b4e4	000e0000-5658-0976-441b-1ea8cd5f298c	000c0000-5658-0976-aa80-f98f12df1c17	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5658-0973-cd9c-24283cbab5f9
\.


--
-- TOC entry 3122 (class 0 OID 29805471)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 29805437)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 29805414)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5658-0975-bc7d-79ff3b80f344	00080000-5658-0975-1408-c88a31d0a521	00090000-5658-0975-c8d9-a16daa7954e5	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 29805594)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 29806137)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5658-0975-9dd6-27a28312f5a8	00010000-5658-0974-d76e-3fe3efb7028b	\N	Prva mapa	Root mapa	2015-11-27 08:42:45	2015-11-27 08:42:45	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 29806150)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 29806172)
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
-- TOC entry 3138 (class 0 OID 29805619)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 29805371)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5658-0974-7624-4b1c3664bfca	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5658-0974-f803-fcaf72a0456c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5658-0974-8443-5176c5aaf9d0	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5658-0974-80ac-a04734fad721	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5658-0974-5074-383f3a68b6cb	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5658-0974-ffa5-471ec5040ccb	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5658-0974-c68a-5f1c41204442	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5658-0974-1ac6-ba51ab943ad8	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5658-0974-1e53-14b4f9d6e1bd	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5658-0974-39f1-b213bc1e3b08	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5658-0974-7a45-57045149adfc	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5658-0974-3f93-f3f9193e60d3	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5658-0974-44f0-787daf4c54fd	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5658-0974-5f35-fa0477c4dc43	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5658-0975-e8c8-039769d7a96c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5658-0975-c998-b7d30ed2fdef	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5658-0975-e1df-3dcaec92903e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5658-0975-ea36-c7718e695736	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5658-0975-14bc-3a41f420d675	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5658-0977-7f98-fa89237af02c	application.tenant.maticnopodjetje	string	s:36:"00080000-5658-0977-8f0b-80c13a9e312f";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 29805271)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5658-0975-d5ee-1d1542807fb0	00000000-5658-0975-e8c8-039769d7a96c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5658-0975-34df-53ae99b41c48	00000000-5658-0975-e8c8-039769d7a96c	00010000-5658-0974-d76e-3fe3efb7028b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5658-0975-55e2-500daf91f908	00000000-5658-0975-c998-b7d30ed2fdef	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 29805338)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5658-0975-a70b-155c259493b3	\N	00100000-5658-0975-e3df-d76140433723	00100000-5658-0975-a3c4-c247fa4d3cae	01	Gledališče Nimbis
00410000-5658-0975-5266-8150b22f70fb	00410000-5658-0975-a70b-155c259493b3	00100000-5658-0975-e3df-d76140433723	00100000-5658-0975-a3c4-c247fa4d3cae	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 29805282)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5658-0975-b854-d461d2ec256f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5658-0975-e63a-ea582b8a13f7	00010000-5658-0975-1408-9e9d492a5d55	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5658-0975-2e6d-078fe4591b7f	00010000-5658-0975-0eeb-acea8071f10f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5658-0975-0e44-15475be1797d	00010000-5658-0975-03d2-ecbba09220c4	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5658-0975-529e-104bff8843f0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5658-0975-d6e6-994f79534e5a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5658-0975-e655-38890ae62ea7	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5658-0975-6989-ed81a5ad388d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5658-0975-c8d9-a16daa7954e5	00010000-5658-0975-2d60-5c8a4eb7041e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5658-0975-0e9b-2ba56ee774f9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5658-0975-90be-3d36312ef24a	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5658-0975-e940-9855853f6cd5	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5658-0975-e690-546b60cab80d	00010000-5658-0975-a6c7-f768f7e27fb4	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5658-0975-0303-9ae4d665c035	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-0975-226a-68f864aad018	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-0975-7ccd-9ad5b94b1123	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-0975-411b-47cd1d999ed0	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5658-0975-05c1-19b72b658579	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5658-0975-6d80-0e6ad9cb4804	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-0975-755c-02353a4dc4cc	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-0975-27a0-ff10c1b727e6	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 29805217)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5658-0973-aad7-07156fd78a69	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5658-0973-4f85-faffae916bb8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5658-0973-56be-220d9137f9aa	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5658-0973-b50c-031439710b81	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5658-0973-b5f0-dc8b06f2c84c	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5658-0973-295a-c71ce8578979	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5658-0973-d7f6-3be1374b8c7f	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5658-0973-108d-1ea551b0b120	Abonma-read	Abonma - branje	t
00030000-5658-0973-ad9c-ae60f63e68cf	Abonma-write	Abonma - spreminjanje	t
00030000-5658-0973-d460-3431eb91a087	Alternacija-read	Alternacija - branje	t
00030000-5658-0973-8e6b-72e479809399	Alternacija-write	Alternacija - spreminjanje	t
00030000-5658-0973-8b97-e2b24041163e	Arhivalija-read	Arhivalija - branje	t
00030000-5658-0973-e09a-57b746215514	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5658-0973-f89a-edc0b3fab461	AuthStorage-read	AuthStorage - branje	t
00030000-5658-0973-3597-f9d2cd82fe0a	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5658-0973-f0b9-0f53fb1c092e	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5658-0973-f25f-8e0859b3f339	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5658-0973-6ae3-64d12122ed82	Besedilo-read	Besedilo - branje	t
00030000-5658-0973-edf7-351f4cd08cba	Besedilo-write	Besedilo - spreminjanje	t
00030000-5658-0973-8321-c14dfcec8cd9	Dogodek-read	Dogodek - branje	t
00030000-5658-0973-b18b-f5e194e7c469	Dogodek-write	Dogodek - spreminjanje	t
00030000-5658-0973-ecbb-b07bf78ab266	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5658-0973-7ac9-2865c4f93d3a	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5658-0973-d409-c04a983a0d6b	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5658-0973-c9eb-fa025ec5f24b	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5658-0973-a408-67e0f3cac8c7	DogodekTrait-read	DogodekTrait - branje	t
00030000-5658-0973-8ba6-42b31f300d7e	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5658-0973-2fda-a93cafe34aec	DrugiVir-read	DrugiVir - branje	t
00030000-5658-0973-0da9-b52405a18781	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5658-0973-d88b-53ac15036319	Drzava-read	Drzava - branje	t
00030000-5658-0973-f1ac-dd7b21065c01	Drzava-write	Drzava - spreminjanje	t
00030000-5658-0973-8cc3-1c2f8a5383a2	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5658-0973-6570-a72fefea8bca	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5658-0973-ac43-b428e2e032de	Funkcija-read	Funkcija - branje	t
00030000-5658-0973-42fd-891efa540496	Funkcija-write	Funkcija - spreminjanje	t
00030000-5658-0973-9c8d-26e640886dc3	Gostovanje-read	Gostovanje - branje	t
00030000-5658-0973-0ee9-dc4dcf3c315b	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5658-0973-bdf8-bb1f48c1dbb4	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5658-0973-4b16-1bd4f9fbf96b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5658-0973-f490-44ca5ad001d3	Kupec-read	Kupec - branje	t
00030000-5658-0973-39ab-3a8351e70276	Kupec-write	Kupec - spreminjanje	t
00030000-5658-0973-7c6a-139803dda736	NacinPlacina-read	NacinPlacina - branje	t
00030000-5658-0973-4a5e-21e6bdc8fd04	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5658-0973-bfed-8f1a2b50cac0	Option-read	Option - branje	t
00030000-5658-0973-f904-a984ba0a7909	Option-write	Option - spreminjanje	t
00030000-5658-0973-3b53-d9c8190af2b5	OptionValue-read	OptionValue - branje	t
00030000-5658-0973-33b7-0497e08b40b0	OptionValue-write	OptionValue - spreminjanje	t
00030000-5658-0973-a06b-81145f149565	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5658-0973-e23f-781957d2121b	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5658-0973-1cfe-1fc2411d78a7	Oseba-read	Oseba - branje	t
00030000-5658-0973-f466-67b24b50a8a2	Oseba-write	Oseba - spreminjanje	t
00030000-5658-0973-4dd9-efd0b15f5c2f	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5658-0973-d483-d17b6b332e50	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5658-0973-fa24-0891f138e618	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5658-0973-cb66-678b8af172d2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5658-0973-fac9-d9f3b3239bb5	Pogodba-read	Pogodba - branje	t
00030000-5658-0973-303c-849d21c7efd9	Pogodba-write	Pogodba - spreminjanje	t
00030000-5658-0973-e517-fa8cd5c12af2	Popa-read	Popa - branje	t
00030000-5658-0973-3d92-19c084b85389	Popa-write	Popa - spreminjanje	t
00030000-5658-0973-affe-fff629d41ef9	Posta-read	Posta - branje	t
00030000-5658-0973-a539-22b33ab5c0fc	Posta-write	Posta - spreminjanje	t
00030000-5658-0973-4c9e-82e2efa5b170	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5658-0973-279e-61a4c4171957	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5658-0973-4d67-1b3047ea9f59	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5658-0973-a1e3-8812347d536d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5658-0973-2442-0673f19e3967	PostniNaslov-read	PostniNaslov - branje	t
00030000-5658-0973-d5f1-8992f7536d38	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5658-0973-af2f-8ebb188b32dc	Praznik-read	Praznik - branje	t
00030000-5658-0973-b152-43726fa9977b	Praznik-write	Praznik - spreminjanje	t
00030000-5658-0973-7eb4-ee6e9bbfd084	Predstava-read	Predstava - branje	t
00030000-5658-0973-15a9-a558c2a0c271	Predstava-write	Predstava - spreminjanje	t
00030000-5658-0973-4557-ad4a509bf992	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5658-0973-5739-848335208918	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5658-0973-5f83-638667d16fd5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5658-0973-9f4f-ff460d3df419	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5658-0973-ad2f-ee744769d2a3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5658-0973-90b2-9ae74febfd72	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5658-0973-b4a9-9b4857374532	ProgramDela-read	ProgramDela - branje	t
00030000-5658-0973-2d2f-1ee6c0a1bae8	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5658-0973-d71b-bc0b227a9a35	ProgramFestival-read	ProgramFestival - branje	t
00030000-5658-0973-474d-1bce2ad2bab3	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5658-0973-2b1a-d571a86a7c24	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5658-0973-c1b5-964c577d1e2b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5658-0973-96a7-6dd49b496a40	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5658-0973-7f59-13840a078833	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5658-0973-e6d3-7ff205760ced	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5658-0973-ba32-98da989e2be6	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5658-0973-a21d-d99760e2fcf3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5658-0973-22b8-8c7ee8d3b075	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5658-0973-c5c6-e1adcdcf3c88	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5658-0973-d47c-59153a0b42ba	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5658-0973-3c8a-352409052eda	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5658-0973-dd07-c77657bf2f7e	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5658-0973-338c-41d0781c2285	ProgramRazno-read	ProgramRazno - branje	t
00030000-5658-0973-efe9-780941b6228d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5658-0973-5ffe-6debab3e583f	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5658-0973-ecf3-6efa5a7c048e	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5658-0973-e031-0a3c1c438e5b	Prostor-read	Prostor - branje	t
00030000-5658-0973-b9c2-55557adca699	Prostor-write	Prostor - spreminjanje	t
00030000-5658-0973-3cec-6849e4b29f03	Racun-read	Racun - branje	t
00030000-5658-0973-e8d6-2be45c9f1c28	Racun-write	Racun - spreminjanje	t
00030000-5658-0973-a986-0b6272ebcd28	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5658-0973-e7d5-24a8e5d2a3c5	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5658-0973-1206-63e8b1ca3316	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5658-0973-a490-2fd8a2cd6aad	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5658-0973-94ab-78196e34a884	Rekvizit-read	Rekvizit - branje	t
00030000-5658-0973-2fe5-6ed836032fd5	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5658-0973-ee09-565ff701b3e9	Revizija-read	Revizija - branje	t
00030000-5658-0973-8897-9dab7c24bfca	Revizija-write	Revizija - spreminjanje	t
00030000-5658-0973-7f5b-2c8565d1ef4f	Rezervacija-read	Rezervacija - branje	t
00030000-5658-0973-d3cf-37c4181dbf12	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5658-0973-0a46-a14fa833c4ab	SedezniRed-read	SedezniRed - branje	t
00030000-5658-0973-7723-9575cf66a322	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5658-0973-ea96-e2ebc56701b9	Sedez-read	Sedez - branje	t
00030000-5658-0973-acea-72637034e2a9	Sedez-write	Sedez - spreminjanje	t
00030000-5658-0973-c33d-59d7fff4e8a0	Sezona-read	Sezona - branje	t
00030000-5658-0973-4991-8c90df15170a	Sezona-write	Sezona - spreminjanje	t
00030000-5658-0973-5d55-f9887c174af8	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5658-0973-7584-b0c852827139	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5658-0973-f6e5-fc4d18501643	Stevilcenje-read	Stevilcenje - branje	t
00030000-5658-0973-7ee5-bd6525f467a3	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5658-0973-2cd9-a73b7c45fb37	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5658-0973-39d7-370f2c37b613	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5658-0973-394b-13d0b3590a75	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5658-0973-7486-34ff29952dfd	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5658-0973-538b-228e0317c343	Telefonska-read	Telefonska - branje	t
00030000-5658-0973-996c-f8163f3135cd	Telefonska-write	Telefonska - spreminjanje	t
00030000-5658-0973-7ac1-937495ff8483	TerminStoritve-read	TerminStoritve - branje	t
00030000-5658-0973-6de1-28455d343b43	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5658-0973-2261-aac8c44ef234	TipFunkcije-read	TipFunkcije - branje	t
00030000-5658-0973-d013-1009a8c49edf	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5658-0973-deff-c0e33da5d118	TipPopa-read	TipPopa - branje	t
00030000-5658-0973-3b01-7b0975b7a822	TipPopa-write	TipPopa - spreminjanje	t
00030000-5658-0973-e418-e87a5d972f9d	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5658-0973-f173-f4ae680521a7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5658-0973-1716-6f1932ed8d96	TipVaje-read	TipVaje - branje	t
00030000-5658-0973-b1a9-62d02cd5d311	TipVaje-write	TipVaje - spreminjanje	t
00030000-5658-0973-ab4e-fc85498705ea	Trr-read	Trr - branje	t
00030000-5658-0973-7684-5a7252a2e06b	Trr-write	Trr - spreminjanje	t
00030000-5658-0973-9daa-938c17449abc	Uprizoritev-read	Uprizoritev - branje	t
00030000-5658-0973-59af-d2cf33ab7763	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5658-0973-4a52-6dde1960bfb7	Vaja-read	Vaja - branje	t
00030000-5658-0973-b3be-f5670f27ecbd	Vaja-write	Vaja - spreminjanje	t
00030000-5658-0973-0ddb-2e7b20bb6d82	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5658-0973-0524-d9ab5515e087	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5658-0973-049e-7dfb2ce6d933	VrstaStroska-read	VrstaStroska - branje	t
00030000-5658-0973-3629-844d3c79124f	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5658-0973-9ec7-13939d44b174	Zaposlitev-read	Zaposlitev - branje	t
00030000-5658-0973-da25-b842cdfb51b7	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5658-0973-e57c-38752cd26267	Zasedenost-read	Zasedenost - branje	t
00030000-5658-0973-9417-a4fe2ee940da	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5658-0973-d793-df0752ed798d	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5658-0973-64af-19d1a2a8beb3	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5658-0973-ab7f-40344ad18135	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5658-0973-015f-ab4478eaa0d1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5658-0973-2556-05e52fb31a24	Job-read	Branje opravil - samo zase - branje	t
00030000-5658-0973-7d93-d46073213ca4	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5658-0973-cd23-47a91a24babd	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5658-0973-8adc-2f457a1e2ecc	Report-read	Report - branje	t
00030000-5658-0973-a65d-527583497d0e	Report-write	Report - spreminjanje	t
00030000-5658-0973-93ef-554782d544c4	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5658-0973-1842-f1ebe0b6987c	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5658-0973-6bec-469360b3c99b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5658-0973-d3ac-76dc72705040	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5658-0973-bf7d-8589bf43023f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5658-0973-b066-120a02e445e8	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5658-0973-0d01-2173fb779865	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5658-0973-b85e-415c8314dc30	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5658-0973-467c-ee349dcf2d55	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5658-0973-aeef-1bb0e62a3016	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5658-0973-e229-0f70ef8e6f79	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5658-0973-c20f-1a93ad158e1e	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5658-0973-89f8-1a0b87b6c009	Datoteka-write	Datoteka - spreminjanje	t
00030000-5658-0973-8216-6d127a240392	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 29805236)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5658-0973-5e3a-ceb84ab9bf7e	00030000-5658-0973-4f85-faffae916bb8
00020000-5658-0973-18bc-5b801ad5ab01	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-108d-1ea551b0b120
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-ad9c-ae60f63e68cf
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-d460-3431eb91a087
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-8e6b-72e479809399
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-8b97-e2b24041163e
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-8321-c14dfcec8cd9
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-b50c-031439710b81
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-b18b-f5e194e7c469
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-f1ac-dd7b21065c01
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-ac43-b428e2e032de
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-42fd-891efa540496
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-9c8d-26e640886dc3
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-0ee9-dc4dcf3c315b
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-bdf8-bb1f48c1dbb4
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-4b16-1bd4f9fbf96b
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-bfed-8f1a2b50cac0
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-3b53-d9c8190af2b5
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-1cfe-1fc2411d78a7
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-f466-67b24b50a8a2
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-3d92-19c084b85389
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-affe-fff629d41ef9
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-a539-22b33ab5c0fc
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-2442-0673f19e3967
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-d5f1-8992f7536d38
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-7eb4-ee6e9bbfd084
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-15a9-a558c2a0c271
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-ad2f-ee744769d2a3
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-90b2-9ae74febfd72
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-e031-0a3c1c438e5b
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-b9c2-55557adca699
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-1206-63e8b1ca3316
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-a490-2fd8a2cd6aad
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-94ab-78196e34a884
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-2fe5-6ed836032fd5
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-c33d-59d7fff4e8a0
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-4991-8c90df15170a
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-2261-aac8c44ef234
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-9daa-938c17449abc
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-59af-d2cf33ab7763
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-4a52-6dde1960bfb7
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-b3be-f5670f27ecbd
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-e57c-38752cd26267
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-9417-a4fe2ee940da
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-d793-df0752ed798d
00020000-5658-0973-c820-f513a4d00d73	00030000-5658-0973-ab7f-40344ad18135
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-108d-1ea551b0b120
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-8b97-e2b24041163e
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-8321-c14dfcec8cd9
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-9c8d-26e640886dc3
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-bdf8-bb1f48c1dbb4
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-4b16-1bd4f9fbf96b
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-bfed-8f1a2b50cac0
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-3b53-d9c8190af2b5
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-1cfe-1fc2411d78a7
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-f466-67b24b50a8a2
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-affe-fff629d41ef9
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-2442-0673f19e3967
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-d5f1-8992f7536d38
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-7eb4-ee6e9bbfd084
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-e031-0a3c1c438e5b
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-1206-63e8b1ca3316
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-94ab-78196e34a884
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-c33d-59d7fff4e8a0
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-538b-228e0317c343
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-996c-f8163f3135cd
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-ab4e-fc85498705ea
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-7684-5a7252a2e06b
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-9ec7-13939d44b174
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-da25-b842cdfb51b7
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-d793-df0752ed798d
00020000-5658-0973-8d33-0125896e10f8	00030000-5658-0973-ab7f-40344ad18135
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-108d-1ea551b0b120
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-d460-3431eb91a087
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-8b97-e2b24041163e
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-e09a-57b746215514
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-6ae3-64d12122ed82
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-ecbb-b07bf78ab266
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-8321-c14dfcec8cd9
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-ac43-b428e2e032de
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-9c8d-26e640886dc3
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-bdf8-bb1f48c1dbb4
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-bfed-8f1a2b50cac0
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-3b53-d9c8190af2b5
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-1cfe-1fc2411d78a7
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-affe-fff629d41ef9
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-7eb4-ee6e9bbfd084
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-ad2f-ee744769d2a3
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-e031-0a3c1c438e5b
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-1206-63e8b1ca3316
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-94ab-78196e34a884
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-c33d-59d7fff4e8a0
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-2261-aac8c44ef234
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-4a52-6dde1960bfb7
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-e57c-38752cd26267
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-d793-df0752ed798d
00020000-5658-0973-641f-960c49a5222d	00030000-5658-0973-ab7f-40344ad18135
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-108d-1ea551b0b120
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-ad9c-ae60f63e68cf
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-8e6b-72e479809399
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-8b97-e2b24041163e
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-8321-c14dfcec8cd9
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-9c8d-26e640886dc3
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-bfed-8f1a2b50cac0
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-3b53-d9c8190af2b5
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-affe-fff629d41ef9
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-7eb4-ee6e9bbfd084
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-e031-0a3c1c438e5b
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-1206-63e8b1ca3316
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-94ab-78196e34a884
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-c33d-59d7fff4e8a0
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-2261-aac8c44ef234
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-d793-df0752ed798d
00020000-5658-0973-114e-aa7b78870be5	00030000-5658-0973-ab7f-40344ad18135
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-108d-1ea551b0b120
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-8b97-e2b24041163e
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-8321-c14dfcec8cd9
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-9c8d-26e640886dc3
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-bfed-8f1a2b50cac0
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-3b53-d9c8190af2b5
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-affe-fff629d41ef9
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-7eb4-ee6e9bbfd084
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-e031-0a3c1c438e5b
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-1206-63e8b1ca3316
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-94ab-78196e34a884
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-c33d-59d7fff4e8a0
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-7ac1-937495ff8483
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-56be-220d9137f9aa
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-2261-aac8c44ef234
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-d793-df0752ed798d
00020000-5658-0973-edf1-020ebdd48c5d	00030000-5658-0973-ab7f-40344ad18135
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-aad7-07156fd78a69
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-4f85-faffae916bb8
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-108d-1ea551b0b120
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ad9c-ae60f63e68cf
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d460-3431eb91a087
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-8e6b-72e479809399
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-8b97-e2b24041163e
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e09a-57b746215514
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-f89a-edc0b3fab461
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-3597-f9d2cd82fe0a
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-f0b9-0f53fb1c092e
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-f25f-8e0859b3f339
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-6ae3-64d12122ed82
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-edf7-351f4cd08cba
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-89f8-1a0b87b6c009
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-8321-c14dfcec8cd9
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b50c-031439710b81
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b18b-f5e194e7c469
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ecbb-b07bf78ab266
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7ac9-2865c4f93d3a
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d409-c04a983a0d6b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-c9eb-fa025ec5f24b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-2fda-a93cafe34aec
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-0da9-b52405a18781
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-f1ac-dd7b21065c01
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-8cc3-1c2f8a5383a2
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-6570-a72fefea8bca
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ac43-b428e2e032de
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-42fd-891efa540496
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-9c8d-26e640886dc3
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-0ee9-dc4dcf3c315b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-cd23-47a91a24babd
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-2556-05e52fb31a24
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7d93-d46073213ca4
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-bdf8-bb1f48c1dbb4
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-4b16-1bd4f9fbf96b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-f490-44ca5ad001d3
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-39ab-3a8351e70276
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-93ef-554782d544c4
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-1842-f1ebe0b6987c
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-6bec-469360b3c99b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d3ac-76dc72705040
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b066-120a02e445e8
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-bf7d-8589bf43023f
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7c6a-139803dda736
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-4a5e-21e6bdc8fd04
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-bfed-8f1a2b50cac0
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-f904-a984ba0a7909
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-3b53-d9c8190af2b5
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-33b7-0497e08b40b0
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-a06b-81145f149565
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e23f-781957d2121b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-1cfe-1fc2411d78a7
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b5f0-dc8b06f2c84c
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-f466-67b24b50a8a2
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-4dd9-efd0b15f5c2f
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d483-d17b6b332e50
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-fa24-0891f138e618
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-cb66-678b8af172d2
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-fac9-d9f3b3239bb5
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-303c-849d21c7efd9
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-3d92-19c084b85389
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-affe-fff629d41ef9
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-a539-22b33ab5c0fc
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-4c9e-82e2efa5b170
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-279e-61a4c4171957
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-4d67-1b3047ea9f59
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-a1e3-8812347d536d
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-2442-0673f19e3967
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d5f1-8992f7536d38
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-af2f-8ebb188b32dc
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b152-43726fa9977b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7eb4-ee6e9bbfd084
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-15a9-a558c2a0c271
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-4557-ad4a509bf992
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-5739-848335208918
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-5f83-638667d16fd5
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-9f4f-ff460d3df419
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ad2f-ee744769d2a3
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-90b2-9ae74febfd72
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-295a-c71ce8578979
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b4a9-9b4857374532
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d7f6-3be1374b8c7f
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-2d2f-1ee6c0a1bae8
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d71b-bc0b227a9a35
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-474d-1bce2ad2bab3
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-2b1a-d571a86a7c24
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-c1b5-964c577d1e2b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-96a7-6dd49b496a40
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7f59-13840a078833
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e6d3-7ff205760ced
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ba32-98da989e2be6
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-a21d-d99760e2fcf3
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-22b8-8c7ee8d3b075
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-c5c6-e1adcdcf3c88
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d47c-59153a0b42ba
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-3c8a-352409052eda
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-dd07-c77657bf2f7e
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-338c-41d0781c2285
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-efe9-780941b6228d
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-5ffe-6debab3e583f
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ecf3-6efa5a7c048e
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e031-0a3c1c438e5b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b9c2-55557adca699
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-3cec-6849e4b29f03
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e8d6-2be45c9f1c28
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-a986-0b6272ebcd28
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e7d5-24a8e5d2a3c5
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-94ab-78196e34a884
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-2fe5-6ed836032fd5
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-1206-63e8b1ca3316
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-a490-2fd8a2cd6aad
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-8adc-2f457a1e2ecc
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-a65d-527583497d0e
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ee09-565ff701b3e9
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-8897-9dab7c24bfca
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7f5b-2c8565d1ef4f
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d3cf-37c4181dbf12
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ea96-e2ebc56701b9
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-acea-72637034e2a9
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-0a46-a14fa833c4ab
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7723-9575cf66a322
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-c33d-59d7fff4e8a0
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-4991-8c90df15170a
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-f6e5-fc4d18501643
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7ee5-bd6525f467a3
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-5d55-f9887c174af8
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7584-b0c852827139
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-2cd9-a73b7c45fb37
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-39d7-370f2c37b613
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-394b-13d0b3590a75
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7486-34ff29952dfd
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-538b-228e0317c343
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-996c-f8163f3135cd
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7ac1-937495ff8483
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-56be-220d9137f9aa
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-6de1-28455d343b43
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-2261-aac8c44ef234
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d013-1009a8c49edf
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-deff-c0e33da5d118
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-3b01-7b0975b7a822
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e418-e87a5d972f9d
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-f173-f4ae680521a7
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-1716-6f1932ed8d96
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b1a9-62d02cd5d311
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ab4e-fc85498705ea
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-7684-5a7252a2e06b
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-9daa-938c17449abc
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-59af-d2cf33ab7763
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-4a52-6dde1960bfb7
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b3be-f5670f27ecbd
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-0ddb-2e7b20bb6d82
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-0524-d9ab5515e087
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-049e-7dfb2ce6d933
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-3629-844d3c79124f
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-c20f-1a93ad158e1e
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e229-0f70ef8e6f79
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-0d01-2173fb779865
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-aeef-1bb0e62a3016
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-467c-ee349dcf2d55
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-9ec7-13939d44b174
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-da25-b842cdfb51b7
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-e57c-38752cd26267
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-9417-a4fe2ee940da
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-d793-df0752ed798d
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-64af-19d1a2a8beb3
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-ab7f-40344ad18135
00020000-5658-0975-1146-0c319ca59a3c	00030000-5658-0973-015f-ab4478eaa0d1
00020000-5658-0975-802c-67eca76ce3a9	00030000-5658-0973-aeef-1bb0e62a3016
00020000-5658-0975-ff8e-ee474474d5e3	00030000-5658-0973-467c-ee349dcf2d55
00020000-5658-0975-2409-8f97c8d80103	00030000-5658-0973-59af-d2cf33ab7763
00020000-5658-0975-c698-23e4f7dccfe8	00030000-5658-0973-9daa-938c17449abc
00020000-5658-0975-3ca4-e98b9c8984c9	00030000-5658-0973-1842-f1ebe0b6987c
00020000-5658-0975-7b35-a5b5dea70b9b	00030000-5658-0973-6bec-469360b3c99b
00020000-5658-0975-a328-cd89be7a1291	00030000-5658-0973-d3ac-76dc72705040
00020000-5658-0975-2c48-54a12afc2d79	00030000-5658-0973-93ef-554782d544c4
00020000-5658-0975-cacd-1aea9cda8bab	00030000-5658-0973-b066-120a02e445e8
00020000-5658-0975-3a0d-e327d7fd634e	00030000-5658-0973-bf7d-8589bf43023f
00020000-5658-0975-9b5e-8c2ee82ae860	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-b6ae-3223908e710b	00030000-5658-0973-0d01-2173fb779865
00020000-5658-0975-9b00-bbddc884fc7f	00030000-5658-0973-f466-67b24b50a8a2
00020000-5658-0975-abec-cb6fa2530419	00030000-5658-0973-1cfe-1fc2411d78a7
00020000-5658-0975-ab17-bbf473c7f659	00030000-5658-0973-89f8-1a0b87b6c009
00020000-5658-0975-8d7b-98f404f14d81	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-16f1-840a48ce7aa4	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0975-16f1-840a48ce7aa4	00030000-5658-0973-3d92-19c084b85389
00020000-5658-0975-16f1-840a48ce7aa4	00030000-5658-0973-9daa-938c17449abc
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-f25f-8e0859b3f339
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-edf7-351f4cd08cba
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-89f8-1a0b87b6c009
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-0d01-2173fb779865
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-467c-ee349dcf2d55
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-f0b9-0f53fb1c092e
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-6ae3-64d12122ed82
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-1cfe-1fc2411d78a7
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-c355-cea5edc088dc	00030000-5658-0973-aeef-1bb0e62a3016
00020000-5658-0975-d748-64e64d5cc4e4	00030000-5658-0973-f0b9-0f53fb1c092e
00020000-5658-0975-d748-64e64d5cc4e4	00030000-5658-0973-6ae3-64d12122ed82
00020000-5658-0975-d748-64e64d5cc4e4	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-d748-64e64d5cc4e4	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-d748-64e64d5cc4e4	00030000-5658-0973-aeef-1bb0e62a3016
00020000-5658-0975-a9e5-efcf50deb26e	00030000-5658-0973-1cfe-1fc2411d78a7
00020000-5658-0975-a9e5-efcf50deb26e	00030000-5658-0973-9ec7-13939d44b174
00020000-5658-0975-a9e5-efcf50deb26e	00030000-5658-0973-da25-b842cdfb51b7
00020000-5658-0975-a9e5-efcf50deb26e	00030000-5658-0973-a06b-81145f149565
00020000-5658-0975-bfea-892bd0f4b1cd	00030000-5658-0973-9ec7-13939d44b174
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-538b-228e0317c343
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-2442-0673f19e3967
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-1cfe-1fc2411d78a7
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-ab4e-fc85498705ea
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-aeef-1bb0e62a3016
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-bdf8-bb1f48c1dbb4
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-ad2f-ee744769d2a3
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-996c-f8163f3135cd
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-d5f1-8992f7536d38
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-0d01-2173fb779865
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-7684-5a7252a2e06b
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-3d92-19c084b85389
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-89f8-1a0b87b6c009
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-467c-ee349dcf2d55
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-4b16-1bd4f9fbf96b
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-90b2-9ae74febfd72
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0975-ac2b-5033d4a07e29	00030000-5658-0973-deff-c0e33da5d118
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-538b-228e0317c343
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-2442-0673f19e3967
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-ab4e-fc85498705ea
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-aeef-1bb0e62a3016
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-bdf8-bb1f48c1dbb4
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-ad2f-ee744769d2a3
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0975-8086-fa153b26cd8a	00030000-5658-0973-deff-c0e33da5d118
00020000-5658-0975-7de2-9096c2bee57f	00030000-5658-0973-deff-c0e33da5d118
00020000-5658-0975-7de2-9096c2bee57f	00030000-5658-0973-3b01-7b0975b7a822
00020000-5658-0975-39ea-e115bd0637bb	00030000-5658-0973-deff-c0e33da5d118
00020000-5658-0975-46e9-4d17d2250f71	00030000-5658-0973-affe-fff629d41ef9
00020000-5658-0975-46e9-4d17d2250f71	00030000-5658-0973-a539-22b33ab5c0fc
00020000-5658-0975-5672-9c3f0f97d42e	00030000-5658-0973-affe-fff629d41ef9
00020000-5658-0975-ec12-648d3a2dd7ca	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0975-ec12-648d3a2dd7ca	00030000-5658-0973-f1ac-dd7b21065c01
00020000-5658-0975-6a1c-a1a4025b4abd	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0975-ad33-14a871424473	00030000-5658-0973-ab7f-40344ad18135
00020000-5658-0975-ad33-14a871424473	00030000-5658-0973-015f-ab4478eaa0d1
00020000-5658-0975-8054-d887f32ec95a	00030000-5658-0973-ab7f-40344ad18135
00020000-5658-0975-df04-1ed85c806a36	00030000-5658-0973-d793-df0752ed798d
00020000-5658-0975-df04-1ed85c806a36	00030000-5658-0973-64af-19d1a2a8beb3
00020000-5658-0975-60f0-5e65e349273d	00030000-5658-0973-d793-df0752ed798d
00020000-5658-0975-17aa-a3d20e96f5cd	00030000-5658-0973-108d-1ea551b0b120
00020000-5658-0975-17aa-a3d20e96f5cd	00030000-5658-0973-ad9c-ae60f63e68cf
00020000-5658-0975-a65e-32030683ce72	00030000-5658-0973-108d-1ea551b0b120
00020000-5658-0975-e5c9-09785149bd0b	00030000-5658-0973-e031-0a3c1c438e5b
00020000-5658-0975-e5c9-09785149bd0b	00030000-5658-0973-b9c2-55557adca699
00020000-5658-0975-e5c9-09785149bd0b	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0975-e5c9-09785149bd0b	00030000-5658-0973-2442-0673f19e3967
00020000-5658-0975-e5c9-09785149bd0b	00030000-5658-0973-d5f1-8992f7536d38
00020000-5658-0975-e5c9-09785149bd0b	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0975-e09b-e49767921f87	00030000-5658-0973-e031-0a3c1c438e5b
00020000-5658-0975-e09b-e49767921f87	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0975-e09b-e49767921f87	00030000-5658-0973-2442-0673f19e3967
00020000-5658-0975-b89a-c7f672ebe459	00030000-5658-0973-049e-7dfb2ce6d933
00020000-5658-0975-b89a-c7f672ebe459	00030000-5658-0973-3629-844d3c79124f
00020000-5658-0975-b788-604022a0e797	00030000-5658-0973-049e-7dfb2ce6d933
00020000-5658-0975-c139-b08bc9f313a2	00030000-5658-0973-e23f-781957d2121b
00020000-5658-0975-c139-b08bc9f313a2	00030000-5658-0973-a06b-81145f149565
00020000-5658-0975-c139-b08bc9f313a2	00030000-5658-0973-89f8-1a0b87b6c009
00020000-5658-0975-c139-b08bc9f313a2	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-c139-b08bc9f313a2	00030000-5658-0973-0d01-2173fb779865
00020000-5658-0975-c139-b08bc9f313a2	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-c139-b08bc9f313a2	00030000-5658-0973-467c-ee349dcf2d55
00020000-5658-0975-c139-b08bc9f313a2	00030000-5658-0973-aeef-1bb0e62a3016
00020000-5658-0975-49f1-cbf1640df21c	00030000-5658-0973-a06b-81145f149565
00020000-5658-0975-49f1-cbf1640df21c	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-49f1-cbf1640df21c	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-49f1-cbf1640df21c	00030000-5658-0973-aeef-1bb0e62a3016
00020000-5658-0975-0a52-bf5d28ce649d	00030000-5658-0973-1716-6f1932ed8d96
00020000-5658-0975-0a52-bf5d28ce649d	00030000-5658-0973-b1a9-62d02cd5d311
00020000-5658-0975-43e9-28560ccaea2b	00030000-5658-0973-1716-6f1932ed8d96
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-295a-c71ce8578979
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-d7f6-3be1374b8c7f
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-b4a9-9b4857374532
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-2d2f-1ee6c0a1bae8
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-d71b-bc0b227a9a35
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-474d-1bce2ad2bab3
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-2b1a-d571a86a7c24
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-c1b5-964c577d1e2b
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-96a7-6dd49b496a40
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-7f59-13840a078833
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-e6d3-7ff205760ced
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-ba32-98da989e2be6
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-a21d-d99760e2fcf3
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-22b8-8c7ee8d3b075
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-c5c6-e1adcdcf3c88
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-d47c-59153a0b42ba
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-3c8a-352409052eda
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-dd07-c77657bf2f7e
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-338c-41d0781c2285
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-efe9-780941b6228d
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-5ffe-6debab3e583f
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-ecf3-6efa5a7c048e
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-9f4f-ff460d3df419
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-0da9-b52405a18781
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-279e-61a4c4171957
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-2fda-a93cafe34aec
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-5f83-638667d16fd5
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-ad2f-ee744769d2a3
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-4c9e-82e2efa5b170
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-049e-7dfb2ce6d933
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-9daa-938c17449abc
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-394b-13d0b3590a75
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-ac43-b428e2e032de
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-d460-3431eb91a087
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-2261-aac8c44ef234
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-1cfe-1fc2411d78a7
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-fac9-d9f3b3239bb5
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-e517-fa8cd5c12af2
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-89f8-1a0b87b6c009
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-0d01-2173fb779865
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-467c-ee349dcf2d55
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-2faa-f328da9035ee	00030000-5658-0973-aeef-1bb0e62a3016
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-b4a9-9b4857374532
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-d71b-bc0b227a9a35
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-2b1a-d571a86a7c24
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-96a7-6dd49b496a40
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-e6d3-7ff205760ced
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-a21d-d99760e2fcf3
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-c5c6-e1adcdcf3c88
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-3c8a-352409052eda
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-338c-41d0781c2285
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-5ffe-6debab3e583f
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-5f83-638667d16fd5
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-2fda-a93cafe34aec
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-4c9e-82e2efa5b170
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-d88b-53ac15036319
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-2556-05e52fb31a24
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-8adc-2f457a1e2ecc
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-8216-6d127a240392
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-b85e-415c8314dc30
00020000-5658-0975-7ced-1c30098a5b33	00030000-5658-0973-aeef-1bb0e62a3016
\.


--
-- TOC entry 3139 (class 0 OID 29805626)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 29805660)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 29805797)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5658-0975-edf6-ff2c05170d8b	00090000-5658-0975-b854-d461d2ec256f	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5658-0975-59d2-01fcae6a9c74	00090000-5658-0975-d6e6-994f79534e5a	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5658-0975-de67-bebdb5c54291	00090000-5658-0975-e690-546b60cab80d	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5658-0975-ca3b-8089a9754417	00090000-5658-0975-0e9b-2ba56ee774f9	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 29805318)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5658-0975-1408-c88a31d0a521	\N	00040000-5658-0973-771a-b3a28fb3f6d4	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-0975-4916-bffeb29aff58	\N	00040000-5658-0973-771a-b3a28fb3f6d4	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5658-0975-9428-a4aea9ac781c	\N	00040000-5658-0973-771a-b3a28fb3f6d4	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-0975-89cf-bee738ac5211	\N	00040000-5658-0973-771a-b3a28fb3f6d4	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-0975-d62a-4a6ab47b91d7	\N	00040000-5658-0973-771a-b3a28fb3f6d4	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-0975-e0fd-f4ffb3169326	\N	00040000-5658-0973-5e7d-325480bdb37f	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-0975-8061-de53892a6123	\N	00040000-5658-0973-3ac6-613f584d47fb	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-0975-022e-a18a0a5e968d	\N	00040000-5658-0973-d035-8efd606f4492	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-0975-f6e7-4f4bfaba4c49	\N	00040000-5658-0973-b568-93bf6ed94021	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-0977-8f0b-80c13a9e312f	\N	00040000-5658-0973-771a-b3a28fb3f6d4	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 29805363)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5658-0972-7979-30ea0564fee4	8341	Adlešiči
00050000-5658-0972-7a66-d36ed8963ffa	5270	Ajdovščina
00050000-5658-0972-f246-42a70219a35e	6280	Ankaran/Ancarano
00050000-5658-0972-38b4-67acbd2ed8db	9253	Apače
00050000-5658-0972-1c17-40115176d51b	8253	Artiče
00050000-5658-0972-537c-f7edfea8debc	4275	Begunje na Gorenjskem
00050000-5658-0972-65de-f9b58b9964c4	1382	Begunje pri Cerknici
00050000-5658-0972-58d9-e67fa953495a	9231	Beltinci
00050000-5658-0972-03f7-54b34a2e02ef	2234	Benedikt
00050000-5658-0972-ff34-602b6239097c	2345	Bistrica ob Dravi
00050000-5658-0972-bb07-7638f5ef70d3	3256	Bistrica ob Sotli
00050000-5658-0972-d319-37c19ed594ca	8259	Bizeljsko
00050000-5658-0972-8cb1-42a6123592b5	1223	Blagovica
00050000-5658-0972-8356-c709a2b0a814	8283	Blanca
00050000-5658-0972-ae7b-2ceb239111c8	4260	Bled
00050000-5658-0972-9fd7-452978e9df07	4273	Blejska Dobrava
00050000-5658-0972-a03f-7b3d88e81345	9265	Bodonci
00050000-5658-0972-405e-cdbe9feaa1a4	9222	Bogojina
00050000-5658-0972-80fb-43a4b634f0b8	4263	Bohinjska Bela
00050000-5658-0972-771e-1b9d8ced2dbe	4264	Bohinjska Bistrica
00050000-5658-0972-d046-fe1bace922ee	4265	Bohinjsko jezero
00050000-5658-0972-726b-ddc71725684d	1353	Borovnica
00050000-5658-0972-7c79-a5218cd32b2e	8294	Boštanj
00050000-5658-0972-a861-40dfe4b571ee	5230	Bovec
00050000-5658-0972-7d16-31940b4c68d9	5295	Branik
00050000-5658-0972-b4a8-266d7c6b14ee	3314	Braslovče
00050000-5658-0972-f561-175fe8a886d6	5223	Breginj
00050000-5658-0972-bc19-79083efccc3c	8280	Brestanica
00050000-5658-0972-7b1a-910d076cc9f2	2354	Bresternica
00050000-5658-0972-3464-955ea1c8ef3d	4243	Brezje
00050000-5658-0972-e760-754e9b924e01	1351	Brezovica pri Ljubljani
00050000-5658-0972-9cff-77ab2441cb7e	8250	Brežice
00050000-5658-0972-1758-db2b7661bf56	4210	Brnik - Aerodrom
00050000-5658-0972-c76d-4009bf6bc3fe	8321	Brusnice
00050000-5658-0972-f264-4627d2408bd2	3255	Buče
00050000-5658-0972-ae70-c19858956543	8276	Bučka 
00050000-5658-0972-56e7-223423bc9474	9261	Cankova
00050000-5658-0972-39e8-5a7a1da4cc62	3000	Celje 
00050000-5658-0972-7600-0843c689de4a	3001	Celje - poštni predali
00050000-5658-0972-213e-c16b745f8da0	4207	Cerklje na Gorenjskem
00050000-5658-0972-2f61-1f0d48e4c74e	8263	Cerklje ob Krki
00050000-5658-0972-2801-1de0c811807f	1380	Cerknica
00050000-5658-0972-352a-27207ec61eb9	5282	Cerkno
00050000-5658-0972-ba7c-04fd8920e521	2236	Cerkvenjak
00050000-5658-0972-f353-ac256e5a0422	2215	Ceršak
00050000-5658-0972-82a2-c957551ca9ee	2326	Cirkovce
00050000-5658-0972-fa38-9ec91bb9b8d0	2282	Cirkulane
00050000-5658-0972-aee6-09845d0095c0	5273	Col
00050000-5658-0972-387e-4809365ed6e1	8251	Čatež ob Savi
00050000-5658-0972-d184-53e8df46e69b	1413	Čemšenik
00050000-5658-0972-9c30-14b585e351b0	5253	Čepovan
00050000-5658-0972-9495-20588c9065e0	9232	Črenšovci
00050000-5658-0972-eeb7-d3c63cb06fe9	2393	Črna na Koroškem
00050000-5658-0972-621d-8f3a17de7b1e	6275	Črni Kal
00050000-5658-0972-5530-b4e86a0ab860	5274	Črni Vrh nad Idrijo
00050000-5658-0972-ea93-5cfaee941859	5262	Črniče
00050000-5658-0972-ff23-ed06909540c9	8340	Črnomelj
00050000-5658-0972-8e85-82bc953cc16f	6271	Dekani
00050000-5658-0972-c19e-fd3309a6d344	5210	Deskle
00050000-5658-0972-20f3-63a606d0ad6c	2253	Destrnik
00050000-5658-0972-c319-7eb2c96f295c	6215	Divača
00050000-5658-0972-3127-b38fa672f37a	1233	Dob
00050000-5658-0972-9819-beecfe8e1944	3224	Dobje pri Planini
00050000-5658-0972-8a54-c499dcfb5411	8257	Dobova
00050000-5658-0972-d11b-f832523ddcff	1423	Dobovec
00050000-5658-0972-00ee-87aed5880c92	5263	Dobravlje
00050000-5658-0972-e2d5-0d29be30e4de	3204	Dobrna
00050000-5658-0972-5a25-2700fc1e734c	8211	Dobrnič
00050000-5658-0972-a4e3-a3fcafa887e2	1356	Dobrova
00050000-5658-0972-0286-d58eb87c3cd3	9223	Dobrovnik/Dobronak 
00050000-5658-0972-7222-e78a24b26b20	5212	Dobrovo v Brdih
00050000-5658-0972-fe4d-aefbac85e085	1431	Dol pri Hrastniku
00050000-5658-0972-cccc-6a34159a0674	1262	Dol pri Ljubljani
00050000-5658-0972-768a-7b414c6227c2	1273	Dole pri Litiji
00050000-5658-0972-c036-74134b7cb0d8	1331	Dolenja vas
00050000-5658-0972-4fee-7b086a513d36	8350	Dolenjske Toplice
00050000-5658-0972-7a9e-9bf17f5ebf0d	1230	Domžale
00050000-5658-0972-535e-576b270471a9	2252	Dornava
00050000-5658-0972-47f9-a1f2cd66516c	5294	Dornberk
00050000-5658-0972-48ff-262735d05ecd	1319	Draga
00050000-5658-0972-8f55-150c0bd38248	8343	Dragatuš
00050000-5658-0972-58b4-4c27217dac82	3222	Dramlje
00050000-5658-0972-1705-afd14fb80be1	2370	Dravograd
00050000-5658-0972-9561-e035aa24bec3	4203	Duplje
00050000-5658-0972-381a-c7f5cbbca93c	6221	Dutovlje
00050000-5658-0972-80e0-e305ea17757a	8361	Dvor
00050000-5658-0972-6059-7113cd91b19e	2343	Fala
00050000-5658-0972-e434-f1d06311ef8d	9208	Fokovci
00050000-5658-0972-79e0-97b872470f49	2313	Fram
00050000-5658-0972-4c49-6e63a070dffe	3213	Frankolovo
00050000-5658-0972-bb0a-deef84b5c388	1274	Gabrovka
00050000-5658-0972-2da7-2e385a770953	8254	Globoko
00050000-5658-0972-af0c-fc3036e30278	5275	Godovič
00050000-5658-0972-5b4c-07ff1adb777a	4204	Golnik
00050000-5658-0972-17b0-4c73b953edf1	3303	Gomilsko
00050000-5658-0972-6f92-3ceb7e7f96d2	4224	Gorenja vas
00050000-5658-0972-79f8-157a861143c4	3263	Gorica pri Slivnici
00050000-5658-0972-d5e0-4672fb299cd6	2272	Gorišnica
00050000-5658-0972-b363-2d57c25baab4	9250	Gornja Radgona
00050000-5658-0972-a208-91d8d4faf0a8	3342	Gornji Grad
00050000-5658-0972-65db-96bd7e741486	4282	Gozd Martuljek
00050000-5658-0972-a234-82ce07e3f8da	6272	Gračišče
00050000-5658-0972-2871-4adfb8a96614	9264	Grad
00050000-5658-0972-51b0-c806d05654e0	8332	Gradac
00050000-5658-0972-ba11-eb5903b1a955	1384	Grahovo
00050000-5658-0972-f4c6-bde33bf68625	5242	Grahovo ob Bači
00050000-5658-0972-41e8-858957132366	5251	Grgar
00050000-5658-0972-a582-66e2db456086	3302	Griže
00050000-5658-0972-f31d-ef52e7075de8	3231	Grobelno
00050000-5658-0972-fefd-68abce2c1e3f	1290	Grosuplje
00050000-5658-0972-eb5d-1b3bacef4771	2288	Hajdina
00050000-5658-0972-dc4a-28bb46c0d0c2	8362	Hinje
00050000-5658-0972-d064-98f0e8546ada	2311	Hoče
00050000-5658-0972-1514-f9fcb01b0bad	9205	Hodoš/Hodos
00050000-5658-0972-9c1a-fbf495a4ed71	1354	Horjul
00050000-5658-0972-b6f6-be3abd5de102	1372	Hotedršica
00050000-5658-0972-cea5-4c7457b582d2	1430	Hrastnik
00050000-5658-0972-553c-340222309f18	6225	Hruševje
00050000-5658-0972-9489-1328ba47ed43	4276	Hrušica
00050000-5658-0972-99fa-64c71ed3c15b	5280	Idrija
00050000-5658-0972-18af-c7fa823ae896	1292	Ig
00050000-5658-0972-6a66-2a0e82e76124	6250	Ilirska Bistrica
00050000-5658-0972-5abb-5682d76eb072	6251	Ilirska Bistrica-Trnovo
00050000-5658-0972-4237-e4124a77c5b0	1295	Ivančna Gorica
00050000-5658-0972-d275-58475ae6cfac	2259	Ivanjkovci
00050000-5658-0972-34d2-f5cfccb88308	1411	Izlake
00050000-5658-0972-cd60-e6b91e3ee090	6310	Izola/Isola
00050000-5658-0972-2dbb-a4dc4e8cca4c	2222	Jakobski Dol
00050000-5658-0972-1076-07b88498d297	2221	Jarenina
00050000-5658-0972-0443-f20b10b79359	6254	Jelšane
00050000-5658-0972-1708-2528f1e78763	4270	Jesenice
00050000-5658-0972-ecc8-84bfa8e24c87	8261	Jesenice na Dolenjskem
00050000-5658-0972-d8fc-0e9a6c4a2d0c	3273	Jurklošter
00050000-5658-0972-595c-e82b58cb9b2e	2223	Jurovski Dol
00050000-5658-0972-094c-9703e9090421	2256	Juršinci
00050000-5658-0972-1339-75e050edeba5	5214	Kal nad Kanalom
00050000-5658-0972-6b31-2aa2dd6ac760	3233	Kalobje
00050000-5658-0972-f8a6-8e60cd47ecd9	4246	Kamna Gorica
00050000-5658-0972-447b-4041fb929407	2351	Kamnica
00050000-5658-0972-2fce-df6c995894c7	1241	Kamnik
00050000-5658-0972-3c59-5dacdbb09dd1	5213	Kanal
00050000-5658-0972-b8f6-ad72fc7f783d	8258	Kapele
00050000-5658-0972-2bde-24f0bbeffd00	2362	Kapla
00050000-5658-0972-b117-c07ad7865f4f	2325	Kidričevo
00050000-5658-0972-be42-34a4c893da52	1412	Kisovec
00050000-5658-0972-679a-06fcf903faf9	6253	Knežak
00050000-5658-0972-df75-68420c7a8db6	5222	Kobarid
00050000-5658-0972-1e4a-87015de2ce92	9227	Kobilje
00050000-5658-0973-78f1-d9d8176facc1	1330	Kočevje
00050000-5658-0973-7423-9c485548f27b	1338	Kočevska Reka
00050000-5658-0973-b411-9c5f3369dd12	2276	Kog
00050000-5658-0973-10f6-1133e4edf8d7	5211	Kojsko
00050000-5658-0973-686a-b94e5413aa9c	6223	Komen
00050000-5658-0973-96a4-be8a48d4efb4	1218	Komenda
00050000-5658-0973-9463-9110db99a439	6000	Koper/Capodistria 
00050000-5658-0973-080b-b8549366c589	6001	Koper/Capodistria - poštni predali
00050000-5658-0973-ba0a-632df20b87f8	8282	Koprivnica
00050000-5658-0973-2efc-9fa9dd02fc04	5296	Kostanjevica na Krasu
00050000-5658-0973-b3be-6fbc1106f821	8311	Kostanjevica na Krki
00050000-5658-0973-27b8-ee5185622b3e	1336	Kostel
00050000-5658-0973-956f-6042365f189e	6256	Košana
00050000-5658-0973-5d92-685e54c96000	2394	Kotlje
00050000-5658-0973-f4ef-ee7651dec8ca	6240	Kozina
00050000-5658-0973-93bc-db188ebddadb	3260	Kozje
00050000-5658-0973-9039-25c2c61e2767	4000	Kranj 
00050000-5658-0973-75e7-8972bb13605e	4001	Kranj - poštni predali
00050000-5658-0973-741e-7e15cf03523c	4280	Kranjska Gora
00050000-5658-0973-d5e5-c46d867cf0c3	1281	Kresnice
00050000-5658-0973-97a8-a0f2bec6d46f	4294	Križe
00050000-5658-0973-e5cb-778e5842e995	9206	Križevci
00050000-5658-0973-8f5e-3a65ae900b18	9242	Križevci pri Ljutomeru
00050000-5658-0973-e128-f4aa7bd76c18	1301	Krka
00050000-5658-0973-ab06-ab0e454d0ed7	8296	Krmelj
00050000-5658-0973-3dfd-0e681efde5dc	4245	Kropa
00050000-5658-0973-28ed-36576a65c222	8262	Krška vas
00050000-5658-0973-6b80-0e6c9ed5c724	8270	Krško
00050000-5658-0973-58d3-bd1e1d7995ab	9263	Kuzma
00050000-5658-0973-6c21-b51a62613bba	2318	Laporje
00050000-5658-0973-e4c3-6004d5ffb8e2	3270	Laško
00050000-5658-0973-e974-4af2187ea7c7	1219	Laze v Tuhinju
00050000-5658-0973-e3f5-6eab48fbdf39	2230	Lenart v Slovenskih goricah
00050000-5658-0973-2a58-1d42b80cae4f	9220	Lendava/Lendva
00050000-5658-0973-dae4-988dc513c67b	4248	Lesce
00050000-5658-0973-4d2a-289baaefb686	3261	Lesično
00050000-5658-0973-ca36-7de72a104f21	8273	Leskovec pri Krškem
00050000-5658-0973-af6f-0bb9fc577d89	2372	Libeliče
00050000-5658-0973-aa8a-ab4e6f30a64c	2341	Limbuš
00050000-5658-0973-6d64-ae9922ec9edd	1270	Litija
00050000-5658-0973-5eeb-989076f1c738	3202	Ljubečna
00050000-5658-0973-5951-4b3986241197	1000	Ljubljana 
00050000-5658-0973-9726-99b12df4d6b1	1001	Ljubljana - poštni predali
00050000-5658-0973-121b-79f4c8c161ce	1231	Ljubljana - Črnuče
00050000-5658-0973-ad3e-4e5301220adb	1261	Ljubljana - Dobrunje
00050000-5658-0973-953b-f6dbec20653c	1260	Ljubljana - Polje
00050000-5658-0973-5063-87ebac7c7858	1210	Ljubljana - Šentvid
00050000-5658-0973-b2db-783610907925	1211	Ljubljana - Šmartno
00050000-5658-0973-ea9b-29d8f6821e94	3333	Ljubno ob Savinji
00050000-5658-0973-0648-809927a53a49	9240	Ljutomer
00050000-5658-0973-9a59-a6bf819ece5c	3215	Loče
00050000-5658-0973-9758-ad4ef4a28a69	5231	Log pod Mangartom
00050000-5658-0973-d082-61e588fa040c	1358	Log pri Brezovici
00050000-5658-0973-ea06-e4f5d39f95c1	1370	Logatec
00050000-5658-0973-6f57-3a30b7972d1d	1371	Logatec
00050000-5658-0973-fe6e-70ea450663dd	1434	Loka pri Zidanem Mostu
00050000-5658-0973-a1d0-6d39ab47a88c	3223	Loka pri Žusmu
00050000-5658-0973-ec52-30b880bca011	6219	Lokev
00050000-5658-0973-14bb-37f71db9ded8	1318	Loški Potok
00050000-5658-0973-5727-f0ccc2dd5dad	2324	Lovrenc na Dravskem polju
00050000-5658-0973-d98c-6ce23adfd5cc	2344	Lovrenc na Pohorju
00050000-5658-0973-480d-31d9c52d7cab	3334	Luče
00050000-5658-0973-c4b1-5b13d537908d	1225	Lukovica
00050000-5658-0973-7350-6fea85d31daa	9202	Mačkovci
00050000-5658-0973-5a83-d5f9e552c19c	2322	Majšperk
00050000-5658-0973-1848-cdd256533ac4	2321	Makole
00050000-5658-0973-5729-b3b9cebb42d1	9243	Mala Nedelja
00050000-5658-0973-5b00-9065f35c3dcc	2229	Malečnik
00050000-5658-0973-7550-a0d6e27a085a	6273	Marezige
00050000-5658-0973-8eed-11bdb8d901af	2000	Maribor 
00050000-5658-0973-db86-7307e803b6e5	2001	Maribor - poštni predali
00050000-5658-0973-865a-d57bc833da53	2206	Marjeta na Dravskem polju
00050000-5658-0973-cca7-1304507953f1	2281	Markovci
00050000-5658-0973-4332-2190084d7fba	9221	Martjanci
00050000-5658-0973-df76-f4520a245882	6242	Materija
00050000-5658-0973-4b01-dcfc0c414447	4211	Mavčiče
00050000-5658-0973-461c-ca8f4f13ee9d	1215	Medvode
00050000-5658-0973-39b9-90060877d03b	1234	Mengeš
00050000-5658-0973-3596-6270aa810841	8330	Metlika
00050000-5658-0973-10e0-c83da64dc235	2392	Mežica
00050000-5658-0973-e906-0e3324e918cf	2204	Miklavž na Dravskem polju
00050000-5658-0973-88d4-ed07aaa3e04c	2275	Miklavž pri Ormožu
00050000-5658-0973-3277-fb916b431c11	5291	Miren
00050000-5658-0973-863b-6aa4f9d32bf2	8233	Mirna
00050000-5658-0973-195c-1ea03404f828	8216	Mirna Peč
00050000-5658-0973-d4d0-82a13d964a09	2382	Mislinja
00050000-5658-0973-3a6e-2a521585c5aa	4281	Mojstrana
00050000-5658-0973-369a-99820a14ad3b	8230	Mokronog
00050000-5658-0973-d8ec-2308afe7c2e3	1251	Moravče
00050000-5658-0973-d39e-74f966584e43	9226	Moravske Toplice
00050000-5658-0973-53c7-a9b8c3522aca	5216	Most na Soči
00050000-5658-0973-03cc-7dc66e71bb38	1221	Motnik
00050000-5658-0973-bfd0-226bbbddc21f	3330	Mozirje
00050000-5658-0973-c8d7-1213f054a03f	9000	Murska Sobota 
00050000-5658-0973-d952-d78f8c0eafcf	9001	Murska Sobota - poštni predali
00050000-5658-0973-1dba-b8b890a65fee	2366	Muta
00050000-5658-0973-b85e-2ca5c4abbbb5	4202	Naklo
00050000-5658-0973-23ea-7d019ebb5158	3331	Nazarje
00050000-5658-0973-a998-07baae5d136d	1357	Notranje Gorice
00050000-5658-0973-7891-dedb9eabc896	3203	Nova Cerkev
00050000-5658-0973-e8df-827138c1e459	5000	Nova Gorica 
00050000-5658-0973-3656-809084b98c55	5001	Nova Gorica - poštni predali
00050000-5658-0973-79c6-f52b52e9a469	1385	Nova vas
00050000-5658-0973-efb8-70ec889ac290	8000	Novo mesto
00050000-5658-0973-a38d-94276846893d	8001	Novo mesto - poštni predali
00050000-5658-0973-8eed-b5f451fa3620	6243	Obrov
00050000-5658-0973-0f67-5f9e3c02708f	9233	Odranci
00050000-5658-0973-f3e1-f2465ae8b404	2317	Oplotnica
00050000-5658-0973-26c4-e76e04b02bb5	2312	Orehova vas
00050000-5658-0973-d4c8-028017c543c8	2270	Ormož
00050000-5658-0973-e66f-e627e566a9d3	1316	Ortnek
00050000-5658-0973-72a5-5aaea296bdde	1337	Osilnica
00050000-5658-0973-b49a-920ab7e4991f	8222	Otočec
00050000-5658-0973-ad4a-b9ea7c045ec9	2361	Ožbalt
00050000-5658-0973-88ec-b62947e40912	2231	Pernica
00050000-5658-0973-7bc2-c59b1896a4b0	2211	Pesnica pri Mariboru
00050000-5658-0973-891a-025e4385a194	9203	Petrovci
00050000-5658-0973-2ddd-3f3178d16eef	3301	Petrovče
00050000-5658-0973-b113-a339ca314e76	6330	Piran/Pirano
00050000-5658-0973-c634-939ba14d7dc3	8255	Pišece
00050000-5658-0973-885c-d134ea98af1c	6257	Pivka
00050000-5658-0973-1f84-291630b52bbd	6232	Planina
00050000-5658-0973-b01f-c1e013d1a72c	3225	Planina pri Sevnici
00050000-5658-0973-7bd7-a6d7dde2ef09	6276	Pobegi
00050000-5658-0973-836a-a5d8b4b19859	8312	Podbočje
00050000-5658-0973-3e41-92a220ec4be6	5243	Podbrdo
00050000-5658-0973-0ba4-8337ab22dad4	3254	Podčetrtek
00050000-5658-0973-9ac8-ef50da649a50	2273	Podgorci
00050000-5658-0973-4120-f1282ad93c4e	6216	Podgorje
00050000-5658-0973-2980-afe6aa2dc358	2381	Podgorje pri Slovenj Gradcu
00050000-5658-0973-fca9-44f36e1e0a77	6244	Podgrad
00050000-5658-0973-4c21-6ef8e20c8815	1414	Podkum
00050000-5658-0973-358a-c03e53bf6a3b	2286	Podlehnik
00050000-5658-0973-29f9-93ec2a17aabc	5272	Podnanos
00050000-5658-0973-9a33-c07b80e5bdd3	4244	Podnart
00050000-5658-0973-8b4c-50d4c71a11c4	3241	Podplat
00050000-5658-0973-3534-d7394b06a229	3257	Podsreda
00050000-5658-0973-a9ee-6529dc09d14f	2363	Podvelka
00050000-5658-0973-cd1c-fcba9c84d4a0	2208	Pohorje
00050000-5658-0973-db4d-2161d5f5a0a9	2257	Polenšak
00050000-5658-0973-eebc-209f37f60063	1355	Polhov Gradec
00050000-5658-0973-66c1-470f5fecda79	4223	Poljane nad Škofjo Loko
00050000-5658-0973-82f6-81682a55d17a	2319	Poljčane
00050000-5658-0973-73ee-a7ee6dd5f9cd	1272	Polšnik
00050000-5658-0973-3c0b-234b187ccc0b	3313	Polzela
00050000-5658-0973-942a-fc3d7352b401	3232	Ponikva
00050000-5658-0973-e75e-3efed7cf41db	6320	Portorož/Portorose
00050000-5658-0973-e3b8-cdc23c3ba023	6230	Postojna
00050000-5658-0973-27c1-404ed52a721f	2331	Pragersko
00050000-5658-0973-b4cf-44642f9c0a79	3312	Prebold
00050000-5658-0973-6e52-4480164b0996	4205	Preddvor
00050000-5658-0973-e2e8-8f6f636cf64b	6255	Prem
00050000-5658-0973-06da-cf713f434b0b	1352	Preserje
00050000-5658-0973-bbb3-ad46d26aec66	6258	Prestranek
00050000-5658-0973-6cd1-3cd4f14aa27a	2391	Prevalje
00050000-5658-0973-0229-89e8b1e4e26f	3262	Prevorje
00050000-5658-0973-7133-0c82b7a47c3c	1276	Primskovo 
00050000-5658-0973-8cc2-d106c99d78de	3253	Pristava pri Mestinju
00050000-5658-0973-cd68-2e57cee7c13e	9207	Prosenjakovci/Partosfalva
00050000-5658-0973-21b0-883df354d887	5297	Prvačina
00050000-5658-0973-827f-ea200925eba7	2250	Ptuj
00050000-5658-0973-a917-fbce0ad542ba	2323	Ptujska Gora
00050000-5658-0973-66c4-144cb3cca56a	9201	Puconci
00050000-5658-0973-fe01-eb8b7be26d33	2327	Rače
00050000-5658-0973-b330-7317530dc6dc	1433	Radeče
00050000-5658-0973-f3c0-9b9200b89d70	9252	Radenci
00050000-5658-0973-78b0-6c6eecb17349	2360	Radlje ob Dravi
00050000-5658-0973-ff5d-8b58f958f0e1	1235	Radomlje
00050000-5658-0973-80db-983f167a8477	4240	Radovljica
00050000-5658-0973-c8ec-b67af20b80d9	8274	Raka
00050000-5658-0973-7a8f-c9dc156b3d73	1381	Rakek
00050000-5658-0973-2c10-4515f49e8aac	4283	Rateče - Planica
00050000-5658-0973-91e5-c7e7e6d9961d	2390	Ravne na Koroškem
00050000-5658-0973-4e31-e6906db90507	9246	Razkrižje
00050000-5658-0973-e05e-30ffdfa08f93	3332	Rečica ob Savinji
00050000-5658-0973-489b-e151cdc6cb74	5292	Renče
00050000-5658-0973-6d27-b3a24b4223dd	1310	Ribnica
00050000-5658-0973-0d73-4d9142c06f51	2364	Ribnica na Pohorju
00050000-5658-0973-1c13-8397ed00548a	3272	Rimske Toplice
00050000-5658-0973-badd-6297898fe1e7	1314	Rob
00050000-5658-0973-7959-3b45463a3cd3	5215	Ročinj
00050000-5658-0973-0e68-5afe64f3c55f	3250	Rogaška Slatina
00050000-5658-0973-5a36-343058593a47	9262	Rogašovci
00050000-5658-0973-94a4-20f3ba28e231	3252	Rogatec
00050000-5658-0973-cbf7-35d2e6cbe277	1373	Rovte
00050000-5658-0973-5f75-961b31251b24	2342	Ruše
00050000-5658-0973-3989-204ddd74cd04	1282	Sava
00050000-5658-0973-5c74-55593827436d	6333	Sečovlje/Sicciole
00050000-5658-0973-fec2-4364f2aa67b6	4227	Selca
00050000-5658-0973-0fdc-70cae897949f	2352	Selnica ob Dravi
00050000-5658-0973-e7d8-916d2dc4cb05	8333	Semič
00050000-5658-0973-3fac-41df0fb3a131	8281	Senovo
00050000-5658-0973-203f-f531dcadab9a	6224	Senožeče
00050000-5658-0973-23f7-7cd3aedb7610	8290	Sevnica
00050000-5658-0973-b872-6537816e3060	6210	Sežana
00050000-5658-0973-9286-a441ebcca5c2	2214	Sladki Vrh
00050000-5658-0973-42ec-90f06170d965	5283	Slap ob Idrijci
00050000-5658-0973-9150-981c2337be45	2380	Slovenj Gradec
00050000-5658-0973-3ebf-6cee3a92f979	2310	Slovenska Bistrica
00050000-5658-0973-ee78-c5c16c2829ca	3210	Slovenske Konjice
00050000-5658-0973-6376-9b53eddfec4c	1216	Smlednik
00050000-5658-0973-270a-5024fb540df7	5232	Soča
00050000-5658-0973-3848-6d98c6a12f85	1317	Sodražica
00050000-5658-0973-5b52-04f9907e283d	3335	Solčava
00050000-5658-0973-496b-a3d7688fa337	5250	Solkan
00050000-5658-0973-1eb2-9123b251fdc9	4229	Sorica
00050000-5658-0973-a657-be603de2b234	4225	Sovodenj
00050000-5658-0973-bcc5-5ff35230ba23	5281	Spodnja Idrija
00050000-5658-0973-acd2-e59deeb75877	2241	Spodnji Duplek
00050000-5658-0973-e76d-93cd819d4ec2	9245	Spodnji Ivanjci
00050000-5658-0973-71a8-880b90f2967a	2277	Središče ob Dravi
00050000-5658-0973-edf1-aaad8b6244dd	4267	Srednja vas v Bohinju
00050000-5658-0973-a8a6-2525930f7938	8256	Sromlje 
00050000-5658-0973-dcaa-7bccdfde0b2d	5224	Srpenica
00050000-5658-0973-8070-1a2e41377b1b	1242	Stahovica
00050000-5658-0973-6849-6ec7f22e2624	1332	Stara Cerkev
00050000-5658-0973-6e0f-361177129a59	8342	Stari trg ob Kolpi
00050000-5658-0973-f85a-b998c38ff270	1386	Stari trg pri Ložu
00050000-5658-0973-d8b3-e7d67f54635a	2205	Starše
00050000-5658-0973-1686-a3243cf05513	2289	Stoperce
00050000-5658-0973-23d9-5d52634ffc90	8322	Stopiče
00050000-5658-0973-3055-f5089b1f04b6	3206	Stranice
00050000-5658-0973-9e23-8a3e27b01177	8351	Straža
00050000-5658-0973-562c-b050802577f2	1313	Struge
00050000-5658-0973-6d15-0b88eb00e89b	8293	Studenec
00050000-5658-0973-1725-c757fceaea04	8331	Suhor
00050000-5658-0973-5ccc-ef9ef5d5507f	2233	Sv. Ana v Slovenskih goricah
00050000-5658-0973-017a-db09707751d9	2235	Sv. Trojica v Slovenskih goricah
00050000-5658-0973-c2aa-b32194fec1d7	2353	Sveti Duh na Ostrem Vrhu
00050000-5658-0973-ddff-fb2750f2a923	9244	Sveti Jurij ob Ščavnici
00050000-5658-0973-2cc6-4db2287e0949	3264	Sveti Štefan
00050000-5658-0973-9f2f-5c5afc100280	2258	Sveti Tomaž
00050000-5658-0973-5c82-dbbbe3f98390	9204	Šalovci
00050000-5658-0973-f6f5-d64b3a4b8bf6	5261	Šempas
00050000-5658-0973-0796-0a6c564f647b	5290	Šempeter pri Gorici
00050000-5658-0973-c6c4-ba6473fa12da	3311	Šempeter v Savinjski dolini
00050000-5658-0973-cc0b-bc7a733f7a32	4208	Šenčur
00050000-5658-0973-5e69-8f52e99335a8	2212	Šentilj v Slovenskih goricah
00050000-5658-0973-7c64-b2b66533b67d	8297	Šentjanž
00050000-5658-0973-9ca0-ea52762c4fe0	2373	Šentjanž pri Dravogradu
00050000-5658-0973-748e-5c0577d7f0a0	8310	Šentjernej
00050000-5658-0973-552b-14de41e33ecb	3230	Šentjur
00050000-5658-0973-a7e0-f0d58c44a1c0	3271	Šentrupert
00050000-5658-0973-b28d-4253f01357bd	8232	Šentrupert
00050000-5658-0973-65e3-2366551c6281	1296	Šentvid pri Stični
00050000-5658-0973-2dc9-f9484a975837	8275	Škocjan
00050000-5658-0973-ace2-7b15652adfa8	6281	Škofije
00050000-5658-0973-03fc-1395779c475e	4220	Škofja Loka
00050000-5658-0973-ecb4-c0df4dafc835	3211	Škofja vas
00050000-5658-0973-57e2-2255bab3672d	1291	Škofljica
00050000-5658-0973-d45c-beaa1b197e4f	6274	Šmarje
00050000-5658-0973-ac58-6b8e0171d180	1293	Šmarje - Sap
00050000-5658-0973-58d6-f1cb8862c4df	3240	Šmarje pri Jelšah
00050000-5658-0973-65e0-04aad9a576d2	8220	Šmarješke Toplice
00050000-5658-0973-0dec-e50d394fd3b1	2315	Šmartno na Pohorju
00050000-5658-0973-0e87-228571e30294	3341	Šmartno ob Dreti
00050000-5658-0973-2358-2f22eb587e5e	3327	Šmartno ob Paki
00050000-5658-0973-8e52-df3436744d18	1275	Šmartno pri Litiji
00050000-5658-0973-3055-18929dcd5845	2383	Šmartno pri Slovenj Gradcu
00050000-5658-0973-45c2-93867c74da79	3201	Šmartno v Rožni dolini
00050000-5658-0973-5121-6dc6b3d95d8c	3325	Šoštanj
00050000-5658-0973-aceb-540ff790f43a	6222	Štanjel
00050000-5658-0973-7ed6-56e804793a1c	3220	Štore
00050000-5658-0973-f529-d0f7059b5e9d	3304	Tabor
00050000-5658-0973-eaea-e66d6b05b53d	3221	Teharje
00050000-5658-0973-86ad-d51f4d55f859	9251	Tišina
00050000-5658-0973-14eb-9346d4e52ca1	5220	Tolmin
00050000-5658-0973-b8ba-71327eed931f	3326	Topolšica
00050000-5658-0973-968d-0a5796d7bcf5	2371	Trbonje
00050000-5658-0973-f4da-b74d2e02e372	1420	Trbovlje
00050000-5658-0973-318c-231c116837d7	8231	Trebelno 
00050000-5658-0973-d1c6-efc653423e00	8210	Trebnje
00050000-5658-0973-95ee-937b0b3008c6	5252	Trnovo pri Gorici
00050000-5658-0973-ac63-5d4089175bc8	2254	Trnovska vas
00050000-5658-0973-a897-2052f6e37915	1222	Trojane
00050000-5658-0973-244e-be0750ac714a	1236	Trzin
00050000-5658-0973-fca6-96d60ea97507	4290	Tržič
00050000-5658-0973-3ddb-6a926c4efc38	8295	Tržišče
00050000-5658-0973-1620-8a7675961097	1311	Turjak
00050000-5658-0973-0364-055b23eb4a80	9224	Turnišče
00050000-5658-0973-fad8-84ac45cbc513	8323	Uršna sela
00050000-5658-0973-95f7-b50eaa0b97a2	1252	Vače
00050000-5658-0973-83e3-f242c31e3cba	3320	Velenje 
00050000-5658-0973-51cd-e173851e5b5b	3322	Velenje - poštni predali
00050000-5658-0973-b085-8f4c7e4d19b5	8212	Velika Loka
00050000-5658-0973-6b67-edf22449f228	2274	Velika Nedelja
00050000-5658-0973-033f-0b1f5e7fbfdc	9225	Velika Polana
00050000-5658-0973-989c-9ffb8157dd4c	1315	Velike Lašče
00050000-5658-0973-e860-8fd4065c668f	8213	Veliki Gaber
00050000-5658-0973-0019-0abdbf8fbcc7	9241	Veržej
00050000-5658-0973-7e4c-7040eae28881	1312	Videm - Dobrepolje
00050000-5658-0973-6722-10277d1cf793	2284	Videm pri Ptuju
00050000-5658-0973-229f-3afb7c3224ee	8344	Vinica
00050000-5658-0973-4591-3991195f956d	5271	Vipava
00050000-5658-0973-460c-a589f306b9dc	4212	Visoko
00050000-5658-0973-6648-f96373899299	1294	Višnja Gora
00050000-5658-0973-6174-dd182c98a782	3205	Vitanje
00050000-5658-0973-6be1-42555cfd2fe6	2255	Vitomarci
00050000-5658-0973-b2bc-4a6de5aa1c5b	1217	Vodice
00050000-5658-0973-ba78-68bcbc9a0a89	3212	Vojnik\t
00050000-5658-0973-6cfc-4f8c3133b4f2	5293	Volčja Draga
00050000-5658-0973-cde0-73b7af24e4a5	2232	Voličina
00050000-5658-0973-d5f1-871d90bd9835	3305	Vransko
00050000-5658-0973-774e-1358dc1be87f	6217	Vremski Britof
00050000-5658-0973-3476-9ee8d85e5186	1360	Vrhnika
00050000-5658-0973-c5d5-cc5940c5c263	2365	Vuhred
00050000-5658-0973-3852-1750448a5287	2367	Vuzenica
00050000-5658-0973-ab57-30960f8ae0ab	8292	Zabukovje 
00050000-5658-0973-e819-6d319fa50f79	1410	Zagorje ob Savi
00050000-5658-0973-76ef-39839a380641	1303	Zagradec
00050000-5658-0973-3499-46340350bfbd	2283	Zavrč
00050000-5658-0973-3f08-5dabbb008115	8272	Zdole 
00050000-5658-0973-4ebb-7e4cf531dd93	4201	Zgornja Besnica
00050000-5658-0973-5d23-cdf1f85777e8	2242	Zgornja Korena
00050000-5658-0973-7904-d5bd0f9d8689	2201	Zgornja Kungota
00050000-5658-0973-9671-f29a58995e23	2316	Zgornja Ložnica
00050000-5658-0973-bd1d-7762bef56cf9	2314	Zgornja Polskava
00050000-5658-0973-70f4-41f93984039e	2213	Zgornja Velka
00050000-5658-0973-4a60-0899666e7acc	4247	Zgornje Gorje
00050000-5658-0973-86d6-0ae62f5f962d	4206	Zgornje Jezersko
00050000-5658-0973-6b1d-dcad96416028	2285	Zgornji Leskovec
00050000-5658-0973-e551-26656dac95ed	1432	Zidani Most
00050000-5658-0973-de99-7690401676d7	3214	Zreče
00050000-5658-0973-e7f6-334a34ccdd78	4209	Žabnica
00050000-5658-0973-9ebb-fc6ed7418890	3310	Žalec
00050000-5658-0973-ae44-67c1d8fd335f	4228	Železniki
00050000-5658-0973-a664-e4a4bea69aee	2287	Žetale
00050000-5658-0973-ef9e-b53664fecc5f	4226	Žiri
00050000-5658-0973-7941-c63a4af3075b	4274	Žirovnica
00050000-5658-0973-37ba-cc4194816a55	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 29806024)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 29805600)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 29805348)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5658-0975-7fe0-3904ba490391	00080000-5658-0975-1408-c88a31d0a521	\N	00040000-5658-0973-771a-b3a28fb3f6d4	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5658-0975-dfa8-c0406ea857ca	00080000-5658-0975-1408-c88a31d0a521	\N	00040000-5658-0973-771a-b3a28fb3f6d4	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5658-0975-99d7-0807a92e8594	00080000-5658-0975-4916-bffeb29aff58	\N	00040000-5658-0973-771a-b3a28fb3f6d4	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 29805492)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5658-0973-6e23-c73ee0a0010f	novo leto	1	1	\N	t
00430000-5658-0973-4c7a-a6572c394840	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5658-0973-eb3e-5c51f217f250	dan upora proti okupatorju	27	4	\N	t
00430000-5658-0973-1055-7eb283680b64	praznik dela	1	5	\N	t
00430000-5658-0973-7d30-b3985e46bff9	praznik dela	2	5	\N	t
00430000-5658-0973-6b29-c00353134d18	dan Primoža Trubarja	8	6	\N	f
00430000-5658-0973-8419-5e295ccac805	dan državnosti	25	6	\N	t
00430000-5658-0973-113b-55f535178913	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5658-0973-8ab4-e4eea10d2dfd	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5658-0973-f7ed-a60bbe6c7660	dan suverenosti	25	10	\N	f
00430000-5658-0973-ac01-d8b4165fd463	dan spomina na mrtve	1	11	\N	t
00430000-5658-0973-8d4c-2b596e76e7db	dan Rudolfa Maistra	23	11	\N	f
00430000-5658-0973-a79e-6400ddfcb9e1	božič	25	12	\N	t
00430000-5658-0973-7dcd-adfc58d6e4a9	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5658-0973-7f35-541c49a05f73	Marijino vnebovzetje	15	8	\N	t
00430000-5658-0973-20d9-4cc3df458f65	dan reformacije	31	10	\N	t
00430000-5658-0973-c2f8-0945be78eea7	velikonočna nedelja	27	3	2016	t
00430000-5658-0973-c205-115bca9eb04f	velikonočna nedelja	16	4	2017	t
00430000-5658-0973-4b65-e8c60907599f	velikonočna nedelja	1	4	2018	t
00430000-5658-0973-b6a8-eab7bad2c253	velikonočna nedelja	21	4	2019	t
00430000-5658-0973-794e-ea839dac03c4	velikonočna nedelja	12	4	2020	t
00430000-5658-0973-b865-1b24ff352f13	velikonočna nedelja	4	4	2021	t
00430000-5658-0973-f550-c2d9ee694e48	velikonočna nedelja	17	4	2022	t
00430000-5658-0973-400b-ff206d34e04b	velikonočna nedelja	9	4	2023	t
00430000-5658-0973-3277-2b125fe2cb5d	velikonočna nedelja	31	3	2024	t
00430000-5658-0973-ee2b-9be1d7d2229b	velikonočna nedelja	20	4	2025	t
00430000-5658-0973-a224-d1e442598e71	velikonočna nedelja	5	4	2026	t
00430000-5658-0973-6a60-e089f6e6e71a	velikonočna nedelja	28	3	2027	t
00430000-5658-0973-1f51-69ecd2de5bb7	velikonočna nedelja	16	4	2028	t
00430000-5658-0973-a814-a5a27c70345a	velikonočna nedelja	1	4	2029	t
00430000-5658-0973-b7e4-ab267863e913	velikonočna nedelja	21	4	2030	t
00430000-5658-0973-abf4-1406f05d376a	velikonočni ponedeljek	28	3	2016	t
00430000-5658-0973-7f44-f03389d87486	velikonočni ponedeljek	17	4	2017	t
00430000-5658-0973-a746-1a25af83bb5f	velikonočni ponedeljek	2	4	2018	t
00430000-5658-0973-6ed8-2e37f061b6fe	velikonočni ponedeljek	22	4	2019	t
00430000-5658-0973-4506-d0453db768c8	velikonočni ponedeljek	13	4	2020	t
00430000-5658-0973-d8fd-cc80497daef4	velikonočni ponedeljek	5	4	2021	t
00430000-5658-0973-ab09-e184a864551e	velikonočni ponedeljek	18	4	2022	t
00430000-5658-0973-7af8-04cb41291200	velikonočni ponedeljek	10	4	2023	t
00430000-5658-0973-3a09-721d5e643589	velikonočni ponedeljek	1	4	2024	t
00430000-5658-0973-2620-eae44bc19b49	velikonočni ponedeljek	21	4	2025	t
00430000-5658-0973-e7db-b842f852a8be	velikonočni ponedeljek	6	4	2026	t
00430000-5658-0973-ff5f-63d03a79771f	velikonočni ponedeljek	29	3	2027	t
00430000-5658-0973-7736-49465b381fde	velikonočni ponedeljek	17	4	2028	t
00430000-5658-0973-f4c4-0b6412f7ebf1	velikonočni ponedeljek	2	4	2029	t
00430000-5658-0973-ff26-9a5cbf0a58a1	velikonočni ponedeljek	22	4	2030	t
00430000-5658-0973-416c-79ed979cecbe	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5658-0973-44c8-934672838a0d	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5658-0973-33a0-fa23a3b7c59d	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5658-0973-5fa1-58585a4ac7ce	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5658-0973-d937-b558fd33af4e	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5658-0973-23c9-584ec6c39a96	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5658-0973-bb49-88a92fd85e62	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5658-0973-03eb-ee3ecf76e470	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5658-0973-a036-403958ecfd04	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5658-0973-ce5d-a52ebaa982c6	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5658-0973-7754-f9cd84f230bb	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5658-0973-7f50-5af74d51eb46	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5658-0973-29c4-940a1da5a1e8	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5658-0973-cc3e-34ff94e066d3	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5658-0973-c845-8d97766d2434	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 29805452)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 29805464)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 29805612)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 29806038)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 29806048)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5658-0975-750e-0ebeeed06003	00080000-5658-0975-9428-a4aea9ac781c	0987	AK
00190000-5658-0975-d937-264cc899e8f0	00080000-5658-0975-4916-bffeb29aff58	0989	AK
00190000-5658-0975-fcab-fe1d15b9292b	00080000-5658-0975-89cf-bee738ac5211	0986	AK
00190000-5658-0975-f9c3-1072af173a15	00080000-5658-0975-e0fd-f4ffb3169326	0984	AK
00190000-5658-0975-3120-06314c0627e8	00080000-5658-0975-8061-de53892a6123	0983	AK
00190000-5658-0975-aa69-267e8e159500	00080000-5658-0975-022e-a18a0a5e968d	0982	AK
00190000-5658-0977-8159-1bec45d03f6a	00080000-5658-0977-8f0b-80c13a9e312f	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 29805947)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5658-0976-28bb-aa640b41acc3	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 29806056)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 29805641)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5658-0975-8922-2fe200d44b9e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5658-0975-727f-a86896b7ec41	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5658-0975-6470-4552fa8b4a1e	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5658-0975-6173-ba61f8a5d003	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5658-0975-784b-2ec5e556387b	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5658-0975-a05e-6e6b407329c8	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5658-0975-410d-f44695b2165e	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 29805585)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 29805575)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 29805786)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 29805716)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 29805426)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 29805188)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5658-0977-8f0b-80c13a9e312f	00010000-5658-0974-09b8-65f8276cc305	2015-11-27 08:42:47	INS	a:0:{}
2	App\\Entity\\Option	00000000-5658-0977-7f98-fa89237af02c	00010000-5658-0974-09b8-65f8276cc305	2015-11-27 08:42:47	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5658-0977-8159-1bec45d03f6a	00010000-5658-0974-09b8-65f8276cc305	2015-11-27 08:42:47	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 29805654)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 29805226)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5658-0973-5e3a-ceb84ab9bf7e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5658-0973-18bc-5b801ad5ab01	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5658-0973-a731-40d5f0255c85	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5658-0973-3403-eccb6af14ac1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5658-0973-c820-f513a4d00d73	planer	Planer dogodkov v koledarju	t
00020000-5658-0973-8d33-0125896e10f8	kadrovska	Kadrovska služba	t
00020000-5658-0973-641f-960c49a5222d	arhivar	Ažuriranje arhivalij	t
00020000-5658-0973-114e-aa7b78870be5	igralec	Igralec	t
00020000-5658-0973-edf1-020ebdd48c5d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5658-0975-1146-0c319ca59a3c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5658-0975-802c-67eca76ce3a9	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5658-0975-ff8e-ee474474d5e3	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5658-0975-2409-8f97c8d80103	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5658-0975-c698-23e4f7dccfe8	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5658-0975-3ca4-e98b9c8984c9	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5658-0975-7b35-a5b5dea70b9b	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5658-0975-a328-cd89be7a1291	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5658-0975-2c48-54a12afc2d79	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5658-0975-cacd-1aea9cda8bab	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5658-0975-3a0d-e327d7fd634e	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5658-0975-9b5e-8c2ee82ae860	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5658-0975-b6ae-3223908e710b	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5658-0975-9b00-bbddc884fc7f	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5658-0975-abec-cb6fa2530419	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5658-0975-ab17-bbf473c7f659	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5658-0975-8d7b-98f404f14d81	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5658-0975-16f1-840a48ce7aa4	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5658-0975-c355-cea5edc088dc	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5658-0975-d748-64e64d5cc4e4	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5658-0975-a9e5-efcf50deb26e	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5658-0975-bfea-892bd0f4b1cd	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5658-0975-ac2b-5033d4a07e29	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5658-0975-8086-fa153b26cd8a	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5658-0975-7de2-9096c2bee57f	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5658-0975-39ea-e115bd0637bb	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5658-0975-46e9-4d17d2250f71	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5658-0975-5672-9c3f0f97d42e	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5658-0975-ec12-648d3a2dd7ca	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5658-0975-6a1c-a1a4025b4abd	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5658-0975-ad33-14a871424473	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5658-0975-8054-d887f32ec95a	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5658-0975-df04-1ed85c806a36	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5658-0975-60f0-5e65e349273d	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5658-0975-17aa-a3d20e96f5cd	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5658-0975-a65e-32030683ce72	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5658-0975-e5c9-09785149bd0b	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5658-0975-e09b-e49767921f87	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5658-0975-b89a-c7f672ebe459	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5658-0975-b788-604022a0e797	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5658-0975-c139-b08bc9f313a2	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5658-0975-49f1-cbf1640df21c	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5658-0975-0a52-bf5d28ce649d	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5658-0975-43e9-28560ccaea2b	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5658-0975-2faa-f328da9035ee	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5658-0975-7ced-1c30098a5b33	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5658-0975-a061-c4b206ec6444	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5658-0975-0c71-f6a718d2cbb4	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5658-0975-1329-4363f9397f98	mn-produkcija-stroskovnik-	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5658-0975-b654-aeabcbc6685a	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5658-0975-177a-222a9d199e5b	mn-produkcija-stroskovnik-splosno	omogoča akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5658-0975-9493-cf8b9a808a4a	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5658-0975-3f70-21f2db3f9839	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5658-0975-94ce-97a0453327d3	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
\.


--
-- TOC entry 3099 (class 0 OID 29805210)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5658-0974-d76e-3fe3efb7028b	00020000-5658-0973-a731-40d5f0255c85
00010000-5658-0974-09b8-65f8276cc305	00020000-5658-0973-a731-40d5f0255c85
00010000-5658-0975-ca1b-6d01b6067a30	00020000-5658-0975-1146-0c319ca59a3c
00010000-5658-0975-1131-f2cd67f28d0c	00020000-5658-0975-802c-67eca76ce3a9
00010000-5658-0975-1131-f2cd67f28d0c	00020000-5658-0975-3ca4-e98b9c8984c9
00010000-5658-0975-1131-f2cd67f28d0c	00020000-5658-0975-cacd-1aea9cda8bab
00010000-5658-0975-1131-f2cd67f28d0c	00020000-5658-0975-9b5e-8c2ee82ae860
00010000-5658-0975-1131-f2cd67f28d0c	00020000-5658-0975-abec-cb6fa2530419
00010000-5658-0975-1131-f2cd67f28d0c	00020000-5658-0975-8d7b-98f404f14d81
00010000-5658-0975-1131-f2cd67f28d0c	00020000-5658-0975-2409-8f97c8d80103
00010000-5658-0975-05f3-e36a353ba77e	00020000-5658-0975-802c-67eca76ce3a9
00010000-5658-0975-05f3-e36a353ba77e	00020000-5658-0975-ff8e-ee474474d5e3
00010000-5658-0975-05f3-e36a353ba77e	00020000-5658-0975-2409-8f97c8d80103
00010000-5658-0975-05f3-e36a353ba77e	00020000-5658-0975-c698-23e4f7dccfe8
00010000-5658-0975-efdb-66e58f1c7019	00020000-5658-0975-802c-67eca76ce3a9
00010000-5658-0975-efdb-66e58f1c7019	00020000-5658-0975-ff8e-ee474474d5e3
00010000-5658-0975-efdb-66e58f1c7019	00020000-5658-0975-2409-8f97c8d80103
00010000-5658-0975-efdb-66e58f1c7019	00020000-5658-0975-c698-23e4f7dccfe8
00010000-5658-0975-efdb-66e58f1c7019	00020000-5658-0975-9b5e-8c2ee82ae860
00010000-5658-0975-368a-129e8fe45b09	00020000-5658-0975-ff8e-ee474474d5e3
00010000-5658-0975-368a-129e8fe45b09	00020000-5658-0975-7b35-a5b5dea70b9b
00010000-5658-0975-368a-129e8fe45b09	00020000-5658-0975-3a0d-e327d7fd634e
00010000-5658-0975-368a-129e8fe45b09	00020000-5658-0975-b6ae-3223908e710b
00010000-5658-0975-368a-129e8fe45b09	00020000-5658-0975-9b5e-8c2ee82ae860
00010000-5658-0975-368a-129e8fe45b09	00020000-5658-0975-ab17-bbf473c7f659
00010000-5658-0975-e3f4-8b8ec6db15ca	00020000-5658-0975-ff8e-ee474474d5e3
00010000-5658-0975-e3f4-8b8ec6db15ca	00020000-5658-0975-7b35-a5b5dea70b9b
00010000-5658-0975-e3f4-8b8ec6db15ca	00020000-5658-0975-2c48-54a12afc2d79
00010000-5658-0975-e3f4-8b8ec6db15ca	00020000-5658-0975-3a0d-e327d7fd634e
00010000-5658-0975-e3f4-8b8ec6db15ca	00020000-5658-0975-b6ae-3223908e710b
00010000-5658-0975-e3f4-8b8ec6db15ca	00020000-5658-0975-9b5e-8c2ee82ae860
00010000-5658-0975-e3f4-8b8ec6db15ca	00020000-5658-0975-ab17-bbf473c7f659
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-ff8e-ee474474d5e3
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-2409-8f97c8d80103
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-7b35-a5b5dea70b9b
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-a328-cd89be7a1291
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-2c48-54a12afc2d79
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-3ca4-e98b9c8984c9
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-3a0d-e327d7fd634e
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-b6ae-3223908e710b
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-9b5e-8c2ee82ae860
00010000-5658-0975-e5f7-2d43695e9e64	00020000-5658-0975-ab17-bbf473c7f659
00010000-5658-0975-6d88-e0eb55685327	00020000-5658-0975-802c-67eca76ce3a9
00010000-5658-0975-6d88-e0eb55685327	00020000-5658-0975-c698-23e4f7dccfe8
00010000-5658-0975-6d88-e0eb55685327	00020000-5658-0975-3ca4-e98b9c8984c9
00010000-5658-0975-6d88-e0eb55685327	00020000-5658-0975-cacd-1aea9cda8bab
00010000-5658-0975-6d88-e0eb55685327	00020000-5658-0975-9b5e-8c2ee82ae860
00010000-5658-0975-6d88-e0eb55685327	00020000-5658-0975-abec-cb6fa2530419
00010000-5658-0975-6d88-e0eb55685327	00020000-5658-0975-8d7b-98f404f14d81
00010000-5658-0975-3028-8447123a257d	00020000-5658-0975-16f1-840a48ce7aa4
\.


--
-- TOC entry 3144 (class 0 OID 29805668)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 29805606)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 29805552)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5658-0975-f7fd-3ca0a9c0e73e	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5658-0975-30ee-6245393272e9	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5658-0975-855c-4ad386c159e2	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 29805175)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5658-0973-4599-cb9862862ae4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5658-0973-c5e0-d2abd760f1b1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5658-0973-6edf-7e115a8abd78	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5658-0973-49d6-82a997e78131	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5658-0973-43f6-63c0fa8ef1bc	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 29805167)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5658-0973-1504-e5fc8dd50841	00230000-5658-0973-49d6-82a997e78131	popa
00240000-5658-0973-c146-6866b1c3eae7	00230000-5658-0973-49d6-82a997e78131	oseba
00240000-5658-0973-be61-033f05007ec7	00230000-5658-0973-49d6-82a997e78131	tippopa
00240000-5658-0973-a4df-1658d64eee98	00230000-5658-0973-49d6-82a997e78131	organizacijskaenota
00240000-5658-0973-19b7-485712a3e339	00230000-5658-0973-49d6-82a997e78131	sezona
00240000-5658-0973-ffeb-96737d0c71f9	00230000-5658-0973-49d6-82a997e78131	tipvaje
00240000-5658-0973-c2bc-9f2fadb17985	00230000-5658-0973-c5e0-d2abd760f1b1	prostor
00240000-5658-0973-54f3-4b8dd0d29292	00230000-5658-0973-49d6-82a997e78131	besedilo
00240000-5658-0973-33f2-d9661a9530fb	00230000-5658-0973-49d6-82a997e78131	uprizoritev
00240000-5658-0973-0cb7-b9a168f3cba9	00230000-5658-0973-49d6-82a997e78131	funkcija
00240000-5658-0973-a50a-8c4fb0780c92	00230000-5658-0973-49d6-82a997e78131	tipfunkcije
00240000-5658-0973-9012-ec6c2a5b761a	00230000-5658-0973-49d6-82a997e78131	alternacija
00240000-5658-0973-f322-0ba665a08726	00230000-5658-0973-4599-cb9862862ae4	pogodba
00240000-5658-0973-77ed-8384ba3d11ce	00230000-5658-0973-49d6-82a997e78131	zaposlitev
00240000-5658-0973-4342-0ca175ddf377	00230000-5658-0973-49d6-82a997e78131	zvrstuprizoritve
00240000-5658-0973-b4ac-b43272621d85	00230000-5658-0973-4599-cb9862862ae4	programdela
00240000-5658-0973-e465-e6d400fc0dc0	00230000-5658-0973-49d6-82a997e78131	zapis
\.


--
-- TOC entry 3093 (class 0 OID 29805162)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d8ed61d2-52f2-48ba-aff1-38efa4fdeaa4	00240000-5658-0973-1504-e5fc8dd50841	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 29805733)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5658-0976-c234-2693bee0f9d3	000e0000-5658-0976-441b-1ea8cd5f298c	00080000-5658-0975-1408-c88a31d0a521	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5658-0973-d01b-f6414210eea9
00270000-5658-0976-6fbc-3a4fd2fd0471	000e0000-5658-0976-441b-1ea8cd5f298c	00080000-5658-0975-1408-c88a31d0a521	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5658-0973-d01b-f6414210eea9
\.


--
-- TOC entry 3109 (class 0 OID 29805310)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 29805562)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5658-0976-62e4-a4f2f415ce84	00180000-5658-0976-bb07-a767d113a1e2	000c0000-5658-0976-e1fd-a1fe1f6fc0b5	00090000-5658-0975-b854-d461d2ec256f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-0976-5daf-2ed2ea373d70	00180000-5658-0976-bb07-a767d113a1e2	000c0000-5658-0976-8367-ae56f6ffcf22	00090000-5658-0975-0e9b-2ba56ee774f9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-0976-7982-c4e4511ad97c	00180000-5658-0976-bb07-a767d113a1e2	000c0000-5658-0976-1353-d0f4f649d467	00090000-5658-0975-2e6d-078fe4591b7f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-0976-00aa-3d17999b034f	00180000-5658-0976-bb07-a767d113a1e2	000c0000-5658-0976-8f85-0fd2ec8a5038	00090000-5658-0975-e63a-ea582b8a13f7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-0976-43c8-a6d20495025c	00180000-5658-0976-bb07-a767d113a1e2	000c0000-5658-0976-b5cd-909f7fd75ecc	00090000-5658-0975-e940-9855853f6cd5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-0976-064a-a74041dd19cb	00180000-5658-0976-5159-2ad8d914cae7	\N	00090000-5658-0975-e940-9855853f6cd5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5658-0976-e56e-cc9c59706a5b	00180000-5658-0976-5159-2ad8d914cae7	\N	00090000-5658-0975-0e9b-2ba56ee774f9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 29805774)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5658-0973-cd9c-24283cbab5f9	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5658-0973-b5e7-fa6d062430fc	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5658-0973-b1df-8687792ea1f7	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5658-0973-3956-8a440e801a7a	04	Režija	Režija	Režija	umetnik	30
000f0000-5658-0973-c301-341fc0c0ace4	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5658-0973-b408-11e17f756eb3	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5658-0973-74ee-57a2403fb755	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5658-0973-15bf-a6cb152fcab2	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5658-0973-65a6-da36642218fa	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5658-0973-b706-c11d6c97b242	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5658-0973-8b37-a7ba68146ca6	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5658-0973-75ba-890d5e661b0d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5658-0973-8409-ef707084e8b4	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5658-0973-ddc0-d068342c63ec	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5658-0973-333c-5d164090ff31	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5658-0973-7a77-fb4c51b09b13	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5658-0973-afa5-e7cf6be36453	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5658-0973-3f7b-a30e6daaf866	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 29805261)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5658-0975-c923-ffdc89fd375b	0001	šola	osnovna ali srednja šola
00400000-5658-0975-95c1-e9d1928447b6	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5658-0975-c07c-89fcabbaad71	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 29806067)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5658-0973-2756-1686e50635a0	01	Velika predstava	f	1.00	1.00
002b0000-5658-0973-1d3b-fed35c5884c0	02	Mala predstava	f	0.50	0.50
002b0000-5658-0973-7736-8b22d21622bb	03	Mala koprodukcija	t	0.40	1.00
002b0000-5658-0973-7a36-66497aef7a86	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5658-0973-625f-6a104c5d5a67	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 29805542)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5658-0973-8cc0-e467787cd2fa	0001	prva vaja	prva vaja
00420000-5658-0973-821c-b6977699786a	0002	tehnična vaja	tehnična vaja
00420000-5658-0973-5b53-2f9385b9472c	0003	lučna vaja	lučna vaja
00420000-5658-0973-6c18-876a37924f89	0004	kostumska vaja	kostumska vaja
00420000-5658-0973-fd27-e8c0f21f4caa	0005	foto vaja	foto vaja
00420000-5658-0973-d217-38c03b1b3c39	0006	1. glavna vaja	1. glavna vaja
00420000-5658-0973-8648-9a7e18293450	0007	2. glavna vaja	2. glavna vaja
00420000-5658-0973-3696-e6e8486ecc69	0008	1. generalka	1. generalka
00420000-5658-0973-3098-604ea729af04	0009	2. generalka	2. generalka
00420000-5658-0973-55ea-527b45afc30e	0010	odprta generalka	odprta generalka
00420000-5658-0973-947c-a1b50d2d518f	0011	obnovitvena vaja	obnovitvena vaja
00420000-5658-0973-6498-5b8e8596f8ab	0012	pevska vaja	pevska vaja
00420000-5658-0973-a546-5aea0ac0c768	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5658-0973-fea0-3fe44ba31c02	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 29805383)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 29805197)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5658-0974-09b8-65f8276cc305	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRObPJ7sjThYUAd.K3J94IGF9JBKmPxgaK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5658-0975-0eeb-acea8071f10f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5658-0975-1408-9e9d492a5d55	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5658-0975-2d60-5c8a4eb7041e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5658-0975-a6c7-f768f7e27fb4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5658-0975-03d2-ecbba09220c4	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5658-0975-01d5-1fb0346a88e0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5658-0975-8035-b3d21b2ba797	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5658-0975-8ecd-6a5a9a24d340	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5658-0975-1aca-892db3d990e7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5658-0975-ca1b-6d01b6067a30	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5658-0975-8b30-64f5e59c0253	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5658-0975-1131-f2cd67f28d0c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5658-0975-05f3-e36a353ba77e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5658-0975-efdb-66e58f1c7019	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5658-0975-368a-129e8fe45b09	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5658-0975-e3f4-8b8ec6db15ca	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5658-0975-e5f7-2d43695e9e64	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5658-0975-6d88-e0eb55685327	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5658-0975-3028-8447123a257d	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5658-0974-d76e-3fe3efb7028b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 29805824)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5658-0976-5432-c58afe6c1912	00160000-5658-0975-81c3-4d6cee816e88	\N	00140000-5658-0973-5858-2f5b2e977bb2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5658-0975-784b-2ec5e556387b
000e0000-5658-0976-441b-1ea8cd5f298c	00160000-5658-0975-680d-ec27f1f05820	\N	00140000-5658-0973-4c4b-590157390da9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5658-0975-a05e-6e6b407329c8
000e0000-5658-0976-6341-0e39072bb001	\N	\N	00140000-5658-0973-4c4b-590157390da9	00190000-5658-0975-750e-0ebeeed06003	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5658-0975-784b-2ec5e556387b
000e0000-5658-0976-27d9-3417b8c80adf	\N	\N	00140000-5658-0973-4c4b-590157390da9	00190000-5658-0975-750e-0ebeeed06003	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5658-0975-784b-2ec5e556387b
000e0000-5658-0976-e8ea-37eb0ffc8cac	\N	\N	00140000-5658-0973-4c4b-590157390da9	00190000-5658-0975-750e-0ebeeed06003	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5658-0975-8922-2fe200d44b9e
000e0000-5658-0976-7b01-a3ed7aceef50	\N	\N	00140000-5658-0973-4c4b-590157390da9	00190000-5658-0975-750e-0ebeeed06003	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5658-0975-8922-2fe200d44b9e
\.


--
-- TOC entry 3123 (class 0 OID 29805482)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5658-0976-0e00-458b52d95ed1	\N	000e0000-5658-0976-441b-1ea8cd5f298c	1	
00200000-5658-0976-5c6f-717f63ab98c6	\N	000e0000-5658-0976-441b-1ea8cd5f298c	2	
00200000-5658-0976-7911-4e10ceeb6288	\N	000e0000-5658-0976-441b-1ea8cd5f298c	3	
00200000-5658-0976-ebb6-f8d9f794c159	\N	000e0000-5658-0976-441b-1ea8cd5f298c	4	
00200000-5658-0976-0ef9-f6706868cefd	\N	000e0000-5658-0976-441b-1ea8cd5f298c	5	
\.


--
-- TOC entry 3140 (class 0 OID 29805633)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 29805747)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5658-0973-7358-29bb66ea433c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5658-0973-a5d7-644338411b22	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5658-0973-a171-18c555503b70	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5658-0973-05e0-338aea8d9a09	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5658-0973-15d7-27746badd065	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5658-0973-e001-9f48d9b077df	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5658-0973-9d26-3e89e2bb7a4d	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5658-0973-eb6d-7999c1305dbf	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5658-0973-d01b-f6414210eea9	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5658-0973-b915-10c6fc5cf732	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5658-0973-08de-6bda8facacd1	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5658-0973-7196-2bd8de9c0cf2	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5658-0973-9e37-2509b5321231	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5658-0973-6113-01db388cf9d4	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5658-0973-ea60-85c691e8a125	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5658-0973-0eaa-fff556495222	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5658-0973-7a48-855f13610078	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5658-0973-ec8f-7d1215a18d4e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5658-0973-316a-665ac0c78dc6	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5658-0973-6151-cbafc494d787	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5658-0973-c18a-0213fda5c0ec	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5658-0973-84d2-f3e2386220e9	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5658-0973-f803-7b5646bd3979	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5658-0973-1d62-f585716bb90a	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5658-0973-6e49-dcfb1cf00f80	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5658-0973-a31e-5d5bd9b40451	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5658-0973-ce97-61be9c6913af	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5658-0973-b433-c3dd98700e58	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 29806117)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 29806086)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 29806129)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 29805705)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5658-0975-e3df-d76140433723	00090000-5658-0975-0e9b-2ba56ee774f9	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-0975-a3c4-c247fa4d3cae	00090000-5658-0975-2e6d-078fe4591b7f	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-0975-5466-1cc4f4d36902	00090000-5658-0975-6989-ed81a5ad388d	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-0975-aa2e-f26fa5fb170b	00090000-5658-0975-0e44-15475be1797d	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-0975-18f9-11a11f5b8f14	00090000-5658-0975-c8d9-a16daa7954e5	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-0975-f637-0334e12b1099	00090000-5658-0975-e655-38890ae62ea7	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 29805526)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 29805814)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5658-0973-5858-2f5b2e977bb2	01	Drama	drama (SURS 01)
00140000-5658-0973-cf3a-589911c30fdb	02	Opera	opera (SURS 02)
00140000-5658-0973-71ee-e682d1b0f8f8	03	Balet	balet (SURS 03)
00140000-5658-0973-9878-c3997b1797a8	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5658-0973-2576-59bad842cae8	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5658-0973-4c4b-590157390da9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5658-0973-8281-1d8ce9b212a2	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 29805695)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 29805260)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 29805873)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 29805863)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 29805251)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 29805730)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 29805772)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 29806170)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 29805514)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 29805536)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 29805541)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 29806084)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 29805409)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 29805941)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 29805691)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 29805480)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 29805447)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 29805423)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 29805598)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 29806147)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 29806154)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 29806178)
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
-- TOC entry 2726 (class 2606 OID 29805625)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 29805381)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 29805279)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 29805343)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 29805306)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 29805240)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 29805225)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 29805631)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 29805667)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 29805809)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 29805334)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 29805369)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 29806036)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 29805604)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 29805359)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 29805499)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 29805468)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 29805460)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 29805616)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 29806045)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 29806053)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 29806023)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 29806065)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 29805649)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 29805589)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 29805580)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 29805796)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 29805723)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 29805435)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 29805196)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 29805658)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 29805214)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 29805234)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 29805676)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 29805611)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 29805560)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 29805184)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 29805172)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 29805166)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 29805743)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 29805315)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 29805571)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 29805783)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 29805268)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 29806077)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 29805549)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 29805394)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 29805209)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 29805842)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 29805489)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 29805639)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 29805755)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 29806127)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 29806111)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 29806135)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 29805713)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 29805530)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 29805822)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 29805703)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 29805524)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 29805525)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 29805523)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 29805522)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 29805521)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 29805744)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 29805745)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 29805746)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 29806149)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 29806148)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 29805336)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 29805337)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 29805632)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 29806115)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 29806114)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 29806116)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 29806113)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 29806112)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 29805618)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 29805617)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 29805490)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 29805491)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 29805692)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 29805694)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 29805693)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 29805425)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 29805424)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 29806066)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 29805811)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 29805812)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 29805813)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 29806136)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 29805847)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 29805844)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 29805848)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 29805846)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 29805845)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 29805396)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 29805395)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 29805309)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 29805659)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 29805241)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 29805242)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 29805679)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 29805678)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 29805677)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 29805346)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 29805345)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 29805347)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 29805463)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 29805461)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 29805462)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 29805174)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 29805584)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 29805582)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 29805581)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 29805583)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 29805215)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 29805216)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 29805640)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 29806171)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 29805732)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 29805731)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 29806179)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 29806180)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 29805605)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 29805724)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 29805725)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 29805946)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 29805945)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 29805942)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 29805943)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 29805944)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 29805361)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 29805360)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 29805362)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 29805653)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 29805652)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 29806046)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 29806047)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 29805877)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 29805878)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 29805875)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 29805876)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 29805714)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 29805715)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 29805593)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 29805592)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 29805590)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 29805591)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 29805865)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 29805864)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 29805436)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 29805450)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 29805449)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 29805448)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 29805451)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 29805481)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 29805469)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 29805470)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 29806037)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 29806085)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 29806155)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 29806156)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 29805281)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 29805280)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 29805316)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 29805317)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 29805531)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 29805574)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 29805573)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 29805572)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 29805516)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 29805517)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 29805520)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 29805515)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 29805519)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 29805518)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 29805335)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 29805269)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 29805270)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 29805410)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 29805412)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 29805411)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 29805413)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 29805599)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 29805810)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 29805843)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 29805784)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 29805785)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 29805307)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 29805308)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 29805704)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 29805185)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 29805382)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 29805344)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 29805173)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 29806078)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 29805651)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 29805650)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 29805550)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 29805551)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 29805874)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 29805370)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 29805823)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 29806128)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 29806054)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 29806055)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 29805773)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 29805561)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 29805235)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 29806351)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 29806356)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 29806381)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 29806371)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 29806346)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 29806366)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 29806376)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 29806361)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 29806551)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 29806556)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 29806561)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 29806726)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 29806721)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 29806236)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 29806241)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 29806466)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 29806706)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 29806701)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 29806711)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 29806696)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 29806691)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 29806461)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 29806456)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 29806336)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 29806341)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 29806506)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 29806516)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 29806511)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 29806291)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 29806286)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 29806446)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 29806681)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 29806566)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 29806571)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 29806576)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 29806716)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 29806596)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 29806581)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 29806601)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 29806591)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 29806586)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 29806281)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 29806276)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 29806221)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 29806216)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 29806486)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 29806196)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 29806201)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 29806501)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 29806496)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 29806491)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 29806251)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 29806246)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 29806256)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 29806316)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 29806306)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 29806311)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 29806181)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 29806421)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 29806411)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 29806406)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 29806416)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 29806186)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 29806191)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 29806471)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 29806741)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 29806546)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 29806541)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 29806746)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 29806751)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 29806451)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 29806531)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 29806536)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 29806656)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 29806651)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 29806636)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 29806641)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 29806646)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 29806266)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 29806261)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 29806271)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 29806481)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 29806476)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 29806666)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 29806671)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 29806626)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 29806631)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 29806616)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 29806621)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 29806521)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 29806526)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 29806441)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 29806436)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 29806426)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 29806431)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 29806611)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 29806606)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 29806296)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 29806301)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 29806331)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 29806321)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 29806326)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 29806661)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 29806676)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 29806686)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 29806731)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 29806736)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 29806211)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 29806206)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 29806226)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 29806231)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 29806386)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 29806401)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 29806396)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 29806391)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-27 08:42:49 CET

--
-- PostgreSQL database dump complete
--

