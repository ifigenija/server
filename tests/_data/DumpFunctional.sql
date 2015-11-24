--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-24 10:57:12 CET

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
-- TOC entry 183 (class 1259 OID 29354039)
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
-- TOC entry 237 (class 1259 OID 29354653)
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
-- TOC entry 236 (class 1259 OID 29354636)
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
-- TOC entry 182 (class 1259 OID 29354032)
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
-- TOC entry 181 (class 1259 OID 29354030)
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
-- TOC entry 227 (class 1259 OID 29354513)
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
-- TOC entry 230 (class 1259 OID 29354543)
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
-- TOC entry 251 (class 1259 OID 29354944)
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
-- TOC entry 203 (class 1259 OID 29354287)
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
-- TOC entry 205 (class 1259 OID 29354319)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 29354324)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 29354866)
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
-- TOC entry 194 (class 1259 OID 29354184)
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
-- TOC entry 238 (class 1259 OID 29354666)
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
-- TOC entry 223 (class 1259 OID 29354467)
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
-- TOC entry 200 (class 1259 OID 29354258)
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
-- TOC entry 197 (class 1259 OID 29354224)
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
-- TOC entry 195 (class 1259 OID 29354201)
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
-- TOC entry 212 (class 1259 OID 29354381)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 29354924)
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
-- TOC entry 250 (class 1259 OID 29354937)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 29354959)
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
-- TOC entry 216 (class 1259 OID 29354406)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 29354158)
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
-- TOC entry 185 (class 1259 OID 29354058)
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
-- TOC entry 189 (class 1259 OID 29354125)
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
-- TOC entry 186 (class 1259 OID 29354069)
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
-- TOC entry 178 (class 1259 OID 29354004)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 29354023)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 29354413)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 29354447)
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
-- TOC entry 233 (class 1259 OID 29354584)
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
-- TOC entry 188 (class 1259 OID 29354105)
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
-- TOC entry 191 (class 1259 OID 29354150)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 29354811)
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
-- TOC entry 213 (class 1259 OID 29354387)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 29354135)
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
-- TOC entry 202 (class 1259 OID 29354279)
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
-- TOC entry 198 (class 1259 OID 29354239)
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
-- TOC entry 199 (class 1259 OID 29354251)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 29354399)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 29354825)
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
-- TOC entry 242 (class 1259 OID 29354835)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 29354734)
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
-- TOC entry 243 (class 1259 OID 29354843)
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
-- TOC entry 219 (class 1259 OID 29354428)
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
-- TOC entry 211 (class 1259 OID 29354372)
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
-- TOC entry 210 (class 1259 OID 29354362)
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
-- TOC entry 232 (class 1259 OID 29354573)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 29354503)
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
-- TOC entry 196 (class 1259 OID 29354213)
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
-- TOC entry 175 (class 1259 OID 29353975)
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
-- TOC entry 174 (class 1259 OID 29353973)
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
-- TOC entry 220 (class 1259 OID 29354441)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 29354013)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 29353997)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 29354455)
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
-- TOC entry 214 (class 1259 OID 29354393)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 29354339)
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
-- TOC entry 173 (class 1259 OID 29353962)
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
-- TOC entry 172 (class 1259 OID 29353954)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 29353949)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 29354520)
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
-- TOC entry 187 (class 1259 OID 29354097)
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
-- TOC entry 209 (class 1259 OID 29354349)
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
-- TOC entry 231 (class 1259 OID 29354561)
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
-- TOC entry 184 (class 1259 OID 29354048)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 29354854)
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
-- TOC entry 207 (class 1259 OID 29354329)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 29354170)
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
-- TOC entry 176 (class 1259 OID 29353984)
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
-- TOC entry 235 (class 1259 OID 29354611)
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
-- TOC entry 201 (class 1259 OID 29354269)
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
-- TOC entry 218 (class 1259 OID 29354420)
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
-- TOC entry 229 (class 1259 OID 29354534)
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
-- TOC entry 247 (class 1259 OID 29354904)
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
-- TOC entry 246 (class 1259 OID 29354873)
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
-- TOC entry 248 (class 1259 OID 29354916)
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
-- TOC entry 225 (class 1259 OID 29354492)
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
-- TOC entry 204 (class 1259 OID 29354313)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 29354601)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 29354482)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 29354035)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 29353978)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 29354039)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5654-3474-e519-f78478e78513	10	30	Otroci	Abonma za otroke	200
000a0000-5654-3474-3361-2ca67dceb34c	20	60	Mladina	Abonma za mladino	400
000a0000-5654-3474-018b-2dbb19682f5b	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 29354653)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5654-3475-0a3d-3ec9c9c7c765	000d0000-5654-3475-83ac-d7b229ad2671	\N	00090000-5654-3475-d09c-fc3c39f915f2	000b0000-5654-3475-b8bd-43ee5b9a51b5	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5654-3475-cd5f-c7494b55ffd6	000d0000-5654-3475-5816-902b0acf3892	00100000-5654-3475-3c72-4d87cb5698d2	00090000-5654-3475-ed05-790341b5caab	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5654-3475-2e45-9348703c9ec6	000d0000-5654-3475-44bd-d5e5ead4a3fc	00100000-5654-3475-7856-1c48a7af8912	00090000-5654-3475-75c1-f0ca5d425cb4	\N	0003	t	\N	2015-11-24	\N	2	t	\N	f	f
000c0000-5654-3475-2bcd-a69a01591a19	000d0000-5654-3475-f8c9-6a1ba51df292	\N	00090000-5654-3475-6efd-6f6109b0f831	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5654-3475-3f0e-b47600bf617d	000d0000-5654-3475-b16c-96dfc80d780a	\N	00090000-5654-3475-9d51-7383f1e6cce6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5654-3475-0f84-c7d0683ebbaa	000d0000-5654-3475-2f85-8dc88970ef09	\N	00090000-5654-3475-5349-7c013d2228d8	000b0000-5654-3475-c129-4f7322b2c9e7	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5654-3475-29b4-2d4eb9d11229	000d0000-5654-3475-a01e-af968d2b1b13	00100000-5654-3475-a88b-077abd516aff	00090000-5654-3475-fcc0-086332ff0c07	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5654-3475-2cbb-1e18e552b601	000d0000-5654-3475-96e2-9318144b0e24	\N	00090000-5654-3475-589e-dfb0bae4cce9	000b0000-5654-3475-cfa7-fa71770684f3	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5654-3475-b3a1-0dad30052c68	000d0000-5654-3475-a01e-af968d2b1b13	00100000-5654-3475-883a-bfd53dcb4b92	00090000-5654-3475-e8c4-40c8289efa28	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5654-3475-0829-78d31635d648	000d0000-5654-3475-a01e-af968d2b1b13	00100000-5654-3475-d06b-9f82464aa364	00090000-5654-3475-6f7d-1de6ecbfff92	\N	0010	t	\N	2015-11-24	\N	16	f	\N	f	t
000c0000-5654-3475-8a70-f6637d8b133c	000d0000-5654-3475-a01e-af968d2b1b13	00100000-5654-3475-2327-e4f0529d97ec	00090000-5654-3475-bf5f-e2a644cac05d	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5654-3475-150c-05072d2f8e60	000d0000-5654-3475-6b14-3f41cbae924c	00100000-5654-3475-3c72-4d87cb5698d2	00090000-5654-3475-ed05-790341b5caab	000b0000-5654-3475-df23-234ad0274b6a	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 29354636)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 29354032)
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
-- TOC entry 3149 (class 0 OID 29354513)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5654-3475-12a4-ec5c791bb934	00160000-5654-3474-640f-9a30d2b4c693	00090000-5654-3475-5c05-cf1747a24a83	aizv	10	t
003d0000-5654-3475-d21a-3e65452ed1e2	00160000-5654-3474-640f-9a30d2b4c693	00090000-5654-3475-122d-3985b60bf431	apri	14	t
003d0000-5654-3475-2a3d-fc37a02f49c6	00160000-5654-3474-7e61-c8f76fd77ceb	00090000-5654-3475-bc17-467630eadae1	aizv	11	t
003d0000-5654-3475-582d-cd3273a3f331	00160000-5654-3474-8dde-ca9d9f1391d6	00090000-5654-3475-4c81-bb714b0716c5	aizv	12	t
003d0000-5654-3475-e7f2-f12a929fcf43	00160000-5654-3474-640f-9a30d2b4c693	00090000-5654-3475-7226-95a7ca8c1447	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 29354543)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5654-3474-640f-9a30d2b4c693	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5654-3474-7e61-c8f76fd77ceb	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5654-3474-8dde-ca9d9f1391d6	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 29354944)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 29354287)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5654-3475-db00-7c6191497e6a	\N	\N	00200000-5654-3475-2131-1c2f9462b3bf	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5654-3475-7a4d-1bcd227e3d6c	\N	\N	00200000-5654-3475-9ea2-21e2b7bc92ed	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5654-3475-a663-9d73b81816ac	\N	\N	00200000-5654-3475-71b4-b8734f290ecd	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5654-3475-b1cb-7f63340831d6	\N	\N	00200000-5654-3475-66f5-eeb2447cc521	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5654-3475-3a3e-7e7deffe4583	\N	\N	00200000-5654-3475-28a3-d1971097fe2d	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 29354319)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 29354324)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 29354866)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 29354184)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5654-3472-34ed-8a3a01f927f2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5654-3472-27ef-2ac1523c35b2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5654-3472-a44f-8b867a33206a	AL	ALB	008	Albania 	Albanija	\N
00040000-5654-3472-ebeb-8bef85a920fb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5654-3472-9939-318b228ca296	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5654-3472-2ad2-bdd31a5d582b	AD	AND	020	Andorra 	Andora	\N
00040000-5654-3472-68e1-4f7af2db5189	AO	AGO	024	Angola 	Angola	\N
00040000-5654-3472-3813-f7e0feea44af	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5654-3472-b49b-7763cc0ba822	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5654-3472-bb5b-8215a72ad62f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5654-3472-d17b-a2c195c20398	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5654-3472-9f21-5db046b7f079	AM	ARM	051	Armenia 	Armenija	\N
00040000-5654-3472-69dc-dce47b838f75	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5654-3472-7b90-9b1da6d3f8a5	AU	AUS	036	Australia 	Avstralija	\N
00040000-5654-3472-8d76-723b818096c9	AT	AUT	040	Austria 	Avstrija	\N
00040000-5654-3472-df2a-5c4d16002b10	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5654-3472-5678-ce72177bf481	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5654-3472-54c1-c77986605db4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5654-3472-17d0-f3d60fe49e46	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5654-3472-e102-2ef6c177678d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5654-3472-7479-17f18b1a2a3c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5654-3472-17ca-3b78acdf3ab3	BE	BEL	056	Belgium 	Belgija	\N
00040000-5654-3472-89e2-f80da38bfd8c	BZ	BLZ	084	Belize 	Belize	\N
00040000-5654-3472-a405-7961d670b9e9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5654-3472-5727-f62e73483bb0	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5654-3472-96a4-b77af7160672	BT	BTN	064	Bhutan 	Butan	\N
00040000-5654-3472-a26d-9be5c8f24638	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5654-3472-be2e-a13f3dc23b9a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5654-3472-821c-5f410738458c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5654-3472-81cf-949f6afa41dc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5654-3472-29c2-b45e4ffaafd0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5654-3472-6473-3ec616af26ad	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5654-3472-659c-749ac73e4ba6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5654-3472-7443-6874a9c30bc6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5654-3472-b82b-e5e925276c85	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5654-3472-1df6-1cc96fa3d7aa	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5654-3472-238c-7c6e0dc52d52	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5654-3472-0eff-cceec65d7bc7	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5654-3472-e0e3-83956ac5c31a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5654-3472-2a2d-9c922145bc69	CA	CAN	124	Canada 	Kanada	\N
00040000-5654-3472-ed7e-a8f75181a1fe	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5654-3472-feac-0b55e3baeac4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5654-3472-e89f-05662dc4052c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5654-3472-f571-f5e17d72d268	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5654-3472-a6b5-4249d944e9e6	CL	CHL	152	Chile 	Čile	\N
00040000-5654-3472-1666-e1c047f192d4	CN	CHN	156	China 	Kitajska	\N
00040000-5654-3472-05e1-a9b915238df1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5654-3472-7903-aa28ab245de1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5654-3472-e68b-08ca239ebf4f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5654-3472-c472-422230fd88cc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5654-3472-a274-e4da9874e4b0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5654-3472-463e-efa89ed5beaa	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5654-3472-3251-85b36cb3bb3e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5654-3472-329b-a6c72d86bd5a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5654-3472-75eb-85204702a47a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5654-3472-8a7d-5895c88cca3e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5654-3472-46c8-b49c8a325c46	CU	CUB	192	Cuba 	Kuba	\N
00040000-5654-3472-de36-cc24a9da2264	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5654-3472-6341-2c5662ee527a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5654-3472-9a70-549c5ef45b29	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5654-3472-1e9d-7a45a6558c01	DK	DNK	208	Denmark 	Danska	\N
00040000-5654-3472-0d5a-b66a4d5c8596	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5654-3472-c411-89c56984a56f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5654-3472-9286-f7d39e20f53f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5654-3472-ed30-57648a54a834	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5654-3472-617d-95119db95ec4	EG	EGY	818	Egypt 	Egipt	\N
00040000-5654-3472-7071-cd53b8aa02c7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5654-3472-566e-47ac5f54e12f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5654-3472-162e-79d7abd0bb3f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5654-3472-156f-71f16230e12d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5654-3472-3fec-0415f77e4ce2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5654-3472-82f9-0a2b8da503a2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5654-3472-c605-a71111f51a95	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5654-3472-b80c-4c35cd3f7fa4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5654-3472-8b7e-be024e7b25eb	FI	FIN	246	Finland 	Finska	\N
00040000-5654-3472-7671-dee2d3ff4725	FR	FRA	250	France 	Francija	\N
00040000-5654-3472-8e52-ed4551219649	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5654-3472-8a9d-839c8d6b26ef	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5654-3472-1172-10efa248a5ad	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5654-3472-5f3a-77bdd2dd9ba1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5654-3472-bb56-2aff93eef377	GA	GAB	266	Gabon 	Gabon	\N
00040000-5654-3472-c507-92a7dbe17a85	GM	GMB	270	Gambia 	Gambija	\N
00040000-5654-3472-863a-f82ba352c982	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5654-3472-e081-d6e028c9d703	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5654-3472-fafc-085f0fa9152b	GH	GHA	288	Ghana 	Gana	\N
00040000-5654-3472-787c-84d58092c8dc	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5654-3472-4139-d173ad95701d	GR	GRC	300	Greece 	Grčija	\N
00040000-5654-3472-3bc5-295629c98a47	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5654-3472-1998-1e419fba2f46	GD	GRD	308	Grenada 	Grenada	\N
00040000-5654-3472-d43f-3ae5b06d94af	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5654-3472-f966-07c4c4c4c240	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5654-3472-7937-c8d8c3461b96	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5654-3472-434f-83075b75c776	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5654-3472-d803-b9be6d665869	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5654-3472-79f8-176d65e3aa8d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5654-3472-0cbe-a5e8a4f9384f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5654-3472-e9fa-61c95b208760	HT	HTI	332	Haiti 	Haiti	\N
00040000-5654-3472-b6a0-8a26cb68e6d8	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5654-3472-18f1-8f3cff6ddaf5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5654-3472-c8b9-b16e1e239cdb	HN	HND	340	Honduras 	Honduras	\N
00040000-5654-3472-3b24-2230edeadba5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5654-3472-bc87-23d731f96e4f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5654-3472-a85c-6b1dceaa2bb2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5654-3472-8c81-c8fed1756e1a	IN	IND	356	India 	Indija	\N
00040000-5654-3472-0762-f89e4b76480a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5654-3472-0e8a-af29cbf62230	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5654-3472-19db-42f84d3cfe5e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5654-3472-bcd8-157b04e8b0ca	IE	IRL	372	Ireland 	Irska	\N
00040000-5654-3472-b881-3e2d33ea7b49	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5654-3472-97ac-eebe58271190	IL	ISR	376	Israel 	Izrael	\N
00040000-5654-3472-5244-ca5f5caf0ea0	IT	ITA	380	Italy 	Italija	\N
00040000-5654-3472-8763-96dc63830974	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5654-3472-08bd-e682fb0e71c4	JP	JPN	392	Japan 	Japonska	\N
00040000-5654-3472-c997-54bf58c41a3c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5654-3472-9e9b-6f5c939db4a4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5654-3472-bd27-894d70a85bbd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5654-3472-09d7-6932a7941222	KE	KEN	404	Kenya 	Kenija	\N
00040000-5654-3472-cdc0-e6077f889016	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5654-3472-6511-84cefa46525b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5654-3472-a633-352f9b749d9e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5654-3472-4c33-753dc612923f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5654-3472-6360-3bcea1feacd6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5654-3472-5bae-430790519e51	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5654-3472-50b2-084c7bd9c037	LV	LVA	428	Latvia 	Latvija	\N
00040000-5654-3472-73b9-a84011f76d2a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5654-3472-86cd-e0e750d56423	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5654-3472-e490-e948a5cb66c7	LR	LBR	430	Liberia 	Liberija	\N
00040000-5654-3472-a945-066a231aba4b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5654-3472-294c-0dc3a4b48c43	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5654-3472-a764-4c0351d8b4db	LT	LTU	440	Lithuania 	Litva	\N
00040000-5654-3472-3beb-c630d45693ff	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5654-3472-6b7b-b4ce40af7fca	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5654-3472-fc0b-b3d8f48a3b76	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5654-3472-6d08-5310a0b9269a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5654-3472-8af0-2ad7fd903052	MW	MWI	454	Malawi 	Malavi	\N
00040000-5654-3472-8da0-3d546afe36a7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5654-3472-9d07-f22a8d769b35	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5654-3472-6bbe-d06eb0c2fa85	ML	MLI	466	Mali 	Mali	\N
00040000-5654-3472-8db1-cb85f4c505dd	MT	MLT	470	Malta 	Malta	\N
00040000-5654-3472-4575-5d5e6fc236d0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5654-3472-7188-946ddc890b94	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5654-3472-80d3-2f3e2a0e3069	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5654-3472-d586-96590a0b3d49	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5654-3472-2a8a-b97ebd002445	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5654-3472-06bd-7ce23016afbd	MX	MEX	484	Mexico 	Mehika	\N
00040000-5654-3472-4608-a974df599849	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5654-3472-ed98-ccee672af18f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5654-3472-2542-9285cfd3a570	MC	MCO	492	Monaco 	Monako	\N
00040000-5654-3472-6e9a-4bf858f3cb42	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5654-3472-36cb-f393d2b11d49	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5654-3472-2779-f4e58905864b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5654-3472-f92c-d47f8fcc0fce	MA	MAR	504	Morocco 	Maroko	\N
00040000-5654-3472-1beb-d9793e7c343b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5654-3472-f149-2a7a654dd31a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5654-3472-3dd9-25d1f784a3ee	NA	NAM	516	Namibia 	Namibija	\N
00040000-5654-3472-3238-ced29fec621e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5654-3472-335a-10e01d189609	NP	NPL	524	Nepal 	Nepal	\N
00040000-5654-3472-e2f1-d475e9a32f35	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5654-3472-20cd-3f7b13d22535	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5654-3472-1406-d31c5bea5f5b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5654-3472-dc60-ec07afe40f5b	NE	NER	562	Niger 	Niger 	\N
00040000-5654-3472-05f4-d601925053de	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5654-3472-71ae-739830d7decf	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5654-3472-054e-2d10a742975c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5654-3472-ccea-198fb250e29b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5654-3472-78dc-916626a0650c	NO	NOR	578	Norway 	Norveška	\N
00040000-5654-3472-bfa6-b3826a74cbcc	OM	OMN	512	Oman 	Oman	\N
00040000-5654-3472-cc5e-c5fee48c0d81	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5654-3472-469f-e498012a242b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5654-3472-6401-e9e23fa888f1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5654-3472-ad92-06515534274b	PA	PAN	591	Panama 	Panama	\N
00040000-5654-3472-fb26-97e0c8631aa5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5654-3472-22b5-641a7e94128e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5654-3472-3b68-7ba7017307be	PE	PER	604	Peru 	Peru	\N
00040000-5654-3472-7f34-62e36c2c0bd9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5654-3472-a10b-f8b5ed6d1415	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5654-3472-ee48-7619646d0fe6	PL	POL	616	Poland 	Poljska	\N
00040000-5654-3472-47f4-47425bb47ca7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5654-3472-09ee-081179231fec	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5654-3472-7308-5c199589bf54	QA	QAT	634	Qatar 	Katar	\N
00040000-5654-3472-7d97-cee9f2eff5fe	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5654-3472-2577-53ac8e2098fc	RO	ROU	642	Romania 	Romunija	\N
00040000-5654-3472-7590-2d98e16cd684	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5654-3472-e023-440f91d1e1d3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5654-3472-8af9-7c84662bd3f2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5654-3472-9e00-7fd98713948a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5654-3472-5be2-c08214758bcb	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5654-3472-ea3c-48810ad877eb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5654-3472-0599-f53ff1787836	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5654-3472-3fea-f1b5ac80739f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5654-3472-f971-4fec9833f10b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5654-3472-e6d9-0a344edf5fee	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5654-3472-ed21-fd68572f6d59	SM	SMR	674	San Marino 	San Marino	\N
00040000-5654-3472-428d-96b3647497de	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5654-3472-a8ee-a52166cd3ccf	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5654-3472-5a51-7f69773b1eb2	SN	SEN	686	Senegal 	Senegal	\N
00040000-5654-3472-ff29-94135b4454f0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5654-3472-626b-b3f2b5c1850e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5654-3472-27be-817f141ec5b3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5654-3472-cfc5-11747eeeb5f1	SG	SGP	702	Singapore 	Singapur	\N
00040000-5654-3472-fa84-3e025ca2db26	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5654-3472-9a91-a7d8e7d74505	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5654-3472-10e8-7605dfecf687	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5654-3472-ca45-2f08355967dc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5654-3472-1889-e47d27355c1e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5654-3472-3486-ae03d3374665	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5654-3472-6ef6-0b3e642d55c3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5654-3472-5d84-a6fa842c93d7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5654-3472-e630-4f8bdde8b8c5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5654-3472-f7eb-e15923f050cb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5654-3472-2645-30a31763b202	SD	SDN	729	Sudan 	Sudan	\N
00040000-5654-3472-11f6-0dfd8ac73d1b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5654-3472-dac8-30f04d7ba7ca	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5654-3472-2c00-688a4e015ec1	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5654-3472-7a42-fdf38dadd447	SE	SWE	752	Sweden 	Švedska	\N
00040000-5654-3472-adff-021c2d6821b2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5654-3472-82c8-8d323277ac83	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5654-3472-07a3-983790bb5d50	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5654-3472-49c0-3ce4908fc532	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5654-3472-630b-8230edb56706	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5654-3472-2a52-ca7851676ffb	TH	THA	764	Thailand 	Tajska	\N
00040000-5654-3472-652a-bec40fb25d8b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5654-3472-5f7c-22b8f72d1989	TG	TGO	768	Togo 	Togo	\N
00040000-5654-3472-e7ea-2137c0d65c7b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5654-3472-294a-3f89ddd29984	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5654-3472-3f5a-78d523c78f63	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5654-3472-e402-cfa98e16f1e0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5654-3472-6d5e-157c0310e981	TR	TUR	792	Turkey 	Turčija	\N
00040000-5654-3472-881e-13934fffe284	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5654-3472-6dd7-4436787f4e57	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5654-3472-2743-1d4cb92a7d20	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5654-3472-13d4-940d710fbfc3	UG	UGA	800	Uganda 	Uganda	\N
00040000-5654-3472-89f5-5f13efb839c9	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5654-3472-cab7-11640ff3ace5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5654-3472-9a88-b94897ec24ef	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5654-3472-037d-98d384d898da	US	USA	840	United States 	Združene države Amerike	\N
00040000-5654-3472-07d6-7af1f38cf764	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5654-3472-398a-8680c282fbee	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5654-3472-d2da-59a52f44935b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5654-3472-370f-84d6c88fa110	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5654-3472-5a5a-8471d4b9a7d8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5654-3472-2902-45be4aefcc50	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5654-3472-b22d-6bc8144df2c0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5654-3472-ccc6-407d46922093	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5654-3472-f4e3-9cd2f2bb89fb	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5654-3472-e8d9-361d7d4c62cf	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5654-3472-bb77-35c7b3334fe0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5654-3472-e40a-4ddac69493b9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5654-3472-7fc6-22c85547918e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 29354666)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5654-3475-a6fa-08ff9dc99f67	000e0000-5654-3475-b211-91d7e0b1f097	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5654-3472-e07a-ded94eec5b57	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5654-3475-9d28-cc57db48ec1d	000e0000-5654-3475-f09b-e8543b80baa2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5654-3472-00fd-b2b6f8bdc220	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5654-3475-71d4-4f7e1890d00c	000e0000-5654-3475-87aa-f83dbefdfb8c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5654-3472-e07a-ded94eec5b57	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5654-3475-97eb-a1e5e063c04c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5654-3475-50ed-bdfdca5ba16e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 29354467)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5654-3475-a01e-af968d2b1b13	000e0000-5654-3475-f09b-e8543b80baa2	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5654-3472-6197-485feba42b3b
000d0000-5654-3475-83ac-d7b229ad2671	000e0000-5654-3475-f09b-e8543b80baa2	000c0000-5654-3475-0a3d-3ec9c9c7c765	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5654-3472-6197-485feba42b3b
000d0000-5654-3475-5816-902b0acf3892	000e0000-5654-3475-f09b-e8543b80baa2	000c0000-5654-3475-cd5f-c7494b55ffd6	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5654-3472-7360-84417e78e663
000d0000-5654-3475-44bd-d5e5ead4a3fc	000e0000-5654-3475-f09b-e8543b80baa2	000c0000-5654-3475-2e45-9348703c9ec6	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5654-3472-7994-7980c64ed51d
000d0000-5654-3475-f8c9-6a1ba51df292	000e0000-5654-3475-f09b-e8543b80baa2	000c0000-5654-3475-2bcd-a69a01591a19	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5654-3472-e3a7-821c6aa615e1
000d0000-5654-3475-b16c-96dfc80d780a	000e0000-5654-3475-f09b-e8543b80baa2	000c0000-5654-3475-3f0e-b47600bf617d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5654-3472-e3a7-821c6aa615e1
000d0000-5654-3475-2f85-8dc88970ef09	000e0000-5654-3475-f09b-e8543b80baa2	000c0000-5654-3475-0f84-c7d0683ebbaa	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5654-3472-6197-485feba42b3b
000d0000-5654-3475-96e2-9318144b0e24	000e0000-5654-3475-f09b-e8543b80baa2	000c0000-5654-3475-2cbb-1e18e552b601	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5654-3472-6115-323833adcf80
000d0000-5654-3475-6b14-3f41cbae924c	000e0000-5654-3475-f09b-e8543b80baa2	000c0000-5654-3475-150c-05072d2f8e60	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5654-3472-3e97-76f3d0999512
\.


