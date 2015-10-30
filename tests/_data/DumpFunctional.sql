--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-30 14:10:24 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 252 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 252
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 24315469)
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
-- TOC entry 236 (class 1259 OID 24316077)
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
-- TOC entry 235 (class 1259 OID 24316060)
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
-- TOC entry 182 (class 1259 OID 24315462)
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
-- TOC entry 181 (class 1259 OID 24315460)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 226 (class 1259 OID 24315937)
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
-- TOC entry 229 (class 1259 OID 24315967)
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
-- TOC entry 250 (class 1259 OID 24316364)
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
-- TOC entry 203 (class 1259 OID 24315717)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_splosni_id uuid,
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
-- TOC entry 205 (class 1259 OID 24315748)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 24316290)
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
-- TOC entry 194 (class 1259 OID 24315614)
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
-- TOC entry 237 (class 1259 OID 24316090)
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
-- TOC entry 222 (class 1259 OID 24315891)
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
-- TOC entry 200 (class 1259 OID 24315688)
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
-- TOC entry 197 (class 1259 OID 24315654)
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
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 24315631)
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
-- TOC entry 211 (class 1259 OID 24315805)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 248 (class 1259 OID 24316345)
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
-- TOC entry 249 (class 1259 OID 24316357)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 24316379)
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
-- TOC entry 170 (class 1259 OID 24099025)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 24315830)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 24315588)
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
-- TOC entry 185 (class 1259 OID 24315488)
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
-- TOC entry 189 (class 1259 OID 24315555)
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
-- TOC entry 186 (class 1259 OID 24315499)
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
-- TOC entry 178 (class 1259 OID 24315434)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 24315453)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 24315837)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 24315871)
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
-- TOC entry 232 (class 1259 OID 24316008)
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
-- TOC entry 188 (class 1259 OID 24315535)
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
-- TOC entry 191 (class 1259 OID 24315580)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 24316235)
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
-- TOC entry 212 (class 1259 OID 24315811)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 24315565)
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
-- TOC entry 202 (class 1259 OID 24315709)
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
-- TOC entry 198 (class 1259 OID 24315669)
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
-- TOC entry 199 (class 1259 OID 24315681)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 24315823)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 24316249)
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
-- TOC entry 241 (class 1259 OID 24316259)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 238 (class 1259 OID 24316158)
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
-- TOC entry 242 (class 1259 OID 24316267)
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
-- TOC entry 218 (class 1259 OID 24315852)
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
-- TOC entry 210 (class 1259 OID 24315796)
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
-- TOC entry 209 (class 1259 OID 24315786)
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
-- TOC entry 231 (class 1259 OID 24315997)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 24315927)
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
-- TOC entry 196 (class 1259 OID 24315643)
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
-- TOC entry 175 (class 1259 OID 24315405)
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
-- TOC entry 174 (class 1259 OID 24315403)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 219 (class 1259 OID 24315865)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 24315443)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 24315427)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 24315879)
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
-- TOC entry 213 (class 1259 OID 24315817)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 207 (class 1259 OID 24315763)
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
-- TOC entry 173 (class 1259 OID 24315392)
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
-- TOC entry 172 (class 1259 OID 24315384)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 24315379)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 227 (class 1259 OID 24315944)
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
-- TOC entry 187 (class 1259 OID 24315527)
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
-- TOC entry 208 (class 1259 OID 24315773)
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
-- TOC entry 230 (class 1259 OID 24315985)
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
-- TOC entry 184 (class 1259 OID 24315478)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 243 (class 1259 OID 24316278)
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
-- TOC entry 206 (class 1259 OID 24315753)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 24315600)
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
-- TOC entry 176 (class 1259 OID 24315414)
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
-- TOC entry 234 (class 1259 OID 24316035)
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
-- TOC entry 201 (class 1259 OID 24315699)
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
-- TOC entry 217 (class 1259 OID 24315844)
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
-- TOC entry 228 (class 1259 OID 24315958)
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
-- TOC entry 246 (class 1259 OID 24316325)
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
-- TOC entry 245 (class 1259 OID 24316297)
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
-- TOC entry 247 (class 1259 OID 24316337)
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
-- TOC entry 224 (class 1259 OID 24315916)
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
-- TOC entry 204 (class 1259 OID 24315742)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 233 (class 1259 OID 24316025)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 223 (class 1259 OID 24315906)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2238 (class 2604 OID 24315465)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 24315408)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3093 (class 0 OID 24315469)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5633-6c3c-34b2-c2c2d873b2bf	10	30	Otroci	Abonma za otroke	200
000a0000-5633-6c3c-0340-e4fc4ad59774	20	60	Mladina	Abonma za mladino	400
000a0000-5633-6c3c-7e5f-2691a9ca20ab	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3146 (class 0 OID 24316077)
-- Dependencies: 236
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5633-6c3d-d806-c6ffbb4a0461	000d0000-5633-6c3d-64e7-07ed3b6319d4	\N	00090000-5633-6c3d-f31e-d745e1558e51	000b0000-5633-6c3d-e819-61a24963c78d	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5633-6c3d-2a39-e761b085796d	000d0000-5633-6c3d-cbc6-0fb8f382fe84	00100000-5633-6c3d-1ba3-49a79da54c8f	00090000-5633-6c3d-fd31-b494da40fd86	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5633-6c3d-71e9-8cda09bb4dde	000d0000-5633-6c3d-f8cd-e209ee1a9735	00100000-5633-6c3d-19ab-de474e6876d2	00090000-5633-6c3d-afd2-8217a84f69a0	\N	0003	t	\N	2015-10-30	\N	2	t	\N	f	f
000c0000-5633-6c3d-5216-b38a507ca046	000d0000-5633-6c3d-1f26-2a199996983a	\N	00090000-5633-6c3d-250a-a12ad23c1824	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5633-6c3d-2f62-b27647e356b0	000d0000-5633-6c3d-f0c6-61a67f88402a	\N	00090000-5633-6c3d-6b84-e1fd649751b2	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5633-6c3d-9f57-5942245f3bd5	000d0000-5633-6c3d-3629-cba792c581a5	\N	00090000-5633-6c3d-2b80-b1fd54a0f016	000b0000-5633-6c3d-d8df-19202ae76df4	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5633-6c3d-4675-dbfcf944a1a3	000d0000-5633-6c3d-13e7-27c161902ab2	00100000-5633-6c3d-bc8d-1dcab0853e11	00090000-5633-6c3d-de4b-43632e11f01c	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5633-6c3d-4d1f-40034a87a72d	000d0000-5633-6c3d-a778-a468425b656a	\N	00090000-5633-6c3d-a36b-48865c91e446	000b0000-5633-6c3d-6803-bf5dfa652411	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5633-6c3d-298d-72b9c469ab1e	000d0000-5633-6c3d-13e7-27c161902ab2	00100000-5633-6c3d-3325-949def7327c5	00090000-5633-6c3d-e239-b5d3c53e3b5a	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5633-6c3d-d454-252875f7f492	000d0000-5633-6c3d-13e7-27c161902ab2	00100000-5633-6c3d-4ad9-cd0d8def84f0	00090000-5633-6c3d-e7a0-9053bed7e04d	\N	0010	t	\N	2015-10-30	\N	16	f	\N	f	t
000c0000-5633-6c3d-2562-993ce1adc668	000d0000-5633-6c3d-13e7-27c161902ab2	00100000-5633-6c3d-15b0-9a38a4efdd69	00090000-5633-6c3d-46de-ac092853426c	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5633-6c3d-16fb-96d3a7b5695f	000d0000-5633-6c3d-9d43-4ea8c331b05b	00100000-5633-6c3d-1ba3-49a79da54c8f	00090000-5633-6c3d-fd31-b494da40fd86	000b0000-5633-6c3d-6285-2a10f5273ffa	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3145 (class 0 OID 24316060)
-- Dependencies: 235
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 24315462)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3136 (class 0 OID 24315937)
-- Dependencies: 226
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5633-6c3d-a38d-c636c552b44d	00160000-5633-6c3c-b86d-1cc23b771584	00090000-5633-6c3d-bd6a-984ea39656a2	aizv	10	t
003d0000-5633-6c3d-9dbf-7cef972cf43e	00160000-5633-6c3c-b86d-1cc23b771584	00090000-5633-6c3d-eee0-fe6c285b4bfc	apri	14	t
003d0000-5633-6c3d-546a-37bdd435591b	00160000-5633-6c3c-d4bd-52511c177c37	00090000-5633-6c3d-9269-96b3e7502f02	aizv	11	t
003d0000-5633-6c3d-677c-22cf057f5877	00160000-5633-6c3c-ce6a-d14617ce5535	00090000-5633-6c3d-8a96-dd3eb52dfd6d	aizv	12	t
003d0000-5633-6c3d-05a6-2442f5243f0f	00160000-5633-6c3c-b86d-1cc23b771584	00090000-5633-6c3d-41b6-ce132f69df5c	apri	18	f
\.


