--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-14 14:59:03 CET

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
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 36356800)
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
-- TOC entry 241 (class 1259 OID 36357426)
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
-- TOC entry 240 (class 1259 OID 36357410)
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
-- TOC entry 183 (class 1259 OID 36356793)
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
-- TOC entry 182 (class 1259 OID 36356791)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 36357287)
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
-- TOC entry 234 (class 1259 OID 36357317)
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
-- TOC entry 255 (class 1259 OID 36357729)
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
-- TOC entry 212 (class 1259 OID 36357123)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 204 (class 1259 OID 36357042)
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
-- TOC entry 206 (class 1259 OID 36357074)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 36357079)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 36357651)
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
-- TOC entry 195 (class 1259 OID 36356945)
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
-- TOC entry 242 (class 1259 OID 36357439)
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
-- TOC entry 227 (class 1259 OID 36357245)
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
-- TOC entry 201 (class 1259 OID 36357016)
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
-- TOC entry 198 (class 1259 OID 36356985)
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
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 196 (class 1259 OID 36356962)
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
-- TOC entry 216 (class 1259 OID 36357159)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 36357709)
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
-- TOC entry 254 (class 1259 OID 36357722)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 36357744)
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
-- TOC entry 220 (class 1259 OID 36357184)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 36356919)
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
-- TOC entry 186 (class 1259 OID 36356819)
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
-- TOC entry 190 (class 1259 OID 36356886)
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
-- TOC entry 187 (class 1259 OID 36356830)
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
-- TOC entry 179 (class 1259 OID 36356765)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 181 (class 1259 OID 36356784)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 36357191)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 36357225)
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
-- TOC entry 237 (class 1259 OID 36357358)
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
-- TOC entry 189 (class 1259 OID 36356866)
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
-- TOC entry 192 (class 1259 OID 36356911)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 36357595)
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
-- TOC entry 217 (class 1259 OID 36357165)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 191 (class 1259 OID 36356896)
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
-- TOC entry 203 (class 1259 OID 36357034)
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
-- TOC entry 199 (class 1259 OID 36357000)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    dezurni_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 200 (class 1259 OID 36357009)
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
-- TOC entry 219 (class 1259 OID 36357177)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 36357609)
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
-- TOC entry 246 (class 1259 OID 36357619)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 36357508)
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
-- TOC entry 247 (class 1259 OID 36357627)
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
-- TOC entry 223 (class 1259 OID 36357206)
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
-- TOC entry 215 (class 1259 OID 36357150)
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
-- TOC entry 214 (class 1259 OID 36357140)
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
-- TOC entry 236 (class 1259 OID 36357347)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 36357277)
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
-- TOC entry 197 (class 1259 OID 36356974)
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
-- TOC entry 176 (class 1259 OID 36356736)
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
-- TOC entry 175 (class 1259 OID 36356734)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 36357219)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 180 (class 1259 OID 36356774)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 36356758)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 36357233)
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
-- TOC entry 218 (class 1259 OID 36357171)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 36357094)
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
-- TOC entry 174 (class 1259 OID 36356723)
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
-- TOC entry 173 (class 1259 OID 36356715)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 172 (class 1259 OID 36356710)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 36357294)
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
-- TOC entry 188 (class 1259 OID 36356858)
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
-- TOC entry 211 (class 1259 OID 36357113)
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
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 213 (class 1259 OID 36357130)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 36357335)
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
-- TOC entry 185 (class 1259 OID 36356809)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 36357639)
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
-- TOC entry 208 (class 1259 OID 36357084)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 194 (class 1259 OID 36356931)
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
-- TOC entry 177 (class 1259 OID 36356745)
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
-- TOC entry 239 (class 1259 OID 36357385)
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
-- TOC entry 210 (class 1259 OID 36357104)
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
-- TOC entry 202 (class 1259 OID 36357027)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 36357198)
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
-- TOC entry 233 (class 1259 OID 36357308)
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
-- TOC entry 251 (class 1259 OID 36357689)
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
-- TOC entry 250 (class 1259 OID 36357658)
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
-- TOC entry 252 (class 1259 OID 36357701)
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
-- TOC entry 229 (class 1259 OID 36357270)
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
-- TOC entry 205 (class 1259 OID 36357068)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 36357375)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 36357260)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 36356796)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 36356739)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3150 (class 0 OID 36356800)
-- Dependencies: 184
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5697-a9a3-9e11-bc819b9f3e4b	10	30	Otroci	Abonma za otroke	200
000a0000-5697-a9a3-01c5-d08047f1bf6d	20	60	Mladina	Abonma za mladino	400
000a0000-5697-a9a3-4410-f9efcc7a2878	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3207 (class 0 OID 36357426)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5697-a9a4-acd8-4029c65c028e	000d0000-5697-a9a4-d68c-086b3f74b109	\N	00090000-5697-a9a4-794c-9c4485adbe16	000b0000-5697-a9a4-1c04-b3bdf4184c9a	0001	f	\N	\N	\N	3	t	t	t
000c0000-5697-a9a4-9404-ee6725c4671e	000d0000-5697-a9a4-8c52-97f09d8ebcf7	00100000-5697-a9a4-364c-68357de86604	00090000-5697-a9a4-5350-bb8dc04e0504	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5697-a9a4-5da3-5329d1a38ba3	000d0000-5697-a9a4-c06f-be0c4724ffc0	00100000-5697-a9a4-f94a-9d2a2f60bedc	00090000-5697-a9a4-e65e-4644e94cc352	\N	0003	t	\N	2016-01-14	\N	2	t	f	f
000c0000-5697-a9a4-adbe-b1b2ce9f7299	000d0000-5697-a9a4-1259-11f73a857e51	\N	00090000-5697-a9a4-2c7f-da8470d44ae2	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5697-a9a4-e3b7-c17ad7e82323	000d0000-5697-a9a4-7810-4fc4478cd378	\N	00090000-5697-a9a4-20b9-f4e1213cb416	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5697-a9a4-cbcd-f3a2735a45ee	000d0000-5697-a9a4-7319-67849dc8df9f	\N	00090000-5697-a9a4-097b-c439560cc42c	000b0000-5697-a9a4-c1b7-ff3e687303e2	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5697-a9a4-08ec-4d54412f15af	000d0000-5697-a9a4-c8d8-ca580ec88b66	00100000-5697-a9a4-07cb-3f5fe8cadfc0	00090000-5697-a9a4-622a-89f16aa02350	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5697-a9a4-6003-ab79b1b7ec12	000d0000-5697-a9a4-7da5-f0ff3436e42c	\N	00090000-5697-a9a4-961f-322f5a2c8cc4	000b0000-5697-a9a4-130a-cea59919703c	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5697-a9a4-95dd-5c63b6bea5f5	000d0000-5697-a9a4-c8d8-ca580ec88b66	00100000-5697-a9a4-146f-adc9595301fb	00090000-5697-a9a4-23a5-9cd78458f476	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5697-a9a4-92ff-38ef0aaa2196	000d0000-5697-a9a4-c8d8-ca580ec88b66	00100000-5697-a9a4-6b24-25f14ad0824e	00090000-5697-a9a4-1c7f-5e59db1eeea8	\N	0010	t	\N	2016-01-14	\N	16	f	f	t
000c0000-5697-a9a4-e702-cbd9afbbdc7c	000d0000-5697-a9a4-c8d8-ca580ec88b66	00100000-5697-a9a4-779c-c28e67744779	00090000-5697-a9a4-b90f-31adbe9014f0	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5697-a9a4-9f3c-ca2cdc99c29b	000d0000-5697-a9a4-7245-2c2fadecdf14	00100000-5697-a9a4-364c-68357de86604	00090000-5697-a9a4-5350-bb8dc04e0504	000b0000-5697-a9a4-1c49-37434d889c9f	0012	t	\N	\N	\N	2	t	t	t
000c0000-5697-a9a4-84c5-055d7d2a6425	000d0000-5697-a9a4-af12-784b7f5b0065	\N	00090000-5697-a9a4-961f-322f5a2c8cc4	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5697-a9a4-6d03-8949c5d75525	000d0000-5697-a9a4-af12-784b7f5b0065	\N	00090000-5697-a9a4-d68c-738f32a5e10a	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5697-a9a4-e247-12543d462c35	000d0000-5697-a9a4-3b49-31fbf8e81a2e	00100000-5697-a9a4-f94a-9d2a2f60bedc	00090000-5697-a9a4-e65e-4644e94cc352	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5697-a9a4-a792-f1bc0e444eaf	000d0000-5697-a9a4-3b49-31fbf8e81a2e	\N	00090000-5697-a9a4-d68c-738f32a5e10a	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5697-a9a4-55ad-ee39f78e8c7f	000d0000-5697-a9a4-0445-f843e7487067	\N	00090000-5697-a9a4-d68c-738f32a5e10a	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5697-a9a4-1637-0c42ff9a9e24	000d0000-5697-a9a4-0445-f843e7487067	\N	00090000-5697-a9a4-961f-322f5a2c8cc4	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5697-a9a4-5365-032c264062ea	000d0000-5697-a9a4-0fa3-e65dba837bf4	00100000-5697-a9a4-07cb-3f5fe8cadfc0	00090000-5697-a9a4-622a-89f16aa02350	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5697-a9a4-50d4-637fda32a6a7	000d0000-5697-a9a4-0fa3-e65dba837bf4	\N	00090000-5697-a9a4-d68c-738f32a5e10a	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5697-a9a4-e777-e708e15ea330	000d0000-5697-a9a4-71e6-f619df2e13a8	\N	00090000-5697-a9a4-d68c-738f32a5e10a	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5697-a9a4-0ded-d6d99562cbe5	000d0000-5697-a9a4-71e6-f619df2e13a8	00100000-5697-a9a4-07cb-3f5fe8cadfc0	00090000-5697-a9a4-622a-89f16aa02350	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5697-a9a4-5fea-7501293a8161	000d0000-5697-a9a4-fe0c-3836a75ea945	\N	00090000-5697-a9a4-d68c-738f32a5e10a	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5697-a9a4-f4d8-3a79fac5577d	000d0000-5697-a9a4-3542-bcb2e020aba5	\N	00090000-5697-a9a4-961f-322f5a2c8cc4	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5697-a9a4-a489-ccb3cb18df06	000d0000-5697-a9a4-b65b-ef9caf8b7090	\N	00090000-5697-a9a4-961f-322f5a2c8cc4	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5697-a9a4-fdb5-8f5ce3957772	000d0000-5697-a9a4-b65b-ef9caf8b7090	00100000-5697-a9a4-f94a-9d2a2f60bedc	00090000-5697-a9a4-e65e-4644e94cc352	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5697-a9a4-d8d7-03bcb7f52b8c	000d0000-5697-a9a4-d695-44aeeba6459e	\N	00090000-5697-a9a4-1ff9-0642e663f94a	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5697-a9a4-5f4e-d75993e8d3fe	000d0000-5697-a9a4-d695-44aeeba6459e	\N	00090000-5697-a9a4-0160-0d328df4b486	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5697-a9a4-bc2b-2b66dac1a976	000d0000-5697-a9a4-cffa-8304853c51f9	\N	00090000-5697-a9a4-961f-322f5a2c8cc4	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5697-a9a4-78d6-923beca9c4e7	000d0000-5697-a9a4-cffa-8304853c51f9	00100000-5697-a9a4-f94a-9d2a2f60bedc	00090000-5697-a9a4-e65e-4644e94cc352	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5697-a9a4-ad68-50d45a6b4cc3	000d0000-5697-a9a4-cffa-8304853c51f9	\N	00090000-5697-a9a4-0160-0d328df4b486	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5697-a9a4-d967-072d2eb2cfe3	000d0000-5697-a9a4-cffa-8304853c51f9	\N	00090000-5697-a9a4-1ff9-0642e663f94a	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5697-a9a4-bae1-3ca882315541	000d0000-5697-a9a4-b147-82b05c66276c	\N	00090000-5697-a9a4-961f-322f5a2c8cc4	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5697-a9a4-a5a3-ef4bd1ee478f	000d0000-5697-a9a4-794b-bd36813d63b9	00100000-5697-a9a4-f94a-9d2a2f60bedc	00090000-5697-a9a4-e65e-4644e94cc352	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5697-a9a4-a54a-df53dcb6f42b	000d0000-5697-a9a4-794b-bd36813d63b9	\N	00090000-5697-a9a4-d68c-738f32a5e10a	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3206 (class 0 OID 36357410)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 36356793)
-- Dependencies: 183
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3197 (class 0 OID 36357287)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5697-a9a4-9edc-2238f016aaaa	00160000-5697-a9a3-a720-ff589ed766c7	00090000-5697-a9a4-0160-0d328df4b486	aizv	10	t
003d0000-5697-a9a4-44a5-7429de161ea2	00160000-5697-a9a3-a720-ff589ed766c7	00090000-5697-a9a4-03d8-ca6a26b56849	apri	14	t
003d0000-5697-a9a4-2ded-957ad32d6f3e	00160000-5697-a9a3-a86b-221c48253d1c	00090000-5697-a9a4-1ff9-0642e663f94a	aizv	11	t
003d0000-5697-a9a4-4464-79afc6298926	00160000-5697-a9a3-6e9c-b20ac50fd7e2	00090000-5697-a9a4-eb4c-019a23dd8309	aizv	12	t
003d0000-5697-a9a4-5ea5-d90a5574d350	00160000-5697-a9a3-a720-ff589ed766c7	00090000-5697-a9a4-d68c-738f32a5e10a	apri	18	f
\.