--
-- TOC entry 3122 (class 0 OID 29354258)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 29354224)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 29354201)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5654-3475-f16e-433e4e3bfdfc	00080000-5654-3474-f0e1-bda23dafa913	00090000-5654-3475-6f7d-1de6ecbfff92	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 29354381)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 29354924)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5654-3475-e058-dbe22f01675a	00010000-5654-3472-e4ef-8f3557ba9573	\N	Prva mapa	Root mapa	2015-11-24 10:57:09	2015-11-24 10:57:09	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 29354937)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 29354959)
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
-- TOC entry 3138 (class 0 OID 29354406)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 29354158)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5654-3472-d2d5-517e6a942cc5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5654-3472-886c-ecabc6405846	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5654-3472-5fac-84b73aba9c40	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5654-3472-7666-689e3f47a0a1	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5654-3472-8d19-cfdf8baa9110	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5654-3472-74fd-1cc07603f7cf	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5654-3472-ede0-a85e267e7260	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5654-3472-fcf8-ccd0d34ceae0	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5654-3472-ecb4-90895719cf8f	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5654-3472-e93f-968020db053c	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5654-3472-81a0-8dedbb6c6908	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5654-3472-eb44-9b222e641dde	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5654-3472-88e6-2b558a91c18b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5654-3472-3f72-b3fd7042741d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5654-3474-e68b-57dc3debbc17	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5654-3474-f8cf-27e265c87b5e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5654-3474-7a53-88027482a314	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5654-3474-3e42-b7d388b15ddd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5654-3474-d62f-81c10b7d15e4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5654-3476-3ec8-861cd908d5ee	application.tenant.maticnopodjetje	string	s:36:"00080000-5654-3476-3745-9d80e80758e6";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 29354058)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5654-3474-f0e1-6d6a84a37c07	00000000-5654-3474-e68b-57dc3debbc17	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5654-3474-f69a-99cf6ff4030a	00000000-5654-3474-e68b-57dc3debbc17	00010000-5654-3472-e4ef-8f3557ba9573	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5654-3474-94a1-5d0e401c00d7	00000000-5654-3474-f8cf-27e265c87b5e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 29354125)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5654-3475-4e2c-ad9cb20b477f	\N	00100000-5654-3475-3c72-4d87cb5698d2	00100000-5654-3475-7856-1c48a7af8912	01	Gledališče Nimbis
00410000-5654-3475-ce44-78fba9f1e5c2	00410000-5654-3475-4e2c-ad9cb20b477f	00100000-5654-3475-3c72-4d87cb5698d2	00100000-5654-3475-7856-1c48a7af8912	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 29354069)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5654-3475-d09c-fc3c39f915f2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5654-3475-6efd-6f6109b0f831	00010000-5654-3474-83d2-6fb92f996033	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5654-3475-75c1-f0ca5d425cb4	00010000-5654-3474-cff6-48c27a799c08	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5654-3475-e8c4-40c8289efa28	00010000-5654-3474-8c7d-c22e48d36c86	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5654-3475-7849-f970db0303e5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5654-3475-5349-7c013d2228d8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5654-3475-bf5f-e2a644cac05d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5654-3475-fcc0-086332ff0c07	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5654-3475-6f7d-1de6ecbfff92	00010000-5654-3474-2624-e586d26854bb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5654-3475-ed05-790341b5caab	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5654-3475-ef72-246126594b66	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5654-3475-9d51-7383f1e6cce6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5654-3475-589e-dfb0bae4cce9	00010000-5654-3474-ecfc-b81f76d309ad	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5654-3475-5c05-cf1747a24a83	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5654-3475-122d-3985b60bf431	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5654-3475-bc17-467630eadae1	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5654-3475-4c81-bb714b0716c5	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5654-3475-7226-95a7ca8c1447	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5654-3475-e739-a00dbeeb84b1	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5654-3475-f5b1-c0cf5c892f9b	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5654-3475-c9f4-7cf3aaa5de24	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 29354004)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5654-3472-e78c-07f17f29bfcb	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5654-3472-13d1-2e304ada4e67	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5654-3472-0ad7-d30aff300ba1	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5654-3472-9e72-68e9d29ddb17	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5654-3472-f6a5-a7f866f9a914	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5654-3472-3762-82713596672d	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5654-3472-e41a-74705d552e0b	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5654-3472-ec41-6ba3113a50f1	Abonma-read	Abonma - branje	t
00030000-5654-3472-7be4-200cb32816a8	Abonma-write	Abonma - spreminjanje	t
00030000-5654-3472-aaa2-c092efbf4320	Alternacija-read	Alternacija - branje	t
00030000-5654-3472-9b94-17b6bc27e60b	Alternacija-write	Alternacija - spreminjanje	t
00030000-5654-3472-c6b9-a07b5cb6fcda	Arhivalija-read	Arhivalija - branje	t
00030000-5654-3472-4aa2-7a395810787f	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5654-3472-04b9-0990268f781b	AuthStorage-read	AuthStorage - branje	t
00030000-5654-3472-c3b8-7eb5e35be963	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5654-3472-b64e-810adde132d8	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5654-3472-aa51-02fe0eb2583e	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5654-3472-dab5-6f395c891dc8	Besedilo-read	Besedilo - branje	t
00030000-5654-3472-832a-a77448cdc5c6	Besedilo-write	Besedilo - spreminjanje	t
00030000-5654-3472-5f0e-cd07aa52f698	Dogodek-read	Dogodek - branje	t
00030000-5654-3472-bc0f-f04257576d19	Dogodek-write	Dogodek - spreminjanje	t
00030000-5654-3472-3d7e-09f07658be39	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5654-3472-51eb-d87f96461835	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5654-3472-f7a2-8f80bafdc809	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5654-3472-2706-eda5da3ef533	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5654-3472-083c-b2e90325aa8d	DogodekTrait-read	DogodekTrait - branje	t
00030000-5654-3472-3d1c-0a47b522bc9f	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5654-3472-4e21-c6bcd31b5558	DrugiVir-read	DrugiVir - branje	t
00030000-5654-3472-3c88-53437fe7b8a1	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5654-3472-c98e-00736ef05c36	Drzava-read	Drzava - branje	t
00030000-5654-3472-5012-71478dbf5b33	Drzava-write	Drzava - spreminjanje	t
00030000-5654-3472-d2b4-c096cd4c2788	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5654-3472-2048-86c4519d4e8e	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5654-3472-95d9-35314ebca9f1	Funkcija-read	Funkcija - branje	t
00030000-5654-3472-ef9f-3daabd0665b9	Funkcija-write	Funkcija - spreminjanje	t
00030000-5654-3472-a7b2-b6982d913385	Gostovanje-read	Gostovanje - branje	t
00030000-5654-3472-74fe-b249f39ad54e	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5654-3472-16bb-646c676f2b4c	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5654-3472-ac7e-322a3048574a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5654-3472-cb42-a34305f5b750	Kupec-read	Kupec - branje	t
00030000-5654-3472-5ba9-a35f89bbe3d5	Kupec-write	Kupec - spreminjanje	t
00030000-5654-3472-61e8-a284cb097080	NacinPlacina-read	NacinPlacina - branje	t
00030000-5654-3472-a05e-a9187e968d84	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5654-3472-bdeb-d1b5abcda429	Option-read	Option - branje	t
00030000-5654-3472-a747-bd76f6b4dda6	Option-write	Option - spreminjanje	t
00030000-5654-3472-61e2-1ad634b6d1b7	OptionValue-read	OptionValue - branje	t
00030000-5654-3472-c832-6539b90e79a5	OptionValue-write	OptionValue - spreminjanje	t
00030000-5654-3472-9d53-544ac5cedf85	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5654-3472-8b80-a1bc010480cb	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5654-3472-66db-d105ce931a9d	Oseba-read	Oseba - branje	t
00030000-5654-3472-1d99-0f4629d3bb48	Oseba-write	Oseba - spreminjanje	t
00030000-5654-3472-1632-8117947400d5	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5654-3472-3cfb-76ef34a8638d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5654-3472-b7da-e54f3ba6bc67	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5654-3472-d758-fee8a2b8c10b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5654-3472-cd20-a657ee6f618d	Pogodba-read	Pogodba - branje	t
00030000-5654-3472-d783-6a43c761b537	Pogodba-write	Pogodba - spreminjanje	t
00030000-5654-3472-e816-49f778c59761	Popa-read	Popa - branje	t
00030000-5654-3472-73a7-20c2b70e3640	Popa-write	Popa - spreminjanje	t
00030000-5654-3472-019d-d7038bcc5013	Posta-read	Posta - branje	t
00030000-5654-3472-d680-13ab3305ccd6	Posta-write	Posta - spreminjanje	t
00030000-5654-3472-1bdc-013a43923115	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5654-3472-95f1-bd70393542b8	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5654-3472-a6e2-172b9d3088c8	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5654-3472-c82c-c9585f092937	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5654-3472-b1b1-59e201ea7bdf	PostniNaslov-read	PostniNaslov - branje	t
00030000-5654-3472-63b6-b3f2b47f7644	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5654-3472-f162-c2cad64304c6	Praznik-read	Praznik - branje	t
00030000-5654-3472-ee58-c49c81dcb2c9	Praznik-write	Praznik - spreminjanje	t
00030000-5654-3472-bb71-9df31f46f916	Predstava-read	Predstava - branje	t
00030000-5654-3472-9a5d-f1e4ac0c342b	Predstava-write	Predstava - spreminjanje	t
00030000-5654-3472-4ffd-f1c74f4cc4c0	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5654-3472-ac52-32c9839a3edd	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5654-3472-e152-5a3b549863f4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5654-3472-9690-7422bd10cb7c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5654-3472-f08d-b34d6ea7f07e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5654-3472-8115-0277208e8c5e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5654-3472-57ed-c2e7e03a2df5	ProgramDela-read	ProgramDela - branje	t
00030000-5654-3472-6597-8731b12e7935	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5654-3472-f219-a0bf3ba15ba3	ProgramFestival-read	ProgramFestival - branje	t
00030000-5654-3472-3bb1-923d254b2612	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5654-3472-a501-fb5fb6afff03	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5654-3472-e338-6c5736258393	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5654-3472-2b3c-5a299435e7e4	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5654-3472-4ca7-1d85c30d5868	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5654-3472-6e0e-ae729b05a62c	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5654-3472-ca79-eb2e4d3ce9d9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5654-3472-bada-3db22c71fbb0	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5654-3472-22b8-c72436df7f4c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5654-3472-fcaf-f6b629918bcc	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5654-3472-d818-3fe89528bce2	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5654-3472-149f-451d68e26c11	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5654-3472-bbb2-9642e7183cd3	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5654-3472-dafe-a199df698f6e	ProgramRazno-read	ProgramRazno - branje	t
00030000-5654-3472-b306-2fa1be90fdfb	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5654-3472-0d0d-1d495ab8a964	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5654-3472-6a47-9faf5b586c19	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5654-3472-aac1-ae0c9d071d96	Prostor-read	Prostor - branje	t
00030000-5654-3472-e285-c9bf33856127	Prostor-write	Prostor - spreminjanje	t
00030000-5654-3472-d723-d5d2b584f306	Racun-read	Racun - branje	t
00030000-5654-3472-6d88-6a6a4cced84d	Racun-write	Racun - spreminjanje	t
00030000-5654-3472-0fba-a97d9f6221ef	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5654-3472-11f3-128b3e7b1b3f	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5654-3472-2434-40e363254dd7	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5654-3472-4cb1-6742c48f4a13	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5654-3472-ca67-d42ff629311a	Rekvizit-read	Rekvizit - branje	t
00030000-5654-3472-9b70-84800d8c04ad	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5654-3472-e4db-caf6687be597	Revizija-read	Revizija - branje	t
00030000-5654-3472-3b87-173e053a8341	Revizija-write	Revizija - spreminjanje	t
00030000-5654-3472-662e-04d3d0a6e39b	Rezervacija-read	Rezervacija - branje	t
00030000-5654-3472-e83c-19caecddf025	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5654-3472-ffcb-ee1c1e4a7429	SedezniRed-read	SedezniRed - branje	t
00030000-5654-3472-2317-85ff461f1c92	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5654-3472-5b5a-daefe48f2661	Sedez-read	Sedez - branje	t
00030000-5654-3472-2148-e2279e68ec18	Sedez-write	Sedez - spreminjanje	t
00030000-5654-3472-57c1-3e1026dbeee1	Sezona-read	Sezona - branje	t
00030000-5654-3472-c7dd-a81b87ac2bda	Sezona-write	Sezona - spreminjanje	t
00030000-5654-3472-7722-b437bb3add36	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5654-3472-1862-8f93a7355ec8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5654-3472-1663-741aad74a5fe	Stevilcenje-read	Stevilcenje - branje	t
00030000-5654-3472-fd7d-79fe872efb83	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5654-3472-5172-00fd5b9e58ee	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5654-3472-2cf8-2c5f387d2c14	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5654-3472-eb50-83616ce66318	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5654-3472-6a25-6e1e3aaa4731	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5654-3472-e5d2-efad2cd0cb06	Telefonska-read	Telefonska - branje	t
00030000-5654-3472-d471-3f36c3cb5c0a	Telefonska-write	Telefonska - spreminjanje	t
00030000-5654-3472-fe8c-dfead56cc52f	TerminStoritve-read	TerminStoritve - branje	t
00030000-5654-3472-dcce-26a03150a8fb	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5654-3472-f497-2cc452029fe9	TipFunkcije-read	TipFunkcije - branje	t
00030000-5654-3472-9dfb-4218a6984f50	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5654-3472-ae78-9cf832be04a7	TipPopa-read	TipPopa - branje	t
00030000-5654-3472-3c2a-ccedb8c44a43	TipPopa-write	TipPopa - spreminjanje	t
00030000-5654-3472-7cdd-e49cf0b673bb	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5654-3472-7c74-12ec80434fd0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5654-3472-9c8a-31cadf0e2331	TipVaje-read	TipVaje - branje	t
00030000-5654-3472-bea5-0f5fa6202761	TipVaje-write	TipVaje - spreminjanje	t
00030000-5654-3472-961d-4715a5295a08	Trr-read	Trr - branje	t
00030000-5654-3472-d612-fbfe8e27cc90	Trr-write	Trr - spreminjanje	t
00030000-5654-3472-5eeb-edde0a63f9f9	Uprizoritev-read	Uprizoritev - branje	t
00030000-5654-3472-a0be-f2e3711a97f6	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5654-3472-9cf6-8ace9c6a0533	Vaja-read	Vaja - branje	t
00030000-5654-3472-94f0-7688ec528dff	Vaja-write	Vaja - spreminjanje	t
00030000-5654-3472-c41b-bc977bdc66c0	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5654-3472-d91c-44da950ccd87	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5654-3472-f750-6d3f31ffb712	VrstaStroska-read	VrstaStroska - branje	t
00030000-5654-3472-deff-3842b147c208	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5654-3472-3500-b664cee51a3e	Zaposlitev-read	Zaposlitev - branje	t
00030000-5654-3472-a049-7b433b734f74	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5654-3472-dca5-3915742c2926	Zasedenost-read	Zasedenost - branje	t
00030000-5654-3472-0893-f76a259977e9	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5654-3472-25ef-cf98e78c9816	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5654-3472-4905-0e7e7f7ba5cf	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5654-3472-69c0-2affc781d9ce	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5654-3472-99ef-fb13a4b1a4e7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5654-3472-998d-0c30828de139	Job-read	Branje opravil - samo zase - branje	t
00030000-5654-3472-8090-fba2f5203ec9	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5654-3472-bf00-f511ec59a9a5	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5654-3472-5cb7-5cc314a8cb66	Report-read	Report - branje	t
00030000-5654-3472-5331-9bcc84ed94ff	Report-write	Report - spreminjanje	t
00030000-5654-3472-2713-4dccf173ad78	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5654-3472-dbf6-8f1da779d142	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5654-3472-9dc7-6ca35407fde2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5654-3472-6b0e-e51e4a2fb551	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5654-3472-2833-c1467b594b2e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5654-3472-505e-9fa99455eda2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5654-3472-a99c-4a24177ae30d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5654-3472-10ab-81b9f7a341ae	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5654-3472-3e50-13fc4e2d2225	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5654-3472-84ae-25e71d455866	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5654-3472-6dfd-42335539ce8c	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5654-3472-d765-2b92b9acf9be	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5654-3472-34af-0eb4baccc664	Datoteka-write	Datoteka - spreminjanje	t
00030000-5654-3472-6fbd-a5a6f21c7ccf	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 29354023)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5654-3472-caf0-1bdbcb996c15	00030000-5654-3472-13d1-2e304ada4e67
00020000-5654-3472-84ee-3c0954560475	00030000-5654-3472-c98e-00736ef05c36
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-ec41-6ba3113a50f1
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-7be4-200cb32816a8
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-aaa2-c092efbf4320
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-9b94-17b6bc27e60b
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-c6b9-a07b5cb6fcda
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-5f0e-cd07aa52f698
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-9e72-68e9d29ddb17
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-bc0f-f04257576d19
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-c98e-00736ef05c36
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-5012-71478dbf5b33
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-95d9-35314ebca9f1
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-ef9f-3daabd0665b9
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-a7b2-b6982d913385
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-74fe-b249f39ad54e
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-16bb-646c676f2b4c
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-ac7e-322a3048574a
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-bdeb-d1b5abcda429
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-61e2-1ad634b6d1b7
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-66db-d105ce931a9d
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-1d99-0f4629d3bb48
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-e816-49f778c59761
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-73a7-20c2b70e3640
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-019d-d7038bcc5013
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-d680-13ab3305ccd6
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-b1b1-59e201ea7bdf
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-63b6-b3f2b47f7644
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-bb71-9df31f46f916
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-9a5d-f1e4ac0c342b
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-f08d-b34d6ea7f07e
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-8115-0277208e8c5e
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-aac1-ae0c9d071d96
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-e285-c9bf33856127
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-2434-40e363254dd7
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-4cb1-6742c48f4a13
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-ca67-d42ff629311a
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-9b70-84800d8c04ad
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-57c1-3e1026dbeee1
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-c7dd-a81b87ac2bda
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-f497-2cc452029fe9
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-5eeb-edde0a63f9f9
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-a0be-f2e3711a97f6
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-9cf6-8ace9c6a0533
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-94f0-7688ec528dff
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-dca5-3915742c2926
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-0893-f76a259977e9
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-25ef-cf98e78c9816
00020000-5654-3472-fb5c-004ec1c27608	00030000-5654-3472-69c0-2affc781d9ce
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-ec41-6ba3113a50f1
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-c6b9-a07b5cb6fcda
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-5f0e-cd07aa52f698
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-c98e-00736ef05c36
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-a7b2-b6982d913385
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-16bb-646c676f2b4c
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-ac7e-322a3048574a
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-bdeb-d1b5abcda429
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-61e2-1ad634b6d1b7
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-66db-d105ce931a9d
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-1d99-0f4629d3bb48
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-e816-49f778c59761
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-019d-d7038bcc5013
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-b1b1-59e201ea7bdf
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-63b6-b3f2b47f7644
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-bb71-9df31f46f916
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-aac1-ae0c9d071d96
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-2434-40e363254dd7
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-ca67-d42ff629311a
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-57c1-3e1026dbeee1
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-e5d2-efad2cd0cb06
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-d471-3f36c3cb5c0a
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-961d-4715a5295a08
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-d612-fbfe8e27cc90
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-3500-b664cee51a3e
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-a049-7b433b734f74
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-25ef-cf98e78c9816
00020000-5654-3472-836b-de3c59fcaac0	00030000-5654-3472-69c0-2affc781d9ce
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-ec41-6ba3113a50f1
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-aaa2-c092efbf4320
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-c6b9-a07b5cb6fcda
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-4aa2-7a395810787f
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-dab5-6f395c891dc8
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-3d7e-09f07658be39
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-5f0e-cd07aa52f698
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-c98e-00736ef05c36
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-95d9-35314ebca9f1
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-a7b2-b6982d913385
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-16bb-646c676f2b4c
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-bdeb-d1b5abcda429
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-61e2-1ad634b6d1b7
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-66db-d105ce931a9d
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-e816-49f778c59761
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-019d-d7038bcc5013
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-bb71-9df31f46f916
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-f08d-b34d6ea7f07e
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-aac1-ae0c9d071d96
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-2434-40e363254dd7
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-ca67-d42ff629311a
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-57c1-3e1026dbeee1
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-f497-2cc452029fe9
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-9cf6-8ace9c6a0533
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-dca5-3915742c2926
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-25ef-cf98e78c9816
00020000-5654-3472-0a7d-0b5764c58deb	00030000-5654-3472-69c0-2affc781d9ce
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-ec41-6ba3113a50f1
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-7be4-200cb32816a8
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-9b94-17b6bc27e60b
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-c6b9-a07b5cb6fcda
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-5f0e-cd07aa52f698
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-c98e-00736ef05c36
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-a7b2-b6982d913385
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-bdeb-d1b5abcda429
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-61e2-1ad634b6d1b7
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-e816-49f778c59761
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-019d-d7038bcc5013
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-bb71-9df31f46f916
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-aac1-ae0c9d071d96
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-2434-40e363254dd7
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-ca67-d42ff629311a
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-57c1-3e1026dbeee1
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-f497-2cc452029fe9
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-25ef-cf98e78c9816
00020000-5654-3472-0b71-776289caee68	00030000-5654-3472-69c0-2affc781d9ce
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-ec41-6ba3113a50f1
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-c6b9-a07b5cb6fcda
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-5f0e-cd07aa52f698
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-c98e-00736ef05c36
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-a7b2-b6982d913385
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-bdeb-d1b5abcda429
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-61e2-1ad634b6d1b7
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-e816-49f778c59761
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-019d-d7038bcc5013
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-bb71-9df31f46f916
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-aac1-ae0c9d071d96
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-2434-40e363254dd7
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-ca67-d42ff629311a
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-57c1-3e1026dbeee1
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-fe8c-dfead56cc52f
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-0ad7-d30aff300ba1
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-f497-2cc452029fe9
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-25ef-cf98e78c9816
00020000-5654-3472-8fcd-745243dac57e	00030000-5654-3472-69c0-2affc781d9ce
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-e78c-07f17f29bfcb
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-13d1-2e304ada4e67
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-ec41-6ba3113a50f1
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-7be4-200cb32816a8
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-aaa2-c092efbf4320
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9b94-17b6bc27e60b
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-c6b9-a07b5cb6fcda
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-4aa2-7a395810787f
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-04b9-0990268f781b
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-c3b8-7eb5e35be963
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-b64e-810adde132d8
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-aa51-02fe0eb2583e
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-dab5-6f395c891dc8
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-832a-a77448cdc5c6
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-6fbd-a5a6f21c7ccf
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-34af-0eb4baccc664
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-5f0e-cd07aa52f698
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9e72-68e9d29ddb17
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-bc0f-f04257576d19
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-3d7e-09f07658be39
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-51eb-d87f96461835
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-f7a2-8f80bafdc809
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-2706-eda5da3ef533
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-4e21-c6bcd31b5558
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-3c88-53437fe7b8a1
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-c98e-00736ef05c36
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-5012-71478dbf5b33
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d2b4-c096cd4c2788
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-2048-86c4519d4e8e
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-95d9-35314ebca9f1
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-ef9f-3daabd0665b9
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-a7b2-b6982d913385
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-74fe-b249f39ad54e
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-bf00-f511ec59a9a5
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-998d-0c30828de139
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-8090-fba2f5203ec9
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-16bb-646c676f2b4c
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-ac7e-322a3048574a
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-cb42-a34305f5b750
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-5ba9-a35f89bbe3d5
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-2713-4dccf173ad78
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-dbf6-8f1da779d142
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9dc7-6ca35407fde2
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-6b0e-e51e4a2fb551
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-505e-9fa99455eda2
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-2833-c1467b594b2e
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-61e8-a284cb097080
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-a05e-a9187e968d84
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-bdeb-d1b5abcda429
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-a747-bd76f6b4dda6
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-61e2-1ad634b6d1b7
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-c832-6539b90e79a5
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9d53-544ac5cedf85
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-8b80-a1bc010480cb
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-66db-d105ce931a9d
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-f6a5-a7f866f9a914
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-1d99-0f4629d3bb48
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-1632-8117947400d5
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-3cfb-76ef34a8638d
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-b7da-e54f3ba6bc67
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d758-fee8a2b8c10b
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-cd20-a657ee6f618d
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d783-6a43c761b537
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-e816-49f778c59761
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-73a7-20c2b70e3640
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-019d-d7038bcc5013
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d680-13ab3305ccd6
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-1bdc-013a43923115
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-95f1-bd70393542b8
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-a6e2-172b9d3088c8
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-c82c-c9585f092937
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-b1b1-59e201ea7bdf
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-63b6-b3f2b47f7644
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-f162-c2cad64304c6
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-ee58-c49c81dcb2c9
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-bb71-9df31f46f916
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9a5d-f1e4ac0c342b
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-4ffd-f1c74f4cc4c0
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-ac52-32c9839a3edd
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-e152-5a3b549863f4
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9690-7422bd10cb7c
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-f08d-b34d6ea7f07e
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-8115-0277208e8c5e
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-3762-82713596672d
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-57ed-c2e7e03a2df5
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-e41a-74705d552e0b
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-6597-8731b12e7935
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-f219-a0bf3ba15ba3
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-3bb1-923d254b2612
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-a501-fb5fb6afff03
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-e338-6c5736258393
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-2b3c-5a299435e7e4
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-4ca7-1d85c30d5868
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-6e0e-ae729b05a62c
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-ca79-eb2e4d3ce9d9
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-bada-3db22c71fbb0
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-22b8-c72436df7f4c
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-fcaf-f6b629918bcc
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d818-3fe89528bce2
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-149f-451d68e26c11
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-bbb2-9642e7183cd3
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-dafe-a199df698f6e
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-b306-2fa1be90fdfb
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-0d0d-1d495ab8a964
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-6a47-9faf5b586c19
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-aac1-ae0c9d071d96
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-e285-c9bf33856127
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d723-d5d2b584f306
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-6d88-6a6a4cced84d
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-0fba-a97d9f6221ef
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-11f3-128b3e7b1b3f
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-ca67-d42ff629311a
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9b70-84800d8c04ad
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-2434-40e363254dd7
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-4cb1-6742c48f4a13
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-5cb7-5cc314a8cb66
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-5331-9bcc84ed94ff
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-e4db-caf6687be597
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-3b87-173e053a8341
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-662e-04d3d0a6e39b
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-e83c-19caecddf025
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-5b5a-daefe48f2661
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-2148-e2279e68ec18
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-ffcb-ee1c1e4a7429
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-2317-85ff461f1c92
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-57c1-3e1026dbeee1
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-c7dd-a81b87ac2bda
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-1663-741aad74a5fe
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-fd7d-79fe872efb83
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-7722-b437bb3add36
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-1862-8f93a7355ec8
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-5172-00fd5b9e58ee
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-2cf8-2c5f387d2c14
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-eb50-83616ce66318
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-6a25-6e1e3aaa4731
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-e5d2-efad2cd0cb06
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d471-3f36c3cb5c0a
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-fe8c-dfead56cc52f
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-0ad7-d30aff300ba1
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-dcce-26a03150a8fb
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-f497-2cc452029fe9
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9dfb-4218a6984f50
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-ae78-9cf832be04a7
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-3c2a-ccedb8c44a43
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-7cdd-e49cf0b673bb
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-7c74-12ec80434fd0
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9c8a-31cadf0e2331
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-bea5-0f5fa6202761
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-961d-4715a5295a08
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d612-fbfe8e27cc90
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-5eeb-edde0a63f9f9
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-a0be-f2e3711a97f6
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-9cf6-8ace9c6a0533
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-94f0-7688ec528dff
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-c41b-bc977bdc66c0
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d91c-44da950ccd87
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-f750-6d3f31ffb712
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-deff-3842b147c208
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-d765-2b92b9acf9be
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-6dfd-42335539ce8c
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-10ab-81b9f7a341ae
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-a99c-4a24177ae30d
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-84ae-25e71d455866
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-3e50-13fc4e2d2225
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-3500-b664cee51a3e
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-a049-7b433b734f74
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-dca5-3915742c2926
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-0893-f76a259977e9
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-25ef-cf98e78c9816
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-4905-0e7e7f7ba5cf
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-69c0-2affc781d9ce
00020000-5654-3474-e345-d66cc20b7f17	00030000-5654-3472-99ef-fb13a4b1a4e7
00020000-5654-3474-1cef-5b2c38a0d86b	00030000-5654-3472-84ae-25e71d455866
00020000-5654-3474-ad4e-968b4e69b4c8	00030000-5654-3472-3e50-13fc4e2d2225
00020000-5654-3474-bff7-9e0279c36172	00030000-5654-3472-a0be-f2e3711a97f6
00020000-5654-3474-e0f9-01eb006d9926	00030000-5654-3472-5eeb-edde0a63f9f9
00020000-5654-3474-93cf-161550c513a0	00030000-5654-3472-dbf6-8f1da779d142
00020000-5654-3474-180a-047813daca4e	00030000-5654-3472-9dc7-6ca35407fde2
00020000-5654-3474-3ef5-fdb78153e257	00030000-5654-3472-6b0e-e51e4a2fb551
00020000-5654-3474-a5d5-8db3d9effd4e	00030000-5654-3472-2713-4dccf173ad78
00020000-5654-3474-4d0c-a72ae0d6c360	00030000-5654-3472-505e-9fa99455eda2
00020000-5654-3474-5bd9-ce8d757da757	00030000-5654-3472-2833-c1467b594b2e
00020000-5654-3474-2f06-e8c2095d4ba6	00030000-5654-3472-10ab-81b9f7a341ae
00020000-5654-3474-e63a-4e466700dff7	00030000-5654-3472-a99c-4a24177ae30d
00020000-5654-3474-dd60-fd330edaed1c	00030000-5654-3472-1d99-0f4629d3bb48
00020000-5654-3474-e4a2-500a36f4ae99	00030000-5654-3472-66db-d105ce931a9d
00020000-5654-3474-ee2d-86884662a0d1	00030000-5654-3472-34af-0eb4baccc664
00020000-5654-3474-0403-310874c66b01	00030000-5654-3472-6fbd-a5a6f21c7ccf
00020000-5654-3474-c129-547e19fc4e0a	00030000-5654-3472-e816-49f778c59761
00020000-5654-3474-c129-547e19fc4e0a	00030000-5654-3472-73a7-20c2b70e3640
00020000-5654-3474-c129-547e19fc4e0a	00030000-5654-3472-5eeb-edde0a63f9f9
\.


