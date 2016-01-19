--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-19 16:43:20 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 38156215)
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
-- TOC entry 241 (class 1259 OID 38156833)
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
-- TOC entry 240 (class 1259 OID 38156817)
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
-- TOC entry 184 (class 1259 OID 38156208)
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
-- TOC entry 183 (class 1259 OID 38156206)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 38156694)
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
-- TOC entry 234 (class 1259 OID 38156724)
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
-- TOC entry 255 (class 1259 OID 38157136)
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
-- TOC entry 212 (class 1259 OID 38156530)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 38156456)
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
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 38156481)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 38156486)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 38157058)
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
-- TOC entry 196 (class 1259 OID 38156360)
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
-- TOC entry 242 (class 1259 OID 38156846)
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
-- TOC entry 227 (class 1259 OID 38156652)
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
-- TOC entry 202 (class 1259 OID 38156430)
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
-- TOC entry 199 (class 1259 OID 38156400)
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
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 38156377)
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
-- TOC entry 216 (class 1259 OID 38156566)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 38157116)
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
-- TOC entry 254 (class 1259 OID 38157129)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 38157151)
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
-- TOC entry 220 (class 1259 OID 38156591)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 38156334)
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
-- TOC entry 187 (class 1259 OID 38156234)
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
-- TOC entry 191 (class 1259 OID 38156301)
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
-- TOC entry 188 (class 1259 OID 38156245)
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
-- TOC entry 180 (class 1259 OID 38156180)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 38156199)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 38156598)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 38156632)
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
-- TOC entry 237 (class 1259 OID 38156765)
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
-- TOC entry 190 (class 1259 OID 38156281)
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
-- TOC entry 193 (class 1259 OID 38156326)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 38157002)
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
-- TOC entry 217 (class 1259 OID 38156572)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 38156311)
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
-- TOC entry 204 (class 1259 OID 38156448)
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
-- TOC entry 200 (class 1259 OID 38156415)
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
-- TOC entry 201 (class 1259 OID 38156423)
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
-- TOC entry 219 (class 1259 OID 38156584)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 38157016)
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
-- TOC entry 246 (class 1259 OID 38157026)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 38156915)
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
-- TOC entry 247 (class 1259 OID 38157034)
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
-- TOC entry 223 (class 1259 OID 38156613)
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
-- TOC entry 215 (class 1259 OID 38156557)
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
-- TOC entry 214 (class 1259 OID 38156547)
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
-- TOC entry 236 (class 1259 OID 38156754)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 38156684)
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
-- TOC entry 198 (class 1259 OID 38156389)
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
-- TOC entry 177 (class 1259 OID 38156151)
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
-- TOC entry 176 (class 1259 OID 38156149)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 38156626)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 38156189)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 38156173)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 38156640)
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
-- TOC entry 218 (class 1259 OID 38156578)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 38156501)
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
-- TOC entry 175 (class 1259 OID 38156138)
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
-- TOC entry 174 (class 1259 OID 38156130)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 38156125)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 38156701)
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
-- TOC entry 189 (class 1259 OID 38156273)
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
-- TOC entry 211 (class 1259 OID 38156520)
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
-- TOC entry 213 (class 1259 OID 38156537)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 38156742)
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
-- TOC entry 186 (class 1259 OID 38156224)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 38157046)
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
-- TOC entry 208 (class 1259 OID 38156491)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 38156346)
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
-- TOC entry 178 (class 1259 OID 38156160)
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
-- TOC entry 239 (class 1259 OID 38156792)
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
-- TOC entry 210 (class 1259 OID 38156511)
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
-- TOC entry 203 (class 1259 OID 38156441)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 38156605)
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
-- TOC entry 233 (class 1259 OID 38156715)
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
-- TOC entry 251 (class 1259 OID 38157096)
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
-- TOC entry 250 (class 1259 OID 38157065)
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
-- TOC entry 252 (class 1259 OID 38157108)
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
-- TOC entry 229 (class 1259 OID 38156677)
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
-- TOC entry 238 (class 1259 OID 38156782)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 38156667)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 38156211)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 38156154)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3146 (class 0 OID 38156215)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-569e-5994-76b1-9df609757ba8	10	30	Otroci	Abonma za otroke	200
000a0000-569e-5994-ce13-abc25946eac8	20	60	Mladina	Abonma za mladino	400
000a0000-569e-5994-bb23-1d9f271f944f	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3202 (class 0 OID 38156833)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569e-5995-405f-99573fd44731	000d0000-569e-5995-3389-2b52a7eac670	\N	00090000-569e-5994-41a3-eec4b6a136c1	000b0000-569e-5994-69fa-fd479ec90889	0001	f	\N	\N	\N	3	t	t	t
000c0000-569e-5995-799d-e50bb29e8cd2	000d0000-569e-5995-86b3-0b91363f74f1	00100000-569e-5994-0f88-fa7f1df3582c	00090000-569e-5994-e892-383dc65d6c74	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569e-5995-4cc4-48776a31723b	000d0000-569e-5995-460c-dce74cbec4ee	00100000-569e-5994-950a-86bc5ea8a915	00090000-569e-5994-8d58-288c599b5116	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-569e-5995-19d1-d09c310d5f62	000d0000-569e-5995-da33-b064b21142bd	\N	00090000-569e-5994-8fd8-8cd6fe21683c	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569e-5995-33fe-16573f648fa3	000d0000-569e-5995-cf23-174fe5e96440	\N	00090000-569e-5994-3957-1f6303356ede	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569e-5995-49ac-5ac8b38fb9e7	000d0000-569e-5995-ae52-30081e21ecb0	\N	00090000-569e-5994-81cc-c1d3d7707217	000b0000-569e-5994-ef15-b2958a27cdeb	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569e-5995-71f0-575d56d48fa3	000d0000-569e-5995-a031-fe830a625695	00100000-569e-5994-0563-a40a66bd8a15	00090000-569e-5994-4c75-4eb0d9babd9c	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569e-5995-7d48-689cf2d47338	000d0000-569e-5995-696f-b21086348505	\N	00090000-569e-5994-74a4-2440e14d9987	000b0000-569e-5994-b4d1-c27c662f1353	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569e-5995-f998-7b8f3ce6c17d	000d0000-569e-5995-a031-fe830a625695	00100000-569e-5994-8671-0455ab25d226	00090000-569e-5994-759a-5ca04e195b7c	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569e-5995-cd9d-449ed7879758	000d0000-569e-5995-a031-fe830a625695	00100000-569e-5994-45aa-50614c2e03d3	00090000-569e-5994-e380-4f5e928a5a89	\N	0010	t	\N	2016-01-19	\N	16	f	f	t
000c0000-569e-5995-7274-038c8ea6d0f6	000d0000-569e-5995-a031-fe830a625695	00100000-569e-5994-8162-9865258cfeab	00090000-569e-5994-b581-9ccccfee5b26	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569e-5995-2475-e25db0f64d0c	000d0000-569e-5995-6951-becce019cd91	00100000-569e-5994-0f88-fa7f1df3582c	00090000-569e-5994-e892-383dc65d6c74	000b0000-569e-5994-b312-543f2d32fd6a	0012	t	\N	\N	\N	2	t	t	t
000c0000-569e-5995-70fd-abd5acd9d77c	000d0000-569e-5995-6b23-ed95d613ff82	\N	00090000-569e-5994-74a4-2440e14d9987	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569e-5995-c5fa-9c051c4e44fc	000d0000-569e-5995-6b23-ed95d613ff82	\N	00090000-569e-5994-8f91-1ea8809269b1	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569e-5995-f8f4-610409acb528	000d0000-569e-5995-a1a5-10cf561e4101	00100000-569e-5994-950a-86bc5ea8a915	00090000-569e-5994-8d58-288c599b5116	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569e-5995-07a5-b708db6abb0a	000d0000-569e-5995-a1a5-10cf561e4101	\N	00090000-569e-5994-8f91-1ea8809269b1	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569e-5995-0e93-ade9ace91843	000d0000-569e-5995-d747-9cb26decd3ec	\N	00090000-569e-5994-8f91-1ea8809269b1	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569e-5995-5d84-c44c2a0295ff	000d0000-569e-5995-d747-9cb26decd3ec	\N	00090000-569e-5994-74a4-2440e14d9987	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569e-5995-5de4-0178d23073b4	000d0000-569e-5995-f4ed-a4ee20889634	00100000-569e-5994-0563-a40a66bd8a15	00090000-569e-5994-4c75-4eb0d9babd9c	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569e-5995-37b8-153700fca884	000d0000-569e-5995-f4ed-a4ee20889634	\N	00090000-569e-5994-8f91-1ea8809269b1	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569e-5995-75a6-cbd6f36289a3	000d0000-569e-5995-6424-c37b79298cd5	\N	00090000-569e-5994-8f91-1ea8809269b1	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569e-5995-8976-1a2f860fb358	000d0000-569e-5995-6424-c37b79298cd5	00100000-569e-5994-0563-a40a66bd8a15	00090000-569e-5994-4c75-4eb0d9babd9c	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569e-5995-cfb0-f001f35114de	000d0000-569e-5995-93d3-256b57a7a9f8	\N	00090000-569e-5994-8f91-1ea8809269b1	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569e-5995-3cff-d206aaeb38ed	000d0000-569e-5995-ad77-9e05aeee12ca	\N	00090000-569e-5994-74a4-2440e14d9987	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569e-5995-e14f-e17656ee197f	000d0000-569e-5995-0305-97e927fa0a80	\N	00090000-569e-5994-74a4-2440e14d9987	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569e-5995-4a1b-a65524fdae99	000d0000-569e-5995-0305-97e927fa0a80	00100000-569e-5994-950a-86bc5ea8a915	00090000-569e-5994-8d58-288c599b5116	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569e-5995-3cb2-72a083732cbe	000d0000-569e-5995-0803-621970cc1d06	\N	00090000-569e-5994-52ed-b8341df64f7b	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569e-5995-9d85-0840d3b154d1	000d0000-569e-5995-0803-621970cc1d06	\N	00090000-569e-5994-c7f9-fb2fb7fb3299	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569e-5995-0346-50edca6051c8	000d0000-569e-5995-3cac-4c1ec7b1da25	\N	00090000-569e-5994-74a4-2440e14d9987	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569e-5995-4d8d-faf3d28af88e	000d0000-569e-5995-3cac-4c1ec7b1da25	00100000-569e-5994-950a-86bc5ea8a915	00090000-569e-5994-8d58-288c599b5116	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569e-5995-114a-54df71ae33ee	000d0000-569e-5995-3cac-4c1ec7b1da25	\N	00090000-569e-5994-c7f9-fb2fb7fb3299	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569e-5995-6480-0deaae316f3b	000d0000-569e-5995-3cac-4c1ec7b1da25	\N	00090000-569e-5994-52ed-b8341df64f7b	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569e-5995-34c4-5c0d9def164e	000d0000-569e-5995-7967-e59da82b65e1	\N	00090000-569e-5994-74a4-2440e14d9987	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569e-5995-58f9-7ccd390a5965	000d0000-569e-5995-18a6-f9f551955dab	00100000-569e-5994-950a-86bc5ea8a915	00090000-569e-5994-8d58-288c599b5116	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569e-5995-9b95-28bc93d2b03a	000d0000-569e-5995-18a6-f9f551955dab	\N	00090000-569e-5994-8f91-1ea8809269b1	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3201 (class 0 OID 38156817)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 38156208)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 38156694)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569e-5994-9982-c8c34fcb38f8	00160000-569e-5994-b325-cd24c799c664	00090000-569e-5994-c7f9-fb2fb7fb3299	aizv	10	t
003d0000-569e-5994-13f1-c360189890c1	00160000-569e-5994-b325-cd24c799c664	00090000-569e-5994-5ff3-fee9d66e2755	apri	14	t
003d0000-569e-5994-1112-94b2f411df7b	00160000-569e-5994-97fd-066ce86ff350	00090000-569e-5994-52ed-b8341df64f7b	aizv	11	t
003d0000-569e-5994-c44f-7b55541c82e4	00160000-569e-5994-c882-1ba825772299	00090000-569e-5994-a959-a0b10e3dbe2f	aizv	12	t
003d0000-569e-5994-9469-1053deb40540	00160000-569e-5994-b325-cd24c799c664	00090000-569e-5994-8f91-1ea8809269b1	apri	18	f
\.


--
-- TOC entry 3195 (class 0 OID 38156724)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569e-5994-b325-cd24c799c664	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569e-5994-97fd-066ce86ff350	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569e-5994-c882-1ba825772299	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3216 (class 0 OID 38157136)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 38156530)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 38156456)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-569e-5995-df2f-3582750f7786	\N	00200000-569e-5995-264f-c313778e1c4b	\N	\N	\N	00220000-569e-5994-9718-88880bdc3bea	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-569e-5995-1a09-e95b089299a4	\N	00200000-569e-5995-0ab0-c0c71d8ae977	\N	\N	\N	00220000-569e-5994-9718-88880bdc3bea	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-569e-5995-3503-7550e06195ab	\N	00200000-569e-5995-2613-5e7f999e9ba5	\N	\N	\N	00220000-569e-5994-c7bb-27e0ba135083	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-569e-5995-b38b-f86b7f118dcf	\N	00200000-569e-5995-b96f-a241612847dc	\N	\N	\N	00220000-569e-5994-6f19-778ef322a906	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-569e-5995-e4a7-59f1713da4fc	\N	00200000-569e-5995-4482-36cb5c54a10b	\N	\N	\N	00220000-569e-5994-d9e1-0f9e24e2cb43	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
00180000-569e-5995-799c-edcfa5ea3f7c	001b0000-569e-5995-615d-57c11fc50607	\N	\N	\N	\N	00220000-569e-5994-cdf4-3e2fec561c83	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1
\.


