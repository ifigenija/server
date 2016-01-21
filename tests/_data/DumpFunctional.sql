--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-21 10:36:49 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 38992293)
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
-- TOC entry 241 (class 1259 OID 38992914)
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
-- TOC entry 240 (class 1259 OID 38992898)
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
-- TOC entry 184 (class 1259 OID 38992286)
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
-- TOC entry 183 (class 1259 OID 38992284)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 38992775)
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
-- TOC entry 234 (class 1259 OID 38992805)
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
-- TOC entry 255 (class 1259 OID 38993217)
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
-- TOC entry 212 (class 1259 OID 38992610)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 38992535)
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
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 38992561)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 38992566)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 38993139)
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
-- TOC entry 196 (class 1259 OID 38992439)
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
-- TOC entry 242 (class 1259 OID 38992927)
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
-- TOC entry 227 (class 1259 OID 38992733)
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
-- TOC entry 202 (class 1259 OID 38992509)
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
-- TOC entry 199 (class 1259 OID 38992479)
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
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 38992456)
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
-- TOC entry 216 (class 1259 OID 38992646)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 38993197)
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
-- TOC entry 254 (class 1259 OID 38993210)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 38993232)
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
-- TOC entry 220 (class 1259 OID 38992671)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 38992413)
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
-- TOC entry 187 (class 1259 OID 38992313)
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
-- TOC entry 191 (class 1259 OID 38992380)
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
-- TOC entry 188 (class 1259 OID 38992324)
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
-- TOC entry 180 (class 1259 OID 38992258)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 38992277)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 38992678)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 38992713)
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
-- TOC entry 237 (class 1259 OID 38992846)
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
-- TOC entry 190 (class 1259 OID 38992360)
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
-- TOC entry 193 (class 1259 OID 38992405)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 38993083)
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
-- TOC entry 217 (class 1259 OID 38992652)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 38992390)
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
-- TOC entry 204 (class 1259 OID 38992527)
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
-- TOC entry 200 (class 1259 OID 38992494)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 201 (class 1259 OID 38992502)
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
-- TOC entry 219 (class 1259 OID 38992664)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 38993097)
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
-- TOC entry 246 (class 1259 OID 38993107)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 38992996)
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
-- TOC entry 247 (class 1259 OID 38993115)
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
-- TOC entry 223 (class 1259 OID 38992693)
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
-- TOC entry 215 (class 1259 OID 38992637)
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
-- TOC entry 214 (class 1259 OID 38992627)
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
-- TOC entry 236 (class 1259 OID 38992835)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 38992765)
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
-- TOC entry 198 (class 1259 OID 38992468)
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
-- TOC entry 177 (class 1259 OID 38992229)
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
-- TOC entry 176 (class 1259 OID 38992227)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 38992707)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 38992267)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 38992251)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 38992721)
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
-- TOC entry 218 (class 1259 OID 38992658)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 38992581)
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
-- TOC entry 175 (class 1259 OID 38992216)
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
-- TOC entry 174 (class 1259 OID 38992208)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 38992203)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 38992782)
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
-- TOC entry 189 (class 1259 OID 38992352)
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
-- TOC entry 211 (class 1259 OID 38992600)
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
-- TOC entry 213 (class 1259 OID 38992617)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 38992823)
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
-- TOC entry 186 (class 1259 OID 38992303)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 38993127)
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
-- TOC entry 208 (class 1259 OID 38992571)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 38992425)
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
-- TOC entry 178 (class 1259 OID 38992238)
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
-- TOC entry 239 (class 1259 OID 38992873)
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
-- TOC entry 210 (class 1259 OID 38992591)
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
-- TOC entry 203 (class 1259 OID 38992520)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 38992685)
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
-- TOC entry 233 (class 1259 OID 38992796)
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
-- TOC entry 251 (class 1259 OID 38993177)
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
-- TOC entry 250 (class 1259 OID 38993146)
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
-- TOC entry 252 (class 1259 OID 38993189)
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
-- TOC entry 229 (class 1259 OID 38992758)
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
-- TOC entry 238 (class 1259 OID 38992863)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 38992748)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 38992289)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 38992232)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3149 (class 0 OID 38992293)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a0-a6ad-ddbf-febdf220861c	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a0-a6ad-a31d-6aff1cca84ed	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a0-a6ad-b17c-3c0303e0234e	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3205 (class 0 OID 38992914)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a0-a6ae-64ee-f98d11d70e04	000d0000-56a0-a6ae-6794-a30399a1d192	\N	00090000-56a0-a6ad-305a-666fc507bfcf	000b0000-56a0-a6ae-a395-c99ac71a246a	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a0-a6ae-087f-4ba6e5cac293	000d0000-56a0-a6ae-3a63-36d749e45fdd	00100000-56a0-a6ad-f012-52441b693d62	00090000-56a0-a6ad-7118-e8f55c132c47	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a0-a6ae-242d-27f5daf1f21e	000d0000-56a0-a6ae-57ad-1a6e3c6e74aa	00100000-56a0-a6ae-2c79-e9f79ab20a01	00090000-56a0-a6ad-2dbd-54701072569e	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a0-a6ae-a5e9-cec06b5dbdf8	000d0000-56a0-a6ae-181f-f64defe37f7f	\N	00090000-56a0-a6ad-a334-aa1923ae85b3	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a0-a6ae-4276-e59921869436	000d0000-56a0-a6ae-4eb7-e9e2dfe625de	\N	00090000-56a0-a6ad-f16c-2c072b59ecbd	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a0-a6ae-3ed0-98aa6f3383cb	000d0000-56a0-a6ae-119d-c7a1fca43501	\N	00090000-56a0-a6ad-fc21-36ecf87db50e	000b0000-56a0-a6ae-fc11-9b0d0409958a	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a0-a6ae-af4c-4f721a55c2bb	000d0000-56a0-a6ae-6528-301b61d5e6cb	00100000-56a0-a6ae-156a-deb09b9a4690	00090000-56a0-a6ad-6bf0-9c16e20d10d7	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a0-a6ae-5494-8ced3202a497	000d0000-56a0-a6ae-aa2f-90be56fe7ef3	\N	00090000-56a0-a6ad-19eb-5754a4d1e77c	000b0000-56a0-a6ae-1700-b65e5d0e426f	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a0-a6ae-975d-f0072c99c0eb	000d0000-56a0-a6ae-6528-301b61d5e6cb	00100000-56a0-a6ae-1758-46d0aa6dd1e3	00090000-56a0-a6ad-9283-e9a009ffeba1	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a0-a6ae-b991-37b2ffda974b	000d0000-56a0-a6ae-6528-301b61d5e6cb	00100000-56a0-a6ae-3d1b-c18106d50529	00090000-56a0-a6ad-6e0e-445ee926c9f3	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a0-a6ae-c149-972920ecb1ad	000d0000-56a0-a6ae-6528-301b61d5e6cb	00100000-56a0-a6ae-7a51-c5d49e09ed46	00090000-56a0-a6ad-63a5-bf4f91048f07	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a0-a6ae-4d67-972c432b083c	000d0000-56a0-a6ae-407f-7f1c2812cdf1	00100000-56a0-a6ad-f012-52441b693d62	00090000-56a0-a6ad-7118-e8f55c132c47	000b0000-56a0-a6ae-6506-79162afc7226	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a0-a6ae-b981-be2b7c0721a5	000d0000-56a0-a6ae-cebf-5207a545cf73	\N	00090000-56a0-a6ad-19eb-5754a4d1e77c	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a0-a6ae-2e09-91e7d31b35e3	000d0000-56a0-a6ae-cebf-5207a545cf73	\N	00090000-56a0-a6ad-e764-8fb06435e6de	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a0-a6ae-94c5-1373dc814335	000d0000-56a0-a6ae-eee5-6cd2634469a1	00100000-56a0-a6ae-2c79-e9f79ab20a01	00090000-56a0-a6ad-2dbd-54701072569e	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a0-a6ae-36e0-64eef05d2b7e	000d0000-56a0-a6ae-eee5-6cd2634469a1	\N	00090000-56a0-a6ad-e764-8fb06435e6de	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a0-a6ae-bf9d-c885131481af	000d0000-56a0-a6ae-b8c6-9cedf050d57e	\N	00090000-56a0-a6ad-e764-8fb06435e6de	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a0-a6ae-2aa0-7eb4c17811b2	000d0000-56a0-a6ae-b8c6-9cedf050d57e	\N	00090000-56a0-a6ad-19eb-5754a4d1e77c	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a0-a6ae-6831-c53b51cc8ca5	000d0000-56a0-a6ae-926f-d8e6c675a661	00100000-56a0-a6ae-156a-deb09b9a4690	00090000-56a0-a6ad-6bf0-9c16e20d10d7	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a0-a6ae-131a-48c031fd86ac	000d0000-56a0-a6ae-926f-d8e6c675a661	\N	00090000-56a0-a6ad-e764-8fb06435e6de	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a0-a6ae-bde2-0657b29f7eb3	000d0000-56a0-a6ae-04d6-02be44f96d71	\N	00090000-56a0-a6ad-e764-8fb06435e6de	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a0-a6ae-007d-9ec4088c4249	000d0000-56a0-a6ae-04d6-02be44f96d71	00100000-56a0-a6ae-156a-deb09b9a4690	00090000-56a0-a6ad-6bf0-9c16e20d10d7	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a0-a6ae-e782-7deee0bfe306	000d0000-56a0-a6ae-6e54-b018ddf3d93a	\N	00090000-56a0-a6ad-e764-8fb06435e6de	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a0-a6ae-87cf-fc43ca94a950	000d0000-56a0-a6ae-250d-25c9faa17781	\N	00090000-56a0-a6ad-19eb-5754a4d1e77c	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a0-a6ae-fe65-c7b264a3aebc	000d0000-56a0-a6ae-d601-701786637d23	\N	00090000-56a0-a6ad-19eb-5754a4d1e77c	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a0-a6ae-5f3a-4d5aa82cafd0	000d0000-56a0-a6ae-d601-701786637d23	00100000-56a0-a6ae-2c79-e9f79ab20a01	00090000-56a0-a6ad-2dbd-54701072569e	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a0-a6ae-5e66-48e1d50dfab1	000d0000-56a0-a6ae-2361-de11f4503dbd	\N	00090000-56a0-a6ad-e16c-db2304dd7113	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a0-a6ae-9a73-5b60a3cc029f	000d0000-56a0-a6ae-2361-de11f4503dbd	\N	00090000-56a0-a6ad-1516-61e73e8ac1b9	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a0-a6ae-93ac-5f81815e0cc8	000d0000-56a0-a6ae-1b93-7f51cfd156d2	\N	00090000-56a0-a6ad-19eb-5754a4d1e77c	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a0-a6ae-642e-13bc5963b645	000d0000-56a0-a6ae-1b93-7f51cfd156d2	00100000-56a0-a6ae-2c79-e9f79ab20a01	00090000-56a0-a6ad-2dbd-54701072569e	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a0-a6ae-5267-8c72afac04db	000d0000-56a0-a6ae-1b93-7f51cfd156d2	\N	00090000-56a0-a6ad-1516-61e73e8ac1b9	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a0-a6ae-e735-d63ec08dcd0e	000d0000-56a0-a6ae-1b93-7f51cfd156d2	\N	00090000-56a0-a6ad-e16c-db2304dd7113	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a0-a6ae-be19-aaaf727cc953	000d0000-56a0-a6ae-1c40-00932dc3d641	\N	00090000-56a0-a6ad-19eb-5754a4d1e77c	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a0-a6ae-645d-2fa5a2cf6a1f	000d0000-56a0-a6ae-8cb0-eb65a30119da	00100000-56a0-a6ae-2c79-e9f79ab20a01	00090000-56a0-a6ad-2dbd-54701072569e	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a0-a6ae-2246-62937c11d809	000d0000-56a0-a6ae-8cb0-eb65a30119da	\N	00090000-56a0-a6ad-e764-8fb06435e6de	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3204 (class 0 OID 38992898)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 38992286)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3195 (class 0 OID 38992775)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a0-a6ae-1180-ab50b726a7b3	00160000-56a0-a6ad-658a-3fce79b0f245	00090000-56a0-a6ad-1516-61e73e8ac1b9	aizv	10	t
003d0000-56a0-a6ae-ec03-6294c97fca7d	00160000-56a0-a6ad-658a-3fce79b0f245	00090000-56a0-a6ad-9f99-fe8b07719e33	apri	14	t
003d0000-56a0-a6ae-ecb0-5e1642543d88	00160000-56a0-a6ad-e3cc-b1a3952579bf	00090000-56a0-a6ad-e16c-db2304dd7113	aizv	11	t
003d0000-56a0-a6ae-0ede-de9aefc3b63c	00160000-56a0-a6ad-f932-69eab97ed8ed	00090000-56a0-a6ad-4d54-7b7ac0f1c6fa	aizv	12	t
003d0000-56a0-a6ae-0a07-6a4e8daa105a	00160000-56a0-a6ad-658a-3fce79b0f245	00090000-56a0-a6ad-e764-8fb06435e6de	apri	18	f
\.


--
-- TOC entry 3198 (class 0 OID 38992805)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a0-a6ad-658a-3fce79b0f245	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a0-a6ad-e3cc-b1a3952579bf	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a0-a6ad-f932-69eab97ed8ed	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3219 (class 0 OID 38993217)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 38992610)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 38992535)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a0-a6ae-c181-0811bd6bbb50	\N	00200000-56a0-a6ae-eba0-303ed1547bfd	\N	\N	\N	00220000-56a0-a6ad-54bc-ddc3a9ef34b4	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1	\N
00180000-56a0-a6ae-0f31-d656b0191f11	\N	00200000-56a0-a6ae-e310-5ab94e60a0b9	\N	\N	\N	00220000-56a0-a6ad-54bc-ddc3a9ef34b4	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2	\N
00180000-56a0-a6ae-4460-16d79ab86018	\N	00200000-56a0-a6ae-822e-d51e3733b7c5	\N	\N	\N	00220000-56a0-a6ad-2ec1-b3d66760f6ca	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3	\N
00180000-56a0-a6ae-cb27-b553a97f3f6d	\N	00200000-56a0-a6ae-8545-a4ec3f054b84	\N	\N	\N	00220000-56a0-a6ad-d00a-3e5547447902	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4	\N
00180000-56a0-a6ae-892b-04d5b7faacd3	\N	00200000-56a0-a6ae-ee57-8c19a6e5a745	\N	\N	\N	00220000-56a0-a6ad-fb3f-b581e51878b4	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5	\N
00180000-56a0-a6ae-f7d9-f2773f8c2d7b	001b0000-56a0-a6ae-0f70-9b47204f78de	\N	\N	\N	\N	00220000-56a0-a6ad-5950-2567f851f35c	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1	\N
\.


