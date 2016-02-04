--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-02-04 16:27:23 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 257 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 43674058)
-- Name: abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abonma (
    id uuid NOT NULL,
    stpredstav integer,
    stkuponov integer,
    ime character varying(40) DEFAULT NULL::character varying,
    opis text,
    barva character varying(7) DEFAULT NULL::character varying,
    kapaciteta integer
);


--
-- TOC entry 241 (class 1259 OID 43674676)
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
-- TOC entry 240 (class 1259 OID 43674660)
-- Name: arhivalija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE arhivalija (
    id uuid NOT NULL,
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
-- TOC entry 184 (class 1259 OID 43674051)
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
-- TOC entry 183 (class 1259 OID 43674049)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 43674537)
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
-- TOC entry 234 (class 1259 OID 43674567)
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
-- TOC entry 255 (class 1259 OID 43674979)
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
-- TOC entry 212 (class 1259 OID 43674373)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 43674298)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_splosni_id uuid,
    tehnicni_id uuid,
    prostor_id uuid,
    sezona_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    barva character varying(7) DEFAULT NULL::character varying,
    nadrejenogostovanje_id uuid
);


--
-- TOC entry 206 (class 1259 OID 43674324)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 43674329)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 43674901)
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
-- TOC entry 196 (class 1259 OID 43674204)
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
-- TOC entry 242 (class 1259 OID 43674689)
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
-- TOC entry 227 (class 1259 OID 43674495)
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
-- TOC entry 202 (class 1259 OID 43674272)
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
-- TOC entry 199 (class 1259 OID 43674244)
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
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 43674221)
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
-- TOC entry 216 (class 1259 OID 43674409)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 43674959)
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
-- TOC entry 254 (class 1259 OID 43674972)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 43674994)
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
-- TOC entry 220 (class 1259 OID 43674433)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 43674178)
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
-- TOC entry 187 (class 1259 OID 43674078)
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
-- TOC entry 191 (class 1259 OID 43674145)
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
-- TOC entry 188 (class 1259 OID 43674089)
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
-- TOC entry 180 (class 1259 OID 43674023)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 43674042)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 43674440)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 43674475)
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
-- TOC entry 237 (class 1259 OID 43674608)
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
-- TOC entry 190 (class 1259 OID 43674125)
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
-- TOC entry 193 (class 1259 OID 43674170)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 43674845)
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
-- TOC entry 217 (class 1259 OID 43674415)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 43674155)
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
-- TOC entry 204 (class 1259 OID 43674290)
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
-- TOC entry 200 (class 1259 OID 43674259)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporednasezvsehupr integer,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 43674265)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 171 (class 1259 OID 36291776)
-- Name: prisotnost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prisotnost (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    terminstoritve_id uuid
);


--
-- TOC entry 219 (class 1259 OID 43674427)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 43674859)
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
-- TOC entry 246 (class 1259 OID 43674869)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 43674758)
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
-- TOC entry 247 (class 1259 OID 43674877)
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
-- TOC entry 223 (class 1259 OID 43674455)
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
    opis text,
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 43674400)
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
-- TOC entry 214 (class 1259 OID 43674390)
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
-- TOC entry 236 (class 1259 OID 43674597)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 43674527)
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
-- TOC entry 198 (class 1259 OID 43674233)
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
-- TOC entry 177 (class 1259 OID 43673994)
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
-- TOC entry 176 (class 1259 OID 43673992)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 43674469)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 43674032)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 43674016)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 43674483)
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
-- TOC entry 218 (class 1259 OID 43674421)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 43674344)
-- Name: sezona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sezona (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date
);


--
-- TOC entry 175 (class 1259 OID 43673981)
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
-- TOC entry 174 (class 1259 OID 43673973)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 43673968)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 43674544)
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
-- TOC entry 189 (class 1259 OID 43674117)
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
-- TOC entry 211 (class 1259 OID 43674363)
-- Name: terminstoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE terminstoritve (
    id uuid NOT NULL,
    dogodek_id uuid,
    alternacija_id uuid,
    oseba_id uuid NOT NULL,
    deltaplaniranzacetek integer,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deltaplanirankonec integer,
    planirankonec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    dezurni boolean,
    gost boolean,
    sodelujoc boolean,
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 213 (class 1259 OID 43674380)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 43674585)
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
-- TOC entry 186 (class 1259 OID 43674068)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 43674889)
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
-- TOC entry 208 (class 1259 OID 43674334)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 43674190)
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
-- TOC entry 178 (class 1259 OID 43674003)
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
-- TOC entry 239 (class 1259 OID 43674635)
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
-- TOC entry 210 (class 1259 OID 43674354)
-- Name: ura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ura (
    id uuid NOT NULL,
    oseba_id uuid,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 43674283)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 43674447)
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
-- TOC entry 233 (class 1259 OID 43674558)
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
-- TOC entry 251 (class 1259 OID 43674939)
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
-- TOC entry 250 (class 1259 OID 43674908)
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
-- TOC entry 252 (class 1259 OID 43674951)
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
-- TOC entry 229 (class 1259 OID 43674520)
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
-- TOC entry 172 (class 1259 OID 37017863)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 43674625)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 43674510)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 43674054)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 43673997)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 43674058)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56b3-6dd7-353b-62d4f278c256	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56b3-6dd7-fd7a-f5a73e0694de	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56b3-6dd7-b664-89958e8c464e	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 43674676)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56b3-6dd8-4127-748443caedcc	000d0000-56b3-6dd7-2207-1cce9d940bec	\N	00090000-56b3-6dd7-aeae-0830e139582f	000b0000-56b3-6dd7-2cf7-7ecfae520429	0001	f	\N	\N	\N	3	t	t	t
000c0000-56b3-6dd8-afa6-619c4b2f95ee	000d0000-56b3-6dd7-ce8b-cc1c8031b19a	00100000-56b3-6dd7-ff79-eddef2d4deed	00090000-56b3-6dd7-8efe-6ba4ee0137ad	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56b3-6dd8-e70c-199a1a01b79b	000d0000-56b3-6dd7-2ca0-8d05d15a2286	00100000-56b3-6dd7-6b3f-e3ae4dd37826	00090000-56b3-6dd7-7a6a-76a9b7b4f79a	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56b3-6dd8-0c71-b969a7a26a8c	000d0000-56b3-6dd7-f851-336bc56d3df6	\N	00090000-56b3-6dd7-e074-93881907a9f3	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56b3-6dd8-8fd1-acf43de63eda	000d0000-56b3-6dd7-8719-7a5ad953662a	\N	00090000-56b3-6dd7-6da2-8fbb9cc177c7	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56b3-6dd8-3fc1-3b13e3f88f4e	000d0000-56b3-6dd8-cb8c-e6f72130b783	\N	00090000-56b3-6dd7-c61c-022e72d3d3cc	000b0000-56b3-6dd7-8a42-e13327a41697	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56b3-6dd8-616d-1d0930b29472	000d0000-56b3-6dd7-087f-5ffc9517a8cd	00100000-56b3-6dd7-2874-853ed810e0d8	00090000-56b3-6dd7-9a6e-138e82fd5b6f	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56b3-6dd8-2973-cc433058112f	000d0000-56b3-6dd8-1324-2eab3ca56d20	\N	00090000-56b3-6dd7-a378-6cffdb24cc3e	000b0000-56b3-6dd7-3a62-276d8b293d1c	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56b3-6dd8-af1e-5535866aa9b5	000d0000-56b3-6dd7-087f-5ffc9517a8cd	00100000-56b3-6dd7-6bc0-85920fe0ad6e	00090000-56b3-6dd7-b341-401ce8a92756	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56b3-6dd8-d63a-850287767d5e	000d0000-56b3-6dd7-087f-5ffc9517a8cd	00100000-56b3-6dd7-e30a-4ab2ca47e634	00090000-56b3-6dd7-8325-464313a2e09b	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56b3-6dd8-5407-6c2e7d21e253	000d0000-56b3-6dd7-087f-5ffc9517a8cd	00100000-56b3-6dd7-755d-830562d06369	00090000-56b3-6dd7-32f7-e04d65cf365b	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56b3-6dd8-e655-080f608288d3	000d0000-56b3-6dd8-283b-17cb97389a1a	00100000-56b3-6dd7-ff79-eddef2d4deed	00090000-56b3-6dd7-8efe-6ba4ee0137ad	000b0000-56b3-6dd7-0f8e-191f599615c4	0012	t	\N	\N	\N	2	t	t	t
000c0000-56b3-6dd8-ab7f-1388e672de75	000d0000-56b3-6dd8-31f1-297812c5f4c7	\N	00090000-56b3-6dd7-a378-6cffdb24cc3e	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56b3-6dd8-f7a0-fc7da81873eb	000d0000-56b3-6dd8-31f1-297812c5f4c7	\N	00090000-56b3-6dd7-219d-6575dd52ecd6	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56b3-6dd8-b094-12fb7bd33c29	000d0000-56b3-6dd8-556f-b10907751f6b	00100000-56b3-6dd7-6b3f-e3ae4dd37826	00090000-56b3-6dd7-7a6a-76a9b7b4f79a	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56b3-6dd8-32ab-530abb8bb529	000d0000-56b3-6dd8-556f-b10907751f6b	\N	00090000-56b3-6dd7-219d-6575dd52ecd6	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56b3-6dd8-2b59-a78554867ce1	000d0000-56b3-6dd8-f160-0c47e62b6f51	\N	00090000-56b3-6dd7-219d-6575dd52ecd6	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56b3-6dd8-c016-4a089e7b467d	000d0000-56b3-6dd8-f160-0c47e62b6f51	\N	00090000-56b3-6dd7-a378-6cffdb24cc3e	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56b3-6dd8-e447-3565fc18c45d	000d0000-56b3-6dd8-e793-0a236790ebdf	00100000-56b3-6dd7-2874-853ed810e0d8	00090000-56b3-6dd7-9a6e-138e82fd5b6f	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56b3-6dd8-0fb6-9ecdf737986d	000d0000-56b3-6dd8-e793-0a236790ebdf	\N	00090000-56b3-6dd7-219d-6575dd52ecd6	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56b3-6dd8-4d25-46b858e14588	000d0000-56b3-6dd8-0e03-11e3a0c7994f	\N	00090000-56b3-6dd7-219d-6575dd52ecd6	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56b3-6dd8-06f1-80f6facb5dbb	000d0000-56b3-6dd8-0e03-11e3a0c7994f	00100000-56b3-6dd7-2874-853ed810e0d8	00090000-56b3-6dd7-9a6e-138e82fd5b6f	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56b3-6dd8-5fd2-33735e957671	000d0000-56b3-6dd8-6e63-fcc5a0787dfe	\N	00090000-56b3-6dd7-219d-6575dd52ecd6	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56b3-6dd8-69c1-c29ed1654e02	000d0000-56b3-6dd8-5af6-919b5ae25712	\N	00090000-56b3-6dd7-a378-6cffdb24cc3e	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56b3-6dd8-4ab2-28b2a0b3b6c4	000d0000-56b3-6dd8-67f7-724ee738b1ff	\N	00090000-56b3-6dd7-a378-6cffdb24cc3e	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56b3-6dd8-9648-f2287a16645e	000d0000-56b3-6dd8-67f7-724ee738b1ff	00100000-56b3-6dd7-6b3f-e3ae4dd37826	00090000-56b3-6dd7-7a6a-76a9b7b4f79a	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56b3-6dd8-758f-beadbe51c4ab	000d0000-56b3-6dd8-3920-40a4346529e0	\N	00090000-56b3-6dd7-b707-af4b31cfb525	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56b3-6dd8-c001-c9160fdb468b	000d0000-56b3-6dd8-3920-40a4346529e0	\N	00090000-56b3-6dd7-54da-93b854480c96	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56b3-6dd8-aac5-886d4d85fcba	000d0000-56b3-6dd8-a5e5-77ae1390042d	\N	00090000-56b3-6dd7-a378-6cffdb24cc3e	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56b3-6dd8-72dc-81197941915d	000d0000-56b3-6dd8-a5e5-77ae1390042d	00100000-56b3-6dd7-6b3f-e3ae4dd37826	00090000-56b3-6dd7-7a6a-76a9b7b4f79a	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56b3-6dd8-7857-750093ee0d5e	000d0000-56b3-6dd8-a5e5-77ae1390042d	\N	00090000-56b3-6dd7-54da-93b854480c96	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56b3-6dd8-3a14-b1e0e8d36383	000d0000-56b3-6dd8-a5e5-77ae1390042d	\N	00090000-56b3-6dd7-b707-af4b31cfb525	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56b3-6dd8-3e5c-0de9ec1d0e44	000d0000-56b3-6dd8-1f3b-b2c54392f424	\N	00090000-56b3-6dd7-a378-6cffdb24cc3e	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56b3-6dd8-4550-cd23893edaf1	000d0000-56b3-6dd8-de1c-30041cfbd15c	00100000-56b3-6dd7-6b3f-e3ae4dd37826	00090000-56b3-6dd7-7a6a-76a9b7b4f79a	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56b3-6dd8-9e10-d41e12f703d2	000d0000-56b3-6dd8-de1c-30041cfbd15c	\N	00090000-56b3-6dd7-219d-6575dd52ecd6	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 43674660)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 43674051)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3191 (class 0 OID 43674537)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56b3-6dd7-ad66-ea9337403fda	00160000-56b3-6dd7-3f04-67752863462a	00090000-56b3-6dd7-54da-93b854480c96	aizv	10	t
003d0000-56b3-6dd7-8c8a-510996dcfa36	00160000-56b3-6dd7-3f04-67752863462a	00090000-56b3-6dd7-f6ee-eddd05760918	apri	14	t
003d0000-56b3-6dd7-6f4d-1ee778d374e5	00160000-56b3-6dd7-1ba9-7a2d78c5f598	00090000-56b3-6dd7-b707-af4b31cfb525	aizv	11	t
003d0000-56b3-6dd7-eb5a-f61b375c1e02	00160000-56b3-6dd7-5701-2dc2173696bc	00090000-56b3-6dd7-fc18-d931508f0cfc	aizv	12	t
003d0000-56b3-6dd7-c460-cb3447fd1b1e	00160000-56b3-6dd7-3f04-67752863462a	00090000-56b3-6dd7-219d-6575dd52ecd6	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 43674567)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56b3-6dd7-3f04-67752863462a	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56b3-6dd7-1ba9-7a2d78c5f598	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56b3-6dd7-5701-2dc2173696bc	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 43674979)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 43674373)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 43674298)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva, nadrejenogostovanje_id) FROM stdin;
00180000-56b3-6dd7-01be-758daafa52b7	\N	\N	\N	\N	00440000-56b3-6dd7-7dbf-d0ef98c4976c	00220000-56b3-6dd7-f150-f2349d4d9023	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N	\N
00180000-56b3-6dd7-3669-3de971d1a23f	\N	\N	\N	\N	00440000-56b3-6dd7-989e-e9ce3197bbe1	00220000-56b3-6dd7-9db7-5f3673a1f379	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N	\N
00180000-56b3-6dd7-e56a-970582f75e6c	\N	\N	\N	001e0000-56b3-6dd7-654c-deaea47c2cd8	\N	00220000-56b3-6dd7-f150-f2349d4d9023	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N	\N
00180000-56b3-6dd7-5352-9927a97a9427	\N	\N	\N	001e0000-56b3-6dd7-fc11-7c3544719ac2	\N	00220000-56b3-6dd7-9db7-5f3673a1f379	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N	\N
00180000-56b3-6dd8-dc40-9ca94800ab7a	\N	00200000-56b3-6dd8-3254-75c560b72e95	\N	\N	\N	00220000-56b3-6dd7-1587-95170dd73c5e	\N	2012-05-20 10:00:00	2012-05-20 12:00:00	200s	200s	\N	Vaja 1.	\N	\N
00180000-56b3-6dd8-b8b6-5d7f2ed7ec63	\N	00200000-56b3-6dd8-1f5f-d2d8fd28635a	\N	\N	\N	00220000-56b3-6dd7-1587-95170dd73c5e	001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015-06-04 10:00:00	2015-06-04 12:00:00	400s	200s	\N	Vaja 2.	\N	\N
00180000-56b3-6dd8-2658-9c3acd463809	\N	00200000-56b3-6dd8-86e1-753f33630ddd	\N	\N	\N	00220000-56b3-6dd7-9db7-5f3673a1f379	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	400s	200s	\N	Vaja 3.	\N	\N
00180000-56b3-6dd8-1f62-e96b91f611ee	\N	00200000-56b3-6dd8-e776-75f1cfd2c16d	\N	\N	\N	00220000-56b3-6dd7-ad12-22d6c4743488	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	200s	200s	\N	Vaja 4.	\N	\N
00180000-56b3-6dd8-bd4a-80fc566a7e96	\N	00200000-56b3-6dd8-2e95-5625c974e85f	\N	\N	\N	00220000-56b3-6dd7-e350-6f76af3d66ca	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	500s	200s	\N	Vaja 5.	\N	\N
00180000-56b3-6dd8-10f2-f9d8849cb942	\N	00200000-56b3-6dd8-b385-66800a3fd934	\N	\N	\N	00220000-56b3-6dd7-9db7-5f3673a1f379	\N	2012-08-01 20:00:00	2012-08-01 23:00:00	400s	200s	\N	Vaja 6.	\N	\N
00180000-56b3-6dd8-0d7d-543967570194	\N	00200000-56b3-6dd8-b66a-924fa5b09405	\N	\N	\N	00220000-56b3-6dd7-e350-6f76af3d66ca	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 7.	\N	\N
00180000-56b3-6dd8-fbc4-2bff281319f3	\N	00200000-56b3-6dd8-1882-8c7bd17f54e7	\N	\N	\N	00220000-56b3-6dd7-e350-6f76af3d66ca	\N	1995-08-01 20:00:00	1995-08-01 23:00:00	500s	200s	\N	Vaja 8.	\N	\N
00180000-56b3-6dd8-144b-5d269efb789a	\N	00200000-56b3-6dd8-cd0f-ed93e96e2d54	\N	\N	\N	00220000-56b3-6dd7-1587-95170dd73c5e	001f0000-56b3-6dd7-797a-2c236a5a542d	2014-06-04 10:00:00	2014-06-27 12:00:00	400s	200s	\N	Vaja 9.	\N	\N
00180000-56b3-6dd8-117d-d685ab0c3ae5	\N	00200000-56b3-6dd8-b923-8858d209e534	\N	\N	\N	00220000-56b3-6dd7-1587-95170dd73c5e	001f0000-56b3-6dd7-797a-2c236a5a542d	2014-06-11 07:00:00	2014-06-12 15:00:00	400s	200s	\N	Vaja 10.	\N	\N
00180000-56b3-6dd8-ddbb-fc79d6192803	\N	00200000-56b3-6dd8-679f-caace539f1b2	\N	\N	\N	00220000-56b3-6dd7-1587-95170dd73c5e	\N	2012-06-04 10:00:00	2012-06-04 12:00:00	400s	200s	\N	Vaja 11.	\N	\N
00180000-56b3-6dd8-ca48-127e070a4cbb	\N	\N	001c0000-56b3-6dd8-3d34-63aff0df69cb	\N	\N	\N	001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015-03-10 07:00:00	2015-03-20 23:00:00	200s	300s	\N	Gostovanje 1.	#001122	\N
00180000-56b3-6dd8-b4c4-0d2d3eccb279	001b0000-56b3-6dd8-bbb3-e8a9785e7656	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-797a-2c236a5a542d	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1.	\N	\N
00180000-56b3-6dd8-2019-ebda2a401329	001b0000-56b3-6dd8-e335-9816036dd9f8	\N	\N	\N	\N	00220000-56b3-6dd7-9db7-5f3673a1f379	001f0000-56b3-6dd7-797a-2c236a5a542d	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2.	\N	\N
00180000-56b3-6dd8-849b-6fb738d65710	001b0000-56b3-6dd8-5b66-ac8d4982718d	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-797a-2c236a5a542d	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3.	\N	\N
00180000-56b3-6dd8-7ce3-575f1a656c4a	001b0000-56b3-6dd8-e743-a580deceb266	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	\N	1995-05-20 20:00:00	1995-05-20 23:00:00	200s	100s	\N	Predstava 4.	\N	\N
00180000-56b3-6dd8-42db-d9287840176e	001b0000-56b3-6dd8-49c9-d15d75028449	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015-05-20 20:00:00	2015-05-20 23:00:00	200s	100s	\N	Predstava 5.	\N	\N
00180000-56b3-6dd8-783e-2ad2b5da23a8	001b0000-56b3-6dd8-41ed-403ad3ffa950	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015-05-25 20:00:00	2015-05-25 23:00:00	200s	100s	\N	Predstava 6.	\N	\N
00180000-56b3-6dd8-60d6-f36e745a6a5d	001b0000-56b3-6dd8-1d99-d62316e8ceaf	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-797a-2c236a5a542d	2014-05-15 20:00:00	2014-05-15 23:00:00	200s	100s	\N	Predstava 7.	\N	\N
00180000-56b3-6dd8-c476-7fe153636598	001b0000-56b3-6dd8-b828-d83b7e695036	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015-05-18 20:00:00	2015-05-18 23:00:00	200s	100s	\N	Predstava 8.	\N	\N
00180000-56b3-6dd8-6621-a21e4f2f9007	001b0000-56b3-6dd8-9ebe-a1b89263b1b0	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 9.	\N	\N
00180000-56b3-6dd8-e8ff-c3a4246a4ddf	001b0000-56b3-6dd8-ff53-d29232a4f073	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	\N	1995-05-23 20:00:00	1995-05-23 23:00:00	200s	100s	\N	Predstava 10.	\N	\N
00180000-56b3-6dd8-2a5e-89813f1cc70b	001b0000-56b3-6dd8-af50-e1ff6f272563	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015-05-02 20:00:00	2015-05-02 23:00:00	200s	100s	\N	Predstava 11.	\N	\N
00180000-56b3-6dd8-1b5b-a31084d20876	001b0000-56b3-6dd8-8ca5-1750559595fb	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-87c2-e61b0edd7a9d	2016-05-02 20:00:00	2016-05-02 23:00:00	200s	100s	\N	Predstava 12.	\N	\N
00180000-56b3-6dd8-c5f9-9161be8492ab	001b0000-56b3-6dd8-ebba-a7e26773f381	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-87c2-e61b0edd7a9d	2016-05-01 20:00:00	2016-05-01 23:00:00	200s	100s	\N	Predstava 13.	\N	\N
00180000-56b3-6dd8-702f-547c73db5ce1	001b0000-56b3-6dd8-4341-94d3d727454b	\N	\N	\N	\N	00220000-56b3-6dd7-f150-f2349d4d9023	001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015-05-23 20:00:00	2015-05-23 23:00:00	200s	100s	\N	Predstava 14.	\N	\N
00180000-56b3-6dd8-add1-439960326d59	001b0000-56b3-6dd8-366f-3e7cd8677fd5	\N	\N	\N	\N	\N	001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015-03-15 20:00:00	2015-03-15 23:00:00	200s	100s	\N	Predstava 15.	\N	001c0000-56b3-6dd8-3d34-63aff0df69cb
00180000-56b3-6dd8-2e99-d1a8c753544d	001b0000-56b3-6dd8-b9d1-11cd9f69c352	\N	\N	\N	\N	\N	001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015-03-16 20:00:00	2015-03-16 23:00:00	200s	100s	\N	Predstava 16.	\N	001c0000-56b3-6dd8-3d34-63aff0df69cb
\.