--
-- TOC entry 3167 (class 0 OID 38156481)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 38156486)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 38157058)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 38156360)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569e-5991-9503-11ffb265c982	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569e-5991-dc4e-c7684fe05bd6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569e-5991-8263-f6ef43ad9b29	AL	ALB	008	Albania 	Albanija	\N
00040000-569e-5991-f779-2e41dae234de	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569e-5991-031d-dc039afb0235	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569e-5991-0de5-0c1847f5bf30	AD	AND	020	Andorra 	Andora	\N
00040000-569e-5991-f54d-a4710accace4	AO	AGO	024	Angola 	Angola	\N
00040000-569e-5991-ef06-3d8070f8eb3c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569e-5991-0ec5-46d1ecbd46aa	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569e-5991-6f03-04ba2148285e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569e-5991-3bf6-b3466541529e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569e-5991-31d9-a55cdf5bbac6	AM	ARM	051	Armenia 	Armenija	\N
00040000-569e-5991-d5bf-329fc8499f35	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569e-5991-2019-eea227bdb31c	AU	AUS	036	Australia 	Avstralija	\N
00040000-569e-5991-4892-66129aa97818	AT	AUT	040	Austria 	Avstrija	\N
00040000-569e-5991-63fe-fe744b26f1c1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569e-5991-3043-3f2b2d9bb01f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569e-5991-927f-e0a355913104	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569e-5991-7ce7-f00e43afd2fb	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569e-5991-037d-41a4824c8334	BB	BRB	052	Barbados 	Barbados	\N
00040000-569e-5991-4eb8-c53a596b7f03	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569e-5991-3a22-1ce50d0e14b9	BE	BEL	056	Belgium 	Belgija	\N
00040000-569e-5991-f7aa-35f158364451	BZ	BLZ	084	Belize 	Belize	\N
00040000-569e-5991-04e9-97f80f96d6fc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569e-5991-3e9e-35989c5bf488	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569e-5991-9c6b-6aa421996a52	BT	BTN	064	Bhutan 	Butan	\N
00040000-569e-5991-a727-449725f65aa0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569e-5991-2727-5e0a9a272b66	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569e-5991-9f6a-b503e30b76d7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569e-5991-c68e-e3498d9e5d2d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569e-5991-7e37-6f1092212a85	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569e-5991-4665-a5fbc714da28	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569e-5991-c41d-b246edd37fa3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569e-5991-f592-8dca6ab07cb0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569e-5991-f2b1-32f8fc05941e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569e-5991-511c-57194f973528	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569e-5991-0d4d-5004dc2c5a2b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569e-5991-58dc-681018a80844	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569e-5991-b523-1f5280aaf9c1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569e-5991-1762-fd9d98a7ae45	CA	CAN	124	Canada 	Kanada	\N
00040000-569e-5991-f509-ac78bb91c946	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569e-5991-75a7-f0f89f551221	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569e-5991-1462-734e197f8c2f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569e-5991-2470-cd5dd0f6f662	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569e-5991-7175-5bddba8ae144	CL	CHL	152	Chile 	Čile	\N
00040000-569e-5991-36d5-46d65bdd461b	CN	CHN	156	China 	Kitajska	\N
00040000-569e-5991-06c6-44f2b72809d0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569e-5991-717b-407e5d3fb0fb	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569e-5991-58a5-a3bc631fa856	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569e-5991-9118-ca72acb3647a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569e-5991-2f7e-900a7e32632c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569e-5991-3e39-f970dc40b537	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569e-5991-a349-ed264df57cc8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569e-5991-1800-547c23750087	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569e-5991-6a4a-418c5569e3a5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569e-5991-c807-8874e80c1bf2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569e-5991-c848-6e273b9e0ecf	CU	CUB	192	Cuba 	Kuba	\N
00040000-569e-5991-b5c3-3a850bc88170	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569e-5991-f3c5-28ddfcba7625	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569e-5991-86a0-4337a0a3d1c6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569e-5991-a83d-adbf5e537942	DK	DNK	208	Denmark 	Danska	\N
00040000-569e-5991-3bc8-5893b248433b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569e-5991-94b9-7307e8c8a1b4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569e-5991-28af-8b25947ada56	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569e-5991-111a-43321a9edb8c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569e-5991-d38c-26c86ad4e5e6	EG	EGY	818	Egypt 	Egipt	\N
00040000-569e-5991-5530-b1292200d4ef	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569e-5991-3798-2766cfaf487b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569e-5991-4bed-0dbceead3492	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569e-5991-e0c2-7e5dbb733f37	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569e-5991-6531-e9fc8cc95397	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569e-5991-9bc7-05c0c893100d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569e-5991-bf94-53b2c63e701f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569e-5991-86fe-581a44b152af	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569e-5991-d6c8-6399db71f9a4	FI	FIN	246	Finland 	Finska	\N
00040000-569e-5991-b444-db907f6a89a9	FR	FRA	250	France 	Francija	\N
00040000-569e-5991-a9e9-e7a8358fc8da	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569e-5991-7ca1-ca4aacbe70bc	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569e-5991-913c-45c5514a1e61	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569e-5991-a464-d184431ff887	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569e-5991-7d96-2aca388d33f8	GA	GAB	266	Gabon 	Gabon	\N
00040000-569e-5991-6efe-024ba07e6d0b	GM	GMB	270	Gambia 	Gambija	\N
00040000-569e-5991-f139-df80fbe0df55	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569e-5991-dffd-a0eca677024b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569e-5991-26c6-547b346d8c5c	GH	GHA	288	Ghana 	Gana	\N
00040000-569e-5991-4794-4f54d4e9d16c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569e-5991-4482-720c316734b3	GR	GRC	300	Greece 	Grčija	\N
00040000-569e-5991-6829-d7628751dd21	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569e-5991-cd06-7f73f6893686	GD	GRD	308	Grenada 	Grenada	\N
00040000-569e-5991-e621-3cd22e72c177	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569e-5991-2a99-aef3d03231c0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569e-5991-4ba1-48e93c15377e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569e-5991-ef67-78c2ddf482d5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569e-5991-339e-1d377f61a44d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569e-5991-3f3c-6decce6b1e20	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569e-5991-d826-8b8d8d860847	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569e-5991-5d2c-a1846aa35f2a	HT	HTI	332	Haiti 	Haiti	\N
00040000-569e-5991-b488-316cc52a3c58	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569e-5991-b7ad-2ffa767a1c88	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569e-5991-25e1-74240badc48b	HN	HND	340	Honduras 	Honduras	\N
00040000-569e-5991-afe8-6a7de9d030da	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569e-5991-8a2b-69746af14d01	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569e-5991-78d4-1f6479cc4dfe	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569e-5991-d25c-6cca465064ee	IN	IND	356	India 	Indija	\N
00040000-569e-5991-b735-051819ef75d5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569e-5991-c7f0-4f7f62dc292b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569e-5991-06f1-7bba455fb7aa	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569e-5991-cb6e-a04fafbe60c2	IE	IRL	372	Ireland 	Irska	\N
00040000-569e-5991-3e06-f06d854accf7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569e-5991-17d4-08e5d32b68c2	IL	ISR	376	Israel 	Izrael	\N
00040000-569e-5991-ef6d-634fc78c7303	IT	ITA	380	Italy 	Italija	\N
00040000-569e-5991-be18-75dec3b3f60c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569e-5991-652c-398a674fe9a3	JP	JPN	392	Japan 	Japonska	\N
00040000-569e-5991-7bb2-52a7ea01940c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569e-5991-d307-b1b247f892f8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569e-5991-91cc-0b398d67949c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569e-5991-7026-88aa68c15ab7	KE	KEN	404	Kenya 	Kenija	\N
00040000-569e-5991-e384-d0929ca175c5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569e-5991-d5ac-ebaac90c440c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569e-5991-e341-bc9f070bdf24	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569e-5991-ad4e-785317c466c6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569e-5991-e24e-3c25c20eab21	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569e-5991-492a-ac38c6175ee4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569e-5991-a3a5-12657cee7645	LV	LVA	428	Latvia 	Latvija	\N
00040000-569e-5991-8ceb-bee53e15e308	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569e-5991-5b0a-793b3a1a106d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569e-5991-be24-5db41467e6fe	LR	LBR	430	Liberia 	Liberija	\N
00040000-569e-5991-4b53-cebc80e2e5ce	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569e-5991-3520-ac8a3aa2fb37	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569e-5991-c1d2-5e07287276c8	LT	LTU	440	Lithuania 	Litva	\N
00040000-569e-5991-8e75-cbf1e7b6e64b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569e-5991-0c4a-52c6978812ce	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569e-5991-3ea3-cf4f7580a8fc	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569e-5991-43ad-682b21f3648a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569e-5991-4218-04c81fbd0bf8	MW	MWI	454	Malawi 	Malavi	\N
00040000-569e-5991-8b1c-3e21f56d960b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569e-5991-3766-dd01970bc9c6	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569e-5991-9a63-87f0cf5e7507	ML	MLI	466	Mali 	Mali	\N
00040000-569e-5991-7daf-cb05a0f1120e	MT	MLT	470	Malta 	Malta	\N
00040000-569e-5991-a31e-41c135685390	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569e-5991-4b2d-a7de4358d996	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569e-5991-f0ca-911f86978519	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569e-5991-f867-2d8338d400b2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569e-5991-2c2b-3aadda87fcf8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569e-5991-2929-24c8052768af	MX	MEX	484	Mexico 	Mehika	\N
00040000-569e-5991-c0f3-d85fe14998d5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569e-5991-d331-db6af505f945	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569e-5991-1063-c0025ea85687	MC	MCO	492	Monaco 	Monako	\N
00040000-569e-5991-c57a-7e9db4f7373a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569e-5991-a3ef-a14aaf4c3233	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569e-5991-e4d0-7ac50403f0a2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569e-5991-466f-af22615f2d3b	MA	MAR	504	Morocco 	Maroko	\N
00040000-569e-5991-4af8-93698f778d73	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569e-5991-c527-784957ed23bd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569e-5991-71d1-9e28f0288836	NA	NAM	516	Namibia 	Namibija	\N
00040000-569e-5991-32db-3799d696b251	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569e-5991-8d3f-351544d268e0	NP	NPL	524	Nepal 	Nepal	\N
00040000-569e-5991-9d7e-efb67082c025	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569e-5991-76e8-d48a97e52f91	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569e-5991-a55c-ef41167cdd1d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569e-5991-9a0d-8dbe73d448e9	NE	NER	562	Niger 	Niger 	\N
00040000-569e-5991-b00b-29a33ec30b30	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569e-5991-85c9-1e7d66dce08d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569e-5991-b100-807d645fb98e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569e-5991-3393-29ed35d8c5cf	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569e-5991-99c0-c58a0d08a0fc	NO	NOR	578	Norway 	Norveška	\N
00040000-569e-5991-1b65-137bc7e86c23	OM	OMN	512	Oman 	Oman	\N
00040000-569e-5991-0532-765e7a8bb86e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569e-5991-f8e0-0ce515b16f7c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569e-5991-b696-180a6469f57e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569e-5991-1395-a79cc2a92ee7	PA	PAN	591	Panama 	Panama	\N
00040000-569e-5991-3bff-24b098d5b9f2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569e-5991-8699-0eb625d8c1c9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569e-5991-a9a4-9c612250a31e	PE	PER	604	Peru 	Peru	\N
00040000-569e-5991-2957-c71eb279d37f	PH	PHL	608	Philippines 	Filipini	\N
00040000-569e-5991-a8a5-36f422881162	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569e-5991-aa1f-953abf530f6c	PL	POL	616	Poland 	Poljska	\N
00040000-569e-5991-be61-c96c594c0264	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569e-5991-2ada-374c21f893b4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569e-5991-5ac3-fa854e751ed6	QA	QAT	634	Qatar 	Katar	\N
00040000-569e-5991-1ed8-2a63a93c8a61	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569e-5991-9ec8-d255f4349660	RO	ROU	642	Romania 	Romunija	\N
00040000-569e-5991-0fc3-fdbcdd3ea8ff	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569e-5991-f368-7d033da3cf5f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569e-5991-f94c-52245e3624de	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569e-5991-3c4d-e41303f4753c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569e-5991-1b7d-6dc47bc907f8	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569e-5991-eb17-0269aae748ad	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569e-5991-3969-7884afa3889e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569e-5991-1976-206775e09f60	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569e-5991-5486-d61742115efe	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569e-5991-103c-54ca3080917e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569e-5991-6226-02ac502b3ae9	SM	SMR	674	San Marino 	San Marino	\N
00040000-569e-5991-d898-74f7cafed7b0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569e-5991-a1e1-9ef02ce2d96f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569e-5991-9d55-131e88c4b39d	SN	SEN	686	Senegal 	Senegal	\N
00040000-569e-5991-c22c-79d49c9d6f6a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569e-5991-aad5-75f29dd2b4a9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569e-5991-af5e-f0e41a1e874c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569e-5991-9899-56c0911d722e	SG	SGP	702	Singapore 	Singapur	\N
00040000-569e-5991-4d5f-95b79e5499fd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569e-5991-eee0-1a110d4d5447	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569e-5991-579f-51aaea1ccae8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569e-5991-8498-6be246e62c48	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569e-5991-e715-5526d1072338	SO	SOM	706	Somalia 	Somalija	\N
00040000-569e-5991-951e-466a2150c576	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569e-5991-d496-89acfea7f40c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569e-5991-c382-cb234699ed4d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569e-5991-8206-3efda790b2c9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569e-5991-d16b-1d38bcd3d4eb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569e-5991-5c6d-99d9aecba4ca	SD	SDN	729	Sudan 	Sudan	\N
00040000-569e-5991-cd7e-f6f050e34eb0	SR	SUR	740	Suriname 	Surinam	\N
00040000-569e-5991-9da5-4bb522b08c2f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569e-5991-a72a-dd05147136ce	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569e-5991-b74b-83b067465104	SE	SWE	752	Sweden 	Švedska	\N
00040000-569e-5991-d989-4207d442d245	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569e-5991-5640-c44d0e1ef4ed	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569e-5991-fde6-0464478b674f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569e-5991-c137-1c997b66f72b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569e-5991-ce78-ff72497077ff	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569e-5991-b491-50cd9c895742	TH	THA	764	Thailand 	Tajska	\N
00040000-569e-5991-b67c-998c9929a55f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569e-5991-7cf9-6b081e5fe424	TG	TGO	768	Togo 	Togo	\N
00040000-569e-5991-b805-281962cb2578	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569e-5991-5fa9-d10e7e89081c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569e-5991-7314-9c73c7a291cd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569e-5991-489b-8c0ffe27ba75	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569e-5991-a9bb-360e4fa0313e	TR	TUR	792	Turkey 	Turčija	\N
00040000-569e-5991-15b9-80cade69b185	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569e-5991-d831-69afc54d2c30	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569e-5991-fe4a-49b098c9c536	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569e-5991-b95d-5a3d994bc767	UG	UGA	800	Uganda 	Uganda	\N
00040000-569e-5991-15a6-e5dbfb994392	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569e-5991-6496-fa9165cb9ced	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569e-5991-36a1-a9f915d6cc89	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569e-5991-2cde-4414c8e31c32	US	USA	840	United States 	Združene države Amerike	\N
00040000-569e-5991-53cb-5f6560477af9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569e-5991-2c57-d2b7dc4e3a45	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569e-5991-4fbc-b4dd2f2ba9de	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569e-5991-d42c-3096b02d07fa	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569e-5991-2c8a-39a4a0682a29	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569e-5991-5e10-842e9cb9dd5b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569e-5991-dfb8-4bb7d66b05c9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569e-5991-5ce2-6748c1c98d8d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569e-5991-c27b-0d0131fa096c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569e-5991-49eb-78d4f3e0d211	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569e-5991-2f46-3c3ddc7c573e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569e-5991-1132-30d9a9169fd6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569e-5991-9f47-f8bd1ae81893	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3203 (class 0 OID 38156846)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569e-5995-e462-6042f4f71223	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569e-5995-f29f-6c7a22cb7859	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569e-5995-0464-da227a32629a	000e0000-569e-5994-8191-e9630010f5b7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569e-5991-6f34-a3a38ae3a8fc	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569e-5995-47f8-b3a694592a5b	000e0000-569e-5994-0cbd-1aca785370c4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569e-5991-8d48-381c8f1bedc5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569e-5995-9430-b5832b3407e2	000e0000-569e-5994-2823-4fd6fdc2e92c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569e-5991-6f34-a3a38ae3a8fc	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 38156652)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569e-5995-5be8-4a3f5b57342b	000e0000-569e-5994-0cbd-1aca785370c4	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569e-5991-9791-1c140b424569
000d0000-569e-5995-6dd3-5942343f9b0c	000e0000-569e-5994-198d-e179be2ffce1	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569e-5991-6b58-a68c49e333b5
000d0000-569e-5995-5352-da73f7c16455	000e0000-569e-5994-198d-e179be2ffce1	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-3389-2b52a7eac670	000e0000-569e-5994-0cbd-1aca785370c4	000c0000-569e-5995-405f-99573fd44731	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569e-5991-6b58-a68c49e333b5
000d0000-569e-5995-86b3-0b91363f74f1	000e0000-569e-5994-0cbd-1aca785370c4	000c0000-569e-5995-799d-e50bb29e8cd2	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-460c-dce74cbec4ee	000e0000-569e-5994-0cbd-1aca785370c4	000c0000-569e-5995-4cc4-48776a31723b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569e-5991-1b86-78efa27a602c
000d0000-569e-5995-da33-b064b21142bd	000e0000-569e-5994-0cbd-1aca785370c4	000c0000-569e-5995-19d1-d09c310d5f62	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569e-5991-9791-1c140b424569
000d0000-569e-5995-cf23-174fe5e96440	000e0000-569e-5994-0cbd-1aca785370c4	000c0000-569e-5995-33fe-16573f648fa3	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569e-5991-9791-1c140b424569
000d0000-569e-5995-ae52-30081e21ecb0	000e0000-569e-5994-0cbd-1aca785370c4	000c0000-569e-5995-49ac-5ac8b38fb9e7	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569e-5991-6b58-a68c49e333b5
000d0000-569e-5995-a031-fe830a625695	000e0000-569e-5994-0cbd-1aca785370c4	000c0000-569e-5995-f998-7b8f3ce6c17d	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569e-5991-6b58-a68c49e333b5
000d0000-569e-5995-696f-b21086348505	000e0000-569e-5994-0cbd-1aca785370c4	000c0000-569e-5995-7d48-689cf2d47338	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569e-5991-0751-ba8fd6aaf57b
000d0000-569e-5995-6951-becce019cd91	000e0000-569e-5994-0cbd-1aca785370c4	000c0000-569e-5995-2475-e25db0f64d0c	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569e-5991-519a-f40135c082f7
000d0000-569e-5995-6b23-ed95d613ff82	000e0000-569e-5994-f9b1-b8a1451e2399	000c0000-569e-5995-70fd-abd5acd9d77c	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-a1a5-10cf561e4101	000e0000-569e-5994-4a44-01e0b9cfb56e	000c0000-569e-5995-f8f4-610409acb528	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-d747-9cb26decd3ec	000e0000-569e-5994-4a44-01e0b9cfb56e	000c0000-569e-5995-0e93-ade9ace91843	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-f4ed-a4ee20889634	000e0000-569e-5994-4e17-fb04500e0878	000c0000-569e-5995-5de4-0178d23073b4	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-6424-c37b79298cd5	000e0000-569e-5994-dab6-c39d957b8701	000c0000-569e-5995-75a6-cbd6f36289a3	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-93d3-256b57a7a9f8	000e0000-569e-5994-d835-fc1581fe1ee1	000c0000-569e-5995-cfb0-f001f35114de	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-ad77-9e05aeee12ca	000e0000-569e-5994-5f79-c52a1d5a3382	000c0000-569e-5995-3cff-d206aaeb38ed	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-0305-97e927fa0a80	000e0000-569e-5994-bfa2-13e945ddd589	000c0000-569e-5995-e14f-e17656ee197f	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-0803-621970cc1d06	000e0000-569e-5994-5c86-0d567fb533c9	000c0000-569e-5995-3cb2-72a083732cbe	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-3cac-4c1ec7b1da25	000e0000-569e-5994-5c86-0d567fb533c9	000c0000-569e-5995-0346-50edca6051c8	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-7967-e59da82b65e1	000e0000-569e-5995-e6b9-107b82c10f00	000c0000-569e-5995-34c4-5c0d9def164e	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
000d0000-569e-5995-18a6-f9f551955dab	000e0000-569e-5995-e6b9-107b82c10f00	000c0000-569e-5995-58f9-7ccd390a5965	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569e-5991-3567-1e02fe5da373
\.


--
-- TOC entry 3163 (class 0 OID 38156430)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 38156400)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 38156377)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569e-5994-2893-67775cb1bce9	00080000-569e-5994-66c2-3a797d54c710	00090000-569e-5994-e380-4f5e928a5a89	AK		igralka
\.


--
-- TOC entry 3177 (class 0 OID 38156566)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 38157116)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569e-5994-4492-f5d409e78a0e	00010000-569e-5992-927c-32d664d52076	\N	Prva mapa	Root mapa	2016-01-19 16:43:16	2016-01-19 16:43:16	R	\N	\N
\.


--
-- TOC entry 3215 (class 0 OID 38157129)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 38157151)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 34548309)
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
-- TOC entry 3181 (class 0 OID 38156591)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 38156334)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569e-5992-d053-4f9722bf6264	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569e-5992-580e-6f6745278ad9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569e-5992-3e11-0bb7e1395790	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569e-5992-a1d7-180f38ae3568	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569e-5992-df3f-b78ca144a8b2	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569e-5992-d7be-a59470fbd6ee	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569e-5992-9ccc-0aa8503988f3	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569e-5992-3408-4bf953f794c9	dogodek.termini	array	a:2:{s:15:"dopoldanZacetek";a:2:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:5:"value";s:5:"10:00";}s:13:"dopoldanKonec";a:2:{s:5:"label";s:27:"Konec dopoldanskega termina";s:5:"value";s:5:"14:00";}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-569e-5992-2d17-73f52a16a139	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569e-5992-8e5f-2b7fddb733a2	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569e-5992-304e-9bb3472d8344	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569e-5992-2d84-c0bc5e44d82d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569e-5992-c6f7-437a2584411b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569e-5992-8de5-61dc5a18cc92	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569e-5992-ffce-778249c8c670	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569e-5992-a6fc-1d7c7ad924d0	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569e-5994-c16b-e680681013da	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569e-5994-6521-a6abd5bb3b43	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569e-5994-7ada-88b8098d3296	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569e-5994-aaf1-1c57a96029a3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569e-5994-ee5f-8ad9e6476132	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569e-5996-9c72-b6f3f8a2cfa7	application.tenant.maticnopodjetje	string	s:36:"00080000-569e-5996-8751-e2f9a13fa0a0";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3148 (class 0 OID 38156234)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569e-5994-c70c-b0626600d64b	00000000-569e-5994-c16b-e680681013da	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569e-5994-0bc9-4c9bdf3b8ee1	00000000-569e-5994-c16b-e680681013da	00010000-569e-5992-927c-32d664d52076	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569e-5994-e588-052765cafc9d	00000000-569e-5994-6521-a6abd5bb3b43	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3152 (class 0 OID 38156301)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569e-5994-68dc-40abe49a7dc0	\N	00100000-569e-5994-0f88-fa7f1df3582c	00100000-569e-5994-950a-86bc5ea8a915	01	Gledališče Nimbis
00410000-569e-5994-df0b-250958d85f73	00410000-569e-5994-68dc-40abe49a7dc0	00100000-569e-5994-0f88-fa7f1df3582c	00100000-569e-5994-950a-86bc5ea8a915	02	Tehnika
\.