--
-- TOC entry 3139 (class 0 OID 24315967)
-- Dependencies: 229
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5633-6c3c-b86d-1cc23b771584	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5633-6c3c-d4bd-52511c177c37	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5633-6c3c-ce6a-d14617ce5535	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3160 (class 0 OID 24316364)
-- Dependencies: 250
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 24315717)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5633-6c3d-5e98-103910d280dc	\N	\N	00200000-5633-6c3d-0d4e-0d5792d5fac7	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5633-6c3d-2ca7-5e32699f91f6	\N	\N	00200000-5633-6c3d-29ac-bdda3bf67195	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5633-6c3d-3f5a-4c03199a6302	\N	\N	00200000-5633-6c3d-d253-6f90d07eefeb	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5633-6c3d-399a-75a81763a385	\N	\N	00200000-5633-6c3d-41ed-233ece90caff	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5633-6c3d-ef1a-32c72b1366a4	\N	\N	00200000-5633-6c3d-6519-7785987e64cf	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3115 (class 0 OID 24315748)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 24316290)
-- Dependencies: 244
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 24315614)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5633-6c3a-5666-f2208ad083cc	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5633-6c3a-24d9-b1554c5943d2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5633-6c3a-a983-9a08f6555946	AL	ALB	008	Albania 	Albanija	\N
00040000-5633-6c3a-1ad0-61eb425c256b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5633-6c3a-4e9a-988fad9a6022	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5633-6c3a-a3bd-2a8e83a1c66f	AD	AND	020	Andorra 	Andora	\N
00040000-5633-6c3a-c9b9-0fb472b12069	AO	AGO	024	Angola 	Angola	\N
00040000-5633-6c3a-9d08-56c77bc18cd6	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5633-6c3a-c3ff-32f509c88be4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5633-6c3a-b8f2-2f6bbccfa01b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5633-6c3a-b945-387eee38dc0b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5633-6c3a-0267-a3ac3990afd9	AM	ARM	051	Armenia 	Armenija	\N
00040000-5633-6c3a-d3d4-c2f41fefeeca	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5633-6c3a-3980-bf9cae965cff	AU	AUS	036	Australia 	Avstralija	\N
00040000-5633-6c3a-8fef-206fbd5e207d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5633-6c3a-1696-461daa3f960b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5633-6c3a-b607-4a236c1f06de	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5633-6c3a-ae72-b88ea51d72eb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5633-6c3a-2143-e9676c839db6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5633-6c3a-4c2b-b07b1714a55f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5633-6c3a-027d-c060ae8ccdfb	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5633-6c3a-1221-7da330bfe311	BE	BEL	056	Belgium 	Belgija	\N
00040000-5633-6c3a-3833-544a5dae668f	BZ	BLZ	084	Belize 	Belize	\N
00040000-5633-6c3a-2542-bd979e6d2685	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5633-6c3a-502e-b9a6e3940bc3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5633-6c3a-f0c9-84e1d4cd14eb	BT	BTN	064	Bhutan 	Butan	\N
00040000-5633-6c3a-f355-9962977c2860	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5633-6c3a-ef11-616346eb58d9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5633-6c3a-c6e6-64c8f978efa7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5633-6c3a-f63b-6334bcddc065	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5633-6c3a-2b6d-00d57b08117c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5633-6c3a-3481-e75962673a49	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5633-6c3a-f9bb-fd0a474eb86a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5633-6c3a-0aba-0af58427425c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5633-6c3a-2f40-53d6d1fbb2c9	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5633-6c3a-85ae-044640e1e8e9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5633-6c3a-8090-8d2a6f5cb555	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5633-6c3a-5c01-ca99fa6ac5ac	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5633-6c3a-fe26-be9e4e7a62e2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5633-6c3a-660f-a9dacbfbd3fe	CA	CAN	124	Canada 	Kanada	\N
00040000-5633-6c3a-1a9f-fce4c75a1b19	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5633-6c3a-f46f-41640b12b134	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5633-6c3a-ee54-23c2149d04c7	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5633-6c3a-fe3e-bb9c1e1b840b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5633-6c3a-9b15-e80420de8de9	CL	CHL	152	Chile 	Čile	\N
00040000-5633-6c3a-e06b-9a00cffb45d9	CN	CHN	156	China 	Kitajska	\N
00040000-5633-6c3a-adb0-7a2dc64991b6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5633-6c3a-807e-eb9d40dc00d6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5633-6c3a-d629-4eb4ed6dc3d8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5633-6c3a-8c2a-2047e44748a1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5633-6c3a-6594-cd7091ae6c9e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5633-6c3a-1262-3d4ced0907cc	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5633-6c3a-6c3e-1f50f54bdbd3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5633-6c3a-ff9e-bd6b152ee1c4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5633-6c3a-436e-a304dda883b9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5633-6c3a-4614-82b29651b7f3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5633-6c3a-2c5b-8cbd69ea9482	CU	CUB	192	Cuba 	Kuba	\N
00040000-5633-6c3a-5387-d1b727cdde0c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5633-6c3a-481c-572fd6e12103	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5633-6c3a-3bd3-1bfcffef6bb8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5633-6c3a-4584-b8b721f3af25	DK	DNK	208	Denmark 	Danska	\N
00040000-5633-6c3a-4f5b-e9307328d8c7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5633-6c3a-15e3-47bda8d62fac	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5633-6c3a-063c-3aa8255527d7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5633-6c3a-17b8-763d526726c0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5633-6c3a-f96c-d0b866c4eadc	EG	EGY	818	Egypt 	Egipt	\N
00040000-5633-6c3a-0cba-f1d114437c71	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5633-6c3a-cdd0-7b3f6669c498	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5633-6c3a-1399-2fd3d2e487ad	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5633-6c3a-d277-30c728207f2e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5633-6c3a-5bbc-71fd360d7ab4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5633-6c3a-e4c9-a4c74ab7bddf	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5633-6c3a-ee25-5e32bb42df50	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5633-6c3a-0087-b39b5a92ab5a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5633-6c3a-d07f-55725ff73d1f	FI	FIN	246	Finland 	Finska	\N
00040000-5633-6c3a-c424-d58e4a06f5fe	FR	FRA	250	France 	Francija	\N
00040000-5633-6c3a-94da-705c909e17ca	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5633-6c3a-bc3a-4b10eecab47c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5633-6c3a-aa7d-55181d71cda1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5633-6c3a-bb2d-8d890cb37005	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5633-6c3a-569c-c6bc965b7307	GA	GAB	266	Gabon 	Gabon	\N
00040000-5633-6c3a-d473-93a3c4d7d420	GM	GMB	270	Gambia 	Gambija	\N
00040000-5633-6c3a-8817-9f2cb2771e20	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5633-6c3a-25e2-83d3bc9a6529	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5633-6c3a-c4c1-75c3d89e03fc	GH	GHA	288	Ghana 	Gana	\N
00040000-5633-6c3a-3b0f-5710b78f1364	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5633-6c3a-c929-0a8fdb2ffcdf	GR	GRC	300	Greece 	Grčija	\N
00040000-5633-6c3a-0521-7d860023c475	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5633-6c3a-6fbf-51ba65f1e9de	GD	GRD	308	Grenada 	Grenada	\N
00040000-5633-6c3a-45dd-ba21d4e34929	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5633-6c3a-f2bd-bf8920e218ce	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5633-6c3a-282a-7c657a779ceb	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5633-6c3a-49ab-8191445e1c9c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5633-6c3a-bd00-37ff3bc9ef3b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5633-6c3a-ab42-818f6a3e8265	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5633-6c3a-28e3-2ec2fef82070	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5633-6c3a-620e-2b5ce391bc39	HT	HTI	332	Haiti 	Haiti	\N
00040000-5633-6c3a-48c0-2ad9e224675f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5633-6c3a-8971-69b93969d11c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5633-6c3a-6896-8409b244b75f	HN	HND	340	Honduras 	Honduras	\N
00040000-5633-6c3a-1515-aac47186f2b0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5633-6c3a-34b6-b5f503223cb6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5633-6c3a-3977-398c205340b8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5633-6c3a-dc7c-2583b9a40153	IN	IND	356	India 	Indija	\N
00040000-5633-6c3a-1eb9-9ce3f8050f0b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5633-6c3a-0c78-c73c918d2370	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5633-6c3a-7e36-442baff332bf	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5633-6c3a-509c-47718c490a59	IE	IRL	372	Ireland 	Irska	\N
00040000-5633-6c3a-201a-8b369bd69b8e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5633-6c3a-dc75-1fd95bd1f344	IL	ISR	376	Israel 	Izrael	\N
00040000-5633-6c3a-6f1f-da27cffb7412	IT	ITA	380	Italy 	Italija	\N
00040000-5633-6c3a-09eb-9e8cb0397296	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5633-6c3a-7990-f1a61b590d80	JP	JPN	392	Japan 	Japonska	\N
00040000-5633-6c3a-191a-092a364a8a2c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5633-6c3a-4fb3-99b3deee228c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5633-6c3a-2892-721ac9bfa8e8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5633-6c3a-fce0-3a506f487632	KE	KEN	404	Kenya 	Kenija	\N
00040000-5633-6c3a-aee2-744ae571868f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5633-6c3a-d1cb-414c88f2cc92	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5633-6c3a-5ec4-6dfe463efa70	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5633-6c3a-6671-0241001b94dc	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5633-6c3a-2fc1-14f85b340e53	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5633-6c3a-bbe5-e35ab7079688	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5633-6c3a-b231-df2b80d72384	LV	LVA	428	Latvia 	Latvija	\N
00040000-5633-6c3a-814f-8295e2b1db70	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5633-6c3a-76ad-1c061c6dbb11	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5633-6c3a-ec92-6161e9469583	LR	LBR	430	Liberia 	Liberija	\N
00040000-5633-6c3a-96aa-79e236bde60b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5633-6c3a-0b89-6e0b2cba1926	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5633-6c3a-e329-6212428f5401	LT	LTU	440	Lithuania 	Litva	\N
00040000-5633-6c3a-6b2b-23b910f26949	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5633-6c3a-0e9e-16cf371a057a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5633-6c3a-e003-81ea8d9fe829	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5633-6c3a-81a7-d00296886efc	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5633-6c3a-884f-c55699015e0f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5633-6c3a-8b16-9b0c97330fe7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5633-6c3a-8df7-83c7fdf1526d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5633-6c3a-0d12-631c2751f448	ML	MLI	466	Mali 	Mali	\N
00040000-5633-6c3a-73ae-edf8e1ffb27d	MT	MLT	470	Malta 	Malta	\N
00040000-5633-6c3a-ba34-8c98836f2c58	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5633-6c3a-0a18-ffdd4e9fd649	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5633-6c3a-60b4-f37841158b9c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5633-6c3a-8aca-5ca53ae98f3e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5633-6c3a-708d-b7ba7291686a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5633-6c3a-e6e4-3dc9a83b52f2	MX	MEX	484	Mexico 	Mehika	\N
00040000-5633-6c3a-e626-271c8149246d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5633-6c3a-9786-0d4deba95875	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5633-6c3a-ec54-8c73e1cdc7df	MC	MCO	492	Monaco 	Monako	\N
00040000-5633-6c3a-1f08-ea5ba702ee1e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5633-6c3a-9558-97612cad037c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5633-6c3a-f7ee-00953c119a15	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5633-6c3a-be16-9807e0db69f7	MA	MAR	504	Morocco 	Maroko	\N
00040000-5633-6c3a-4b57-fc990e266aa0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5633-6c3a-2f87-2065ef437f26	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5633-6c3a-5b4a-212f17c8286a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5633-6c3a-4b67-744a474c9842	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5633-6c3a-ada9-fed49f113e39	NP	NPL	524	Nepal 	Nepal	\N
00040000-5633-6c3a-3f7c-1c28e8836af4	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5633-6c3a-4508-b4a8452c10e2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5633-6c3a-99ac-9b806670a179	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5633-6c3a-08ff-d8af67dfe226	NE	NER	562	Niger 	Niger 	\N
00040000-5633-6c3a-5934-c35188ebbaf2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5633-6c3a-7b56-57ecd836acff	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5633-6c3a-72a9-1bfaee5fecf7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5633-6c3a-b6b0-3e10ef04a98f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5633-6c3a-daa0-af89fc02eb6b	NO	NOR	578	Norway 	Norveška	\N
00040000-5633-6c3a-86ef-8ce5a304b350	OM	OMN	512	Oman 	Oman	\N
00040000-5633-6c3a-9c55-e8d12bcb662e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5633-6c3a-883c-5828354e8ba8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5633-6c3a-30dc-877cca6732ae	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5633-6c3a-b9b6-c368adf6e997	PA	PAN	591	Panama 	Panama	\N
00040000-5633-6c3a-8b81-bca3417aed6a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5633-6c3a-79e9-a5ed233e8ed9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5633-6c3a-a321-849ad79f1622	PE	PER	604	Peru 	Peru	\N
00040000-5633-6c3a-b718-c84fcbb5c6d5	PH	PHL	608	Philippines 	Filipini	\N
00040000-5633-6c3a-b86d-dca00563aaee	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5633-6c3a-08f5-1bbcf77b23d7	PL	POL	616	Poland 	Poljska	\N
00040000-5633-6c3a-b300-5f30fea04f39	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5633-6c3a-4f71-fcd5abbf4bb2	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5633-6c3a-dd0a-3eb0b24d3b8f	QA	QAT	634	Qatar 	Katar	\N
00040000-5633-6c3a-e32a-3401d7178329	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5633-6c3a-4302-918fe16045af	RO	ROU	642	Romania 	Romunija	\N
00040000-5633-6c3a-bfa0-6edf17eba95d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5633-6c3a-802c-35f0d498976b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5633-6c3a-fc5b-90bf86a09519	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5633-6c3a-4d19-cb76d213e3df	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5633-6c3a-1f85-eb883997db24	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5633-6c3a-54c3-af7cb7595360	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5633-6c3a-b738-0bc06051f443	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5633-6c3a-1796-0777416e25fc	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5633-6c3a-4a30-e4ded1cb9cb3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5633-6c3a-1fd9-ec4ff7492bf0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5633-6c3a-e13e-3a50cc4bf00e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5633-6c3a-4369-121f1207b6b1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5633-6c3a-06f3-b0796b205564	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5633-6c3a-67ac-6d08d76c8e5f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5633-6c3a-1703-b0d37b062612	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5633-6c3a-85cb-7c402c9ab508	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5633-6c3a-df13-5d6fef144fd8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5633-6c3a-f86d-da0272b5d6c6	SG	SGP	702	Singapore 	Singapur	\N
00040000-5633-6c3a-ee7d-4e1de490ce58	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5633-6c3a-7c5d-c3bbae0a9c46	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5633-6c3a-d15a-81c1e66e1222	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5633-6c3a-d9ce-cebb884135d0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5633-6c3a-d91f-612620840cd5	SO	SOM	706	Somalia 	Somalija	\N
00040000-5633-6c3a-5c1f-ee30f9011bf5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5633-6c3a-39b5-b20b7840658e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5633-6c3a-401f-9b6214a5ad08	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5633-6c3a-bb14-d5665b1fd390	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5633-6c3a-23a3-ce13793f4fbb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5633-6c3a-f4ba-d2b809fbc8bc	SD	SDN	729	Sudan 	Sudan	\N
00040000-5633-6c3a-86ba-deeb5f5d4fe4	SR	SUR	740	Suriname 	Surinam	\N
00040000-5633-6c3a-d03a-0716eb6f5c84	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5633-6c3a-5309-5d51d26f9053	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5633-6c3a-3bef-2b14439770ee	SE	SWE	752	Sweden 	Švedska	\N
00040000-5633-6c3a-6ac5-7646b1d2360f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5633-6c3a-8867-1355863dbdff	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5633-6c3a-6005-9376cdb65737	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5633-6c3a-2148-6a0a58f8d629	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5633-6c3a-4aac-da3f18db9f90	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5633-6c3a-57dc-86575ce804db	TH	THA	764	Thailand 	Tajska	\N
00040000-5633-6c3a-6b72-3377c9008701	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5633-6c3a-798b-01709c0be2a8	TG	TGO	768	Togo 	Togo	\N
00040000-5633-6c3a-6a87-da21d7569e59	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5633-6c3a-f290-8bc5c680af87	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5633-6c3a-1685-9af33896326a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5633-6c3a-de8c-678c22273fb9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5633-6c3a-08dd-9821901ee41c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5633-6c3a-0abd-e4fb49ceea4d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5633-6c3a-ec05-bc10fce0697e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5633-6c3a-2850-a01f03b3887d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5633-6c3a-dfdc-5e899c679704	UG	UGA	800	Uganda 	Uganda	\N
00040000-5633-6c3a-6531-debd9f29745c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5633-6c3a-3881-72babbdc4968	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5633-6c3a-c818-372e0c512f75	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5633-6c3a-af7b-97881b385942	US	USA	840	United States 	Združene države Amerike	\N
00040000-5633-6c3a-a17a-83b1918b48a7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5633-6c3a-a581-08adb8aee955	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5633-6c3a-052b-828c1df5d2aa	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5633-6c3a-6244-d061904f87cf	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5633-6c3a-7678-aa84cc82c0a7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5633-6c3a-fd7e-704c5f860408	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5633-6c3a-87af-fc643d9f74df	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5633-6c3a-2a53-81fb3ddfb83b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5633-6c3a-9152-572e4343a93b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5633-6c3a-3b7c-9eb0d0f496ad	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5633-6c3a-7ace-231a8e5b46fb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5633-6c3a-50e5-ce065b76b363	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5633-6c3a-9961-3113c0c4f390	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3147 (class 0 OID 24316090)
-- Dependencies: 237
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5633-6c3d-0bea-5cb427f8503f	000e0000-5633-6c3d-1945-f974d3ba94b3	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5633-6c3a-930e-bb73b718c17e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5633-6c3d-c053-5bf9568d09b8	000e0000-5633-6c3d-85ce-1fd56fc01617	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5633-6c3a-d855-0b396d15b0d4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5633-6c3d-f857-aa63a1357fd8	000e0000-5633-6c3d-fea4-69a8f65158b8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5633-6c3a-930e-bb73b718c17e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5633-6c3d-4337-22a7045d75a1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5633-6c3d-ae83-21e940b8085b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3132 (class 0 OID 24315891)
-- Dependencies: 222
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5633-6c3d-13e7-27c161902ab2	000e0000-5633-6c3d-85ce-1fd56fc01617	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5633-6c3a-841f-e6544c603e7c
000d0000-5633-6c3d-64e7-07ed3b6319d4	000e0000-5633-6c3d-85ce-1fd56fc01617	000c0000-5633-6c3d-d806-c6ffbb4a0461	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5633-6c3a-841f-e6544c603e7c
000d0000-5633-6c3d-cbc6-0fb8f382fe84	000e0000-5633-6c3d-85ce-1fd56fc01617	000c0000-5633-6c3d-2a39-e761b085796d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5633-6c3a-7590-1190dadb27b0
000d0000-5633-6c3d-f8cd-e209ee1a9735	000e0000-5633-6c3d-85ce-1fd56fc01617	000c0000-5633-6c3d-71e9-8cda09bb4dde	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5633-6c3a-73f0-f3d742cd6ab4
000d0000-5633-6c3d-1f26-2a199996983a	000e0000-5633-6c3d-85ce-1fd56fc01617	000c0000-5633-6c3d-5216-b38a507ca046	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5633-6c3a-edd5-46426afdeb21
000d0000-5633-6c3d-f0c6-61a67f88402a	000e0000-5633-6c3d-85ce-1fd56fc01617	000c0000-5633-6c3d-2f62-b27647e356b0	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5633-6c3a-edd5-46426afdeb21
000d0000-5633-6c3d-3629-cba792c581a5	000e0000-5633-6c3d-85ce-1fd56fc01617	000c0000-5633-6c3d-9f57-5942245f3bd5	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5633-6c3a-841f-e6544c603e7c
000d0000-5633-6c3d-a778-a468425b656a	000e0000-5633-6c3d-85ce-1fd56fc01617	000c0000-5633-6c3d-4d1f-40034a87a72d	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5633-6c3a-24a0-2caadd752eb1
000d0000-5633-6c3d-9d43-4ea8c331b05b	000e0000-5633-6c3d-85ce-1fd56fc01617	000c0000-5633-6c3d-16fb-96d3a7b5695f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5633-6c3a-06d5-700652ae140a
\.


--
-- TOC entry 3110 (class 0 OID 24315688)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 24315654)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 24315631)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5633-6c3d-d71a-10c217e1ffe6	00080000-5633-6c3c-7c03-5984226b44ef	00090000-5633-6c3d-e7a0-9053bed7e04d	AK		igralka
\.


--
-- TOC entry 3121 (class 0 OID 24315805)
-- Dependencies: 211
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 24316345)
-- Dependencies: 248
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 24316357)
-- Dependencies: 249
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 24316379)
-- Dependencies: 251
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 24099025)
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
\.


--
-- TOC entry 3125 (class 0 OID 24315830)
-- Dependencies: 215
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 24315588)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5633-6c3b-4738-7001aed8f359	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5633-6c3b-49ae-a9d7c5a338cd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5633-6c3b-5a77-f46f5b09d971	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5633-6c3b-bfee-2e4e11b08cf3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5633-6c3b-4334-44a724fc6417	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5633-6c3b-94e6-07dd2f051c41	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5633-6c3b-44d8-2bb67e1054c8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5633-6c3b-ae9f-077ca6b9da1e	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5633-6c3b-915f-6f8904a8d001	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5633-6c3b-660c-c1f8ebcd99cb	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5633-6c3b-7971-98980dd6c286	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5633-6c3b-3dff-d44f31446b79	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5633-6c3b-427e-bb05e857f2ea	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5633-6c3b-9d52-dd836d81aca2	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5633-6c3b-bfdd-470bc6d2d764	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5633-6c3c-f6ed-0c24bd25793f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5633-6c3c-f342-0a2bde14a9f7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5633-6c3c-ef98-7669bf2907b8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5633-6c3c-d12b-0b36e448d62d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5633-6c3c-1e31-f71962572389	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5633-6c3e-d53d-a308dc876940	application.tenant.maticnopodjetje	string	s:36:"00080000-5633-6c3e-3538-b47753dc711d";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3095 (class 0 OID 24315488)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5633-6c3c-7ca4-acb5fc58c447	00000000-5633-6c3c-f6ed-0c24bd25793f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5633-6c3c-8f99-23355cb8af7c	00000000-5633-6c3c-f6ed-0c24bd25793f	00010000-5633-6c3b-8e26-86ee7a9daad4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5633-6c3c-2b73-cc77690106c6	00000000-5633-6c3c-f342-0a2bde14a9f7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3099 (class 0 OID 24315555)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5633-6c3d-d555-c0dbe092ff73	\N	00100000-5633-6c3d-1ba3-49a79da54c8f	00100000-5633-6c3d-19ab-de474e6876d2	01	Gledališče Nimbis
00410000-5633-6c3d-10e7-0e44df4aa061	00410000-5633-6c3d-d555-c0dbe092ff73	00100000-5633-6c3d-1ba3-49a79da54c8f	00100000-5633-6c3d-19ab-de474e6876d2	02	Tehnika
\.