--
-- TOC entry 3139 (class 0 OID 29354413)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 29354447)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 29354584)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5654-3475-b8bd-43ee5b9a51b5	00090000-5654-3475-d09c-fc3c39f915f2	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5654-3475-c129-4f7322b2c9e7	00090000-5654-3475-5349-7c013d2228d8	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5654-3475-cfa7-fa71770684f3	00090000-5654-3475-589e-dfb0bae4cce9	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5654-3475-df23-234ad0274b6a	00090000-5654-3475-ed05-790341b5caab	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 29354105)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5654-3474-f0e1-bda23dafa913	\N	00040000-5654-3472-10e8-7605dfecf687	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5654-3474-4de7-ba039e3d6784	\N	00040000-5654-3472-10e8-7605dfecf687	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5654-3474-5974-400963335dee	\N	00040000-5654-3472-10e8-7605dfecf687	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5654-3474-09e5-53665d8300f9	\N	00040000-5654-3472-10e8-7605dfecf687	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5654-3475-83e4-2b26bd6aa938	\N	00040000-5654-3472-10e8-7605dfecf687	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5654-3475-f720-d98e5ed2799c	\N	00040000-5654-3472-d17b-a2c195c20398	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5654-3475-c4c3-fbd26a999563	\N	00040000-5654-3472-8a7d-5895c88cca3e	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5654-3475-09e0-76300304c1bc	\N	00040000-5654-3472-8d76-723b818096c9	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5654-3475-1cbf-163ef12ed41a	\N	00040000-5654-3472-e081-d6e028c9d703	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5654-3476-3745-9d80e80758e6	\N	00040000-5654-3472-10e8-7605dfecf687	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 29354150)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5654-3471-9624-fb34488e11b8	8341	Adlešiči
00050000-5654-3471-f6ca-6fdf9eb4eda2	5270	Ajdovščina
00050000-5654-3471-a41e-d75e52ebc4c7	6280	Ankaran/Ancarano
00050000-5654-3471-dcd8-00a5a0f56ac5	9253	Apače
00050000-5654-3471-70bf-e134a6ad3a06	8253	Artiče
00050000-5654-3471-695d-08b02df238a7	4275	Begunje na Gorenjskem
00050000-5654-3471-a0a4-5da49cdddf12	1382	Begunje pri Cerknici
00050000-5654-3471-64c7-a120e934275b	9231	Beltinci
00050000-5654-3471-c81f-c40f622c82d4	2234	Benedikt
00050000-5654-3471-1527-266b1067d76c	2345	Bistrica ob Dravi
00050000-5654-3471-67dd-cbbfaa3d8b43	3256	Bistrica ob Sotli
00050000-5654-3471-c541-76e1e90686d0	8259	Bizeljsko
00050000-5654-3471-27cc-53f20b10740e	1223	Blagovica
00050000-5654-3471-067f-aee6045d7f09	8283	Blanca
00050000-5654-3471-0086-c27ee7de92e5	4260	Bled
00050000-5654-3471-3178-96fe397e063b	4273	Blejska Dobrava
00050000-5654-3471-e728-375fa05d80cf	9265	Bodonci
00050000-5654-3471-fae1-8d443ae7bba5	9222	Bogojina
00050000-5654-3471-6d6a-53ed87bfbbdc	4263	Bohinjska Bela
00050000-5654-3471-a393-d2f2f9b0883f	4264	Bohinjska Bistrica
00050000-5654-3471-f1b7-8b363a5a3762	4265	Bohinjsko jezero
00050000-5654-3471-4efe-9f646c5fcad7	1353	Borovnica
00050000-5654-3471-ff94-716e3f5d03cf	8294	Boštanj
00050000-5654-3471-1a02-4e2d962bfe60	5230	Bovec
00050000-5654-3471-b640-fff770e6ae39	5295	Branik
00050000-5654-3471-5863-9058b229e4b8	3314	Braslovče
00050000-5654-3471-8e3c-c7e34575265d	5223	Breginj
00050000-5654-3471-751b-d7631e9b5d8c	8280	Brestanica
00050000-5654-3471-ca62-f7236caea7c9	2354	Bresternica
00050000-5654-3471-864c-d11fcb87f0fe	4243	Brezje
00050000-5654-3471-f0e8-d73c0c585470	1351	Brezovica pri Ljubljani
00050000-5654-3471-7d3f-e652006f498a	8250	Brežice
00050000-5654-3471-9234-7ca929933da1	4210	Brnik - Aerodrom
00050000-5654-3471-2f32-59a863b04530	8321	Brusnice
00050000-5654-3471-2ef4-0afff7239589	3255	Buče
00050000-5654-3471-2f94-3a144f32384e	8276	Bučka 
00050000-5654-3471-2ea2-4211127b1c7a	9261	Cankova
00050000-5654-3471-3b2a-60d3b8ab6d2d	3000	Celje 
00050000-5654-3471-4b19-03a4da8d6190	3001	Celje - poštni predali
00050000-5654-3471-b7cd-908b30fba0c0	4207	Cerklje na Gorenjskem
00050000-5654-3471-c35a-ea22f41352c3	8263	Cerklje ob Krki
00050000-5654-3471-d533-f663b76f88f6	1380	Cerknica
00050000-5654-3471-840a-dc44367b08ee	5282	Cerkno
00050000-5654-3471-b530-bad670ba4293	2236	Cerkvenjak
00050000-5654-3471-5b66-3a888a54223c	2215	Ceršak
00050000-5654-3471-fc03-10adfc9314c6	2326	Cirkovce
00050000-5654-3471-5ba6-70e527279396	2282	Cirkulane
00050000-5654-3471-f117-c06d1ea37ff5	5273	Col
00050000-5654-3471-2a86-a08bfb1e1f56	8251	Čatež ob Savi
00050000-5654-3471-38a5-50a6214cc0af	1413	Čemšenik
00050000-5654-3471-f958-72ea80914247	5253	Čepovan
00050000-5654-3471-1a4e-edae4cfa2961	9232	Črenšovci
00050000-5654-3471-fc1c-2f50eae236ae	2393	Črna na Koroškem
00050000-5654-3471-db73-a9564ebf7eaa	6275	Črni Kal
00050000-5654-3471-47e0-727ec03aa4b3	5274	Črni Vrh nad Idrijo
00050000-5654-3471-ab21-9dfc970638af	5262	Črniče
00050000-5654-3471-f50f-5e1291f47d92	8340	Črnomelj
00050000-5654-3471-3b99-65b39deb117a	6271	Dekani
00050000-5654-3471-2f43-a9dfccd0acee	5210	Deskle
00050000-5654-3471-9f5a-c8876d42e587	2253	Destrnik
00050000-5654-3471-3ca6-ab7def72890f	6215	Divača
00050000-5654-3471-f6e4-6623e7ea0dae	1233	Dob
00050000-5654-3471-e053-2ea9b470d1ae	3224	Dobje pri Planini
00050000-5654-3471-aa6d-c7a3ccdf8b97	8257	Dobova
00050000-5654-3471-99dc-a12132c5cf7a	1423	Dobovec
00050000-5654-3471-e104-ff0ffd5063e5	5263	Dobravlje
00050000-5654-3471-493f-14aaa16b35f1	3204	Dobrna
00050000-5654-3471-bf67-f0dd83cba2bb	8211	Dobrnič
00050000-5654-3471-e42c-1dad76d2cf0b	1356	Dobrova
00050000-5654-3471-174d-c8e06dd0e667	9223	Dobrovnik/Dobronak 
00050000-5654-3471-8a2d-ae3fbc752720	5212	Dobrovo v Brdih
00050000-5654-3471-762d-758f435fadc5	1431	Dol pri Hrastniku
00050000-5654-3471-f2e0-3511773ddb09	1262	Dol pri Ljubljani
00050000-5654-3471-f1e0-e7fd67d8353f	1273	Dole pri Litiji
00050000-5654-3471-9d0d-93829b3d76e4	1331	Dolenja vas
00050000-5654-3471-a193-c69b698b7857	8350	Dolenjske Toplice
00050000-5654-3471-9c9c-1e624273ce4b	1230	Domžale
00050000-5654-3471-98b9-aea8d36a7dfb	2252	Dornava
00050000-5654-3471-0705-f6d362674aff	5294	Dornberk
00050000-5654-3471-645c-ab279a791a6b	1319	Draga
00050000-5654-3471-d612-f56a17297721	8343	Dragatuš
00050000-5654-3471-8cb1-14b992a83f29	3222	Dramlje
00050000-5654-3471-13b7-cd1bbd9316ad	2370	Dravograd
00050000-5654-3471-810c-513df1e7351b	4203	Duplje
00050000-5654-3471-863c-d08ef51bfe7b	6221	Dutovlje
00050000-5654-3471-6d1c-c3a4ab1e7a34	8361	Dvor
00050000-5654-3471-23fd-5c3a09274a87	2343	Fala
00050000-5654-3471-f64b-59947a55f284	9208	Fokovci
00050000-5654-3471-af18-7a2d82ef4c2d	2313	Fram
00050000-5654-3471-9024-e66f18542565	3213	Frankolovo
00050000-5654-3471-1ec8-785488728ea2	1274	Gabrovka
00050000-5654-3471-8182-fa95eff34095	8254	Globoko
00050000-5654-3471-ed5d-18f7948590e1	5275	Godovič
00050000-5654-3471-0e1a-d991dc5eef6f	4204	Golnik
00050000-5654-3471-269d-5e080f335ad2	3303	Gomilsko
00050000-5654-3471-2bde-5448f2644f8e	4224	Gorenja vas
00050000-5654-3471-2378-df4804d22399	3263	Gorica pri Slivnici
00050000-5654-3471-eb63-51d185f2e0bd	2272	Gorišnica
00050000-5654-3471-c42b-decfcf08a020	9250	Gornja Radgona
00050000-5654-3471-82d9-49461688ddfb	3342	Gornji Grad
00050000-5654-3471-b777-08eace3779d0	4282	Gozd Martuljek
00050000-5654-3471-32c8-5155f6038959	6272	Gračišče
00050000-5654-3471-a21c-a34840907d8c	9264	Grad
00050000-5654-3471-8c4f-32438c9e6cb8	8332	Gradac
00050000-5654-3471-d22f-669596a0e94e	1384	Grahovo
00050000-5654-3471-1c62-6f6ff7a3d7d1	5242	Grahovo ob Bači
00050000-5654-3471-73a4-95cf11f857d3	5251	Grgar
00050000-5654-3471-9a3c-c0b22f75c906	3302	Griže
00050000-5654-3471-1aff-8f7f425bc2f2	3231	Grobelno
00050000-5654-3471-f4d5-0d27de4572f6	1290	Grosuplje
00050000-5654-3471-57f2-06e61866d0f3	2288	Hajdina
00050000-5654-3471-017a-3ae92ba5ee68	8362	Hinje
00050000-5654-3471-58b7-bb662654d1f1	2311	Hoče
00050000-5654-3471-f865-e9b9e4656d50	9205	Hodoš/Hodos
00050000-5654-3471-e7bc-03709103378a	1354	Horjul
00050000-5654-3471-10ef-a4e5833c0629	1372	Hotedršica
00050000-5654-3471-26b4-99b4af7d0ebe	1430	Hrastnik
00050000-5654-3471-6384-591b7aa6967c	6225	Hruševje
00050000-5654-3471-37b6-3f108dfba407	4276	Hrušica
00050000-5654-3471-f10f-ab3dc571ec70	5280	Idrija
00050000-5654-3471-8791-98877564bfc1	1292	Ig
00050000-5654-3471-6f2b-d13c4abb0ef0	6250	Ilirska Bistrica
00050000-5654-3471-eb50-d7fb648aa992	6251	Ilirska Bistrica-Trnovo
00050000-5654-3471-458b-ed1f08babfb6	1295	Ivančna Gorica
00050000-5654-3471-366c-832d9033b7da	2259	Ivanjkovci
00050000-5654-3471-8eb8-a6528805cb8a	1411	Izlake
00050000-5654-3471-b948-512e7d1d9b15	6310	Izola/Isola
00050000-5654-3471-e434-79b7aa489bbf	2222	Jakobski Dol
00050000-5654-3471-33a8-42fb2f313cf1	2221	Jarenina
00050000-5654-3471-a967-07ab6302662f	6254	Jelšane
00050000-5654-3471-ac33-b3472630bf1f	4270	Jesenice
00050000-5654-3471-6eff-c10ca375ced7	8261	Jesenice na Dolenjskem
00050000-5654-3471-7b58-1a2b0b663e8b	3273	Jurklošter
00050000-5654-3471-7b0c-10a3d94dc812	2223	Jurovski Dol
00050000-5654-3471-8498-c3ee65e96f5d	2256	Juršinci
00050000-5654-3471-8455-9a9e4b5288cf	5214	Kal nad Kanalom
00050000-5654-3471-a5fc-65da32423f5f	3233	Kalobje
00050000-5654-3471-1188-177d0c1a7cc1	4246	Kamna Gorica
00050000-5654-3471-deb1-d0eb209669b5	2351	Kamnica
00050000-5654-3471-0a84-25b6ff1ee2bc	1241	Kamnik
00050000-5654-3471-7b91-ed3d3149ba8b	5213	Kanal
00050000-5654-3471-f204-35ecc9ebabaa	8258	Kapele
00050000-5654-3471-00c1-36ea7c7f3482	2362	Kapla
00050000-5654-3471-cab0-e4da12748199	2325	Kidričevo
00050000-5654-3471-aa90-02fb6a969fe1	1412	Kisovec
00050000-5654-3471-19bd-b89ffdbeb272	6253	Knežak
00050000-5654-3471-2c99-8345e24fa4e4	5222	Kobarid
00050000-5654-3471-e057-346fea9cb972	9227	Kobilje
00050000-5654-3471-3180-3e41034e7c6c	1330	Kočevje
00050000-5654-3471-b7dd-bde31f6bf5a9	1338	Kočevska Reka
00050000-5654-3471-cc94-ca436a5febb1	2276	Kog
00050000-5654-3471-0ca6-46aadd83b990	5211	Kojsko
00050000-5654-3471-a620-09cb58f5328e	6223	Komen
00050000-5654-3471-2198-27e6da829b1d	1218	Komenda
00050000-5654-3471-8b35-e205acd46812	6000	Koper/Capodistria 
00050000-5654-3471-a5f6-a5548e8326f6	6001	Koper/Capodistria - poštni predali
00050000-5654-3471-a495-5eae4a043fe6	8282	Koprivnica
00050000-5654-3471-4e18-95d5e0e7e00e	5296	Kostanjevica na Krasu
00050000-5654-3471-17e4-e4204ebbd5b4	8311	Kostanjevica na Krki
00050000-5654-3471-92d1-2028ce9ba8c2	1336	Kostel
00050000-5654-3471-8a21-bc8eecfe0369	6256	Košana
00050000-5654-3471-80a7-af36aa8f8165	2394	Kotlje
00050000-5654-3471-8450-b6fcc17963d0	6240	Kozina
00050000-5654-3471-2bd6-84c4c9d3a015	3260	Kozje
00050000-5654-3471-aaf8-faf7a671459f	4000	Kranj 
00050000-5654-3471-ae1e-87dbf01cb5a7	4001	Kranj - poštni predali
00050000-5654-3471-8f67-cef55a2b12f6	4280	Kranjska Gora
00050000-5654-3471-ca51-d7b62c28e547	1281	Kresnice
00050000-5654-3471-a9ca-ae73b7f97f6d	4294	Križe
00050000-5654-3471-067b-d1580bef764b	9206	Križevci
00050000-5654-3471-e494-deeda94bd10b	9242	Križevci pri Ljutomeru
00050000-5654-3471-c599-39309af545ca	1301	Krka
00050000-5654-3471-5b99-9963f58442d2	8296	Krmelj
00050000-5654-3471-076a-f8cc8d37d198	4245	Kropa
00050000-5654-3471-1cb9-3cfbed066bc6	8262	Krška vas
00050000-5654-3471-030e-4326a8e90b22	8270	Krško
00050000-5654-3471-5c76-7dbd43c748ce	9263	Kuzma
00050000-5654-3471-19fd-0596b5ab687b	2318	Laporje
00050000-5654-3471-031d-0ec53d2db319	3270	Laško
00050000-5654-3471-174b-2faa27953ee8	1219	Laze v Tuhinju
00050000-5654-3471-59d6-9f4151d9f40b	2230	Lenart v Slovenskih goricah
00050000-5654-3471-b5f6-e37ebb3cc78d	9220	Lendava/Lendva
00050000-5654-3471-09d7-fecc3022ec62	4248	Lesce
00050000-5654-3471-cdee-6f54e04cd232	3261	Lesično
00050000-5654-3471-a305-0195da6b4d74	8273	Leskovec pri Krškem
00050000-5654-3471-e161-b209f79eaa22	2372	Libeliče
00050000-5654-3471-f064-cbd2ab149e07	2341	Limbuš
00050000-5654-3471-f8f3-f2f8a01da00f	1270	Litija
00050000-5654-3471-8711-495deb48025a	3202	Ljubečna
00050000-5654-3471-0611-ea3f028cc4f7	1000	Ljubljana 
00050000-5654-3471-949a-d34a12c4f7dc	1001	Ljubljana - poštni predali
00050000-5654-3471-8a5c-c176629f9b18	1231	Ljubljana - Črnuče
00050000-5654-3471-099e-56b5f2afd3be	1261	Ljubljana - Dobrunje
00050000-5654-3471-b3c8-8ed8fa53565e	1260	Ljubljana - Polje
00050000-5654-3471-99d3-25297be66376	1210	Ljubljana - Šentvid
00050000-5654-3471-53f3-2819653f3617	1211	Ljubljana - Šmartno
00050000-5654-3471-29aa-5c8d0d40c99a	3333	Ljubno ob Savinji
00050000-5654-3471-bbb6-c6f389cb959f	9240	Ljutomer
00050000-5654-3471-fdc7-5779a299ba90	3215	Loče
00050000-5654-3471-d822-97ca26355c16	5231	Log pod Mangartom
00050000-5654-3471-082e-cf23c1257a4a	1358	Log pri Brezovici
00050000-5654-3471-6c11-420a6607904f	1370	Logatec
00050000-5654-3471-096c-f7ee287b960d	1371	Logatec
00050000-5654-3471-bdf1-34df0511202c	1434	Loka pri Zidanem Mostu
00050000-5654-3471-f495-330427730624	3223	Loka pri Žusmu
00050000-5654-3471-aa94-bcbba11d633b	6219	Lokev
00050000-5654-3471-6794-c8108ea81fd3	1318	Loški Potok
00050000-5654-3471-56e5-2264e8f0c010	2324	Lovrenc na Dravskem polju
00050000-5654-3471-9db8-112148b73a91	2344	Lovrenc na Pohorju
00050000-5654-3471-f435-b2bb8927d7e1	3334	Luče
00050000-5654-3471-31e6-4d5342842201	1225	Lukovica
00050000-5654-3471-9908-f29d425fb6f7	9202	Mačkovci
00050000-5654-3471-2bdb-ee2b4df7fcbe	2322	Majšperk
00050000-5654-3471-b39d-44ef6a74a6b4	2321	Makole
00050000-5654-3471-88f9-81f0ffbc25a4	9243	Mala Nedelja
00050000-5654-3471-0a12-c9a17a5909a6	2229	Malečnik
00050000-5654-3471-ed43-80ddb5e173c2	6273	Marezige
00050000-5654-3471-9769-484673d15f7a	2000	Maribor 
00050000-5654-3471-72b1-7f24373ae561	2001	Maribor - poštni predali
00050000-5654-3471-4b68-08f12e34ae62	2206	Marjeta na Dravskem polju
00050000-5654-3471-99b2-2976fab5a6f9	2281	Markovci
00050000-5654-3471-8903-5d4104d4447d	9221	Martjanci
00050000-5654-3471-ca95-512c1c69b71b	6242	Materija
00050000-5654-3471-5299-38fa25bb1cb5	4211	Mavčiče
00050000-5654-3471-5d64-d9f4aa4a52fb	1215	Medvode
00050000-5654-3471-9803-d9597fe7e380	1234	Mengeš
00050000-5654-3471-60c3-a28a927d0611	8330	Metlika
00050000-5654-3471-2be1-3ef8e5d7694c	2392	Mežica
00050000-5654-3471-6d52-e65eb15d21c0	2204	Miklavž na Dravskem polju
00050000-5654-3471-93f2-696e661cdd5a	2275	Miklavž pri Ormožu
00050000-5654-3471-3cb3-157d34f09642	5291	Miren
00050000-5654-3471-2796-2735244e8b34	8233	Mirna
00050000-5654-3471-0b7e-3369350759a8	8216	Mirna Peč
00050000-5654-3471-7b1c-9f2235bc7c79	2382	Mislinja
00050000-5654-3471-3a1f-ffd62ca27a82	4281	Mojstrana
00050000-5654-3471-2eb1-043657576c8f	8230	Mokronog
00050000-5654-3471-ad8e-2a9e083f4f2f	1251	Moravče
00050000-5654-3471-7074-d0d24bec49bb	9226	Moravske Toplice
00050000-5654-3471-3789-ca03e0516a32	5216	Most na Soči
00050000-5654-3471-dfe7-8b56e9e062fd	1221	Motnik
00050000-5654-3471-fd47-08ee2dbcade6	3330	Mozirje
00050000-5654-3471-c9c0-0c710954bc1e	9000	Murska Sobota 
00050000-5654-3471-34d6-f175f83de050	9001	Murska Sobota - poštni predali
00050000-5654-3471-8157-45d8f2c32829	2366	Muta
00050000-5654-3471-7220-b0aac82c2316	4202	Naklo
00050000-5654-3471-152e-2d0a2f1c3f38	3331	Nazarje
00050000-5654-3471-1035-be1a7b8f3919	1357	Notranje Gorice
00050000-5654-3471-5cf7-ad2920f0d5b8	3203	Nova Cerkev
00050000-5654-3471-104d-78ecc28b310a	5000	Nova Gorica 
00050000-5654-3471-5015-3334c3a53b7b	5001	Nova Gorica - poštni predali
00050000-5654-3471-9993-9d7884e6ea08	1385	Nova vas
00050000-5654-3471-811a-feb3d06f1d70	8000	Novo mesto
00050000-5654-3471-2947-a591fd7d7ddd	8001	Novo mesto - poštni predali
00050000-5654-3471-82b4-ec1a5cda20fb	6243	Obrov
00050000-5654-3471-3fde-6ecb6a905358	9233	Odranci
00050000-5654-3471-c298-7b5600af18c4	2317	Oplotnica
00050000-5654-3471-ac12-9da12cf7a3f6	2312	Orehova vas
00050000-5654-3471-278a-a8d114233a93	2270	Ormož
00050000-5654-3471-4c6c-218969e18781	1316	Ortnek
00050000-5654-3471-ed08-19165367d263	1337	Osilnica
00050000-5654-3471-d448-d7cda446cb47	8222	Otočec
00050000-5654-3471-6d34-3c5094acb426	2361	Ožbalt
00050000-5654-3471-230b-868dfa67b789	2231	Pernica
00050000-5654-3471-6731-b567d7da09f2	2211	Pesnica pri Mariboru
00050000-5654-3471-ce24-a4a4acfbfc23	9203	Petrovci
00050000-5654-3471-86e6-033c3ba85fe6	3301	Petrovče
00050000-5654-3471-2e85-bd020f1ad3fa	6330	Piran/Pirano
00050000-5654-3471-096b-6474897d02b9	8255	Pišece
00050000-5654-3471-b82b-81dc7102b68f	6257	Pivka
00050000-5654-3471-de92-ddbf99179081	6232	Planina
00050000-5654-3471-3406-f802b6513c8e	3225	Planina pri Sevnici
00050000-5654-3471-b049-5316bb83f02e	6276	Pobegi
00050000-5654-3471-53a7-4833ed621384	8312	Podbočje
00050000-5654-3471-9fb3-2b12fc4e9521	5243	Podbrdo
00050000-5654-3471-f804-d2eb40eadb61	3254	Podčetrtek
00050000-5654-3471-5e0a-f539f0d07e2d	2273	Podgorci
00050000-5654-3471-3737-98979ed3e537	6216	Podgorje
00050000-5654-3471-ca28-5180b0552237	2381	Podgorje pri Slovenj Gradcu
00050000-5654-3471-3c04-e4c6abb76c3d	6244	Podgrad
00050000-5654-3471-429e-420a87b9b787	1414	Podkum
00050000-5654-3471-0cd7-db941eb8d03e	2286	Podlehnik
00050000-5654-3471-2535-cb0d022ddbc9	5272	Podnanos
00050000-5654-3471-5830-8c733c657a43	4244	Podnart
00050000-5654-3471-bf44-af18cd6f636a	3241	Podplat
00050000-5654-3471-fa23-de352397256b	3257	Podsreda
00050000-5654-3471-6fff-87d1e5aa0a3f	2363	Podvelka
00050000-5654-3471-9683-14a6be894370	2208	Pohorje
00050000-5654-3471-001f-1a7258616969	2257	Polenšak
00050000-5654-3471-8912-4797732721f2	1355	Polhov Gradec
00050000-5654-3471-441c-1b66e03832c0	4223	Poljane nad Škofjo Loko
00050000-5654-3471-e40b-04c300bd84b0	2319	Poljčane
00050000-5654-3471-afd8-ab5342d82426	1272	Polšnik
00050000-5654-3471-3a45-2154436eae08	3313	Polzela
00050000-5654-3471-ad06-0388f2eec62f	3232	Ponikva
00050000-5654-3472-aee4-c1c2bb5b478d	6320	Portorož/Portorose
00050000-5654-3472-445a-e3ac76ecf7eb	6230	Postojna
00050000-5654-3472-f9e7-f7e8ad2ea259	2331	Pragersko
00050000-5654-3472-de75-92e571a2c361	3312	Prebold
00050000-5654-3472-e11b-0632836d5a69	4205	Preddvor
00050000-5654-3472-394c-adaf3b4921b7	6255	Prem
00050000-5654-3472-581e-d440e4f1c6df	1352	Preserje
00050000-5654-3472-bd24-fe6439c3dd5a	6258	Prestranek
00050000-5654-3472-a836-cf9174566b91	2391	Prevalje
00050000-5654-3472-90ab-2cd1f8fad771	3262	Prevorje
00050000-5654-3472-cc2a-7381b9c23abf	1276	Primskovo 
00050000-5654-3472-72b8-38cd12e72c45	3253	Pristava pri Mestinju
00050000-5654-3472-658d-52ab96890ea9	9207	Prosenjakovci/Partosfalva
00050000-5654-3472-4d5f-a7c86bedaaf1	5297	Prvačina
00050000-5654-3472-7baf-736e7b776447	2250	Ptuj
00050000-5654-3472-abc8-bf27f10fa98e	2323	Ptujska Gora
00050000-5654-3472-3e59-b5a1c9a9f6d0	9201	Puconci
00050000-5654-3472-6b6d-bad0a138d5e2	2327	Rače
00050000-5654-3472-769f-18b35ef2373a	1433	Radeče
00050000-5654-3472-cb04-3092452db513	9252	Radenci
00050000-5654-3472-1644-3f67c8b176ee	2360	Radlje ob Dravi
00050000-5654-3472-76b1-6196e72417b4	1235	Radomlje
00050000-5654-3472-3acf-b19d45b99aca	4240	Radovljica
00050000-5654-3472-a54f-7c6c8df837af	8274	Raka
00050000-5654-3472-54bb-e1c71438349c	1381	Rakek
00050000-5654-3472-6cfd-8d5292f7522a	4283	Rateče - Planica
00050000-5654-3472-891a-f60ec308243c	2390	Ravne na Koroškem
00050000-5654-3472-6ed2-e5d923dfa2c5	9246	Razkrižje
00050000-5654-3472-0318-3d994678e8da	3332	Rečica ob Savinji
00050000-5654-3472-914e-1eb8fe6fb5c6	5292	Renče
00050000-5654-3472-43c0-cee2ab009042	1310	Ribnica
00050000-5654-3472-4f45-0d335a7470de	2364	Ribnica na Pohorju
00050000-5654-3472-0f8b-506ffd37c005	3272	Rimske Toplice
00050000-5654-3472-455f-b37c855a08bb	1314	Rob
00050000-5654-3472-cfc9-17c44b0cd775	5215	Ročinj
00050000-5654-3472-3097-91af948cdb26	3250	Rogaška Slatina
00050000-5654-3472-b87f-6695a7b7217d	9262	Rogašovci
00050000-5654-3472-8c50-73c2a9bbab0e	3252	Rogatec
00050000-5654-3472-5188-fbcbd23d9525	1373	Rovte
00050000-5654-3472-de8a-82d02ae8b054	2342	Ruše
00050000-5654-3472-6b43-48c5035b7dc4	1282	Sava
00050000-5654-3472-6075-4a989be12c26	6333	Sečovlje/Sicciole
00050000-5654-3472-283a-844553d5a701	4227	Selca
00050000-5654-3472-43ee-a33ec8a6b16d	2352	Selnica ob Dravi
00050000-5654-3472-5fe9-0af9bcdf7403	8333	Semič
00050000-5654-3472-392c-17afd9d26f4a	8281	Senovo
00050000-5654-3472-c70b-1fd370520701	6224	Senožeče
00050000-5654-3472-dda8-c99169852946	8290	Sevnica
00050000-5654-3472-2d6e-cc34828eb54d	6210	Sežana
00050000-5654-3472-4334-289e9eb99209	2214	Sladki Vrh
00050000-5654-3472-9086-7c6d5c7f30f8	5283	Slap ob Idrijci
00050000-5654-3472-d86c-4f30ba2bba3d	2380	Slovenj Gradec
00050000-5654-3472-2192-4c68dfcd09b8	2310	Slovenska Bistrica
00050000-5654-3472-953a-2b64aa61254c	3210	Slovenske Konjice
00050000-5654-3472-e2da-6eaf6d42d402	1216	Smlednik
00050000-5654-3472-18f3-89d63353b361	5232	Soča
00050000-5654-3472-ff7b-283da3c97554	1317	Sodražica
00050000-5654-3472-17af-039994019123	3335	Solčava
00050000-5654-3472-432c-7fb46ac8669b	5250	Solkan
00050000-5654-3472-372a-54f813b99d8b	4229	Sorica
00050000-5654-3472-1f01-c69e5ef5dc6e	4225	Sovodenj
00050000-5654-3472-9538-dbfd71bbf9fa	5281	Spodnja Idrija
00050000-5654-3472-83e6-f2488c5ebae0	2241	Spodnji Duplek
00050000-5654-3472-c45e-043a406d1cea	9245	Spodnji Ivanjci
00050000-5654-3472-dfde-33b640de5929	2277	Središče ob Dravi
00050000-5654-3472-6009-63b208560901	4267	Srednja vas v Bohinju
00050000-5654-3472-a0ed-42874b4962fa	8256	Sromlje 
00050000-5654-3472-12c4-1c40f0b162a5	5224	Srpenica
00050000-5654-3472-40c4-6df938cd8e70	1242	Stahovica
00050000-5654-3472-09f5-1dc9f43c3ea2	1332	Stara Cerkev
00050000-5654-3472-f673-61c0db895948	8342	Stari trg ob Kolpi
00050000-5654-3472-7f78-2390686f0020	1386	Stari trg pri Ložu
00050000-5654-3472-668a-4095fffa418a	2205	Starše
00050000-5654-3472-c5c7-80072b43c8ad	2289	Stoperce
00050000-5654-3472-e4cc-e46a1b187841	8322	Stopiče
00050000-5654-3472-14a1-0d07ee4c0ffb	3206	Stranice
00050000-5654-3472-0a13-31cfabfb0e52	8351	Straža
00050000-5654-3472-39c9-8c84f60caca8	1313	Struge
00050000-5654-3472-ff97-2e33bc73b576	8293	Studenec
00050000-5654-3472-5b0d-76a367973886	8331	Suhor
00050000-5654-3472-8f00-8962dc6b5608	2233	Sv. Ana v Slovenskih goricah
00050000-5654-3472-7c13-a5e767e2cd66	2235	Sv. Trojica v Slovenskih goricah
00050000-5654-3472-4f1f-6bfd058f141d	2353	Sveti Duh na Ostrem Vrhu
00050000-5654-3472-ae16-05d7cf82b99e	9244	Sveti Jurij ob Ščavnici
00050000-5654-3472-3fad-acdb2cadb50c	3264	Sveti Štefan
00050000-5654-3472-101d-27867fb03151	2258	Sveti Tomaž
00050000-5654-3472-7b2b-f6fdc1fa48c5	9204	Šalovci
00050000-5654-3472-341d-8f3657721d9e	5261	Šempas
00050000-5654-3472-a5d9-2a618d656ee3	5290	Šempeter pri Gorici
00050000-5654-3472-fa10-daef496e33ed	3311	Šempeter v Savinjski dolini
00050000-5654-3472-84e2-94b8b2f17523	4208	Šenčur
00050000-5654-3472-f7c7-257291ced18e	2212	Šentilj v Slovenskih goricah
00050000-5654-3472-c49a-0ca5fd20bcfb	8297	Šentjanž
00050000-5654-3472-9567-21b65ca6bb76	2373	Šentjanž pri Dravogradu
00050000-5654-3472-866c-8805fc896f59	8310	Šentjernej
00050000-5654-3472-50f0-5cf93be5a9c0	3230	Šentjur
00050000-5654-3472-d79d-48423d7ebec5	3271	Šentrupert
00050000-5654-3472-3b8a-fe28a80f59ae	8232	Šentrupert
00050000-5654-3472-e78c-8e0bb3d7ab78	1296	Šentvid pri Stični
00050000-5654-3472-d2d1-fc8b116de480	8275	Škocjan
00050000-5654-3472-be83-1b007b0d9821	6281	Škofije
00050000-5654-3472-47fa-a72ca8d73723	4220	Škofja Loka
00050000-5654-3472-7e9e-c5e03d734a10	3211	Škofja vas
00050000-5654-3472-c627-85d45abdffd1	1291	Škofljica
00050000-5654-3472-27bf-a2816472cc48	6274	Šmarje
00050000-5654-3472-2a0b-3194665cb3be	1293	Šmarje - Sap
00050000-5654-3472-1e4c-67192f6052b8	3240	Šmarje pri Jelšah
00050000-5654-3472-4678-41233bdce701	8220	Šmarješke Toplice
00050000-5654-3472-bc1c-be6b4c00440a	2315	Šmartno na Pohorju
00050000-5654-3472-2a3e-756bbb491608	3341	Šmartno ob Dreti
00050000-5654-3472-b965-3a6f7af3d5a6	3327	Šmartno ob Paki
00050000-5654-3472-06bb-6ea97c9359af	1275	Šmartno pri Litiji
00050000-5654-3472-2666-5098ec11e5c1	2383	Šmartno pri Slovenj Gradcu
00050000-5654-3472-7985-c20cd97bac32	3201	Šmartno v Rožni dolini
00050000-5654-3472-c5e5-c0dac7cfeb1c	3325	Šoštanj
00050000-5654-3472-11ab-8ac5882bb2a4	6222	Štanjel
00050000-5654-3472-d7f7-a72eee1056ca	3220	Štore
00050000-5654-3472-c8dd-0c7611663f22	3304	Tabor
00050000-5654-3472-e956-dcdafa5cf114	3221	Teharje
00050000-5654-3472-8bff-b2377907da09	9251	Tišina
00050000-5654-3472-796c-c723ea40dbd7	5220	Tolmin
00050000-5654-3472-9e82-2d497f9b4bc4	3326	Topolšica
00050000-5654-3472-9076-907d3f92129c	2371	Trbonje
00050000-5654-3472-6b45-1a8706625f51	1420	Trbovlje
00050000-5654-3472-6211-b4490ee180b0	8231	Trebelno 
00050000-5654-3472-d070-34f2474186ec	8210	Trebnje
00050000-5654-3472-c60e-e6df709eeb7f	5252	Trnovo pri Gorici
00050000-5654-3472-c4b0-f6b7921dfd5f	2254	Trnovska vas
00050000-5654-3472-7406-dab705b26eb9	1222	Trojane
00050000-5654-3472-6f60-dc95e2a21a6b	1236	Trzin
00050000-5654-3472-4af4-4d63c4e49d4f	4290	Tržič
00050000-5654-3472-1426-dae28bf15811	8295	Tržišče
00050000-5654-3472-eb10-308f1572fff7	1311	Turjak
00050000-5654-3472-3ed8-8279f2de1a88	9224	Turnišče
00050000-5654-3472-2861-17ed9f162f42	8323	Uršna sela
00050000-5654-3472-b5fb-faaa3b3966e8	1252	Vače
00050000-5654-3472-4f4d-2f7b10bbfaba	3320	Velenje 
00050000-5654-3472-866d-5ccae2141ef8	3322	Velenje - poštni predali
00050000-5654-3472-ddb0-f3ab9bc7cf10	8212	Velika Loka
00050000-5654-3472-e8a7-9e1a0a42c99c	2274	Velika Nedelja
00050000-5654-3472-1d28-26e1d0081581	9225	Velika Polana
00050000-5654-3472-50bb-4f07622eab16	1315	Velike Lašče
00050000-5654-3472-f1bb-2d6063e3fdcb	8213	Veliki Gaber
00050000-5654-3472-6bad-4d95ce081f4f	9241	Veržej
00050000-5654-3472-12e5-8363aafbbac4	1312	Videm - Dobrepolje
00050000-5654-3472-921b-0e0734a58782	2284	Videm pri Ptuju
00050000-5654-3472-c86b-a9cc01e85fe7	8344	Vinica
00050000-5654-3472-b283-782d3dbd34d0	5271	Vipava
00050000-5654-3472-a8b8-39ff24c36e58	4212	Visoko
00050000-5654-3472-ce4b-8ec2c253905b	1294	Višnja Gora
00050000-5654-3472-7f83-59144e0faa3c	3205	Vitanje
00050000-5654-3472-2284-6393d62e88ee	2255	Vitomarci
00050000-5654-3472-59b0-0ac952d87e68	1217	Vodice
00050000-5654-3472-70d4-9d6ef0e368f6	3212	Vojnik\t
00050000-5654-3472-112e-e149ac0ac874	5293	Volčja Draga
00050000-5654-3472-76b4-297391ef6649	2232	Voličina
00050000-5654-3472-087a-fb43e4efc402	3305	Vransko
00050000-5654-3472-4384-857ad8327c4a	6217	Vremski Britof
00050000-5654-3472-85b8-2dca081e8980	1360	Vrhnika
00050000-5654-3472-3e5d-f1270f5c8d43	2365	Vuhred
00050000-5654-3472-dfd5-74dae05a4fca	2367	Vuzenica
00050000-5654-3472-1b80-aecc3bf11a34	8292	Zabukovje 
00050000-5654-3472-f67d-e4812f887618	1410	Zagorje ob Savi
00050000-5654-3472-cc42-bfc57b07871f	1303	Zagradec
00050000-5654-3472-8691-5e56f3cbbb6c	2283	Zavrč
00050000-5654-3472-d8be-ca25a66eaf3a	8272	Zdole 
00050000-5654-3472-0e4f-833617cb312c	4201	Zgornja Besnica
00050000-5654-3472-19a8-82567bec38e8	2242	Zgornja Korena
00050000-5654-3472-7143-1452ed589814	2201	Zgornja Kungota
00050000-5654-3472-8799-20578212faf0	2316	Zgornja Ložnica
00050000-5654-3472-b995-ef1182d09ab8	2314	Zgornja Polskava
00050000-5654-3472-d404-0e5935e4777b	2213	Zgornja Velka
00050000-5654-3472-4918-90088bce76ab	4247	Zgornje Gorje
00050000-5654-3472-acaf-528b4c1c4ac7	4206	Zgornje Jezersko
00050000-5654-3472-1b57-7683631fe76e	2285	Zgornji Leskovec
00050000-5654-3472-f241-3aa356cfbe05	1432	Zidani Most
00050000-5654-3472-9b58-7d0516f4e1ad	3214	Zreče
00050000-5654-3472-d70c-9bb64cd4fffc	4209	Žabnica
00050000-5654-3472-5876-3ec0f0878cd9	3310	Žalec
00050000-5654-3472-9159-18a3d32c5451	4228	Železniki
00050000-5654-3472-22fa-6385fd6c555c	2287	Žetale
00050000-5654-3472-3926-6da0cf0f5e26	4226	Žiri
00050000-5654-3472-f64e-e48d45d93c83	4274	Žirovnica
00050000-5654-3472-cf1d-f8f951f0e1eb	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 29354811)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 29354387)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 29354135)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5654-3475-a26b-7d680a2414fe	00080000-5654-3474-f0e1-bda23dafa913	\N	00040000-5654-3472-10e8-7605dfecf687	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5654-3475-b5cf-7e6f0788fd92	00080000-5654-3474-f0e1-bda23dafa913	\N	00040000-5654-3472-10e8-7605dfecf687	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5654-3475-bb21-e09c0904c476	00080000-5654-3474-4de7-ba039e3d6784	\N	00040000-5654-3472-10e8-7605dfecf687	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 29354279)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5654-3472-7697-a595149c029d	novo leto	1	1	\N	t
00430000-5654-3472-c051-6ba2b31494c4	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5654-3472-947d-78e2468dd333	dan upora proti okupatorju	27	4	\N	t
00430000-5654-3472-d89b-3d9ba1519fae	praznik dela	1	5	\N	t
00430000-5654-3472-5a87-29cde26c914f	praznik dela	2	5	\N	t
00430000-5654-3472-21a8-bbb6ed1209f7	dan Primoža Trubarja	8	6	\N	f
00430000-5654-3472-0225-d910112081d6	dan državnosti	25	6	\N	t
00430000-5654-3472-199a-81cfd928504e	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5654-3472-9245-687ad124142f	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5654-3472-a84a-afbc804fc76d	dan suverenosti	25	10	\N	f
00430000-5654-3472-5bc5-c6da1cb4458c	dan spomina na mrtve	1	11	\N	t
00430000-5654-3472-5ca9-355b8b83babb	dan Rudolfa Maistra	23	11	\N	f
00430000-5654-3472-a4b4-baff3d213bef	božič	25	12	\N	t
00430000-5654-3472-11c5-d418c120cca9	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5654-3472-30cf-f1e8a96bd3d2	Marijino vnebovzetje	15	8	\N	t
00430000-5654-3472-6a95-d71e0eabeaf2	dan reformacije	31	10	\N	t
00430000-5654-3472-edf5-20d861682873	velikonočna nedelja	27	3	2016	t
00430000-5654-3472-6ad1-f38917c2729a	velikonočna nedelja	16	4	2017	t
00430000-5654-3472-619b-91e482967503	velikonočna nedelja	1	4	2018	t
00430000-5654-3472-5bab-601af891f0c9	velikonočna nedelja	21	4	2019	t
00430000-5654-3472-1681-e111fcb003c4	velikonočna nedelja	12	4	2020	t
00430000-5654-3472-fb54-e7c1c322ede2	velikonočna nedelja	4	4	2021	t
00430000-5654-3472-0bc0-b53bc7a5f880	velikonočna nedelja	17	4	2022	t
00430000-5654-3472-003d-194953f77109	velikonočna nedelja	9	4	2023	t
00430000-5654-3472-f1e8-339d542ac543	velikonočna nedelja	31	3	2024	t
00430000-5654-3472-74b3-efc904d55d10	velikonočna nedelja	20	4	2025	t
00430000-5654-3472-c838-1248e411d5e9	velikonočna nedelja	5	4	2026	t
00430000-5654-3472-8838-3fc916618ad6	velikonočna nedelja	28	3	2027	t
00430000-5654-3472-8734-05c7eecd6b25	velikonočna nedelja	16	4	2028	t
00430000-5654-3472-8a38-c3629a8563a2	velikonočna nedelja	1	4	2029	t
00430000-5654-3472-47c5-f3f6dc3eee62	velikonočna nedelja	21	4	2030	t
00430000-5654-3472-6d66-50c4d223139d	velikonočni ponedeljek	28	3	2016	t
00430000-5654-3472-98b1-af10baddd47a	velikonočni ponedeljek	17	4	2017	t
00430000-5654-3472-ea48-4edc4267aee7	velikonočni ponedeljek	2	4	2018	t
00430000-5654-3472-c74b-e5985a519b85	velikonočni ponedeljek	22	4	2019	t
00430000-5654-3472-16f1-af53bb94e4e7	velikonočni ponedeljek	13	4	2020	t
00430000-5654-3472-22f0-b586ea78be6e	velikonočni ponedeljek	5	4	2021	t
00430000-5654-3472-5c52-b898d054961b	velikonočni ponedeljek	18	4	2022	t
00430000-5654-3472-2d45-c037e9d1bae8	velikonočni ponedeljek	10	4	2023	t
00430000-5654-3472-80a1-2f06b6a1b5aa	velikonočni ponedeljek	1	4	2024	t
00430000-5654-3472-d7b3-8cede16833b2	velikonočni ponedeljek	21	4	2025	t
00430000-5654-3472-0126-1128c5556c96	velikonočni ponedeljek	6	4	2026	t
00430000-5654-3472-d706-6adcc7908511	velikonočni ponedeljek	29	3	2027	t
00430000-5654-3472-f344-cf07cd98884d	velikonočni ponedeljek	17	4	2028	t
00430000-5654-3472-50b2-3b6a15d33b7e	velikonočni ponedeljek	2	4	2029	t
00430000-5654-3472-7171-2294ffd7f491	velikonočni ponedeljek	22	4	2030	t
00430000-5654-3472-833f-2b6f980e0ed1	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5654-3472-8014-3442ac124bbf	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5654-3472-84e0-2018c98b78f8	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5654-3472-7c9e-2f795b61f0f9	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5654-3472-0532-f7832ae9399f	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5654-3472-82d4-665fddd20390	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5654-3472-b9af-d1388c513b41	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5654-3472-a844-627781788696	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5654-3472-1619-79cbd24aa8ee	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5654-3472-0122-9a1a885e9d57	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5654-3472-721a-733dca56392f	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5654-3472-eead-07184f80112e	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5654-3472-2ab0-d14d79f517ca	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5654-3472-cf4a-e6a8c8317d7b	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5654-3472-05ed-bb9783c8d353	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 29354239)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 29354251)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 29354399)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 29354825)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 29354835)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5654-3475-1f77-af2111618567	00080000-5654-3474-5974-400963335dee	0987	AK
00190000-5654-3475-6125-e38c7847914b	00080000-5654-3474-4de7-ba039e3d6784	0989	AK
00190000-5654-3475-0aec-037c589010d9	00080000-5654-3474-09e5-53665d8300f9	0986	AK
00190000-5654-3475-1d2a-9459f71bc215	00080000-5654-3475-f720-d98e5ed2799c	0984	AK
00190000-5654-3475-223a-a0e0e6a101cc	00080000-5654-3475-c4c3-fbd26a999563	0983	AK
00190000-5654-3475-66c4-898abd4b0c3f	00080000-5654-3475-09e0-76300304c1bc	0982	AK
00190000-5654-3476-1bf7-ef762b28bb11	00080000-5654-3476-3745-9d80e80758e6	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 29354734)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5654-3475-1ba4-6999e3f9fb99	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 29354843)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 29354428)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5654-3474-ef95-7de350c4b08b	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5654-3474-8952-946e18bc922f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5654-3474-409b-ac1e21f88ebf	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5654-3474-7258-dfe1af2918ea	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5654-3474-b2bc-295acc6588ca	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5654-3474-afb4-eb4e4c03b491	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5654-3474-3d59-e9ed95ceb5de	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 29354372)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 29354362)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 29354573)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 29354503)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 29354213)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 29353975)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5654-3476-3745-9d80e80758e6	00010000-5654-3472-6ec4-cf42e7412d97	2015-11-24 10:57:10	INS	a:0:{}
2	App\\Entity\\Option	00000000-5654-3476-3ec8-861cd908d5ee	00010000-5654-3472-6ec4-cf42e7412d97	2015-11-24 10:57:10	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5654-3476-1bf7-ef762b28bb11	00010000-5654-3472-6ec4-cf42e7412d97	2015-11-24 10:57:10	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 29354441)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 29354013)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5654-3472-caf0-1bdbcb996c15	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5654-3472-84ee-3c0954560475	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5654-3472-3dd4-0a94f8fb6a25	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5654-3472-ac01-522511d51b00	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5654-3472-fb5c-004ec1c27608	planer	Planer dogodkov v koledarju	t
00020000-5654-3472-836b-de3c59fcaac0	kadrovska	Kadrovska služba	t
00020000-5654-3472-0a7d-0b5764c58deb	arhivar	Ažuriranje arhivalij	t
00020000-5654-3472-0b71-776289caee68	igralec	Igralec	t
00020000-5654-3472-8fcd-745243dac57e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5654-3474-e345-d66cc20b7f17	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5654-3474-1cef-5b2c38a0d86b	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5654-3474-ad4e-968b4e69b4c8	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5654-3474-bff7-9e0279c36172	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5654-3474-e0f9-01eb006d9926	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5654-3474-93cf-161550c513a0	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5654-3474-180a-047813daca4e	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5654-3474-3ef5-fdb78153e257	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5654-3474-a5d5-8db3d9effd4e	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5654-3474-4d0c-a72ae0d6c360	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5654-3474-5bd9-ce8d757da757	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5654-3474-2f06-e8c2095d4ba6	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5654-3474-e63a-4e466700dff7	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5654-3474-dd60-fd330edaed1c	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5654-3474-e4a2-500a36f4ae99	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5654-3474-ee2d-86884662a0d1	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5654-3474-0403-310874c66b01	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5654-3474-c129-547e19fc4e0a	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3099 (class 0 OID 29353997)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5654-3472-e4ef-8f3557ba9573	00020000-5654-3472-3dd4-0a94f8fb6a25
00010000-5654-3472-6ec4-cf42e7412d97	00020000-5654-3472-3dd4-0a94f8fb6a25
00010000-5654-3474-8251-6a03ff76f84e	00020000-5654-3474-e345-d66cc20b7f17
00010000-5654-3474-df33-090e10ade677	00020000-5654-3474-1cef-5b2c38a0d86b
00010000-5654-3474-df33-090e10ade677	00020000-5654-3474-93cf-161550c513a0
00010000-5654-3474-df33-090e10ade677	00020000-5654-3474-4d0c-a72ae0d6c360
00010000-5654-3474-df33-090e10ade677	00020000-5654-3474-2f06-e8c2095d4ba6
00010000-5654-3474-df33-090e10ade677	00020000-5654-3474-e4a2-500a36f4ae99
00010000-5654-3474-df33-090e10ade677	00020000-5654-3474-0403-310874c66b01
00010000-5654-3474-df33-090e10ade677	00020000-5654-3474-bff7-9e0279c36172
00010000-5654-3474-a068-d7c4b9e557ea	00020000-5654-3474-1cef-5b2c38a0d86b
00010000-5654-3474-a068-d7c4b9e557ea	00020000-5654-3474-ad4e-968b4e69b4c8
00010000-5654-3474-a068-d7c4b9e557ea	00020000-5654-3474-bff7-9e0279c36172
00010000-5654-3474-a068-d7c4b9e557ea	00020000-5654-3474-e0f9-01eb006d9926
00010000-5654-3474-7fce-e5ef8ed16c45	00020000-5654-3474-1cef-5b2c38a0d86b
00010000-5654-3474-7fce-e5ef8ed16c45	00020000-5654-3474-ad4e-968b4e69b4c8
00010000-5654-3474-7fce-e5ef8ed16c45	00020000-5654-3474-bff7-9e0279c36172
00010000-5654-3474-7fce-e5ef8ed16c45	00020000-5654-3474-e0f9-01eb006d9926
00010000-5654-3474-7fce-e5ef8ed16c45	00020000-5654-3474-2f06-e8c2095d4ba6
00010000-5654-3474-ae69-e2c64378cdc0	00020000-5654-3474-ad4e-968b4e69b4c8
00010000-5654-3474-ae69-e2c64378cdc0	00020000-5654-3474-180a-047813daca4e
00010000-5654-3474-ae69-e2c64378cdc0	00020000-5654-3474-5bd9-ce8d757da757
00010000-5654-3474-ae69-e2c64378cdc0	00020000-5654-3474-e63a-4e466700dff7
00010000-5654-3474-ae69-e2c64378cdc0	00020000-5654-3474-2f06-e8c2095d4ba6
00010000-5654-3474-ae69-e2c64378cdc0	00020000-5654-3474-ee2d-86884662a0d1
00010000-5654-3474-a45c-139d660800a8	00020000-5654-3474-ad4e-968b4e69b4c8
00010000-5654-3474-a45c-139d660800a8	00020000-5654-3474-180a-047813daca4e
00010000-5654-3474-a45c-139d660800a8	00020000-5654-3474-a5d5-8db3d9effd4e
00010000-5654-3474-a45c-139d660800a8	00020000-5654-3474-5bd9-ce8d757da757
00010000-5654-3474-a45c-139d660800a8	00020000-5654-3474-e63a-4e466700dff7
00010000-5654-3474-a45c-139d660800a8	00020000-5654-3474-2f06-e8c2095d4ba6
00010000-5654-3474-a45c-139d660800a8	00020000-5654-3474-ee2d-86884662a0d1
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-ad4e-968b4e69b4c8
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-bff7-9e0279c36172
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-180a-047813daca4e
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-3ef5-fdb78153e257
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-a5d5-8db3d9effd4e
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-93cf-161550c513a0
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-5bd9-ce8d757da757
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-e63a-4e466700dff7
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-2f06-e8c2095d4ba6
00010000-5654-3474-e926-2d0417ed1311	00020000-5654-3474-ee2d-86884662a0d1
00010000-5654-3474-2a98-e291da6b8fd3	00020000-5654-3474-1cef-5b2c38a0d86b
00010000-5654-3474-2a98-e291da6b8fd3	00020000-5654-3474-e0f9-01eb006d9926
00010000-5654-3474-2a98-e291da6b8fd3	00020000-5654-3474-93cf-161550c513a0
00010000-5654-3474-2a98-e291da6b8fd3	00020000-5654-3474-4d0c-a72ae0d6c360
00010000-5654-3474-2a98-e291da6b8fd3	00020000-5654-3474-2f06-e8c2095d4ba6
00010000-5654-3474-2a98-e291da6b8fd3	00020000-5654-3474-e4a2-500a36f4ae99
00010000-5654-3474-2a98-e291da6b8fd3	00020000-5654-3474-0403-310874c66b01
00010000-5654-3474-a993-b9887d17a3d8	00020000-5654-3474-c129-547e19fc4e0a
\.