--
-- TOC entry 3149 (class 0 OID 38156245)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569e-5994-41a3-eec4b6a136c1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569e-5994-8fd8-8cd6fe21683c	00010000-569e-5994-28e4-124fb3ab14b4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569e-5994-8d58-288c599b5116	00010000-569e-5994-81f7-d299f2f0a3d3	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569e-5994-759a-5ca04e195b7c	00010000-569e-5994-c6a7-3f59d35f63ec	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569e-5994-baa9-3bb45bac76dc	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569e-5994-81cc-c1d3d7707217	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569e-5994-b581-9ccccfee5b26	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569e-5994-4c75-4eb0d9babd9c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569e-5994-e380-4f5e928a5a89	00010000-569e-5994-89a5-faf4b42a5efd	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569e-5994-e892-383dc65d6c74	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569e-5994-fdb3-418131f74df1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569e-5994-3957-1f6303356ede	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569e-5994-74a4-2440e14d9987	00010000-569e-5994-86bd-91bab665f506	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569e-5994-c7f9-fb2fb7fb3299	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-5994-5ff3-fee9d66e2755	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-5994-52ed-b8341df64f7b	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-5994-a959-a0b10e3dbe2f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569e-5994-8f91-1ea8809269b1	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569e-5994-f7c6-72c23d433e12	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-5994-0f4c-a756a95988d0	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569e-5994-3fd8-3eef1c5e4dd7	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 38156180)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569e-5991-3b18-24288fd1eff9	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569e-5991-c3e9-56d4ab32d6ea	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569e-5991-4858-e339ba977fe4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569e-5991-6f8a-02d4244c1236	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569e-5991-b051-bb800524ad9e	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569e-5991-a874-b1ee4dea0e81	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569e-5991-1eb5-e18db4db4329	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569e-5991-30c6-8e64e19dfb76	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569e-5991-509f-c94d73f785a5	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569e-5991-0347-204d6e77f225	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569e-5991-eaa8-1cce47ec00ab	Abonma-read	Abonma - branje	t
00030000-569e-5991-f5ba-96c82dccf311	Abonma-write	Abonma - spreminjanje	t
00030000-569e-5991-9383-3da7b3ed53c5	Alternacija-read	Alternacija - branje	t
00030000-569e-5991-3d66-ccf9c3ded260	Alternacija-write	Alternacija - spreminjanje	t
00030000-569e-5991-18d7-95689357ad33	Arhivalija-read	Arhivalija - branje	t
00030000-569e-5991-18b0-c989b69f2305	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569e-5991-d108-0115f6fe53cc	AuthStorage-read	AuthStorage - branje	t
00030000-569e-5991-fdff-ab0ae635912c	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569e-5991-0bcd-ed4fdaf4b1ad	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569e-5991-9289-7317ce4eb757	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569e-5991-5c55-8f4dd2688764	Besedilo-read	Besedilo - branje	t
00030000-569e-5991-250c-114c03d41bc5	Besedilo-write	Besedilo - spreminjanje	t
00030000-569e-5991-afcd-2cd2553935d5	Dodatek-read	Dodatek - branje	t
00030000-569e-5991-7924-5335de34bbd5	Dodatek-write	Dodatek - spreminjanje	t
00030000-569e-5991-f81d-1e2e1182000d	Dogodek-read	Dogodek - branje	t
00030000-569e-5991-4528-af25338b4d6a	Dogodek-write	Dogodek - spreminjanje	t
00030000-569e-5991-e512-832ef7ad336b	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569e-5991-cf0b-8e23f31b5b09	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569e-5991-f7e6-0684694ab0a8	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569e-5991-bc69-2997e6bf090d	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569e-5991-adbc-12f4051c2604	DogodekTrait-read	DogodekTrait - branje	t
00030000-569e-5991-a448-f3888f65d405	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569e-5991-89fa-f04d5b6a8631	DrugiVir-read	DrugiVir - branje	t
00030000-569e-5991-525d-7abe4094c664	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569e-5991-9315-c2b05dd2ab93	Drzava-read	Drzava - branje	t
00030000-569e-5991-23a4-ed585d30bc58	Drzava-write	Drzava - spreminjanje	t
00030000-569e-5991-6555-716343d63b00	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569e-5991-ccf8-2e019a80381f	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569e-5991-f922-1c9201aff57e	Funkcija-read	Funkcija - branje	t
00030000-569e-5991-e536-4e488535fee4	Funkcija-write	Funkcija - spreminjanje	t
00030000-569e-5991-2793-27e2cdcc1c71	Gostovanje-read	Gostovanje - branje	t
00030000-569e-5991-910e-62dc574562ee	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569e-5991-f8f2-ebed63704208	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569e-5992-195e-a26978e2130d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569e-5992-cabe-4b3d0b9ef7f5	Kupec-read	Kupec - branje	t
00030000-569e-5992-f497-d4d28882d71a	Kupec-write	Kupec - spreminjanje	t
00030000-569e-5992-5f0b-aeb4ffdceb84	NacinPlacina-read	NacinPlacina - branje	t
00030000-569e-5992-7be9-60b7dc66e0b1	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569e-5992-f8e3-4d9c4b3c2edb	Option-read	Option - branje	t
00030000-569e-5992-5006-0a65f278edac	Option-write	Option - spreminjanje	t
00030000-569e-5992-65d5-711442d4d48f	OptionValue-read	OptionValue - branje	t
00030000-569e-5992-744d-881ca8ff1a19	OptionValue-write	OptionValue - spreminjanje	t
00030000-569e-5992-b00b-7507c8299143	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569e-5992-7e27-3e4d4140e463	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569e-5992-cc5b-bb9fa28aa70a	Oseba-read	Oseba - branje	t
00030000-569e-5992-4f7c-fe4d11f5202e	Oseba-write	Oseba - spreminjanje	t
00030000-569e-5992-fd13-d8483f052cb2	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569e-5992-a956-515e9b57d61f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569e-5992-5b2c-a4b286fae9f3	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569e-5992-480b-b6c2aab0b519	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569e-5992-8f3b-5e24f7e819ef	Pogodba-read	Pogodba - branje	t
00030000-569e-5992-7331-5ab5d8b499c2	Pogodba-write	Pogodba - spreminjanje	t
00030000-569e-5992-d6a5-483f288dfbbf	Popa-read	Popa - branje	t
00030000-569e-5992-b6a1-4a18627bb142	Popa-write	Popa - spreminjanje	t
00030000-569e-5992-3a2a-985407d4cb26	Posta-read	Posta - branje	t
00030000-569e-5992-6b4a-55bdb6a2d0d6	Posta-write	Posta - spreminjanje	t
00030000-569e-5992-dfa7-5f1fb1017e0e	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569e-5992-5518-6c9c0e424403	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569e-5992-58b7-ba613ae4b8da	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569e-5992-8f3c-2c73ebc470bd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569e-5992-5bff-54820786ab3f	PostniNaslov-read	PostniNaslov - branje	t
00030000-569e-5992-0889-c3ddc9349d9a	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569e-5992-a448-030b8acf4252	Praznik-read	Praznik - branje	t
00030000-569e-5992-ec96-b122fa8c36af	Praznik-write	Praznik - spreminjanje	t
00030000-569e-5992-5503-94357a53de2c	Predstava-read	Predstava - branje	t
00030000-569e-5992-4f5b-a06688110743	Predstava-write	Predstava - spreminjanje	t
00030000-569e-5992-15a8-d2bafd9f7cc1	Ura-read	Ura - branje	t
00030000-569e-5992-8006-324c283b3679	Ura-write	Ura - spreminjanje	t
00030000-569e-5992-b98e-386ffd50012c	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569e-5992-07ff-907a40c6ffd8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569e-5992-178a-e5e6c317fac9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569e-5992-dd88-81608340593b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569e-5992-c1e1-29acca5ea950	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569e-5992-0056-bb4a710e5a17	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569e-5992-4faf-ed58792f6939	ProgramDela-read	ProgramDela - branje	t
00030000-569e-5992-28ec-4ee93828b287	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569e-5992-58d0-86644f57e800	ProgramFestival-read	ProgramFestival - branje	t
00030000-569e-5992-96ea-46431e61b681	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569e-5992-15a8-6e7d8044ceb4	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569e-5992-2636-bc32188ba6e7	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569e-5992-1cdf-460f4a064224	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569e-5992-8797-56e23de4ae52	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569e-5992-9d8d-06be5b86863f	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569e-5992-d970-6342b218d11c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569e-5992-4d37-3b5b27e4ede8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569e-5992-5b62-7b243a49e0e4	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569e-5992-69f2-2c12674a113b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569e-5992-d361-f341f58f9885	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569e-5992-b223-15955de3d793	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569e-5992-9b00-aa12177c69fa	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569e-5992-dbe1-7b04ee1b3ad9	ProgramRazno-read	ProgramRazno - branje	t
00030000-569e-5992-72cf-578d8212752d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569e-5992-fffb-8e4326b303d2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569e-5992-f680-00b48c63dba7	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569e-5992-5e0c-34181d68c293	Prostor-read	Prostor - branje	t
00030000-569e-5992-8878-2c7ec8f442f2	Prostor-write	Prostor - spreminjanje	t
00030000-569e-5992-07c3-165d9586fff5	Racun-read	Racun - branje	t
00030000-569e-5992-16d1-d7ce1a072064	Racun-write	Racun - spreminjanje	t
00030000-569e-5992-84ea-5832f0bf5c64	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569e-5992-b785-af46e3969e31	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569e-5992-3829-76c4a99a03d4	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569e-5992-3203-5c16f7befa6e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569e-5992-69f1-bdc14d201ee6	Rekvizit-read	Rekvizit - branje	t
00030000-569e-5992-a3a6-e852905bdcdc	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569e-5992-b6e8-be1ff27def18	Revizija-read	Revizija - branje	t
00030000-569e-5992-e21f-abf36ca5ce3c	Revizija-write	Revizija - spreminjanje	t
00030000-569e-5992-674f-693cab7473ca	Rezervacija-read	Rezervacija - branje	t
00030000-569e-5992-2935-6666292ec191	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569e-5992-93fa-f56bec500280	SedezniRed-read	SedezniRed - branje	t
00030000-569e-5992-bd31-c6e72d33d3ef	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569e-5992-0c80-e2446877d466	Sedez-read	Sedez - branje	t
00030000-569e-5992-f325-c692fb7fb4a5	Sedez-write	Sedez - spreminjanje	t
00030000-569e-5992-0f37-4155873718c5	Sezona-read	Sezona - branje	t
00030000-569e-5992-d568-8f22ada11f14	Sezona-write	Sezona - spreminjanje	t
00030000-569e-5992-6b02-fee32c423818	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569e-5992-d941-6929024bbe31	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569e-5992-5421-e292bb35a3e8	Telefonska-read	Telefonska - branje	t
00030000-569e-5992-4427-e48f0de9c961	Telefonska-write	Telefonska - spreminjanje	t
00030000-569e-5992-9acd-737310491c12	TerminStoritve-read	TerminStoritve - branje	t
00030000-569e-5992-f3d2-2de327763b4a	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569e-5992-da52-b69932ca29d9	TipDodatka-read	TipDodatka - branje	t
00030000-569e-5992-c565-ddf40994ca0a	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569e-5992-912e-09e91cec2930	TipFunkcije-read	TipFunkcije - branje	t
00030000-569e-5992-7a4b-1c0b6e1cddee	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569e-5992-8eac-48ba4be01438	TipPopa-read	TipPopa - branje	t
00030000-569e-5992-d995-92d73b0d304c	TipPopa-write	TipPopa - spreminjanje	t
00030000-569e-5992-3721-200ec1465e4f	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569e-5992-3710-9671955bd32f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569e-5992-3b44-bbf7c3819030	TipVaje-read	TipVaje - branje	t
00030000-569e-5992-74a9-ef3e925434c7	TipVaje-write	TipVaje - spreminjanje	t
00030000-569e-5992-afdb-1fee021da72e	Trr-read	Trr - branje	t
00030000-569e-5992-9cb4-2143d9003f59	Trr-write	Trr - spreminjanje	t
00030000-569e-5992-b17a-561f1b7d562e	Uprizoritev-read	Uprizoritev - branje	t
00030000-569e-5992-3309-dad8378335a7	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569e-5992-4c2d-5fab9baa83b2	Vaja-read	Vaja - branje	t
00030000-569e-5992-e2fb-e05dd91415cb	Vaja-write	Vaja - spreminjanje	t
00030000-569e-5992-987b-503ccf1c2044	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569e-5992-0ef7-0fcd4d576dac	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569e-5992-ac6c-aed228884f89	VrstaStroska-read	VrstaStroska - branje	t
00030000-569e-5992-b150-c1627dd799b9	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569e-5992-c163-61f2e3bc923e	Zaposlitev-read	Zaposlitev - branje	t
00030000-569e-5992-39c2-0ef6334d377c	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569e-5992-ab63-fd8ffbcae4c8	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569e-5992-5354-23d9d7d39e2d	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569e-5992-e1ee-f70e172eb845	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569e-5992-5e67-f3e56a34574f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569e-5992-9ce6-7a23da6e5f67	Job-read	Branje opravil - samo zase - branje	t
00030000-569e-5992-9f34-042c74fe2bd7	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569e-5992-b703-508e674e7083	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569e-5992-6117-1069723deee0	Report-read	Report - branje	t
00030000-569e-5992-105d-523acb1de0d6	Report-write	Report - spreminjanje	t
00030000-569e-5992-195d-48ee36cc28e2	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569e-5992-f5f7-108bfe9b478a	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569e-5992-6999-a5d4aae16b25	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569e-5992-4455-102f34095f57	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569e-5992-8194-2a11b21979bd	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569e-5992-5ae7-9d8da8cd97cf	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569e-5992-d936-1b3007dae007	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569e-5992-79ab-5ddcbbb6b0fb	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569e-5992-5315-3de0de7fb28b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569e-5992-9943-acc4b5980bd5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569e-5992-dbf1-e4c6f5aad789	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569e-5992-17fe-14454d8e3500	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569e-5992-a769-acd9b009bc65	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569e-5992-32ac-1e6204eaf18c	Datoteka-write	Datoteka - spreminjanje	t
00030000-569e-5992-800a-f17a65638308	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3143 (class 0 OID 38156199)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569e-5992-d95a-a5c00e727b06	00030000-569e-5991-c3e9-56d4ab32d6ea
00020000-569e-5992-d95a-a5c00e727b06	00030000-569e-5991-3b18-24288fd1eff9
00020000-569e-5992-62f5-87bdaff716ec	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5991-9289-7317ce4eb757
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5991-250c-114c03d41bc5
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5991-0bcd-ed4fdaf4b1ad
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-14fd-3302627312ee	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-dbe4-157445a50566	00030000-569e-5991-0bcd-ed4fdaf4b1ad
00020000-569e-5992-dbe4-157445a50566	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-dbe4-157445a50566	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-dbe4-157445a50566	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-dbe4-157445a50566	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-dbe4-157445a50566	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-be54-5a26062c248d	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-be54-5a26062c248d	00030000-569e-5992-39c2-0ef6334d377c
00020000-569e-5992-be54-5a26062c248d	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-be54-5a26062c248d	00030000-569e-5991-b051-bb800524ad9e
00020000-569e-5992-be54-5a26062c248d	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-be54-5a26062c248d	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-be54-5a26062c248d	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-5d32-009c1d176440	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-5d32-009c1d176440	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-5d32-009c1d176440	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-6217-c790b053adfe	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-6217-c790b053adfe	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-6217-c790b053adfe	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-6217-c790b053adfe	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-6217-c790b053adfe	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-6217-c790b053adfe	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-6217-c790b053adfe	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-6217-c790b053adfe	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-cf7a-308086ccd976	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-cf7a-308086ccd976	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-cf7a-308086ccd976	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-cf7a-308086ccd976	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5991-b051-bb800524ad9e
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5992-9cb4-2143d9003f59
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5992-0889-c3ddc9349d9a
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5992-4427-e48f0de9c961
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-31c1-6113596a5249	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-3418-78883777d824	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-3418-78883777d824	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-3418-78883777d824	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-3418-78883777d824	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-3418-78883777d824	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-3418-78883777d824	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-3418-78883777d824	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-4427-e48f0de9c961
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-0889-c3ddc9349d9a
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-9cb4-2143d9003f59
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-b6a1-4a18627bb142
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-195e-a26978e2130d
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-0056-bb4a710e5a17
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-54f2-b21e42a18649	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-287b-9b38fa9c7013	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-2424-41e802b58569	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-2424-41e802b58569	00030000-569e-5992-d995-92d73b0d304c
00020000-569e-5992-8c91-c0c6f8434a68	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-9d2a-5c017daadb35	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5992-9d2a-5c017daadb35	00030000-569e-5992-6b4a-55bdb6a2d0d6
00020000-569e-5992-724b-43f0cf8aecbe	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5992-d370-6497e14554ee	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-d370-6497e14554ee	00030000-569e-5991-23a4-ed585d30bc58
00020000-569e-5992-99d3-d33298ae70ee	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-05a6-43b026c2ced2	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5992-05a6-43b026c2ced2	00030000-569e-5992-5e67-f3e56a34574f
00020000-569e-5992-f65a-0a4d74f7c3ea	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5992-140c-cfddd42e3d2a	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5992-140c-cfddd42e3d2a	00030000-569e-5992-5354-23d9d7d39e2d
00020000-569e-5992-b947-a9fc400b3285	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5992-03da-c4e603daeb2a	00030000-569e-5991-eaa8-1cce47ec00ab
00020000-569e-5992-03da-c4e603daeb2a	00030000-569e-5991-f5ba-96c82dccf311
00020000-569e-5992-3231-29cbd12fb97f	00030000-569e-5991-eaa8-1cce47ec00ab
00020000-569e-5992-1adb-4821bb0b1f68	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5992-1adb-4821bb0b1f68	00030000-569e-5992-8878-2c7ec8f442f2
00020000-569e-5992-1adb-4821bb0b1f68	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-1adb-4821bb0b1f68	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-1adb-4821bb0b1f68	00030000-569e-5992-0889-c3ddc9349d9a
00020000-569e-5992-1adb-4821bb0b1f68	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-decc-3e22abc8024a	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5992-decc-3e22abc8024a	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-decc-3e22abc8024a	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-0395-7e9aa6c72c37	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-0395-7e9aa6c72c37	00030000-569e-5992-b150-c1627dd799b9
00020000-569e-5992-0c8d-1f56109a5e95	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-b66b-e3309b81d510	00030000-569e-5992-7e27-3e4d4140e463
00020000-569e-5992-b66b-e3309b81d510	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-b66b-e3309b81d510	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-b66b-e3309b81d510	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-b66b-e3309b81d510	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-b66b-e3309b81d510	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-b66b-e3309b81d510	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-b66b-e3309b81d510	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-b66b-e3309b81d510	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-ac52-d98ef9adcec0	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-ac52-d98ef9adcec0	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-ac52-d98ef9adcec0	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-ac52-d98ef9adcec0	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-ac52-d98ef9adcec0	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-774f-0baea91d517b	00030000-569e-5992-3b44-bbf7c3819030
00020000-569e-5992-774f-0baea91d517b	00030000-569e-5992-74a9-ef3e925434c7
00020000-569e-5992-e7d4-f70fb7ed7ed4	00030000-569e-5992-3b44-bbf7c3819030
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5991-1eb5-e18db4db4329
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5991-30c6-8e64e19dfb76
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-4faf-ed58792f6939
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-28ec-4ee93828b287
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-58d0-86644f57e800
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-96ea-46431e61b681
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-15a8-6e7d8044ceb4
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-2636-bc32188ba6e7
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-1cdf-460f4a064224
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-8797-56e23de4ae52
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-9d8d-06be5b86863f
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-d970-6342b218d11c
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-4d37-3b5b27e4ede8
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-5b62-7b243a49e0e4
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-69f2-2c12674a113b
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-d361-f341f58f9885
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-b223-15955de3d793
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-9b00-aa12177c69fa
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-dbe1-7b04ee1b3ad9
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-72cf-578d8212752d
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-fffb-8e4326b303d2
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-f680-00b48c63dba7
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-dd88-81608340593b
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5991-525d-7abe4094c664
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-5518-6c9c0e424403
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-9f34-042c74fe2bd7
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5991-89fa-f04d5b6a8631
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-178a-e5e6c317fac9
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-dfa7-5f1fb1017e0e
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-9ce6-7a23da6e5f67
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-d49d-a0a68e24ec94	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-4faf-ed58792f6939
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-58d0-86644f57e800
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-15a8-6e7d8044ceb4
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-1cdf-460f4a064224
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-9d8d-06be5b86863f
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-4d37-3b5b27e4ede8
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-69f2-2c12674a113b
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-b223-15955de3d793
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-dbe1-7b04ee1b3ad9
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-fffb-8e4326b303d2
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-178a-e5e6c317fac9
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5991-89fa-f04d5b6a8631
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-dfa7-5f1fb1017e0e
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-9ce6-7a23da6e5f67
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-5f18-616d4e75393f	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-3309-dad8378335a7
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5991-509f-c94d73f785a5
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5991-e536-4e488535fee4
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5991-0347-204d6e77f225
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-bcd6-66427f242fa9	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-978f-362c4a5d936a	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-8d02-b77fbf98652e	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-8d02-b77fbf98652e	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5992-8d02-b77fbf98652e	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-8d02-b77fbf98652e	00030000-569e-5991-e536-4e488535fee4
00020000-569e-5992-8d02-b77fbf98652e	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-8d02-b77fbf98652e	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-8d02-b77fbf98652e	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-8d02-b77fbf98652e	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5991-509f-c94d73f785a5
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5991-b051-bb800524ad9e
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-7331-5ab5d8b499c2
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-d941-6929024bbe31
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-6dc3-166d93629de9	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-2800-843e60af4483	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-2800-843e60af4483	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-2800-843e60af4483	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-2800-843e60af4483	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-2800-843e60af4483	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5992-2800-843e60af4483	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-2800-843e60af4483	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-2800-843e60af4483	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-2800-843e60af4483	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-2800-843e60af4483	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-2800-843e60af4483	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-2800-843e60af4483	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-79c0-ddc59c2c359f	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-79c0-ddc59c2c359f	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-79c0-ddc59c2c359f	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-79c0-ddc59c2c359f	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5992-79c0-ddc59c2c359f	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-79c0-ddc59c2c359f	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-79c0-ddc59c2c359f	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-93c8-84f489be21f9	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-93c8-84f489be21f9	00030000-569e-5992-d941-6929024bbe31
00020000-569e-5992-93c8-84f489be21f9	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-93c8-84f489be21f9	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-e2dc-e8c2e3976bdf	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-e2dc-e8c2e3976bdf	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-eaa8-1cce47ec00ab
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-509f-c94d73f785a5
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-0bcd-ed4fdaf4b1ad
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-9289-7317ce4eb757
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-250c-114c03d41bc5
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-89fa-f04d5b6a8631
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-525d-7abe4094c664
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-e536-4e488535fee4
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-0347-204d6e77f225
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-9ce6-7a23da6e5f67
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-9f34-042c74fe2bd7
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-b051-bb800524ad9e
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-7331-5ab5d8b499c2
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-dfa7-5f1fb1017e0e
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-5518-6c9c0e424403
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-178a-e5e6c317fac9
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-dd88-81608340593b
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-1eb5-e18db4db4329
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-4faf-ed58792f6939
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5991-30c6-8e64e19dfb76
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-28ec-4ee93828b287
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-58d0-86644f57e800
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-96ea-46431e61b681
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-15a8-6e7d8044ceb4
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-2636-bc32188ba6e7
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-1cdf-460f4a064224
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-8797-56e23de4ae52
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-9d8d-06be5b86863f
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-d970-6342b218d11c
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-4d37-3b5b27e4ede8
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-5b62-7b243a49e0e4
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-69f2-2c12674a113b
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-d361-f341f58f9885
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-b223-15955de3d793
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-9b00-aa12177c69fa
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-dbe1-7b04ee1b3ad9
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-72cf-578d8212752d
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-fffb-8e4326b303d2
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-f680-00b48c63dba7
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-d941-6929024bbe31
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-3b44-bbf7c3819030
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-3309-dad8378335a7
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5992-7148-8d33eac41ba7	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-eaa8-1cce47ec00ab
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-0bcd-ed4fdaf4b1ad
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-9289-7317ce4eb757
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-250c-114c03d41bc5
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-3b44-bbf7c3819030
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5992-4466-82e3f34b9534	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-eaa8-1cce47ec00ab
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-509f-c94d73f785a5
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-0bcd-ed4fdaf4b1ad
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-9289-7317ce4eb757
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-250c-114c03d41bc5
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-e536-4e488535fee4
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-0347-204d6e77f225
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-3b44-bbf7c3819030
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-3309-dad8378335a7
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5992-033b-d1f2405c3560	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-509f-c94d73f785a5
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-0bcd-ed4fdaf4b1ad
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-9289-7317ce4eb757
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-250c-114c03d41bc5
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-89fa-f04d5b6a8631
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-525d-7abe4094c664
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-e536-4e488535fee4
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-0347-204d6e77f225
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-9ce6-7a23da6e5f67
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-9f34-042c74fe2bd7
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-195e-a26978e2130d
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-b051-bb800524ad9e
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-7331-5ab5d8b499c2
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-b6a1-4a18627bb142
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-dfa7-5f1fb1017e0e
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-5518-6c9c0e424403
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-0889-c3ddc9349d9a
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-178a-e5e6c317fac9
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-dd88-81608340593b
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-0056-bb4a710e5a17
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-1eb5-e18db4db4329
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-4faf-ed58792f6939
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5991-30c6-8e64e19dfb76
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-28ec-4ee93828b287
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-58d0-86644f57e800
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-96ea-46431e61b681
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-15a8-6e7d8044ceb4
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-2636-bc32188ba6e7
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-1cdf-460f4a064224
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-8797-56e23de4ae52
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-9d8d-06be5b86863f
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-d970-6342b218d11c
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-4d37-3b5b27e4ede8
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-5b62-7b243a49e0e4
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-69f2-2c12674a113b
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-d361-f341f58f9885
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-b223-15955de3d793
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-9b00-aa12177c69fa
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-dbe1-7b04ee1b3ad9
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-72cf-578d8212752d
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-fffb-8e4326b303d2
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-f680-00b48c63dba7
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-d941-6929024bbe31
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-4427-e48f0de9c961
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-9cb4-2143d9003f59
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-3309-dad8378335a7
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-39c2-0ef6334d377c
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5992-d4d6-9e54d10019cd	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-eaa8-1cce47ec00ab
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-509f-c94d73f785a5
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-0bcd-ed4fdaf4b1ad
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-9289-7317ce4eb757
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-250c-114c03d41bc5
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-e536-4e488535fee4
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-0347-204d6e77f225
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-195e-a26978e2130d
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5991-b051-bb800524ad9e
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-b6a1-4a18627bb142
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-0889-c3ddc9349d9a
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-0056-bb4a710e5a17
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-4427-e48f0de9c961
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-3b44-bbf7c3819030
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-9cb4-2143d9003f59
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-3309-dad8378335a7
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-39c2-0ef6334d377c
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5992-d64a-a84e01407e09	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-eaa8-1cce47ec00ab
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-0bcd-ed4fdaf4b1ad
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-e536-4e488535fee4
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-3b44-bbf7c3819030
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5992-ff86-28569580efb9	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-eaa8-1cce47ec00ab
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-509f-c94d73f785a5
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-800a-f17a65638308
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-89fa-f04d5b6a8631
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-525d-7abe4094c664
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-9ce6-7a23da6e5f67
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-9f34-042c74fe2bd7
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-195e-a26978e2130d
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-7e27-3e4d4140e463
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-b051-bb800524ad9e
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-7331-5ab5d8b499c2
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-b6a1-4a18627bb142
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-dfa7-5f1fb1017e0e
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-5518-6c9c0e424403
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-0889-c3ddc9349d9a
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-178a-e5e6c317fac9
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-dd88-81608340593b
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-0056-bb4a710e5a17
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-1eb5-e18db4db4329
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-4faf-ed58792f6939
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5991-30c6-8e64e19dfb76
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-28ec-4ee93828b287
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-58d0-86644f57e800
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-96ea-46431e61b681
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-15a8-6e7d8044ceb4
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-2636-bc32188ba6e7
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-1cdf-460f4a064224
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-8797-56e23de4ae52
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-9d8d-06be5b86863f
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-d970-6342b218d11c
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-4d37-3b5b27e4ede8
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-5b62-7b243a49e0e4
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-69f2-2c12674a113b
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-d361-f341f58f9885
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-b223-15955de3d793
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-9b00-aa12177c69fa
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-dbe1-7b04ee1b3ad9
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-72cf-578d8212752d
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-fffb-8e4326b303d2
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-f680-00b48c63dba7
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-d941-6929024bbe31
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-4427-e48f0de9c961
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-3b44-bbf7c3819030
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-9cb4-2143d9003f59
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-b150-c1627dd799b9
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-39c2-0ef6334d377c
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5992-70e7-dd9d795e1769	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-3b18-24288fd1eff9
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-c3e9-56d4ab32d6ea
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-eaa8-1cce47ec00ab
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-f5ba-96c82dccf311
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-509f-c94d73f785a5
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-18d7-95689357ad33
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-18b0-c989b69f2305
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-d108-0115f6fe53cc
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-fdff-ab0ae635912c
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-0bcd-ed4fdaf4b1ad
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-9289-7317ce4eb757
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-5c55-8f4dd2688764
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-250c-114c03d41bc5
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-800a-f17a65638308
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-f81d-1e2e1182000d
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-6f8a-02d4244c1236
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-e512-832ef7ad336b
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-cf0b-8e23f31b5b09
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-f7e6-0684694ab0a8
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-bc69-2997e6bf090d
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-adbc-12f4051c2604
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-a448-f3888f65d405
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-4528-af25338b4d6a
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-89fa-f04d5b6a8631
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-525d-7abe4094c664
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-9315-c2b05dd2ab93
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-23a4-ed585d30bc58
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-6555-716343d63b00
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-ccf8-2e019a80381f
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-0347-204d6e77f225
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-e536-4e488535fee4
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-2793-27e2cdcc1c71
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-910e-62dc574562ee
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-b703-508e674e7083
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-9ce6-7a23da6e5f67
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-9f34-042c74fe2bd7
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-f8f2-ebed63704208
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-195e-a26978e2130d
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-cabe-4b3d0b9ef7f5
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-f497-d4d28882d71a
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-d936-1b3007dae007
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5ae7-9d8da8cd97cf
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-f5f7-108bfe9b478a
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-6999-a5d4aae16b25
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-4455-102f34095f57
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-8194-2a11b21979bd
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5f0b-aeb4ffdceb84
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-7be9-60b7dc66e0b1
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-f8e3-4d9c4b3c2edb
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-65d5-711442d4d48f
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-744d-881ca8ff1a19
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5006-0a65f278edac
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-b00b-7507c8299143
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-7e27-3e4d4140e463
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-b051-bb800524ad9e
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-fd13-d8483f052cb2
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-a956-515e9b57d61f
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5b2c-a4b286fae9f3
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-480b-b6c2aab0b519
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-7331-5ab5d8b499c2
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-b6a1-4a18627bb142
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-3a2a-985407d4cb26
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-dfa7-5f1fb1017e0e
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5518-6c9c0e424403
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-58b7-ba613ae4b8da
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-8f3c-2c73ebc470bd
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-6b4a-55bdb6a2d0d6
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-0889-c3ddc9349d9a
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-a448-030b8acf4252
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-ec96-b122fa8c36af
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5503-94357a53de2c
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-4f5b-a06688110743
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-b98e-386ffd50012c
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-07ff-907a40c6ffd8
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-178a-e5e6c317fac9
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-dd88-81608340593b
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-c1e1-29acca5ea950
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-0056-bb4a710e5a17
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-1eb5-e18db4db4329
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-4faf-ed58792f6939
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-30c6-8e64e19dfb76
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-28ec-4ee93828b287
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-58d0-86644f57e800
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-96ea-46431e61b681
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-15a8-6e7d8044ceb4
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-2636-bc32188ba6e7
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-1cdf-460f4a064224
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-8797-56e23de4ae52
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-9d8d-06be5b86863f
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-d970-6342b218d11c
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-4d37-3b5b27e4ede8
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5b62-7b243a49e0e4
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-69f2-2c12674a113b
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-d361-f341f58f9885
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-b223-15955de3d793
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-9b00-aa12177c69fa
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-dbe1-7b04ee1b3ad9
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-72cf-578d8212752d
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-fffb-8e4326b303d2
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-f680-00b48c63dba7
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5e0c-34181d68c293
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-8878-2c7ec8f442f2
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-07c3-165d9586fff5
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-16d1-d7ce1a072064
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-84ea-5832f0bf5c64
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-b785-af46e3969e31
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-3829-76c4a99a03d4
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-3203-5c16f7befa6e
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-69f1-bdc14d201ee6
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-a3a6-e852905bdcdc
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-6117-1069723deee0
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-105d-523acb1de0d6
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-b6e8-be1ff27def18
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-e21f-abf36ca5ce3c
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-674f-693cab7473ca
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-2935-6666292ec191
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-93fa-f56bec500280
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-bd31-c6e72d33d3ef
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-0c80-e2446877d466
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-f325-c692fb7fb4a5
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-0f37-4155873718c5
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-d568-8f22ada11f14
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-195d-48ee36cc28e2
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-d941-6929024bbe31
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-4427-e48f0de9c961
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-9acd-737310491c12
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5991-4858-e339ba977fe4
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-f3d2-2de327763b4a
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-912e-09e91cec2930
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-7a4b-1c0b6e1cddee
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-8eac-48ba4be01438
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-d995-92d73b0d304c
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-3721-200ec1465e4f
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-3710-9671955bd32f
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-3b44-bbf7c3819030
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-74a9-ef3e925434c7
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-9cb4-2143d9003f59
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-3309-dad8378335a7
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-4c2d-5fab9baa83b2
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-e2fb-e05dd91415cb
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-987b-503ccf1c2044
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-0ef7-0fcd4d576dac
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-ac6c-aed228884f89
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-b150-c1627dd799b9
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-a769-acd9b009bc65
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-17fe-14454d8e3500
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-39c2-0ef6334d377c
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-ab63-fd8ffbcae4c8
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5354-23d9d7d39e2d
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-e1ee-f70e172eb845
00020000-569e-5994-7b4c-a3fbb4bac141	00030000-569e-5992-5e67-f3e56a34574f
00020000-569e-5994-578d-0f64aa384c38	00030000-569e-5992-dbf1-e4c6f5aad789
00020000-569e-5994-6f8c-a56167cade3c	00030000-569e-5992-9943-acc4b5980bd5
00020000-569e-5994-f986-484ef9d5c4a4	00030000-569e-5992-3309-dad8378335a7
00020000-569e-5994-c2a5-a4ccae641850	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5994-26eb-b62673b6f32a	00030000-569e-5992-6999-a5d4aae16b25
00020000-569e-5994-7a0c-7144c1db2982	00030000-569e-5992-4455-102f34095f57
00020000-569e-5994-3a4d-957cede82ddf	00030000-569e-5992-8194-2a11b21979bd
00020000-569e-5994-04b6-4b666762e504	00030000-569e-5992-f5f7-108bfe9b478a
00020000-569e-5994-eb16-221d57d5e8b5	00030000-569e-5992-d936-1b3007dae007
00020000-569e-5994-2ce1-081b66b1c000	00030000-569e-5992-5ae7-9d8da8cd97cf
00020000-569e-5994-9be0-a9cc86ca1167	00030000-569e-5992-5315-3de0de7fb28b
00020000-569e-5994-4247-48bbd21c589d	00030000-569e-5992-79ab-5ddcbbb6b0fb
00020000-569e-5994-42e3-4bb94a3457cd	00030000-569e-5992-cc5b-bb9fa28aa70a
00020000-569e-5994-c4be-774abc05a754	00030000-569e-5992-4f7c-fe4d11f5202e
00020000-569e-5994-abd5-acb35be161a0	00030000-569e-5991-b051-bb800524ad9e
00020000-569e-5994-2ea8-d42ee164c78f	00030000-569e-5991-a874-b1ee4dea0e81
00020000-569e-5994-a29b-fb818ee071ed	00030000-569e-5992-32ac-1e6204eaf18c
00020000-569e-5994-1da7-e0f6c643bfd9	00030000-569e-5992-800a-f17a65638308
00020000-569e-5994-caed-6e4ed3ead4a8	00030000-569e-5992-d6a5-483f288dfbbf
00020000-569e-5994-caed-6e4ed3ead4a8	00030000-569e-5992-b6a1-4a18627bb142
00020000-569e-5994-caed-6e4ed3ead4a8	00030000-569e-5992-b17a-561f1b7d562e
00020000-569e-5994-71d1-e80fdaeb9613	00030000-569e-5992-afdb-1fee021da72e
00020000-569e-5994-1bbb-177c0bc36d84	00030000-569e-5992-9cb4-2143d9003f59
00020000-569e-5994-ed74-7f12f11c72cf	00030000-569e-5992-195d-48ee36cc28e2
00020000-569e-5994-a259-f88dfa6e143a	00030000-569e-5992-5421-e292bb35a3e8
00020000-569e-5994-bbcf-32a9ed208ccb	00030000-569e-5992-4427-e48f0de9c961
00020000-569e-5994-177e-72e13c9e485f	00030000-569e-5992-5bff-54820786ab3f
00020000-569e-5994-b36e-2ac1fbc11b67	00030000-569e-5992-0889-c3ddc9349d9a
00020000-569e-5994-fa67-7adc8107d4f9	00030000-569e-5992-c163-61f2e3bc923e
00020000-569e-5994-cf07-d712593cf1f4	00030000-569e-5992-39c2-0ef6334d377c
00020000-569e-5994-7df6-1723b8073a31	00030000-569e-5992-8f3b-5e24f7e819ef
00020000-569e-5994-10d7-d227c98f61f1	00030000-569e-5992-7331-5ab5d8b499c2
00020000-569e-5994-2fac-42104a9e157c	00030000-569e-5992-6b02-fee32c423818
00020000-569e-5994-5175-be55d3a8ad3e	00030000-569e-5992-d941-6929024bbe31
00020000-569e-5994-0952-574289288bbe	00030000-569e-5991-9383-3da7b3ed53c5
00020000-569e-5994-52c8-a972233f7c59	00030000-569e-5991-3d66-ccf9c3ded260
00020000-569e-5994-0b39-ed55d9e17156	00030000-569e-5991-509f-c94d73f785a5
00020000-569e-5994-7038-59a0211869e5	00030000-569e-5991-f922-1c9201aff57e
00020000-569e-5994-80f8-edc9833a3d66	00030000-569e-5991-e536-4e488535fee4
00020000-569e-5994-6100-507ae193a0a3	00030000-569e-5991-0347-204d6e77f225
\.


