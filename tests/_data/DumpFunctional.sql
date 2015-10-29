--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-29 14:44:41 CET

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
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 252
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 24094411)
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
-- TOC entry 236 (class 1259 OID 24095019)
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
-- TOC entry 235 (class 1259 OID 24095002)
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
-- TOC entry 182 (class 1259 OID 24094404)
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
-- TOC entry 181 (class 1259 OID 24094402)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 226 (class 1259 OID 24094879)
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
-- TOC entry 229 (class 1259 OID 24094909)
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
-- TOC entry 250 (class 1259 OID 24095290)
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
-- TOC entry 203 (class 1259 OID 24094659)
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
-- TOC entry 205 (class 1259 OID 24094690)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 24095216)
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
-- TOC entry 194 (class 1259 OID 24094556)
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
-- TOC entry 237 (class 1259 OID 24095032)
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
-- TOC entry 222 (class 1259 OID 24094833)
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
-- TOC entry 200 (class 1259 OID 24094630)
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
-- TOC entry 197 (class 1259 OID 24094596)
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
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 24094573)
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
-- TOC entry 211 (class 1259 OID 24094747)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 248 (class 1259 OID 24095271)
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
-- TOC entry 249 (class 1259 OID 24095283)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 24095305)
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
-- TOC entry 170 (class 1259 OID 23562333)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 24094772)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 24094530)
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
-- TOC entry 185 (class 1259 OID 24094430)
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
-- TOC entry 189 (class 1259 OID 24094497)
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
-- TOC entry 186 (class 1259 OID 24094441)
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
-- TOC entry 178 (class 1259 OID 24094376)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 24094395)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 24094779)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 24094813)
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
-- TOC entry 232 (class 1259 OID 24094950)
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
-- TOC entry 188 (class 1259 OID 24094477)
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
-- TOC entry 191 (class 1259 OID 24094522)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 24095161)
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
-- TOC entry 212 (class 1259 OID 24094753)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 24094507)
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
-- TOC entry 202 (class 1259 OID 24094651)
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
-- TOC entry 198 (class 1259 OID 24094611)
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
-- TOC entry 199 (class 1259 OID 24094623)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 24094765)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 24095175)
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
-- TOC entry 241 (class 1259 OID 24095185)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 238 (class 1259 OID 24095100)
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
    sredstvaavtsamoz numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 242 (class 1259 OID 24095193)
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
-- TOC entry 218 (class 1259 OID 24094794)
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
-- TOC entry 210 (class 1259 OID 24094738)
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
-- TOC entry 209 (class 1259 OID 24094728)
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
-- TOC entry 231 (class 1259 OID 24094939)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 24094869)
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
-- TOC entry 196 (class 1259 OID 24094585)
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
-- TOC entry 175 (class 1259 OID 24094347)
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
-- TOC entry 174 (class 1259 OID 24094345)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 219 (class 1259 OID 24094807)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 24094385)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 24094369)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 24094821)
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
-- TOC entry 213 (class 1259 OID 24094759)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 207 (class 1259 OID 24094705)
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
-- TOC entry 173 (class 1259 OID 24094334)
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
-- TOC entry 172 (class 1259 OID 24094326)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 24094321)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 227 (class 1259 OID 24094886)
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
-- TOC entry 187 (class 1259 OID 24094469)
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
-- TOC entry 208 (class 1259 OID 24094715)
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
-- TOC entry 230 (class 1259 OID 24094927)
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
-- TOC entry 184 (class 1259 OID 24094420)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 243 (class 1259 OID 24095204)
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
-- TOC entry 206 (class 1259 OID 24094695)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 24094542)
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
-- TOC entry 176 (class 1259 OID 24094356)
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
-- TOC entry 234 (class 1259 OID 24094977)
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
-- TOC entry 201 (class 1259 OID 24094641)
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
-- TOC entry 217 (class 1259 OID 24094786)
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
-- TOC entry 228 (class 1259 OID 24094900)
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
-- TOC entry 246 (class 1259 OID 24095251)
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
-- TOC entry 245 (class 1259 OID 24095223)
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
-- TOC entry 247 (class 1259 OID 24095263)
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
-- TOC entry 224 (class 1259 OID 24094858)
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
-- TOC entry 204 (class 1259 OID 24094684)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 233 (class 1259 OID 24094967)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 223 (class 1259 OID 24094848)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2238 (class 2604 OID 24094407)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 24094350)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3077 (class 0 OID 24094411)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5632-22c5-1a84-aa48592e278d	10	30	Otroci	Abonma za otroke	200
000a0000-5632-22c5-f16e-2ed682094e94	20	60	Mladina	Abonma za mladino	400
000a0000-5632-22c5-c4b8-2cacde8b2298	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3130 (class 0 OID 24095019)
-- Dependencies: 236
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5632-22c6-1938-447918a21fda	000d0000-5632-22c6-e742-751b1ea94893	\N	00090000-5632-22c6-dc53-12188c2b0ccf	000b0000-5632-22c6-5f65-ee2790df8871	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5632-22c6-8697-0ac2cf4b4df0	000d0000-5632-22c6-19b8-ad3d6c9bd7bb	00100000-5632-22c6-a463-12c959147366	00090000-5632-22c6-0ccd-86bde4a09ec5	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5632-22c6-86a0-bbbcd3b7445a	000d0000-5632-22c6-413a-1898a6d67747	00100000-5632-22c6-81aa-6602c91ba944	00090000-5632-22c6-f2ab-51ea2de2f296	\N	0003	t	\N	2015-10-29	\N	2	t	\N	f	f
000c0000-5632-22c6-25cb-1f2a3c5aeda3	000d0000-5632-22c6-173f-b73f17e11a48	\N	00090000-5632-22c6-32e6-04b4868c941d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5632-22c6-dec2-f5e0aa530ece	000d0000-5632-22c6-6867-d130cedfb451	\N	00090000-5632-22c6-fbd4-27a34353db4e	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5632-22c6-ac37-a14a7fe4e8aa	000d0000-5632-22c6-43a4-1f358c838fe3	\N	00090000-5632-22c6-9cad-5d4a1b2288f7	000b0000-5632-22c6-07dc-d9de9bf28efe	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5632-22c6-3b9e-e24d1b4f9fbf	000d0000-5632-22c6-3f72-b0bf50169e98	00100000-5632-22c6-f888-2aa711afc792	00090000-5632-22c6-b582-84c5d32dd1af	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5632-22c6-1fea-a3548fbe6109	000d0000-5632-22c6-da58-9d7bafc14df9	\N	00090000-5632-22c6-70b0-28ec762ad279	000b0000-5632-22c6-292d-c7f11a63b03f	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5632-22c6-181a-027abeaf32bb	000d0000-5632-22c6-3f72-b0bf50169e98	00100000-5632-22c6-6a0b-ea83dd0ed8f2	00090000-5632-22c6-257c-9481f2496fef	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5632-22c6-2f72-c02e86a87616	000d0000-5632-22c6-3f72-b0bf50169e98	00100000-5632-22c6-904b-dabda85d1e4b	00090000-5632-22c6-42b8-73dcb93b9746	\N	0010	t	\N	2015-10-29	\N	16	f	\N	f	t
000c0000-5632-22c6-e763-fe0f397f7a1b	000d0000-5632-22c6-3f72-b0bf50169e98	00100000-5632-22c6-fad9-9b57cd82228a	00090000-5632-22c6-5b07-dde5987b813e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5632-22c6-299e-6320ffc06504	000d0000-5632-22c6-f64e-7acdc5d141df	00100000-5632-22c6-a463-12c959147366	00090000-5632-22c6-0ccd-86bde4a09ec5	000b0000-5632-22c6-6a9f-e7b478e8baaa	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3129 (class 0 OID 24095002)
-- Dependencies: 235
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3076 (class 0 OID 24094404)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3120 (class 0 OID 24094879)
-- Dependencies: 226
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5632-22c6-ad63-cf2c29998ef2	00160000-5632-22c5-1b67-b80f6b77dfa0	00090000-5632-22c6-1486-93b04bdb8e3e	aizv	10	t
003d0000-5632-22c6-81be-e8596481e266	00160000-5632-22c5-1b67-b80f6b77dfa0	00090000-5632-22c6-9253-0098d25af330	apri	14	t
003d0000-5632-22c6-82bd-ac5117642c3b	00160000-5632-22c5-dcd3-c946f45cd2d6	00090000-5632-22c6-e7d4-b9213176fc1c	aizv	11	t
003d0000-5632-22c6-db7e-44367369212d	00160000-5632-22c5-57e1-6f1ee9eb9e5a	00090000-5632-22c6-5a55-4d7705fc54d4	aizv	12	t
003d0000-5632-22c6-fd64-a63f80b61e0e	00160000-5632-22c5-1b67-b80f6b77dfa0	00090000-5632-22c6-6138-82b7e53a77bd	apri	18	f
\.