--
-- TOC entry 3200 (class 0 OID 36357317)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5697-a9a3-a720-ff589ed766c7	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5697-a9a3-a86b-221c48253d1c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5697-a9a3-6e9c-b20ac50fd7e2	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3221 (class 0 OID 36357729)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 36357123)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 36357042)
-- Dependencies: 204
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5697-a9a4-7722-00ef8a206bfd	\N	\N	00200000-5697-a9a4-2129-e468440d967f	\N	\N	\N	00220000-5697-a9a3-74f8-71341d284b16	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5697-a9a4-5b69-ca2bd2191e59	\N	\N	00200000-5697-a9a4-ab26-b4c931704a3a	\N	\N	\N	00220000-5697-a9a3-74f8-71341d284b16	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5697-a9a4-3fd5-5fe61e01964d	\N	\N	00200000-5697-a9a4-7783-79273ef6af09	\N	\N	\N	00220000-5697-a9a3-b14d-098523b68cb6	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5697-a9a4-1a60-3bfca67dba27	\N	\N	00200000-5697-a9a4-6e7e-2bcc3bb5e810	\N	\N	\N	00220000-5697-a9a3-c2d3-5894901cc061	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5697-a9a4-b50b-a8126b5887f8	\N	\N	00200000-5697-a9a4-ffbf-66ac50439334	\N	\N	\N	00220000-5697-a9a3-21c7-377da126d55e	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3172 (class 0 OID 36357074)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 36357079)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 36357651)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 36356945)
-- Dependencies: 195
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5697-a9a0-9a15-c82a7bd658f0	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5697-a9a0-9cef-f33da15deb4c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5697-a9a0-56d3-7cef00118c41	AL	ALB	008	Albania 	Albanija	\N
00040000-5697-a9a0-69d8-abd7a5875887	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5697-a9a0-f5b2-810ed37bb7fb	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5697-a9a0-0b5e-16cebd6aa16b	AD	AND	020	Andorra 	Andora	\N
00040000-5697-a9a0-696e-87ebf16782c7	AO	AGO	024	Angola 	Angola	\N
00040000-5697-a9a0-c733-baa606064710	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5697-a9a0-42cc-38a78fa5e44f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5697-a9a0-dbd0-4b19aef28f19	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-a9a0-a353-c9ac9b33fe2d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5697-a9a0-72ef-00189918627e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5697-a9a0-2406-c90928d92b51	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5697-a9a0-2029-dbc5f5f4c984	AU	AUS	036	Australia 	Avstralija	\N
00040000-5697-a9a0-9cd8-702128a7098c	AT	AUT	040	Austria 	Avstrija	\N
00040000-5697-a9a0-f26d-1371b2c6e6ad	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5697-a9a0-67a4-354653539780	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5697-a9a0-f7e0-28af549f4726	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5697-a9a0-da03-69fb7a57d8dd	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5697-a9a0-9221-32ec9fbc5e16	BB	BRB	052	Barbados 	Barbados	\N
00040000-5697-a9a0-2bcf-b27c5714db8c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5697-a9a0-4eaf-7a17573b2db1	BE	BEL	056	Belgium 	Belgija	\N
00040000-5697-a9a0-3619-f60e31ef8842	BZ	BLZ	084	Belize 	Belize	\N
00040000-5697-a9a0-962e-fa9191a052bf	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5697-a9a0-6067-7949218b6a87	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5697-a9a0-69a3-ac1a0efcce11	BT	BTN	064	Bhutan 	Butan	\N
00040000-5697-a9a0-edf9-c2e16a813a94	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5697-a9a0-8606-2b80da9b78e0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5697-a9a0-a0bb-8aef6623c7bc	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5697-a9a0-ebe3-b417db5d39a7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5697-a9a0-b923-7e14ee24f88c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5697-a9a0-4a10-68723ae69803	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5697-a9a0-0cdc-095f205ad2b9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5697-a9a0-4fa1-9fd7d189ad2b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5697-a9a0-f054-8426d4d40888	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5697-a9a0-d599-d50188318e41	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5697-a9a0-2417-8fd142199695	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5697-a9a0-a760-292391b6ab36	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5697-a9a0-b0d6-02aa8fc7cb85	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5697-a9a0-788d-ca760a01f93a	CA	CAN	124	Canada 	Kanada	\N
00040000-5697-a9a0-1756-ad24ebe53a25	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5697-a9a0-b53c-86a10baa789b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5697-a9a0-b8c3-d6a12b0639ef	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5697-a9a0-9a46-64941dcea835	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5697-a9a0-193c-d8dfa7c23245	CL	CHL	152	Chile 	Čile	\N
00040000-5697-a9a0-1b2e-3060af9b134f	CN	CHN	156	China 	Kitajska	\N
00040000-5697-a9a0-c528-8b45a4906480	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5697-a9a0-c6fd-c034dc464822	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5697-a9a0-6ec4-e2f1d9603d94	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5697-a9a0-6c03-2f9acf2dad4a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5697-a9a0-c3a8-829f9b87e1a2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5697-a9a0-4e43-ed974164b2b2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5697-a9a0-2f15-baeaf0dea44c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5697-a9a0-6f0e-5a26edf18d8c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5697-a9a0-3b6b-bbf49bdaef57	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5697-a9a0-516b-64a940812c90	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5697-a9a0-e871-fdcc9d26bef2	CU	CUB	192	Cuba 	Kuba	\N
00040000-5697-a9a0-d3f3-a98b19b3b3d0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5697-a9a0-0ed9-e932394740a3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5697-a9a0-bf4f-4ef91896d41d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5697-a9a0-4b68-b332f1f2d1a4	DK	DNK	208	Denmark 	Danska	\N
00040000-5697-a9a0-3bc6-dd2cbd475f6a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5697-a9a0-95fd-88bd1f3ada9f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-a9a0-92b8-ef7014966353	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5697-a9a0-1b99-5e1202b1a11e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5697-a9a0-33e1-f70fd8f0604c	EG	EGY	818	Egypt 	Egipt	\N
00040000-5697-a9a0-4630-3cdcb2e3f408	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5697-a9a0-6086-766990633b36	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5697-a9a0-3eab-b13bf8175a61	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5697-a9a0-1b90-7fcd2a2acae8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5697-a9a0-3790-dc581bd6ba1b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5697-a9a0-8794-63abbe028ce3	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5697-a9a0-d22d-6c3c80096a9d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5697-a9a0-191e-115f797ba36a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5697-a9a0-ec34-009e08968a78	FI	FIN	246	Finland 	Finska	\N
00040000-5697-a9a0-81b9-9ca17ed6ece9	FR	FRA	250	France 	Francija	\N
00040000-5697-a9a0-a4c5-eda5e0d4c9e9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5697-a9a0-c0b0-2fa94537622b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5697-a9a0-d9fb-9cbb561585d2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5697-a9a0-4174-be6270fb98f5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5697-a9a0-c70b-aaeddfc9bbc0	GA	GAB	266	Gabon 	Gabon	\N
00040000-5697-a9a0-3ea9-e951acb16ad7	GM	GMB	270	Gambia 	Gambija	\N
00040000-5697-a9a0-9834-8fbca71fcddd	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5697-a9a0-28a6-daf4f60d68df	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5697-a9a0-45b6-8427d08339fa	GH	GHA	288	Ghana 	Gana	\N
00040000-5697-a9a0-a1b2-8fc14dc1bd5f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5697-a9a0-0754-14f17a2d1348	GR	GRC	300	Greece 	Grčija	\N
00040000-5697-a9a0-13ee-4281763b857b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5697-a9a0-f6f3-2051152ca474	GD	GRD	308	Grenada 	Grenada	\N
00040000-5697-a9a0-d49b-1cd7abc8459c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5697-a9a0-7014-e9a312189bbe	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5697-a9a0-9e5b-52811b4fc9f3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5697-a9a0-782c-f7020af04806	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5697-a9a0-5085-ee111ed1895b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5697-a9a0-e976-14136b4d5c71	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5697-a9a0-28d1-6fc7ae705b73	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5697-a9a0-8f0b-6d81659e3870	HT	HTI	332	Haiti 	Haiti	\N
00040000-5697-a9a0-3b72-93b9b17458ae	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5697-a9a0-4bc8-57b398bf3bda	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5697-a9a0-1b0d-d3aaae1eeda9	HN	HND	340	Honduras 	Honduras	\N
00040000-5697-a9a0-76ac-9b278d20a4b2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5697-a9a0-ad3a-bd937f72caa4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5697-a9a0-c9a0-484c6762b333	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5697-a9a0-6052-79e062fb5a88	IN	IND	356	India 	Indija	\N
00040000-5697-a9a0-047e-0c0bfb4b39c3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5697-a9a0-d493-eb334620b8b1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5697-a9a0-71e3-6396370a1d66	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5697-a9a0-9f27-7daf39b3e38a	IE	IRL	372	Ireland 	Irska	\N
00040000-5697-a9a0-3b3c-de088282edf4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5697-a9a0-9e04-31a7753aaaa3	IL	ISR	376	Israel 	Izrael	\N
00040000-5697-a9a0-d6a3-5289671afaa2	IT	ITA	380	Italy 	Italija	\N
00040000-5697-a9a0-32a1-57e2efb87004	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5697-a9a0-959d-0f4257bcf297	JP	JPN	392	Japan 	Japonska	\N
00040000-5697-a9a0-606d-ea4f1d8fde62	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5697-a9a0-e97b-236b60e800ed	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5697-a9a0-0aab-523c59ac0a8c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5697-a9a0-878e-6e917bae565d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5697-a9a0-6cf1-5ba4fdc3dae4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5697-a9a0-72e2-dd1c08e87655	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5697-a9a0-38a2-f7a2504810fb	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5697-a9a0-46fd-6642b46eb933	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5697-a9a0-17bf-99c1966b6a71	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5697-a9a0-79fd-1573191ac868	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5697-a9a0-630f-b3deba523c23	LV	LVA	428	Latvia 	Latvija	\N
00040000-5697-a9a0-0fec-c5daf550bd9d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5697-a9a0-1bd1-3550c8849023	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5697-a9a0-4231-34be52a389e2	LR	LBR	430	Liberia 	Liberija	\N
00040000-5697-a9a0-8df1-64f28832a524	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5697-a9a0-f286-4b6283f0d2a4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5697-a9a0-4be6-a74fb9d4217a	LT	LTU	440	Lithuania 	Litva	\N
00040000-5697-a9a0-1815-d1d0379d542d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5697-a9a0-856d-239684d63dd9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5697-a9a0-413e-26c93866aa9e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5697-a9a0-927a-fca245001634	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5697-a9a0-df85-3a23cf075a65	MW	MWI	454	Malawi 	Malavi	\N
00040000-5697-a9a0-ca23-e14c84886efc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5697-a9a0-9804-1b476acf24c3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5697-a9a0-6665-1831061ff229	ML	MLI	466	Mali 	Mali	\N
00040000-5697-a9a0-d65c-25c4ce14082a	MT	MLT	470	Malta 	Malta	\N
00040000-5697-a9a0-1b83-cb6c93900217	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5697-a9a0-db06-a94acdbd66f2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5697-a9a0-5fb1-c0e12c27956f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5697-a9a0-3f4e-4bcff3537a8e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5697-a9a0-73ff-2542e914393b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5697-a9a0-7b18-ee64e564cdc0	MX	MEX	484	Mexico 	Mehika	\N
00040000-5697-a9a0-9c34-707ee9d86424	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5697-a9a0-d521-70c6b03b0c7e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5697-a9a0-37d1-dc6770fd8aae	MC	MCO	492	Monaco 	Monako	\N
00040000-5697-a9a0-d5a0-bbe2f53c6cf6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5697-a9a0-e3a1-5b086e113ce7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5697-a9a0-ad0d-9cc0c30362b0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5697-a9a0-1c7c-9f627cc01823	MA	MAR	504	Morocco 	Maroko	\N
00040000-5697-a9a0-3d4e-329ab8227109	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5697-a9a0-f1e7-b99cde00193d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5697-a9a0-d7ef-384573c51f87	NA	NAM	516	Namibia 	Namibija	\N
00040000-5697-a9a0-6473-60f1aa68c989	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5697-a9a0-45f0-280ce70804d5	NP	NPL	524	Nepal 	Nepal	\N
00040000-5697-a9a0-fd74-61862b3ce7ed	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5697-a9a0-4f3f-a873da49f0cc	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5697-a9a0-461e-5c1f358e9726	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5697-a9a0-42af-a7acc8cfffe8	NE	NER	562	Niger 	Niger 	\N
00040000-5697-a9a0-887d-680948c1de5e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5697-a9a0-fa60-794879e3a627	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5697-a9a0-31ed-bf25a21b5d20	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5697-a9a0-ba99-470449f727fa	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5697-a9a0-3cfd-04413fb4a7d2	NO	NOR	578	Norway 	Norveška	\N
00040000-5697-a9a0-0ddf-3077a4012939	OM	OMN	512	Oman 	Oman	\N
00040000-5697-a9a0-37d1-66f29891d101	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5697-a9a0-cdb8-e4dfb95dc810	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5697-a9a0-9aa8-6983c385e9db	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5697-a9a0-a1bf-0b74f4add685	PA	PAN	591	Panama 	Panama	\N
00040000-5697-a9a0-3bc0-3a42c9408e75	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5697-a9a0-46cf-a55b15d2975d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5697-a9a0-2683-4813d07851b8	PE	PER	604	Peru 	Peru	\N
00040000-5697-a9a0-d527-fb040e81c093	PH	PHL	608	Philippines 	Filipini	\N
00040000-5697-a9a0-e212-08499bf118cc	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5697-a9a0-31eb-44324a050b5d	PL	POL	616	Poland 	Poljska	\N
00040000-5697-a9a0-8430-6c862677c968	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5697-a9a0-f132-fc1cf4525120	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5697-a9a0-3d65-804b9391e83d	QA	QAT	634	Qatar 	Katar	\N
00040000-5697-a9a0-ff9c-67d3a7307fc6	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5697-a9a0-ed75-6c0e097365ea	RO	ROU	642	Romania 	Romunija	\N
00040000-5697-a9a0-61b9-b90a165c6a5a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5697-a9a0-2440-6e18f3681085	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5697-a9a0-b19b-9e9d2c152a96	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5697-a9a0-58b4-06ceee416f16	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5697-a9a0-8a83-03af5155c311	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5697-a9a0-b193-f9b0a2c52044	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5697-a9a0-d39d-cf7d1b56eba8	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5697-a9a0-1f0c-96ec256d4f3a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5697-a9a0-0850-3a8a202abe28	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5697-a9a0-167d-2aedcaa84540	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5697-a9a0-28d2-aed076d953ed	SM	SMR	674	San Marino 	San Marino	\N
00040000-5697-a9a0-58e9-63bd678d3abf	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5697-a9a0-7633-174f3113ca3e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5697-a9a0-aaab-27ce14d02806	SN	SEN	686	Senegal 	Senegal	\N
00040000-5697-a9a0-797f-181562e7d6a3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5697-a9a0-a7c2-590d2336f3ce	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5697-a9a0-081e-4d29c1c1a71d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5697-a9a0-577c-64f38f38d7a7	SG	SGP	702	Singapore 	Singapur	\N
00040000-5697-a9a0-ecc2-dd4af1fb1dbb	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5697-a9a0-8eef-90e8c3915bbd	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5697-a9a0-09f9-9f9c8d6c30ab	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5697-a9a0-8760-7cea17219448	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5697-a9a0-b3f0-75501b123ec8	SO	SOM	706	Somalia 	Somalija	\N
00040000-5697-a9a0-9698-6d641c076469	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5697-a9a0-031c-8bc94ce8dec8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5697-a9a0-78f9-a81913ed9275	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5697-a9a0-ae48-b2f31b336795	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5697-a9a0-399e-ad766be610ee	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5697-a9a0-10b2-95025fc5b513	SD	SDN	729	Sudan 	Sudan	\N
00040000-5697-a9a0-cd90-0dae0a96900f	SR	SUR	740	Suriname 	Surinam	\N
00040000-5697-a9a0-f013-69f2a66b0ccf	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5697-a9a0-3a3d-58f0aa6468da	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5697-a9a0-26af-63f19da6f742	SE	SWE	752	Sweden 	Švedska	\N
00040000-5697-a9a0-7ca4-6c903bdde26d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5697-a9a0-d40e-b8bf3f93780d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5697-a9a0-37b7-3e97691bdbbd	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5697-a9a0-52aa-a95b54e17752	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5697-a9a0-70c5-90f274b8b808	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5697-a9a0-0a0e-7d3b48eb515c	TH	THA	764	Thailand 	Tajska	\N
00040000-5697-a9a0-25ff-1c850d8fd89b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5697-a9a0-996f-52d77545e02c	TG	TGO	768	Togo 	Togo	\N
00040000-5697-a9a0-8d88-708f3054f7ab	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5697-a9a0-c7cb-88341988abc3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5697-a9a0-e5da-450b68130a94	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5697-a9a0-6a81-0a4b88018005	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5697-a9a0-3c7c-89e40625d205	TR	TUR	792	Turkey 	Turčija	\N
00040000-5697-a9a0-00a0-4043ef46f5aa	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5697-a9a0-9c79-d36f45862e71	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-a9a0-ef2e-24ec22e42e75	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5697-a9a0-238d-74c7644d05ba	UG	UGA	800	Uganda 	Uganda	\N
00040000-5697-a9a0-526c-df411572ae61	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5697-a9a0-8de7-d8943f7e5e13	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5697-a9a0-fcdc-b2180d6e7928	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5697-a9a0-710e-2508c8adadf0	US	USA	840	United States 	Združene države Amerike	\N
00040000-5697-a9a0-670e-9e1085aaacef	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5697-a9a0-9c99-780d161cb389	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5697-a9a0-3d3b-0731fbadb8fc	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5697-a9a0-eb11-d09d178a15dd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5697-a9a0-0908-cc15579cd0b8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5697-a9a0-7715-7be5fe31bc84	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5697-a9a0-079f-a444ac743491	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-a9a0-b2b7-a6eb89ba6993	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5697-a9a0-3352-4cabfb456233	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5697-a9a0-f240-7490b825582f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5697-a9a0-c370-a8a2a36fc8e1	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5697-a9a0-c7e2-956c6a642484	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5697-a9a0-54b9-f28b6674a532	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3208 (class 0 OID 36357439)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5697-a9a4-494f-e949cf793e18	000e0000-5697-a9a4-4496-c013556c4cf1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-a9a0-bb06-97bfacfa3afb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-a9a4-0b43-bc545100da57	000e0000-5697-a9a4-2075-997deb404874	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-a9a0-a1e0-f545207d3e0b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-a9a4-d081-f04b5672ac6f	000e0000-5697-a9a4-5d9f-f0e698d727a2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-a9a0-bb06-97bfacfa3afb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-a9a4-2c7b-305e504ad4a9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-a9a4-7fad-7f9f463ce62e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3193 (class 0 OID 36357245)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5697-a9a4-85c0-f938102410c2	000e0000-5697-a9a4-2075-997deb404874	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-5697-a9a0-f98c-269b133495ac
000d0000-5697-a9a4-5a8e-0df9eecd4a5e	000e0000-5697-a9a4-cb12-e8a690f44b0b	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-a9a0-610b-a5aba58f9689
000d0000-5697-a9a4-6d91-59ead861e0ae	000e0000-5697-a9a4-cb12-e8a690f44b0b	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-d68c-086b3f74b109	000e0000-5697-a9a4-2075-997deb404874	000c0000-5697-a9a4-acd8-4029c65c028e	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-a9a0-610b-a5aba58f9689
000d0000-5697-a9a4-8c52-97f09d8ebcf7	000e0000-5697-a9a4-2075-997deb404874	000c0000-5697-a9a4-9404-ee6725c4671e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-c06f-be0c4724ffc0	000e0000-5697-a9a4-2075-997deb404874	000c0000-5697-a9a4-5da3-5329d1a38ba3	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5697-a9a0-e03f-799d0c59b316
000d0000-5697-a9a4-1259-11f73a857e51	000e0000-5697-a9a4-2075-997deb404874	000c0000-5697-a9a4-adbe-b1b2ce9f7299	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5697-a9a0-f98c-269b133495ac
000d0000-5697-a9a4-7810-4fc4478cd378	000e0000-5697-a9a4-2075-997deb404874	000c0000-5697-a9a4-e3b7-c17ad7e82323	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5697-a9a0-f98c-269b133495ac
000d0000-5697-a9a4-7319-67849dc8df9f	000e0000-5697-a9a4-2075-997deb404874	000c0000-5697-a9a4-cbcd-f3a2735a45ee	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-a9a0-610b-a5aba58f9689
000d0000-5697-a9a4-c8d8-ca580ec88b66	000e0000-5697-a9a4-2075-997deb404874	000c0000-5697-a9a4-95dd-5c63b6bea5f5	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5697-a9a0-610b-a5aba58f9689
000d0000-5697-a9a4-7da5-f0ff3436e42c	000e0000-5697-a9a4-2075-997deb404874	000c0000-5697-a9a4-6003-ab79b1b7ec12	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5697-a9a0-3fc3-7ff2deba8d3e
000d0000-5697-a9a4-7245-2c2fadecdf14	000e0000-5697-a9a4-2075-997deb404874	000c0000-5697-a9a4-9f3c-ca2cdc99c29b	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5697-a9a0-8ff5-f8830b6c074e
000d0000-5697-a9a4-af12-784b7f5b0065	000e0000-5697-a9a4-c787-c703579f16f3	000c0000-5697-a9a4-84c5-055d7d2a6425	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-3b49-31fbf8e81a2e	000e0000-5697-a9a4-6d8b-bacc8d031be5	000c0000-5697-a9a4-e247-12543d462c35	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-0445-f843e7487067	000e0000-5697-a9a4-6d8b-bacc8d031be5	000c0000-5697-a9a4-55ad-ee39f78e8c7f	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-0fa3-e65dba837bf4	000e0000-5697-a9a4-6c8f-61d679f14654	000c0000-5697-a9a4-5365-032c264062ea	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-71e6-f619df2e13a8	000e0000-5697-a9a4-bbbb-7471f5ea80ba	000c0000-5697-a9a4-e777-e708e15ea330	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-fe0c-3836a75ea945	000e0000-5697-a9a4-cb30-c3fbeac249bf	000c0000-5697-a9a4-5fea-7501293a8161	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-3542-bcb2e020aba5	000e0000-5697-a9a4-af13-12a5cc46c16f	000c0000-5697-a9a4-f4d8-3a79fac5577d	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-b65b-ef9caf8b7090	000e0000-5697-a9a4-5cd8-686e190ac9bd	000c0000-5697-a9a4-a489-ccb3cb18df06	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-d695-44aeeba6459e	000e0000-5697-a9a4-fd90-7df8c58cac2b	000c0000-5697-a9a4-d8d7-03bcb7f52b8c	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-cffa-8304853c51f9	000e0000-5697-a9a4-fd90-7df8c58cac2b	000c0000-5697-a9a4-bc2b-2b66dac1a976	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-b147-82b05c66276c	000e0000-5697-a9a4-8df4-0d00ec20dde2	000c0000-5697-a9a4-bae1-3ca882315541	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
000d0000-5697-a9a4-794b-bd36813d63b9	000e0000-5697-a9a4-8df4-0d00ec20dde2	000c0000-5697-a9a4-a5a3-ef4bd1ee478f	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5697-a9a0-67dd-f939cf21d981
\.


--
-- TOC entry 3167 (class 0 OID 36357016)
-- Dependencies: 201
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 36356985)
-- Dependencies: 198
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 36356962)
-- Dependencies: 196
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5697-a9a4-29cf-829d80619db6	00080000-5697-a9a4-130e-dce3fc24342f	00090000-5697-a9a4-1c7f-5e59db1eeea8	AK		igralka
\.


--
-- TOC entry 3182 (class 0 OID 36357159)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 36357709)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5697-a9a4-e5ab-190a57e4c967	00010000-5697-a9a1-1a8f-ab3af35fd3e0	\N	Prva mapa	Root mapa	2016-01-14 14:59:00	2016-01-14 14:59:00	R	\N	\N
\.


--
-- TOC entry 3220 (class 0 OID 36357722)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 36357744)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 34548309)
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
-- TOC entry 3186 (class 0 OID 36357184)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 36356919)
-- Dependencies: 193
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5697-a9a1-3672-8a3d070139cd	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5697-a9a1-dd7f-5b880e53171a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5697-a9a1-5a99-b9bd6727549d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5697-a9a1-0cdb-8621e00efc4f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5697-a9a1-f990-f246da50ac6d	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5697-a9a1-fba7-bf38a79c7b0f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5697-a9a1-840c-45742e1b681a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5697-a9a1-4d31-a104f8e010eb	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-a9a1-f7c3-5ecd316bf103	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-a9a1-ca02-a477e1a4b4d7	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5697-a9a1-bec2-e72f8a439162	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5697-a9a1-d444-a8a93425a22c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5697-a9a1-d892-07d7f0a85177	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5697-a9a1-7420-bdfc4542181d	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5697-a9a3-7e01-562d3ab0e807	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5697-a9a3-9eaf-ef1fe21b570d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5697-a9a3-956c-1ad0bc9a4df6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5697-a9a3-6b35-334d1a5208cc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5697-a9a3-2249-f02c9ba8559a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5697-a9a6-d09a-344b2c503545	application.tenant.maticnopodjetje	string	s:36:"00080000-5697-a9a6-ff88-e2c9f5ab74e3";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3152 (class 0 OID 36356819)
-- Dependencies: 186
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5697-a9a3-fa5c-a4e411cb97af	00000000-5697-a9a3-7e01-562d3ab0e807	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5697-a9a3-87a5-ac7674e5cee5	00000000-5697-a9a3-7e01-562d3ab0e807	00010000-5697-a9a1-1a8f-ab3af35fd3e0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5697-a9a3-d828-53f796c6a11c	00000000-5697-a9a3-9eaf-ef1fe21b570d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3156 (class 0 OID 36356886)
-- Dependencies: 190
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5697-a9a4-2f96-50c5cfe3b2ee	\N	00100000-5697-a9a4-364c-68357de86604	00100000-5697-a9a4-f94a-9d2a2f60bedc	01	Gledališče Nimbis
00410000-5697-a9a4-6a6c-28baf12376aa	00410000-5697-a9a4-2f96-50c5cfe3b2ee	00100000-5697-a9a4-364c-68357de86604	00100000-5697-a9a4-f94a-9d2a2f60bedc	02	Tehnika
\.