--
-- TOC entry 3182 (class 0 OID 38156598)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 38156632)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 38156765)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569e-5994-69fa-fd479ec90889	00090000-569e-5994-41a3-eec4b6a136c1	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569e-5994-ef15-b2958a27cdeb	00090000-569e-5994-81cc-c1d3d7707217	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569e-5994-b4d1-c27c662f1353	00090000-569e-5994-74a4-2440e14d9987	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569e-5994-b312-543f2d32fd6a	00090000-569e-5994-e892-383dc65d6c74	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3151 (class 0 OID 38156281)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569e-5994-66c2-3a797d54c710	\N	00040000-569e-5991-579f-51aaea1ccae8	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-5994-34e2-8cd6ed4b0410	\N	00040000-569e-5991-579f-51aaea1ccae8	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569e-5994-52d4-573ebceb8b1e	\N	00040000-569e-5991-579f-51aaea1ccae8	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-5994-d566-77bb882b4856	\N	00040000-569e-5991-579f-51aaea1ccae8	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-5994-6b24-3f540bab247c	\N	00040000-569e-5991-579f-51aaea1ccae8	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-5994-8cac-ee76167540bd	\N	00040000-569e-5991-3bf6-b3466541529e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-5994-14d8-4dae6bfec618	\N	00040000-569e-5991-c807-8874e80c1bf2	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-5994-a62c-139d2fe6bfa3	\N	00040000-569e-5991-4892-66129aa97818	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-5994-641c-2f506a56e853	\N	00040000-569e-5991-dffd-a0eca677024b	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569e-5996-8751-e2f9a13fa0a0	\N	00040000-569e-5991-579f-51aaea1ccae8	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3154 (class 0 OID 38156326)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569e-5991-a79e-0204f37275d9	8341	Adlešiči
00050000-569e-5991-4831-ea655d527c14	5270	Ajdovščina
00050000-569e-5991-ef1e-933c996d2d84	6280	Ankaran/Ancarano
00050000-569e-5991-d2ee-5460343a6413	9253	Apače
00050000-569e-5991-635c-efcc76b82fd2	8253	Artiče
00050000-569e-5991-791e-f428ed652e26	4275	Begunje na Gorenjskem
00050000-569e-5991-7593-16084b5d783a	1382	Begunje pri Cerknici
00050000-569e-5991-b033-5b1ab50d37c5	9231	Beltinci
00050000-569e-5991-8a56-0449ee391204	2234	Benedikt
00050000-569e-5991-d19b-ebcfd059fcdc	2345	Bistrica ob Dravi
00050000-569e-5991-c80b-8b590e55f401	3256	Bistrica ob Sotli
00050000-569e-5991-9120-401d8d053d77	8259	Bizeljsko
00050000-569e-5991-03c3-47c12fe7c5c2	1223	Blagovica
00050000-569e-5991-2eaf-b66568c18fa0	8283	Blanca
00050000-569e-5991-995a-41f91693bf3d	4260	Bled
00050000-569e-5991-d4ac-e04bc437ba6b	4273	Blejska Dobrava
00050000-569e-5991-79a2-b0b14333ce88	9265	Bodonci
00050000-569e-5991-65f2-4fb99ab50133	9222	Bogojina
00050000-569e-5991-9496-f20e03ae16c4	4263	Bohinjska Bela
00050000-569e-5991-17bd-46e6e63678b2	4264	Bohinjska Bistrica
00050000-569e-5991-7322-041e2fb54b30	4265	Bohinjsko jezero
00050000-569e-5991-ea88-d0743135e5e1	1353	Borovnica
00050000-569e-5991-74dc-ad110206ce13	8294	Boštanj
00050000-569e-5991-c699-075e44167823	5230	Bovec
00050000-569e-5991-5421-aaa8988acec4	5295	Branik
00050000-569e-5991-e94c-85e11b09e03a	3314	Braslovče
00050000-569e-5991-26be-f91d6cc6c544	5223	Breginj
00050000-569e-5991-8a07-7ca2b79063f5	8280	Brestanica
00050000-569e-5991-7326-204fe1d25001	2354	Bresternica
00050000-569e-5991-cc0c-ab65eb9c3ebe	4243	Brezje
00050000-569e-5991-ff7b-48b98d637df6	1351	Brezovica pri Ljubljani
00050000-569e-5991-5f9c-c10854ae7815	8250	Brežice
00050000-569e-5991-2370-f452922ab1bd	4210	Brnik - Aerodrom
00050000-569e-5991-3416-2c6124da4d5f	8321	Brusnice
00050000-569e-5991-8a9d-eb81b547aa1c	3255	Buče
00050000-569e-5991-5712-ea26b797f9fd	8276	Bučka 
00050000-569e-5991-03dc-c68e9558f63f	9261	Cankova
00050000-569e-5991-a222-bd903eed15b5	3000	Celje 
00050000-569e-5991-228e-5f2d98c47805	3001	Celje - poštni predali
00050000-569e-5991-cace-6f80c6921eb9	4207	Cerklje na Gorenjskem
00050000-569e-5991-61e2-c79cb26dd3cc	8263	Cerklje ob Krki
00050000-569e-5991-f5eb-338baf276286	1380	Cerknica
00050000-569e-5991-4812-b6513e2cee56	5282	Cerkno
00050000-569e-5991-ca7a-98c9a592e47b	2236	Cerkvenjak
00050000-569e-5991-618a-6d5104bd6fb6	2215	Ceršak
00050000-569e-5991-cbed-b6025cd72c15	2326	Cirkovce
00050000-569e-5991-1900-43fe34912de7	2282	Cirkulane
00050000-569e-5991-2089-a90ff6cefdcd	5273	Col
00050000-569e-5991-74d2-844f32b88bb1	8251	Čatež ob Savi
00050000-569e-5991-cd96-ced318c2ea51	1413	Čemšenik
00050000-569e-5991-cc91-b36a9033950b	5253	Čepovan
00050000-569e-5991-bc47-1213240b39d3	9232	Črenšovci
00050000-569e-5991-a8ff-23c308fa56ef	2393	Črna na Koroškem
00050000-569e-5991-3dbe-eba4d0389071	6275	Črni Kal
00050000-569e-5991-8cf3-54a86d44f6f1	5274	Črni Vrh nad Idrijo
00050000-569e-5991-f970-3fe03b7134c5	5262	Črniče
00050000-569e-5991-f9fc-b132594f9082	8340	Črnomelj
00050000-569e-5991-8902-1b4474f6edb9	6271	Dekani
00050000-569e-5991-1f4d-0b17b8e72e28	5210	Deskle
00050000-569e-5991-bec4-d7dc83ea0954	2253	Destrnik
00050000-569e-5991-f397-f7984c00bd47	6215	Divača
00050000-569e-5991-700d-6bf8bce34bd2	1233	Dob
00050000-569e-5991-b114-fb74d4f127e6	3224	Dobje pri Planini
00050000-569e-5991-293f-5cc7eb02d89c	8257	Dobova
00050000-569e-5991-26d6-cd986e39b970	1423	Dobovec
00050000-569e-5991-24e5-4738aec3238f	5263	Dobravlje
00050000-569e-5991-7245-e76463ddc1fe	3204	Dobrna
00050000-569e-5991-cb43-49a8fb3612d6	8211	Dobrnič
00050000-569e-5991-e2b1-ab9579d0a766	1356	Dobrova
00050000-569e-5991-89ec-28125cc155fc	9223	Dobrovnik/Dobronak 
00050000-569e-5991-1e59-3931820ee24d	5212	Dobrovo v Brdih
00050000-569e-5991-c5eb-b547a4624dd5	1431	Dol pri Hrastniku
00050000-569e-5991-ab08-6aa4f76fdf80	1262	Dol pri Ljubljani
00050000-569e-5991-9eaf-4b9ecee53550	1273	Dole pri Litiji
00050000-569e-5991-717b-50683a2b0217	1331	Dolenja vas
00050000-569e-5991-9247-acb8f3052a15	8350	Dolenjske Toplice
00050000-569e-5991-f23e-da02d1c85f70	1230	Domžale
00050000-569e-5991-6f6f-268d161c0bbd	2252	Dornava
00050000-569e-5991-9e2e-e4130553aa57	5294	Dornberk
00050000-569e-5991-fff7-0bc67898f995	1319	Draga
00050000-569e-5991-1769-fb413ff3924c	8343	Dragatuš
00050000-569e-5991-a75e-d7fbee1b7996	3222	Dramlje
00050000-569e-5991-8720-71b561f49a73	2370	Dravograd
00050000-569e-5991-8059-e531d32fe02b	4203	Duplje
00050000-569e-5991-77f2-9617eb9a1ca0	6221	Dutovlje
00050000-569e-5991-6602-0b8b074e9e5a	8361	Dvor
00050000-569e-5991-8276-9394037c74be	2343	Fala
00050000-569e-5991-ab78-ec61b468db96	9208	Fokovci
00050000-569e-5991-7305-639afb6a71a7	2313	Fram
00050000-569e-5991-7f39-37386b8424d8	3213	Frankolovo
00050000-569e-5991-7d65-d05ddc2b5145	1274	Gabrovka
00050000-569e-5991-145b-a81de3bff0a2	8254	Globoko
00050000-569e-5991-7175-cf4f663bb23c	5275	Godovič
00050000-569e-5991-1c73-140d8bb8d7b3	4204	Golnik
00050000-569e-5991-62c4-58ab979ae968	3303	Gomilsko
00050000-569e-5991-8e84-ce409c7d7517	4224	Gorenja vas
00050000-569e-5991-b7c1-ea3bc80af699	3263	Gorica pri Slivnici
00050000-569e-5991-4dc3-418da6398a71	2272	Gorišnica
00050000-569e-5991-bb0d-b2f62e7cb9c4	9250	Gornja Radgona
00050000-569e-5991-6ed1-f6d842fe84df	3342	Gornji Grad
00050000-569e-5991-7b55-be8c18da8f51	4282	Gozd Martuljek
00050000-569e-5991-9343-35a15ece0d40	6272	Gračišče
00050000-569e-5991-1372-84c32a4b3a68	9264	Grad
00050000-569e-5991-ae54-4f21d8896509	8332	Gradac
00050000-569e-5991-4bbf-f2bad382fc4d	1384	Grahovo
00050000-569e-5991-ac33-10d6ab9bcd03	5242	Grahovo ob Bači
00050000-569e-5991-0331-25f9df17ffd6	5251	Grgar
00050000-569e-5991-6037-6512337c6296	3302	Griže
00050000-569e-5991-d6ca-c5fb13c227bf	3231	Grobelno
00050000-569e-5991-2f03-fcb215919df1	1290	Grosuplje
00050000-569e-5991-0bb2-edf5f9d7fda9	2288	Hajdina
00050000-569e-5991-57bc-95eadf1a4189	8362	Hinje
00050000-569e-5991-9d53-3f22de9d758d	2311	Hoče
00050000-569e-5991-5812-1dc07e72fcfc	9205	Hodoš/Hodos
00050000-569e-5991-bac4-a36d0eb65d79	1354	Horjul
00050000-569e-5991-7230-71cfa508f5af	1372	Hotedršica
00050000-569e-5991-5e2a-8a5244a5503c	1430	Hrastnik
00050000-569e-5991-9a2b-865f45333163	6225	Hruševje
00050000-569e-5991-7d3f-703110113cc3	4276	Hrušica
00050000-569e-5991-a765-c0076530b549	5280	Idrija
00050000-569e-5991-5a29-bead87b3c663	1292	Ig
00050000-569e-5991-015d-e4abc73e96ca	6250	Ilirska Bistrica
00050000-569e-5991-c8b9-2bcab0bbdf3d	6251	Ilirska Bistrica-Trnovo
00050000-569e-5991-cbea-5c604a78abab	1295	Ivančna Gorica
00050000-569e-5991-19e6-403dc8122809	2259	Ivanjkovci
00050000-569e-5991-e947-580e5023db7c	1411	Izlake
00050000-569e-5991-69d5-6f4d82d9792f	6310	Izola/Isola
00050000-569e-5991-c808-26118453685f	2222	Jakobski Dol
00050000-569e-5991-3306-3963969c6806	2221	Jarenina
00050000-569e-5991-cdc2-55730a536cc0	6254	Jelšane
00050000-569e-5991-8dfb-ac5239e4af1a	4270	Jesenice
00050000-569e-5991-1b5d-021569b31bb2	8261	Jesenice na Dolenjskem
00050000-569e-5991-8331-10d0d8642a85	3273	Jurklošter
00050000-569e-5991-61c1-580277b223f1	2223	Jurovski Dol
00050000-569e-5991-c9e0-fd1daf8ac5ce	2256	Juršinci
00050000-569e-5991-45ec-24712d0e70dd	5214	Kal nad Kanalom
00050000-569e-5991-72a9-1c7ce76eac8b	3233	Kalobje
00050000-569e-5991-632c-c745006f6e6f	4246	Kamna Gorica
00050000-569e-5991-dc05-b365bc2d4f57	2351	Kamnica
00050000-569e-5991-b9cc-f69995e5f25f	1241	Kamnik
00050000-569e-5991-f4f2-2308a1c8f915	5213	Kanal
00050000-569e-5991-3b08-515e6802d785	8258	Kapele
00050000-569e-5991-e16f-9f749a5bda9d	2362	Kapla
00050000-569e-5991-1f32-36cefab4e2ff	2325	Kidričevo
00050000-569e-5991-be18-35d6e8e2a699	1412	Kisovec
00050000-569e-5991-d446-8cbe37abaca9	6253	Knežak
00050000-569e-5991-e4e4-b5ea98c7059a	5222	Kobarid
00050000-569e-5991-1e73-5397d43c57c4	9227	Kobilje
00050000-569e-5991-b267-7714cb0504e7	1330	Kočevje
00050000-569e-5991-6c9d-0a9f5ddbd82f	1338	Kočevska Reka
00050000-569e-5991-e0bc-b94001dee678	2276	Kog
00050000-569e-5991-b9d8-cfcd429572c4	5211	Kojsko
00050000-569e-5991-1458-2534d88d5bee	6223	Komen
00050000-569e-5991-6727-52c1c7ce46de	1218	Komenda
00050000-569e-5991-1762-267ca504d2c5	6000	Koper/Capodistria 
00050000-569e-5991-5fea-a1b4f84b3493	6001	Koper/Capodistria - poštni predali
00050000-569e-5991-1313-3eb180492d5f	8282	Koprivnica
00050000-569e-5991-057f-911a373eaa7c	5296	Kostanjevica na Krasu
00050000-569e-5991-0c57-72406493835b	8311	Kostanjevica na Krki
00050000-569e-5991-c078-bc6d3fed60df	1336	Kostel
00050000-569e-5991-5ee8-7ccfeb5311f7	6256	Košana
00050000-569e-5991-76fb-41f8515107b9	2394	Kotlje
00050000-569e-5991-5b9c-3983bad55213	6240	Kozina
00050000-569e-5991-be9e-7862e5bfb75b	3260	Kozje
00050000-569e-5991-83f6-d94b972d194d	4000	Kranj 
00050000-569e-5991-e274-6063b1ecd07f	4001	Kranj - poštni predali
00050000-569e-5991-c70e-b267ce7d222d	4280	Kranjska Gora
00050000-569e-5991-d702-e33df200181b	1281	Kresnice
00050000-569e-5991-c74e-c7a19456f601	4294	Križe
00050000-569e-5991-8b9c-f55118d87feb	9206	Križevci
00050000-569e-5991-7cff-6d155ce6ad3c	9242	Križevci pri Ljutomeru
00050000-569e-5991-c52f-eb07763e1c91	1301	Krka
00050000-569e-5991-131a-28a1ec3a8af9	8296	Krmelj
00050000-569e-5991-ddf9-b1c772665d49	4245	Kropa
00050000-569e-5991-6f7a-4c9416dd65ca	8262	Krška vas
00050000-569e-5991-2737-d12b1cbcd24e	8270	Krško
00050000-569e-5991-587e-19695fcee4a3	9263	Kuzma
00050000-569e-5991-ca3c-c86d87218200	2318	Laporje
00050000-569e-5991-9317-862487a4b98c	3270	Laško
00050000-569e-5991-4e09-2a98d6b466da	1219	Laze v Tuhinju
00050000-569e-5991-3c1e-0f196d8b3a4d	2230	Lenart v Slovenskih goricah
00050000-569e-5991-0cd3-4b22011bb72b	9220	Lendava/Lendva
00050000-569e-5991-0e2d-bbcb6e579525	4248	Lesce
00050000-569e-5991-d3df-f500936eaeb9	3261	Lesično
00050000-569e-5991-b3ca-f743d3edd94a	8273	Leskovec pri Krškem
00050000-569e-5991-ee03-a8bb0177d9f9	2372	Libeliče
00050000-569e-5991-4c1f-ed0ca1586ba6	2341	Limbuš
00050000-569e-5991-495d-8e57942b1ab4	1270	Litija
00050000-569e-5991-6bcf-aef6057b04dc	3202	Ljubečna
00050000-569e-5991-f7c6-d407487dc4a4	1000	Ljubljana 
00050000-569e-5991-6f9f-3985186bf66a	1001	Ljubljana - poštni predali
00050000-569e-5991-2850-332207a3cfcd	1231	Ljubljana - Črnuče
00050000-569e-5991-3e45-fae703e81880	1261	Ljubljana - Dobrunje
00050000-569e-5991-3d44-5a7c04b9169a	1260	Ljubljana - Polje
00050000-569e-5991-faf7-78e102783f11	1210	Ljubljana - Šentvid
00050000-569e-5991-edfe-5d6c7de905a6	1211	Ljubljana - Šmartno
00050000-569e-5991-0d68-acd5a35a9751	3333	Ljubno ob Savinji
00050000-569e-5991-70d5-a47ad74afa54	9240	Ljutomer
00050000-569e-5991-4812-ede9dfcad831	3215	Loče
00050000-569e-5991-cddb-ae3c226fa8fd	5231	Log pod Mangartom
00050000-569e-5991-4338-c3101c176b94	1358	Log pri Brezovici
00050000-569e-5991-0c5b-1c1e56a2a9f8	1370	Logatec
00050000-569e-5991-2da2-8c28119aa1f2	1371	Logatec
00050000-569e-5991-473b-9a4735fa3593	1434	Loka pri Zidanem Mostu
00050000-569e-5991-9912-4e74f3878b40	3223	Loka pri Žusmu
00050000-569e-5991-70bf-8c377ff46653	6219	Lokev
00050000-569e-5991-b0b3-d089db84142f	1318	Loški Potok
00050000-569e-5991-fa61-a8a3441f2b26	2324	Lovrenc na Dravskem polju
00050000-569e-5991-8472-a0b3ace73881	2344	Lovrenc na Pohorju
00050000-569e-5991-0f97-432735cb439a	3334	Luče
00050000-569e-5991-695a-1a5f30de9b43	1225	Lukovica
00050000-569e-5991-b25c-bf989af2b256	9202	Mačkovci
00050000-569e-5991-bfb8-88161451d843	2322	Majšperk
00050000-569e-5991-c1f2-9fac3f8fab80	2321	Makole
00050000-569e-5991-2d90-f893b75df9c5	9243	Mala Nedelja
00050000-569e-5991-9837-51c18fa645bc	2229	Malečnik
00050000-569e-5991-6408-9e1d6dd827a4	6273	Marezige
00050000-569e-5991-9eee-a964d566f7ba	2000	Maribor 
00050000-569e-5991-718a-4aafdeb5127b	2001	Maribor - poštni predali
00050000-569e-5991-9914-3eac12f15d79	2206	Marjeta na Dravskem polju
00050000-569e-5991-0ac5-d089a56059e7	2281	Markovci
00050000-569e-5991-1912-cf412237ce65	9221	Martjanci
00050000-569e-5991-58ff-e450545cea76	6242	Materija
00050000-569e-5991-9bfa-38466e9cc25e	4211	Mavčiče
00050000-569e-5991-f21c-1ab58bfb6c9c	1215	Medvode
00050000-569e-5991-1c22-c35491007c76	1234	Mengeš
00050000-569e-5991-03b8-acda1e07bda3	8330	Metlika
00050000-569e-5991-6b41-8689b4cfadea	2392	Mežica
00050000-569e-5991-2cd8-8ae68d554290	2204	Miklavž na Dravskem polju
00050000-569e-5991-44ab-74a0c4b12fc8	2275	Miklavž pri Ormožu
00050000-569e-5991-7773-57b796705c58	5291	Miren
00050000-569e-5991-24c4-2ae538e48f83	8233	Mirna
00050000-569e-5991-bf8c-7da95d660260	8216	Mirna Peč
00050000-569e-5991-6b93-3b4ff3976e3f	2382	Mislinja
00050000-569e-5991-6867-1f6b4889d6bf	4281	Mojstrana
00050000-569e-5991-3d97-96c0d114842d	8230	Mokronog
00050000-569e-5991-5a10-2b4d9f9f8ffa	1251	Moravče
00050000-569e-5991-1fb4-3affde3132ea	9226	Moravske Toplice
00050000-569e-5991-260f-e3cff1497023	5216	Most na Soči
00050000-569e-5991-902c-33c4e533ccc9	1221	Motnik
00050000-569e-5991-4ff4-58d299d2e483	3330	Mozirje
00050000-569e-5991-b2f5-9b7e7ed5feaa	9000	Murska Sobota 
00050000-569e-5991-025f-7da78afdf4c9	9001	Murska Sobota - poštni predali
00050000-569e-5991-8f4e-c12211c38051	2366	Muta
00050000-569e-5991-69bb-b08cbc45197f	4202	Naklo
00050000-569e-5991-e339-05b3f5b69f4e	3331	Nazarje
00050000-569e-5991-942a-df4c40908610	1357	Notranje Gorice
00050000-569e-5991-5150-3d13decee249	3203	Nova Cerkev
00050000-569e-5991-a0f5-0b6ee84b29b1	5000	Nova Gorica 
00050000-569e-5991-2e55-762157fdfd03	5001	Nova Gorica - poštni predali
00050000-569e-5991-5ce8-94a8d502f92c	1385	Nova vas
00050000-569e-5991-aeda-c29bcb921076	8000	Novo mesto
00050000-569e-5991-7fc1-e66c41b41359	8001	Novo mesto - poštni predali
00050000-569e-5991-12d1-8901e1d09882	6243	Obrov
00050000-569e-5991-1d83-7e5757e4617c	9233	Odranci
00050000-569e-5991-bbae-0c289739ceea	2317	Oplotnica
00050000-569e-5991-308d-11cb5f14453b	2312	Orehova vas
00050000-569e-5991-fd00-86cc9588998b	2270	Ormož
00050000-569e-5991-00dc-1d5972acfb47	1316	Ortnek
00050000-569e-5991-5794-ec7ae00bcc7a	1337	Osilnica
00050000-569e-5991-90dd-9635c98444fe	8222	Otočec
00050000-569e-5991-ffaf-600bd10ade84	2361	Ožbalt
00050000-569e-5991-246c-53e4d936291c	2231	Pernica
00050000-569e-5991-a520-0d2138c5fd07	2211	Pesnica pri Mariboru
00050000-569e-5991-7408-6686efacfe2d	9203	Petrovci
00050000-569e-5991-9fcb-7c2fba7636ce	3301	Petrovče
00050000-569e-5991-abcb-d8b4b675aacd	6330	Piran/Pirano
00050000-569e-5991-f0b0-3e7aba21cdd9	8255	Pišece
00050000-569e-5991-d62d-4fa58b2f96d1	6257	Pivka
00050000-569e-5991-6e2b-8fb011c5f647	6232	Planina
00050000-569e-5991-c853-3e543b51bb4b	3225	Planina pri Sevnici
00050000-569e-5991-1c99-1bd2cc142755	6276	Pobegi
00050000-569e-5991-e3a1-477c316d3c0a	8312	Podbočje
00050000-569e-5991-7323-94010cb90159	5243	Podbrdo
00050000-569e-5991-bc39-7420a0d54c1f	3254	Podčetrtek
00050000-569e-5991-b3fa-171a0658efeb	2273	Podgorci
00050000-569e-5991-add6-69c029ac45d1	6216	Podgorje
00050000-569e-5991-4c6e-0c0508793dde	2381	Podgorje pri Slovenj Gradcu
00050000-569e-5991-7341-8fb74ea412ff	6244	Podgrad
00050000-569e-5991-9502-18fea92f68ba	1414	Podkum
00050000-569e-5991-ad77-fae37cc4018c	2286	Podlehnik
00050000-569e-5991-7ce3-b40bc2949608	5272	Podnanos
00050000-569e-5991-ed03-83e89c3d324e	4244	Podnart
00050000-569e-5991-473d-6e35fd344405	3241	Podplat
00050000-569e-5991-008c-e5cbd3e7e0cb	3257	Podsreda
00050000-569e-5991-fdf5-326cadd74780	2363	Podvelka
00050000-569e-5991-388e-1c735152ca06	2208	Pohorje
00050000-569e-5991-ba76-5da743f91d3d	2257	Polenšak
00050000-569e-5991-32af-49edeb661ae8	1355	Polhov Gradec
00050000-569e-5991-6741-499bc0b128f3	4223	Poljane nad Škofjo Loko
00050000-569e-5991-cbe8-91f1b6180b49	2319	Poljčane
00050000-569e-5991-bb2c-cc0f818fcdec	1272	Polšnik
00050000-569e-5991-388b-a1b735df5c6c	3313	Polzela
00050000-569e-5991-08b1-df7953ed2f3d	3232	Ponikva
00050000-569e-5991-42a1-acb9729bd907	6320	Portorož/Portorose
00050000-569e-5991-8a4a-96619807bf6c	6230	Postojna
00050000-569e-5991-af0f-5c71ade2d0bc	2331	Pragersko
00050000-569e-5991-46e2-8975749a93d0	3312	Prebold
00050000-569e-5991-4148-34c0205ef0e9	4205	Preddvor
00050000-569e-5991-bf4e-a2071ab103ab	6255	Prem
00050000-569e-5991-8e03-b8aa642a7aec	1352	Preserje
00050000-569e-5991-6f7b-1dd7c65a3bc2	6258	Prestranek
00050000-569e-5991-f6c3-888088e34a12	2391	Prevalje
00050000-569e-5991-e85b-522ec2b7db3b	3262	Prevorje
00050000-569e-5991-920e-2c7b1bec5952	1276	Primskovo 
00050000-569e-5991-8d8e-b658bf65edea	3253	Pristava pri Mestinju
00050000-569e-5991-80cb-9dc3791a72b5	9207	Prosenjakovci/Partosfalva
00050000-569e-5991-e51c-8dcdce132bc6	5297	Prvačina
00050000-569e-5991-9162-b2d2ce2609fa	2250	Ptuj
00050000-569e-5991-7851-2413d5413373	2323	Ptujska Gora
00050000-569e-5991-cd7d-281f22860559	9201	Puconci
00050000-569e-5991-5977-a5fecae76b0f	2327	Rače
00050000-569e-5991-7c5b-47d333c26843	1433	Radeče
00050000-569e-5991-d381-dea0ccbdfd6c	9252	Radenci
00050000-569e-5991-f04c-98830780436a	2360	Radlje ob Dravi
00050000-569e-5991-2133-65b01c92d2aa	1235	Radomlje
00050000-569e-5991-fcb2-e28408da90ae	4240	Radovljica
00050000-569e-5991-78b4-7b3480d9ae7c	8274	Raka
00050000-569e-5991-0042-7743b8108009	1381	Rakek
00050000-569e-5991-ba64-25ccb7bbdf13	4283	Rateče - Planica
00050000-569e-5991-94e6-9ed99ec8c83b	2390	Ravne na Koroškem
00050000-569e-5991-cfe5-d56d8ac0beea	9246	Razkrižje
00050000-569e-5991-6271-068a9ab2a9d4	3332	Rečica ob Savinji
00050000-569e-5991-3cb0-54a1c045e626	5292	Renče
00050000-569e-5991-f740-e1def069db0e	1310	Ribnica
00050000-569e-5991-bfeb-fe420e127485	2364	Ribnica na Pohorju
00050000-569e-5991-5c8b-ac91b5767603	3272	Rimske Toplice
00050000-569e-5991-3c68-1b5c83b30577	1314	Rob
00050000-569e-5991-8dcc-049df5331362	5215	Ročinj
00050000-569e-5991-651d-737689bfdc43	3250	Rogaška Slatina
00050000-569e-5991-9f7a-852e85f96fea	9262	Rogašovci
00050000-569e-5991-a651-c64fe59a30fc	3252	Rogatec
00050000-569e-5991-e397-c57b9aa2667a	1373	Rovte
00050000-569e-5991-dd96-96946f9fa6db	2342	Ruše
00050000-569e-5991-8971-05f832c83576	1282	Sava
00050000-569e-5991-7f4d-9e3323c7185a	6333	Sečovlje/Sicciole
00050000-569e-5991-c13b-d7ecaa6ec21b	4227	Selca
00050000-569e-5991-8bfc-d3c9293c0f2a	2352	Selnica ob Dravi
00050000-569e-5991-7052-7b19bcac50ea	8333	Semič
00050000-569e-5991-a017-a67ca7ae7b24	8281	Senovo
00050000-569e-5991-f267-f316e6de9476	6224	Senožeče
00050000-569e-5991-9865-bd3d6ac82e4b	8290	Sevnica
00050000-569e-5991-1ddf-a9ddf58374ac	6210	Sežana
00050000-569e-5991-b657-c32bcf7c8a33	2214	Sladki Vrh
00050000-569e-5991-66bf-1dc95a0514e8	5283	Slap ob Idrijci
00050000-569e-5991-5e17-5beee9e3f0ac	2380	Slovenj Gradec
00050000-569e-5991-05c6-cdc00cda20ae	2310	Slovenska Bistrica
00050000-569e-5991-4a5a-888f5b4934f0	3210	Slovenske Konjice
00050000-569e-5991-c210-4fd1ff66471e	1216	Smlednik
00050000-569e-5991-3f32-9bd63e0ca923	5232	Soča
00050000-569e-5991-ca9d-0c02d784bd66	1317	Sodražica
00050000-569e-5991-7741-eb5ec2fbd3e8	3335	Solčava
00050000-569e-5991-1e42-7625b828835b	5250	Solkan
00050000-569e-5991-48d7-afb4e0cb4ceb	4229	Sorica
00050000-569e-5991-ad0e-f86d6ee089b5	4225	Sovodenj
00050000-569e-5991-5c4b-cc14fa7d6b5b	5281	Spodnja Idrija
00050000-569e-5991-6bd4-df2ea33d19c4	2241	Spodnji Duplek
00050000-569e-5991-db52-0b10f6ca2a70	9245	Spodnji Ivanjci
00050000-569e-5991-bdb2-44dfdf382c33	2277	Središče ob Dravi
00050000-569e-5991-5328-778aeb8360bb	4267	Srednja vas v Bohinju
00050000-569e-5991-2128-caac5d6b4063	8256	Sromlje 
00050000-569e-5991-967f-24b0fec7818e	5224	Srpenica
00050000-569e-5991-1ce4-f30e098bb0c2	1242	Stahovica
00050000-569e-5991-2cb4-78bdd4629338	1332	Stara Cerkev
00050000-569e-5991-8995-af4b745a1ebf	8342	Stari trg ob Kolpi
00050000-569e-5991-362b-133451385083	1386	Stari trg pri Ložu
00050000-569e-5991-520b-044042ec94e0	2205	Starše
00050000-569e-5991-ca30-68543d7ab79a	2289	Stoperce
00050000-569e-5991-85c4-d9e8bd6df21f	8322	Stopiče
00050000-569e-5991-7b7f-2c116f1c6f9c	3206	Stranice
00050000-569e-5991-ae44-9ff13c909970	8351	Straža
00050000-569e-5991-e8dc-e88f2b3d58c4	1313	Struge
00050000-569e-5991-a526-f5684f313d44	8293	Studenec
00050000-569e-5991-b849-96e570c68876	8331	Suhor
00050000-569e-5991-6137-e28f2b97e6c1	2233	Sv. Ana v Slovenskih goricah
00050000-569e-5991-373f-53111e24f8d7	2235	Sv. Trojica v Slovenskih goricah
00050000-569e-5991-aa8b-59875ee75b0f	2353	Sveti Duh na Ostrem Vrhu
00050000-569e-5991-9c5c-42eef2fefac9	9244	Sveti Jurij ob Ščavnici
00050000-569e-5991-5d5c-3da563bc4015	3264	Sveti Štefan
00050000-569e-5991-286e-b22c2c77dea6	2258	Sveti Tomaž
00050000-569e-5991-0b59-5993f57410be	9204	Šalovci
00050000-569e-5991-d397-7df22220c3a7	5261	Šempas
00050000-569e-5991-6c08-b4eba3d81fc0	5290	Šempeter pri Gorici
00050000-569e-5991-f908-4f78c8e5b39c	3311	Šempeter v Savinjski dolini
00050000-569e-5991-eb23-7195aa97d8b4	4208	Šenčur
00050000-569e-5991-6bba-c408121419c4	2212	Šentilj v Slovenskih goricah
00050000-569e-5991-743a-7aed61af5803	8297	Šentjanž
00050000-569e-5991-f25a-dc756ca3e970	2373	Šentjanž pri Dravogradu
00050000-569e-5991-5075-6f7d22a8a7ae	8310	Šentjernej
00050000-569e-5991-9822-bb2893249a7f	3230	Šentjur
00050000-569e-5991-2cc1-a9b60f12ae0a	3271	Šentrupert
00050000-569e-5991-c4f4-6b0d6a398b4d	8232	Šentrupert
00050000-569e-5991-030f-5c807074695f	1296	Šentvid pri Stični
00050000-569e-5991-9e35-cf41e04baff0	8275	Škocjan
00050000-569e-5991-6931-5bb1367d04b5	6281	Škofije
00050000-569e-5991-2f8d-803ee9d4a5ed	4220	Škofja Loka
00050000-569e-5991-c27d-5b9c9edc9c7c	3211	Škofja vas
00050000-569e-5991-0f3d-b3ee52c1ca9c	1291	Škofljica
00050000-569e-5991-408e-5357a510d353	6274	Šmarje
00050000-569e-5991-63fe-d020dbdcee88	1293	Šmarje - Sap
00050000-569e-5991-b145-248272178eb9	3240	Šmarje pri Jelšah
00050000-569e-5991-a72b-a33e7752592e	8220	Šmarješke Toplice
00050000-569e-5991-35ba-8536681a5b4d	2315	Šmartno na Pohorju
00050000-569e-5991-65e2-7758776002fc	3341	Šmartno ob Dreti
00050000-569e-5991-ffdc-b972a90a50bc	3327	Šmartno ob Paki
00050000-569e-5991-de98-8f409fddcd0e	1275	Šmartno pri Litiji
00050000-569e-5991-9d6f-3500efd48a13	2383	Šmartno pri Slovenj Gradcu
00050000-569e-5991-4d91-1c82cdc8c0d6	3201	Šmartno v Rožni dolini
00050000-569e-5991-286c-a1236d6e64a1	3325	Šoštanj
00050000-569e-5991-bed2-c33219933822	6222	Štanjel
00050000-569e-5991-6c18-14eeb8678c27	3220	Štore
00050000-569e-5991-ad07-4bc749c732b8	3304	Tabor
00050000-569e-5991-54d1-ebfe67fdf9e9	3221	Teharje
00050000-569e-5991-52ef-19dec0d2afa7	9251	Tišina
00050000-569e-5991-bf4c-d066e5b84b13	5220	Tolmin
00050000-569e-5991-c5da-d9def9fe558c	3326	Topolšica
00050000-569e-5991-5dc4-8f6fe8e44afc	2371	Trbonje
00050000-569e-5991-7260-a0e3789036dc	1420	Trbovlje
00050000-569e-5991-b414-7b61d2c751ca	8231	Trebelno 
00050000-569e-5991-c3e1-734f6b5d55f3	8210	Trebnje
00050000-569e-5991-6d10-00673d1642e6	5252	Trnovo pri Gorici
00050000-569e-5991-7fde-cf4ec9faaa98	2254	Trnovska vas
00050000-569e-5991-55a4-76f149da798e	1222	Trojane
00050000-569e-5991-6abe-ea2bb362b2bc	1236	Trzin
00050000-569e-5991-f16b-c9dfcdbf6570	4290	Tržič
00050000-569e-5991-6f13-fe110d073976	8295	Tržišče
00050000-569e-5991-983b-905dd7fcedff	1311	Turjak
00050000-569e-5991-090f-c3651a59363e	9224	Turnišče
00050000-569e-5991-9cb0-9eb8141432bf	8323	Uršna sela
00050000-569e-5991-65a7-7339773de945	1252	Vače
00050000-569e-5991-654c-0c697c224447	3320	Velenje 
00050000-569e-5991-1afa-384c7027c3d0	3322	Velenje - poštni predali
00050000-569e-5991-a93f-12e5f2118c2e	8212	Velika Loka
00050000-569e-5991-7435-8cb6a4efed84	2274	Velika Nedelja
00050000-569e-5991-6bf2-f6a3823de666	9225	Velika Polana
00050000-569e-5991-0f6c-47ebe4be37c0	1315	Velike Lašče
00050000-569e-5991-19d0-b8ccee4e6cbd	8213	Veliki Gaber
00050000-569e-5991-5e75-df78f538d662	9241	Veržej
00050000-569e-5991-1f73-78ba6b6c640f	1312	Videm - Dobrepolje
00050000-569e-5991-1f1e-4459e569fbab	2284	Videm pri Ptuju
00050000-569e-5991-3ac0-bd44b7f6c871	8344	Vinica
00050000-569e-5991-5774-130ec9c1281a	5271	Vipava
00050000-569e-5991-b3c3-c5150b031738	4212	Visoko
00050000-569e-5991-809d-50f45b7d2f9e	1294	Višnja Gora
00050000-569e-5991-11b7-808a2d1e1461	3205	Vitanje
00050000-569e-5991-7917-12efe94d1246	2255	Vitomarci
00050000-569e-5991-2167-c57b3a7d6ad5	1217	Vodice
00050000-569e-5991-505c-f16448acb793	3212	Vojnik\t
00050000-569e-5991-7652-0dde35a462cb	5293	Volčja Draga
00050000-569e-5991-2f7b-df80bcc77cab	2232	Voličina
00050000-569e-5991-86e8-2d834aadf416	3305	Vransko
00050000-569e-5991-f4c8-b781f5610803	6217	Vremski Britof
00050000-569e-5991-db7f-d0d6e3c87112	1360	Vrhnika
00050000-569e-5991-dc4a-1e02e2d2a94d	2365	Vuhred
00050000-569e-5991-0c23-5c4cf0919150	2367	Vuzenica
00050000-569e-5991-20e3-87cab091d8e7	8292	Zabukovje 
00050000-569e-5991-1f6b-10d49ca418d9	1410	Zagorje ob Savi
00050000-569e-5991-cb03-a5f2c1e71b9f	1303	Zagradec
00050000-569e-5991-4531-1b54d9b044f0	2283	Zavrč
00050000-569e-5991-4e4a-f4278faf4349	8272	Zdole 
00050000-569e-5991-ed72-ec51619fd590	4201	Zgornja Besnica
00050000-569e-5991-afed-f0799c5effa8	2242	Zgornja Korena
00050000-569e-5991-a713-1161c735700c	2201	Zgornja Kungota
00050000-569e-5991-59e8-4ade691acb9b	2316	Zgornja Ložnica
00050000-569e-5991-aa92-68aee07b0e39	2314	Zgornja Polskava
00050000-569e-5991-455f-89f031b23136	2213	Zgornja Velka
00050000-569e-5991-12a8-58cfd20983f1	4247	Zgornje Gorje
00050000-569e-5991-2f64-1911b5b9c18e	4206	Zgornje Jezersko
00050000-569e-5991-91d2-87f94fa0d14d	2285	Zgornji Leskovec
00050000-569e-5991-71b2-2f4ef16c71a3	1432	Zidani Most
00050000-569e-5991-4ed0-1a6bbfff2715	3214	Zreče
00050000-569e-5991-3b84-7e28e42fbc7e	4209	Žabnica
00050000-569e-5991-643d-38f1c9caaa3b	3310	Žalec
00050000-569e-5991-b776-f1b6b020bc98	4228	Železniki
00050000-569e-5991-8d18-29d7c729de35	2287	Žetale
00050000-569e-5991-700c-1232ece49d1e	4226	Žiri
00050000-569e-5991-3258-9ed9c27918c1	4274	Žirovnica
00050000-569e-5991-bbe7-abc7e917d062	8360	Žužemberk
\.