--
-- TOC entry 3123 (class 0 OID 24094909)
-- Dependencies: 229
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5632-22c5-1b67-b80f6b77dfa0	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5632-22c5-dcd3-c946f45cd2d6	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5632-22c5-57e1-6f1ee9eb9e5a	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3144 (class 0 OID 24095290)
-- Dependencies: 250
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 24094659)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5632-22c6-4df6-3c06e36d8d6f	\N	\N	00200000-5632-22c6-f99a-efa6b31ea008	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5632-22c6-2ca5-83463c9ca435	\N	\N	00200000-5632-22c6-13cb-308f93d0cb70	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5632-22c6-4821-bde859d53fad	\N	\N	00200000-5632-22c6-a871-3897fb9b06de	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5632-22c6-fdf3-e3affc1f7644	\N	\N	00200000-5632-22c6-fb7a-cbaa830a875f	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5632-22c6-849a-8ee63973d335	\N	\N	00200000-5632-22c6-6c42-27671598158e	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3099 (class 0 OID 24094690)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 24095216)
-- Dependencies: 244
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 24094556)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5632-22c3-43aa-e6902158d3f8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5632-22c3-84f7-eb7cf1243f50	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5632-22c3-8c1e-e2c9925022a6	AL	ALB	008	Albania 	Albanija	\N
00040000-5632-22c3-0e69-84c0de31fd92	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5632-22c3-a44e-480a5a94482a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5632-22c3-401a-ccdbc2d3cf89	AD	AND	020	Andorra 	Andora	\N
00040000-5632-22c3-bd4a-b2d026a090b6	AO	AGO	024	Angola 	Angola	\N
00040000-5632-22c3-b45f-b15e083e731b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5632-22c3-0482-52d0b2a5fc37	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5632-22c3-6d1e-0c21adee81a7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5632-22c3-7075-1d935d60c8d9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5632-22c3-a711-3b6ec6d5e72b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5632-22c3-c70f-f2fd840ff819	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5632-22c3-47f3-eef8bd224832	AU	AUS	036	Australia 	Avstralija	\N
00040000-5632-22c3-e05c-576d3a831541	AT	AUT	040	Austria 	Avstrija	\N
00040000-5632-22c3-0442-ff838b284f78	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5632-22c3-8197-a48c8520fe7e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5632-22c3-d8d9-2defcc9a07ef	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5632-22c3-bad2-5c0b3fa1c3a0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5632-22c3-4983-f8f74af4240d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5632-22c3-3fa9-19956cf75f9a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5632-22c3-9d10-65ff9ec457eb	BE	BEL	056	Belgium 	Belgija	\N
00040000-5632-22c3-f618-e4d89a102b48	BZ	BLZ	084	Belize 	Belize	\N
00040000-5632-22c3-dba5-41497ccb953a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5632-22c3-bf9a-501d185645c4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5632-22c3-bc10-b1621b9b47d6	BT	BTN	064	Bhutan 	Butan	\N
00040000-5632-22c3-8af4-be57120eaf92	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5632-22c3-07e2-af59d796e8e8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5632-22c3-678a-92b11841bf98	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5632-22c3-eb21-0ab60970c1dd	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5632-22c3-1688-5b39cef31615	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5632-22c3-f913-b273ef7c9ccd	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5632-22c3-0e46-0fee21a0a937	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5632-22c3-0636-065cf29fd9e4	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5632-22c3-056c-552e838f14d6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5632-22c3-d099-a7d12b8241d9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5632-22c3-320c-b289516dc95a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5632-22c3-9ae8-826d76507eb8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5632-22c3-3719-0696214b626b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5632-22c3-c0fa-e100288d574d	CA	CAN	124	Canada 	Kanada	\N
00040000-5632-22c3-7a3f-dd296a78c52d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5632-22c3-85e3-403cf1073f0c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5632-22c3-2436-8535b973aeaf	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5632-22c3-90f8-9a8e4106e3df	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5632-22c3-bd81-810f6cc5dcad	CL	CHL	152	Chile 	Čile	\N
00040000-5632-22c3-aa2a-957153ea2c7f	CN	CHN	156	China 	Kitajska	\N
00040000-5632-22c3-45b6-1d1e2751b55f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5632-22c3-2284-e67b0da6a0fa	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5632-22c3-c046-ab925336414b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5632-22c3-9dfe-4c5040ec8c02	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5632-22c3-a304-5db7b618cd4e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5632-22c3-d3ff-e89aa9d9c985	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5632-22c3-df58-39c229a2a95e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5632-22c3-48f5-228bb26cd177	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5632-22c3-55db-db87547a3ff3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5632-22c3-e6b6-9a8b25a30ed2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5632-22c3-9d37-69a3d150ae30	CU	CUB	192	Cuba 	Kuba	\N
00040000-5632-22c3-de0f-8bed683e9af3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5632-22c3-8afe-386d8d6d889f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5632-22c3-5313-b4a797a0fd65	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5632-22c3-70c6-c1c41b7a94c7	DK	DNK	208	Denmark 	Danska	\N
00040000-5632-22c3-aac9-7367a1f4e548	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5632-22c3-5a12-7560bee69798	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5632-22c4-5f68-73b83e68dd28	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5632-22c4-9acb-78669609e964	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5632-22c4-8ad4-4118f953aa0e	EG	EGY	818	Egypt 	Egipt	\N
00040000-5632-22c4-7e3c-88ef045f0ed8	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5632-22c4-c779-b9056fdd4911	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5632-22c4-fb1a-1ffc7048d142	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5632-22c4-8e52-2b86c5395179	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5632-22c4-25cd-589216e3f978	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5632-22c4-3a60-453163f7250e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5632-22c4-b965-45922ae7023e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5632-22c4-5912-cac02eec2a66	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5632-22c4-8137-f8dbfe7e4f67	FI	FIN	246	Finland 	Finska	\N
00040000-5632-22c4-6461-04550d9fffeb	FR	FRA	250	France 	Francija	\N
00040000-5632-22c4-44cd-c1587a7306b0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5632-22c4-ca9a-84afb110ff39	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5632-22c4-edb9-4d4f9e30b825	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5632-22c4-c007-6bcf7cbf16bf	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5632-22c4-2178-605560b145a8	GA	GAB	266	Gabon 	Gabon	\N
00040000-5632-22c4-b053-c23291a05a38	GM	GMB	270	Gambia 	Gambija	\N
00040000-5632-22c4-11ce-8afcdd038f30	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5632-22c4-07d3-0b8167af5e12	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5632-22c4-c377-d33dcbff1c77	GH	GHA	288	Ghana 	Gana	\N
00040000-5632-22c4-a9bc-607f451d6b8c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5632-22c4-8cb6-bec8815769f9	GR	GRC	300	Greece 	Grčija	\N
00040000-5632-22c4-3856-0c4612de1616	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5632-22c4-3a1f-4ed5be8efe79	GD	GRD	308	Grenada 	Grenada	\N
00040000-5632-22c4-775c-42b969a766dc	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5632-22c4-6292-8bb58d07367e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5632-22c4-cd20-32071bceef0f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5632-22c4-8950-d27325597e3b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5632-22c4-77c7-d91704da93aa	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5632-22c4-ec48-94fac43fb426	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5632-22c4-fc4b-b5dde5e5f0da	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5632-22c4-8ff5-506aed68c4e6	HT	HTI	332	Haiti 	Haiti	\N
00040000-5632-22c4-59a2-2e048225bb62	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5632-22c4-02ec-e052fb4947d4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5632-22c4-f491-8237c6833518	HN	HND	340	Honduras 	Honduras	\N
00040000-5632-22c4-77ee-e1b0f9f0e207	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5632-22c4-12a0-c4f13199c466	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5632-22c4-7ab8-18f8ac6b1c0b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5632-22c4-50ea-d986bdb09afe	IN	IND	356	India 	Indija	\N
00040000-5632-22c4-72b5-f67b465b1841	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5632-22c4-8b45-59f76ad2cbf0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5632-22c4-7004-89847a5d4895	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5632-22c4-c0e5-5f5f5a9ee288	IE	IRL	372	Ireland 	Irska	\N
00040000-5632-22c4-2191-8bd4365541d7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5632-22c4-5e8e-f9fb98344297	IL	ISR	376	Israel 	Izrael	\N
00040000-5632-22c4-6bc2-70727efc45c8	IT	ITA	380	Italy 	Italija	\N
00040000-5632-22c4-93b1-6334d516ef1d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5632-22c4-bc21-9b4486099ff2	JP	JPN	392	Japan 	Japonska	\N
00040000-5632-22c4-b518-38949d709559	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5632-22c4-61ee-16df78756e92	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5632-22c4-425c-159ec54d804c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5632-22c4-e78f-d7a06b974fd3	KE	KEN	404	Kenya 	Kenija	\N
00040000-5632-22c4-88c7-d041ce3c6d15	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5632-22c4-2a0b-747fbceebdf0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5632-22c4-928d-4c9c6027b6a6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5632-22c4-c8c4-e44587a8705c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5632-22c4-eba7-268482977c2b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5632-22c4-af10-b6383db788ca	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5632-22c4-9571-2079f709f4c3	LV	LVA	428	Latvia 	Latvija	\N
00040000-5632-22c4-4dee-f87be8bcc7c2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5632-22c4-3095-fa8f31f240f6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5632-22c4-4102-7670ab916ac2	LR	LBR	430	Liberia 	Liberija	\N
00040000-5632-22c4-8137-fe0c5ebdc798	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5632-22c4-382f-23813a2838b7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5632-22c4-1f64-5743d6cf6008	LT	LTU	440	Lithuania 	Litva	\N
00040000-5632-22c4-3053-d43922dc4eb5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5632-22c4-183c-97e1e0bba30d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5632-22c4-c575-6000b99fd043	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5632-22c4-f64b-ebf72dcb6781	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5632-22c4-9e43-eee1e2cc0d7c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5632-22c4-da10-e021fe83467d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5632-22c4-19ab-8b27b44429dc	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5632-22c4-362a-7baccfa27824	ML	MLI	466	Mali 	Mali	\N
00040000-5632-22c4-7010-fd6cb618b657	MT	MLT	470	Malta 	Malta	\N
00040000-5632-22c4-726f-cf76ed70577f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5632-22c4-d65d-f6bca9140586	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5632-22c4-3cac-058a2cf45084	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5632-22c4-0a87-a843d877a6fd	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5632-22c4-df2e-ad9a0436d9ee	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5632-22c4-6316-ecc1cbad291b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5632-22c4-8432-98405ca082ee	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5632-22c4-835e-2f410af58496	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5632-22c4-d33f-a6fe49f5fe4f	MC	MCO	492	Monaco 	Monako	\N
00040000-5632-22c4-ee2f-9e9fd11fd896	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5632-22c4-d8b2-fd25c160bc4b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5632-22c4-4aa8-38cadad18f89	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5632-22c4-7e26-ef7c4583b509	MA	MAR	504	Morocco 	Maroko	\N
00040000-5632-22c4-ec2e-8d8967fbee60	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5632-22c4-8d49-14322b9b62e9	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5632-22c4-6046-056b352d37de	NA	NAM	516	Namibia 	Namibija	\N
00040000-5632-22c4-ef84-9d158c802467	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5632-22c4-7dd0-ad758047e8e6	NP	NPL	524	Nepal 	Nepal	\N
00040000-5632-22c4-ceb6-24633df95d23	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5632-22c4-d8df-903502490376	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5632-22c4-1863-29e7d642cf2a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5632-22c4-b2ac-7cf95b6716c7	NE	NER	562	Niger 	Niger 	\N
00040000-5632-22c4-ba65-0287fcc529a9	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5632-22c4-d052-2f2fccd075fa	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5632-22c4-2284-aa08dbb5a7e4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5632-22c4-c65c-f0e1e10fee46	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5632-22c4-e2bb-4b081b0347e7	NO	NOR	578	Norway 	Norveška	\N
00040000-5632-22c4-b003-73604c465b02	OM	OMN	512	Oman 	Oman	\N
00040000-5632-22c4-5ee5-45104024dae4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5632-22c4-1dbc-00a4e61f108d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5632-22c4-3d02-458c9e7e3a75	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5632-22c4-8e1d-77c1a91237cb	PA	PAN	591	Panama 	Panama	\N
00040000-5632-22c4-931b-29808fe88deb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5632-22c4-cc58-0f8a7f28ca44	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5632-22c4-e0c3-8a9739f39752	PE	PER	604	Peru 	Peru	\N
00040000-5632-22c4-bdc2-cb7790f8b649	PH	PHL	608	Philippines 	Filipini	\N
00040000-5632-22c4-44e6-dc22792c62f0	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5632-22c4-5655-5f59c69d463f	PL	POL	616	Poland 	Poljska	\N
00040000-5632-22c4-186b-62c1325771cf	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5632-22c4-b90c-b8c88dfd16a5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5632-22c4-826a-2859fc8a2674	QA	QAT	634	Qatar 	Katar	\N
00040000-5632-22c4-fe65-ed2d7a3b6068	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5632-22c4-000f-6452d655f74e	RO	ROU	642	Romania 	Romunija	\N
00040000-5632-22c4-0c75-b04fe73c1f86	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5632-22c4-c106-85c8da5c4b0b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5632-22c4-132e-916a9d51e3a0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5632-22c4-584c-7082443d5b07	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5632-22c4-019e-7d968adf1241	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5632-22c4-6f86-4f37a7550ca3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5632-22c4-9cef-97aad2f4aa1a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5632-22c4-09f0-45a98f836245	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5632-22c4-34a4-99eb8c8862de	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5632-22c4-b7e2-90b09dc7f8c7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5632-22c4-0caa-f752f7fba8d0	SM	SMR	674	San Marino 	San Marino	\N
00040000-5632-22c4-c154-4e1603cbed80	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5632-22c4-a907-d8486bf5b66a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5632-22c4-6063-69bfd0037533	SN	SEN	686	Senegal 	Senegal	\N
00040000-5632-22c4-e8fc-f574d237cfbc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5632-22c4-c01c-b57757f4579b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5632-22c4-1e14-1b9549b5849f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5632-22c4-5ae4-206cd8f850c6	SG	SGP	702	Singapore 	Singapur	\N
00040000-5632-22c4-4599-26fdff5f8f83	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5632-22c4-a935-fea10bea29f8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5632-22c4-b4b2-5579fc194152	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5632-22c4-2deb-0c12cfd3cdae	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5632-22c4-71ea-52c2df158e64	SO	SOM	706	Somalia 	Somalija	\N
00040000-5632-22c4-db4c-103c876f8bd4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5632-22c4-35fc-130f5ae4de76	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5632-22c4-0bc3-7ae3dc19fb81	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5632-22c4-e942-a302e8ad1c0e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5632-22c4-a112-83aded3822a9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5632-22c4-9394-7d603b445b53	SD	SDN	729	Sudan 	Sudan	\N
00040000-5632-22c4-369a-0e6bf4df7bf2	SR	SUR	740	Suriname 	Surinam	\N
00040000-5632-22c4-78b5-d2b894840f2e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5632-22c4-faee-09f10b653238	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5632-22c4-fa15-3f7a2e26ab71	SE	SWE	752	Sweden 	Švedska	\N
00040000-5632-22c4-c214-98eb4537b534	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5632-22c4-30d2-8c01e7cc0d33	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5632-22c4-2ad9-ad74de5f1613	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5632-22c4-b830-1844ba02623a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5632-22c4-2294-df9ae28633ed	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5632-22c4-d7b3-2a1391c74547	TH	THA	764	Thailand 	Tajska	\N
00040000-5632-22c4-05ce-61e183c2282e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5632-22c4-4249-9d9f19ec98a0	TG	TGO	768	Togo 	Togo	\N
00040000-5632-22c4-355c-6d7c157c339c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5632-22c4-ba67-64b0e9c2e3ac	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5632-22c4-000b-ffa7285575ff	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5632-22c4-1ec1-182190ca9114	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5632-22c4-ef7c-abfbe08996f7	TR	TUR	792	Turkey 	Turčija	\N
00040000-5632-22c4-15a4-b96fe707c013	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5632-22c4-8e54-5ba7d1d505ba	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5632-22c4-2b33-a24be74bb176	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5632-22c4-d03e-f54186d41a35	UG	UGA	800	Uganda 	Uganda	\N
00040000-5632-22c4-2885-fadf593a36e3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5632-22c4-7932-91339f816b7d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5632-22c4-bf82-2f8459c2db81	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5632-22c4-4750-5258ab6127f3	US	USA	840	United States 	Združene države Amerike	\N
00040000-5632-22c4-7f2f-c77bf1ef8770	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5632-22c4-c7c3-58897f0819f5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5632-22c4-a6d4-d899d7e78c32	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5632-22c4-8936-d6492c55fb15	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5632-22c4-a161-07c6b2d64f48	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5632-22c4-db42-03c4299775c2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5632-22c4-45ec-abdf4be6b5d3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5632-22c4-4119-e0aaf6bdad35	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5632-22c4-6143-1ad77a9be86f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5632-22c4-e684-925484b61065	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5632-22c4-2c62-a88cfece75f7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5632-22c4-0f42-81e011ac8dbc	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5632-22c4-886d-5341d040563c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3131 (class 0 OID 24095032)
-- Dependencies: 237
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5632-22c6-d8a1-e0159c1e882d	000e0000-5632-22c6-e12d-f0d3d7278816	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5632-22c3-3b60-51ae376a60fe	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5632-22c6-c985-e6163ddd16bc	000e0000-5632-22c6-e6c7-9c1ebb876d17	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5632-22c3-817f-c55171827e47	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5632-22c6-6a45-8b40593c40a6	000e0000-5632-22c6-f41a-e356d55a31a3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5632-22c3-3b60-51ae376a60fe	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5632-22c6-a04f-42fd181bf9e8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5632-22c6-33c3-d14b355ca778	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3116 (class 0 OID 24094833)
-- Dependencies: 222
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5632-22c6-3f72-b0bf50169e98	000e0000-5632-22c6-e6c7-9c1ebb876d17	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5632-22c3-ea19-5eda4a01744a
000d0000-5632-22c6-e742-751b1ea94893	000e0000-5632-22c6-e6c7-9c1ebb876d17	000c0000-5632-22c6-1938-447918a21fda	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5632-22c3-ea19-5eda4a01744a
000d0000-5632-22c6-19b8-ad3d6c9bd7bb	000e0000-5632-22c6-e6c7-9c1ebb876d17	000c0000-5632-22c6-8697-0ac2cf4b4df0	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5632-22c3-a80d-4ca3cf8e95df
000d0000-5632-22c6-413a-1898a6d67747	000e0000-5632-22c6-e6c7-9c1ebb876d17	000c0000-5632-22c6-86a0-bbbcd3b7445a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5632-22c3-ef88-51f46db553fd
000d0000-5632-22c6-173f-b73f17e11a48	000e0000-5632-22c6-e6c7-9c1ebb876d17	000c0000-5632-22c6-25cb-1f2a3c5aeda3	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5632-22c3-7103-a804e4f3c335
000d0000-5632-22c6-6867-d130cedfb451	000e0000-5632-22c6-e6c7-9c1ebb876d17	000c0000-5632-22c6-dec2-f5e0aa530ece	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5632-22c3-7103-a804e4f3c335
000d0000-5632-22c6-43a4-1f358c838fe3	000e0000-5632-22c6-e6c7-9c1ebb876d17	000c0000-5632-22c6-ac37-a14a7fe4e8aa	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5632-22c3-ea19-5eda4a01744a
000d0000-5632-22c6-da58-9d7bafc14df9	000e0000-5632-22c6-e6c7-9c1ebb876d17	000c0000-5632-22c6-1fea-a3548fbe6109	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5632-22c3-f5d3-57c077101272
000d0000-5632-22c6-f64e-7acdc5d141df	000e0000-5632-22c6-e6c7-9c1ebb876d17	000c0000-5632-22c6-299e-6320ffc06504	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5632-22c3-9562-f30ed9febdd9
\.


--
-- TOC entry 3094 (class 0 OID 24094630)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 24094596)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 24094573)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5632-22c6-4f46-a8cde2617d89	00080000-5632-22c6-45b9-ab85ed72d11f	00090000-5632-22c6-42b8-73dcb93b9746	AK		igralka
\.


--
-- TOC entry 3105 (class 0 OID 24094747)
-- Dependencies: 211
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 24095271)
-- Dependencies: 248
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 24095283)
-- Dependencies: 249
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 24095305)
-- Dependencies: 251
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 23562333)
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
\.


--
-- TOC entry 3109 (class 0 OID 24094772)
-- Dependencies: 215
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 24094530)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5632-22c4-1768-5b36d82a9872	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5632-22c4-a4cb-4dfb7f5ab930	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5632-22c4-99ed-adc6a6c42738	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5632-22c4-78c7-a6e1cdd8fb18	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5632-22c4-4951-f1d64b45fa7f	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5632-22c4-7e27-d0e1d93917bd	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5632-22c4-6a9b-84f413adcaf0	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5632-22c4-f5b2-3fef621a1a00	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5632-22c4-878d-0927d5568a93	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5632-22c4-3b8d-20cb67f6ea24	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5632-22c4-2266-9374b8cc67e0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5632-22c4-8377-31ecd00394d6	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5632-22c4-77bf-3ef56eeac9a9	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5632-22c4-0968-669ba72ad7b2	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5632-22c4-eecb-3c392324751a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5632-22c5-3a15-af02f1b76764	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5632-22c5-ea8d-208b99d24436	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5632-22c5-dcef-b9deee8dcd61	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5632-22c5-a3e7-b335173e973d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5632-22c5-6532-5403c6533c39	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5632-22c7-baca-cb2d29f113cd	application.tenant.maticnopodjetje	string	s:36:"00080000-5632-22c7-3f8c-773f67563833";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3079 (class 0 OID 24094430)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5632-22c5-6b8e-a3273b328797	00000000-5632-22c5-3a15-af02f1b76764	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5632-22c5-8dd4-f152846ecd90	00000000-5632-22c5-3a15-af02f1b76764	00010000-5632-22c4-b999-27efd0aac4fe	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5632-22c5-b444-c139c6e7ea96	00000000-5632-22c5-ea8d-208b99d24436	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3083 (class 0 OID 24094497)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5632-22c6-72c9-bbe365fc96a8	\N	00100000-5632-22c6-a463-12c959147366	00100000-5632-22c6-81aa-6602c91ba944	01	Gledališče Nimbis
00410000-5632-22c6-b542-774bf1034fee	00410000-5632-22c6-72c9-bbe365fc96a8	00100000-5632-22c6-a463-12c959147366	00100000-5632-22c6-81aa-6602c91ba944	02	Tehnika
\.