--
-- TOC entry 3153 (class 0 OID 36356830)
-- Dependencies: 187
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5697-a9a4-794c-9c4485adbe16	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5697-a9a4-2c7f-da8470d44ae2	00010000-5697-a9a3-fb49-b42f64b368cc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5697-a9a4-e65e-4644e94cc352	00010000-5697-a9a3-17b1-606317a334da	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5697-a9a4-23a5-9cd78458f476	00010000-5697-a9a3-ca58-cab96557183d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5697-a9a4-b8c6-d375db8ff6cb	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5697-a9a4-097b-c439560cc42c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5697-a9a4-b90f-31adbe9014f0	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5697-a9a4-622a-89f16aa02350	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5697-a9a4-1c7f-5e59db1eeea8	00010000-5697-a9a3-a001-536c175bba00	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5697-a9a4-5350-bb8dc04e0504	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5697-a9a4-ce10-81cc54117088	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-a9a4-20b9-f4e1213cb416	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5697-a9a4-961f-322f5a2c8cc4	00010000-5697-a9a3-b717-b087ea6f8c65	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-a9a4-0160-0d328df4b486	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-a9a4-03d8-ca6a26b56849	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-a9a4-1ff9-0642e663f94a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-a9a4-eb4c-019a23dd8309	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-a9a4-d68c-738f32a5e10a	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-a9a4-0e23-ae7f24a29ccc	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-a9a4-f6c1-d2b21d621b33	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-a9a4-5203-de9ec6e18220	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 36356765)
-- Dependencies: 179
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5697-a9a0-cf5f-0c7f64b29179	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5697-a9a0-6d91-b315916a1928	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5697-a9a0-be5d-b62406b03832	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5697-a9a0-0346-3a852438b533	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5697-a9a0-44cd-9cac0d5e8a00	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5697-a9a0-5014-3b589f21d6aa	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5697-a9a0-af05-c5e4064874a6	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5697-a9a0-1cb6-e323bd8d76b0	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5697-a9a0-8398-b4bbdb602fbb	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5697-a9a0-062c-7400427e7037	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5697-a9a0-4faf-4ead50f00771	Abonma-read	Abonma - branje	t
00030000-5697-a9a0-ec6e-22b28755da7e	Abonma-write	Abonma - spreminjanje	t
00030000-5697-a9a0-0c3f-567e9a65e949	Alternacija-read	Alternacija - branje	t
00030000-5697-a9a0-8199-2da14ed7b3ad	Alternacija-write	Alternacija - spreminjanje	t
00030000-5697-a9a0-0d5d-91122bcc3f6a	Arhivalija-read	Arhivalija - branje	t
00030000-5697-a9a0-da55-96096f1415ec	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5697-a9a0-2167-6404e1949fd6	AuthStorage-read	AuthStorage - branje	t
00030000-5697-a9a0-d780-c6c5473718f6	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5697-a9a0-ca20-1ad72239d01f	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5697-a9a0-7154-3d1030b183be	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5697-a9a0-ed19-032cc8788beb	Besedilo-read	Besedilo - branje	t
00030000-5697-a9a0-ac41-05dd78f32c94	Besedilo-write	Besedilo - spreminjanje	t
00030000-5697-a9a0-c685-4abff2b3a314	Dodatek-read	Dodatek - branje	t
00030000-5697-a9a0-af66-007cdaef5a96	Dodatek-write	Dodatek - spreminjanje	t
00030000-5697-a9a0-0633-abd74da53263	Dogodek-read	Dogodek - branje	t
00030000-5697-a9a0-8238-8bd37d0c6a0d	Dogodek-write	Dogodek - spreminjanje	t
00030000-5697-a9a0-ee47-dd8bc09ae73e	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5697-a9a0-1ce2-53bafa73628a	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5697-a9a0-adcc-0c33809224c5	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5697-a9a0-a6ff-112440e08e8e	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5697-a9a0-7405-27f683f4df02	DogodekTrait-read	DogodekTrait - branje	t
00030000-5697-a9a0-e83e-f80c8c84005a	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5697-a9a0-6ded-39d7c69e1bab	DrugiVir-read	DrugiVir - branje	t
00030000-5697-a9a0-c23e-21bfc33cbc83	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5697-a9a0-17ce-95d0e604188b	Drzava-read	Drzava - branje	t
00030000-5697-a9a0-dfcc-e0cc74916f29	Drzava-write	Drzava - spreminjanje	t
00030000-5697-a9a0-309d-19d51a90607d	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5697-a9a0-7828-f1a09eedd54a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5697-a9a0-5e6e-3359f1a55eed	Funkcija-read	Funkcija - branje	t
00030000-5697-a9a0-14d1-23b4ce44f69e	Funkcija-write	Funkcija - spreminjanje	t
00030000-5697-a9a0-7439-51017ed3ceda	Gostovanje-read	Gostovanje - branje	t
00030000-5697-a9a0-1d08-63b6981e8360	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5697-a9a0-e624-8b30e344a204	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5697-a9a0-d512-f9eba027d4d5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5697-a9a0-b04e-45d9979be015	Kupec-read	Kupec - branje	t
00030000-5697-a9a0-3330-df9b6efe0479	Kupec-write	Kupec - spreminjanje	t
00030000-5697-a9a0-8e82-f728a2d76544	NacinPlacina-read	NacinPlacina - branje	t
00030000-5697-a9a0-6fd3-b1f0db627331	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5697-a9a0-8748-4a270509958f	Option-read	Option - branje	t
00030000-5697-a9a0-b542-16edd8167900	Option-write	Option - spreminjanje	t
00030000-5697-a9a0-1fa2-137aee0bc2c0	OptionValue-read	OptionValue - branje	t
00030000-5697-a9a0-1bc4-cf5bf13953f2	OptionValue-write	OptionValue - spreminjanje	t
00030000-5697-a9a0-1309-fbc50a679c8f	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5697-a9a0-069a-3c09f23e6282	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5697-a9a0-51de-7619a3e2db72	Oseba-read	Oseba - branje	t
00030000-5697-a9a0-36c2-2a9f1049379e	Oseba-write	Oseba - spreminjanje	t
00030000-5697-a9a0-8b38-d366aee39f55	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5697-a9a0-d1d8-02aadadabe06	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5697-a9a0-dc2f-62a19bdde975	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5697-a9a0-65d2-cab87d2526b8	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5697-a9a0-ea44-040c30ae0f17	Pogodba-read	Pogodba - branje	t
00030000-5697-a9a0-2711-41b8a345caf6	Pogodba-write	Pogodba - spreminjanje	t
00030000-5697-a9a0-8f34-00e7c5a3509d	Popa-read	Popa - branje	t
00030000-5697-a9a0-a262-6176ce3c7950	Popa-write	Popa - spreminjanje	t
00030000-5697-a9a0-12be-0b424fb4ddb3	Posta-read	Posta - branje	t
00030000-5697-a9a0-cd1b-a182bdb692e6	Posta-write	Posta - spreminjanje	t
00030000-5697-a9a0-7192-c945090e0d63	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5697-a9a0-b245-6474576d5537	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5697-a9a0-59f6-19fe3f67fecb	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5697-a9a0-b75f-c752d84b27da	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5697-a9a0-b261-f8d0c6ebdad2	PostniNaslov-read	PostniNaslov - branje	t
00030000-5697-a9a0-7bfe-5ec9e44265f1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5697-a9a0-de7c-dd8d4362b39a	Praznik-read	Praznik - branje	t
00030000-5697-a9a0-4331-13ae85609f7b	Praznik-write	Praznik - spreminjanje	t
00030000-5697-a9a0-4d48-851f9eee8c5a	Predstava-read	Predstava - branje	t
00030000-5697-a9a0-238f-b842df92ad45	Predstava-write	Predstava - spreminjanje	t
00030000-5697-a9a0-15d4-5e6df5587c59	Ura-read	Ura - branje	t
00030000-5697-a9a0-fcf6-a755cd67a749	Ura-write	Ura - spreminjanje	t
00030000-5697-a9a0-9e75-c31ae896e41a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5697-a9a0-1e1c-7d8cea88d08d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5697-a9a0-5a0c-27a1a59df9a6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5697-a9a0-3bdf-85f56faf7760	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5697-a9a0-80ed-2635b327e0a3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5697-a9a0-3e41-78482815b7a8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5697-a9a0-0f90-73e4f121d8a2	ProgramDela-read	ProgramDela - branje	t
00030000-5697-a9a0-52d9-3cdee6bdd690	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5697-a9a0-0962-9342db06ca22	ProgramFestival-read	ProgramFestival - branje	t
00030000-5697-a9a0-59e3-b291ba07ece8	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5697-a9a0-ad45-554777778a3b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5697-a9a0-581d-cd36cf94d6a0	Datoteka-write	Datoteka - spreminjanje	t
00030000-5697-a9a0-2db1-83e07ddf3a31	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5697-a9a0-8c04-39aa459c18f7	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5697-a9a0-1311-f843c0a214a1	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5697-a9a0-5b3f-2a6c6237bc94	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5697-a9a0-107f-d5ae62fb67d4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5697-a9a0-27d2-90d619fc0d10	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5697-a9a0-7d4f-ab7d578a97f6	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5697-a9a0-6846-9b615b0a2b49	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5697-a9a0-df0d-b7440fbdae88	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5697-a9a0-3e69-f0841d2791a4	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5697-a9a0-1eb0-cb51a48ea616	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5697-a9a0-f86d-c2633b1b8ebf	ProgramRazno-read	ProgramRazno - branje	t
00030000-5697-a9a0-27f7-4e49da24d521	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5697-a9a0-6e5e-1883acb2921a	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5697-a9a0-464f-37ec53dd23d6	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5697-a9a0-ee5c-b62ea8542494	Prostor-read	Prostor - branje	t
00030000-5697-a9a0-1963-5245392bfc3b	Prostor-write	Prostor - spreminjanje	t
00030000-5697-a9a0-c927-9377f7ef2a85	Racun-read	Racun - branje	t
00030000-5697-a9a0-a0d3-faa09a548d5e	Racun-write	Racun - spreminjanje	t
00030000-5697-a9a0-cbb4-0d870091af5b	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5697-a9a0-0904-4e95f9accc6a	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5697-a9a0-9e44-24bca8cd7c80	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5697-a9a0-5102-cd5b2becf82c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5697-a9a0-10cb-c2734b6b3940	Rekvizit-read	Rekvizit - branje	t
00030000-5697-a9a0-4ce7-a538e064af5d	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5697-a9a0-c2ae-3c80d5f90966	Revizija-read	Revizija - branje	t
00030000-5697-a9a0-b339-a93105fa7ee9	Revizija-write	Revizija - spreminjanje	t
00030000-5697-a9a0-6b7b-98a36801b749	Rezervacija-read	Rezervacija - branje	t
00030000-5697-a9a0-08bc-5fa6160aa621	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5697-a9a0-f94d-8b7169859d0f	SedezniRed-read	SedezniRed - branje	t
00030000-5697-a9a0-31e1-9c35b0c38cb3	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5697-a9a0-b1bd-1d9ae4ad547c	Sedez-read	Sedez - branje	t
00030000-5697-a9a0-fb35-0a109b9a5f63	Sedez-write	Sedez - spreminjanje	t
00030000-5697-a9a0-6bbe-e6da821f54e4	Sezona-read	Sezona - branje	t
00030000-5697-a9a0-1053-75a3dcab5b24	Sezona-write	Sezona - spreminjanje	t
00030000-5697-a9a0-e1a7-f051b8f0030f	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5697-a9a0-eff9-643289444c37	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5697-a9a0-c5fe-390c8d2eb852	Telefonska-read	Telefonska - branje	t
00030000-5697-a9a0-1a61-d22602bdffb4	Telefonska-write	Telefonska - spreminjanje	t
00030000-5697-a9a0-9f15-e94dc91a353f	TerminStoritve-read	TerminStoritve - branje	t
00030000-5697-a9a0-d45c-a0a9b874db02	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5697-a9a0-dea4-59a0598ad716	TipDodatka-read	TipDodatka - branje	t
00030000-5697-a9a0-99d8-6092f43fc1b4	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5697-a9a0-8cc6-4a591963bf72	TipFunkcije-read	TipFunkcije - branje	t
00030000-5697-a9a0-3e17-09826425f575	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5697-a9a0-b8fb-2ddaa0fc152c	TipPopa-read	TipPopa - branje	t
00030000-5697-a9a0-29bb-f70163b012f9	TipPopa-write	TipPopa - spreminjanje	t
00030000-5697-a9a0-e6a8-ed1efc740e30	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5697-a9a0-c0a0-9e963c52e834	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5697-a9a0-81f1-539a1c3eb647	TipVaje-read	TipVaje - branje	t
00030000-5697-a9a0-2a19-e56ec5507547	TipVaje-write	TipVaje - spreminjanje	t
00030000-5697-a9a0-316c-1ed928bfa089	Trr-read	Trr - branje	t
00030000-5697-a9a0-1f33-f68046da72f3	Trr-write	Trr - spreminjanje	t
00030000-5697-a9a0-a938-6d14d495ddaf	Uprizoritev-read	Uprizoritev - branje	t
00030000-5697-a9a0-7121-c5ebf92db376	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5697-a9a0-a705-6aa0b3f4e54e	Vaja-read	Vaja - branje	t
00030000-5697-a9a0-45ba-e17e23fe3947	Vaja-write	Vaja - spreminjanje	t
00030000-5697-a9a0-fca2-5eca17a72d08	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5697-a9a0-7718-47d3e5802146	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5697-a9a0-9bb4-20120348d89a	VrstaStroska-read	VrstaStroska - branje	t
00030000-5697-a9a0-a571-d0b8b36d042e	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5697-a9a0-dbde-00113cc898a6	Zaposlitev-read	Zaposlitev - branje	t
00030000-5697-a9a0-6896-b72b3cd07c37	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5697-a9a0-6335-4439d08bab82	Zasedenost-read	Zasedenost - branje	t
00030000-5697-a9a0-cd05-285ab442edcc	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5697-a9a0-1a8b-e1980adcdd59	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5697-a9a0-cdfe-0da2d117d114	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5697-a9a0-2b18-0a497cf8d46c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5697-a9a0-be2b-31da40991947	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5697-a9a0-e872-ccb760d089f0	Job-read	Branje opravil - samo zase - branje	t
00030000-5697-a9a0-ad2b-d6c7df8059b3	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5697-a9a0-6d46-9dd81c8c5a1d	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5697-a9a0-0dbc-4220858f77fe	Report-read	Report - branje	t
00030000-5697-a9a0-a95b-99a6d2e31991	Report-write	Report - spreminjanje	t
00030000-5697-a9a0-ab48-2829496b187f	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5697-a9a0-3b3f-bfef271daf0c	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5697-a9a0-6b6c-35b08b0ff5c9	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5697-a9a0-bdd2-e0fe627f897a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5697-a9a0-1789-1297fd36ae0b	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5697-a9a0-0b8f-ccbd7acf3791	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5697-a9a0-5ef2-71e9c1f35833	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5697-a9a0-dc95-3977cadfb990	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-a9a0-ac8a-5856c67b300b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-a9a0-1184-c3963050a4d5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-a9a0-e8ec-19ed2992f830	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-a9a0-afae-ff9a0f07f86f	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5697-a9a0-59bf-45857f7356ed	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5697-a9a0-17cd-987c5af7e64d	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3147 (class 0 OID 36356784)
-- Dependencies: 181
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5697-a9a1-fbd0-1d84e3aa9daa	00030000-5697-a9a0-6d91-b315916a1928
00020000-5697-a9a1-fbd0-1d84e3aa9daa	00030000-5697-a9a0-cf5f-0c7f64b29179
00020000-5697-a9a1-3cd2-59227c6cf712	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-7154-3d1030b183be
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-ac41-05dd78f32c94
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-ca20-1ad72239d01f
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-df6a-242649385343	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-b896-3e2de12f1d1a	00030000-5697-a9a0-ca20-1ad72239d01f
00020000-5697-a9a1-b896-3e2de12f1d1a	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-b896-3e2de12f1d1a	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-b896-3e2de12f1d1a	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-b896-3e2de12f1d1a	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-b896-3e2de12f1d1a	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-d4ae-5d4c685998c5	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-d4ae-5d4c685998c5	00030000-5697-a9a0-6896-b72b3cd07c37
00020000-5697-a9a1-d4ae-5d4c685998c5	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-d4ae-5d4c685998c5	00030000-5697-a9a0-44cd-9cac0d5e8a00
00020000-5697-a9a1-d4ae-5d4c685998c5	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-d4ae-5d4c685998c5	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-d4ae-5d4c685998c5	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-c204-1e2dcb452ed2	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-c204-1e2dcb452ed2	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-c204-1e2dcb452ed2	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-7636-d0fbbb903fb6	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-7636-d0fbbb903fb6	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-7636-d0fbbb903fb6	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-7636-d0fbbb903fb6	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-7636-d0fbbb903fb6	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-7636-d0fbbb903fb6	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-7636-d0fbbb903fb6	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-7636-d0fbbb903fb6	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-ee0a-f07effb7a503	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-ee0a-f07effb7a503	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-ee0a-f07effb7a503	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-ee0a-f07effb7a503	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-44cd-9cac0d5e8a00
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-1f33-f68046da72f3
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-7bfe-5ec9e44265f1
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-1a61-d22602bdffb4
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-e7f8-8d8953ff1d1e	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-5924-89b33c8cba5c	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-5924-89b33c8cba5c	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-5924-89b33c8cba5c	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-5924-89b33c8cba5c	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-5924-89b33c8cba5c	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-5924-89b33c8cba5c	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-5924-89b33c8cba5c	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-1a61-d22602bdffb4
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-7bfe-5ec9e44265f1
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-1f33-f68046da72f3
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-a262-6176ce3c7950
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-d512-f9eba027d4d5
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-3e41-78482815b7a8
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-1f3e-0ca673f2c566	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-587f-1d7077885769	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-397d-c6a243151823	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-397d-c6a243151823	00030000-5697-a9a0-29bb-f70163b012f9
00020000-5697-a9a1-f7a8-7904bfe0a947	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-b230-17dfc1be6e6c	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a1-b230-17dfc1be6e6c	00030000-5697-a9a0-cd1b-a182bdb692e6
00020000-5697-a9a1-57d7-0bdeb83a3981	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a1-0433-9e8a78e6acd6	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-0433-9e8a78e6acd6	00030000-5697-a9a0-dfcc-e0cc74916f29
00020000-5697-a9a1-9847-0fe09e3c2449	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-dcb6-50e8d5e5e608	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a1-dcb6-50e8d5e5e608	00030000-5697-a9a0-be2b-31da40991947
00020000-5697-a9a1-4e70-88eb424b25e5	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a1-f3ba-b6d292820d82	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a1-f3ba-b6d292820d82	00030000-5697-a9a0-cdfe-0da2d117d114
00020000-5697-a9a1-ece6-51d9ece50e3f	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a1-3b11-ee228529bff4	00030000-5697-a9a0-4faf-4ead50f00771
00020000-5697-a9a1-3b11-ee228529bff4	00030000-5697-a9a0-ec6e-22b28755da7e
00020000-5697-a9a1-c9f6-217abc1e03c6	00030000-5697-a9a0-4faf-4ead50f00771
00020000-5697-a9a1-cd11-6bcb11032a1d	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a1-cd11-6bcb11032a1d	00030000-5697-a9a0-1963-5245392bfc3b
00020000-5697-a9a1-cd11-6bcb11032a1d	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-cd11-6bcb11032a1d	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-cd11-6bcb11032a1d	00030000-5697-a9a0-7bfe-5ec9e44265f1
00020000-5697-a9a1-cd11-6bcb11032a1d	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-1dc1-f2af476a0b4b	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a1-1dc1-f2af476a0b4b	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-1dc1-f2af476a0b4b	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-ec49-8ba99a263c12	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-ec49-8ba99a263c12	00030000-5697-a9a0-a571-d0b8b36d042e
00020000-5697-a9a1-9b75-6f6445e73bf5	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-f85e-26b55fd818e8	00030000-5697-a9a0-069a-3c09f23e6282
00020000-5697-a9a1-f85e-26b55fd818e8	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-f85e-26b55fd818e8	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-f85e-26b55fd818e8	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-f85e-26b55fd818e8	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-f85e-26b55fd818e8	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-f85e-26b55fd818e8	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-f85e-26b55fd818e8	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-f85e-26b55fd818e8	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-b36e-55644f9d0533	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-b36e-55644f9d0533	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-b36e-55644f9d0533	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-b36e-55644f9d0533	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-b36e-55644f9d0533	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-5a41-d6c70f6a8d63	00030000-5697-a9a0-81f1-539a1c3eb647
00020000-5697-a9a1-5a41-d6c70f6a8d63	00030000-5697-a9a0-2a19-e56ec5507547
00020000-5697-a9a1-35ac-8eff081fe4ac	00030000-5697-a9a0-81f1-539a1c3eb647
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-af05-c5e4064874a6
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-1cb6-e323bd8d76b0
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-0f90-73e4f121d8a2
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-52d9-3cdee6bdd690
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-0962-9342db06ca22
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-59e3-b291ba07ece8
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-ad45-554777778a3b
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-2db1-83e07ddf3a31
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-8c04-39aa459c18f7
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-1311-f843c0a214a1
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-5b3f-2a6c6237bc94
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-107f-d5ae62fb67d4
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-27d2-90d619fc0d10
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-7d4f-ab7d578a97f6
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-6846-9b615b0a2b49
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-df0d-b7440fbdae88
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-3e69-f0841d2791a4
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-1eb0-cb51a48ea616
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-f86d-c2633b1b8ebf
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-27f7-4e49da24d521
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-6e5e-1883acb2921a
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-464f-37ec53dd23d6
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-3bdf-85f56faf7760
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-c23e-21bfc33cbc83
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-b245-6474576d5537
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-ad2b-d6c7df8059b3
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-6ded-39d7c69e1bab
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-5a0c-27a1a59df9a6
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-7192-c945090e0d63
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-e872-ccb760d089f0
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-8681-44151e6483ae	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-0f90-73e4f121d8a2
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-0962-9342db06ca22
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-ad45-554777778a3b
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-8c04-39aa459c18f7
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-5b3f-2a6c6237bc94
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-27d2-90d619fc0d10
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-6846-9b615b0a2b49
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-3e69-f0841d2791a4
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-f86d-c2633b1b8ebf
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-6e5e-1883acb2921a
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-5a0c-27a1a59df9a6
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-6ded-39d7c69e1bab
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-7192-c945090e0d63
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-e872-ccb760d089f0
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-5cd3-8694267edf52	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-7121-c5ebf92db376
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-8398-b4bbdb602fbb
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-14d1-23b4ce44f69e
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-062c-7400427e7037
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-5d3f-8267683ec3a8	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-532f-97567529bddc	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-c494-3a5ba05dce04	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-c494-3a5ba05dce04	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a1-c494-3a5ba05dce04	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-c494-3a5ba05dce04	00030000-5697-a9a0-14d1-23b4ce44f69e
00020000-5697-a9a1-c494-3a5ba05dce04	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-c494-3a5ba05dce04	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-c494-3a5ba05dce04	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-c494-3a5ba05dce04	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-8398-b4bbdb602fbb
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-44cd-9cac0d5e8a00
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-2711-41b8a345caf6
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-eff9-643289444c37
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-db24-2a5b409ee939	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-398d-c64ff5eceaea	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-14af-291628ece0aa	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-14af-291628ece0aa	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-14af-291628ece0aa	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-14af-291628ece0aa	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a1-14af-291628ece0aa	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-14af-291628ece0aa	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-14af-291628ece0aa	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-a775-5510bbcdbcc8	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-a775-5510bbcdbcc8	00030000-5697-a9a0-eff9-643289444c37
00020000-5697-a9a1-a775-5510bbcdbcc8	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-a775-5510bbcdbcc8	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-98ce-153217889628	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-98ce-153217889628	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-4faf-4ead50f00771
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-8398-b4bbdb602fbb
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-ca20-1ad72239d01f
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-7154-3d1030b183be
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-ac41-05dd78f32c94
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-6ded-39d7c69e1bab
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-c23e-21bfc33cbc83
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-14d1-23b4ce44f69e
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-062c-7400427e7037
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-e872-ccb760d089f0
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-ad2b-d6c7df8059b3
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-44cd-9cac0d5e8a00
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-2711-41b8a345caf6
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-7192-c945090e0d63
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-b245-6474576d5537
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-5a0c-27a1a59df9a6
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-3bdf-85f56faf7760
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-af05-c5e4064874a6
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-0f90-73e4f121d8a2
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-1cb6-e323bd8d76b0
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-52d9-3cdee6bdd690
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-0962-9342db06ca22
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-59e3-b291ba07ece8
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-ad45-554777778a3b
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-2db1-83e07ddf3a31
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-8c04-39aa459c18f7
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-1311-f843c0a214a1
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-5b3f-2a6c6237bc94
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-107f-d5ae62fb67d4
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-27d2-90d619fc0d10
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-7d4f-ab7d578a97f6
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-6846-9b615b0a2b49
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-df0d-b7440fbdae88
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-3e69-f0841d2791a4
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-1eb0-cb51a48ea616
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-f86d-c2633b1b8ebf
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-27f7-4e49da24d521
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-6e5e-1883acb2921a
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-464f-37ec53dd23d6
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-eff9-643289444c37
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-81f1-539a1c3eb647
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-7121-c5ebf92db376
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a1-016e-ba63025bc0e9	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-4faf-4ead50f00771
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-ca20-1ad72239d01f
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-7154-3d1030b183be
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-ac41-05dd78f32c94
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-81f1-539a1c3eb647
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a1-7801-c5ff47a137db	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-4faf-4ead50f00771
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-8398-b4bbdb602fbb
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-ca20-1ad72239d01f
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-7154-3d1030b183be
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-ac41-05dd78f32c94
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-14d1-23b4ce44f69e
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-062c-7400427e7037
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-81f1-539a1c3eb647
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-7121-c5ebf92db376
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a1-f549-bf927786e7e2	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-8398-b4bbdb602fbb
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-ca20-1ad72239d01f
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-7154-3d1030b183be
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-ac41-05dd78f32c94
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-6ded-39d7c69e1bab
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-c23e-21bfc33cbc83
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-14d1-23b4ce44f69e
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-062c-7400427e7037
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-e872-ccb760d089f0
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-ad2b-d6c7df8059b3
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-d512-f9eba027d4d5
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-44cd-9cac0d5e8a00
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-2711-41b8a345caf6
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-a262-6176ce3c7950
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-7192-c945090e0d63
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-b245-6474576d5537
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-7bfe-5ec9e44265f1
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-5a0c-27a1a59df9a6
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-3bdf-85f56faf7760
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-3e41-78482815b7a8
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-af05-c5e4064874a6
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-0f90-73e4f121d8a2
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-1cb6-e323bd8d76b0
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-52d9-3cdee6bdd690
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-0962-9342db06ca22
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-59e3-b291ba07ece8
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-ad45-554777778a3b
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-2db1-83e07ddf3a31
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-8c04-39aa459c18f7
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-1311-f843c0a214a1
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-5b3f-2a6c6237bc94
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-107f-d5ae62fb67d4
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-27d2-90d619fc0d10
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-7d4f-ab7d578a97f6
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-6846-9b615b0a2b49
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-df0d-b7440fbdae88
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-3e69-f0841d2791a4
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-1eb0-cb51a48ea616
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-f86d-c2633b1b8ebf
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-27f7-4e49da24d521
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-6e5e-1883acb2921a
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-464f-37ec53dd23d6
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-eff9-643289444c37
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-1a61-d22602bdffb4
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-1f33-f68046da72f3
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-7121-c5ebf92db376
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-6896-b72b3cd07c37
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a1-d680-9df034f991ba	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-4faf-4ead50f00771
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-8398-b4bbdb602fbb
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-ca20-1ad72239d01f
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-7154-3d1030b183be
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-ac41-05dd78f32c94
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-14d1-23b4ce44f69e
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-062c-7400427e7037
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-d512-f9eba027d4d5
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-44cd-9cac0d5e8a00
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-a262-6176ce3c7950
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-7bfe-5ec9e44265f1
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-3e41-78482815b7a8
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-1a61-d22602bdffb4
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-81f1-539a1c3eb647
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-1f33-f68046da72f3
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-7121-c5ebf92db376
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-6896-b72b3cd07c37
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a1-0ddd-20a19968873e	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-4faf-4ead50f00771
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-ca20-1ad72239d01f
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-14d1-23b4ce44f69e
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-81f1-539a1c3eb647
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a1-4c5a-e0977c411d89	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-4faf-4ead50f00771
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-8398-b4bbdb602fbb
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-6ded-39d7c69e1bab
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-c23e-21bfc33cbc83
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-e872-ccb760d089f0
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-ad2b-d6c7df8059b3
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-d512-f9eba027d4d5
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-069a-3c09f23e6282
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-44cd-9cac0d5e8a00
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-2711-41b8a345caf6
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-a262-6176ce3c7950
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-7192-c945090e0d63
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-b245-6474576d5537
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-7bfe-5ec9e44265f1
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-5a0c-27a1a59df9a6
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-3bdf-85f56faf7760
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-3e41-78482815b7a8
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-af05-c5e4064874a6
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-0f90-73e4f121d8a2
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-1cb6-e323bd8d76b0
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-52d9-3cdee6bdd690
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-0962-9342db06ca22
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-59e3-b291ba07ece8
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-ad45-554777778a3b
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-2db1-83e07ddf3a31
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-8c04-39aa459c18f7
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-1311-f843c0a214a1
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-5b3f-2a6c6237bc94
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-107f-d5ae62fb67d4
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-27d2-90d619fc0d10
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-7d4f-ab7d578a97f6
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-6846-9b615b0a2b49
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-df0d-b7440fbdae88
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-3e69-f0841d2791a4
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-1eb0-cb51a48ea616
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-f86d-c2633b1b8ebf
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-27f7-4e49da24d521
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-6e5e-1883acb2921a
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-464f-37ec53dd23d6
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-eff9-643289444c37
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-1a61-d22602bdffb4
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-81f1-539a1c3eb647
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-1f33-f68046da72f3
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-a571-d0b8b36d042e
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-6896-b72b3cd07c37
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a1-5759-1a03e06c6229	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-cf5f-0c7f64b29179
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6d91-b315916a1928
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-4faf-4ead50f00771
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ec6e-22b28755da7e
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-8398-b4bbdb602fbb
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-0d5d-91122bcc3f6a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-da55-96096f1415ec
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-2167-6404e1949fd6
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-d780-c6c5473718f6
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ca20-1ad72239d01f
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-7154-3d1030b183be
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ed19-032cc8788beb
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ac41-05dd78f32c94
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-0633-abd74da53263
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-0346-3a852438b533
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ee47-dd8bc09ae73e
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1ce2-53bafa73628a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-adcc-0c33809224c5
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-a6ff-112440e08e8e
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-7405-27f683f4df02
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-e83e-f80c8c84005a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-8238-8bd37d0c6a0d
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6ded-39d7c69e1bab
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-c23e-21bfc33cbc83
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-17ce-95d0e604188b
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-dfcc-e0cc74916f29
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-309d-19d51a90607d
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-7828-f1a09eedd54a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-062c-7400427e7037
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-14d1-23b4ce44f69e
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-7439-51017ed3ceda
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1d08-63b6981e8360
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6d46-9dd81c8c5a1d
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-e872-ccb760d089f0
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ad2b-d6c7df8059b3
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-e624-8b30e344a204
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-d512-f9eba027d4d5
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-b04e-45d9979be015
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-3330-df9b6efe0479
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-5ef2-71e9c1f35833
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-0b8f-ccbd7acf3791
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-3b3f-bfef271daf0c
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6b6c-35b08b0ff5c9
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-bdd2-e0fe627f897a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1789-1297fd36ae0b
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-8e82-f728a2d76544
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6fd3-b1f0db627331
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-8748-4a270509958f
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1fa2-137aee0bc2c0
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1bc4-cf5bf13953f2
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-b542-16edd8167900
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1309-fbc50a679c8f
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-069a-3c09f23e6282
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-44cd-9cac0d5e8a00
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-8b38-d366aee39f55
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-d1d8-02aadadabe06
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-dc2f-62a19bdde975
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-65d2-cab87d2526b8
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-2711-41b8a345caf6
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-a262-6176ce3c7950
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-12be-0b424fb4ddb3
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-7192-c945090e0d63
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-b245-6474576d5537
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-59f6-19fe3f67fecb
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-b75f-c752d84b27da
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-cd1b-a182bdb692e6
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-7bfe-5ec9e44265f1
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-de7c-dd8d4362b39a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-4331-13ae85609f7b
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-4d48-851f9eee8c5a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-238f-b842df92ad45
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-9e75-c31ae896e41a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1e1c-7d8cea88d08d
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-5a0c-27a1a59df9a6
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-3bdf-85f56faf7760
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-80ed-2635b327e0a3
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-3e41-78482815b7a8
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-af05-c5e4064874a6
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-0f90-73e4f121d8a2
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1cb6-e323bd8d76b0
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-52d9-3cdee6bdd690
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-0962-9342db06ca22
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-59e3-b291ba07ece8
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ad45-554777778a3b
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-2db1-83e07ddf3a31
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-8c04-39aa459c18f7
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1311-f843c0a214a1
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-5b3f-2a6c6237bc94
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-107f-d5ae62fb67d4
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-27d2-90d619fc0d10
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-7d4f-ab7d578a97f6
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6846-9b615b0a2b49
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-df0d-b7440fbdae88
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-3e69-f0841d2791a4
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1eb0-cb51a48ea616
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-f86d-c2633b1b8ebf
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-27f7-4e49da24d521
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6e5e-1883acb2921a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-464f-37ec53dd23d6
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ee5c-b62ea8542494
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1963-5245392bfc3b
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-c927-9377f7ef2a85
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-a0d3-faa09a548d5e
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-cbb4-0d870091af5b
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-0904-4e95f9accc6a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-9e44-24bca8cd7c80
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-5102-cd5b2becf82c
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-10cb-c2734b6b3940
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-4ce7-a538e064af5d
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-0dbc-4220858f77fe
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-a95b-99a6d2e31991
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-c2ae-3c80d5f90966
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-b339-a93105fa7ee9
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6b7b-98a36801b749
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-08bc-5fa6160aa621
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-f94d-8b7169859d0f
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-31e1-9c35b0c38cb3
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-b1bd-1d9ae4ad547c
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-fb35-0a109b9a5f63
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6bbe-e6da821f54e4
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1053-75a3dcab5b24
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ab48-2829496b187f
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-eff9-643289444c37
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1a61-d22602bdffb4
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-9f15-e94dc91a353f
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-be5d-b62406b03832
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-d45c-a0a9b874db02
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-8cc6-4a591963bf72
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-3e17-09826425f575
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-b8fb-2ddaa0fc152c
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-29bb-f70163b012f9
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-e6a8-ed1efc740e30
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-c0a0-9e963c52e834
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-81f1-539a1c3eb647
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-2a19-e56ec5507547
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1f33-f68046da72f3
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-7121-c5ebf92db376
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-a705-6aa0b3f4e54e
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-45ba-e17e23fe3947
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-fca2-5eca17a72d08
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-7718-47d3e5802146
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-9bb4-20120348d89a
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-a571-d0b8b36d042e
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-59bf-45857f7356ed
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-afae-ff9a0f07f86f
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6896-b72b3cd07c37
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-6335-4439d08bab82
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-cd05-285ab442edcc
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-1a8b-e1980adcdd59
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-cdfe-0da2d117d114
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-2b18-0a497cf8d46c
00020000-5697-a9a3-b89c-05f0e165f230	00030000-5697-a9a0-be2b-31da40991947
00020000-5697-a9a3-18fd-fac062ddf4f4	00030000-5697-a9a0-e8ec-19ed2992f830
00020000-5697-a9a3-322f-02766ed10cad	00030000-5697-a9a0-1184-c3963050a4d5
00020000-5697-a9a3-6ce3-ccf29e5dcdde	00030000-5697-a9a0-7121-c5ebf92db376
00020000-5697-a9a3-f23b-15b8a5ffde6e	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a3-ad9f-209d8098327e	00030000-5697-a9a0-6b6c-35b08b0ff5c9
00020000-5697-a9a3-9f20-88b17ee5dd62	00030000-5697-a9a0-bdd2-e0fe627f897a
00020000-5697-a9a3-ad5e-43eba10199a2	00030000-5697-a9a0-1789-1297fd36ae0b
00020000-5697-a9a3-5040-8eb5487fff6b	00030000-5697-a9a0-3b3f-bfef271daf0c
00020000-5697-a9a3-5c50-feb5849f8aaa	00030000-5697-a9a0-5ef2-71e9c1f35833
00020000-5697-a9a3-fc06-8350d07a8b3d	00030000-5697-a9a0-0b8f-ccbd7acf3791
00020000-5697-a9a3-b4eb-9c592389e8a0	00030000-5697-a9a0-ac8a-5856c67b300b
00020000-5697-a9a3-a9f0-d6608ae1fa16	00030000-5697-a9a0-dc95-3977cadfb990
00020000-5697-a9a3-b765-0986ab1774a6	00030000-5697-a9a0-51de-7619a3e2db72
00020000-5697-a9a3-b001-5da942dbf33a	00030000-5697-a9a0-36c2-2a9f1049379e
00020000-5697-a9a3-2d13-34a63796bb07	00030000-5697-a9a0-44cd-9cac0d5e8a00
00020000-5697-a9a3-5927-09e1af8832bf	00030000-5697-a9a0-5014-3b589f21d6aa
00020000-5697-a9a3-cf8a-034306f47bd2	00030000-5697-a9a0-581d-cd36cf94d6a0
00020000-5697-a9a3-b504-83622203ad36	00030000-5697-a9a0-17cd-987c5af7e64d
00020000-5697-a9a3-b9ac-225ea06c898d	00030000-5697-a9a0-8f34-00e7c5a3509d
00020000-5697-a9a3-b9ac-225ea06c898d	00030000-5697-a9a0-a262-6176ce3c7950
00020000-5697-a9a3-b9ac-225ea06c898d	00030000-5697-a9a0-a938-6d14d495ddaf
00020000-5697-a9a3-53be-678d09cba9b7	00030000-5697-a9a0-316c-1ed928bfa089
00020000-5697-a9a3-066a-186aaa2b1bb4	00030000-5697-a9a0-1f33-f68046da72f3
00020000-5697-a9a3-7245-ce7b1455f7a8	00030000-5697-a9a0-ab48-2829496b187f
00020000-5697-a9a3-15b6-e79ba36c5949	00030000-5697-a9a0-c5fe-390c8d2eb852
00020000-5697-a9a3-11c0-2b0b0640d310	00030000-5697-a9a0-1a61-d22602bdffb4
00020000-5697-a9a3-18e3-c886df2f49f9	00030000-5697-a9a0-b261-f8d0c6ebdad2
00020000-5697-a9a3-5c6f-d6f11661cbc7	00030000-5697-a9a0-7bfe-5ec9e44265f1
00020000-5697-a9a3-7e86-236afe263c1d	00030000-5697-a9a0-dbde-00113cc898a6
00020000-5697-a9a3-76b3-8a2ae27960f2	00030000-5697-a9a0-6896-b72b3cd07c37
00020000-5697-a9a3-f81e-cb68e6eb6cb1	00030000-5697-a9a0-ea44-040c30ae0f17
00020000-5697-a9a3-1bd9-b8bbb29d46fd	00030000-5697-a9a0-2711-41b8a345caf6
00020000-5697-a9a3-c175-b421ce37f1b1	00030000-5697-a9a0-e1a7-f051b8f0030f
00020000-5697-a9a3-d00d-7fa3184dc6db	00030000-5697-a9a0-eff9-643289444c37
00020000-5697-a9a3-e57e-b4037a960aee	00030000-5697-a9a0-0c3f-567e9a65e949
00020000-5697-a9a3-fca9-82a8d3c3ad2d	00030000-5697-a9a0-8199-2da14ed7b3ad
00020000-5697-a9a3-1827-7197733991ce	00030000-5697-a9a0-8398-b4bbdb602fbb
00020000-5697-a9a3-f0dd-daae59617f6f	00030000-5697-a9a0-5e6e-3359f1a55eed
00020000-5697-a9a3-6344-e99b7f4e11da	00030000-5697-a9a0-14d1-23b4ce44f69e
00020000-5697-a9a3-88d4-fe7e833d1c0a	00030000-5697-a9a0-062c-7400427e7037
\.