--
-- TOC entry 3205 (class 0 OID 38157002)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 38156572)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 38156311)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569e-5994-8ea7-7a85b16c403a	00080000-569e-5994-66c2-3a797d54c710	\N	00040000-569e-5991-579f-51aaea1ccae8	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569e-5994-737a-53833d78c011	00080000-569e-5994-66c2-3a797d54c710	\N	00040000-569e-5991-579f-51aaea1ccae8	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569e-5994-0410-e3b0409bc052	00080000-569e-5994-34e2-8cd6ed4b0410	\N	00040000-569e-5991-579f-51aaea1ccae8	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3165 (class 0 OID 38156448)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569e-5991-258d-f0f6ae14d2e9	novo leto	1	1	\N	t
00430000-569e-5991-b392-6466e948ada2	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569e-5991-3dab-7546415edc4a	dan upora proti okupatorju	27	4	\N	t
00430000-569e-5991-10f2-f9c604f3811d	praznik dela	1	5	\N	t
00430000-569e-5991-1f59-5a11cf4fa1d5	praznik dela	2	5	\N	t
00430000-569e-5991-78b8-d13a8ac6163f	dan Primoža Trubarja	8	6	\N	f
00430000-569e-5991-3236-575958753aaa	dan državnosti	25	6	\N	t
00430000-569e-5991-c881-3a87b8916010	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569e-5991-1185-718d1f53dfc9	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569e-5991-1514-6c79c012e585	dan suverenosti	25	10	\N	f
00430000-569e-5991-d8fc-abc0b1c31b46	dan spomina na mrtve	1	11	\N	t
00430000-569e-5991-cd48-2eb1e6cc0903	dan Rudolfa Maistra	23	11	\N	f
00430000-569e-5991-ce9e-b26bccad919d	božič	25	12	\N	t
00430000-569e-5991-0b4a-c0722b32f8a0	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569e-5991-c6b7-6df45d29d26b	Marijino vnebovzetje	15	8	\N	t
00430000-569e-5991-b826-0f92e8fd7096	dan reformacije	31	10	\N	t
00430000-569e-5991-7dec-ea29f397e409	velikonočna nedelja	27	3	2016	t
00430000-569e-5991-e70b-1e3b9d30d71e	velikonočna nedelja	16	4	2017	t
00430000-569e-5991-dc23-44779fb3888f	velikonočna nedelja	1	4	2018	t
00430000-569e-5991-7272-d9e599f67ab6	velikonočna nedelja	21	4	2019	t
00430000-569e-5991-e144-7d56d8afdf0b	velikonočna nedelja	12	4	2020	t
00430000-569e-5991-d6bc-a674c438c7fc	velikonočna nedelja	4	4	2021	t
00430000-569e-5991-e3f3-84b3221c8c1d	velikonočna nedelja	17	4	2022	t
00430000-569e-5991-3464-d45f29366c98	velikonočna nedelja	9	4	2023	t
00430000-569e-5991-4799-f0766126b43d	velikonočna nedelja	31	3	2024	t
00430000-569e-5991-397d-fd239102e70f	velikonočna nedelja	20	4	2025	t
00430000-569e-5991-0a1f-7b082e80b288	velikonočna nedelja	5	4	2026	t
00430000-569e-5991-d8db-bc04057fb398	velikonočna nedelja	28	3	2027	t
00430000-569e-5991-0b37-7db09b057e14	velikonočna nedelja	16	4	2028	t
00430000-569e-5991-2cdb-2a1af161016d	velikonočna nedelja	1	4	2029	t
00430000-569e-5991-8716-261e56590c7a	velikonočna nedelja	21	4	2030	t
00430000-569e-5991-6b02-b7d1bc06b8c1	velikonočni ponedeljek	28	3	2016	t
00430000-569e-5991-f52a-e92892a0f4a2	velikonočni ponedeljek	17	4	2017	t
00430000-569e-5991-1d70-442d1c0efe17	velikonočni ponedeljek	2	4	2018	t
00430000-569e-5991-d3a2-a20c2c30eebb	velikonočni ponedeljek	22	4	2019	t
00430000-569e-5991-109a-5c1095ce089d	velikonočni ponedeljek	13	4	2020	t
00430000-569e-5991-519d-7e13ed1a0429	velikonočni ponedeljek	5	4	2021	t
00430000-569e-5991-9209-b24f37c1fea5	velikonočni ponedeljek	18	4	2022	t
00430000-569e-5991-1fac-22dfa65ec366	velikonočni ponedeljek	10	4	2023	t
00430000-569e-5991-d34c-8a0ca193325b	velikonočni ponedeljek	1	4	2024	t
00430000-569e-5991-ee5c-370fe911e079	velikonočni ponedeljek	21	4	2025	t
00430000-569e-5991-d221-f78088980ec3	velikonočni ponedeljek	6	4	2026	t
00430000-569e-5991-fcb1-d143f7136391	velikonočni ponedeljek	29	3	2027	t
00430000-569e-5991-29f7-556f741ffe4e	velikonočni ponedeljek	17	4	2028	t
00430000-569e-5991-4783-16ebeead1093	velikonočni ponedeljek	2	4	2029	t
00430000-569e-5991-3991-e12cd07f10d5	velikonočni ponedeljek	22	4	2030	t
00430000-569e-5991-d160-3195ac81c05f	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569e-5991-2372-a38f0bc34582	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569e-5991-2cc0-921fdf494d6d	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569e-5991-1216-87c8c0140b18	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569e-5991-49e3-22f3e2f6f91d	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569e-5991-1ee2-d5d167df8f03	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569e-5991-5dbf-6551d5dc843b	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569e-5991-87e1-92a3d1b56cb1	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569e-5991-8975-e22c741c83e1	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569e-5991-a33a-51b4eeceeff5	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569e-5991-db35-7a006b5ab982	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569e-5991-8652-43688881a673	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569e-5991-d88c-cde77f0a9a90	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569e-5991-1973-ebab5e6f9a6a	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569e-5991-f866-53a35d7d83ef	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3161 (class 0 OID 38156415)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569e-5995-615d-57c11fc50607	000e0000-569e-5994-0cbd-1aca785370c4	\N	1	\N	\N
\.


