--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-16 16:05:06 CET

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
-- TOC entry 183 (class 1259 OID 32466002)
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
-- TOC entry 237 (class 1259 OID 32466617)
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
-- TOC entry 236 (class 1259 OID 32466600)
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
-- TOC entry 182 (class 1259 OID 32465995)
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
-- TOC entry 181 (class 1259 OID 32465993)
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
-- TOC entry 227 (class 1259 OID 32466477)
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
-- TOC entry 230 (class 1259 OID 32466507)
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
-- TOC entry 251 (class 1259 OID 32466920)
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
-- TOC entry 203 (class 1259 OID 32466250)
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
-- TOC entry 205 (class 1259 OID 32466282)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32466287)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32466842)
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
-- TOC entry 194 (class 1259 OID 32466147)
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
-- TOC entry 238 (class 1259 OID 32466630)
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
-- TOC entry 223 (class 1259 OID 32466430)
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
-- TOC entry 200 (class 1259 OID 32466221)
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
-- TOC entry 197 (class 1259 OID 32466187)
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
-- TOC entry 195 (class 1259 OID 32466164)
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
-- TOC entry 212 (class 1259 OID 32466344)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32466900)
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
-- TOC entry 250 (class 1259 OID 32466913)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32466935)
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
-- TOC entry 170 (class 1259 OID 32153619)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32466369)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32466121)
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
-- TOC entry 185 (class 1259 OID 32466021)
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
-- TOC entry 189 (class 1259 OID 32466088)
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
-- TOC entry 186 (class 1259 OID 32466032)
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
-- TOC entry 178 (class 1259 OID 32465967)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32465986)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32466376)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32466410)
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
-- TOC entry 233 (class 1259 OID 32466548)
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
-- TOC entry 188 (class 1259 OID 32466068)
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
-- TOC entry 191 (class 1259 OID 32466113)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32466786)
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
-- TOC entry 213 (class 1259 OID 32466350)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32466098)
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
-- TOC entry 202 (class 1259 OID 32466242)
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
-- TOC entry 198 (class 1259 OID 32466202)
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
-- TOC entry 199 (class 1259 OID 32466214)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32466362)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32466800)
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
-- TOC entry 242 (class 1259 OID 32466810)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32466699)
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
-- TOC entry 243 (class 1259 OID 32466818)
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
-- TOC entry 219 (class 1259 OID 32466391)
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
-- TOC entry 211 (class 1259 OID 32466335)
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
-- TOC entry 210 (class 1259 OID 32466325)
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
-- TOC entry 232 (class 1259 OID 32466537)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32466467)
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
-- TOC entry 196 (class 1259 OID 32466176)
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
-- TOC entry 175 (class 1259 OID 32465938)
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
-- TOC entry 174 (class 1259 OID 32465936)
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
-- TOC entry 220 (class 1259 OID 32466404)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32465976)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32465960)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32466418)
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
-- TOC entry 214 (class 1259 OID 32466356)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32466302)
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
-- TOC entry 173 (class 1259 OID 32465925)
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
-- TOC entry 172 (class 1259 OID 32465917)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32465912)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32466484)
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
-- TOC entry 187 (class 1259 OID 32466060)
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
-- TOC entry 209 (class 1259 OID 32466312)
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
-- TOC entry 231 (class 1259 OID 32466525)
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
-- TOC entry 184 (class 1259 OID 32466011)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32466830)
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
-- TOC entry 207 (class 1259 OID 32466292)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32466133)
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
-- TOC entry 176 (class 1259 OID 32465947)
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
-- TOC entry 235 (class 1259 OID 32466575)
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
-- TOC entry 201 (class 1259 OID 32466232)
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
-- TOC entry 218 (class 1259 OID 32466383)
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
-- TOC entry 229 (class 1259 OID 32466498)
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
-- TOC entry 247 (class 1259 OID 32466880)
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
-- TOC entry 246 (class 1259 OID 32466849)
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
-- TOC entry 248 (class 1259 OID 32466892)
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
-- TOC entry 225 (class 1259 OID 32466456)
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
-- TOC entry 204 (class 1259 OID 32466276)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32466565)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32466446)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32465998)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32465941)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32466002)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5671-7d9e-1ca7-5a63995d87a4	10	30	Otroci	Abonma za otroke	200
000a0000-5671-7d9e-8f48-75754481bd93	20	60	Mladina	Abonma za mladino	400
000a0000-5671-7d9e-cb06-0b3569d9f990	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32466617)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5671-7d9f-b1ea-a0d22769a6a9	000d0000-5671-7d9e-b0e3-2ba00f56111f	\N	00090000-5671-7d9e-d94e-a52de9caa77a	000b0000-5671-7d9e-7153-24fab300779e	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5671-7d9f-7042-5faeeb07f932	000d0000-5671-7d9e-1818-0a84e05765bf	00100000-5671-7d9e-4bd2-0440b8e75fff	00090000-5671-7d9e-5783-636deba21687	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5671-7d9f-02bb-06e5933794bf	000d0000-5671-7d9e-194c-6ded354b52c2	00100000-5671-7d9e-6ea9-204cf3054c88	00090000-5671-7d9e-af3f-cb24fe1f68d0	\N	0003	t	\N	2015-12-16	\N	2	t	\N	f	f
000c0000-5671-7d9f-e373-2b5d180261f9	000d0000-5671-7d9e-b912-84a2679d4eb0	\N	00090000-5671-7d9e-8a48-98d66675b7c8	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5671-7d9f-9ae6-3cfcb876b8db	000d0000-5671-7d9e-cc26-6bbe276cc601	\N	00090000-5671-7d9e-8619-ed907e01a825	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5671-7d9f-5d85-e4ef413cff0a	000d0000-5671-7d9e-bf6b-58897abaefb7	\N	00090000-5671-7d9e-fbb8-2e256976dd06	000b0000-5671-7d9e-a8f3-239c57db7726	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5671-7d9f-1c3f-cfb758682bd1	000d0000-5671-7d9e-721f-7711ea2fd691	00100000-5671-7d9e-2bbc-83fd95e17f38	00090000-5671-7d9e-146b-4350ad5fceb9	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5671-7d9f-2d35-cf39e15e548f	000d0000-5671-7d9e-979e-41bdb18701c9	\N	00090000-5671-7d9e-271a-cd9374399bc8	000b0000-5671-7d9e-0c93-144c14788099	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5671-7d9f-eb47-fa3a91683e54	000d0000-5671-7d9e-721f-7711ea2fd691	00100000-5671-7d9e-39d8-fe69618e1b3e	00090000-5671-7d9e-7531-f6244842b02b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5671-7d9f-86c7-24e1b4c16018	000d0000-5671-7d9e-721f-7711ea2fd691	00100000-5671-7d9e-b812-0c261e143d04	00090000-5671-7d9e-a964-a742f8249cb4	\N	0010	t	\N	2015-12-16	\N	16	f	\N	f	t
000c0000-5671-7d9f-c0f7-f1cbd1191e08	000d0000-5671-7d9e-721f-7711ea2fd691	00100000-5671-7d9e-8829-2402a50e485d	00090000-5671-7d9e-69af-f6ac24a20b23	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5671-7d9f-a84d-d3634f53b401	000d0000-5671-7d9e-9bb8-71f921e34bac	00100000-5671-7d9e-4bd2-0440b8e75fff	00090000-5671-7d9e-5783-636deba21687	000b0000-5671-7d9e-c947-382fbfef6b8c	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32466600)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32465995)
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
-- TOC entry 3162 (class 0 OID 32466477)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5671-7d9e-64f4-b211c8151776	00160000-5671-7d9d-a731-435804f6387f	00090000-5671-7d9e-2d82-aec9f12967dc	aizv	10	t
003d0000-5671-7d9e-da80-e93b678cb80b	00160000-5671-7d9d-a731-435804f6387f	00090000-5671-7d9e-d54d-d3a65e32872a	apri	14	t
003d0000-5671-7d9e-4ec5-f5b425b5e4aa	00160000-5671-7d9d-57fb-eded50b6f83f	00090000-5671-7d9e-7cee-1e2af320cb0c	aizv	11	t
003d0000-5671-7d9e-4051-8b119551b56f	00160000-5671-7d9d-e2bb-eeb483af18e8	00090000-5671-7d9e-00de-5561932d7c03	aizv	12	t
003d0000-5671-7d9e-8bec-e94ac3a6438c	00160000-5671-7d9d-a731-435804f6387f	00090000-5671-7d9e-ac5f-edddba10b50a	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32466507)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5671-7d9d-a731-435804f6387f	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5671-7d9d-57fb-eded50b6f83f	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5671-7d9d-e2bb-eeb483af18e8	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32466920)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32466250)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5671-7d9f-c5ae-a123f1586b76	\N	\N	00200000-5671-7d9f-9327-65d3dd0edf52	\N	\N	\N	00220000-5671-7d9d-7f8a-e07b834a6592	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5671-7d9f-2cca-b10b57a3ee19	\N	\N	00200000-5671-7d9f-73ec-3eca5d210a7c	\N	\N	\N	00220000-5671-7d9d-7f8a-e07b834a6592	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5671-7d9f-f055-df5b1f396019	\N	\N	00200000-5671-7d9f-49e9-2be383401b8f	\N	\N	\N	00220000-5671-7d9d-271a-50679c80d093	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5671-7d9f-8784-492800ec4535	\N	\N	00200000-5671-7d9f-dcb9-7c227fa864a3	\N	\N	\N	00220000-5671-7d9d-1bad-50d1d0107415	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5671-7d9f-0748-1d76f670ffba	\N	\N	00200000-5671-7d9f-b630-d0d809f59ea3	\N	\N	\N	00220000-5671-7d9d-d6b3-c6ace11a8c86	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32466282)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32466287)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32466842)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32466147)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5671-7d9a-4721-336dcbbf943a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5671-7d9a-bd14-3e8160cbd3d4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5671-7d9a-4116-68b72b92315b	AL	ALB	008	Albania 	Albanija	\N
00040000-5671-7d9a-bc8b-84bffc90ad87	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5671-7d9a-8b07-4df39f80bc8f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5671-7d9a-5ac6-19f0b29a518b	AD	AND	020	Andorra 	Andora	\N
00040000-5671-7d9a-a8e3-bced53e71db8	AO	AGO	024	Angola 	Angola	\N
00040000-5671-7d9a-b395-3cd654f1afb1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5671-7d9a-72fc-adb9656ba6d8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5671-7d9a-03af-2faec48d8594	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5671-7d9a-bc8e-fe38fb9c4635	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5671-7d9a-4d5d-8c17e2d52dfc	AM	ARM	051	Armenia 	Armenija	\N
00040000-5671-7d9a-ea98-31134af57fed	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5671-7d9a-1c19-dd4ee5cdc4cd	AU	AUS	036	Australia 	Avstralija	\N
00040000-5671-7d9a-d7d1-5caab030aeb7	AT	AUT	040	Austria 	Avstrija	\N
00040000-5671-7d9a-64d7-57713aa2817d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5671-7d9a-aece-9fcdad4dc4c5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5671-7d9a-5b6e-8cf5d3bc33aa	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5671-7d9a-5d18-49585e661830	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5671-7d9a-9c01-b237ab8ba084	BB	BRB	052	Barbados 	Barbados	\N
00040000-5671-7d9a-419b-8104938befac	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5671-7d9a-ae0e-6146fa0d0357	BE	BEL	056	Belgium 	Belgija	\N
00040000-5671-7d9a-eb36-ef99f2fd6c9f	BZ	BLZ	084	Belize 	Belize	\N
00040000-5671-7d9a-4c70-2c0929c5b276	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5671-7d9a-73cb-2dd3b36408c4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5671-7d9a-42c8-3cca8659e84c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5671-7d9a-d841-254283963aa8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5671-7d9a-1530-a4c4e3b09c65	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5671-7d9a-b6e4-a5d1259d70e8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5671-7d9a-6045-9be740092fbb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5671-7d9a-27a5-5940eae6a4ed	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5671-7d9a-ad3a-60aef8e2d6aa	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5671-7d9a-7776-13a337a859e0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5671-7d9a-7500-05119fbe65c6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5671-7d9a-0231-46e325a289bf	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5671-7d9a-a32b-8712ba30fdd6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5671-7d9a-5d45-0b4891f9a5aa	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5671-7d9a-e823-b5d988954b8a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5671-7d9a-ae96-10a6c0a12ca1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5671-7d9a-cda0-b0dd3cbf3f37	CA	CAN	124	Canada 	Kanada	\N
00040000-5671-7d9a-b7e6-5565d38cb640	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5671-7d9a-3a61-032693cc0541	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5671-7d9a-5b68-c7404da84871	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5671-7d9a-63e0-1502148e3090	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5671-7d9a-ddab-73cc6269caaf	CL	CHL	152	Chile 	Čile	\N
00040000-5671-7d9a-3572-6577be0c7ff0	CN	CHN	156	China 	Kitajska	\N
00040000-5671-7d9a-74f1-ad95cf5e505a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5671-7d9a-b0a0-1777012c6b1a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5671-7d9a-1811-61b39868d49a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5671-7d9a-d776-ea0fe1db56e2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5671-7d9a-dd64-b1ca1c33bae3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5671-7d9a-6a5e-5a24cce1033d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5671-7d9a-2df7-6ca3e3ac86ac	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5671-7d9a-8105-22d12bee5415	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5671-7d9a-67f4-a3ffe5c4d89f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5671-7d9a-ec09-2b08e5b0087f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5671-7d9a-daab-f83a3112a32e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5671-7d9a-ca19-239cef3e9c1f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5671-7d9a-a2f3-4c6e78258814	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5671-7d9a-093b-73dd755d4cd6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5671-7d9a-9ec8-6d5c3990daa9	DK	DNK	208	Denmark 	Danska	\N
00040000-5671-7d9a-6130-5847f5ce0e14	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5671-7d9a-6ec3-b242e7a1245e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5671-7d9a-4710-5db512de5e5c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5671-7d9a-ade5-cd04232b9a03	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5671-7d9a-3ad9-44c38c404294	EG	EGY	818	Egypt 	Egipt	\N
00040000-5671-7d9a-ff62-9083637ac4cf	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5671-7d9a-e078-c584e966642c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5671-7d9a-1ad7-30ba86577fcb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5671-7d9a-70af-f50f4bbfd1cd	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5671-7d9a-eee1-a3632e7b1bf4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5671-7d9a-7a41-a1e7cb0ee085	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5671-7d9a-7ff4-35511b11a122	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5671-7d9a-7121-8e1908d3af8e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5671-7d9a-1097-a25f8245615f	FI	FIN	246	Finland 	Finska	\N
00040000-5671-7d9a-4619-3cf142f93479	FR	FRA	250	France 	Francija	\N
00040000-5671-7d9a-b422-db20ffbc8c49	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5671-7d9a-8339-6a5d6f0ace71	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5671-7d9a-55ae-4dae299c958a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5671-7d9a-4461-534fecaeb77d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5671-7d9a-c134-f46848c46688	GA	GAB	266	Gabon 	Gabon	\N
00040000-5671-7d9a-ce54-0be262f364fb	GM	GMB	270	Gambia 	Gambija	\N
00040000-5671-7d9a-10c6-41d69afe2040	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5671-7d9a-200a-fce08eb6449f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5671-7d9a-6941-3f7f8090e5bf	GH	GHA	288	Ghana 	Gana	\N
00040000-5671-7d9a-6a6b-7f6c4bfe95ef	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5671-7d9a-8974-2a6f36fc64cf	GR	GRC	300	Greece 	Grčija	\N
00040000-5671-7d9a-db2e-a4fc8324fc8b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5671-7d9a-b977-e85dd78aeae5	GD	GRD	308	Grenada 	Grenada	\N
00040000-5671-7d9a-1f9d-df5e8c1c169e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5671-7d9a-0a20-29f3e5af5ef3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5671-7d9a-421c-176f66c899dc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5671-7d9a-3752-ebb1a1ac0522	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5671-7d9a-6203-a1264e5a95a1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5671-7d9a-2774-6a07a0d60db7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5671-7d9a-1ff3-2caa5a8869d5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5671-7d9a-12cc-3de7d8eac0cb	HT	HTI	332	Haiti 	Haiti	\N
00040000-5671-7d9a-fe31-453ee6b31185	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5671-7d9a-8b98-a5e3422b9f70	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5671-7d9a-914d-523f310f84a3	HN	HND	340	Honduras 	Honduras	\N
00040000-5671-7d9a-8a6f-3b47853107ca	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5671-7d9a-494f-5e7e9ff2beef	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5671-7d9a-3131-7163dd1b9ace	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5671-7d9a-90ae-6aa9de4fee80	IN	IND	356	India 	Indija	\N
00040000-5671-7d9a-2dad-f80fa97c0c1b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5671-7d9a-d697-116d8f1d8ff2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5671-7d9a-62bc-5bca2dce5932	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5671-7d9a-c154-17130b133862	IE	IRL	372	Ireland 	Irska	\N
00040000-5671-7d9a-594f-cecddaa2d35f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5671-7d9a-5825-bb18783e27a4	IL	ISR	376	Israel 	Izrael	\N
00040000-5671-7d9a-0658-f0563be1767e	IT	ITA	380	Italy 	Italija	\N
00040000-5671-7d9a-7929-e15545617538	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5671-7d9a-d9fc-50898ad9614f	JP	JPN	392	Japan 	Japonska	\N
00040000-5671-7d9a-1ae5-4a0e13cf1f64	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5671-7d9a-805f-8943860eba1f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5671-7d9a-27a9-0975d30da481	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5671-7d9a-9c36-be7d407808d2	KE	KEN	404	Kenya 	Kenija	\N
00040000-5671-7d9a-cb16-ef57c09bff2f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5671-7d9a-820d-9a71320881ef	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5671-7d9a-cc20-da07b3a21992	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5671-7d9a-713b-4617d0fa226a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5671-7d9a-5576-3f3656985ada	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5671-7d9a-8c3c-9c1d63ea8ee9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5671-7d9a-887c-1d3673e9781a	LV	LVA	428	Latvia 	Latvija	\N
00040000-5671-7d9a-df79-189eab9a059d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5671-7d9a-9527-12aed6698d0c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5671-7d9a-46fd-ad3f1c449104	LR	LBR	430	Liberia 	Liberija	\N
00040000-5671-7d9a-d1d5-faa27bafa08d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5671-7d9a-6a72-688c52efd5ec	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5671-7d9a-c2e7-42b03b52b73b	LT	LTU	440	Lithuania 	Litva	\N
00040000-5671-7d9a-f65a-25f00fb850a5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5671-7d9a-0e6d-7d5547aa4a74	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5671-7d9a-d023-927d78b1a459	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5671-7d9a-b6de-c8c5815db890	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5671-7d9a-caee-f454d41267db	MW	MWI	454	Malawi 	Malavi	\N
00040000-5671-7d9a-de97-fc92472d0dab	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5671-7d9a-08ad-efc3e02b1e4f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5671-7d9a-5a4e-6a904a2c16a9	ML	MLI	466	Mali 	Mali	\N
00040000-5671-7d9a-1ff1-00ddbef55ce3	MT	MLT	470	Malta 	Malta	\N
00040000-5671-7d9a-175b-d49b4ab30afd	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5671-7d9a-da9f-bd0a0a5d0207	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5671-7d9a-40a3-1ee3542dc67d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5671-7d9a-5d9d-057b27ebf7fe	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5671-7d9a-2c3c-16e26e46c386	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5671-7d9a-2b5e-9f54d54ec739	MX	MEX	484	Mexico 	Mehika	\N
00040000-5671-7d9a-b4f2-2f519ae4753d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5671-7d9a-7577-d6f7242cb4b5	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5671-7d9a-2898-e102aa30459c	MC	MCO	492	Monaco 	Monako	\N
00040000-5671-7d9a-ecf7-0609ee35a61b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5671-7d9a-a3de-b65359ab3f65	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5671-7d9a-78c7-13a0abca2c78	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5671-7d9a-006d-788ecbb62199	MA	MAR	504	Morocco 	Maroko	\N
00040000-5671-7d9a-acfd-eb5900474c57	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5671-7d9a-e2f9-b0f2f9869235	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5671-7d9a-d27c-cdc92c9e1474	NA	NAM	516	Namibia 	Namibija	\N
00040000-5671-7d9a-477e-1bdc0b297ae9	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5671-7d9a-8e16-c9b213a83ef4	NP	NPL	524	Nepal 	Nepal	\N
00040000-5671-7d9a-3289-702ed3f1a65e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5671-7d9a-d7a7-1dba263455f8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5671-7d9a-a692-cf9dc072eb95	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5671-7d9a-8098-ce8ac3eecab8	NE	NER	562	Niger 	Niger 	\N
00040000-5671-7d9a-a761-6dc645210ef6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5671-7d9a-30a4-c7f0e84254a8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5671-7d9a-e90e-ebfd732e8cd7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5671-7d9a-2985-19b0b8b62932	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5671-7d9a-91ff-761277efb6af	NO	NOR	578	Norway 	Norveška	\N
00040000-5671-7d9a-fc31-2ebf4959d8ad	OM	OMN	512	Oman 	Oman	\N
00040000-5671-7d9a-5cde-a6e8233bf797	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5671-7d9a-95c3-8dfcbd2b6df8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5671-7d9a-e77e-6c35150c9f30	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5671-7d9a-e1e8-b42ab61515d0	PA	PAN	591	Panama 	Panama	\N
00040000-5671-7d9a-cb30-72504d9f03ff	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5671-7d9a-fa7d-d6df252554f6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5671-7d9a-ab91-ff74732b351d	PE	PER	604	Peru 	Peru	\N
00040000-5671-7d9a-57d1-88e574695b5a	PH	PHL	608	Philippines 	Filipini	\N
00040000-5671-7d9a-b849-f189f0355eb2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5671-7d9a-8f5f-fced35a509b4	PL	POL	616	Poland 	Poljska	\N
00040000-5671-7d9a-c3b4-90ebd68d8273	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5671-7d9a-3276-43ae89d5556c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5671-7d9a-584c-57b6b12e0dd9	QA	QAT	634	Qatar 	Katar	\N
00040000-5671-7d9a-8b69-1470b0988192	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5671-7d9a-2733-82231a5203cb	RO	ROU	642	Romania 	Romunija	\N
00040000-5671-7d9a-d22f-7cd0540186fc	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5671-7d9a-0a10-b4f82724be65	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5671-7d9a-a72e-148001b795c0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5671-7d9a-4ec2-df8159fe4f2f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5671-7d9a-43b4-9067c50f3312	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5671-7d9a-6d9f-75042988b90b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5671-7d9a-bc70-99a0566effd4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5671-7d9a-0012-20ebcb78bf3d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5671-7d9a-c656-8f3a376997cf	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5671-7d9a-c91f-4935db79cfb0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5671-7d9a-1bd3-4590b2e500ac	SM	SMR	674	San Marino 	San Marino	\N
00040000-5671-7d9a-26e1-37309e43d672	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5671-7d9a-5302-9a31e398cd43	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5671-7d9a-0d24-29b8d6b79888	SN	SEN	686	Senegal 	Senegal	\N
00040000-5671-7d9a-3f91-0461e4d102df	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5671-7d9b-676e-22112066b49d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5671-7d9b-0cf1-d51d4ea5e876	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5671-7d9b-3d77-16ba99769452	SG	SGP	702	Singapore 	Singapur	\N
00040000-5671-7d9b-6838-748ad485121c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5671-7d9b-f553-f05898b14169	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5671-7d9b-2fde-305cdfe5155e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5671-7d9b-4752-9aec92d4c3c5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5671-7d9b-2a2f-0cfa856b109a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5671-7d9b-cd50-9924329d1928	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5671-7d9b-ae17-3b66c4d2b1d5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5671-7d9b-08fd-b4f779eaba72	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5671-7d9b-801c-e345e60e3c31	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5671-7d9b-ee9f-5fd70822ae43	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5671-7d9b-841e-432c69cdabb9	SD	SDN	729	Sudan 	Sudan	\N
00040000-5671-7d9b-57a7-1dbf10515bcc	SR	SUR	740	Suriname 	Surinam	\N
00040000-5671-7d9b-b736-4f6aea827757	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5671-7d9b-72a9-9f0fbc37fe3f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5671-7d9b-11a1-f656f22237c3	SE	SWE	752	Sweden 	Švedska	\N
00040000-5671-7d9b-9d64-302f2b315120	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5671-7d9b-03f8-b57a0352b74f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5671-7d9b-7f51-5de93414904f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5671-7d9b-ab22-8390d7e72d64	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5671-7d9b-d707-8d3013692758	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5671-7d9b-b7d5-9fc33211ab53	TH	THA	764	Thailand 	Tajska	\N
00040000-5671-7d9b-50ee-11d7842b6b1f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5671-7d9b-57c2-6f08533e424e	TG	TGO	768	Togo 	Togo	\N
00040000-5671-7d9b-cfdb-8d7e7b8526a6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5671-7d9b-2466-7ac93594982a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5671-7d9b-e90a-dfc007c4cebf	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5671-7d9b-8fad-f99f02520146	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5671-7d9b-35e4-30bed305309e	TR	TUR	792	Turkey 	Turčija	\N
00040000-5671-7d9b-33c8-5b69f0a5514d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5671-7d9b-c6f4-08632668dbc7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5671-7d9b-ebf3-4b2e31a2b091	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5671-7d9b-275e-313a75a388e9	UG	UGA	800	Uganda 	Uganda	\N
00040000-5671-7d9b-0206-09abbd23c075	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5671-7d9b-fc45-7a084084796e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5671-7d9b-4d13-566f73bf943c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5671-7d9b-1ccf-4428f376e217	US	USA	840	United States 	Združene države Amerike	\N
00040000-5671-7d9b-ba3b-30f707b2b660	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5671-7d9b-13ce-997b0e9564cc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5671-7d9b-8389-557b442919af	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5671-7d9b-b146-9ada5f1765d1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5671-7d9b-6dad-787f58c1f9cc	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5671-7d9b-6044-aeb55de7ff48	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5671-7d9b-c008-0dcfffdab55a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5671-7d9b-159b-87456aa5c9d6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5671-7d9b-fa98-9c606590288a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5671-7d9b-6af2-38c70c884f9d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5671-7d9b-76fe-669706edf4da	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5671-7d9b-c028-5e18516bf171	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5671-7d9b-a360-842cc185e7d6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32466630)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5671-7d9f-a129-3530b6e72c2a	000e0000-5671-7d9e-8972-fe83777f29da	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5671-7d9a-08fb-2e32dd576a14	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5671-7d9f-20bf-7078f5531d29	000e0000-5671-7d9e-62dd-c2174ca2483d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5671-7d9a-3892-185bcd685bf7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5671-7d9f-c0df-ce87b6fd9d86	000e0000-5671-7d9e-8fb5-60660b3c7be3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5671-7d9a-08fb-2e32dd576a14	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5671-7d9f-1bac-8dd8f52764c1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5671-7d9f-8e89-e03188a6745f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32466430)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5671-7d9e-b0e3-2ba00f56111f	000e0000-5671-7d9e-62dd-c2174ca2483d	000c0000-5671-7d9f-b1ea-a0d22769a6a9	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5671-7d9a-eb6e-fd3fee23d07d
000d0000-5671-7d9e-1818-0a84e05765bf	000e0000-5671-7d9e-62dd-c2174ca2483d	000c0000-5671-7d9f-7042-5faeeb07f932	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5671-7d9a-4d81-14dbf5acf9f4
000d0000-5671-7d9e-194c-6ded354b52c2	000e0000-5671-7d9e-62dd-c2174ca2483d	000c0000-5671-7d9f-02bb-06e5933794bf	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5671-7d9a-c92d-df49631e21ce
000d0000-5671-7d9e-b912-84a2679d4eb0	000e0000-5671-7d9e-62dd-c2174ca2483d	000c0000-5671-7d9f-e373-2b5d180261f9	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5671-7d9a-4627-8cd8c008268a
000d0000-5671-7d9e-cc26-6bbe276cc601	000e0000-5671-7d9e-62dd-c2174ca2483d	000c0000-5671-7d9f-9ae6-3cfcb876b8db	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5671-7d9a-4627-8cd8c008268a
000d0000-5671-7d9e-bf6b-58897abaefb7	000e0000-5671-7d9e-62dd-c2174ca2483d	000c0000-5671-7d9f-5d85-e4ef413cff0a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5671-7d9a-eb6e-fd3fee23d07d
000d0000-5671-7d9e-721f-7711ea2fd691	000e0000-5671-7d9e-62dd-c2174ca2483d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5671-7d9a-eb6e-fd3fee23d07d
000d0000-5671-7d9e-979e-41bdb18701c9	000e0000-5671-7d9e-62dd-c2174ca2483d	000c0000-5671-7d9f-2d35-cf39e15e548f	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5671-7d9a-918d-deb9d60d839d
000d0000-5671-7d9e-9bb8-71f921e34bac	000e0000-5671-7d9e-62dd-c2174ca2483d	000c0000-5671-7d9f-a84d-d3634f53b401	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5671-7d9a-28a3-12c4a9439dec
\.