--
-- TOC entry 3166 (class 0 OID 43674324)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56b3-6dd7-654c-deaea47c2cd8
001e0000-56b3-6dd7-fc11-7c3544719ac2
\.


--
-- TOC entry 3167 (class 0 OID 43674329)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56b3-6dd7-7dbf-d0ef98c4976c
00440000-56b3-6dd7-989e-e9ce3197bbe1
\.


--
-- TOC entry 3209 (class 0 OID 43674901)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 43674204)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56b3-6dd4-f0a0-fdcb3acd6dfc	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56b3-6dd4-fc0b-a931eb9beca8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56b3-6dd4-97ce-0bf74fb8b0a3	AL	ALB	008	Albania 	Albanija	\N
00040000-56b3-6dd4-c49a-d5cb83b3683f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56b3-6dd4-40ae-1642bc86019c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56b3-6dd4-9140-39a28920b80b	AD	AND	020	Andorra 	Andora	\N
00040000-56b3-6dd4-8a83-954ba8cdd7f3	AO	AGO	024	Angola 	Angola	\N
00040000-56b3-6dd4-c4b5-3f8d46242fba	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56b3-6dd4-c109-41c72468a39b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56b3-6dd4-ca5f-4881352d2191	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56b3-6dd4-4b02-3a6404ed7d7a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56b3-6dd4-0561-9adc57660c80	AM	ARM	051	Armenia 	Armenija	\N
00040000-56b3-6dd4-0784-7b268985dfe4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56b3-6dd4-aa08-2e1c7dcdbeba	AU	AUS	036	Australia 	Avstralija	\N
00040000-56b3-6dd4-657b-6ac86c9c4278	AT	AUT	040	Austria 	Avstrija	\N
00040000-56b3-6dd4-34c1-ece1f882a677	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56b3-6dd4-4230-31d6da705679	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56b3-6dd4-754d-5f6039350623	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56b3-6dd4-5197-f532a2c7e4df	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56b3-6dd4-74b6-f6c19e91aabd	BB	BRB	052	Barbados 	Barbados	\N
00040000-56b3-6dd4-91dc-351500848616	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56b3-6dd4-8a06-485ced5767c2	BE	BEL	056	Belgium 	Belgija	\N
00040000-56b3-6dd4-5062-24e42a4defad	BZ	BLZ	084	Belize 	Belize	\N
00040000-56b3-6dd4-ea25-4e594b7967c6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56b3-6dd4-86b4-0a6370a5f04d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56b3-6dd4-3810-6c81333d1fad	BT	BTN	064	Bhutan 	Butan	\N
00040000-56b3-6dd4-d518-69d4d00e4027	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56b3-6dd4-3414-904a703b3553	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56b3-6dd4-936e-b3f1d71885e9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56b3-6dd4-2f00-ab626520ff4d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56b3-6dd4-899f-8576f2332cd3	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56b3-6dd4-4a56-02effbb73e9d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56b3-6dd4-721f-ccc91b87ece8	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56b3-6dd4-b2d6-04ae43424dad	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56b3-6dd4-e266-59390e0f92f8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56b3-6dd4-cc56-f47bee614759	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56b3-6dd4-ab54-294da85d9c7a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56b3-6dd4-e2b8-26d2dc69d963	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56b3-6dd4-3037-7c415bfe4232	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56b3-6dd4-6865-b61297784862	CA	CAN	124	Canada 	Kanada	\N
00040000-56b3-6dd4-7458-279e93145a27	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56b3-6dd4-de64-1a49431186a8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56b3-6dd4-c99d-18cf8c83d13f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56b3-6dd4-6924-0458ea538461	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56b3-6dd4-5f7f-e05ad6ea4db2	CL	CHL	152	Chile 	Čile	\N
00040000-56b3-6dd4-f92e-339a9521d1bd	CN	CHN	156	China 	Kitajska	\N
00040000-56b3-6dd4-afdd-5fdeb29c97b7	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56b3-6dd4-5703-ed7081e7055e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56b3-6dd4-ddd1-e51c6be7545b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56b3-6dd4-6a73-3dd307705fab	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56b3-6dd4-65b3-08c9a5de5075	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56b3-6dd4-8705-f79a374e36a1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56b3-6dd4-5f1f-c2ac34c08a08	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56b3-6dd4-37be-894cc3b14a77	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56b3-6dd4-0529-fa227257b035	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56b3-6dd4-0617-7231da4a95fe	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56b3-6dd4-e53e-83f37167d2e1	CU	CUB	192	Cuba 	Kuba	\N
00040000-56b3-6dd4-b262-cdfe709bfa89	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56b3-6dd4-84ac-db254e8f11b4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56b3-6dd4-1b8b-208097cc53f6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56b3-6dd4-0c25-960acd3470dd	DK	DNK	208	Denmark 	Danska	\N
00040000-56b3-6dd4-a25f-304749519774	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56b3-6dd4-3e36-75a4e8cf3974	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56b3-6dd4-3463-bbda22ebabdf	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56b3-6dd4-7cd8-a1bf8c4c35f6	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56b3-6dd4-9a96-fee558f19715	EG	EGY	818	Egypt 	Egipt	\N
00040000-56b3-6dd4-58e8-eac33a9a6a05	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56b3-6dd4-2073-3efd3c4d45f0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56b3-6dd4-5395-fb8508d3579f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56b3-6dd4-f01e-832275b78c08	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56b3-6dd4-d98d-bbe23b76f915	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56b3-6dd4-b28c-78e3b1481428	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56b3-6dd4-bbfa-9a897b5a8394	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56b3-6dd4-5b1b-b1932c063c35	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56b3-6dd4-4c24-35fbb1346a37	FI	FIN	246	Finland 	Finska	\N
00040000-56b3-6dd4-c516-741e9ec375f8	FR	FRA	250	France 	Francija	\N
00040000-56b3-6dd4-319d-76f5b750bbd2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56b3-6dd4-5342-4325f785e8ae	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56b3-6dd4-dd20-80481bd1f8c2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56b3-6dd4-26e2-4b704ebc13bd	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56b3-6dd4-208b-56685718b91f	GA	GAB	266	Gabon 	Gabon	\N
00040000-56b3-6dd4-4f07-ce192021e8b9	GM	GMB	270	Gambia 	Gambija	\N
00040000-56b3-6dd4-1d86-321ec4241722	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56b3-6dd4-4fbb-d5295da3a11f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56b3-6dd4-edef-26f9680e7419	GH	GHA	288	Ghana 	Gana	\N
00040000-56b3-6dd4-c216-d8c9461db1f3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56b3-6dd4-88cd-54b04be84011	GR	GRC	300	Greece 	Grčija	\N
00040000-56b3-6dd4-94fb-66db59aca0ca	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56b3-6dd4-68b0-4396db3fc5f8	GD	GRD	308	Grenada 	Grenada	\N
00040000-56b3-6dd4-6a24-369dd3a976c3	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56b3-6dd4-8d2e-e96f60b169fb	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56b3-6dd4-4e1b-eb5ea05c2dfa	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56b3-6dd4-1867-59be12594466	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56b3-6dd4-f5b1-c5774d4be2a1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56b3-6dd4-0ef4-aae58fc173f1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56b3-6dd4-f5e6-abe75542c3ad	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56b3-6dd4-7b21-d69e172e16cf	HT	HTI	332	Haiti 	Haiti	\N
00040000-56b3-6dd4-f6b8-0e5bcda2fc28	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56b3-6dd4-1327-ab3cd6a1b6f9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56b3-6dd4-d2b4-bcbe274939ad	HN	HND	340	Honduras 	Honduras	\N
00040000-56b3-6dd4-692c-74c09fe1511a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56b3-6dd4-b717-37b9c6cdb5ba	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56b3-6dd4-d475-d3369808bafc	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56b3-6dd4-52f9-52ed6823bf26	IN	IND	356	India 	Indija	\N
00040000-56b3-6dd4-a3b6-1f9c558d25a8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56b3-6dd4-7ad4-71bac4b904c5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56b3-6dd4-a586-b00f3ca72f9e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56b3-6dd4-d245-c8908d555f91	IE	IRL	372	Ireland 	Irska	\N
00040000-56b3-6dd4-5536-2f9843e728f0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56b3-6dd4-6fb3-edf6fcb61ca4	IL	ISR	376	Israel 	Izrael	\N
00040000-56b3-6dd4-8373-de46559a2526	IT	ITA	380	Italy 	Italija	\N
00040000-56b3-6dd4-50c3-c911b470dd22	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56b3-6dd4-4342-07b8198c3dc6	JP	JPN	392	Japan 	Japonska	\N
00040000-56b3-6dd4-eaa6-5c5b7991e4b4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56b3-6dd4-b904-690bf0d2f0c3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56b3-6dd4-7de3-bf2ab7688ec1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56b3-6dd4-189a-f9947ca0ad75	KE	KEN	404	Kenya 	Kenija	\N
00040000-56b3-6dd4-817f-9a45fa8d4dbe	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56b3-6dd4-ffc9-fa1d7d4c56ab	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56b3-6dd4-04c3-3e2006f0a853	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56b3-6dd4-b7dc-c40cec2496c9	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56b3-6dd4-488c-5b48d7fe05f6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56b3-6dd4-1619-bd343d35fbc9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56b3-6dd4-40dc-7b1c5ba3a818	LV	LVA	428	Latvia 	Latvija	\N
00040000-56b3-6dd4-7832-2505dfd883d9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56b3-6dd4-e956-3d22b75cb430	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56b3-6dd4-4e3b-8b3cdde22815	LR	LBR	430	Liberia 	Liberija	\N
00040000-56b3-6dd4-1fd7-9008af96bcb8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56b3-6dd4-97de-60dad4bc85b1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56b3-6dd4-a82c-6b8b6fdba379	LT	LTU	440	Lithuania 	Litva	\N
00040000-56b3-6dd4-37e7-b7626b28e54a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56b3-6dd4-ecd6-67d8afb5ce9a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56b3-6dd4-4b23-4d0a888b90e0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56b3-6dd4-6c19-d8f5254ad3a7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56b3-6dd4-222b-2371df5b26d5	MW	MWI	454	Malawi 	Malavi	\N
00040000-56b3-6dd4-ddba-41fa200933c1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56b3-6dd4-b4e4-6db2ca77c36d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56b3-6dd4-d3b5-e4e5688405b8	ML	MLI	466	Mali 	Mali	\N
00040000-56b3-6dd4-c3ed-e361be020ac8	MT	MLT	470	Malta 	Malta	\N
00040000-56b3-6dd4-85b3-557e8a2a5734	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56b3-6dd4-0ae2-aac7af893585	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56b3-6dd4-2ce0-c15ddecdb6d8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56b3-6dd4-cde7-b7e9a51689e5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56b3-6dd4-1959-4c9934e6b0e6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56b3-6dd4-58fe-60b848c96ded	MX	MEX	484	Mexico 	Mehika	\N
00040000-56b3-6dd4-6551-82aff3a1e649	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56b3-6dd4-501b-626fa4b319b3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56b3-6dd4-a1e9-74acece1ce45	MC	MCO	492	Monaco 	Monako	\N
00040000-56b3-6dd4-3fa3-b799d40a1bf6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56b3-6dd4-45d0-4beb1f96349c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56b3-6dd4-fc59-0c05ce3126a1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56b3-6dd4-67f7-cc75a48b6019	MA	MAR	504	Morocco 	Maroko	\N
00040000-56b3-6dd4-2131-19715e1fe785	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56b3-6dd4-008b-16174f5d4866	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56b3-6dd4-5bcd-ce5bb938f5d5	NA	NAM	516	Namibia 	Namibija	\N
00040000-56b3-6dd4-a0e5-7d72091347e4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56b3-6dd4-bb76-169cfc970789	NP	NPL	524	Nepal 	Nepal	\N
00040000-56b3-6dd4-755d-078fc1b39709	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56b3-6dd4-75d5-68cc4c1afd9f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56b3-6dd4-218e-af16ec2a8164	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56b3-6dd4-fe73-3563074ba7da	NE	NER	562	Niger 	Niger 	\N
00040000-56b3-6dd4-b4e7-02db58d72c14	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56b3-6dd4-2d94-cabf96ce7577	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56b3-6dd4-ce65-c930621bb00d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56b3-6dd4-6555-fddbdf1487b1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56b3-6dd4-515b-eac5145fd618	NO	NOR	578	Norway 	Norveška	\N
00040000-56b3-6dd4-a69f-a960901b7583	OM	OMN	512	Oman 	Oman	\N
00040000-56b3-6dd4-78e8-61683c3b8abe	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56b3-6dd4-51ca-c45a215c2948	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56b3-6dd4-1e3a-e745bec766ed	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56b3-6dd4-959e-7d1d8cfad88c	PA	PAN	591	Panama 	Panama	\N
00040000-56b3-6dd4-08c8-04fcc932f7a2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56b3-6dd4-c3bc-0041a2a475e6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56b3-6dd4-8350-668b7bb863fb	PE	PER	604	Peru 	Peru	\N
00040000-56b3-6dd4-4f37-911fd5f8767d	PH	PHL	608	Philippines 	Filipini	\N
00040000-56b3-6dd4-f705-c6c7a8e5f225	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56b3-6dd4-31cf-94055ac38a17	PL	POL	616	Poland 	Poljska	\N
00040000-56b3-6dd4-f20f-2a7686bfc5a0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56b3-6dd4-e3bf-1d9ecf6d6b57	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56b3-6dd4-e438-296782fdffa5	QA	QAT	634	Qatar 	Katar	\N
00040000-56b3-6dd4-7f77-7b108b50f9aa	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56b3-6dd4-23fc-15764f070aba	RO	ROU	642	Romania 	Romunija	\N
00040000-56b3-6dd4-cc2a-cd13e5d26a34	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56b3-6dd4-6d89-8b52ed03a59c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56b3-6dd4-6737-2b6b89cdef45	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56b3-6dd4-1ae8-aa1c761d7742	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56b3-6dd4-6613-95a7005eb8df	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56b3-6dd4-b2ff-8c9bcd03dfc5	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56b3-6dd4-c23a-8008b3ea0e65	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56b3-6dd4-8311-54184757d568	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56b3-6dd4-6eb7-b8c619abee35	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56b3-6dd4-1d5e-5b92cd20d01a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56b3-6dd4-e9d9-4f74ad597f49	SM	SMR	674	San Marino 	San Marino	\N
00040000-56b3-6dd4-c7c4-eac97a9cfca8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56b3-6dd4-6f4e-ec1f5b02437e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56b3-6dd4-59f7-f03aaf60ce97	SN	SEN	686	Senegal 	Senegal	\N
00040000-56b3-6dd4-13b9-976cf6e98706	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56b3-6dd4-041e-fe1a060de8a6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56b3-6dd4-87e3-23ebd4e82481	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56b3-6dd4-896f-cee478ce7a55	SG	SGP	702	Singapore 	Singapur	\N
00040000-56b3-6dd4-2dc9-b721ac6fee10	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56b3-6dd4-93e0-9f90e034ae95	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56b3-6dd4-0f92-c9e8a7681290	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56b3-6dd4-02de-2cfac8e3b015	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56b3-6dd4-b7a0-7241d472be3c	SO	SOM	706	Somalia 	Somalija	\N
00040000-56b3-6dd4-baa4-45ec271943e0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56b3-6dd4-0220-47e2dd6d66e5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56b3-6dd4-7af2-d6132d26365d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56b3-6dd4-f1e3-a8aa57c92bbb	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56b3-6dd4-764f-6b2a4bdbded8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56b3-6dd4-824f-aec4c77bb449	SD	SDN	729	Sudan 	Sudan	\N
00040000-56b3-6dd4-52b8-528829e63c9c	SR	SUR	740	Suriname 	Surinam	\N
00040000-56b3-6dd4-6613-be7c2fa4e8c5	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56b3-6dd4-3d6d-fa716c5f315d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56b3-6dd4-9c6c-16cff6d821ab	SE	SWE	752	Sweden 	Švedska	\N
00040000-56b3-6dd4-39c3-6eba1590f6e5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56b3-6dd4-361d-4f64af9c2601	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56b3-6dd4-b2b9-168271996e60	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56b3-6dd4-60b7-7b1d6b8be9f6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56b3-6dd4-671d-95563294264f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56b3-6dd4-a9c1-7b1ca98ba21b	TH	THA	764	Thailand 	Tajska	\N
00040000-56b3-6dd4-b920-3ff2df9cd131	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56b3-6dd4-a2be-3aa979c2e191	TG	TGO	768	Togo 	Togo	\N
00040000-56b3-6dd4-6f7e-9a76d90a5f9c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56b3-6dd4-32b6-785a1034d99c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56b3-6dd4-0ec9-07c088dd215a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56b3-6dd4-593b-581e2139c333	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56b3-6dd4-7d16-920bed7fff23	TR	TUR	792	Turkey 	Turčija	\N
00040000-56b3-6dd4-c68c-9d649d5bb459	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56b3-6dd4-b8a7-8275427375da	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56b3-6dd4-0040-97f62311ac02	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56b3-6dd4-dffe-f9a74dfee416	UG	UGA	800	Uganda 	Uganda	\N
00040000-56b3-6dd4-90b3-d352a4900b23	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56b3-6dd4-e27b-aeb5f0ec321a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56b3-6dd4-b256-01e55cf227ab	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56b3-6dd4-bb22-ff73169de867	US	USA	840	United States 	Združene države Amerike	\N
00040000-56b3-6dd4-7d2a-7ca1a142d96c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56b3-6dd4-f030-092587bdd75c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56b3-6dd4-7d31-23195c241742	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56b3-6dd4-2b83-beb04182ed42	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56b3-6dd4-7002-b39219857352	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56b3-6dd4-e3f7-cdff9b4e6d75	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56b3-6dd4-07b4-2ee447045628	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56b3-6dd4-5b6c-78a9f01a668a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56b3-6dd4-c4f4-dfa6feec2460	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56b3-6dd4-6858-130ccc4261f7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56b3-6dd4-d136-3a0c8c812874	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56b3-6dd4-b9e4-91fd918157c5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56b3-6dd4-4e15-d4ffeb072237	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 43674689)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56b3-6dd8-1eab-4044b2f254b4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56b3-6dd8-e472-fd780b1d6e7d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b3-6dd8-d9e3-a51ba57fc9b4	000e0000-56b3-6dd7-e828-e4ff1fbf74df	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b3-6dd4-460f-7889f4d386e9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b3-6dd8-4e87-4c3ecbe17891	000e0000-56b3-6dd7-704d-6dc99b707496	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b3-6dd4-fdbc-09407515c0c5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56b3-6dd8-a777-fbc63ca523c1	000e0000-56b3-6dd7-74b2-ef3a703f539f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56b3-6dd4-460f-7889f4d386e9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 43674495)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56b3-6dd8-1296-ce5f97f14ddb	000e0000-56b3-6dd7-704d-6dc99b707496	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56b3-6dd4-56ee-5916ac008089
000d0000-56b3-6dd8-2622-1299e2a4d53f	000e0000-56b3-6dd7-ce00-282ef3a3d0a7	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56b3-6dd4-dbba-040076e61299
000d0000-56b3-6dd8-4447-bf310292a8d5	000e0000-56b3-6dd7-ce00-282ef3a3d0a7	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd7-2207-1cce9d940bec	000e0000-56b3-6dd7-704d-6dc99b707496	000c0000-56b3-6dd8-4127-748443caedcc	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56b3-6dd4-dbba-040076e61299
000d0000-56b3-6dd7-ce8b-cc1c8031b19a	000e0000-56b3-6dd7-704d-6dc99b707496	000c0000-56b3-6dd8-afa6-619c4b2f95ee	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd7-2ca0-8d05d15a2286	000e0000-56b3-6dd7-704d-6dc99b707496	000c0000-56b3-6dd8-e70c-199a1a01b79b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56b3-6dd4-44a6-4ade83f4fcf3
000d0000-56b3-6dd7-f851-336bc56d3df6	000e0000-56b3-6dd7-704d-6dc99b707496	000c0000-56b3-6dd8-0c71-b969a7a26a8c	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56b3-6dd4-56ee-5916ac008089
000d0000-56b3-6dd7-8719-7a5ad953662a	000e0000-56b3-6dd7-704d-6dc99b707496	000c0000-56b3-6dd8-8fd1-acf43de63eda	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56b3-6dd4-56ee-5916ac008089
000d0000-56b3-6dd8-cb8c-e6f72130b783	000e0000-56b3-6dd7-704d-6dc99b707496	000c0000-56b3-6dd8-3fc1-3b13e3f88f4e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56b3-6dd4-dbba-040076e61299
000d0000-56b3-6dd7-087f-5ffc9517a8cd	000e0000-56b3-6dd7-704d-6dc99b707496	000c0000-56b3-6dd8-af1e-5535866aa9b5	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56b3-6dd4-dbba-040076e61299
000d0000-56b3-6dd8-1324-2eab3ca56d20	000e0000-56b3-6dd7-704d-6dc99b707496	000c0000-56b3-6dd8-2973-cc433058112f	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56b3-6dd4-ea56-3d0378d8acb4
000d0000-56b3-6dd8-283b-17cb97389a1a	000e0000-56b3-6dd7-704d-6dc99b707496	000c0000-56b3-6dd8-e655-080f608288d3	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56b3-6dd4-73a5-fec84c2a1bbf
000d0000-56b3-6dd8-31f1-297812c5f4c7	000e0000-56b3-6dd7-73da-6c7a0e7272c5	000c0000-56b3-6dd8-ab7f-1388e672de75	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-556f-b10907751f6b	000e0000-56b3-6dd7-385b-91f32461b1b7	000c0000-56b3-6dd8-b094-12fb7bd33c29	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-f160-0c47e62b6f51	000e0000-56b3-6dd7-385b-91f32461b1b7	000c0000-56b3-6dd8-2b59-a78554867ce1	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-e793-0a236790ebdf	000e0000-56b3-6dd7-290c-0a780b460200	000c0000-56b3-6dd8-e447-3565fc18c45d	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-0e03-11e3a0c7994f	000e0000-56b3-6dd7-ba9f-a72cfd77f065	000c0000-56b3-6dd8-4d25-46b858e14588	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-6e63-fcc5a0787dfe	000e0000-56b3-6dd7-e3a1-4051511c2570	000c0000-56b3-6dd8-5fd2-33735e957671	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-5af6-919b5ae25712	000e0000-56b3-6dd7-43b0-c8a19a2bc5a6	000c0000-56b3-6dd8-69c1-c29ed1654e02	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-67f7-724ee738b1ff	000e0000-56b3-6dd7-7d97-bdbd9b275e9a	000c0000-56b3-6dd8-4ab2-28b2a0b3b6c4	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-3920-40a4346529e0	000e0000-56b3-6dd7-4d0e-d8d781190a4c	000c0000-56b3-6dd8-758f-beadbe51c4ab	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-a5e5-77ae1390042d	000e0000-56b3-6dd7-4d0e-d8d781190a4c	000c0000-56b3-6dd8-aac5-886d4d85fcba	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-1f3b-b2c54392f424	000e0000-56b3-6dd7-b721-ad6e873f7d21	000c0000-56b3-6dd8-3e5c-0de9ec1d0e44	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
000d0000-56b3-6dd8-de1c-30041cfbd15c	000e0000-56b3-6dd7-b721-ad6e873f7d21	000c0000-56b3-6dd8-4550-cd23893edaf1	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56b3-6dd4-cf9f-6815dff49099
\.