--
-- TOC entry 3080 (class 0 OID 24094441)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5632-22c6-dc53-12188c2b0ccf	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5632-22c6-32e6-04b4868c941d	00010000-5632-22c6-aa4b-0c84c351bf9a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5632-22c6-f2ab-51ea2de2f296	00010000-5632-22c6-972d-46e7a5fd46e6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5632-22c6-257c-9481f2496fef	00010000-5632-22c6-97e3-9cb6799da4bc	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5632-22c6-e4d9-4be1be502778	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5632-22c6-9cad-5d4a1b2288f7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5632-22c6-5b07-dde5987b813e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5632-22c6-b582-84c5d32dd1af	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5632-22c6-42b8-73dcb93b9746	00010000-5632-22c6-b2b5-b1f9ab969a4f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5632-22c6-0ccd-86bde4a09ec5	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5632-22c6-29e8-76cc7d9ad281	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5632-22c6-fbd4-27a34353db4e	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5632-22c6-70b0-28ec762ad279	00010000-5632-22c6-54f6-d839fa9df77d	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5632-22c6-1486-93b04bdb8e3e	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5632-22c6-9253-0098d25af330	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5632-22c6-e7d4-b9213176fc1c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5632-22c6-5a55-4d7705fc54d4	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5632-22c6-6138-82b7e53a77bd	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5632-22c6-c5e7-0bd011ab0b9d	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5632-22c6-5e52-30998e29a6f7	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5632-22c6-66a0-efaab8038f33	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3072 (class 0 OID 24094376)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5632-22c4-31d8-3d48cfb80ffa	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5632-22c4-704a-39f401aa255a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5632-22c4-66c1-f6c1d011d280	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5632-22c4-e1ae-30fa16af93f4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5632-22c4-da3a-37bceb46a46f	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5632-22c4-5682-d13bb521a742	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5632-22c4-f65c-7e52df68e6a8	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5632-22c4-b144-b6436962397c	Abonma-read	Abonma - branje	t
00030000-5632-22c4-4f9f-6ad72934ae3b	Abonma-write	Abonma - spreminjanje	t
00030000-5632-22c4-8781-6c1e0b3205c0	Alternacija-read	Alternacija - branje	t
00030000-5632-22c4-2984-15bcb6791f4e	Alternacija-write	Alternacija - spreminjanje	t
00030000-5632-22c4-a74d-ec15b5c5ca0a	Arhivalija-read	Arhivalija - branje	t
00030000-5632-22c4-b4b1-40eb5b19f107	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5632-22c4-6dd1-6428a064485f	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5632-22c4-aac2-dcbf4e58bef6	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5632-22c4-b05d-d35bb9603953	Besedilo-read	Besedilo - branje	t
00030000-5632-22c4-a023-a9fd6ca42348	Besedilo-write	Besedilo - spreminjanje	t
00030000-5632-22c4-454b-ad2552193a1e	DogodekIzven-read	DogodekIzven - branje	t
00030000-5632-22c4-4065-9aebe44054a3	DogodekIzven-write	DogodekIzven - spreminjanje	t
00030000-5632-22c4-6f8e-4a0c3bb65c5c	Dogodek-read	Dogodek - branje	t
00030000-5632-22c4-cee0-5d7f117cb30e	Dogodek-write	Dogodek - spreminjanje	t
00030000-5632-22c4-9290-3867d8a53389	DrugiVir-read	DrugiVir - branje	t
00030000-5632-22c4-1571-60fdf2b738b8	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5632-22c4-fbb6-dd9fe5a02b36	Drzava-read	Drzava - branje	t
00030000-5632-22c4-b5d0-83144c8d356f	Drzava-write	Drzava - spreminjanje	t
00030000-5632-22c4-451b-011ab583e2ff	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5632-22c4-08af-c30eccae46b4	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5632-22c4-7fa0-90357f0baad8	Funkcija-read	Funkcija - branje	t
00030000-5632-22c4-fedc-96cc912be46a	Funkcija-write	Funkcija - spreminjanje	t
00030000-5632-22c4-2dac-0715849d3db2	Gostovanje-read	Gostovanje - branje	t
00030000-5632-22c4-35bc-30ed1dc2cab6	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5632-22c4-4643-38004e21582d	Gostujoca-read	Gostujoca - branje	t
00030000-5632-22c4-4fb6-3a9affb31d1f	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5632-22c4-8779-1aa7e6101aa2	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5632-22c4-3149-b1aed58ea8ff	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5632-22c4-263d-a4d7f66deaa4	Kupec-read	Kupec - branje	t
00030000-5632-22c4-1893-c35054e20155	Kupec-write	Kupec - spreminjanje	t
00030000-5632-22c4-5bc3-6c2a95fd7746	NacinPlacina-read	NacinPlacina - branje	t
00030000-5632-22c4-3ab0-817a80b2eb76	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5632-22c4-cf3d-ea1be2c275ef	Option-read	Option - branje	t
00030000-5632-22c4-3f00-88130098ebc9	Option-write	Option - spreminjanje	t
00030000-5632-22c4-1ecb-498097287834	OptionValue-read	OptionValue - branje	t
00030000-5632-22c4-437e-76fb80fcc2e1	OptionValue-write	OptionValue - spreminjanje	t
00030000-5632-22c4-1d5d-2fb7fc1357e1	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5632-22c4-a090-060d09273c02	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5632-22c4-58a3-17f45eee0739	Oseba-read	Oseba - branje	t
00030000-5632-22c4-5299-c737b346f2f2	Oseba-write	Oseba - spreminjanje	t
00030000-5632-22c4-4ab7-f42ce530878a	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5632-22c4-e043-00b4014de318	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5632-22c4-33a8-36cbbedcaac3	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5632-22c4-4c6c-1ff7faa63396	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5632-22c4-ce69-94246890cefc	Pogodba-read	Pogodba - branje	t
00030000-5632-22c4-b70c-d6133251522d	Pogodba-write	Pogodba - spreminjanje	t
00030000-5632-22c4-709b-a25b83b21ff5	Popa-read	Popa - branje	t
00030000-5632-22c4-b871-f82f44b318eb	Popa-write	Popa - spreminjanje	t
00030000-5632-22c4-db10-c0f5d2a29c14	Posta-read	Posta - branje	t
00030000-5632-22c4-0e63-b3c4dc8c9fee	Posta-write	Posta - spreminjanje	t
00030000-5632-22c4-65d8-fd54159f9398	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5632-22c4-5829-bb51c001b106	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5632-22c4-d394-7065003c0350	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5632-22c4-389a-01f032734ba3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5632-22c4-b25d-d858e1c5f036	PostniNaslov-read	PostniNaslov - branje	t
00030000-5632-22c4-27bb-861894465d7d	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5632-22c4-2899-e09adf5cda77	Predstava-read	Predstava - branje	t
00030000-5632-22c4-bb52-59da15c7ecd8	Predstava-write	Predstava - spreminjanje	t
00030000-5632-22c4-014a-fa119ac52927	Praznik-read	Praznik - branje	t
00030000-5632-22c4-5219-cdeaf37c3fdc	Praznik-write	Praznik - spreminjanje	t
00030000-5632-22c4-3489-fdccf7682486	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5632-22c4-e7ae-ed8794a44c78	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5632-22c4-25de-98a25e40a0ef	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5632-22c4-0a9d-1ae13bd856b2	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5632-22c4-adfb-9e6e6fc35bb0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5632-22c4-2fff-852d905f1c76	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5632-22c4-cf18-45d0d5a42629	ProgramDela-read	ProgramDela - branje	t
00030000-5632-22c4-dcf4-32b078b99d03	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5632-22c4-0549-8614faa29c89	ProgramFestival-read	ProgramFestival - branje	t
00030000-5632-22c4-b6eb-02321eb68d63	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5632-22c4-ed67-6c506f4825ed	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5632-22c4-007d-4f0d937971e1	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5632-22c4-e424-2076c9ab270e	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5632-22c4-caee-7e00ad1ecfb6	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5632-22c4-1863-510fbd9758f1	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5632-22c4-71b2-0b55095345b9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5632-22c4-44f4-d1f699cec580	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5632-22c4-0214-34e2964c921f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5632-22c4-8fe9-f5cafb5bc215	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5632-22c4-ddd5-b2ef4a5427fc	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5632-22c4-7b02-e2a3e82a1ca4	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5632-22c4-f4f6-635e15eab214	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5632-22c4-0bfc-040576810ff1	ProgramRazno-read	ProgramRazno - branje	t
00030000-5632-22c4-8785-63afdc11fcb5	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5632-22c4-b6d6-1643afbad7b5	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5632-22c4-187a-7ca443e53125	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5632-22c4-47b9-be945ab67b5c	Prostor-read	Prostor - branje	t
00030000-5632-22c4-f58e-d492fc6a8d31	Prostor-write	Prostor - spreminjanje	t
00030000-5632-22c4-a22a-7fdaaa5f581a	Racun-read	Racun - branje	t
00030000-5632-22c4-7fa2-5bf73e091c1b	Racun-write	Racun - spreminjanje	t
00030000-5632-22c4-7079-089c6042ab9c	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5632-22c4-113e-d2f4e70196ac	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5632-22c4-0950-471950d83f75	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5632-22c4-184b-034342915639	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5632-22c4-59d7-ff32915e1d4b	Rekvizit-read	Rekvizit - branje	t
00030000-5632-22c4-347c-938433e156fe	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5632-22c4-2a05-6eeca94ead41	Revizija-read	Revizija - branje	t
00030000-5632-22c4-cb34-1ec7629140c6	Revizija-write	Revizija - spreminjanje	t
00030000-5632-22c4-c538-415fe6c4f11e	Rezervacija-read	Rezervacija - branje	t
00030000-5632-22c4-8fcc-e2c37eb6f493	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5632-22c4-6a74-0c0199f93a96	SedezniRed-read	SedezniRed - branje	t
00030000-5632-22c4-4d37-217bb816400a	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5632-22c4-ace1-0cd7107874c8	Sedez-read	Sedez - branje	t
00030000-5632-22c4-01e8-f3bcf50e3df1	Sedez-write	Sedez - spreminjanje	t
00030000-5632-22c4-fcbc-4c6e80abdaa9	Sezona-read	Sezona - branje	t
00030000-5632-22c4-bfe3-48e680feaebd	Sezona-write	Sezona - spreminjanje	t
00030000-5632-22c4-b240-5d98832e7fac	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5632-22c4-3fc0-446b3e52d80d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5632-22c4-e204-b741df118926	Stevilcenje-read	Stevilcenje - branje	t
00030000-5632-22c4-405e-01af81918cd3	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5632-22c4-d6e3-c44a1a5e1864	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5632-22c4-a49a-16858e3c2427	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5632-22c4-0bfe-c70e975d6ee7	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5632-22c4-67b2-b15d633ff725	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5632-22c4-1ae0-e3a562cd52da	Telefonska-read	Telefonska - branje	t
00030000-5632-22c4-9341-dd000df17869	Telefonska-write	Telefonska - spreminjanje	t
00030000-5632-22c4-6810-76a99646d587	TerminStoritve-read	TerminStoritve - branje	t
00030000-5632-22c4-58ab-1dde8bcf048a	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5632-22c4-abe6-430e13d536cf	TipFunkcije-read	TipFunkcije - branje	t
00030000-5632-22c4-5f02-b5151a64085c	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5632-22c4-f71a-3212e58c52c1	TipPopa-read	TipPopa - branje	t
00030000-5632-22c4-d1a2-e6b9bc1851aa	TipPopa-write	TipPopa - spreminjanje	t
00030000-5632-22c4-d273-8e6d3d93b3c8	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5632-22c4-22a1-d3d6e108099c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5632-22c4-9d3a-fb9e7c775f45	TipVaje-read	TipVaje - branje	t
00030000-5632-22c4-e3c9-47ede431d167	TipVaje-write	TipVaje - spreminjanje	t
00030000-5632-22c4-4dfe-f00ee1ad2e2e	Trr-read	Trr - branje	t
00030000-5632-22c4-72f0-508e444c58a4	Trr-write	Trr - spreminjanje	t
00030000-5632-22c4-b183-ec806393885e	Uprizoritev-read	Uprizoritev - branje	t
00030000-5632-22c4-ad4c-30145f2269cd	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5632-22c4-340f-8e4ed19e0484	Vaja-read	Vaja - branje	t
00030000-5632-22c4-5cb2-27fd732493f9	Vaja-write	Vaja - spreminjanje	t
00030000-5632-22c4-1ab8-1c0436026115	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5632-22c4-0842-2a0a0d6bcf06	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5632-22c4-a31a-1f34abb9b890	VrstaStroska-read	VrstaStroska - branje	t
00030000-5632-22c4-81fa-09d7ce537d0c	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5632-22c4-6947-7b424493e9a6	Zaposlitev-read	Zaposlitev - branje	t
00030000-5632-22c4-c24a-b43c84892fb9	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5632-22c4-1b80-327c693b22ab	Zasedenost-read	Zasedenost - branje	t
00030000-5632-22c4-182e-060cd2635218	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5632-22c4-0068-d17b07d31f31	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5632-22c4-dd1e-2194dc23a0bc	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5632-22c4-97dd-6564ebf3b827	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5632-22c4-ab5d-479b4376d9d7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5632-22c4-e816-6e07dd21b83a	Job-read	Branje opravil - samo zase - branje	t
00030000-5632-22c4-78e2-f7e92e1b5aab	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5632-22c4-f6f9-41175187d881	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5632-22c4-88b4-3f11c0d80c17	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5632-22c4-77e3-09039a6900ee	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5632-22c4-f4ce-73c7c027de79	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5632-22c4-3f97-bbdf994ddc3d	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5632-22c4-24f6-0cb3b13192e0	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5632-22c4-2a64-4dafd0b1bfdb	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5632-22c4-1b39-60b5deebd7ca	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5632-22c4-0bb0-aabf6a95bf62	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5632-22c4-cc53-972687aea48b	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5632-22c4-54cc-ad302a1cb5c5	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5632-22c4-2f6e-15259b3969f5	Datoteka-write	Datoteka - spreminjanje	t
00030000-5632-22c4-c4ea-3d2c70e2197c	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3074 (class 0 OID 24094395)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5632-22c4-e7c3-3e014f2142f2	00030000-5632-22c4-704a-39f401aa255a
00020000-5632-22c4-e8a8-24fab1f15036	00030000-5632-22c4-fbb6-dd9fe5a02b36
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-b144-b6436962397c
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-4f9f-6ad72934ae3b
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-8781-6c1e0b3205c0
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-2984-15bcb6791f4e
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-a74d-ec15b5c5ca0a
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-6f8e-4a0c3bb65c5c
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-e1ae-30fa16af93f4
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-cee0-5d7f117cb30e
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-fbb6-dd9fe5a02b36
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-b5d0-83144c8d356f
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-7fa0-90357f0baad8
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-fedc-96cc912be46a
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-2dac-0715849d3db2
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-35bc-30ed1dc2cab6
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-4643-38004e21582d
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-4fb6-3a9affb31d1f
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-8779-1aa7e6101aa2
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-3149-b1aed58ea8ff
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-cf3d-ea1be2c275ef
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-1ecb-498097287834
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-58a3-17f45eee0739
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-5299-c737b346f2f2
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-709b-a25b83b21ff5
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-b871-f82f44b318eb
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-db10-c0f5d2a29c14
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-0e63-b3c4dc8c9fee
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-b25d-d858e1c5f036
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-27bb-861894465d7d
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-2899-e09adf5cda77
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-bb52-59da15c7ecd8
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-adfb-9e6e6fc35bb0
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-2fff-852d905f1c76
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-47b9-be945ab67b5c
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-f58e-d492fc6a8d31
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-0950-471950d83f75
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-184b-034342915639
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-59d7-ff32915e1d4b
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-347c-938433e156fe
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-fcbc-4c6e80abdaa9
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-bfe3-48e680feaebd
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-abe6-430e13d536cf
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-b183-ec806393885e
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-ad4c-30145f2269cd
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-340f-8e4ed19e0484
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-5cb2-27fd732493f9
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-1b80-327c693b22ab
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-182e-060cd2635218
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-0068-d17b07d31f31
00020000-5632-22c4-dfcf-5ce8a5937b60	00030000-5632-22c4-97dd-6564ebf3b827
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-b144-b6436962397c
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-a74d-ec15b5c5ca0a
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-6f8e-4a0c3bb65c5c
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-fbb6-dd9fe5a02b36
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-2dac-0715849d3db2
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-4643-38004e21582d
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-8779-1aa7e6101aa2
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-3149-b1aed58ea8ff
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-cf3d-ea1be2c275ef
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-1ecb-498097287834
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-58a3-17f45eee0739
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-5299-c737b346f2f2
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-709b-a25b83b21ff5
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-db10-c0f5d2a29c14
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-b25d-d858e1c5f036
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-27bb-861894465d7d
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-2899-e09adf5cda77
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-47b9-be945ab67b5c
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-0950-471950d83f75
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-59d7-ff32915e1d4b
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-fcbc-4c6e80abdaa9
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-1ae0-e3a562cd52da
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-9341-dd000df17869
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-4dfe-f00ee1ad2e2e
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-72f0-508e444c58a4
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-6947-7b424493e9a6
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-c24a-b43c84892fb9
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-0068-d17b07d31f31
00020000-5632-22c4-e4f4-f1bba79db1e1	00030000-5632-22c4-97dd-6564ebf3b827
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-b144-b6436962397c
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-8781-6c1e0b3205c0
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-a74d-ec15b5c5ca0a
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-b4b1-40eb5b19f107
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-b05d-d35bb9603953
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-454b-ad2552193a1e
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-6f8e-4a0c3bb65c5c
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-fbb6-dd9fe5a02b36
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-7fa0-90357f0baad8
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-2dac-0715849d3db2
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-4643-38004e21582d
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-8779-1aa7e6101aa2
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-cf3d-ea1be2c275ef
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-1ecb-498097287834
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-58a3-17f45eee0739
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-709b-a25b83b21ff5
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-db10-c0f5d2a29c14
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-2899-e09adf5cda77
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-adfb-9e6e6fc35bb0
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-47b9-be945ab67b5c
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-0950-471950d83f75
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-59d7-ff32915e1d4b
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-fcbc-4c6e80abdaa9
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-abe6-430e13d536cf
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-340f-8e4ed19e0484
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-1b80-327c693b22ab
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-0068-d17b07d31f31
00020000-5632-22c4-4503-470b65bebb04	00030000-5632-22c4-97dd-6564ebf3b827
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-b144-b6436962397c
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-4f9f-6ad72934ae3b
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-2984-15bcb6791f4e
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-a74d-ec15b5c5ca0a
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-6f8e-4a0c3bb65c5c
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-fbb6-dd9fe5a02b36
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-2dac-0715849d3db2
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-4643-38004e21582d
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-cf3d-ea1be2c275ef
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-1ecb-498097287834
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-709b-a25b83b21ff5
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-db10-c0f5d2a29c14
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-2899-e09adf5cda77
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-47b9-be945ab67b5c
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-0950-471950d83f75
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-59d7-ff32915e1d4b
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-fcbc-4c6e80abdaa9
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-abe6-430e13d536cf
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-0068-d17b07d31f31
00020000-5632-22c4-1496-4cc12fb1ea1e	00030000-5632-22c4-97dd-6564ebf3b827
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-b144-b6436962397c
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-a74d-ec15b5c5ca0a
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-6f8e-4a0c3bb65c5c
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-fbb6-dd9fe5a02b36
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-2dac-0715849d3db2
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-4643-38004e21582d
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-cf3d-ea1be2c275ef
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-1ecb-498097287834
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-709b-a25b83b21ff5
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-db10-c0f5d2a29c14
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-2899-e09adf5cda77
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-47b9-be945ab67b5c
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-0950-471950d83f75
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-59d7-ff32915e1d4b
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-fcbc-4c6e80abdaa9
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-6810-76a99646d587
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-66c1-f6c1d011d280
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-abe6-430e13d536cf
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-0068-d17b07d31f31
00020000-5632-22c4-bada-fb6e1384e96f	00030000-5632-22c4-97dd-6564ebf3b827
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-31d8-3d48cfb80ffa
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-704a-39f401aa255a
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b144-b6436962397c
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-4f9f-6ad72934ae3b
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-8781-6c1e0b3205c0
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-2984-15bcb6791f4e
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-a74d-ec15b5c5ca0a
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b4b1-40eb5b19f107
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-6dd1-6428a064485f
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-aac2-dcbf4e58bef6
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b05d-d35bb9603953
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-a023-a9fd6ca42348
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-454b-ad2552193a1e
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-4065-9aebe44054a3
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-6f8e-4a0c3bb65c5c
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-e1ae-30fa16af93f4
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-cee0-5d7f117cb30e
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-9290-3867d8a53389
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-1571-60fdf2b738b8
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-fbb6-dd9fe5a02b36
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b5d0-83144c8d356f
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-451b-011ab583e2ff
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-08af-c30eccae46b4
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-7fa0-90357f0baad8
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-fedc-96cc912be46a
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-2dac-0715849d3db2
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-35bc-30ed1dc2cab6
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-4643-38004e21582d
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-4fb6-3a9affb31d1f
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-8779-1aa7e6101aa2
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-3149-b1aed58ea8ff
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-263d-a4d7f66deaa4
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-1893-c35054e20155
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-5bc3-6c2a95fd7746
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-3ab0-817a80b2eb76
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-cf3d-ea1be2c275ef
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-1ecb-498097287834
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-437e-76fb80fcc2e1
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-3f00-88130098ebc9
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-1d5d-2fb7fc1357e1
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-a090-060d09273c02
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-58a3-17f45eee0739
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-da3a-37bceb46a46f
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-5299-c737b346f2f2
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-4ab7-f42ce530878a
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-e043-00b4014de318
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-33a8-36cbbedcaac3
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-4c6c-1ff7faa63396
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-ce69-94246890cefc
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b70c-d6133251522d
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-709b-a25b83b21ff5
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b871-f82f44b318eb
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-db10-c0f5d2a29c14
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-65d8-fd54159f9398
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-5829-bb51c001b106
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-d394-7065003c0350
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-389a-01f032734ba3
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-0e63-b3c4dc8c9fee
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b25d-d858e1c5f036
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-27bb-861894465d7d
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-014a-fa119ac52927
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-5219-cdeaf37c3fdc
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-2899-e09adf5cda77
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-bb52-59da15c7ecd8
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-3489-fdccf7682486
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-e7ae-ed8794a44c78
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-25de-98a25e40a0ef
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-0a9d-1ae13bd856b2
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-adfb-9e6e6fc35bb0
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-2fff-852d905f1c76
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-5682-d13bb521a742
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-cf18-45d0d5a42629
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-f65c-7e52df68e6a8
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-dcf4-32b078b99d03
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-0549-8614faa29c89
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b6eb-02321eb68d63
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-ed67-6c506f4825ed
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-007d-4f0d937971e1
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-e424-2076c9ab270e
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-caee-7e00ad1ecfb6
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-1863-510fbd9758f1
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-71b2-0b55095345b9
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-44f4-d1f699cec580
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-0214-34e2964c921f
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-8fe9-f5cafb5bc215
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-ddd5-b2ef4a5427fc
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-7b02-e2a3e82a1ca4
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-f4f6-635e15eab214
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-0bfc-040576810ff1
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-8785-63afdc11fcb5
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b6d6-1643afbad7b5
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-187a-7ca443e53125
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-47b9-be945ab67b5c
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-f58e-d492fc6a8d31
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-a22a-7fdaaa5f581a
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-7fa2-5bf73e091c1b
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-7079-089c6042ab9c
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-113e-d2f4e70196ac
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-0950-471950d83f75
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-184b-034342915639
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-59d7-ff32915e1d4b
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-347c-938433e156fe
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-2a05-6eeca94ead41
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-cb34-1ec7629140c6
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-c538-415fe6c4f11e
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-8fcc-e2c37eb6f493
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-6a74-0c0199f93a96
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-4d37-217bb816400a
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-ace1-0cd7107874c8
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-01e8-f3bcf50e3df1
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-fcbc-4c6e80abdaa9
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-bfe3-48e680feaebd
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b240-5d98832e7fac
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-3fc0-446b3e52d80d
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-e204-b741df118926
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-d6e3-c44a1a5e1864
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-a49a-16858e3c2427
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-405e-01af81918cd3
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-0bfe-c70e975d6ee7
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-67b2-b15d633ff725
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-1ae0-e3a562cd52da
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-9341-dd000df17869
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-6810-76a99646d587
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-66c1-f6c1d011d280
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-58ab-1dde8bcf048a
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-abe6-430e13d536cf
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-5f02-b5151a64085c
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-f71a-3212e58c52c1
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-d1a2-e6b9bc1851aa
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-d273-8e6d3d93b3c8
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-22a1-d3d6e108099c
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-9d3a-fb9e7c775f45
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-e3c9-47ede431d167
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-4dfe-f00ee1ad2e2e
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-72f0-508e444c58a4
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-b183-ec806393885e
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-ad4c-30145f2269cd
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-340f-8e4ed19e0484
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-5cb2-27fd732493f9
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-1ab8-1c0436026115
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-0842-2a0a0d6bcf06
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-a31a-1f34abb9b890
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-81fa-09d7ce537d0c
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-6947-7b424493e9a6
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-c24a-b43c84892fb9
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-1b80-327c693b22ab
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-182e-060cd2635218
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-0068-d17b07d31f31
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-dd1e-2194dc23a0bc
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-97dd-6564ebf3b827
00020000-5632-22c6-8df3-76c439d74fd5	00030000-5632-22c4-ab5d-479b4376d9d7
\.