--
-- TOC entry 3135 (class 0 OID 32466221)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32466187)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32466164)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5671-7d9e-1ab3-5b8002f16d06	00080000-5671-7d9e-eb88-0b15f2b5c568	00090000-5671-7d9e-a964-a742f8249cb4	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32466344)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32466900)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5671-7d9e-e3fa-fd8f8e15cbe7	00010000-5671-7d9c-0d39-36e5093ccc49	\N	Prva mapa	Root mapa	2015-12-16 16:05:02	2015-12-16 16:05:02	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32466913)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32466935)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32153619)
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
\.


--
-- TOC entry 3151 (class 0 OID 32466369)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32466121)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5671-7d9c-1a5d-664165365ff9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5671-7d9c-e433-e27122389967	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5671-7d9c-de20-7b336a846495	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5671-7d9c-fd75-6bef8a33a0a5	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5671-7d9c-c8f0-830458286c95	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5671-7d9c-a42d-52034a6b1196	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5671-7d9c-5559-3cafbf69ca0a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5671-7d9c-dd6d-38a05d1a3535	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5671-7d9c-07c7-f287adb7685e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5671-7d9c-b9f3-3acc10612925	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5671-7d9c-b8fd-75b249656d57	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5671-7d9c-1fac-8b10a8eb9f17	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5671-7d9c-6153-13a9da728973	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5671-7d9c-a7d7-a010e6c8415a	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5671-7d9d-fa2f-72d30ea753d3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5671-7d9d-f6ef-b50fc5fb023d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5671-7d9d-335a-ed14f03cb7a6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5671-7d9d-6685-ab69992e6e9e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5671-7d9d-1190-6cf02cf44318	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5671-7da0-0d17-5e78f3f91912	application.tenant.maticnopodjetje	string	s:36:"00080000-5671-7da0-b4e0-c806a04f5230";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32466021)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5671-7d9d-a11e-4c961c7df049	00000000-5671-7d9d-fa2f-72d30ea753d3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5671-7d9d-6dc8-362523c9c991	00000000-5671-7d9d-fa2f-72d30ea753d3	00010000-5671-7d9c-0d39-36e5093ccc49	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5671-7d9d-60dc-e86ef66e4031	00000000-5671-7d9d-f6ef-b50fc5fb023d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32466088)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5671-7d9e-a024-a2a8d54c54f2	\N	00100000-5671-7d9e-4bd2-0440b8e75fff	00100000-5671-7d9e-6ea9-204cf3054c88	01	Gledališče Nimbis
00410000-5671-7d9e-6da9-4fe9dd7d4ce3	00410000-5671-7d9e-a024-a2a8d54c54f2	00100000-5671-7d9e-4bd2-0440b8e75fff	00100000-5671-7d9e-6ea9-204cf3054c88	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32466032)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5671-7d9e-d94e-a52de9caa77a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5671-7d9e-8a48-98d66675b7c8	00010000-5671-7d9e-5b30-e4fa7fa9d310	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5671-7d9e-af3f-cb24fe1f68d0	00010000-5671-7d9e-61d4-1e20363f3649	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5671-7d9e-7531-f6244842b02b	00010000-5671-7d9e-2869-973af83c054d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5671-7d9e-ce74-ee799dc9c0ce	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5671-7d9e-fbb8-2e256976dd06	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5671-7d9e-69af-f6ac24a20b23	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5671-7d9e-146b-4350ad5fceb9	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5671-7d9e-a964-a742f8249cb4	00010000-5671-7d9e-762a-4b064ba6b302	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5671-7d9e-5783-636deba21687	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5671-7d9e-e328-e3b444f115cd	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5671-7d9e-8619-ed907e01a825	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5671-7d9e-271a-cd9374399bc8	00010000-5671-7d9e-fdd9-9782fcf0fd10	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5671-7d9e-2d82-aec9f12967dc	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-7d9e-d54d-d3a65e32872a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-7d9e-7cee-1e2af320cb0c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-7d9e-00de-5561932d7c03	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5671-7d9e-ac5f-edddba10b50a	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5671-7d9e-467d-b4e32f2be9b7	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-7d9e-8ab7-870466c871a6	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5671-7d9e-b5ec-422533097432	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32465967)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5671-7d9b-4053-bede7011b24f	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5671-7d9b-8cc7-4d5b8b5e52de	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5671-7d9b-f9d7-3882d0b768e0	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5671-7d9b-6c73-f329f9e83826	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5671-7d9b-1574-75530d54adff	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5671-7d9b-81d6-4a6b643d5096	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5671-7d9b-2baa-0b2242242f84	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5671-7d9b-8e7b-9b925ad4c03b	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5671-7d9b-f4c6-51b831a5423c	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5671-7d9b-d614-0a38478f1507	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5671-7d9b-0619-62607e5d44b8	Abonma-read	Abonma - branje	t
00030000-5671-7d9b-32df-75d3bb451b0b	Abonma-write	Abonma - spreminjanje	t
00030000-5671-7d9b-6c28-0901a897dda4	Alternacija-read	Alternacija - branje	t
00030000-5671-7d9b-7472-6fa87f204a60	Alternacija-write	Alternacija - spreminjanje	t
00030000-5671-7d9b-0efc-978088e239f4	Arhivalija-read	Arhivalija - branje	t
00030000-5671-7d9b-bf5d-86df68eb9d15	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5671-7d9b-6b2d-8da1961b2e19	AuthStorage-read	AuthStorage - branje	t
00030000-5671-7d9b-8ced-416b9bd9dbbf	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5671-7d9b-69ec-efe849f5aa02	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5671-7d9b-0b12-3920ec02f1c2	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5671-7d9b-8deb-519f8be23511	Besedilo-read	Besedilo - branje	t
00030000-5671-7d9b-9ce0-b8ec086a5d5f	Besedilo-write	Besedilo - spreminjanje	t
00030000-5671-7d9b-a681-1672f46b157b	Dogodek-read	Dogodek - branje	t
00030000-5671-7d9b-2551-a8e707ec16bb	Dogodek-write	Dogodek - spreminjanje	t
00030000-5671-7d9b-15a3-fd7fd079dd6e	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5671-7d9b-b154-e1d151610a0d	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5671-7d9b-0803-f1fc574c998b	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5671-7d9b-8b47-ddd27ee6d508	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5671-7d9b-6e41-1aa3e25538a8	DogodekTrait-read	DogodekTrait - branje	t
00030000-5671-7d9b-26c7-b4cc69301ac6	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5671-7d9b-0f25-4a82c5875fa4	DrugiVir-read	DrugiVir - branje	t
00030000-5671-7d9b-4929-4802b9f84b55	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5671-7d9b-8ccd-f734748bebd6	Drzava-read	Drzava - branje	t
00030000-5671-7d9b-4960-0df4298b5735	Drzava-write	Drzava - spreminjanje	t
00030000-5671-7d9b-2fc0-b86591338241	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5671-7d9b-ce29-54d32db76356	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5671-7d9b-9272-f0585e8c4a10	Funkcija-read	Funkcija - branje	t
00030000-5671-7d9b-018c-0c7d5df87647	Funkcija-write	Funkcija - spreminjanje	t
00030000-5671-7d9b-21ad-5e937d00462a	Gostovanje-read	Gostovanje - branje	t
00030000-5671-7d9b-6180-5742dd29b761	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5671-7d9b-5209-8ddba4e719b0	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5671-7d9b-b4ad-3ebafe4686b2	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5671-7d9b-efd8-86c077bdccee	Kupec-read	Kupec - branje	t
00030000-5671-7d9b-5c8a-f4680987fc62	Kupec-write	Kupec - spreminjanje	t
00030000-5671-7d9b-5bbe-39c466f1bf7c	NacinPlacina-read	NacinPlacina - branje	t
00030000-5671-7d9b-028c-bc1930ba67c0	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5671-7d9b-bbaf-f1a28d2aa13e	Option-read	Option - branje	t
00030000-5671-7d9b-c15a-e82505316e23	Option-write	Option - spreminjanje	t
00030000-5671-7d9b-3a6f-66d5e32c75fc	OptionValue-read	OptionValue - branje	t
00030000-5671-7d9b-a44e-ecf65f333c67	OptionValue-write	OptionValue - spreminjanje	t
00030000-5671-7d9b-7922-51714ad08857	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5671-7d9b-3f6d-50050a272612	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5671-7d9b-a9d6-c632d7ddd1d4	Oseba-read	Oseba - branje	t
00030000-5671-7d9b-a1d2-a59df57f25cd	Oseba-write	Oseba - spreminjanje	t
00030000-5671-7d9b-4ced-de240d876d99	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5671-7d9b-a6d2-4b77996f87ba	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5671-7d9b-ac77-1d114afc83bc	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5671-7d9b-ec15-3929a6da7506	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5671-7d9b-05ac-0166afe54730	Pogodba-read	Pogodba - branje	t
00030000-5671-7d9b-df91-2ee0d29bc91f	Pogodba-write	Pogodba - spreminjanje	t
00030000-5671-7d9b-eb8d-995802c618b9	Popa-read	Popa - branje	t
00030000-5671-7d9b-4aa1-73f6e788dae9	Popa-write	Popa - spreminjanje	t
00030000-5671-7d9b-d758-db081d0c1f7a	Posta-read	Posta - branje	t
00030000-5671-7d9b-13e4-80c21fb4270e	Posta-write	Posta - spreminjanje	t
00030000-5671-7d9b-cde2-6f783e71692f	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5671-7d9b-7872-a24545027f4a	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5671-7d9b-4200-daca3f39424c	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5671-7d9b-683d-d6610815441b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5671-7d9b-b52e-839f4aa3ed56	PostniNaslov-read	PostniNaslov - branje	t
00030000-5671-7d9b-92e5-5dea0e232c1d	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5671-7d9b-b01d-e425eced07bc	Praznik-read	Praznik - branje	t
00030000-5671-7d9b-bb82-3b8c7d39263a	Praznik-write	Praznik - spreminjanje	t
00030000-5671-7d9b-a943-7223c5b256c0	Predstava-read	Predstava - branje	t
00030000-5671-7d9b-7619-4a1ed8bb83bd	Predstava-write	Predstava - spreminjanje	t
00030000-5671-7d9b-f12e-b66cd5edfcc7	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5671-7d9b-9a25-2962559e3fa5	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5671-7d9b-9cf2-de1332e13a6b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5671-7d9b-5be1-941f67c13b51	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5671-7d9b-a9a1-1c6d422630e9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5671-7d9b-c1f0-3e5cf59929dc	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5671-7d9b-af47-7f8ce58d6ccb	ProgramDela-read	ProgramDela - branje	t
00030000-5671-7d9b-bae9-1685a2ee6a87	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5671-7d9b-ce9d-6e4bd4a69180	ProgramFestival-read	ProgramFestival - branje	t
00030000-5671-7d9b-469c-9d25bd87ba50	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5671-7d9b-da60-caeea00989be	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5671-7d9b-c9d6-e4acb040a30f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5671-7d9b-ee5d-b50cd4ff8ae4	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5671-7d9b-16a1-a23848d44c50	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5671-7d9b-5884-8055c53db14e	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5671-7d9b-618e-dd846d482451	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5671-7d9b-2346-7d9d382014b7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5671-7d9b-8eee-6138ac0c1d31	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5671-7d9b-22ab-8e2b3c01485e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5671-7d9b-6f30-a368720872c0	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5671-7d9b-0f6a-bef67a2a2307	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5671-7d9b-c7e3-ebdb544caa9f	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5671-7d9b-8880-4e6b765422a9	ProgramRazno-read	ProgramRazno - branje	t
00030000-5671-7d9b-6698-073de2593046	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5671-7d9b-9f7f-ec5800c1c5bc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5671-7d9b-783f-02b891972727	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5671-7d9b-e4fe-c33a79ed6f54	Prostor-read	Prostor - branje	t
00030000-5671-7d9b-7840-5b4af20f59be	Prostor-write	Prostor - spreminjanje	t
00030000-5671-7d9b-0d3c-0e1b6263e2f7	Racun-read	Racun - branje	t
00030000-5671-7d9b-7591-83bbb4d81330	Racun-write	Racun - spreminjanje	t
00030000-5671-7d9b-d929-af7ad0eb8636	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5671-7d9b-0224-7d528445ac3e	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5671-7d9b-61c3-a90f9a3e1a11	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5671-7d9b-f4f4-ed577222d333	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5671-7d9b-6776-81fb16d793ea	Rekvizit-read	Rekvizit - branje	t
00030000-5671-7d9b-4e2f-f2a4a30c91a7	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5671-7d9b-51e3-2bb1211994b0	Revizija-read	Revizija - branje	t
00030000-5671-7d9b-0b7a-40e086a488ff	Revizija-write	Revizija - spreminjanje	t
00030000-5671-7d9b-01e2-3c6911ba93e0	Rezervacija-read	Rezervacija - branje	t
00030000-5671-7d9b-47cb-b0a933b52304	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5671-7d9b-3d69-fd1439038b38	SedezniRed-read	SedezniRed - branje	t
00030000-5671-7d9b-6826-2bff90bb6cc9	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5671-7d9b-178a-79ca3a24edb8	Sedez-read	Sedez - branje	t
00030000-5671-7d9b-a592-af04a1c6dc11	Sedez-write	Sedez - spreminjanje	t
00030000-5671-7d9b-69d9-19adf067dc41	Sezona-read	Sezona - branje	t
00030000-5671-7d9b-98bf-b224f8f4c324	Sezona-write	Sezona - spreminjanje	t
00030000-5671-7d9b-da08-2611f2dfa303	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5671-7d9b-d19a-d4238c267835	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5671-7d9b-38d5-dc9c4a52c648	Telefonska-read	Telefonska - branje	t
00030000-5671-7d9b-429d-41b1f45eedc4	Telefonska-write	Telefonska - spreminjanje	t
00030000-5671-7d9b-cdbc-7dbc25e87db4	TerminStoritve-read	TerminStoritve - branje	t
00030000-5671-7d9b-bf2a-459d36c0a5ca	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5671-7d9b-c41c-cd6da9864cee	TipFunkcije-read	TipFunkcije - branje	t
00030000-5671-7d9b-0208-203b64e12933	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5671-7d9b-bbaf-0ba3a5421455	TipPopa-read	TipPopa - branje	t
00030000-5671-7d9b-882c-41f91ae07ade	TipPopa-write	TipPopa - spreminjanje	t
00030000-5671-7d9b-510d-cc7f8f1d50d5	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5671-7d9b-e268-9f43edeaa531	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5671-7d9b-e637-b3562cc928a8	TipVaje-read	TipVaje - branje	t
00030000-5671-7d9b-49cf-c5da16db311d	TipVaje-write	TipVaje - spreminjanje	t
00030000-5671-7d9b-0921-7c6822495ab1	Trr-read	Trr - branje	t
00030000-5671-7d9b-ae67-c3e830b2a19a	Trr-write	Trr - spreminjanje	t
00030000-5671-7d9b-e711-e094c60fa4ae	Uprizoritev-read	Uprizoritev - branje	t
00030000-5671-7d9b-d5fd-7475dd8c0fb1	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5671-7d9b-5369-68b410b2b977	Vaja-read	Vaja - branje	t
00030000-5671-7d9b-3d87-30e003849b55	Vaja-write	Vaja - spreminjanje	t
00030000-5671-7d9b-ff98-ad8e80fe2eee	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5671-7d9b-67cd-06f7131b4da1	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5671-7d9b-ad5f-8dbd37966197	VrstaStroska-read	VrstaStroska - branje	t
00030000-5671-7d9b-35c9-2c8673290cb8	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5671-7d9b-0d86-bc85357ee2cd	Zaposlitev-read	Zaposlitev - branje	t
00030000-5671-7d9b-3850-95ecbd709a69	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5671-7d9b-9739-2b7b124e415a	Zasedenost-read	Zasedenost - branje	t
00030000-5671-7d9b-4810-e3a1b3707da6	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5671-7d9b-33a4-3adf8af5310f	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5671-7d9b-e09e-bd0013f90b7b	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5671-7d9b-52c3-2fbb644647c7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5671-7d9b-40ce-5f39cc4c92c4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5671-7d9b-829b-66e2a120a5ca	Job-read	Branje opravil - samo zase - branje	t
00030000-5671-7d9b-87c6-2eb7fb34fa7e	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5671-7d9b-8016-6b940f0c5f9e	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5671-7d9b-5da4-963f3b97247a	Report-read	Report - branje	t
00030000-5671-7d9b-e434-43d6a698557f	Report-write	Report - spreminjanje	t
00030000-5671-7d9b-0e9e-42490caaafe8	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5671-7d9b-d790-c1e573e7a6cd	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5671-7d9b-cf44-b4a5457f67c9	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5671-7d9b-a757-6894bbf13102	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5671-7d9b-f42b-57233d32c315	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5671-7d9b-e89b-0ff7c1227d00	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5671-7d9b-a548-90aeeaa0d391	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5671-7d9b-0312-38deab4122eb	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5671-7d9b-e414-7b2ebff7c519	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5671-7d9b-d7ac-cc6fc91add98	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5671-7d9b-7f81-02acde001aea	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5671-7d9b-cc74-3db711980b23	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5671-7d9b-1e8c-694fec41a66a	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5671-7d9b-3ba1-06dbc51236c6	Datoteka-write	Datoteka - spreminjanje	t
00030000-5671-7d9b-e2a0-f929d20165a0	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32465986)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5671-7d9b-4457-a91a66932e47	00030000-5671-7d9b-8cc7-4d5b8b5e52de
00020000-5671-7d9b-4457-a91a66932e47	00030000-5671-7d9b-4053-bede7011b24f
00020000-5671-7d9b-c9c9-934f23e780d9	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-0b12-3920ec02f1c2
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-9ce0-b8ec086a5d5f
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-69ec-efe849f5aa02
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-d0bc-616cd9f5b545	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-a427-754916c2cc32	00030000-5671-7d9b-69ec-efe849f5aa02
00020000-5671-7d9b-a427-754916c2cc32	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-a427-754916c2cc32	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-a427-754916c2cc32	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-a427-754916c2cc32	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-a427-754916c2cc32	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-440e-f96b77e5c837	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-440e-f96b77e5c837	00030000-5671-7d9b-3850-95ecbd709a69
00020000-5671-7d9b-440e-f96b77e5c837	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-440e-f96b77e5c837	00030000-5671-7d9b-1574-75530d54adff
00020000-5671-7d9b-440e-f96b77e5c837	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-440e-f96b77e5c837	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-440e-f96b77e5c837	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-8ec1-7f41607265ef	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-8ec1-7f41607265ef	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-8ec1-7f41607265ef	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-da52-eb055dffd6f7	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-da52-eb055dffd6f7	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-da52-eb055dffd6f7	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-da52-eb055dffd6f7	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-da52-eb055dffd6f7	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-da52-eb055dffd6f7	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-da52-eb055dffd6f7	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-da52-eb055dffd6f7	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-bc65-4d3313e5444b	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-bc65-4d3313e5444b	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-bc65-4d3313e5444b	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-bc65-4d3313e5444b	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-1574-75530d54adff
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-ae67-c3e830b2a19a
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-92e5-5dea0e232c1d
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-429d-41b1f45eedc4
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-f300-55359ee50ac2	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-6c85-53fea8cafcb3	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-6c85-53fea8cafcb3	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-6c85-53fea8cafcb3	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-6c85-53fea8cafcb3	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-6c85-53fea8cafcb3	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-6c85-53fea8cafcb3	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-6c85-53fea8cafcb3	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-429d-41b1f45eedc4
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-92e5-5dea0e232c1d
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-ae67-c3e830b2a19a
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-4aa1-73f6e788dae9
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-b4ad-3ebafe4686b2
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-c1f0-3e5cf59929dc
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-f629-1ad46c6b6598	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-e4c9-8ac4316ec890	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-3fd3-ae4f58180afe	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-3fd3-ae4f58180afe	00030000-5671-7d9b-882c-41f91ae07ade
00020000-5671-7d9b-9d8a-46c4c7cbd4bb	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-f259-664228ea3bb9	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9b-f259-664228ea3bb9	00030000-5671-7d9b-13e4-80c21fb4270e
00020000-5671-7d9b-8100-4bac6efaf033	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9b-5c38-e4c4108685b5	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-5c38-e4c4108685b5	00030000-5671-7d9b-4960-0df4298b5735
00020000-5671-7d9b-e0bb-4cf135e6dd65	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-f48c-bc40d57bf424	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9b-f48c-bc40d57bf424	00030000-5671-7d9b-40ce-5f39cc4c92c4
00020000-5671-7d9b-f571-1fc79ed416b3	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9b-ce67-3dfa81305c11	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9b-ce67-3dfa81305c11	00030000-5671-7d9b-e09e-bd0013f90b7b
00020000-5671-7d9b-d2a3-88f719f8ae1c	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9b-491e-7df27b819c87	00030000-5671-7d9b-0619-62607e5d44b8
00020000-5671-7d9b-491e-7df27b819c87	00030000-5671-7d9b-32df-75d3bb451b0b
00020000-5671-7d9b-6e30-eac73abf1786	00030000-5671-7d9b-0619-62607e5d44b8
00020000-5671-7d9b-3395-bd3b19a7d269	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9b-3395-bd3b19a7d269	00030000-5671-7d9b-7840-5b4af20f59be
00020000-5671-7d9b-3395-bd3b19a7d269	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-3395-bd3b19a7d269	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-3395-bd3b19a7d269	00030000-5671-7d9b-92e5-5dea0e232c1d
00020000-5671-7d9b-3395-bd3b19a7d269	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-6703-c9599b147794	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9b-6703-c9599b147794	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-6703-c9599b147794	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-2491-32b4e595448a	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-2491-32b4e595448a	00030000-5671-7d9b-35c9-2c8673290cb8
00020000-5671-7d9b-3e30-225aaa3cf75c	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-79da-df525dd0f3bd	00030000-5671-7d9b-3f6d-50050a272612
00020000-5671-7d9b-79da-df525dd0f3bd	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-79da-df525dd0f3bd	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-79da-df525dd0f3bd	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-79da-df525dd0f3bd	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-79da-df525dd0f3bd	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-79da-df525dd0f3bd	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-79da-df525dd0f3bd	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-79da-df525dd0f3bd	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-8f9c-4ca46a4bb08b	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-8f9c-4ca46a4bb08b	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-8f9c-4ca46a4bb08b	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-8f9c-4ca46a4bb08b	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-8f9c-4ca46a4bb08b	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-6567-cef11e140a16	00030000-5671-7d9b-e637-b3562cc928a8
00020000-5671-7d9b-6567-cef11e140a16	00030000-5671-7d9b-49cf-c5da16db311d
00020000-5671-7d9b-2dd3-f8f47e117657	00030000-5671-7d9b-e637-b3562cc928a8
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-2baa-0b2242242f84
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-8e7b-9b925ad4c03b
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-af47-7f8ce58d6ccb
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-bae9-1685a2ee6a87
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-ce9d-6e4bd4a69180
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-469c-9d25bd87ba50
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-da60-caeea00989be
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-c9d6-e4acb040a30f
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-ee5d-b50cd4ff8ae4
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-16a1-a23848d44c50
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-5884-8055c53db14e
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-618e-dd846d482451
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-2346-7d9d382014b7
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-8eee-6138ac0c1d31
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-22ab-8e2b3c01485e
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-6f30-a368720872c0
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-0f6a-bef67a2a2307
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-c7e3-ebdb544caa9f
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-8880-4e6b765422a9
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-6698-073de2593046
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-9f7f-ec5800c1c5bc
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-783f-02b891972727
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-5be1-941f67c13b51
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-4929-4802b9f84b55
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-7872-a24545027f4a
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-87c6-2eb7fb34fa7e
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-0f25-4a82c5875fa4
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-9cf2-de1332e13a6b
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-cde2-6f783e71692f
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-829b-66e2a120a5ca
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-c810-6e19790620b4	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-af47-7f8ce58d6ccb
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-ce9d-6e4bd4a69180
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-da60-caeea00989be
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-ee5d-b50cd4ff8ae4
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-5884-8055c53db14e
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-2346-7d9d382014b7
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-22ab-8e2b3c01485e
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-0f6a-bef67a2a2307
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-8880-4e6b765422a9
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-9f7f-ec5800c1c5bc
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-9cf2-de1332e13a6b
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-0f25-4a82c5875fa4
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-cde2-6f783e71692f
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-829b-66e2a120a5ca
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-7a1f-48aa7b07acf5	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-d5fd-7475dd8c0fb1
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-018c-0c7d5df87647
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-03c0-85a8c0abc22a	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-d334-f7f3487e73ca	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-a5f9-5655ca82677d	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-a5f9-5655ca82677d	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9b-a5f9-5655ca82677d	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-a5f9-5655ca82677d	00030000-5671-7d9b-018c-0c7d5df87647
00020000-5671-7d9b-a5f9-5655ca82677d	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-a5f9-5655ca82677d	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-a5f9-5655ca82677d	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-a5f9-5655ca82677d	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-1574-75530d54adff
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-df91-2ee0d29bc91f
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-d19a-d4238c267835
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-59e0-b3fd16c7f938	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-1ef2-25f7e921d1d0	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-2051-fd05f0e69ff2	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-2051-fd05f0e69ff2	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-2051-fd05f0e69ff2	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-2051-fd05f0e69ff2	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9b-2051-fd05f0e69ff2	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-2051-fd05f0e69ff2	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-2051-fd05f0e69ff2	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-394c-0070418f14ad	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-394c-0070418f14ad	00030000-5671-7d9b-d19a-d4238c267835
00020000-5671-7d9b-394c-0070418f14ad	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-394c-0070418f14ad	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-7604-273e0b328548	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-7604-273e0b328548	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-0619-62607e5d44b8
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-69ec-efe849f5aa02
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-0b12-3920ec02f1c2
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-9ce0-b8ec086a5d5f
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-0f25-4a82c5875fa4
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-4929-4802b9f84b55
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-018c-0c7d5df87647
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-829b-66e2a120a5ca
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-87c6-2eb7fb34fa7e
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-1574-75530d54adff
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-df91-2ee0d29bc91f
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-cde2-6f783e71692f
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-7872-a24545027f4a
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-9cf2-de1332e13a6b
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-5be1-941f67c13b51
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-2baa-0b2242242f84
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-af47-7f8ce58d6ccb
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-8e7b-9b925ad4c03b
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-bae9-1685a2ee6a87
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-ce9d-6e4bd4a69180
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-469c-9d25bd87ba50
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-da60-caeea00989be
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-c9d6-e4acb040a30f
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-ee5d-b50cd4ff8ae4
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-16a1-a23848d44c50
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-5884-8055c53db14e
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-618e-dd846d482451
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-2346-7d9d382014b7
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-8eee-6138ac0c1d31
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-22ab-8e2b3c01485e
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-6f30-a368720872c0
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-0f6a-bef67a2a2307
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-c7e3-ebdb544caa9f
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-8880-4e6b765422a9
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-6698-073de2593046
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-9f7f-ec5800c1c5bc
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-783f-02b891972727
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-d19a-d4238c267835
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-e637-b3562cc928a8
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-d5fd-7475dd8c0fb1
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9b-321d-5e19ca0bb860	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-0619-62607e5d44b8
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-69ec-efe849f5aa02
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-0b12-3920ec02f1c2
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-9ce0-b8ec086a5d5f
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-e637-b3562cc928a8
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9b-be56-cc29916f02a2	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-0619-62607e5d44b8
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-69ec-efe849f5aa02
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-0b12-3920ec02f1c2
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-9ce0-b8ec086a5d5f
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-018c-0c7d5df87647
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-e637-b3562cc928a8
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-d5fd-7475dd8c0fb1
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9b-c0dc-bf9892191845	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-69ec-efe849f5aa02
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-0b12-3920ec02f1c2
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-9ce0-b8ec086a5d5f
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-0f25-4a82c5875fa4
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-4929-4802b9f84b55
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-018c-0c7d5df87647
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-829b-66e2a120a5ca
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-87c6-2eb7fb34fa7e
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-b4ad-3ebafe4686b2
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-1574-75530d54adff
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-df91-2ee0d29bc91f
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-4aa1-73f6e788dae9
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-cde2-6f783e71692f
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-7872-a24545027f4a
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-92e5-5dea0e232c1d
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-9cf2-de1332e13a6b
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-5be1-941f67c13b51
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-c1f0-3e5cf59929dc
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-2baa-0b2242242f84
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-af47-7f8ce58d6ccb
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-8e7b-9b925ad4c03b
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-bae9-1685a2ee6a87
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-ce9d-6e4bd4a69180
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-469c-9d25bd87ba50
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-da60-caeea00989be
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-c9d6-e4acb040a30f
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-ee5d-b50cd4ff8ae4
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-16a1-a23848d44c50
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-5884-8055c53db14e
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-618e-dd846d482451
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-2346-7d9d382014b7
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-8eee-6138ac0c1d31
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-22ab-8e2b3c01485e
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-6f30-a368720872c0
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-0f6a-bef67a2a2307
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-c7e3-ebdb544caa9f
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-8880-4e6b765422a9
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-6698-073de2593046
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-9f7f-ec5800c1c5bc
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-783f-02b891972727
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-d19a-d4238c267835
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-429d-41b1f45eedc4
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-ae67-c3e830b2a19a
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-d5fd-7475dd8c0fb1
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-3850-95ecbd709a69
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9b-8ff4-706028a388b4	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-0619-62607e5d44b8
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-69ec-efe849f5aa02
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-0b12-3920ec02f1c2
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-9ce0-b8ec086a5d5f
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-018c-0c7d5df87647
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-b4ad-3ebafe4686b2
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-1574-75530d54adff
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-4aa1-73f6e788dae9
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-92e5-5dea0e232c1d
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-c1f0-3e5cf59929dc
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-429d-41b1f45eedc4
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-e637-b3562cc928a8
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-ae67-c3e830b2a19a
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-d5fd-7475dd8c0fb1
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-3850-95ecbd709a69
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9b-5b99-1a2f2b87914c	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-0619-62607e5d44b8
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-69ec-efe849f5aa02
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-018c-0c7d5df87647
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-e637-b3562cc928a8
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9b-abf4-5af6d0802b6e	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-0619-62607e5d44b8
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-0f25-4a82c5875fa4
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-4929-4802b9f84b55
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-829b-66e2a120a5ca
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-87c6-2eb7fb34fa7e
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-b4ad-3ebafe4686b2
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-3f6d-50050a272612
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-1574-75530d54adff
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-df91-2ee0d29bc91f
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-4aa1-73f6e788dae9
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-cde2-6f783e71692f
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-7872-a24545027f4a
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-92e5-5dea0e232c1d
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-9cf2-de1332e13a6b
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-5be1-941f67c13b51
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-c1f0-3e5cf59929dc
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-2baa-0b2242242f84
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-af47-7f8ce58d6ccb
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-8e7b-9b925ad4c03b
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-bae9-1685a2ee6a87
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-ce9d-6e4bd4a69180
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-469c-9d25bd87ba50
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-da60-caeea00989be
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-c9d6-e4acb040a30f
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-ee5d-b50cd4ff8ae4
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-16a1-a23848d44c50
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-5884-8055c53db14e
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-618e-dd846d482451
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-2346-7d9d382014b7
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-8eee-6138ac0c1d31
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-22ab-8e2b3c01485e
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-6f30-a368720872c0
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-0f6a-bef67a2a2307
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-c7e3-ebdb544caa9f
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-8880-4e6b765422a9
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-6698-073de2593046
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-9f7f-ec5800c1c5bc
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-783f-02b891972727
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-d19a-d4238c267835
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-429d-41b1f45eedc4
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-e637-b3562cc928a8
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-ae67-c3e830b2a19a
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-35c9-2c8673290cb8
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-3850-95ecbd709a69
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9b-31f0-af8478b1b0b9	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-4053-bede7011b24f
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-8cc7-4d5b8b5e52de
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0619-62607e5d44b8
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-32df-75d3bb451b0b
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0efc-978088e239f4
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-bf5d-86df68eb9d15
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-6b2d-8da1961b2e19
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-8ced-416b9bd9dbbf
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-69ec-efe849f5aa02
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0b12-3920ec02f1c2
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-8deb-519f8be23511
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-9ce0-b8ec086a5d5f
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a681-1672f46b157b
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-6c73-f329f9e83826
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-2551-a8e707ec16bb
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-15a3-fd7fd079dd6e
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-b154-e1d151610a0d
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0803-f1fc574c998b
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-8b47-ddd27ee6d508
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0f25-4a82c5875fa4
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-4929-4802b9f84b55
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-8ccd-f734748bebd6
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-4960-0df4298b5735
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-2fc0-b86591338241
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-ce29-54d32db76356
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-018c-0c7d5df87647
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-21ad-5e937d00462a
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-6180-5742dd29b761
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-8016-6b940f0c5f9e
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-829b-66e2a120a5ca
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-87c6-2eb7fb34fa7e
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-5209-8ddba4e719b0
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-b4ad-3ebafe4686b2
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-efd8-86c077bdccee
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-5c8a-f4680987fc62
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-d790-c1e573e7a6cd
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-cf44-b4a5457f67c9
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a757-6894bbf13102
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-f42b-57233d32c315
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a548-90aeeaa0d391
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-e89b-0ff7c1227d00
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-5bbe-39c466f1bf7c
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-028c-bc1930ba67c0
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-bbaf-f1a28d2aa13e
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-c15a-e82505316e23
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-3a6f-66d5e32c75fc
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a44e-ecf65f333c67
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-7922-51714ad08857
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-3f6d-50050a272612
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-1574-75530d54adff
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-4ced-de240d876d99
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a6d2-4b77996f87ba
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-ac77-1d114afc83bc
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-ec15-3929a6da7506
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-df91-2ee0d29bc91f
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-4aa1-73f6e788dae9
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-d758-db081d0c1f7a
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-13e4-80c21fb4270e
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-cde2-6f783e71692f
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-7872-a24545027f4a
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-4200-daca3f39424c
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-683d-d6610815441b
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-92e5-5dea0e232c1d
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-b01d-e425eced07bc
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-bb82-3b8c7d39263a
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a943-7223c5b256c0
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-7619-4a1ed8bb83bd
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-f12e-b66cd5edfcc7
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-9a25-2962559e3fa5
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-9cf2-de1332e13a6b
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-5be1-941f67c13b51
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a9a1-1c6d422630e9
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-c1f0-3e5cf59929dc
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-2baa-0b2242242f84
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-af47-7f8ce58d6ccb
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-8e7b-9b925ad4c03b
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-bae9-1685a2ee6a87
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-ce9d-6e4bd4a69180
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-469c-9d25bd87ba50
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-da60-caeea00989be
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-c9d6-e4acb040a30f
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-ee5d-b50cd4ff8ae4
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-16a1-a23848d44c50
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-5884-8055c53db14e
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-618e-dd846d482451
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-2346-7d9d382014b7
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-8eee-6138ac0c1d31
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-22ab-8e2b3c01485e
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-6f30-a368720872c0
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0f6a-bef67a2a2307
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-c7e3-ebdb544caa9f
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-8880-4e6b765422a9
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-6698-073de2593046
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-9f7f-ec5800c1c5bc
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-783f-02b891972727
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-e4fe-c33a79ed6f54
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-7840-5b4af20f59be
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0d3c-0e1b6263e2f7
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-7591-83bbb4d81330
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-d929-af7ad0eb8636
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0224-7d528445ac3e
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-6776-81fb16d793ea
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-4e2f-f2a4a30c91a7
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-61c3-a90f9a3e1a11
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-f4f4-ed577222d333
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-5da4-963f3b97247a
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-e434-43d6a698557f
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-51e3-2bb1211994b0
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0b7a-40e086a488ff
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-01e2-3c6911ba93e0
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-47cb-b0a933b52304
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-178a-79ca3a24edb8
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-a592-af04a1c6dc11
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-3d69-fd1439038b38
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-6826-2bff90bb6cc9
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-69d9-19adf067dc41
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-98bf-b224f8f4c324
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0e9e-42490caaafe8
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-d19a-d4238c267835
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-429d-41b1f45eedc4
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-cdbc-7dbc25e87db4
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-f9d7-3882d0b768e0
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-bf2a-459d36c0a5ca
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-c41c-cd6da9864cee
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0208-203b64e12933
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-bbaf-0ba3a5421455
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-882c-41f91ae07ade
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-510d-cc7f8f1d50d5
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-e268-9f43edeaa531
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-e637-b3562cc928a8
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-49cf-c5da16db311d
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-ae67-c3e830b2a19a
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-d5fd-7475dd8c0fb1
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-5369-68b410b2b977
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-3d87-30e003849b55
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-ff98-ad8e80fe2eee
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-67cd-06f7131b4da1
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-ad5f-8dbd37966197
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-35c9-2c8673290cb8
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-1e8c-694fec41a66a
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-cc74-3db711980b23
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-3850-95ecbd709a69
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-9739-2b7b124e415a
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-4810-e3a1b3707da6
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-33a4-3adf8af5310f
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-e09e-bd0013f90b7b
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-52c3-2fbb644647c7
00020000-5671-7d9e-d8ea-0071a04f1f52	00030000-5671-7d9b-40ce-5f39cc4c92c4
00020000-5671-7d9e-8cb5-fe7fcaacd926	00030000-5671-7d9b-7f81-02acde001aea
00020000-5671-7d9e-2f1c-cfa4e066069e	00030000-5671-7d9b-d7ac-cc6fc91add98
00020000-5671-7d9e-9b24-c28036363e3e	00030000-5671-7d9b-d5fd-7475dd8c0fb1
00020000-5671-7d9e-a11f-054d00254055	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9e-4f18-6ef29818e5f0	00030000-5671-7d9b-cf44-b4a5457f67c9
00020000-5671-7d9e-ecf2-7768108bacd7	00030000-5671-7d9b-a757-6894bbf13102
00020000-5671-7d9e-08a7-8b8f3e07c806	00030000-5671-7d9b-f42b-57233d32c315
00020000-5671-7d9e-afaf-360aa65939f4	00030000-5671-7d9b-d790-c1e573e7a6cd
00020000-5671-7d9e-9fd1-d877011215bd	00030000-5671-7d9b-a548-90aeeaa0d391
00020000-5671-7d9e-beb2-5587a3c11a38	00030000-5671-7d9b-e89b-0ff7c1227d00
00020000-5671-7d9e-6dfc-6b67c383b810	00030000-5671-7d9b-e414-7b2ebff7c519
00020000-5671-7d9e-8dc5-4db96dd78730	00030000-5671-7d9b-0312-38deab4122eb
00020000-5671-7d9e-960a-f040b07813c8	00030000-5671-7d9b-a9d6-c632d7ddd1d4
00020000-5671-7d9e-2816-07db1af1221a	00030000-5671-7d9b-a1d2-a59df57f25cd
00020000-5671-7d9e-ac25-01af787a5859	00030000-5671-7d9b-1574-75530d54adff
00020000-5671-7d9e-d28a-ba35ab621665	00030000-5671-7d9b-81d6-4a6b643d5096
00020000-5671-7d9e-cb3a-8a1eb33a8636	00030000-5671-7d9b-3ba1-06dbc51236c6
00020000-5671-7d9e-13b3-911ffb59938e	00030000-5671-7d9b-e2a0-f929d20165a0
00020000-5671-7d9e-b86c-926c9a876c5c	00030000-5671-7d9b-eb8d-995802c618b9
00020000-5671-7d9e-b86c-926c9a876c5c	00030000-5671-7d9b-4aa1-73f6e788dae9
00020000-5671-7d9e-b86c-926c9a876c5c	00030000-5671-7d9b-e711-e094c60fa4ae
00020000-5671-7d9e-9221-9dcbdec95feb	00030000-5671-7d9b-0921-7c6822495ab1
00020000-5671-7d9e-c33b-d9225158a07c	00030000-5671-7d9b-ae67-c3e830b2a19a
00020000-5671-7d9e-ea9e-dd51350ad3d3	00030000-5671-7d9b-0e9e-42490caaafe8
00020000-5671-7d9e-1ce1-7d5ad460b970	00030000-5671-7d9b-38d5-dc9c4a52c648
00020000-5671-7d9e-11d6-b439a5e02ae9	00030000-5671-7d9b-429d-41b1f45eedc4
00020000-5671-7d9e-1abe-e8bc69eb9b23	00030000-5671-7d9b-b52e-839f4aa3ed56
00020000-5671-7d9e-3cac-e2dafa2107cc	00030000-5671-7d9b-92e5-5dea0e232c1d
00020000-5671-7d9e-3fee-98ff242b51e4	00030000-5671-7d9b-0d86-bc85357ee2cd
00020000-5671-7d9e-9153-55032581ea60	00030000-5671-7d9b-3850-95ecbd709a69
00020000-5671-7d9e-275e-d7035afb8824	00030000-5671-7d9b-05ac-0166afe54730
00020000-5671-7d9e-31dc-65f57c3010b6	00030000-5671-7d9b-df91-2ee0d29bc91f
00020000-5671-7d9e-0c41-ae999bd47072	00030000-5671-7d9b-da08-2611f2dfa303
00020000-5671-7d9e-291c-a8d4b71312f4	00030000-5671-7d9b-d19a-d4238c267835
00020000-5671-7d9e-b672-836d54a0cabe	00030000-5671-7d9b-6c28-0901a897dda4
00020000-5671-7d9e-cd46-4d480b2e1d88	00030000-5671-7d9b-7472-6fa87f204a60
00020000-5671-7d9e-1208-d8c08492af33	00030000-5671-7d9b-f4c6-51b831a5423c
00020000-5671-7d9e-06e3-aa4bffcddac8	00030000-5671-7d9b-9272-f0585e8c4a10
00020000-5671-7d9e-a98d-f042db99e136	00030000-5671-7d9b-018c-0c7d5df87647
00020000-5671-7d9e-f4bc-66cd879fbfb5	00030000-5671-7d9b-d614-0a38478f1507
\.