--
-- TOC entry 3170 (class 0 OID 38992561)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 38992566)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 38993139)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 38992439)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a0-a6aa-99a0-c911a268ad2b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a0-a6aa-c1b2-68a64d0134da	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a0-a6aa-0ea5-2a3b2f2a11c0	AL	ALB	008	Albania 	Albanija	\N
00040000-56a0-a6aa-afc2-3f0b19e4b3d8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a0-a6aa-3b0f-a75509454263	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a0-a6aa-76c6-9d6ddde0ab28	AD	AND	020	Andorra 	Andora	\N
00040000-56a0-a6aa-0ef0-2c7c0e20cc29	AO	AGO	024	Angola 	Angola	\N
00040000-56a0-a6aa-068f-8ebd44eed9d8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a0-a6aa-ad82-3ed3aabc70b9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a0-a6aa-71f0-b7c669b11442	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a0-a6aa-6dce-e6601bb8899c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a0-a6aa-7fb3-aa5d46e12c9a	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a0-a6aa-85e4-666204677bed	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a0-a6aa-d69f-5a970d7b75c0	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a0-a6aa-b808-20da28ec8702	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a0-a6aa-abf6-6f158f404d54	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a0-a6aa-ee5a-16488684e1e9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a0-a6aa-e7da-c336dd230218	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a0-a6aa-46df-5d15df612c3c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a0-a6aa-dbcd-be21b2d45cee	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a0-a6aa-2aa0-563ed6193633	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a0-a6aa-3e12-121f10838491	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a0-a6aa-183b-0fa6757a2fce	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a0-a6aa-a2a0-44880101cf73	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a0-a6aa-096f-3c85845d5467	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a0-a6aa-c462-f37f2d591ea2	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a0-a6aa-9dcb-fefbb91d006e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a0-a6aa-70dc-1d29e57efa41	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a0-a6aa-d305-ede1ab574e40	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a0-a6aa-7e7d-ce0c6f7e6d2e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a0-a6aa-ac69-07cd8405da51	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a0-a6aa-e2e4-c57209cb0916	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a0-a6aa-98a6-0b87a33f75ef	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a0-a6aa-d03f-3ad2d3682319	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a0-a6aa-a5a5-4c11d482035b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a0-a6aa-472c-87c5b9f9ee7d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a0-a6aa-120e-6a1a064116cd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a0-a6aa-f23e-82a14ec26aaf	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a0-a6aa-aa29-5dd9049c2938	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a0-a6aa-9c02-9908c0d2f7e8	CA	CAN	124	Canada 	Kanada	\N
00040000-56a0-a6aa-45f4-0507a87d6046	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a0-a6aa-cb53-60105933f525	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a0-a6aa-7192-d1a18a15b175	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a0-a6aa-e429-276c3d085824	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a0-a6aa-9fb6-9bd174e01551	CL	CHL	152	Chile 	Čile	\N
00040000-56a0-a6aa-179b-4ee486b07505	CN	CHN	156	China 	Kitajska	\N
00040000-56a0-a6aa-5aa0-6b99a9756ff1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a0-a6aa-bf8c-3b976f575c90	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a0-a6aa-c373-fa3077dbb793	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a0-a6aa-9a03-4917519d4548	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a0-a6aa-7376-94e0bf702f02	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a0-a6aa-5b7e-cc367fd9ac80	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a0-a6aa-e146-08e1c17070c7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a0-a6aa-8b32-384b1949e643	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a0-a6aa-39bb-6c6ee9fb3696	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a0-a6aa-2143-04ff1ebee145	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a0-a6aa-52e1-9374c7220bcb	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a0-a6aa-922e-1729ec1daa1f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a0-a6aa-baed-85b9f12a2b79	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a0-a6aa-79a0-864a538c00b1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a0-a6aa-fc6b-9cde77b9352b	DK	DNK	208	Denmark 	Danska	\N
00040000-56a0-a6aa-025b-786982b42f57	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a0-a6aa-8ab1-d794435d1318	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a0-a6aa-9a5f-7a3b76fc50f4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a0-a6aa-6fb3-a7261dba3231	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a0-a6aa-7d80-4773fe5fa491	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a0-a6aa-f585-91cabe3b5b52	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a0-a6aa-2d4c-0efd1723e678	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a0-a6aa-7fe4-073c8b87a89b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a0-a6aa-3e06-b2954dde1811	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a0-a6aa-455e-be3aa19e041b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a0-a6aa-cf43-136f448e0706	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a0-a6aa-f6a4-7eb8ad6f8e62	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a0-a6aa-e072-721602b8cab5	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a0-a6aa-0abc-71a86c7341f3	FI	FIN	246	Finland 	Finska	\N
00040000-56a0-a6aa-76ab-66d50de70bfc	FR	FRA	250	France 	Francija	\N
00040000-56a0-a6aa-ac91-d3def7144594	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a0-a6aa-f612-827aad6c0fbf	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a0-a6aa-bbcf-a9bda910f06f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a0-a6aa-0829-e0a023f63279	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a0-a6aa-e53c-72ddc516c768	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a0-a6aa-1f21-843270d1a2cd	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a0-a6aa-2d5d-06c813991465	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a0-a6aa-0cb0-38a0d0f408a7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a0-a6aa-b758-12e3629aaabe	GH	GHA	288	Ghana 	Gana	\N
00040000-56a0-a6aa-14a5-1f5fcad077f1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a0-a6aa-38da-7202bdf5463f	GR	GRC	300	Greece 	Grčija	\N
00040000-56a0-a6aa-a086-6d43aef15903	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a0-a6aa-e644-e7d4f0ec846b	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a0-a6aa-b3b6-f665b25bc137	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a0-a6aa-b9ec-e2f444908fff	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a0-a6aa-48ca-e3516da07fe0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a0-a6aa-10a9-50a7fcdd244d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a0-a6aa-18a4-4433b0c365ba	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a0-a6aa-70df-28c9a280a5bc	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a0-a6aa-7c77-3693db40bee5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a0-a6aa-2ac8-f435371f4d0e	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a0-a6aa-36f8-5fd4615cb8e3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a0-a6aa-361d-fb35ac6409c7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a0-a6aa-cf99-81cdc753fb5f	HN	HND	340	Honduras 	Honduras	\N
00040000-56a0-a6aa-9163-3cb1c459a78a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a0-a6aa-b23c-54f474143828	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a0-a6aa-5cdf-373e8121568e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a0-a6aa-33ba-4348bad1a7f8	IN	IND	356	India 	Indija	\N
00040000-56a0-a6aa-fa5a-8d013f29afbc	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a0-a6aa-7243-cbe7d92a56ea	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a0-a6aa-ddde-83132ce51513	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a0-a6aa-dd71-254ae4accabf	IE	IRL	372	Ireland 	Irska	\N
00040000-56a0-a6aa-b33f-4212f42a2817	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a0-a6aa-09a1-4454927222bb	IL	ISR	376	Israel 	Izrael	\N
00040000-56a0-a6aa-b47b-03bf9713526a	IT	ITA	380	Italy 	Italija	\N
00040000-56a0-a6aa-0bca-cb5e6c8cbc56	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a0-a6aa-8f10-e019ca694dd7	JP	JPN	392	Japan 	Japonska	\N
00040000-56a0-a6aa-3c29-af9a0ee1ca52	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a0-a6aa-d94f-c6af3be0bf9d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a0-a6aa-5cda-e1dbc92e48bc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a0-a6aa-cfd8-5c8273831c02	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a0-a6aa-0228-fd3185e2024a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a0-a6aa-07a0-6b13eb132014	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a0-a6aa-a03b-536be142d442	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a0-a6aa-d7f4-2a2aae3db375	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a0-a6aa-2c1c-4fa7f43f3e09	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a0-a6aa-b947-67eafa824b2a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a0-a6aa-cffd-7274b37e475a	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a0-a6aa-c01b-2b07372f77dc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a0-a6aa-24fa-2658408376c0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a0-a6aa-f8c4-b3bcd554475b	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a0-a6aa-8bfd-70f8428020e1	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a0-a6aa-c8d1-8cbbacfc84e7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a0-a6aa-1667-00d63c91f24d	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a0-a6aa-9f1f-e9c5ff28af80	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a0-a6aa-3cf6-9998c9c3a8d9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a0-a6aa-8241-5aa326536801	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a0-a6aa-e09c-86cea2e38fd5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a0-a6aa-4f8e-f67811ed3d6c	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a0-a6aa-b739-3173fa558970	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a0-a6aa-d570-b941ca9841e4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a0-a6aa-cfd6-919c43017fd4	ML	MLI	466	Mali 	Mali	\N
00040000-56a0-a6aa-aac5-fefb759851e1	MT	MLT	470	Malta 	Malta	\N
00040000-56a0-a6aa-4c26-d1610d1d124d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a0-a6aa-c234-d81e443dbd6a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a0-a6aa-3d04-3dd78addadbe	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a0-a6aa-55ac-f993ad0157e6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a0-a6aa-a1f2-9fe8435edfae	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a0-a6aa-b69d-66786f8d7a76	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a0-a6aa-1be1-0fa4c872a4b1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a0-a6aa-a049-2d58606cc0d9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a0-a6aa-c4a9-9fe4d7ff664f	MC	MCO	492	Monaco 	Monako	\N
00040000-56a0-a6aa-0ab9-cd08567a6f7e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a0-a6aa-1b63-de47c64d86fe	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a0-a6aa-b24d-2357398aaa2c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a0-a6aa-5c69-feed0cb3d7ae	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a0-a6aa-7055-7102c47a9ef2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a0-a6aa-51c4-3f07064dbd6a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a0-a6aa-2783-f94c5283a75e	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a0-a6aa-9b84-e37dab310f3a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a0-a6aa-8442-146b8b6f792c	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a0-a6aa-85ed-eb8f3ce3d2a5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a0-a6aa-a63a-5a35acfd878f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a0-a6aa-1d85-0085362d5451	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a0-a6aa-9a96-ae6988b9ba54	NE	NER	562	Niger 	Niger 	\N
00040000-56a0-a6aa-910f-fbcc137c2b7c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a0-a6aa-9a54-84cb696c932c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a0-a6aa-ad88-f78faf40c55b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a0-a6aa-e955-4fd4e9bd9174	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a0-a6aa-6ccf-1dc9aa1a1bb4	NO	NOR	578	Norway 	Norveška	\N
00040000-56a0-a6aa-0b7f-dbbbf1dbca49	OM	OMN	512	Oman 	Oman	\N
00040000-56a0-a6aa-eca7-6306415d0c35	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a0-a6aa-3922-a559b68bfb4c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a0-a6aa-bda6-1e5a695c7847	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a0-a6aa-b9e4-4f6abe278ea0	PA	PAN	591	Panama 	Panama	\N
00040000-56a0-a6aa-3325-71e5b39d381e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a0-a6aa-8c45-1883ea829c4f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a0-a6aa-f07e-c9df4d233d73	PE	PER	604	Peru 	Peru	\N
00040000-56a0-a6aa-dabb-867c016571ff	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a0-a6aa-7f81-c5f185de4d12	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a0-a6aa-b492-989a8016f5a0	PL	POL	616	Poland 	Poljska	\N
00040000-56a0-a6aa-f9bb-5ad4096480a6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a0-a6aa-d145-21e6e3990a79	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a0-a6aa-ec95-9751fc989ba8	QA	QAT	634	Qatar 	Katar	\N
00040000-56a0-a6aa-16d0-4cf80ab8c65e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a0-a6aa-f151-7e165c30e256	RO	ROU	642	Romania 	Romunija	\N
00040000-56a0-a6aa-ea61-a009da42bf15	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a0-a6aa-dc93-70efbb9d9a4a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a0-a6aa-71d6-0c8e11d04ee8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a0-a6aa-7a50-d08994dd49af	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a0-a6aa-046b-160fab26c65a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a0-a6aa-f314-a04d825ac62a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a0-a6aa-9737-98a7bd0c55aa	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a0-a6aa-2b25-9ae43ba798ef	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a0-a6aa-b44b-6b4521113c77	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a0-a6aa-2779-c03c58cc9f47	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a0-a6aa-68b3-f7c1acbe1355	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a0-a6aa-3106-daceb328d1d8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a0-a6aa-7223-b422eb57e3fa	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a0-a6aa-5317-2d4cd85b768c	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a0-a6aa-9774-3fa9362315a8	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a0-a6aa-ced6-6cf638b92cff	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a0-a6aa-d18e-361c3ef6027e	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a0-a6aa-28b4-d29dcfd7bacb	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a0-a6aa-29fb-56988178acf7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a0-a6aa-b8ed-dbcb5f9e8e5b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a0-a6aa-71c9-05b4b6b6043b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a0-a6aa-d716-0dbd46819308	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a0-a6aa-ca7c-fb2e7ea55a2d	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a0-a6aa-8d58-1cf8a119f704	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a0-a6aa-4ea2-b6b2ecb95e83	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a0-a6aa-ab76-77290fd93e11	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a0-a6aa-8621-d0927f66be08	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a0-a6aa-69f2-fa42f30d0a3f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a0-a6aa-3800-052776ff09d4	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a0-a6aa-4e9c-757a984374d0	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a0-a6aa-69c8-67f9471ba003	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a0-a6aa-bfa7-d439ebb3cd82	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a0-a6aa-036f-6d6e7b3bbd34	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a0-a6aa-1d51-15362bef1d77	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a0-a6aa-1e08-10358ad0df31	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a0-a6aa-b0df-a18e0706658a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a0-a6aa-3fba-6e9d11c84414	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a0-a6aa-de21-e0d3136c2ec2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a0-a6aa-ca4c-db91b5bd9b5a	TH	THA	764	Thailand 	Tajska	\N
00040000-56a0-a6aa-0ee4-307cdd4bd2a6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a0-a6aa-a42d-36e7e3a64668	TG	TGO	768	Togo 	Togo	\N
00040000-56a0-a6aa-f588-2201f5facbcd	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a0-a6aa-6936-7637fd06fa0c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a0-a6aa-ee42-deac950283d6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a0-a6aa-880b-be35cdde2e30	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a0-a6aa-35b2-18991283d598	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a0-a6aa-f9f7-2cce1cd77dec	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a0-a6aa-4997-74a87a02c813	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a0-a6aa-268d-341c112b0799	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a0-a6aa-0c82-db8ffe22e364	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a0-a6aa-ddbd-2cfee85e8afa	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a0-a6aa-bfd8-505dcaa44000	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a0-a6aa-52b2-a96ae2b148b3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a0-a6aa-267d-292e17aafa3e	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a0-a6aa-435d-ed9b87d4e589	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a0-a6aa-ee9a-69cfb1c8e94a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a0-a6aa-f5cc-15895fb89331	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a0-a6aa-4eee-79726b50363b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a0-a6aa-b808-5b369e6d8d61	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a0-a6aa-900b-e0f54cbd514c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a0-a6aa-83c9-f0e116874c0b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a0-a6aa-d0dc-048cde127184	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a0-a6aa-8550-c7508b710a61	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a0-a6aa-2b59-254cb2d68579	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a0-a6aa-3cca-bd9fc92bb08a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a0-a6aa-fb10-447887924b91	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a0-a6aa-45e0-5e189d167c8b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3206 (class 0 OID 38992927)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a0-a6ae-9e08-ad0f06a3b56b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a0-a6ae-ed3a-c6c5d6e9da29	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a0-a6ae-0951-6f03896a1950	000e0000-56a0-a6ae-f16e-80a54f7b1d8f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a0-a6aa-55e3-7ccc9921188f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a0-a6ae-1d01-787957228636	000e0000-56a0-a6ae-fd41-79b75c91a766	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a0-a6aa-eb06-5b400a2e8bb5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a0-a6ae-08b4-061a2e153e1b	000e0000-56a0-a6ae-95a3-329aded74170	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a0-a6aa-55e3-7ccc9921188f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3191 (class 0 OID 38992733)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a0-a6ae-62ee-4aa8d1214073	000e0000-56a0-a6ae-fd41-79b75c91a766	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a0-a6aa-8cd2-286f1cbeee5c
000d0000-56a0-a6ae-a6a3-9f6597fb744a	000e0000-56a0-a6ae-dafd-2cc24157985e	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a0-a6aa-9b06-68a29ab35d0c
000d0000-56a0-a6ae-6c52-58036b0881b8	000e0000-56a0-a6ae-dafd-2cc24157985e	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-6794-a30399a1d192	000e0000-56a0-a6ae-fd41-79b75c91a766	000c0000-56a0-a6ae-64ee-f98d11d70e04	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a0-a6aa-9b06-68a29ab35d0c
000d0000-56a0-a6ae-3a63-36d749e45fdd	000e0000-56a0-a6ae-fd41-79b75c91a766	000c0000-56a0-a6ae-087f-4ba6e5cac293	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-57ad-1a6e3c6e74aa	000e0000-56a0-a6ae-fd41-79b75c91a766	000c0000-56a0-a6ae-242d-27f5daf1f21e	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a0-a6aa-5a28-ca5841b07526
000d0000-56a0-a6ae-181f-f64defe37f7f	000e0000-56a0-a6ae-fd41-79b75c91a766	000c0000-56a0-a6ae-a5e9-cec06b5dbdf8	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a0-a6aa-8cd2-286f1cbeee5c
000d0000-56a0-a6ae-4eb7-e9e2dfe625de	000e0000-56a0-a6ae-fd41-79b75c91a766	000c0000-56a0-a6ae-4276-e59921869436	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a0-a6aa-8cd2-286f1cbeee5c
000d0000-56a0-a6ae-119d-c7a1fca43501	000e0000-56a0-a6ae-fd41-79b75c91a766	000c0000-56a0-a6ae-3ed0-98aa6f3383cb	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a0-a6aa-9b06-68a29ab35d0c
000d0000-56a0-a6ae-6528-301b61d5e6cb	000e0000-56a0-a6ae-fd41-79b75c91a766	000c0000-56a0-a6ae-975d-f0072c99c0eb	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a0-a6aa-9b06-68a29ab35d0c
000d0000-56a0-a6ae-aa2f-90be56fe7ef3	000e0000-56a0-a6ae-fd41-79b75c91a766	000c0000-56a0-a6ae-5494-8ced3202a497	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a0-a6aa-c4b3-b3d8d898f7e1
000d0000-56a0-a6ae-407f-7f1c2812cdf1	000e0000-56a0-a6ae-fd41-79b75c91a766	000c0000-56a0-a6ae-4d67-972c432b083c	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a0-a6aa-da1c-80723ac79fb3
000d0000-56a0-a6ae-cebf-5207a545cf73	000e0000-56a0-a6ae-53f6-c6ffb8096f9b	000c0000-56a0-a6ae-b981-be2b7c0721a5	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-eee5-6cd2634469a1	000e0000-56a0-a6ae-c128-960c481f51a1	000c0000-56a0-a6ae-94c5-1373dc814335	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-b8c6-9cedf050d57e	000e0000-56a0-a6ae-c128-960c481f51a1	000c0000-56a0-a6ae-bf9d-c885131481af	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-926f-d8e6c675a661	000e0000-56a0-a6ae-e23f-c13e4c38f19d	000c0000-56a0-a6ae-6831-c53b51cc8ca5	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-04d6-02be44f96d71	000e0000-56a0-a6ae-e186-c6cea4ae4dec	000c0000-56a0-a6ae-bde2-0657b29f7eb3	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-6e54-b018ddf3d93a	000e0000-56a0-a6ae-a898-67dda106c256	000c0000-56a0-a6ae-e782-7deee0bfe306	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-250d-25c9faa17781	000e0000-56a0-a6ae-e9b3-8bfae322ab4a	000c0000-56a0-a6ae-87cf-fc43ca94a950	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-d601-701786637d23	000e0000-56a0-a6ae-3765-dce6fff76582	000c0000-56a0-a6ae-fe65-c7b264a3aebc	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-2361-de11f4503dbd	000e0000-56a0-a6ae-cd44-bc9e4c2b5c8f	000c0000-56a0-a6ae-5e66-48e1d50dfab1	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-1b93-7f51cfd156d2	000e0000-56a0-a6ae-cd44-bc9e4c2b5c8f	000c0000-56a0-a6ae-93ac-5f81815e0cc8	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-1c40-00932dc3d641	000e0000-56a0-a6ae-1340-b9456e848985	000c0000-56a0-a6ae-be19-aaaf727cc953	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
000d0000-56a0-a6ae-8cb0-eb65a30119da	000e0000-56a0-a6ae-1340-b9456e848985	000c0000-56a0-a6ae-645d-2fa5a2cf6a1f	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a0-a6aa-52a5-f61928b1e7f3
\.


--
-- TOC entry 3166 (class 0 OID 38992509)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 38992479)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 38992456)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a0-a6ae-8dd1-7d38bb2bfdad	00080000-56a0-a6ad-9e5e-62339b42753b	00090000-56a0-a6ad-6e0e-445ee926c9f3	AK		igralka
\.


--
-- TOC entry 3180 (class 0 OID 38992646)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 38993197)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a0-a6ad-4808-6d6bc5df8a52	00010000-56a0-a6ac-697b-747821183131	\N	Prva mapa	Root mapa	2016-01-21 10:36:45	2016-01-21 10:36:45	R	\N	\N
\.


--
-- TOC entry 3218 (class 0 OID 38993210)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3220 (class 0 OID 38993232)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 34548309)
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
-- TOC entry 3184 (class 0 OID 38992671)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 38992413)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a0-a6ac-04af-3c7b60199db5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a0-a6ac-3107-6e1b78a8c6a0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a0-a6ac-4e6b-439030054410	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a0-a6ac-1fa0-e5d7e1f71496	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a0-a6ac-102a-003c6feb201a	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a0-a6ac-f503-54de23696483	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a0-a6ac-a0b9-398018bc8832	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a0-a6ac-b8be-59e4f0537660	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a0-a6ac-18f2-2c44e024d29a	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a0-a6ac-9182-da51ae19170e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a0-a6ac-7598-f01928715522	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a0-a6ac-4cea-d97e70a2d80b	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a0-a6ac-45b4-1461913332b8	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a0-a6ac-27a8-b9852db20c97	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a0-a6ac-e5a4-bb428d071776	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a0-a6ac-6e7f-129179b3e74b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a0-a6ac-555f-0ae4348634d9	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a0-a6ad-f1ae-32ed0e597040	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a0-a6ad-d110-0ee39a75a294	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a0-a6ad-a65e-4885c773af8b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a0-a6ad-724d-5275aaae8c5e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a0-a6ad-5018-60d746a00d79	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a0-a6af-b60d-ef4fe74eb805	application.tenant.maticnopodjetje	string	s:36:"00080000-56a0-a6af-d321-7f2a02702489";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3151 (class 0 OID 38992313)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a0-a6ad-62f8-efe35c90e7d5	00000000-56a0-a6ad-f1ae-32ed0e597040	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a0-a6ad-6537-6d4ad5d24e28	00000000-56a0-a6ad-f1ae-32ed0e597040	00010000-56a0-a6ac-697b-747821183131	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a0-a6ad-1fc7-b4feb5a4c800	00000000-56a0-a6ad-d110-0ee39a75a294	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3155 (class 0 OID 38992380)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a0-a6ae-ef59-628c8784350c	\N	00100000-56a0-a6ad-f012-52441b693d62	00100000-56a0-a6ae-2c79-e9f79ab20a01	01	Gledališče Nimbis
00410000-56a0-a6ae-6e08-f8a47f7fbc35	00410000-56a0-a6ae-ef59-628c8784350c	00100000-56a0-a6ad-f012-52441b693d62	00100000-56a0-a6ae-2c79-e9f79ab20a01	02	Tehnika
\.