--
-- TOC entry 3110 (class 0 OID 24094779)
-- Dependencies: 216
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 24094813)
-- Dependencies: 220
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 24094950)
-- Dependencies: 232
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5632-22c6-5f65-ee2790df8871	00090000-5632-22c6-dc53-12188c2b0ccf	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5632-22c6-07dc-d9de9bf28efe	00090000-5632-22c6-9cad-5d4a1b2288f7	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5632-22c6-292d-c7f11a63b03f	00090000-5632-22c6-70b0-28ec762ad279	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5632-22c6-6a9f-e7b478e8baaa	00090000-5632-22c6-0ccd-86bde4a09ec5	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3082 (class 0 OID 24094477)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5632-22c6-45b9-ab85ed72d11f	\N	00040000-5632-22c4-b4b2-5579fc194152	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5632-22c6-c3d7-b858357aa9a7	\N	00040000-5632-22c4-b4b2-5579fc194152	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5632-22c6-5f19-e5a2d1d641d6	\N	00040000-5632-22c4-b4b2-5579fc194152	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5632-22c6-d076-cd3881d20e7a	\N	00040000-5632-22c4-b4b2-5579fc194152	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5632-22c6-e9e3-b5727cacec78	\N	00040000-5632-22c4-b4b2-5579fc194152	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5632-22c6-26a5-2878c45f519c	\N	00040000-5632-22c3-7075-1d935d60c8d9	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5632-22c6-2b8e-b2d6354cc1fa	\N	00040000-5632-22c3-e6b6-9a8b25a30ed2	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5632-22c6-5f8a-0694939e4ea9	\N	00040000-5632-22c3-e05c-576d3a831541	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5632-22c6-d6c7-730cffa59208	\N	00040000-5632-22c4-07d3-0b8167af5e12	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5632-22c7-3f8c-773f67563833	\N	00040000-5632-22c4-b4b2-5579fc194152	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3085 (class 0 OID 24094522)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5632-22c3-6e0f-f8d5c38f8c07	8341	Adlešiči
00050000-5632-22c3-15ee-3b832c1ccac2	5270	Ajdovščina
00050000-5632-22c3-bcff-4dfd24f5e797	6280	Ankaran/Ancarano
00050000-5632-22c3-b96e-cc0aae104e68	9253	Apače
00050000-5632-22c3-5c41-85633d8eb123	8253	Artiče
00050000-5632-22c3-d95a-4ec7f4b24183	4275	Begunje na Gorenjskem
00050000-5632-22c3-0f3f-ba25a2cca781	1382	Begunje pri Cerknici
00050000-5632-22c3-055c-90f109ebc974	9231	Beltinci
00050000-5632-22c3-7f2f-5ce708aa7fe3	2234	Benedikt
00050000-5632-22c3-94fa-6a910f9f6b89	2345	Bistrica ob Dravi
00050000-5632-22c3-3f36-79cd62c3835d	3256	Bistrica ob Sotli
00050000-5632-22c3-0df8-84f98b14240e	8259	Bizeljsko
00050000-5632-22c3-1b1b-6da997b5954e	1223	Blagovica
00050000-5632-22c3-4929-c8d183dc3d00	8283	Blanca
00050000-5632-22c3-3067-a00bb2ae242d	4260	Bled
00050000-5632-22c3-5265-4950485552f5	4273	Blejska Dobrava
00050000-5632-22c3-d042-e66bb7b5daf9	9265	Bodonci
00050000-5632-22c3-ff07-7e41881008cd	9222	Bogojina
00050000-5632-22c3-8db9-e1fca321271a	4263	Bohinjska Bela
00050000-5632-22c3-d0a5-75335221c6a0	4264	Bohinjska Bistrica
00050000-5632-22c3-99c5-ea7928c32cee	4265	Bohinjsko jezero
00050000-5632-22c3-48d8-9b534673f741	1353	Borovnica
00050000-5632-22c3-1258-f1e4b3eff769	8294	Boštanj
00050000-5632-22c3-6ea2-6c3fe63317f7	5230	Bovec
00050000-5632-22c3-75ba-a921a7d08ffc	5295	Branik
00050000-5632-22c3-82c3-506bf5245386	3314	Braslovče
00050000-5632-22c3-935e-bb5fd578644a	5223	Breginj
00050000-5632-22c3-1f56-f846d77233d3	8280	Brestanica
00050000-5632-22c3-2e18-e3e58674fb98	2354	Bresternica
00050000-5632-22c3-0f17-8b0f6bbb54ce	4243	Brezje
00050000-5632-22c3-a76f-1fc32dd4f5d8	1351	Brezovica pri Ljubljani
00050000-5632-22c3-9a79-8efca2aa467d	8250	Brežice
00050000-5632-22c3-b23d-1d83bef7fe53	4210	Brnik - Aerodrom
00050000-5632-22c3-d78c-682316943c36	8321	Brusnice
00050000-5632-22c3-fdbd-28c2d5310890	3255	Buče
00050000-5632-22c3-afa5-62f2a91ddf9d	8276	Bučka 
00050000-5632-22c3-d6d9-b50228cd8ef1	9261	Cankova
00050000-5632-22c3-3a99-5973fb5c40e3	3000	Celje 
00050000-5632-22c3-aede-e5fcad3fa64d	3001	Celje - poštni predali
00050000-5632-22c3-bdc8-136edbe6d0e2	4207	Cerklje na Gorenjskem
00050000-5632-22c3-b73d-d49710f99b69	8263	Cerklje ob Krki
00050000-5632-22c3-fa5e-7c6b068d3964	1380	Cerknica
00050000-5632-22c3-41d4-fc073e64471d	5282	Cerkno
00050000-5632-22c3-ab79-29e45d58e419	2236	Cerkvenjak
00050000-5632-22c3-249d-dd42feb7754c	2215	Ceršak
00050000-5632-22c3-2b62-801b08984a85	2326	Cirkovce
00050000-5632-22c3-ea4e-4d85e36e88e7	2282	Cirkulane
00050000-5632-22c3-6339-e6505a7dd674	5273	Col
00050000-5632-22c3-aa02-4bad9acb809a	8251	Čatež ob Savi
00050000-5632-22c3-26dc-53cb80678f45	1413	Čemšenik
00050000-5632-22c3-d7ca-2c52521860dc	5253	Čepovan
00050000-5632-22c3-c71e-281c7c15a37d	9232	Črenšovci
00050000-5632-22c3-08bc-196b1c23410c	2393	Črna na Koroškem
00050000-5632-22c3-de79-87209aa3b002	6275	Črni Kal
00050000-5632-22c3-6bc1-6d0b212f72a5	5274	Črni Vrh nad Idrijo
00050000-5632-22c3-af5f-26c7b484b42f	5262	Črniče
00050000-5632-22c3-16f4-09054a65e4b5	8340	Črnomelj
00050000-5632-22c3-78cb-fc302448ef0a	6271	Dekani
00050000-5632-22c3-3565-aaa2db8da0af	5210	Deskle
00050000-5632-22c3-aafb-2e8f4a84368f	2253	Destrnik
00050000-5632-22c3-3d7e-ed91c6eddcf0	6215	Divača
00050000-5632-22c3-c3c6-81dd5659320c	1233	Dob
00050000-5632-22c3-f334-a34fb438040d	3224	Dobje pri Planini
00050000-5632-22c3-2663-a1dc9ab8dc47	8257	Dobova
00050000-5632-22c3-f5cd-2ebc08e5e0a6	1423	Dobovec
00050000-5632-22c3-6464-d56c530bfaf2	5263	Dobravlje
00050000-5632-22c3-c0e4-267633cffd70	3204	Dobrna
00050000-5632-22c3-0979-687d0005f491	8211	Dobrnič
00050000-5632-22c3-6e93-4bded11bce45	1356	Dobrova
00050000-5632-22c3-252f-629f3d30f1ec	9223	Dobrovnik/Dobronak 
00050000-5632-22c3-1a6e-9f02d800761d	5212	Dobrovo v Brdih
00050000-5632-22c3-5bad-6f246d94188a	1431	Dol pri Hrastniku
00050000-5632-22c3-ba9d-8ddfccbbb3fe	1262	Dol pri Ljubljani
00050000-5632-22c3-0666-5cc76ee41be8	1273	Dole pri Litiji
00050000-5632-22c3-4ab4-9dddbe5573e4	1331	Dolenja vas
00050000-5632-22c3-af43-2d8b8c196938	8350	Dolenjske Toplice
00050000-5632-22c3-3a48-9bd40696b358	1230	Domžale
00050000-5632-22c3-b628-0675568730a1	2252	Dornava
00050000-5632-22c3-b3c2-71c35e7ebf2e	5294	Dornberk
00050000-5632-22c3-22b6-7b7bac07e813	1319	Draga
00050000-5632-22c3-114b-9e5a1c837a4c	8343	Dragatuš
00050000-5632-22c3-3e98-e0d01569b816	3222	Dramlje
00050000-5632-22c3-0325-f5138fe6a318	2370	Dravograd
00050000-5632-22c3-f42d-95e04f37abfc	4203	Duplje
00050000-5632-22c3-2be6-121d90e0bd79	6221	Dutovlje
00050000-5632-22c3-5af1-dffca7855a64	8361	Dvor
00050000-5632-22c3-059b-1963b0a454c9	2343	Fala
00050000-5632-22c3-a8a6-53c6078275f0	9208	Fokovci
00050000-5632-22c3-751f-aa1f06fbe765	2313	Fram
00050000-5632-22c3-976d-e309f95ce53e	3213	Frankolovo
00050000-5632-22c3-75f1-b4f5fc219ea1	1274	Gabrovka
00050000-5632-22c3-8d78-065bd2b34877	8254	Globoko
00050000-5632-22c3-2c3f-2c311daa27a7	5275	Godovič
00050000-5632-22c3-b407-d25a1cef9063	4204	Golnik
00050000-5632-22c3-8c1c-d74c95b8d176	3303	Gomilsko
00050000-5632-22c3-1894-89abb5d78a44	4224	Gorenja vas
00050000-5632-22c3-8200-75f4393df6f6	3263	Gorica pri Slivnici
00050000-5632-22c3-4c2f-7346c4f920c3	2272	Gorišnica
00050000-5632-22c3-0085-01bae9904b78	9250	Gornja Radgona
00050000-5632-22c3-1c1b-6117d529f0d5	3342	Gornji Grad
00050000-5632-22c3-3b97-0f9a8d7911c9	4282	Gozd Martuljek
00050000-5632-22c3-ff93-7294453fb3e2	6272	Gračišče
00050000-5632-22c3-ec8c-b8d50173cfc6	9264	Grad
00050000-5632-22c3-c890-25d20b1fa76e	8332	Gradac
00050000-5632-22c3-d6e3-5e46c00ecd5c	1384	Grahovo
00050000-5632-22c3-ff16-9228b426a0de	5242	Grahovo ob Bači
00050000-5632-22c3-6d09-6549f435c0a9	5251	Grgar
00050000-5632-22c3-662f-0a5b67ca87a2	3302	Griže
00050000-5632-22c3-27fa-426ce8516ddc	3231	Grobelno
00050000-5632-22c3-2f98-7417d5f9d843	1290	Grosuplje
00050000-5632-22c3-d832-f068600ceba8	2288	Hajdina
00050000-5632-22c3-6397-ad16e321b97f	8362	Hinje
00050000-5632-22c3-896e-e2d6f1344aed	2311	Hoče
00050000-5632-22c3-d9dd-80eed7ca8689	9205	Hodoš/Hodos
00050000-5632-22c3-6566-a1d875f25643	1354	Horjul
00050000-5632-22c3-8dfc-27286bbcfef0	1372	Hotedršica
00050000-5632-22c3-4064-69a765336408	1430	Hrastnik
00050000-5632-22c3-6466-5752bba24d37	6225	Hruševje
00050000-5632-22c3-486d-0c77b9b73aad	4276	Hrušica
00050000-5632-22c3-cf99-3d2d4e65b6a7	5280	Idrija
00050000-5632-22c3-be3f-29eb5dbaad06	1292	Ig
00050000-5632-22c3-654d-5da2095fe0b6	6250	Ilirska Bistrica
00050000-5632-22c3-0bce-b14caad4900d	6251	Ilirska Bistrica-Trnovo
00050000-5632-22c3-ea92-5e9f82f18a5a	1295	Ivančna Gorica
00050000-5632-22c3-81a8-f2df4ddb19fa	2259	Ivanjkovci
00050000-5632-22c3-1e86-5596f2ec896c	1411	Izlake
00050000-5632-22c3-34d4-8d9b76278eb8	6310	Izola/Isola
00050000-5632-22c3-57ba-de2556a8727f	2222	Jakobski Dol
00050000-5632-22c3-0fd3-ee96e247d552	2221	Jarenina
00050000-5632-22c3-a5d4-e6db429af85e	6254	Jelšane
00050000-5632-22c3-5e51-07183f88ec35	4270	Jesenice
00050000-5632-22c3-0cd5-674363c29cce	8261	Jesenice na Dolenjskem
00050000-5632-22c3-7d91-7bf71b8e10bd	3273	Jurklošter
00050000-5632-22c3-313b-660034bf7287	2223	Jurovski Dol
00050000-5632-22c3-47d4-1830f64f0c84	2256	Juršinci
00050000-5632-22c3-d158-9308e1ef2fe7	5214	Kal nad Kanalom
00050000-5632-22c3-c52f-f16670fd6b17	3233	Kalobje
00050000-5632-22c3-60d8-fbaa367e6139	4246	Kamna Gorica
00050000-5632-22c3-67a4-1d8331b403db	2351	Kamnica
00050000-5632-22c3-3b86-2285cf3647e1	1241	Kamnik
00050000-5632-22c3-e19b-3be78422f1c0	5213	Kanal
00050000-5632-22c3-0b75-c88c32a2a37d	8258	Kapele
00050000-5632-22c3-bac3-817e93160b43	2362	Kapla
00050000-5632-22c3-aeab-4eb1354ae77d	2325	Kidričevo
00050000-5632-22c3-cec9-55aa0e515c36	1412	Kisovec
00050000-5632-22c3-c57e-38c7ef789833	6253	Knežak
00050000-5632-22c3-9ab1-27fb6ee7d054	5222	Kobarid
00050000-5632-22c3-97ce-91261062d090	9227	Kobilje
00050000-5632-22c3-cc21-a42d446a34f7	1330	Kočevje
00050000-5632-22c3-ecc0-db2f7bec306c	1338	Kočevska Reka
00050000-5632-22c3-f1a4-10fccbcc9f04	2276	Kog
00050000-5632-22c3-cf42-14033ff20be2	5211	Kojsko
00050000-5632-22c3-609a-9220c9ea179f	6223	Komen
00050000-5632-22c3-b203-d245d1b76d72	1218	Komenda
00050000-5632-22c3-80d4-a75cbd04a5fb	6000	Koper/Capodistria 
00050000-5632-22c3-6f23-30f7708fac3d	6001	Koper/Capodistria - poštni predali
00050000-5632-22c3-275b-9d75fb7d66b4	8282	Koprivnica
00050000-5632-22c3-a7ad-ee57ed316c0b	5296	Kostanjevica na Krasu
00050000-5632-22c3-9029-9a3024fd1710	8311	Kostanjevica na Krki
00050000-5632-22c3-df2d-7edfa339d377	1336	Kostel
00050000-5632-22c3-4509-e4a3e951a0ab	6256	Košana
00050000-5632-22c3-50d4-4422da97f35d	2394	Kotlje
00050000-5632-22c3-e36c-1b95fbeb8be2	6240	Kozina
00050000-5632-22c3-2d89-a8f3c948df1a	3260	Kozje
00050000-5632-22c3-6de4-bc7dac9ecfe7	4000	Kranj 
00050000-5632-22c3-9458-cc078beac582	4001	Kranj - poštni predali
00050000-5632-22c3-ccee-a6235f497594	4280	Kranjska Gora
00050000-5632-22c3-42a9-1bd52c2197cf	1281	Kresnice
00050000-5632-22c3-6e7b-c2c93551ed79	4294	Križe
00050000-5632-22c3-d579-96eda04db547	9206	Križevci
00050000-5632-22c3-e0b1-c3db85b378c1	9242	Križevci pri Ljutomeru
00050000-5632-22c3-68a0-3d3b363669fd	1301	Krka
00050000-5632-22c3-0d4e-89e8c4bb22a7	8296	Krmelj
00050000-5632-22c3-ac42-4d4e58f198fa	4245	Kropa
00050000-5632-22c3-2638-6ce675809380	8262	Krška vas
00050000-5632-22c3-020f-00d879b3aaf8	8270	Krško
00050000-5632-22c3-c405-903f6931ea15	9263	Kuzma
00050000-5632-22c3-140d-31d07a05664c	2318	Laporje
00050000-5632-22c3-8e0a-a6861b54c0d4	3270	Laško
00050000-5632-22c3-0244-1a5ef984a82a	1219	Laze v Tuhinju
00050000-5632-22c3-1005-b504c4ae1ce8	2230	Lenart v Slovenskih goricah
00050000-5632-22c3-3b2c-a1dc33cb3da0	9220	Lendava/Lendva
00050000-5632-22c3-c349-f326657e4479	4248	Lesce
00050000-5632-22c3-e345-e2315e634d8a	3261	Lesično
00050000-5632-22c3-4d41-dd299fdee690	8273	Leskovec pri Krškem
00050000-5632-22c3-db34-c9ccfe349f56	2372	Libeliče
00050000-5632-22c3-9940-1d3f4eea4b6b	2341	Limbuš
00050000-5632-22c3-597e-06a452e4cea2	1270	Litija
00050000-5632-22c3-f177-8cfd368fc66a	3202	Ljubečna
00050000-5632-22c3-bf0a-5e5023490270	1000	Ljubljana 
00050000-5632-22c3-fa9e-613c4b1a473f	1001	Ljubljana - poštni predali
00050000-5632-22c3-cf48-ab1bd89db8e2	1231	Ljubljana - Črnuče
00050000-5632-22c3-bd1b-9ab6c3d47b48	1261	Ljubljana - Dobrunje
00050000-5632-22c3-c5c2-92512da8a042	1260	Ljubljana - Polje
00050000-5632-22c3-6640-ae40943d7fd9	1210	Ljubljana - Šentvid
00050000-5632-22c3-67e0-b74f52bcf4bb	1211	Ljubljana - Šmartno
00050000-5632-22c3-add0-b200c9f2625c	3333	Ljubno ob Savinji
00050000-5632-22c3-aa96-73480897c04d	9240	Ljutomer
00050000-5632-22c3-b406-4ce24ba9c8cd	3215	Loče
00050000-5632-22c3-fef5-c7100a1e1390	5231	Log pod Mangartom
00050000-5632-22c3-3097-6ccf74fb358b	1358	Log pri Brezovici
00050000-5632-22c3-52a7-34d49fb1b541	1370	Logatec
00050000-5632-22c3-cdaa-ae53c9d6f361	1371	Logatec
00050000-5632-22c3-7f55-2f110416a076	1434	Loka pri Zidanem Mostu
00050000-5632-22c3-0fbc-837a46d83df7	3223	Loka pri Žusmu
00050000-5632-22c3-516c-a2332749d5b9	6219	Lokev
00050000-5632-22c3-7a8e-a1027adcbe90	1318	Loški Potok
00050000-5632-22c3-7edb-b22c7f214f08	2324	Lovrenc na Dravskem polju
00050000-5632-22c3-44eb-dc3af608e671	2344	Lovrenc na Pohorju
00050000-5632-22c3-b6f6-6ec3ab493220	3334	Luče
00050000-5632-22c3-33f7-56ef4bc8f480	1225	Lukovica
00050000-5632-22c3-b13b-2007228b2cdc	9202	Mačkovci
00050000-5632-22c3-3b45-5ff5baea274b	2322	Majšperk
00050000-5632-22c3-f4e7-d8f75cb90783	2321	Makole
00050000-5632-22c3-9008-f8cad8747b0a	9243	Mala Nedelja
00050000-5632-22c3-f563-f6576d8910fa	2229	Malečnik
00050000-5632-22c3-ffed-4c4ec5997549	6273	Marezige
00050000-5632-22c3-67dc-f3149fa5e17a	2000	Maribor 
00050000-5632-22c3-5955-f03224e415dd	2001	Maribor - poštni predali
00050000-5632-22c3-766a-fd59b94da2e7	2206	Marjeta na Dravskem polju
00050000-5632-22c3-70c0-c72886f9da43	2281	Markovci
00050000-5632-22c3-1ef6-1c1c0e249c62	9221	Martjanci
00050000-5632-22c3-5b3e-9ff595741fda	6242	Materija
00050000-5632-22c3-c05c-170e61cbca07	4211	Mavčiče
00050000-5632-22c3-a426-4bd4c27d076b	1215	Medvode
00050000-5632-22c3-c6dd-d225250a6af5	1234	Mengeš
00050000-5632-22c3-e089-6bdf562a0220	8330	Metlika
00050000-5632-22c3-a118-00ba0d7ffbd4	2392	Mežica
00050000-5632-22c3-de6e-bbc7753c896d	2204	Miklavž na Dravskem polju
00050000-5632-22c3-e644-ff82a1f50f6e	2275	Miklavž pri Ormožu
00050000-5632-22c3-3c03-7143d35b007b	5291	Miren
00050000-5632-22c3-7f10-6b128b6f0d29	8233	Mirna
00050000-5632-22c3-bf73-b5860d0b695d	8216	Mirna Peč
00050000-5632-22c3-2447-07abd7610fd6	2382	Mislinja
00050000-5632-22c3-9eec-018a28116136	4281	Mojstrana
00050000-5632-22c3-a877-afe0bfe751a2	8230	Mokronog
00050000-5632-22c3-ab0b-3ab49f58f091	1251	Moravče
00050000-5632-22c3-3baa-53924de458ca	9226	Moravske Toplice
00050000-5632-22c3-01de-8e28584a18c1	5216	Most na Soči
00050000-5632-22c3-0e8f-4b30723be2d9	1221	Motnik
00050000-5632-22c3-404c-252509510f6c	3330	Mozirje
00050000-5632-22c3-8052-c899d1f2243e	9000	Murska Sobota 
00050000-5632-22c3-5c77-0c3acae03434	9001	Murska Sobota - poštni predali
00050000-5632-22c3-6ae1-ac4052065ec5	2366	Muta
00050000-5632-22c3-ae0d-685b205bf5e3	4202	Naklo
00050000-5632-22c3-0552-d34542b29887	3331	Nazarje
00050000-5632-22c3-0068-4e64fdc0d249	1357	Notranje Gorice
00050000-5632-22c3-ca35-b4e2222f2e0d	3203	Nova Cerkev
00050000-5632-22c3-19c9-c87c4ff9f109	5000	Nova Gorica 
00050000-5632-22c3-2ccf-dd46d034d7c6	5001	Nova Gorica - poštni predali
00050000-5632-22c3-9239-df0f7ee22d10	1385	Nova vas
00050000-5632-22c3-2020-5a948cea07b2	8000	Novo mesto
00050000-5632-22c3-d62c-04fbe95286ab	8001	Novo mesto - poštni predali
00050000-5632-22c3-c4f9-bf56c778e77d	6243	Obrov
00050000-5632-22c3-0fbf-8390237ad8f8	9233	Odranci
00050000-5632-22c3-4bb4-34329fb02714	2317	Oplotnica
00050000-5632-22c3-d02f-403552f2e670	2312	Orehova vas
00050000-5632-22c3-b90d-df1d8fb35611	2270	Ormož
00050000-5632-22c3-c528-9378978a9aaf	1316	Ortnek
00050000-5632-22c3-f112-c56b093422ff	1337	Osilnica
00050000-5632-22c3-1a81-d23b3fc4ba09	8222	Otočec
00050000-5632-22c3-1aa7-681890472a8f	2361	Ožbalt
00050000-5632-22c3-7714-2107945a5b66	2231	Pernica
00050000-5632-22c3-9866-747a98529a1e	2211	Pesnica pri Mariboru
00050000-5632-22c3-a620-44f0b929f8ca	9203	Petrovci
00050000-5632-22c3-ef32-687df3883b56	3301	Petrovče
00050000-5632-22c3-ba22-42b8dc01a5d4	6330	Piran/Pirano
00050000-5632-22c3-93e8-359453d22fff	8255	Pišece
00050000-5632-22c3-833c-60c18c5d3a08	6257	Pivka
00050000-5632-22c3-f231-d2e9e03877ed	6232	Planina
00050000-5632-22c3-8a1f-13e86cf10960	3225	Planina pri Sevnici
00050000-5632-22c3-d696-fc5f30c8d58a	6276	Pobegi
00050000-5632-22c3-02a9-38d8c2f76d83	8312	Podbočje
00050000-5632-22c3-37d9-11e80cd4d8bb	5243	Podbrdo
00050000-5632-22c3-aa59-218ccbc25f57	3254	Podčetrtek
00050000-5632-22c3-f7d5-37a9fa8e7b4f	2273	Podgorci
00050000-5632-22c3-ccbd-7f5b450544b1	6216	Podgorje
00050000-5632-22c3-1d95-81e35a23fd5e	2381	Podgorje pri Slovenj Gradcu
00050000-5632-22c3-544a-9f956e486b37	6244	Podgrad
00050000-5632-22c3-c0ba-dabd61e9d481	1414	Podkum
00050000-5632-22c3-eb21-0e5dafd696d4	2286	Podlehnik
00050000-5632-22c3-ed25-43604010750c	5272	Podnanos
00050000-5632-22c3-e62e-e231411d14d2	4244	Podnart
00050000-5632-22c3-0ae8-2f2ae345f78b	3241	Podplat
00050000-5632-22c3-7e54-08750b605eee	3257	Podsreda
00050000-5632-22c3-700d-769122deccf7	2363	Podvelka
00050000-5632-22c3-4be0-e656423ba036	2208	Pohorje
00050000-5632-22c3-915e-cfe5dbd26a03	2257	Polenšak
00050000-5632-22c3-c6a7-152488c5f61f	1355	Polhov Gradec
00050000-5632-22c3-c159-70cb76ed591f	4223	Poljane nad Škofjo Loko
00050000-5632-22c3-f167-4b8b4cc5b13f	2319	Poljčane
00050000-5632-22c3-0b37-8ee408bc3199	1272	Polšnik
00050000-5632-22c3-d817-14024550eda8	3313	Polzela
00050000-5632-22c3-3779-74d4e9d3e255	3232	Ponikva
00050000-5632-22c3-6ce4-ec4e360d58c1	6320	Portorož/Portorose
00050000-5632-22c3-475d-3cf5dff9a06f	6230	Postojna
00050000-5632-22c3-f5ff-70d64f2b24a9	2331	Pragersko
00050000-5632-22c3-a1a8-37e49b2b7938	3312	Prebold
00050000-5632-22c3-acd3-2717cbb027b7	4205	Preddvor
00050000-5632-22c3-3667-5dc53669e6cb	6255	Prem
00050000-5632-22c3-6782-9110ae714133	1352	Preserje
00050000-5632-22c3-818b-5498fb4eed5b	6258	Prestranek
00050000-5632-22c3-9dd7-cc5567f6e17c	2391	Prevalje
00050000-5632-22c3-1583-541cace36e03	3262	Prevorje
00050000-5632-22c3-ba95-812d1aa9d545	1276	Primskovo 
00050000-5632-22c3-c41b-b8f2775cec95	3253	Pristava pri Mestinju
00050000-5632-22c3-4cc6-718dbdf66017	9207	Prosenjakovci/Partosfalva
00050000-5632-22c3-674a-ddf08053f108	5297	Prvačina
00050000-5632-22c3-8466-66d122f0f6ab	2250	Ptuj
00050000-5632-22c3-e5ca-f94af6f55e4b	2323	Ptujska Gora
00050000-5632-22c3-4e47-ca2a0516bd65	9201	Puconci
00050000-5632-22c3-fd3c-154fad2baddc	2327	Rače
00050000-5632-22c3-5bc8-b9eba2cafe32	1433	Radeče
00050000-5632-22c3-1b2f-9da5f68d1dc7	9252	Radenci
00050000-5632-22c3-7421-9538c45d2cca	2360	Radlje ob Dravi
00050000-5632-22c3-5987-a6830d61d543	1235	Radomlje
00050000-5632-22c3-f889-6ac74a1304a0	4240	Radovljica
00050000-5632-22c3-408a-e2dbc99880e2	8274	Raka
00050000-5632-22c3-c91c-217a8953803e	1381	Rakek
00050000-5632-22c3-230f-f90889346f5b	4283	Rateče - Planica
00050000-5632-22c3-6624-984cd707b984	2390	Ravne na Koroškem
00050000-5632-22c3-0455-e5ce051a65b9	9246	Razkrižje
00050000-5632-22c3-2499-f5163922c23d	3332	Rečica ob Savinji
00050000-5632-22c3-a7f3-84721aa63153	5292	Renče
00050000-5632-22c3-42bd-1fd16f82dfde	1310	Ribnica
00050000-5632-22c3-bd11-413bc14e75b3	2364	Ribnica na Pohorju
00050000-5632-22c3-cd1d-db6a29be181f	3272	Rimske Toplice
00050000-5632-22c3-f4e0-88d2cc59016a	1314	Rob
00050000-5632-22c3-9e00-bc4e82d3be1b	5215	Ročinj
00050000-5632-22c3-c8e1-b11cba8b9db5	3250	Rogaška Slatina
00050000-5632-22c3-7efd-9070aca93044	9262	Rogašovci
00050000-5632-22c3-c6d9-557623e52186	3252	Rogatec
00050000-5632-22c3-0a67-72ecad7d0e9f	1373	Rovte
00050000-5632-22c3-286c-87fab5899574	2342	Ruše
00050000-5632-22c3-7f56-ecb4cf6cb23b	1282	Sava
00050000-5632-22c3-4993-894a017f2b84	6333	Sečovlje/Sicciole
00050000-5632-22c3-1163-5830d8cd40c8	4227	Selca
00050000-5632-22c3-b550-5a2cf8d3d1f1	2352	Selnica ob Dravi
00050000-5632-22c3-fe8d-d17f8c604f28	8333	Semič
00050000-5632-22c3-5d76-fee6c613ce24	8281	Senovo
00050000-5632-22c3-65ef-a39cec0e5578	6224	Senožeče
00050000-5632-22c3-52fb-587b16ae4a69	8290	Sevnica
00050000-5632-22c3-8706-c89a35efda2b	6210	Sežana
00050000-5632-22c3-9168-0d0ec0639184	2214	Sladki Vrh
00050000-5632-22c3-45a1-150395ab6ac9	5283	Slap ob Idrijci
00050000-5632-22c3-f3df-9f1b9de828ad	2380	Slovenj Gradec
00050000-5632-22c3-9497-208993d08130	2310	Slovenska Bistrica
00050000-5632-22c3-711a-97ecd8e3dea1	3210	Slovenske Konjice
00050000-5632-22c3-8175-ce4e54901a89	1216	Smlednik
00050000-5632-22c3-b52f-904c712bea6c	5232	Soča
00050000-5632-22c3-7c21-7503860a2ca6	1317	Sodražica
00050000-5632-22c3-fded-131dd0e86e47	3335	Solčava
00050000-5632-22c3-f0f8-577f646625fa	5250	Solkan
00050000-5632-22c3-dc84-95e148115e8f	4229	Sorica
00050000-5632-22c3-54fb-041bf60b201d	4225	Sovodenj
00050000-5632-22c3-4411-75661e0496ee	5281	Spodnja Idrija
00050000-5632-22c3-6c99-dbd6548b2435	2241	Spodnji Duplek
00050000-5632-22c3-da5d-833dee522c56	9245	Spodnji Ivanjci
00050000-5632-22c3-5bfc-c8b9babaa374	2277	Središče ob Dravi
00050000-5632-22c3-f824-bda34c4ddd8f	4267	Srednja vas v Bohinju
00050000-5632-22c3-c253-57e5892a097a	8256	Sromlje 
00050000-5632-22c3-80e7-bee60fe83d8b	5224	Srpenica
00050000-5632-22c3-c95b-16125f2311a4	1242	Stahovica
00050000-5632-22c3-2f11-f1d6639d86f1	1332	Stara Cerkev
00050000-5632-22c3-cbe0-2c55ba7f8e73	8342	Stari trg ob Kolpi
00050000-5632-22c3-4e01-460e6e0f2406	1386	Stari trg pri Ložu
00050000-5632-22c3-6232-8e2543254796	2205	Starše
00050000-5632-22c3-6607-1542c74dedef	2289	Stoperce
00050000-5632-22c3-7fc7-b611461a83a3	8322	Stopiče
00050000-5632-22c3-0d0b-fa9a8e638164	3206	Stranice
00050000-5632-22c3-e9ca-8e99cef9c574	8351	Straža
00050000-5632-22c3-dd3d-626c62b3ca12	1313	Struge
00050000-5632-22c3-06ca-12326bec55ea	8293	Studenec
00050000-5632-22c3-d4ee-444a574e4c98	8331	Suhor
00050000-5632-22c3-c4a9-9ee10bf64c8e	2233	Sv. Ana v Slovenskih goricah
00050000-5632-22c3-5f7e-eee4acf3d777	2235	Sv. Trojica v Slovenskih goricah
00050000-5632-22c3-70d7-932f7c3a8679	2353	Sveti Duh na Ostrem Vrhu
00050000-5632-22c3-21a2-225ea6a8c9ba	9244	Sveti Jurij ob Ščavnici
00050000-5632-22c3-25a0-06a3f7cce49b	3264	Sveti Štefan
00050000-5632-22c3-e8fb-45b40a91e118	2258	Sveti Tomaž
00050000-5632-22c3-f2bb-1848573b03a4	9204	Šalovci
00050000-5632-22c3-b726-50fdd19e1c33	5261	Šempas
00050000-5632-22c3-dcf8-31e4a92a4fe3	5290	Šempeter pri Gorici
00050000-5632-22c3-6f3d-19f0869d34ce	3311	Šempeter v Savinjski dolini
00050000-5632-22c3-ce9d-04cfb1d77445	4208	Šenčur
00050000-5632-22c3-ada3-4ef5eb1f516a	2212	Šentilj v Slovenskih goricah
00050000-5632-22c3-9bf8-4501e85c8aa8	8297	Šentjanž
00050000-5632-22c3-fc79-641b52dced9a	2373	Šentjanž pri Dravogradu
00050000-5632-22c3-25b0-d0798dfcf621	8310	Šentjernej
00050000-5632-22c3-198c-7ef25a09ba80	3230	Šentjur
00050000-5632-22c3-a85d-6d3fb61ace66	3271	Šentrupert
00050000-5632-22c3-f2ae-dfaf72a37cf9	8232	Šentrupert
00050000-5632-22c3-39c4-382d7dbce7b1	1296	Šentvid pri Stični
00050000-5632-22c3-fa9a-f39a4ce0adaf	8275	Škocjan
00050000-5632-22c3-324e-3f3bcdbd3064	6281	Škofije
00050000-5632-22c3-d0fd-e8c2535c9ee9	4220	Škofja Loka
00050000-5632-22c3-4012-406cd79321b2	3211	Škofja vas
00050000-5632-22c3-2dcf-2d99642590ce	1291	Škofljica
00050000-5632-22c3-66e6-b55b651ac579	6274	Šmarje
00050000-5632-22c3-2195-2ce6fdf89588	1293	Šmarje - Sap
00050000-5632-22c3-7355-510b6aa613e1	3240	Šmarje pri Jelšah
00050000-5632-22c3-de87-b6ebaea5c4bb	8220	Šmarješke Toplice
00050000-5632-22c3-de3e-75b6b678120a	2315	Šmartno na Pohorju
00050000-5632-22c3-7efc-7db3e4b13e1e	3341	Šmartno ob Dreti
00050000-5632-22c3-e2f2-040be803e33d	3327	Šmartno ob Paki
00050000-5632-22c3-4628-a013850f72e7	1275	Šmartno pri Litiji
00050000-5632-22c3-8843-f3d7e3d6579e	2383	Šmartno pri Slovenj Gradcu
00050000-5632-22c3-96d6-5c2b60513b74	3201	Šmartno v Rožni dolini
00050000-5632-22c3-aeae-2d944fa66278	3325	Šoštanj
00050000-5632-22c3-00ec-175441b728c4	6222	Štanjel
00050000-5632-22c3-9cb2-f22d64229ca7	3220	Štore
00050000-5632-22c3-cb02-32df5056f8a8	3304	Tabor
00050000-5632-22c3-ed9a-d6fbc848ed5b	3221	Teharje
00050000-5632-22c3-650d-be885c05ba3f	9251	Tišina
00050000-5632-22c3-62c7-8c08d6c7d1ae	5220	Tolmin
00050000-5632-22c3-79ed-8ae9e26a63c7	3326	Topolšica
00050000-5632-22c3-c516-eb86939344d9	2371	Trbonje
00050000-5632-22c3-edd7-f1860a230ea8	1420	Trbovlje
00050000-5632-22c3-96ae-c2ae88b9a877	8231	Trebelno 
00050000-5632-22c3-4c13-3d51d7c429bc	8210	Trebnje
00050000-5632-22c3-d114-ec3e6b402e48	5252	Trnovo pri Gorici
00050000-5632-22c3-2b66-a54614cf752f	2254	Trnovska vas
00050000-5632-22c3-a72c-bb0e11f29549	1222	Trojane
00050000-5632-22c3-638b-458f829f86c2	1236	Trzin
00050000-5632-22c3-2162-cca2e5809349	4290	Tržič
00050000-5632-22c3-931b-b30f9426540a	8295	Tržišče
00050000-5632-22c3-e157-d307315eecd1	1311	Turjak
00050000-5632-22c3-01be-54c2fc709c7a	9224	Turnišče
00050000-5632-22c3-6bde-0729512ae20d	8323	Uršna sela
00050000-5632-22c3-41c7-f36afeea7cae	1252	Vače
00050000-5632-22c3-b0b6-0f8e2462276d	3320	Velenje 
00050000-5632-22c3-1740-9f085cebd38e	3322	Velenje - poštni predali
00050000-5632-22c3-0600-a34a0734cb09	8212	Velika Loka
00050000-5632-22c3-544b-33d5a5ebfc95	2274	Velika Nedelja
00050000-5632-22c3-4bea-f80edc315cb7	9225	Velika Polana
00050000-5632-22c3-794e-6c4710bd23c2	1315	Velike Lašče
00050000-5632-22c3-2aed-292ee86afb47	8213	Veliki Gaber
00050000-5632-22c3-58f5-ca4ddd71236f	9241	Veržej
00050000-5632-22c3-9edf-45cc1bb68351	1312	Videm - Dobrepolje
00050000-5632-22c3-5df4-71c954813bd3	2284	Videm pri Ptuju
00050000-5632-22c3-35bb-10c7379af471	8344	Vinica
00050000-5632-22c3-2e9f-36ba8d6356b4	5271	Vipava
00050000-5632-22c3-f268-76d4a8a7c93f	4212	Visoko
00050000-5632-22c3-274f-bf5817db9df5	1294	Višnja Gora
00050000-5632-22c3-c591-3ed8042c81a0	3205	Vitanje
00050000-5632-22c3-17d1-cfa3b9800fdb	2255	Vitomarci
00050000-5632-22c3-e9e6-9f79637bd7fd	1217	Vodice
00050000-5632-22c3-e196-0c909e144da6	3212	Vojnik\t
00050000-5632-22c3-bf3d-9c70ee4cbfdb	5293	Volčja Draga
00050000-5632-22c3-b858-a8dcb9657245	2232	Voličina
00050000-5632-22c3-a403-70ed166ced7b	3305	Vransko
00050000-5632-22c3-ac5d-1c00734156cd	6217	Vremski Britof
00050000-5632-22c3-8434-534d62ecc234	1360	Vrhnika
00050000-5632-22c3-6744-ca1fb3d26868	2365	Vuhred
00050000-5632-22c3-bb28-aa27dedca426	2367	Vuzenica
00050000-5632-22c3-4b2b-4bf2a72ad4c6	8292	Zabukovje 
00050000-5632-22c3-c9d7-04b28e35f938	1410	Zagorje ob Savi
00050000-5632-22c3-04f8-f8fe85cce55c	1303	Zagradec
00050000-5632-22c3-235a-769972199c92	2283	Zavrč
00050000-5632-22c3-16da-cc8914b2d965	8272	Zdole 
00050000-5632-22c3-b3dc-db121d9afffe	4201	Zgornja Besnica
00050000-5632-22c3-454f-28704b3f35fe	2242	Zgornja Korena
00050000-5632-22c3-4738-b1fd0d758a9c	2201	Zgornja Kungota
00050000-5632-22c3-247f-d6f347a15702	2316	Zgornja Ložnica
00050000-5632-22c3-35a8-5057fabfcbe9	2314	Zgornja Polskava
00050000-5632-22c3-6684-900a84dc9f53	2213	Zgornja Velka
00050000-5632-22c3-833c-834e53689054	4247	Zgornje Gorje
00050000-5632-22c3-fec1-4add64250156	4206	Zgornje Jezersko
00050000-5632-22c3-1fa5-d20ef931a86b	2285	Zgornji Leskovec
00050000-5632-22c3-e087-77375504a264	1432	Zidani Most
00050000-5632-22c3-c4d1-f279002beedc	3214	Zreče
00050000-5632-22c3-c35c-b996dbd3b1ba	4209	Žabnica
00050000-5632-22c3-769d-bf585ce568cf	3310	Žalec
00050000-5632-22c3-4baf-6621d8fe0608	4228	Železniki
00050000-5632-22c3-b7aa-d832d69b9466	2287	Žetale
00050000-5632-22c3-1237-83f59be70125	4226	Žiri
00050000-5632-22c3-6a90-9e163085190f	4274	Žirovnica
00050000-5632-22c3-efa6-6b0bd920eee9	8360	Žužemberk
\.