--
-- TOC entry 3152 (class 0 OID 32466376)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32466410)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32466548)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5671-7d9e-7153-24fab300779e	00090000-5671-7d9e-d94e-a52de9caa77a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5671-7d9e-a8f3-239c57db7726	00090000-5671-7d9e-fbb8-2e256976dd06	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5671-7d9e-0c93-144c14788099	00090000-5671-7d9e-271a-cd9374399bc8	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5671-7d9e-c947-382fbfef6b8c	00090000-5671-7d9e-5783-636deba21687	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32466068)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5671-7d9e-eb88-0b15f2b5c568	\N	00040000-5671-7d9b-2fde-305cdfe5155e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-7d9e-b045-d6186ec739e6	\N	00040000-5671-7d9b-2fde-305cdfe5155e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5671-7d9e-e06d-8cdac6edfee9	\N	00040000-5671-7d9b-2fde-305cdfe5155e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-7d9e-073f-e19f0e554b2a	\N	00040000-5671-7d9b-2fde-305cdfe5155e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-7d9e-8722-76d72a4370b8	\N	00040000-5671-7d9b-2fde-305cdfe5155e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-7d9e-d69b-a0310bdbc2ea	\N	00040000-5671-7d9a-bc8e-fe38fb9c4635	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-7d9e-4298-4ee9bba700c1	\N	00040000-5671-7d9a-ec09-2b08e5b0087f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-7d9e-bfa7-d9e22ba3dfb4	\N	00040000-5671-7d9a-d7d1-5caab030aeb7	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-7d9e-57f9-77386aeddabd	\N	00040000-5671-7d9a-200a-fce08eb6449f	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5671-7da0-b4e0-c806a04f5230	\N	00040000-5671-7d9b-2fde-305cdfe5155e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32466113)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5671-7d9a-d692-9617c255ef2d	8341	Adlešiči
00050000-5671-7d9a-c060-0930e2d1058a	5270	Ajdovščina
00050000-5671-7d9a-7145-86e508a90a44	6280	Ankaran/Ancarano
00050000-5671-7d9a-6a61-aadccabb3eb7	9253	Apače
00050000-5671-7d9a-00ea-abe8743a5355	8253	Artiče
00050000-5671-7d9a-b189-1d1bfbaac841	4275	Begunje na Gorenjskem
00050000-5671-7d9a-27d9-18ad58d16a0a	1382	Begunje pri Cerknici
00050000-5671-7d9a-bcc1-5f213040392d	9231	Beltinci
00050000-5671-7d9a-4882-816341a2b79c	2234	Benedikt
00050000-5671-7d9a-29a8-8039740ede98	2345	Bistrica ob Dravi
00050000-5671-7d9a-8cd4-7defd4563968	3256	Bistrica ob Sotli
00050000-5671-7d9a-0eee-e72bd1fc7a63	8259	Bizeljsko
00050000-5671-7d9a-6aad-27944fbf853c	1223	Blagovica
00050000-5671-7d9a-7afc-bf8975002df7	8283	Blanca
00050000-5671-7d9a-f683-226b6eb668b4	4260	Bled
00050000-5671-7d9a-94fa-47f5e7b4f3e5	4273	Blejska Dobrava
00050000-5671-7d9a-028f-f2bd30acc79e	9265	Bodonci
00050000-5671-7d9a-4243-f0ac530dfba3	9222	Bogojina
00050000-5671-7d9a-a4cc-e36f35b72287	4263	Bohinjska Bela
00050000-5671-7d9a-ae8b-fdc56b85247a	4264	Bohinjska Bistrica
00050000-5671-7d9a-9e93-fd6b92f88066	4265	Bohinjsko jezero
00050000-5671-7d9a-f358-172500b64430	1353	Borovnica
00050000-5671-7d9a-e656-4761f51c3fc2	8294	Boštanj
00050000-5671-7d9a-1617-d23454f5a6ea	5230	Bovec
00050000-5671-7d9a-e6ba-c65d3a76fc11	5295	Branik
00050000-5671-7d9a-3db6-3e33da5fd967	3314	Braslovče
00050000-5671-7d9a-6f18-1273e26f497a	5223	Breginj
00050000-5671-7d9a-5f0e-29e44974f604	8280	Brestanica
00050000-5671-7d9a-24ff-abcd020dfc12	2354	Bresternica
00050000-5671-7d9a-a30e-3e05e7d0bff8	4243	Brezje
00050000-5671-7d9a-c9f9-ca09bf4d11ca	1351	Brezovica pri Ljubljani
00050000-5671-7d9a-f4a8-5125ad7c1b62	8250	Brežice
00050000-5671-7d9a-88c5-50cb2dc0f284	4210	Brnik - Aerodrom
00050000-5671-7d9a-79c3-46d8a4f22afc	8321	Brusnice
00050000-5671-7d9a-6ff2-955bf20c25e6	3255	Buče
00050000-5671-7d9a-c41b-33b696d2c1da	8276	Bučka 
00050000-5671-7d9a-8db5-3ea54c65468a	9261	Cankova
00050000-5671-7d9a-13a3-b01d756dc873	3000	Celje 
00050000-5671-7d9a-999d-41d73723b8f5	3001	Celje - poštni predali
00050000-5671-7d9a-270b-1496d3155cfe	4207	Cerklje na Gorenjskem
00050000-5671-7d9a-049e-8eade7a67f81	8263	Cerklje ob Krki
00050000-5671-7d9a-c595-89f4bcb462eb	1380	Cerknica
00050000-5671-7d9a-75ef-037858ca44d8	5282	Cerkno
00050000-5671-7d9a-5be3-466160dfec00	2236	Cerkvenjak
00050000-5671-7d9a-ba1b-ed9c615d5def	2215	Ceršak
00050000-5671-7d9a-a880-d4cb1ef1bf8d	2326	Cirkovce
00050000-5671-7d9a-1fd0-5b1f750bd22d	2282	Cirkulane
00050000-5671-7d9a-7467-f01cc9febd51	5273	Col
00050000-5671-7d9a-7e65-a90d7421efab	8251	Čatež ob Savi
00050000-5671-7d9a-a036-b663dd5afc12	1413	Čemšenik
00050000-5671-7d9a-b970-65467b3fd401	5253	Čepovan
00050000-5671-7d9a-455b-0830a0319368	9232	Črenšovci
00050000-5671-7d9a-ed25-f2e08e6b18d5	2393	Črna na Koroškem
00050000-5671-7d9a-48e8-d60e4f327fdd	6275	Črni Kal
00050000-5671-7d9a-0119-41ac59e9783e	5274	Črni Vrh nad Idrijo
00050000-5671-7d9a-6af1-ab147932d66c	5262	Črniče
00050000-5671-7d9a-6f0f-a8e88c633aef	8340	Črnomelj
00050000-5671-7d9a-38aa-5ed81dd7574a	6271	Dekani
00050000-5671-7d9a-c937-29afba51a28e	5210	Deskle
00050000-5671-7d9a-f544-76321c940635	2253	Destrnik
00050000-5671-7d9a-61b4-2b1f1b94a18c	6215	Divača
00050000-5671-7d9a-e4f7-035cb322d1ee	1233	Dob
00050000-5671-7d9a-f4ea-90c1af81d298	3224	Dobje pri Planini
00050000-5671-7d9a-8906-283393960dd3	8257	Dobova
00050000-5671-7d9a-8247-5fc8cac624e9	1423	Dobovec
00050000-5671-7d9a-c020-30923937d6cd	5263	Dobravlje
00050000-5671-7d9a-8993-0ce72cb9a7c8	3204	Dobrna
00050000-5671-7d9a-1ee2-ee50c30256ce	8211	Dobrnič
00050000-5671-7d9a-fe6e-4f1491eed118	1356	Dobrova
00050000-5671-7d9a-6ba7-a5a7d1099dc3	9223	Dobrovnik/Dobronak 
00050000-5671-7d9a-e8b9-f49da2592821	5212	Dobrovo v Brdih
00050000-5671-7d9a-851e-abdb9eb078bb	1431	Dol pri Hrastniku
00050000-5671-7d9a-7bbf-d1e47a3c25ab	1262	Dol pri Ljubljani
00050000-5671-7d9a-4c05-175fce83b2eb	1273	Dole pri Litiji
00050000-5671-7d9a-1b66-95d22c799551	1331	Dolenja vas
00050000-5671-7d9a-6079-11c699738094	8350	Dolenjske Toplice
00050000-5671-7d9a-30dc-1b6e0bf61e5a	1230	Domžale
00050000-5671-7d9a-cf14-dda406fe1991	2252	Dornava
00050000-5671-7d9a-3c2f-32b9ecc35555	5294	Dornberk
00050000-5671-7d9a-bdf3-65051509fb91	1319	Draga
00050000-5671-7d9a-025d-7e9f7d7fc9f0	8343	Dragatuš
00050000-5671-7d9a-7736-acc06282e2f3	3222	Dramlje
00050000-5671-7d9a-6d91-a5af7ced3b93	2370	Dravograd
00050000-5671-7d9a-baa0-fae4bb1266c0	4203	Duplje
00050000-5671-7d9a-5452-c29e869b0e2e	6221	Dutovlje
00050000-5671-7d9a-7f00-9541536584db	8361	Dvor
00050000-5671-7d9a-151e-934cf1ed4212	2343	Fala
00050000-5671-7d9a-ab1e-1f6f19198429	9208	Fokovci
00050000-5671-7d9a-cb58-008dd5c8d459	2313	Fram
00050000-5671-7d9a-4580-b5538e4f533d	3213	Frankolovo
00050000-5671-7d9a-727b-a31b4fa47fd6	1274	Gabrovka
00050000-5671-7d9a-c329-d9663d4ecb08	8254	Globoko
00050000-5671-7d9a-793b-8f05ea93583c	5275	Godovič
00050000-5671-7d9a-c7d1-929bc9039446	4204	Golnik
00050000-5671-7d9a-53f6-da38644956d3	3303	Gomilsko
00050000-5671-7d9a-17d5-813e22e20c05	4224	Gorenja vas
00050000-5671-7d9a-3751-f17fe004591d	3263	Gorica pri Slivnici
00050000-5671-7d9a-c2e5-9badcedfd548	2272	Gorišnica
00050000-5671-7d9a-94ad-46aa8b4e96cf	9250	Gornja Radgona
00050000-5671-7d9a-00a6-9a16b58a344d	3342	Gornji Grad
00050000-5671-7d9a-d4aa-70f35c0f3649	4282	Gozd Martuljek
00050000-5671-7d9a-05e1-f8786e32f6ba	6272	Gračišče
00050000-5671-7d9a-8805-27b310b95f0a	9264	Grad
00050000-5671-7d9a-9ba6-ae842eb6a407	8332	Gradac
00050000-5671-7d9a-8ee5-baeba01ebe14	1384	Grahovo
00050000-5671-7d9a-d033-a52d18c5bb2a	5242	Grahovo ob Bači
00050000-5671-7d9a-b031-236a5aeac472	5251	Grgar
00050000-5671-7d9a-2b7d-ac9bb0ac0374	3302	Griže
00050000-5671-7d9a-277d-f4e368e7378e	3231	Grobelno
00050000-5671-7d9a-645f-a9bfe1e2de25	1290	Grosuplje
00050000-5671-7d9a-4bf7-eeffc995f75f	2288	Hajdina
00050000-5671-7d9a-9ea7-108baf21c078	8362	Hinje
00050000-5671-7d9a-22f5-4c43bb5698d7	2311	Hoče
00050000-5671-7d9a-70d1-a228afa14d4d	9205	Hodoš/Hodos
00050000-5671-7d9a-2b09-2894e4b909f1	1354	Horjul
00050000-5671-7d9a-cf09-785f4d08e747	1372	Hotedršica
00050000-5671-7d9a-326e-c90e03926d18	1430	Hrastnik
00050000-5671-7d9a-3b8b-988c6fc129f6	6225	Hruševje
00050000-5671-7d9a-adfe-07fdcbb3a468	4276	Hrušica
00050000-5671-7d9a-0cb0-41e2c3be1e11	5280	Idrija
00050000-5671-7d9a-5a60-c182fe2396a6	1292	Ig
00050000-5671-7d9a-a16e-3d366ecb9553	6250	Ilirska Bistrica
00050000-5671-7d9a-8c50-174829be55c6	6251	Ilirska Bistrica-Trnovo
00050000-5671-7d9a-63bc-4033f36b6049	1295	Ivančna Gorica
00050000-5671-7d9a-4877-dcdec4bae79c	2259	Ivanjkovci
00050000-5671-7d9a-14a4-d9875ce1d0c5	1411	Izlake
00050000-5671-7d9a-57d7-529cad76d1e3	6310	Izola/Isola
00050000-5671-7d9a-0c92-e3e72130c716	2222	Jakobski Dol
00050000-5671-7d9a-0486-52409fbd39ac	2221	Jarenina
00050000-5671-7d9a-6494-ff18f3ac44d4	6254	Jelšane
00050000-5671-7d9a-e597-b866f602d136	4270	Jesenice
00050000-5671-7d9a-30f4-d4c36587fd33	8261	Jesenice na Dolenjskem
00050000-5671-7d9a-5ab7-4675aadddf29	3273	Jurklošter
00050000-5671-7d9a-c7c0-4d5036f3248f	2223	Jurovski Dol
00050000-5671-7d9a-ae4b-3b58b601c777	2256	Juršinci
00050000-5671-7d9a-9e7f-e414a35fbbfa	5214	Kal nad Kanalom
00050000-5671-7d9a-f223-87d37c26d825	3233	Kalobje
00050000-5671-7d9a-0f89-604cfe1ebf5e	4246	Kamna Gorica
00050000-5671-7d9a-3fc6-bcffc95b67c1	2351	Kamnica
00050000-5671-7d9a-8b02-f7b8b29041b2	1241	Kamnik
00050000-5671-7d9a-9159-698c846cb7bd	5213	Kanal
00050000-5671-7d9a-15c7-f475fb9ca3b8	8258	Kapele
00050000-5671-7d9a-cd1c-6b4f9851d4b2	2362	Kapla
00050000-5671-7d9a-2322-2b5d3bed3e63	2325	Kidričevo
00050000-5671-7d9a-55e7-7bff1f1c816a	1412	Kisovec
00050000-5671-7d9a-2405-1686f45ea788	6253	Knežak
00050000-5671-7d9a-1a3e-6b7c3d15e3eb	5222	Kobarid
00050000-5671-7d9a-b56e-85cf98244980	9227	Kobilje
00050000-5671-7d9a-1529-2f4198722f7b	1330	Kočevje
00050000-5671-7d9a-6a3a-e23f7674f799	1338	Kočevska Reka
00050000-5671-7d9a-30f1-7d0e7af1ef97	2276	Kog
00050000-5671-7d9a-394b-b858f66ec4a8	5211	Kojsko
00050000-5671-7d9a-29e5-9090931a3ca8	6223	Komen
00050000-5671-7d9a-3baf-c47085a07099	1218	Komenda
00050000-5671-7d9a-4711-98649d136411	6000	Koper/Capodistria 
00050000-5671-7d9a-2f27-533eb84465e7	6001	Koper/Capodistria - poštni predali
00050000-5671-7d9a-877a-ff35677293ab	8282	Koprivnica
00050000-5671-7d9a-9128-26a47335e26f	5296	Kostanjevica na Krasu
00050000-5671-7d9a-9567-9464f546f773	8311	Kostanjevica na Krki
00050000-5671-7d9a-5d20-a62144c91aee	1336	Kostel
00050000-5671-7d9a-9e8e-cc1afcaa06f0	6256	Košana
00050000-5671-7d9a-0e99-959cdb147f1e	2394	Kotlje
00050000-5671-7d9a-cd6d-f4af3f106bdf	6240	Kozina
00050000-5671-7d9a-cfaa-f28b71721238	3260	Kozje
00050000-5671-7d9a-ee10-008e00949b27	4000	Kranj 
00050000-5671-7d9a-f273-50b5cf5018cf	4001	Kranj - poštni predali
00050000-5671-7d9a-27d6-b3b24e7b122a	4280	Kranjska Gora
00050000-5671-7d9a-ab53-0385b1e8f175	1281	Kresnice
00050000-5671-7d9a-fa4e-96658075254d	4294	Križe
00050000-5671-7d9a-363e-1ceaa761a4b0	9206	Križevci
00050000-5671-7d9a-331d-9cc986fab678	9242	Križevci pri Ljutomeru
00050000-5671-7d9a-e8fc-de0bd8811e7c	1301	Krka
00050000-5671-7d9a-9f01-73709f6a33d0	8296	Krmelj
00050000-5671-7d9a-a2d7-c247c809cbd6	4245	Kropa
00050000-5671-7d9a-6c68-d9dc3a556d82	8262	Krška vas
00050000-5671-7d9a-5a63-9a6f39c16a6f	8270	Krško
00050000-5671-7d9a-1a7f-a133654e094b	9263	Kuzma
00050000-5671-7d9a-671b-6ee5c6d97fbc	2318	Laporje
00050000-5671-7d9a-868a-9162d394bd60	3270	Laško
00050000-5671-7d9a-8312-256eab969dd9	1219	Laze v Tuhinju
00050000-5671-7d9a-1407-2b2c1bb1a3bc	2230	Lenart v Slovenskih goricah
00050000-5671-7d9a-bf8f-a570e3117557	9220	Lendava/Lendva
00050000-5671-7d9a-1d3b-d664db13ec61	4248	Lesce
00050000-5671-7d9a-b579-5abec3c46bbf	3261	Lesično
00050000-5671-7d9a-ffec-d4033ead7e3f	8273	Leskovec pri Krškem
00050000-5671-7d9a-c1ac-0c7ddfdd5da0	2372	Libeliče
00050000-5671-7d9a-6525-ee5657fffacc	2341	Limbuš
00050000-5671-7d9a-89d8-9ce679d2f8d9	1270	Litija
00050000-5671-7d9a-e707-acd51d06d78e	3202	Ljubečna
00050000-5671-7d9a-3c3f-f07ea2c5c8cb	1000	Ljubljana 
00050000-5671-7d9a-3035-1a92971c64dd	1001	Ljubljana - poštni predali
00050000-5671-7d9a-a14e-4f35bab0612d	1231	Ljubljana - Črnuče
00050000-5671-7d9a-6513-a11e44750a79	1261	Ljubljana - Dobrunje
00050000-5671-7d9a-d80e-e938074e2af1	1260	Ljubljana - Polje
00050000-5671-7d9a-741c-8e62307a2e2f	1210	Ljubljana - Šentvid
00050000-5671-7d9a-48f4-4493712c1afb	1211	Ljubljana - Šmartno
00050000-5671-7d9a-a234-3446d03be703	3333	Ljubno ob Savinji
00050000-5671-7d9a-32b6-d5f878963533	9240	Ljutomer
00050000-5671-7d9a-e060-5c6bc1234828	3215	Loče
00050000-5671-7d9a-6d8c-356bd31c8a88	5231	Log pod Mangartom
00050000-5671-7d9a-8156-917b4311c906	1358	Log pri Brezovici
00050000-5671-7d9a-1aee-b7057e96c8c9	1370	Logatec
00050000-5671-7d9a-65e5-4c40b70e687a	1371	Logatec
00050000-5671-7d9a-17fd-ed512f237baa	1434	Loka pri Zidanem Mostu
00050000-5671-7d9a-aced-24b27fd9ea1a	3223	Loka pri Žusmu
00050000-5671-7d9a-faf5-62cc8d300d3b	6219	Lokev
00050000-5671-7d9a-3847-158eb783d8e2	1318	Loški Potok
00050000-5671-7d9a-6af6-673acc3fa0d4	2324	Lovrenc na Dravskem polju
00050000-5671-7d9a-29ea-25a6d27ddc74	2344	Lovrenc na Pohorju
00050000-5671-7d9a-2db4-89f6e2b09809	3334	Luče
00050000-5671-7d9a-6ee7-0679d87ff2a3	1225	Lukovica
00050000-5671-7d9a-089f-444b89726468	9202	Mačkovci
00050000-5671-7d9a-e711-0aa2265ca078	2322	Majšperk
00050000-5671-7d9a-624d-27e124c9f2be	2321	Makole
00050000-5671-7d9a-ccf5-52a49ef83aaa	9243	Mala Nedelja
00050000-5671-7d9a-7046-ed5593459f77	2229	Malečnik
00050000-5671-7d9a-fbe7-46899d754aad	6273	Marezige
00050000-5671-7d9a-98da-8ecb6a16be27	2000	Maribor 
00050000-5671-7d9a-fdfd-98e2de6f8077	2001	Maribor - poštni predali
00050000-5671-7d9a-e1ca-575f73932d06	2206	Marjeta na Dravskem polju
00050000-5671-7d9a-e91a-c62b0940e31d	2281	Markovci
00050000-5671-7d9a-0d72-8e272d4cc29e	9221	Martjanci
00050000-5671-7d9a-f32c-23626f733f4b	6242	Materija
00050000-5671-7d9a-e67a-1fdcd1f31d63	4211	Mavčiče
00050000-5671-7d9a-8d43-d8568090e81b	1215	Medvode
00050000-5671-7d9a-f023-f659e25e53c7	1234	Mengeš
00050000-5671-7d9a-fb78-af99f8773c8c	8330	Metlika
00050000-5671-7d9a-b2d9-8e2a64649ebe	2392	Mežica
00050000-5671-7d9a-419a-9feebbb89c8d	2204	Miklavž na Dravskem polju
00050000-5671-7d9a-496d-b7536917bfc8	2275	Miklavž pri Ormožu
00050000-5671-7d9a-5d3f-b9651bbe1932	5291	Miren
00050000-5671-7d9a-88bc-eb6a06829a73	8233	Mirna
00050000-5671-7d9a-26a8-ba4e63247eca	8216	Mirna Peč
00050000-5671-7d9a-e538-e8c98e64bcd4	2382	Mislinja
00050000-5671-7d9a-4178-f494981d7da2	4281	Mojstrana
00050000-5671-7d9a-df00-e4f4abc7d39f	8230	Mokronog
00050000-5671-7d9a-5b2d-5b732dcb8190	1251	Moravče
00050000-5671-7d9a-06e8-bf12195c79ef	9226	Moravske Toplice
00050000-5671-7d9a-b339-a9c30f6c1d3d	5216	Most na Soči
00050000-5671-7d9a-34a7-9f2bf47fb11b	1221	Motnik
00050000-5671-7d9a-8781-7fb94425c6be	3330	Mozirje
00050000-5671-7d9a-5e7c-89d7bd39dc67	9000	Murska Sobota 
00050000-5671-7d9a-865a-8a85c7128237	9001	Murska Sobota - poštni predali
00050000-5671-7d9a-be95-862c6b654c71	2366	Muta
00050000-5671-7d9a-b505-93db3e177a49	4202	Naklo
00050000-5671-7d9a-145f-03f8b6887969	3331	Nazarje
00050000-5671-7d9a-09ff-7cdca859b25f	1357	Notranje Gorice
00050000-5671-7d9a-6b31-be72e0c5a055	3203	Nova Cerkev
00050000-5671-7d9a-fc39-e12153386ea6	5000	Nova Gorica 
00050000-5671-7d9a-b273-091618b03935	5001	Nova Gorica - poštni predali
00050000-5671-7d9a-10c5-bf9ed0c1e4d7	1385	Nova vas
00050000-5671-7d9a-ac1e-ac995f8ea961	8000	Novo mesto
00050000-5671-7d9a-6db2-441252fc7e19	8001	Novo mesto - poštni predali
00050000-5671-7d9a-538a-15c677b1e207	6243	Obrov
00050000-5671-7d9a-16c1-026a0494df28	9233	Odranci
00050000-5671-7d9a-3432-e1f7d5cf300b	2317	Oplotnica
00050000-5671-7d9a-a1e8-59a14d3e3432	2312	Orehova vas
00050000-5671-7d9a-7b40-76336e561cbc	2270	Ormož
00050000-5671-7d9a-8305-05f55b9f06fa	1316	Ortnek
00050000-5671-7d9a-0f54-a78e46a60135	1337	Osilnica
00050000-5671-7d9a-33c0-b01b7b1cac45	8222	Otočec
00050000-5671-7d9a-92f7-c9f12a924b26	2361	Ožbalt
00050000-5671-7d9a-1090-7ddcc68a9bec	2231	Pernica
00050000-5671-7d9a-4147-702ff567b295	2211	Pesnica pri Mariboru
00050000-5671-7d9a-2c6b-6a28f41c8d03	9203	Petrovci
00050000-5671-7d9a-ba88-df1843de14ac	3301	Petrovče
00050000-5671-7d9a-a367-19cb211c5154	6330	Piran/Pirano
00050000-5671-7d9a-ac8c-8b84324b620c	8255	Pišece
00050000-5671-7d9a-14db-9bf62eb6b9c3	6257	Pivka
00050000-5671-7d9a-9614-71232fdf61c4	6232	Planina
00050000-5671-7d9a-d4ff-c62f066783d0	3225	Planina pri Sevnici
00050000-5671-7d9a-7e25-503555782226	6276	Pobegi
00050000-5671-7d9a-0d34-499554f9b1fe	8312	Podbočje
00050000-5671-7d9a-caec-eeb0a5ca7c78	5243	Podbrdo
00050000-5671-7d9a-ac6a-4b87f075d839	3254	Podčetrtek
00050000-5671-7d9a-285a-dec80c20ad35	2273	Podgorci
00050000-5671-7d9a-60e6-86f8d7b7a18a	6216	Podgorje
00050000-5671-7d9a-58af-9f3d5acc2007	2381	Podgorje pri Slovenj Gradcu
00050000-5671-7d9a-bc80-e8346f17ad7b	6244	Podgrad
00050000-5671-7d9a-4e83-e1734eaa1877	1414	Podkum
00050000-5671-7d9a-c5dd-f2a510c33737	2286	Podlehnik
00050000-5671-7d9a-fc22-ccbfd28798d4	5272	Podnanos
00050000-5671-7d9a-00c0-6a078c383862	4244	Podnart
00050000-5671-7d9a-7e3e-0329e2020cab	3241	Podplat
00050000-5671-7d9a-4084-6e593a89bd14	3257	Podsreda
00050000-5671-7d9a-e997-758066538c1c	2363	Podvelka
00050000-5671-7d9a-dc94-ed36a4cafa3d	2208	Pohorje
00050000-5671-7d9a-80fc-b0c38d13b639	2257	Polenšak
00050000-5671-7d9a-5190-3390dfb14288	1355	Polhov Gradec
00050000-5671-7d9a-727d-887b5eb4c6e5	4223	Poljane nad Škofjo Loko
00050000-5671-7d9a-7f99-bc71b8533e47	2319	Poljčane
00050000-5671-7d9a-b5d8-e402e23b78b7	1272	Polšnik
00050000-5671-7d9a-b0ba-88587a3c6be6	3313	Polzela
00050000-5671-7d9a-23b1-e12de6fd7cc7	3232	Ponikva
00050000-5671-7d9a-edb2-f3f8b5d1d275	6320	Portorož/Portorose
00050000-5671-7d9a-4e32-408b9f0e79e0	6230	Postojna
00050000-5671-7d9a-8839-42e0984082d3	2331	Pragersko
00050000-5671-7d9a-6963-1ebf6d8b7bf8	3312	Prebold
00050000-5671-7d9a-801e-a515595a7473	4205	Preddvor
00050000-5671-7d9a-2ac8-aa6d26b7a193	6255	Prem
00050000-5671-7d9a-5636-584a81ddfd53	1352	Preserje
00050000-5671-7d9a-8861-37c2ea40662f	6258	Prestranek
00050000-5671-7d9a-a8de-f906fc0b36fd	2391	Prevalje
00050000-5671-7d9a-e827-e10d274dd974	3262	Prevorje
00050000-5671-7d9a-40bc-9ee16aa6cced	1276	Primskovo 
00050000-5671-7d9a-a19b-a76de98f063f	3253	Pristava pri Mestinju
00050000-5671-7d9a-4ec2-e11761709fe8	9207	Prosenjakovci/Partosfalva
00050000-5671-7d9a-3a05-3d3c31c3a699	5297	Prvačina
00050000-5671-7d9a-a5ce-456db33af929	2250	Ptuj
00050000-5671-7d9a-dcee-d69c84655ce4	2323	Ptujska Gora
00050000-5671-7d9a-408e-ed1a0f51898a	9201	Puconci
00050000-5671-7d9a-ba30-9833b3833ac0	2327	Rače
00050000-5671-7d9a-987e-25aa496b4542	1433	Radeče
00050000-5671-7d9a-21ce-89e0c6a26d01	9252	Radenci
00050000-5671-7d9a-833c-6a85334b8844	2360	Radlje ob Dravi
00050000-5671-7d9a-a381-cf12beda6913	1235	Radomlje
00050000-5671-7d9a-8699-61e867ec570c	4240	Radovljica
00050000-5671-7d9a-d2cd-8d035f586796	8274	Raka
00050000-5671-7d9a-d749-a33d467a89bf	1381	Rakek
00050000-5671-7d9a-d940-86f3e9280129	4283	Rateče - Planica
00050000-5671-7d9a-85e4-6e1697bc301d	2390	Ravne na Koroškem
00050000-5671-7d9a-e633-c96a1a669796	9246	Razkrižje
00050000-5671-7d9a-e55c-3aa19e567eaa	3332	Rečica ob Savinji
00050000-5671-7d9a-c370-87ce8b7f2c70	5292	Renče
00050000-5671-7d9a-8722-fb3bc90c6f63	1310	Ribnica
00050000-5671-7d9a-833c-2a875a7fe4c4	2364	Ribnica na Pohorju
00050000-5671-7d9a-916a-fbb98a387487	3272	Rimske Toplice
00050000-5671-7d9a-bdab-6e535c3ca0b6	1314	Rob
00050000-5671-7d9a-c571-b71a61468caf	5215	Ročinj
00050000-5671-7d9a-17c9-177816a17ee1	3250	Rogaška Slatina
00050000-5671-7d9a-0f45-baffc55f2e33	9262	Rogašovci
00050000-5671-7d9a-ab61-3a7b7b9b21ed	3252	Rogatec
00050000-5671-7d9a-ec2d-ff8256f5de4a	1373	Rovte
00050000-5671-7d9a-1ea8-7fe8e6bfe2c7	2342	Ruše
00050000-5671-7d9a-9d52-b5a9fafd6c86	1282	Sava
00050000-5671-7d9a-ae67-f819f84c487d	6333	Sečovlje/Sicciole
00050000-5671-7d9a-cc28-7af325ed9619	4227	Selca
00050000-5671-7d9a-00db-b4f99959d36b	2352	Selnica ob Dravi
00050000-5671-7d9a-ae5c-82e63b7a374d	8333	Semič
00050000-5671-7d9a-7695-93323490a411	8281	Senovo
00050000-5671-7d9a-593f-b34c316c4087	6224	Senožeče
00050000-5671-7d9a-bfac-56b2bd4e5332	8290	Sevnica
00050000-5671-7d9a-fb4d-c5baf3a78e2e	6210	Sežana
00050000-5671-7d9a-82fc-6a23a4e45f65	2214	Sladki Vrh
00050000-5671-7d9a-f25f-b84ba49e0f48	5283	Slap ob Idrijci
00050000-5671-7d9a-93f9-12fac53ba75e	2380	Slovenj Gradec
00050000-5671-7d9a-b275-fd5558276b32	2310	Slovenska Bistrica
00050000-5671-7d9a-14f3-4c7f101c6ed2	3210	Slovenske Konjice
00050000-5671-7d9a-c341-3cc61d6e3e16	1216	Smlednik
00050000-5671-7d9a-9402-8d4e5846ad1b	5232	Soča
00050000-5671-7d9a-0180-940fca4ba8d9	1317	Sodražica
00050000-5671-7d9a-e780-1ca38b4d1658	3335	Solčava
00050000-5671-7d9a-e3ac-c410836635da	5250	Solkan
00050000-5671-7d9a-da5e-2c7872d20f3a	4229	Sorica
00050000-5671-7d9a-08d9-ceccb998400f	4225	Sovodenj
00050000-5671-7d9a-ee21-ae5fd7422cb7	5281	Spodnja Idrija
00050000-5671-7d9a-01ec-a868c4f07065	2241	Spodnji Duplek
00050000-5671-7d9a-2885-739153c1eee9	9245	Spodnji Ivanjci
00050000-5671-7d9a-9be5-eac1c06e08b5	2277	Središče ob Dravi
00050000-5671-7d9a-62c8-b68c33f7c513	4267	Srednja vas v Bohinju
00050000-5671-7d9a-3a69-244ed3dc66d4	8256	Sromlje 
00050000-5671-7d9a-f104-730b2a0cb84d	5224	Srpenica
00050000-5671-7d9a-6a53-8b28c0d5cb1f	1242	Stahovica
00050000-5671-7d9a-3ec4-a64046dec110	1332	Stara Cerkev
00050000-5671-7d9a-6cf6-db0761697d12	8342	Stari trg ob Kolpi
00050000-5671-7d9a-9bea-3f9e4d7a7e2b	1386	Stari trg pri Ložu
00050000-5671-7d9a-9d43-b012c797b55b	2205	Starše
00050000-5671-7d9a-05cf-224dc1d13e25	2289	Stoperce
00050000-5671-7d9a-a21c-76e1d1af057d	8322	Stopiče
00050000-5671-7d9a-56cf-2ad4c601ce97	3206	Stranice
00050000-5671-7d9a-ff6c-7a7c23c14db9	8351	Straža
00050000-5671-7d9a-852f-fcb42e095d98	1313	Struge
00050000-5671-7d9a-9bf1-a3c5b6385cd3	8293	Studenec
00050000-5671-7d9a-f01e-c35bee66dc6b	8331	Suhor
00050000-5671-7d9a-e948-63b1ee218019	2233	Sv. Ana v Slovenskih goricah
00050000-5671-7d9a-091f-01f7eb00d1cb	2235	Sv. Trojica v Slovenskih goricah
00050000-5671-7d9a-76ee-6f7dc229479e	2353	Sveti Duh na Ostrem Vrhu
00050000-5671-7d9a-19cc-c4df17dd135a	9244	Sveti Jurij ob Ščavnici
00050000-5671-7d9a-3225-34c7d0f3feab	3264	Sveti Štefan
00050000-5671-7d9a-a470-a060817fe132	2258	Sveti Tomaž
00050000-5671-7d9a-5bc7-cfcdcbb79f7c	9204	Šalovci
00050000-5671-7d9a-78bf-f5016503bf6d	5261	Šempas
00050000-5671-7d9a-7d8a-58b1bc8c9848	5290	Šempeter pri Gorici
00050000-5671-7d9a-8ef5-b5f7ffbb2eb4	3311	Šempeter v Savinjski dolini
00050000-5671-7d9a-e61d-1a3a08adff2c	4208	Šenčur
00050000-5671-7d9a-923e-5c6230af88f3	2212	Šentilj v Slovenskih goricah
00050000-5671-7d9a-1ff1-8a8931c928d2	8297	Šentjanž
00050000-5671-7d9a-9260-3c7caf5a953b	2373	Šentjanž pri Dravogradu
00050000-5671-7d9a-0bc5-f06694459d43	8310	Šentjernej
00050000-5671-7d9a-2756-d8374f874007	3230	Šentjur
00050000-5671-7d9a-336d-06275952f47f	3271	Šentrupert
00050000-5671-7d9a-8e00-2dac0867aa6f	8232	Šentrupert
00050000-5671-7d9a-14b3-9b1dd0a05d7e	1296	Šentvid pri Stični
00050000-5671-7d9a-5643-1e6c78b852b5	8275	Škocjan
00050000-5671-7d9a-dce9-af9c438f68c6	6281	Škofije
00050000-5671-7d9a-0ece-205779f082dd	4220	Škofja Loka
00050000-5671-7d9a-1346-76520bee9f90	3211	Škofja vas
00050000-5671-7d9a-3261-cfa7b40d76c7	1291	Škofljica
00050000-5671-7d9a-cb79-73abcce5072e	6274	Šmarje
00050000-5671-7d9a-c37e-2a7593ab52c5	1293	Šmarje - Sap
00050000-5671-7d9a-8cf7-89b0ba21671c	3240	Šmarje pri Jelšah
00050000-5671-7d9a-debe-8c444916428e	8220	Šmarješke Toplice
00050000-5671-7d9a-8226-79e5cd28c4ec	2315	Šmartno na Pohorju
00050000-5671-7d9a-adcb-d185341bdc33	3341	Šmartno ob Dreti
00050000-5671-7d9a-38ad-4a0dcf6c32c1	3327	Šmartno ob Paki
00050000-5671-7d9a-32b5-05e73c05e485	1275	Šmartno pri Litiji
00050000-5671-7d9a-9217-0ceab43adb53	2383	Šmartno pri Slovenj Gradcu
00050000-5671-7d9a-aa14-ed866f2cc2c2	3201	Šmartno v Rožni dolini
00050000-5671-7d9a-bcd4-6077ef534265	3325	Šoštanj
00050000-5671-7d9a-46f8-5116d8728cb6	6222	Štanjel
00050000-5671-7d9a-a8ad-8ba91f6ec440	3220	Štore
00050000-5671-7d9a-30c0-d69677deb97e	3304	Tabor
00050000-5671-7d9a-cc9d-5d5694b903af	3221	Teharje
00050000-5671-7d9a-652f-01a5561beb31	9251	Tišina
00050000-5671-7d9a-caa6-38b415fc4fe5	5220	Tolmin
00050000-5671-7d9a-0dfc-20bce951b8d6	3326	Topolšica
00050000-5671-7d9a-091a-bcf09e276a87	2371	Trbonje
00050000-5671-7d9a-abf0-e2384afcde96	1420	Trbovlje
00050000-5671-7d9a-c09f-83140a12673b	8231	Trebelno 
00050000-5671-7d9a-5121-119f206cccf7	8210	Trebnje
00050000-5671-7d9a-5eb7-77820c7f2967	5252	Trnovo pri Gorici
00050000-5671-7d9a-584e-c71387890920	2254	Trnovska vas
00050000-5671-7d9a-eb2c-5e931396e07d	1222	Trojane
00050000-5671-7d9a-db4d-255e667cae10	1236	Trzin
00050000-5671-7d9a-0a07-e41456141234	4290	Tržič
00050000-5671-7d9a-d715-15d9efcc523e	8295	Tržišče
00050000-5671-7d9a-bc75-5d72fa5bac98	1311	Turjak
00050000-5671-7d9a-3996-06e330a9698d	9224	Turnišče
00050000-5671-7d9a-f7ae-41297882cff5	8323	Uršna sela
00050000-5671-7d9a-e84a-901c0e5277cd	1252	Vače
00050000-5671-7d9a-d1e6-bb8820c4cd62	3320	Velenje 
00050000-5671-7d9a-eddc-df69ce327d04	3322	Velenje - poštni predali
00050000-5671-7d9a-3f9e-24ea228e7eb2	8212	Velika Loka
00050000-5671-7d9a-2cd7-58305b98b7a3	2274	Velika Nedelja
00050000-5671-7d9a-0641-bb282a36579b	9225	Velika Polana
00050000-5671-7d9a-49be-d6629aac82fc	1315	Velike Lašče
00050000-5671-7d9a-97e1-3464737c6a1d	8213	Veliki Gaber
00050000-5671-7d9a-c991-47e0a5a816c2	9241	Veržej
00050000-5671-7d9a-be9d-22594214b3a6	1312	Videm - Dobrepolje
00050000-5671-7d9a-2d0d-2e3c50e7be17	2284	Videm pri Ptuju
00050000-5671-7d9a-d9bf-9c816304ee4b	8344	Vinica
00050000-5671-7d9a-ffed-f61fd2ca96e2	5271	Vipava
00050000-5671-7d9a-8820-eacc21d2ceaf	4212	Visoko
00050000-5671-7d9a-aca3-1ffb4a0a9543	1294	Višnja Gora
00050000-5671-7d9a-f6e4-cefecc845953	3205	Vitanje
00050000-5671-7d9a-fdee-8ac577e520c2	2255	Vitomarci
00050000-5671-7d9a-cab8-8cc4696eb543	1217	Vodice
00050000-5671-7d9a-202a-8f6ccea71f7a	3212	Vojnik\t
00050000-5671-7d9a-fe23-407d30d8ab0f	5293	Volčja Draga
00050000-5671-7d9a-c360-3dc9d42ad6fb	2232	Voličina
00050000-5671-7d9a-899e-76e70da434c6	3305	Vransko
00050000-5671-7d9a-84bd-0b7afc7c75b8	6217	Vremski Britof
00050000-5671-7d9a-be9b-896a655908bb	1360	Vrhnika
00050000-5671-7d9a-ed5b-4e9af663c8cd	2365	Vuhred
00050000-5671-7d9a-d854-f0ce6d1802a2	2367	Vuzenica
00050000-5671-7d9a-75e8-4eb65334fc57	8292	Zabukovje 
00050000-5671-7d9a-c401-76fab0c13590	1410	Zagorje ob Savi
00050000-5671-7d9a-d313-37435dee9a9b	1303	Zagradec
00050000-5671-7d9a-70e7-fcb737843cee	2283	Zavrč
00050000-5671-7d9a-26be-b90ef5f7611f	8272	Zdole 
00050000-5671-7d9a-8b8b-b90112616be6	4201	Zgornja Besnica
00050000-5671-7d9a-08d0-eae4cae261a1	2242	Zgornja Korena
00050000-5671-7d9a-cabc-44bad6b5681e	2201	Zgornja Kungota
00050000-5671-7d9a-cd94-fa13b88d5b7a	2316	Zgornja Ložnica
00050000-5671-7d9a-95d9-3639769bfa80	2314	Zgornja Polskava
00050000-5671-7d9a-fa2a-cc569b7a6016	2213	Zgornja Velka
00050000-5671-7d9a-0044-d3e1d7f1e126	4247	Zgornje Gorje
00050000-5671-7d9a-7b90-e03aa89a8dfd	4206	Zgornje Jezersko
00050000-5671-7d9a-2d00-2f74efc93013	2285	Zgornji Leskovec
00050000-5671-7d9a-e09b-ef0f9a572694	1432	Zidani Most
00050000-5671-7d9a-7bd0-0cc71b25bb90	3214	Zreče
00050000-5671-7d9a-cc35-d77a52ba151c	4209	Žabnica
00050000-5671-7d9a-235a-23e5aff25540	3310	Žalec
00050000-5671-7d9a-34f6-c48b0e40d47a	4228	Železniki
00050000-5671-7d9a-754d-da34d48d059d	2287	Žetale
00050000-5671-7d9a-b6a3-867796f8d27d	4226	Žiri
00050000-5671-7d9a-3a22-158777cf5227	4274	Žirovnica
00050000-5671-7d9a-880a-8d49443baadf	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32466786)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32466350)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32466098)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5671-7d9e-fa90-c2a0e096cc07	00080000-5671-7d9e-eb88-0b15f2b5c568	\N	00040000-5671-7d9b-2fde-305cdfe5155e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5671-7d9e-2f63-93821fef1931	00080000-5671-7d9e-eb88-0b15f2b5c568	\N	00040000-5671-7d9b-2fde-305cdfe5155e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5671-7d9e-cc39-c5986bcc0429	00080000-5671-7d9e-b045-d6186ec739e6	\N	00040000-5671-7d9b-2fde-305cdfe5155e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32466242)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5671-7d9b-5512-552576120bb3	novo leto	1	1	\N	t
00430000-5671-7d9b-84be-30c74e1d00c9	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5671-7d9b-215b-7854cd013e24	dan upora proti okupatorju	27	4	\N	t
00430000-5671-7d9b-6528-6627a186ff3c	praznik dela	1	5	\N	t
00430000-5671-7d9b-5c2f-bed7eefe230f	praznik dela	2	5	\N	t
00430000-5671-7d9b-67af-b6b908bada98	dan Primoža Trubarja	8	6	\N	f
00430000-5671-7d9b-4333-65290f0ea990	dan državnosti	25	6	\N	t
00430000-5671-7d9b-cb49-dbefd3998216	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5671-7d9b-e59e-4825c0fbb48b	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5671-7d9b-6bb6-4d873be20f64	dan suverenosti	25	10	\N	f
00430000-5671-7d9b-d907-159e196ed443	dan spomina na mrtve	1	11	\N	t
00430000-5671-7d9b-91cb-7cb8da166836	dan Rudolfa Maistra	23	11	\N	f
00430000-5671-7d9b-a801-054cf5f6fe14	božič	25	12	\N	t
00430000-5671-7d9b-6639-fe7caff5345c	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5671-7d9b-6b8c-ea60c2197935	Marijino vnebovzetje	15	8	\N	t
00430000-5671-7d9b-ca37-26c0f1c4f46e	dan reformacije	31	10	\N	t
00430000-5671-7d9b-dc29-8b49b959d7d2	velikonočna nedelja	27	3	2016	t
00430000-5671-7d9b-98fe-897c6f1ba665	velikonočna nedelja	16	4	2017	t
00430000-5671-7d9b-f3df-19157b83f099	velikonočna nedelja	1	4	2018	t
00430000-5671-7d9b-9c73-fd427dbc46e1	velikonočna nedelja	21	4	2019	t
00430000-5671-7d9b-2d65-655dcce11e71	velikonočna nedelja	12	4	2020	t
00430000-5671-7d9b-dbfa-5aadd02f090c	velikonočna nedelja	4	4	2021	t
00430000-5671-7d9b-c9e2-666815370e65	velikonočna nedelja	17	4	2022	t
00430000-5671-7d9b-eeaf-9c5587e49ee9	velikonočna nedelja	9	4	2023	t
00430000-5671-7d9b-141c-385851060ba3	velikonočna nedelja	31	3	2024	t
00430000-5671-7d9b-9ebe-618a0aeab868	velikonočna nedelja	20	4	2025	t
00430000-5671-7d9b-54bd-0d5c8830cbd6	velikonočna nedelja	5	4	2026	t
00430000-5671-7d9b-7a48-dbd9fac49f7b	velikonočna nedelja	28	3	2027	t
00430000-5671-7d9b-19fe-f454d61e836d	velikonočna nedelja	16	4	2028	t
00430000-5671-7d9b-82cf-37681ac5e975	velikonočna nedelja	1	4	2029	t
00430000-5671-7d9b-5540-0aefacb0ce7b	velikonočna nedelja	21	4	2030	t
00430000-5671-7d9b-abfb-92f62b687645	velikonočni ponedeljek	28	3	2016	t
00430000-5671-7d9b-1a33-15e46a5ddfe7	velikonočni ponedeljek	17	4	2017	t
00430000-5671-7d9b-6c58-eff6ea39c58c	velikonočni ponedeljek	2	4	2018	t
00430000-5671-7d9b-2239-df26bbd99342	velikonočni ponedeljek	22	4	2019	t
00430000-5671-7d9b-e0f0-84cb4fa046c7	velikonočni ponedeljek	13	4	2020	t
00430000-5671-7d9b-f1fd-e5b03d90fd84	velikonočni ponedeljek	5	4	2021	t
00430000-5671-7d9b-ee22-75c5a64d9808	velikonočni ponedeljek	18	4	2022	t
00430000-5671-7d9b-2f28-4803e1a59a40	velikonočni ponedeljek	10	4	2023	t
00430000-5671-7d9b-29a9-000c3492ebaf	velikonočni ponedeljek	1	4	2024	t
00430000-5671-7d9b-678c-f8f5320d6bcb	velikonočni ponedeljek	21	4	2025	t
00430000-5671-7d9b-ce37-3050441b5971	velikonočni ponedeljek	6	4	2026	t
00430000-5671-7d9b-680e-8f7ec1962505	velikonočni ponedeljek	29	3	2027	t
00430000-5671-7d9b-8893-3d9328d9e76f	velikonočni ponedeljek	17	4	2028	t
00430000-5671-7d9b-c251-f9d183c2beaa	velikonočni ponedeljek	2	4	2029	t
00430000-5671-7d9b-ea4f-c0c225ef8e90	velikonočni ponedeljek	22	4	2030	t
00430000-5671-7d9b-4ef5-6061b9f16949	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5671-7d9b-52b0-4e44466aa36c	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5671-7d9b-a814-3d6b4517a31b	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5671-7d9b-3f3f-004a9f63d79c	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5671-7d9b-e575-e2ecb7599697	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5671-7d9b-b719-8d12a014122b	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5671-7d9b-4784-0fce45bbf887	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5671-7d9b-879c-1267887c10e0	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5671-7d9b-078f-1f8c3cac09cb	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5671-7d9b-2dd9-ce7c1f0785f1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5671-7d9b-8ca6-ba6e466aeb57	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5671-7d9b-9e93-36f7b5498ff0	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5671-7d9b-639a-e6194c2f7700	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5671-7d9b-9f5c-5b1c3b9f22b1	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5671-7d9b-3fa1-0881af735f38	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32466202)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32466214)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32466362)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32466800)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32466810)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5671-7d9e-890e-e26937c84628	00080000-5671-7d9e-e06d-8cdac6edfee9	0987	AK
00190000-5671-7d9e-b76c-978fad2f09c3	00080000-5671-7d9e-b045-d6186ec739e6	0989	AK
00190000-5671-7d9e-ca2d-2b83e458ccdb	00080000-5671-7d9e-073f-e19f0e554b2a	0986	AK
00190000-5671-7d9e-9781-628d4a0f459d	00080000-5671-7d9e-d69b-a0310bdbc2ea	0984	AK
00190000-5671-7d9e-09ec-cf2a15e8dee7	00080000-5671-7d9e-4298-4ee9bba700c1	0983	AK
00190000-5671-7d9e-80ae-754b32a76109	00080000-5671-7d9e-bfa7-d9e22ba3dfb4	0982	AK
00190000-5671-7da0-b2ae-4bd22e4ca7fa	00080000-5671-7da0-b4e0-c806a04f5230	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32466699)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5671-7d9f-c2d2-a1ab14ee1124	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32466818)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32466391)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5671-7d9d-7102-e49138c1f038	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5671-7d9d-271a-50679c80d093	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5671-7d9d-1bad-50d1d0107415	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5671-7d9d-16fd-ff4b2db368b1	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5671-7d9d-7f8a-e07b834a6592	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5671-7d9d-d6b3-c6ace11a8c86	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5671-7d9d-1dd7-6bf9118f144b	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32466335)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32466325)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32466537)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32466467)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32466176)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32465938)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5671-7da0-b4e0-c806a04f5230	00010000-5671-7d9c-08c3-826b9d9d2af4	2015-12-16 16:05:04	INS	a:0:{}
2	App\\Entity\\Option	00000000-5671-7da0-0d17-5e78f3f91912	00010000-5671-7d9c-08c3-826b9d9d2af4	2015-12-16 16:05:04	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5671-7da0-b2ae-4bd22e4ca7fa	00010000-5671-7d9c-08c3-826b9d9d2af4	2015-12-16 16:05:04	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32466404)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32465976)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5671-7d9b-4457-a91a66932e47	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5671-7d9b-c9c9-934f23e780d9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5671-7d9b-5603-eb36222d3b1e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5671-7d9b-ceb7-635ff20fdc70	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5671-7d9b-d0bc-616cd9f5b545	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5671-7d9b-a427-754916c2cc32	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5671-7d9b-440e-f96b77e5c837	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5671-7d9b-8ec1-7f41607265ef	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5671-7d9b-da52-eb055dffd6f7	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5671-7d9b-bc65-4d3313e5444b	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5671-7d9b-f300-55359ee50ac2	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5671-7d9b-6c85-53fea8cafcb3	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5671-7d9b-f629-1ad46c6b6598	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5671-7d9b-e4c9-8ac4316ec890	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5671-7d9b-3fd3-ae4f58180afe	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5671-7d9b-9d8a-46c4c7cbd4bb	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5671-7d9b-f259-664228ea3bb9	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5671-7d9b-8100-4bac6efaf033	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5671-7d9b-5c38-e4c4108685b5	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5671-7d9b-e0bb-4cf135e6dd65	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5671-7d9b-f48c-bc40d57bf424	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5671-7d9b-f571-1fc79ed416b3	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5671-7d9b-ce67-3dfa81305c11	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5671-7d9b-d2a3-88f719f8ae1c	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5671-7d9b-491e-7df27b819c87	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5671-7d9b-6e30-eac73abf1786	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5671-7d9b-3395-bd3b19a7d269	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5671-7d9b-6703-c9599b147794	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5671-7d9b-2491-32b4e595448a	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5671-7d9b-3e30-225aaa3cf75c	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5671-7d9b-79da-df525dd0f3bd	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5671-7d9b-8f9c-4ca46a4bb08b	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5671-7d9b-6567-cef11e140a16	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5671-7d9b-2dd3-f8f47e117657	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5671-7d9b-c810-6e19790620b4	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5671-7d9b-7a1f-48aa7b07acf5	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5671-7d9b-03c0-85a8c0abc22a	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5671-7d9b-d334-f7f3487e73ca	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5671-7d9b-a5f9-5655ca82677d	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5671-7d9b-59e0-b3fd16c7f938	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5671-7d9b-1ef2-25f7e921d1d0	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5671-7d9b-2051-fd05f0e69ff2	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5671-7d9b-394c-0070418f14ad	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5671-7d9b-7604-273e0b328548	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5671-7d9b-321d-5e19ca0bb860	direktor	minimalne pravice za direktorja	t
00020000-5671-7d9b-be56-cc29916f02a2	arhivar	arhivar	t
00020000-5671-7d9b-c0dc-bf9892191845	dramaturg	dramaturg	t
00020000-5671-7d9b-8ff4-706028a388b4	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5671-7d9b-5b99-1a2f2b87914c	poslovni-sekretar	poslovni sekretar	t
00020000-5671-7d9b-abf4-5af6d0802b6e	vodja-tehnike	vodja tehnike	t
00020000-5671-7d9b-31f0-af8478b1b0b9	racunovodja	računovodja	t
00020000-5671-7d9e-d8ea-0071a04f1f52	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5671-7d9e-8cb5-fe7fcaacd926	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-2f1c-cfa4e066069e	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-9b24-c28036363e3e	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-a11f-054d00254055	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-4f18-6ef29818e5f0	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-ecf2-7768108bacd7	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-08a7-8b8f3e07c806	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-afaf-360aa65939f4	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-9fd1-d877011215bd	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-beb2-5587a3c11a38	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-6dfc-6b67c383b810	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-8dc5-4db96dd78730	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-960a-f040b07813c8	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-2816-07db1af1221a	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-ac25-01af787a5859	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-d28a-ba35ab621665	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-cb3a-8a1eb33a8636	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-13b3-911ffb59938e	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-b86c-926c9a876c5c	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5671-7d9e-9221-9dcbdec95feb	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-c33b-d9225158a07c	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-ea9e-dd51350ad3d3	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-1ce1-7d5ad460b970	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-11d6-b439a5e02ae9	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-1abe-e8bc69eb9b23	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-3cac-e2dafa2107cc	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-3fee-98ff242b51e4	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-9153-55032581ea60	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-275e-d7035afb8824	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-31dc-65f57c3010b6	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-0c41-ae999bd47072	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-291c-a8d4b71312f4	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-b672-836d54a0cabe	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-cd46-4d480b2e1d88	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-1208-d8c08492af33	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-06e3-aa4bffcddac8	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-a98d-f042db99e136	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5671-7d9e-f4bc-66cd879fbfb5	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32465960)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5671-7d9c-0d39-36e5093ccc49	00020000-5671-7d9b-5603-eb36222d3b1e
00010000-5671-7d9c-08c3-826b9d9d2af4	00020000-5671-7d9b-5603-eb36222d3b1e
00010000-5671-7d9e-15be-2957b48e6a45	00020000-5671-7d9e-d8ea-0071a04f1f52
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-8cb5-fe7fcaacd926
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-4f18-6ef29818e5f0
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-9fd1-d877011215bd
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-6dfc-6b67c383b810
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-960a-f040b07813c8
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-13b3-911ffb59938e
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-9b24-c28036363e3e
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-9221-9dcbdec95feb
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-1ce1-7d5ad460b970
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-1abe-e8bc69eb9b23
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-3fee-98ff242b51e4
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-275e-d7035afb8824
00010000-5671-7d9e-108f-9a3453655817	00020000-5671-7d9e-b672-836d54a0cabe
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-8cb5-fe7fcaacd926
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-2f1c-cfa4e066069e
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-9b24-c28036363e3e
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-a11f-054d00254055
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-960a-f040b07813c8
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-d28a-ba35ab621665
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-9221-9dcbdec95feb
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-1ce1-7d5ad460b970
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-1abe-e8bc69eb9b23
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-3fee-98ff242b51e4
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-275e-d7035afb8824
00010000-5671-7d9e-ba1c-9a85e7a81a9f	00020000-5671-7d9e-b672-836d54a0cabe
00010000-5671-7d9e-fb9c-d37a2718f015	00020000-5671-7d9e-8cb5-fe7fcaacd926
00010000-5671-7d9e-fb9c-d37a2718f015	00020000-5671-7d9e-2f1c-cfa4e066069e
00010000-5671-7d9e-fb9c-d37a2718f015	00020000-5671-7d9e-9b24-c28036363e3e
00010000-5671-7d9e-fb9c-d37a2718f015	00020000-5671-7d9e-a11f-054d00254055
00010000-5671-7d9e-fb9c-d37a2718f015	00020000-5671-7d9e-6dfc-6b67c383b810
00010000-5671-7d9e-fb9c-d37a2718f015	00020000-5671-7d9e-960a-f040b07813c8
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-2f1c-cfa4e066069e
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-ecf2-7768108bacd7
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-beb2-5587a3c11a38
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-8dc5-4db96dd78730
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-6dfc-6b67c383b810
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-cb3a-8a1eb33a8636
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-960a-f040b07813c8
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-2816-07db1af1221a
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-9221-9dcbdec95feb
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-c33b-d9225158a07c
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-1ce1-7d5ad460b970
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-11d6-b439a5e02ae9
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-1abe-e8bc69eb9b23
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-3cac-e2dafa2107cc
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-3fee-98ff242b51e4
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-9153-55032581ea60
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-275e-d7035afb8824
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-31dc-65f57c3010b6
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-b672-836d54a0cabe
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-cd46-4d480b2e1d88
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-06e3-aa4bffcddac8
00010000-5671-7d9e-f8eb-36e894b84225	00020000-5671-7d9e-a98d-f042db99e136
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-2f1c-cfa4e066069e
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-ecf2-7768108bacd7
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-afaf-360aa65939f4
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-beb2-5587a3c11a38
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-8dc5-4db96dd78730
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-6dfc-6b67c383b810
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-cb3a-8a1eb33a8636
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-960a-f040b07813c8
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-2816-07db1af1221a
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-ac25-01af787a5859
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-9221-9dcbdec95feb
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-c33b-d9225158a07c
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-ea9e-dd51350ad3d3
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-1ce1-7d5ad460b970
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-11d6-b439a5e02ae9
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-1abe-e8bc69eb9b23
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-3cac-e2dafa2107cc
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-3fee-98ff242b51e4
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-9153-55032581ea60
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-275e-d7035afb8824
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-31dc-65f57c3010b6
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-b672-836d54a0cabe
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-cd46-4d480b2e1d88
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-1208-d8c08492af33
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-06e3-aa4bffcddac8
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-a98d-f042db99e136
00010000-5671-7d9e-9772-0522a9b7a23a	00020000-5671-7d9e-f4bc-66cd879fbfb5
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-2f1c-cfa4e066069e
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-9b24-c28036363e3e
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-ecf2-7768108bacd7
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-08a7-8b8f3e07c806
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-afaf-360aa65939f4
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-4f18-6ef29818e5f0
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-beb2-5587a3c11a38
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-8dc5-4db96dd78730
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-6dfc-6b67c383b810
00010000-5671-7d9e-b506-3e7b1eeb45bd	00020000-5671-7d9e-cb3a-8a1eb33a8636
00010000-5671-7d9e-44d5-1fad467a6188	00020000-5671-7d9e-8cb5-fe7fcaacd926
00010000-5671-7d9e-44d5-1fad467a6188	00020000-5671-7d9e-a11f-054d00254055
00010000-5671-7d9e-44d5-1fad467a6188	00020000-5671-7d9e-4f18-6ef29818e5f0
00010000-5671-7d9e-44d5-1fad467a6188	00020000-5671-7d9e-9fd1-d877011215bd
00010000-5671-7d9e-44d5-1fad467a6188	00020000-5671-7d9e-6dfc-6b67c383b810
00010000-5671-7d9e-44d5-1fad467a6188	00020000-5671-7d9e-960a-f040b07813c8
00010000-5671-7d9e-44d5-1fad467a6188	00020000-5671-7d9e-13b3-911ffb59938e
00010000-5671-7d9e-44d5-1fad467a6188	00020000-5671-7d9e-0c41-ae999bd47072
00010000-5671-7d9e-fed4-7768f1bb2f1a	00020000-5671-7d9e-b86c-926c9a876c5c
00010000-5671-7d9e-ec95-acda6ddf169d	00020000-5671-7d9b-321d-5e19ca0bb860
00010000-5671-7d9e-6dd2-9d572968c8b8	00020000-5671-7d9b-be56-cc29916f02a2
00010000-5671-7d9e-280d-09e89617c72c	00020000-5671-7d9b-c0dc-bf9892191845
00010000-5671-7d9e-fafe-6398870768f7	00020000-5671-7d9b-8ff4-706028a388b4
00010000-5671-7d9e-eb54-7bc3d31be36b	00020000-5671-7d9b-5b99-1a2f2b87914c
00010000-5671-7d9e-e314-5bc39be88b06	00020000-5671-7d9b-abf4-5af6d0802b6e
00010000-5671-7d9e-b76c-15c6d73ab6dc	00020000-5671-7d9b-31f0-af8478b1b0b9
\.