--
-- TOC entry 3162 (class 0 OID 43674272)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
001c0000-56b3-6dd8-3d34-63aff0df69cb	00040000-56b3-6dd4-d475-d3369808bafc		\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 43674244)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 43674221)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56b3-6dd7-a4ac-f8d664e21bfd	00080000-56b3-6dd7-1a6f-ec5f6cd44ece	00090000-56b3-6dd7-8325-464313a2e09b	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 43674409)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 43674959)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56b3-6dd7-5e26-7aa64059bf4e	00010000-56b3-6dd5-eb28-3810a18ecdd7	\N	Prva mapa	Root mapa	2016-02-04 16:27:19	2016-02-04 16:27:19	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 43674972)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 43674994)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 34548309)
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
-- TOC entry 3180 (class 0 OID 43674433)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 43674178)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56b3-6dd5-0aa1-6af58421d357	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56b3-6dd5-3425-37a9d5ba0f72	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56b3-6dd5-af17-40b5d5d22bc0	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56b3-6dd5-d7d3-0104492ff632	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56b3-6dd5-fc94-69bf1b7b0e55	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56b3-6dd5-b37d-f6f5b8430256	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:7:"splosni";}s:4:"600s";a:2:{s:5:"label";s:17:"Tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56b3-6dd5-4e06-a4d7795c3eeb	dogodek.delte	array	a:14:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delGosZac";a:2:{s:5:"label";s:37:"Delta začetka pri dogodku gostovanje";s:5:"value";i:0;}s:9:"delGosKon";a:2:{s:5:"label";s:34:"Delta konca pri dogodku gostovanje";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56b3-6dd5-c2c6-8a5377e5c7fe	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56b3-6dd5-2489-a105107dc912	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56b3-6dd5-bc51-8d910590a296	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56b3-6dd5-d61e-d929eaa331fa	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56b3-6dd5-bf37-e58fecaf1950	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56b3-6dd5-1e92-a63c01cc304f	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56b3-6dd5-fe74-47bb08c04bfa	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56b3-6dd5-4159-aa49fcbc8667	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56b3-6dd5-fc7a-7f300a4bee72	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56b3-6dd5-24b2-d4af0240dffd	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56b3-6dd7-4fde-d40aa0edeb6a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56b3-6dd7-dda9-4220644ed607	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56b3-6dd7-f9c8-5dcd3fea90f0	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56b3-6dd7-d359-91ec1cd573b5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56b3-6dd7-550f-fc3fa943f3e6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56b3-6dd7-fc9f-5eec8e5dff3b	tomaz.barva.ozadja	array	s:4:"siva";	t	f	f	\N	barva ozadja tomaž
00000000-56b3-6dd9-c37e-5c6b692ac447	application.tenant.maticnopodjetje	string	s:36:"00080000-56b3-6dd9-70bf-a748480b4cb3";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 43674078)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56b3-6dd7-b03b-5793673498d2	00000000-56b3-6dd7-4fde-d40aa0edeb6a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56b3-6dd7-3e3a-c8b15fb5b1d8	00000000-56b3-6dd7-4fde-d40aa0edeb6a	00010000-56b3-6dd5-eb28-3810a18ecdd7	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56b3-6dd7-8fac-fbf5f74f6cbb	00000000-56b3-6dd7-dda9-4220644ed607	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
00000000-56b3-6dd7-8b33-177279c12f8a	00000000-56b3-6dd7-fc9f-5eec8e5dff3b	\N	s:6:"zelena";	t
00000000-56b3-6dd7-642d-7d7311c788ab	00000000-56b3-6dd7-fc9f-5eec8e5dff3b	00010000-56b3-6dd5-eb28-3810a18ecdd7	s:6:"rdeča";	f
\.


--
-- TOC entry 3151 (class 0 OID 43674145)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56b3-6dd7-3646-7b29d7b35ef6	\N	00100000-56b3-6dd7-ff79-eddef2d4deed	00100000-56b3-6dd7-6b3f-e3ae4dd37826	01	Gledališče Nimbis
00410000-56b3-6dd7-d73d-df9c7607cc1a	00410000-56b3-6dd7-3646-7b29d7b35ef6	00100000-56b3-6dd7-ff79-eddef2d4deed	00100000-56b3-6dd7-6b3f-e3ae4dd37826	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 43674089)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56b3-6dd7-aeae-0830e139582f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56b3-6dd7-e074-93881907a9f3	00010000-56b3-6dd7-8ec9-2e6b32e20604	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56b3-6dd7-7a6a-76a9b7b4f79a	00010000-56b3-6dd7-25fe-94a6dcdf4f0c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56b3-6dd7-b341-401ce8a92756	00010000-56b3-6dd7-33dc-2a5f4f6b865f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56b3-6dd7-7899-355de0c54d1e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56b3-6dd7-c61c-022e72d3d3cc	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56b3-6dd7-32f7-e04d65cf365b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56b3-6dd7-9a6e-138e82fd5b6f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56b3-6dd7-8325-464313a2e09b	00010000-56b3-6dd7-8adb-63b07e8d3fd1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56b3-6dd7-8efe-6ba4ee0137ad	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56b3-6dd7-75d9-b8aed359b102	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56b3-6dd7-6da2-8fbb9cc177c7	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56b3-6dd7-a378-6cffdb24cc3e	00010000-56b3-6dd7-631c-538fac80df50	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56b3-6dd7-54da-93b854480c96	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b3-6dd7-f6ee-eddd05760918	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b3-6dd7-b707-af4b31cfb525	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b3-6dd7-fc18-d931508f0cfc	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56b3-6dd7-219d-6575dd52ecd6	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56b3-6dd7-b9e8-803eca2959b8	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b3-6dd7-f5cf-b537bae6c3da	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56b3-6dd7-2754-94592e43f7d2	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 43674023)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56b3-6dd4-e7db-b8d11728e8ba	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56b3-6dd4-5476-4a7c6a5bf113	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56b3-6dd4-a8ae-ce6c0c0cdaa8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56b3-6dd4-0550-70e476856c64	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56b3-6dd4-fea4-b4eb4e4c48a3	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56b3-6dd4-f9b2-9d1bfecdf7d4	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56b3-6dd4-0316-de33ece80416	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56b3-6dd4-ddbe-04ffbe7fb713	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56b3-6dd4-2dc3-2539323a7738	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56b3-6dd4-5d02-b43361202cc7	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56b3-6dd4-b718-8a924d164cae	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56b3-6dd4-6b4e-b11b2af47a7f	Abonma-read	Abonma - branje	t
00030000-56b3-6dd4-93ce-85d7136f826e	Abonma-write	Abonma - spreminjanje	t
00030000-56b3-6dd4-fb46-f2de5e4b204f	Alternacija-read	Alternacija - branje	t
00030000-56b3-6dd4-a311-4a5a659699dc	Alternacija-write	Alternacija - spreminjanje	t
00030000-56b3-6dd4-50a4-2018f99e86bc	Arhivalija-read	Arhivalija - branje	t
00030000-56b3-6dd4-d94a-0dcbdd3a087e	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56b3-6dd4-9167-fad42d8f0108	AuthStorage-read	AuthStorage - branje	t
00030000-56b3-6dd4-37a0-b5e568db7c1e	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56b3-6dd4-8115-74ad89193e01	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56b3-6dd4-9727-77c8d1e0e846	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56b3-6dd4-2655-e6366bc8702f	Besedilo-read	Besedilo - branje	t
00030000-56b3-6dd4-ba12-13e1904ebb59	Besedilo-write	Besedilo - spreminjanje	t
00030000-56b3-6dd4-2a59-2af37d8552b5	Dodatek-read	Dodatek - branje	t
00030000-56b3-6dd4-9d31-4591bc541917	Dodatek-write	Dodatek - spreminjanje	t
00030000-56b3-6dd4-62d8-7e8ca489e9b3	Dogodek-read	Dogodek - branje	t
00030000-56b3-6dd4-e241-7624aa862686	Dogodek-write	Dogodek - spreminjanje	t
00030000-56b3-6dd4-6bb8-5358470e4572	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56b3-6dd4-d265-c7936540bd8b	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56b3-6dd4-cc69-192dae6f7b93	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56b3-6dd4-5450-5ebcf9fb284c	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56b3-6dd4-1786-5db954f17bab	DogodekTrait-read	DogodekTrait - branje	t
00030000-56b3-6dd4-1a44-01caeda319d5	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56b3-6dd4-4592-4af1ffb86016	DrugiVir-read	DrugiVir - branje	t
00030000-56b3-6dd4-4f93-3d247ab25b55	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56b3-6dd4-e5e4-52bec8126c74	Drzava-read	Drzava - branje	t
00030000-56b3-6dd4-243d-e485b96b9808	Drzava-write	Drzava - spreminjanje	t
00030000-56b3-6dd4-82bd-0b695601d966	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56b3-6dd4-2ea7-660abac3636f	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56b3-6dd4-270f-3910d4248b68	Funkcija-read	Funkcija - branje	t
00030000-56b3-6dd4-3b62-da03fb56936e	Funkcija-write	Funkcija - spreminjanje	t
00030000-56b3-6dd4-1d15-4d83efe0fc4e	Gostovanje-read	Gostovanje - branje	t
00030000-56b3-6dd4-11eb-c77cabf58a12	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56b3-6dd4-12b9-47273ab5e9d6	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56b3-6dd4-b240-2e16c48713cd	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56b3-6dd4-e96a-be5d9e59d416	Kupec-read	Kupec - branje	t
00030000-56b3-6dd4-01a7-534bb46140df	Kupec-write	Kupec - spreminjanje	t
00030000-56b3-6dd4-25fe-8f1910dc1ca2	NacinPlacina-read	NacinPlacina - branje	t
00030000-56b3-6dd4-6239-511447c102d0	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56b3-6dd4-7cb3-c1f47055b558	Option-read	Option - branje	t
00030000-56b3-6dd4-19f1-f8f1d886c4c2	Option-write	Option - spreminjanje	t
00030000-56b3-6dd4-334c-4a8017ff396d	OptionValue-read	OptionValue - branje	t
00030000-56b3-6dd4-2141-74b901da820a	OptionValue-write	OptionValue - spreminjanje	t
00030000-56b3-6dd4-e971-8fb9470c3aa4	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56b3-6dd4-85d0-9f9cd73a9562	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56b3-6dd4-8b7e-73bff7c7858c	Oseba-read	Oseba - branje	t
00030000-56b3-6dd4-070b-c969b36f5ff1	Oseba-write	Oseba - spreminjanje	t
00030000-56b3-6dd4-e05e-404dc85316bc	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56b3-6dd4-c4f8-d055a6f8c051	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56b3-6dd4-5961-3f5b3bfb1f8f	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56b3-6dd4-093d-a05597251bc9	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56b3-6dd4-e9e8-183ce71bb2e6	Pogodba-read	Pogodba - branje	t
00030000-56b3-6dd4-f39f-0a79e151efcd	Pogodba-write	Pogodba - spreminjanje	t
00030000-56b3-6dd4-590c-edadc3e1161c	Popa-read	Popa - branje	t
00030000-56b3-6dd4-8dc1-fe30eaa4a5a4	Popa-write	Popa - spreminjanje	t
00030000-56b3-6dd4-b636-58b8c06a65de	Posta-read	Posta - branje	t
00030000-56b3-6dd4-847d-742b5f2bef43	Posta-write	Posta - spreminjanje	t
00030000-56b3-6dd4-b613-c725b77c2260	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56b3-6dd4-10eb-3eed587c295e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56b3-6dd4-eb1c-39ca93d252e4	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56b3-6dd4-d19d-400c30491ffe	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56b3-6dd4-bc3e-96642c41f281	PostniNaslov-read	PostniNaslov - branje	t
00030000-56b3-6dd4-530d-ede18e48d6a3	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56b3-6dd4-0014-46f98877587e	Praznik-read	Praznik - branje	t
00030000-56b3-6dd4-099c-3f9ee8764eae	Praznik-write	Praznik - spreminjanje	t
00030000-56b3-6dd4-1b21-19c46481b76e	Predstava-read	Predstava - branje	t
00030000-56b3-6dd4-16a3-1412b27e22c3	Predstava-write	Predstava - spreminjanje	t
00030000-56b3-6dd4-81de-7f93f88b9aca	Ura-read	Ura - branje	t
00030000-56b3-6dd4-0f42-387af7f38f14	Ura-write	Ura - spreminjanje	t
00030000-56b3-6dd4-a136-4bd025784f31	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56b3-6dd4-4dc7-ce4c45773171	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56b3-6dd4-ccba-be6f0a3887ee	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56b3-6dd4-f9bb-43361415beaa	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56b3-6dd4-0137-263e42bce48e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56b3-6dd4-39ec-d559c6e5ca7c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56b3-6dd4-bc3f-96433404cd16	ProgramDela-read	ProgramDela - branje	t
00030000-56b3-6dd4-dfc8-e8d459f2b697	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56b3-6dd4-9582-bb97d0a50edc	ProgramFestival-read	ProgramFestival - branje	t
00030000-56b3-6dd4-98ab-b4694b7a7e5c	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56b3-6dd4-1443-4f64f8a69354	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56b3-6dd4-d118-558bcd9dc624	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56b3-6dd4-ca84-a9a48fe79852	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56b3-6dd4-cbea-b749b8f78041	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56b3-6dd4-4ac8-e74b25ec8249	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56b3-6dd4-30b7-186f9f88d6c4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56b3-6dd4-2c6c-a2f0cd14a6ab	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56b3-6dd4-a4ef-f7a999464170	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56b3-6dd4-a08e-9e15cd62da9d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56b3-6dd4-adcd-2bffdf9e40cb	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56b3-6dd4-9f90-c370bc0ad660	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56b3-6dd4-c753-fc56eeba38b8	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56b3-6dd4-5ef2-a51f2bcfb1a7	ProgramRazno-read	ProgramRazno - branje	t
00030000-56b3-6dd4-b37a-e870fc3ebc4d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56b3-6dd4-2dbe-2f72b7699b6d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56b3-6dd4-4ec8-5952744ebc14	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56b3-6dd4-835e-1780960965fc	Prostor-read	Prostor - branje	t
00030000-56b3-6dd4-ec49-7c25a9185798	Prostor-write	Prostor - spreminjanje	t
00030000-56b3-6dd4-a4b6-eb5c233350ae	Racun-read	Racun - branje	t
00030000-56b3-6dd4-af39-197d219d1366	Racun-write	Racun - spreminjanje	t
00030000-56b3-6dd4-e57f-59aa97c89a42	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56b3-6dd4-d1dd-0223edfc71f6	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56b3-6dd4-c60f-a65c99912126	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56b3-6dd4-fe81-8aadb5e7579d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56b3-6dd4-d9b3-60cce9d6c388	Rekvizit-read	Rekvizit - branje	t
00030000-56b3-6dd4-5e38-3aeb205292d6	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56b3-6dd4-0272-0fa9a2f0a7d0	Revizija-read	Revizija - branje	t
00030000-56b3-6dd4-88b3-07e3709a5b83	Revizija-write	Revizija - spreminjanje	t
00030000-56b3-6dd4-11e2-aefbc99fae17	Rezervacija-read	Rezervacija - branje	t
00030000-56b3-6dd4-33e3-79dac1ac1ee2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56b3-6dd4-6db9-bf80d7407980	SedezniRed-read	SedezniRed - branje	t
00030000-56b3-6dd4-bd56-eb2e31f1f1c2	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56b3-6dd4-19f7-ac629e046d2c	Sedez-read	Sedez - branje	t
00030000-56b3-6dd4-e07f-9978da1836f9	Sedez-write	Sedez - spreminjanje	t
00030000-56b3-6dd4-4dbd-09b2562e674f	Sezona-read	Sezona - branje	t
00030000-56b3-6dd4-a13d-8563d30e5a8a	Sezona-write	Sezona - spreminjanje	t
00030000-56b3-6dd4-e42f-0dc47b73edad	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56b3-6dd4-0abe-17c9da888b28	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56b3-6dd4-d4ac-6ecafe7cf1d7	Telefonska-read	Telefonska - branje	t
00030000-56b3-6dd4-5f07-59bb1c631a8b	Telefonska-write	Telefonska - spreminjanje	t
00030000-56b3-6dd4-fb25-259c41f5045f	TerminStoritve-read	TerminStoritve - branje	t
00030000-56b3-6dd4-2ba0-91b1df2850c0	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56b3-6dd4-a1b3-cede621d1515	TipDodatka-read	TipDodatka - branje	t
00030000-56b3-6dd4-a58a-d4137125fda4	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56b3-6dd4-41de-09e0dcab2372	TipFunkcije-read	TipFunkcije - branje	t
00030000-56b3-6dd4-3d53-36c1a7ccec83	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56b3-6dd4-c67c-51b90c21e4cf	TipPopa-read	TipPopa - branje	t
00030000-56b3-6dd4-6e7b-ec8ec261e10b	TipPopa-write	TipPopa - spreminjanje	t
00030000-56b3-6dd4-49f4-508d201023ae	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56b3-6dd4-e8f6-08d28d273992	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56b3-6dd4-3bd2-bd92277725bd	TipVaje-read	TipVaje - branje	t
00030000-56b3-6dd4-3e64-d779e5b7970f	TipVaje-write	TipVaje - spreminjanje	t
00030000-56b3-6dd4-9b64-abed8e701e84	Trr-read	Trr - branje	t
00030000-56b3-6dd4-5472-73a9d5553d7d	Trr-write	Trr - spreminjanje	t
00030000-56b3-6dd4-0c30-f69baf47ce02	Uprizoritev-read	Uprizoritev - branje	t
00030000-56b3-6dd4-718d-33979cb7c2ee	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56b3-6dd4-e4d6-0951e3533121	Vaja-read	Vaja - branje	t
00030000-56b3-6dd4-2729-b94209290ea2	Vaja-write	Vaja - spreminjanje	t
00030000-56b3-6dd4-cac5-f3018b568c49	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56b3-6dd4-04c3-3cc0c3bf9a4e	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56b3-6dd4-3b20-4a42370ae936	VrstaStroska-read	VrstaStroska - branje	t
00030000-56b3-6dd4-913e-dd80e2ed3fbf	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56b3-6dd4-8cb4-3239e42a74c1	Zaposlitev-read	Zaposlitev - branje	t
00030000-56b3-6dd4-2dc7-a9ada6bb167c	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56b3-6dd4-002d-6603ec18a2a7	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56b3-6dd4-b4a3-51d3a35ada22	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56b3-6dd4-5cc9-62fefa797ba8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56b3-6dd4-b8a2-1b88f68427a7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56b3-6dd4-6671-4bca7b2b105c	Job-read	Branje opravil - samo zase - branje	t
00030000-56b3-6dd4-3a58-a697fd4f9a24	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56b3-6dd4-c77d-5384d13725c8	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56b3-6dd4-56eb-39d7f93caf18	Report-read	Report - branje	t
00030000-56b3-6dd4-f2b6-9a4283319552	Report-write	Report - spreminjanje	t
00030000-56b3-6dd4-43d2-83385b9acbc4	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56b3-6dd4-6fcc-457603bb8bed	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56b3-6dd4-4f21-bd2fff584826	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56b3-6dd4-9e63-e61941f6a1b0	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56b3-6dd4-4743-580e2976e86a	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56b3-6dd4-1f21-52c7300c5f6e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56b3-6dd4-6273-cafbc6466f9d	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56b3-6dd4-273e-93017af3213a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56b3-6dd4-c9c1-88581be23659	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56b3-6dd4-2288-b0e83c6623aa	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56b3-6dd4-08e9-270b95d4ad9a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56b3-6dd4-6552-7fb3c6bf6449	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56b3-6dd4-9c0c-697f51322363	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56b3-6dd4-999b-9bada96d752f	Datoteka-write	Datoteka - spreminjanje	t
00030000-56b3-6dd4-dd99-905313357c7f	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 43674042)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56b3-6dd5-2529-800c318dc3fe	00030000-56b3-6dd4-5476-4a7c6a5bf113
00020000-56b3-6dd5-2529-800c318dc3fe	00030000-56b3-6dd4-e7db-b8d11728e8ba
00020000-56b3-6dd5-d5f6-739cc244c76b	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-9727-77c8d1e0e846
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-ba12-13e1904ebb59
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-8115-74ad89193e01
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-2c37-f2d2f9abd341	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-0422-284b82f9a409	00030000-56b3-6dd4-8115-74ad89193e01
00020000-56b3-6dd5-0422-284b82f9a409	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-0422-284b82f9a409	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-0422-284b82f9a409	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-0422-284b82f9a409	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-0422-284b82f9a409	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-0c29-0d9a97754197	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-0c29-0d9a97754197	00030000-56b3-6dd4-2dc7-a9ada6bb167c
00020000-56b3-6dd5-0c29-0d9a97754197	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-0c29-0d9a97754197	00030000-56b3-6dd4-fea4-b4eb4e4c48a3
00020000-56b3-6dd5-0c29-0d9a97754197	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-0c29-0d9a97754197	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-0c29-0d9a97754197	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-5c31-6698212eeb10	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-5c31-6698212eeb10	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-5c31-6698212eeb10	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-acb0-6eec0801e020	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-acb0-6eec0801e020	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-acb0-6eec0801e020	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-acb0-6eec0801e020	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-acb0-6eec0801e020	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-acb0-6eec0801e020	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-acb0-6eec0801e020	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-acb0-6eec0801e020	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-e5e5-68871f7850a0	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-e5e5-68871f7850a0	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-e5e5-68871f7850a0	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-e5e5-68871f7850a0	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-fea4-b4eb4e4c48a3
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-5472-73a9d5553d7d
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-530d-ede18e48d6a3
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-5f07-59bb1c631a8b
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-7159-6eab49b43646	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-07fa-b54798f7a2a8	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-07fa-b54798f7a2a8	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-07fa-b54798f7a2a8	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-07fa-b54798f7a2a8	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-07fa-b54798f7a2a8	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-07fa-b54798f7a2a8	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-07fa-b54798f7a2a8	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-5f07-59bb1c631a8b
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-530d-ede18e48d6a3
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-5472-73a9d5553d7d
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-8dc1-fe30eaa4a5a4
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-b240-2e16c48713cd
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-39ec-d559c6e5ca7c
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-1e94-a21941f1f84f	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-f74c-1a633c9745ab	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-f42f-564606e630f4	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-f42f-564606e630f4	00030000-56b3-6dd4-6e7b-ec8ec261e10b
00020000-56b3-6dd5-6bf0-4078de10ee52	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-6dd9-3e2acfb02685	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd5-6dd9-3e2acfb02685	00030000-56b3-6dd4-847d-742b5f2bef43
00020000-56b3-6dd5-f18d-17c5457b37eb	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd5-c54b-5cbe590811a6	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-c54b-5cbe590811a6	00030000-56b3-6dd4-243d-e485b96b9808
00020000-56b3-6dd5-81a5-73ecc6eb8f22	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-2fed-8ed934a52875	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd5-2fed-8ed934a52875	00030000-56b3-6dd4-b8a2-1b88f68427a7
00020000-56b3-6dd5-1d19-ad7783c56cdf	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd5-0a1d-fb89bc6b3abb	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd5-0a1d-fb89bc6b3abb	00030000-56b3-6dd4-b4a3-51d3a35ada22
00020000-56b3-6dd5-5a0f-b80703fd5328	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd5-4b0b-3014dc6955a3	00030000-56b3-6dd4-6b4e-b11b2af47a7f
00020000-56b3-6dd5-4b0b-3014dc6955a3	00030000-56b3-6dd4-93ce-85d7136f826e
00020000-56b3-6dd5-da1b-c33be29cd9a5	00030000-56b3-6dd4-6b4e-b11b2af47a7f
00020000-56b3-6dd5-b90e-4e138b89bb13	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd5-b90e-4e138b89bb13	00030000-56b3-6dd4-ec49-7c25a9185798
00020000-56b3-6dd5-b90e-4e138b89bb13	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-b90e-4e138b89bb13	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-b90e-4e138b89bb13	00030000-56b3-6dd4-530d-ede18e48d6a3
00020000-56b3-6dd5-b90e-4e138b89bb13	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-2da2-66515fa46dfa	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd5-2da2-66515fa46dfa	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-2da2-66515fa46dfa	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-74d2-094fdb233e5c	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-74d2-094fdb233e5c	00030000-56b3-6dd4-913e-dd80e2ed3fbf
00020000-56b3-6dd5-9250-397d75e48716	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-df8f-b095b369807a	00030000-56b3-6dd4-85d0-9f9cd73a9562
00020000-56b3-6dd5-df8f-b095b369807a	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-df8f-b095b369807a	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-df8f-b095b369807a	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-df8f-b095b369807a	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-df8f-b095b369807a	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-df8f-b095b369807a	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-df8f-b095b369807a	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-df8f-b095b369807a	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-8ecb-2ee81cf2e9bf	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-8ecb-2ee81cf2e9bf	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-8ecb-2ee81cf2e9bf	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-8ecb-2ee81cf2e9bf	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-8ecb-2ee81cf2e9bf	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-493d-6bcfb867f825	00030000-56b3-6dd4-3bd2-bd92277725bd
00020000-56b3-6dd5-493d-6bcfb867f825	00030000-56b3-6dd4-3e64-d779e5b7970f
00020000-56b3-6dd5-abd2-561d9940df36	00030000-56b3-6dd4-3bd2-bd92277725bd
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-0316-de33ece80416
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-ddbe-04ffbe7fb713
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-bc3f-96433404cd16
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-dfc8-e8d459f2b697
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-9582-bb97d0a50edc
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-98ab-b4694b7a7e5c
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-1443-4f64f8a69354
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-d118-558bcd9dc624
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-ca84-a9a48fe79852
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-cbea-b749b8f78041
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-4ac8-e74b25ec8249
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-30b7-186f9f88d6c4
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-2c6c-a2f0cd14a6ab
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-a4ef-f7a999464170
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-a08e-9e15cd62da9d
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-adcd-2bffdf9e40cb
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-9f90-c370bc0ad660
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-c753-fc56eeba38b8
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-5ef2-a51f2bcfb1a7
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-b37a-e870fc3ebc4d
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-2dbe-2f72b7699b6d
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-4ec8-5952744ebc14
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-f9bb-43361415beaa
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-4f93-3d247ab25b55
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-10eb-3eed587c295e
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-3a58-a697fd4f9a24
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-4592-4af1ffb86016
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-ccba-be6f0a3887ee
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-b613-c725b77c2260
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-6671-4bca7b2b105c
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-90f4-3c5409fee33a	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-bc3f-96433404cd16
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-9582-bb97d0a50edc
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-1443-4f64f8a69354
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-ca84-a9a48fe79852
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-4ac8-e74b25ec8249
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-2c6c-a2f0cd14a6ab
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-a08e-9e15cd62da9d
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-9f90-c370bc0ad660
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-5ef2-a51f2bcfb1a7
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-2dbe-2f72b7699b6d
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-ccba-be6f0a3887ee
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-4592-4af1ffb86016
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-b613-c725b77c2260
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-6671-4bca7b2b105c
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-dbf7-d976a575ed1d	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-718d-33979cb7c2ee
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-2dc3-2539323a7738
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-3b62-da03fb56936e
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-5d02-b43361202cc7
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-3985-b177b3ed95b7	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-8145-e80497f534be	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-f9ed-609905df0bab	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-f9ed-609905df0bab	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd5-f9ed-609905df0bab	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-f9ed-609905df0bab	00030000-56b3-6dd4-3b62-da03fb56936e
00020000-56b3-6dd5-f9ed-609905df0bab	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-f9ed-609905df0bab	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-f9ed-609905df0bab	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-f9ed-609905df0bab	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-2dc3-2539323a7738
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-fea4-b4eb4e4c48a3
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-f39f-0a79e151efcd
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-0abe-17c9da888b28
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-ffd4-d49121a0ac03	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-42dd-3956445591a9	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-c5fb-845154045508	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-c5fb-845154045508	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-c5fb-845154045508	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-c5fb-845154045508	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd5-c5fb-845154045508	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-c5fb-845154045508	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-c5fb-845154045508	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-98f3-dada8a2f222d	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-98f3-dada8a2f222d	00030000-56b3-6dd4-0abe-17c9da888b28
00020000-56b3-6dd5-98f3-dada8a2f222d	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-98f3-dada8a2f222d	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-214d-d857fd94e95e	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-214d-d857fd94e95e	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-6b4e-b11b2af47a7f
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-2dc3-2539323a7738
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-8115-74ad89193e01
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-9727-77c8d1e0e846
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-ba12-13e1904ebb59
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-4592-4af1ffb86016
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-4f93-3d247ab25b55
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-3b62-da03fb56936e
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-5d02-b43361202cc7
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-6671-4bca7b2b105c
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-3a58-a697fd4f9a24
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-fea4-b4eb4e4c48a3
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-f39f-0a79e151efcd
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-b613-c725b77c2260
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-10eb-3eed587c295e
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-ccba-be6f0a3887ee
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-f9bb-43361415beaa
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-0316-de33ece80416
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-bc3f-96433404cd16
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-ddbe-04ffbe7fb713
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-dfc8-e8d459f2b697
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-9582-bb97d0a50edc
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-98ab-b4694b7a7e5c
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-1443-4f64f8a69354
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-d118-558bcd9dc624
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-ca84-a9a48fe79852
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-cbea-b749b8f78041
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-4ac8-e74b25ec8249
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-30b7-186f9f88d6c4
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-2c6c-a2f0cd14a6ab
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-a4ef-f7a999464170
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-a08e-9e15cd62da9d
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-adcd-2bffdf9e40cb
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-9f90-c370bc0ad660
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-c753-fc56eeba38b8
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-5ef2-a51f2bcfb1a7
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-b37a-e870fc3ebc4d
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-2dbe-2f72b7699b6d
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-4ec8-5952744ebc14
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-0abe-17c9da888b28
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-3bd2-bd92277725bd
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-718d-33979cb7c2ee
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd5-63d9-fdff8d90906d	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-6b4e-b11b2af47a7f
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-8115-74ad89193e01
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-9727-77c8d1e0e846
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-ba12-13e1904ebb59
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-3bd2-bd92277725bd
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd5-d102-5e6f30c7897a	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-6b4e-b11b2af47a7f
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-2dc3-2539323a7738
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-8115-74ad89193e01
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-9727-77c8d1e0e846
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-ba12-13e1904ebb59
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-3b62-da03fb56936e
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-5d02-b43361202cc7
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-3bd2-bd92277725bd
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-718d-33979cb7c2ee
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd5-cd9c-73486a24f2b8	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-2dc3-2539323a7738
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-8115-74ad89193e01
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-9727-77c8d1e0e846
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-ba12-13e1904ebb59
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-4592-4af1ffb86016
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-4f93-3d247ab25b55
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-3b62-da03fb56936e
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-5d02-b43361202cc7
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-6671-4bca7b2b105c
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-3a58-a697fd4f9a24
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-b240-2e16c48713cd
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-fea4-b4eb4e4c48a3
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-f39f-0a79e151efcd
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-8dc1-fe30eaa4a5a4
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-b613-c725b77c2260
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-10eb-3eed587c295e
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-530d-ede18e48d6a3
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-ccba-be6f0a3887ee
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-f9bb-43361415beaa
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-39ec-d559c6e5ca7c
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-0316-de33ece80416
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-bc3f-96433404cd16
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-ddbe-04ffbe7fb713
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-dfc8-e8d459f2b697
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-9582-bb97d0a50edc
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-98ab-b4694b7a7e5c
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-1443-4f64f8a69354
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-d118-558bcd9dc624
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-ca84-a9a48fe79852
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-cbea-b749b8f78041
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-4ac8-e74b25ec8249
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-30b7-186f9f88d6c4
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-2c6c-a2f0cd14a6ab
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-a4ef-f7a999464170
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-a08e-9e15cd62da9d
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-adcd-2bffdf9e40cb
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-9f90-c370bc0ad660
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-c753-fc56eeba38b8
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-5ef2-a51f2bcfb1a7
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-b37a-e870fc3ebc4d
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-2dbe-2f72b7699b6d
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-4ec8-5952744ebc14
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-0abe-17c9da888b28
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-5f07-59bb1c631a8b
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-5472-73a9d5553d7d
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-718d-33979cb7c2ee
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-2dc7-a9ada6bb167c
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd5-0416-c3b1a898afcd	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-6b4e-b11b2af47a7f
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-2dc3-2539323a7738
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-8115-74ad89193e01
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-9727-77c8d1e0e846
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-ba12-13e1904ebb59
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-3b62-da03fb56936e
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-5d02-b43361202cc7
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-b240-2e16c48713cd
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-fea4-b4eb4e4c48a3
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-8dc1-fe30eaa4a5a4
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-530d-ede18e48d6a3
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-39ec-d559c6e5ca7c
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-5f07-59bb1c631a8b
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-3bd2-bd92277725bd
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-5472-73a9d5553d7d
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-718d-33979cb7c2ee
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-2dc7-a9ada6bb167c
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd5-2e5b-252dc2bce2ce	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-6b4e-b11b2af47a7f
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-8115-74ad89193e01
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-3b62-da03fb56936e
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-3bd2-bd92277725bd
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd5-78f4-6e2bcf9cc080	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-6b4e-b11b2af47a7f
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-2dc3-2539323a7738
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-4592-4af1ffb86016
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-4f93-3d247ab25b55
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-6671-4bca7b2b105c
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-3a58-a697fd4f9a24
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-b240-2e16c48713cd
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-85d0-9f9cd73a9562
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-fea4-b4eb4e4c48a3
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-f39f-0a79e151efcd
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-8dc1-fe30eaa4a5a4
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-b613-c725b77c2260
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-10eb-3eed587c295e
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-530d-ede18e48d6a3
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-ccba-be6f0a3887ee
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-f9bb-43361415beaa
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-39ec-d559c6e5ca7c
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-0316-de33ece80416
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-bc3f-96433404cd16
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-ddbe-04ffbe7fb713
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-dfc8-e8d459f2b697
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-9582-bb97d0a50edc
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-98ab-b4694b7a7e5c
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-1443-4f64f8a69354
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-d118-558bcd9dc624
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-ca84-a9a48fe79852
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-cbea-b749b8f78041
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-4ac8-e74b25ec8249
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-30b7-186f9f88d6c4
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-2c6c-a2f0cd14a6ab
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-a4ef-f7a999464170
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-a08e-9e15cd62da9d
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-adcd-2bffdf9e40cb
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-9f90-c370bc0ad660
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-c753-fc56eeba38b8
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-5ef2-a51f2bcfb1a7
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-b37a-e870fc3ebc4d
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-2dbe-2f72b7699b6d
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-4ec8-5952744ebc14
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-0abe-17c9da888b28
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-5f07-59bb1c631a8b
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-3bd2-bd92277725bd
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-5472-73a9d5553d7d
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-913e-dd80e2ed3fbf
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-2dc7-a9ada6bb167c
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd5-412a-503c1b4bc217	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e7db-b8d11728e8ba
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-5476-4a7c6a5bf113
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-6b4e-b11b2af47a7f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-93ce-85d7136f826e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2dc3-2539323a7738
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-50a4-2018f99e86bc
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-d94a-0dcbdd3a087e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-9167-fad42d8f0108
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-37a0-b5e568db7c1e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-8115-74ad89193e01
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-9727-77c8d1e0e846
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2655-e6366bc8702f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-ba12-13e1904ebb59
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-62d8-7e8ca489e9b3
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-0550-70e476856c64
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-6bb8-5358470e4572
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-d265-c7936540bd8b
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-cc69-192dae6f7b93
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-5450-5ebcf9fb284c
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-1786-5db954f17bab
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-1a44-01caeda319d5
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e241-7624aa862686
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-4592-4af1ffb86016
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-4f93-3d247ab25b55
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e5e4-52bec8126c74
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-243d-e485b96b9808
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-82bd-0b695601d966
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2ea7-660abac3636f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-5d02-b43361202cc7
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-3b62-da03fb56936e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-1d15-4d83efe0fc4e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-11eb-c77cabf58a12
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-c77d-5384d13725c8
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-6671-4bca7b2b105c
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-3a58-a697fd4f9a24
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-12b9-47273ab5e9d6
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-b240-2e16c48713cd
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e96a-be5d9e59d416
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-01a7-534bb46140df
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-6273-cafbc6466f9d
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-1f21-52c7300c5f6e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-6fcc-457603bb8bed
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-4f21-bd2fff584826
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-9e63-e61941f6a1b0
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-4743-580e2976e86a
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-25fe-8f1910dc1ca2
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-6239-511447c102d0
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-7cb3-c1f47055b558
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-334c-4a8017ff396d
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2141-74b901da820a
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-b718-8a924d164cae
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-19f1-f8f1d886c4c2
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e971-8fb9470c3aa4
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-85d0-9f9cd73a9562
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-fea4-b4eb4e4c48a3
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e05e-404dc85316bc
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-c4f8-d055a6f8c051
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-5961-3f5b3bfb1f8f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-093d-a05597251bc9
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-f39f-0a79e151efcd
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-8dc1-fe30eaa4a5a4
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-b636-58b8c06a65de
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-b613-c725b77c2260
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-10eb-3eed587c295e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-eb1c-39ca93d252e4
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-d19d-400c30491ffe
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-847d-742b5f2bef43
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-530d-ede18e48d6a3
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-0014-46f98877587e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-099c-3f9ee8764eae
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-1b21-19c46481b76e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-16a3-1412b27e22c3
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-a136-4bd025784f31
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-4dc7-ce4c45773171
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-ccba-be6f0a3887ee
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-f9bb-43361415beaa
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-0137-263e42bce48e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-39ec-d559c6e5ca7c
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-0316-de33ece80416
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-bc3f-96433404cd16
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-ddbe-04ffbe7fb713
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-dfc8-e8d459f2b697
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-9582-bb97d0a50edc
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-98ab-b4694b7a7e5c
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-1443-4f64f8a69354
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-d118-558bcd9dc624
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-ca84-a9a48fe79852
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-cbea-b749b8f78041
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-4ac8-e74b25ec8249
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-30b7-186f9f88d6c4
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2c6c-a2f0cd14a6ab
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-a4ef-f7a999464170
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-a08e-9e15cd62da9d
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-adcd-2bffdf9e40cb
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-9f90-c370bc0ad660
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-c753-fc56eeba38b8
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-5ef2-a51f2bcfb1a7
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-b37a-e870fc3ebc4d
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2dbe-2f72b7699b6d
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-4ec8-5952744ebc14
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-835e-1780960965fc
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-ec49-7c25a9185798
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-a4b6-eb5c233350ae
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-af39-197d219d1366
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e57f-59aa97c89a42
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-d1dd-0223edfc71f6
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-c60f-a65c99912126
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-fe81-8aadb5e7579d
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-d9b3-60cce9d6c388
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-5e38-3aeb205292d6
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-56eb-39d7f93caf18
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-f2b6-9a4283319552
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-0272-0fa9a2f0a7d0
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-88b3-07e3709a5b83
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-11e2-aefbc99fae17
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-33e3-79dac1ac1ee2
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-6db9-bf80d7407980
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-bd56-eb2e31f1f1c2
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-19f7-ac629e046d2c
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e07f-9978da1836f9
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-4dbd-09b2562e674f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-a13d-8563d30e5a8a
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-43d2-83385b9acbc4
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-0abe-17c9da888b28
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-5f07-59bb1c631a8b
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-fb25-259c41f5045f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-a8ae-ce6c0c0cdaa8
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2ba0-91b1df2850c0
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-41de-09e0dcab2372
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-3d53-36c1a7ccec83
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-c67c-51b90c21e4cf
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-6e7b-ec8ec261e10b
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-49f4-508d201023ae
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e8f6-08d28d273992
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-3bd2-bd92277725bd
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-3e64-d779e5b7970f
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-5472-73a9d5553d7d
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-718d-33979cb7c2ee
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-e4d6-0951e3533121
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2729-b94209290ea2
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-cac5-f3018b568c49
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-04c3-3cc0c3bf9a4e
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-3b20-4a42370ae936
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-913e-dd80e2ed3fbf
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-9c0c-697f51322363
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-6552-7fb3c6bf6449
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-2dc7-a9ada6bb167c
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-002d-6603ec18a2a7
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-b4a3-51d3a35ada22
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-5cc9-62fefa797ba8
00020000-56b3-6dd7-7280-417c511d3677	00030000-56b3-6dd4-b8a2-1b88f68427a7
00020000-56b3-6dd7-2805-70fb4b65315d	00030000-56b3-6dd4-08e9-270b95d4ad9a
00020000-56b3-6dd7-2810-e3cddfc9e22d	00030000-56b3-6dd4-2288-b0e83c6623aa
00020000-56b3-6dd7-e449-6ff67a90f935	00030000-56b3-6dd4-718d-33979cb7c2ee
00020000-56b3-6dd7-c546-cfa53164d874	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd7-c340-a5a9c406f74d	00030000-56b3-6dd4-4f21-bd2fff584826
00020000-56b3-6dd7-0a63-30da14c267a4	00030000-56b3-6dd4-9e63-e61941f6a1b0
00020000-56b3-6dd7-5175-35e3f6f19ae3	00030000-56b3-6dd4-4743-580e2976e86a
00020000-56b3-6dd7-9581-60e2b6c5e10e	00030000-56b3-6dd4-6fcc-457603bb8bed
00020000-56b3-6dd7-46f2-059586c40496	00030000-56b3-6dd4-6273-cafbc6466f9d
00020000-56b3-6dd7-c024-eb9c9e03370a	00030000-56b3-6dd4-1f21-52c7300c5f6e
00020000-56b3-6dd7-dcc7-e3008c5505f3	00030000-56b3-6dd4-c9c1-88581be23659
00020000-56b3-6dd7-bf73-aa86069b18f7	00030000-56b3-6dd4-273e-93017af3213a
00020000-56b3-6dd7-2aa7-60ab189351d4	00030000-56b3-6dd4-8b7e-73bff7c7858c
00020000-56b3-6dd7-1676-2d3236a6cb53	00030000-56b3-6dd4-070b-c969b36f5ff1
00020000-56b3-6dd7-5e7b-ddc5eb954ffc	00030000-56b3-6dd4-fea4-b4eb4e4c48a3
00020000-56b3-6dd7-5fb6-8709a2c96eec	00030000-56b3-6dd4-f9b2-9d1bfecdf7d4
00020000-56b3-6dd7-53cf-8eb4bb26f84b	00030000-56b3-6dd4-999b-9bada96d752f
00020000-56b3-6dd7-7e82-855adecbf583	00030000-56b3-6dd4-dd99-905313357c7f
00020000-56b3-6dd7-4014-a07126f96dfb	00030000-56b3-6dd4-590c-edadc3e1161c
00020000-56b3-6dd7-4014-a07126f96dfb	00030000-56b3-6dd4-8dc1-fe30eaa4a5a4
00020000-56b3-6dd7-4014-a07126f96dfb	00030000-56b3-6dd4-0c30-f69baf47ce02
00020000-56b3-6dd7-8b2f-93e6dc3ba487	00030000-56b3-6dd4-9b64-abed8e701e84
00020000-56b3-6dd7-b278-1e9913b2a6e3	00030000-56b3-6dd4-5472-73a9d5553d7d
00020000-56b3-6dd7-2b4d-2db2803acfe3	00030000-56b3-6dd4-43d2-83385b9acbc4
00020000-56b3-6dd7-328e-06274b7e2129	00030000-56b3-6dd4-d4ac-6ecafe7cf1d7
00020000-56b3-6dd7-c0bd-59372ad030b3	00030000-56b3-6dd4-5f07-59bb1c631a8b
00020000-56b3-6dd7-e88b-551128755596	00030000-56b3-6dd4-bc3e-96642c41f281
00020000-56b3-6dd7-1dcd-d765a0236382	00030000-56b3-6dd4-530d-ede18e48d6a3
00020000-56b3-6dd7-d426-c4091a29b7c7	00030000-56b3-6dd4-8cb4-3239e42a74c1
00020000-56b3-6dd7-87b2-64b7d144fb49	00030000-56b3-6dd4-2dc7-a9ada6bb167c
00020000-56b3-6dd7-052d-3f4027222489	00030000-56b3-6dd4-e9e8-183ce71bb2e6
00020000-56b3-6dd7-beb3-3184f5def4c1	00030000-56b3-6dd4-f39f-0a79e151efcd
00020000-56b3-6dd7-c249-dad07f0406db	00030000-56b3-6dd4-e42f-0dc47b73edad
00020000-56b3-6dd7-f656-d8ea35fad5df	00030000-56b3-6dd4-0abe-17c9da888b28
00020000-56b3-6dd7-b5ed-cb043292addf	00030000-56b3-6dd4-fb46-f2de5e4b204f
00020000-56b3-6dd7-cb29-5380941b6ac0	00030000-56b3-6dd4-a311-4a5a659699dc
00020000-56b3-6dd7-52f7-c320c5c88468	00030000-56b3-6dd4-2dc3-2539323a7738
00020000-56b3-6dd7-0226-bfa399a7d07c	00030000-56b3-6dd4-270f-3910d4248b68
00020000-56b3-6dd7-dfb9-735d83280528	00030000-56b3-6dd4-3b62-da03fb56936e
00020000-56b3-6dd7-daf1-855554a5ebc2	00030000-56b3-6dd4-5d02-b43361202cc7
\.