--
-- TOC entry 3133 (class 0 OID 24095161)
-- Dependencies: 239
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 24094753)
-- Dependencies: 212
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 24094507)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5632-22c6-2dec-18fddd47b197	00080000-5632-22c6-45b9-ab85ed72d11f	\N	00040000-5632-22c4-b4b2-5579fc194152	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5632-22c6-1ae2-a10d739e1ca4	00080000-5632-22c6-45b9-ab85ed72d11f	\N	00040000-5632-22c4-b4b2-5579fc194152	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5632-22c6-4b11-df10eb5d7a6b	00080000-5632-22c6-c3d7-b858357aa9a7	\N	00040000-5632-22c4-b4b2-5579fc194152	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3096 (class 0 OID 24094651)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5632-22c4-72e0-3e0c31ea9d2f	novo leto	1	1	\N	t
00430000-5632-22c4-87e0-7e59a8f2efc7	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5632-22c4-5c2a-1c618cfd2534	dan upora proti okupatorju	27	4	\N	t
00430000-5632-22c4-e36e-ebdb830fc81c	praznik dela	1	5	\N	t
00430000-5632-22c4-7986-0ac433db9409	praznik dela	2	5	\N	t
00430000-5632-22c4-5004-98fc5e6e69e5	dan Primoža Trubarja	8	6	\N	f
00430000-5632-22c4-68ba-9dac00b36cc2	dan državnosti	25	6	\N	t
00430000-5632-22c4-bb92-2d6273809434	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5632-22c4-4623-a1fe0501c7fd	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5632-22c4-b9eb-24ba6764c021	dan suverenosti	25	10	\N	f
00430000-5632-22c4-2273-dc10ebf6f52c	dan spomina na mrtve	1	11	\N	t
00430000-5632-22c4-85e3-44b47954d9cf	dan Rudolfa Maistra	23	11	\N	f
00430000-5632-22c4-21cb-24080fa80630	božič	25	12	\N	t
00430000-5632-22c4-948b-7826c73263f5	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5632-22c4-8cd5-f06efa5337e3	Marijino vnebovzetje	15	8	\N	t
00430000-5632-22c4-8c2b-64397da42006	dan reformacije	31	10	\N	t
00430000-5632-22c4-2897-0745064bd823	velikonočna nedelja	27	3	2016	t
00430000-5632-22c4-16b8-fae6a5097585	velikonočna nedelja	16	4	2017	t
00430000-5632-22c4-7edb-2ef8df80911d	velikonočna nedelja	1	4	2018	t
00430000-5632-22c4-0b3b-b660f8fb2119	velikonočna nedelja	21	4	2019	t
00430000-5632-22c4-0523-133806daef36	velikonočna nedelja	12	4	2020	t
00430000-5632-22c4-59d0-3b701753cd67	velikonočna nedelja	4	4	2021	t
00430000-5632-22c4-afc9-e492653ab94e	velikonočna nedelja	17	4	2022	t
00430000-5632-22c4-b8c5-2caea80ac88c	velikonočna nedelja	9	4	2023	t
00430000-5632-22c4-b234-f6428050746f	velikonočna nedelja	31	3	2024	t
00430000-5632-22c4-c7b6-7e7c6282c883	velikonočna nedelja	20	4	2025	t
00430000-5632-22c4-495b-791fa2fcc1df	velikonočna nedelja	5	4	2026	t
00430000-5632-22c4-10f5-ce9c1d806952	velikonočna nedelja	28	3	2027	t
00430000-5632-22c4-1bee-91c4793a8e1d	velikonočna nedelja	16	4	2028	t
00430000-5632-22c4-6ff1-3d48fd285ef7	velikonočna nedelja	1	4	2029	t
00430000-5632-22c4-235d-bf71b5e0843e	velikonočna nedelja	21	4	2030	t
00430000-5632-22c4-3aa4-be29fdcd215f	velikonočni ponedeljek	28	3	2016	t
00430000-5632-22c4-ad8d-87d160dc8d1f	velikonočni ponedeljek	17	4	2017	t
00430000-5632-22c4-e2dd-eeddf16649b6	velikonočni ponedeljek	2	4	2018	t
00430000-5632-22c4-73ba-169c4fd638a1	velikonočni ponedeljek	22	4	2019	t
00430000-5632-22c4-3b81-7c0f9f8458c2	velikonočni ponedeljek	13	4	2020	t
00430000-5632-22c4-209d-10f0737ba89b	velikonočni ponedeljek	5	4	2021	t
00430000-5632-22c4-74ea-41ae5e9410dc	velikonočni ponedeljek	18	4	2022	t
00430000-5632-22c4-6daa-8dabf74a511e	velikonočni ponedeljek	10	4	2023	t
00430000-5632-22c4-3e38-41f73051d284	velikonočni ponedeljek	1	4	2024	t
00430000-5632-22c4-bc93-4a2338e319eb	velikonočni ponedeljek	21	4	2025	t
00430000-5632-22c4-1233-e9095002f993	velikonočni ponedeljek	6	4	2026	t
00430000-5632-22c4-efdb-c570871e6d96	velikonočni ponedeljek	29	3	2027	t
00430000-5632-22c4-c561-1f4403843d46	velikonočni ponedeljek	17	4	2028	t
00430000-5632-22c4-9577-bcca3cb50483	velikonočni ponedeljek	2	4	2029	t
00430000-5632-22c4-ca42-daad9ebd2a87	velikonočni ponedeljek	22	4	2030	t
00430000-5632-22c4-9f93-b0964ea02242	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5632-22c4-d4bb-7d24980ddb78	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5632-22c4-c00b-8003055caa6b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5632-22c4-6195-16df369d3d46	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5632-22c4-a554-7947697327de	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5632-22c4-4886-792107f37a1c	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5632-22c4-41f9-3ceeea9823da	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5632-22c4-cee3-db5dfd94edc1	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5632-22c4-632a-48b4cb406c2f	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5632-22c4-2f70-688d0dec2803	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5632-22c4-a40d-3284ced0a719	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5632-22c4-d897-b7520cbbbc52	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5632-22c4-abed-8a28da089d96	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5632-22c4-9faa-f513c10b5f88	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5632-22c4-d8a1-1c001de310e4	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3092 (class 0 OID 24094611)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 24094623)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 24094765)
-- Dependencies: 214
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 24095175)
-- Dependencies: 240
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 24095185)
-- Dependencies: 241
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5632-22c6-3495-b24717b9c6d4	00080000-5632-22c6-5f19-e5a2d1d641d6	0987	AK
00190000-5632-22c6-519a-b3e63196f7b1	00080000-5632-22c6-c3d7-b858357aa9a7	0989	AK
00190000-5632-22c6-6811-ece524ed1eb1	00080000-5632-22c6-d076-cd3881d20e7a	0986	AK
00190000-5632-22c6-672c-6103de9446d1	00080000-5632-22c6-26a5-2878c45f519c	0984	AK
00190000-5632-22c6-2f2a-f393314eb2a7	00080000-5632-22c6-2b8e-b2d6354cc1fa	0983	AK
00190000-5632-22c6-02dd-9a164abbdc21	00080000-5632-22c6-5f8a-0694939e4ea9	0982	AK
00190000-5632-22c7-3140-f14103fe3956	00080000-5632-22c7-3f8c-773f67563833	1001	AK
\.