--
-- TOC entry 3157 (class 0 OID 32466418)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32466356)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32466302)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5671-7d9e-20ea-2f48d74b597b	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5671-7d9e-e634-1f5577209803	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5671-7d9e-b05d-195888fdd732	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32465925)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5671-7d9a-6101-db442dd09966	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5671-7d9a-e21b-883e5380cb6e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5671-7d9a-bbd8-4853b5ee194d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5671-7d9a-7c81-713b020b4303	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5671-7d9a-6e08-fc74f2724aaa	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32465917)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5671-7d9a-0c3c-e91ace89171a	00230000-5671-7d9a-7c81-713b020b4303	popa
00240000-5671-7d9a-fbb6-5a028096dee3	00230000-5671-7d9a-7c81-713b020b4303	oseba
00240000-5671-7d9a-2b1c-e45c2c3c56f8	00230000-5671-7d9a-7c81-713b020b4303	tippopa
00240000-5671-7d9a-3bf7-2e2ff98440ac	00230000-5671-7d9a-7c81-713b020b4303	organizacijskaenota
00240000-5671-7d9a-0021-8a2d8fdf8efb	00230000-5671-7d9a-7c81-713b020b4303	sezona
00240000-5671-7d9a-e53b-f88cb45df657	00230000-5671-7d9a-7c81-713b020b4303	tipvaje
00240000-5671-7d9a-233d-5dbfe22a32c5	00230000-5671-7d9a-e21b-883e5380cb6e	prostor
00240000-5671-7d9a-e359-5493ac5fc3b6	00230000-5671-7d9a-7c81-713b020b4303	besedilo
00240000-5671-7d9a-6217-794a1e694a3d	00230000-5671-7d9a-7c81-713b020b4303	uprizoritev
00240000-5671-7d9a-1840-25feeca09e4e	00230000-5671-7d9a-7c81-713b020b4303	funkcija
00240000-5671-7d9a-394f-1ea8fd32e4f1	00230000-5671-7d9a-7c81-713b020b4303	tipfunkcije
00240000-5671-7d9a-3d1d-5a7320e57804	00230000-5671-7d9a-7c81-713b020b4303	alternacija
00240000-5671-7d9a-ca6c-f1ce3b2e3437	00230000-5671-7d9a-6101-db442dd09966	pogodba
00240000-5671-7d9a-5153-b2cf07266da1	00230000-5671-7d9a-7c81-713b020b4303	zaposlitev
00240000-5671-7d9a-cad0-d7bc5e6392e2	00230000-5671-7d9a-7c81-713b020b4303	zvrstuprizoritve
00240000-5671-7d9a-07b8-600624430040	00230000-5671-7d9a-6101-db442dd09966	programdela
00240000-5671-7d9a-7020-88fca58c8f1a	00230000-5671-7d9a-7c81-713b020b4303	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32465912)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
4bc56b92-9999-4e99-9f48-8e16a948da22	00240000-5671-7d9a-0c3c-e91ace89171a	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32466484)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5671-7d9f-ec44-b8b1a42e5f5c	000e0000-5671-7d9e-62dd-c2174ca2483d	00080000-5671-7d9e-eb88-0b15f2b5c568	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5671-7d9b-4cd3-8fa0f566f20b
00270000-5671-7d9f-8dfd-27721a14415e	000e0000-5671-7d9e-62dd-c2174ca2483d	00080000-5671-7d9e-eb88-0b15f2b5c568	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5671-7d9b-4cd3-8fa0f566f20b
\.