--
-- TOC entry 3096 (class 0 OID 24315499)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5633-6c3d-f31e-d745e1558e51	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5633-6c3d-250a-a12ad23c1824	00010000-5633-6c3c-0d67-c59fa165fa2c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5633-6c3d-afd2-8217a84f69a0	00010000-5633-6c3c-d047-3824f905952c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5633-6c3d-e239-b5d3c53e3b5a	00010000-5633-6c3c-9b46-215bafb7db0f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5633-6c3d-87ac-0da4d3bfa615	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5633-6c3d-2b80-b1fd54a0f016	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5633-6c3d-46de-ac092853426c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5633-6c3d-de4b-43632e11f01c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5633-6c3d-e7a0-9053bed7e04d	00010000-5633-6c3c-8c43-f536795512ce	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5633-6c3d-fd31-b494da40fd86	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5633-6c3d-b5dd-e1137472cde3	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5633-6c3d-6b84-e1fd649751b2	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5633-6c3d-a36b-48865c91e446	00010000-5633-6c3c-3424-df654f3dbc6b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5633-6c3d-bd6a-984ea39656a2	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5633-6c3d-eee0-fe6c285b4bfc	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5633-6c3d-9269-96b3e7502f02	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5633-6c3d-8a96-dd3eb52dfd6d	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5633-6c3d-41b6-ce132f69df5c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5633-6c3d-4bf7-afd7089d8777	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5633-6c3d-9727-aca391763874	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5633-6c3d-5fc4-8421feaafccd	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3088 (class 0 OID 24315434)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5633-6c3a-4400-0d99c2b52b8f	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5633-6c3a-9977-4126fd8cbd0f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5633-6c3a-4e2e-935fd6fd1222	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5633-6c3a-ea53-188a28c0cbcf	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5633-6c3a-ce9d-9099f50339cb	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5633-6c3a-ad70-9c26494f32ce	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5633-6c3a-c099-e5f749db3d81	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5633-6c3a-8c00-5284348cf9ff	Abonma-read	Abonma - branje	t
00030000-5633-6c3a-d531-b8d357b2b073	Abonma-write	Abonma - spreminjanje	t
00030000-5633-6c3a-ecd0-3d7695418380	Alternacija-read	Alternacija - branje	t
00030000-5633-6c3a-90fd-db03234763cd	Alternacija-write	Alternacija - spreminjanje	t
00030000-5633-6c3a-ad25-d0f72709416f	Arhivalija-read	Arhivalija - branje	t
00030000-5633-6c3a-b22e-67edb7bfb2e1	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5633-6c3a-8ea6-012ce5ef403f	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5633-6c3a-a83f-36ab794314eb	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5633-6c3a-876c-f23279f2897c	Besedilo-read	Besedilo - branje	t
00030000-5633-6c3a-9baa-b91cf0bbec66	Besedilo-write	Besedilo - spreminjanje	t
00030000-5633-6c3a-51d6-65e80f7f6d59	DogodekIzven-read	DogodekIzven - branje	t
00030000-5633-6c3a-2983-4cadd6f62335	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-5633-6c3a-2d33-938636206770	Dogodek-read	Dogodek - branje	t
00030000-5633-6c3a-ff76-b126b5c7121c	Dogodek-write	Dogodek - spreminjanje	t
00030000-5633-6c3a-e2d7-e70dc2f6392d	DrugiVir-read	DrugiVir - branje	t
00030000-5633-6c3a-9d06-2d24ab3a4720	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5633-6c3a-2dad-e42938553a42	Drzava-read	Drzava - branje	t
00030000-5633-6c3a-53a1-546299415982	Drzava-write	Drzava - spreminjanje	t
00030000-5633-6c3a-12bd-de854bcaff47	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5633-6c3a-942e-4276c926daf0	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5633-6c3a-3232-3fd487f37b2c	Funkcija-read	Funkcija - branje	t
00030000-5633-6c3a-7ca7-21549aaba70a	Funkcija-write	Funkcija - spreminjanje	t
00030000-5633-6c3a-3a83-c379f60ff569	Gostovanje-read	Gostovanje - branje	t
00030000-5633-6c3a-ffe1-4100426bbf42	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5633-6c3a-9f33-b7c7df3e9794	Gostujoca-read	Gostujoca - branje	t
00030000-5633-6c3a-aec0-da7cff3f0d79	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5633-6c3a-55fb-a527bc4a33f7	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5633-6c3a-5f9e-b1bc31f85fd0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5633-6c3a-3f93-b473ace5488d	Kupec-read	Kupec - branje	t
00030000-5633-6c3a-3138-d27ab35c7807	Kupec-write	Kupec - spreminjanje	t
00030000-5633-6c3a-7776-c52642b91193	NacinPlacina-read	NacinPlacina - branje	t
00030000-5633-6c3a-f1b6-ad4d7d818f45	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5633-6c3a-4c54-12fc49818e13	Option-read	Option - branje	t
00030000-5633-6c3a-5fda-64edd8a16748	Option-write	Option - spreminjanje	t
00030000-5633-6c3a-c469-a3a633421c5d	OptionValue-read	OptionValue - branje	t
00030000-5633-6c3a-35e8-6360b937e5b0	OptionValue-write	OptionValue - spreminjanje	t
00030000-5633-6c3a-6a44-637aaaf01c0d	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5633-6c3a-69f2-729534ff7a1e	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5633-6c3a-0045-404e3fa8f92f	Oseba-read	Oseba - branje	t
00030000-5633-6c3a-77b2-217511465b68	Oseba-write	Oseba - spreminjanje	t
00030000-5633-6c3a-3deb-386c213939b1	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5633-6c3a-737e-15e334fec92f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5633-6c3a-e4bf-7b05f45a8705	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5633-6c3a-2cc4-c1c559136113	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5633-6c3a-7e69-e17f0729ad3f	Pogodba-read	Pogodba - branje	t
00030000-5633-6c3a-a1c6-2e2d38878231	Pogodba-write	Pogodba - spreminjanje	t
00030000-5633-6c3a-3f17-1bec674ff6f5	Popa-read	Popa - branje	t
00030000-5633-6c3a-6737-138ca1f795a5	Popa-write	Popa - spreminjanje	t
00030000-5633-6c3a-c2b1-db7876d92859	Posta-read	Posta - branje	t
00030000-5633-6c3a-d205-19ebb484dbb9	Posta-write	Posta - spreminjanje	t
00030000-5633-6c3a-6aed-b462bf447815	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5633-6c3a-01db-db6e0d15486e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5633-6c3a-1be4-8024bd94e3bc	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5633-6c3a-9fbd-159454d9b486	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5633-6c3a-47f3-cecb4cb89c95	PostniNaslov-read	PostniNaslov - branje	t
00030000-5633-6c3a-d60e-a1a8ae875a85	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5633-6c3a-c1af-b51b9657ff65	Predstava-read	Predstava - branje	t
00030000-5633-6c3a-6b10-adfb466e36ea	Predstava-write	Predstava - spreminjanje	t
00030000-5633-6c3a-7a19-834a771fa853	Praznik-read	Praznik - branje	t
00030000-5633-6c3a-cd95-26f280e90481	Praznik-write	Praznik - spreminjanje	t
00030000-5633-6c3a-723b-750db2d8fae0	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5633-6c3a-1205-d578066406df	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5633-6c3a-3e7d-4799d6c294e2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5633-6c3a-9ae2-2a35ceb23ced	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5633-6c3a-273a-5b1e507eaf2a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5633-6c3a-ea70-6b393011a3be	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5633-6c3a-19aa-211e746b12aa	ProgramDela-read	ProgramDela - branje	t
00030000-5633-6c3a-cc46-69c91cfb25b6	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5633-6c3a-6b87-99cf8728b58c	ProgramFestival-read	ProgramFestival - branje	t
00030000-5633-6c3a-4008-7144218d4930	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5633-6c3a-a8bf-503586ec1e76	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5633-6c3a-4704-b31d162b8144	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5633-6c3b-bc06-f18c8c9cac72	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5633-6c3b-efeb-a8f6848f241e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5633-6c3b-e2e7-fda6e269f70e	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5633-6c3b-8c35-760c67c878a1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5633-6c3b-38a8-0dd33a85e9bf	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5633-6c3b-3ccb-375152e84d83	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5633-6c3b-c250-e188e1f29f28	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5633-6c3b-b765-611c9ef06443	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5633-6c3b-06a7-4a6cc6592114	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5633-6c3b-32e3-1a42ad364900	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5633-6c3b-5b32-9f4463323e8c	ProgramRazno-read	ProgramRazno - branje	t
00030000-5633-6c3b-c5bb-118f77fb4669	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5633-6c3b-45f4-04ecf7fd18b0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5633-6c3b-62cc-540430453dcf	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5633-6c3b-eb73-870e14075c09	Prostor-read	Prostor - branje	t
00030000-5633-6c3b-dc1f-ffdaf1723e2f	Prostor-write	Prostor - spreminjanje	t
00030000-5633-6c3b-44d5-a19537c0d727	Racun-read	Racun - branje	t
00030000-5633-6c3b-72ca-48e79ee77859	Racun-write	Racun - spreminjanje	t
00030000-5633-6c3b-19bf-6033597ed3b7	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5633-6c3b-b2c6-fb73b286599f	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5633-6c3b-9a55-2093d8f215a3	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5633-6c3b-0093-3b6f7334ed58	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5633-6c3b-8a53-15e19f6b5473	Rekvizit-read	Rekvizit - branje	t
00030000-5633-6c3b-9bd7-add2b0cf8d36	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5633-6c3b-052d-61de92c5006f	Revizija-read	Revizija - branje	t
00030000-5633-6c3b-3be1-c84ce9ee2e4c	Revizija-write	Revizija - spreminjanje	t
00030000-5633-6c3b-7346-365813876b5e	Rezervacija-read	Rezervacija - branje	t
00030000-5633-6c3b-ae5c-72710ddbc64b	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5633-6c3b-3a75-cfe3a7dd1e30	SedezniRed-read	SedezniRed - branje	t
00030000-5633-6c3b-da88-93148bab3ccb	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5633-6c3b-87b7-837c61152e8a	Sedez-read	Sedez - branje	t
00030000-5633-6c3b-0366-c6f3c9fd49db	Sedez-write	Sedez - spreminjanje	t
00030000-5633-6c3b-57cb-85ffc25a6423	Sezona-read	Sezona - branje	t
00030000-5633-6c3b-b60f-8cf12ae9b01b	Sezona-write	Sezona - spreminjanje	t
00030000-5633-6c3b-4d76-165f85750536	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5633-6c3b-09a2-1039c5c1d5a6	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5633-6c3b-cb79-1acb4b1ba0ed	Stevilcenje-read	Stevilcenje - branje	t
00030000-5633-6c3b-cd7a-745e1251202a	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5633-6c3b-b38a-3e8f5ecebf14	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5633-6c3b-f563-da1857cf169d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5633-6c3b-32e5-edf736ae95d6	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5633-6c3b-845f-0e8a9ceeb849	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5633-6c3b-eece-6dcc082f0f11	Telefonska-read	Telefonska - branje	t
00030000-5633-6c3b-23e7-ec0df7dd8978	Telefonska-write	Telefonska - spreminjanje	t
00030000-5633-6c3b-d71f-62a84bfbcb2e	TerminStoritve-read	TerminStoritve - branje	t
00030000-5633-6c3b-967d-cd2c0553ccf6	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5633-6c3b-9994-686812981a4b	TipFunkcije-read	TipFunkcije - branje	t
00030000-5633-6c3b-4140-647c08e2388a	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5633-6c3b-8bbe-af3e55c3425c	TipPopa-read	TipPopa - branje	t
00030000-5633-6c3b-721a-f404cbec054c	TipPopa-write	TipPopa - spreminjanje	t
00030000-5633-6c3b-1a90-e338a3869405	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5633-6c3b-77e0-744174433a5d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5633-6c3b-b5b6-af4128c59e91	TipVaje-read	TipVaje - branje	t
00030000-5633-6c3b-00d0-1c01cabb9d76	TipVaje-write	TipVaje - spreminjanje	t
00030000-5633-6c3b-0ce4-b81586c00568	Trr-read	Trr - branje	t
00030000-5633-6c3b-6597-300bc4ff4367	Trr-write	Trr - spreminjanje	t
00030000-5633-6c3b-5095-412a66289820	Uprizoritev-read	Uprizoritev - branje	t
00030000-5633-6c3b-714c-97fb89364409	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5633-6c3b-9e24-5e74879e7ea4	Vaja-read	Vaja - branje	t
00030000-5633-6c3b-4ad7-326cddc62996	Vaja-write	Vaja - spreminjanje	t
00030000-5633-6c3b-deb9-48f770e7a6fa	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5633-6c3b-e10b-73bc009d0d83	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5633-6c3b-74e4-2a531901bde2	VrstaStroska-read	VrstaStroska - branje	t
00030000-5633-6c3b-2a5d-91e2d89b607d	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5633-6c3b-22ec-59882ab7d4ed	Zaposlitev-read	Zaposlitev - branje	t
00030000-5633-6c3b-9f61-130769b12d27	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5633-6c3b-a22f-c5478c3b3822	Zasedenost-read	Zasedenost - branje	t
00030000-5633-6c3b-faec-548f040808f7	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5633-6c3b-509c-9ba206b4d7df	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5633-6c3b-d234-efb14aa8335b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5633-6c3b-c982-5b92ff6bf9a8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5633-6c3b-7a5d-2749edf6bf12	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5633-6c3b-27cf-8e2d717d53a1	Job-read	Branje opravil - samo zase - branje	t
00030000-5633-6c3b-cebe-465e372b344f	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5633-6c3b-485c-ec6e775e1d61	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5633-6c3b-198a-92c0a6295386	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5633-6c3b-c43c-d95353f6461f	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5633-6c3b-2b1d-41e1be0d4cb2	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5633-6c3b-b302-d3f3e1730800	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5633-6c3b-2a00-b46147a7064c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5633-6c3b-a7fb-82409770e7ab	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5633-6c3b-ab60-06b6f92b0a3f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5633-6c3b-2cd0-6e926762e44d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5633-6c3b-37a5-be725f4dbb04	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5633-6c3b-abcb-1fa8765e56f7	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5633-6c3b-d76a-3ae1143df409	Datoteka-write	Datoteka - spreminjanje	t
00030000-5633-6c3b-277f-6da59c230329	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3090 (class 0 OID 24315453)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5633-6c3b-43d5-6e74ddded961	00030000-5633-6c3a-9977-4126fd8cbd0f
00020000-5633-6c3b-6605-3dd63c6ff174	00030000-5633-6c3a-2dad-e42938553a42
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-8c00-5284348cf9ff
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-d531-b8d357b2b073
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-ecd0-3d7695418380
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-90fd-db03234763cd
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-ad25-d0f72709416f
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-2d33-938636206770
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-ea53-188a28c0cbcf
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-ff76-b126b5c7121c
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-2dad-e42938553a42
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-53a1-546299415982
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-3232-3fd487f37b2c
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-7ca7-21549aaba70a
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-3a83-c379f60ff569
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-ffe1-4100426bbf42
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-9f33-b7c7df3e9794
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-aec0-da7cff3f0d79
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-55fb-a527bc4a33f7
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-5f9e-b1bc31f85fd0
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-4c54-12fc49818e13
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-c469-a3a633421c5d
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-0045-404e3fa8f92f
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-77b2-217511465b68
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-3f17-1bec674ff6f5
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-6737-138ca1f795a5
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-c2b1-db7876d92859
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-d205-19ebb484dbb9
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-47f3-cecb4cb89c95
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-d60e-a1a8ae875a85
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-c1af-b51b9657ff65
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-6b10-adfb466e36ea
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-273a-5b1e507eaf2a
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3a-ea70-6b393011a3be
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-eb73-870e14075c09
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-dc1f-ffdaf1723e2f
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-9a55-2093d8f215a3
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-0093-3b6f7334ed58
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-8a53-15e19f6b5473
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-9bd7-add2b0cf8d36
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-57cb-85ffc25a6423
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-b60f-8cf12ae9b01b
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-9994-686812981a4b
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-5095-412a66289820
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-714c-97fb89364409
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-9e24-5e74879e7ea4
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-4ad7-326cddc62996
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-a22f-c5478c3b3822
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-faec-548f040808f7
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-509c-9ba206b4d7df
00020000-5633-6c3b-7f80-469519e10e41	00030000-5633-6c3b-c982-5b92ff6bf9a8
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-8c00-5284348cf9ff
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-ad25-d0f72709416f
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-2d33-938636206770
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-2dad-e42938553a42
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-3a83-c379f60ff569
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-9f33-b7c7df3e9794
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-55fb-a527bc4a33f7
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-5f9e-b1bc31f85fd0
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-4c54-12fc49818e13
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-c469-a3a633421c5d
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-0045-404e3fa8f92f
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-77b2-217511465b68
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-3f17-1bec674ff6f5
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-c2b1-db7876d92859
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-47f3-cecb4cb89c95
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-d60e-a1a8ae875a85
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3a-c1af-b51b9657ff65
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-eb73-870e14075c09
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-9a55-2093d8f215a3
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-8a53-15e19f6b5473
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-57cb-85ffc25a6423
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-eece-6dcc082f0f11
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-23e7-ec0df7dd8978
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-0ce4-b81586c00568
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-6597-300bc4ff4367
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-22ec-59882ab7d4ed
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-9f61-130769b12d27
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-509c-9ba206b4d7df
00020000-5633-6c3b-9859-73daf39842d4	00030000-5633-6c3b-c982-5b92ff6bf9a8
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-8c00-5284348cf9ff
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-ecd0-3d7695418380
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-ad25-d0f72709416f
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-b22e-67edb7bfb2e1
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-876c-f23279f2897c
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-51d6-65e80f7f6d59
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-2d33-938636206770
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-2dad-e42938553a42
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-3232-3fd487f37b2c
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-3a83-c379f60ff569
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-9f33-b7c7df3e9794
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-55fb-a527bc4a33f7
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-4c54-12fc49818e13
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-c469-a3a633421c5d
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-0045-404e3fa8f92f
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-3f17-1bec674ff6f5
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-c2b1-db7876d92859
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-c1af-b51b9657ff65
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3a-273a-5b1e507eaf2a
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3b-eb73-870e14075c09
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3b-9a55-2093d8f215a3
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3b-8a53-15e19f6b5473
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3b-57cb-85ffc25a6423
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3b-9994-686812981a4b
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3b-9e24-5e74879e7ea4
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3b-a22f-c5478c3b3822
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3b-509c-9ba206b4d7df
00020000-5633-6c3b-a11b-3de96b320fb4	00030000-5633-6c3b-c982-5b92ff6bf9a8
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-8c00-5284348cf9ff
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-d531-b8d357b2b073
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-90fd-db03234763cd
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-ad25-d0f72709416f
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-2d33-938636206770
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-2dad-e42938553a42
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-3a83-c379f60ff569
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-9f33-b7c7df3e9794
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-4c54-12fc49818e13
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-c469-a3a633421c5d
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-3f17-1bec674ff6f5
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-c2b1-db7876d92859
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3a-c1af-b51b9657ff65
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3b-eb73-870e14075c09
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3b-9a55-2093d8f215a3
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3b-8a53-15e19f6b5473
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3b-57cb-85ffc25a6423
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3b-9994-686812981a4b
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3b-509c-9ba206b4d7df
00020000-5633-6c3b-ae44-13b20e034ee8	00030000-5633-6c3b-c982-5b92ff6bf9a8
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-8c00-5284348cf9ff
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-ad25-d0f72709416f
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-2d33-938636206770
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-2dad-e42938553a42
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-3a83-c379f60ff569
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-9f33-b7c7df3e9794
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-4c54-12fc49818e13
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-c469-a3a633421c5d
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-3f17-1bec674ff6f5
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-c2b1-db7876d92859
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-c1af-b51b9657ff65
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3b-eb73-870e14075c09
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3b-9a55-2093d8f215a3
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3b-8a53-15e19f6b5473
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3b-57cb-85ffc25a6423
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3b-d71f-62a84bfbcb2e
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3a-4e2e-935fd6fd1222
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3b-9994-686812981a4b
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3b-509c-9ba206b4d7df
00020000-5633-6c3b-1eb8-6a327f992f25	00030000-5633-6c3b-c982-5b92ff6bf9a8
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-4400-0d99c2b52b8f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-9977-4126fd8cbd0f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-8c00-5284348cf9ff
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-d531-b8d357b2b073
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-ecd0-3d7695418380
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-90fd-db03234763cd
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-ad25-d0f72709416f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-b22e-67edb7bfb2e1
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-8ea6-012ce5ef403f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-a83f-36ab794314eb
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-876c-f23279f2897c
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-9baa-b91cf0bbec66
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-51d6-65e80f7f6d59
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-2983-4cadd6f62335
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-2d33-938636206770
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-ea53-188a28c0cbcf
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-ff76-b126b5c7121c
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-e2d7-e70dc2f6392d
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-9d06-2d24ab3a4720
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-2dad-e42938553a42
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-53a1-546299415982
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-12bd-de854bcaff47
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-942e-4276c926daf0
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-3232-3fd487f37b2c
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-7ca7-21549aaba70a
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-3a83-c379f60ff569
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-ffe1-4100426bbf42
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-9f33-b7c7df3e9794
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-aec0-da7cff3f0d79
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-55fb-a527bc4a33f7
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-5f9e-b1bc31f85fd0
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-3f93-b473ace5488d
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-3138-d27ab35c7807
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-7776-c52642b91193
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-f1b6-ad4d7d818f45
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-4c54-12fc49818e13
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-c469-a3a633421c5d
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-35e8-6360b937e5b0
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-5fda-64edd8a16748
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-6a44-637aaaf01c0d
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-69f2-729534ff7a1e
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-0045-404e3fa8f92f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-ce9d-9099f50339cb
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-77b2-217511465b68
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-3deb-386c213939b1
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-737e-15e334fec92f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-e4bf-7b05f45a8705
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-2cc4-c1c559136113
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-7e69-e17f0729ad3f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-a1c6-2e2d38878231
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-3f17-1bec674ff6f5
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-6737-138ca1f795a5
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-c2b1-db7876d92859
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-6aed-b462bf447815
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-01db-db6e0d15486e
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-1be4-8024bd94e3bc
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-9fbd-159454d9b486
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-d205-19ebb484dbb9
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-47f3-cecb4cb89c95
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-d60e-a1a8ae875a85
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-7a19-834a771fa853
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-cd95-26f280e90481
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-c1af-b51b9657ff65
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-6b10-adfb466e36ea
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-723b-750db2d8fae0
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-1205-d578066406df
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-3e7d-4799d6c294e2
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-9ae2-2a35ceb23ced
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-273a-5b1e507eaf2a
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-ea70-6b393011a3be
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-ad70-9c26494f32ce
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-19aa-211e746b12aa
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-c099-e5f749db3d81
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-cc46-69c91cfb25b6
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-6b87-99cf8728b58c
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-4008-7144218d4930
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-a8bf-503586ec1e76
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-4704-b31d162b8144
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-bc06-f18c8c9cac72
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-efeb-a8f6848f241e
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-e2e7-fda6e269f70e
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-8c35-760c67c878a1
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-38a8-0dd33a85e9bf
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-3ccb-375152e84d83
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-c250-e188e1f29f28
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-b765-611c9ef06443
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-06a7-4a6cc6592114
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-32e3-1a42ad364900
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-5b32-9f4463323e8c
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-c5bb-118f77fb4669
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-45f4-04ecf7fd18b0
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-62cc-540430453dcf
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-eb73-870e14075c09
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-dc1f-ffdaf1723e2f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-44d5-a19537c0d727
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-72ca-48e79ee77859
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-19bf-6033597ed3b7
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-b2c6-fb73b286599f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-9a55-2093d8f215a3
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-0093-3b6f7334ed58
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-8a53-15e19f6b5473
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-9bd7-add2b0cf8d36
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-052d-61de92c5006f
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-3be1-c84ce9ee2e4c
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-7346-365813876b5e
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-ae5c-72710ddbc64b
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-3a75-cfe3a7dd1e30
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-da88-93148bab3ccb
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-87b7-837c61152e8a
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-0366-c6f3c9fd49db
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-57cb-85ffc25a6423
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-b60f-8cf12ae9b01b
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-4d76-165f85750536
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-09a2-1039c5c1d5a6
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-cb79-1acb4b1ba0ed
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-b38a-3e8f5ecebf14
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-f563-da1857cf169d
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-cd7a-745e1251202a
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-32e5-edf736ae95d6
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-845f-0e8a9ceeb849
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-eece-6dcc082f0f11
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-23e7-ec0df7dd8978
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-d71f-62a84bfbcb2e
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3a-4e2e-935fd6fd1222
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-967d-cd2c0553ccf6
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-9994-686812981a4b
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-4140-647c08e2388a
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-8bbe-af3e55c3425c
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-721a-f404cbec054c
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-1a90-e338a3869405
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-77e0-744174433a5d
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-b5b6-af4128c59e91
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-00d0-1c01cabb9d76
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-0ce4-b81586c00568
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-6597-300bc4ff4367
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-5095-412a66289820
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-714c-97fb89364409
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-9e24-5e74879e7ea4
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-4ad7-326cddc62996
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-deb9-48f770e7a6fa
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-e10b-73bc009d0d83
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-74e4-2a531901bde2
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-2a5d-91e2d89b607d
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-22ec-59882ab7d4ed
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-9f61-130769b12d27
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-a22f-c5478c3b3822
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-faec-548f040808f7
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-509c-9ba206b4d7df
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-d234-efb14aa8335b
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-c982-5b92ff6bf9a8
00020000-5633-6c3c-5b32-9490a1911e15	00030000-5633-6c3b-7a5d-2749edf6bf12
\.