--
-- TOC entry 3152 (class 0 OID 38992324)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a0-a6ad-305a-666fc507bfcf	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a0-a6ad-a334-aa1923ae85b3	00010000-56a0-a6ad-e0f7-73a5c7d44f02	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a0-a6ad-2dbd-54701072569e	00010000-56a0-a6ad-711e-35ceb1d0db1a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a0-a6ad-9283-e9a009ffeba1	00010000-56a0-a6ad-5bee-ff6b0695fd11	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a0-a6ad-4790-ee062b825967	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a0-a6ad-fc21-36ecf87db50e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a0-a6ad-63a5-bf4f91048f07	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a0-a6ad-6bf0-9c16e20d10d7	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a0-a6ad-6e0e-445ee926c9f3	00010000-56a0-a6ad-b362-8ff483fa383b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a0-a6ad-7118-e8f55c132c47	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a0-a6ad-5305-234b831390f4	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a0-a6ad-f16c-2c072b59ecbd	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a0-a6ad-19eb-5754a4d1e77c	00010000-56a0-a6ad-c391-f3d2dfee79af	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a0-a6ad-1516-61e73e8ac1b9	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a0-a6ad-9f99-fe8b07719e33	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a0-a6ad-e16c-db2304dd7113	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a0-a6ad-4d54-7b7ac0f1c6fa	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a0-a6ad-e764-8fb06435e6de	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a0-a6ad-bb6b-1981dbd14612	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a0-a6ad-797f-bea8bd1d853e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a0-a6ad-f717-41cc015195dd	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 38992258)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a0-a6ab-b186-ad4f816b0ea8	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a0-a6ab-e015-9c50f498e8af	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a0-a6ab-e790-404632efa582	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a0-a6ab-1457-8546b3d645b4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a0-a6ab-9a13-22ff38a536ed	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a0-a6ab-d6f9-6cbc0c78a942	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a0-a6ab-15fe-1a3a603db950	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a0-a6ab-9eaa-c23f7c29e7a1	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a0-a6ab-9ffd-58db36a5ef06	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a0-a6ab-e787-7714a8efd046	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a0-a6ab-8b67-1202b703e311	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a0-a6ab-c367-d41367049b7e	Abonma-read	Abonma - branje	t
00030000-56a0-a6ab-6b61-6be8a6ac919b	Abonma-write	Abonma - spreminjanje	t
00030000-56a0-a6ab-7936-de191abec26b	Alternacija-read	Alternacija - branje	t
00030000-56a0-a6ab-0da5-e958e111b92a	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a0-a6ab-c979-b0a274a248bc	Arhivalija-read	Arhivalija - branje	t
00030000-56a0-a6ab-c510-bbb923384b93	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a0-a6ab-0035-8324b3225e74	AuthStorage-read	AuthStorage - branje	t
00030000-56a0-a6ab-80ff-6a4baba47f74	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a0-a6ab-cb7c-f1b8a1745cf6	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a0-a6ab-492f-62e969a67f0f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a0-a6ab-2188-adcaf8c802be	Besedilo-read	Besedilo - branje	t
00030000-56a0-a6ab-e6e9-851a8839c173	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a0-a6ab-0337-7007b75c06c6	Dodatek-read	Dodatek - branje	t
00030000-56a0-a6ab-70d3-c683245e1316	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a0-a6ab-aea8-9f4ed588a018	Dogodek-read	Dogodek - branje	t
00030000-56a0-a6ab-1571-e366b0117c6a	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a0-a6ab-94ed-d587d827747b	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a0-a6ab-c57b-f3be4218ab36	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a0-a6ab-7f47-23b2d26de02e	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a0-a6ab-ddbe-bc5c7a6dad56	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a0-a6ab-38ca-e1e3c9ee0616	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a0-a6ab-b62e-cd3e23d93ab0	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a0-a6ab-4769-935a65e9950c	DrugiVir-read	DrugiVir - branje	t
00030000-56a0-a6ab-02eb-eba396ca2a12	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a0-a6ab-f54b-7ba228350d61	Drzava-read	Drzava - branje	t
00030000-56a0-a6ab-8dc4-f1bd87ef08fd	Drzava-write	Drzava - spreminjanje	t
00030000-56a0-a6ab-95fc-fc7d9493623d	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a0-a6ab-93f4-ae6c91035871	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a0-a6ab-a364-d23d1a6df776	Funkcija-read	Funkcija - branje	t
00030000-56a0-a6ab-cb3c-a8f0cccc772b	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a0-a6ab-47de-9ad4ba7997e7	Gostovanje-read	Gostovanje - branje	t
00030000-56a0-a6ab-b302-c4f813154310	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a0-a6ab-5424-66f5e515e946	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a0-a6ab-39ef-42c1f3d440c1	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a0-a6ab-c5a7-cbe98a384e45	Kupec-read	Kupec - branje	t
00030000-56a0-a6ab-7f64-debb828e9961	Kupec-write	Kupec - spreminjanje	t
00030000-56a0-a6ab-952a-db26b745ec72	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a0-a6ab-c629-d274eaa04c4b	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a0-a6ab-9b98-277a61741c25	Option-read	Option - branje	t
00030000-56a0-a6ab-9e81-722e6d507d5e	Option-write	Option - spreminjanje	t
00030000-56a0-a6ab-7dcd-8c8620276727	OptionValue-read	OptionValue - branje	t
00030000-56a0-a6ab-4004-5f13654f97cc	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a0-a6ab-de94-a338020cd75f	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a0-a6ab-8295-fa1774d1f15d	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a0-a6ab-0603-db8a9ef4dbce	Oseba-read	Oseba - branje	t
00030000-56a0-a6ab-352f-9c748efe1a18	Oseba-write	Oseba - spreminjanje	t
00030000-56a0-a6ab-3773-f17db340630e	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a0-a6ab-bbe0-b6fb1e1b9fe8	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a0-a6ab-c920-9f3fb1e84a57	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a0-a6ab-43c9-762701ea172b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a0-a6ab-4ad6-fda48e7897e6	Pogodba-read	Pogodba - branje	t
00030000-56a0-a6ab-75c1-8c47a5e791ed	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a0-a6ab-5e64-91eff14208e2	Popa-read	Popa - branje	t
00030000-56a0-a6ab-83b7-cd982ed4b501	Popa-write	Popa - spreminjanje	t
00030000-56a0-a6ab-0534-20a72af5d9df	Posta-read	Posta - branje	t
00030000-56a0-a6ab-2426-8181b88e371f	Posta-write	Posta - spreminjanje	t
00030000-56a0-a6ab-cf84-cbf1bb1d3ba2	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a0-a6ab-5484-3db9e30bbf1f	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a0-a6ab-72ab-048400a8604b	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a0-a6ab-fb10-ae10ed12bfee	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a0-a6ab-2be2-ccfc0714f875	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a0-a6ab-ba08-5357adf79ed5	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a0-a6ab-9c5a-f7e5b8e22130	Praznik-read	Praznik - branje	t
00030000-56a0-a6ab-daf5-6413c075506d	Praznik-write	Praznik - spreminjanje	t
00030000-56a0-a6ab-4dd6-be1e1e1bb3cb	Predstava-read	Predstava - branje	t
00030000-56a0-a6ab-ac14-db85351f41fd	Predstava-write	Predstava - spreminjanje	t
00030000-56a0-a6ab-19a7-bdefc0e0fa16	Ura-read	Ura - branje	t
00030000-56a0-a6ab-7451-559234335795	Ura-write	Ura - spreminjanje	t
00030000-56a0-a6ab-fbd9-f1993f96ba9a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a0-a6ab-f650-41facdfe4658	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a0-a6ab-1132-37c92c1ba9e8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a0-a6ab-ab7a-91f8840b72a1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a0-a6ab-da5e-63969c844b3e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a0-a6ab-e133-01a3981002f0	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a0-a6ab-3a25-16e0c3a95937	ProgramDela-read	ProgramDela - branje	t
00030000-56a0-a6ab-62b5-815cc7f53b7e	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a0-a6ab-90b3-74a804ba6a6a	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a0-a6ab-edd6-49bc38947087	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a0-a6ab-adc4-ccdc6c726c62	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a0-a6ab-12a8-6fdf60a9576d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a0-a6ab-63eb-da47a8741413	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a0-a6ab-025a-d620106cde3a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a0-a6ab-3017-5ec4ae3a28a1	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a0-a6ab-a3b8-a3d78834e9ee	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a0-a6ab-8d40-f5c5c353ae89	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a0-a6ab-0c58-6acda9eefca1	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a0-a6ab-4a53-5057af352342	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a0-a6ab-ba0c-01b96baa3d54	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a0-a6ab-0f47-e3180c280d7e	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a0-a6ab-160e-6d3e7be73b72	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a0-a6ab-ed87-662511a73f53	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a0-a6ab-2f6e-e6d4b1e193ab	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a0-a6ab-8db6-23e88f67349a	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a0-a6ab-8052-57c19eaed9d3	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a0-a6ab-e1ae-03e2f75d82b2	Prostor-read	Prostor - branje	t
00030000-56a0-a6ab-fd5e-0f40f92a16f2	Prostor-write	Prostor - spreminjanje	t
00030000-56a0-a6ab-9e8d-71704216931c	Racun-read	Racun - branje	t
00030000-56a0-a6ab-821a-f986e543b701	Racun-write	Racun - spreminjanje	t
00030000-56a0-a6ab-0630-ad39578f1941	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a0-a6ab-2933-b9ba6a571e27	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a0-a6ab-ee83-159a1a103f35	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a0-a6ab-0001-a45f0186aa2b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a0-a6ab-eb71-daebd5bac931	Rekvizit-read	Rekvizit - branje	t
00030000-56a0-a6ab-39db-49bebdc63f88	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a0-a6ab-c10a-13d0430f1bfc	Revizija-read	Revizija - branje	t
00030000-56a0-a6ab-74a2-74c855c5ef65	Revizija-write	Revizija - spreminjanje	t
00030000-56a0-a6ab-1f1c-8bb80a9f411a	Rezervacija-read	Rezervacija - branje	t
00030000-56a0-a6ab-ce0a-2f26893318ac	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a0-a6ab-4da3-7a07515915aa	SedezniRed-read	SedezniRed - branje	t
00030000-56a0-a6ab-a49a-d130a88b88a9	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a0-a6ab-1cee-58087f30962f	Sedez-read	Sedez - branje	t
00030000-56a0-a6ab-3c50-ae8d0271daf9	Sedez-write	Sedez - spreminjanje	t
00030000-56a0-a6ab-2991-ab0c892612b7	Sezona-read	Sezona - branje	t
00030000-56a0-a6ab-962d-8c05905fe8bc	Sezona-write	Sezona - spreminjanje	t
00030000-56a0-a6ab-31ef-ccf3284b04ca	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a0-a6ab-0ebb-9663717535bc	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6	Telefonska-read	Telefonska - branje	t
00030000-56a0-a6ab-414d-27b39fd9391c	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a0-a6ab-8e53-2cac99795607	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a0-a6ab-1429-e5c3f845253f	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a0-a6ab-59ea-016deab13c0d	TipDodatka-read	TipDodatka - branje	t
00030000-56a0-a6ab-1894-f40ad9565a81	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a0-a6ab-9b1f-45cb851412bc	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a0-a6ab-1377-79109cdf1b57	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a0-a6ab-649c-5b5ee5667fc4	TipPopa-read	TipPopa - branje	t
00030000-56a0-a6ab-cc60-02f69c9c1982	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a0-a6ab-218b-83e182cc620e	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a0-a6ab-0879-ee85628b80f2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a0-a6ab-c659-ca66d0b6b8bb	TipVaje-read	TipVaje - branje	t
00030000-56a0-a6ab-c707-2823af8dd333	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a0-a6ab-af4e-2d071b9ed978	Trr-read	Trr - branje	t
00030000-56a0-a6ab-234d-0ba4838aad2f	Trr-write	Trr - spreminjanje	t
00030000-56a0-a6ab-633f-6a0a5c8702ea	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a0-a6ab-b422-c74026c54292	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a0-a6ab-6a3c-26a27816c608	Vaja-read	Vaja - branje	t
00030000-56a0-a6ab-04cd-7749605158e0	Vaja-write	Vaja - spreminjanje	t
00030000-56a0-a6ab-53ed-b7900308b2d2	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a0-a6ab-fd5e-1e8dde42b0f3	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a0-a6ab-6700-bd023f18ec8a	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a0-a6ab-e203-2a094c989602	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a0-a6ab-9ec8-f7911ba10164	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a0-a6ab-665c-e180e945d7d0	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a0-a6ab-09bb-91dfa642f268	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a0-a6ab-b985-0c582fb8061c	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a0-a6ab-b587-12329072d54d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a0-a6ab-ceee-ae113562e748	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a0-a6ab-b6aa-3713fe7e0e98	Job-read	Branje opravil - samo zase - branje	t
00030000-56a0-a6ab-090d-2f1e7b422869	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a0-a6ab-140d-8272eaa69621	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a0-a6ab-bcae-3112290a8086	Report-read	Report - branje	t
00030000-56a0-a6ab-b567-90c6af9a7f65	Report-write	Report - spreminjanje	t
00030000-56a0-a6ab-f08f-7bc5515d3e03	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a0-a6ab-874e-9c23abb29947	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a0-a6ab-8ce8-f173b7661f63	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a0-a6ab-d70d-7e137cc7cbe5	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a0-a6ab-a15e-02a6f671cf47	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a0-a6ab-6864-427954ab15ba	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a0-a6ab-d1a4-f24d964b01ae	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a0-a6ab-adfc-b4a7f9b9ade8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a0-a6ab-725d-92e1ab41d1ad	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a0-a6ab-e57f-ca001f855955	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a0-a6ab-c3b9-6a604df767ac	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a0-a6ab-2b94-72371d695401	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a0-a6ab-90a9-8c4739e79942	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a0-a6ab-f1e2-c81eab6eba45	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a0-a6ab-5016-d40f113b40e4	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3146 (class 0 OID 38992277)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a0-a6ab-00ee-4099c69412b1	00030000-56a0-a6ab-e015-9c50f498e8af
00020000-56a0-a6ab-00ee-4099c69412b1	00030000-56a0-a6ab-b186-ad4f816b0ea8
00020000-56a0-a6ab-a699-b2c4ce4325a9	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-492f-62e969a67f0f
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-e6e9-851a8839c173
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-cb7c-f1b8a1745cf6
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-3320-5cdcd5ae736e	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-1ca4-c7f005bb6987	00030000-56a0-a6ab-cb7c-f1b8a1745cf6
00020000-56a0-a6ab-1ca4-c7f005bb6987	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-1ca4-c7f005bb6987	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-1ca4-c7f005bb6987	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-1ca4-c7f005bb6987	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-1ca4-c7f005bb6987	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-0be4-63023b4d17a0	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-0be4-63023b4d17a0	00030000-56a0-a6ab-665c-e180e945d7d0
00020000-56a0-a6ab-0be4-63023b4d17a0	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-0be4-63023b4d17a0	00030000-56a0-a6ab-9a13-22ff38a536ed
00020000-56a0-a6ab-0be4-63023b4d17a0	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-0be4-63023b4d17a0	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-0be4-63023b4d17a0	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-b6fb-1f09c3fc75f7	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-b6fb-1f09c3fc75f7	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-b6fb-1f09c3fc75f7	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-743a-4ea92a71ccd7	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-743a-4ea92a71ccd7	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-743a-4ea92a71ccd7	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-743a-4ea92a71ccd7	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-743a-4ea92a71ccd7	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-743a-4ea92a71ccd7	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-743a-4ea92a71ccd7	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-743a-4ea92a71ccd7	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-bbb5-296d715c826e	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-bbb5-296d715c826e	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-bbb5-296d715c826e	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-bbb5-296d715c826e	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-9a13-22ff38a536ed
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-234d-0ba4838aad2f
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-ba08-5357adf79ed5
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-414d-27b39fd9391c
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-4a53-aca1526035cb	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-34a7-057127c9a064	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-34a7-057127c9a064	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-34a7-057127c9a064	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-34a7-057127c9a064	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-34a7-057127c9a064	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-34a7-057127c9a064	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-34a7-057127c9a064	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-414d-27b39fd9391c
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-ba08-5357adf79ed5
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-234d-0ba4838aad2f
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-83b7-cd982ed4b501
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-39ef-42c1f3d440c1
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-e133-01a3981002f0
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-6a8a-df77595cca04	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-0679-3d8e78f86b3a	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-b3a4-93111d7c570b	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-b3a4-93111d7c570b	00030000-56a0-a6ab-cc60-02f69c9c1982
00020000-56a0-a6ab-835c-4ae78f53281c	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-9249-d4fd8f41c51c	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ab-9249-d4fd8f41c51c	00030000-56a0-a6ab-2426-8181b88e371f
00020000-56a0-a6ab-6199-d9cf54bc5012	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ab-c240-fb0d667dc289	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-c240-fb0d667dc289	00030000-56a0-a6ab-8dc4-f1bd87ef08fd
00020000-56a0-a6ab-33de-ca3ba67f0ef3	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-e28c-826dab5b61bc	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ab-e28c-826dab5b61bc	00030000-56a0-a6ab-ceee-ae113562e748
00020000-56a0-a6ab-e9e5-4b72564c4063	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ab-ea96-424037f849d9	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ab-ea96-424037f849d9	00030000-56a0-a6ab-b985-0c582fb8061c
00020000-56a0-a6ab-b4da-4d669955e701	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ab-d3bf-10123bac5a43	00030000-56a0-a6ab-c367-d41367049b7e
00020000-56a0-a6ab-d3bf-10123bac5a43	00030000-56a0-a6ab-6b61-6be8a6ac919b
00020000-56a0-a6ab-6321-8cc95bea0194	00030000-56a0-a6ab-c367-d41367049b7e
00020000-56a0-a6ab-851e-85d9409ff3bc	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ab-851e-85d9409ff3bc	00030000-56a0-a6ab-fd5e-0f40f92a16f2
00020000-56a0-a6ab-851e-85d9409ff3bc	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-851e-85d9409ff3bc	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-851e-85d9409ff3bc	00030000-56a0-a6ab-ba08-5357adf79ed5
00020000-56a0-a6ab-851e-85d9409ff3bc	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-7221-2744f689c94d	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ab-7221-2744f689c94d	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-7221-2744f689c94d	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-4e60-781f55359572	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-4e60-781f55359572	00030000-56a0-a6ab-e203-2a094c989602
00020000-56a0-a6ab-a804-1741889de693	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-5065-8d02e01ee0a0	00030000-56a0-a6ab-8295-fa1774d1f15d
00020000-56a0-a6ab-5065-8d02e01ee0a0	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-5065-8d02e01ee0a0	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-5065-8d02e01ee0a0	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-5065-8d02e01ee0a0	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-5065-8d02e01ee0a0	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-5065-8d02e01ee0a0	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-5065-8d02e01ee0a0	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-5065-8d02e01ee0a0	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-2b47-22f0e3c753d1	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-2b47-22f0e3c753d1	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-2b47-22f0e3c753d1	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-2b47-22f0e3c753d1	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-2b47-22f0e3c753d1	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-d750-4583fffe8d3d	00030000-56a0-a6ab-c659-ca66d0b6b8bb
00020000-56a0-a6ab-d750-4583fffe8d3d	00030000-56a0-a6ab-c707-2823af8dd333
00020000-56a0-a6ab-46de-04019735d6a1	00030000-56a0-a6ab-c659-ca66d0b6b8bb
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-15fe-1a3a603db950
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-9eaa-c23f7c29e7a1
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-3a25-16e0c3a95937
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-62b5-815cc7f53b7e
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-90b3-74a804ba6a6a
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-edd6-49bc38947087
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-adc4-ccdc6c726c62
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-12a8-6fdf60a9576d
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-63eb-da47a8741413
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-025a-d620106cde3a
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-3017-5ec4ae3a28a1
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-a3b8-a3d78834e9ee
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-8d40-f5c5c353ae89
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-0c58-6acda9eefca1
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-4a53-5057af352342
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-ba0c-01b96baa3d54
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-0f47-e3180c280d7e
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-160e-6d3e7be73b72
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-ed87-662511a73f53
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-2f6e-e6d4b1e193ab
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-8db6-23e88f67349a
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-8052-57c19eaed9d3
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-ab7a-91f8840b72a1
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-02eb-eba396ca2a12
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-5484-3db9e30bbf1f
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-090d-2f1e7b422869
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-4769-935a65e9950c
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-1132-37c92c1ba9e8
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-cf84-cbf1bb1d3ba2
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-b6aa-3713fe7e0e98
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-5e21-57350c7318a2	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-3a25-16e0c3a95937
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-90b3-74a804ba6a6a
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-adc4-ccdc6c726c62
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-63eb-da47a8741413
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-3017-5ec4ae3a28a1
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-8d40-f5c5c353ae89
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-4a53-5057af352342
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-0f47-e3180c280d7e
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-ed87-662511a73f53
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-8db6-23e88f67349a
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-1132-37c92c1ba9e8
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-4769-935a65e9950c
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-cf84-cbf1bb1d3ba2
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-b6aa-3713fe7e0e98
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-6531-b8fa0ae000e5	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-b422-c74026c54292
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-9ffd-58db36a5ef06
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-cb3c-a8f0cccc772b
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-e787-7714a8efd046
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-7b7b-257fa7dea762	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-3795-fbb964962900	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-47aa-dabeea2489b0	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-47aa-dabeea2489b0	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ab-47aa-dabeea2489b0	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-47aa-dabeea2489b0	00030000-56a0-a6ab-cb3c-a8f0cccc772b
00020000-56a0-a6ab-47aa-dabeea2489b0	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-47aa-dabeea2489b0	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-47aa-dabeea2489b0	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-47aa-dabeea2489b0	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-9ffd-58db36a5ef06
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-9a13-22ff38a536ed
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-75c1-8c47a5e791ed
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-0ebb-9663717535bc
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-d2ac-183c522bad3d	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-c690-05a290d3ed7e	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-1b0a-2020a6955e29	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-1b0a-2020a6955e29	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-1b0a-2020a6955e29	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-1b0a-2020a6955e29	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ab-1b0a-2020a6955e29	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-1b0a-2020a6955e29	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-1b0a-2020a6955e29	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-5fd2-945d75f03d1d	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-5fd2-945d75f03d1d	00030000-56a0-a6ab-0ebb-9663717535bc
00020000-56a0-a6ab-5fd2-945d75f03d1d	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-5fd2-945d75f03d1d	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-280d-960e4fd6d499	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-280d-960e4fd6d499	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-c367-d41367049b7e
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-9ffd-58db36a5ef06
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-cb7c-f1b8a1745cf6
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-492f-62e969a67f0f
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-e6e9-851a8839c173
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-4769-935a65e9950c
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-02eb-eba396ca2a12
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-cb3c-a8f0cccc772b
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-e787-7714a8efd046
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-b6aa-3713fe7e0e98
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-090d-2f1e7b422869
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-9a13-22ff38a536ed
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-75c1-8c47a5e791ed
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-cf84-cbf1bb1d3ba2
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-5484-3db9e30bbf1f
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-1132-37c92c1ba9e8
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-ab7a-91f8840b72a1
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-15fe-1a3a603db950
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-3a25-16e0c3a95937
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-9eaa-c23f7c29e7a1
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-62b5-815cc7f53b7e
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-90b3-74a804ba6a6a
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-edd6-49bc38947087
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-adc4-ccdc6c726c62
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-12a8-6fdf60a9576d
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-63eb-da47a8741413
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-025a-d620106cde3a
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-3017-5ec4ae3a28a1
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-a3b8-a3d78834e9ee
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-8d40-f5c5c353ae89
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-0c58-6acda9eefca1
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-4a53-5057af352342
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-ba0c-01b96baa3d54
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-0f47-e3180c280d7e
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-160e-6d3e7be73b72
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-ed87-662511a73f53
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-2f6e-e6d4b1e193ab
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-8db6-23e88f67349a
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-8052-57c19eaed9d3
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-0ebb-9663717535bc
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-c659-ca66d0b6b8bb
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-b422-c74026c54292
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ab-b1fb-4b282f67ef29	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-c367-d41367049b7e
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-cb7c-f1b8a1745cf6
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-492f-62e969a67f0f
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-e6e9-851a8839c173
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-c659-ca66d0b6b8bb
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ab-3fb7-211785792322	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-c367-d41367049b7e
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-9ffd-58db36a5ef06
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-cb7c-f1b8a1745cf6
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-492f-62e969a67f0f
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-e6e9-851a8839c173
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-cb3c-a8f0cccc772b
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-e787-7714a8efd046
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-c659-ca66d0b6b8bb
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-b422-c74026c54292
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ab-b986-9681fce62a6f	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-9ffd-58db36a5ef06
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-cb7c-f1b8a1745cf6
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-492f-62e969a67f0f
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-e6e9-851a8839c173
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-4769-935a65e9950c
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-02eb-eba396ca2a12
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-cb3c-a8f0cccc772b
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-e787-7714a8efd046
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-b6aa-3713fe7e0e98
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-090d-2f1e7b422869
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-39ef-42c1f3d440c1
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-9a13-22ff38a536ed
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-75c1-8c47a5e791ed
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-83b7-cd982ed4b501
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-cf84-cbf1bb1d3ba2
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-5484-3db9e30bbf1f
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-ba08-5357adf79ed5
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-1132-37c92c1ba9e8
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-ab7a-91f8840b72a1
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-e133-01a3981002f0
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-15fe-1a3a603db950
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-3a25-16e0c3a95937
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-9eaa-c23f7c29e7a1
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-62b5-815cc7f53b7e
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-90b3-74a804ba6a6a
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-edd6-49bc38947087
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-adc4-ccdc6c726c62
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-12a8-6fdf60a9576d
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-63eb-da47a8741413
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-025a-d620106cde3a
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-3017-5ec4ae3a28a1
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-a3b8-a3d78834e9ee
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-8d40-f5c5c353ae89
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-0c58-6acda9eefca1
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-4a53-5057af352342
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-ba0c-01b96baa3d54
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-0f47-e3180c280d7e
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-160e-6d3e7be73b72
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-ed87-662511a73f53
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-2f6e-e6d4b1e193ab
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-8db6-23e88f67349a
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-8052-57c19eaed9d3
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-0ebb-9663717535bc
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-414d-27b39fd9391c
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-234d-0ba4838aad2f
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-b422-c74026c54292
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-665c-e180e945d7d0
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ab-2562-1aeedfd221e6	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-c367-d41367049b7e
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-9ffd-58db36a5ef06
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-cb7c-f1b8a1745cf6
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-492f-62e969a67f0f
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-e6e9-851a8839c173
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-cb3c-a8f0cccc772b
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-e787-7714a8efd046
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-39ef-42c1f3d440c1
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-9a13-22ff38a536ed
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-83b7-cd982ed4b501
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-ba08-5357adf79ed5
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-e133-01a3981002f0
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-414d-27b39fd9391c
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-c659-ca66d0b6b8bb
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-234d-0ba4838aad2f
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-b422-c74026c54292
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-665c-e180e945d7d0
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ab-272f-b92ae0f761ea	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-c367-d41367049b7e
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-cb7c-f1b8a1745cf6
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-cb3c-a8f0cccc772b
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-c659-ca66d0b6b8bb
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ab-9aef-bc5b3d06ef19	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-c367-d41367049b7e
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-9ffd-58db36a5ef06
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-4769-935a65e9950c
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-02eb-eba396ca2a12
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-b6aa-3713fe7e0e98
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-090d-2f1e7b422869
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-39ef-42c1f3d440c1
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-8295-fa1774d1f15d
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-9a13-22ff38a536ed
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-75c1-8c47a5e791ed
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-83b7-cd982ed4b501
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-cf84-cbf1bb1d3ba2
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-5484-3db9e30bbf1f
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-ba08-5357adf79ed5
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-1132-37c92c1ba9e8
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-ab7a-91f8840b72a1
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-e133-01a3981002f0
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-15fe-1a3a603db950
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-3a25-16e0c3a95937
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-9eaa-c23f7c29e7a1
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-62b5-815cc7f53b7e
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-90b3-74a804ba6a6a
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-edd6-49bc38947087
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-adc4-ccdc6c726c62
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-12a8-6fdf60a9576d
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-63eb-da47a8741413
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-025a-d620106cde3a
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-3017-5ec4ae3a28a1
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-a3b8-a3d78834e9ee
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-8d40-f5c5c353ae89
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-0c58-6acda9eefca1
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-4a53-5057af352342
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-ba0c-01b96baa3d54
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-0f47-e3180c280d7e
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-160e-6d3e7be73b72
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-ed87-662511a73f53
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-2f6e-e6d4b1e193ab
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-8db6-23e88f67349a
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-8052-57c19eaed9d3
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-0ebb-9663717535bc
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-414d-27b39fd9391c
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-c659-ca66d0b6b8bb
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-234d-0ba4838aad2f
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-e203-2a094c989602
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-665c-e180e945d7d0
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ab-1a35-b77830518001	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-b186-ad4f816b0ea8
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-e015-9c50f498e8af
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c367-d41367049b7e
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-6b61-6be8a6ac919b
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-9ffd-58db36a5ef06
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c979-b0a274a248bc
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c510-bbb923384b93
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0035-8324b3225e74
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-80ff-6a4baba47f74
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-cb7c-f1b8a1745cf6
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-492f-62e969a67f0f
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-2188-adcaf8c802be
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-e6e9-851a8839c173
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-aea8-9f4ed588a018
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-1457-8546b3d645b4
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-94ed-d587d827747b
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c57b-f3be4218ab36
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-7f47-23b2d26de02e
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-ddbe-bc5c7a6dad56
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-38ca-e1e3c9ee0616
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-b62e-cd3e23d93ab0
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-1571-e366b0117c6a
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-4769-935a65e9950c
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-02eb-eba396ca2a12
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-f54b-7ba228350d61
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-8dc4-f1bd87ef08fd
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-95fc-fc7d9493623d
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-93f4-ae6c91035871
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-e787-7714a8efd046
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-cb3c-a8f0cccc772b
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-47de-9ad4ba7997e7
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-b302-c4f813154310
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-140d-8272eaa69621
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-b6aa-3713fe7e0e98
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-090d-2f1e7b422869
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-5424-66f5e515e946
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-39ef-42c1f3d440c1
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c5a7-cbe98a384e45
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-7f64-debb828e9961
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-d1a4-f24d964b01ae
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-6864-427954ab15ba
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-874e-9c23abb29947
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-8ce8-f173b7661f63
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-d70d-7e137cc7cbe5
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-a15e-02a6f671cf47
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-952a-db26b745ec72
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c629-d274eaa04c4b
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-9b98-277a61741c25
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-7dcd-8c8620276727
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-4004-5f13654f97cc
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-8b67-1202b703e311
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-9e81-722e6d507d5e
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-de94-a338020cd75f
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-8295-fa1774d1f15d
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-9a13-22ff38a536ed
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-3773-f17db340630e
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-bbe0-b6fb1e1b9fe8
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c920-9f3fb1e84a57
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-43c9-762701ea172b
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-75c1-8c47a5e791ed
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-83b7-cd982ed4b501
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0534-20a72af5d9df
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-cf84-cbf1bb1d3ba2
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-5484-3db9e30bbf1f
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-72ab-048400a8604b
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-fb10-ae10ed12bfee
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-2426-8181b88e371f
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-ba08-5357adf79ed5
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-9c5a-f7e5b8e22130
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-daf5-6413c075506d
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-4dd6-be1e1e1bb3cb
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-ac14-db85351f41fd
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-fbd9-f1993f96ba9a
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-f650-41facdfe4658
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-1132-37c92c1ba9e8
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-ab7a-91f8840b72a1
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-da5e-63969c844b3e
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-e133-01a3981002f0
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-15fe-1a3a603db950
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-3a25-16e0c3a95937
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-9eaa-c23f7c29e7a1
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-62b5-815cc7f53b7e
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-90b3-74a804ba6a6a
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-edd6-49bc38947087
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-adc4-ccdc6c726c62
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-12a8-6fdf60a9576d
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-63eb-da47a8741413
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-025a-d620106cde3a
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-3017-5ec4ae3a28a1
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-a3b8-a3d78834e9ee
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-8d40-f5c5c353ae89
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0c58-6acda9eefca1
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-4a53-5057af352342
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-ba0c-01b96baa3d54
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0f47-e3180c280d7e
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-160e-6d3e7be73b72
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-ed87-662511a73f53
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-2f6e-e6d4b1e193ab
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-8db6-23e88f67349a
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-8052-57c19eaed9d3
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-e1ae-03e2f75d82b2
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-fd5e-0f40f92a16f2
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-9e8d-71704216931c
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-821a-f986e543b701
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0630-ad39578f1941
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-2933-b9ba6a571e27
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-ee83-159a1a103f35
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0001-a45f0186aa2b
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-eb71-daebd5bac931
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-39db-49bebdc63f88
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-bcae-3112290a8086
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-b567-90c6af9a7f65
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c10a-13d0430f1bfc
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-74a2-74c855c5ef65
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-1f1c-8bb80a9f411a
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-ce0a-2f26893318ac
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-4da3-7a07515915aa
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-a49a-d130a88b88a9
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-1cee-58087f30962f
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-3c50-ae8d0271daf9
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-2991-ab0c892612b7
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-962d-8c05905fe8bc
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-f08f-7bc5515d3e03
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0ebb-9663717535bc
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-414d-27b39fd9391c
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-8e53-2cac99795607
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-e790-404632efa582
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-1429-e5c3f845253f
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-9b1f-45cb851412bc
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-1377-79109cdf1b57
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-649c-5b5ee5667fc4
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-cc60-02f69c9c1982
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-218b-83e182cc620e
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-0879-ee85628b80f2
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c659-ca66d0b6b8bb
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c707-2823af8dd333
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-234d-0ba4838aad2f
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-b422-c74026c54292
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-6a3c-26a27816c608
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-04cd-7749605158e0
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-53ed-b7900308b2d2
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-fd5e-1e8dde42b0f3
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-6700-bd023f18ec8a
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-e203-2a094c989602
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-90a9-8c4739e79942
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-2b94-72371d695401
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-665c-e180e945d7d0
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-09bb-91dfa642f268
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-b985-0c582fb8061c
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-b587-12329072d54d
00020000-56a0-a6ad-4f03-6bb4080067b8	00030000-56a0-a6ab-ceee-ae113562e748
00020000-56a0-a6ad-afef-9b37fc734dc4	00030000-56a0-a6ab-c3b9-6a604df767ac
00020000-56a0-a6ad-0c6a-39f8a2d67088	00030000-56a0-a6ab-e57f-ca001f855955
00020000-56a0-a6ad-071d-2964ecd77534	00030000-56a0-a6ab-b422-c74026c54292
00020000-56a0-a6ad-548a-c195f3f48e4a	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ad-6158-5585dc18c71c	00030000-56a0-a6ab-8ce8-f173b7661f63
00020000-56a0-a6ad-206b-d1df9c6778f3	00030000-56a0-a6ab-d70d-7e137cc7cbe5
00020000-56a0-a6ad-44b2-95406317f22f	00030000-56a0-a6ab-a15e-02a6f671cf47
00020000-56a0-a6ad-444a-d5f69aaa4aae	00030000-56a0-a6ab-874e-9c23abb29947
00020000-56a0-a6ad-5e46-24326a782132	00030000-56a0-a6ab-d1a4-f24d964b01ae
00020000-56a0-a6ad-fb35-13fdcd08c92b	00030000-56a0-a6ab-6864-427954ab15ba
00020000-56a0-a6ad-9942-865c66cdcd97	00030000-56a0-a6ab-725d-92e1ab41d1ad
00020000-56a0-a6ad-8b19-21330341398c	00030000-56a0-a6ab-adfc-b4a7f9b9ade8
00020000-56a0-a6ad-0f60-b55c883907a5	00030000-56a0-a6ab-0603-db8a9ef4dbce
00020000-56a0-a6ad-d2e7-3f00812bf56d	00030000-56a0-a6ab-352f-9c748efe1a18
00020000-56a0-a6ad-f65f-a1013f2dce7f	00030000-56a0-a6ab-9a13-22ff38a536ed
00020000-56a0-a6ad-8ebd-f1b250a3650e	00030000-56a0-a6ab-d6f9-6cbc0c78a942
00020000-56a0-a6ad-6fdc-d72f158e0940	00030000-56a0-a6ab-f1e2-c81eab6eba45
00020000-56a0-a6ad-7f3a-ac626b5398a3	00030000-56a0-a6ab-5016-d40f113b40e4
00020000-56a0-a6ad-977d-50e19da82758	00030000-56a0-a6ab-5e64-91eff14208e2
00020000-56a0-a6ad-977d-50e19da82758	00030000-56a0-a6ab-83b7-cd982ed4b501
00020000-56a0-a6ad-977d-50e19da82758	00030000-56a0-a6ab-633f-6a0a5c8702ea
00020000-56a0-a6ad-3ff9-c8fb02611455	00030000-56a0-a6ab-af4e-2d071b9ed978
00020000-56a0-a6ad-b902-dd74b807db76	00030000-56a0-a6ab-234d-0ba4838aad2f
00020000-56a0-a6ad-9aef-8527e386716a	00030000-56a0-a6ab-f08f-7bc5515d3e03
00020000-56a0-a6ad-c3a9-3c05fbb091b1	00030000-56a0-a6ab-8ff5-0aa9e4bf0ac6
00020000-56a0-a6ad-36ab-c73990c1bb5c	00030000-56a0-a6ab-414d-27b39fd9391c
00020000-56a0-a6ad-e0bb-bd10fedde5d6	00030000-56a0-a6ab-2be2-ccfc0714f875
00020000-56a0-a6ad-bf85-7b92a9eef323	00030000-56a0-a6ab-ba08-5357adf79ed5
00020000-56a0-a6ad-db1c-bc44dc03ac27	00030000-56a0-a6ab-9ec8-f7911ba10164
00020000-56a0-a6ad-062b-c43d02253cc0	00030000-56a0-a6ab-665c-e180e945d7d0
00020000-56a0-a6ad-3d8a-7531c0b8c13e	00030000-56a0-a6ab-4ad6-fda48e7897e6
00020000-56a0-a6ad-98ef-1b3fc8a5dfcb	00030000-56a0-a6ab-75c1-8c47a5e791ed
00020000-56a0-a6ad-230e-80b41088591b	00030000-56a0-a6ab-31ef-ccf3284b04ca
00020000-56a0-a6ad-6290-4d9201dc7624	00030000-56a0-a6ab-0ebb-9663717535bc
00020000-56a0-a6ad-6797-7c128e808f1d	00030000-56a0-a6ab-7936-de191abec26b
00020000-56a0-a6ad-e0ec-c0c38ba81cd2	00030000-56a0-a6ab-0da5-e958e111b92a
00020000-56a0-a6ad-e81e-5626e7fb0eda	00030000-56a0-a6ab-9ffd-58db36a5ef06
00020000-56a0-a6ad-7aac-fb2c08a108c9	00030000-56a0-a6ab-a364-d23d1a6df776
00020000-56a0-a6ad-7c1a-9c7d303bbdeb	00030000-56a0-a6ab-cb3c-a8f0cccc772b
00020000-56a0-a6ad-930e-4ad7359074e0	00030000-56a0-a6ab-e787-7714a8efd046
\.