--
-- TOC entry 3122 (class 0 OID 32466060)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32466312)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5671-7d9f-e78e-b0ecb9473148	00180000-5671-7d9f-c5ae-a123f1586b76	000c0000-5671-7d9f-b1ea-a0d22769a6a9	00090000-5671-7d9e-d94e-a52de9caa77a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-7d9f-2ac2-05723692198c	00180000-5671-7d9f-c5ae-a123f1586b76	000c0000-5671-7d9f-7042-5faeeb07f932	00090000-5671-7d9e-5783-636deba21687	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-7d9f-f918-484d7202272b	00180000-5671-7d9f-c5ae-a123f1586b76	000c0000-5671-7d9f-02bb-06e5933794bf	00090000-5671-7d9e-af3f-cb24fe1f68d0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-7d9f-509e-97954900ae74	00180000-5671-7d9f-c5ae-a123f1586b76	000c0000-5671-7d9f-e373-2b5d180261f9	00090000-5671-7d9e-8a48-98d66675b7c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-7d9f-93c7-bb3abca1ae8b	00180000-5671-7d9f-c5ae-a123f1586b76	000c0000-5671-7d9f-9ae6-3cfcb876b8db	00090000-5671-7d9e-8619-ed907e01a825	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5671-7d9f-7eae-211e5c171b4d	00180000-5671-7d9f-f055-df5b1f396019	\N	00090000-5671-7d9e-8619-ed907e01a825	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5671-7d9f-b356-32569283b45f	00180000-5671-7d9f-f055-df5b1f396019	\N	00090000-5671-7d9e-5783-636deba21687	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32466525)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5671-7d9a-28a3-12c4a9439dec	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5671-7d9a-c8a8-5f0fd8eba407	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5671-7d9a-bcb5-87c55e40a1b6	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5671-7d9a-4d81-14dbf5acf9f4	04	Režija	Režija	Režija	umetnik	30
000f0000-5671-7d9a-ec7a-aff68edb31c0	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5671-7d9a-a819-2da8e4302393	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5671-7d9a-7d98-ab2dfc2acad2	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5671-7d9a-680f-02c05e1e67e9	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5671-7d9a-859d-1ce4aa1a094f	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5671-7d9a-e77b-45b7226cad6f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5671-7d9a-918d-deb9d60d839d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5671-7d9a-1752-a1cbd3186dcb	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5671-7d9a-c05a-562da6f58e56	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5671-7d9a-1009-5919a0eb52a6	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5671-7d9a-eb6e-fd3fee23d07d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5671-7d9a-b79f-a54a1b20f766	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5671-7d9a-4627-8cd8c008268a	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5671-7d9a-c92d-df49631e21ce	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32466011)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5671-7d9d-649b-c1b90b0a72cd	0001	šola	osnovna ali srednja šola
00400000-5671-7d9d-b9ca-8a5ff7bf70db	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5671-7d9d-7525-c0d33d7786e9	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32466830)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5671-7d9a-b402-d206464f1f11	01	Velika predstava	f	1.00	1.00
002b0000-5671-7d9a-1a27-7223db7a723f	02	Mala predstava	f	0.50	0.50
002b0000-5671-7d9a-ad26-470c2de8f660	03	Mala koprodukcija	t	0.40	1.00
002b0000-5671-7d9a-08fb-2e32dd576a14	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5671-7d9a-3892-185bcd685bf7	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32466292)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5671-7d9a-8f92-2d9958c1d985	0001	prva vaja	prva vaja
00420000-5671-7d9a-9bb7-cb4a9b63e9b2	0002	tehnična vaja	tehnična vaja
00420000-5671-7d9a-a5d7-78b61e2ceb70	0003	lučna vaja	lučna vaja
00420000-5671-7d9a-53ce-86f48250c35d	0004	kostumska vaja	kostumska vaja
00420000-5671-7d9a-bb36-ab5d43b7fa39	0005	foto vaja	foto vaja
00420000-5671-7d9a-0e79-63d794f0a047	0006	1. glavna vaja	1. glavna vaja
00420000-5671-7d9a-5254-72d592e2dafb	0007	2. glavna vaja	2. glavna vaja
00420000-5671-7d9a-db19-e6c9409a56c0	0008	1. generalka	1. generalka
00420000-5671-7d9a-ec38-5a4c468de7fa	0009	2. generalka	2. generalka
00420000-5671-7d9a-60d3-0dff49327e81	0010	odprta generalka	odprta generalka
00420000-5671-7d9a-0500-abdaab4ea211	0011	obnovitvena vaja	obnovitvena vaja
00420000-5671-7d9a-812d-9d44b9ade08c	0012	italijanka	krajša "obnovitvena" vaja
00420000-5671-7d9a-3bd7-fe99460aac38	0013	pevska vaja	pevska vaja
00420000-5671-7d9a-df9a-1fb5a9ff5292	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5671-7d9a-01a6-37e490aeacc8	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32466133)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32465947)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5671-7d9c-08c3-826b9d9d2af4	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROOfwx0GxzEPsu79atdGRj/e2ljAzVaWS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-61d4-1e20363f3649	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-5b30-e4fa7fa9d310	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-762a-4b064ba6b302	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-fdd9-9782fcf0fd10	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-2869-973af83c054d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-f991-ea1d947986c1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-253d-54b6e830c5af	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-cbbe-4e511b59ddf1	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-cc6f-64f38017ec53	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-15be-2957b48e6a45	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-4eb1-ccb11072f62c	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-108f-9a3453655817	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-ba1c-9a85e7a81a9f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-fb9c-d37a2718f015	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-f8eb-36e894b84225	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-9772-0522a9b7a23a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-b506-3e7b1eeb45bd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-44d5-1fad467a6188	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-fed4-7768f1bb2f1a	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-ec95-acda6ddf169d	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-6dd2-9d572968c8b8	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-280d-09e89617c72c	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-fafe-6398870768f7	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-eb54-7bc3d31be36b	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-e314-5bc39be88b06	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5671-7d9e-b76c-15c6d73ab6dc	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5671-7d9c-0d39-36e5093ccc49	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32466575)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5671-7d9e-8972-fe83777f29da	00160000-5671-7d9d-a731-435804f6387f	\N	00140000-5671-7d9a-f911-1006d8113676	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5671-7d9d-7f8a-e07b834a6592
000e0000-5671-7d9e-62dd-c2174ca2483d	00160000-5671-7d9d-e2bb-eeb483af18e8	\N	00140000-5671-7d9a-558a-6f387fe0b1a8	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5671-7d9d-d6b3-c6ace11a8c86
000e0000-5671-7d9e-8fb5-60660b3c7be3	\N	\N	00140000-5671-7d9a-558a-6f387fe0b1a8	00190000-5671-7d9e-890e-e26937c84628	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5671-7d9d-7f8a-e07b834a6592
000e0000-5671-7d9e-cb7d-84f7a44fde0d	\N	\N	00140000-5671-7d9a-558a-6f387fe0b1a8	00190000-5671-7d9e-890e-e26937c84628	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5671-7d9d-7f8a-e07b834a6592
000e0000-5671-7d9e-85d5-a63af1ca67c8	\N	\N	00140000-5671-7d9a-558a-6f387fe0b1a8	00190000-5671-7d9e-890e-e26937c84628	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5671-7d9d-7102-e49138c1f038
000e0000-5671-7d9e-d030-b1da6081c604	\N	\N	00140000-5671-7d9a-558a-6f387fe0b1a8	00190000-5671-7d9e-890e-e26937c84628	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5671-7d9d-7102-e49138c1f038
\.