--
-- TOC entry 3126 (class 0 OID 24315837)
-- Dependencies: 216
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 24315871)
-- Dependencies: 220
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 24316008)
-- Dependencies: 232
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5633-6c3d-e819-61a24963c78d	00090000-5633-6c3d-f31e-d745e1558e51	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5633-6c3d-d8df-19202ae76df4	00090000-5633-6c3d-2b80-b1fd54a0f016	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5633-6c3d-6803-bf5dfa652411	00090000-5633-6c3d-a36b-48865c91e446	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5633-6c3d-6285-2a10f5273ffa	00090000-5633-6c3d-fd31-b494da40fd86	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3098 (class 0 OID 24315535)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5633-6c3c-7c03-5984226b44ef	\N	00040000-5633-6c3a-d15a-81c1e66e1222	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5633-6c3c-65e8-7a57cf47d658	\N	00040000-5633-6c3a-d15a-81c1e66e1222	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5633-6c3c-2ccd-28643cab5b93	\N	00040000-5633-6c3a-d15a-81c1e66e1222	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5633-6c3d-27a1-ee9d6745ba06	\N	00040000-5633-6c3a-d15a-81c1e66e1222	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5633-6c3d-e665-905fc93e0482	\N	00040000-5633-6c3a-d15a-81c1e66e1222	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5633-6c3d-88a5-bdff5eba4163	\N	00040000-5633-6c3a-b945-387eee38dc0b	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5633-6c3d-bdb4-71451bc54ec6	\N	00040000-5633-6c3a-4614-82b29651b7f3	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5633-6c3d-1013-1528733676f8	\N	00040000-5633-6c3a-8fef-206fbd5e207d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5633-6c3d-a721-abaf2d55695b	\N	00040000-5633-6c3a-25e2-83d3bc9a6529	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5633-6c3e-3538-b47753dc711d	\N	00040000-5633-6c3a-d15a-81c1e66e1222	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3101 (class 0 OID 24315580)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5633-6c3a-cc20-e15db217bf03	8341	Adlešiči
00050000-5633-6c3a-c281-6a43e62e9524	5270	Ajdovščina
00050000-5633-6c3a-024a-106d4ef37076	6280	Ankaran/Ancarano
00050000-5633-6c3a-5589-23f2a3df3b24	9253	Apače
00050000-5633-6c3a-02c1-538de5d53a2a	8253	Artiče
00050000-5633-6c3a-e0dd-bded5f7cef43	4275	Begunje na Gorenjskem
00050000-5633-6c3a-1b56-56a3178b55ed	1382	Begunje pri Cerknici
00050000-5633-6c3a-c4d9-31a810b182a5	9231	Beltinci
00050000-5633-6c3a-a0d8-b32b909722b3	2234	Benedikt
00050000-5633-6c3a-015d-840c3929a3ff	2345	Bistrica ob Dravi
00050000-5633-6c3a-731f-6151f12237b4	3256	Bistrica ob Sotli
00050000-5633-6c3a-3047-98c2bdf35e05	8259	Bizeljsko
00050000-5633-6c3a-8a36-45ce416eaf8e	1223	Blagovica
00050000-5633-6c3a-e4cd-0e851795b263	8283	Blanca
00050000-5633-6c3a-e4fa-8a4593657153	4260	Bled
00050000-5633-6c3a-f256-a75211260665	4273	Blejska Dobrava
00050000-5633-6c3a-7207-34619478fe31	9265	Bodonci
00050000-5633-6c3a-86f8-41fb5e2f6141	9222	Bogojina
00050000-5633-6c3a-09f1-52fb65950373	4263	Bohinjska Bela
00050000-5633-6c3a-8a0a-7606b79cf5bb	4264	Bohinjska Bistrica
00050000-5633-6c3a-bcb8-3044c53da7d6	4265	Bohinjsko jezero
00050000-5633-6c3a-ccc4-b61adf043f8b	1353	Borovnica
00050000-5633-6c3a-428e-f87ad61288f6	8294	Boštanj
00050000-5633-6c3a-fe34-8b1eb17445bc	5230	Bovec
00050000-5633-6c3a-b5da-623a78964a9c	5295	Branik
00050000-5633-6c3a-1238-558896022969	3314	Braslovče
00050000-5633-6c3a-be32-c76d784a5de8	5223	Breginj
00050000-5633-6c3a-e074-7b8ac60e3196	8280	Brestanica
00050000-5633-6c3a-543d-52ae34c603d1	2354	Bresternica
00050000-5633-6c3a-4b60-5451c37bd401	4243	Brezje
00050000-5633-6c3a-d68f-5c65c1ed8b18	1351	Brezovica pri Ljubljani
00050000-5633-6c3a-f1e9-5bbddac802e5	8250	Brežice
00050000-5633-6c3a-4156-62c5916cd750	4210	Brnik - Aerodrom
00050000-5633-6c3a-75ca-78916171cee3	8321	Brusnice
00050000-5633-6c3a-3642-e916f20a89c7	3255	Buče
00050000-5633-6c3a-840e-f9a5ecdbf332	8276	Bučka 
00050000-5633-6c3a-4aa0-238c3818acf7	9261	Cankova
00050000-5633-6c3a-b3b5-99791419739e	3000	Celje 
00050000-5633-6c3a-5863-6d6ed18e4fa7	3001	Celje - poštni predali
00050000-5633-6c3a-e96f-733387f972a8	4207	Cerklje na Gorenjskem
00050000-5633-6c3a-c6f1-cd2e87443e87	8263	Cerklje ob Krki
00050000-5633-6c3a-46de-1becdd1b6c8d	1380	Cerknica
00050000-5633-6c3a-f71d-cb52f6c7f80d	5282	Cerkno
00050000-5633-6c3a-e2ed-db832be6595e	2236	Cerkvenjak
00050000-5633-6c3a-cb22-96c489a1002f	2215	Ceršak
00050000-5633-6c3a-9a97-b438f1cfce61	2326	Cirkovce
00050000-5633-6c3a-dfc6-a140429ee8bd	2282	Cirkulane
00050000-5633-6c3a-aa84-96a5479a9bcb	5273	Col
00050000-5633-6c3a-bc01-14f6f4a9d9ea	8251	Čatež ob Savi
00050000-5633-6c3a-4139-b83f05382892	1413	Čemšenik
00050000-5633-6c3a-9442-8e1b7e2f12ca	5253	Čepovan
00050000-5633-6c3a-6d6e-971a25e5577c	9232	Črenšovci
00050000-5633-6c3a-38e8-68dc58171485	2393	Črna na Koroškem
00050000-5633-6c3a-a805-e4285e8c5857	6275	Črni Kal
00050000-5633-6c3a-fcf7-1ff417d85739	5274	Črni Vrh nad Idrijo
00050000-5633-6c3a-c455-d3baee8cd1b4	5262	Črniče
00050000-5633-6c3a-e618-be0fc81d8b0d	8340	Črnomelj
00050000-5633-6c3a-5a53-a01997ea220a	6271	Dekani
00050000-5633-6c3a-588d-58b789687206	5210	Deskle
00050000-5633-6c3a-73da-29d1510f45fb	2253	Destrnik
00050000-5633-6c3a-168b-64bb8686ebdf	6215	Divača
00050000-5633-6c3a-baec-f3bc7b94e070	1233	Dob
00050000-5633-6c3a-9848-7f5f9bcf73f2	3224	Dobje pri Planini
00050000-5633-6c3a-d3f4-e67646d50f31	8257	Dobova
00050000-5633-6c3a-a2e4-eac5767dc5aa	1423	Dobovec
00050000-5633-6c3a-31ca-412b4e13d411	5263	Dobravlje
00050000-5633-6c3a-b82b-c7fce621b03c	3204	Dobrna
00050000-5633-6c3a-5313-cc4dfe8b0cfd	8211	Dobrnič
00050000-5633-6c3a-ced7-5d71f2312965	1356	Dobrova
00050000-5633-6c3a-f99f-daf26c9f078c	9223	Dobrovnik/Dobronak 
00050000-5633-6c3a-c2d4-4f2a6fe2134e	5212	Dobrovo v Brdih
00050000-5633-6c3a-bc01-7cf9662d7d07	1431	Dol pri Hrastniku
00050000-5633-6c3a-47f9-f7fea15b165b	1262	Dol pri Ljubljani
00050000-5633-6c3a-58a6-ae1b9432ad0a	1273	Dole pri Litiji
00050000-5633-6c3a-326e-621b3b97ad32	1331	Dolenja vas
00050000-5633-6c3a-2b35-df2201845860	8350	Dolenjske Toplice
00050000-5633-6c3a-85bf-4701b5b30f07	1230	Domžale
00050000-5633-6c3a-dd5d-db5003ce462e	2252	Dornava
00050000-5633-6c3a-4f5e-92a30306fa2e	5294	Dornberk
00050000-5633-6c3a-01ff-6c190a2bf07d	1319	Draga
00050000-5633-6c3a-0888-e451ae31aa52	8343	Dragatuš
00050000-5633-6c3a-ad8c-4e6fd14cfff0	3222	Dramlje
00050000-5633-6c3a-eec5-a483b9f3ec39	2370	Dravograd
00050000-5633-6c3a-9ed4-4fda248e80b9	4203	Duplje
00050000-5633-6c3a-0f9b-ddb2fb6756ee	6221	Dutovlje
00050000-5633-6c3a-0415-d7b903bf63c3	8361	Dvor
00050000-5633-6c3a-143b-3c775881d341	2343	Fala
00050000-5633-6c3a-4d3c-11b0ffb18a91	9208	Fokovci
00050000-5633-6c3a-a8e3-f942741f0604	2313	Fram
00050000-5633-6c3a-7697-c3457fcd3b45	3213	Frankolovo
00050000-5633-6c3a-15d8-db800a56f647	1274	Gabrovka
00050000-5633-6c3a-016b-ab2b229bc219	8254	Globoko
00050000-5633-6c3a-ef0a-824b27be587c	5275	Godovič
00050000-5633-6c3a-87f6-e79388ce533d	4204	Golnik
00050000-5633-6c3a-27b3-b06363029480	3303	Gomilsko
00050000-5633-6c3a-1a82-49812e9e8d4c	4224	Gorenja vas
00050000-5633-6c3a-9a98-27a01656e32a	3263	Gorica pri Slivnici
00050000-5633-6c3a-151b-1f77ec5505c2	2272	Gorišnica
00050000-5633-6c3a-13c9-6afe4c02e59a	9250	Gornja Radgona
00050000-5633-6c3a-db2c-ebfa86a19e1c	3342	Gornji Grad
00050000-5633-6c3a-0230-9cc4016df60c	4282	Gozd Martuljek
00050000-5633-6c3a-105d-5193d23020af	6272	Gračišče
00050000-5633-6c3a-71a1-97c30dbef685	9264	Grad
00050000-5633-6c3a-b78e-2120e8355bc7	8332	Gradac
00050000-5633-6c3a-cc84-0877e56ed914	1384	Grahovo
00050000-5633-6c3a-91bd-50b02731952b	5242	Grahovo ob Bači
00050000-5633-6c3a-eee2-1ababaa5fa66	5251	Grgar
00050000-5633-6c3a-fc07-214bd89e8f6e	3302	Griže
00050000-5633-6c3a-1451-daf7d764a4b1	3231	Grobelno
00050000-5633-6c3a-1ce6-f677b47232b5	1290	Grosuplje
00050000-5633-6c3a-d965-4ce31e8d3edd	2288	Hajdina
00050000-5633-6c3a-61b9-b12e9ff8f519	8362	Hinje
00050000-5633-6c3a-982c-567823a850d1	2311	Hoče
00050000-5633-6c3a-30cf-d1dbe5af1f3a	9205	Hodoš/Hodos
00050000-5633-6c3a-44e5-fa171826b79e	1354	Horjul
00050000-5633-6c3a-7205-5591831c4aab	1372	Hotedršica
00050000-5633-6c3a-5c35-003dcfa89200	1430	Hrastnik
00050000-5633-6c3a-266a-923d73b21bd2	6225	Hruševje
00050000-5633-6c3a-485a-6ed521512a2c	4276	Hrušica
00050000-5633-6c3a-b630-0a3a8872ae9c	5280	Idrija
00050000-5633-6c3a-9172-ae45f9a51e6f	1292	Ig
00050000-5633-6c3a-568d-9215c02d0d52	6250	Ilirska Bistrica
00050000-5633-6c3a-e53d-dca6a5f2f20f	6251	Ilirska Bistrica-Trnovo
00050000-5633-6c3a-0aa6-be5f42b537ae	1295	Ivančna Gorica
00050000-5633-6c3a-ec7d-de5bd32683e0	2259	Ivanjkovci
00050000-5633-6c3a-6402-6d19a5a1db9b	1411	Izlake
00050000-5633-6c3a-272f-b45699ded6ea	6310	Izola/Isola
00050000-5633-6c3a-3218-0049aa02e07d	2222	Jakobski Dol
00050000-5633-6c3a-0ac7-b2d33882cc04	2221	Jarenina
00050000-5633-6c3a-9144-bac5a59553c4	6254	Jelšane
00050000-5633-6c3a-08a7-8d9667566454	4270	Jesenice
00050000-5633-6c3a-3d7c-47ff635213fa	8261	Jesenice na Dolenjskem
00050000-5633-6c3a-323c-eb1b4e29b5ea	3273	Jurklošter
00050000-5633-6c3a-1e19-4b3bc12cd619	2223	Jurovski Dol
00050000-5633-6c3a-ee61-94157bada93a	2256	Juršinci
00050000-5633-6c3a-ea91-4e6add6eb9e8	5214	Kal nad Kanalom
00050000-5633-6c3a-d0a1-b3f8530e3e92	3233	Kalobje
00050000-5633-6c3a-bb75-5691229b2cb7	4246	Kamna Gorica
00050000-5633-6c3a-0b6b-0c51909c1042	2351	Kamnica
00050000-5633-6c3a-670e-0496183fd8bc	1241	Kamnik
00050000-5633-6c3a-dc55-c4cba50898df	5213	Kanal
00050000-5633-6c3a-e213-756313dbf733	8258	Kapele
00050000-5633-6c3a-add8-91bbfcdf39f0	2362	Kapla
00050000-5633-6c3a-813f-0879c467f51b	2325	Kidričevo
00050000-5633-6c3a-9908-96c9ac67c6ac	1412	Kisovec
00050000-5633-6c3a-835b-dc8532a8aac6	6253	Knežak
00050000-5633-6c3a-4c5d-608037140485	5222	Kobarid
00050000-5633-6c3a-a276-c474aa5ff629	9227	Kobilje
00050000-5633-6c3a-08bd-7cc95dddddfa	1330	Kočevje
00050000-5633-6c3a-ac04-4bea917647a1	1338	Kočevska Reka
00050000-5633-6c3a-cacc-d570636a50ea	2276	Kog
00050000-5633-6c3a-c082-ac21f004a299	5211	Kojsko
00050000-5633-6c3a-2122-a1ea6224728b	6223	Komen
00050000-5633-6c3a-57d0-0b7edece770b	1218	Komenda
00050000-5633-6c3a-1cb6-920e13db0d50	6000	Koper/Capodistria 
00050000-5633-6c3a-8cc0-01254f319cf8	6001	Koper/Capodistria - poštni predali
00050000-5633-6c3a-9f4d-e7a2b63e7d51	8282	Koprivnica
00050000-5633-6c3a-2b75-40f89230d60f	5296	Kostanjevica na Krasu
00050000-5633-6c3a-498b-c40d7897bc16	8311	Kostanjevica na Krki
00050000-5633-6c3a-8249-e55c9e3cf68c	1336	Kostel
00050000-5633-6c3a-5c81-7174f60078c5	6256	Košana
00050000-5633-6c3a-ab8b-25cf19c5dee4	2394	Kotlje
00050000-5633-6c3a-426c-b00f6c398c36	6240	Kozina
00050000-5633-6c3a-7cad-7bc2b1487ba5	3260	Kozje
00050000-5633-6c3a-d547-be616f82302d	4000	Kranj 
00050000-5633-6c3a-435b-9ed722a9796a	4001	Kranj - poštni predali
00050000-5633-6c3a-386c-bf888f4a69f7	4280	Kranjska Gora
00050000-5633-6c3a-9158-f89c21f070b3	1281	Kresnice
00050000-5633-6c3a-3799-c4987fbfc9d0	4294	Križe
00050000-5633-6c3a-8732-f4e478e37a80	9206	Križevci
00050000-5633-6c3a-2c6a-734365358eb7	9242	Križevci pri Ljutomeru
00050000-5633-6c3a-9e21-7df954abd4da	1301	Krka
00050000-5633-6c3a-0a67-fb8f748e4aeb	8296	Krmelj
00050000-5633-6c3a-87a4-cfe559b82e5a	4245	Kropa
00050000-5633-6c3a-eb71-008f9b8cadab	8262	Krška vas
00050000-5633-6c3a-1e6b-0dca5122f063	8270	Krško
00050000-5633-6c3a-8bb2-270d97bbd600	9263	Kuzma
00050000-5633-6c3a-3ec1-b332666c220b	2318	Laporje
00050000-5633-6c3a-1e7c-e7ba23f01c9f	3270	Laško
00050000-5633-6c3a-6f19-313b6e53ef2f	1219	Laze v Tuhinju
00050000-5633-6c3a-0242-6eaaccaa8efa	2230	Lenart v Slovenskih goricah
00050000-5633-6c3a-03a2-b6cd4bb8b642	9220	Lendava/Lendva
00050000-5633-6c3a-a828-a678ad28bd23	4248	Lesce
00050000-5633-6c3a-caff-ca9b761bf761	3261	Lesično
00050000-5633-6c3a-b91b-5ca352f21df0	8273	Leskovec pri Krškem
00050000-5633-6c3a-49d7-82ee1e0f81ca	2372	Libeliče
00050000-5633-6c3a-16a0-3d2650a5a49a	2341	Limbuš
00050000-5633-6c3a-ba88-01589293f72e	1270	Litija
00050000-5633-6c3a-3dd1-3d07170fa9df	3202	Ljubečna
00050000-5633-6c3a-7762-d39d352abbc5	1000	Ljubljana 
00050000-5633-6c3a-7841-f0416e02bc82	1001	Ljubljana - poštni predali
00050000-5633-6c3a-7600-75ecdafd4836	1231	Ljubljana - Črnuče
00050000-5633-6c3a-411c-a912a30c508f	1261	Ljubljana - Dobrunje
00050000-5633-6c3a-a442-8f35673c28fd	1260	Ljubljana - Polje
00050000-5633-6c3a-b7bb-eb7755f8f4b5	1210	Ljubljana - Šentvid
00050000-5633-6c3a-bb35-e1906c411224	1211	Ljubljana - Šmartno
00050000-5633-6c3a-6099-125194418dd0	3333	Ljubno ob Savinji
00050000-5633-6c3a-98fd-4f5ca6221793	9240	Ljutomer
00050000-5633-6c3a-02c1-451a844e3c4a	3215	Loče
00050000-5633-6c3a-dca3-6ada179500de	5231	Log pod Mangartom
00050000-5633-6c3a-8334-083ae16234ec	1358	Log pri Brezovici
00050000-5633-6c3a-5237-db59a817d4aa	1370	Logatec
00050000-5633-6c3a-a5d4-1fa5fc9664c4	1371	Logatec
00050000-5633-6c3a-3c18-0148ce3f1180	1434	Loka pri Zidanem Mostu
00050000-5633-6c3a-a1fe-aaf2d8720df0	3223	Loka pri Žusmu
00050000-5633-6c3a-1d4b-6a93d48a3d42	6219	Lokev
00050000-5633-6c3a-90de-3de83b23471f	1318	Loški Potok
00050000-5633-6c3a-f128-79384f23a3e5	2324	Lovrenc na Dravskem polju
00050000-5633-6c3a-d832-30b184a047b8	2344	Lovrenc na Pohorju
00050000-5633-6c3a-4851-c91a1440d2e5	3334	Luče
00050000-5633-6c3a-ee26-4239cf02e62a	1225	Lukovica
00050000-5633-6c3a-5931-98a2c5a16878	9202	Mačkovci
00050000-5633-6c3a-ba6f-2463f958cea1	2322	Majšperk
00050000-5633-6c3a-201a-6816cfb31b49	2321	Makole
00050000-5633-6c3a-506a-ba182d756eaf	9243	Mala Nedelja
00050000-5633-6c3a-ef5a-93e7ef1ee3e3	2229	Malečnik
00050000-5633-6c3a-2733-70a867b49be3	6273	Marezige
00050000-5633-6c3a-3ab9-17615cf1720e	2000	Maribor 
00050000-5633-6c3a-7b79-fcb5511807bb	2001	Maribor - poštni predali
00050000-5633-6c3a-cf29-5894fcbade4c	2206	Marjeta na Dravskem polju
00050000-5633-6c3a-f7e7-e8f609005c03	2281	Markovci
00050000-5633-6c3a-9435-98597858bd03	9221	Martjanci
00050000-5633-6c3a-f41f-009a236affbb	6242	Materija
00050000-5633-6c3a-e71f-d88b312cbe2f	4211	Mavčiče
00050000-5633-6c3a-bc49-85890f4bb167	1215	Medvode
00050000-5633-6c3a-f5b4-924f3b316f75	1234	Mengeš
00050000-5633-6c3a-ea2e-ecf309b02a36	8330	Metlika
00050000-5633-6c3a-c36f-21bb841ca4f6	2392	Mežica
00050000-5633-6c3a-610f-29f9676132a8	2204	Miklavž na Dravskem polju
00050000-5633-6c3a-0be9-9c4fbd8617dd	2275	Miklavž pri Ormožu
00050000-5633-6c3a-7e3f-887a47e323f5	5291	Miren
00050000-5633-6c3a-2ef6-3f3713bf84ca	8233	Mirna
00050000-5633-6c3a-20b9-4b9d267e36e3	8216	Mirna Peč
00050000-5633-6c3a-23a1-ee932982c265	2382	Mislinja
00050000-5633-6c3a-9383-9b2be5dfdab2	4281	Mojstrana
00050000-5633-6c3a-742f-e0afd21c4e6a	8230	Mokronog
00050000-5633-6c3a-858a-7cd21b89b9c6	1251	Moravče
00050000-5633-6c3a-b751-70eda106ed85	9226	Moravske Toplice
00050000-5633-6c3a-a50f-de7dc954b4fa	5216	Most na Soči
00050000-5633-6c3a-60d8-7a3baec74736	1221	Motnik
00050000-5633-6c3a-06a4-7bead0795ff2	3330	Mozirje
00050000-5633-6c3a-59b3-80bf5ecbc079	9000	Murska Sobota 
00050000-5633-6c3a-d4a8-9a32f90acde6	9001	Murska Sobota - poštni predali
00050000-5633-6c3a-1a9a-99f89330d916	2366	Muta
00050000-5633-6c3a-f9fe-6ddb1933d322	4202	Naklo
00050000-5633-6c3a-a361-2dd705ea548b	3331	Nazarje
00050000-5633-6c3a-4000-ce4b4548298a	1357	Notranje Gorice
00050000-5633-6c3a-fafd-80ccb39b37db	3203	Nova Cerkev
00050000-5633-6c3a-9b91-4163a420a488	5000	Nova Gorica 
00050000-5633-6c3a-9c64-a37dbf43b486	5001	Nova Gorica - poštni predali
00050000-5633-6c3a-b18d-3d28c83bd5d7	1385	Nova vas
00050000-5633-6c3a-d39c-2ae511506010	8000	Novo mesto
00050000-5633-6c3a-05f6-08cd51fb1c68	8001	Novo mesto - poštni predali
00050000-5633-6c3a-77d9-150bd747646f	6243	Obrov
00050000-5633-6c3a-1b5a-44ade12ed681	9233	Odranci
00050000-5633-6c3a-980f-741fd3e054b0	2317	Oplotnica
00050000-5633-6c3a-9dbe-01c8e4a95329	2312	Orehova vas
00050000-5633-6c3a-fc3f-193d5865d2cc	2270	Ormož
00050000-5633-6c3a-e63e-f886982b1725	1316	Ortnek
00050000-5633-6c3a-d41d-baaf40274940	1337	Osilnica
00050000-5633-6c3a-52a8-b32b79794c39	8222	Otočec
00050000-5633-6c3a-7353-39ed3aba0100	2361	Ožbalt
00050000-5633-6c3a-9c1f-e10d9201c7d4	2231	Pernica
00050000-5633-6c3a-34a5-2b1f99465111	2211	Pesnica pri Mariboru
00050000-5633-6c3a-5031-f4026b390e6f	9203	Petrovci
00050000-5633-6c3a-7d22-e59c89624a6c	3301	Petrovče
00050000-5633-6c3a-7007-2ed93a443149	6330	Piran/Pirano
00050000-5633-6c3a-3bde-6b5705c507ea	8255	Pišece
00050000-5633-6c3a-a5d3-21da163dae1a	6257	Pivka
00050000-5633-6c3a-f265-ccc1a9b0c886	6232	Planina
00050000-5633-6c3a-aee4-598440992f4f	3225	Planina pri Sevnici
00050000-5633-6c3a-4d12-8edea64135bd	6276	Pobegi
00050000-5633-6c3a-bd82-340186c69a8d	8312	Podbočje
00050000-5633-6c3a-fa93-ddbd87b196b1	5243	Podbrdo
00050000-5633-6c3a-85e2-ca84a4da76aa	3254	Podčetrtek
00050000-5633-6c3a-805e-e1cb7d8dc680	2273	Podgorci
00050000-5633-6c3a-3e21-770d45ed86cb	6216	Podgorje
00050000-5633-6c3a-50fd-08be3f7104f9	2381	Podgorje pri Slovenj Gradcu
00050000-5633-6c3a-72c5-eba0dd70e8de	6244	Podgrad
00050000-5633-6c3a-9445-c683881f0ef2	1414	Podkum
00050000-5633-6c3a-bb9b-c7a02dd7d619	2286	Podlehnik
00050000-5633-6c3a-42b4-b19c68dda993	5272	Podnanos
00050000-5633-6c3a-cb1b-f55a4593a3bb	4244	Podnart
00050000-5633-6c3a-0028-cd4f26fe4e37	3241	Podplat
00050000-5633-6c3a-b03b-c10799a7795b	3257	Podsreda
00050000-5633-6c3a-41a5-85871768f26e	2363	Podvelka
00050000-5633-6c3a-dbdb-7d8e6af4d416	2208	Pohorje
00050000-5633-6c3a-17f4-13c2e1435da3	2257	Polenšak
00050000-5633-6c3a-6fb9-4b4df93adc03	1355	Polhov Gradec
00050000-5633-6c3a-7387-482803c261c8	4223	Poljane nad Škofjo Loko
00050000-5633-6c3a-f72a-3de4f2706635	2319	Poljčane
00050000-5633-6c3a-5aac-c3866edbc0a5	1272	Polšnik
00050000-5633-6c3a-e2b1-8b6c8132cf29	3313	Polzela
00050000-5633-6c3a-9484-1f31ad48ace7	3232	Ponikva
00050000-5633-6c3a-2ed2-4d42c9e8aa93	6320	Portorož/Portorose
00050000-5633-6c3a-4fc6-5efe1dc23d9d	6230	Postojna
00050000-5633-6c3a-ef4d-0295d47fa454	2331	Pragersko
00050000-5633-6c3a-1896-8f16434b31ca	3312	Prebold
00050000-5633-6c3a-e9ab-465cfd2ce671	4205	Preddvor
00050000-5633-6c3a-31b3-5e0c946a8825	6255	Prem
00050000-5633-6c3a-dbf4-6fb6074ccdd1	1352	Preserje
00050000-5633-6c3a-16d6-c258a84a3ebb	6258	Prestranek
00050000-5633-6c3a-970f-161d80a70d4b	2391	Prevalje
00050000-5633-6c3a-b7aa-41302baf60ce	3262	Prevorje
00050000-5633-6c3a-c64d-fec1a1ce2a3d	1276	Primskovo 
00050000-5633-6c3a-954e-ceadd44b3a2b	3253	Pristava pri Mestinju
00050000-5633-6c3a-0b62-bfb34d132ca1	9207	Prosenjakovci/Partosfalva
00050000-5633-6c3a-e155-795b96ee52e5	5297	Prvačina
00050000-5633-6c3a-51d7-92e8d97a31b1	2250	Ptuj
00050000-5633-6c3a-7fe9-ae690919e419	2323	Ptujska Gora
00050000-5633-6c3a-3413-89fdd35279b9	9201	Puconci
00050000-5633-6c3a-a651-6ce3ec758d35	2327	Rače
00050000-5633-6c3a-309c-8d1610718038	1433	Radeče
00050000-5633-6c3a-1cfc-f6362c2d691a	9252	Radenci
00050000-5633-6c3a-110a-c6ddb19bb7b3	2360	Radlje ob Dravi
00050000-5633-6c3a-dbeb-de8fcb437231	1235	Radomlje
00050000-5633-6c3a-ab20-1c27adcb7c26	4240	Radovljica
00050000-5633-6c3a-c087-ea8247f702cf	8274	Raka
00050000-5633-6c3a-27a5-c72934d54a00	1381	Rakek
00050000-5633-6c3a-ad5c-3c488bf8272e	4283	Rateče - Planica
00050000-5633-6c3a-74d1-642281eeda31	2390	Ravne na Koroškem
00050000-5633-6c3a-d002-98aea840f0a9	9246	Razkrižje
00050000-5633-6c3a-54d6-272974d151ec	3332	Rečica ob Savinji
00050000-5633-6c3a-d96c-e6a6fe2bcfa0	5292	Renče
00050000-5633-6c3a-82f1-3b4dfa08efac	1310	Ribnica
00050000-5633-6c3a-4760-28ec6f3d7429	2364	Ribnica na Pohorju
00050000-5633-6c3a-76a8-f7801eb8407a	3272	Rimske Toplice
00050000-5633-6c3a-6818-451ab1996ca3	1314	Rob
00050000-5633-6c3a-2f96-c2ce8e750c51	5215	Ročinj
00050000-5633-6c3a-c048-9b2c2f6e1a39	3250	Rogaška Slatina
00050000-5633-6c3a-512c-a291e14903f2	9262	Rogašovci
00050000-5633-6c3a-1272-f947651626b6	3252	Rogatec
00050000-5633-6c3a-5e2c-81a536bbf793	1373	Rovte
00050000-5633-6c3a-060b-2cff5742ff0c	2342	Ruše
00050000-5633-6c3a-9f4c-2e0e912aeef5	1282	Sava
00050000-5633-6c3a-28cb-c4dfea95aede	6333	Sečovlje/Sicciole
00050000-5633-6c3a-7c04-7d9619e50297	4227	Selca
00050000-5633-6c3a-0ed9-dbd123ca4389	2352	Selnica ob Dravi
00050000-5633-6c3a-9cb4-854c5e9aa7fa	8333	Semič
00050000-5633-6c3a-f44f-3beb5ce9a749	8281	Senovo
00050000-5633-6c3a-ce6b-b706fad32d81	6224	Senožeče
00050000-5633-6c3a-64f0-1fa1162f8914	8290	Sevnica
00050000-5633-6c3a-404e-adb807ecb69f	6210	Sežana
00050000-5633-6c3a-4339-c63798d1eb6a	2214	Sladki Vrh
00050000-5633-6c3a-13e8-f7596ae22f4b	5283	Slap ob Idrijci
00050000-5633-6c3a-3462-33e17e9c47da	2380	Slovenj Gradec
00050000-5633-6c3a-66af-0c5b8df6eb0b	2310	Slovenska Bistrica
00050000-5633-6c3a-21ef-49666af67f50	3210	Slovenske Konjice
00050000-5633-6c3a-4b74-8c2d57f3734b	1216	Smlednik
00050000-5633-6c3a-7a69-92a8fb19569d	5232	Soča
00050000-5633-6c3a-d5de-f94767acc19c	1317	Sodražica
00050000-5633-6c3a-4c7a-bef332015764	3335	Solčava
00050000-5633-6c3a-6990-26a14d892a50	5250	Solkan
00050000-5633-6c3a-a53c-1067584ab13a	4229	Sorica
00050000-5633-6c3a-b783-ad010e0910d4	4225	Sovodenj
00050000-5633-6c3a-e367-bc6f6c9212ca	5281	Spodnja Idrija
00050000-5633-6c3a-1a07-d09795a1d0f0	2241	Spodnji Duplek
00050000-5633-6c3a-2df8-0afaca73c573	9245	Spodnji Ivanjci
00050000-5633-6c3a-8bda-f0933ba28a52	2277	Središče ob Dravi
00050000-5633-6c3a-8000-5b59f88befcb	4267	Srednja vas v Bohinju
00050000-5633-6c3a-2433-68ab08711f4a	8256	Sromlje 
00050000-5633-6c3a-f670-31e4ad18664d	5224	Srpenica
00050000-5633-6c3a-bd00-010d04c92f81	1242	Stahovica
00050000-5633-6c3a-e819-ccb56fc2d4cc	1332	Stara Cerkev
00050000-5633-6c3a-9d7b-9ca7a78c8ab7	8342	Stari trg ob Kolpi
00050000-5633-6c3a-20ff-6a61c5081f89	1386	Stari trg pri Ložu
00050000-5633-6c3a-90d3-a0d17777f58e	2205	Starše
00050000-5633-6c3a-fb04-8263215cec27	2289	Stoperce
00050000-5633-6c3a-0811-cd51ef0c393e	8322	Stopiče
00050000-5633-6c3a-f502-4107e939cff3	3206	Stranice
00050000-5633-6c3a-a957-51b53ac17c0f	8351	Straža
00050000-5633-6c3a-198e-58310c8b836f	1313	Struge
00050000-5633-6c3a-22b1-26d51db0c025	8293	Studenec
00050000-5633-6c3a-b096-44c37efb3c64	8331	Suhor
00050000-5633-6c3a-2e95-4be6c053d973	2233	Sv. Ana v Slovenskih goricah
00050000-5633-6c3a-4263-495792d6b0f3	2235	Sv. Trojica v Slovenskih goricah
00050000-5633-6c3a-a11e-847636df9f71	2353	Sveti Duh na Ostrem Vrhu
00050000-5633-6c3a-0ea5-79c0432a54e0	9244	Sveti Jurij ob Ščavnici
00050000-5633-6c3a-7c47-bd7550b6f653	3264	Sveti Štefan
00050000-5633-6c3a-5109-aea7685ab6cf	2258	Sveti Tomaž
00050000-5633-6c3a-e839-79015dae8ef6	9204	Šalovci
00050000-5633-6c3a-3fcd-77ebc2321336	5261	Šempas
00050000-5633-6c3a-f56a-2bf8d841c9db	5290	Šempeter pri Gorici
00050000-5633-6c3a-103a-9d98f3f2c64a	3311	Šempeter v Savinjski dolini
00050000-5633-6c3a-87c0-ed0f6c79935c	4208	Šenčur
00050000-5633-6c3a-a933-bc9fb24dadaa	2212	Šentilj v Slovenskih goricah
00050000-5633-6c3a-5414-d9bc0be64027	8297	Šentjanž
00050000-5633-6c3a-15b6-673c6bff7faf	2373	Šentjanž pri Dravogradu
00050000-5633-6c3a-1e5b-8a10a67f8cb2	8310	Šentjernej
00050000-5633-6c3a-7059-340f0f63e76c	3230	Šentjur
00050000-5633-6c3a-724e-6ee676342d62	3271	Šentrupert
00050000-5633-6c3a-1506-e1a9fd9894c3	8232	Šentrupert
00050000-5633-6c3a-3e83-057307900cdd	1296	Šentvid pri Stični
00050000-5633-6c3a-0e1d-5616655e8432	8275	Škocjan
00050000-5633-6c3a-a2dc-0b3c219179c0	6281	Škofije
00050000-5633-6c3a-2232-db158d13f1d8	4220	Škofja Loka
00050000-5633-6c3a-699d-571e2b7113bc	3211	Škofja vas
00050000-5633-6c3a-a8e9-d8829f04e1ba	1291	Škofljica
00050000-5633-6c3a-22df-f52a924ab4c7	6274	Šmarje
00050000-5633-6c3a-1944-8e5590f898dc	1293	Šmarje - Sap
00050000-5633-6c3a-fecf-1eec74215083	3240	Šmarje pri Jelšah
00050000-5633-6c3a-ab0e-4420c52400df	8220	Šmarješke Toplice
00050000-5633-6c3a-734e-02e97c3cdcd9	2315	Šmartno na Pohorju
00050000-5633-6c3a-c96d-260eb519d33d	3341	Šmartno ob Dreti
00050000-5633-6c3a-2501-e826aee45f4f	3327	Šmartno ob Paki
00050000-5633-6c3a-e729-54c0366ca1e9	1275	Šmartno pri Litiji
00050000-5633-6c3a-2c55-1d294f9e91ad	2383	Šmartno pri Slovenj Gradcu
00050000-5633-6c3a-160a-ab4cea30c18c	3201	Šmartno v Rožni dolini
00050000-5633-6c3a-07d7-0c2bd9cd61aa	3325	Šoštanj
00050000-5633-6c3a-ccdd-1bbfe8276c9a	6222	Štanjel
00050000-5633-6c3a-42b3-a9f611618b82	3220	Štore
00050000-5633-6c3a-a220-e36c29e954d9	3304	Tabor
00050000-5633-6c3a-5390-952d09405f8b	3221	Teharje
00050000-5633-6c3a-b934-d959cdcf3f94	9251	Tišina
00050000-5633-6c3a-6763-1a2c26ca868b	5220	Tolmin
00050000-5633-6c3a-3683-dc3b362386b6	3326	Topolšica
00050000-5633-6c3a-b968-ed4f8b10757b	2371	Trbonje
00050000-5633-6c3a-cf3a-ae1089875c45	1420	Trbovlje
00050000-5633-6c3a-9c20-b86ad256a087	8231	Trebelno 
00050000-5633-6c3a-404e-003e8ea7576a	8210	Trebnje
00050000-5633-6c3a-5c96-feb6b9a36e0d	5252	Trnovo pri Gorici
00050000-5633-6c3a-ac40-dae0d6d05eb9	2254	Trnovska vas
00050000-5633-6c3a-f302-5b5ce5cb2a59	1222	Trojane
00050000-5633-6c3a-468c-772447d8172b	1236	Trzin
00050000-5633-6c3a-26ce-66e7a4871a0d	4290	Tržič
00050000-5633-6c3a-ca68-7f12e614ed89	8295	Tržišče
00050000-5633-6c3a-b53d-76c54f817d66	1311	Turjak
00050000-5633-6c3a-2b03-73a7b7440618	9224	Turnišče
00050000-5633-6c3a-ca82-325b52c5f3f3	8323	Uršna sela
00050000-5633-6c3a-63eb-a053c8a20ddf	1252	Vače
00050000-5633-6c3a-7877-60a399437373	3320	Velenje 
00050000-5633-6c3a-af0f-3f4ac12de175	3322	Velenje - poštni predali
00050000-5633-6c3a-a7e2-667f18deee89	8212	Velika Loka
00050000-5633-6c3a-ed73-fe53ff9fe60a	2274	Velika Nedelja
00050000-5633-6c3a-5c81-015e24e0b3ce	9225	Velika Polana
00050000-5633-6c3a-b01e-63fb6930b913	1315	Velike Lašče
00050000-5633-6c3a-1197-891a546d2da9	8213	Veliki Gaber
00050000-5633-6c3a-728f-2056e1c185cf	9241	Veržej
00050000-5633-6c3a-1925-7a0539a1d7b6	1312	Videm - Dobrepolje
00050000-5633-6c3a-d0f4-4f24b025739b	2284	Videm pri Ptuju
00050000-5633-6c3a-74d8-53b54149aa33	8344	Vinica
00050000-5633-6c3a-49fe-36d0aa7cda3e	5271	Vipava
00050000-5633-6c3a-279d-5f82e6f686da	4212	Visoko
00050000-5633-6c3a-9147-4a544fce8245	1294	Višnja Gora
00050000-5633-6c3a-03cf-a9b33c6f10b2	3205	Vitanje
00050000-5633-6c3a-d9c9-42dbdff2fe57	2255	Vitomarci
00050000-5633-6c3a-32c8-0d34331e491a	1217	Vodice
00050000-5633-6c3a-67cd-ee9657dde4ec	3212	Vojnik\t
00050000-5633-6c3a-e4c6-5b44d2eb9ccf	5293	Volčja Draga
00050000-5633-6c3a-3f03-32547e6fcd7e	2232	Voličina
00050000-5633-6c3a-4576-15758da758ba	3305	Vransko
00050000-5633-6c3a-4c76-10a77c77b06a	6217	Vremski Britof
00050000-5633-6c3a-2e65-7ca79a60b306	1360	Vrhnika
00050000-5633-6c3a-1aeb-b6d042648b74	2365	Vuhred
00050000-5633-6c3a-bb25-968e3d6460f4	2367	Vuzenica
00050000-5633-6c3a-f60b-b05db04384ad	8292	Zabukovje 
00050000-5633-6c3a-47f5-e4911dac80f2	1410	Zagorje ob Savi
00050000-5633-6c3a-933c-e5ed8561f5e1	1303	Zagradec
00050000-5633-6c3a-4cfa-3359763ffeb0	2283	Zavrč
00050000-5633-6c3a-8fa0-800c2361bca9	8272	Zdole 
00050000-5633-6c3a-2f1f-9c889f4911f0	4201	Zgornja Besnica
00050000-5633-6c3a-8ddd-bc5409973431	2242	Zgornja Korena
00050000-5633-6c3a-0287-cbbab57e28ce	2201	Zgornja Kungota
00050000-5633-6c3a-311f-c3cccbd0268b	2316	Zgornja Ložnica
00050000-5633-6c3a-4f03-908104470086	2314	Zgornja Polskava
00050000-5633-6c3a-d2a6-b7f602aed997	2213	Zgornja Velka
00050000-5633-6c3a-e0d0-5c7b9ae5cd35	4247	Zgornje Gorje
00050000-5633-6c3a-b8c4-3437976f5a10	4206	Zgornje Jezersko
00050000-5633-6c3a-7588-5dd2949cf861	2285	Zgornji Leskovec
00050000-5633-6c3a-1b58-4b737a29b945	1432	Zidani Most
00050000-5633-6c3a-7b04-3c94e38657f1	3214	Zreče
00050000-5633-6c3a-1363-d26bbdda452d	4209	Žabnica
00050000-5633-6c3a-8e95-f4975eee7436	3310	Žalec
00050000-5633-6c3a-de80-e9c202357707	4228	Železniki
00050000-5633-6c3a-a413-713e0998efe5	2287	Žetale
00050000-5633-6c3a-e43f-5baeac0c01bb	4226	Žiri
00050000-5633-6c3a-c233-81ef0f56f997	4274	Žirovnica
00050000-5633-6c3a-57a1-18c9de23e6ec	8360	Žužemberk
\.