--
-- TOC entry 3185 (class 0 OID 38992678)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 38992713)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 38992846)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a0-a6ae-a395-c99ac71a246a	00090000-56a0-a6ad-305a-666fc507bfcf	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a0-a6ae-fc11-9b0d0409958a	00090000-56a0-a6ad-fc21-36ecf87db50e	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a0-a6ae-1700-b65e5d0e426f	00090000-56a0-a6ad-19eb-5754a4d1e77c	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a0-a6ae-6506-79162afc7226	00090000-56a0-a6ad-7118-e8f55c132c47	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3154 (class 0 OID 38992360)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a0-a6ad-9e5e-62339b42753b	\N	00040000-56a0-a6aa-71c9-05b4b6b6043b	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a0-a6ad-0ecd-ff5926ec71fc	\N	00040000-56a0-a6aa-71c9-05b4b6b6043b	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a0-a6ad-713d-1116f72c8eb8	\N	00040000-56a0-a6aa-71c9-05b4b6b6043b	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a0-a6ad-4151-7fb55ca6f7f6	\N	00040000-56a0-a6aa-71c9-05b4b6b6043b	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a0-a6ad-cb9f-397ab5719795	\N	00040000-56a0-a6aa-71c9-05b4b6b6043b	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a0-a6ad-7679-6b7507d1fa39	\N	00040000-56a0-a6aa-6dce-e6601bb8899c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a0-a6ad-ef0d-ce647144690b	\N	00040000-56a0-a6aa-2143-04ff1ebee145	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a0-a6ad-8101-42f58d766549	\N	00040000-56a0-a6aa-b808-20da28ec8702	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a0-a6ad-b271-e90970b73c5c	\N	00040000-56a0-a6aa-0cb0-38a0d0f408a7	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a0-a6af-d321-7f2a02702489	\N	00040000-56a0-a6aa-71c9-05b4b6b6043b	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3157 (class 0 OID 38992405)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a0-a6aa-3a61-a4628e64db71	8341	Adlešiči
00050000-56a0-a6aa-acb4-f465b1529578	5270	Ajdovščina
00050000-56a0-a6aa-87a7-5722f6313f84	6280	Ankaran/Ancarano
00050000-56a0-a6aa-7d07-1a365d4a9d88	9253	Apače
00050000-56a0-a6aa-4aa9-5f3cb6119e34	8253	Artiče
00050000-56a0-a6aa-cfff-ebf7bc0d16b6	4275	Begunje na Gorenjskem
00050000-56a0-a6aa-e427-38fbc6a0f0d0	1382	Begunje pri Cerknici
00050000-56a0-a6aa-50c8-1e5d34bf5c74	9231	Beltinci
00050000-56a0-a6aa-74a4-a4e4f5405d41	2234	Benedikt
00050000-56a0-a6aa-2d9f-1c65ccb6227d	2345	Bistrica ob Dravi
00050000-56a0-a6aa-6869-a6f20624958b	3256	Bistrica ob Sotli
00050000-56a0-a6aa-a28a-b4e72ce45efb	8259	Bizeljsko
00050000-56a0-a6aa-6b95-80ff0a682ae9	1223	Blagovica
00050000-56a0-a6aa-b7d1-454dd05d379f	8283	Blanca
00050000-56a0-a6aa-c195-1397c61ba3f4	4260	Bled
00050000-56a0-a6aa-71d5-7260d00c05f4	4273	Blejska Dobrava
00050000-56a0-a6aa-8b4d-d796f8af4d2f	9265	Bodonci
00050000-56a0-a6aa-f30d-39eaaa82caea	9222	Bogojina
00050000-56a0-a6aa-9197-241c7298a4d7	4263	Bohinjska Bela
00050000-56a0-a6aa-1bbb-ac4dcc54b9c7	4264	Bohinjska Bistrica
00050000-56a0-a6aa-3194-fc9a38f58f92	4265	Bohinjsko jezero
00050000-56a0-a6aa-86d0-02f1606d365e	1353	Borovnica
00050000-56a0-a6aa-8afd-9b9c9431aa47	8294	Boštanj
00050000-56a0-a6aa-2338-35b8f6af185d	5230	Bovec
00050000-56a0-a6aa-8e0d-e4a2a6a49cd3	5295	Branik
00050000-56a0-a6aa-1d98-949e35b86f5d	3314	Braslovče
00050000-56a0-a6aa-15b1-f86fce763f4a	5223	Breginj
00050000-56a0-a6aa-55ef-60cffd6ddbf7	8280	Brestanica
00050000-56a0-a6aa-11db-2feb9f04edc3	2354	Bresternica
00050000-56a0-a6aa-8432-8fa718a744b3	4243	Brezje
00050000-56a0-a6aa-2865-52215b026385	1351	Brezovica pri Ljubljani
00050000-56a0-a6aa-9feb-a2a2a950082e	8250	Brežice
00050000-56a0-a6aa-ac01-db2fb353ed80	4210	Brnik - Aerodrom
00050000-56a0-a6aa-0817-9b48cb1f35f5	8321	Brusnice
00050000-56a0-a6aa-5953-3a90b253a1ac	3255	Buče
00050000-56a0-a6aa-12f3-5051e2fe05ad	8276	Bučka 
00050000-56a0-a6aa-87e1-0996e8b4da4e	9261	Cankova
00050000-56a0-a6aa-dd04-595a3920032f	3000	Celje 
00050000-56a0-a6aa-f654-cf96816e60b8	3001	Celje - poštni predali
00050000-56a0-a6aa-13f5-735292b185bc	4207	Cerklje na Gorenjskem
00050000-56a0-a6aa-8996-fa6c347a1571	8263	Cerklje ob Krki
00050000-56a0-a6aa-8973-fb4babf5a00d	1380	Cerknica
00050000-56a0-a6aa-7e02-5b880e27b9e5	5282	Cerkno
00050000-56a0-a6aa-f131-e27c9f9e772c	2236	Cerkvenjak
00050000-56a0-a6aa-0f3c-8503c2f53ecb	2215	Ceršak
00050000-56a0-a6aa-c617-2d1f0c15762e	2326	Cirkovce
00050000-56a0-a6aa-237a-d4875fd1014c	2282	Cirkulane
00050000-56a0-a6aa-ed8e-0cf3e9898e3b	5273	Col
00050000-56a0-a6aa-743d-4c46373d329a	8251	Čatež ob Savi
00050000-56a0-a6aa-81a5-c4388bb35bf9	1413	Čemšenik
00050000-56a0-a6aa-8d0f-d9df942a5681	5253	Čepovan
00050000-56a0-a6aa-0037-790394d96806	9232	Črenšovci
00050000-56a0-a6aa-1667-1d0e81faa8bc	2393	Črna na Koroškem
00050000-56a0-a6aa-66e3-9f887dcaa63b	6275	Črni Kal
00050000-56a0-a6aa-4eb7-ee907e6d5e47	5274	Črni Vrh nad Idrijo
00050000-56a0-a6aa-5983-e7dfd4f77b95	5262	Črniče
00050000-56a0-a6aa-9dd9-404f739e68d3	8340	Črnomelj
00050000-56a0-a6aa-3632-8ff7402a1f39	6271	Dekani
00050000-56a0-a6aa-b273-404dd6c14599	5210	Deskle
00050000-56a0-a6aa-cbbc-1154a3d8931e	2253	Destrnik
00050000-56a0-a6aa-a329-c15bf9f2ded6	6215	Divača
00050000-56a0-a6aa-aa7c-18d55fbf53e6	1233	Dob
00050000-56a0-a6aa-999b-ec6ef75769e8	3224	Dobje pri Planini
00050000-56a0-a6aa-21d8-19ab07da9f11	8257	Dobova
00050000-56a0-a6aa-adc2-b5bfc4171280	1423	Dobovec
00050000-56a0-a6aa-2922-950a7df8705a	5263	Dobravlje
00050000-56a0-a6aa-a8c1-9c677a78e4f4	3204	Dobrna
00050000-56a0-a6aa-d204-6a411661645d	8211	Dobrnič
00050000-56a0-a6aa-058b-32452b41c259	1356	Dobrova
00050000-56a0-a6aa-6e69-130a022c5478	9223	Dobrovnik/Dobronak 
00050000-56a0-a6aa-c9cf-657442ba2955	5212	Dobrovo v Brdih
00050000-56a0-a6aa-2c48-dae7a4976dc9	1431	Dol pri Hrastniku
00050000-56a0-a6aa-1e18-9dcd500342ab	1262	Dol pri Ljubljani
00050000-56a0-a6aa-fad6-b55d7204b4d5	1273	Dole pri Litiji
00050000-56a0-a6aa-ffbd-1a6cd512bce4	1331	Dolenja vas
00050000-56a0-a6aa-dac7-7aac61544d24	8350	Dolenjske Toplice
00050000-56a0-a6aa-f2f5-20e905ff9e5b	1230	Domžale
00050000-56a0-a6aa-60e3-af56fbcc32a9	2252	Dornava
00050000-56a0-a6aa-f646-afa0af26dea2	5294	Dornberk
00050000-56a0-a6aa-8fae-179436a0e8a7	1319	Draga
00050000-56a0-a6aa-2e20-b9506c9b8539	8343	Dragatuš
00050000-56a0-a6aa-45bd-16f4df83766e	3222	Dramlje
00050000-56a0-a6aa-ab91-f891e48a6731	2370	Dravograd
00050000-56a0-a6aa-1fd4-373654114b6e	4203	Duplje
00050000-56a0-a6aa-9afb-a863bc8366f4	6221	Dutovlje
00050000-56a0-a6aa-0c1b-dc585bbd67b9	8361	Dvor
00050000-56a0-a6aa-3050-9dfcbe6afbb0	2343	Fala
00050000-56a0-a6aa-b29e-3103cd9b56bb	9208	Fokovci
00050000-56a0-a6aa-ae12-83d69c59fd5f	2313	Fram
00050000-56a0-a6aa-c248-32d54e42ac02	3213	Frankolovo
00050000-56a0-a6aa-eff7-4336fb887c0b	1274	Gabrovka
00050000-56a0-a6aa-3daf-ac5aa4e7f8ea	8254	Globoko
00050000-56a0-a6aa-1c5f-48ba3aeb0046	5275	Godovič
00050000-56a0-a6aa-0dda-c23d94842704	4204	Golnik
00050000-56a0-a6aa-20e5-f94efed13aaa	3303	Gomilsko
00050000-56a0-a6aa-12df-7003903b72b7	4224	Gorenja vas
00050000-56a0-a6aa-6d67-15e64d4a917f	3263	Gorica pri Slivnici
00050000-56a0-a6aa-21ad-3b5760864528	2272	Gorišnica
00050000-56a0-a6aa-dbdf-df28b13635ea	9250	Gornja Radgona
00050000-56a0-a6aa-e9ef-ad910f231671	3342	Gornji Grad
00050000-56a0-a6aa-bbef-f87a1391ca35	4282	Gozd Martuljek
00050000-56a0-a6aa-463e-0ea4ba3e9f5f	6272	Gračišče
00050000-56a0-a6aa-fe9f-71c554965f20	9264	Grad
00050000-56a0-a6aa-7f78-d06760118b74	8332	Gradac
00050000-56a0-a6aa-1d88-3b43f4a45408	1384	Grahovo
00050000-56a0-a6aa-e5b4-fe6e36a190e2	5242	Grahovo ob Bači
00050000-56a0-a6aa-117d-11375c5095d0	5251	Grgar
00050000-56a0-a6aa-de8d-2d7c07d5433a	3302	Griže
00050000-56a0-a6aa-637e-ffff6dfa0b32	3231	Grobelno
00050000-56a0-a6aa-51c3-1e3c8c8226f4	1290	Grosuplje
00050000-56a0-a6aa-b83d-2335adde3927	2288	Hajdina
00050000-56a0-a6aa-dedf-f16c0d681594	8362	Hinje
00050000-56a0-a6aa-fa3d-a5d7e4aee109	2311	Hoče
00050000-56a0-a6aa-7b15-3974143665bd	9205	Hodoš/Hodos
00050000-56a0-a6aa-27c8-dabf48f0c06c	1354	Horjul
00050000-56a0-a6aa-4c69-0b5a1f37d299	1372	Hotedršica
00050000-56a0-a6aa-2319-05953e3eafca	1430	Hrastnik
00050000-56a0-a6aa-ecbc-cc5cebc18095	6225	Hruševje
00050000-56a0-a6aa-5de0-fb3c64f13f8b	4276	Hrušica
00050000-56a0-a6aa-faae-b0d496e155e3	5280	Idrija
00050000-56a0-a6aa-eb26-e397f1dbb401	1292	Ig
00050000-56a0-a6aa-cc8b-731a0a65543c	6250	Ilirska Bistrica
00050000-56a0-a6aa-b278-e8b2b42000e9	6251	Ilirska Bistrica-Trnovo
00050000-56a0-a6aa-debd-793a5821e2af	1295	Ivančna Gorica
00050000-56a0-a6aa-29aa-b449969ab0e9	2259	Ivanjkovci
00050000-56a0-a6aa-c599-542eea04f943	1411	Izlake
00050000-56a0-a6aa-6b25-1df9b13ded85	6310	Izola/Isola
00050000-56a0-a6aa-593a-cba959f9e24d	2222	Jakobski Dol
00050000-56a0-a6aa-b776-8c83e3eec447	2221	Jarenina
00050000-56a0-a6aa-35d8-ee32b23c9be7	6254	Jelšane
00050000-56a0-a6aa-4d0d-5c5f2ee792ac	4270	Jesenice
00050000-56a0-a6aa-eaea-760fbdee7daa	8261	Jesenice na Dolenjskem
00050000-56a0-a6aa-74b6-d7ee0d1febfe	3273	Jurklošter
00050000-56a0-a6aa-a107-a4856e35dae3	2223	Jurovski Dol
00050000-56a0-a6aa-5a40-58b84637d1fd	2256	Juršinci
00050000-56a0-a6aa-94af-62ca8bed8e9c	5214	Kal nad Kanalom
00050000-56a0-a6aa-e1ae-fd26575dd287	3233	Kalobje
00050000-56a0-a6aa-f2ac-bac49971859e	4246	Kamna Gorica
00050000-56a0-a6aa-35c5-194b22fe6181	2351	Kamnica
00050000-56a0-a6aa-8a06-89a80884da49	1241	Kamnik
00050000-56a0-a6aa-a4c9-ab4e7c02b1a5	5213	Kanal
00050000-56a0-a6aa-dd2f-2a58f7c56746	8258	Kapele
00050000-56a0-a6aa-ca8e-64345df8c63a	2362	Kapla
00050000-56a0-a6aa-0432-39aa7ab87e4e	2325	Kidričevo
00050000-56a0-a6aa-a0ad-6035c1f4139a	1412	Kisovec
00050000-56a0-a6aa-9a7d-a8fd91aca82e	6253	Knežak
00050000-56a0-a6aa-286e-838b2831177f	5222	Kobarid
00050000-56a0-a6aa-4928-168b9903e29a	9227	Kobilje
00050000-56a0-a6aa-e6e0-6c95444af05f	1330	Kočevje
00050000-56a0-a6aa-4933-badb453c948f	1338	Kočevska Reka
00050000-56a0-a6aa-8f69-987bcd49d6ef	2276	Kog
00050000-56a0-a6aa-5c52-a14851067abb	5211	Kojsko
00050000-56a0-a6aa-f36c-cce3820515bf	6223	Komen
00050000-56a0-a6aa-8889-daa25a92718b	1218	Komenda
00050000-56a0-a6aa-762a-aa8265814415	6000	Koper/Capodistria 
00050000-56a0-a6aa-d56d-c284205584a1	6001	Koper/Capodistria - poštni predali
00050000-56a0-a6aa-c93f-822d4504bf1b	8282	Koprivnica
00050000-56a0-a6aa-f4e3-7358c073d206	5296	Kostanjevica na Krasu
00050000-56a0-a6aa-8fb0-c054bb94b391	8311	Kostanjevica na Krki
00050000-56a0-a6aa-f8fe-b3f643f29854	1336	Kostel
00050000-56a0-a6aa-96d0-4925a47ce5ed	6256	Košana
00050000-56a0-a6aa-8d7b-46ad710ef4cc	2394	Kotlje
00050000-56a0-a6aa-fb68-8b8774aa5248	6240	Kozina
00050000-56a0-a6aa-c8cc-8e00275d375a	3260	Kozje
00050000-56a0-a6aa-d0fb-f8943d846bad	4000	Kranj 
00050000-56a0-a6aa-f2b4-de13850b73e7	4001	Kranj - poštni predali
00050000-56a0-a6aa-ca23-40834c389728	4280	Kranjska Gora
00050000-56a0-a6aa-9d09-fec221cd98c5	1281	Kresnice
00050000-56a0-a6aa-7bcf-266882704123	4294	Križe
00050000-56a0-a6aa-6003-cd3add91f1e0	9206	Križevci
00050000-56a0-a6aa-8cd0-15524d99a624	9242	Križevci pri Ljutomeru
00050000-56a0-a6aa-6f9c-87c432334979	1301	Krka
00050000-56a0-a6aa-39ed-d9d222dc2f5f	8296	Krmelj
00050000-56a0-a6aa-c86d-87638ff2e0ac	4245	Kropa
00050000-56a0-a6aa-378e-ce9501d56470	8262	Krška vas
00050000-56a0-a6aa-f5d6-3030219fba18	8270	Krško
00050000-56a0-a6aa-1ae9-824c1a7f9c5d	9263	Kuzma
00050000-56a0-a6aa-155c-5bf2c2c8a417	2318	Laporje
00050000-56a0-a6aa-af54-d658a3f730ef	3270	Laško
00050000-56a0-a6aa-c101-c4cf9051bc8f	1219	Laze v Tuhinju
00050000-56a0-a6aa-d437-e484861ad1d1	2230	Lenart v Slovenskih goricah
00050000-56a0-a6aa-9b01-b948ff570742	9220	Lendava/Lendva
00050000-56a0-a6aa-f881-0ea1df7601c3	4248	Lesce
00050000-56a0-a6aa-4c16-775158d98dac	3261	Lesično
00050000-56a0-a6aa-74d8-849f0bf0ac28	8273	Leskovec pri Krškem
00050000-56a0-a6aa-f74b-88a4d6bf344c	2372	Libeliče
00050000-56a0-a6aa-0ae9-9023ca66817a	2341	Limbuš
00050000-56a0-a6aa-11fe-b4a07c1964b6	1270	Litija
00050000-56a0-a6aa-69cd-4401ac9a1c46	3202	Ljubečna
00050000-56a0-a6aa-147f-88cd7d8d3d80	1000	Ljubljana 
00050000-56a0-a6aa-6c48-26dedf02f28c	1001	Ljubljana - poštni predali
00050000-56a0-a6aa-5529-042b5b9f74b1	1231	Ljubljana - Črnuče
00050000-56a0-a6aa-bb8c-eebc192bbb43	1261	Ljubljana - Dobrunje
00050000-56a0-a6aa-02fe-aa84a9d82629	1260	Ljubljana - Polje
00050000-56a0-a6aa-d7f9-e89bc0f6dcdc	1210	Ljubljana - Šentvid
00050000-56a0-a6aa-a4b7-3bd3341b7674	1211	Ljubljana - Šmartno
00050000-56a0-a6aa-fc59-bfa7dc038d0e	3333	Ljubno ob Savinji
00050000-56a0-a6aa-8422-ce3e9bc28946	9240	Ljutomer
00050000-56a0-a6aa-ad1b-35f6b9e1985d	3215	Loče
00050000-56a0-a6aa-3bcc-231355d0b99e	5231	Log pod Mangartom
00050000-56a0-a6aa-a9ca-9696f94fe84a	1358	Log pri Brezovici
00050000-56a0-a6aa-0158-5050513ebe0e	1370	Logatec
00050000-56a0-a6aa-4fde-2b71212316b9	1371	Logatec
00050000-56a0-a6aa-0a72-69a7ce51773e	1434	Loka pri Zidanem Mostu
00050000-56a0-a6aa-c92b-8623aa321858	3223	Loka pri Žusmu
00050000-56a0-a6aa-2e5f-f4be3cd58a62	6219	Lokev
00050000-56a0-a6aa-715a-7f723ca888e3	1318	Loški Potok
00050000-56a0-a6aa-a7ec-84e06dcbee06	2324	Lovrenc na Dravskem polju
00050000-56a0-a6aa-f760-737378fd1bfc	2344	Lovrenc na Pohorju
00050000-56a0-a6aa-c33a-15799d939bbb	3334	Luče
00050000-56a0-a6aa-f38c-1d4da2c1d496	1225	Lukovica
00050000-56a0-a6aa-79e6-1583fe97b232	9202	Mačkovci
00050000-56a0-a6aa-3981-f5582fd363ab	2322	Majšperk
00050000-56a0-a6aa-ce9d-d84f6806cf2c	2321	Makole
00050000-56a0-a6aa-181f-999e135f3623	9243	Mala Nedelja
00050000-56a0-a6aa-1783-241736ce93ac	2229	Malečnik
00050000-56a0-a6aa-ed26-e5196e392294	6273	Marezige
00050000-56a0-a6aa-37ac-97add8582691	2000	Maribor 
00050000-56a0-a6aa-7c72-5f33f448e8d9	2001	Maribor - poštni predali
00050000-56a0-a6aa-1f4b-6eba11dd0e7f	2206	Marjeta na Dravskem polju
00050000-56a0-a6aa-aa8c-52ea3db0b135	2281	Markovci
00050000-56a0-a6aa-fefc-04c729830c66	9221	Martjanci
00050000-56a0-a6aa-9b3a-bbc175c5dd59	6242	Materija
00050000-56a0-a6aa-5c60-45c1f781603a	4211	Mavčiče
00050000-56a0-a6aa-1286-5289419027b3	1215	Medvode
00050000-56a0-a6aa-d115-50f2a9bfecce	1234	Mengeš
00050000-56a0-a6aa-768c-548eb2424d87	8330	Metlika
00050000-56a0-a6aa-692d-8b3a19afde5e	2392	Mežica
00050000-56a0-a6aa-1959-ba18a46e8755	2204	Miklavž na Dravskem polju
00050000-56a0-a6aa-3dfd-3716a343d33b	2275	Miklavž pri Ormožu
00050000-56a0-a6aa-655e-d89422f46968	5291	Miren
00050000-56a0-a6aa-6ead-4357827bfe70	8233	Mirna
00050000-56a0-a6aa-c096-a805663f6bd0	8216	Mirna Peč
00050000-56a0-a6aa-b50e-8e26b81a08a1	2382	Mislinja
00050000-56a0-a6aa-f7dd-b0b2a32860e2	4281	Mojstrana
00050000-56a0-a6aa-0419-a1a0ba066bc2	8230	Mokronog
00050000-56a0-a6aa-778d-e09c93cd7c5e	1251	Moravče
00050000-56a0-a6aa-c545-f17236d6b75c	9226	Moravske Toplice
00050000-56a0-a6aa-6ab7-51054624bc30	5216	Most na Soči
00050000-56a0-a6aa-4e23-ee904d2c792f	1221	Motnik
00050000-56a0-a6aa-bf5b-b7a85905b32e	3330	Mozirje
00050000-56a0-a6aa-3d76-aab9ac6def33	9000	Murska Sobota 
00050000-56a0-a6aa-8baa-b6d76c035aee	9001	Murska Sobota - poštni predali
00050000-56a0-a6aa-9786-23db5cf650bb	2366	Muta
00050000-56a0-a6aa-bf4c-1a75fae974e1	4202	Naklo
00050000-56a0-a6aa-4c4b-db1df921fe08	3331	Nazarje
00050000-56a0-a6aa-e679-ecb1814e353b	1357	Notranje Gorice
00050000-56a0-a6aa-2fa2-64ec8e333d58	3203	Nova Cerkev
00050000-56a0-a6aa-187a-31c6b550b63c	5000	Nova Gorica 
00050000-56a0-a6aa-0222-8164ec35d487	5001	Nova Gorica - poštni predali
00050000-56a0-a6aa-19a2-855c260803aa	1385	Nova vas
00050000-56a0-a6aa-2b0b-257299f28d6f	8000	Novo mesto
00050000-56a0-a6aa-9b7b-74d910f79c94	8001	Novo mesto - poštni predali
00050000-56a0-a6aa-4694-c1a7eaa3fbaa	6243	Obrov
00050000-56a0-a6aa-4cf0-b54594cf58d8	9233	Odranci
00050000-56a0-a6aa-be97-5b938ef2e3ee	2317	Oplotnica
00050000-56a0-a6aa-7993-dbc4fb4731d2	2312	Orehova vas
00050000-56a0-a6aa-94bb-544e9356bbd5	2270	Ormož
00050000-56a0-a6aa-01d5-c85a950c6235	1316	Ortnek
00050000-56a0-a6aa-e976-a2d437e086ff	1337	Osilnica
00050000-56a0-a6aa-23e4-f322f0e6ee3e	8222	Otočec
00050000-56a0-a6aa-ff19-e6ca1fa22fa6	2361	Ožbalt
00050000-56a0-a6aa-2a1c-ad95592cc108	2231	Pernica
00050000-56a0-a6aa-45a8-7d029db9f742	2211	Pesnica pri Mariboru
00050000-56a0-a6aa-d017-7a852d24a0e1	9203	Petrovci
00050000-56a0-a6aa-0c57-aa7a79bd88bd	3301	Petrovče
00050000-56a0-a6aa-1f50-3cf7f6f48877	6330	Piran/Pirano
00050000-56a0-a6aa-a030-65f6c4882e5a	8255	Pišece
00050000-56a0-a6aa-4254-3b796ee27569	6257	Pivka
00050000-56a0-a6aa-ede0-802ea920168c	6232	Planina
00050000-56a0-a6aa-70ef-2d0dfc971ffc	3225	Planina pri Sevnici
00050000-56a0-a6aa-296d-a5c54bb5b80c	6276	Pobegi
00050000-56a0-a6aa-8274-93b5274994b6	8312	Podbočje
00050000-56a0-a6aa-9fd3-7c05fad0b0e9	5243	Podbrdo
00050000-56a0-a6aa-6c32-1d04a832386f	3254	Podčetrtek
00050000-56a0-a6aa-b650-a5c602166155	2273	Podgorci
00050000-56a0-a6aa-b3d2-cd9eb796a353	6216	Podgorje
00050000-56a0-a6aa-576d-e14f075f1112	2381	Podgorje pri Slovenj Gradcu
00050000-56a0-a6aa-e1c4-65e9b4c8f9d2	6244	Podgrad
00050000-56a0-a6aa-febe-249a95a83d5c	1414	Podkum
00050000-56a0-a6aa-0124-f5c472dae045	2286	Podlehnik
00050000-56a0-a6aa-b57c-4cba5b07701a	5272	Podnanos
00050000-56a0-a6aa-94a2-9e9c38afdac4	4244	Podnart
00050000-56a0-a6aa-392f-e0b41f005d33	3241	Podplat
00050000-56a0-a6aa-5adb-a958464dc3b0	3257	Podsreda
00050000-56a0-a6aa-c5b5-253dd9ebc8f0	2363	Podvelka
00050000-56a0-a6aa-0c0e-718fea3a9427	2208	Pohorje
00050000-56a0-a6aa-92cf-95b4da27a3ff	2257	Polenšak
00050000-56a0-a6aa-99b8-b955b57e410c	1355	Polhov Gradec
00050000-56a0-a6aa-2771-7918c3afd548	4223	Poljane nad Škofjo Loko
00050000-56a0-a6aa-1a4c-03940462e453	2319	Poljčane
00050000-56a0-a6aa-bef3-938c24c4c0f8	1272	Polšnik
00050000-56a0-a6aa-4da3-c43f96eb6813	3313	Polzela
00050000-56a0-a6aa-7787-a551243280f0	3232	Ponikva
00050000-56a0-a6aa-2e91-efed215f94ed	6320	Portorož/Portorose
00050000-56a0-a6aa-a795-5b69ebc685c0	6230	Postojna
00050000-56a0-a6aa-8246-c0095f579cae	2331	Pragersko
00050000-56a0-a6aa-49e1-f054c58897b4	3312	Prebold
00050000-56a0-a6aa-666c-732a7f615d1a	4205	Preddvor
00050000-56a0-a6aa-497a-a3ab5977f182	6255	Prem
00050000-56a0-a6aa-4a1a-2516a1ac4af6	1352	Preserje
00050000-56a0-a6aa-bf01-f119605d48ab	6258	Prestranek
00050000-56a0-a6aa-649a-0a9500432e44	2391	Prevalje
00050000-56a0-a6aa-46ea-efbc55cfd931	3262	Prevorje
00050000-56a0-a6aa-c729-e11aea67467e	1276	Primskovo 
00050000-56a0-a6aa-e16a-92bdd1f038d0	3253	Pristava pri Mestinju
00050000-56a0-a6aa-7544-27ff169087b6	9207	Prosenjakovci/Partosfalva
00050000-56a0-a6aa-714e-aac67fbb65ee	5297	Prvačina
00050000-56a0-a6aa-e859-092ab0add534	2250	Ptuj
00050000-56a0-a6aa-5af5-f5f095b2b214	2323	Ptujska Gora
00050000-56a0-a6aa-adcc-9fd8bd15e0c1	9201	Puconci
00050000-56a0-a6aa-9888-3e7ad61be3cf	2327	Rače
00050000-56a0-a6aa-dd6c-d9d667ef78d3	1433	Radeče
00050000-56a0-a6aa-5bfd-ee5bec8deceb	9252	Radenci
00050000-56a0-a6aa-a875-e54ad18cd29a	2360	Radlje ob Dravi
00050000-56a0-a6aa-afe3-4e6be5445ad8	1235	Radomlje
00050000-56a0-a6aa-afa5-dd82a5ee2f7f	4240	Radovljica
00050000-56a0-a6aa-ca86-07b6662e0ca0	8274	Raka
00050000-56a0-a6aa-1c97-36788c1bd65e	1381	Rakek
00050000-56a0-a6aa-cac0-d0b48fbbbda7	4283	Rateče - Planica
00050000-56a0-a6aa-cbb7-8888a9ec2783	2390	Ravne na Koroškem
00050000-56a0-a6aa-8036-53eaa7dd8589	9246	Razkrižje
00050000-56a0-a6aa-65aa-540a85621bdf	3332	Rečica ob Savinji
00050000-56a0-a6aa-c732-d9973de93a8b	5292	Renče
00050000-56a0-a6aa-57e8-4e195d18704c	1310	Ribnica
00050000-56a0-a6aa-c423-aadf86bff6b9	2364	Ribnica na Pohorju
00050000-56a0-a6aa-4858-b0ff1964d680	3272	Rimske Toplice
00050000-56a0-a6aa-e0b5-43328d710326	1314	Rob
00050000-56a0-a6aa-ffba-e50d6dc4a164	5215	Ročinj
00050000-56a0-a6aa-4b84-2e1f277e6b3d	3250	Rogaška Slatina
00050000-56a0-a6aa-3885-3502fa5d0393	9262	Rogašovci
00050000-56a0-a6aa-b3a4-3b5ccf8248c5	3252	Rogatec
00050000-56a0-a6aa-0b8e-56a3ce84a444	1373	Rovte
00050000-56a0-a6aa-662c-9699bea49202	2342	Ruše
00050000-56a0-a6aa-97c2-7763eee0fecc	1282	Sava
00050000-56a0-a6aa-f04c-efc459b319b8	6333	Sečovlje/Sicciole
00050000-56a0-a6aa-e593-afb4fa64cdde	4227	Selca
00050000-56a0-a6aa-99c4-c16e591efee2	2352	Selnica ob Dravi
00050000-56a0-a6aa-4758-4c9668ccdc9b	8333	Semič
00050000-56a0-a6aa-4471-739dec5d90bd	8281	Senovo
00050000-56a0-a6aa-0811-818e3f2de0cf	6224	Senožeče
00050000-56a0-a6aa-6f89-e3e9bee5646f	8290	Sevnica
00050000-56a0-a6aa-4d72-67e580e5997d	6210	Sežana
00050000-56a0-a6aa-66d0-13de89f9cbdf	2214	Sladki Vrh
00050000-56a0-a6aa-c36e-4835aaa538c5	5283	Slap ob Idrijci
00050000-56a0-a6aa-d1b9-59e1339ca169	2380	Slovenj Gradec
00050000-56a0-a6aa-64c2-60fe50a0a271	2310	Slovenska Bistrica
00050000-56a0-a6aa-909f-bee7c1b80758	3210	Slovenske Konjice
00050000-56a0-a6aa-ebc5-740314bafef1	1216	Smlednik
00050000-56a0-a6aa-20a7-bfccb1fb16b1	5232	Soča
00050000-56a0-a6aa-82a1-2bcf33eccc38	1317	Sodražica
00050000-56a0-a6aa-9512-43b09cf40acc	3335	Solčava
00050000-56a0-a6aa-bac7-295235b0c2fd	5250	Solkan
00050000-56a0-a6aa-86c1-0f76703df220	4229	Sorica
00050000-56a0-a6aa-bc66-b8ac77fcff81	4225	Sovodenj
00050000-56a0-a6aa-f272-8b4716504536	5281	Spodnja Idrija
00050000-56a0-a6aa-479a-d2ac854d7248	2241	Spodnji Duplek
00050000-56a0-a6aa-e440-958e54e54725	9245	Spodnji Ivanjci
00050000-56a0-a6aa-5ae0-00610d7142ca	2277	Središče ob Dravi
00050000-56a0-a6aa-c740-7f2739dd8583	4267	Srednja vas v Bohinju
00050000-56a0-a6aa-e924-620223d8d645	8256	Sromlje 
00050000-56a0-a6aa-ef53-2a3ab85caef3	5224	Srpenica
00050000-56a0-a6aa-f0f1-c070040d14d1	1242	Stahovica
00050000-56a0-a6aa-c6ef-698e5da28983	1332	Stara Cerkev
00050000-56a0-a6aa-c812-bf047c979151	8342	Stari trg ob Kolpi
00050000-56a0-a6aa-74b0-f8d26a5aca70	1386	Stari trg pri Ložu
00050000-56a0-a6aa-cbbe-b10a01db965b	2205	Starše
00050000-56a0-a6aa-07bb-71e27f57ef3c	2289	Stoperce
00050000-56a0-a6aa-2a43-ecca64b26edd	8322	Stopiče
00050000-56a0-a6aa-d911-524f2056afa3	3206	Stranice
00050000-56a0-a6aa-f533-337cd71c8b5d	8351	Straža
00050000-56a0-a6aa-b2e7-0746889a5d96	1313	Struge
00050000-56a0-a6aa-673c-625db5533434	8293	Studenec
00050000-56a0-a6aa-8765-45ddbc1daa61	8331	Suhor
00050000-56a0-a6aa-bac3-32f508aa0204	2233	Sv. Ana v Slovenskih goricah
00050000-56a0-a6aa-d5db-6f02af2e56f2	2235	Sv. Trojica v Slovenskih goricah
00050000-56a0-a6aa-99c0-6dbe8ecccbc9	2353	Sveti Duh na Ostrem Vrhu
00050000-56a0-a6aa-a710-a1fd483f9be0	9244	Sveti Jurij ob Ščavnici
00050000-56a0-a6aa-be35-53755af21e29	3264	Sveti Štefan
00050000-56a0-a6aa-404a-b2d26df885f6	2258	Sveti Tomaž
00050000-56a0-a6aa-07a4-b2affdbc9940	9204	Šalovci
00050000-56a0-a6aa-5506-8bdef86d0bab	5261	Šempas
00050000-56a0-a6aa-5638-290240200165	5290	Šempeter pri Gorici
00050000-56a0-a6aa-1ef8-609968dcf882	3311	Šempeter v Savinjski dolini
00050000-56a0-a6aa-ded5-712e2bd104d5	4208	Šenčur
00050000-56a0-a6aa-f11f-fe123709eb41	2212	Šentilj v Slovenskih goricah
00050000-56a0-a6aa-ebbb-6d1de6e7c328	8297	Šentjanž
00050000-56a0-a6aa-6826-4f702f011322	2373	Šentjanž pri Dravogradu
00050000-56a0-a6aa-d264-db063a9478aa	8310	Šentjernej
00050000-56a0-a6aa-c916-55a431a30314	3230	Šentjur
00050000-56a0-a6aa-3af0-4d0ea008a0e4	3271	Šentrupert
00050000-56a0-a6aa-c52d-5f78ccab9597	8232	Šentrupert
00050000-56a0-a6aa-7f05-010dfcb99759	1296	Šentvid pri Stični
00050000-56a0-a6aa-9cf3-3692c69f323d	8275	Škocjan
00050000-56a0-a6aa-b663-7495b45329e3	6281	Škofije
00050000-56a0-a6aa-73be-0c2dcfd0baae	4220	Škofja Loka
00050000-56a0-a6aa-1747-c582f412b076	3211	Škofja vas
00050000-56a0-a6aa-2e85-10923cc376a7	1291	Škofljica
00050000-56a0-a6aa-feec-b4a3b5ce6e14	6274	Šmarje
00050000-56a0-a6aa-5861-a342124e44e7	1293	Šmarje - Sap
00050000-56a0-a6aa-c9b5-a3307cfc0b31	3240	Šmarje pri Jelšah
00050000-56a0-a6aa-f2f4-9f1e392d920b	8220	Šmarješke Toplice
00050000-56a0-a6aa-ebb3-82b6abfdf09e	2315	Šmartno na Pohorju
00050000-56a0-a6aa-e51d-e9238c884456	3341	Šmartno ob Dreti
00050000-56a0-a6aa-a314-361d5482b7ab	3327	Šmartno ob Paki
00050000-56a0-a6aa-6ebd-162e45e1ea78	1275	Šmartno pri Litiji
00050000-56a0-a6aa-8ae9-5373744b334d	2383	Šmartno pri Slovenj Gradcu
00050000-56a0-a6aa-92bb-1bd9596316ba	3201	Šmartno v Rožni dolini
00050000-56a0-a6aa-53b0-71ed17a1edfa	3325	Šoštanj
00050000-56a0-a6aa-80c0-e049ed16c56b	6222	Štanjel
00050000-56a0-a6aa-ca6b-6e9fac76174b	3220	Štore
00050000-56a0-a6aa-fcda-c948d73a4610	3304	Tabor
00050000-56a0-a6aa-e037-f14c7ddb9dde	3221	Teharje
00050000-56a0-a6aa-ca09-5ad9bb4f1a34	9251	Tišina
00050000-56a0-a6aa-132a-15a3ab1380d2	5220	Tolmin
00050000-56a0-a6aa-a990-f01a53b4dc22	3326	Topolšica
00050000-56a0-a6aa-c138-a6f0784ef338	2371	Trbonje
00050000-56a0-a6aa-525a-39162894a172	1420	Trbovlje
00050000-56a0-a6aa-c94f-9a8da7e1b245	8231	Trebelno 
00050000-56a0-a6aa-eaa6-dd3fdba8be5d	8210	Trebnje
00050000-56a0-a6aa-f7c1-757fd36bf776	5252	Trnovo pri Gorici
00050000-56a0-a6aa-ad5f-4c20b437a708	2254	Trnovska vas
00050000-56a0-a6aa-2fe5-8e39d42677ef	1222	Trojane
00050000-56a0-a6aa-16b2-ae68dd5fd357	1236	Trzin
00050000-56a0-a6aa-5012-7195a4cd8232	4290	Tržič
00050000-56a0-a6aa-a8e2-7fe477c9f244	8295	Tržišče
00050000-56a0-a6aa-37a2-570a9f3a5bf7	1311	Turjak
00050000-56a0-a6aa-9159-e47554fcd878	9224	Turnišče
00050000-56a0-a6aa-71ff-bf174f51d471	8323	Uršna sela
00050000-56a0-a6aa-d8ad-eb5351399f13	1252	Vače
00050000-56a0-a6aa-a755-71fbf8d2a1ef	3320	Velenje 
00050000-56a0-a6aa-4625-9821c3548488	3322	Velenje - poštni predali
00050000-56a0-a6aa-efaf-13883f2c0a95	8212	Velika Loka
00050000-56a0-a6aa-b04f-e7370b0fb4e8	2274	Velika Nedelja
00050000-56a0-a6aa-706a-872ef822915c	9225	Velika Polana
00050000-56a0-a6aa-9a03-9673fb633969	1315	Velike Lašče
00050000-56a0-a6aa-589d-7ac861befed9	8213	Veliki Gaber
00050000-56a0-a6aa-27c9-5f7d265e68dd	9241	Veržej
00050000-56a0-a6aa-fe0e-cb67f3e09fd0	1312	Videm - Dobrepolje
00050000-56a0-a6aa-8255-aa7bd43ca9ab	2284	Videm pri Ptuju
00050000-56a0-a6aa-cddc-e74bd289c97d	8344	Vinica
00050000-56a0-a6aa-bcaa-4e7bf8149db1	5271	Vipava
00050000-56a0-a6aa-0fd5-c4ac46ea5054	4212	Visoko
00050000-56a0-a6aa-55af-b8048b9fda11	1294	Višnja Gora
00050000-56a0-a6aa-5993-9fddcd474fc1	3205	Vitanje
00050000-56a0-a6aa-b7ce-b71dfc076f3b	2255	Vitomarci
00050000-56a0-a6aa-fca8-897f6f31995c	1217	Vodice
00050000-56a0-a6aa-1656-0bb5cacf54f1	3212	Vojnik\t
00050000-56a0-a6aa-6653-7a01205f8b39	5293	Volčja Draga
00050000-56a0-a6aa-b26a-604dcb97d486	2232	Voličina
00050000-56a0-a6aa-5d15-f965e77a44af	3305	Vransko
00050000-56a0-a6aa-b2ef-d8e5470060f9	6217	Vremski Britof
00050000-56a0-a6aa-80a1-6e6b2d42caf6	1360	Vrhnika
00050000-56a0-a6aa-cf4d-4c752939dfe5	2365	Vuhred
00050000-56a0-a6aa-be2d-d4ee461eb173	2367	Vuzenica
00050000-56a0-a6aa-01e1-ca87bfcfd79e	8292	Zabukovje 
00050000-56a0-a6aa-2c93-a5eacbc9a9fc	1410	Zagorje ob Savi
00050000-56a0-a6aa-6a95-4dc31ee1e285	1303	Zagradec
00050000-56a0-a6aa-b1a4-54d3b794490d	2283	Zavrč
00050000-56a0-a6aa-5943-b9c39d2a7836	8272	Zdole 
00050000-56a0-a6aa-dc78-942b2f4ad461	4201	Zgornja Besnica
00050000-56a0-a6aa-dca6-baed179fc10a	2242	Zgornja Korena
00050000-56a0-a6aa-9470-a30d689ece31	2201	Zgornja Kungota
00050000-56a0-a6aa-9a81-cd72029640b1	2316	Zgornja Ložnica
00050000-56a0-a6aa-5bd4-7cdd7d4f0219	2314	Zgornja Polskava
00050000-56a0-a6aa-8d9d-bc32a2ccbd01	2213	Zgornja Velka
00050000-56a0-a6aa-1cbe-f824b2e6fc18	4247	Zgornje Gorje
00050000-56a0-a6aa-eb72-3166bf24dc42	4206	Zgornje Jezersko
00050000-56a0-a6aa-d197-f7aebd5f62ec	2285	Zgornji Leskovec
00050000-56a0-a6aa-bf43-d05b4c4b2ef7	1432	Zidani Most
00050000-56a0-a6aa-bc0b-b2f112919b0d	3214	Zreče
00050000-56a0-a6aa-f3e3-93e2c0f502e1	4209	Žabnica
00050000-56a0-a6aa-43d5-0256f3e36033	3310	Žalec
00050000-56a0-a6aa-4416-9d859ebae3a6	4228	Železniki
00050000-56a0-a6aa-b7e3-1e9608fbbe5d	2287	Žetale
00050000-56a0-a6aa-5039-3ee062309388	4226	Žiri
00050000-56a0-a6aa-03b7-80a183d3c867	4274	Žirovnica
00050000-56a0-a6aa-6077-a2e60d995530	8360	Žužemberk
\.