--
-- TOC entry 3162 (class 0 OID 38156423)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 38156584)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 38157016)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 38157026)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569e-5994-87e4-9725d1de608a	00080000-569e-5994-52d4-573ebceb8b1e	0987	AK
00190000-569e-5994-76e2-cabfc257c4af	00080000-569e-5994-34e2-8cd6ed4b0410	0989	AK
00190000-569e-5994-aa15-642ef0dfb407	00080000-569e-5994-d566-77bb882b4856	0986	AK
00190000-569e-5994-413d-ec340bc9ad6e	00080000-569e-5994-8cac-ee76167540bd	0984	AK
00190000-569e-5994-475d-1212f1e2095e	00080000-569e-5994-14d8-4dae6bfec618	0983	AK
00190000-569e-5994-0825-e49d757b7e72	00080000-569e-5994-a62c-139d2fe6bfa3	0982	AK
00190000-569e-5996-387e-58d0f157a7fe	00080000-569e-5996-8751-e2f9a13fa0a0	1001	AK
\.


--
-- TOC entry 3204 (class 0 OID 38156915)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569e-5995-acb6-7fb7ea88b196	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3208 (class 0 OID 38157034)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 38156613)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-569e-5994-cdf4-3e2fec561c83	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-569e-5994-c7bb-27e0ba135083	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-569e-5994-6f19-778ef322a906	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-569e-5994-10e7-aacaae4a4fc7	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-569e-5994-9718-88880bdc3bea	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-569e-5994-d9e1-0f9e24e2cb43	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-569e-5994-b0db-27198a56718b	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3176 (class 0 OID 38156557)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 38156547)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 38156754)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 38156684)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 38156389)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 38156151)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569e-5996-8751-e2f9a13fa0a0	00010000-569e-5992-d720-86a15a5435b1	2016-01-19 16:43:18	INS	a:0:{}
2	App\\Entity\\Option	00000000-569e-5996-9c72-b6f3f8a2cfa7	00010000-569e-5992-d720-86a15a5435b1	2016-01-19 16:43:18	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569e-5996-387e-58d0f157a7fe	00010000-569e-5992-d720-86a15a5435b1	2016-01-19 16:43:18	INS	a:0:{}
\.


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3185 (class 0 OID 38156626)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 38156189)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569e-5992-d95a-a5c00e727b06	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569e-5992-62f5-87bdaff716ec	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569e-5992-ff0e-420fe03d0b81	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569e-5992-c86d-2610901d01a2	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569e-5992-14fd-3302627312ee	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569e-5992-dbe4-157445a50566	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569e-5992-be54-5a26062c248d	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569e-5992-5d32-009c1d176440	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569e-5992-6217-c790b053adfe	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569e-5992-cf7a-308086ccd976	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569e-5992-31c1-6113596a5249	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569e-5992-3418-78883777d824	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569e-5992-54f2-b21e42a18649	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569e-5992-287b-9b38fa9c7013	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569e-5992-2424-41e802b58569	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569e-5992-8c91-c0c6f8434a68	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569e-5992-9d2a-5c017daadb35	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569e-5992-724b-43f0cf8aecbe	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569e-5992-d370-6497e14554ee	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569e-5992-99d3-d33298ae70ee	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569e-5992-05a6-43b026c2ced2	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569e-5992-f65a-0a4d74f7c3ea	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569e-5992-140c-cfddd42e3d2a	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569e-5992-b947-a9fc400b3285	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569e-5992-03da-c4e603daeb2a	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569e-5992-3231-29cbd12fb97f	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569e-5992-1adb-4821bb0b1f68	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569e-5992-decc-3e22abc8024a	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569e-5992-0395-7e9aa6c72c37	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569e-5992-0c8d-1f56109a5e95	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569e-5992-b66b-e3309b81d510	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569e-5992-ac52-d98ef9adcec0	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569e-5992-774f-0baea91d517b	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569e-5992-e7d4-f70fb7ed7ed4	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569e-5992-d49d-a0a68e24ec94	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569e-5992-5f18-616d4e75393f	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569e-5992-bcd6-66427f242fa9	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569e-5992-978f-362c4a5d936a	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569e-5992-8d02-b77fbf98652e	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569e-5992-6dc3-166d93629de9	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569e-5992-2800-843e60af4483	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569e-5992-79c0-ddc59c2c359f	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569e-5992-93c8-84f489be21f9	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569e-5992-e2dc-e8c2e3976bdf	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569e-5992-7148-8d33eac41ba7	direktor	minimalne pravice za direktorja	t
00020000-569e-5992-4466-82e3f34b9534	arhivar	arhivar	t
00020000-569e-5992-033b-d1f2405c3560	dramaturg	dramaturg	t
00020000-569e-5992-d4d6-9e54d10019cd	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569e-5992-d64a-a84e01407e09	poslovni-sekretar	poslovni sekretar	t
00020000-569e-5992-ff86-28569580efb9	vodja-tehnike	vodja tehnike	t
00020000-569e-5992-70e7-dd9d795e1769	racunovodja	računovodja	t
00020000-569e-5994-7b4c-a3fbb4bac141	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569e-5994-578d-0f64aa384c38	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-6f8c-a56167cade3c	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-f986-484ef9d5c4a4	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-c2a5-a4ccae641850	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-26eb-b62673b6f32a	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-7a0c-7144c1db2982	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-3a4d-957cede82ddf	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569e-5994-04b6-4b666762e504	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569e-5994-eb16-221d57d5e8b5	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-2ce1-081b66b1c000	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-9be0-a9cc86ca1167	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-4247-48bbd21c589d	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-42e3-4bb94a3457cd	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-c4be-774abc05a754	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-abd5-acb35be161a0	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-2ea8-d42ee164c78f	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-a29b-fb818ee071ed	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-1da7-e0f6c643bfd9	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-caed-6e4ed3ead4a8	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569e-5994-71d1-e80fdaeb9613	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-1bbb-177c0bc36d84	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-ed74-7f12f11c72cf	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-a259-f88dfa6e143a	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-bbcf-32a9ed208ccb	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-177e-72e13c9e485f	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-b36e-2ac1fbc11b67	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-fa67-7adc8107d4f9	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-cf07-d712593cf1f4	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-7df6-1723b8073a31	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-10d7-d227c98f61f1	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-2fac-42104a9e157c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-5175-be55d3a8ad3e	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-0952-574289288bbe	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-52c8-a972233f7c59	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-0b39-ed55d9e17156	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569e-5994-7038-59a0211869e5	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569e-5994-80f8-edc9833a3d66	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569e-5994-6100-507ae193a0a3	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3140 (class 0 OID 38156173)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569e-5992-927c-32d664d52076	00020000-569e-5992-ff0e-420fe03d0b81
00010000-569e-5992-d720-86a15a5435b1	00020000-569e-5992-ff0e-420fe03d0b81
00010000-569e-5994-e947-788346be7157	00020000-569e-5994-7b4c-a3fbb4bac141
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-578d-0f64aa384c38
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-26eb-b62673b6f32a
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-eb16-221d57d5e8b5
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-9be0-a9cc86ca1167
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-42e3-4bb94a3457cd
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-1da7-e0f6c643bfd9
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-f986-484ef9d5c4a4
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-71d1-e80fdaeb9613
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-a259-f88dfa6e143a
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-177e-72e13c9e485f
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-fa67-7adc8107d4f9
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-7df6-1723b8073a31
00010000-569e-5994-9c38-23544f85ccac	00020000-569e-5994-0952-574289288bbe
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-578d-0f64aa384c38
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-6f8c-a56167cade3c
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-f986-484ef9d5c4a4
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-c2a5-a4ccae641850
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-42e3-4bb94a3457cd
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-2ea8-d42ee164c78f
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-71d1-e80fdaeb9613
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-a259-f88dfa6e143a
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-177e-72e13c9e485f
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-fa67-7adc8107d4f9
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-7df6-1723b8073a31
00010000-569e-5994-19ec-acd0eff4a9d6	00020000-569e-5994-0952-574289288bbe
00010000-569e-5994-c384-c8250c07b3b5	00020000-569e-5994-578d-0f64aa384c38
00010000-569e-5994-c384-c8250c07b3b5	00020000-569e-5994-6f8c-a56167cade3c
00010000-569e-5994-c384-c8250c07b3b5	00020000-569e-5994-f986-484ef9d5c4a4
00010000-569e-5994-c384-c8250c07b3b5	00020000-569e-5994-c2a5-a4ccae641850
00010000-569e-5994-c384-c8250c07b3b5	00020000-569e-5994-9be0-a9cc86ca1167
00010000-569e-5994-c384-c8250c07b3b5	00020000-569e-5994-42e3-4bb94a3457cd
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-6f8c-a56167cade3c
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-7a0c-7144c1db2982
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-2ce1-081b66b1c000
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-4247-48bbd21c589d
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-9be0-a9cc86ca1167
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-a29b-fb818ee071ed
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-42e3-4bb94a3457cd
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-c4be-774abc05a754
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-71d1-e80fdaeb9613
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-1bbb-177c0bc36d84
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-a259-f88dfa6e143a
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-bbcf-32a9ed208ccb
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-177e-72e13c9e485f
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-b36e-2ac1fbc11b67
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-fa67-7adc8107d4f9
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-cf07-d712593cf1f4
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-7df6-1723b8073a31
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-10d7-d227c98f61f1
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-0952-574289288bbe
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-52c8-a972233f7c59
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-7038-59a0211869e5
00010000-569e-5994-bfa0-daef5aaa6a80	00020000-569e-5994-80f8-edc9833a3d66
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-6f8c-a56167cade3c
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-7a0c-7144c1db2982
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-04b6-4b666762e504
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-2ce1-081b66b1c000
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-4247-48bbd21c589d
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-9be0-a9cc86ca1167
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-a29b-fb818ee071ed
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-42e3-4bb94a3457cd
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-c4be-774abc05a754
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-abd5-acb35be161a0
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-71d1-e80fdaeb9613
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-1bbb-177c0bc36d84
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-ed74-7f12f11c72cf
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-a259-f88dfa6e143a
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-bbcf-32a9ed208ccb
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-177e-72e13c9e485f
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-b36e-2ac1fbc11b67
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-fa67-7adc8107d4f9
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-cf07-d712593cf1f4
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-7df6-1723b8073a31
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-10d7-d227c98f61f1
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-0952-574289288bbe
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-52c8-a972233f7c59
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-0b39-ed55d9e17156
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-7038-59a0211869e5
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-80f8-edc9833a3d66
00010000-569e-5994-20fd-0dad94494142	00020000-569e-5994-6100-507ae193a0a3
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-6f8c-a56167cade3c
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-f986-484ef9d5c4a4
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-7a0c-7144c1db2982
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-3a4d-957cede82ddf
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-04b6-4b666762e504
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-26eb-b62673b6f32a
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-2ce1-081b66b1c000
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-4247-48bbd21c589d
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-9be0-a9cc86ca1167
00010000-569e-5994-6c92-50163d8b5505	00020000-569e-5994-a29b-fb818ee071ed
00010000-569e-5994-0985-e35c49d19767	00020000-569e-5994-578d-0f64aa384c38
00010000-569e-5994-0985-e35c49d19767	00020000-569e-5994-c2a5-a4ccae641850
00010000-569e-5994-0985-e35c49d19767	00020000-569e-5994-26eb-b62673b6f32a
00010000-569e-5994-0985-e35c49d19767	00020000-569e-5994-eb16-221d57d5e8b5
00010000-569e-5994-0985-e35c49d19767	00020000-569e-5994-9be0-a9cc86ca1167
00010000-569e-5994-0985-e35c49d19767	00020000-569e-5994-42e3-4bb94a3457cd
00010000-569e-5994-0985-e35c49d19767	00020000-569e-5994-1da7-e0f6c643bfd9
00010000-569e-5994-0985-e35c49d19767	00020000-569e-5994-2fac-42104a9e157c
00010000-569e-5994-8f79-8ae69c020f98	00020000-569e-5994-caed-6e4ed3ead4a8
00010000-569e-5994-025d-9fe82ddd2297	00020000-569e-5992-7148-8d33eac41ba7
00010000-569e-5994-4a9d-00b213918409	00020000-569e-5992-4466-82e3f34b9534
00010000-569e-5994-a3c6-55aeaf073a98	00020000-569e-5992-033b-d1f2405c3560
00010000-569e-5994-9eb9-3dc9ae2d46ed	00020000-569e-5992-d4d6-9e54d10019cd
00010000-569e-5994-2707-450a02dd2504	00020000-569e-5992-d64a-a84e01407e09
00010000-569e-5994-36fc-0ff8a7c68d88	00020000-569e-5992-ff86-28569580efb9
00010000-569e-5994-105c-75853c3bbdf8	00020000-569e-5992-70e7-dd9d795e1769
\.