--
-- TOC entry 3132 (class 0 OID 24095100)
-- Dependencies: 238
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5632-22c6-2788-cfcaac0b6b2f	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3136 (class 0 OID 24095193)
-- Dependencies: 242
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 24094794)
-- Dependencies: 218
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5632-22c5-ab32-a5f7951f3c0a	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5632-22c5-1c54-2f0cc21c8454	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5632-22c5-b544-3a694c9b6bd4	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5632-22c5-39d5-fcfa410c5f0c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5632-22c5-3cbb-4f4e324ff8ac	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5632-22c5-b898-474e5287efd0	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5632-22c5-7bca-0f3bec5559a1	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3104 (class 0 OID 24094738)
-- Dependencies: 210
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 24094728)
-- Dependencies: 209
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 24094939)
-- Dependencies: 231
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 24094869)
-- Dependencies: 225
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 24094585)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 24094347)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5632-22c7-3f8c-773f67563833	00010000-5632-22c4-2b82-f5efa6f21ca4	2015-10-29 14:44:39	INS	a:0:{}
2	App\\Entity\\Option	00000000-5632-22c7-baca-cb2d29f113cd	00010000-5632-22c4-2b82-f5efa6f21ca4	2015-10-29 14:44:39	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5632-22c7-3140-f14103fe3956	00010000-5632-22c4-2b82-f5efa6f21ca4	2015-10-29 14:44:39	INS	a:0:{}
\.