--
-- TOC entry 3144 (class 0 OID 29354455)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 29354393)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 29354339)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5654-3474-8dde-3596a51e6043	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5654-3474-caf4-4d5618104f86	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5654-3474-9be5-22e758f63c14	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 29353962)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5654-3472-57aa-af6f63325327	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5654-3472-0086-938270bf0e0e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5654-3472-dc10-4654b5e0e8a0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5654-3472-61eb-74e064fd1bbb	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5654-3472-be8b-fc6b0bf3c632	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 29353954)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5654-3472-056e-43fe0368a888	00230000-5654-3472-61eb-74e064fd1bbb	popa
00240000-5654-3472-a449-5d5009273ac3	00230000-5654-3472-61eb-74e064fd1bbb	oseba
00240000-5654-3472-5565-0a27840bced3	00230000-5654-3472-61eb-74e064fd1bbb	tippopa
00240000-5654-3472-a23f-e9ea10873ead	00230000-5654-3472-61eb-74e064fd1bbb	organizacijskaenota
00240000-5654-3472-0367-bcc1ea0a4a5a	00230000-5654-3472-61eb-74e064fd1bbb	sezona
00240000-5654-3472-a491-cd10db1c62cc	00230000-5654-3472-61eb-74e064fd1bbb	tipvaje
00240000-5654-3472-dea3-e068c0e8ab42	00230000-5654-3472-0086-938270bf0e0e	prostor
00240000-5654-3472-7bd5-ece408f7cef2	00230000-5654-3472-61eb-74e064fd1bbb	besedilo
00240000-5654-3472-c0c9-42f86ca53b4b	00230000-5654-3472-61eb-74e064fd1bbb	uprizoritev
00240000-5654-3472-9b4b-98c1381c4abc	00230000-5654-3472-61eb-74e064fd1bbb	funkcija
00240000-5654-3472-d940-28fa00fa3b0f	00230000-5654-3472-61eb-74e064fd1bbb	tipfunkcije
00240000-5654-3472-ae01-b1505215e3d8	00230000-5654-3472-61eb-74e064fd1bbb	alternacija
00240000-5654-3472-f87a-676991dec536	00230000-5654-3472-57aa-af6f63325327	pogodba
00240000-5654-3472-65a8-f5c8d527fea4	00230000-5654-3472-61eb-74e064fd1bbb	zaposlitev
00240000-5654-3472-333f-b3991c247a3a	00230000-5654-3472-61eb-74e064fd1bbb	zvrstuprizoritve
00240000-5654-3472-8167-a44a681e6282	00230000-5654-3472-57aa-af6f63325327	programdela
00240000-5654-3472-b223-ecb11a0df83b	00230000-5654-3472-61eb-74e064fd1bbb	zapis
\.