--
-- TOC entry 3187 (class 0 OID 38156640)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 38156578)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 38156501)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569e-5994-9a25-3454be739cc6	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569e-5994-f4bf-eea0f3137173	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569e-5994-35c1-caeeff17a862	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3136 (class 0 OID 38156138)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569e-5991-52f5-871ac9181c86	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569e-5991-1587-9d8161a51aba	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569e-5991-e686-67a81c0b883d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569e-5991-d524-e2c6939afadc	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569e-5991-449d-503320d65888	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3135 (class 0 OID 38156130)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569e-5991-c541-5f143249f471	00230000-569e-5991-d524-e2c6939afadc	popa
00240000-569e-5991-4408-0a1421e43447	00230000-569e-5991-d524-e2c6939afadc	oseba
00240000-569e-5991-c6d2-d8087891db5b	00230000-569e-5991-d524-e2c6939afadc	tippopa
00240000-569e-5991-3dd7-123d2473d457	00230000-569e-5991-d524-e2c6939afadc	organizacijskaenota
00240000-569e-5991-53c5-57f75831ce0a	00230000-569e-5991-d524-e2c6939afadc	sezona
00240000-569e-5991-2865-25845c558fcc	00230000-569e-5991-d524-e2c6939afadc	tipvaje
00240000-569e-5991-5cfd-efc1bace119d	00230000-569e-5991-d524-e2c6939afadc	tipdodatka
00240000-569e-5991-ceaa-822a01e8f542	00230000-569e-5991-1587-9d8161a51aba	prostor
00240000-569e-5991-78e1-8d041580dd8a	00230000-569e-5991-d524-e2c6939afadc	besedilo
00240000-569e-5991-fed3-dfcbf50e4468	00230000-569e-5991-d524-e2c6939afadc	uprizoritev
00240000-569e-5991-6c48-05e089a0467e	00230000-569e-5991-d524-e2c6939afadc	funkcija
00240000-569e-5991-a99b-9d974893f2ba	00230000-569e-5991-d524-e2c6939afadc	tipfunkcije
00240000-569e-5991-af7b-8eb2232be3f5	00230000-569e-5991-d524-e2c6939afadc	alternacija
00240000-569e-5991-a875-a3e90904a049	00230000-569e-5991-52f5-871ac9181c86	pogodba
00240000-569e-5991-3629-4ea30314b79d	00230000-569e-5991-d524-e2c6939afadc	zaposlitev
00240000-569e-5991-79a2-2f5479a93d87	00230000-569e-5991-d524-e2c6939afadc	zvrstuprizoritve
00240000-569e-5991-8f91-73cae9014c58	00230000-569e-5991-52f5-871ac9181c86	programdela
00240000-569e-5991-d9ab-bf2d36dd0e14	00230000-569e-5991-d524-e2c6939afadc	zapis
\.


--
-- TOC entry 3134 (class 0 OID 38156125)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5dc542bc-a04b-4589-85b9-220163b1dc9c	00240000-569e-5991-c541-5f143249f471	0	1001
\.