--
-- TOC entry 3181 (class 0 OID 43674440)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 43674475)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 43674608)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56b3-6dd7-2cf7-7ecfae520429	00090000-56b3-6dd7-aeae-0830e139582f	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56b3-6dd7-8a42-e13327a41697	00090000-56b3-6dd7-c61c-022e72d3d3cc	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56b3-6dd7-3a62-276d8b293d1c	00090000-56b3-6dd7-a378-6cffdb24cc3e	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56b3-6dd7-0f8e-191f599615c4	00090000-56b3-6dd7-8efe-6ba4ee0137ad	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 43674125)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56b3-6dd7-1a6f-ec5f6cd44ece	\N	00040000-56b3-6dd4-0f92-c9e8a7681290	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b3-6dd7-44dc-e8753771353e	\N	00040000-56b3-6dd4-0f92-c9e8a7681290	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56b3-6dd7-d3c7-cf542203de45	\N	00040000-56b3-6dd4-0f92-c9e8a7681290	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b3-6dd7-2f56-46438c1a01fc	\N	00040000-56b3-6dd4-0f92-c9e8a7681290	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b3-6dd7-f757-59b850ee55fa	\N	00040000-56b3-6dd4-0f92-c9e8a7681290	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b3-6dd7-ea81-067ae98b16e8	\N	00040000-56b3-6dd4-4b02-3a6404ed7d7a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b3-6dd7-5160-eb79b14d0cf2	\N	00040000-56b3-6dd4-0617-7231da4a95fe	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b3-6dd7-e46e-111a2ae63812	\N	00040000-56b3-6dd4-657b-6ac86c9c4278	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b3-6dd7-1f72-45eea30a124d	\N	00040000-56b3-6dd4-4fbb-d5295da3a11f	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56b3-6dd9-70bf-a748480b4cb3	\N	00040000-56b3-6dd4-0f92-c9e8a7681290	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 43674170)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56b3-6dd3-17d9-57812c86ba1d	8341	Adlešiči
00050000-56b3-6dd3-b210-34398439d055	5270	Ajdovščina
00050000-56b3-6dd3-68b4-97985820bf17	6280	Ankaran/Ancarano
00050000-56b3-6dd3-e98c-fb0f9c56f285	9253	Apače
00050000-56b3-6dd3-7221-a569d8ddab79	8253	Artiče
00050000-56b3-6dd3-4fe8-c74e79d3ac56	4275	Begunje na Gorenjskem
00050000-56b3-6dd3-1c01-c063a47d4bbf	1382	Begunje pri Cerknici
00050000-56b3-6dd3-f434-ce54722d26a7	9231	Beltinci
00050000-56b3-6dd3-432d-5d90e6fb0bdf	2234	Benedikt
00050000-56b3-6dd3-9a48-14c487b62d68	2345	Bistrica ob Dravi
00050000-56b3-6dd3-f36f-18004b1a33f0	3256	Bistrica ob Sotli
00050000-56b3-6dd3-1cab-79ece3767ea8	8259	Bizeljsko
00050000-56b3-6dd3-910c-c262d9634a60	1223	Blagovica
00050000-56b3-6dd3-fab1-3668ea616222	8283	Blanca
00050000-56b3-6dd3-7745-726d799a7972	4260	Bled
00050000-56b3-6dd3-94b7-a6dcc29b238f	4273	Blejska Dobrava
00050000-56b3-6dd3-e102-576060071b50	9265	Bodonci
00050000-56b3-6dd3-1dd1-7ba0cd3a9e18	9222	Bogojina
00050000-56b3-6dd3-d9f9-c09e4686ad57	4263	Bohinjska Bela
00050000-56b3-6dd3-bdc5-0f662319b547	4264	Bohinjska Bistrica
00050000-56b3-6dd3-63d4-4ca34716eda1	4265	Bohinjsko jezero
00050000-56b3-6dd3-611c-9722abd27a68	1353	Borovnica
00050000-56b3-6dd3-2895-a4f2dabf01cc	8294	Boštanj
00050000-56b3-6dd3-2aa4-60a61d173781	5230	Bovec
00050000-56b3-6dd3-80eb-e87e2114c181	5295	Branik
00050000-56b3-6dd3-3f7d-1f2e3a016c2d	3314	Braslovče
00050000-56b3-6dd3-9f6d-d2236b18dbd0	5223	Breginj
00050000-56b3-6dd3-fcb2-0ac385a3b867	8280	Brestanica
00050000-56b3-6dd3-43a2-76c36bb8335d	2354	Bresternica
00050000-56b3-6dd3-0d15-94348f0d28cb	4243	Brezje
00050000-56b3-6dd3-ce66-4f8e361ad6f5	1351	Brezovica pri Ljubljani
00050000-56b3-6dd3-5266-c202481b3fea	8250	Brežice
00050000-56b3-6dd3-e34d-5aecf355dfe3	4210	Brnik - Aerodrom
00050000-56b3-6dd3-047b-4594578eb4ff	8321	Brusnice
00050000-56b3-6dd3-a418-84cec9111f43	3255	Buče
00050000-56b3-6dd3-2b16-95b3884a88a6	8276	Bučka 
00050000-56b3-6dd3-29f4-739aa89352c4	9261	Cankova
00050000-56b3-6dd3-aaf6-d7a3a6fe5940	3000	Celje 
00050000-56b3-6dd3-9946-f87737127235	3001	Celje - poštni predali
00050000-56b3-6dd3-4c0d-0d0908c7a21b	4207	Cerklje na Gorenjskem
00050000-56b3-6dd3-9c68-5e06f33a2d1f	8263	Cerklje ob Krki
00050000-56b3-6dd3-64d7-4cd4b51ee27b	1380	Cerknica
00050000-56b3-6dd3-bb3d-e211a1443733	5282	Cerkno
00050000-56b3-6dd3-31ce-8dee9aeacb46	2236	Cerkvenjak
00050000-56b3-6dd3-c388-572da19c7e95	2215	Ceršak
00050000-56b3-6dd3-d762-d40438113474	2326	Cirkovce
00050000-56b3-6dd3-d7ea-9ab96889f1b7	2282	Cirkulane
00050000-56b3-6dd3-0afc-642643e4f1a1	5273	Col
00050000-56b3-6dd3-6fde-bccc5a83d57e	8251	Čatež ob Savi
00050000-56b3-6dd3-fce1-5d9da95748c2	1413	Čemšenik
00050000-56b3-6dd3-95db-b925a5f6b2ea	5253	Čepovan
00050000-56b3-6dd3-7f02-5ff375a64a87	9232	Črenšovci
00050000-56b3-6dd3-7668-b5ee57fdd200	2393	Črna na Koroškem
00050000-56b3-6dd3-ed9f-3d009cca64ca	6275	Črni Kal
00050000-56b3-6dd3-1d61-fc28fd5b831c	5274	Črni Vrh nad Idrijo
00050000-56b3-6dd3-2a01-2d745d4e511e	5262	Črniče
00050000-56b3-6dd3-d06c-97a236e330b7	8340	Črnomelj
00050000-56b3-6dd3-d8c2-ae4ad1b70f27	6271	Dekani
00050000-56b3-6dd3-4a36-ecd7cb0e641d	5210	Deskle
00050000-56b3-6dd3-ecf1-78c692fcef59	2253	Destrnik
00050000-56b3-6dd3-7b90-5e4225df598b	6215	Divača
00050000-56b3-6dd3-1b5a-45755a1a386f	1233	Dob
00050000-56b3-6dd3-2fcb-b35fadb68e89	3224	Dobje pri Planini
00050000-56b3-6dd3-9135-6a4e824601f0	8257	Dobova
00050000-56b3-6dd3-7162-0b7198e1928b	1423	Dobovec
00050000-56b3-6dd3-0818-66fb61daf5f1	5263	Dobravlje
00050000-56b3-6dd3-45c7-0f3662300249	3204	Dobrna
00050000-56b3-6dd3-3eb0-b1fe0c1cd957	8211	Dobrnič
00050000-56b3-6dd3-6ab0-b363322e52e7	1356	Dobrova
00050000-56b3-6dd3-d6dc-eede022df729	9223	Dobrovnik/Dobronak 
00050000-56b3-6dd3-57c5-8fb7a436b7dd	5212	Dobrovo v Brdih
00050000-56b3-6dd3-b48e-3fd3d7f60af5	1431	Dol pri Hrastniku
00050000-56b3-6dd3-68f2-81cdc0296c97	1262	Dol pri Ljubljani
00050000-56b3-6dd3-86ac-c7a077e34d42	1273	Dole pri Litiji
00050000-56b3-6dd3-bf0a-78f0d68dcdfd	1331	Dolenja vas
00050000-56b3-6dd3-c997-925b1cdc0b94	8350	Dolenjske Toplice
00050000-56b3-6dd3-bd81-5a87695e8530	1230	Domžale
00050000-56b3-6dd3-424e-d9135a961015	2252	Dornava
00050000-56b3-6dd3-4fb9-d5f3a55dba88	5294	Dornberk
00050000-56b3-6dd3-08d7-5c9a77c88bd1	1319	Draga
00050000-56b3-6dd3-ca4e-042c71893d60	8343	Dragatuš
00050000-56b3-6dd3-7629-286d56a9e790	3222	Dramlje
00050000-56b3-6dd3-9ff2-c0a26b1e48b9	2370	Dravograd
00050000-56b3-6dd3-b44f-a4c1a9412f86	4203	Duplje
00050000-56b3-6dd3-b10b-2cf9cc86f4d5	6221	Dutovlje
00050000-56b3-6dd3-b4c7-400743028f90	8361	Dvor
00050000-56b3-6dd3-6244-c1fe6c80af15	2343	Fala
00050000-56b3-6dd3-7ed1-24ce782a9d8b	9208	Fokovci
00050000-56b3-6dd3-ddc3-d98bca50ca41	2313	Fram
00050000-56b3-6dd3-d212-36422051aaab	3213	Frankolovo
00050000-56b3-6dd3-ee4f-f1d5a441c7d0	1274	Gabrovka
00050000-56b3-6dd3-c8f9-2787bf840811	8254	Globoko
00050000-56b3-6dd3-7de6-ca78fe8f27f2	5275	Godovič
00050000-56b3-6dd3-ce1e-6ee1939ad10f	4204	Golnik
00050000-56b3-6dd3-3924-dcd8338b9ff1	3303	Gomilsko
00050000-56b3-6dd3-32f1-3ebe5989cf91	4224	Gorenja vas
00050000-56b3-6dd3-632c-501b90f00a20	3263	Gorica pri Slivnici
00050000-56b3-6dd3-54e1-bbbc4a43d597	2272	Gorišnica
00050000-56b3-6dd3-95cd-0f2b06e3a629	9250	Gornja Radgona
00050000-56b3-6dd3-e553-e84a1d9dedcb	3342	Gornji Grad
00050000-56b3-6dd3-cd54-faf52a07e6b3	4282	Gozd Martuljek
00050000-56b3-6dd3-2894-dde9f77353f2	6272	Gračišče
00050000-56b3-6dd3-a951-d880db79b7cf	9264	Grad
00050000-56b3-6dd3-c540-ba6ccc95bad7	8332	Gradac
00050000-56b3-6dd3-2fc5-6756650e8fe5	1384	Grahovo
00050000-56b3-6dd3-030a-104ba8f10751	5242	Grahovo ob Bači
00050000-56b3-6dd3-5e13-d47be655e544	5251	Grgar
00050000-56b3-6dd3-912a-7608c89a78bc	3302	Griže
00050000-56b3-6dd3-abee-180625575b4e	3231	Grobelno
00050000-56b3-6dd3-a1db-49807605d425	1290	Grosuplje
00050000-56b3-6dd3-52ba-f08498fc2237	2288	Hajdina
00050000-56b3-6dd3-d08d-604fb9a2537d	8362	Hinje
00050000-56b3-6dd3-2432-43c38302a5e0	2311	Hoče
00050000-56b3-6dd3-f657-e57309d17b54	9205	Hodoš/Hodos
00050000-56b3-6dd3-f383-f7a7586ecad7	1354	Horjul
00050000-56b3-6dd3-fd64-f48fb6f44e3f	1372	Hotedršica
00050000-56b3-6dd3-ed9c-b197a86ca847	1430	Hrastnik
00050000-56b3-6dd3-946f-c451b42fda50	6225	Hruševje
00050000-56b3-6dd3-bed4-563f2562f748	4276	Hrušica
00050000-56b3-6dd3-4a08-059ecd2af119	5280	Idrija
00050000-56b3-6dd3-7374-d6fa16a13654	1292	Ig
00050000-56b3-6dd3-45a1-eb72fd8f3959	6250	Ilirska Bistrica
00050000-56b3-6dd3-bdc7-fe6eefecf06d	6251	Ilirska Bistrica-Trnovo
00050000-56b3-6dd3-4725-4e5c4ed65525	1295	Ivančna Gorica
00050000-56b3-6dd3-bef0-87005f5326bc	2259	Ivanjkovci
00050000-56b3-6dd3-a193-94da099f2867	1411	Izlake
00050000-56b3-6dd3-a88d-01ed3296df1e	6310	Izola/Isola
00050000-56b3-6dd3-30e5-efcf46681a88	2222	Jakobski Dol
00050000-56b3-6dd3-7891-8ceab6004784	2221	Jarenina
00050000-56b3-6dd3-0870-5fe63b2f29c0	6254	Jelšane
00050000-56b3-6dd3-d50b-bc6a0a8df7e9	4270	Jesenice
00050000-56b3-6dd3-0de6-2a9955accb69	8261	Jesenice na Dolenjskem
00050000-56b3-6dd3-13c7-1e57a102c435	3273	Jurklošter
00050000-56b3-6dd3-cbd2-953048484e68	2223	Jurovski Dol
00050000-56b3-6dd3-6df3-d2a5e01fabe8	2256	Juršinci
00050000-56b3-6dd3-dd9f-a2f34913a42b	5214	Kal nad Kanalom
00050000-56b3-6dd3-ac5d-a78288ff185a	3233	Kalobje
00050000-56b3-6dd3-4d7e-c222f5d967b3	4246	Kamna Gorica
00050000-56b3-6dd3-d8e5-eebb339aefe6	2351	Kamnica
00050000-56b3-6dd3-ab1a-7b6cd9bd457a	1241	Kamnik
00050000-56b3-6dd3-ae29-6adac8ce480f	5213	Kanal
00050000-56b3-6dd3-bf23-a23e7ac78e7c	8258	Kapele
00050000-56b3-6dd3-70e5-0bd44546753e	2362	Kapla
00050000-56b3-6dd3-9631-31c1ae7f45a9	2325	Kidričevo
00050000-56b3-6dd3-964e-7264d16e14bc	1412	Kisovec
00050000-56b3-6dd3-68c3-240913037284	6253	Knežak
00050000-56b3-6dd3-f495-8a3d1204aa57	5222	Kobarid
00050000-56b3-6dd3-0e37-d9e966cec596	9227	Kobilje
00050000-56b3-6dd3-69f0-a2cdfb2a3908	1330	Kočevje
00050000-56b3-6dd3-5564-aa8f2ea08760	1338	Kočevska Reka
00050000-56b3-6dd3-7f27-0c84039a897e	2276	Kog
00050000-56b3-6dd3-43fe-b2c4005c1c21	5211	Kojsko
00050000-56b3-6dd3-0294-16e3cc68e690	6223	Komen
00050000-56b3-6dd3-86ce-2bd8bf3a16ab	1218	Komenda
00050000-56b3-6dd3-c3ab-d9c2bb8f2612	6000	Koper/Capodistria 
00050000-56b3-6dd3-bd06-8deb33185985	6001	Koper/Capodistria - poštni predali
00050000-56b3-6dd3-0eab-e6133edb86f8	8282	Koprivnica
00050000-56b3-6dd3-403a-d91855900502	5296	Kostanjevica na Krasu
00050000-56b3-6dd3-a68e-ede85c882a05	8311	Kostanjevica na Krki
00050000-56b3-6dd3-0ed9-e9e66de6c3c3	1336	Kostel
00050000-56b3-6dd3-e282-8284e316b1c3	6256	Košana
00050000-56b3-6dd3-1ea3-b86891054b97	2394	Kotlje
00050000-56b3-6dd3-b7eb-513f20b5e5df	6240	Kozina
00050000-56b3-6dd3-2fe3-4e8e29c3ca22	3260	Kozje
00050000-56b3-6dd3-ec4e-7cb9755dc515	4000	Kranj 
00050000-56b3-6dd3-147f-c345c4e87443	4001	Kranj - poštni predali
00050000-56b3-6dd3-956f-f9265be5d5a9	4280	Kranjska Gora
00050000-56b3-6dd3-aaf9-cc53a491b7ce	1281	Kresnice
00050000-56b3-6dd3-bd60-016d07826b5f	4294	Križe
00050000-56b3-6dd3-ba0b-1b68835057b1	9206	Križevci
00050000-56b3-6dd3-bbfe-031207a2f13a	9242	Križevci pri Ljutomeru
00050000-56b3-6dd3-3047-a5f37fbe2f95	1301	Krka
00050000-56b3-6dd3-7de4-bdd2687ec513	8296	Krmelj
00050000-56b3-6dd3-340c-39fd972ccc8f	4245	Kropa
00050000-56b3-6dd3-0509-45acadc4000a	8262	Krška vas
00050000-56b3-6dd3-2cd3-44fe5790ad1c	8270	Krško
00050000-56b3-6dd3-d77e-ca98eb7235f5	9263	Kuzma
00050000-56b3-6dd3-29ac-8b5fc6111f74	2318	Laporje
00050000-56b3-6dd3-f593-7805d14ebb8f	3270	Laško
00050000-56b3-6dd3-5dcb-9c81252a2824	1219	Laze v Tuhinju
00050000-56b3-6dd3-c473-e0e38e90f07b	2230	Lenart v Slovenskih goricah
00050000-56b3-6dd3-9c2f-1ac42772a8ba	9220	Lendava/Lendva
00050000-56b3-6dd3-9ba4-52bba076c124	4248	Lesce
00050000-56b3-6dd3-201b-53d6d81dd06d	3261	Lesično
00050000-56b3-6dd3-8220-bf5dc283782b	8273	Leskovec pri Krškem
00050000-56b3-6dd3-3a99-da7ad7b41a8e	2372	Libeliče
00050000-56b3-6dd3-974b-07b397fba187	2341	Limbuš
00050000-56b3-6dd3-b453-ae92d1fad505	1270	Litija
00050000-56b3-6dd3-c1eb-3051ab663a4e	3202	Ljubečna
00050000-56b3-6dd3-2715-f5479926e462	1000	Ljubljana 
00050000-56b3-6dd3-ea9f-99d7a27882cf	1001	Ljubljana - poštni predali
00050000-56b3-6dd3-a290-44d4a5229e23	1231	Ljubljana - Črnuče
00050000-56b3-6dd3-2d8e-dc80d3987efa	1261	Ljubljana - Dobrunje
00050000-56b3-6dd3-a445-021d87faca70	1260	Ljubljana - Polje
00050000-56b3-6dd3-c23c-b3a54ea75850	1210	Ljubljana - Šentvid
00050000-56b3-6dd3-0555-765c997c6097	1211	Ljubljana - Šmartno
00050000-56b3-6dd3-2c65-797f5a72d26c	3333	Ljubno ob Savinji
00050000-56b3-6dd3-866f-daf3bed31b29	9240	Ljutomer
00050000-56b3-6dd3-d846-dcfd1d51e2b1	3215	Loče
00050000-56b3-6dd3-0c8b-308e6c3ae44d	5231	Log pod Mangartom
00050000-56b3-6dd3-ac92-04c7e59790ad	1358	Log pri Brezovici
00050000-56b3-6dd3-27d0-4bc137bad405	1370	Logatec
00050000-56b3-6dd3-dc37-ca00b5d4f6ea	1371	Logatec
00050000-56b3-6dd3-fb9e-b702676b2c78	1434	Loka pri Zidanem Mostu
00050000-56b3-6dd3-6993-51b885ea1500	3223	Loka pri Žusmu
00050000-56b3-6dd3-8682-13e5a7c439c0	6219	Lokev
00050000-56b3-6dd3-3d4d-31bd5c51898c	1318	Loški Potok
00050000-56b3-6dd3-8a7b-7b948d06095b	2324	Lovrenc na Dravskem polju
00050000-56b3-6dd3-4d38-924f161d0805	2344	Lovrenc na Pohorju
00050000-56b3-6dd3-b8d0-6ac0a9f912c1	3334	Luče
00050000-56b3-6dd3-fa99-6ab4136abbd5	1225	Lukovica
00050000-56b3-6dd3-8345-c7bc1e026459	9202	Mačkovci
00050000-56b3-6dd3-0d12-0df2b604b2df	2322	Majšperk
00050000-56b3-6dd3-24df-5f97ddef2f56	2321	Makole
00050000-56b3-6dd3-9490-f62761249dc9	9243	Mala Nedelja
00050000-56b3-6dd3-4a84-4c66d98bdd28	2229	Malečnik
00050000-56b3-6dd3-733f-498a98ffe606	6273	Marezige
00050000-56b3-6dd3-0062-3fa2990efa8f	2000	Maribor 
00050000-56b3-6dd3-093c-a538bc8f6d10	2001	Maribor - poštni predali
00050000-56b3-6dd3-d893-dce1c23fda6a	2206	Marjeta na Dravskem polju
00050000-56b3-6dd3-2959-ded096a76d54	2281	Markovci
00050000-56b3-6dd3-e6ae-5f1dc5906f08	9221	Martjanci
00050000-56b3-6dd3-6755-5ed3a23b2ad0	6242	Materija
00050000-56b3-6dd3-4534-54c4ea864edf	4211	Mavčiče
00050000-56b3-6dd3-61d1-ea101dc21acb	1215	Medvode
00050000-56b3-6dd3-a423-c7010513198e	1234	Mengeš
00050000-56b3-6dd3-4376-7195ce1a3c34	8330	Metlika
00050000-56b3-6dd3-1fd2-3e62e13ffa8d	2392	Mežica
00050000-56b3-6dd3-2a3d-02d0bfdf6b9c	2204	Miklavž na Dravskem polju
00050000-56b3-6dd3-0df2-1cd554ba636a	2275	Miklavž pri Ormožu
00050000-56b3-6dd3-949e-6082aa736310	5291	Miren
00050000-56b3-6dd3-8952-9a954331a391	8233	Mirna
00050000-56b3-6dd3-831b-7a3394d92153	8216	Mirna Peč
00050000-56b3-6dd3-8eb4-4691189ad41f	2382	Mislinja
00050000-56b3-6dd3-8216-04aa637db7fd	4281	Mojstrana
00050000-56b3-6dd3-09b8-e88d527485df	8230	Mokronog
00050000-56b3-6dd3-dbec-e7b03c865a52	1251	Moravče
00050000-56b3-6dd3-4da6-f5cab84e2278	9226	Moravske Toplice
00050000-56b3-6dd3-2331-485a5b22ef73	5216	Most na Soči
00050000-56b3-6dd3-a282-ccd3ffc34485	1221	Motnik
00050000-56b3-6dd3-4fb0-6c9da3167436	3330	Mozirje
00050000-56b3-6dd3-915c-36b35a61a591	9000	Murska Sobota 
00050000-56b3-6dd3-ac3f-ca36c3a3d605	9001	Murska Sobota - poštni predali
00050000-56b3-6dd3-3554-a72f1c2c3b5d	2366	Muta
00050000-56b3-6dd3-9fb2-6d03660728f3	4202	Naklo
00050000-56b3-6dd3-1fbe-20a6754fe692	3331	Nazarje
00050000-56b3-6dd3-0fe0-585f89219872	1357	Notranje Gorice
00050000-56b3-6dd3-7f16-e0e867b7a9ce	3203	Nova Cerkev
00050000-56b3-6dd3-e84f-0a7f974129ca	5000	Nova Gorica 
00050000-56b3-6dd3-4622-6d90a146cbb4	5001	Nova Gorica - poštni predali
00050000-56b3-6dd3-d0b7-9fa457370b27	1385	Nova vas
00050000-56b3-6dd3-739d-71e5aa45498d	8000	Novo mesto
00050000-56b3-6dd3-7b28-6dc1b90ad21f	8001	Novo mesto - poštni predali
00050000-56b3-6dd3-f549-a31f316ce806	6243	Obrov
00050000-56b3-6dd3-6fd9-39c173f79c09	9233	Odranci
00050000-56b3-6dd3-9a17-dbadc99abc6f	2317	Oplotnica
00050000-56b3-6dd3-8e8c-7d2271f18b9b	2312	Orehova vas
00050000-56b3-6dd3-0c89-54d0d97fe03b	2270	Ormož
00050000-56b3-6dd3-66a7-c3b372f5e383	1316	Ortnek
00050000-56b3-6dd3-1d69-95f70822185a	1337	Osilnica
00050000-56b3-6dd3-f0f2-195315ee3dd0	8222	Otočec
00050000-56b3-6dd3-23a1-315f5ad02117	2361	Ožbalt
00050000-56b3-6dd3-995b-cfff38fc3437	2231	Pernica
00050000-56b3-6dd3-6a82-8286c430b656	2211	Pesnica pri Mariboru
00050000-56b3-6dd3-3c35-39f53523a607	9203	Petrovci
00050000-56b3-6dd3-b498-635cbee1bd90	3301	Petrovče
00050000-56b3-6dd3-e755-21786b1234f2	6330	Piran/Pirano
00050000-56b3-6dd3-71a4-b11ab3877288	8255	Pišece
00050000-56b3-6dd3-8592-3e151c67848b	6257	Pivka
00050000-56b3-6dd3-41b6-fc25852690fd	6232	Planina
00050000-56b3-6dd3-9101-19bb01ff2c45	3225	Planina pri Sevnici
00050000-56b3-6dd3-06c4-1ae3b9bc0ef2	6276	Pobegi
00050000-56b3-6dd3-dc2c-12390c57ef88	8312	Podbočje
00050000-56b3-6dd3-d144-7af329cd5f09	5243	Podbrdo
00050000-56b3-6dd3-e1de-a4c9ccec1912	3254	Podčetrtek
00050000-56b3-6dd3-3d74-600546f7527e	2273	Podgorci
00050000-56b3-6dd3-5bba-fbf15b9b0508	6216	Podgorje
00050000-56b3-6dd3-a76e-c33038df64df	2381	Podgorje pri Slovenj Gradcu
00050000-56b3-6dd3-c02c-3d5f6fc6c56b	6244	Podgrad
00050000-56b3-6dd3-20e3-9cdbed20be49	1414	Podkum
00050000-56b3-6dd3-7608-d4fb83e16e19	2286	Podlehnik
00050000-56b3-6dd3-942d-ed9d985f1496	5272	Podnanos
00050000-56b3-6dd3-960d-4927ddd3c752	4244	Podnart
00050000-56b3-6dd3-9a49-df704b8e7f88	3241	Podplat
00050000-56b3-6dd3-6afe-93cfcf33a074	3257	Podsreda
00050000-56b3-6dd3-3f8b-df85af306140	2363	Podvelka
00050000-56b3-6dd3-87f8-9b25f30c58c7	2208	Pohorje
00050000-56b3-6dd3-58b6-4e95a8f6f8e9	2257	Polenšak
00050000-56b3-6dd3-9688-e2aa91a4ce8d	1355	Polhov Gradec
00050000-56b3-6dd3-5bba-8bd95c0db9f7	4223	Poljane nad Škofjo Loko
00050000-56b3-6dd3-7939-0fc2fc853368	2319	Poljčane
00050000-56b3-6dd3-983b-601beb08c5f7	1272	Polšnik
00050000-56b3-6dd3-78d2-67ff56d8b438	3313	Polzela
00050000-56b3-6dd3-d039-9e6c2532bd60	3232	Ponikva
00050000-56b3-6dd3-29cc-0c9fc0efff4b	6320	Portorož/Portorose
00050000-56b3-6dd3-5061-1690e7ff517b	6230	Postojna
00050000-56b3-6dd3-2887-45616e2ce942	2331	Pragersko
00050000-56b3-6dd3-25d4-619f38e77129	3312	Prebold
00050000-56b3-6dd3-229c-258f228d85d4	4205	Preddvor
00050000-56b3-6dd3-96d5-afa987f1a1e3	6255	Prem
00050000-56b3-6dd3-731c-22a1b47e5239	1352	Preserje
00050000-56b3-6dd3-58b0-dcbe95cb5773	6258	Prestranek
00050000-56b3-6dd3-96cf-1c948de76415	2391	Prevalje
00050000-56b3-6dd3-e176-0756c5d30974	3262	Prevorje
00050000-56b3-6dd3-b97c-60e060383a13	1276	Primskovo 
00050000-56b3-6dd3-f9c9-e497f3aa244d	3253	Pristava pri Mestinju
00050000-56b3-6dd3-c096-68bf1554f9bb	9207	Prosenjakovci/Partosfalva
00050000-56b3-6dd3-a657-5ecc166c43cb	5297	Prvačina
00050000-56b3-6dd3-3de9-b4a225481c88	2250	Ptuj
00050000-56b3-6dd3-269a-7d4f5b351c3f	2323	Ptujska Gora
00050000-56b3-6dd3-36f3-12f0540be11e	9201	Puconci
00050000-56b3-6dd3-8f17-ff2e653a8dfc	2327	Rače
00050000-56b3-6dd3-69c3-5307c58f235f	1433	Radeče
00050000-56b3-6dd3-01ec-9e3e733dd959	9252	Radenci
00050000-56b3-6dd3-15f7-71d1778164ce	2360	Radlje ob Dravi
00050000-56b3-6dd3-85dd-3c6200fd0bf6	1235	Radomlje
00050000-56b3-6dd3-a231-075282c11a9d	4240	Radovljica
00050000-56b3-6dd3-5495-f3fb45630d0f	8274	Raka
00050000-56b3-6dd3-f473-71c336917668	1381	Rakek
00050000-56b3-6dd3-aa24-c7849096f170	4283	Rateče - Planica
00050000-56b3-6dd3-3014-669643063c7d	2390	Ravne na Koroškem
00050000-56b3-6dd3-8ecf-6881ae667301	9246	Razkrižje
00050000-56b3-6dd3-9f27-b2ebc68c54c7	3332	Rečica ob Savinji
00050000-56b3-6dd3-a259-f5517bb39546	5292	Renče
00050000-56b3-6dd3-34cf-38354c247303	1310	Ribnica
00050000-56b3-6dd3-a600-704247f7333b	2364	Ribnica na Pohorju
00050000-56b3-6dd3-e11c-2d99039fe136	3272	Rimske Toplice
00050000-56b3-6dd3-01b4-a86540a39187	1314	Rob
00050000-56b3-6dd3-4ea9-4770b0bd74e9	5215	Ročinj
00050000-56b3-6dd3-77b2-7d44f253f61e	3250	Rogaška Slatina
00050000-56b3-6dd3-bd95-3455729acf49	9262	Rogašovci
00050000-56b3-6dd3-0145-53cc14507e08	3252	Rogatec
00050000-56b3-6dd3-07fa-b43673bd709d	1373	Rovte
00050000-56b3-6dd3-05c9-583fd80e8f27	2342	Ruše
00050000-56b3-6dd3-d918-fb5624993ee6	1282	Sava
00050000-56b3-6dd3-bd05-e58c0c20ca24	6333	Sečovlje/Sicciole
00050000-56b3-6dd4-c383-51ec4f1ebbd8	4227	Selca
00050000-56b3-6dd4-7760-6b4e7f66c990	2352	Selnica ob Dravi
00050000-56b3-6dd4-d12d-7844c35736a6	8333	Semič
00050000-56b3-6dd4-5a6f-a1676d814ddf	8281	Senovo
00050000-56b3-6dd4-7820-f90b562c071d	6224	Senožeče
00050000-56b3-6dd4-cbe9-e303e08cab41	8290	Sevnica
00050000-56b3-6dd4-8677-e2c2a4eb1a36	6210	Sežana
00050000-56b3-6dd4-16d4-8f6c0f9c4bb8	2214	Sladki Vrh
00050000-56b3-6dd4-e5d3-bd8fe38d2df3	5283	Slap ob Idrijci
00050000-56b3-6dd4-4a2e-f1cb9f34b1e9	2380	Slovenj Gradec
00050000-56b3-6dd4-4dc8-92143b46523c	2310	Slovenska Bistrica
00050000-56b3-6dd4-b1e9-7ea597e9ee2c	3210	Slovenske Konjice
00050000-56b3-6dd4-0328-579a42dc14b0	1216	Smlednik
00050000-56b3-6dd4-7e52-4dab78ab4629	5232	Soča
00050000-56b3-6dd4-e6cf-7dee6862f004	1317	Sodražica
00050000-56b3-6dd4-6dc8-21eb50fda520	3335	Solčava
00050000-56b3-6dd4-4a71-5d09f8c5322b	5250	Solkan
00050000-56b3-6dd4-c4cf-a039a4ffd821	4229	Sorica
00050000-56b3-6dd4-3ff1-52866bb9831d	4225	Sovodenj
00050000-56b3-6dd4-e5f9-8675a85d84a2	5281	Spodnja Idrija
00050000-56b3-6dd4-de6e-d296ece85f95	2241	Spodnji Duplek
00050000-56b3-6dd4-6b54-c178964ce335	9245	Spodnji Ivanjci
00050000-56b3-6dd4-a572-6c8b9dd6377a	2277	Središče ob Dravi
00050000-56b3-6dd4-3ab1-61e50249facd	4267	Srednja vas v Bohinju
00050000-56b3-6dd4-f4b5-8d936c0df567	8256	Sromlje 
00050000-56b3-6dd4-08b9-1843cb2c829f	5224	Srpenica
00050000-56b3-6dd4-f5f8-92a23f2d4124	1242	Stahovica
00050000-56b3-6dd4-b733-fd94c1c37260	1332	Stara Cerkev
00050000-56b3-6dd4-1714-009f5d3f90db	8342	Stari trg ob Kolpi
00050000-56b3-6dd4-02de-4bde719f4726	1386	Stari trg pri Ložu
00050000-56b3-6dd4-46cb-3714a05b3104	2205	Starše
00050000-56b3-6dd4-356d-39c597a42e6c	2289	Stoperce
00050000-56b3-6dd4-b242-52e21d32b4a0	8322	Stopiče
00050000-56b3-6dd4-6e57-fe43d980fa1e	3206	Stranice
00050000-56b3-6dd4-a7f6-fc2160c46762	8351	Straža
00050000-56b3-6dd4-f14c-99574ca26251	1313	Struge
00050000-56b3-6dd4-d583-dd7473ba19a0	8293	Studenec
00050000-56b3-6dd4-4694-c616b5066110	8331	Suhor
00050000-56b3-6dd4-8b67-e5e313888fff	2233	Sv. Ana v Slovenskih goricah
00050000-56b3-6dd4-c3e0-b557b7507efd	2235	Sv. Trojica v Slovenskih goricah
00050000-56b3-6dd4-c687-f8620d04757a	2353	Sveti Duh na Ostrem Vrhu
00050000-56b3-6dd4-ab5e-50680ab3348e	9244	Sveti Jurij ob Ščavnici
00050000-56b3-6dd4-f7dc-17205cd59488	3264	Sveti Štefan
00050000-56b3-6dd4-28a3-58b75ef84fb2	2258	Sveti Tomaž
00050000-56b3-6dd4-98c6-c77b4bd9ec31	9204	Šalovci
00050000-56b3-6dd4-40e4-27fc011ecc5d	5261	Šempas
00050000-56b3-6dd4-c20f-880e2700b7e0	5290	Šempeter pri Gorici
00050000-56b3-6dd4-6ad1-01b8571ccf7b	3311	Šempeter v Savinjski dolini
00050000-56b3-6dd4-db41-1df2a466651a	4208	Šenčur
00050000-56b3-6dd4-52bd-6bdb9b707644	2212	Šentilj v Slovenskih goricah
00050000-56b3-6dd4-77c1-445bb1428ad5	8297	Šentjanž
00050000-56b3-6dd4-711c-b73ecc15ddb0	2373	Šentjanž pri Dravogradu
00050000-56b3-6dd4-adfc-13a1c9329149	8310	Šentjernej
00050000-56b3-6dd4-1293-cfacf523d6cd	3230	Šentjur
00050000-56b3-6dd4-c3bc-765d687ea848	3271	Šentrupert
00050000-56b3-6dd4-54fd-b4ffee18889a	8232	Šentrupert
00050000-56b3-6dd4-ce30-46b51a291c81	1296	Šentvid pri Stični
00050000-56b3-6dd4-8bab-06c8b40e4791	8275	Škocjan
00050000-56b3-6dd4-1237-2504737490fb	6281	Škofije
00050000-56b3-6dd4-6f4b-de128457bcb1	4220	Škofja Loka
00050000-56b3-6dd4-a066-7a945c7bdf1f	3211	Škofja vas
00050000-56b3-6dd4-6944-ca480650edf1	1291	Škofljica
00050000-56b3-6dd4-22b2-88df7fb13e55	6274	Šmarje
00050000-56b3-6dd4-77bb-bf76f195ace0	1293	Šmarje - Sap
00050000-56b3-6dd4-034c-f47aa0a0e2fd	3240	Šmarje pri Jelšah
00050000-56b3-6dd4-6cc3-cb3a67515faf	8220	Šmarješke Toplice
00050000-56b3-6dd4-6c43-3daae7edf076	2315	Šmartno na Pohorju
00050000-56b3-6dd4-bb74-2162df643499	3341	Šmartno ob Dreti
00050000-56b3-6dd4-e34c-c41eb109bfbb	3327	Šmartno ob Paki
00050000-56b3-6dd4-d2d0-653110f209e9	1275	Šmartno pri Litiji
00050000-56b3-6dd4-c896-ec27b4ea2242	2383	Šmartno pri Slovenj Gradcu
00050000-56b3-6dd4-8cef-3578022eb60f	3201	Šmartno v Rožni dolini
00050000-56b3-6dd4-9d3d-6c8edf7268fb	3325	Šoštanj
00050000-56b3-6dd4-9691-92b6f0b22323	6222	Štanjel
00050000-56b3-6dd4-6b21-bcd4374ac22d	3220	Štore
00050000-56b3-6dd4-c730-333c1acecf87	3304	Tabor
00050000-56b3-6dd4-5eab-6f72b8950842	3221	Teharje
00050000-56b3-6dd4-9dd7-c529f723b184	9251	Tišina
00050000-56b3-6dd4-cd42-2241a069c1f7	5220	Tolmin
00050000-56b3-6dd4-c409-25c3c2bcd1f6	3326	Topolšica
00050000-56b3-6dd4-45af-e67bc674a496	2371	Trbonje
00050000-56b3-6dd4-6cb6-ce9c2f1badff	1420	Trbovlje
00050000-56b3-6dd4-afdb-7472ce0f4364	8231	Trebelno 
00050000-56b3-6dd4-836c-20d5c687ba78	8210	Trebnje
00050000-56b3-6dd4-ac50-c061a2e743f9	5252	Trnovo pri Gorici
00050000-56b3-6dd4-351d-cbf6c278057a	2254	Trnovska vas
00050000-56b3-6dd4-242d-26c85f68ba5e	1222	Trojane
00050000-56b3-6dd4-a173-f56034001717	1236	Trzin
00050000-56b3-6dd4-432d-d1c1de4a7564	4290	Tržič
00050000-56b3-6dd4-b53d-67f15506c3fb	8295	Tržišče
00050000-56b3-6dd4-0bbe-6d83a175a47b	1311	Turjak
00050000-56b3-6dd4-0970-0eb88ebb3709	9224	Turnišče
00050000-56b3-6dd4-0618-8925a82f32f5	8323	Uršna sela
00050000-56b3-6dd4-71e8-0789f5ca5ec9	1252	Vače
00050000-56b3-6dd4-e864-3e01f8ab788d	3320	Velenje 
00050000-56b3-6dd4-a91b-a72049df938a	3322	Velenje - poštni predali
00050000-56b3-6dd4-5ea6-dda39f279ec5	8212	Velika Loka
00050000-56b3-6dd4-e12b-82ce47004efc	2274	Velika Nedelja
00050000-56b3-6dd4-0a26-e273bcacf21b	9225	Velika Polana
00050000-56b3-6dd4-0357-044fdffbfc1d	1315	Velike Lašče
00050000-56b3-6dd4-e42e-7be9908f761c	8213	Veliki Gaber
00050000-56b3-6dd4-5b1f-e4fbfaaa7cf1	9241	Veržej
00050000-56b3-6dd4-699f-acbbb31c8d04	1312	Videm - Dobrepolje
00050000-56b3-6dd4-0fc1-4eaf1580f834	2284	Videm pri Ptuju
00050000-56b3-6dd4-3ebb-115cc1feeb4b	8344	Vinica
00050000-56b3-6dd4-677e-26f384ddb623	5271	Vipava
00050000-56b3-6dd4-f075-090be494f971	4212	Visoko
00050000-56b3-6dd4-fba9-3ec3c1a046bc	1294	Višnja Gora
00050000-56b3-6dd4-5ab2-afaada97d87b	3205	Vitanje
00050000-56b3-6dd4-b3f7-f1161060723e	2255	Vitomarci
00050000-56b3-6dd4-cab4-79df4e1d60f5	1217	Vodice
00050000-56b3-6dd4-f15d-d6494e69dd62	3212	Vojnik\t
00050000-56b3-6dd4-bf67-282364d1514a	5293	Volčja Draga
00050000-56b3-6dd4-5067-8f7b928d184a	2232	Voličina
00050000-56b3-6dd4-9295-396c6c2ada71	3305	Vransko
00050000-56b3-6dd4-f884-246c317b8068	6217	Vremski Britof
00050000-56b3-6dd4-b0fd-0b571b34bea6	1360	Vrhnika
00050000-56b3-6dd4-2d7d-a1814564acaf	2365	Vuhred
00050000-56b3-6dd4-60e7-d4ec24b2890c	2367	Vuzenica
00050000-56b3-6dd4-3295-56b26fa43e2f	8292	Zabukovje 
00050000-56b3-6dd4-0667-844368b1a9b9	1410	Zagorje ob Savi
00050000-56b3-6dd4-0386-ab0493a0bccc	1303	Zagradec
00050000-56b3-6dd4-616f-882ceaea70c4	2283	Zavrč
00050000-56b3-6dd4-9ee8-7cf4193b5a9d	8272	Zdole 
00050000-56b3-6dd4-cbf7-487d01805e1c	4201	Zgornja Besnica
00050000-56b3-6dd4-eb67-55ff731e4d89	2242	Zgornja Korena
00050000-56b3-6dd4-77fa-13709cb2df79	2201	Zgornja Kungota
00050000-56b3-6dd4-67f3-83cddd5aa377	2316	Zgornja Ložnica
00050000-56b3-6dd4-6b83-10fd7bc70a4f	2314	Zgornja Polskava
00050000-56b3-6dd4-c1ea-73ac64a24acd	2213	Zgornja Velka
00050000-56b3-6dd4-44a9-e2d23cc1d7dc	4247	Zgornje Gorje
00050000-56b3-6dd4-4d75-d8a6b9b192b5	4206	Zgornje Jezersko
00050000-56b3-6dd4-6ee4-db05943fec26	2285	Zgornji Leskovec
00050000-56b3-6dd4-ea78-a8514043ad98	1432	Zidani Most
00050000-56b3-6dd4-e9c4-b1ba099a3425	3214	Zreče
00050000-56b3-6dd4-c4d1-0a6b3a32871b	4209	Žabnica
00050000-56b3-6dd4-e738-9d7ac6c6c172	3310	Žalec
00050000-56b3-6dd4-8342-a0d60141fb56	4228	Železniki
00050000-56b3-6dd4-0662-da072b8d3ca6	2287	Žetale
00050000-56b3-6dd4-d5cb-a65177cd2e2f	4226	Žiri
00050000-56b3-6dd4-c8d5-8445dd0035eb	4274	Žirovnica
00050000-56b3-6dd4-cb56-7f2bc537120f	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 43674845)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 43674415)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 43674155)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56b3-6dd7-e82e-d5ae4d932f69	00080000-56b3-6dd7-1a6f-ec5f6cd44ece	\N	00040000-56b3-6dd4-0f92-c9e8a7681290	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56b3-6dd7-cd73-128cb526b3f9	00080000-56b3-6dd7-1a6f-ec5f6cd44ece	\N	00040000-56b3-6dd4-0f92-c9e8a7681290	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56b3-6dd7-bd36-520117baab87	00080000-56b3-6dd7-44dc-e8753771353e	\N	00040000-56b3-6dd4-0f92-c9e8a7681290	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 43674290)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56b3-6dd4-9344-31896c3cfee1	novo leto	1	1	\N	t
00430000-56b3-6dd4-7997-c3f3a4cedf67	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56b3-6dd4-74b2-fc66fd9dc195	dan upora proti okupatorju	27	4	\N	t
00430000-56b3-6dd4-f389-c6a89b5e578a	praznik dela	1	5	\N	t
00430000-56b3-6dd4-fd8a-e5ddf1e361f6	praznik dela	2	5	\N	t
00430000-56b3-6dd4-b029-953f92b81cf2	dan Primoža Trubarja	8	6	\N	f
00430000-56b3-6dd4-9e2b-465a48225724	dan državnosti	25	6	\N	t
00430000-56b3-6dd4-5816-a50d8cb204c4	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56b3-6dd4-f552-7d4ba3df0b3e	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56b3-6dd4-0066-bfa27537a139	dan suverenosti	25	10	\N	f
00430000-56b3-6dd4-4926-d4a1a816e50b	dan spomina na mrtve	1	11	\N	t
00430000-56b3-6dd4-80c3-0a7ccab4be8e	dan Rudolfa Maistra	23	11	\N	f
00430000-56b3-6dd4-4846-98fd52104421	božič	25	12	\N	t
00430000-56b3-6dd4-7941-f55355f061f9	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56b3-6dd4-6b02-1463e21bd2f5	Marijino vnebovzetje	15	8	\N	t
00430000-56b3-6dd4-c85b-5c87c895c115	dan reformacije	31	10	\N	t
00430000-56b3-6dd4-1253-6ef766c3e35c	velikonočna nedelja	27	3	2016	t
00430000-56b3-6dd4-4781-2ab292da7ba5	velikonočna nedelja	16	4	2017	t
00430000-56b3-6dd4-1365-eba9c5e0492f	velikonočna nedelja	1	4	2018	t
00430000-56b3-6dd4-6f2a-69a4dae9b957	velikonočna nedelja	21	4	2019	t
00430000-56b3-6dd4-d3c9-e9e2d43313d1	velikonočna nedelja	12	4	2020	t
00430000-56b3-6dd4-47f1-16d29682188d	velikonočna nedelja	4	4	2021	t
00430000-56b3-6dd4-c9bf-8037aa63b6c7	velikonočna nedelja	17	4	2022	t
00430000-56b3-6dd4-066c-a367c5159d38	velikonočna nedelja	9	4	2023	t
00430000-56b3-6dd4-a9df-0d9f7dcabb0e	velikonočna nedelja	31	3	2024	t
00430000-56b3-6dd4-6d38-1a9a56b587a8	velikonočna nedelja	20	4	2025	t
00430000-56b3-6dd4-4a33-b4d5f348759e	velikonočna nedelja	5	4	2026	t
00430000-56b3-6dd4-ee80-f8f5b4769c8b	velikonočna nedelja	28	3	2027	t
00430000-56b3-6dd4-e490-3c93c1ac75e3	velikonočna nedelja	16	4	2028	t
00430000-56b3-6dd4-f2ff-ec4febae3b2b	velikonočna nedelja	1	4	2029	t
00430000-56b3-6dd4-d9a7-f80112546287	velikonočna nedelja	21	4	2030	t
00430000-56b3-6dd4-819b-834817c0b8a3	velikonočni ponedeljek	28	3	2016	t
00430000-56b3-6dd4-da15-2957f7c1e88f	velikonočni ponedeljek	17	4	2017	t
00430000-56b3-6dd4-37b9-7480ded730de	velikonočni ponedeljek	2	4	2018	t
00430000-56b3-6dd4-29cb-ca1f141f65b3	velikonočni ponedeljek	22	4	2019	t
00430000-56b3-6dd4-a2f0-8925b52d2d1d	velikonočni ponedeljek	13	4	2020	t
00430000-56b3-6dd4-9f39-8c2bd6becf9b	velikonočni ponedeljek	5	4	2021	t
00430000-56b3-6dd4-979b-b13d30c4b789	velikonočni ponedeljek	18	4	2022	t
00430000-56b3-6dd4-4539-2a0fb0a3a98e	velikonočni ponedeljek	10	4	2023	t
00430000-56b3-6dd4-01fe-7d024909e9cc	velikonočni ponedeljek	1	4	2024	t
00430000-56b3-6dd4-ee28-f3a85db89a77	velikonočni ponedeljek	21	4	2025	t
00430000-56b3-6dd4-fddf-9df68da9b2fd	velikonočni ponedeljek	6	4	2026	t
00430000-56b3-6dd4-ef66-5bab930cfadd	velikonočni ponedeljek	29	3	2027	t
00430000-56b3-6dd4-3049-c806074e4d4a	velikonočni ponedeljek	17	4	2028	t
00430000-56b3-6dd4-c704-7e56e544c6c2	velikonočni ponedeljek	2	4	2029	t
00430000-56b3-6dd4-ab7a-5cabf381ac60	velikonočni ponedeljek	22	4	2030	t
00430000-56b3-6dd4-9629-010ba6a96abc	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56b3-6dd4-2aad-3f9640abb452	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56b3-6dd4-cc15-a6f732040414	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56b3-6dd4-5c79-ef84c10a517d	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56b3-6dd4-4177-ca35c475ee0e	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56b3-6dd4-1e84-c9fd21ed4282	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56b3-6dd4-0ef2-48f654f5a2ac	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56b3-6dd4-b5ff-8869ec1904f7	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56b3-6dd4-77d9-f6ec219d5a89	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56b3-6dd4-7948-b8f3a7559b80	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56b3-6dd4-2762-6550e53ab6f1	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56b3-6dd4-8e53-3fdb6b5b34e9	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56b3-6dd4-cff7-7f9280df1e88	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56b3-6dd4-bdd7-1e5b64f050df	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56b3-6dd4-f85b-fcbd888cd51c	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 43674259)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, zaporednasezvsehupr, zaporedna, zaporednasez) FROM stdin;
001b0000-56b3-6dd8-bbb3-e8a9785e7656	000e0000-56b3-6dd7-704d-6dc99b707496	1	3	1
001b0000-56b3-6dd8-e335-9816036dd9f8	000e0000-56b3-6dd7-704d-6dc99b707496	2	4	2
001b0000-56b3-6dd8-5b66-ac8d4982718d	000e0000-56b3-6dd7-704d-6dc99b707496	4	5	3
001b0000-56b3-6dd8-e743-a580deceb266	000e0000-56b3-6dd7-704d-6dc99b707496	\N	1	\N
001b0000-56b3-6dd8-49c9-d15d75028449	000e0000-56b3-6dd7-704d-6dc99b707496	5	9	4
001b0000-56b3-6dd8-41ed-403ad3ffa950	000e0000-56b3-6dd7-704d-6dc99b707496	7	10	5
001b0000-56b3-6dd8-1d99-d62316e8ceaf	000e0000-56b3-6dd7-e828-e4ff1fbf74df	3	2	1
001b0000-56b3-6dd8-b828-d83b7e695036	000e0000-56b3-6dd7-e828-e4ff1fbf74df	4	3	1
001b0000-56b3-6dd8-9ebe-a1b89263b1b0	000e0000-56b3-6dd7-704d-6dc99b707496	\N	2	\N
001b0000-56b3-6dd8-ff53-d29232a4f073	000e0000-56b3-6dd7-e828-e4ff1fbf74df	\N	1	\N
001b0000-56b3-6dd8-af50-e1ff6f272563	000e0000-56b3-6dd7-704d-6dc99b707496	3	8	3
001b0000-56b3-6dd8-8ca5-1750559595fb	000e0000-56b3-6dd7-704d-6dc99b707496	2	11	1
001b0000-56b3-6dd8-ebba-a7e26773f381	000e0000-56b3-6dd7-e828-e4ff1fbf74df	1	5	1
001b0000-56b3-6dd8-4341-94d3d727454b	000e0000-56b3-6dd7-e828-e4ff1fbf74df	6	4	2
001b0000-56b3-6dd8-366f-3e7cd8677fd5	000e0000-56b3-6dd7-704d-6dc99b707496	1	6	1
001b0000-56b3-6dd8-b9d1-11cd9f69c352	000e0000-56b3-6dd7-704d-6dc99b707496	2	7	2
\.