--
-- TOC entry 3093 (class 0 OID 29353949)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0b380b86-835f-4b14-ac9b-36e2133b8c50	00240000-5654-3472-056e-43fe0368a888	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 29354520)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5654-3475-2171-82bb95a29762	000e0000-5654-3475-f09b-e8543b80baa2	00080000-5654-3474-f0e1-bda23dafa913	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5654-3472-afa6-f71469ca8335
00270000-5654-3475-fbdd-c4d38a7af441	000e0000-5654-3475-f09b-e8543b80baa2	00080000-5654-3474-f0e1-bda23dafa913	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5654-3472-afa6-f71469ca8335
\.


--
-- TOC entry 3109 (class 0 OID 29354097)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 29354349)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5654-3475-ab4c-9929a75b231b	00180000-5654-3475-db00-7c6191497e6a	000c0000-5654-3475-0a3d-3ec9c9c7c765	00090000-5654-3475-d09c-fc3c39f915f2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5654-3475-8659-232965cf31cb	00180000-5654-3475-db00-7c6191497e6a	000c0000-5654-3475-cd5f-c7494b55ffd6	00090000-5654-3475-ed05-790341b5caab	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5654-3475-0e71-4fdefafc66bd	00180000-5654-3475-db00-7c6191497e6a	000c0000-5654-3475-2e45-9348703c9ec6	00090000-5654-3475-75c1-f0ca5d425cb4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5654-3475-bbf3-b4fb959f7595	00180000-5654-3475-db00-7c6191497e6a	000c0000-5654-3475-2bcd-a69a01591a19	00090000-5654-3475-6efd-6f6109b0f831	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5654-3475-b9f7-dedaffdb46e2	00180000-5654-3475-db00-7c6191497e6a	000c0000-5654-3475-3f0e-b47600bf617d	00090000-5654-3475-9d51-7383f1e6cce6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5654-3475-ff09-f33757c599c5	00180000-5654-3475-a663-9d73b81816ac	\N	00090000-5654-3475-9d51-7383f1e6cce6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5654-3475-6797-85823774a87b	00180000-5654-3475-a663-9d73b81816ac	\N	00090000-5654-3475-ed05-790341b5caab	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 29354561)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5654-3472-3e97-76f3d0999512	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5654-3472-4b9d-2244384f4cfa	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5654-3472-0734-1c6f08ed827c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5654-3472-7360-84417e78e663	04	Režija	Režija	Režija	umetnik	30
000f0000-5654-3472-46f0-4c9ff83922d8	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5654-3472-4213-a8eec59984ce	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5654-3472-a83f-5ce72d69efa5	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5654-3472-91ba-6411258b7b67	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5654-3472-2a97-afc980851812	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5654-3472-1bda-b2ba382278f5	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5654-3472-6115-323833adcf80	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5654-3472-4a40-39280c936a14	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5654-3472-4024-0b5e7e654cb1	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5654-3472-87d1-05320f7055bc	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5654-3472-6197-485feba42b3b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5654-3472-f67d-a10754296538	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5654-3472-e3a7-821c6aa615e1	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5654-3472-7994-7980c64ed51d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 29354048)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5654-3474-611f-768226038829	0001	šola	osnovna ali srednja šola
00400000-5654-3474-a7aa-237782a9d3ec	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5654-3474-030e-2d030ef459fa	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 29354854)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5654-3472-da40-aa6cf838b9ef	01	Velika predstava	f	1.00	1.00
002b0000-5654-3472-38f6-76194c832c11	02	Mala predstava	f	0.50	0.50
002b0000-5654-3472-9ce6-f1b3750e59be	03	Mala koprodukcija	t	0.40	1.00
002b0000-5654-3472-e07a-ded94eec5b57	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5654-3472-00fd-b2b6f8bdc220	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 29354329)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5654-3472-311f-608a254d80e5	0001	prva vaja	prva vaja
00420000-5654-3472-2b40-8afa379842a9	0002	tehnična vaja	tehnična vaja
00420000-5654-3472-3488-6f66ded433f3	0003	lučna vaja	lučna vaja
00420000-5654-3472-1fce-728c6e85e89e	0004	kostumska vaja	kostumska vaja
00420000-5654-3472-a020-be68a905b560	0005	foto vaja	foto vaja
00420000-5654-3472-eeca-59392df433cf	0006	1. glavna vaja	1. glavna vaja
00420000-5654-3472-c1ff-ffbac1496405	0007	2. glavna vaja	2. glavna vaja
00420000-5654-3472-7fc9-36c8987e9b71	0008	1. generalka	1. generalka
00420000-5654-3472-a32a-8098bd451914	0009	2. generalka	2. generalka
00420000-5654-3472-a8c5-a1bfd24dbee4	0010	odprta generalka	odprta generalka
00420000-5654-3472-5bcc-bd26f37f0b78	0011	obnovitvena vaja	obnovitvena vaja
00420000-5654-3472-28fa-42c9582c99a2	0012	pevska vaja	pevska vaja
00420000-5654-3472-7cfb-b74846aec25f	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5654-3472-19e5-298864f35a10	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 29354170)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 29353984)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5654-3472-6ec4-cf42e7412d97	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO8sz6zVYLzpUxUz2aqXVztu3qteYiKne	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5654-3474-cff6-48c27a799c08	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5654-3474-83d2-6fb92f996033	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5654-3474-2624-e586d26854bb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5654-3474-ecfc-b81f76d309ad	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5654-3474-8c7d-c22e48d36c86	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5654-3474-2877-f4c29cdfa948	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5654-3474-fbfb-002f30816f7e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5654-3474-5f5f-e14074d3e6f6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5654-3474-f6e8-1fe2368ab6f3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5654-3474-8251-6a03ff76f84e	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5654-3474-5044-23144f8f04a4	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5654-3474-df33-090e10ade677	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5654-3474-a068-d7c4b9e557ea	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5654-3474-7fce-e5ef8ed16c45	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5654-3474-ae69-e2c64378cdc0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5654-3474-a45c-139d660800a8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5654-3474-e926-2d0417ed1311	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5654-3474-2a98-e291da6b8fd3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5654-3474-a993-b9887d17a3d8	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5654-3472-e4ef-8f3557ba9573	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 29354611)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5654-3475-b211-91d7e0b1f097	00160000-5654-3474-640f-9a30d2b4c693	\N	00140000-5654-3472-3eea-9ab86a0a2e71	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5654-3474-b2bc-295acc6588ca
000e0000-5654-3475-f09b-e8543b80baa2	00160000-5654-3474-8dde-ca9d9f1391d6	\N	00140000-5654-3472-a864-d57543852dfe	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5654-3474-afb4-eb4e4c03b491
000e0000-5654-3475-87aa-f83dbefdfb8c	\N	\N	00140000-5654-3472-a864-d57543852dfe	00190000-5654-3475-1f77-af2111618567	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5654-3474-b2bc-295acc6588ca
000e0000-5654-3475-dc76-89f83ea0b9a3	\N	\N	00140000-5654-3472-a864-d57543852dfe	00190000-5654-3475-1f77-af2111618567	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5654-3474-b2bc-295acc6588ca
000e0000-5654-3475-210d-f5c697c307b9	\N	\N	00140000-5654-3472-a864-d57543852dfe	00190000-5654-3475-1f77-af2111618567	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5654-3474-ef95-7de350c4b08b
000e0000-5654-3475-5363-0404a2cf412b	\N	\N	00140000-5654-3472-a864-d57543852dfe	00190000-5654-3475-1f77-af2111618567	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5654-3474-ef95-7de350c4b08b
\.