--
-- TOC entry 3149 (class 0 OID 24316235)
-- Dependencies: 239
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 24315811)
-- Dependencies: 212
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 24315565)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5633-6c3d-3cca-90ba364c9d8d	00080000-5633-6c3c-7c03-5984226b44ef	\N	00040000-5633-6c3a-d15a-81c1e66e1222	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5633-6c3d-67ed-d65a50011645	00080000-5633-6c3c-7c03-5984226b44ef	\N	00040000-5633-6c3a-d15a-81c1e66e1222	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5633-6c3d-b7bd-4369cd9df8a6	00080000-5633-6c3c-65e8-7a57cf47d658	\N	00040000-5633-6c3a-d15a-81c1e66e1222	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3112 (class 0 OID 24315709)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5633-6c3a-e137-31380cd91db7	novo leto	1	1	\N	t
00430000-5633-6c3a-cadf-482195bce507	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5633-6c3a-32b7-75ec8608c782	dan upora proti okupatorju	27	4	\N	t
00430000-5633-6c3a-fa59-dd9a751bffb3	praznik dela	1	5	\N	t
00430000-5633-6c3a-3308-d09da3f2272b	praznik dela	2	5	\N	t
00430000-5633-6c3a-6ef8-bffd7229abe0	dan Primoža Trubarja	8	6	\N	f
00430000-5633-6c3a-376d-0f8a8d8ac35f	dan državnosti	25	6	\N	t
00430000-5633-6c3a-683e-8a30d4e97690	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5633-6c3a-5c91-9509a9b01df7	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5633-6c3a-06e6-af0a48525cba	dan suverenosti	25	10	\N	f
00430000-5633-6c3a-f7e7-d9f6e3720158	dan spomina na mrtve	1	11	\N	t
00430000-5633-6c3a-791b-e087e8a5e40d	dan Rudolfa Maistra	23	11	\N	f
00430000-5633-6c3a-01c7-b0472367bc39	božič	25	12	\N	t
00430000-5633-6c3a-a0e1-8b2d24d4eb12	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5633-6c3a-51b8-8dbb57ce86e8	Marijino vnebovzetje	15	8	\N	t
00430000-5633-6c3a-2db9-9021b6bac309	dan reformacije	31	10	\N	t
00430000-5633-6c3a-d6dc-7249b295af71	velikonočna nedelja	27	3	2016	t
00430000-5633-6c3a-28f9-0989a0c49519	velikonočna nedelja	16	4	2017	t
00430000-5633-6c3a-68d7-e48e16265c33	velikonočna nedelja	1	4	2018	t
00430000-5633-6c3a-9df6-cbe8cb2e7776	velikonočna nedelja	21	4	2019	t
00430000-5633-6c3a-8618-2d7744abbd9e	velikonočna nedelja	12	4	2020	t
00430000-5633-6c3a-2d61-f1b08d07cab1	velikonočna nedelja	4	4	2021	t
00430000-5633-6c3a-559f-81a4ebbac35c	velikonočna nedelja	17	4	2022	t
00430000-5633-6c3a-1324-30f983dc5b97	velikonočna nedelja	9	4	2023	t
00430000-5633-6c3a-46cf-1c9a9355ecc8	velikonočna nedelja	31	3	2024	t
00430000-5633-6c3a-814e-f5cd236a9df4	velikonočna nedelja	20	4	2025	t
00430000-5633-6c3a-e095-142517899ac2	velikonočna nedelja	5	4	2026	t
00430000-5633-6c3a-ad34-5b5dd79d95c6	velikonočna nedelja	28	3	2027	t
00430000-5633-6c3a-65f1-a27baa9e1693	velikonočna nedelja	16	4	2028	t
00430000-5633-6c3a-c242-fe912cf6d3da	velikonočna nedelja	1	4	2029	t
00430000-5633-6c3a-50fd-855406131981	velikonočna nedelja	21	4	2030	t
00430000-5633-6c3a-7614-6ef37f33ae17	velikonočni ponedeljek	28	3	2016	t
00430000-5633-6c3a-4887-d4e881b19979	velikonočni ponedeljek	17	4	2017	t
00430000-5633-6c3a-596e-8e05f8661dc8	velikonočni ponedeljek	2	4	2018	t
00430000-5633-6c3a-440c-dc9acd15d64e	velikonočni ponedeljek	22	4	2019	t
00430000-5633-6c3a-9e9e-dcb76c75c83c	velikonočni ponedeljek	13	4	2020	t
00430000-5633-6c3a-9437-6f54386b4ab6	velikonočni ponedeljek	5	4	2021	t
00430000-5633-6c3a-6b5a-df3799f199b8	velikonočni ponedeljek	18	4	2022	t
00430000-5633-6c3a-d69e-d44b0b6dc143	velikonočni ponedeljek	10	4	2023	t
00430000-5633-6c3a-6c26-ef22db308195	velikonočni ponedeljek	1	4	2024	t
00430000-5633-6c3a-9b85-a33fe973432c	velikonočni ponedeljek	21	4	2025	t
00430000-5633-6c3a-71d2-831d72a4f52d	velikonočni ponedeljek	6	4	2026	t
00430000-5633-6c3a-b327-b366cd128bad	velikonočni ponedeljek	29	3	2027	t
00430000-5633-6c3a-3a0d-05c4868179d8	velikonočni ponedeljek	17	4	2028	t
00430000-5633-6c3a-3292-89b532faa472	velikonočni ponedeljek	2	4	2029	t
00430000-5633-6c3a-94b0-44942760b738	velikonočni ponedeljek	22	4	2030	t
00430000-5633-6c3a-4d4f-c4bf49670616	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5633-6c3a-8b7f-398856cb1d3e	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5633-6c3a-cb4e-2d808d0b35c8	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5633-6c3a-1621-bfb30dfadb3a	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5633-6c3a-c47d-e45d16cd2349	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5633-6c3a-26c3-ef5d4b37f13c	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5633-6c3a-9bd9-7d25424aec37	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5633-6c3a-96c8-a3416cd91c13	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5633-6c3a-6b73-6bb11523e9aa	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5633-6c3a-1906-89be519a3770	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5633-6c3a-084d-6bae28532c03	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5633-6c3a-603f-31805a481e7b	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5633-6c3a-8acd-b45588894e78	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5633-6c3a-5644-3939f203d033	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5633-6c3a-21f7-748f17aec755	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3108 (class 0 OID 24315669)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 24315681)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 24315823)
-- Dependencies: 214
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 24316249)
-- Dependencies: 240
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 24316259)
-- Dependencies: 241
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5633-6c3d-8a83-3b7d6e840038	00080000-5633-6c3c-2ccd-28643cab5b93	0987	AK
00190000-5633-6c3d-12a3-0b7eb0f192ac	00080000-5633-6c3c-65e8-7a57cf47d658	0989	AK
00190000-5633-6c3d-a9ba-cc538c5373ce	00080000-5633-6c3d-27a1-ee9d6745ba06	0986	AK
00190000-5633-6c3d-5583-05c69ff39524	00080000-5633-6c3d-88a5-bdff5eba4163	0984	AK
00190000-5633-6c3d-33d0-fa3d6c1b4609	00080000-5633-6c3d-bdb4-71451bc54ec6	0983	AK
00190000-5633-6c3d-0a5a-36d24b06c495	00080000-5633-6c3d-1013-1528733676f8	0982	AK
00190000-5633-6c3e-b888-dc811ef75f71	00080000-5633-6c3e-3538-b47753dc711d	1001	AK
\.