--
-- TOC entry 3187 (class 0 OID 36357191)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 36357225)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 36357358)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5697-a9a4-1c04-b3bdf4184c9a	00090000-5697-a9a4-794c-9c4485adbe16	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5697-a9a4-c1b7-ff3e687303e2	00090000-5697-a9a4-097b-c439560cc42c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5697-a9a4-130a-cea59919703c	00090000-5697-a9a4-961f-322f5a2c8cc4	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5697-a9a4-1c49-37434d889c9f	00090000-5697-a9a4-5350-bb8dc04e0504	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3155 (class 0 OID 36356866)
-- Dependencies: 189
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5697-a9a4-130e-dce3fc24342f	\N	00040000-5697-a9a0-09f9-9f9c8d6c30ab	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-a9a4-1085-c826777edfe7	\N	00040000-5697-a9a0-09f9-9f9c8d6c30ab	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5697-a9a4-1cc8-645cc570b8db	\N	00040000-5697-a9a0-09f9-9f9c8d6c30ab	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-a9a4-f083-fc77a41acbf7	\N	00040000-5697-a9a0-09f9-9f9c8d6c30ab	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-a9a4-dbaf-055cb507c37d	\N	00040000-5697-a9a0-09f9-9f9c8d6c30ab	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-a9a4-4e39-eeee4a83725c	\N	00040000-5697-a9a0-a353-c9ac9b33fe2d	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-a9a4-0b7f-47efcf0987fa	\N	00040000-5697-a9a0-516b-64a940812c90	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-a9a4-d7de-5d52028a653b	\N	00040000-5697-a9a0-9cd8-702128a7098c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-a9a4-b922-e3ea769285da	\N	00040000-5697-a9a0-28a6-daf4f60d68df	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-a9a6-ff88-e2c9f5ab74e3	\N	00040000-5697-a9a0-09f9-9f9c8d6c30ab	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3158 (class 0 OID 36356911)
-- Dependencies: 192
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5697-a99f-bbfc-94e7a57b262e	8341	Adlešiči
00050000-5697-a99f-68de-c30246ab23ed	5270	Ajdovščina
00050000-5697-a99f-204a-7cbc3ebc92ef	6280	Ankaran/Ancarano
00050000-5697-a99f-d8ac-14c251be7eaf	9253	Apače
00050000-5697-a99f-2ad5-09b7ab3a9787	8253	Artiče
00050000-5697-a99f-c8b0-991b1b38f5df	4275	Begunje na Gorenjskem
00050000-5697-a99f-cfb3-a44b2e573fa4	1382	Begunje pri Cerknici
00050000-5697-a99f-d96a-bef3248b47bf	9231	Beltinci
00050000-5697-a99f-539b-452bf5d6b759	2234	Benedikt
00050000-5697-a99f-ca65-75b33e8b8e54	2345	Bistrica ob Dravi
00050000-5697-a99f-a6c3-6db4f8478920	3256	Bistrica ob Sotli
00050000-5697-a99f-aa4b-bdab2c484cdb	8259	Bizeljsko
00050000-5697-a99f-d668-b53402672a01	1223	Blagovica
00050000-5697-a99f-b590-6607ff76c4a1	8283	Blanca
00050000-5697-a99f-214b-f562e6c5db83	4260	Bled
00050000-5697-a99f-8c33-34174cb45637	4273	Blejska Dobrava
00050000-5697-a99f-fc70-fb8179146d96	9265	Bodonci
00050000-5697-a99f-dc3f-c8890d4f5b6a	9222	Bogojina
00050000-5697-a99f-babf-62e125007470	4263	Bohinjska Bela
00050000-5697-a99f-6874-c06961adea95	4264	Bohinjska Bistrica
00050000-5697-a99f-208b-84df041f4def	4265	Bohinjsko jezero
00050000-5697-a99f-eb0a-1dac64fead88	1353	Borovnica
00050000-5697-a99f-1d20-d3213d8bfd51	8294	Boštanj
00050000-5697-a99f-8d25-b1a52b5d68e4	5230	Bovec
00050000-5697-a99f-6db3-c5320da97a87	5295	Branik
00050000-5697-a99f-97d8-552d18aaa034	3314	Braslovče
00050000-5697-a99f-7b5d-e41c074c98fe	5223	Breginj
00050000-5697-a99f-76aa-475406229fbc	8280	Brestanica
00050000-5697-a99f-f964-b3d25ce97dae	2354	Bresternica
00050000-5697-a99f-f4c0-11aa079d8acd	4243	Brezje
00050000-5697-a99f-cdbf-0ca874402d1e	1351	Brezovica pri Ljubljani
00050000-5697-a99f-6fad-5e6fccbdb235	8250	Brežice
00050000-5697-a99f-c24c-9282eb89848d	4210	Brnik - Aerodrom
00050000-5697-a99f-d9b1-401141e186f2	8321	Brusnice
00050000-5697-a99f-028d-2dce42b5dd59	3255	Buče
00050000-5697-a99f-432d-8636b110b8e3	8276	Bučka 
00050000-5697-a99f-c51f-581d5621a83e	9261	Cankova
00050000-5697-a99f-028d-2e09503cd82e	3000	Celje 
00050000-5697-a99f-7b5e-c154ffe72471	3001	Celje - poštni predali
00050000-5697-a99f-04a4-4d49f1aa37e2	4207	Cerklje na Gorenjskem
00050000-5697-a99f-ce3d-486a9f8b2f64	8263	Cerklje ob Krki
00050000-5697-a99f-82f9-e96dbe5ad550	1380	Cerknica
00050000-5697-a99f-78ae-f8a3566182d5	5282	Cerkno
00050000-5697-a99f-8a64-4410ad63ce90	2236	Cerkvenjak
00050000-5697-a99f-bfc4-14d18515dd8f	2215	Ceršak
00050000-5697-a99f-c807-2cdef93d7a82	2326	Cirkovce
00050000-5697-a99f-f1a5-58c9a8090c46	2282	Cirkulane
00050000-5697-a99f-1f29-a08824a01c64	5273	Col
00050000-5697-a99f-0bfe-5bc3f38ecf95	8251	Čatež ob Savi
00050000-5697-a99f-b124-5602136ab3a8	1413	Čemšenik
00050000-5697-a99f-8361-aa474f77bc4e	5253	Čepovan
00050000-5697-a99f-f780-cf8ef2873a97	9232	Črenšovci
00050000-5697-a99f-12be-30e3d4e05fb9	2393	Črna na Koroškem
00050000-5697-a99f-8060-d01eca204952	6275	Črni Kal
00050000-5697-a99f-18c0-34c4221bc7d2	5274	Črni Vrh nad Idrijo
00050000-5697-a99f-75c9-6623de4ee969	5262	Črniče
00050000-5697-a99f-54f3-a6b74a05615c	8340	Črnomelj
00050000-5697-a99f-3d6b-0dd745e647b1	6271	Dekani
00050000-5697-a99f-847e-c8e7e6eac331	5210	Deskle
00050000-5697-a99f-e25f-e9b042fa9f92	2253	Destrnik
00050000-5697-a99f-540c-ae924cf3acb5	6215	Divača
00050000-5697-a99f-7dfd-de3410f0e5fa	1233	Dob
00050000-5697-a99f-1087-e45843064f46	3224	Dobje pri Planini
00050000-5697-a99f-367c-6242aac1ae15	8257	Dobova
00050000-5697-a99f-14fa-11fa1d0d08bd	1423	Dobovec
00050000-5697-a99f-be6c-f43093afa480	5263	Dobravlje
00050000-5697-a99f-e5bd-e56ad1725858	3204	Dobrna
00050000-5697-a99f-ddae-60b3459c2109	8211	Dobrnič
00050000-5697-a99f-0946-3cd297a84b63	1356	Dobrova
00050000-5697-a99f-2e3a-b431d742a26f	9223	Dobrovnik/Dobronak 
00050000-5697-a99f-70cf-780e07d0f014	5212	Dobrovo v Brdih
00050000-5697-a99f-715a-d09da635b7c7	1431	Dol pri Hrastniku
00050000-5697-a99f-2a6d-03cddcb15c2d	1262	Dol pri Ljubljani
00050000-5697-a99f-46ba-a46c185a69c4	1273	Dole pri Litiji
00050000-5697-a99f-3927-c93db4a64249	1331	Dolenja vas
00050000-5697-a99f-23e8-28228f70bd5c	8350	Dolenjske Toplice
00050000-5697-a99f-dffd-b17366439993	1230	Domžale
00050000-5697-a99f-f121-ca9ba8f8ec15	2252	Dornava
00050000-5697-a99f-3d02-d5098e2ebf15	5294	Dornberk
00050000-5697-a99f-a893-366bf8e85468	1319	Draga
00050000-5697-a99f-53b4-17c4729393e7	8343	Dragatuš
00050000-5697-a99f-2db7-7d3015ba4202	3222	Dramlje
00050000-5697-a99f-4b3e-cfd43b98f4fe	2370	Dravograd
00050000-5697-a99f-ded6-47cc8b7ea658	4203	Duplje
00050000-5697-a99f-40c1-010b826a0c9b	6221	Dutovlje
00050000-5697-a99f-288b-39bb79ab7e28	8361	Dvor
00050000-5697-a99f-dd76-2306baaaa483	2343	Fala
00050000-5697-a99f-ec05-42e60a6edb4c	9208	Fokovci
00050000-5697-a99f-daa5-783506b35329	2313	Fram
00050000-5697-a99f-1f64-b191f895af24	3213	Frankolovo
00050000-5697-a99f-78e9-d9c89f78c1aa	1274	Gabrovka
00050000-5697-a99f-fc9f-4695e253fb93	8254	Globoko
00050000-5697-a99f-a043-fd6630e7c553	5275	Godovič
00050000-5697-a99f-3a2a-8b756724ee81	4204	Golnik
00050000-5697-a99f-1e67-0ef55fd83b36	3303	Gomilsko
00050000-5697-a99f-a229-9e9b7e722e55	4224	Gorenja vas
00050000-5697-a99f-852d-2e0aee4c68ad	3263	Gorica pri Slivnici
00050000-5697-a99f-21fe-9107e6e5d1eb	2272	Gorišnica
00050000-5697-a99f-04f2-48a27adb07ba	9250	Gornja Radgona
00050000-5697-a99f-a466-81ffd2dc2ca5	3342	Gornji Grad
00050000-5697-a99f-bc71-d52c43b728ce	4282	Gozd Martuljek
00050000-5697-a99f-5523-e9d56aa70d04	6272	Gračišče
00050000-5697-a99f-3329-4402cdb0ff01	9264	Grad
00050000-5697-a99f-2851-ac6055050671	8332	Gradac
00050000-5697-a99f-4a5d-82386ab95351	1384	Grahovo
00050000-5697-a99f-553c-e8e3b1f62245	5242	Grahovo ob Bači
00050000-5697-a99f-f894-f011eff8c966	5251	Grgar
00050000-5697-a99f-bd0e-cccd9e548b42	3302	Griže
00050000-5697-a99f-5a50-b0d939623081	3231	Grobelno
00050000-5697-a99f-e70a-30d4416c634e	1290	Grosuplje
00050000-5697-a99f-cbdb-e5e148cab8de	2288	Hajdina
00050000-5697-a99f-de20-a06361b2f333	8362	Hinje
00050000-5697-a99f-0eba-66e32012f73c	2311	Hoče
00050000-5697-a99f-6ba7-0e63644250eb	9205	Hodoš/Hodos
00050000-5697-a99f-e7ee-c0cc0ec9280a	1354	Horjul
00050000-5697-a99f-1a5e-3bd89de5fa4f	1372	Hotedršica
00050000-5697-a99f-3f00-2e0c6224f3d7	1430	Hrastnik
00050000-5697-a99f-7a93-de84a4bcddbf	6225	Hruševje
00050000-5697-a99f-1814-20a0b4faf82b	4276	Hrušica
00050000-5697-a99f-2a95-7051332e1d25	5280	Idrija
00050000-5697-a99f-6be6-744ea5e04ff5	1292	Ig
00050000-5697-a99f-8e5e-5ce5a891726f	6250	Ilirska Bistrica
00050000-5697-a99f-a74e-58ed778514cc	6251	Ilirska Bistrica-Trnovo
00050000-5697-a99f-68de-e4e934c84f68	1295	Ivančna Gorica
00050000-5697-a99f-1cfb-424c398a0538	2259	Ivanjkovci
00050000-5697-a99f-11f9-f49a925be684	1411	Izlake
00050000-5697-a99f-36f3-4f778661dbdb	6310	Izola/Isola
00050000-5697-a99f-cc60-1cd551e58154	2222	Jakobski Dol
00050000-5697-a99f-3b79-ad25e22837ab	2221	Jarenina
00050000-5697-a99f-f928-addc267d4746	6254	Jelšane
00050000-5697-a99f-7ab1-88c59c3aaf26	4270	Jesenice
00050000-5697-a99f-86c2-fc9a92fef8f3	8261	Jesenice na Dolenjskem
00050000-5697-a99f-3e92-259638528774	3273	Jurklošter
00050000-5697-a99f-c275-3ad810715b71	2223	Jurovski Dol
00050000-5697-a99f-8fe8-e6c17823a107	2256	Juršinci
00050000-5697-a99f-ce1e-beab2ac18614	5214	Kal nad Kanalom
00050000-5697-a99f-cc11-5c4f3ee97150	3233	Kalobje
00050000-5697-a99f-86cd-a351f141bc78	4246	Kamna Gorica
00050000-5697-a99f-19ca-6d71e29093a7	2351	Kamnica
00050000-5697-a99f-bb46-c18d93dec88b	1241	Kamnik
00050000-5697-a99f-3e14-1a3e94dc93c7	5213	Kanal
00050000-5697-a99f-5880-7d520bd68917	8258	Kapele
00050000-5697-a99f-00b0-795620ec3ca3	2362	Kapla
00050000-5697-a99f-d423-8ddeba6f4957	2325	Kidričevo
00050000-5697-a99f-3eee-1c3a0a709615	1412	Kisovec
00050000-5697-a99f-cfb7-e913ee83d4ef	6253	Knežak
00050000-5697-a99f-6188-e555e21f4cef	5222	Kobarid
00050000-5697-a99f-d361-a8bd736fe9b3	9227	Kobilje
00050000-5697-a99f-de4f-9c6c574aeca2	1330	Kočevje
00050000-5697-a99f-0bc7-8b9e0fc33b31	1338	Kočevska Reka
00050000-5697-a99f-befc-2b52d201f690	2276	Kog
00050000-5697-a99f-9f89-4817367630b9	5211	Kojsko
00050000-5697-a99f-5985-f88a50e81961	6223	Komen
00050000-5697-a99f-cab4-a9da9f9ac343	1218	Komenda
00050000-5697-a99f-71c3-0dacac2ff603	6000	Koper/Capodistria 
00050000-5697-a99f-56b6-24c2fa88cecb	6001	Koper/Capodistria - poštni predali
00050000-5697-a99f-e3b1-4c4a625c8e90	8282	Koprivnica
00050000-5697-a99f-61cc-7ce2164f9da3	5296	Kostanjevica na Krasu
00050000-5697-a99f-9b09-19540f1bcc12	8311	Kostanjevica na Krki
00050000-5697-a99f-85b2-8c245e401289	1336	Kostel
00050000-5697-a99f-4373-4386da379f84	6256	Košana
00050000-5697-a99f-d048-967c59933c96	2394	Kotlje
00050000-5697-a99f-673e-befa6d5ea8a9	6240	Kozina
00050000-5697-a99f-49a8-8bdc245ad711	3260	Kozje
00050000-5697-a99f-9306-9105833bfb69	4000	Kranj 
00050000-5697-a99f-d1fa-dac755fbde7d	4001	Kranj - poštni predali
00050000-5697-a99f-2e8d-d64b701a9059	4280	Kranjska Gora
00050000-5697-a99f-f3a9-4bed546f51a6	1281	Kresnice
00050000-5697-a99f-aad9-f452f3b7bb0c	4294	Križe
00050000-5697-a99f-398b-79bab8b834b2	9206	Križevci
00050000-5697-a99f-8fc1-cda1d39eaaa0	9242	Križevci pri Ljutomeru
00050000-5697-a99f-8792-d520837de092	1301	Krka
00050000-5697-a99f-4ba0-9b4cbd7838ab	8296	Krmelj
00050000-5697-a99f-930c-c07e50480f59	4245	Kropa
00050000-5697-a99f-e5fa-66b18319cd5b	8262	Krška vas
00050000-5697-a99f-956d-157896912e83	8270	Krško
00050000-5697-a99f-b677-848af2d8f808	9263	Kuzma
00050000-5697-a99f-a379-99e50a914f4b	2318	Laporje
00050000-5697-a99f-7e5e-050cf760bcf9	3270	Laško
00050000-5697-a99f-cc27-aa7495fe185e	1219	Laze v Tuhinju
00050000-5697-a99f-b7c3-77b882d391fa	2230	Lenart v Slovenskih goricah
00050000-5697-a99f-ff71-f2ae5efc6208	9220	Lendava/Lendva
00050000-5697-a99f-f9dc-231ec2d29aba	4248	Lesce
00050000-5697-a99f-00ac-1c4b4105908f	3261	Lesično
00050000-5697-a99f-624a-03be1d3e3529	8273	Leskovec pri Krškem
00050000-5697-a99f-84e6-b8652ffce214	2372	Libeliče
00050000-5697-a99f-41ac-2a720d1ba7ae	2341	Limbuš
00050000-5697-a99f-8dee-f48d69cbbd23	1270	Litija
00050000-5697-a99f-46b1-31163817a18f	3202	Ljubečna
00050000-5697-a99f-2b05-6e9637fb7a08	1000	Ljubljana 
00050000-5697-a99f-4eca-c6a2b81f9f95	1001	Ljubljana - poštni predali
00050000-5697-a99f-72fb-a9c0f872f825	1231	Ljubljana - Črnuče
00050000-5697-a99f-ea24-5fd99d9b0be9	1261	Ljubljana - Dobrunje
00050000-5697-a99f-fb77-b4a9511a2dd1	1260	Ljubljana - Polje
00050000-5697-a99f-912d-801dc083f0b4	1210	Ljubljana - Šentvid
00050000-5697-a99f-3d1f-8fa75ec66405	1211	Ljubljana - Šmartno
00050000-5697-a99f-e0bd-fa49c92930a4	3333	Ljubno ob Savinji
00050000-5697-a99f-ee74-bb3dd2ab4bb0	9240	Ljutomer
00050000-5697-a99f-5988-894483e8cea8	3215	Loče
00050000-5697-a99f-5b65-d35a8a18537c	5231	Log pod Mangartom
00050000-5697-a99f-47e9-b98c8093d9c8	1358	Log pri Brezovici
00050000-5697-a99f-bac8-a870bd73ac5c	1370	Logatec
00050000-5697-a99f-f73d-f865fff43a89	1371	Logatec
00050000-5697-a99f-343e-06581d4c70bd	1434	Loka pri Zidanem Mostu
00050000-5697-a99f-2ef2-76dd08b3ec3f	3223	Loka pri Žusmu
00050000-5697-a99f-9b65-77b1746594f5	6219	Lokev
00050000-5697-a99f-bcd9-0af0d667521c	1318	Loški Potok
00050000-5697-a99f-9238-45d17be8e0d2	2324	Lovrenc na Dravskem polju
00050000-5697-a99f-7e3e-81fbc7eaa9f5	2344	Lovrenc na Pohorju
00050000-5697-a99f-4580-0135755aec69	3334	Luče
00050000-5697-a99f-19df-5e90b6903e85	1225	Lukovica
00050000-5697-a99f-86a3-68dc02be995b	9202	Mačkovci
00050000-5697-a99f-50af-5844982188fd	2322	Majšperk
00050000-5697-a99f-8bca-19b84319fa1e	2321	Makole
00050000-5697-a99f-005d-c8898340896b	9243	Mala Nedelja
00050000-5697-a99f-e10e-aa3cacc197ff	2229	Malečnik
00050000-5697-a99f-24e8-254ecf0290e6	6273	Marezige
00050000-5697-a99f-745a-5cf4cc01ba96	2000	Maribor 
00050000-5697-a99f-c5ab-aea5af097624	2001	Maribor - poštni predali
00050000-5697-a99f-0d7a-fd0ed0b565a8	2206	Marjeta na Dravskem polju
00050000-5697-a99f-f9a6-6c9c5502bb35	2281	Markovci
00050000-5697-a99f-c4e5-fe43f9736f35	9221	Martjanci
00050000-5697-a99f-582c-4692d687c217	6242	Materija
00050000-5697-a99f-3d3f-202718d8d1e6	4211	Mavčiče
00050000-5697-a99f-b154-c2db20802208	1215	Medvode
00050000-5697-a99f-8d68-eaed914f456a	1234	Mengeš
00050000-5697-a99f-38ca-687879afa23d	8330	Metlika
00050000-5697-a99f-533e-7c1da5d2c9c8	2392	Mežica
00050000-5697-a99f-d6c6-bfebc190abea	2204	Miklavž na Dravskem polju
00050000-5697-a99f-4857-7494dc32c33f	2275	Miklavž pri Ormožu
00050000-5697-a99f-bc29-8c85c94e0804	5291	Miren
00050000-5697-a99f-bc53-64d6ff3d0345	8233	Mirna
00050000-5697-a99f-71db-da92964ed696	8216	Mirna Peč
00050000-5697-a99f-8e4c-d7a76f404aa7	2382	Mislinja
00050000-5697-a99f-313a-4a206dccc77f	4281	Mojstrana
00050000-5697-a99f-f1d0-ae4db9623a80	8230	Mokronog
00050000-5697-a99f-46d9-88f24a55155b	1251	Moravče
00050000-5697-a99f-ef37-57bd31b9c471	9226	Moravske Toplice
00050000-5697-a99f-7146-26b370b1f62a	5216	Most na Soči
00050000-5697-a99f-5f15-b47276cf8cc8	1221	Motnik
00050000-5697-a99f-f002-aaabd7763ade	3330	Mozirje
00050000-5697-a99f-4f59-7be7d1f46b4d	9000	Murska Sobota 
00050000-5697-a99f-3956-2b868dfcb76f	9001	Murska Sobota - poštni predali
00050000-5697-a99f-af94-e68e023aa181	2366	Muta
00050000-5697-a99f-4972-c28d71523d7e	4202	Naklo
00050000-5697-a99f-f8d2-80ca10282c5f	3331	Nazarje
00050000-5697-a99f-dc10-fa937161ee9b	1357	Notranje Gorice
00050000-5697-a99f-9675-ccc232e17170	3203	Nova Cerkev
00050000-5697-a99f-dcdc-a3b239bacd93	5000	Nova Gorica 
00050000-5697-a99f-3749-3f7fb7e47859	5001	Nova Gorica - poštni predali
00050000-5697-a99f-d01b-a49c824358fe	1385	Nova vas
00050000-5697-a99f-72dd-d3eeb9995e9d	8000	Novo mesto
00050000-5697-a99f-a57c-744a697f0fad	8001	Novo mesto - poštni predali
00050000-5697-a99f-a0ee-d697eaee5910	6243	Obrov
00050000-5697-a99f-03e1-27f522c90fc6	9233	Odranci
00050000-5697-a99f-0535-53bde232cb67	2317	Oplotnica
00050000-5697-a99f-74d6-8ce9b2bbc45b	2312	Orehova vas
00050000-5697-a99f-7bdb-b7d4e3e5b6fb	2270	Ormož
00050000-5697-a99f-031a-00571bcdb2d5	1316	Ortnek
00050000-5697-a99f-ad0b-186eff7a2b33	1337	Osilnica
00050000-5697-a99f-f084-223b5c40275c	8222	Otočec
00050000-5697-a99f-7313-4e499b50d554	2361	Ožbalt
00050000-5697-a99f-c7ab-ff88b3bfd07b	2231	Pernica
00050000-5697-a99f-e7e4-414f028bf069	2211	Pesnica pri Mariboru
00050000-5697-a99f-aed4-3f1dc40f15a5	9203	Petrovci
00050000-5697-a99f-5223-459c40992cb2	3301	Petrovče
00050000-5697-a99f-39d0-be52ab797c1e	6330	Piran/Pirano
00050000-5697-a99f-d76f-d10cc98ee808	8255	Pišece
00050000-5697-a99f-a3d5-1054f1292f2a	6257	Pivka
00050000-5697-a99f-950d-7134be601f04	6232	Planina
00050000-5697-a99f-a560-f0c1f62e9222	3225	Planina pri Sevnici
00050000-5697-a99f-9e8d-e4021806618b	6276	Pobegi
00050000-5697-a99f-d150-5efdf208d152	8312	Podbočje
00050000-5697-a99f-7cf4-b14fe180e79b	5243	Podbrdo
00050000-5697-a99f-8e68-1d0ad00d1a5b	3254	Podčetrtek
00050000-5697-a99f-7e6c-93e1d0723771	2273	Podgorci
00050000-5697-a99f-1cc8-e9c30e8f4f15	6216	Podgorje
00050000-5697-a99f-1a59-6e4c790ef266	2381	Podgorje pri Slovenj Gradcu
00050000-5697-a99f-fb94-d9a39415aa6f	6244	Podgrad
00050000-5697-a99f-58fa-ed3d8e58c514	1414	Podkum
00050000-5697-a99f-d246-f60617f6d877	2286	Podlehnik
00050000-5697-a99f-c9e0-5f3e4520e65b	5272	Podnanos
00050000-5697-a99f-2365-2cecf2f65a98	4244	Podnart
00050000-5697-a99f-02e9-cbfaef499560	3241	Podplat
00050000-5697-a99f-e866-14b950f98fb7	3257	Podsreda
00050000-5697-a99f-552c-7bbe66e0ab69	2363	Podvelka
00050000-5697-a99f-2f2f-640de5b3b44b	2208	Pohorje
00050000-5697-a99f-9e8c-2dbaf133d820	2257	Polenšak
00050000-5697-a99f-b801-64b4453aa3d9	1355	Polhov Gradec
00050000-5697-a99f-8a15-af023f96f72a	4223	Poljane nad Škofjo Loko
00050000-5697-a99f-f803-6a9e1b0e750d	2319	Poljčane
00050000-5697-a99f-a99f-e4a2ba619e1b	1272	Polšnik
00050000-5697-a99f-33cd-e4d7f7c920d5	3313	Polzela
00050000-5697-a99f-4b0d-acebd144f5b5	3232	Ponikva
00050000-5697-a99f-a780-f0654870b8e6	6320	Portorož/Portorose
00050000-5697-a99f-edd6-0bd444646c67	6230	Postojna
00050000-5697-a99f-ec5b-881171086fdd	2331	Pragersko
00050000-5697-a99f-b3e8-80ff0135264c	3312	Prebold
00050000-5697-a99f-f848-61bfa071f9bb	4205	Preddvor
00050000-5697-a99f-55dc-ac83dab63a6c	6255	Prem
00050000-5697-a99f-7009-d39072af6d6b	1352	Preserje
00050000-5697-a99f-ddd3-7a89192f37b3	6258	Prestranek
00050000-5697-a99f-dc10-b13af8a2b309	2391	Prevalje
00050000-5697-a99f-e4eb-f2c989f14579	3262	Prevorje
00050000-5697-a99f-7ea1-6e7f9ba290a8	1276	Primskovo 
00050000-5697-a99f-00d4-d40cb4780fb3	3253	Pristava pri Mestinju
00050000-5697-a99f-8096-7a6c92313b0d	9207	Prosenjakovci/Partosfalva
00050000-5697-a99f-4af3-5aa36cf6edec	5297	Prvačina
00050000-5697-a99f-0a46-abd026e0e480	2250	Ptuj
00050000-5697-a99f-6384-1b07f964907d	2323	Ptujska Gora
00050000-5697-a99f-7870-7f37d9c464e3	9201	Puconci
00050000-5697-a99f-da07-66a2270c437e	2327	Rače
00050000-5697-a99f-3a8a-2c7a64805f0e	1433	Radeče
00050000-5697-a99f-e54a-664bd2fdbcb1	9252	Radenci
00050000-5697-a99f-8cd2-f90e15bfcf50	2360	Radlje ob Dravi
00050000-5697-a99f-5938-8e8f2b133ac5	1235	Radomlje
00050000-5697-a99f-be6e-b4d12a615732	4240	Radovljica
00050000-5697-a99f-d171-80cbd3a5a5a7	8274	Raka
00050000-5697-a99f-a802-998dad452a5b	1381	Rakek
00050000-5697-a99f-7942-a5b0464a7af8	4283	Rateče - Planica
00050000-5697-a99f-71fa-383a14dc06ca	2390	Ravne na Koroškem
00050000-5697-a99f-468f-fde0f4da90ee	9246	Razkrižje
00050000-5697-a99f-70b0-a4a4503df9fa	3332	Rečica ob Savinji
00050000-5697-a99f-4898-daa8f665b940	5292	Renče
00050000-5697-a99f-3a28-db329a6f87da	1310	Ribnica
00050000-5697-a99f-d74d-59ff6014512e	2364	Ribnica na Pohorju
00050000-5697-a99f-897a-ab531be03907	3272	Rimske Toplice
00050000-5697-a99f-cecd-cc7b4c5c22c1	1314	Rob
00050000-5697-a99f-61fd-456a2d536f3a	5215	Ročinj
00050000-5697-a99f-a211-e9e4d1d88454	3250	Rogaška Slatina
00050000-5697-a99f-5584-84d4452b628b	9262	Rogašovci
00050000-5697-a99f-b950-b610eba183bb	3252	Rogatec
00050000-5697-a99f-aa03-b1ac5b01f23e	1373	Rovte
00050000-5697-a99f-a955-a25609a7cc3f	2342	Ruše
00050000-5697-a99f-7037-f9acb4472408	1282	Sava
00050000-5697-a99f-6254-27bbbbf04f60	6333	Sečovlje/Sicciole
00050000-5697-a99f-a6cc-2ef83d1feb16	4227	Selca
00050000-5697-a99f-726a-b270fa7d49f8	2352	Selnica ob Dravi
00050000-5697-a99f-d937-6e9d578955d5	8333	Semič
00050000-5697-a99f-10c3-289fdf72e969	8281	Senovo
00050000-5697-a99f-09c8-30e334a9a911	6224	Senožeče
00050000-5697-a99f-1aca-6715772f09e5	8290	Sevnica
00050000-5697-a99f-4bf1-1c7d03780844	6210	Sežana
00050000-5697-a99f-fdf1-f049ef61105f	2214	Sladki Vrh
00050000-5697-a99f-9284-8517db76909a	5283	Slap ob Idrijci
00050000-5697-a99f-924b-e58ec339b6d7	2380	Slovenj Gradec
00050000-5697-a99f-c8b4-dd698a48eeb6	2310	Slovenska Bistrica
00050000-5697-a99f-8fde-ebf80f823ae5	3210	Slovenske Konjice
00050000-5697-a99f-207e-55a77c47c0c5	1216	Smlednik
00050000-5697-a99f-f8cb-639edc9027a5	5232	Soča
00050000-5697-a99f-e614-281359b7f07a	1317	Sodražica
00050000-5697-a99f-099c-4b5c291a0d2b	3335	Solčava
00050000-5697-a99f-ff8e-77fb2a9cbd10	5250	Solkan
00050000-5697-a99f-9ca0-b63e8b80583b	4229	Sorica
00050000-5697-a99f-bc6d-4f9777cdfea4	4225	Sovodenj
00050000-5697-a99f-ebbc-d6b5137b915a	5281	Spodnja Idrija
00050000-5697-a99f-3c5a-760a44ae9e06	2241	Spodnji Duplek
00050000-5697-a99f-b745-88298fe6e42f	9245	Spodnji Ivanjci
00050000-5697-a99f-9976-e0852cf431b7	2277	Središče ob Dravi
00050000-5697-a99f-8275-d7016e50f52c	4267	Srednja vas v Bohinju
00050000-5697-a99f-cc20-d9d7289587b8	8256	Sromlje 
00050000-5697-a99f-65c2-71c1c4a7766e	5224	Srpenica
00050000-5697-a99f-0cbc-66b1d232b509	1242	Stahovica
00050000-5697-a99f-9756-225f05dbd268	1332	Stara Cerkev
00050000-5697-a99f-2eb7-0a7cf07ae8fe	8342	Stari trg ob Kolpi
00050000-5697-a99f-2e78-2486ca2b4014	1386	Stari trg pri Ložu
00050000-5697-a99f-88cd-98827592b445	2205	Starše
00050000-5697-a99f-dc01-f1bb278b3708	2289	Stoperce
00050000-5697-a99f-45e3-b2afc46f0cea	8322	Stopiče
00050000-5697-a99f-bec6-e4d5f2df81b6	3206	Stranice
00050000-5697-a99f-cdb1-c84712daa9b2	8351	Straža
00050000-5697-a99f-8307-65f6f8e1d2c7	1313	Struge
00050000-5697-a99f-2bc1-c504d22dbce7	8293	Studenec
00050000-5697-a99f-c58d-18a7952af95b	8331	Suhor
00050000-5697-a99f-ff89-557da1053448	2233	Sv. Ana v Slovenskih goricah
00050000-5697-a99f-fbc6-afd49327105a	2235	Sv. Trojica v Slovenskih goricah
00050000-5697-a99f-4eca-5f266f8ceae5	2353	Sveti Duh na Ostrem Vrhu
00050000-5697-a99f-89fc-f1d9655cefa0	9244	Sveti Jurij ob Ščavnici
00050000-5697-a99f-d2ac-d28380c46c99	3264	Sveti Štefan
00050000-5697-a99f-2d01-431952666716	2258	Sveti Tomaž
00050000-5697-a99f-4893-81e55da7e613	9204	Šalovci
00050000-5697-a99f-70f8-df517c1e6567	5261	Šempas
00050000-5697-a99f-0242-c0cb37ddd3db	5290	Šempeter pri Gorici
00050000-5697-a99f-d7a2-34cbf05c7487	3311	Šempeter v Savinjski dolini
00050000-5697-a99f-0422-e401eea45457	4208	Šenčur
00050000-5697-a99f-b497-ababb3e81a50	2212	Šentilj v Slovenskih goricah
00050000-5697-a99f-ca6e-d316263b7556	8297	Šentjanž
00050000-5697-a99f-31ac-bcf9049b5d1c	2373	Šentjanž pri Dravogradu
00050000-5697-a99f-2f44-ab76acdfc5c5	8310	Šentjernej
00050000-5697-a99f-942b-4467b2aa7c6d	3230	Šentjur
00050000-5697-a99f-3a47-4d03cea951cc	3271	Šentrupert
00050000-5697-a99f-8bd7-3a184c3315b4	8232	Šentrupert
00050000-5697-a99f-dd37-9ee8a7101f0c	1296	Šentvid pri Stični
00050000-5697-a99f-77a4-7f43e5071141	8275	Škocjan
00050000-5697-a99f-6b72-aca42f67d50f	6281	Škofije
00050000-5697-a99f-f6c5-55249e55237f	4220	Škofja Loka
00050000-5697-a99f-cacc-5cdae27ef5f0	3211	Škofja vas
00050000-5697-a99f-cc5e-02323fe134a5	1291	Škofljica
00050000-5697-a99f-f745-0c8d82dd4429	6274	Šmarje
00050000-5697-a99f-ce9d-ff2a86713965	1293	Šmarje - Sap
00050000-5697-a99f-3392-73cc94b8c8ec	3240	Šmarje pri Jelšah
00050000-5697-a99f-9466-6a1261ad9cc5	8220	Šmarješke Toplice
00050000-5697-a99f-d9e1-025e10d591f8	2315	Šmartno na Pohorju
00050000-5697-a99f-04fb-4eea2c740ac2	3341	Šmartno ob Dreti
00050000-5697-a99f-8381-a30b7d6a0e78	3327	Šmartno ob Paki
00050000-5697-a99f-50ab-cc4835e4dbe6	1275	Šmartno pri Litiji
00050000-5697-a99f-12a3-b0aa4a7cb255	2383	Šmartno pri Slovenj Gradcu
00050000-5697-a99f-81bd-0fd82fd95417	3201	Šmartno v Rožni dolini
00050000-5697-a99f-e774-1544e2195267	3325	Šoštanj
00050000-5697-a99f-3c41-a5959040b1a2	6222	Štanjel
00050000-5697-a99f-cd09-c54f6de6a3fb	3220	Štore
00050000-5697-a99f-b1f7-e37429fa16f1	3304	Tabor
00050000-5697-a99f-acc8-9575121367ab	3221	Teharje
00050000-5697-a99f-d9e5-52d2fdad3a88	9251	Tišina
00050000-5697-a99f-d4ce-f6c34d63420d	5220	Tolmin
00050000-5697-a99f-f2dd-e8c8fcda4987	3326	Topolšica
00050000-5697-a99f-f8f0-0ebb6f90af67	2371	Trbonje
00050000-5697-a99f-d199-70270ef3f4df	1420	Trbovlje
00050000-5697-a99f-4a3a-4060be33ab97	8231	Trebelno 
00050000-5697-a99f-81fc-c0274e4a089f	8210	Trebnje
00050000-5697-a99f-a3ab-a660047dac1d	5252	Trnovo pri Gorici
00050000-5697-a99f-8811-193403164fce	2254	Trnovska vas
00050000-5697-a99f-67e1-a92e9ad0a666	1222	Trojane
00050000-5697-a99f-628a-8e5bee3a484d	1236	Trzin
00050000-5697-a99f-59dd-423945807145	4290	Tržič
00050000-5697-a99f-2fc6-ff2c97447953	8295	Tržišče
00050000-5697-a99f-f4ae-b003f990c8a6	1311	Turjak
00050000-5697-a99f-a59d-2a6c645eeebe	9224	Turnišče
00050000-5697-a99f-e627-0055b924819c	8323	Uršna sela
00050000-5697-a99f-2057-4909b43ffdf2	1252	Vače
00050000-5697-a99f-a003-0a5333618292	3320	Velenje 
00050000-5697-a99f-2ac5-df727832c209	3322	Velenje - poštni predali
00050000-5697-a99f-db9c-364e2338957a	8212	Velika Loka
00050000-5697-a99f-2b61-9332e14660cd	2274	Velika Nedelja
00050000-5697-a99f-9b10-364fe1ff8dd0	9225	Velika Polana
00050000-5697-a99f-c0ce-61cf484785eb	1315	Velike Lašče
00050000-5697-a99f-52ee-afbff7ac1a73	8213	Veliki Gaber
00050000-5697-a99f-6efc-62674955cc76	9241	Veržej
00050000-5697-a99f-2f2c-5315b8d9ca1d	1312	Videm - Dobrepolje
00050000-5697-a99f-3794-50654d8c4677	2284	Videm pri Ptuju
00050000-5697-a99f-16a0-370e43e645f7	8344	Vinica
00050000-5697-a99f-b946-1bb7c0e32b3c	5271	Vipava
00050000-5697-a99f-4223-e3ddf7bff9b9	4212	Visoko
00050000-5697-a99f-615a-978f9ecdf0e8	1294	Višnja Gora
00050000-5697-a99f-9377-5e90dbd3c2e4	3205	Vitanje
00050000-5697-a99f-46b3-79c16d40e131	2255	Vitomarci
00050000-5697-a99f-5283-5c1d28bb67a5	1217	Vodice
00050000-5697-a99f-1eb7-660d6fc0e5b0	3212	Vojnik\t
00050000-5697-a99f-d79c-86b4837dfc9d	5293	Volčja Draga
00050000-5697-a99f-e881-a2ae393f505c	2232	Voličina
00050000-5697-a99f-ee82-1990e0bf26de	3305	Vransko
00050000-5697-a99f-e8f3-476fea8c93c1	6217	Vremski Britof
00050000-5697-a99f-9810-43bb338d3da0	1360	Vrhnika
00050000-5697-a99f-7956-07f4ec8ec1d1	2365	Vuhred
00050000-5697-a99f-7fee-37994c0f63d5	2367	Vuzenica
00050000-5697-a99f-0966-d7dedbc07db5	8292	Zabukovje 
00050000-5697-a99f-65f2-467c7a792799	1410	Zagorje ob Savi
00050000-5697-a99f-9405-44142f0e2c5a	1303	Zagradec
00050000-5697-a99f-b2d4-17f852e4d21b	2283	Zavrč
00050000-5697-a99f-52e2-6e94ff35ff8d	8272	Zdole 
00050000-5697-a99f-a7ba-7b81ea1863aa	4201	Zgornja Besnica
00050000-5697-a99f-29e1-506614e02f8b	2242	Zgornja Korena
00050000-5697-a99f-ee4d-457f113d4e65	2201	Zgornja Kungota
00050000-5697-a99f-4514-8c89ca21439e	2316	Zgornja Ložnica
00050000-5697-a99f-d26a-d9e4be9a41b1	2314	Zgornja Polskava
00050000-5697-a99f-3fd4-4d096703fc6f	2213	Zgornja Velka
00050000-5697-a99f-02f4-8d070b8dd321	4247	Zgornje Gorje
00050000-5697-a99f-9ed2-c6a84ad7a24e	4206	Zgornje Jezersko
00050000-5697-a99f-38e6-c07258c08dde	2285	Zgornji Leskovec
00050000-5697-a99f-41db-1b831db6b764	1432	Zidani Most
00050000-5697-a99f-9a91-b80940a7da66	3214	Zreče
00050000-5697-a99f-f653-9ebd56213cfa	4209	Žabnica
00050000-5697-a99f-222d-2ec4727fa525	3310	Žalec
00050000-5697-a99f-b2e1-8ee1a5cfe513	4228	Železniki
00050000-5697-a99f-09ac-f24f8cb83ab5	2287	Žetale
00050000-5697-a99f-9b66-97e1abf7f922	4226	Žiri
00050000-5697-a99f-253c-3f28cf2ddacc	4274	Žirovnica
00050000-5697-a99f-5ac1-29993b605fd3	8360	Žužemberk
\.