--
-- TOC entry 3123 (class 0 OID 29354269)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5654-3475-2131-1c2f9462b3bf	\N	000e0000-5654-3475-f09b-e8543b80baa2	1	
00200000-5654-3475-9ea2-21e2b7bc92ed	\N	000e0000-5654-3475-f09b-e8543b80baa2	2	
00200000-5654-3475-71b4-b8734f290ecd	\N	000e0000-5654-3475-f09b-e8543b80baa2	3	
00200000-5654-3475-66f5-eeb2447cc521	\N	000e0000-5654-3475-f09b-e8543b80baa2	4	
00200000-5654-3475-28a3-d1971097fe2d	\N	000e0000-5654-3475-f09b-e8543b80baa2	5	
\.


--
-- TOC entry 3140 (class 0 OID 29354420)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 29354534)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5654-3472-21e5-61aa6289fe46	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5654-3472-fa87-13b7c1531df9	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5654-3472-d7be-83deaad4e24b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5654-3472-fddb-0f022e2f2c2d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5654-3472-8ccd-b902f84bed2e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5654-3472-7c36-d61650be6a73	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5654-3472-09f8-fb3005af8126	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5654-3472-ebb7-0775f15c75c3	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5654-3472-afa6-f71469ca8335	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5654-3472-4990-14ffca20b9a2	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5654-3472-3336-6e9a77b7ffef	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5654-3472-3109-678dd78cc2f0	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5654-3472-8c0c-82fc245b4c8a	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5654-3472-34b1-3caac8521077	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5654-3472-a171-13c7249f70a5	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5654-3472-1c1b-b29012032b05	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5654-3472-66ec-f5140e524bc3	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5654-3472-b657-19c9576284bd	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5654-3472-4028-37ef3c312d72	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5654-3472-9d94-c3872550b939	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5654-3472-8baa-457e60261a57	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5654-3472-f076-2bdb72e95539	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5654-3472-1cd9-a96bd1a6ef6f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5654-3472-5b75-fd920ccda64e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5654-3472-f311-c6a0d1da79fc	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5654-3472-f382-cbeccc7e601c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5654-3472-1b55-296fcfd68a9b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5654-3472-a4f4-9abb7c7ea24b	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 29354904)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 29354873)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 29354916)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 29354492)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5654-3475-3c72-4d87cb5698d2	00090000-5654-3475-ed05-790341b5caab	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5654-3475-7856-1c48a7af8912	00090000-5654-3475-75c1-f0ca5d425cb4	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5654-3475-a88b-077abd516aff	00090000-5654-3475-fcc0-086332ff0c07	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5654-3475-883a-bfd53dcb4b92	00090000-5654-3475-e8c4-40c8289efa28	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5654-3475-d06b-9f82464aa364	00090000-5654-3475-6f7d-1de6ecbfff92	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5654-3475-2327-e4f0529d97ec	00090000-5654-3475-bf5f-e2a644cac05d	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 29354313)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 29354601)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5654-3472-3eea-9ab86a0a2e71	01	Drama	drama (SURS 01)
00140000-5654-3472-92a9-56185ac74323	02	Opera	opera (SURS 02)
00140000-5654-3472-eaa6-a9aeb2ddcb83	03	Balet	balet (SURS 03)
00140000-5654-3472-f084-3da33a9dfb7a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5654-3472-c54b-c23d7700144b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5654-3472-a864-d57543852dfe	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5654-3472-c378-4ed8d33779a4	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 29354482)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 29354047)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 29354660)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 29354650)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 29354038)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 29354517)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 29354559)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 29354957)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 29354301)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 29354323)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 29354328)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 29354871)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 29354196)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 29354728)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 29354478)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 29354267)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 29354234)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 29354210)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 29354385)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 29354934)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 29354941)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 29354965)
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
-- TOC entry 2726 (class 2606 OID 29354412)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 29354168)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 29354066)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 29354130)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 29354093)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 29354027)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 29354012)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 29354418)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 29354454)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 29354596)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 29354121)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 29354156)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 29354823)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 29354391)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 29354146)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 29354286)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 29354255)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 29354247)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 29354403)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 29354832)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 29354840)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 29354810)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 29354852)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 29354436)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 29354376)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 29354367)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 29354583)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 29354510)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 29354222)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 29353983)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 29354445)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 29354001)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 29354021)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 29354463)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 29354398)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 29354347)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 29353971)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 29353959)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 29353953)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 29354530)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 29354102)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 29354358)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 29354570)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 29354055)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 29354864)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 29354336)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 29354181)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 29353996)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 29354629)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 29354276)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 29354426)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 29354542)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 29354914)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 29354898)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 29354922)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 29354500)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 29354317)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 29354609)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 29354490)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 29354311)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 29354312)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 29354310)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 29354309)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 29354308)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 29354531)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 29354532)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 29354533)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 29354936)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 29354935)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 29354123)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 29354124)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 29354419)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 29354902)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 29354901)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 29354903)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 29354900)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 29354899)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 29354405)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 29354404)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 29354277)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 29354278)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 29354479)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 29354481)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 29354480)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 29354212)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 29354211)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 29354853)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 29354598)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 29354599)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 29354600)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 29354923)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 29354634)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 29354631)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 29354635)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 29354633)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 29354632)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 29354183)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 29354182)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 29354096)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 29354446)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 29354028)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 29354029)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 29354466)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 29354465)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 29354464)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 29354133)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 29354132)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 29354134)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 29354250)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 29354248)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 29354249)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 29353961)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 29354371)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 29354369)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 29354368)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 29354370)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 29354002)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 29354003)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 29354427)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 29354958)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 29354519)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 29354518)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 29354966)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 29354967)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 29354392)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 29354511)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 29354512)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 29354733)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 29354732)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 29354729)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 29354730)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 29354731)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 29354148)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 29354147)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 29354149)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 29354440)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 29354439)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 29354833)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 29354834)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 29354664)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 29354665)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 29354662)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 29354663)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 29354501)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 29354502)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 29354380)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 29354379)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 29354377)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 29354378)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 29354652)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 29354651)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 29354223)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 29354237)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 29354236)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 29354235)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 29354238)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 29354268)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 29354256)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 29354257)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 29354824)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 29354872)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 29354942)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 29354943)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 29354068)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 29354067)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 29354103)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 29354104)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 29354318)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 29354361)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 29354360)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 29354359)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 29354303)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 29354304)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 29354307)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 29354302)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 29354306)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 29354305)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 29354122)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 29354056)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 29354057)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 29354197)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 29354199)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 29354198)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 29354200)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 29354386)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 29354597)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 29354630)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 29354571)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 29354572)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 29354094)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 29354095)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 29354491)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 29353972)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 29354169)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 29354131)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 29353960)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 29354865)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 29354438)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 29354437)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 29354337)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 29354338)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 29354661)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 29354157)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 29354610)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 29354915)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 29354841)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 29354842)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 29354560)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 29354348)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 29354022)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 29355138)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 29355143)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 29355168)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 29355158)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 29355133)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 29355153)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 29355163)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 29355148)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 29355338)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 29355343)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 29355348)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 29355513)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 29355508)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 29355023)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 29355028)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 29355253)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 29355493)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 29355488)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 29355498)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 29355483)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 29355478)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 29355248)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 29355243)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 29355123)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 29355128)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 29355293)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 29355303)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 29355298)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 29355078)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 29355073)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 29355233)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 29355468)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 29355353)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 29355358)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 29355363)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 29355503)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 29355383)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 29355368)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 29355388)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 29355378)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 29355373)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 29355068)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 29355063)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 29355008)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 29355003)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 29355273)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 29354983)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 29354988)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 29355288)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 29355283)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 29355278)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 29355038)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 29355033)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 29355043)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 29355103)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 29355093)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 29355098)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 29354968)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 29355208)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 29355198)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 29355193)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 29355203)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 29354973)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 29354978)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 29355258)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 29355528)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 29355333)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 29355328)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 29355533)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 29355538)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 29355238)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 29355318)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 29355323)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 29355443)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 29355438)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 29355423)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 29355428)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 29355433)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 29355053)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 29355048)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 29355058)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 29355268)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 29355263)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 29355453)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 29355458)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 29355413)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 29355418)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 29355403)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 29355408)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 29355308)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 29355313)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 29355228)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 29355223)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 29355213)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 29355218)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 29355398)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 29355393)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 29355083)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 29355088)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 29355118)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 29355108)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 29355113)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 29355448)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 29355463)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 29355473)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 29355518)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 29355523)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 29354998)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 29354993)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 29355013)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 29355018)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 29355173)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 29355188)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 29355183)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 29355178)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-24 10:57:12 CET

--
-- PostgreSQL database dump complete
--