--
-- TOC entry 3148 (class 0 OID 24316158)
-- Dependencies: 238
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5633-6c3d-6ecc-b448b71ff24b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3152 (class 0 OID 24316267)
-- Dependencies: 242
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 24315852)
-- Dependencies: 218
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5633-6c3c-869d-f9239f6b8ff6	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5633-6c3c-7afb-b43194beaa0d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5633-6c3c-67ac-f7ed295d87d8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5633-6c3c-c6e8-f60a77391369	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5633-6c3c-ab64-943cf304ea71	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5633-6c3c-6f54-fc365ef1a4b1	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5633-6c3c-fa94-d18e7ccb5489	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3120 (class 0 OID 24315796)
-- Dependencies: 210
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 24315786)
-- Dependencies: 209
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 24315997)
-- Dependencies: 231
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 24315927)
-- Dependencies: 225
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 24315643)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 24315405)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5633-6c3e-3538-b47753dc711d	00010000-5633-6c3b-524f-9153cc77d3b5	2015-10-30 14:10:22	INS	a:0:{}
2	App\\Entity\\Option	00000000-5633-6c3e-d53d-a308dc876940	00010000-5633-6c3b-524f-9153cc77d3b5	2015-10-30 14:10:22	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5633-6c3e-b888-dc811ef75f71	00010000-5633-6c3b-524f-9153cc77d3b5	2015-10-30 14:10:22	INS	a:0:{}
\.


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3129 (class 0 OID 24315865)
-- Dependencies: 219
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 24315443)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5633-6c3b-43d5-6e74ddded961	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5633-6c3b-6605-3dd63c6ff174	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5633-6c3b-970e-5547f6e9b2d3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5633-6c3b-2a0f-adde5b57cd34	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5633-6c3b-7f80-469519e10e41	planer	Planer dogodkov v koledarju	t
00020000-5633-6c3b-9859-73daf39842d4	kadrovska	Kadrovska služba	t
00020000-5633-6c3b-a11b-3de96b320fb4	arhivar	Ažuriranje arhivalij	t
00020000-5633-6c3b-ae44-13b20e034ee8	igralec	Igralec	t
00020000-5633-6c3b-1eb8-6a327f992f25	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5633-6c3c-5b32-9490a1911e15	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3087 (class 0 OID 24315427)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5633-6c3b-8e26-86ee7a9daad4	00020000-5633-6c3b-970e-5547f6e9b2d3
00010000-5633-6c3b-524f-9153cc77d3b5	00020000-5633-6c3b-970e-5547f6e9b2d3
00010000-5633-6c3c-6c0c-0dc986f05523	00020000-5633-6c3c-5b32-9490a1911e15
\.