--
-- TOC entry 3161 (class 0 OID 43674265)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56b3-6dd8-bbb3-e8a9785e7656	000a0000-56b3-6dd7-353b-62d4f278c256
001b0000-56b3-6dd8-bbb3-e8a9785e7656	000a0000-56b3-6dd7-fd7a-f5a73e0694de
001b0000-56b3-6dd8-e335-9816036dd9f8	000a0000-56b3-6dd7-fd7a-f5a73e0694de
001b0000-56b3-6dd8-e335-9816036dd9f8	000a0000-56b3-6dd7-b664-89958e8c464e
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 43674427)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 43674859)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 43674869)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56b3-6dd7-e7d2-bf685af10c15	00080000-56b3-6dd7-d3c7-cf542203de45	0987	AK
00190000-56b3-6dd7-e60d-cdec8927fa1e	00080000-56b3-6dd7-44dc-e8753771353e	0989	AK
00190000-56b3-6dd7-f1a1-9273f596f95c	00080000-56b3-6dd7-2f56-46438c1a01fc	0986	AK
00190000-56b3-6dd7-2074-1c7cee1010d4	00080000-56b3-6dd7-ea81-067ae98b16e8	0984	AK
00190000-56b3-6dd7-8bab-bfc4e7bba572	00080000-56b3-6dd7-5160-eb79b14d0cf2	0983	AK
00190000-56b3-6dd7-98d7-ae188018075b	00080000-56b3-6dd7-e46e-111a2ae63812	0982	AK
00190000-56b3-6dd9-4a98-4f33315212ce	00080000-56b3-6dd9-70bf-a748480b4cb3	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 43674758)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56b3-6dd8-43bb-35ac18eab8ab	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 43674877)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 43674455)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56b3-6dd7-f150-f2349d4d9023	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56b3-6dd7-9db7-5f3673a1f379	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56b3-6dd7-ad12-22d6c4743488	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56b3-6dd7-10f3-df93573a970a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56b3-6dd7-1587-95170dd73c5e	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56b3-6dd7-e350-6f76af3d66ca	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56b3-6dd7-b3c2-b7c905c45769	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 43674400)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 43674390)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 43674597)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 43674527)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 43674233)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 43673994)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56b3-6dd9-70bf-a748480b4cb3	00010000-56b3-6dd5-e1e8-e4a140fcf125	2016-02-04 16:27:21	INS	a:0:{}
2	App\\Entity\\Option	00000000-56b3-6dd9-c37e-5c6b692ac447	00010000-56b3-6dd5-e1e8-e4a140fcf125	2016-02-04 16:27:21	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56b3-6dd9-4a98-4f33315212ce	00010000-56b3-6dd5-e1e8-e4a140fcf125	2016-02-04 16:27:21	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 43674469)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 43674032)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56b3-6dd5-2529-800c318dc3fe	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56b3-6dd5-d5f6-739cc244c76b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56b3-6dd5-935b-ae20c39937c7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56b3-6dd5-02bb-95a3a836a1e4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56b3-6dd5-2c37-f2d2f9abd341	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56b3-6dd5-0422-284b82f9a409	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56b3-6dd5-0c29-0d9a97754197	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56b3-6dd5-5c31-6698212eeb10	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56b3-6dd5-acb0-6eec0801e020	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b3-6dd5-e5e5-68871f7850a0	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b3-6dd5-7159-6eab49b43646	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b3-6dd5-07fa-b54798f7a2a8	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56b3-6dd5-1e94-a21941f1f84f	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56b3-6dd5-f74c-1a633c9745ab	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56b3-6dd5-f42f-564606e630f4	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56b3-6dd5-6bf0-4078de10ee52	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56b3-6dd5-6dd9-3e2acfb02685	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56b3-6dd5-f18d-17c5457b37eb	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56b3-6dd5-c54b-5cbe590811a6	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56b3-6dd5-81a5-73ecc6eb8f22	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56b3-6dd5-2fed-8ed934a52875	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56b3-6dd5-1d19-ad7783c56cdf	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56b3-6dd5-0a1d-fb89bc6b3abb	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56b3-6dd5-5a0f-b80703fd5328	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56b3-6dd5-4b0b-3014dc6955a3	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56b3-6dd5-da1b-c33be29cd9a5	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56b3-6dd5-b90e-4e138b89bb13	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56b3-6dd5-2da2-66515fa46dfa	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56b3-6dd5-74d2-094fdb233e5c	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56b3-6dd5-9250-397d75e48716	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56b3-6dd5-df8f-b095b369807a	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56b3-6dd5-8ecb-2ee81cf2e9bf	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56b3-6dd5-493d-6bcfb867f825	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56b3-6dd5-abd2-561d9940df36	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56b3-6dd5-90f4-3c5409fee33a	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56b3-6dd5-dbf7-d976a575ed1d	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56b3-6dd5-3985-b177b3ed95b7	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56b3-6dd5-8145-e80497f534be	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56b3-6dd5-f9ed-609905df0bab	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56b3-6dd5-ffd4-d49121a0ac03	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56b3-6dd5-42dd-3956445591a9	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56b3-6dd5-c5fb-845154045508	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56b3-6dd5-98f3-dada8a2f222d	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56b3-6dd5-214d-d857fd94e95e	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56b3-6dd5-63d9-fdff8d90906d	direktor	minimalne pravice za direktorja	t
00020000-56b3-6dd5-d102-5e6f30c7897a	arhivar	arhivar	t
00020000-56b3-6dd5-cd9c-73486a24f2b8	dramaturg	dramaturg	t
00020000-56b3-6dd5-0416-c3b1a898afcd	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56b3-6dd5-2e5b-252dc2bce2ce	poslovni-sekretar	poslovni sekretar	t
00020000-56b3-6dd5-78f4-6e2bcf9cc080	vodja-tehnike	vodja tehnike	t
00020000-56b3-6dd5-412a-503c1b4bc217	racunovodja	računovodja	t
00020000-56b3-6dd7-7280-417c511d3677	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56b3-6dd7-2805-70fb4b65315d	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-2810-e3cddfc9e22d	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-e449-6ff67a90f935	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-c546-cfa53164d874	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-c340-a5a9c406f74d	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-0a63-30da14c267a4	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-5175-35e3f6f19ae3	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-9581-60e2b6c5e10e	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-46f2-059586c40496	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-c024-eb9c9e03370a	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-dcc7-e3008c5505f3	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-bf73-aa86069b18f7	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-2aa7-60ab189351d4	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-1676-2d3236a6cb53	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-5e7b-ddc5eb954ffc	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-5fb6-8709a2c96eec	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-53cf-8eb4bb26f84b	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-7e82-855adecbf583	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-4014-a07126f96dfb	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56b3-6dd7-8b2f-93e6dc3ba487	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-b278-1e9913b2a6e3	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-2b4d-2db2803acfe3	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-328e-06274b7e2129	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-c0bd-59372ad030b3	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-e88b-551128755596	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-1dcd-d765a0236382	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-d426-c4091a29b7c7	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-87b2-64b7d144fb49	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-052d-3f4027222489	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-beb3-3184f5def4c1	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-c249-dad07f0406db	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-f656-d8ea35fad5df	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-b5ed-cb043292addf	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-cb29-5380941b6ac0	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-52f7-c320c5c88468	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-0226-bfa399a7d07c	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-dfb9-735d83280528	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56b3-6dd7-daf1-855554a5ebc2	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 43674016)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56b3-6dd5-eb28-3810a18ecdd7	00020000-56b3-6dd5-935b-ae20c39937c7
00010000-56b3-6dd5-e1e8-e4a140fcf125	00020000-56b3-6dd5-935b-ae20c39937c7
00010000-56b3-6dd7-5c8d-6c7c69eb7cef	00020000-56b3-6dd7-7280-417c511d3677
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-2805-70fb4b65315d
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-c340-a5a9c406f74d
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-46f2-059586c40496
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-dcc7-e3008c5505f3
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-2aa7-60ab189351d4
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-7e82-855adecbf583
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-e449-6ff67a90f935
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-8b2f-93e6dc3ba487
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-328e-06274b7e2129
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-e88b-551128755596
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-d426-c4091a29b7c7
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-052d-3f4027222489
00010000-56b3-6dd7-0031-621a6b7d2ad1	00020000-56b3-6dd7-b5ed-cb043292addf
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-2805-70fb4b65315d
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-2810-e3cddfc9e22d
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-e449-6ff67a90f935
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-c546-cfa53164d874
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-2aa7-60ab189351d4
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-5fb6-8709a2c96eec
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-8b2f-93e6dc3ba487
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-328e-06274b7e2129
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-e88b-551128755596
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-d426-c4091a29b7c7
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-052d-3f4027222489
00010000-56b3-6dd7-e3b5-18192dad9a97	00020000-56b3-6dd7-b5ed-cb043292addf
00010000-56b3-6dd7-3f24-88b6c70c720c	00020000-56b3-6dd7-2805-70fb4b65315d
00010000-56b3-6dd7-3f24-88b6c70c720c	00020000-56b3-6dd7-2810-e3cddfc9e22d
00010000-56b3-6dd7-3f24-88b6c70c720c	00020000-56b3-6dd7-e449-6ff67a90f935
00010000-56b3-6dd7-3f24-88b6c70c720c	00020000-56b3-6dd7-c546-cfa53164d874
00010000-56b3-6dd7-3f24-88b6c70c720c	00020000-56b3-6dd7-dcc7-e3008c5505f3
00010000-56b3-6dd7-3f24-88b6c70c720c	00020000-56b3-6dd7-2aa7-60ab189351d4
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-2810-e3cddfc9e22d
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-0a63-30da14c267a4
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-c024-eb9c9e03370a
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-bf73-aa86069b18f7
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-dcc7-e3008c5505f3
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-53cf-8eb4bb26f84b
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-2aa7-60ab189351d4
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-1676-2d3236a6cb53
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-8b2f-93e6dc3ba487
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-b278-1e9913b2a6e3
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-328e-06274b7e2129
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-c0bd-59372ad030b3
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-e88b-551128755596
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-1dcd-d765a0236382
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-d426-c4091a29b7c7
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-87b2-64b7d144fb49
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-052d-3f4027222489
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-beb3-3184f5def4c1
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-b5ed-cb043292addf
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-cb29-5380941b6ac0
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-0226-bfa399a7d07c
00010000-56b3-6dd7-9784-6e5fe00ecab1	00020000-56b3-6dd7-dfb9-735d83280528
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-2810-e3cddfc9e22d
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-0a63-30da14c267a4
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-9581-60e2b6c5e10e
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-c024-eb9c9e03370a
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-bf73-aa86069b18f7
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-dcc7-e3008c5505f3
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-53cf-8eb4bb26f84b
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-2aa7-60ab189351d4
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-1676-2d3236a6cb53
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-5e7b-ddc5eb954ffc
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-8b2f-93e6dc3ba487
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-b278-1e9913b2a6e3
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-2b4d-2db2803acfe3
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-328e-06274b7e2129
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-c0bd-59372ad030b3
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-e88b-551128755596
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-1dcd-d765a0236382
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-d426-c4091a29b7c7
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-87b2-64b7d144fb49
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-052d-3f4027222489
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-beb3-3184f5def4c1
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-b5ed-cb043292addf
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-cb29-5380941b6ac0
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-52f7-c320c5c88468
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-0226-bfa399a7d07c
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-dfb9-735d83280528
00010000-56b3-6dd7-9bce-7893373ca062	00020000-56b3-6dd7-daf1-855554a5ebc2
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-2810-e3cddfc9e22d
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-e449-6ff67a90f935
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-0a63-30da14c267a4
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-5175-35e3f6f19ae3
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-9581-60e2b6c5e10e
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-c340-a5a9c406f74d
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-c024-eb9c9e03370a
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-bf73-aa86069b18f7
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-dcc7-e3008c5505f3
00010000-56b3-6dd7-34c9-ef2020e2fa2c	00020000-56b3-6dd7-53cf-8eb4bb26f84b
00010000-56b3-6dd7-dcb9-26de7479275c	00020000-56b3-6dd7-2805-70fb4b65315d
00010000-56b3-6dd7-dcb9-26de7479275c	00020000-56b3-6dd7-c546-cfa53164d874
00010000-56b3-6dd7-dcb9-26de7479275c	00020000-56b3-6dd7-c340-a5a9c406f74d
00010000-56b3-6dd7-dcb9-26de7479275c	00020000-56b3-6dd7-46f2-059586c40496
00010000-56b3-6dd7-dcb9-26de7479275c	00020000-56b3-6dd7-dcc7-e3008c5505f3
00010000-56b3-6dd7-dcb9-26de7479275c	00020000-56b3-6dd7-2aa7-60ab189351d4
00010000-56b3-6dd7-dcb9-26de7479275c	00020000-56b3-6dd7-7e82-855adecbf583
00010000-56b3-6dd7-dcb9-26de7479275c	00020000-56b3-6dd7-c249-dad07f0406db
00010000-56b3-6dd7-07a7-d223037bb4e5	00020000-56b3-6dd7-4014-a07126f96dfb
00010000-56b3-6dd7-c6f9-ef0eb115fe32	00020000-56b3-6dd5-63d9-fdff8d90906d
00010000-56b3-6dd7-dd36-eed41099e277	00020000-56b3-6dd5-d102-5e6f30c7897a
00010000-56b3-6dd7-96e0-8090f7e98d9d	00020000-56b3-6dd5-cd9c-73486a24f2b8
00010000-56b3-6dd7-bff3-ae530470bd5b	00020000-56b3-6dd5-0416-c3b1a898afcd
00010000-56b3-6dd7-b016-891004a172dd	00020000-56b3-6dd5-2e5b-252dc2bce2ce
00010000-56b3-6dd7-90f5-b55e1d29e212	00020000-56b3-6dd5-78f4-6e2bcf9cc080
00010000-56b3-6dd7-44a3-4836cbdeee3d	00020000-56b3-6dd5-412a-503c1b4bc217
\.