--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3113 (class 0 OID 24094807)
-- Dependencies: 219
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 24094385)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5632-22c4-e7c3-3e014f2142f2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5632-22c4-e8a8-24fab1f15036	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5632-22c4-6e53-b4e6ce6794ce	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5632-22c4-e8f1-f51190c3dc27	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5632-22c4-dfcf-5ce8a5937b60	planer	Planer dogodkov v koledarju	t
00020000-5632-22c4-e4f4-f1bba79db1e1	kadrovska	Kadrovska služba	t
00020000-5632-22c4-4503-470b65bebb04	arhivar	Ažuriranje arhivalij	t
00020000-5632-22c4-1496-4cc12fb1ea1e	igralec	Igralec	t
00020000-5632-22c4-bada-fb6e1384e96f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5632-22c6-8df3-76c439d74fd5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3071 (class 0 OID 24094369)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5632-22c4-b999-27efd0aac4fe	00020000-5632-22c4-6e53-b4e6ce6794ce
00010000-5632-22c4-2b82-f5efa6f21ca4	00020000-5632-22c4-6e53-b4e6ce6794ce
00010000-5632-22c6-ba9c-df073e50f10e	00020000-5632-22c6-8df3-76c439d74fd5
\.


--
-- TOC entry 3115 (class 0 OID 24094821)
-- Dependencies: 221
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 24094759)
-- Dependencies: 213
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 24094705)
-- Dependencies: 207
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5632-22c5-8ff6-be0c8ff99009	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5632-22c5-2a46-3787844568fa	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5632-22c5-08ad-185843b9d244	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3067 (class 0 OID 24094334)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5632-22c3-de6b-e24f5ddff731	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5632-22c3-73db-3130dc702d0c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5632-22c3-77a0-993ef142c4bf	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5632-22c3-46ac-4b3c1e039e96	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5632-22c3-525d-889fbe8f3969	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3066 (class 0 OID 24094326)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5632-22c3-64ce-8dd2222d71a7	00230000-5632-22c3-46ac-4b3c1e039e96	popa
00240000-5632-22c3-5280-d0ff3ffcfd31	00230000-5632-22c3-46ac-4b3c1e039e96	oseba
00240000-5632-22c3-14df-34ec6350d08e	00230000-5632-22c3-46ac-4b3c1e039e96	tippopa
00240000-5632-22c3-89bf-f4cca8848df7	00230000-5632-22c3-46ac-4b3c1e039e96	organizacijskaenota
00240000-5632-22c3-ff0d-376d30663c4c	00230000-5632-22c3-46ac-4b3c1e039e96	sezona
00240000-5632-22c3-26ff-c71ceadb200e	00230000-5632-22c3-46ac-4b3c1e039e96	tipvaje
00240000-5632-22c3-a55c-09aee731a64d	00230000-5632-22c3-73db-3130dc702d0c	prostor
00240000-5632-22c3-8c9f-ad5c6173ce4b	00230000-5632-22c3-46ac-4b3c1e039e96	besedilo
00240000-5632-22c3-f0eb-e41669592cf3	00230000-5632-22c3-46ac-4b3c1e039e96	uprizoritev
00240000-5632-22c3-83ed-6b2295df5382	00230000-5632-22c3-46ac-4b3c1e039e96	funkcija
00240000-5632-22c3-2666-198a5f625ce7	00230000-5632-22c3-46ac-4b3c1e039e96	tipfunkcije
00240000-5632-22c3-c2ab-3d56541dc503	00230000-5632-22c3-46ac-4b3c1e039e96	alternacija
00240000-5632-22c3-de70-6eb426c6ec7f	00230000-5632-22c3-de6b-e24f5ddff731	pogodba
00240000-5632-22c3-5c32-69b713b67e7b	00230000-5632-22c3-46ac-4b3c1e039e96	zaposlitev
00240000-5632-22c3-0652-53798cc69a56	00230000-5632-22c3-46ac-4b3c1e039e96	zvrstuprizoritve
00240000-5632-22c3-1295-64a57ae481ba	00230000-5632-22c3-de6b-e24f5ddff731	programdela
00240000-5632-22c3-2b68-5508116d2873	00230000-5632-22c3-46ac-4b3c1e039e96	zapis
\.


--
-- TOC entry 3065 (class 0 OID 24094321)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7884619b-6699-4cfa-8ec2-907f3f7cd53a	00240000-5632-22c3-64ce-8dd2222d71a7	0	1001
\.


--
-- TOC entry 3121 (class 0 OID 24094886)
-- Dependencies: 227
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5632-22c6-6955-b8df3d7568fd	000e0000-5632-22c6-e6c7-9c1ebb876d17	00080000-5632-22c6-45b9-ab85ed72d11f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5632-22c4-d24f-384e629c45aa
00270000-5632-22c6-f8ab-be0eba78c4b8	000e0000-5632-22c6-e6c7-9c1ebb876d17	00080000-5632-22c6-45b9-ab85ed72d11f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5632-22c4-d24f-384e629c45aa
\.


--
-- TOC entry 3081 (class 0 OID 24094469)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 24094715)
-- Dependencies: 208
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5632-22c6-db6b-70f520bea752	00180000-5632-22c6-4df6-3c06e36d8d6f	000c0000-5632-22c6-1938-447918a21fda	00090000-5632-22c6-dc53-12188c2b0ccf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5632-22c6-1892-febb6c8cfe6d	00180000-5632-22c6-4df6-3c06e36d8d6f	000c0000-5632-22c6-8697-0ac2cf4b4df0	00090000-5632-22c6-0ccd-86bde4a09ec5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5632-22c6-5d00-0b924133ca3c	00180000-5632-22c6-4df6-3c06e36d8d6f	000c0000-5632-22c6-86a0-bbbcd3b7445a	00090000-5632-22c6-f2ab-51ea2de2f296	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5632-22c6-c082-2a1e15f35c0a	00180000-5632-22c6-4df6-3c06e36d8d6f	000c0000-5632-22c6-25cb-1f2a3c5aeda3	00090000-5632-22c6-32e6-04b4868c941d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5632-22c6-2ff9-23414abfa2d3	00180000-5632-22c6-4df6-3c06e36d8d6f	000c0000-5632-22c6-dec2-f5e0aa530ece	00090000-5632-22c6-fbd4-27a34353db4e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5632-22c6-b958-e56e8c55686d	00180000-5632-22c6-4821-bde859d53fad	\N	00090000-5632-22c6-fbd4-27a34353db4e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5632-22c6-b298-d4c439ee33f2	00180000-5632-22c6-4821-bde859d53fad	\N	00090000-5632-22c6-0ccd-86bde4a09ec5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3124 (class 0 OID 24094927)
-- Dependencies: 230
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5632-22c3-9562-f30ed9febdd9	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5632-22c3-2070-9bb1f88f06e5	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5632-22c3-12c5-fd9723ba0811	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5632-22c3-a80d-4ca3cf8e95df	04	Režija	Režija	Režija	umetnik	30
000f0000-5632-22c3-e025-f876dd184620	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5632-22c3-dd97-99bde091296f	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5632-22c3-5fe6-a91953b845c9	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5632-22c3-725e-db7036635867	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5632-22c3-c559-d431e93290ec	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5632-22c3-d10c-fa3f69cba522	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5632-22c3-f5d3-57c077101272	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5632-22c3-16e3-9b09df1ec389	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5632-22c3-7d45-97d8d87a7208	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5632-22c3-7ae7-bacd1975efd4	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5632-22c3-ea19-5eda4a01744a	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5632-22c3-9cda-ed1d60fba890	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5632-22c3-7103-a804e4f3c335	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5632-22c3-ef88-51f46db553fd	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3078 (class 0 OID 24094420)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5632-22c5-e9f3-64f310e38537	0001	šola	osnovna ali srednja šola
00400000-5632-22c5-14c5-8d3463bb6845	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5632-22c5-0fa7-e57e2b2fa044	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3137 (class 0 OID 24095204)
-- Dependencies: 243
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5632-22c3-e72d-10328c47e8bc	01	Velika predstava	f	1.00	1.00
002b0000-5632-22c3-cdfd-087236cfc7f3	02	Mala predstava	f	0.50	0.50
002b0000-5632-22c3-5e01-88120cd5eb5a	03	Mala koprodukcija	t	0.40	1.00
002b0000-5632-22c3-3b60-51ae376a60fe	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5632-22c3-817f-c55171827e47	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3100 (class 0 OID 24094695)
-- Dependencies: 206
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5632-22c3-af1a-00d0d495a00a	0001	prva vaja	prva vaja
00420000-5632-22c3-054f-73282e833c7e	0002	tehnična vaja	tehnična vaja
00420000-5632-22c3-7c6e-0bb0af689649	0003	lučna vaja	lučna vaja
00420000-5632-22c3-6525-a7adbe177a91	0004	kostumska vaja	kostumska vaja
00420000-5632-22c3-4e21-439bbbf634fc	0005	foto vaja	foto vaja
00420000-5632-22c3-59a8-2c1553cea9d2	0006	1. glavna vaja	1. glavna vaja
00420000-5632-22c3-3b2d-a3edf803ef6e	0007	2. glavna vaja	2. glavna vaja
00420000-5632-22c3-9589-f2583b56ec4f	0008	1. generalka	1. generalka
00420000-5632-22c3-e4d6-641a222c5475	0009	2. generalka	2. generalka
00420000-5632-22c3-3323-f7b5d9c261a1	0010	odprta generalka	odprta generalka
00420000-5632-22c3-857f-7f9926d65dd1	0011	obnovitvena vaja	obnovitvena vaja
00420000-5632-22c3-c81c-800bfcc0150c	0012	pevska vaja	pevska vaja
00420000-5632-22c3-6861-a0a526a6f6e8	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5632-22c3-8f8f-652ea6eacb3a	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3087 (class 0 OID 24094542)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 24094356)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5632-22c4-2b82-f5efa6f21ca4	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROOVwrtx4pwpCFJUx4DYyEcGlQ5bH4AtK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5632-22c6-972d-46e7a5fd46e6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5632-22c6-aa4b-0c84c351bf9a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5632-22c6-b2b5-b1f9ab969a4f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5632-22c6-54f6-d839fa9df77d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5632-22c6-97e3-9cb6799da4bc	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5632-22c6-8079-427b61236d6a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5632-22c6-ba17-989f4b71b515	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5632-22c6-2e4c-79efe759a8c3	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5632-22c6-6457-45af7e885d88	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5632-22c6-ba9c-df073e50f10e	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5632-22c4-b999-27efd0aac4fe	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3128 (class 0 OID 24094977)
-- Dependencies: 234
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5632-22c6-e12d-f0d3d7278816	00160000-5632-22c5-1b67-b80f6b77dfa0	\N	00140000-5632-22c3-2fb2-e47e5ae02583	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5632-22c5-3cbb-4f4e324ff8ac
000e0000-5632-22c6-e6c7-9c1ebb876d17	00160000-5632-22c5-57e1-6f1ee9eb9e5a	\N	00140000-5632-22c3-68d6-3b5b0dc591f0	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5632-22c5-b898-474e5287efd0
000e0000-5632-22c6-f41a-e356d55a31a3	\N	\N	00140000-5632-22c3-68d6-3b5b0dc591f0	00190000-5632-22c6-3495-b24717b9c6d4	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5632-22c5-3cbb-4f4e324ff8ac
000e0000-5632-22c6-4f46-d1e7d603b594	\N	\N	00140000-5632-22c3-68d6-3b5b0dc591f0	00190000-5632-22c6-3495-b24717b9c6d4	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5632-22c5-3cbb-4f4e324ff8ac
000e0000-5632-22c6-dede-87de7e1b590d	\N	\N	00140000-5632-22c3-68d6-3b5b0dc591f0	00190000-5632-22c6-3495-b24717b9c6d4	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5632-22c5-ab32-a5f7951f3c0a
000e0000-5632-22c6-4fc9-7694c1420596	\N	\N	00140000-5632-22c3-68d6-3b5b0dc591f0	00190000-5632-22c6-3495-b24717b9c6d4	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5632-22c5-ab32-a5f7951f3c0a
\.