--
-- TOC entry 3131 (class 0 OID 24315879)
-- Dependencies: 221
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 24315817)
-- Dependencies: 213
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 24315763)
-- Dependencies: 207
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5633-6c3c-eec2-ceab2308eaa9	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5633-6c3c-17df-5ee2666f88b5	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5633-6c3c-78c7-665481fce1a7	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3083 (class 0 OID 24315392)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5633-6c3a-2c30-429d38622033	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5633-6c3a-6b1d-32c84cc9d27b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5633-6c3a-6719-51a434c4f3a3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5633-6c3a-b99c-c9af2c2eab2c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5633-6c3a-1023-e77da4800705	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3082 (class 0 OID 24315384)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5633-6c3a-4465-95854685394d	00230000-5633-6c3a-b99c-c9af2c2eab2c	popa
00240000-5633-6c3a-0741-634340c57f89	00230000-5633-6c3a-b99c-c9af2c2eab2c	oseba
00240000-5633-6c3a-4495-149f37cfc9f5	00230000-5633-6c3a-b99c-c9af2c2eab2c	tippopa
00240000-5633-6c3a-fb0a-40ffca929ee3	00230000-5633-6c3a-b99c-c9af2c2eab2c	organizacijskaenota
00240000-5633-6c3a-4b22-46540531d67d	00230000-5633-6c3a-b99c-c9af2c2eab2c	sezona
00240000-5633-6c3a-8b0c-8f4c25717274	00230000-5633-6c3a-b99c-c9af2c2eab2c	tipvaje
00240000-5633-6c3a-308f-05e7e0b23547	00230000-5633-6c3a-6b1d-32c84cc9d27b	prostor
00240000-5633-6c3a-518c-39c5879ade9c	00230000-5633-6c3a-b99c-c9af2c2eab2c	besedilo
00240000-5633-6c3a-7633-4c309e61fbb7	00230000-5633-6c3a-b99c-c9af2c2eab2c	uprizoritev
00240000-5633-6c3a-b3a8-885648d1cf36	00230000-5633-6c3a-b99c-c9af2c2eab2c	funkcija
00240000-5633-6c3a-9eb6-f0b8e64c1e11	00230000-5633-6c3a-b99c-c9af2c2eab2c	tipfunkcije
00240000-5633-6c3a-3db8-0d6004032bfd	00230000-5633-6c3a-b99c-c9af2c2eab2c	alternacija
00240000-5633-6c3a-739a-4f500d55c272	00230000-5633-6c3a-2c30-429d38622033	pogodba
00240000-5633-6c3a-b8b8-c2de2097d765	00230000-5633-6c3a-b99c-c9af2c2eab2c	zaposlitev
00240000-5633-6c3a-dd3b-c10567605b6c	00230000-5633-6c3a-b99c-c9af2c2eab2c	zvrstuprizoritve
00240000-5633-6c3a-fc94-f33873d1b443	00230000-5633-6c3a-2c30-429d38622033	programdela
00240000-5633-6c3a-8d38-1ba79417489e	00230000-5633-6c3a-b99c-c9af2c2eab2c	zapis
\.


--
-- TOC entry 3081 (class 0 OID 24315379)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
c3685e2d-de4f-4c7d-9b2c-1c1c5d7d49ac	00240000-5633-6c3a-4465-95854685394d	0	1001
\.


--
-- TOC entry 3137 (class 0 OID 24315944)
-- Dependencies: 227
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5633-6c3d-ba27-6ca0cac65857	000e0000-5633-6c3d-85ce-1fd56fc01617	00080000-5633-6c3c-7c03-5984226b44ef	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5633-6c3a-f65a-7fd8cd3cd25d
00270000-5633-6c3d-4d70-cfe752d34933	000e0000-5633-6c3d-85ce-1fd56fc01617	00080000-5633-6c3c-7c03-5984226b44ef	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5633-6c3a-f65a-7fd8cd3cd25d
\.


--
-- TOC entry 3097 (class 0 OID 24315527)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 24315773)
-- Dependencies: 208
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5633-6c3d-3326-1a1cf84fd1c0	00180000-5633-6c3d-5e98-103910d280dc	000c0000-5633-6c3d-d806-c6ffbb4a0461	00090000-5633-6c3d-f31e-d745e1558e51	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5633-6c3d-4011-4a84c159c3bc	00180000-5633-6c3d-5e98-103910d280dc	000c0000-5633-6c3d-2a39-e761b085796d	00090000-5633-6c3d-fd31-b494da40fd86	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5633-6c3d-0ea9-27b0f82b9d79	00180000-5633-6c3d-5e98-103910d280dc	000c0000-5633-6c3d-71e9-8cda09bb4dde	00090000-5633-6c3d-afd2-8217a84f69a0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5633-6c3d-800d-66b0402fec35	00180000-5633-6c3d-5e98-103910d280dc	000c0000-5633-6c3d-5216-b38a507ca046	00090000-5633-6c3d-250a-a12ad23c1824	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5633-6c3d-4d4a-7701392adf16	00180000-5633-6c3d-5e98-103910d280dc	000c0000-5633-6c3d-2f62-b27647e356b0	00090000-5633-6c3d-6b84-e1fd649751b2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5633-6c3d-0d8c-cef6c7c238d0	00180000-5633-6c3d-3f5a-4c03199a6302	\N	00090000-5633-6c3d-6b84-e1fd649751b2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5633-6c3d-4571-1b0dbc05891b	00180000-5633-6c3d-3f5a-4c03199a6302	\N	00090000-5633-6c3d-fd31-b494da40fd86	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3140 (class 0 OID 24315985)
-- Dependencies: 230
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5633-6c3a-06d5-700652ae140a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5633-6c3a-006a-4143bba700aa	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5633-6c3a-2a3b-481000ee24d9	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5633-6c3a-7590-1190dadb27b0	04	Režija	Režija	Režija	umetnik	30
000f0000-5633-6c3a-cb6a-168307bc67f3	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5633-6c3a-1583-78a62bb5c490	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5633-6c3a-cf61-9b946c9bc227	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5633-6c3a-f85c-1150680d8126	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5633-6c3a-496f-53781a1dd0e9	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5633-6c3a-bc07-f53b0356b4ca	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5633-6c3a-24a0-2caadd752eb1	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5633-6c3a-e0d4-ed83ec60dd16	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5633-6c3a-101d-cda42ebf7015	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5633-6c3a-6bdc-15c16aa70b7c	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5633-6c3a-841f-e6544c603e7c	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5633-6c3a-1f6b-3fe6cac7b81c	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5633-6c3a-edd5-46426afdeb21	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5633-6c3a-73f0-f3d742cd6ab4	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3094 (class 0 OID 24315478)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5633-6c3c-9fa7-15904722ef2f	0001	šola	osnovna ali srednja šola
00400000-5633-6c3c-db02-0e104e2fa546	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5633-6c3c-31a4-bad72d6f081c	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3153 (class 0 OID 24316278)
-- Dependencies: 243
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5633-6c3a-73a6-5bacbbc2be93	01	Velika predstava	f	1.00	1.00
002b0000-5633-6c3a-2fec-432421aedbef	02	Mala predstava	f	0.50	0.50
002b0000-5633-6c3a-1323-bdf7531a17da	03	Mala koprodukcija	t	0.40	1.00
002b0000-5633-6c3a-930e-bb73b718c17e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5633-6c3a-d855-0b396d15b0d4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3116 (class 0 OID 24315753)
-- Dependencies: 206
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5633-6c3a-3952-f873b50c84e2	0001	prva vaja	prva vaja
00420000-5633-6c3a-b5a4-67917c80cdb8	0002	tehnična vaja	tehnična vaja
00420000-5633-6c3a-f5de-ef0df0cb4f81	0003	lučna vaja	lučna vaja
00420000-5633-6c3a-0265-f0565aa29328	0004	kostumska vaja	kostumska vaja
00420000-5633-6c3a-b1cc-e1e3f0483c79	0005	foto vaja	foto vaja
00420000-5633-6c3a-2cab-b8b43be7c8a0	0006	1. glavna vaja	1. glavna vaja
00420000-5633-6c3a-2ed8-9f9471f36627	0007	2. glavna vaja	2. glavna vaja
00420000-5633-6c3a-11ee-972e22e35ef3	0008	1. generalka	1. generalka
00420000-5633-6c3a-3b68-60fa88a0729c	0009	2. generalka	2. generalka
00420000-5633-6c3a-f0de-69ad6e5ade71	0010	odprta generalka	odprta generalka
00420000-5633-6c3a-f8b0-13b5f0771128	0011	obnovitvena vaja	obnovitvena vaja
00420000-5633-6c3a-3b11-ed6b1413f189	0012	pevska vaja	pevska vaja
00420000-5633-6c3a-200e-bcd0827263c7	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5633-6c3a-bac5-7991805a774b	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3103 (class 0 OID 24315600)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 24315414)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5633-6c3b-524f-9153cc77d3b5	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROW7VjK.qA10aMb0XMQ2l6A/HL1EU9ZKe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-d047-3824f905952c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-0d67-c59fa165fa2c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-8c43-f536795512ce	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-3424-df654f3dbc6b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-9b46-215bafb7db0f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-7055-15e3b2d06bef	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-aeba-f797c5b8a5c6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-b850-0f4805c58694	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-6163-0cbe4dfe7fe0	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5633-6c3c-6c0c-0dc986f05523	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5633-6c3b-8e26-86ee7a9daad4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 24316035)
-- Dependencies: 234
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5633-6c3d-1945-f974d3ba94b3	00160000-5633-6c3c-b86d-1cc23b771584	\N	00140000-5633-6c3a-a7e0-6dc6a4727c47	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5633-6c3c-ab64-943cf304ea71
000e0000-5633-6c3d-85ce-1fd56fc01617	00160000-5633-6c3c-ce6a-d14617ce5535	\N	00140000-5633-6c3a-7992-b26012944ad4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5633-6c3c-6f54-fc365ef1a4b1
000e0000-5633-6c3d-fea4-69a8f65158b8	\N	\N	00140000-5633-6c3a-7992-b26012944ad4	00190000-5633-6c3d-8a83-3b7d6e840038	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5633-6c3c-ab64-943cf304ea71
000e0000-5633-6c3d-6309-22271daed4b5	\N	\N	00140000-5633-6c3a-7992-b26012944ad4	00190000-5633-6c3d-8a83-3b7d6e840038	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5633-6c3c-ab64-943cf304ea71
000e0000-5633-6c3d-da58-09a23395f2ef	\N	\N	00140000-5633-6c3a-7992-b26012944ad4	00190000-5633-6c3d-8a83-3b7d6e840038	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5633-6c3c-869d-f9239f6b8ff6
000e0000-5633-6c3d-c8ae-3a6b47d5c467	\N	\N	00140000-5633-6c3a-7992-b26012944ad4	00190000-5633-6c3d-8a83-3b7d6e840038	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5633-6c3c-869d-f9239f6b8ff6
\.