--
-- TOC entry 3208 (class 0 OID 38993083)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 38992652)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 38992390)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a0-a6ad-6e01-9f565736dece	00080000-56a0-a6ad-9e5e-62339b42753b	\N	00040000-56a0-a6aa-71c9-05b4b6b6043b	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a0-a6ad-6aee-922bc3a38458	00080000-56a0-a6ad-9e5e-62339b42753b	\N	00040000-56a0-a6aa-71c9-05b4b6b6043b	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a0-a6ad-85d1-2125cb0e0553	00080000-56a0-a6ad-0ecd-ff5926ec71fc	\N	00040000-56a0-a6aa-71c9-05b4b6b6043b	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3168 (class 0 OID 38992527)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a0-a6ab-1ca3-c0bbfc399b0a	novo leto	1	1	\N	t
00430000-56a0-a6ab-2b32-79449cfc2881	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a0-a6ab-3851-99c06424279e	dan upora proti okupatorju	27	4	\N	t
00430000-56a0-a6ab-3702-8b733bfb2dd2	praznik dela	1	5	\N	t
00430000-56a0-a6ab-e29e-f16c3cd0238a	praznik dela	2	5	\N	t
00430000-56a0-a6ab-f661-2427619b344d	dan Primoža Trubarja	8	6	\N	f
00430000-56a0-a6ab-6050-ce993d9eeef8	dan državnosti	25	6	\N	t
00430000-56a0-a6ab-32f1-e31d7be6a663	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a0-a6ab-20d9-b639dfecef04	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a0-a6ab-780e-55934ee01652	dan suverenosti	25	10	\N	f
00430000-56a0-a6ab-339b-dacaebe96280	dan spomina na mrtve	1	11	\N	t
00430000-56a0-a6ab-9df2-958f78f6f5dd	dan Rudolfa Maistra	23	11	\N	f
00430000-56a0-a6ab-f38d-72e3436cf963	božič	25	12	\N	t
00430000-56a0-a6ab-2e77-bf5c0534211e	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a0-a6ab-bbbf-03217c1af7fd	Marijino vnebovzetje	15	8	\N	t
00430000-56a0-a6ab-1f83-a6c2bab58eed	dan reformacije	31	10	\N	t
00430000-56a0-a6ab-e794-d7d9461e6a15	velikonočna nedelja	27	3	2016	t
00430000-56a0-a6ab-17b1-1e1d005b3a49	velikonočna nedelja	16	4	2017	t
00430000-56a0-a6ab-14de-84aae5e63e91	velikonočna nedelja	1	4	2018	t
00430000-56a0-a6ab-c11e-57aed4bc600e	velikonočna nedelja	21	4	2019	t
00430000-56a0-a6ab-6048-7dce2e31247a	velikonočna nedelja	12	4	2020	t
00430000-56a0-a6ab-7cfa-3c810b0acc37	velikonočna nedelja	4	4	2021	t
00430000-56a0-a6ab-6d0b-6847aab993af	velikonočna nedelja	17	4	2022	t
00430000-56a0-a6ab-5a66-9eba3277b40b	velikonočna nedelja	9	4	2023	t
00430000-56a0-a6ab-81c1-e030eef033c3	velikonočna nedelja	31	3	2024	t
00430000-56a0-a6ab-0b47-25ade3380fae	velikonočna nedelja	20	4	2025	t
00430000-56a0-a6ab-08ae-b2d03da58c22	velikonočna nedelja	5	4	2026	t
00430000-56a0-a6ab-a7ed-72996c1f1f63	velikonočna nedelja	28	3	2027	t
00430000-56a0-a6ab-00fc-4c063e5a898e	velikonočna nedelja	16	4	2028	t
00430000-56a0-a6ab-05e8-8f863045cfb3	velikonočna nedelja	1	4	2029	t
00430000-56a0-a6ab-a152-9ef83ebf9ea0	velikonočna nedelja	21	4	2030	t
00430000-56a0-a6ab-ff4f-e4e38345be64	velikonočni ponedeljek	28	3	2016	t
00430000-56a0-a6ab-7bba-936869211042	velikonočni ponedeljek	17	4	2017	t
00430000-56a0-a6ab-3a6c-c0bafcac89a0	velikonočni ponedeljek	2	4	2018	t
00430000-56a0-a6ab-c71a-e24b208ce411	velikonočni ponedeljek	22	4	2019	t
00430000-56a0-a6ab-7b2d-eb142680dc5d	velikonočni ponedeljek	13	4	2020	t
00430000-56a0-a6ab-ae59-06aa1262b0a2	velikonočni ponedeljek	5	4	2021	t
00430000-56a0-a6ab-8c3f-2ef744657e7c	velikonočni ponedeljek	18	4	2022	t
00430000-56a0-a6ab-88d9-b4f7b25e7784	velikonočni ponedeljek	10	4	2023	t
00430000-56a0-a6ab-62d1-df4fffd8254a	velikonočni ponedeljek	1	4	2024	t
00430000-56a0-a6ab-12ee-2554a9778cfe	velikonočni ponedeljek	21	4	2025	t
00430000-56a0-a6ab-0699-7f40b28f406e	velikonočni ponedeljek	6	4	2026	t
00430000-56a0-a6ab-155d-01ae48f68c50	velikonočni ponedeljek	29	3	2027	t
00430000-56a0-a6ab-fe29-a1a7cee5703c	velikonočni ponedeljek	17	4	2028	t
00430000-56a0-a6ab-87fa-6f5727962db4	velikonočni ponedeljek	2	4	2029	t
00430000-56a0-a6ab-dc80-d79b9ccd4789	velikonočni ponedeljek	22	4	2030	t
00430000-56a0-a6ab-54af-74f610b076d7	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a0-a6ab-837f-89849bf6e2d3	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a0-a6ab-5e67-d22be8f6e228	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a0-a6ab-4609-a7cf11c774e8	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a0-a6ab-4287-e29166731cac	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a0-a6ab-dc30-4aed0c431099	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a0-a6ab-0372-b022e0d9d351	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a0-a6ab-0268-a941d8ac5887	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a0-a6ab-5759-ec9ee693fa3b	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a0-a6ab-1cbf-b9d202af62d1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a0-a6ab-c101-3aa44d060509	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a0-a6ab-f24c-135bc741e6b6	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a0-a6ab-f4d6-97c3f99cee0a	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a0-a6ab-d8fa-504d6b1b0f08	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a0-a6ab-2cfe-e4d0d7e74bd1	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3164 (class 0 OID 38992494)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-56a0-a6ae-0f70-9b47204f78de	000e0000-56a0-a6ae-fd41-79b75c91a766	\N	1	\N	\N
\.