--
-- TOC entry 3136 (class 0 OID 32466232)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5671-7d9f-9327-65d3dd0edf52	\N	000e0000-5671-7d9e-62dd-c2174ca2483d	1	
00200000-5671-7d9f-73ec-3eca5d210a7c	\N	000e0000-5671-7d9e-62dd-c2174ca2483d	2	
00200000-5671-7d9f-49e9-2be383401b8f	\N	000e0000-5671-7d9e-62dd-c2174ca2483d	3	
00200000-5671-7d9f-dcb9-7c227fa864a3	\N	000e0000-5671-7d9e-62dd-c2174ca2483d	4	
00200000-5671-7d9f-b630-d0d809f59ea3	\N	000e0000-5671-7d9e-62dd-c2174ca2483d	5	
\.


--
-- TOC entry 3153 (class 0 OID 32466383)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32466498)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5671-7d9b-3b7a-27b7080e44fe	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5671-7d9b-8773-6e5e4d74373e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5671-7d9b-532e-4ad802cf5d91	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5671-7d9b-285c-e71d0f38eb62	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5671-7d9b-2db6-6db71a8415c6	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5671-7d9b-5e18-a6c8b1e06cd4	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5671-7d9b-e522-55c12c36ed87	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5671-7d9b-b0fe-7e9defb540bb	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5671-7d9b-4cd3-8fa0f566f20b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5671-7d9b-7119-189df30c4826	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5671-7d9b-9620-b2a3cd3a44f3	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5671-7d9b-fbaa-60ca25c8f009	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5671-7d9b-ffe1-702da28dbc94	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5671-7d9b-3739-9128a1b9cf9b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5671-7d9b-d186-7c93de7f7325	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5671-7d9b-de75-895f38a1ef93	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5671-7d9b-28aa-43c5c98e1633	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5671-7d9b-6674-1a93e0eae471	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5671-7d9b-60c3-f10d3f8b8c37	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5671-7d9b-0a50-28b5c77911b9	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5671-7d9b-7bde-14bfa1261172	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5671-7d9b-6cde-0aa46ccb975e	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5671-7d9b-6b57-d7568ae9516a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5671-7d9b-ea8c-024911bd2c50	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5671-7d9b-a990-460351adaaab	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5671-7d9b-2a05-f77d6c58aba1	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5671-7d9b-7006-789f93c250e2	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5671-7d9b-cd0d-a15c6750836f	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32466880)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32466849)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32466892)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32466456)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5671-7d9e-4bd2-0440b8e75fff	00090000-5671-7d9e-5783-636deba21687	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-7d9e-6ea9-204cf3054c88	00090000-5671-7d9e-af3f-cb24fe1f68d0	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-7d9e-2bbc-83fd95e17f38	00090000-5671-7d9e-146b-4350ad5fceb9	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-7d9e-39d8-fe69618e1b3e	00090000-5671-7d9e-7531-f6244842b02b	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-7d9e-b812-0c261e143d04	00090000-5671-7d9e-a964-a742f8249cb4	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5671-7d9e-8829-2402a50e485d	00090000-5671-7d9e-69af-f6ac24a20b23	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32466276)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32466565)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5671-7d9a-f911-1006d8113676	01	Drama	drama (SURS 01)
00140000-5671-7d9a-6788-279fccfd081e	02	Opera	opera (SURS 02)
00140000-5671-7d9a-a826-2e767bbd16ba	03	Balet	balet (SURS 03)
00140000-5671-7d9a-43df-895c3ffb5192	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5671-7d9a-c1fb-db3a6293781b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5671-7d9a-558a-6f387fe0b1a8	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5671-7d9a-dd6a-77c42c054fd7	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32466446)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32466010)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32466624)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32466614)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32466001)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32466481)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32466523)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32466933)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32466264)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32466286)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32466291)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32466847)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32466159)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32466693)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32466442)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32466230)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32466197)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32466173)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32466348)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32466910)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32466917)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32466941)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32153623)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 32466375)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32466131)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32466029)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32466093)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32466056)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32465990)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32465975)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32466381)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32466417)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32466560)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32466084)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32466119)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32466798)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32466354)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32466109)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32466249)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32466218)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32466210)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32466366)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32466807)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32466815)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32466785)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32466828)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32466399)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32466339)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32466330)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32466547)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32466474)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32466185)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32465946)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32466408)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32465964)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32465984)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32466426)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32466361)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32466310)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32465934)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32465922)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32465916)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32466494)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32466065)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32466321)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32466534)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32466018)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32466840)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32466299)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32466144)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32465959)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32466593)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32466239)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32466389)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32466506)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32466890)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32466874)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32466898)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32466464)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32466280)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32466573)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32466454)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32466274)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32466275)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32466273)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32466272)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32466271)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32466495)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32466496)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32466497)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32466912)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32466911)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32466086)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32466087)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32466382)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32466878)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32466877)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32466879)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32466876)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32466875)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32466368)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32466367)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32466240)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32466241)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32466443)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32466445)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32466444)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32466175)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32466174)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32466829)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32466562)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32466563)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32466564)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32466899)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32466598)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32466595)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32466599)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32466597)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32466596)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32466146)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32466145)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32466059)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32466409)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32465991)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32465992)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32466429)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32466428)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32466427)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32466096)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32466095)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32466097)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32466213)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32466211)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32466212)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32465924)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32466334)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32466332)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32466331)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32466333)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32465965)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32465966)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32466390)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32466934)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32466483)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32466482)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32466942)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32466943)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32466355)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32466475)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32466476)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32466698)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32466697)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32466694)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32466695)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32466696)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32466111)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32466110)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32466112)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32466403)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32466402)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32466808)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32466809)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32466628)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32466629)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32466626)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32466627)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32466465)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32466466)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32466343)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32466342)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32466340)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32466341)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32466616)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32466615)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32466186)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32466200)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32466199)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32466198)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32466201)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32466231)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32466219)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32466220)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32466799)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32466848)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32466918)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32466919)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32466031)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32466030)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32466066)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32466067)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32466281)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32466324)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32466323)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32466322)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32466266)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32466267)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32466270)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32466265)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32466269)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32466268)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32466085)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32466019)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32466020)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32466160)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32466162)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32466161)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32466163)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32466349)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32466561)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32466594)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32466535)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32466536)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32466057)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32466058)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32466455)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32465935)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32466132)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32466094)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32465923)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32466841)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32466401)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32466400)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32466300)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32466301)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32466625)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32466120)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32466574)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32466891)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32466816)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32466817)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32466524)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32466311)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32465985)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2917 (class 2606 OID 32467114)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2918 (class 2606 OID 32467119)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2923 (class 2606 OID 32467144)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2921 (class 2606 OID 32467134)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2916 (class 2606 OID 32467109)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2920 (class 2606 OID 32467129)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2922 (class 2606 OID 32467139)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2919 (class 2606 OID 32467124)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2957 (class 2606 OID 32467314)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32467319)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2959 (class 2606 OID 32467324)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 32467489)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2991 (class 2606 OID 32467484)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2894 (class 2606 OID 32466999)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2895 (class 2606 OID 32467004)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32467229)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2988 (class 2606 OID 32467469)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32467464)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2989 (class 2606 OID 32467474)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2986 (class 2606 OID 32467459)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2985 (class 2606 OID 32467454)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2939 (class 2606 OID 32467224)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2938 (class 2606 OID 32467219)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2914 (class 2606 OID 32467099)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2915 (class 2606 OID 32467104)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32467269)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32467279)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32467274)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2905 (class 2606 OID 32467054)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 32467049)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32467209)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32467444)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2960 (class 2606 OID 32467329)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32467334)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 32467339)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32467479)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2966 (class 2606 OID 32467359)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2963 (class 2606 OID 32467344)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2967 (class 2606 OID 32467364)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32467354)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2964 (class 2606 OID 32467349)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2903 (class 2606 OID 32467044)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2902 (class 2606 OID 32467039)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2891 (class 2606 OID 32466984)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2890 (class 2606 OID 32466979)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32467249)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2886 (class 2606 OID 32466959)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2887 (class 2606 OID 32466964)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2947 (class 2606 OID 32467264)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32467259)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2945 (class 2606 OID 32467254)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32467014)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2896 (class 2606 OID 32467009)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2898 (class 2606 OID 32467019)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2910 (class 2606 OID 32467079)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 32467069)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32467074)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32466944)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2931 (class 2606 OID 32467184)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2929 (class 2606 OID 32467174)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2928 (class 2606 OID 32467169)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2930 (class 2606 OID 32467179)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2884 (class 2606 OID 32466949)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2885 (class 2606 OID 32466954)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32467234)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32467504)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2956 (class 2606 OID 32467309)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 32467304)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2996 (class 2606 OID 32467509)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2997 (class 2606 OID 32467514)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32467214)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2953 (class 2606 OID 32467294)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2954 (class 2606 OID 32467299)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 32467419)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 32467414)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 32467399)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 32467404)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32467409)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32467029)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 32467024)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2901 (class 2606 OID 32467034)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2943 (class 2606 OID 32467244)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2942 (class 2606 OID 32467239)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 32467429)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 32467434)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2972 (class 2606 OID 32467389)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 32467394)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2970 (class 2606 OID 32467379)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2971 (class 2606 OID 32467384)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2951 (class 2606 OID 32467284)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2952 (class 2606 OID 32467289)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2935 (class 2606 OID 32467204)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2934 (class 2606 OID 32467199)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2932 (class 2606 OID 32467189)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2933 (class 2606 OID 32467194)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2969 (class 2606 OID 32467374)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2968 (class 2606 OID 32467369)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32467059)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32467064)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32467094)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2911 (class 2606 OID 32467084)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2912 (class 2606 OID 32467089)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32467424)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32467439)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32467449)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2993 (class 2606 OID 32467494)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2994 (class 2606 OID 32467499)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2889 (class 2606 OID 32466974)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 32466969)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2892 (class 2606 OID 32466989)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 32466994)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32467149)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 32467164)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32467159)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2925 (class 2606 OID 32467154)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-16 16:05:06 CET

--
-- PostgreSQL database dump complete
--