--
-- TOC entry 3111 (class 0 OID 24315699)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5633-6c3d-0d4e-0d5792d5fac7	\N	000e0000-5633-6c3d-85ce-1fd56fc01617	1	
00200000-5633-6c3d-29ac-bdda3bf67195	\N	000e0000-5633-6c3d-85ce-1fd56fc01617	2	
00200000-5633-6c3d-d253-6f90d07eefeb	\N	000e0000-5633-6c3d-85ce-1fd56fc01617	3	
00200000-5633-6c3d-41ed-233ece90caff	\N	000e0000-5633-6c3d-85ce-1fd56fc01617	4	
00200000-5633-6c3d-6519-7785987e64cf	\N	000e0000-5633-6c3d-85ce-1fd56fc01617	5	
\.


--
-- TOC entry 3127 (class 0 OID 24315844)
-- Dependencies: 217
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 24315958)
-- Dependencies: 228
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5633-6c3a-41d3-9d52668376d6	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5633-6c3a-3c98-e3dfc6781b67	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5633-6c3a-be1e-7d88c6d58d44	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5633-6c3a-02d3-4ab4a8ea4473	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5633-6c3a-b75d-d10da6735d7d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5633-6c3a-c5d9-ee5f9ff2f936	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5633-6c3a-f934-f3f10d808385	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5633-6c3a-8769-6ea916b5ea61	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5633-6c3a-f65a-7fd8cd3cd25d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5633-6c3a-ad63-c6ace6b41f75	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5633-6c3a-3b81-0d8b4e8a2ae0	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5633-6c3a-07fe-3a850d728a31	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5633-6c3a-4aa9-e7afd6c4235d	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5633-6c3a-42b1-f2000b0d0186	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5633-6c3a-c089-7050b987289b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5633-6c3a-8fe5-7a6712c4cfcb	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5633-6c3a-6a81-543ca9872004	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5633-6c3a-2914-3944ced61008	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5633-6c3a-bdde-d66191aa52ad	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5633-6c3a-74a8-51638da19c56	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5633-6c3a-cf94-16db1b9abce8	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5633-6c3a-9549-67389f9ca7bd	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5633-6c3a-28d5-fcb92a6773c0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5633-6c3a-efe2-e26602bf915d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5633-6c3a-caa8-2d2f459539d4	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5633-6c3a-9011-08c966fbf241	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5633-6c3a-fc43-ac0c19491ac4	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5633-6c3a-7c6b-816055c592ae	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3156 (class 0 OID 24316325)
-- Dependencies: 246
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 24316297)
-- Dependencies: 245
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 24316337)
-- Dependencies: 247
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 24315916)
-- Dependencies: 224
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5633-6c3d-1ba3-49a79da54c8f	00090000-5633-6c3d-fd31-b494da40fd86	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5633-6c3d-19ab-de474e6876d2	00090000-5633-6c3d-afd2-8217a84f69a0	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5633-6c3d-bc8d-1dcab0853e11	00090000-5633-6c3d-de4b-43632e11f01c	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5633-6c3d-3325-949def7327c5	00090000-5633-6c3d-e239-b5d3c53e3b5a	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5633-6c3d-4ad9-cd0d8def84f0	00090000-5633-6c3d-e7a0-9053bed7e04d	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5633-6c3d-15b0-9a38a4efdd69	00090000-5633-6c3d-46de-ac092853426c	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3114 (class 0 OID 24315742)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 24316025)
-- Dependencies: 233
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5633-6c3a-a7e0-6dc6a4727c47	01	Drama	drama (SURS 01)
00140000-5633-6c3a-af38-2225f75e4868	02	Opera	opera (SURS 02)
00140000-5633-6c3a-8c8d-5a107648d71f	03	Balet	balet (SURS 03)
00140000-5633-6c3a-db5a-124912759462	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5633-6c3a-c612-ed643eb08fc5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5633-6c3a-7992-b26012944ad4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5633-6c3a-2ea9-9a1f0014cefb	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3133 (class 0 OID 24315906)
-- Dependencies: 223
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2580 (class 2606 OID 24315477)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 24316084)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 24316074)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 24315468)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 24315941)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 24315983)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 24316377)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 24315731)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 24315752)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 24316295)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 24315626)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 24316152)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 24315902)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 24315697)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 24315664)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 24315640)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 24315809)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 24316354)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 24316361)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2858 (class 2606 OID 24316385)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 24099029)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2715 (class 2606 OID 24315836)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 24315598)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 24315496)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 24315560)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 24315523)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 24315457)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2569 (class 2606 OID 24315442)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 24315842)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 24315878)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 24316020)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 24315551)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 24315586)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 24316247)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 24315815)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 24315576)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 24315716)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 24315685)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2647 (class 2606 OID 24315677)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 24315827)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 24316256)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 24316264)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 24316234)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 24316276)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 24315860)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 24315800)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 24315791)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 24316007)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 24315934)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 24315652)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 24315413)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 24315869)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 24315431)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2571 (class 2606 OID 24315451)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 24315887)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 24315822)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 24315771)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 24315401)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 24315389)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 24315383)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 24315954)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 24315532)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 24315782)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 24315994)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 24315485)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 24316288)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 24315760)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 24315611)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 24315426)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 24316053)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 24315706)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 24315850)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 24315966)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 24316335)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 24316319)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 24316343)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 24315924)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 24315746)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 24316033)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 24315914)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 1259 OID 24315740)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2664 (class 1259 OID 24315741)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2665 (class 1259 OID 24315739)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2666 (class 1259 OID 24315738)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2667 (class 1259 OID 24315737)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2758 (class 1259 OID 24315955)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2759 (class 1259 OID 24315956)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2760 (class 1259 OID 24315957)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2844 (class 1259 OID 24316356)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2845 (class 1259 OID 24316355)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2598 (class 1259 OID 24315553)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2599 (class 1259 OID 24315554)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2716 (class 1259 OID 24315843)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2831 (class 1259 OID 24316323)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2832 (class 1259 OID 24316322)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2833 (class 1259 OID 24316324)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2834 (class 1259 OID 24316321)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2835 (class 1259 OID 24316320)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2710 (class 1259 OID 24315829)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2711 (class 1259 OID 24315828)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2655 (class 1259 OID 24315707)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2656 (class 1259 OID 24315708)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2740 (class 1259 OID 24315903)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2741 (class 1259 OID 24315905)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2742 (class 1259 OID 24315904)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2630 (class 1259 OID 24315642)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 24315641)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2822 (class 1259 OID 24316277)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2774 (class 1259 OID 24316022)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2775 (class 1259 OID 24316023)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2776 (class 1259 OID 24316024)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2841 (class 1259 OID 24316344)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2783 (class 1259 OID 24316058)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2784 (class 1259 OID 24316055)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2785 (class 1259 OID 24316059)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2786 (class 1259 OID 24316057)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2787 (class 1259 OID 24316056)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2620 (class 1259 OID 24315613)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 24315612)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 24315526)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2728 (class 1259 OID 24315870)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2573 (class 1259 OID 24315458)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2574 (class 1259 OID 24315459)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2733 (class 1259 OID 24315890)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2734 (class 1259 OID 24315889)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2735 (class 1259 OID 24315888)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2603 (class 1259 OID 24315563)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2604 (class 1259 OID 24315562)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2605 (class 1259 OID 24315564)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2643 (class 1259 OID 24315680)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2644 (class 1259 OID 24315678)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2645 (class 1259 OID 24315679)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2553 (class 1259 OID 24315391)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2690 (class 1259 OID 24315795)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2691 (class 1259 OID 24315793)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2692 (class 1259 OID 24315792)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2693 (class 1259 OID 24315794)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2564 (class 1259 OID 24315432)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 24315433)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2719 (class 1259 OID 24315851)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2854 (class 1259 OID 24316378)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2756 (class 1259 OID 24315943)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2757 (class 1259 OID 24315942)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2855 (class 1259 OID 24316386)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 24316387)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2705 (class 1259 OID 24315816)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2750 (class 1259 OID 24315935)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2751 (class 1259 OID 24315936)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 24316157)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2805 (class 1259 OID 24316156)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2806 (class 1259 OID 24316153)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 24316154)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2808 (class 1259 OID 24316155)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2609 (class 1259 OID 24315578)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 24315577)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2611 (class 1259 OID 24315579)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2722 (class 1259 OID 24315864)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2723 (class 1259 OID 24315863)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2814 (class 1259 OID 24316257)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2815 (class 1259 OID 24316258)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2797 (class 1259 OID 24316088)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 24316089)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2799 (class 1259 OID 24316086)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2800 (class 1259 OID 24316087)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2746 (class 1259 OID 24315925)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 24315926)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2696 (class 1259 OID 24315804)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2697 (class 1259 OID 24315803)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2698 (class 1259 OID 24315801)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2699 (class 1259 OID 24315802)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2793 (class 1259 OID 24316076)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 24316075)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2634 (class 1259 OID 24315653)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2637 (class 1259 OID 24315667)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2638 (class 1259 OID 24315666)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2639 (class 1259 OID 24315665)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2640 (class 1259 OID 24315668)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2654 (class 1259 OID 24315698)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2648 (class 1259 OID 24315686)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2649 (class 1259 OID 24315687)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2811 (class 1259 OID 24316248)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2830 (class 1259 OID 24316296)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2848 (class 1259 OID 24316362)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2849 (class 1259 OID 24316363)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2585 (class 1259 OID 24315498)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 24315497)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2594 (class 1259 OID 24315533)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 24315534)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2673 (class 1259 OID 24315747)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2685 (class 1259 OID 24315785)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2686 (class 1259 OID 24315784)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2687 (class 1259 OID 24315783)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2668 (class 1259 OID 24315733)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2669 (class 1259 OID 24315734)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2670 (class 1259 OID 24315732)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2671 (class 1259 OID 24315736)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2672 (class 1259 OID 24315735)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2602 (class 1259 OID 24315552)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 24315486)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2584 (class 1259 OID 24315487)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2626 (class 1259 OID 24315627)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 24315629)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2628 (class 1259 OID 24315628)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2629 (class 1259 OID 24315630)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2704 (class 1259 OID 24315810)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2779 (class 1259 OID 24316021)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2788 (class 1259 OID 24316054)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2770 (class 1259 OID 24315995)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2771 (class 1259 OID 24315996)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2592 (class 1259 OID 24315524)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 24315525)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2743 (class 1259 OID 24315915)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 24315402)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 24315599)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2608 (class 1259 OID 24315561)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 24315390)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2827 (class 1259 OID 24316289)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2726 (class 1259 OID 24315862)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2727 (class 1259 OID 24315861)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2680 (class 1259 OID 24315761)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2681 (class 1259 OID 24315762)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2801 (class 1259 OID 24316085)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 24315587)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 24316034)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2838 (class 1259 OID 24316336)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2820 (class 1259 OID 24316265)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 24316266)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2767 (class 1259 OID 24315984)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2684 (class 1259 OID 24315772)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 24315452)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2897 (class 2606 OID 24316558)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2896 (class 2606 OID 24316563)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2892 (class 2606 OID 24316583)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2898 (class 2606 OID 24316553)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2894 (class 2606 OID 24316573)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2893 (class 2606 OID 24316578)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2895 (class 2606 OID 24316568)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2934 (class 2606 OID 24316753)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2933 (class 2606 OID 24316758)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 24316763)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 24316928)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2967 (class 2606 OID 24316923)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 24316443)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2870 (class 2606 OID 24316448)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2915 (class 2606 OID 24316668)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2961 (class 2606 OID 24316908)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2962 (class 2606 OID 24316903)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2960 (class 2606 OID 24316913)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2963 (class 2606 OID 24316898)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2964 (class 2606 OID 24316893)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2913 (class 2606 OID 24316663)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2914 (class 2606 OID 24316658)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2891 (class 2606 OID 24316543)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2890 (class 2606 OID 24316548)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2925 (class 2606 OID 24316708)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 24316718)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2924 (class 2606 OID 24316713)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2880 (class 2606 OID 24316498)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 24316493)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 24316648)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 24316883)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2937 (class 2606 OID 24316768)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2936 (class 2606 OID 24316773)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2935 (class 2606 OID 24316778)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2965 (class 2606 OID 24316918)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2939 (class 2606 OID 24316798)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2942 (class 2606 OID 24316783)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2938 (class 2606 OID 24316803)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2940 (class 2606 OID 24316793)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2941 (class 2606 OID 24316788)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2878 (class 2606 OID 24316488)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 24316483)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2866 (class 2606 OID 24316428)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2867 (class 2606 OID 24316423)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2919 (class 2606 OID 24316688)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2863 (class 2606 OID 24316403)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2862 (class 2606 OID 24316408)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 24316703)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2921 (class 2606 OID 24316698)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2922 (class 2606 OID 24316693)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2873 (class 2606 OID 24316458)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2874 (class 2606 OID 24316453)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2872 (class 2606 OID 24316463)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2884 (class 2606 OID 24316523)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 24316513)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2885 (class 2606 OID 24316518)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2859 (class 2606 OID 24316388)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2903 (class 2606 OID 24316623)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2905 (class 2606 OID 24316613)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2906 (class 2606 OID 24316608)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2904 (class 2606 OID 24316618)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2861 (class 2606 OID 24316393)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2860 (class 2606 OID 24316398)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2916 (class 2606 OID 24316673)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2970 (class 2606 OID 24316943)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 24316748)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 24316743)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2972 (class 2606 OID 24316948)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2971 (class 2606 OID 24316953)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2912 (class 2606 OID 24316653)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2929 (class 2606 OID 24316733)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2928 (class 2606 OID 24316738)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2949 (class 2606 OID 24316858)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 24316853)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2953 (class 2606 OID 24316838)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 24316843)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2951 (class 2606 OID 24316848)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2876 (class 2606 OID 24316473)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2877 (class 2606 OID 24316468)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2875 (class 2606 OID 24316478)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2917 (class 2606 OID 24316683)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2918 (class 2606 OID 24316678)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2956 (class 2606 OID 24316868)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2955 (class 2606 OID 24316873)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2946 (class 2606 OID 24316828)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 24316833)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2948 (class 2606 OID 24316818)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2947 (class 2606 OID 24316823)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2927 (class 2606 OID 24316723)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 24316728)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2907 (class 2606 OID 24316643)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2908 (class 2606 OID 24316638)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2910 (class 2606 OID 24316628)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2909 (class 2606 OID 24316633)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2943 (class 2606 OID 24316813)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 24316808)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2882 (class 2606 OID 24316503)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2883 (class 2606 OID 24316508)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 24316538)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2888 (class 2606 OID 24316528)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2887 (class 2606 OID 24316533)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2954 (class 2606 OID 24316863)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2957 (class 2606 OID 24316878)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2959 (class 2606 OID 24316888)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 24316933)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 24316938)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2864 (class 2606 OID 24316418)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2865 (class 2606 OID 24316413)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2869 (class 2606 OID 24316433)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2868 (class 2606 OID 24316438)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 24316588)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2900 (class 2606 OID 24316603)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 24316598)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2902 (class 2606 OID 24316593)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-30 14:10:24 CET

--
-- PostgreSQL database dump complete
--