--
-- TOC entry 3186 (class 0 OID 43674483)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 43674421)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 43674344)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56b3-6dd7-797a-2c236a5a542d	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56b3-6dd7-5132-bcf7c7ff0ebc	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56b3-6dd7-87c2-e61b0edd7a9d	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56b3-6dd7-13e4-8f609c4c8616	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 43673981)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56b3-6dd4-889d-1bfa0e7154c8	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56b3-6dd4-e843-29f8b1b853aa	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56b3-6dd4-e243-231c592c139d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56b3-6dd4-3c03-9d824a0e5abc	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56b3-6dd4-f868-18a0b972d2f2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 43673973)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56b3-6dd4-a902-432b6334aac4	00230000-56b3-6dd4-3c03-9d824a0e5abc	popa
00240000-56b3-6dd4-9d6b-557a3022db5f	00230000-56b3-6dd4-3c03-9d824a0e5abc	oseba
00240000-56b3-6dd4-3f73-004445263df9	00230000-56b3-6dd4-3c03-9d824a0e5abc	tippopa
00240000-56b3-6dd4-d72b-4df5166d33b8	00230000-56b3-6dd4-3c03-9d824a0e5abc	organizacijskaenota
00240000-56b3-6dd4-2aa2-fabcf385fd15	00230000-56b3-6dd4-3c03-9d824a0e5abc	sezona
00240000-56b3-6dd4-12c1-5026d521b950	00230000-56b3-6dd4-3c03-9d824a0e5abc	tipvaje
00240000-56b3-6dd4-8d15-2e52fc607ba3	00230000-56b3-6dd4-3c03-9d824a0e5abc	tipdodatka
00240000-56b3-6dd4-5a24-67333cec641f	00230000-56b3-6dd4-e843-29f8b1b853aa	prostor
00240000-56b3-6dd4-1644-bf224374060f	00230000-56b3-6dd4-3c03-9d824a0e5abc	besedilo
00240000-56b3-6dd4-b271-c0e59b28fef6	00230000-56b3-6dd4-3c03-9d824a0e5abc	uprizoritev
00240000-56b3-6dd4-a0ae-28861a24890e	00230000-56b3-6dd4-3c03-9d824a0e5abc	funkcija
00240000-56b3-6dd4-caa0-f206a5cde6c0	00230000-56b3-6dd4-3c03-9d824a0e5abc	tipfunkcije
00240000-56b3-6dd4-37c0-090dd2a1f451	00230000-56b3-6dd4-3c03-9d824a0e5abc	alternacija
00240000-56b3-6dd4-0825-30bac7dabc74	00230000-56b3-6dd4-889d-1bfa0e7154c8	pogodba
00240000-56b3-6dd4-1113-9efbb5d3e49a	00230000-56b3-6dd4-3c03-9d824a0e5abc	zaposlitev
00240000-56b3-6dd4-3f70-fddf16eb68f5	00230000-56b3-6dd4-3c03-9d824a0e5abc	zvrstuprizoritve
00240000-56b3-6dd4-9f38-d80927b40ef0	00230000-56b3-6dd4-889d-1bfa0e7154c8	programdela
00240000-56b3-6dd4-5eb2-550a010315ca	00230000-56b3-6dd4-3c03-9d824a0e5abc	zapis
\.