--
-- TOC entry 3165 (class 0 OID 38992502)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 38992664)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 38993097)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 38993107)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a0-a6ad-588b-744f17fcdd30	00080000-56a0-a6ad-713d-1116f72c8eb8	0987	AK
00190000-56a0-a6ad-c638-c3fb4e6234e8	00080000-56a0-a6ad-0ecd-ff5926ec71fc	0989	AK
00190000-56a0-a6ad-fa76-38f18aecafe9	00080000-56a0-a6ad-4151-7fb55ca6f7f6	0986	AK
00190000-56a0-a6ad-d177-944b029a2a1e	00080000-56a0-a6ad-7679-6b7507d1fa39	0984	AK
00190000-56a0-a6ad-3f69-b529b9d1a232	00080000-56a0-a6ad-ef0d-ce647144690b	0983	AK
00190000-56a0-a6ad-97d9-713838e796c1	00080000-56a0-a6ad-8101-42f58d766549	0982	AK
00190000-56a0-a6af-fff1-93c1f607dd01	00080000-56a0-a6af-d321-7f2a02702489	1001	AK
\.


--
-- TOC entry 3207 (class 0 OID 38992996)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a0-a6ae-1105-18788e6382b9	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3211 (class 0 OID 38993115)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 38992693)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a0-a6ad-5950-2567f851f35c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a0-a6ad-2ec1-b3d66760f6ca	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a0-a6ad-d00a-3e5547447902	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a0-a6ad-9139-0203bbe87190	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a0-a6ad-54bc-ddc3a9ef34b4	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a0-a6ad-fb3f-b581e51878b4	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a0-a6ad-9901-3b5174fa7c16	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3179 (class 0 OID 38992637)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 38992627)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 38992835)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 38992765)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 38992468)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 38992229)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a0-a6af-d321-7f2a02702489	00010000-56a0-a6ac-3713-3bc433978704	2016-01-21 10:36:47	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a0-a6af-b60d-ef4fe74eb805	00010000-56a0-a6ac-3713-3bc433978704	2016-01-21 10:36:47	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a0-a6af-fff1-93c1f607dd01	00010000-56a0-a6ac-3713-3bc433978704	2016-01-21 10:36:47	INS	a:0:{}
\.


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3188 (class 0 OID 38992707)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 38992267)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a0-a6ab-00ee-4099c69412b1	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a0-a6ab-a699-b2c4ce4325a9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a0-a6ab-371b-c555f3a24d45	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a0-a6ab-58d1-54955a5ad015	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a0-a6ab-3320-5cdcd5ae736e	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a0-a6ab-1ca4-c7f005bb6987	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a0-a6ab-0be4-63023b4d17a0	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a0-a6ab-b6fb-1f09c3fc75f7	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a0-a6ab-743a-4ea92a71ccd7	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a0-a6ab-bbb5-296d715c826e	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a0-a6ab-4a53-aca1526035cb	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a0-a6ab-34a7-057127c9a064	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a0-a6ab-6a8a-df77595cca04	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a0-a6ab-0679-3d8e78f86b3a	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a0-a6ab-b3a4-93111d7c570b	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a0-a6ab-835c-4ae78f53281c	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a0-a6ab-9249-d4fd8f41c51c	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a0-a6ab-6199-d9cf54bc5012	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a0-a6ab-c240-fb0d667dc289	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a0-a6ab-33de-ca3ba67f0ef3	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a0-a6ab-e28c-826dab5b61bc	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a0-a6ab-e9e5-4b72564c4063	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a0-a6ab-ea96-424037f849d9	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a0-a6ab-b4da-4d669955e701	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a0-a6ab-d3bf-10123bac5a43	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a0-a6ab-6321-8cc95bea0194	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a0-a6ab-851e-85d9409ff3bc	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a0-a6ab-7221-2744f689c94d	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a0-a6ab-4e60-781f55359572	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a0-a6ab-a804-1741889de693	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a0-a6ab-5065-8d02e01ee0a0	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a0-a6ab-2b47-22f0e3c753d1	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a0-a6ab-d750-4583fffe8d3d	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a0-a6ab-46de-04019735d6a1	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a0-a6ab-5e21-57350c7318a2	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a0-a6ab-6531-b8fa0ae000e5	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a0-a6ab-7b7b-257fa7dea762	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a0-a6ab-3795-fbb964962900	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a0-a6ab-47aa-dabeea2489b0	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a0-a6ab-d2ac-183c522bad3d	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a0-a6ab-c690-05a290d3ed7e	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a0-a6ab-1b0a-2020a6955e29	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a0-a6ab-5fd2-945d75f03d1d	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a0-a6ab-280d-960e4fd6d499	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a0-a6ab-b1fb-4b282f67ef29	direktor	minimalne pravice za direktorja	t
00020000-56a0-a6ab-3fb7-211785792322	arhivar	arhivar	t
00020000-56a0-a6ab-b986-9681fce62a6f	dramaturg	dramaturg	t
00020000-56a0-a6ab-2562-1aeedfd221e6	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a0-a6ab-272f-b92ae0f761ea	poslovni-sekretar	poslovni sekretar	t
00020000-56a0-a6ab-9aef-bc5b3d06ef19	vodja-tehnike	vodja tehnike	t
00020000-56a0-a6ab-1a35-b77830518001	racunovodja	računovodja	t
00020000-56a0-a6ad-4f03-6bb4080067b8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a0-a6ad-afef-9b37fc734dc4	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-0c6a-39f8a2d67088	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-071d-2964ecd77534	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-548a-c195f3f48e4a	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-6158-5585dc18c71c	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-206b-d1df9c6778f3	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-44b2-95406317f22f	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-444a-d5f69aaa4aae	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-5e46-24326a782132	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-fb35-13fdcd08c92b	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-9942-865c66cdcd97	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-8b19-21330341398c	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-0f60-b55c883907a5	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-d2e7-3f00812bf56d	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-f65f-a1013f2dce7f	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-8ebd-f1b250a3650e	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-6fdc-d72f158e0940	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-7f3a-ac626b5398a3	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-977d-50e19da82758	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a0-a6ad-3ff9-c8fb02611455	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-b902-dd74b807db76	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-9aef-8527e386716a	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-c3a9-3c05fbb091b1	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-36ab-c73990c1bb5c	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-e0bb-bd10fedde5d6	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-bf85-7b92a9eef323	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-db1c-bc44dc03ac27	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-062b-c43d02253cc0	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-3d8a-7531c0b8c13e	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-98ef-1b3fc8a5dfcb	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-230e-80b41088591b	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-6290-4d9201dc7624	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-6797-7c128e808f1d	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-e0ec-c0c38ba81cd2	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-e81e-5626e7fb0eda	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-7aac-fb2c08a108c9	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-7c1a-9c7d303bbdeb	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a0-a6ad-930e-4ad7359074e0	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3143 (class 0 OID 38992251)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a0-a6ac-697b-747821183131	00020000-56a0-a6ab-371b-c555f3a24d45
00010000-56a0-a6ac-3713-3bc433978704	00020000-56a0-a6ab-371b-c555f3a24d45
00010000-56a0-a6ad-13d9-1b57232f5c9c	00020000-56a0-a6ad-4f03-6bb4080067b8
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-afef-9b37fc734dc4
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-6158-5585dc18c71c
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-5e46-24326a782132
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-9942-865c66cdcd97
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-0f60-b55c883907a5
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-7f3a-ac626b5398a3
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-071d-2964ecd77534
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-3ff9-c8fb02611455
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-c3a9-3c05fbb091b1
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-e0bb-bd10fedde5d6
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-db1c-bc44dc03ac27
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-3d8a-7531c0b8c13e
00010000-56a0-a6ad-55a8-fd6de236c53e	00020000-56a0-a6ad-6797-7c128e808f1d
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-afef-9b37fc734dc4
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-0c6a-39f8a2d67088
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-071d-2964ecd77534
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-548a-c195f3f48e4a
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-0f60-b55c883907a5
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-8ebd-f1b250a3650e
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-3ff9-c8fb02611455
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-c3a9-3c05fbb091b1
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-e0bb-bd10fedde5d6
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-db1c-bc44dc03ac27
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-3d8a-7531c0b8c13e
00010000-56a0-a6ad-a940-4a4b41446b49	00020000-56a0-a6ad-6797-7c128e808f1d
00010000-56a0-a6ad-8b85-e6e84f877c93	00020000-56a0-a6ad-afef-9b37fc734dc4
00010000-56a0-a6ad-8b85-e6e84f877c93	00020000-56a0-a6ad-0c6a-39f8a2d67088
00010000-56a0-a6ad-8b85-e6e84f877c93	00020000-56a0-a6ad-071d-2964ecd77534
00010000-56a0-a6ad-8b85-e6e84f877c93	00020000-56a0-a6ad-548a-c195f3f48e4a
00010000-56a0-a6ad-8b85-e6e84f877c93	00020000-56a0-a6ad-9942-865c66cdcd97
00010000-56a0-a6ad-8b85-e6e84f877c93	00020000-56a0-a6ad-0f60-b55c883907a5
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-0c6a-39f8a2d67088
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-206b-d1df9c6778f3
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-fb35-13fdcd08c92b
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-8b19-21330341398c
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-9942-865c66cdcd97
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-6fdc-d72f158e0940
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-0f60-b55c883907a5
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-d2e7-3f00812bf56d
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-3ff9-c8fb02611455
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-b902-dd74b807db76
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-c3a9-3c05fbb091b1
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-36ab-c73990c1bb5c
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-e0bb-bd10fedde5d6
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-bf85-7b92a9eef323
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-db1c-bc44dc03ac27
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-062b-c43d02253cc0
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-3d8a-7531c0b8c13e
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-98ef-1b3fc8a5dfcb
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-6797-7c128e808f1d
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-e0ec-c0c38ba81cd2
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-7aac-fb2c08a108c9
00010000-56a0-a6ad-141b-84efad2009ff	00020000-56a0-a6ad-7c1a-9c7d303bbdeb
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-0c6a-39f8a2d67088
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-206b-d1df9c6778f3
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-444a-d5f69aaa4aae
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-fb35-13fdcd08c92b
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-8b19-21330341398c
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-9942-865c66cdcd97
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-6fdc-d72f158e0940
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-0f60-b55c883907a5
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-d2e7-3f00812bf56d
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-f65f-a1013f2dce7f
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-3ff9-c8fb02611455
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-b902-dd74b807db76
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-9aef-8527e386716a
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-c3a9-3c05fbb091b1
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-36ab-c73990c1bb5c
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-e0bb-bd10fedde5d6
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-bf85-7b92a9eef323
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-db1c-bc44dc03ac27
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-062b-c43d02253cc0
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-3d8a-7531c0b8c13e
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-98ef-1b3fc8a5dfcb
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-6797-7c128e808f1d
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-e0ec-c0c38ba81cd2
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-e81e-5626e7fb0eda
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-7aac-fb2c08a108c9
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-7c1a-9c7d303bbdeb
00010000-56a0-a6ad-29a3-63e3b6f59a8a	00020000-56a0-a6ad-930e-4ad7359074e0
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-0c6a-39f8a2d67088
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-071d-2964ecd77534
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-206b-d1df9c6778f3
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-44b2-95406317f22f
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-444a-d5f69aaa4aae
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-6158-5585dc18c71c
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-fb35-13fdcd08c92b
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-8b19-21330341398c
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-9942-865c66cdcd97
00010000-56a0-a6ad-7227-746177adbfc9	00020000-56a0-a6ad-6fdc-d72f158e0940
00010000-56a0-a6ad-1a9c-8d93c334d9f6	00020000-56a0-a6ad-afef-9b37fc734dc4
00010000-56a0-a6ad-1a9c-8d93c334d9f6	00020000-56a0-a6ad-548a-c195f3f48e4a
00010000-56a0-a6ad-1a9c-8d93c334d9f6	00020000-56a0-a6ad-6158-5585dc18c71c
00010000-56a0-a6ad-1a9c-8d93c334d9f6	00020000-56a0-a6ad-5e46-24326a782132
00010000-56a0-a6ad-1a9c-8d93c334d9f6	00020000-56a0-a6ad-9942-865c66cdcd97
00010000-56a0-a6ad-1a9c-8d93c334d9f6	00020000-56a0-a6ad-0f60-b55c883907a5
00010000-56a0-a6ad-1a9c-8d93c334d9f6	00020000-56a0-a6ad-7f3a-ac626b5398a3
00010000-56a0-a6ad-1a9c-8d93c334d9f6	00020000-56a0-a6ad-230e-80b41088591b
00010000-56a0-a6ad-3bcf-c69433548967	00020000-56a0-a6ad-977d-50e19da82758
00010000-56a0-a6ad-02c1-dab639b75f39	00020000-56a0-a6ab-b1fb-4b282f67ef29
00010000-56a0-a6ad-5beb-35fc9bf5612b	00020000-56a0-a6ab-3fb7-211785792322
00010000-56a0-a6ad-d549-ee3660ba4937	00020000-56a0-a6ab-b986-9681fce62a6f
00010000-56a0-a6ad-2fea-ca4d2ea93c24	00020000-56a0-a6ab-2562-1aeedfd221e6
00010000-56a0-a6ad-227e-88f8b728e98a	00020000-56a0-a6ab-272f-b92ae0f761ea
00010000-56a0-a6ad-0fa0-a177d4016ec7	00020000-56a0-a6ab-9aef-bc5b3d06ef19
00010000-56a0-a6ad-7749-f1d8cf7db3cc	00020000-56a0-a6ab-1a35-b77830518001
\.