--
-- TOC entry 3210 (class 0 OID 36357595)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 36357165)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 36356896)
-- Dependencies: 191
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5697-a9a4-95c2-61236df31d2d	00080000-5697-a9a4-130e-dce3fc24342f	\N	00040000-5697-a9a0-09f9-9f9c8d6c30ab	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5697-a9a4-0727-cefebc980786	00080000-5697-a9a4-130e-dce3fc24342f	\N	00040000-5697-a9a0-09f9-9f9c8d6c30ab	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5697-a9a4-3634-ca22f73f9002	00080000-5697-a9a4-1085-c826777edfe7	\N	00040000-5697-a9a0-09f9-9f9c8d6c30ab	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3169 (class 0 OID 36357034)
-- Dependencies: 203
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5697-a9a0-5037-3f9738e95d36	novo leto	1	1	\N	t
00430000-5697-a9a0-e7e7-cf281e9f1dd2	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5697-a9a0-093e-d32f096af04f	dan upora proti okupatorju	27	4	\N	t
00430000-5697-a9a0-a777-b0d503b91b85	praznik dela	1	5	\N	t
00430000-5697-a9a0-3c60-6eb859a6d9e5	praznik dela	2	5	\N	t
00430000-5697-a9a0-e55a-4def8030521c	dan Primoža Trubarja	8	6	\N	f
00430000-5697-a9a0-d0ee-3ad7ae551cb2	dan državnosti	25	6	\N	t
00430000-5697-a9a0-16ff-88cfad1c766d	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5697-a9a0-69a5-d19adceb9665	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5697-a9a0-416e-2f7ae771066f	dan suverenosti	25	10	\N	f
00430000-5697-a9a0-782c-a99b46c67dc5	dan spomina na mrtve	1	11	\N	t
00430000-5697-a9a0-4a51-98f90497aa42	dan Rudolfa Maistra	23	11	\N	f
00430000-5697-a9a0-3cc9-6aead0036834	božič	25	12	\N	t
00430000-5697-a9a0-476a-56db3865f592	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5697-a9a0-db75-63f9413999ae	Marijino vnebovzetje	15	8	\N	t
00430000-5697-a9a0-4ce6-61863fcfd3e9	dan reformacije	31	10	\N	t
00430000-5697-a9a0-2ec3-f4e6546c63a6	velikonočna nedelja	27	3	2016	t
00430000-5697-a9a0-6347-a15ceca5b104	velikonočna nedelja	16	4	2017	t
00430000-5697-a9a0-eff9-62e80c1ba52a	velikonočna nedelja	1	4	2018	t
00430000-5697-a9a0-8db1-a906cb4b7502	velikonočna nedelja	21	4	2019	t
00430000-5697-a9a0-5a69-c84e1aee30b4	velikonočna nedelja	12	4	2020	t
00430000-5697-a9a0-2d0b-88271dd12e6f	velikonočna nedelja	4	4	2021	t
00430000-5697-a9a0-1d87-d28b72fe6cd2	velikonočna nedelja	17	4	2022	t
00430000-5697-a9a0-c33f-9bf7bb5ae0db	velikonočna nedelja	9	4	2023	t
00430000-5697-a9a0-cdca-9bbabc833e72	velikonočna nedelja	31	3	2024	t
00430000-5697-a9a0-ebc1-b51cc2e5de97	velikonočna nedelja	20	4	2025	t
00430000-5697-a9a0-42f6-2026f7bdb5bb	velikonočna nedelja	5	4	2026	t
00430000-5697-a9a0-255e-aecb585f1652	velikonočna nedelja	28	3	2027	t
00430000-5697-a9a0-f246-58c7ea9c16c8	velikonočna nedelja	16	4	2028	t
00430000-5697-a9a0-5e48-ddcd11f32063	velikonočna nedelja	1	4	2029	t
00430000-5697-a9a0-04a1-8dd6f850ce54	velikonočna nedelja	21	4	2030	t
00430000-5697-a9a0-3eca-1ff55d02a59a	velikonočni ponedeljek	28	3	2016	t
00430000-5697-a9a0-09d5-6986ff656cc9	velikonočni ponedeljek	17	4	2017	t
00430000-5697-a9a0-ca7c-00e67c053ab9	velikonočni ponedeljek	2	4	2018	t
00430000-5697-a9a0-3468-3581d04969c1	velikonočni ponedeljek	22	4	2019	t
00430000-5697-a9a0-df64-686e973bde76	velikonočni ponedeljek	13	4	2020	t
00430000-5697-a9a0-77d9-0ae402967f3e	velikonočni ponedeljek	5	4	2021	t
00430000-5697-a9a0-eb04-dc3fc8b8b98b	velikonočni ponedeljek	18	4	2022	t
00430000-5697-a9a0-13ec-6a306a2c83cb	velikonočni ponedeljek	10	4	2023	t
00430000-5697-a9a0-97f8-a5da20c5337c	velikonočni ponedeljek	1	4	2024	t
00430000-5697-a9a0-df82-e793516e8017	velikonočni ponedeljek	21	4	2025	t
00430000-5697-a9a0-1553-253e9d66054f	velikonočni ponedeljek	6	4	2026	t
00430000-5697-a9a0-3a09-e54cbb2b65a1	velikonočni ponedeljek	29	3	2027	t
00430000-5697-a9a0-2035-0e3bcf169958	velikonočni ponedeljek	17	4	2028	t
00430000-5697-a9a0-9eaa-fdcd9cd0b0bd	velikonočni ponedeljek	2	4	2029	t
00430000-5697-a9a0-1681-77ce3aaff286	velikonočni ponedeljek	22	4	2030	t
00430000-5697-a9a0-0035-cc28fe3326c4	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5697-a9a0-d831-5ff2bdc8bcac	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5697-a9a0-14f9-b30282b3ce62	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5697-a9a0-d5d8-d90dc6bcc328	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5697-a9a0-55e5-6177e92e2184	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5697-a9a0-5ea4-7b7e82cf786b	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5697-a9a0-dd52-ca11ae35890b	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5697-a9a0-50b2-0a8fb3f2f9ad	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5697-a9a0-d12d-e813a336a013	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5697-a9a0-502c-77ba16668eb5	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5697-a9a0-2390-ecdb9d5013f6	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5697-a9a0-a48a-c7fdea8c987b	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5697-a9a0-998c-8b999f177c34	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5697-a9a0-2259-09c42087e75f	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5697-a9a0-7cc6-96254d453bdb	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3165 (class 0 OID 36357000)
-- Dependencies: 199
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 36357009)
-- Dependencies: 200
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 36357177)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 36357609)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 36357619)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5697-a9a4-fe1b-e313e00aa3d2	00080000-5697-a9a4-1cc8-645cc570b8db	0987	AK
00190000-5697-a9a4-ddcf-c86dbe5a4924	00080000-5697-a9a4-1085-c826777edfe7	0989	AK
00190000-5697-a9a4-9877-d88304ce8864	00080000-5697-a9a4-f083-fc77a41acbf7	0986	AK
00190000-5697-a9a4-9c98-c460409be172	00080000-5697-a9a4-4e39-eeee4a83725c	0984	AK
00190000-5697-a9a4-4f0b-db5277b28296	00080000-5697-a9a4-0b7f-47efcf0987fa	0983	AK
00190000-5697-a9a4-75b3-db30317455e3	00080000-5697-a9a4-d7de-5d52028a653b	0982	AK
00190000-5697-a9a6-b78c-01c0f8d50dd9	00080000-5697-a9a6-ff88-e2c9f5ab74e3	1001	AK
\.