--
-- TOC entry 3095 (class 0 OID 24094641)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5632-22c6-f99a-efa6b31ea008	\N	000e0000-5632-22c6-e6c7-9c1ebb876d17	1	
00200000-5632-22c6-13cb-308f93d0cb70	\N	000e0000-5632-22c6-e6c7-9c1ebb876d17	2	
00200000-5632-22c6-a871-3897fb9b06de	\N	000e0000-5632-22c6-e6c7-9c1ebb876d17	3	
00200000-5632-22c6-fb7a-cbaa830a875f	\N	000e0000-5632-22c6-e6c7-9c1ebb876d17	4	
00200000-5632-22c6-6c42-27671598158e	\N	000e0000-5632-22c6-e6c7-9c1ebb876d17	5	
\.


--
-- TOC entry 3111 (class 0 OID 24094786)
-- Dependencies: 217
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 24094900)
-- Dependencies: 228
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5632-22c4-efc4-37180a7e9551	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5632-22c4-a4af-206e2e9a0192	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5632-22c4-0758-0992718646bb	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5632-22c4-b631-e3e5cdbfdf0e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5632-22c4-415f-7c9baab604b9	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5632-22c4-cbe2-b75ea6123942	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5632-22c4-48c3-5b1bad84cbaf	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5632-22c4-4827-fa93eb9dee78	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5632-22c4-d24f-384e629c45aa	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5632-22c4-c768-973e34ce0108	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5632-22c4-abed-8e2fdcb26cb9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5632-22c4-7bfd-66208d4b3960	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5632-22c4-c2aa-d4c20b58ad41	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5632-22c4-c0b3-27948fb7dd7e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5632-22c4-d25f-67e57c63f630	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5632-22c4-3baa-d62bbeaf3e71	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5632-22c4-c633-a229ce904acc	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5632-22c4-02b0-43aad1e4e927	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5632-22c4-b9cc-27daad1dbcdf	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5632-22c4-f792-54a09c44169f	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5632-22c4-e7ed-149f400a252e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5632-22c4-1f90-ad4bb972bf8b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5632-22c4-53e6-cde70be6247d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5632-22c4-453a-3b0b827ca908	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5632-22c4-4bc5-9a622999b5d9	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5632-22c4-ba35-305fcab5d66d	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5632-22c4-0764-5136a8e30597	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5632-22c4-6f3d-6dc0f37363fa	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3140 (class 0 OID 24095251)
-- Dependencies: 246
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 24095223)
-- Dependencies: 245
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 24095263)
-- Dependencies: 247
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 24094858)
-- Dependencies: 224
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5632-22c6-a463-12c959147366	00090000-5632-22c6-0ccd-86bde4a09ec5	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5632-22c6-81aa-6602c91ba944	00090000-5632-22c6-f2ab-51ea2de2f296	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5632-22c6-f888-2aa711afc792	00090000-5632-22c6-b582-84c5d32dd1af	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5632-22c6-6a0b-ea83dd0ed8f2	00090000-5632-22c6-257c-9481f2496fef	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5632-22c6-904b-dabda85d1e4b	00090000-5632-22c6-42b8-73dcb93b9746	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5632-22c6-fad9-9b57cd82228a	00090000-5632-22c6-5b07-dde5987b813e	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3098 (class 0 OID 24094684)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 24094967)
-- Dependencies: 233
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5632-22c3-2fb2-e47e5ae02583	01	Drama	drama (SURS 01)
00140000-5632-22c3-2503-b992e9d1a341	02	Opera	opera (SURS 02)
00140000-5632-22c3-0367-4cc97ae9b61b	03	Balet	balet (SURS 03)
00140000-5632-22c3-fc33-cc5e79ffae45	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5632-22c3-27b1-a52f24b9c0dd	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5632-22c3-68d6-3b5b0dc591f0	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5632-22c3-f906-2aea0b39974d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3117 (class 0 OID 24094848)
-- Dependencies: 223
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2564 (class 2606 OID 24094419)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 24095026)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 24095016)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 24094410)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 24094883)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 24094925)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 24095303)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 24094673)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 24094694)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 24095221)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 24094568)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 24095094)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 24094844)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 24094639)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 24094606)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 24094582)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 24094751)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 24095280)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 24095287)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2842 (class 2606 OID 24095311)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 23562337)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2699 (class 2606 OID 24094778)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 24094540)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 24094438)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 24094502)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 24094465)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 24094399)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2553 (class 2606 OID 24094384)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 24094784)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 24094820)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 24094962)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 24094493)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 24094528)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 24095173)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 24094757)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 24094518)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 24094658)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 24094627)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2631 (class 2606 OID 24094619)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 24094769)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 24095182)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 24095190)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 24095160)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 24095202)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 24094802)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 24094742)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 24094733)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 24094949)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 24094876)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 24094594)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 24094355)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 24094811)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 24094373)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2555 (class 2606 OID 24094393)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 24094829)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 24094764)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 24094713)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 24094343)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 24094331)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 24094325)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 24094896)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 24094474)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 24094724)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 24094936)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 24094427)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 24095214)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 24094702)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 24094553)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 24094368)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 24094995)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 24094648)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 24094792)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 24094908)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 24095261)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 24095245)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 24095269)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 24094866)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 24094688)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 24094975)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 24094856)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 1259 OID 24094682)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2648 (class 1259 OID 24094683)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2649 (class 1259 OID 24094681)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2650 (class 1259 OID 24094680)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2651 (class 1259 OID 24094679)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2742 (class 1259 OID 24094897)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2743 (class 1259 OID 24094898)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2744 (class 1259 OID 24094899)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2828 (class 1259 OID 24095282)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2829 (class 1259 OID 24095281)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2582 (class 1259 OID 24094495)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2583 (class 1259 OID 24094496)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2700 (class 1259 OID 24094785)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2815 (class 1259 OID 24095249)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2816 (class 1259 OID 24095248)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2817 (class 1259 OID 24095250)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2818 (class 1259 OID 24095247)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2819 (class 1259 OID 24095246)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2694 (class 1259 OID 24094771)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2695 (class 1259 OID 24094770)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2639 (class 1259 OID 24094649)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2640 (class 1259 OID 24094650)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2724 (class 1259 OID 24094845)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2725 (class 1259 OID 24094847)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2726 (class 1259 OID 24094846)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 24094584)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 24094583)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2806 (class 1259 OID 24095203)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2758 (class 1259 OID 24094964)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2759 (class 1259 OID 24094965)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2760 (class 1259 OID 24094966)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2825 (class 1259 OID 24095270)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2767 (class 1259 OID 24095000)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2768 (class 1259 OID 24094997)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2769 (class 1259 OID 24095001)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2770 (class 1259 OID 24094999)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2771 (class 1259 OID 24094998)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2604 (class 1259 OID 24094555)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 24094554)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2573 (class 1259 OID 24094468)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2712 (class 1259 OID 24094812)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2557 (class 1259 OID 24094400)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2558 (class 1259 OID 24094401)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2717 (class 1259 OID 24094832)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2718 (class 1259 OID 24094831)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2719 (class 1259 OID 24094830)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2587 (class 1259 OID 24094505)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2588 (class 1259 OID 24094504)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2589 (class 1259 OID 24094506)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2627 (class 1259 OID 24094622)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2628 (class 1259 OID 24094620)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 24094621)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2537 (class 1259 OID 24094333)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2674 (class 1259 OID 24094737)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2675 (class 1259 OID 24094735)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2676 (class 1259 OID 24094734)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2677 (class 1259 OID 24094736)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2548 (class 1259 OID 24094374)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2549 (class 1259 OID 24094375)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2703 (class 1259 OID 24094793)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2838 (class 1259 OID 24095304)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2740 (class 1259 OID 24094885)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2741 (class 1259 OID 24094884)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2839 (class 1259 OID 24095312)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 24095313)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2689 (class 1259 OID 24094758)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2734 (class 1259 OID 24094877)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2735 (class 1259 OID 24094878)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2788 (class 1259 OID 24095099)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2789 (class 1259 OID 24095098)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2790 (class 1259 OID 24095095)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 24095096)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2792 (class 1259 OID 24095097)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2593 (class 1259 OID 24094520)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 24094519)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2595 (class 1259 OID 24094521)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2706 (class 1259 OID 24094806)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 24094805)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2798 (class 1259 OID 24095183)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2799 (class 1259 OID 24095184)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2781 (class 1259 OID 24095030)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 24095031)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2783 (class 1259 OID 24095028)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2784 (class 1259 OID 24095029)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2730 (class 1259 OID 24094867)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 24094868)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2680 (class 1259 OID 24094746)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2681 (class 1259 OID 24094745)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2682 (class 1259 OID 24094743)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2683 (class 1259 OID 24094744)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2777 (class 1259 OID 24095018)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 24095017)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2618 (class 1259 OID 24094595)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2621 (class 1259 OID 24094609)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2622 (class 1259 OID 24094608)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2623 (class 1259 OID 24094607)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2624 (class 1259 OID 24094610)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2638 (class 1259 OID 24094640)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2632 (class 1259 OID 24094628)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2633 (class 1259 OID 24094629)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2795 (class 1259 OID 24095174)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2814 (class 1259 OID 24095222)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2832 (class 1259 OID 24095288)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2833 (class 1259 OID 24095289)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2569 (class 1259 OID 24094440)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2570 (class 1259 OID 24094439)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2578 (class 1259 OID 24094475)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2579 (class 1259 OID 24094476)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2657 (class 1259 OID 24094689)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 24094727)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2670 (class 1259 OID 24094726)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 24094725)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2652 (class 1259 OID 24094675)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2653 (class 1259 OID 24094676)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2654 (class 1259 OID 24094674)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2655 (class 1259 OID 24094678)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2656 (class 1259 OID 24094677)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2586 (class 1259 OID 24094494)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 24094428)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2568 (class 1259 OID 24094429)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2610 (class 1259 OID 24094569)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 24094571)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2612 (class 1259 OID 24094570)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2613 (class 1259 OID 24094572)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2688 (class 1259 OID 24094752)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2763 (class 1259 OID 24094963)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2772 (class 1259 OID 24094996)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2754 (class 1259 OID 24094937)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2755 (class 1259 OID 24094938)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2576 (class 1259 OID 24094466)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 24094467)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2727 (class 1259 OID 24094857)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 24094344)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 24094541)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2592 (class 1259 OID 24094503)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2540 (class 1259 OID 24094332)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2811 (class 1259 OID 24095215)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2710 (class 1259 OID 24094804)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2711 (class 1259 OID 24094803)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 24094703)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 24094704)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2785 (class 1259 OID 24095027)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 24094529)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2764 (class 1259 OID 24094976)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 24095262)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2804 (class 1259 OID 24095191)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2805 (class 1259 OID 24095192)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2751 (class 1259 OID 24094926)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2668 (class 1259 OID 24094714)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 24094394)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2881 (class 2606 OID 24095484)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2880 (class 2606 OID 24095489)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2876 (class 2606 OID 24095509)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2882 (class 2606 OID 24095479)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2878 (class 2606 OID 24095499)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2877 (class 2606 OID 24095504)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2879 (class 2606 OID 24095494)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2918 (class 2606 OID 24095679)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2917 (class 2606 OID 24095684)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2916 (class 2606 OID 24095689)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 24095854)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2951 (class 2606 OID 24095849)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2855 (class 2606 OID 24095369)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2854 (class 2606 OID 24095374)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 24095594)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2945 (class 2606 OID 24095834)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2946 (class 2606 OID 24095829)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2944 (class 2606 OID 24095839)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2947 (class 2606 OID 24095824)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2948 (class 2606 OID 24095819)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2897 (class 2606 OID 24095589)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2898 (class 2606 OID 24095584)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2875 (class 2606 OID 24095469)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2874 (class 2606 OID 24095474)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 24095634)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2907 (class 2606 OID 24095644)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2908 (class 2606 OID 24095639)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2864 (class 2606 OID 24095424)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2865 (class 2606 OID 24095419)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2895 (class 2606 OID 24095574)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2942 (class 2606 OID 24095809)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2921 (class 2606 OID 24095694)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 24095699)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 24095704)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2949 (class 2606 OID 24095844)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2923 (class 2606 OID 24095724)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2926 (class 2606 OID 24095709)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2922 (class 2606 OID 24095729)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2924 (class 2606 OID 24095719)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2925 (class 2606 OID 24095714)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2862 (class 2606 OID 24095414)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2863 (class 2606 OID 24095409)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2850 (class 2606 OID 24095354)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2851 (class 2606 OID 24095349)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2903 (class 2606 OID 24095614)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 24095329)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2846 (class 2606 OID 24095334)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2904 (class 2606 OID 24095629)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2905 (class 2606 OID 24095624)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2906 (class 2606 OID 24095619)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2857 (class 2606 OID 24095384)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2858 (class 2606 OID 24095379)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2856 (class 2606 OID 24095389)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2868 (class 2606 OID 24095449)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2870 (class 2606 OID 24095439)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2869 (class 2606 OID 24095444)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2843 (class 2606 OID 24095314)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2887 (class 2606 OID 24095549)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2889 (class 2606 OID 24095539)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2890 (class 2606 OID 24095534)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2888 (class 2606 OID 24095544)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2845 (class 2606 OID 24095319)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 24095324)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2900 (class 2606 OID 24095599)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2954 (class 2606 OID 24095869)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 24095674)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 24095669)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2956 (class 2606 OID 24095874)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2955 (class 2606 OID 24095879)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2896 (class 2606 OID 24095579)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2913 (class 2606 OID 24095659)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2912 (class 2606 OID 24095664)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 24095784)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2934 (class 2606 OID 24095779)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 24095764)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2936 (class 2606 OID 24095769)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2935 (class 2606 OID 24095774)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2860 (class 2606 OID 24095399)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2861 (class 2606 OID 24095394)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2859 (class 2606 OID 24095404)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 24095609)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2902 (class 2606 OID 24095604)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2940 (class 2606 OID 24095794)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2939 (class 2606 OID 24095799)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2930 (class 2606 OID 24095754)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 24095759)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2932 (class 2606 OID 24095744)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2931 (class 2606 OID 24095749)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2911 (class 2606 OID 24095649)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 24095654)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2891 (class 2606 OID 24095569)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2892 (class 2606 OID 24095564)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2894 (class 2606 OID 24095554)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2893 (class 2606 OID 24095559)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2927 (class 2606 OID 24095739)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2928 (class 2606 OID 24095734)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2866 (class 2606 OID 24095429)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2867 (class 2606 OID 24095434)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 24095464)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2872 (class 2606 OID 24095454)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 24095459)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2938 (class 2606 OID 24095789)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2941 (class 2606 OID 24095804)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2943 (class 2606 OID 24095814)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2953 (class 2606 OID 24095859)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2952 (class 2606 OID 24095864)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2848 (class 2606 OID 24095344)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2849 (class 2606 OID 24095339)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2853 (class 2606 OID 24095359)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2852 (class 2606 OID 24095364)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2883 (class 2606 OID 24095514)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 24095529)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2885 (class 2606 OID 24095524)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2886 (class 2606 OID 24095519)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-29 14:44:41 CET

--
-- PostgreSQL database dump complete
--