--
-- TOC entry 3190 (class 0 OID 38992721)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 38992658)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 38992581)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-56a0-a6ad-6265-f174c422b2f4	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-56a0-a6ad-86ef-90e89d429cb3	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-56a0-a6ad-2f48-7dbeeee43a01	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3139 (class 0 OID 38992216)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a0-a6aa-9239-02e8bfecb582	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a0-a6aa-19e5-e0570fb1d22c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a0-a6aa-011a-b5045fea45c7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a0-a6aa-a5f5-5675518c7a2b	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a0-a6aa-894a-bbed3c1ff790	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3138 (class 0 OID 38992208)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a0-a6aa-3f38-053f06355224	00230000-56a0-a6aa-a5f5-5675518c7a2b	popa
00240000-56a0-a6aa-a668-2d8e817ee2bb	00230000-56a0-a6aa-a5f5-5675518c7a2b	oseba
00240000-56a0-a6aa-d97d-c5c967bd7e81	00230000-56a0-a6aa-a5f5-5675518c7a2b	tippopa
00240000-56a0-a6aa-7d44-a40209209197	00230000-56a0-a6aa-a5f5-5675518c7a2b	organizacijskaenota
00240000-56a0-a6aa-2a60-cb325761bcc9	00230000-56a0-a6aa-a5f5-5675518c7a2b	sezona
00240000-56a0-a6aa-da3a-5407c67d8172	00230000-56a0-a6aa-a5f5-5675518c7a2b	tipvaje
00240000-56a0-a6aa-4726-f5f55871b610	00230000-56a0-a6aa-a5f5-5675518c7a2b	tipdodatka
00240000-56a0-a6aa-6577-a847d9b6608e	00230000-56a0-a6aa-19e5-e0570fb1d22c	prostor
00240000-56a0-a6aa-7f3b-80e0fb9e84c4	00230000-56a0-a6aa-a5f5-5675518c7a2b	besedilo
00240000-56a0-a6aa-a8aa-69e52e1f155f	00230000-56a0-a6aa-a5f5-5675518c7a2b	uprizoritev
00240000-56a0-a6aa-b768-e5d762da114d	00230000-56a0-a6aa-a5f5-5675518c7a2b	funkcija
00240000-56a0-a6aa-d760-fdebda63d132	00230000-56a0-a6aa-a5f5-5675518c7a2b	tipfunkcije
00240000-56a0-a6aa-d31f-0f9fa08b82f8	00230000-56a0-a6aa-a5f5-5675518c7a2b	alternacija
00240000-56a0-a6aa-13b8-17b0be72f353	00230000-56a0-a6aa-9239-02e8bfecb582	pogodba
00240000-56a0-a6aa-cbf2-e9dfb70f39c4	00230000-56a0-a6aa-a5f5-5675518c7a2b	zaposlitev
00240000-56a0-a6aa-b2d9-416cc061d52d	00230000-56a0-a6aa-a5f5-5675518c7a2b	zvrstuprizoritve
00240000-56a0-a6aa-3708-0cfc82ec9008	00230000-56a0-a6aa-9239-02e8bfecb582	programdela
00240000-56a0-a6aa-79a6-5f18ab744608	00230000-56a0-a6aa-a5f5-5675518c7a2b	zapis
\.


--
-- TOC entry 3137 (class 0 OID 38992203)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
a4fc30df-b095-4f70-9597-3f767b0eda73	00240000-56a0-a6aa-3f38-053f06355224	0	1001
\.


--
-- TOC entry 3196 (class 0 OID 38992782)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a0-a6ae-1235-4341e3823c28	000e0000-56a0-a6ae-fd41-79b75c91a766	00080000-56a0-a6ad-9e5e-62339b42753b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a0-a6ab-2c93-01aede5163f1
00270000-56a0-a6ae-442b-40a15b146d0c	000e0000-56a0-a6ae-fd41-79b75c91a766	00080000-56a0-a6ad-9e5e-62339b42753b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a0-a6ab-2c93-01aede5163f1
\.