--
-- TOC entry 3209 (class 0 OID 36357508)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5697-a9a4-6334-8b5995eef3c2	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3213 (class 0 OID 36357627)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 36357206)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5697-a9a3-79b1-26d400fe5612	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5697-a9a3-b14d-098523b68cb6	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5697-a9a3-c2d3-5894901cc061	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5697-a9a3-f0c2-bdd0f3ceb280	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5697-a9a3-74f8-71341d284b16	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5697-a9a3-21c7-377da126d55e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5697-a9a3-509d-008ce133b39d	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3181 (class 0 OID 36357150)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 36357140)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 36357347)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 36357277)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 36356974)
-- Dependencies: 197
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 36356736)
-- Dependencies: 176
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5697-a9a6-ff88-e2c9f5ab74e3	00010000-5697-a9a1-42af-870a32d0db9d	2016-01-14 14:59:02	INS	a:0:{}
2	App\\Entity\\Option	00000000-5697-a9a6-d09a-344b2c503545	00010000-5697-a9a1-42af-870a32d0db9d	2016-01-14 14:59:02	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5697-a9a6-b78c-01c0f8d50dd9	00010000-5697-a9a1-42af-870a32d0db9d	2016-01-14 14:59:02	INS	a:0:{}
\.


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3190 (class 0 OID 36357219)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 36356774)
-- Dependencies: 180
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5697-a9a1-fbd0-1d84e3aa9daa	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5697-a9a1-3cd2-59227c6cf712	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5697-a9a1-39c2-34302d0a3486	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5697-a9a1-c0ac-18c07ec68f0c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5697-a9a1-df6a-242649385343	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5697-a9a1-b896-3e2de12f1d1a	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5697-a9a1-d4ae-5d4c685998c5	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5697-a9a1-c204-1e2dcb452ed2	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5697-a9a1-7636-d0fbbb903fb6	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-a9a1-ee0a-f07effb7a503	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-a9a1-e7f8-8d8953ff1d1e	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-a9a1-5924-89b33c8cba5c	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-a9a1-1f3e-0ca673f2c566	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-a9a1-587f-1d7077885769	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-a9a1-397d-c6a243151823	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-a9a1-f7a8-7904bfe0a947	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-a9a1-b230-17dfc1be6e6c	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5697-a9a1-57d7-0bdeb83a3981	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5697-a9a1-0433-9e8a78e6acd6	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5697-a9a1-9847-0fe09e3c2449	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5697-a9a1-dcb6-50e8d5e5e608	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-a9a1-4e70-88eb424b25e5	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-a9a1-f3ba-b6d292820d82	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-a9a1-ece6-51d9ece50e3f	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-a9a1-3b11-ee228529bff4	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5697-a9a1-c9f6-217abc1e03c6	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5697-a9a1-cd11-6bcb11032a1d	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5697-a9a1-1dc1-f2af476a0b4b	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5697-a9a1-ec49-8ba99a263c12	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5697-a9a1-9b75-6f6445e73bf5	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5697-a9a1-f85e-26b55fd818e8	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-a9a1-b36e-55644f9d0533	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-a9a1-5a41-d6c70f6a8d63	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5697-a9a1-35ac-8eff081fe4ac	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5697-a9a1-8681-44151e6483ae	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5697-a9a1-5cd3-8694267edf52	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5697-a9a1-5d3f-8267683ec3a8	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-a9a1-532f-97567529bddc	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-a9a1-c494-3a5ba05dce04	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5697-a9a1-db24-2a5b409ee939	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-a9a1-398d-c64ff5eceaea	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-a9a1-14af-291628ece0aa	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5697-a9a1-a775-5510bbcdbcc8	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-a9a1-98ce-153217889628	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-a9a1-016e-ba63025bc0e9	direktor	minimalne pravice za direktorja	t
00020000-5697-a9a1-7801-c5ff47a137db	arhivar	arhivar	t
00020000-5697-a9a1-f549-bf927786e7e2	dramaturg	dramaturg	t
00020000-5697-a9a1-d680-9df034f991ba	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5697-a9a1-0ddd-20a19968873e	poslovni-sekretar	poslovni sekretar	t
00020000-5697-a9a1-4c5a-e0977c411d89	vodja-tehnike	vodja tehnike	t
00020000-5697-a9a1-5759-1a03e06c6229	racunovodja	računovodja	t
00020000-5697-a9a3-b89c-05f0e165f230	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5697-a9a3-18fd-fac062ddf4f4	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-322f-02766ed10cad	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-6ce3-ccf29e5dcdde	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-f23b-15b8a5ffde6e	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-ad9f-209d8098327e	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-9f20-88b17ee5dd62	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-ad5e-43eba10199a2	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-5040-8eb5487fff6b	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-5c50-feb5849f8aaa	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-fc06-8350d07a8b3d	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-b4eb-9c592389e8a0	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-a9f0-d6608ae1fa16	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-b765-0986ab1774a6	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-b001-5da942dbf33a	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-2d13-34a63796bb07	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-5927-09e1af8832bf	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-cf8a-034306f47bd2	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-b504-83622203ad36	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-b9ac-225ea06c898d	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5697-a9a3-53be-678d09cba9b7	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-066a-186aaa2b1bb4	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-7245-ce7b1455f7a8	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-15b6-e79ba36c5949	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-11c0-2b0b0640d310	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-18e3-c886df2f49f9	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-5c6f-d6f11661cbc7	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-7e86-236afe263c1d	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-76b3-8a2ae27960f2	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-f81e-cb68e6eb6cb1	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-1bd9-b8bbb29d46fd	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-c175-b421ce37f1b1	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-d00d-7fa3184dc6db	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-e57e-b4037a960aee	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-fca9-82a8d3c3ad2d	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-1827-7197733991ce	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-f0dd-daae59617f6f	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-6344-e99b7f4e11da	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5697-a9a3-88d4-fe7e833d1c0a	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3144 (class 0 OID 36356758)
-- Dependencies: 178
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5697-a9a1-1a8f-ab3af35fd3e0	00020000-5697-a9a1-39c2-34302d0a3486
00010000-5697-a9a1-42af-870a32d0db9d	00020000-5697-a9a1-39c2-34302d0a3486
00010000-5697-a9a3-5016-7bf2449b5e0b	00020000-5697-a9a3-b89c-05f0e165f230
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-18fd-fac062ddf4f4
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-ad9f-209d8098327e
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-5c50-feb5849f8aaa
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-b4eb-9c592389e8a0
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-b765-0986ab1774a6
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-b504-83622203ad36
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-6ce3-ccf29e5dcdde
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-53be-678d09cba9b7
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-15b6-e79ba36c5949
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-18e3-c886df2f49f9
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-7e86-236afe263c1d
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-f81e-cb68e6eb6cb1
00010000-5697-a9a3-8bc5-f201d92c7b22	00020000-5697-a9a3-e57e-b4037a960aee
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-18fd-fac062ddf4f4
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-322f-02766ed10cad
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-6ce3-ccf29e5dcdde
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-f23b-15b8a5ffde6e
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-b765-0986ab1774a6
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-5927-09e1af8832bf
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-53be-678d09cba9b7
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-15b6-e79ba36c5949
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-18e3-c886df2f49f9
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-7e86-236afe263c1d
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-f81e-cb68e6eb6cb1
00010000-5697-a9a3-9844-54e52ee30d14	00020000-5697-a9a3-e57e-b4037a960aee
00010000-5697-a9a3-899e-af11d1338c50	00020000-5697-a9a3-18fd-fac062ddf4f4
00010000-5697-a9a3-899e-af11d1338c50	00020000-5697-a9a3-322f-02766ed10cad
00010000-5697-a9a3-899e-af11d1338c50	00020000-5697-a9a3-6ce3-ccf29e5dcdde
00010000-5697-a9a3-899e-af11d1338c50	00020000-5697-a9a3-f23b-15b8a5ffde6e
00010000-5697-a9a3-899e-af11d1338c50	00020000-5697-a9a3-b4eb-9c592389e8a0
00010000-5697-a9a3-899e-af11d1338c50	00020000-5697-a9a3-b765-0986ab1774a6
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-322f-02766ed10cad
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-9f20-88b17ee5dd62
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-fc06-8350d07a8b3d
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-a9f0-d6608ae1fa16
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-b4eb-9c592389e8a0
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-cf8a-034306f47bd2
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-b765-0986ab1774a6
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-b001-5da942dbf33a
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-53be-678d09cba9b7
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-066a-186aaa2b1bb4
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-15b6-e79ba36c5949
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-11c0-2b0b0640d310
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-18e3-c886df2f49f9
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-5c6f-d6f11661cbc7
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-7e86-236afe263c1d
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-76b3-8a2ae27960f2
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-f81e-cb68e6eb6cb1
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-1bd9-b8bbb29d46fd
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-e57e-b4037a960aee
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-fca9-82a8d3c3ad2d
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-f0dd-daae59617f6f
00010000-5697-a9a3-0067-430559529237	00020000-5697-a9a3-6344-e99b7f4e11da
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-322f-02766ed10cad
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-9f20-88b17ee5dd62
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-5040-8eb5487fff6b
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-fc06-8350d07a8b3d
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-a9f0-d6608ae1fa16
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-b4eb-9c592389e8a0
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-cf8a-034306f47bd2
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-b765-0986ab1774a6
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-b001-5da942dbf33a
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-2d13-34a63796bb07
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-53be-678d09cba9b7
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-066a-186aaa2b1bb4
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-7245-ce7b1455f7a8
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-15b6-e79ba36c5949
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-11c0-2b0b0640d310
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-18e3-c886df2f49f9
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-5c6f-d6f11661cbc7
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-7e86-236afe263c1d
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-76b3-8a2ae27960f2
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-f81e-cb68e6eb6cb1
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-1bd9-b8bbb29d46fd
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-e57e-b4037a960aee
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-fca9-82a8d3c3ad2d
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-1827-7197733991ce
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-f0dd-daae59617f6f
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-6344-e99b7f4e11da
00010000-5697-a9a3-344d-4ec99eadf186	00020000-5697-a9a3-88d4-fe7e833d1c0a
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-322f-02766ed10cad
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-6ce3-ccf29e5dcdde
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-9f20-88b17ee5dd62
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-ad5e-43eba10199a2
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-5040-8eb5487fff6b
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-ad9f-209d8098327e
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-fc06-8350d07a8b3d
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-a9f0-d6608ae1fa16
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-b4eb-9c592389e8a0
00010000-5697-a9a3-a861-9ec29fcb2103	00020000-5697-a9a3-cf8a-034306f47bd2
00010000-5697-a9a3-8d7e-19e012e69330	00020000-5697-a9a3-18fd-fac062ddf4f4
00010000-5697-a9a3-8d7e-19e012e69330	00020000-5697-a9a3-f23b-15b8a5ffde6e
00010000-5697-a9a3-8d7e-19e012e69330	00020000-5697-a9a3-ad9f-209d8098327e
00010000-5697-a9a3-8d7e-19e012e69330	00020000-5697-a9a3-5c50-feb5849f8aaa
00010000-5697-a9a3-8d7e-19e012e69330	00020000-5697-a9a3-b4eb-9c592389e8a0
00010000-5697-a9a3-8d7e-19e012e69330	00020000-5697-a9a3-b765-0986ab1774a6
00010000-5697-a9a3-8d7e-19e012e69330	00020000-5697-a9a3-b504-83622203ad36
00010000-5697-a9a3-8d7e-19e012e69330	00020000-5697-a9a3-c175-b421ce37f1b1
00010000-5697-a9a3-bf44-bfd063611282	00020000-5697-a9a3-b9ac-225ea06c898d
00010000-5697-a9a3-8eb7-ec16722aeb6d	00020000-5697-a9a1-016e-ba63025bc0e9
00010000-5697-a9a3-263c-b4a365013ddc	00020000-5697-a9a1-7801-c5ff47a137db
00010000-5697-a9a3-baf3-8fbb07b6363c	00020000-5697-a9a1-f549-bf927786e7e2
00010000-5697-a9a4-616c-85bb54d6381d	00020000-5697-a9a1-d680-9df034f991ba
00010000-5697-a9a4-b08e-f40439527bf7	00020000-5697-a9a1-0ddd-20a19968873e
00010000-5697-a9a4-61c8-5d1becf93a77	00020000-5697-a9a1-4c5a-e0977c411d89
00010000-5697-a9a4-43f8-d8760b05c83b	00020000-5697-a9a1-5759-1a03e06c6229
\.