--
-- TOC entry 3133 (class 0 OID 43673968)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e86f6b76-4cfb-4af8-a992-9886f245e218	00240000-56b3-6dd4-a902-432b6334aac4	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 43674544)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56b3-6dd8-0a25-797a97bc1a0d	000e0000-56b3-6dd7-704d-6dc99b707496	00080000-56b3-6dd7-1a6f-ec5f6cd44ece	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56b3-6dd4-d372-f8a48b40d7cf
00270000-56b3-6dd8-6713-f071da7e5280	000e0000-56b3-6dd7-704d-6dc99b707496	00080000-56b3-6dd7-1a6f-ec5f6cd44ece	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56b3-6dd4-d372-f8a48b40d7cf
\.


--
-- TOC entry 3149 (class 0 OID 43674117)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 43674363)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56b3-6dd8-ffe1-13212beeaee7	00180000-56b3-6dd8-dc40-9ca94800ab7a	000c0000-56b3-6dd8-4127-748443caedcc	00090000-56b3-6dd7-aeae-0830e139582f	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b3-6dd8-a175-4229f7749c40	00180000-56b3-6dd8-dc40-9ca94800ab7a	000c0000-56b3-6dd8-afa6-619c4b2f95ee	00090000-56b3-6dd7-8efe-6ba4ee0137ad	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b3-6dd8-610f-ac3377c33100	00180000-56b3-6dd8-dc40-9ca94800ab7a	000c0000-56b3-6dd8-e70c-199a1a01b79b	00090000-56b3-6dd7-7a6a-76a9b7b4f79a	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b3-6dd8-d4de-9adfc51503a0	00180000-56b3-6dd8-dc40-9ca94800ab7a	000c0000-56b3-6dd8-0c71-b969a7a26a8c	00090000-56b3-6dd7-e074-93881907a9f3	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b3-6dd8-48b4-48d254bcf8c9	00180000-56b3-6dd8-dc40-9ca94800ab7a	000c0000-56b3-6dd8-8fd1-acf43de63eda	00090000-56b3-6dd7-6da2-8fbb9cc177c7	1630080	2015-06-26 10:00:00	1630020	2015-06-26 11:00:00	f	f	f	\N	\N
001a0000-56b3-6dd8-2ac3-fbf8b6f8b86d	00180000-56b3-6dd8-b4c4-0d2d3eccb279	\N	00090000-56b3-6dd7-6da2-8fbb9cc177c7	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	f	\N	\N
001a0000-56b3-6dd8-ab46-43127144259a	00180000-56b3-6dd8-2658-9c3acd463809	\N	00090000-56b3-6dd7-8efe-6ba4ee0137ad	1576800	2015-08-01 20:00:00	1576830	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56b3-6dd8-cfae-e252e91b7ad3	00180000-56b3-6dd8-dc40-9ca94800ab7a	\N	00090000-56b3-6dd7-54da-93b854480c96	1682520	2015-08-01 20:00:00	1682610	2015-08-01 23:30:00	f	t	f	\N	\N
001a0000-56b3-6dd8-ec04-025259dc1652	00180000-56b3-6dd8-ca48-127e070a4cbb	\N	00090000-56b3-6dd7-aeae-0830e139582f	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56b3-6dd8-218e-10d2f959860f	00180000-56b3-6dd8-ca48-127e070a4cbb	\N	00090000-56b3-6dd7-8efe-6ba4ee0137ad	0	2015-03-10 07:00:00	0	2015-03-20 23:00:00	f	f	t	\N	\N
001a0000-56b3-6dd8-69cc-6dd9b9e9f897	00180000-56b3-6dd8-ca48-127e070a4cbb	\N	00090000-56b3-6dd7-b341-401ce8a92756	0	2015-03-10 07:00:00	15840	2015-03-31 23:00:00	f	f	t	\N	\N
001a0000-56b3-6dd8-6041-1ed323b6ef13	00180000-56b3-6dd8-add1-439960326d59	000c0000-56b3-6dd8-4127-748443caedcc	00090000-56b3-6dd7-aeae-0830e139582f	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
001a0000-56b3-6dd8-b5f0-74365983accc	00180000-56b3-6dd8-add1-439960326d59	000c0000-56b3-6dd8-afa6-619c4b2f95ee	00090000-56b3-6dd7-8efe-6ba4ee0137ad	0	2015-03-15 20:00:00	120	2015-03-15 23:00:00	f	f	f	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 43674380)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56b3-6dd4-bc91-710eb4db6623	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56b3-6dd4-8ce0-4851e0e3016c	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56b3-6dd4-1a15-9a122fa6e9c2	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56b3-6dd4-5489-387488fb2984	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56b3-6dd4-ca32-a7acf2953a1c	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56b3-6dd4-985b-45fc54168758	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 43674585)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56b3-6dd4-73a5-fec84c2a1bbf	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56b3-6dd4-dcee-12899bd6e2db	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56b3-6dd4-686f-1996102ca53c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56b3-6dd4-cf9f-6815dff49099	04	Režija	Režija	Režija	umetnik	30
000f0000-56b3-6dd4-b2af-1af15380820c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56b3-6dd4-7691-20b46acf798e	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56b3-6dd4-6e75-989a6df8b69a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56b3-6dd4-32f7-5e6540f925ad	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56b3-6dd4-6817-5086bd34fb3c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56b3-6dd4-6ff9-892d73bfeefd	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56b3-6dd4-ea56-3d0378d8acb4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56b3-6dd4-1196-570c9cb878d6	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56b3-6dd4-a048-023577a5b578	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56b3-6dd4-c37a-152ba0668590	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56b3-6dd4-dbba-040076e61299	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56b3-6dd4-6b93-19c06009cfd1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56b3-6dd4-56ee-5916ac008089	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56b3-6dd4-44a6-4ade83f4fcf3	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56b3-6dd4-6902-16323529571c	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 43674068)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56b3-6dd7-75f9-442d658643aa	0001	šola	osnovna ali srednja šola
00400000-56b3-6dd7-dfe2-47e1364836fb	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56b3-6dd7-be43-649244dc6817	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 43674889)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56b3-6dd4-2544-0798056a6e12	01	Velika predstava	f	1.00	1.00
002b0000-56b3-6dd4-acd4-5d0537b6b13e	02	Mala predstava	f	0.50	0.50
002b0000-56b3-6dd4-953a-f57e8a22ebc9	03	Mala koprodukcija	t	0.40	1.00
002b0000-56b3-6dd4-460f-7889f4d386e9	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56b3-6dd4-fdbc-09407515c0c5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 43674334)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56b3-6dd4-61eb-5866d0ea05cf	0001	prva vaja	prva vaja
00420000-56b3-6dd4-40da-7345003fb072	0002	tehnična vaja	tehnična vaja
00420000-56b3-6dd4-521e-4c2a0f50a834	0003	lučna vaja	lučna vaja
00420000-56b3-6dd4-ced2-325670e7c1b9	0004	kostumska vaja	kostumska vaja
00420000-56b3-6dd4-1ed7-c7c9c4977b17	0005	foto vaja	foto vaja
00420000-56b3-6dd4-f909-20dc6b69369f	0006	1. glavna vaja	1. glavna vaja
00420000-56b3-6dd4-91d5-aebef599c664	0007	2. glavna vaja	2. glavna vaja
00420000-56b3-6dd4-64b6-abb3399f7d71	0008	1. generalka	1. generalka
00420000-56b3-6dd4-ba6b-2054fba7039e	0009	2. generalka	2. generalka
00420000-56b3-6dd4-ce58-a6f8ce04aef4	0010	odprta generalka	odprta generalka
00420000-56b3-6dd4-e45e-ad419f622ee5	0011	obnovitvena vaja	obnovitvena vaja
00420000-56b3-6dd4-3d24-8e11f1b3eba9	0012	italijanka	krajša "obnovitvena" vaja
00420000-56b3-6dd4-73b8-0b3d370c78d7	0013	pevska vaja	pevska vaja
00420000-56b3-6dd4-ba5b-015df927611c	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56b3-6dd4-107e-ead1a924ceb5	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56b3-6dd4-d225-dd16bc92fcaa	0016	orientacijska vaja	orientacijska vaja
00420000-56b3-6dd4-281c-c1c787a69ddb	0017	situacijska vaja	situacijska vaja
00420000-56b3-6dd4-73da-7ec52892fb55	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 43674190)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 43674003)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56b3-6dd5-e1e8-e4a140fcf125	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROHFectBMs5dHDA/UwqxPVHf9BmC7VHru	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-25fe-94a6dcdf4f0c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-8ec9-2e6b32e20604	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-8adb-63b07e8d3fd1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-631c-538fac80df50	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-33dc-2a5f4f6b865f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-29b0-5378243cd9bd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-04d1-25f17f0e4e23	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-97e5-e5d419ad7cdf	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-8464-366b184c9559	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-5c8d-6c7c69eb7cef	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-7cc5-3bc7ff90d6be	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-0031-621a6b7d2ad1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-e3b5-18192dad9a97	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-3f24-88b6c70c720c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-9784-6e5fe00ecab1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-9bce-7893373ca062	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-34c9-ef2020e2fa2c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-dcb9-26de7479275c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-07a7-d223037bb4e5	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-c6f9-ef0eb115fe32	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-dd36-eed41099e277	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-96e0-8090f7e98d9d	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-bff3-ae530470bd5b	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-b016-891004a172dd	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-90f5-b55e1d29e212	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56b3-6dd7-44a3-4836cbdeee3d	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56b3-6dd5-eb28-3810a18ecdd7	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 43674635)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56b3-6dd7-e828-e4ff1fbf74df	00160000-56b3-6dd7-3f04-67752863462a	\N	00140000-56b3-6dd4-af69-e2168cac2e29	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56b3-6dd7-1587-95170dd73c5e
000e0000-56b3-6dd7-704d-6dc99b707496	00160000-56b3-6dd7-5701-2dc2173696bc	\N	00140000-56b3-6dd4-7be4-28cee6061e51	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56b3-6dd7-e350-6f76af3d66ca
000e0000-56b3-6dd7-74b2-ef3a703f539f	\N	\N	00140000-56b3-6dd4-7be4-28cee6061e51	00190000-56b3-6dd7-e7d2-bf685af10c15	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56b3-6dd7-1587-95170dd73c5e
000e0000-56b3-6dd7-6f67-42804ba62c99	\N	\N	00140000-56b3-6dd4-7be4-28cee6061e51	00190000-56b3-6dd7-e7d2-bf685af10c15	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56b3-6dd7-1587-95170dd73c5e
000e0000-56b3-6dd7-ce00-282ef3a3d0a7	\N	\N	00140000-56b3-6dd4-7be4-28cee6061e51	00190000-56b3-6dd7-e7d2-bf685af10c15	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-98ac-32026bd816f1	\N	\N	00140000-56b3-6dd4-7be4-28cee6061e51	00190000-56b3-6dd7-e7d2-bf685af10c15	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-73da-6c7a0e7272c5	\N	\N	00140000-56b3-6dd4-9c12-54313039433b	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-385b-91f32461b1b7	\N	\N	00140000-56b3-6dd4-9c12-54313039433b	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-290c-0a780b460200	\N	\N	00140000-56b3-6dd4-9c12-54313039433b	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-ba9f-a72cfd77f065	\N	\N	00140000-56b3-6dd4-9c12-54313039433b	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-e3a1-4051511c2570	\N	\N	00140000-56b3-6dd4-9c12-54313039433b	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-43b0-c8a19a2bc5a6	\N	\N	00140000-56b3-6dd4-9c12-54313039433b	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-7d97-bdbd9b275e9a	\N	\N	00140000-56b3-6dd4-9c12-54313039433b	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-4d0e-d8d781190a4c	\N	\N	00140000-56b3-6dd4-9c12-54313039433b	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
000e0000-56b3-6dd7-b721-ad6e873f7d21	\N	\N	00140000-56b3-6dd4-9c12-54313039433b	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56b3-6dd7-f150-f2349d4d9023
\.