--
-- TOC entry 3153 (class 0 OID 38992352)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 38992600)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a0-a6ae-94d6-28a14d602a55	00180000-56a0-a6ae-c181-0811bd6bbb50	000c0000-56a0-a6ae-64ee-f98d11d70e04	00090000-56a0-a6ad-305a-666fc507bfcf	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a0-a6ae-b1bb-4ff68dbcff5a	00180000-56a0-a6ae-c181-0811bd6bbb50	000c0000-56a0-a6ae-087f-4ba6e5cac293	00090000-56a0-a6ad-7118-e8f55c132c47	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a0-a6ae-7fdd-8f2082fa77ea	00180000-56a0-a6ae-c181-0811bd6bbb50	000c0000-56a0-a6ae-242d-27f5daf1f21e	00090000-56a0-a6ad-2dbd-54701072569e	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a0-a6ae-37a5-b06ad42157f5	00180000-56a0-a6ae-c181-0811bd6bbb50	000c0000-56a0-a6ae-a5e9-cec06b5dbdf8	00090000-56a0-a6ad-a334-aa1923ae85b3	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a0-a6ae-7102-df2715fb49ba	00180000-56a0-a6ae-c181-0811bd6bbb50	000c0000-56a0-a6ae-4276-e59921869436	00090000-56a0-a6ad-f16c-2c072b59ecbd	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a0-a6ae-7c44-77836d12dca6	00180000-56a0-a6ae-f7d9-f2773f8c2d7b	\N	00090000-56a0-a6ad-f16c-2c072b59ecbd	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a0-a6ae-4638-a34bf63710c0	00180000-56a0-a6ae-4460-16d79ab86018	\N	00090000-56a0-a6ad-7118-e8f55c132c47	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a0-a6ae-2c8a-07d37a85fee0	00180000-56a0-a6ae-c181-0811bd6bbb50	\N	00090000-56a0-a6ad-1516-61e73e8ac1b9	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3177 (class 0 OID 38992617)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a0-a6aa-3fe0-d6919a6a9df9	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a0-a6aa-155e-1f4e93d876fd	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a0-a6aa-9045-d14fa560ff4a	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a0-a6aa-ee5a-363e95c546e8	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a0-a6aa-d5a7-11d85aebcc6f	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a0-a6aa-3cef-870db5782ffb	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3199 (class 0 OID 38992823)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a0-a6aa-da1c-80723ac79fb3	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a0-a6aa-e914-9bbce4257dd4	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a0-a6aa-a5a9-085281fc43e2	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a0-a6aa-52a5-f61928b1e7f3	04	Režija	Režija	Režija	umetnik	30
000f0000-56a0-a6aa-2224-4524a052fc82	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a0-a6aa-bf72-32f81d0ca1a7	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a0-a6aa-ed53-bfd1ca84e2ee	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a0-a6aa-10d8-379140f7f297	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a0-a6aa-15e1-d80b7d4c9274	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a0-a6aa-397d-c17ee0212662	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a0-a6aa-c4b3-b3d8d898f7e1	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a0-a6aa-2ec4-125f6794587f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a0-a6aa-5301-9a2380ca6fbe	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a0-a6aa-2b23-152e8ac2d239	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a0-a6aa-9b06-68a29ab35d0c	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a0-a6aa-f213-a5f9d221b9f5	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a0-a6aa-8cd2-286f1cbeee5c	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a0-a6aa-5a28-ca5841b07526	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a0-a6aa-caa4-32db8efe268a	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3150 (class 0 OID 38992303)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a0-a6ad-fd19-a8dab014b851	0001	šola	osnovna ali srednja šola
00400000-56a0-a6ad-2e7e-e26e89edab72	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a0-a6ad-f2b0-e30338a5e5af	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3212 (class 0 OID 38993127)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a0-a6aa-f34a-284751919232	01	Velika predstava	f	1.00	1.00
002b0000-56a0-a6aa-8378-5bdf4c0054bb	02	Mala predstava	f	0.50	0.50
002b0000-56a0-a6aa-5391-bcaf8f9ce320	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a0-a6aa-55e3-7ccc9921188f	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a0-a6aa-eb06-5b400a2e8bb5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3172 (class 0 OID 38992571)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a0-a6aa-ad1f-953a540f7471	0001	prva vaja	prva vaja
00420000-56a0-a6aa-dc1a-cfa6e14408fa	0002	tehnična vaja	tehnična vaja
00420000-56a0-a6aa-7e77-baaf8ef62777	0003	lučna vaja	lučna vaja
00420000-56a0-a6aa-df0c-3a1914d983ee	0004	kostumska vaja	kostumska vaja
00420000-56a0-a6aa-ce46-8c1194b1bd49	0005	foto vaja	foto vaja
00420000-56a0-a6aa-8654-9c579692adea	0006	1. glavna vaja	1. glavna vaja
00420000-56a0-a6aa-d5d1-d206af54a875	0007	2. glavna vaja	2. glavna vaja
00420000-56a0-a6aa-8f3e-76e669459806	0008	1. generalka	1. generalka
00420000-56a0-a6aa-091f-f18786828c3d	0009	2. generalka	2. generalka
00420000-56a0-a6aa-59d2-70d30eb7c320	0010	odprta generalka	odprta generalka
00420000-56a0-a6aa-6f86-d65bee013f3d	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a0-a6aa-0a9a-221ae87929c3	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a0-a6aa-1fcd-f1b30e9d5cef	0013	pevska vaja	pevska vaja
00420000-56a0-a6aa-ab5c-3ecd1f8dd865	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a0-a6aa-bf5a-8161edfc74ef	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a0-a6aa-16c4-1ac14ca55ce8	0016	orientacijska vaja	orientacijska vaja
00420000-56a0-a6aa-92bf-57c1584bda17	0017	situacijska vaja	situacijska vaja
00420000-56a0-a6aa-2e4e-10227fe09149	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3159 (class 0 OID 38992425)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 38992238)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a0-a6ac-3713-3bc433978704	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO0L0w4Y.RTKcRqA47.M0m0T2cveVtmda	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-711e-35ceb1d0db1a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-e0f7-73a5c7d44f02	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-b362-8ff483fa383b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-c391-f3d2dfee79af	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-5bee-ff6b0695fd11	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-f534-b86c6fb2e5a6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-5963-fef2ba8cc488	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-1fee-ebb87643f76a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-1d69-c5d7ce74a88d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-13d9-1b57232f5c9c	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-9d94-d5d20e7f1fad	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-55a8-fd6de236c53e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-a940-4a4b41446b49	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-8b85-e6e84f877c93	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-141b-84efad2009ff	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-29a3-63e3b6f59a8a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-7227-746177adbfc9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-1a9c-8d93c334d9f6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-3bcf-c69433548967	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-02c1-dab639b75f39	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-5beb-35fc9bf5612b	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-d549-ee3660ba4937	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-2fea-ca4d2ea93c24	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-227e-88f8b728e98a	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-0fa0-a177d4016ec7	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a0-a6ad-7749-f1d8cf7db3cc	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a0-a6ac-697b-747821183131	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3203 (class 0 OID 38992873)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a0-a6ae-f16e-80a54f7b1d8f	00160000-56a0-a6ad-658a-3fce79b0f245	\N	00140000-56a0-a6aa-2f53-1d7b82d81b6e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a0-a6ad-54bc-ddc3a9ef34b4
000e0000-56a0-a6ae-fd41-79b75c91a766	00160000-56a0-a6ad-f932-69eab97ed8ed	\N	00140000-56a0-a6aa-1014-302a6e6d2e0f	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a0-a6ad-fb3f-b581e51878b4
000e0000-56a0-a6ae-95a3-329aded74170	\N	\N	00140000-56a0-a6aa-1014-302a6e6d2e0f	00190000-56a0-a6ad-588b-744f17fcdd30	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a0-a6ad-54bc-ddc3a9ef34b4
000e0000-56a0-a6ae-913c-7a59f2d397c8	\N	\N	00140000-56a0-a6aa-1014-302a6e6d2e0f	00190000-56a0-a6ad-588b-744f17fcdd30	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a0-a6ad-54bc-ddc3a9ef34b4
000e0000-56a0-a6ae-dafd-2cc24157985e	\N	\N	00140000-56a0-a6aa-1014-302a6e6d2e0f	00190000-56a0-a6ad-588b-744f17fcdd30	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-985c-2778b1d5453a	\N	\N	00140000-56a0-a6aa-1014-302a6e6d2e0f	00190000-56a0-a6ad-588b-744f17fcdd30	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-53f6-c6ffb8096f9b	\N	\N	00140000-56a0-a6aa-b364-ddfc9523531f	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-c128-960c481f51a1	\N	\N	00140000-56a0-a6aa-b364-ddfc9523531f	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-e23f-c13e4c38f19d	\N	\N	00140000-56a0-a6aa-b364-ddfc9523531f	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-e186-c6cea4ae4dec	\N	\N	00140000-56a0-a6aa-b364-ddfc9523531f	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-a898-67dda106c256	\N	\N	00140000-56a0-a6aa-b364-ddfc9523531f	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-e9b3-8bfae322ab4a	\N	\N	00140000-56a0-a6aa-b364-ddfc9523531f	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-3765-dce6fff76582	\N	\N	00140000-56a0-a6aa-b364-ddfc9523531f	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-cd44-bc9e4c2b5c8f	\N	\N	00140000-56a0-a6aa-b364-ddfc9523531f	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
000e0000-56a0-a6ae-1340-b9456e848985	\N	\N	00140000-56a0-a6aa-b364-ddfc9523531f	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a0-a6ad-5950-2567f851f35c
\.


--
-- TOC entry 3174 (class 0 OID 38992591)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 38992520)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a0-a6ae-eba0-303ed1547bfd	\N	000e0000-56a0-a6ae-fd41-79b75c91a766	1
00200000-56a0-a6ae-e310-5ab94e60a0b9	\N	000e0000-56a0-a6ae-fd41-79b75c91a766	2
00200000-56a0-a6ae-822e-d51e3733b7c5	\N	000e0000-56a0-a6ae-fd41-79b75c91a766	3
00200000-56a0-a6ae-8545-a4ec3f054b84	\N	000e0000-56a0-a6ae-fd41-79b75c91a766	4
00200000-56a0-a6ae-ee57-8c19a6e5a745	\N	000e0000-56a0-a6ae-fd41-79b75c91a766	5
\.


--
-- TOC entry 3186 (class 0 OID 38992685)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 38992796)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a0-a6ab-033f-54f23efcf5a8	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a0-a6ab-be6d-72731f0956f7	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a0-a6ab-6f6d-fa1490ebe55b	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a0-a6ab-f640-2bd9a58dbad3	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a0-a6ab-34ed-79dd653869bf	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a0-a6ab-7c7e-c20ea7e716e3	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a0-a6ab-eda4-5a5779392b60	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a0-a6ab-7f3f-907c9415317e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a0-a6ab-2c93-01aede5163f1	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a0-a6ab-4773-3eff7e24d786	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a0-a6ab-3cb6-c21a9c987ef0	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a0-a6ab-87ca-5babb678115d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a0-a6ab-4c5a-4d6a0834e8fe	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a0-a6ab-8dfb-3702c570ab7b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a0-a6ab-d139-ed34eba24668	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a0-a6ab-6f7c-f13daccc7ab6	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a0-a6ab-13ce-e7caa820de02	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a0-a6ab-4d08-0b34416cd30b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a0-a6ab-838f-23cdc301eb63	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a0-a6ab-5f45-d78df0c30c16	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a0-a6ab-fd05-df10d288e4f9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a0-a6ab-04d3-4851a959d347	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a0-a6ab-8ac0-bad4ca9944fe	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a0-a6ab-199b-0b8b625f9434	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a0-a6ab-0c18-aef792cef55b	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a0-a6ab-7bb4-b4fbfbd17a57	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a0-a6ab-d0bc-1ea707c7a2a3	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a0-a6ab-ab73-ec20ad4e9dc8	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3215 (class 0 OID 38993177)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 38993146)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 38993189)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 38992758)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a0-a6ad-f012-52441b693d62	00090000-56a0-a6ad-7118-e8f55c132c47	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a0-a6ae-2c79-e9f79ab20a01	00090000-56a0-a6ad-2dbd-54701072569e	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a0-a6ae-156a-deb09b9a4690	00090000-56a0-a6ad-6bf0-9c16e20d10d7	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a0-a6ae-1758-46d0aa6dd1e3	00090000-56a0-a6ad-9283-e9a009ffeba1	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a0-a6ae-3d1b-c18106d50529	00090000-56a0-a6ad-6e0e-445ee926c9f3	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a0-a6ae-7a51-c5d49e09ed46	00090000-56a0-a6ad-63a5-bf4f91048f07	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3136 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 38992863)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a0-a6aa-2f53-1d7b82d81b6e	01	Drama	drama (SURS 01)
00140000-56a0-a6aa-5ced-ad0f9c3cc2dd	02	Opera	opera (SURS 02)
00140000-56a0-a6aa-4454-a3d6ed19f933	03	Balet	balet (SURS 03)
00140000-56a0-a6aa-5a52-7f6c2af76711	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a0-a6aa-b364-ddfc9523531f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a0-a6aa-1014-302a6e6d2e0f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a0-a6aa-aaf6-2c5c3079d44f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3192 (class 0 OID 38992748)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2624 (class 2606 OID 38992302)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 38992921)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 38992912)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 38992292)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 38992779)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 38992821)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 38993230)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 38992614)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 38992550)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 38992565)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 38992570)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 38993144)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 38992451)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 38992990)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 38992744)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 38992518)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 38992489)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 38992465)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 38992650)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 38993207)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 38993214)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2911 (class 2606 OID 38993238)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2769 (class 2606 OID 38992677)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 38992423)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 38992321)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 38992385)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 38992348)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 38992281)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2613 (class 2606 OID 38992266)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 38992683)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 38992720)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 38992858)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 38992376)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 38992411)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 38993095)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 38992656)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 38992401)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 38992534)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 38992506)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2690 (class 2606 OID 38992499)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 38992668)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 38993104)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 38993112)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 38993082)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 38993125)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 38992702)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 38992641)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 38992632)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 38992845)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 38992772)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 38992477)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 38992237)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 38992711)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 38992255)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2615 (class 2606 OID 38992275)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 38992729)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 38992663)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 38992589)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 38992225)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 38992213)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 38992207)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 38992792)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 38992357)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 38992606)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 38992624)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 38992832)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 38992310)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 38993137)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 38992578)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 38992436)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 38992250)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 38992891)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 38992597)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 38992524)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 38992691)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 38992804)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 38993187)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 38993171)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 38993195)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 38992762)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 38992871)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 38992756)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 1259 OID 38992559)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2707 (class 1259 OID 38992560)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2708 (class 1259 OID 38992558)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2709 (class 1259 OID 38992557)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2710 (class 1259 OID 38992556)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2812 (class 1259 OID 38992793)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2813 (class 1259 OID 38992794)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 38992795)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2897 (class 1259 OID 38993209)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2898 (class 1259 OID 38993208)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2642 (class 1259 OID 38992378)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2643 (class 1259 OID 38992379)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2770 (class 1259 OID 38992684)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2884 (class 1259 OID 38993175)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2885 (class 1259 OID 38993174)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2886 (class 1259 OID 38993176)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2887 (class 1259 OID 38993173)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2888 (class 1259 OID 38993172)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2764 (class 1259 OID 38992670)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2765 (class 1259 OID 38992669)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2698 (class 1259 OID 38992525)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2699 (class 1259 OID 38992526)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 38992745)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2795 (class 1259 OID 38992747)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2796 (class 1259 OID 38992746)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2674 (class 1259 OID 38992467)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2675 (class 1259 OID 38992466)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2875 (class 1259 OID 38993126)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2828 (class 1259 OID 38992860)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2829 (class 1259 OID 38992861)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 38992862)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2894 (class 1259 OID 38993196)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2837 (class 1259 OID 38992896)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2838 (class 1259 OID 38992893)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2839 (class 1259 OID 38992897)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2840 (class 1259 OID 38992895)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2841 (class 1259 OID 38992894)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2664 (class 1259 OID 38992438)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2665 (class 1259 OID 38992437)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 38992351)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2782 (class 1259 OID 38992712)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2617 (class 1259 OID 38992282)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2618 (class 1259 OID 38992283)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2787 (class 1259 OID 38992732)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2788 (class 1259 OID 38992731)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2789 (class 1259 OID 38992730)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2647 (class 1259 OID 38992388)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2648 (class 1259 OID 38992387)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2649 (class 1259 OID 38992389)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2687 (class 1259 OID 38992500)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2688 (class 1259 OID 38992501)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2597 (class 1259 OID 38992215)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2744 (class 1259 OID 38992636)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2745 (class 1259 OID 38992634)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2746 (class 1259 OID 38992633)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2747 (class 1259 OID 38992635)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2608 (class 1259 OID 38992256)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2609 (class 1259 OID 38992257)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2773 (class 1259 OID 38992692)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2907 (class 1259 OID 38993231)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2810 (class 1259 OID 38992781)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 38992780)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2908 (class 1259 OID 38993239)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2909 (class 1259 OID 38993240)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2759 (class 1259 OID 38992657)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2804 (class 1259 OID 38992773)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2805 (class 1259 OID 38992774)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 38992995)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2858 (class 1259 OID 38992994)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2859 (class 1259 OID 38992991)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2860 (class 1259 OID 38992992)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2861 (class 1259 OID 38992993)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2653 (class 1259 OID 38992403)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 38992402)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2655 (class 1259 OID 38992404)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2776 (class 1259 OID 38992706)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2777 (class 1259 OID 38992705)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2867 (class 1259 OID 38993105)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2868 (class 1259 OID 38993106)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2850 (class 1259 OID 38992925)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2851 (class 1259 OID 38992926)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2852 (class 1259 OID 38992923)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2853 (class 1259 OID 38992924)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2588 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2738 (class 1259 OID 38992615)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2739 (class 1259 OID 38992616)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2800 (class 1259 OID 38992763)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2801 (class 1259 OID 38992764)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2727 (class 1259 OID 38992598)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2750 (class 1259 OID 38992645)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2751 (class 1259 OID 38992644)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2752 (class 1259 OID 38992642)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2753 (class 1259 OID 38992643)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2847 (class 1259 OID 38992913)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2678 (class 1259 OID 38992478)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2681 (class 1259 OID 38992492)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2682 (class 1259 OID 38992491)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2683 (class 1259 OID 38992490)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2684 (class 1259 OID 38992493)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2697 (class 1259 OID 38992519)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2691 (class 1259 OID 38992507)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2692 (class 1259 OID 38992508)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2864 (class 1259 OID 38993096)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2883 (class 1259 OID 38993145)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2901 (class 1259 OID 38993215)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2902 (class 1259 OID 38993216)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2629 (class 1259 OID 38992323)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2630 (class 1259 OID 38992322)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2638 (class 1259 OID 38992358)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 38992359)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 38992609)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2732 (class 1259 OID 38992608)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2733 (class 1259 OID 38992607)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2711 (class 1259 OID 38992552)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2712 (class 1259 OID 38992555)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2713 (class 1259 OID 38992551)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2714 (class 1259 OID 38992554)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2715 (class 1259 OID 38992553)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2646 (class 1259 OID 38992377)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 38992311)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2628 (class 1259 OID 38992312)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2670 (class 1259 OID 38992452)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 38992454)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2672 (class 1259 OID 38992453)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2673 (class 1259 OID 38992455)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2758 (class 1259 OID 38992651)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 38992859)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2842 (class 1259 OID 38992892)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 38992833)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2825 (class 1259 OID 38992834)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 38992349)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 38992350)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2742 (class 1259 OID 38992625)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2743 (class 1259 OID 38992626)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2797 (class 1259 OID 38992757)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 38992226)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 38992424)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2652 (class 1259 OID 38992386)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 38992214)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2880 (class 1259 OID 38993138)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 38992704)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2781 (class 1259 OID 38992703)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 38992579)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2723 (class 1259 OID 38992580)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2854 (class 1259 OID 38992922)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2728 (class 1259 OID 38992599)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2660 (class 1259 OID 38992412)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 38992872)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2891 (class 1259 OID 38993188)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2873 (class 1259 OID 38993113)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2874 (class 1259 OID 38993114)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 38992822)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2726 (class 1259 OID 38992590)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 38992276)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2949 (class 2606 OID 38993406)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2944 (class 2606 OID 38993431)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2946 (class 2606 OID 38993421)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2950 (class 2606 OID 38993401)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 38993416)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 38993426)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2948 (class 2606 OID 38993411)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2989 (class 2606 OID 38993616)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2988 (class 2606 OID 38993621)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2987 (class 2606 OID 38993626)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3020 (class 2606 OID 38993786)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 38993781)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2924 (class 2606 OID 38993296)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2923 (class 2606 OID 38993301)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2970 (class 2606 OID 38993531)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3015 (class 2606 OID 38993766)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3016 (class 2606 OID 38993761)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3014 (class 2606 OID 38993771)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3017 (class 2606 OID 38993756)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3018 (class 2606 OID 38993751)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2968 (class 2606 OID 38993526)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2969 (class 2606 OID 38993521)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2943 (class 2606 OID 38993391)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2942 (class 2606 OID 38993396)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2980 (class 2606 OID 38993571)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 38993581)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2979 (class 2606 OID 38993576)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2933 (class 2606 OID 38993351)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 38993346)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 38993511)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 38993741)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2992 (class 2606 OID 38993631)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2991 (class 2606 OID 38993636)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2990 (class 2606 OID 38993641)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3019 (class 2606 OID 38993776)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2994 (class 2606 OID 38993661)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2997 (class 2606 OID 38993646)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2993 (class 2606 OID 38993666)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2995 (class 2606 OID 38993656)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2996 (class 2606 OID 38993651)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2931 (class 2606 OID 38993341)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2932 (class 2606 OID 38993336)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 38993281)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2920 (class 2606 OID 38993276)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 38993551)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2916 (class 2606 OID 38993256)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2915 (class 2606 OID 38993261)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2975 (class 2606 OID 38993566)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2976 (class 2606 OID 38993561)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2977 (class 2606 OID 38993556)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2926 (class 2606 OID 38993311)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2927 (class 2606 OID 38993306)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2925 (class 2606 OID 38993316)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 38993366)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 38993371)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2912 (class 2606 OID 38993241)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 38993486)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2960 (class 2606 OID 38993476)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2961 (class 2606 OID 38993471)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2959 (class 2606 OID 38993481)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2914 (class 2606 OID 38993246)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 38993251)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2971 (class 2606 OID 38993536)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3024 (class 2606 OID 38993801)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2985 (class 2606 OID 38993611)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2986 (class 2606 OID 38993606)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3026 (class 2606 OID 38993806)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3025 (class 2606 OID 38993811)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2967 (class 2606 OID 38993516)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2984 (class 2606 OID 38993596)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2983 (class 2606 OID 38993601)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 38993716)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3004 (class 2606 OID 38993711)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3007 (class 2606 OID 38993696)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3006 (class 2606 OID 38993701)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3005 (class 2606 OID 38993706)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2929 (class 2606 OID 38993326)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 38993321)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2928 (class 2606 OID 38993331)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 38993546)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2973 (class 2606 OID 38993541)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 38993726)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3009 (class 2606 OID 38993731)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3000 (class 2606 OID 38993686)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2999 (class 2606 OID 38993691)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3002 (class 2606 OID 38993676)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3001 (class 2606 OID 38993681)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2957 (class 2606 OID 38993461)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2956 (class 2606 OID 38993466)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2982 (class 2606 OID 38993586)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 38993591)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2952 (class 2606 OID 38993436)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 38993441)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 38993506)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2963 (class 2606 OID 38993501)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2965 (class 2606 OID 38993491)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2964 (class 2606 OID 38993496)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2998 (class 2606 OID 38993671)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 38993356)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2936 (class 2606 OID 38993361)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 38993386)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 38993376)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 38993381)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3008 (class 2606 OID 38993721)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3011 (class 2606 OID 38993736)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3013 (class 2606 OID 38993746)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3023 (class 2606 OID 38993791)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3022 (class 2606 OID 38993796)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2917 (class 2606 OID 38993271)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2918 (class 2606 OID 38993266)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2922 (class 2606 OID 38993286)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2921 (class 2606 OID 38993291)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2953 (class 2606 OID 38993456)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2954 (class 2606 OID 38993451)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2955 (class 2606 OID 38993446)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-21 10:36:49 CET

--
-- PostgreSQL database dump complete
--