--
-- TOC entry 3192 (class 0 OID 36357233)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 36357171)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 36357094)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5697-a9a3-5cae-03749fb0cb18	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5697-a9a3-97b2-4c1375e0a751	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5697-a9a3-17a5-bb301bb68d75	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3140 (class 0 OID 36356723)
-- Dependencies: 174
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5697-a9a0-5a94-f304d25e1935	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5697-a9a0-3439-54698e8a704d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5697-a9a0-a812-c41c1417d9be	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5697-a9a0-4e9c-9ada1941b107	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5697-a9a0-2f8e-b63cfc23b989	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3139 (class 0 OID 36356715)
-- Dependencies: 173
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5697-a9a0-dffe-d1aafc4e10fc	00230000-5697-a9a0-4e9c-9ada1941b107	popa
00240000-5697-a9a0-e6d8-42a6aab3f12a	00230000-5697-a9a0-4e9c-9ada1941b107	oseba
00240000-5697-a9a0-92cf-1aa2973d0bac	00230000-5697-a9a0-4e9c-9ada1941b107	tippopa
00240000-5697-a9a0-3fe2-1082b8bdb6f0	00230000-5697-a9a0-4e9c-9ada1941b107	organizacijskaenota
00240000-5697-a9a0-a0ec-a5ad52a56710	00230000-5697-a9a0-4e9c-9ada1941b107	sezona
00240000-5697-a9a0-f9e5-e04eb15b2ea3	00230000-5697-a9a0-4e9c-9ada1941b107	tipvaje
00240000-5697-a9a0-ae1f-052dda4cfc45	00230000-5697-a9a0-4e9c-9ada1941b107	tipdodatka
00240000-5697-a9a0-5043-867e3199fa05	00230000-5697-a9a0-3439-54698e8a704d	prostor
00240000-5697-a9a0-d164-d274bb714e56	00230000-5697-a9a0-4e9c-9ada1941b107	besedilo
00240000-5697-a9a0-9131-b0066ea0225e	00230000-5697-a9a0-4e9c-9ada1941b107	uprizoritev
00240000-5697-a9a0-c132-4230a49a045b	00230000-5697-a9a0-4e9c-9ada1941b107	funkcija
00240000-5697-a9a0-c65a-ba8e868e0bcb	00230000-5697-a9a0-4e9c-9ada1941b107	tipfunkcije
00240000-5697-a9a0-0243-8b02925656cf	00230000-5697-a9a0-4e9c-9ada1941b107	alternacija
00240000-5697-a9a0-9986-f693ea63df57	00230000-5697-a9a0-5a94-f304d25e1935	pogodba
00240000-5697-a9a0-284d-7cd49d124c83	00230000-5697-a9a0-4e9c-9ada1941b107	zaposlitev
00240000-5697-a9a0-2ab1-7e9739acfc9e	00230000-5697-a9a0-4e9c-9ada1941b107	zvrstuprizoritve
00240000-5697-a9a0-77f9-d9767865ede2	00230000-5697-a9a0-5a94-f304d25e1935	programdela
00240000-5697-a9a0-9158-a672a1c1b83c	00230000-5697-a9a0-4e9c-9ada1941b107	zapis
\.


--
-- TOC entry 3138 (class 0 OID 36356710)
-- Dependencies: 172
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
a6ff71bb-bac8-4b3f-b952-08970bea9a5f	00240000-5697-a9a0-dffe-d1aafc4e10fc	0	1001
\.


--
-- TOC entry 3198 (class 0 OID 36357294)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5697-a9a4-fcea-956ebdde18b0	000e0000-5697-a9a4-2075-997deb404874	00080000-5697-a9a4-130e-dce3fc24342f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5697-a9a0-e995-7a41fa6081fd
00270000-5697-a9a4-9dbb-10fbc616f9b1	000e0000-5697-a9a4-2075-997deb404874	00080000-5697-a9a4-130e-dce3fc24342f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5697-a9a0-e995-7a41fa6081fd
\.


--
-- TOC entry 3154 (class 0 OID 36356858)
-- Dependencies: 188
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 36357113)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, zasedenost, virtzasedenost) FROM stdin;
001a0000-5697-a9a4-8689-f93c7c693f88	00180000-5697-a9a4-7722-00ef8a206bfd	000c0000-5697-a9a4-acd8-4029c65c028e	00090000-5697-a9a4-794c-9c4485adbe16	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-a9a4-e15e-478a13a8c8f2	00180000-5697-a9a4-7722-00ef8a206bfd	000c0000-5697-a9a4-9404-ee6725c4671e	00090000-5697-a9a4-5350-bb8dc04e0504	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-a9a4-26bb-fec2473cf6f4	00180000-5697-a9a4-7722-00ef8a206bfd	000c0000-5697-a9a4-5da3-5329d1a38ba3	00090000-5697-a9a4-e65e-4644e94cc352	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-a9a4-b4b1-d7954421c931	00180000-5697-a9a4-7722-00ef8a206bfd	000c0000-5697-a9a4-adbe-b1b2ce9f7299	00090000-5697-a9a4-2c7f-da8470d44ae2	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-a9a4-7923-d4b0a86d1f28	00180000-5697-a9a4-7722-00ef8a206bfd	000c0000-5697-a9a4-e3b7-c17ad7e82323	00090000-5697-a9a4-20b9-f4e1213cb416	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-a9a4-cb67-2f5b727db5ef	00180000-5697-a9a4-3fd5-5fe61e01964d	\N	00090000-5697-a9a4-20b9-f4e1213cb416	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	t	f	\N	\N
001a0000-5697-a9a4-82d9-0be1a78ce012	00180000-5697-a9a4-3fd5-5fe61e01964d	\N	00090000-5697-a9a4-5350-bb8dc04e0504	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N
\.