--
-- TOC entry 3193 (class 0 OID 38156701)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569e-5995-7969-9d9d023c3360	000e0000-569e-5994-0cbd-1aca785370c4	00080000-569e-5994-66c2-3a797d54c710	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569e-5991-8170-46b6bcd7f00f
00270000-569e-5995-b72c-c8d7ea5f4229	000e0000-569e-5994-0cbd-1aca785370c4	00080000-569e-5994-66c2-3a797d54c710	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569e-5991-8170-46b6bcd7f00f
\.


--
-- TOC entry 3150 (class 0 OID 38156273)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 38156520)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569e-5995-ee32-7eb2fb039cf9	00180000-569e-5995-df2f-3582750f7786	000c0000-569e-5995-405f-99573fd44731	00090000-569e-5994-41a3-eec4b6a136c1	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-5995-5710-1b01de450c4b	00180000-569e-5995-df2f-3582750f7786	000c0000-569e-5995-799d-e50bb29e8cd2	00090000-569e-5994-e892-383dc65d6c74	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-5995-48d5-fee5406199ef	00180000-569e-5995-df2f-3582750f7786	000c0000-569e-5995-4cc4-48776a31723b	00090000-569e-5994-8d58-288c599b5116	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-5995-6859-0c71bae9962f	00180000-569e-5995-df2f-3582750f7786	000c0000-569e-5995-19d1-d09c310d5f62	00090000-569e-5994-8fd8-8cd6fe21683c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-5995-acbd-1fff615e22b0	00180000-569e-5995-df2f-3582750f7786	000c0000-569e-5995-33fe-16573f648fa3	00090000-569e-5994-3957-1f6303356ede	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569e-5995-d4cb-1228676d09ff	00180000-569e-5995-799c-edcfa5ea3f7c	\N	00090000-569e-5994-3957-1f6303356ede	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569e-5995-d6de-8595271b45cf	00180000-569e-5995-3503-7550e06195ab	\N	00090000-569e-5994-e892-383dc65d6c74	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-569e-5995-197f-456288a64fc6	00180000-569e-5995-df2f-3582750f7786	\N	00090000-569e-5994-c7f9-fb2fb7fb3299	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 38156537)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569e-5991-d895-984e457ece9c	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569e-5991-bc00-7fd32c488d7f	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569e-5991-8ce5-92e7c96b9f7b	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569e-5991-6fe4-cae029102400	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569e-5991-434a-527edff75842	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569e-5991-e596-293a6da5663b	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3196 (class 0 OID 38156742)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569e-5991-519a-f40135c082f7	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569e-5991-3d58-457f1b9ef323	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569e-5991-5d17-6001f2682654	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569e-5991-3567-1e02fe5da373	04	Režija	Režija	Režija	umetnik	30
000f0000-569e-5991-b6ca-ebca731f432c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569e-5991-90b4-3ec3df0da1b0	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569e-5991-07f4-a3089f76c8e0	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569e-5991-c309-3250448507a0	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569e-5991-5425-0eab161e6d0b	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569e-5991-8956-5cd95a1ebb0c	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569e-5991-0751-ba8fd6aaf57b	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569e-5991-d967-dab26018c895	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569e-5991-c6e5-2e7d68e19d7f	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569e-5991-9434-5c68416bc980	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569e-5991-6b58-a68c49e333b5	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569e-5991-7638-b79c7b858b4d	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569e-5991-9791-1c140b424569	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569e-5991-1b86-78efa27a602c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569e-5991-ca11-c423d75e4711	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3147 (class 0 OID 38156224)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569e-5994-80d7-392f90861b1c	0001	šola	osnovna ali srednja šola
00400000-569e-5994-ca14-97c52117fe21	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569e-5994-fcea-6a999fd46391	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3209 (class 0 OID 38157046)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569e-5991-dbeb-8c2d940d2148	01	Velika predstava	f	1.00	1.00
002b0000-569e-5991-5eb1-e30a7bfbd523	02	Mala predstava	f	0.50	0.50
002b0000-569e-5991-f4a5-9557a58a3aaf	03	Mala koprodukcija	t	0.40	1.00
002b0000-569e-5991-6f34-a3a38ae3a8fc	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569e-5991-8d48-381c8f1bedc5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3169 (class 0 OID 38156491)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569e-5991-c2d5-0ab78a8a5c67	0001	prva vaja	prva vaja
00420000-569e-5991-d0fe-3dff72c1b0a9	0002	tehnična vaja	tehnična vaja
00420000-569e-5991-9154-c77bb1fe4abe	0003	lučna vaja	lučna vaja
00420000-569e-5991-2872-e10f1f785970	0004	kostumska vaja	kostumska vaja
00420000-569e-5991-82c8-da3d939e1608	0005	foto vaja	foto vaja
00420000-569e-5991-6d93-f98c6f8ce732	0006	1. glavna vaja	1. glavna vaja
00420000-569e-5991-8be9-53ebe599cb86	0007	2. glavna vaja	2. glavna vaja
00420000-569e-5991-4dca-97ea1385cb6a	0008	1. generalka	1. generalka
00420000-569e-5991-e82c-eaf57f45380f	0009	2. generalka	2. generalka
00420000-569e-5991-5fbe-64a832515fbb	0010	odprta generalka	odprta generalka
00420000-569e-5991-bc77-206bad985a8a	0011	obnovitvena vaja	obnovitvena vaja
00420000-569e-5991-7301-a8e2b4129778	0012	italijanka	krajša "obnovitvena" vaja
00420000-569e-5991-4f1b-81bf650543bf	0013	pevska vaja	pevska vaja
00420000-569e-5991-eca1-b84f868395d6	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569e-5991-763e-c8a89e2a8780	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569e-5991-9556-f2170cfc6a97	0016	orientacijska vaja	orientacijska vaja
00420000-569e-5991-1675-8373d8b85f74	0017	situacijska vaja	situacijska vaja
00420000-569e-5991-e958-66b63afbf160	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3156 (class 0 OID 38156346)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 38156160)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569e-5992-d720-86a15a5435b1	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROmItAANhaHfcxHt5CPrbUHx6k91csCK2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569e-5994-81f7-d299f2f0a3d3	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569e-5994-28e4-124fb3ab14b4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569e-5994-89a5-faf4b42a5efd	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569e-5994-86bd-91bab665f506	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569e-5994-c6a7-3f59d35f63ec	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569e-5994-4a2a-d425b942cf85	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569e-5994-493e-5b8ce58f2be4	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569e-5994-05de-221b1a6241f9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569e-5994-5a0c-c92f555098a4	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569e-5994-e947-788346be7157	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569e-5994-fd03-abc8e3ee0b91	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569e-5994-9c38-23544f85ccac	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569e-5994-19ec-acd0eff4a9d6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569e-5994-c384-c8250c07b3b5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569e-5994-bfa0-daef5aaa6a80	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569e-5994-20fd-0dad94494142	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569e-5994-6c92-50163d8b5505	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569e-5994-0985-e35c49d19767	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569e-5994-8f79-8ae69c020f98	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569e-5994-025d-9fe82ddd2297	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569e-5994-4a9d-00b213918409	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569e-5994-a3c6-55aeaf073a98	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569e-5994-9eb9-3dc9ae2d46ed	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569e-5994-2707-450a02dd2504	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569e-5994-36fc-0ff8a7c68d88	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569e-5994-105c-75853c3bbdf8	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569e-5992-927c-32d664d52076	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3200 (class 0 OID 38156792)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569e-5994-8191-e9630010f5b7	00160000-569e-5994-b325-cd24c799c664	\N	00140000-569e-5991-4253-aeca8e492f11	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569e-5994-9718-88880bdc3bea
000e0000-569e-5994-0cbd-1aca785370c4	00160000-569e-5994-c882-1ba825772299	\N	00140000-569e-5991-4110-c808dc20e52f	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569e-5994-d9e1-0f9e24e2cb43
000e0000-569e-5994-2823-4fd6fdc2e92c	\N	\N	00140000-569e-5991-4110-c808dc20e52f	00190000-569e-5994-87e4-9725d1de608a	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569e-5994-9718-88880bdc3bea
000e0000-569e-5994-7125-e1514c0355ea	\N	\N	00140000-569e-5991-4110-c808dc20e52f	00190000-569e-5994-87e4-9725d1de608a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569e-5994-9718-88880bdc3bea
000e0000-569e-5994-198d-e179be2ffce1	\N	\N	00140000-569e-5991-4110-c808dc20e52f	00190000-569e-5994-87e4-9725d1de608a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5994-3e31-a050c02b9b5a	\N	\N	00140000-569e-5991-4110-c808dc20e52f	00190000-569e-5994-87e4-9725d1de608a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5994-f9b1-b8a1451e2399	\N	\N	00140000-569e-5991-ae48-106675b3564e	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5994-4a44-01e0b9cfb56e	\N	\N	00140000-569e-5991-ae48-106675b3564e	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5994-4e17-fb04500e0878	\N	\N	00140000-569e-5991-ae48-106675b3564e	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5994-dab6-c39d957b8701	\N	\N	00140000-569e-5991-ae48-106675b3564e	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5994-d835-fc1581fe1ee1	\N	\N	00140000-569e-5991-ae48-106675b3564e	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5994-5f79-c52a1d5a3382	\N	\N	00140000-569e-5991-ae48-106675b3564e	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5994-bfa2-13e945ddd589	\N	\N	00140000-569e-5991-ae48-106675b3564e	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5994-5c86-0d567fb533c9	\N	\N	00140000-569e-5991-ae48-106675b3564e	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
000e0000-569e-5995-e6b9-107b82c10f00	\N	\N	00140000-569e-5991-ae48-106675b3564e	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569e-5994-cdf4-3e2fec561c83
\.


--
-- TOC entry 3171 (class 0 OID 38156511)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 38156441)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569e-5995-264f-c313778e1c4b	\N	000e0000-569e-5994-0cbd-1aca785370c4	1
00200000-569e-5995-0ab0-c0c71d8ae977	\N	000e0000-569e-5994-0cbd-1aca785370c4	2
00200000-569e-5995-2613-5e7f999e9ba5	\N	000e0000-569e-5994-0cbd-1aca785370c4	3
00200000-569e-5995-b96f-a241612847dc	\N	000e0000-569e-5994-0cbd-1aca785370c4	4
00200000-569e-5995-4482-36cb5c54a10b	\N	000e0000-569e-5994-0cbd-1aca785370c4	5
\.


--
-- TOC entry 3183 (class 0 OID 38156605)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 38156715)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569e-5991-e3d0-34515b3c8c79	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569e-5991-7d86-f1c244598f4c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569e-5991-4600-75685eb7f9a6	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569e-5991-5281-7f06eb51679b	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569e-5991-dd8a-814bd2e5a95d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569e-5991-68c5-bcb9bf0dd673	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569e-5991-bb74-263fd348de37	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569e-5991-7520-cec3e1de6139	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569e-5991-8170-46b6bcd7f00f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569e-5991-4147-32dbf255b608	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569e-5991-fa81-4505988c1a1a	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569e-5991-ac3e-15386878f6be	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569e-5991-e6e3-32bb61686bc1	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569e-5991-f803-add8a0bfac30	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569e-5991-6605-7f1c340fee93	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569e-5991-afa7-07ec63ac572a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569e-5991-af5d-68018d14d559	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569e-5991-860e-356ea73fbb96	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569e-5991-e644-a6f91ba80c28	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569e-5991-ebd2-d09aa38b218f	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569e-5991-77ec-7f481bc8fe04	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569e-5991-af30-5335a8e5d75c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569e-5991-12c6-eb6aff844c8a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569e-5991-f9e5-0db8c292a6b7	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569e-5991-7cc9-3cfe8b415aad	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569e-5991-810f-b742274b4671	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569e-5991-307d-6048c52982cc	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569e-5991-58ce-07a218b8d9ab	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3212 (class 0 OID 38157096)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 38157065)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 38157108)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 38156677)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569e-5994-0f88-fa7f1df3582c	00090000-569e-5994-e892-383dc65d6c74	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-5994-950a-86bc5ea8a915	00090000-569e-5994-8d58-288c599b5116	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-5994-0563-a40a66bd8a15	00090000-569e-5994-4c75-4eb0d9babd9c	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-5994-8671-0455ab25d226	00090000-569e-5994-759a-5ca04e195b7c	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-5994-45aa-50614c2e03d3	00090000-569e-5994-e380-4f5e928a5a89	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569e-5994-8162-9865258cfeab	00090000-569e-5994-b581-9ccccfee5b26	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3133 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 38156782)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569e-5991-4253-aeca8e492f11	01	Drama	drama (SURS 01)
00140000-569e-5991-7260-99c15280fc86	02	Opera	opera (SURS 02)
00140000-569e-5991-8040-7ffa3e3dd24c	03	Balet	balet (SURS 03)
00140000-569e-5991-bba0-071b55f11de0	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569e-5991-ae48-106675b3564e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569e-5991-4110-c808dc20e52f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569e-5991-b1f5-ac1285f9df1c	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3189 (class 0 OID 38156667)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 38156223)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 38156840)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 38156831)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 38156214)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 38156698)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 38156740)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 38157149)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 38156534)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 38156470)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 38156485)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 38156490)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 38157063)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 38156372)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 38156909)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 38156663)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 38156439)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 38156410)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 38156386)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 38156570)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 38157126)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 38157133)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 38157157)
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
-- TOC entry 2766 (class 2606 OID 38156597)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 38156344)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 38156242)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 38156306)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 38156269)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 38156203)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 38156188)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 38156603)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 38156639)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 38156777)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 38156297)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 38156332)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 38157014)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 38156576)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 38156322)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 38156455)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 38156427)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 38156420)
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
-- TOC entry 2764 (class 2606 OID 38156588)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 38157023)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 38157031)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 38157001)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 38157044)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 38156621)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 38156561)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 38156552)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 38156764)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 38156691)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 38156398)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 38156159)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 38156630)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 38156177)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 38156197)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 38156648)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 38156583)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 38156509)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 38156147)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 38156135)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 38156129)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 38156711)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 38156278)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 38156526)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 38156544)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 38156751)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 38156231)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 38157056)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 38156498)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 38156357)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 38156172)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 38156810)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 38156517)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 38156445)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 38156611)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 38156723)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 38157106)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 38157090)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 38157114)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 38156681)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 38156790)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 38156675)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 38156479)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 38156480)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 38156478)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 38156477)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 38156476)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 38156712)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 38156713)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 38156714)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 38157128)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 38157127)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 38156299)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 38156300)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 38156604)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 38157094)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 38157093)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 38157095)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 38157092)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 38157091)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2761 (class 1259 OID 38156590)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2762 (class 1259 OID 38156589)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 38156446)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 38156447)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 38156664)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 38156666)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 38156665)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 38156388)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 38156387)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 38157045)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 38156779)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 38156780)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 38156781)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 38157115)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 38156815)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 38156812)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 38156816)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 38156814)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 38156813)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 38156359)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 38156358)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 38156272)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 38156631)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 38156204)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 38156205)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 38156651)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 38156650)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 38156649)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 38156309)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 38156308)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 38156310)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 38156421)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 38156422)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 38156137)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2741 (class 1259 OID 38156556)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2742 (class 1259 OID 38156554)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2743 (class 1259 OID 38156553)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2744 (class 1259 OID 38156555)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 38156178)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 38156179)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 38156612)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 38157150)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 38156700)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 38156699)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 38157158)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 38157159)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2756 (class 1259 OID 38156577)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 38156692)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 38156693)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 38156914)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 38156913)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 38156910)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 38156911)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 38156912)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 38156324)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 38156323)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 38156325)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 38156625)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 38156624)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 38157024)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 38157025)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 38156844)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 38156845)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 38156842)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 38156843)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2735 (class 1259 OID 38156535)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2736 (class 1259 OID 38156536)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 38156682)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 38156683)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2724 (class 1259 OID 38156518)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 38156565)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2748 (class 1259 OID 38156564)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2749 (class 1259 OID 38156562)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2750 (class 1259 OID 38156563)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 38156832)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 38156399)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 38156413)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 38156412)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 38156411)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 38156414)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 38156440)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 38156428)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 38156429)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 38157015)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 38157064)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 38157134)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 38157135)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 38156244)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 38156243)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 38156279)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 38156280)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2728 (class 1259 OID 38156529)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 38156528)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2730 (class 1259 OID 38156527)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2708 (class 1259 OID 38156472)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2709 (class 1259 OID 38156475)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2710 (class 1259 OID 38156471)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2711 (class 1259 OID 38156474)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2712 (class 1259 OID 38156473)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 38156298)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 38156232)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 38156233)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 38156373)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 38156375)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 38156374)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 38156376)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2755 (class 1259 OID 38156571)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 38156778)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 38156811)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 38156752)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 38156753)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 38156270)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 38156271)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2739 (class 1259 OID 38156545)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2740 (class 1259 OID 38156546)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 38156676)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 38156148)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 38156345)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 38156307)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 38156136)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 38157057)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 38156623)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 38156622)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 38156499)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 38156500)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 38156841)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2725 (class 1259 OID 38156519)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 38156333)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 38156791)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 38157107)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 38157032)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 38157033)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 38156741)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2723 (class 1259 OID 38156510)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 38156198)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 38157325)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 38157350)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 38157340)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 38157320)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 38157335)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 38157345)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 38157330)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2986 (class 2606 OID 38157535)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2985 (class 2606 OID 38157540)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2984 (class 2606 OID 38157545)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3017 (class 2606 OID 38157705)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3018 (class 2606 OID 38157700)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 38157215)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 38157220)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 38157450)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3012 (class 2606 OID 38157685)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 38157680)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3011 (class 2606 OID 38157690)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3014 (class 2606 OID 38157675)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3015 (class 2606 OID 38157670)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 38157445)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2966 (class 2606 OID 38157440)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 38157310)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 38157315)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 38157490)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 38157500)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2976 (class 2606 OID 38157495)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 38157270)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 38157265)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 38157430)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 38157660)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2989 (class 2606 OID 38157550)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 38157555)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2987 (class 2606 OID 38157560)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3016 (class 2606 OID 38157695)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2991 (class 2606 OID 38157580)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2994 (class 2606 OID 38157565)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2990 (class 2606 OID 38157585)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2992 (class 2606 OID 38157575)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2993 (class 2606 OID 38157570)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 38157260)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 38157255)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 38157200)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 38157195)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 38157470)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 38157175)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 38157180)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2972 (class 2606 OID 38157485)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2973 (class 2606 OID 38157480)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2974 (class 2606 OID 38157475)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 38157230)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 38157225)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 38157235)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 38157285)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 38157290)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 38157160)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 38157405)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 38157395)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 38157390)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 38157400)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 38157165)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 38157170)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2968 (class 2606 OID 38157455)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3021 (class 2606 OID 38157720)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2982 (class 2606 OID 38157530)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2983 (class 2606 OID 38157525)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3023 (class 2606 OID 38157725)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3022 (class 2606 OID 38157730)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 38157435)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2981 (class 2606 OID 38157515)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2980 (class 2606 OID 38157520)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3000 (class 2606 OID 38157635)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3001 (class 2606 OID 38157630)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3004 (class 2606 OID 38157615)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 38157620)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3002 (class 2606 OID 38157625)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 38157245)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 38157240)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 38157250)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 38157465)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2970 (class 2606 OID 38157460)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3007 (class 2606 OID 38157645)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3006 (class 2606 OID 38157650)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 38157605)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2996 (class 2606 OID 38157610)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2999 (class 2606 OID 38157595)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2998 (class 2606 OID 38157600)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 38157380)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 38157385)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2979 (class 2606 OID 38157505)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2978 (class 2606 OID 38157510)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 38157355)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 38157360)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 38157425)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 38157420)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 38157410)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 38157415)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2995 (class 2606 OID 38157590)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 38157275)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 38157280)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 38157305)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 38157295)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 38157300)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3005 (class 2606 OID 38157640)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3008 (class 2606 OID 38157655)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 38157665)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3020 (class 2606 OID 38157710)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 38157715)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 38157190)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 38157185)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 38157205)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 38157210)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 38157375)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 38157370)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 38157365)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-19 16:43:20 CET

--
-- PostgreSQL database dump complete
--