--
-- TOC entry 3170 (class 0 OID 43674354)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 43674283)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56b3-6dd8-3254-75c560b72e95	\N	000e0000-56b3-6dd7-704d-6dc99b707496	3
00200000-56b3-6dd8-1f5f-d2d8fd28635a	\N	000e0000-56b3-6dd7-704d-6dc99b707496	10
00200000-56b3-6dd8-86e1-753f33630ddd	\N	000e0000-56b3-6dd7-704d-6dc99b707496	6
00200000-56b3-6dd8-e776-75f1cfd2c16d	\N	000e0000-56b3-6dd7-704d-6dc99b707496	5
00200000-56b3-6dd8-2e95-5625c974e85f	\N	000e0000-56b3-6dd7-704d-6dc99b707496	7
00200000-56b3-6dd8-b385-66800a3fd934	\N	000e0000-56b3-6dd7-e828-e4ff1fbf74df	1
00200000-56b3-6dd8-b66a-924fa5b09405	\N	000e0000-56b3-6dd7-704d-6dc99b707496	2
00200000-56b3-6dd8-1882-8c7bd17f54e7	\N	000e0000-56b3-6dd7-704d-6dc99b707496	1
00200000-56b3-6dd8-cd0f-ed93e96e2d54	\N	000e0000-56b3-6dd7-704d-6dc99b707496	8
00200000-56b3-6dd8-b923-8858d209e534	\N	000e0000-56b3-6dd7-704d-6dc99b707496	9
00200000-56b3-6dd8-679f-caace539f1b2	\N	000e0000-56b3-6dd7-704d-6dc99b707496	4
\.


--
-- TOC entry 3182 (class 0 OID 43674447)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 43674558)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56b3-6dd4-2bb8-643cd027a85d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56b3-6dd4-8d59-2688f2189c1d	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56b3-6dd4-d6c9-c764cc3cda8e	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56b3-6dd4-4833-3a520debdc1c	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56b3-6dd4-51e8-97a04b0323f1	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56b3-6dd4-fa94-cc33d8d3b16a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56b3-6dd4-e612-76b77fa0e05e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56b3-6dd4-20d7-4b22d372e5c8	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56b3-6dd4-d372-f8a48b40d7cf	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56b3-6dd4-6a56-cec24954d22f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56b3-6dd4-290e-d1f939712532	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56b3-6dd4-be44-1e8eef36119a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56b3-6dd4-14c0-f5451dbc90e9	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56b3-6dd4-0eab-74c8b5fc4860	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56b3-6dd4-dfec-221a8409872e	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56b3-6dd4-b7a0-e998c7e97024	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56b3-6dd4-b864-eeef84f636b9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56b3-6dd4-aaa4-79b759bac717	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56b3-6dd4-2fcb-d813126f224e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56b3-6dd4-9ffc-8e017e6a9d4a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56b3-6dd4-24f1-a53832e74e33	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56b3-6dd4-c9cd-f59a115667cb	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56b3-6dd4-a645-d1a564072152	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56b3-6dd4-f759-a203b1cc7706	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56b3-6dd4-2140-3a37ae51efd5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56b3-6dd4-9b53-21ee094219c7	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56b3-6dd4-bac2-f8708ab88ef9	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56b3-6dd4-5b95-fd0993c2ebe0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 43674939)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 43674908)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 43674951)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 43674520)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56b3-6dd7-ff79-eddef2d4deed	00090000-56b3-6dd7-8efe-6ba4ee0137ad	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b3-6dd7-6b3f-e3ae4dd37826	00090000-56b3-6dd7-7a6a-76a9b7b4f79a	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b3-6dd7-2874-853ed810e0d8	00090000-56b3-6dd7-9a6e-138e82fd5b6f	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b3-6dd7-6bc0-85920fe0ad6e	00090000-56b3-6dd7-b341-401ce8a92756	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b3-6dd7-e30a-4ab2ca47e634	00090000-56b3-6dd7-8325-464313a2e09b	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56b3-6dd7-755d-830562d06369	00090000-56b3-6dd7-32f7-e04d65cf365b	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 43674625)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56b3-6dd4-af69-e2168cac2e29	01	Drama	drama (SURS 01)
00140000-56b3-6dd4-98fb-08f72233809f	02	Opera	opera (SURS 02)
00140000-56b3-6dd4-6404-19b0ebfd5458	03	Balet	balet (SURS 03)
00140000-56b3-6dd4-5c9a-0bbb837426ee	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56b3-6dd4-9c12-54313039433b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56b3-6dd4-7be4-28cee6061e51	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56b3-6dd4-6b05-65ba7c2c2e5d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 43674510)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 43674067)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 43674683)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 43674674)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 43674057)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 43674541)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 43674583)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 43674992)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 43674377)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 43674312)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 43674328)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 43674333)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 43674906)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 43674216)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 43674752)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 43674506)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 43674281)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 43674254)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 43674230)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 43674413)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 43674969)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 43674976)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 43675000)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2766 (class 2606 OID 43674439)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 43674188)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 43674086)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 43674150)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 43674113)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 43674046)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 43674031)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 43674445)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 43674482)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 43674620)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 43674141)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 43674176)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 43674857)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 43674419)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 43674166)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 43674297)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 43674269)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 43674263)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 43674431)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 43674866)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 43674874)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 43674844)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 43674887)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 43674464)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 43674404)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 43674395)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 43674607)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 43674534)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 43674242)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 43674002)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 43674473)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 43674020)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 43674040)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 43674491)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 43674426)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 43674352)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 43673990)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 43673978)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 43673972)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 43674554)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 43674122)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 43674369)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 43674387)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 43674594)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 43674075)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 43674899)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 43674341)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 43674201)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 43674015)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 43674653)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 43674360)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 43674287)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 43674453)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 43674566)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 43674949)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 43674933)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 43674957)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 43674524)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 43674633)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 43674518)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 43674322)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 43674323)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 43674321)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 43674319)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 43674320)
-- Name: idx_11e93b5d7634c214; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d7634c214 ON dogodek USING btree (nadrejenogostovanje_id);


--
-- TOC entry 2708 (class 1259 OID 43674318)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 43674555)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 43674556)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 43674557)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 43674971)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 43674970)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 43674143)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 43674144)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 43674446)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 43674937)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 43674936)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 43674938)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 43674935)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 43674934)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 43674432)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 43674288)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 43674289)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 43674507)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 43674509)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 43674508)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 43674232)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 43674231)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 43674888)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 43674622)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 43674623)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 43674624)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 43674958)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 43674658)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 43674655)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 43674659)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 43674657)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 43674656)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 43674203)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 43674202)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 43674116)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 43674474)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 43674047)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 43674048)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 43674494)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 43674493)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 43674492)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 43674153)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 43674152)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 43674154)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 43674264)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2595 (class 1259 OID 43673980)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 43674399)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 43674397)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 43674396)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 43674398)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 43674021)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 43674022)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 43674454)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 43674993)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 43674543)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 43674542)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 43675001)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 43675002)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 43674420)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 43674535)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 43674536)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 43674757)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 43674756)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 43674753)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 43674754)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 43674755)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 43674168)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 43674167)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 43674169)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 43674468)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 43674467)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 43674867)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 43674868)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 43674687)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 43674688)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 43674685)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 43674686)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 43674378)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 43674379)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 43674525)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 43674526)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 43674361)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 43674408)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 43674407)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 43674405)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 43674406)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 43674675)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 43674243)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 43674257)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 43674256)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 43674255)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 43674258)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 43674282)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 43674270)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 43674271)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 43674858)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 43674907)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 43674977)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 43674978)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 43674088)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 43674087)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 43674123)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 43674124)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 43674372)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 43674371)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 43674370)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 43674314)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 43674317)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 43674313)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 43674316)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 43674315)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 43674142)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 43674076)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 43674077)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 43674217)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 43674219)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 43674218)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 43674220)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 43674414)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 43674621)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 43674654)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 43674595)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 43674596)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 43674114)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 43674115)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 43674388)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 43674389)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 43674519)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 43673991)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 43674189)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 43674151)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 43673979)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 43674900)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 43674466)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 43674465)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 43674342)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 43674343)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 43674684)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 43674362)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 43674177)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 43674634)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 43674950)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 43674875)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 43674876)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 43674584)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 43674353)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 43674041)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2941 (class 2606 OID 43675163)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2946 (class 2606 OID 43675188)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2944 (class 2606 OID 43675178)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2940 (class 2606 OID 43675158)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 43675193)
-- Name: fk_11e93b5d7634c214; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d7634c214 FOREIGN KEY (nadrejenogostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2943 (class 2606 OID 43675173)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 43675183)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2942 (class 2606 OID 43675168)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2983 (class 2606 OID 43675373)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 43675378)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 43675383)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 43675543)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 43675538)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 43675058)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 43675063)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 43675288)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3013 (class 2606 OID 43675523)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 43675518)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 43675528)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3011 (class 2606 OID 43675513)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3010 (class 2606 OID 43675508)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 43675283)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2938 (class 2606 OID 43675148)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 43675153)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 43675328)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 43675338)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 43675333)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 43675113)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 43675108)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 43675273)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 43675498)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2986 (class 2606 OID 43675388)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 43675393)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2988 (class 2606 OID 43675398)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 43675533)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2992 (class 2606 OID 43675418)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2989 (class 2606 OID 43675403)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 43675423)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 43675413)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2990 (class 2606 OID 43675408)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 43675103)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 43675098)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 43675043)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 43675038)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 43675308)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 43675018)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 43675023)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2973 (class 2606 OID 43675323)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 43675318)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2971 (class 2606 OID 43675313)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 43675073)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 43675068)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 43675078)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 43675128)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 43675003)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 43675248)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 43675238)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 43675233)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 43675243)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 43675008)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 43675013)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 43675293)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 43675558)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 43675368)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 43675363)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3021 (class 2606 OID 43675563)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 43675568)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 43675278)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2979 (class 2606 OID 43675353)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 43675358)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 43675473)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3002 (class 2606 OID 43675468)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2999 (class 2606 OID 43675453)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 43675458)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 43675463)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 43675088)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 43675083)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 43675093)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 43675303)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2968 (class 2606 OID 43675298)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 43675483)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 43675488)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 43675443)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2998 (class 2606 OID 43675448)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2995 (class 2606 OID 43675433)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2996 (class 2606 OID 43675438)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 43675223)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 43675228)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2977 (class 2606 OID 43675343)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 43675348)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 43675198)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 43675203)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 43675268)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 43675263)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 43675253)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 43675258)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 43675428)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 43675118)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 43675123)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2937 (class 2606 OID 43675143)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2935 (class 2606 OID 43675133)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 43675138)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 43675478)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 43675493)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 43675503)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3018 (class 2606 OID 43675548)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 43675553)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 43675033)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 43675028)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 43675048)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 43675053)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 43675218)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 43675213)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 43675208)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-02-04 16:27:23 CET

--
-- PostgreSQL database dump complete
--