--
-- TOC entry 3179 (class 0 OID 36357130)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5697-a9a0-544d-79b4d65f93c2	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5697-a9a0-542d-c2b0d5f8adf2	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5697-a9a0-aa4b-f7afe051c837	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5697-a9a0-52e9-5c21314c8364	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5697-a9a0-36dc-c49b7b1695ca	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5697-a9a0-b3d8-1782b7b6822c	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3201 (class 0 OID 36357335)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5697-a9a0-8ff5-f8830b6c074e	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5697-a9a0-a29e-c4a260df1c20	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5697-a9a0-e73e-3386c0653ae7	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5697-a9a0-67dd-f939cf21d981	04	Režija	Režija	Režija	umetnik	30
000f0000-5697-a9a0-aa93-3300a4639a8c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5697-a9a0-e8cf-4dbce3d42273	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5697-a9a0-c919-fdcff9276f1d	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5697-a9a0-3bcf-29e4dba7729a	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5697-a9a0-b66a-d4dccde7722e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5697-a9a0-3902-d5b8870d7981	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5697-a9a0-3fc3-7ff2deba8d3e	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5697-a9a0-f77a-dbdb005ec8d4	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5697-a9a0-a833-300cf8746e25	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5697-a9a0-334d-702da59adff1	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5697-a9a0-610b-a5aba58f9689	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5697-a9a0-bbc7-06cc38e1a6cd	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5697-a9a0-f98c-269b133495ac	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5697-a9a0-e03f-799d0c59b316	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5697-a9a0-8193-085880df8ed6	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3151 (class 0 OID 36356809)
-- Dependencies: 185
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5697-a9a3-3977-277f7fd142ff	0001	šola	osnovna ali srednja šola
00400000-5697-a9a3-67e0-9c6977dc3347	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5697-a9a3-7227-819b1b449c2e	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3214 (class 0 OID 36357639)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5697-a9a0-ee33-acb4d79c21c6	01	Velika predstava	f	1.00	1.00
002b0000-5697-a9a0-26d0-809a8ebdfc91	02	Mala predstava	f	0.50	0.50
002b0000-5697-a9a0-e877-6c6c52ad2c34	03	Mala koprodukcija	t	0.40	1.00
002b0000-5697-a9a0-bb06-97bfacfa3afb	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5697-a9a0-a1e0-f545207d3e0b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3174 (class 0 OID 36357084)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5697-a9a0-965e-7a3d82c5c65b	0001	prva vaja	prva vaja
00420000-5697-a9a0-8700-8c25ec764571	0002	tehnična vaja	tehnična vaja
00420000-5697-a9a0-e053-0a385f3d3c45	0003	lučna vaja	lučna vaja
00420000-5697-a9a0-acf0-2a09791ffccb	0004	kostumska vaja	kostumska vaja
00420000-5697-a9a0-d1c4-4679c340dd6e	0005	foto vaja	foto vaja
00420000-5697-a9a0-dda7-fb44938e3818	0006	1. glavna vaja	1. glavna vaja
00420000-5697-a9a0-81c4-6a82e1e5bd28	0007	2. glavna vaja	2. glavna vaja
00420000-5697-a9a0-c8f8-9abdb36594a2	0008	1. generalka	1. generalka
00420000-5697-a9a0-2218-4fe9217ae413	0009	2. generalka	2. generalka
00420000-5697-a9a0-0ef5-c996e669070d	0010	odprta generalka	odprta generalka
00420000-5697-a9a0-c5c2-028d87557079	0011	obnovitvena vaja	obnovitvena vaja
00420000-5697-a9a0-f0d6-ff0ff1f3548e	0012	italijanka	krajša "obnovitvena" vaja
00420000-5697-a9a0-ba92-def9c55785a3	0013	pevska vaja	pevska vaja
00420000-5697-a9a0-7116-d3485d5f54ba	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5697-a9a0-c990-9c04352215fd	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5697-a9a0-a92a-f8545a8a9209	0016	orientacijska vaja	orientacijska vaja
00420000-5697-a9a0-6880-fd210d863c79	0017	situacijska vaja	situacijska vaja
00420000-5697-a9a0-e1a9-091d31ba9e8f	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3160 (class 0 OID 36356931)
-- Dependencies: 194
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 36356745)
-- Dependencies: 177
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5697-a9a1-42af-870a32d0db9d	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROgxHbXa6vfK.41EBOjCVP7HHurVQeVfK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-17b1-606317a334da	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-fb49-b42f64b368cc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-a001-536c175bba00	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-b717-b087ea6f8c65	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-ca58-cab96557183d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-b263-78b5eded16e7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-45c8-017490b354c6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-c225-b5e038e90424	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-01e5-d95443febecc	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-5016-7bf2449b5e0b	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-9eef-520a7b18f1d9	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-8bc5-f201d92c7b22	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-9844-54e52ee30d14	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-899e-af11d1338c50	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-0067-430559529237	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-344d-4ec99eadf186	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-a861-9ec29fcb2103	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-8d7e-19e012e69330	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-bf44-bfd063611282	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-8eb7-ec16722aeb6d	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-263c-b4a365013ddc	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5697-a9a3-baf3-8fbb07b6363c	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5697-a9a4-616c-85bb54d6381d	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5697-a9a4-b08e-f40439527bf7	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5697-a9a4-61c8-5d1becf93a77	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5697-a9a4-43f8-d8760b05c83b	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5697-a9a1-1a8f-ab3af35fd3e0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3205 (class 0 OID 36357385)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5697-a9a4-4496-c013556c4cf1	00160000-5697-a9a3-a720-ff589ed766c7	\N	00140000-5697-a9a0-a204-c028fc6efe27	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5697-a9a3-74f8-71341d284b16
000e0000-5697-a9a4-2075-997deb404874	00160000-5697-a9a3-6e9c-b20ac50fd7e2	\N	00140000-5697-a9a0-312c-3f989cb6c925	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5697-a9a3-21c7-377da126d55e
000e0000-5697-a9a4-5d9f-f0e698d727a2	\N	\N	00140000-5697-a9a0-312c-3f989cb6c925	00190000-5697-a9a4-fe1b-e313e00aa3d2	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-a9a3-74f8-71341d284b16
000e0000-5697-a9a4-a49a-9ee1ccdf1e81	\N	\N	00140000-5697-a9a0-312c-3f989cb6c925	00190000-5697-a9a4-fe1b-e313e00aa3d2	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-a9a3-74f8-71341d284b16
000e0000-5697-a9a4-cb12-e8a690f44b0b	\N	\N	00140000-5697-a9a0-312c-3f989cb6c925	00190000-5697-a9a4-fe1b-e313e00aa3d2	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-dde1-e17f88821d66	\N	\N	00140000-5697-a9a0-312c-3f989cb6c925	00190000-5697-a9a4-fe1b-e313e00aa3d2	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-c787-c703579f16f3	\N	\N	00140000-5697-a9a0-15bd-bfb7a591096f	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-6d8b-bacc8d031be5	\N	\N	00140000-5697-a9a0-15bd-bfb7a591096f	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-6c8f-61d679f14654	\N	\N	00140000-5697-a9a0-15bd-bfb7a591096f	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-bbbb-7471f5ea80ba	\N	\N	00140000-5697-a9a0-15bd-bfb7a591096f	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-cb30-c3fbeac249bf	\N	\N	00140000-5697-a9a0-15bd-bfb7a591096f	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-af13-12a5cc46c16f	\N	\N	00140000-5697-a9a0-15bd-bfb7a591096f	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-5cd8-686e190ac9bd	\N	\N	00140000-5697-a9a0-15bd-bfb7a591096f	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-fd90-7df8c58cac2b	\N	\N	00140000-5697-a9a0-15bd-bfb7a591096f	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
000e0000-5697-a9a4-8df4-0d00ec20dde2	\N	\N	00140000-5697-a9a0-15bd-bfb7a591096f	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-a9a3-79b1-26d400fe5612
\.


--
-- TOC entry 3176 (class 0 OID 36357104)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 36357027)
-- Dependencies: 202
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5697-a9a4-2129-e468440d967f	\N	000e0000-5697-a9a4-2075-997deb404874	1
00200000-5697-a9a4-ab26-b4c931704a3a	\N	000e0000-5697-a9a4-2075-997deb404874	2
00200000-5697-a9a4-7783-79273ef6af09	\N	000e0000-5697-a9a4-2075-997deb404874	3
00200000-5697-a9a4-6e7e-2bcc3bb5e810	\N	000e0000-5697-a9a4-2075-997deb404874	4
00200000-5697-a9a4-ffbf-66ac50439334	\N	000e0000-5697-a9a4-2075-997deb404874	5
\.


--
-- TOC entry 3188 (class 0 OID 36357198)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 36357308)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5697-a9a0-c3b4-53731e0c14fd	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5697-a9a0-628a-4f3bef9633ac	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5697-a9a0-80e8-4986b2257536	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5697-a9a0-adc9-dd80bbcde5fc	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5697-a9a0-57d8-401e93f9f3da	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5697-a9a0-733b-5b92514799f0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5697-a9a0-7c4d-93418bbd6bb4	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5697-a9a0-7d8b-24ed2ed80914	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5697-a9a0-e995-7a41fa6081fd	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5697-a9a0-f233-f405fd431a6b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5697-a9a0-0e41-aa2884848264	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5697-a9a0-3a40-f45554fe252a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5697-a9a0-df3b-a8d7d17dee2a	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5697-a9a0-5ce6-1c1d5e6b8ade	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5697-a9a0-0294-be5db2534ff2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5697-a9a0-9258-a12a9c5454f8	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5697-a9a0-feaa-f132a63ffcbd	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5697-a9a0-3a80-b0f541f77d78	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5697-a9a0-bd59-ef284521849d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5697-a9a0-ba41-a8e8cbbc04c1	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5697-a9a0-b8c9-c9db9e54420e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5697-a9a0-7484-5cf8e9682a6c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5697-a9a0-4674-7e15794b52e1	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5697-a9a0-aad1-337800c7e29d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5697-a9a0-1267-685baf6dd17a	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5697-a9a0-d73d-3db2d9bf939c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5697-a9a0-d371-4f1736178242	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5697-a9a0-2b82-2870a9ecd4d6	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3217 (class 0 OID 36357689)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 36357658)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3218 (class 0 OID 36357701)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 36357270)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5697-a9a4-364c-68357de86604	00090000-5697-a9a4-5350-bb8dc04e0504	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-a9a4-f94a-9d2a2f60bedc	00090000-5697-a9a4-e65e-4644e94cc352	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-a9a4-07cb-3f5fe8cadfc0	00090000-5697-a9a4-622a-89f16aa02350	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-a9a4-146f-adc9595301fb	00090000-5697-a9a4-23a5-9cd78458f476	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-a9a4-6b24-25f14ad0824e	00090000-5697-a9a4-1c7f-5e59db1eeea8	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-a9a4-779c-c28e67744779	00090000-5697-a9a4-b90f-31adbe9014f0	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3171 (class 0 OID 36357068)
-- Dependencies: 205
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 36357375)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5697-a9a0-a204-c028fc6efe27	01	Drama	drama (SURS 01)
00140000-5697-a9a0-9b4c-4531912d3964	02	Opera	opera (SURS 02)
00140000-5697-a9a0-c03c-6ed6c6a708ff	03	Balet	balet (SURS 03)
00140000-5697-a9a0-3dbf-80f15bee1de6	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5697-a9a0-15bd-bfb7a591096f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5697-a9a0-312c-3f989cb6c925	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5697-a9a0-674b-3637af52daa6	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3194 (class 0 OID 36357260)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2618 (class 2606 OID 36356808)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 36357433)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 36357424)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 36356799)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 36357291)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 36357333)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 36357742)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 36357127)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 36357056)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 36357078)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 36357083)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 36357656)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 36356957)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 36357502)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 36357256)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 36357025)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 36356995)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 36356971)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 36357163)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 36357719)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 36357726)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2910 (class 2606 OID 36357750)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2768 (class 2606 OID 36357190)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 36356929)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 36356827)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 36356891)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 36356854)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 36356788)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2607 (class 2606 OID 36356773)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 36357196)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 36357232)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 36357370)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 36356882)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 36356917)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 36357607)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 36357169)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 36356907)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 36357041)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 36357013)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2685 (class 2606 OID 36357005)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 36357181)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 36357616)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 36357624)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 36357594)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 36357637)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 36357214)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 36357154)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 36357145)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 36357357)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 36357284)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 36356983)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 36356744)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 36357223)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 36356762)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2609 (class 2606 OID 36356782)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 36357241)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 36357176)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 36357102)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 36356732)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 36356720)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 36356714)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 36357304)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 36356863)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 36357119)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 36357137)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 36357344)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 36356816)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 36357649)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 36357091)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 36356942)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 36356757)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 36357403)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 36357110)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 36357031)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 36357204)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 36357316)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 36357699)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 36357683)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 36357707)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 36357274)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 36357072)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 36357383)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 36357268)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 1259 OID 36357066)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2702 (class 1259 OID 36357067)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2703 (class 1259 OID 36357065)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2704 (class 1259 OID 36357064)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2705 (class 1259 OID 36357063)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2811 (class 1259 OID 36357305)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2812 (class 1259 OID 36357306)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2813 (class 1259 OID 36357307)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2896 (class 1259 OID 36357721)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2897 (class 1259 OID 36357720)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2636 (class 1259 OID 36356884)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2637 (class 1259 OID 36356885)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2769 (class 1259 OID 36357197)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2883 (class 1259 OID 36357687)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2884 (class 1259 OID 36357686)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2885 (class 1259 OID 36357688)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2886 (class 1259 OID 36357685)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2887 (class 1259 OID 36357684)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2763 (class 1259 OID 36357183)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2764 (class 1259 OID 36357182)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2693 (class 1259 OID 36357032)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2694 (class 1259 OID 36357033)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2793 (class 1259 OID 36357257)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 36357259)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2795 (class 1259 OID 36357258)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2668 (class 1259 OID 36356973)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 36356972)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2874 (class 1259 OID 36357638)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2827 (class 1259 OID 36357372)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2828 (class 1259 OID 36357373)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 36357374)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2893 (class 1259 OID 36357708)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2836 (class 1259 OID 36357408)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2837 (class 1259 OID 36357405)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2838 (class 1259 OID 36357409)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2839 (class 1259 OID 36357407)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2840 (class 1259 OID 36357406)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2658 (class 1259 OID 36356944)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 36356943)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2627 (class 1259 OID 36356857)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2781 (class 1259 OID 36357224)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2611 (class 1259 OID 36356789)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 36356790)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2786 (class 1259 OID 36357244)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2787 (class 1259 OID 36357243)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2788 (class 1259 OID 36357242)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2641 (class 1259 OID 36356894)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2642 (class 1259 OID 36356893)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2643 (class 1259 OID 36356895)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2681 (class 1259 OID 36357008)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2682 (class 1259 OID 36357006)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2683 (class 1259 OID 36357007)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2591 (class 1259 OID 36356722)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2743 (class 1259 OID 36357149)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2744 (class 1259 OID 36357147)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2745 (class 1259 OID 36357146)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2746 (class 1259 OID 36357148)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2602 (class 1259 OID 36356763)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2603 (class 1259 OID 36356764)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2772 (class 1259 OID 36357205)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2906 (class 1259 OID 36357743)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2809 (class 1259 OID 36357293)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2810 (class 1259 OID 36357292)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2907 (class 1259 OID 36357751)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2908 (class 1259 OID 36357752)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2758 (class 1259 OID 36357170)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2803 (class 1259 OID 36357285)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2804 (class 1259 OID 36357286)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2856 (class 1259 OID 36357507)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2857 (class 1259 OID 36357506)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2858 (class 1259 OID 36357503)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2859 (class 1259 OID 36357504)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2860 (class 1259 OID 36357505)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2647 (class 1259 OID 36356909)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 36356908)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2649 (class 1259 OID 36356910)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2775 (class 1259 OID 36357218)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2776 (class 1259 OID 36357217)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2866 (class 1259 OID 36357617)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2867 (class 1259 OID 36357618)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2849 (class 1259 OID 36357437)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2850 (class 1259 OID 36357438)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2851 (class 1259 OID 36357435)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2852 (class 1259 OID 36357436)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2737 (class 1259 OID 36357128)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2738 (class 1259 OID 36357129)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2799 (class 1259 OID 36357275)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2800 (class 1259 OID 36357276)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2726 (class 1259 OID 36357111)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 36357158)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2750 (class 1259 OID 36357157)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 36357155)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2752 (class 1259 OID 36357156)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2846 (class 1259 OID 36357425)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 36356984)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2675 (class 1259 OID 36356998)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2676 (class 1259 OID 36356997)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2677 (class 1259 OID 36356996)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2678 (class 1259 OID 36356999)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2692 (class 1259 OID 36357026)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2686 (class 1259 OID 36357014)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2687 (class 1259 OID 36357015)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2863 (class 1259 OID 36357608)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2882 (class 1259 OID 36357657)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2900 (class 1259 OID 36357727)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2901 (class 1259 OID 36357728)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2623 (class 1259 OID 36356829)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2624 (class 1259 OID 36356828)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2632 (class 1259 OID 36356864)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2633 (class 1259 OID 36356865)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 36357073)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 36357122)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 36357121)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2732 (class 1259 OID 36357120)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2706 (class 1259 OID 36357058)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2707 (class 1259 OID 36357059)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2708 (class 1259 OID 36357062)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2709 (class 1259 OID 36357057)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2710 (class 1259 OID 36357061)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2711 (class 1259 OID 36357060)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2640 (class 1259 OID 36356883)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 36356817)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 36356818)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2664 (class 1259 OID 36356958)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 36356960)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2666 (class 1259 OID 36356959)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2667 (class 1259 OID 36356961)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2757 (class 1259 OID 36357164)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 36357371)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2841 (class 1259 OID 36357404)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 36357345)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 36357346)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 36356855)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 36356856)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2741 (class 1259 OID 36357138)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2742 (class 1259 OID 36357139)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2796 (class 1259 OID 36357269)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 36356733)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 36356930)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 36356892)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 36356721)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2879 (class 1259 OID 36357650)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2779 (class 1259 OID 36357216)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2780 (class 1259 OID 36357215)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 36357092)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 36357093)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2853 (class 1259 OID 36357434)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2727 (class 1259 OID 36357112)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2654 (class 1259 OID 36356918)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2833 (class 1259 OID 36357384)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2890 (class 1259 OID 36357700)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2872 (class 1259 OID 36357625)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2873 (class 1259 OID 36357626)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2820 (class 1259 OID 36357334)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2725 (class 1259 OID 36357103)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 36356783)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2950 (class 2606 OID 36357923)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2949 (class 2606 OID 36357928)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2944 (class 2606 OID 36357953)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2946 (class 2606 OID 36357943)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2951 (class 2606 OID 36357918)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 36357938)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 36357948)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2948 (class 2606 OID 36357933)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2991 (class 2606 OID 36358143)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2990 (class 2606 OID 36358148)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2989 (class 2606 OID 36358153)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3022 (class 2606 OID 36358313)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3023 (class 2606 OID 36358308)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2923 (class 2606 OID 36357808)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2922 (class 2606 OID 36357813)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 36358058)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3017 (class 2606 OID 36358293)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3018 (class 2606 OID 36358288)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 36358298)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3019 (class 2606 OID 36358283)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3020 (class 2606 OID 36358278)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2970 (class 2606 OID 36358053)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2971 (class 2606 OID 36358048)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2943 (class 2606 OID 36357908)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2942 (class 2606 OID 36357913)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2982 (class 2606 OID 36358098)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2980 (class 2606 OID 36358108)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2981 (class 2606 OID 36358103)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2932 (class 2606 OID 36357863)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2933 (class 2606 OID 36357858)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 36358038)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3014 (class 2606 OID 36358268)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 36358158)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2993 (class 2606 OID 36358163)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 36358168)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3021 (class 2606 OID 36358303)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2996 (class 2606 OID 36358188)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2999 (class 2606 OID 36358173)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2995 (class 2606 OID 36358193)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 36358183)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2998 (class 2606 OID 36358178)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2930 (class 2606 OID 36357853)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 36357848)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 36357793)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2919 (class 2606 OID 36357788)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 36358078)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2915 (class 2606 OID 36357768)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2914 (class 2606 OID 36357773)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2977 (class 2606 OID 36358093)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 36358088)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2979 (class 2606 OID 36358083)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2925 (class 2606 OID 36357823)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2926 (class 2606 OID 36357818)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 36357828)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2936 (class 2606 OID 36357888)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 36357878)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 36357883)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2911 (class 2606 OID 36357753)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2960 (class 2606 OID 36358013)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2962 (class 2606 OID 36358003)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2963 (class 2606 OID 36357998)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2961 (class 2606 OID 36358008)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 36357758)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2912 (class 2606 OID 36357763)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2973 (class 2606 OID 36358063)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3026 (class 2606 OID 36358328)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 36358138)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 36358133)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3028 (class 2606 OID 36358333)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3027 (class 2606 OID 36358338)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2969 (class 2606 OID 36358043)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2986 (class 2606 OID 36358123)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2985 (class 2606 OID 36358128)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3005 (class 2606 OID 36358243)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 36358238)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3009 (class 2606 OID 36358223)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3008 (class 2606 OID 36358228)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3007 (class 2606 OID 36358233)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2928 (class 2606 OID 36357838)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 36357833)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 36357843)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 36358073)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2975 (class 2606 OID 36358068)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 36358253)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3011 (class 2606 OID 36358258)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3002 (class 2606 OID 36358213)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3001 (class 2606 OID 36358218)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3004 (class 2606 OID 36358203)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3003 (class 2606 OID 36358208)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2959 (class 2606 OID 36357988)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2958 (class 2606 OID 36357993)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2984 (class 2606 OID 36358113)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2983 (class 2606 OID 36358118)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2954 (class 2606 OID 36357963)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 36357968)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2964 (class 2606 OID 36358033)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2965 (class 2606 OID 36358028)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2967 (class 2606 OID 36358018)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2966 (class 2606 OID 36358023)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3000 (class 2606 OID 36358198)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 36357868)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2935 (class 2606 OID 36357873)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 36357903)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 36357893)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 36357898)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 36358248)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3013 (class 2606 OID 36358263)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3015 (class 2606 OID 36358273)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3025 (class 2606 OID 36358318)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3024 (class 2606 OID 36358323)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2916 (class 2606 OID 36357783)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2917 (class 2606 OID 36357778)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2921 (class 2606 OID 36357798)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 36357803)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 36357958)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 36357983)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 36357978)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2957 (class 2606 OID 36357973)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-14 14:59:04 CET

--
-- PostgreSQL database dump complete
--

