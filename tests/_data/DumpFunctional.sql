--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-18 12:12:54 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 37344308)
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
-- TOC entry 241 (class 1259 OID 37344927)
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
-- TOC entry 240 (class 1259 OID 37344911)
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
-- TOC entry 184 (class 1259 OID 37344301)
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
-- TOC entry 183 (class 1259 OID 37344299)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 37344788)
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
-- TOC entry 234 (class 1259 OID 37344818)
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
-- TOC entry 255 (class 1259 OID 37345230)
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
-- TOC entry 212 (class 1259 OID 37344624)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 37344550)
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
-- TOC entry 206 (class 1259 OID 37344575)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 37344580)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 37345152)
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
-- TOC entry 196 (class 1259 OID 37344453)
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
-- TOC entry 242 (class 1259 OID 37344940)
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
-- TOC entry 227 (class 1259 OID 37344746)
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
-- TOC entry 202 (class 1259 OID 37344524)
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
-- TOC entry 199 (class 1259 OID 37344493)
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
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 37344470)
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
-- TOC entry 216 (class 1259 OID 37344660)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 37345210)
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
-- TOC entry 254 (class 1259 OID 37345223)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 37345245)
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
-- TOC entry 220 (class 1259 OID 37344685)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 37344427)
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
-- TOC entry 187 (class 1259 OID 37344327)
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
-- TOC entry 191 (class 1259 OID 37344394)
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
-- TOC entry 188 (class 1259 OID 37344338)
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
-- TOC entry 180 (class 1259 OID 37344273)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 37344292)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 37344692)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 37344726)
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
-- TOC entry 237 (class 1259 OID 37344859)
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
-- TOC entry 190 (class 1259 OID 37344374)
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
-- TOC entry 193 (class 1259 OID 37344419)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 37345096)
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
-- TOC entry 217 (class 1259 OID 37344666)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 37344404)
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
-- TOC entry 204 (class 1259 OID 37344542)
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
-- TOC entry 200 (class 1259 OID 37344508)
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
-- TOC entry 201 (class 1259 OID 37344517)
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
-- TOC entry 219 (class 1259 OID 37344678)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 37345110)
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
-- TOC entry 246 (class 1259 OID 37345120)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 37345009)
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
-- TOC entry 247 (class 1259 OID 37345128)
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
-- TOC entry 223 (class 1259 OID 37344707)
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
-- TOC entry 215 (class 1259 OID 37344651)
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
-- TOC entry 214 (class 1259 OID 37344641)
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
-- TOC entry 236 (class 1259 OID 37344848)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 37344778)
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
-- TOC entry 198 (class 1259 OID 37344482)
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
-- TOC entry 177 (class 1259 OID 37344244)
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
-- TOC entry 176 (class 1259 OID 37344242)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 37344720)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 37344282)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 37344266)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 37344734)
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
-- TOC entry 218 (class 1259 OID 37344672)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 37344595)
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
-- TOC entry 175 (class 1259 OID 37344231)
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
-- TOC entry 174 (class 1259 OID 37344223)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 37344218)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 37344795)
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
-- TOC entry 189 (class 1259 OID 37344366)
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
-- TOC entry 211 (class 1259 OID 37344614)
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
-- TOC entry 213 (class 1259 OID 37344631)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 37344836)
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
-- TOC entry 186 (class 1259 OID 37344317)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 37345140)
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
-- TOC entry 208 (class 1259 OID 37344585)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 37344439)
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
-- TOC entry 178 (class 1259 OID 37344253)
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
-- TOC entry 239 (class 1259 OID 37344886)
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
-- TOC entry 210 (class 1259 OID 37344605)
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
-- TOC entry 203 (class 1259 OID 37344535)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 37344699)
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
-- TOC entry 233 (class 1259 OID 37344809)
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
-- TOC entry 251 (class 1259 OID 37345190)
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
-- TOC entry 250 (class 1259 OID 37345159)
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
-- TOC entry 252 (class 1259 OID 37345202)
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
-- TOC entry 229 (class 1259 OID 37344771)
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
-- TOC entry 238 (class 1259 OID 37344876)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 37344761)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 37344304)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 37344247)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3148 (class 0 OID 37344308)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-569c-c8b3-bd26-104ea3f46744	10	30	Otroci	Abonma za otroke	200
000a0000-569c-c8b3-5704-4cd4e039fae9	20	60	Mladina	Abonma za mladino	400
000a0000-569c-c8b3-4182-4fc4b8bdb453	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3204 (class 0 OID 37344927)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569c-c8b4-9e4b-8b89e41cf9e2	000d0000-569c-c8b3-afe9-3ec82b7c1f53	\N	00090000-569c-c8b3-e8a3-31a9908fe6fd	000b0000-569c-c8b3-6f14-f37346ef6626	0001	f	\N	\N	\N	3	t	t	t
000c0000-569c-c8b4-965a-c203c46fd62e	000d0000-569c-c8b3-b987-6452d1426fe4	00100000-569c-c8b3-5028-86781b8c385c	00090000-569c-c8b3-4400-1ed886855fcf	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569c-c8b4-ffe9-7bd58db90117	000d0000-569c-c8b3-5884-4de6c2f7173c	00100000-569c-c8b3-1eb2-10a8ce15a6d8	00090000-569c-c8b3-624d-fa9634d09985	\N	0003	t	\N	2016-01-18	\N	2	t	f	f
000c0000-569c-c8b4-cd33-a84bc29ae1ef	000d0000-569c-c8b3-e5cc-3a9153f82463	\N	00090000-569c-c8b3-c7c3-367aaf0cd0e6	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569c-c8b4-dda1-fd077bb96688	000d0000-569c-c8b3-1728-15a1a85678bf	\N	00090000-569c-c8b3-cddf-7521921c741c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569c-c8b4-ea6a-8aa630a1bf3f	000d0000-569c-c8b3-43f3-69ef370e0a7e	\N	00090000-569c-c8b3-18df-97e93d43d829	000b0000-569c-c8b3-c686-097aa6afa6fa	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569c-c8b4-d8ba-c97464926415	000d0000-569c-c8b3-d107-397aa09b26f6	00100000-569c-c8b3-aa5e-b5073d169dc3	00090000-569c-c8b3-3c51-38d0d140963c	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569c-c8b4-3143-c46e7fc23db9	000d0000-569c-c8b3-9ebe-ecb0af9c557b	\N	00090000-569c-c8b3-363d-8d09ec8cb49e	000b0000-569c-c8b3-db3a-b0166a580443	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569c-c8b4-3e51-75571de95575	000d0000-569c-c8b3-d107-397aa09b26f6	00100000-569c-c8b3-88d1-a2687c68332c	00090000-569c-c8b3-5923-9b4994563339	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569c-c8b4-8867-d03aca3fe997	000d0000-569c-c8b3-d107-397aa09b26f6	00100000-569c-c8b3-3728-56aed9b48c68	00090000-569c-c8b3-c449-05a4f84bfdf6	\N	0010	t	\N	2016-01-18	\N	16	f	f	t
000c0000-569c-c8b4-0c7c-8084fd2ea1ab	000d0000-569c-c8b3-d107-397aa09b26f6	00100000-569c-c8b3-9d97-5707fff30cec	00090000-569c-c8b3-d45d-275e171431b5	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569c-c8b4-402f-5958e5c2fd2f	000d0000-569c-c8b3-4e16-71684745465a	00100000-569c-c8b3-5028-86781b8c385c	00090000-569c-c8b3-4400-1ed886855fcf	000b0000-569c-c8b3-d352-e643e30b9dd6	0012	t	\N	\N	\N	2	t	t	t
000c0000-569c-c8b4-b1f0-60286bbab482	000d0000-569c-c8b3-7eb5-8ceddf06078e	\N	00090000-569c-c8b3-363d-8d09ec8cb49e	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569c-c8b4-60e9-e1b5d2bd8f52	000d0000-569c-c8b3-7eb5-8ceddf06078e	\N	00090000-569c-c8b3-1b2f-c6a119255bb7	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569c-c8b4-706e-653c0a1e8fd5	000d0000-569c-c8b3-2b8d-7f4a159f81cd	00100000-569c-c8b3-1eb2-10a8ce15a6d8	00090000-569c-c8b3-624d-fa9634d09985	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569c-c8b4-2e5a-da3cf72cb6e3	000d0000-569c-c8b3-2b8d-7f4a159f81cd	\N	00090000-569c-c8b3-1b2f-c6a119255bb7	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569c-c8b4-fbbb-e8abf8c02084	000d0000-569c-c8b3-5d7b-d5886d1a3a9c	\N	00090000-569c-c8b3-1b2f-c6a119255bb7	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569c-c8b4-736f-5f58458b1a1c	000d0000-569c-c8b3-5d7b-d5886d1a3a9c	\N	00090000-569c-c8b3-363d-8d09ec8cb49e	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569c-c8b4-e345-1c3778aba7c5	000d0000-569c-c8b3-41f0-8179b4aebf00	00100000-569c-c8b3-aa5e-b5073d169dc3	00090000-569c-c8b3-3c51-38d0d140963c	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569c-c8b4-ebeb-ae7fd9683ec3	000d0000-569c-c8b3-41f0-8179b4aebf00	\N	00090000-569c-c8b3-1b2f-c6a119255bb7	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569c-c8b4-ce13-1e73d121f02b	000d0000-569c-c8b3-2c61-5255d61b99a8	\N	00090000-569c-c8b3-1b2f-c6a119255bb7	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569c-c8b4-3e79-6f927d73f335	000d0000-569c-c8b3-2c61-5255d61b99a8	00100000-569c-c8b3-aa5e-b5073d169dc3	00090000-569c-c8b3-3c51-38d0d140963c	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569c-c8b4-8b8b-e1938635b760	000d0000-569c-c8b3-7aa6-b26b3126f802	\N	00090000-569c-c8b3-1b2f-c6a119255bb7	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569c-c8b4-4fad-d11cf1d68546	000d0000-569c-c8b3-156a-fb6a188a8ec4	\N	00090000-569c-c8b3-363d-8d09ec8cb49e	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569c-c8b4-13d5-d5091730442d	000d0000-569c-c8b3-8942-f7160da7929a	\N	00090000-569c-c8b3-363d-8d09ec8cb49e	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569c-c8b4-d39e-37544367fb46	000d0000-569c-c8b3-8942-f7160da7929a	00100000-569c-c8b3-1eb2-10a8ce15a6d8	00090000-569c-c8b3-624d-fa9634d09985	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569c-c8b4-82a6-707abf274729	000d0000-569c-c8b3-05fd-0d439f29e0fa	\N	00090000-569c-c8b3-ffae-3385c3f2cda6	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569c-c8b4-6f82-d4ed3d5b94df	000d0000-569c-c8b3-05fd-0d439f29e0fa	\N	00090000-569c-c8b3-78ce-bb2ae30c8f18	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569c-c8b4-3d57-1f5ba0d7c3be	000d0000-569c-c8b3-e8d3-f07d534b4665	\N	00090000-569c-c8b3-363d-8d09ec8cb49e	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569c-c8b4-e57b-b501c6d99f79	000d0000-569c-c8b3-e8d3-f07d534b4665	00100000-569c-c8b3-1eb2-10a8ce15a6d8	00090000-569c-c8b3-624d-fa9634d09985	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569c-c8b4-06fe-4474abd6d923	000d0000-569c-c8b3-e8d3-f07d534b4665	\N	00090000-569c-c8b3-78ce-bb2ae30c8f18	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569c-c8b4-bb59-f2f5f75be1f6	000d0000-569c-c8b3-e8d3-f07d534b4665	\N	00090000-569c-c8b3-ffae-3385c3f2cda6	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569c-c8b4-9214-dcb122ecd765	000d0000-569c-c8b3-2114-dec3235aa941	\N	00090000-569c-c8b3-363d-8d09ec8cb49e	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569c-c8b4-3bf5-addea162f30c	000d0000-569c-c8b4-a695-c44a50cc7447	00100000-569c-c8b3-1eb2-10a8ce15a6d8	00090000-569c-c8b3-624d-fa9634d09985	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569c-c8b4-c305-1359cffa956a	000d0000-569c-c8b4-a695-c44a50cc7447	\N	00090000-569c-c8b3-1b2f-c6a119255bb7	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3203 (class 0 OID 37344911)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 37344301)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3194 (class 0 OID 37344788)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569c-c8b3-af1e-5f95c9e3fb22	00160000-569c-c8b3-563a-42ccee1ffb23	00090000-569c-c8b3-78ce-bb2ae30c8f18	aizv	10	t
003d0000-569c-c8b3-1d90-5322fce74b52	00160000-569c-c8b3-563a-42ccee1ffb23	00090000-569c-c8b3-9ed9-7600f0fe9ef4	apri	14	t
003d0000-569c-c8b3-d561-960518df3a05	00160000-569c-c8b3-339f-0b9f1deb449d	00090000-569c-c8b3-ffae-3385c3f2cda6	aizv	11	t
003d0000-569c-c8b3-04b0-59e6211dbc28	00160000-569c-c8b3-f46a-5a568572c7c3	00090000-569c-c8b3-5d03-2c9213100a59	aizv	12	t
003d0000-569c-c8b3-ef3e-cb8e5e89ab0b	00160000-569c-c8b3-563a-42ccee1ffb23	00090000-569c-c8b3-1b2f-c6a119255bb7	apri	18	f
\.


--
-- TOC entry 3197 (class 0 OID 37344818)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569c-c8b3-563a-42ccee1ffb23	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569c-c8b3-339f-0b9f1deb449d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569c-c8b3-f46a-5a568572c7c3	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3218 (class 0 OID 37345230)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 37344624)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 37344550)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-569c-c8b4-76ab-6b6c79718430	\N	00200000-569c-c8b4-e550-81e5fb170ec1	\N	\N	\N	00220000-569c-c8b3-aa1e-2ecc6a79b767	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-569c-c8b4-5fda-b58c51917e7f	\N	00200000-569c-c8b4-00ff-994d27981018	\N	\N	\N	00220000-569c-c8b3-aa1e-2ecc6a79b767	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-569c-c8b4-d512-01ae2412ec15	\N	00200000-569c-c8b4-a9ce-9d8d8b3389df	\N	\N	\N	00220000-569c-c8b3-fe58-d01b44796a63	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-569c-c8b4-ada1-867e4642b4a5	\N	00200000-569c-c8b4-29c3-f683f99b780c	\N	\N	\N	00220000-569c-c8b3-cf5b-110501600dcf	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-569c-c8b4-63a3-c3e15fe02be1	\N	00200000-569c-c8b4-b669-acba2663f218	\N	\N	\N	00220000-569c-c8b3-f5b7-5ccb79770dc5	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
00180000-569c-c8b4-7e98-1a99491bc6e9	001b0000-569c-c8b4-9fd9-55e75f522796	\N	\N	\N	\N	00220000-569c-c8b3-013e-455cf7a9da76	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1
\.


--
-- TOC entry 3169 (class 0 OID 37344575)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 37344580)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 37345152)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 37344453)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569c-c8b0-f34e-01ae1bc5d91e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569c-c8b0-5762-5ebd282d2f76	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569c-c8b0-ae6a-c90d92de206c	AL	ALB	008	Albania 	Albanija	\N
00040000-569c-c8b0-375d-4532aec0c634	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569c-c8b0-322e-0f8bcc45a4a7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569c-c8b0-fa90-c82ef0ce7f74	AD	AND	020	Andorra 	Andora	\N
00040000-569c-c8b0-14ae-9a41d314a748	AO	AGO	024	Angola 	Angola	\N
00040000-569c-c8b0-48b0-99c4a3dd9d21	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569c-c8b0-1689-45199a088427	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569c-c8b0-172f-49e32df88ee6	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569c-c8b0-9698-a35ef433598e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569c-c8b0-41c6-d84eb266230d	AM	ARM	051	Armenia 	Armenija	\N
00040000-569c-c8b0-f845-14c8c31ff1ca	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569c-c8b0-3ff0-20afdb2da88b	AU	AUS	036	Australia 	Avstralija	\N
00040000-569c-c8b0-3b6e-b31965f70b0a	AT	AUT	040	Austria 	Avstrija	\N
00040000-569c-c8b0-047c-c7b030d775a7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569c-c8b0-e895-781ab766a410	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569c-c8b0-1750-d6c9f537d758	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569c-c8b0-e817-8df6a54c52df	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569c-c8b0-685a-32305ca599e3	BB	BRB	052	Barbados 	Barbados	\N
00040000-569c-c8b0-84d0-5805b1e6704f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569c-c8b0-889d-958ffcc58e04	BE	BEL	056	Belgium 	Belgija	\N
00040000-569c-c8b0-08f3-d24c4ef1a404	BZ	BLZ	084	Belize 	Belize	\N
00040000-569c-c8b0-747d-d5235ccf5d73	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569c-c8b0-3218-0daede3df29f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569c-c8b0-a9c5-d1667a4f8161	BT	BTN	064	Bhutan 	Butan	\N
00040000-569c-c8b0-f4a7-1ce537be6569	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569c-c8b0-2556-8894c9a7638f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569c-c8b0-2858-f1e99b1cff7d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569c-c8b0-1b34-1c0afe00f4ab	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569c-c8b0-b502-9935499042e4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569c-c8b0-1b12-8f2f55ffbba9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569c-c8b0-48d2-c7c4dcf56432	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569c-c8b0-ea1e-fc20f901a7d7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569c-c8b0-b8f5-04155bb3b02c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569c-c8b0-26d6-511e27e2048c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569c-c8b0-7287-d0958c4a3e37	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569c-c8b0-d6b1-19226d218aec	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569c-c8b0-d5aa-268544ecc3ec	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569c-c8b0-84e2-a14c284d7311	CA	CAN	124	Canada 	Kanada	\N
00040000-569c-c8b0-a0a8-0d0b67d4d1f9	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569c-c8b0-47e1-554f1755f194	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569c-c8b0-4c61-375e6538cdba	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569c-c8b0-5511-d27661fa3cd7	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569c-c8b0-c7ec-1739ac565275	CL	CHL	152	Chile 	Čile	\N
00040000-569c-c8b0-691a-1bebe3cd9613	CN	CHN	156	China 	Kitajska	\N
00040000-569c-c8b0-987c-752eb1030a7d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569c-c8b0-38dd-69bc55a37917	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569c-c8b0-f759-2f8cad39b54b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569c-c8b0-1c10-3582288907f6	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569c-c8b0-8da0-c815236a9409	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569c-c8b0-6686-185b454e489b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569c-c8b0-b987-937faf85cdc4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569c-c8b0-8a76-aea8311aeef8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569c-c8b0-79bc-2dc40d6ef5bf	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569c-c8b0-f2bc-8e7b5c770403	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569c-c8b0-b25c-e8d22a3d5c47	CU	CUB	192	Cuba 	Kuba	\N
00040000-569c-c8b0-1f0e-32c4d8580989	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569c-c8b0-2082-1a7f598c3690	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569c-c8b0-8377-6b579facbd2e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569c-c8b0-15ad-61fe34674615	DK	DNK	208	Denmark 	Danska	\N
00040000-569c-c8b0-7f5b-24741317e79a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569c-c8b0-d232-7cfea9196e9b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569c-c8b0-5097-e3c3c11f2936	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569c-c8b0-31b1-708935275bd6	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569c-c8b0-9883-00b0e7a93aca	EG	EGY	818	Egypt 	Egipt	\N
00040000-569c-c8b0-059e-7949f4a24394	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569c-c8b0-d6ed-1b3d72e6a0cb	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569c-c8b0-bf8d-d49c8d0a984e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569c-c8b0-b672-350e9abcc0d2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569c-c8b0-0d1c-f25543c5a0a3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569c-c8b0-3be1-9ccae9768cff	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569c-c8b0-56e0-9c3039737784	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569c-c8b0-0579-18f3e3237081	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569c-c8b0-838c-d74dd3d32be2	FI	FIN	246	Finland 	Finska	\N
00040000-569c-c8b0-cec3-ab8395f4a4fd	FR	FRA	250	France 	Francija	\N
00040000-569c-c8b0-5387-0fd85c63c458	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569c-c8b0-fb28-33bdbed4cf21	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569c-c8b0-d490-b348f2378f58	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569c-c8b0-57c3-746b679eeac5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569c-c8b0-cb1c-40d833e6f726	GA	GAB	266	Gabon 	Gabon	\N
00040000-569c-c8b0-9fb0-d5705533b564	GM	GMB	270	Gambia 	Gambija	\N
00040000-569c-c8b0-fc51-cfd5919e3bb9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569c-c8b0-01ef-e11c778d3216	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569c-c8b0-48c2-733c0521ae5d	GH	GHA	288	Ghana 	Gana	\N
00040000-569c-c8b0-8370-dad9fbab460d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569c-c8b0-fca4-7e3932c4a6a0	GR	GRC	300	Greece 	Grčija	\N
00040000-569c-c8b0-86fc-bfda1bdce37c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569c-c8b0-c8c7-0414cc5e9e70	GD	GRD	308	Grenada 	Grenada	\N
00040000-569c-c8b0-de8b-4b7765f876e6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569c-c8b0-5ce1-4fd4f4a90000	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569c-c8b0-7492-4790e024acf1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569c-c8b0-e018-e2ff77b55b2b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569c-c8b0-5da6-2d2c332938da	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569c-c8b0-5097-4a0cf46faa44	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569c-c8b0-433a-155e2d11b6fe	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569c-c8b0-2217-8aa5ea9387fb	HT	HTI	332	Haiti 	Haiti	\N
00040000-569c-c8b0-7970-6fbd2af0f516	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569c-c8b0-e15b-337c68965f55	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569c-c8b0-64d3-f7fede6d966c	HN	HND	340	Honduras 	Honduras	\N
00040000-569c-c8b0-d97c-32b351e3a388	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569c-c8b0-322f-0ba381427b2b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569c-c8b0-8f3f-0c380bb352bb	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569c-c8b0-e112-816a34345494	IN	IND	356	India 	Indija	\N
00040000-569c-c8b0-1976-c06ab1308dce	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569c-c8b0-c28a-8dfde8fb3f2a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569c-c8b0-5560-aeb79fd3203a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569c-c8b0-06d2-19e723ac7f55	IE	IRL	372	Ireland 	Irska	\N
00040000-569c-c8b0-dd1a-41c855e3efca	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569c-c8b0-fa22-0af23441622b	IL	ISR	376	Israel 	Izrael	\N
00040000-569c-c8b0-a12d-a49dbcd3a9a9	IT	ITA	380	Italy 	Italija	\N
00040000-569c-c8b0-7239-fb1c62556a63	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569c-c8b0-f2bf-04515fe0cfd7	JP	JPN	392	Japan 	Japonska	\N
00040000-569c-c8b0-cc95-8e134831d44e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569c-c8b0-f1b6-eff36b8c9ee5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569c-c8b0-c19d-0fd46311888e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569c-c8b0-dfe8-1900ce1859b8	KE	KEN	404	Kenya 	Kenija	\N
00040000-569c-c8b0-71bc-264075bd35e0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569c-c8b0-c454-ce142f6cef6e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569c-c8b0-538b-70d4b88855e6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569c-c8b0-6b00-88fdc0082562	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569c-c8b0-d97a-edaa6f297201	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569c-c8b0-d2c6-67d19dcdef1e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569c-c8b0-f93d-fcdf924c1481	LV	LVA	428	Latvia 	Latvija	\N
00040000-569c-c8b0-edc1-20a497f3bebd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569c-c8b0-fbc2-9c2ce3a11fb7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569c-c8b0-8d9c-a8dce0883216	LR	LBR	430	Liberia 	Liberija	\N
00040000-569c-c8b0-da16-555809ca3820	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569c-c8b0-89e4-223d9618f651	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569c-c8b0-2cc4-c70f4c5a7937	LT	LTU	440	Lithuania 	Litva	\N
00040000-569c-c8b0-35d5-7ff60ad7268c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569c-c8b0-0e9a-f9ef1e16e3fb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569c-c8b0-fc37-0972af16d7c5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569c-c8b0-ca82-099f00158483	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569c-c8b0-faad-b40b66f9b877	MW	MWI	454	Malawi 	Malavi	\N
00040000-569c-c8b0-0680-0d3f232f9671	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569c-c8b0-f930-84b1d5680d1b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569c-c8b0-ed38-415a829560c1	ML	MLI	466	Mali 	Mali	\N
00040000-569c-c8b0-3e51-ced04a2a5678	MT	MLT	470	Malta 	Malta	\N
00040000-569c-c8b0-a0b1-4fa5b4819beb	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569c-c8b0-ce29-e3aebb26fa14	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569c-c8b0-b2de-37b5c01f853e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569c-c8b0-aa24-fba02198409a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569c-c8b0-f98f-c937b8490526	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569c-c8b0-45f1-67704365ca05	MX	MEX	484	Mexico 	Mehika	\N
00040000-569c-c8b0-2b00-34510b83e132	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569c-c8b0-8845-22196838559b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569c-c8b0-a5a0-709b83f2f11e	MC	MCO	492	Monaco 	Monako	\N
00040000-569c-c8b0-f51e-304286d40429	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569c-c8b0-d748-fd9de76e2587	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569c-c8b0-d33d-760cb5c48466	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569c-c8b0-5377-f148ac86629f	MA	MAR	504	Morocco 	Maroko	\N
00040000-569c-c8b0-3a95-01943050784e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569c-c8b0-113c-049413fdc77b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569c-c8b0-101e-0acfb8c3d5e1	NA	NAM	516	Namibia 	Namibija	\N
00040000-569c-c8b0-9984-f4189947730e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569c-c8b0-5c01-8f7eeaeb6077	NP	NPL	524	Nepal 	Nepal	\N
00040000-569c-c8b0-a724-a00d11a7a3c7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569c-c8b0-57f2-73037501e9dc	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569c-c8b0-1825-7e6c0b96c690	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569c-c8b0-bd1f-52ecf26be2fe	NE	NER	562	Niger 	Niger 	\N
00040000-569c-c8b0-53ef-2c37b2dcfd64	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569c-c8b0-bdbc-9f929f750e52	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569c-c8b0-9239-770793daeec7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569c-c8b0-7f04-cebe994910cd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569c-c8b0-8b7c-7e443f235ba7	NO	NOR	578	Norway 	Norveška	\N
00040000-569c-c8b0-9fee-2e50adf48f4b	OM	OMN	512	Oman 	Oman	\N
00040000-569c-c8b0-6faf-cd30a7520dc5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569c-c8b0-3787-153facd08a41	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569c-c8b0-5261-00a32f65726e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569c-c8b0-bef8-2dbacbfbf0fd	PA	PAN	591	Panama 	Panama	\N
00040000-569c-c8b0-dd72-bff374490808	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569c-c8b0-9e11-c511292a2af7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569c-c8b0-8d25-a43b60d25ecd	PE	PER	604	Peru 	Peru	\N
00040000-569c-c8b0-2733-0719fd8e6e31	PH	PHL	608	Philippines 	Filipini	\N
00040000-569c-c8b0-1129-c0ebf7d73e74	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569c-c8b0-4c3e-d4c2c419b4b6	PL	POL	616	Poland 	Poljska	\N
00040000-569c-c8b0-965e-8a039eaad630	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569c-c8b0-4f9b-a423934db7b6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569c-c8b0-22a3-6cf1010f61b0	QA	QAT	634	Qatar 	Katar	\N
00040000-569c-c8b0-d452-46b35aaf44c5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569c-c8b0-96a1-56bb1285f366	RO	ROU	642	Romania 	Romunija	\N
00040000-569c-c8b0-9712-7440e82ca482	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569c-c8b0-1578-84c53c9915a3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569c-c8b0-7d5b-d02f02ef91d9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569c-c8b0-d80f-f4c9213f876a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569c-c8b0-9ffe-64474306f0d3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569c-c8b0-4817-fff0f86b4747	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569c-c8b0-76cf-788116e03e37	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569c-c8b0-69c9-908e1511c155	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569c-c8b0-90af-808ddc3f6084	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569c-c8b0-9b94-25b409bc4094	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569c-c8b0-4847-28d3a66d07bd	SM	SMR	674	San Marino 	San Marino	\N
00040000-569c-c8b0-260a-937168f75761	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569c-c8b0-5e27-85c93d4de576	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569c-c8b0-ae62-dce990a4c082	SN	SEN	686	Senegal 	Senegal	\N
00040000-569c-c8b0-a1da-a8d11e066278	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569c-c8b0-d1ea-017dce6b1873	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569c-c8b0-84ad-b28f7a10504f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569c-c8b0-9cd5-61497a5e25dc	SG	SGP	702	Singapore 	Singapur	\N
00040000-569c-c8b0-fc85-f9b8d6110531	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569c-c8b0-1069-a4704bc483fb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569c-c8b0-06ae-79104035809e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569c-c8b0-6707-925bb36f591d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569c-c8b0-a255-d00e64613197	SO	SOM	706	Somalia 	Somalija	\N
00040000-569c-c8b0-84b6-b0ba8088462c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569c-c8b0-154b-d8aedd3e2120	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569c-c8b0-9de6-0075b80b6d3d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569c-c8b0-e342-af3a190838d8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569c-c8b0-5042-fcab7ac560d8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569c-c8b0-77bc-0cb2a1d60dae	SD	SDN	729	Sudan 	Sudan	\N
00040000-569c-c8b0-7216-a60eb2ad60d1	SR	SUR	740	Suriname 	Surinam	\N
00040000-569c-c8b0-f55a-eef9c31d8dfc	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569c-c8b0-f5b6-277feefdbbcc	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569c-c8b0-0ce1-4dc8347d026c	SE	SWE	752	Sweden 	Švedska	\N
00040000-569c-c8b0-c95d-7969a2cc203b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569c-c8b0-3df1-50a9cdd63567	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569c-c8b0-8936-c5f7ed725602	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569c-c8b0-097d-77eb766f80d8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569c-c8b0-c1fb-9e19f0e0ad07	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569c-c8b0-4219-f5742d688d5c	TH	THA	764	Thailand 	Tajska	\N
00040000-569c-c8b0-6071-55b290566ecf	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569c-c8b0-91ad-40788b996c0b	TG	TGO	768	Togo 	Togo	\N
00040000-569c-c8b0-44d7-a3a428d1805a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569c-c8b0-7a82-e8f271f88ade	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569c-c8b0-a621-9a09db45e773	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569c-c8b0-7002-5f8f8777cb30	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569c-c8b0-74ec-032925d0622b	TR	TUR	792	Turkey 	Turčija	\N
00040000-569c-c8b0-bf83-2aa1d9a76905	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569c-c8b0-eb6e-3f7dea417755	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569c-c8b0-79d0-07923a044131	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569c-c8b0-caa2-2779e2a4d742	UG	UGA	800	Uganda 	Uganda	\N
00040000-569c-c8b0-3a73-498b5cff6261	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569c-c8b0-a0cf-af693826057d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569c-c8b0-674c-c7de7656e731	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569c-c8b0-4299-7e4a1d14d957	US	USA	840	United States 	Združene države Amerike	\N
00040000-569c-c8b0-4f70-8141b169b585	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569c-c8b0-f0bd-9593cf1718bc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569c-c8b0-49f3-46daa4ba0f2c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569c-c8b0-2b2c-7a6a23b5ea35	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569c-c8b0-85ec-9d9aeef4017b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569c-c8b0-08d6-6e9653b08b60	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569c-c8b0-771c-4d47be7a14c7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569c-c8b0-2c37-848f4dc9b71a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569c-c8b0-10b1-07db854edc7e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569c-c8b0-69cf-24a0383fb408	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569c-c8b0-b8cb-a2e1fd36218c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569c-c8b0-be0c-f7dfa221dad4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569c-c8b0-d063-4a5d5a72f79b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3205 (class 0 OID 37344940)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569c-c8b3-db3b-8a848f687591	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569c-c8b3-aac4-3066089988fc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-c8b4-5aa8-62e2909460e9	000e0000-569c-c8b3-d0c5-f09bf78b2f6b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-c8b0-2486-01a101ed2720	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-c8b4-fdd1-6069d7a23575	000e0000-569c-c8b3-c69f-70726666c071	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-c8b0-29eb-fd4f1862ed5f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569c-c8b4-c8bc-382a6465fcf4	000e0000-569c-c8b3-b11e-8bd727c51ff3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569c-c8b0-2486-01a101ed2720	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3190 (class 0 OID 37344746)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569c-c8b3-6664-903010a9ad08	000e0000-569c-c8b3-c69f-70726666c071	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569c-c8b0-9337-145616df749b
000d0000-569c-c8b3-3af0-c9794b943970	000e0000-569c-c8b3-874b-c8ee7d5512ec	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-c8b0-77a0-b067b4fefa53
000d0000-569c-c8b3-c954-e483bc2d119d	000e0000-569c-c8b3-874b-c8ee7d5512ec	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-afe9-3ec82b7c1f53	000e0000-569c-c8b3-c69f-70726666c071	000c0000-569c-c8b4-9e4b-8b89e41cf9e2	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-c8b0-77a0-b067b4fefa53
000d0000-569c-c8b3-b987-6452d1426fe4	000e0000-569c-c8b3-c69f-70726666c071	000c0000-569c-c8b4-965a-c203c46fd62e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-5884-4de6c2f7173c	000e0000-569c-c8b3-c69f-70726666c071	000c0000-569c-c8b4-ffe9-7bd58db90117	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569c-c8b0-e7fa-b76f6526b75e
000d0000-569c-c8b3-e5cc-3a9153f82463	000e0000-569c-c8b3-c69f-70726666c071	000c0000-569c-c8b4-cd33-a84bc29ae1ef	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569c-c8b0-9337-145616df749b
000d0000-569c-c8b3-1728-15a1a85678bf	000e0000-569c-c8b3-c69f-70726666c071	000c0000-569c-c8b4-dda1-fd077bb96688	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569c-c8b0-9337-145616df749b
000d0000-569c-c8b3-43f3-69ef370e0a7e	000e0000-569c-c8b3-c69f-70726666c071	000c0000-569c-c8b4-ea6a-8aa630a1bf3f	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569c-c8b0-77a0-b067b4fefa53
000d0000-569c-c8b3-d107-397aa09b26f6	000e0000-569c-c8b3-c69f-70726666c071	000c0000-569c-c8b4-3e51-75571de95575	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569c-c8b0-77a0-b067b4fefa53
000d0000-569c-c8b3-9ebe-ecb0af9c557b	000e0000-569c-c8b3-c69f-70726666c071	000c0000-569c-c8b4-3143-c46e7fc23db9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569c-c8b0-865f-44ebd2c4ec77
000d0000-569c-c8b3-4e16-71684745465a	000e0000-569c-c8b3-c69f-70726666c071	000c0000-569c-c8b4-402f-5958e5c2fd2f	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569c-c8b0-0e65-f1422029b305
000d0000-569c-c8b3-7eb5-8ceddf06078e	000e0000-569c-c8b3-6741-429a91d54ccf	000c0000-569c-c8b4-b1f0-60286bbab482	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-2b8d-7f4a159f81cd	000e0000-569c-c8b3-39db-d95799a2570c	000c0000-569c-c8b4-706e-653c0a1e8fd5	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-5d7b-d5886d1a3a9c	000e0000-569c-c8b3-39db-d95799a2570c	000c0000-569c-c8b4-fbbb-e8abf8c02084	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-41f0-8179b4aebf00	000e0000-569c-c8b3-1a14-446fa0a88718	000c0000-569c-c8b4-e345-1c3778aba7c5	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-2c61-5255d61b99a8	000e0000-569c-c8b3-a183-83e5da963b4f	000c0000-569c-c8b4-ce13-1e73d121f02b	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-7aa6-b26b3126f802	000e0000-569c-c8b3-2a5e-0e803c1bab86	000c0000-569c-c8b4-8b8b-e1938635b760	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-156a-fb6a188a8ec4	000e0000-569c-c8b3-2906-3a7d4f2b8140	000c0000-569c-c8b4-4fad-d11cf1d68546	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-8942-f7160da7929a	000e0000-569c-c8b3-62bd-c012bc00e317	000c0000-569c-c8b4-13d5-d5091730442d	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-05fd-0d439f29e0fa	000e0000-569c-c8b3-70a5-7ca1b0842680	000c0000-569c-c8b4-82a6-707abf274729	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-e8d3-f07d534b4665	000e0000-569c-c8b3-70a5-7ca1b0842680	000c0000-569c-c8b4-3d57-1f5ba0d7c3be	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b3-2114-dec3235aa941	000e0000-569c-c8b3-464d-a0b0d211f207	000c0000-569c-c8b4-9214-dcb122ecd765	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
000d0000-569c-c8b4-a695-c44a50cc7447	000e0000-569c-c8b3-464d-a0b0d211f207	000c0000-569c-c8b4-3bf5-addea162f30c	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569c-c8b0-a690-bd7dc4b6c4b5
\.


--
-- TOC entry 3165 (class 0 OID 37344524)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 37344493)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 37344470)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569c-c8b3-eab0-b11cb0170b91	00080000-569c-c8b3-ca73-b3847ef7f360	00090000-569c-c8b3-c449-05a4f84bfdf6	AK		igralka
\.


--
-- TOC entry 3179 (class 0 OID 37344660)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 37345210)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569c-c8b3-d8f0-3ee45448cfbb	00010000-569c-c8b1-f398-142ded30d138	\N	Prva mapa	Root mapa	2016-01-18 12:12:51	2016-01-18 12:12:51	R	\N	\N
\.


--
-- TOC entry 3217 (class 0 OID 37345223)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 37345245)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 34548309)
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
-- TOC entry 3183 (class 0 OID 37344685)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 37344427)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569c-c8b1-7eb0-c893cb3f542f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569c-c8b1-02c0-90b9b59be37d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569c-c8b1-f276-06d5535fab15	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569c-c8b1-a9b3-1145cf4c9e40	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569c-c8b1-8411-ab1464a93bf1	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569c-c8b1-d202-0733e8685579	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569c-c8b1-31b7-558e0e682738	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569c-c8b1-ab27-2f01384dbe7b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569c-c8b1-f1f6-48109ccaafae	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569c-c8b1-a156-ae8e948f36eb	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569c-c8b1-6033-91e0811b7887	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569c-c8b1-e798-9eac15cda001	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569c-c8b1-f997-a1a942eb4546	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569c-c8b1-3756-a718a28c8e86	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569c-c8b1-4d51-51252ae1d643	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569c-c8b3-f985-09d6e681ce4b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569c-c8b3-95f9-e002d0f3e296	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569c-c8b3-968e-ca4680a93d80	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569c-c8b3-0957-9bf02f94c109	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569c-c8b3-d4c0-8780bc249719	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569c-c8b5-d84f-3090d560510b	application.tenant.maticnopodjetje	string	s:36:"00080000-569c-c8b5-470a-9669532f2031";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3150 (class 0 OID 37344327)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569c-c8b3-4c6b-4b6e0c8d355f	00000000-569c-c8b3-f985-09d6e681ce4b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569c-c8b3-440b-0905f9a8d529	00000000-569c-c8b3-f985-09d6e681ce4b	00010000-569c-c8b1-f398-142ded30d138	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569c-c8b3-5c61-51646f3f3127	00000000-569c-c8b3-95f9-e002d0f3e296	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3154 (class 0 OID 37344394)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569c-c8b3-2354-e4ae38377f12	\N	00100000-569c-c8b3-5028-86781b8c385c	00100000-569c-c8b3-1eb2-10a8ce15a6d8	01	Gledališče Nimbis
00410000-569c-c8b3-9790-c222d15baa58	00410000-569c-c8b3-2354-e4ae38377f12	00100000-569c-c8b3-5028-86781b8c385c	00100000-569c-c8b3-1eb2-10a8ce15a6d8	02	Tehnika
\.


--
-- TOC entry 3151 (class 0 OID 37344338)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569c-c8b3-e8a3-31a9908fe6fd	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569c-c8b3-c7c3-367aaf0cd0e6	00010000-569c-c8b3-03e2-744be18bec9c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569c-c8b3-624d-fa9634d09985	00010000-569c-c8b3-8ffc-1bd8ae1e9aa0	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569c-c8b3-5923-9b4994563339	00010000-569c-c8b3-9252-a289ab945f44	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569c-c8b3-afca-6b9e167f91af	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569c-c8b3-18df-97e93d43d829	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569c-c8b3-d45d-275e171431b5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569c-c8b3-3c51-38d0d140963c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569c-c8b3-c449-05a4f84bfdf6	00010000-569c-c8b3-68af-4495d424381b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569c-c8b3-4400-1ed886855fcf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569c-c8b3-84bf-1accbdf459f0	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569c-c8b3-cddf-7521921c741c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569c-c8b3-363d-8d09ec8cb49e	00010000-569c-c8b3-430f-846946173e47	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569c-c8b3-78ce-bb2ae30c8f18	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-c8b3-9ed9-7600f0fe9ef4	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-c8b3-ffae-3385c3f2cda6	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-c8b3-5d03-2c9213100a59	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569c-c8b3-1b2f-c6a119255bb7	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569c-c8b3-a894-457abf0c4a4f	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-c8b3-0047-586c3666770f	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569c-c8b3-c759-c22481b5c028	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3143 (class 0 OID 37344273)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569c-c8b1-4509-461bb6db6235	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569c-c8b1-886c-3a573a49fff1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569c-c8b1-83f9-26d31145e9b5	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569c-c8b1-0e1a-488f032af2f4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569c-c8b1-e35e-bfabdf45d321	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569c-c8b1-cb80-ca14a3e58f2a	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569c-c8b1-00fb-57c33c7ce760	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569c-c8b1-eaa7-06922c42e517	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569c-c8b1-532f-81daa2dbb4d6	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569c-c8b1-a992-9c811ec48ae8	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569c-c8b1-36ba-e32c0a4ad23e	Abonma-read	Abonma - branje	t
00030000-569c-c8b1-e558-47eeb9183f00	Abonma-write	Abonma - spreminjanje	t
00030000-569c-c8b1-dbbe-8d367cca9721	Alternacija-read	Alternacija - branje	t
00030000-569c-c8b1-3e80-c3bbd4107731	Alternacija-write	Alternacija - spreminjanje	t
00030000-569c-c8b1-f6ae-de66cfcf6949	Arhivalija-read	Arhivalija - branje	t
00030000-569c-c8b1-3cc6-c1bf0b18da2a	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569c-c8b1-09c8-f59eff3d64aa	AuthStorage-read	AuthStorage - branje	t
00030000-569c-c8b1-5469-e443523ac6f3	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569c-c8b1-5a0e-554945317165	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569c-c8b1-f248-ad8bd2381e58	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569c-c8b1-45b7-f85373619c6f	Besedilo-read	Besedilo - branje	t
00030000-569c-c8b1-0f12-a806b0ea57da	Besedilo-write	Besedilo - spreminjanje	t
00030000-569c-c8b1-d755-7f4db86e1447	Dodatek-read	Dodatek - branje	t
00030000-569c-c8b1-8ca3-9e55c95e21a1	Dodatek-write	Dodatek - spreminjanje	t
00030000-569c-c8b1-8d89-cf2c8e527ebb	Dogodek-read	Dogodek - branje	t
00030000-569c-c8b1-9ae7-cbff858ecdea	Dogodek-write	Dogodek - spreminjanje	t
00030000-569c-c8b1-97a8-207b1a3e0337	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569c-c8b1-bc4e-ae19c4df0c07	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569c-c8b1-ac3d-2760b17ec9a4	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569c-c8b1-c972-7fe05642b8dc	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569c-c8b1-7c9a-a7b3da8864b5	DogodekTrait-read	DogodekTrait - branje	t
00030000-569c-c8b1-d880-0bb3510aade0	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569c-c8b1-f335-8f261c88be8a	DrugiVir-read	DrugiVir - branje	t
00030000-569c-c8b1-1b75-7bc26c0f2c39	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569c-c8b1-21f2-92ce4fbaeb45	Drzava-read	Drzava - branje	t
00030000-569c-c8b1-e925-5c8dea85f915	Drzava-write	Drzava - spreminjanje	t
00030000-569c-c8b1-6bff-a364d3e750d7	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569c-c8b1-0041-71c871f2c21c	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569c-c8b1-20a3-9adfd12dad7a	Funkcija-read	Funkcija - branje	t
00030000-569c-c8b1-833c-3d74bee0dbea	Funkcija-write	Funkcija - spreminjanje	t
00030000-569c-c8b1-2f92-0d11e20c5703	Gostovanje-read	Gostovanje - branje	t
00030000-569c-c8b1-31d9-4847f5e65487	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569c-c8b1-35b6-e8ca2a7c3ef6	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569c-c8b1-d2dd-576e9d9f044c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569c-c8b1-c930-00373d31e448	Kupec-read	Kupec - branje	t
00030000-569c-c8b1-fd9f-62a80b6cbcf6	Kupec-write	Kupec - spreminjanje	t
00030000-569c-c8b1-7329-3972a9418615	NacinPlacina-read	NacinPlacina - branje	t
00030000-569c-c8b1-26a0-4b521e41d459	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569c-c8b1-2de2-e1c026ee6a47	Option-read	Option - branje	t
00030000-569c-c8b1-08ac-86291d432cf3	Option-write	Option - spreminjanje	t
00030000-569c-c8b1-8df0-f33eed49804d	OptionValue-read	OptionValue - branje	t
00030000-569c-c8b1-8ffa-02cbeac8e218	OptionValue-write	OptionValue - spreminjanje	t
00030000-569c-c8b1-0cf6-b726e7b45969	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569c-c8b1-6ed1-372d206af0bc	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569c-c8b1-20f3-93bb135621b2	Oseba-read	Oseba - branje	t
00030000-569c-c8b1-6802-490ec9fbc0d5	Oseba-write	Oseba - spreminjanje	t
00030000-569c-c8b1-4919-dda2f8471ba6	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569c-c8b1-1c7d-f2b23a98e64f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569c-c8b1-0d9c-d033f9142169	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569c-c8b1-d2cf-bf749aaaa675	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569c-c8b1-4952-cbd4a6248b10	Pogodba-read	Pogodba - branje	t
00030000-569c-c8b1-97fd-bb80f255bf87	Pogodba-write	Pogodba - spreminjanje	t
00030000-569c-c8b1-960b-65d1e23166da	Popa-read	Popa - branje	t
00030000-569c-c8b1-f052-4de9db00ef6c	Popa-write	Popa - spreminjanje	t
00030000-569c-c8b1-a1c3-e2be403e7360	Posta-read	Posta - branje	t
00030000-569c-c8b1-7152-11c8fdab6a30	Posta-write	Posta - spreminjanje	t
00030000-569c-c8b1-623c-5a49b5e1679c	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569c-c8b1-f346-60d71f4edc77	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569c-c8b1-7607-f36b13a630ff	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569c-c8b1-2786-fbd142bdc5cd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569c-c8b1-29e3-f3463cb717c0	PostniNaslov-read	PostniNaslov - branje	t
00030000-569c-c8b1-6b8e-9addbb445dd1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569c-c8b1-add8-398344184db3	Praznik-read	Praznik - branje	t
00030000-569c-c8b1-f3a6-f669d3334762	Praznik-write	Praznik - spreminjanje	t
00030000-569c-c8b1-6509-66fafa316b28	Predstava-read	Predstava - branje	t
00030000-569c-c8b1-5127-98bdb6c4aa32	Predstava-write	Predstava - spreminjanje	t
00030000-569c-c8b1-5b93-6cd2dbae6fd6	Ura-read	Ura - branje	t
00030000-569c-c8b1-cb5a-c43794811d9c	Ura-write	Ura - spreminjanje	t
00030000-569c-c8b1-8f75-9e1b15f41037	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569c-c8b1-40b1-186a39e7bd55	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569c-c8b1-f756-149879fa8abf	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569c-c8b1-63b0-3d58c088273b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569c-c8b1-c88f-f84a5516991b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569c-c8b1-475f-f92522ea2bf1	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569c-c8b1-2a74-56c42891ee9e	ProgramDela-read	ProgramDela - branje	t
00030000-569c-c8b1-d59e-95bd83863963	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569c-c8b1-d644-a5cb51ef9c45	ProgramFestival-read	ProgramFestival - branje	t
00030000-569c-c8b1-ab1d-5cf216ac5db4	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569c-c8b1-8feb-58b4711637e1	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569c-c8b1-2974-dfffc1e07639	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569c-c8b1-336e-7d3f54267984	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569c-c8b1-12e5-e98a0457f69b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569c-c8b1-2975-77ba9b1140df	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569c-c8b1-b6f8-d94954c14960	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569c-c8b1-1a3c-e85ec435e317	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569c-c8b1-3af3-5cb24015405a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569c-c8b1-4354-f41966d25239	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569c-c8b1-dc32-c95bad64fdb8	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569c-c8b1-c07d-ec011bdcc6b2	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569c-c8b1-465d-3dafc4b79891	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569c-c8b1-c18a-bb93e857fec1	ProgramRazno-read	ProgramRazno - branje	t
00030000-569c-c8b1-3953-a4af7fa80564	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569c-c8b1-633c-b4847e3887fa	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569c-c8b1-4f1c-ac43c9b883cc	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569c-c8b1-289b-5839916098e7	Prostor-read	Prostor - branje	t
00030000-569c-c8b1-5c99-a4ade2fd9bfd	Prostor-write	Prostor - spreminjanje	t
00030000-569c-c8b1-56d6-64af29cca77c	Racun-read	Racun - branje	t
00030000-569c-c8b1-75dc-0e8a25367df4	Racun-write	Racun - spreminjanje	t
00030000-569c-c8b1-4914-e001befe8d8c	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569c-c8b1-4574-801bc2e36c61	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569c-c8b1-c8b7-f85946ca0bab	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569c-c8b1-3ca4-75f4f57b4d1c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569c-c8b1-4070-7df3a5591a99	Rekvizit-read	Rekvizit - branje	t
00030000-569c-c8b1-8cef-aca70c290cfc	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569c-c8b1-b71f-19296a7e951c	Revizija-read	Revizija - branje	t
00030000-569c-c8b1-b9bb-b8dfc16863b6	Revizija-write	Revizija - spreminjanje	t
00030000-569c-c8b1-1926-8f5b38bc13a6	Rezervacija-read	Rezervacija - branje	t
00030000-569c-c8b1-e3ce-d90c2d3789f2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569c-c8b1-1888-0a8067d72176	SedezniRed-read	SedezniRed - branje	t
00030000-569c-c8b1-2ae9-0806b8b16862	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569c-c8b1-64ee-f0fe8b9d0b7a	Sedez-read	Sedez - branje	t
00030000-569c-c8b1-b3f1-8a46608ef9d9	Sedez-write	Sedez - spreminjanje	t
00030000-569c-c8b1-dcf8-3b54e5025c3c	Sezona-read	Sezona - branje	t
00030000-569c-c8b1-fd33-bcec0e030ae7	Sezona-write	Sezona - spreminjanje	t
00030000-569c-c8b1-ef7b-322b16e86819	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569c-c8b1-782a-e89d2ebfc7e2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569c-c8b1-1357-c64e42b4a135	Telefonska-read	Telefonska - branje	t
00030000-569c-c8b1-a5cf-d2ff8f377428	Telefonska-write	Telefonska - spreminjanje	t
00030000-569c-c8b1-fd67-d56255703ded	TerminStoritve-read	TerminStoritve - branje	t
00030000-569c-c8b1-e82b-c2669fb57832	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569c-c8b1-53d0-d60c2f87be2b	TipDodatka-read	TipDodatka - branje	t
00030000-569c-c8b1-38e5-d726da046172	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569c-c8b1-c4e3-c45f32423462	TipFunkcije-read	TipFunkcije - branje	t
00030000-569c-c8b1-efa0-7b5e1db0ce1d	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569c-c8b1-3c4a-3b9dfe1aa9d0	TipPopa-read	TipPopa - branje	t
00030000-569c-c8b1-35b8-0b1183e81ea2	TipPopa-write	TipPopa - spreminjanje	t
00030000-569c-c8b1-92d2-a8d5aea8ee8b	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569c-c8b1-d14a-5b6778793da3	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569c-c8b1-ad93-be5c7e2679a5	TipVaje-read	TipVaje - branje	t
00030000-569c-c8b1-3d85-205f4a757d3e	TipVaje-write	TipVaje - spreminjanje	t
00030000-569c-c8b1-f19d-1d09ba179e9a	Trr-read	Trr - branje	t
00030000-569c-c8b1-826e-afe35fa1374c	Trr-write	Trr - spreminjanje	t
00030000-569c-c8b1-7df2-4a05876e401a	Uprizoritev-read	Uprizoritev - branje	t
00030000-569c-c8b1-dfea-c49145144891	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569c-c8b1-390e-0d394d060154	Vaja-read	Vaja - branje	t
00030000-569c-c8b1-ddab-f37ee7f9bcab	Vaja-write	Vaja - spreminjanje	t
00030000-569c-c8b1-206c-066b8e7cb977	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569c-c8b1-4c14-27e4830dbe15	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569c-c8b1-ef63-a5eb88628e81	VrstaStroska-read	VrstaStroska - branje	t
00030000-569c-c8b1-a9db-b57c43c02b98	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569c-c8b1-f047-774940accfb1	Zaposlitev-read	Zaposlitev - branje	t
00030000-569c-c8b1-2a28-e51435e3886e	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569c-c8b1-7502-953df8fd3a2d	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569c-c8b1-a0f5-0b97b4875a92	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569c-c8b1-f021-856c811ef9c4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569c-c8b1-a16d-927cfcc3d5cc	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569c-c8b1-f493-f09bf45eccbd	Job-read	Branje opravil - samo zase - branje	t
00030000-569c-c8b1-be04-28117a81cfe5	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569c-c8b1-c8b6-de9e65263c29	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569c-c8b1-2c59-b9d2e3e4ef41	Report-read	Report - branje	t
00030000-569c-c8b1-b4f9-dcbfcc797faa	Report-write	Report - spreminjanje	t
00030000-569c-c8b1-8640-48a9c5a15676	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569c-c8b1-6a33-9ed24360ef11	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569c-c8b1-a11a-7ab93420101a	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569c-c8b1-3c22-cfcce875c11e	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569c-c8b1-2c6d-7dc4cf914e2b	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569c-c8b1-2a5f-60190acb8873	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569c-c8b1-cd87-ed2f053d177f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569c-c8b1-7327-e36028f1f8c3	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569c-c8b1-3cb1-3ea9f9e7478b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569c-c8b1-d39f-98f1e64885d2	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569c-c8b1-1761-c5e9fa902e90	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569c-c8b1-beec-676c7161f5b0	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569c-c8b1-c6ca-5cf649260b01	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569c-c8b1-7f5d-1d7fc51d236f	Datoteka-write	Datoteka - spreminjanje	t
00030000-569c-c8b1-5514-907d20adc742	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3145 (class 0 OID 37344292)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569c-c8b1-7694-8fca92eb49c1	00030000-569c-c8b1-886c-3a573a49fff1
00020000-569c-c8b1-7694-8fca92eb49c1	00030000-569c-c8b1-4509-461bb6db6235
00020000-569c-c8b1-c99c-f92140f18172	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-f248-ad8bd2381e58
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-0f12-a806b0ea57da
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-5a0e-554945317165
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-2769-2e971897f518	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-814d-105ec29814d9	00030000-569c-c8b1-5a0e-554945317165
00020000-569c-c8b1-814d-105ec29814d9	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-814d-105ec29814d9	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-814d-105ec29814d9	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-814d-105ec29814d9	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-814d-105ec29814d9	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-67ad-d7ecebbcd516	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-67ad-d7ecebbcd516	00030000-569c-c8b1-2a28-e51435e3886e
00020000-569c-c8b1-67ad-d7ecebbcd516	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-67ad-d7ecebbcd516	00030000-569c-c8b1-e35e-bfabdf45d321
00020000-569c-c8b1-67ad-d7ecebbcd516	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-67ad-d7ecebbcd516	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-67ad-d7ecebbcd516	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-0fd5-29ed6f14ba55	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-0fd5-29ed6f14ba55	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-0fd5-29ed6f14ba55	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-4438-fab8d6269b48	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-4438-fab8d6269b48	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-4438-fab8d6269b48	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-4438-fab8d6269b48	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-4438-fab8d6269b48	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-4438-fab8d6269b48	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-4438-fab8d6269b48	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-4438-fab8d6269b48	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-43ad-1d29dece66c4	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-43ad-1d29dece66c4	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-43ad-1d29dece66c4	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-43ad-1d29dece66c4	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-e35e-bfabdf45d321
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-826e-afe35fa1374c
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-6b8e-9addbb445dd1
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-a5cf-d2ff8f377428
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-363d-fb1a13364d82	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-aa58-a6592267d292	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-aa58-a6592267d292	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-aa58-a6592267d292	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-aa58-a6592267d292	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-aa58-a6592267d292	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-aa58-a6592267d292	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-aa58-a6592267d292	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-a5cf-d2ff8f377428
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-6b8e-9addbb445dd1
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-826e-afe35fa1374c
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-f052-4de9db00ef6c
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-d2dd-576e9d9f044c
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-475f-f92522ea2bf1
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-7734-649f5dbf2e08	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-07d1-c5da3d4ab34f	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-8114-5ec671299e60	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-8114-5ec671299e60	00030000-569c-c8b1-35b8-0b1183e81ea2
00020000-569c-c8b1-a6bf-256599311aac	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-885e-7a8c129df4bc	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b1-885e-7a8c129df4bc	00030000-569c-c8b1-7152-11c8fdab6a30
00020000-569c-c8b1-16c2-2599caea4108	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b1-44bb-585f46a0c4ec	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-44bb-585f46a0c4ec	00030000-569c-c8b1-e925-5c8dea85f915
00020000-569c-c8b1-0e7f-840aff4a8710	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-e7ff-22f5dceb0041	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b1-e7ff-22f5dceb0041	00030000-569c-c8b1-a16d-927cfcc3d5cc
00020000-569c-c8b1-98ae-f56cabeaea00	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b1-c61d-550357e140bc	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b1-c61d-550357e140bc	00030000-569c-c8b1-a0f5-0b97b4875a92
00020000-569c-c8b1-9780-1d91798017a8	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b1-5e33-47d7cac7bbd7	00030000-569c-c8b1-36ba-e32c0a4ad23e
00020000-569c-c8b1-5e33-47d7cac7bbd7	00030000-569c-c8b1-e558-47eeb9183f00
00020000-569c-c8b1-ae43-925346e69051	00030000-569c-c8b1-36ba-e32c0a4ad23e
00020000-569c-c8b1-d5d3-b6b93b8bd3de	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b1-d5d3-b6b93b8bd3de	00030000-569c-c8b1-5c99-a4ade2fd9bfd
00020000-569c-c8b1-d5d3-b6b93b8bd3de	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-d5d3-b6b93b8bd3de	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-d5d3-b6b93b8bd3de	00030000-569c-c8b1-6b8e-9addbb445dd1
00020000-569c-c8b1-d5d3-b6b93b8bd3de	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-ed6b-d60cc0550689	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b1-ed6b-d60cc0550689	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-ed6b-d60cc0550689	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-5474-094c5e366448	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-5474-094c5e366448	00030000-569c-c8b1-a9db-b57c43c02b98
00020000-569c-c8b1-0f98-f637c2dbe17a	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-6623-7cf51626f0e1	00030000-569c-c8b1-6ed1-372d206af0bc
00020000-569c-c8b1-6623-7cf51626f0e1	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-6623-7cf51626f0e1	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-6623-7cf51626f0e1	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-6623-7cf51626f0e1	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-6623-7cf51626f0e1	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-6623-7cf51626f0e1	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-6623-7cf51626f0e1	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-6623-7cf51626f0e1	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-c90a-fc824c4e3600	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-c90a-fc824c4e3600	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-c90a-fc824c4e3600	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-c90a-fc824c4e3600	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-c90a-fc824c4e3600	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-77ea-532d2cbdb7bd	00030000-569c-c8b1-ad93-be5c7e2679a5
00020000-569c-c8b1-77ea-532d2cbdb7bd	00030000-569c-c8b1-3d85-205f4a757d3e
00020000-569c-c8b1-8fc2-e96516db3296	00030000-569c-c8b1-ad93-be5c7e2679a5
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-00fb-57c33c7ce760
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-eaa7-06922c42e517
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-2a74-56c42891ee9e
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-d59e-95bd83863963
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-d644-a5cb51ef9c45
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-ab1d-5cf216ac5db4
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-8feb-58b4711637e1
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-2974-dfffc1e07639
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-336e-7d3f54267984
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-12e5-e98a0457f69b
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-2975-77ba9b1140df
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-b6f8-d94954c14960
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-1a3c-e85ec435e317
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-3af3-5cb24015405a
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-4354-f41966d25239
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-dc32-c95bad64fdb8
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-c07d-ec011bdcc6b2
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-465d-3dafc4b79891
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-c18a-bb93e857fec1
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-3953-a4af7fa80564
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-633c-b4847e3887fa
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-4f1c-ac43c9b883cc
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-63b0-3d58c088273b
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-1b75-7bc26c0f2c39
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-f346-60d71f4edc77
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-be04-28117a81cfe5
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-f335-8f261c88be8a
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-f756-149879fa8abf
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-623c-5a49b5e1679c
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-f493-f09bf45eccbd
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-7e1d-7adcade25c97	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-2a74-56c42891ee9e
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-d644-a5cb51ef9c45
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-8feb-58b4711637e1
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-336e-7d3f54267984
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-2975-77ba9b1140df
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-1a3c-e85ec435e317
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-4354-f41966d25239
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-c07d-ec011bdcc6b2
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-c18a-bb93e857fec1
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-633c-b4847e3887fa
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-f756-149879fa8abf
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-f335-8f261c88be8a
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-623c-5a49b5e1679c
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-f493-f09bf45eccbd
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-0253-8b5f9c29c65a	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-dfea-c49145144891
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-532f-81daa2dbb4d6
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-833c-3d74bee0dbea
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-a992-9c811ec48ae8
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-65d8-b3ff58deaf11	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-e2a3-ef46e10f6d1c	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-a9e2-de6da7ca3889	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-a9e2-de6da7ca3889	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b1-a9e2-de6da7ca3889	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-a9e2-de6da7ca3889	00030000-569c-c8b1-833c-3d74bee0dbea
00020000-569c-c8b1-a9e2-de6da7ca3889	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-a9e2-de6da7ca3889	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-a9e2-de6da7ca3889	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-a9e2-de6da7ca3889	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-532f-81daa2dbb4d6
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-e35e-bfabdf45d321
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-97fd-bb80f255bf87
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-782a-e89d2ebfc7e2
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-7d8e-44c01a35fc99	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-1baf-f07fc397f9ec	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-f6a2-56b973672fbe	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-f6a2-56b973672fbe	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-f6a2-56b973672fbe	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-f6a2-56b973672fbe	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b1-f6a2-56b973672fbe	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-f6a2-56b973672fbe	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-f6a2-56b973672fbe	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-8420-223a190027f6	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-8420-223a190027f6	00030000-569c-c8b1-782a-e89d2ebfc7e2
00020000-569c-c8b1-8420-223a190027f6	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-8420-223a190027f6	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-38bf-13df6b144ec2	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-38bf-13df6b144ec2	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-36ba-e32c0a4ad23e
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-532f-81daa2dbb4d6
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-5a0e-554945317165
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-f248-ad8bd2381e58
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-0f12-a806b0ea57da
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-f335-8f261c88be8a
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-1b75-7bc26c0f2c39
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-833c-3d74bee0dbea
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-a992-9c811ec48ae8
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-f493-f09bf45eccbd
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-be04-28117a81cfe5
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-e35e-bfabdf45d321
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-97fd-bb80f255bf87
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-623c-5a49b5e1679c
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-f346-60d71f4edc77
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-f756-149879fa8abf
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-63b0-3d58c088273b
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-00fb-57c33c7ce760
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-2a74-56c42891ee9e
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-eaa7-06922c42e517
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-d59e-95bd83863963
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-d644-a5cb51ef9c45
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-ab1d-5cf216ac5db4
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-8feb-58b4711637e1
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-2974-dfffc1e07639
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-336e-7d3f54267984
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-12e5-e98a0457f69b
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-2975-77ba9b1140df
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-b6f8-d94954c14960
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-1a3c-e85ec435e317
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-3af3-5cb24015405a
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-4354-f41966d25239
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-dc32-c95bad64fdb8
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-c07d-ec011bdcc6b2
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-465d-3dafc4b79891
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-c18a-bb93e857fec1
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-3953-a4af7fa80564
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-633c-b4847e3887fa
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-4f1c-ac43c9b883cc
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-782a-e89d2ebfc7e2
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-ad93-be5c7e2679a5
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-dfea-c49145144891
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b1-5f36-cc7310a4a8d8	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-36ba-e32c0a4ad23e
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-5a0e-554945317165
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-f248-ad8bd2381e58
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-0f12-a806b0ea57da
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-ad93-be5c7e2679a5
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b1-fff3-2420078c2873	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-36ba-e32c0a4ad23e
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-532f-81daa2dbb4d6
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-5a0e-554945317165
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-f248-ad8bd2381e58
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-0f12-a806b0ea57da
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-833c-3d74bee0dbea
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-a992-9c811ec48ae8
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-ad93-be5c7e2679a5
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-dfea-c49145144891
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b1-9f9b-df18e76b362c	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-532f-81daa2dbb4d6
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-5a0e-554945317165
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-f248-ad8bd2381e58
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-0f12-a806b0ea57da
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-f335-8f261c88be8a
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-1b75-7bc26c0f2c39
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-833c-3d74bee0dbea
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-a992-9c811ec48ae8
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-f493-f09bf45eccbd
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-be04-28117a81cfe5
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-d2dd-576e9d9f044c
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-e35e-bfabdf45d321
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-97fd-bb80f255bf87
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-f052-4de9db00ef6c
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-623c-5a49b5e1679c
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-f346-60d71f4edc77
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-6b8e-9addbb445dd1
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-f756-149879fa8abf
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-63b0-3d58c088273b
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-475f-f92522ea2bf1
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-00fb-57c33c7ce760
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-2a74-56c42891ee9e
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-eaa7-06922c42e517
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-d59e-95bd83863963
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-d644-a5cb51ef9c45
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-ab1d-5cf216ac5db4
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-8feb-58b4711637e1
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-2974-dfffc1e07639
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-336e-7d3f54267984
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-12e5-e98a0457f69b
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-2975-77ba9b1140df
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-b6f8-d94954c14960
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-1a3c-e85ec435e317
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-3af3-5cb24015405a
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-4354-f41966d25239
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-dc32-c95bad64fdb8
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-c07d-ec011bdcc6b2
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-465d-3dafc4b79891
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-c18a-bb93e857fec1
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-3953-a4af7fa80564
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-633c-b4847e3887fa
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-4f1c-ac43c9b883cc
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-782a-e89d2ebfc7e2
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-a5cf-d2ff8f377428
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-826e-afe35fa1374c
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-dfea-c49145144891
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-2a28-e51435e3886e
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b1-9230-673ddabad152	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-36ba-e32c0a4ad23e
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-532f-81daa2dbb4d6
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-5a0e-554945317165
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-f248-ad8bd2381e58
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-0f12-a806b0ea57da
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-833c-3d74bee0dbea
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-a992-9c811ec48ae8
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-d2dd-576e9d9f044c
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-e35e-bfabdf45d321
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-f052-4de9db00ef6c
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-6b8e-9addbb445dd1
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-475f-f92522ea2bf1
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-a5cf-d2ff8f377428
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-ad93-be5c7e2679a5
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-826e-afe35fa1374c
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-dfea-c49145144891
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-2a28-e51435e3886e
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b1-bfb9-a43f483480eb	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-36ba-e32c0a4ad23e
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-5a0e-554945317165
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-833c-3d74bee0dbea
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-ad93-be5c7e2679a5
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b1-6a80-a7cbdda4f61c	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-36ba-e32c0a4ad23e
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-532f-81daa2dbb4d6
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-f335-8f261c88be8a
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-1b75-7bc26c0f2c39
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-f493-f09bf45eccbd
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-be04-28117a81cfe5
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-d2dd-576e9d9f044c
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-6ed1-372d206af0bc
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-e35e-bfabdf45d321
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-97fd-bb80f255bf87
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-f052-4de9db00ef6c
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-623c-5a49b5e1679c
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-f346-60d71f4edc77
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-6b8e-9addbb445dd1
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-f756-149879fa8abf
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-63b0-3d58c088273b
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-475f-f92522ea2bf1
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-00fb-57c33c7ce760
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-2a74-56c42891ee9e
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-eaa7-06922c42e517
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-d59e-95bd83863963
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-d644-a5cb51ef9c45
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-ab1d-5cf216ac5db4
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-8feb-58b4711637e1
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-2974-dfffc1e07639
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-336e-7d3f54267984
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-12e5-e98a0457f69b
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-2975-77ba9b1140df
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-b6f8-d94954c14960
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-1a3c-e85ec435e317
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-3af3-5cb24015405a
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-4354-f41966d25239
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-dc32-c95bad64fdb8
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-c07d-ec011bdcc6b2
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-465d-3dafc4b79891
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-c18a-bb93e857fec1
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-3953-a4af7fa80564
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-633c-b4847e3887fa
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-4f1c-ac43c9b883cc
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-782a-e89d2ebfc7e2
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-a5cf-d2ff8f377428
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-ad93-be5c7e2679a5
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-826e-afe35fa1374c
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-a9db-b57c43c02b98
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-2a28-e51435e3886e
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b1-a6f3-24b654d8560d	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-4509-461bb6db6235
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-886c-3a573a49fff1
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-36ba-e32c0a4ad23e
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-e558-47eeb9183f00
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-532f-81daa2dbb4d6
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f6ae-de66cfcf6949
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-3cc6-c1bf0b18da2a
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-09c8-f59eff3d64aa
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-5469-e443523ac6f3
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-5a0e-554945317165
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f248-ad8bd2381e58
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-45b7-f85373619c6f
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-0f12-a806b0ea57da
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-8d89-cf2c8e527ebb
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-0e1a-488f032af2f4
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-97a8-207b1a3e0337
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-bc4e-ae19c4df0c07
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-ac3d-2760b17ec9a4
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-c972-7fe05642b8dc
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-7c9a-a7b3da8864b5
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-d880-0bb3510aade0
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-9ae7-cbff858ecdea
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f335-8f261c88be8a
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-1b75-7bc26c0f2c39
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-21f2-92ce4fbaeb45
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-e925-5c8dea85f915
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-6bff-a364d3e750d7
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-0041-71c871f2c21c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-a992-9c811ec48ae8
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-833c-3d74bee0dbea
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2f92-0d11e20c5703
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-31d9-4847f5e65487
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-c8b6-de9e65263c29
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f493-f09bf45eccbd
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-be04-28117a81cfe5
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-35b6-e8ca2a7c3ef6
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-d2dd-576e9d9f044c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-c930-00373d31e448
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-fd9f-62a80b6cbcf6
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-cd87-ed2f053d177f
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2a5f-60190acb8873
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-6a33-9ed24360ef11
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-a11a-7ab93420101a
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-3c22-cfcce875c11e
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2c6d-7dc4cf914e2b
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-7329-3972a9418615
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-26a0-4b521e41d459
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2de2-e1c026ee6a47
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-8df0-f33eed49804d
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-8ffa-02cbeac8e218
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-08ac-86291d432cf3
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-0cf6-b726e7b45969
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-6ed1-372d206af0bc
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-e35e-bfabdf45d321
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-4919-dda2f8471ba6
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-1c7d-f2b23a98e64f
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-0d9c-d033f9142169
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-d2cf-bf749aaaa675
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-97fd-bb80f255bf87
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f052-4de9db00ef6c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-a1c3-e2be403e7360
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-623c-5a49b5e1679c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f346-60d71f4edc77
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-7607-f36b13a630ff
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2786-fbd142bdc5cd
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-7152-11c8fdab6a30
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-6b8e-9addbb445dd1
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-add8-398344184db3
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f3a6-f669d3334762
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-6509-66fafa316b28
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-5127-98bdb6c4aa32
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-8f75-9e1b15f41037
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-40b1-186a39e7bd55
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f756-149879fa8abf
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-63b0-3d58c088273b
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-c88f-f84a5516991b
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-475f-f92522ea2bf1
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-00fb-57c33c7ce760
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2a74-56c42891ee9e
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-eaa7-06922c42e517
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-d59e-95bd83863963
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-d644-a5cb51ef9c45
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-ab1d-5cf216ac5db4
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-8feb-58b4711637e1
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2974-dfffc1e07639
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-336e-7d3f54267984
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-12e5-e98a0457f69b
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2975-77ba9b1140df
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-b6f8-d94954c14960
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-1a3c-e85ec435e317
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-3af3-5cb24015405a
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-4354-f41966d25239
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-dc32-c95bad64fdb8
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-c07d-ec011bdcc6b2
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-465d-3dafc4b79891
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-c18a-bb93e857fec1
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-3953-a4af7fa80564
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-633c-b4847e3887fa
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-4f1c-ac43c9b883cc
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-289b-5839916098e7
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-5c99-a4ade2fd9bfd
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-56d6-64af29cca77c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-75dc-0e8a25367df4
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-4914-e001befe8d8c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-4574-801bc2e36c61
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-c8b7-f85946ca0bab
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-3ca4-75f4f57b4d1c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-4070-7df3a5591a99
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-8cef-aca70c290cfc
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2c59-b9d2e3e4ef41
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-b4f9-dcbfcc797faa
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-b71f-19296a7e951c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-b9bb-b8dfc16863b6
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-1926-8f5b38bc13a6
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-e3ce-d90c2d3789f2
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-1888-0a8067d72176
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2ae9-0806b8b16862
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-64ee-f0fe8b9d0b7a
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-b3f1-8a46608ef9d9
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-dcf8-3b54e5025c3c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-fd33-bcec0e030ae7
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-8640-48a9c5a15676
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-782a-e89d2ebfc7e2
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-a5cf-d2ff8f377428
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-fd67-d56255703ded
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-83f9-26d31145e9b5
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-e82b-c2669fb57832
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-c4e3-c45f32423462
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-efa0-7b5e1db0ce1d
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-3c4a-3b9dfe1aa9d0
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-35b8-0b1183e81ea2
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-92d2-a8d5aea8ee8b
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-d14a-5b6778793da3
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-ad93-be5c7e2679a5
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-3d85-205f4a757d3e
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-826e-afe35fa1374c
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-dfea-c49145144891
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-390e-0d394d060154
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-ddab-f37ee7f9bcab
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-206c-066b8e7cb977
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-4c14-27e4830dbe15
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-ef63-a5eb88628e81
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-a9db-b57c43c02b98
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-c6ca-5cf649260b01
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-beec-676c7161f5b0
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-2a28-e51435e3886e
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-7502-953df8fd3a2d
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-a0f5-0b97b4875a92
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-f021-856c811ef9c4
00020000-569c-c8b3-4ce7-ea7db0a90c03	00030000-569c-c8b1-a16d-927cfcc3d5cc
00020000-569c-c8b3-ea39-fc4bd0c0345f	00030000-569c-c8b1-1761-c5e9fa902e90
00020000-569c-c8b3-579e-34ff8e19a21e	00030000-569c-c8b1-d39f-98f1e64885d2
00020000-569c-c8b3-3173-aad520b1cebc	00030000-569c-c8b1-dfea-c49145144891
00020000-569c-c8b3-da53-c729d3987e91	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b3-eee7-86820f09ecf2	00030000-569c-c8b1-a11a-7ab93420101a
00020000-569c-c8b3-1146-8fc4409bd66c	00030000-569c-c8b1-3c22-cfcce875c11e
00020000-569c-c8b3-bf6a-2e791ddd4018	00030000-569c-c8b1-2c6d-7dc4cf914e2b
00020000-569c-c8b3-459a-cf0d2aed3938	00030000-569c-c8b1-6a33-9ed24360ef11
00020000-569c-c8b3-bfeb-55aa6a52b15b	00030000-569c-c8b1-cd87-ed2f053d177f
00020000-569c-c8b3-2ff0-d0e30e52e233	00030000-569c-c8b1-2a5f-60190acb8873
00020000-569c-c8b3-7858-2210e88fea4d	00030000-569c-c8b1-3cb1-3ea9f9e7478b
00020000-569c-c8b3-8aee-63e825ddb00f	00030000-569c-c8b1-7327-e36028f1f8c3
00020000-569c-c8b3-527f-873280df6145	00030000-569c-c8b1-20f3-93bb135621b2
00020000-569c-c8b3-a1b6-f46c0f727f49	00030000-569c-c8b1-6802-490ec9fbc0d5
00020000-569c-c8b3-aed4-9521f6da51b6	00030000-569c-c8b1-e35e-bfabdf45d321
00020000-569c-c8b3-5ce3-54bd6f5a1073	00030000-569c-c8b1-cb80-ca14a3e58f2a
00020000-569c-c8b3-80b5-fb67e7edc618	00030000-569c-c8b1-7f5d-1d7fc51d236f
00020000-569c-c8b3-8fe0-86a9f80e7d3a	00030000-569c-c8b1-5514-907d20adc742
00020000-569c-c8b3-3b8a-009d131f5045	00030000-569c-c8b1-960b-65d1e23166da
00020000-569c-c8b3-3b8a-009d131f5045	00030000-569c-c8b1-f052-4de9db00ef6c
00020000-569c-c8b3-3b8a-009d131f5045	00030000-569c-c8b1-7df2-4a05876e401a
00020000-569c-c8b3-cb52-66aeebf66723	00030000-569c-c8b1-f19d-1d09ba179e9a
00020000-569c-c8b3-ca77-0f5cfe747151	00030000-569c-c8b1-826e-afe35fa1374c
00020000-569c-c8b3-5d4b-9d68f687ff70	00030000-569c-c8b1-8640-48a9c5a15676
00020000-569c-c8b3-1526-16f23f347c59	00030000-569c-c8b1-1357-c64e42b4a135
00020000-569c-c8b3-ab7f-77efc9ad7507	00030000-569c-c8b1-a5cf-d2ff8f377428
00020000-569c-c8b3-002c-0ed70d2e938a	00030000-569c-c8b1-29e3-f3463cb717c0
00020000-569c-c8b3-fa70-16416392e0fe	00030000-569c-c8b1-6b8e-9addbb445dd1
00020000-569c-c8b3-7e1f-95694691695b	00030000-569c-c8b1-f047-774940accfb1
00020000-569c-c8b3-2499-3ecd560b3925	00030000-569c-c8b1-2a28-e51435e3886e
00020000-569c-c8b3-cbd6-a7352f563865	00030000-569c-c8b1-4952-cbd4a6248b10
00020000-569c-c8b3-676d-3aeea0016b00	00030000-569c-c8b1-97fd-bb80f255bf87
00020000-569c-c8b3-9f82-384b30e808a5	00030000-569c-c8b1-ef7b-322b16e86819
00020000-569c-c8b3-ae60-a33d552d3240	00030000-569c-c8b1-782a-e89d2ebfc7e2
00020000-569c-c8b3-ab3c-9f8851e6e300	00030000-569c-c8b1-dbbe-8d367cca9721
00020000-569c-c8b3-a85f-cf98d71a2d76	00030000-569c-c8b1-3e80-c3bbd4107731
00020000-569c-c8b3-3ed5-5c1f2aec4126	00030000-569c-c8b1-532f-81daa2dbb4d6
00020000-569c-c8b3-84c9-a7dafbb67ec6	00030000-569c-c8b1-20a3-9adfd12dad7a
00020000-569c-c8b3-b682-d31bb943e687	00030000-569c-c8b1-833c-3d74bee0dbea
00020000-569c-c8b3-c3c9-7325d51fcc96	00030000-569c-c8b1-a992-9c811ec48ae8
\.


--
-- TOC entry 3184 (class 0 OID 37344692)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 37344726)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 37344859)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569c-c8b3-6f14-f37346ef6626	00090000-569c-c8b3-e8a3-31a9908fe6fd	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569c-c8b3-c686-097aa6afa6fa	00090000-569c-c8b3-18df-97e93d43d829	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569c-c8b3-db3a-b0166a580443	00090000-569c-c8b3-363d-8d09ec8cb49e	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569c-c8b3-d352-e643e30b9dd6	00090000-569c-c8b3-4400-1ed886855fcf	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3153 (class 0 OID 37344374)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569c-c8b3-ca73-b3847ef7f360	\N	00040000-569c-c8b0-06ae-79104035809e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-c8b3-2a64-4fc04d3e4379	\N	00040000-569c-c8b0-06ae-79104035809e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569c-c8b3-75b9-dcad0526844c	\N	00040000-569c-c8b0-06ae-79104035809e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-c8b3-6e5d-3142812b21b4	\N	00040000-569c-c8b0-06ae-79104035809e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-c8b3-0e65-06280306f61c	\N	00040000-569c-c8b0-06ae-79104035809e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-c8b3-dab5-bbeea6d6660c	\N	00040000-569c-c8b0-9698-a35ef433598e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-c8b3-aee5-c94f5f17f73a	\N	00040000-569c-c8b0-f2bc-8e7b5c770403	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-c8b3-549a-b3ae58fb99f6	\N	00040000-569c-c8b0-3b6e-b31965f70b0a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-c8b3-b345-9bc44cbbe890	\N	00040000-569c-c8b0-01ef-e11c778d3216	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569c-c8b5-470a-9669532f2031	\N	00040000-569c-c8b0-06ae-79104035809e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3156 (class 0 OID 37344419)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569c-c8b0-fba1-1e2162e9e420	8341	Adlešiči
00050000-569c-c8b0-6073-bbbe301c8a1f	5270	Ajdovščina
00050000-569c-c8b0-dab0-98e8f219e17a	6280	Ankaran/Ancarano
00050000-569c-c8b0-2008-eecb9abad083	9253	Apače
00050000-569c-c8b0-be86-c6d096803fbb	8253	Artiče
00050000-569c-c8b0-8d61-de45a429cb26	4275	Begunje na Gorenjskem
00050000-569c-c8b0-466f-ef16b7341b87	1382	Begunje pri Cerknici
00050000-569c-c8b0-098b-281a7d99e49e	9231	Beltinci
00050000-569c-c8b0-3f3c-c67fe3cc6c8e	2234	Benedikt
00050000-569c-c8b0-0bb9-8456e73ab18c	2345	Bistrica ob Dravi
00050000-569c-c8b0-1770-8cadd53746fb	3256	Bistrica ob Sotli
00050000-569c-c8b0-54cd-a64c624e3133	8259	Bizeljsko
00050000-569c-c8b0-b72a-68fe7bc84255	1223	Blagovica
00050000-569c-c8b0-c134-a0398002b8b3	8283	Blanca
00050000-569c-c8b0-31bc-536f1eb7e29c	4260	Bled
00050000-569c-c8b0-789d-92d2fa1e19b1	4273	Blejska Dobrava
00050000-569c-c8b0-9636-b09140155fe5	9265	Bodonci
00050000-569c-c8b0-e99c-c635806346fe	9222	Bogojina
00050000-569c-c8b0-0628-ba19c3a54573	4263	Bohinjska Bela
00050000-569c-c8b0-3d6e-57075b947f4d	4264	Bohinjska Bistrica
00050000-569c-c8b0-4d84-a5e9979b8fec	4265	Bohinjsko jezero
00050000-569c-c8b0-dc04-e0e11a6f4c35	1353	Borovnica
00050000-569c-c8b0-d20c-b7c7b54c4da8	8294	Boštanj
00050000-569c-c8b0-432e-592d33834319	5230	Bovec
00050000-569c-c8b0-9444-39f97be328c6	5295	Branik
00050000-569c-c8b0-78b1-7ab6497ddedc	3314	Braslovče
00050000-569c-c8b0-a63d-fba38ad079c0	5223	Breginj
00050000-569c-c8b0-edf4-283c73a896f1	8280	Brestanica
00050000-569c-c8b0-037a-b3ab8724e4f0	2354	Bresternica
00050000-569c-c8b0-52d4-5f02085f088e	4243	Brezje
00050000-569c-c8b0-8293-65434c634e91	1351	Brezovica pri Ljubljani
00050000-569c-c8b0-f29c-e3e11ef25de1	8250	Brežice
00050000-569c-c8b0-1d8f-ef999a95f263	4210	Brnik - Aerodrom
00050000-569c-c8b0-c791-a6563eb5ecef	8321	Brusnice
00050000-569c-c8b0-595e-c7cba02ccc44	3255	Buče
00050000-569c-c8b0-fe66-ed8be74107ac	8276	Bučka 
00050000-569c-c8b0-4d8a-16c577103b33	9261	Cankova
00050000-569c-c8b0-c26e-bd90592795d1	3000	Celje 
00050000-569c-c8b0-8d83-c35c21e86b68	3001	Celje - poštni predali
00050000-569c-c8b0-ee1e-5ae88732c9f2	4207	Cerklje na Gorenjskem
00050000-569c-c8b0-3348-0446375290b7	8263	Cerklje ob Krki
00050000-569c-c8b0-eafc-b8dd9c1e197f	1380	Cerknica
00050000-569c-c8b0-77b1-764e0e0b885b	5282	Cerkno
00050000-569c-c8b0-47b7-7c98cbba1dda	2236	Cerkvenjak
00050000-569c-c8b0-4fb4-8231cf8ec33d	2215	Ceršak
00050000-569c-c8b0-2644-dd87e2d61d2f	2326	Cirkovce
00050000-569c-c8b0-64c5-3945668bd3f1	2282	Cirkulane
00050000-569c-c8b0-a3cd-49362de5c0c0	5273	Col
00050000-569c-c8b0-107c-b103c8931051	8251	Čatež ob Savi
00050000-569c-c8b0-cf09-ef5d69159150	1413	Čemšenik
00050000-569c-c8b0-372f-54cbc1ab7f9b	5253	Čepovan
00050000-569c-c8b0-ada3-c6d033bcc71a	9232	Črenšovci
00050000-569c-c8b0-e45a-d5ba9d700ae8	2393	Črna na Koroškem
00050000-569c-c8b0-3fa3-b37f56ba10fb	6275	Črni Kal
00050000-569c-c8b0-6579-6996b747d593	5274	Črni Vrh nad Idrijo
00050000-569c-c8b0-0dee-0663fe00a764	5262	Črniče
00050000-569c-c8b0-05a4-47472abc558e	8340	Črnomelj
00050000-569c-c8b0-f87d-f15cde0ef905	6271	Dekani
00050000-569c-c8b0-6a1d-25c82749e0f4	5210	Deskle
00050000-569c-c8b0-4dfd-3dea3727aeba	2253	Destrnik
00050000-569c-c8b0-c973-78b526cef72a	6215	Divača
00050000-569c-c8b0-4b96-9e5d84d4e35f	1233	Dob
00050000-569c-c8b0-10e6-9f2ad2125579	3224	Dobje pri Planini
00050000-569c-c8b0-5549-2c3ff10bded5	8257	Dobova
00050000-569c-c8b0-667b-3241f1c53cdd	1423	Dobovec
00050000-569c-c8b0-818e-32bd02ed4b1b	5263	Dobravlje
00050000-569c-c8b0-8e34-fd5330c711b9	3204	Dobrna
00050000-569c-c8b0-f041-7c395ef3c433	8211	Dobrnič
00050000-569c-c8b0-3dde-79da73fc567e	1356	Dobrova
00050000-569c-c8b0-590d-c31683359d35	9223	Dobrovnik/Dobronak 
00050000-569c-c8b0-5efe-0aa8c0a0103f	5212	Dobrovo v Brdih
00050000-569c-c8b0-e557-3bc2baf6317c	1431	Dol pri Hrastniku
00050000-569c-c8b0-ac4b-f780be01afdf	1262	Dol pri Ljubljani
00050000-569c-c8b0-31a6-a30a51c8aac8	1273	Dole pri Litiji
00050000-569c-c8b0-ed5f-6e4f7d138bd8	1331	Dolenja vas
00050000-569c-c8b0-13f4-ef451a4ec371	8350	Dolenjske Toplice
00050000-569c-c8b0-9367-9d6866ee4d19	1230	Domžale
00050000-569c-c8b0-3514-7ef52653775a	2252	Dornava
00050000-569c-c8b0-fc1f-37b31a784917	5294	Dornberk
00050000-569c-c8b0-85cd-720c30008f70	1319	Draga
00050000-569c-c8b0-c8ca-ad030339de1b	8343	Dragatuš
00050000-569c-c8b0-c524-bf00b962ac15	3222	Dramlje
00050000-569c-c8b0-eb16-d18445e3b0cf	2370	Dravograd
00050000-569c-c8b0-d75b-5be981277194	4203	Duplje
00050000-569c-c8b0-c5cf-adf8e7d11b95	6221	Dutovlje
00050000-569c-c8b0-d934-37ad25133e3d	8361	Dvor
00050000-569c-c8b0-1d26-ebf28f789c22	2343	Fala
00050000-569c-c8b0-4f4b-7024b63b9879	9208	Fokovci
00050000-569c-c8b0-f13b-ef9a7d4ff18a	2313	Fram
00050000-569c-c8b0-f25b-c3104c3ea5bc	3213	Frankolovo
00050000-569c-c8b0-0341-aa3b74a9c984	1274	Gabrovka
00050000-569c-c8b0-ffde-bf788cb4692a	8254	Globoko
00050000-569c-c8b0-47ff-fda8759c309d	5275	Godovič
00050000-569c-c8b0-2931-adbbf3097a43	4204	Golnik
00050000-569c-c8b0-b849-e48b04c56999	3303	Gomilsko
00050000-569c-c8b0-845a-8701695d9e98	4224	Gorenja vas
00050000-569c-c8b0-fb6c-279748f5ef55	3263	Gorica pri Slivnici
00050000-569c-c8b0-0c36-50251245c509	2272	Gorišnica
00050000-569c-c8b0-b258-c54e2b988fc7	9250	Gornja Radgona
00050000-569c-c8b0-ea32-59530c50292b	3342	Gornji Grad
00050000-569c-c8b0-6afd-a23d8f9a0dd1	4282	Gozd Martuljek
00050000-569c-c8b0-5b3c-5e6dd0bb9ef8	6272	Gračišče
00050000-569c-c8b0-e138-a0dbe4edc211	9264	Grad
00050000-569c-c8b0-890d-624528a998e7	8332	Gradac
00050000-569c-c8b0-d053-bcc354d9d8e7	1384	Grahovo
00050000-569c-c8b0-82e3-c63321029299	5242	Grahovo ob Bači
00050000-569c-c8b0-7eb5-080c976a8a2a	5251	Grgar
00050000-569c-c8b0-2684-7cf6789c1fec	3302	Griže
00050000-569c-c8b0-8fcd-1496d027a523	3231	Grobelno
00050000-569c-c8b0-2df5-9c21bd06448c	1290	Grosuplje
00050000-569c-c8b0-ece5-54d945b532ae	2288	Hajdina
00050000-569c-c8b0-d13e-015f6e625dcb	8362	Hinje
00050000-569c-c8b0-82ce-3948fb8149c3	2311	Hoče
00050000-569c-c8b0-63e5-9375b66ebb64	9205	Hodoš/Hodos
00050000-569c-c8b0-7762-051828697482	1354	Horjul
00050000-569c-c8b0-b8dd-b09f35ee0bb2	1372	Hotedršica
00050000-569c-c8b0-535e-846a341feb34	1430	Hrastnik
00050000-569c-c8b0-a9d0-1a649d9ef426	6225	Hruševje
00050000-569c-c8b0-5e36-241e13a00e22	4276	Hrušica
00050000-569c-c8b0-41fe-fe00761cc6d1	5280	Idrija
00050000-569c-c8b0-45d4-6b056da137e4	1292	Ig
00050000-569c-c8b0-2ee9-a3d0b4ef6fe0	6250	Ilirska Bistrica
00050000-569c-c8b0-3fce-ee6094fe0ea4	6251	Ilirska Bistrica-Trnovo
00050000-569c-c8b0-9903-15ba29568b8f	1295	Ivančna Gorica
00050000-569c-c8b0-dd68-f9d97f2b0466	2259	Ivanjkovci
00050000-569c-c8b0-d0b2-23d5650b13a7	1411	Izlake
00050000-569c-c8b0-f120-5c23e390dc4d	6310	Izola/Isola
00050000-569c-c8b0-362c-e9502983d8ed	2222	Jakobski Dol
00050000-569c-c8b0-1df7-1131cc7a429f	2221	Jarenina
00050000-569c-c8b0-2fcb-72e12d148a1d	6254	Jelšane
00050000-569c-c8b0-0c24-edcfbe48fbf6	4270	Jesenice
00050000-569c-c8b0-48d3-db21c86fae59	8261	Jesenice na Dolenjskem
00050000-569c-c8b0-87ab-fed609910df8	3273	Jurklošter
00050000-569c-c8b0-9a06-51ff98a45d8c	2223	Jurovski Dol
00050000-569c-c8b0-3cbf-d7fb17ba72e7	2256	Juršinci
00050000-569c-c8b0-059e-3a71907023c4	5214	Kal nad Kanalom
00050000-569c-c8b0-6b37-c25fbc22b53e	3233	Kalobje
00050000-569c-c8b0-c754-d13c1e141139	4246	Kamna Gorica
00050000-569c-c8b0-4e54-07ce8fc3f113	2351	Kamnica
00050000-569c-c8b0-d501-b92718950a42	1241	Kamnik
00050000-569c-c8b0-ed4d-2b1a5172d4d8	5213	Kanal
00050000-569c-c8b0-92c9-4bf2f7a4c56c	8258	Kapele
00050000-569c-c8b0-4e8d-5ef085aa0449	2362	Kapla
00050000-569c-c8b0-b46d-df1c445eb85c	2325	Kidričevo
00050000-569c-c8b0-931e-f0b25ad4d5d0	1412	Kisovec
00050000-569c-c8b0-9d2b-e26174f322b9	6253	Knežak
00050000-569c-c8b0-7641-2fdf8431c391	5222	Kobarid
00050000-569c-c8b0-cfb8-f1dd76b9cd28	9227	Kobilje
00050000-569c-c8b0-5de4-0ffece7df897	1330	Kočevje
00050000-569c-c8b0-b2af-71ac93c9b4fb	1338	Kočevska Reka
00050000-569c-c8b0-5a1b-8c357d2dd5f8	2276	Kog
00050000-569c-c8b0-ed64-ca5b9fb2ece9	5211	Kojsko
00050000-569c-c8b0-7ab6-2f0cf65e8205	6223	Komen
00050000-569c-c8b0-18ba-d8eb5fae104d	1218	Komenda
00050000-569c-c8b0-91b9-668299e47be8	6000	Koper/Capodistria 
00050000-569c-c8b0-2961-c1b1415db657	6001	Koper/Capodistria - poštni predali
00050000-569c-c8b0-fb48-790b7302581a	8282	Koprivnica
00050000-569c-c8b0-6f97-616d37dcf4e4	5296	Kostanjevica na Krasu
00050000-569c-c8b0-5dae-e608344fc91a	8311	Kostanjevica na Krki
00050000-569c-c8b0-9477-9ce8db37c9d1	1336	Kostel
00050000-569c-c8b0-04ca-c3e91e96bc57	6256	Košana
00050000-569c-c8b0-f0e2-a8843d7b89ff	2394	Kotlje
00050000-569c-c8b0-5661-a520b4e2a985	6240	Kozina
00050000-569c-c8b0-ad48-7a417ffd2a00	3260	Kozje
00050000-569c-c8b0-0623-6fffbdbb9ed9	4000	Kranj 
00050000-569c-c8b0-8a5e-60cd53c991a8	4001	Kranj - poštni predali
00050000-569c-c8b0-3fb5-2fde83313fda	4280	Kranjska Gora
00050000-569c-c8b0-cac7-7bd3cd313064	1281	Kresnice
00050000-569c-c8b0-2146-ad0dfd29659b	4294	Križe
00050000-569c-c8b0-6167-13f05fee1fab	9206	Križevci
00050000-569c-c8b0-ac7b-8a4653ccd2bc	9242	Križevci pri Ljutomeru
00050000-569c-c8b0-b477-f57d57b42168	1301	Krka
00050000-569c-c8b0-d78f-f64606571357	8296	Krmelj
00050000-569c-c8b0-b81c-f81be94aef27	4245	Kropa
00050000-569c-c8b0-4672-febe0549eebb	8262	Krška vas
00050000-569c-c8b0-8261-c4f64b695f86	8270	Krško
00050000-569c-c8b0-fb79-9382f85e3819	9263	Kuzma
00050000-569c-c8b0-4806-96f8093653de	2318	Laporje
00050000-569c-c8b0-5605-3b36f43d5340	3270	Laško
00050000-569c-c8b0-b245-122cdeccf51c	1219	Laze v Tuhinju
00050000-569c-c8b0-f29e-7efeb2630c78	2230	Lenart v Slovenskih goricah
00050000-569c-c8b0-0f52-d77941bcecb5	9220	Lendava/Lendva
00050000-569c-c8b0-3a49-40c65e5ea7d5	4248	Lesce
00050000-569c-c8b0-d152-59680430ffe5	3261	Lesično
00050000-569c-c8b0-2a01-13b508b1ab49	8273	Leskovec pri Krškem
00050000-569c-c8b0-d274-bc8b543a49bc	2372	Libeliče
00050000-569c-c8b0-9551-91e21c10a341	2341	Limbuš
00050000-569c-c8b0-03ac-b310d5206f49	1270	Litija
00050000-569c-c8b0-fc4e-c6566dd67d2f	3202	Ljubečna
00050000-569c-c8b0-654a-9b35c2c34196	1000	Ljubljana 
00050000-569c-c8b0-14f1-414acbe54e95	1001	Ljubljana - poštni predali
00050000-569c-c8b0-9ab4-f11bf416bd4a	1231	Ljubljana - Črnuče
00050000-569c-c8b0-1ac7-91f59809d3e3	1261	Ljubljana - Dobrunje
00050000-569c-c8b0-7e45-0df003a1ca79	1260	Ljubljana - Polje
00050000-569c-c8b0-8d8a-0c494671cbfc	1210	Ljubljana - Šentvid
00050000-569c-c8b0-f285-13e926e59dec	1211	Ljubljana - Šmartno
00050000-569c-c8b0-8619-0e941e7b0283	3333	Ljubno ob Savinji
00050000-569c-c8b0-68a1-0de1e79ef11c	9240	Ljutomer
00050000-569c-c8b0-ff92-99d0f6a566a8	3215	Loče
00050000-569c-c8b0-0d88-4e0059cc03fa	5231	Log pod Mangartom
00050000-569c-c8b0-6ed5-d8f83ca80f03	1358	Log pri Brezovici
00050000-569c-c8b0-1bdc-9d27dde601fa	1370	Logatec
00050000-569c-c8b0-920a-e118e0c89370	1371	Logatec
00050000-569c-c8b0-211f-cbefba0bfe29	1434	Loka pri Zidanem Mostu
00050000-569c-c8b0-8953-d70e38941bbd	3223	Loka pri Žusmu
00050000-569c-c8b0-0fe3-c152c3f01d77	6219	Lokev
00050000-569c-c8b0-0195-ef53d5b3dfb0	1318	Loški Potok
00050000-569c-c8b0-ac85-b1c5031442cb	2324	Lovrenc na Dravskem polju
00050000-569c-c8b0-fc70-981901afe930	2344	Lovrenc na Pohorju
00050000-569c-c8b0-76a1-faad0be02a05	3334	Luče
00050000-569c-c8b0-433d-7137209a3ebc	1225	Lukovica
00050000-569c-c8b0-9ae8-c5b3824efe7f	9202	Mačkovci
00050000-569c-c8b0-bd12-20dd572f6b53	2322	Majšperk
00050000-569c-c8b0-55fe-1446346e8a46	2321	Makole
00050000-569c-c8b0-2ede-f1d6a008f842	9243	Mala Nedelja
00050000-569c-c8b0-178d-d1d5014ee955	2229	Malečnik
00050000-569c-c8b0-f782-cbbe30d7ba36	6273	Marezige
00050000-569c-c8b0-ec1f-375cc50d3426	2000	Maribor 
00050000-569c-c8b0-7409-82f424bc2afd	2001	Maribor - poštni predali
00050000-569c-c8b0-05a9-95fa1084fef4	2206	Marjeta na Dravskem polju
00050000-569c-c8b0-148a-e2b57643e445	2281	Markovci
00050000-569c-c8b0-4ace-38c089dc4e4a	9221	Martjanci
00050000-569c-c8b0-e348-c45b515197b8	6242	Materija
00050000-569c-c8b0-e1ed-417334298b46	4211	Mavčiče
00050000-569c-c8b0-684d-fdf240367ee7	1215	Medvode
00050000-569c-c8b0-afae-1e88b810ef0c	1234	Mengeš
00050000-569c-c8b0-f7cb-2de80b6133f8	8330	Metlika
00050000-569c-c8b0-d28a-eadb9b696253	2392	Mežica
00050000-569c-c8b0-4238-375633389146	2204	Miklavž na Dravskem polju
00050000-569c-c8b0-aeb7-cbf05d0d37a1	2275	Miklavž pri Ormožu
00050000-569c-c8b0-7579-d980a582a339	5291	Miren
00050000-569c-c8b0-b2a4-a9bfbd0225f7	8233	Mirna
00050000-569c-c8b0-0a20-30813d59a272	8216	Mirna Peč
00050000-569c-c8b0-9e3a-9cef5535426c	2382	Mislinja
00050000-569c-c8b0-4995-439151de632e	4281	Mojstrana
00050000-569c-c8b0-3c60-2f0ff3aabca3	8230	Mokronog
00050000-569c-c8b0-ece2-a5308fb69a57	1251	Moravče
00050000-569c-c8b0-ad6b-38e4dbf87934	9226	Moravske Toplice
00050000-569c-c8b0-bb6e-3da367a11341	5216	Most na Soči
00050000-569c-c8b0-2399-e168b3c579ea	1221	Motnik
00050000-569c-c8b0-9e7c-c2b3b418069c	3330	Mozirje
00050000-569c-c8b0-6e14-5b3916f3ba50	9000	Murska Sobota 
00050000-569c-c8b0-0258-1db3bd288386	9001	Murska Sobota - poštni predali
00050000-569c-c8b0-008e-5669bc9d46ee	2366	Muta
00050000-569c-c8b0-a816-ea79c96f586e	4202	Naklo
00050000-569c-c8b0-e58d-9927f97a3787	3331	Nazarje
00050000-569c-c8b0-1331-7277f455d80c	1357	Notranje Gorice
00050000-569c-c8b0-ae7e-81d97219ae24	3203	Nova Cerkev
00050000-569c-c8b0-bcf5-843d9813091e	5000	Nova Gorica 
00050000-569c-c8b0-74df-f3e6cf3f7ffb	5001	Nova Gorica - poštni predali
00050000-569c-c8b0-d1b3-44c478e3d0ab	1385	Nova vas
00050000-569c-c8b0-6d35-d7ba8670b6a1	8000	Novo mesto
00050000-569c-c8b0-cf67-03ca4110e6dd	8001	Novo mesto - poštni predali
00050000-569c-c8b0-ae02-bee210650cd0	6243	Obrov
00050000-569c-c8b0-83c8-adfbc6040b7d	9233	Odranci
00050000-569c-c8b0-8208-ad3cec3a2b99	2317	Oplotnica
00050000-569c-c8b0-caeb-8798f123beb8	2312	Orehova vas
00050000-569c-c8b0-9e2e-78677fb02b4d	2270	Ormož
00050000-569c-c8b0-96af-d00ed6a49830	1316	Ortnek
00050000-569c-c8b0-7662-9486879d0d0c	1337	Osilnica
00050000-569c-c8b0-7fc2-64564db131c9	8222	Otočec
00050000-569c-c8b0-dad5-fee214bc6b57	2361	Ožbalt
00050000-569c-c8b0-8940-804ae8582abf	2231	Pernica
00050000-569c-c8b0-0327-7822c24a0f2a	2211	Pesnica pri Mariboru
00050000-569c-c8b0-ee9b-773253e194a6	9203	Petrovci
00050000-569c-c8b0-a83d-d29f9ddd99c6	3301	Petrovče
00050000-569c-c8b0-dfd7-9e92061a1a49	6330	Piran/Pirano
00050000-569c-c8b0-1399-e233856b75b4	8255	Pišece
00050000-569c-c8b0-2bad-09c39f995f9f	6257	Pivka
00050000-569c-c8b0-ebdd-8b0f7c4cd3e7	6232	Planina
00050000-569c-c8b0-44b2-68d9ca5119b9	3225	Planina pri Sevnici
00050000-569c-c8b0-399a-36bc11f1b85d	6276	Pobegi
00050000-569c-c8b0-f721-012f34cd482b	8312	Podbočje
00050000-569c-c8b0-ec27-30e68a6b48f4	5243	Podbrdo
00050000-569c-c8b0-08ca-80c01ba9ad72	3254	Podčetrtek
00050000-569c-c8b0-8035-501365526927	2273	Podgorci
00050000-569c-c8b0-8ec3-002ca315db9a	6216	Podgorje
00050000-569c-c8b0-8b20-ab2849c575fe	2381	Podgorje pri Slovenj Gradcu
00050000-569c-c8b0-0019-6f3bfb1bc86b	6244	Podgrad
00050000-569c-c8b0-178d-907174b1099d	1414	Podkum
00050000-569c-c8b0-7b27-ba29f9ef1a8f	2286	Podlehnik
00050000-569c-c8b0-73e9-132744e777ac	5272	Podnanos
00050000-569c-c8b0-7b3a-21acc1daf8bd	4244	Podnart
00050000-569c-c8b0-c95c-0ce4cc0305ca	3241	Podplat
00050000-569c-c8b0-8bc6-17bcfce9fe99	3257	Podsreda
00050000-569c-c8b0-b00b-9d4929ff1da0	2363	Podvelka
00050000-569c-c8b0-c615-60cbf59f541d	2208	Pohorje
00050000-569c-c8b0-1036-03eedab7aee7	2257	Polenšak
00050000-569c-c8b0-6fce-740a23a9e74d	1355	Polhov Gradec
00050000-569c-c8b0-2bb3-87d6e81cb49c	4223	Poljane nad Škofjo Loko
00050000-569c-c8b0-a359-00e81a358d22	2319	Poljčane
00050000-569c-c8b0-9bdd-6a45252c5d4d	1272	Polšnik
00050000-569c-c8b0-2b51-0b5916669fb8	3313	Polzela
00050000-569c-c8b0-1608-75be09c8e762	3232	Ponikva
00050000-569c-c8b0-2c74-337ae36fb53c	6320	Portorož/Portorose
00050000-569c-c8b0-3513-4a97a4ff6773	6230	Postojna
00050000-569c-c8b0-a92a-1527ab669500	2331	Pragersko
00050000-569c-c8b0-511c-247b73d5e393	3312	Prebold
00050000-569c-c8b0-4c1a-bf05c85ee790	4205	Preddvor
00050000-569c-c8b0-6325-4f7bdd532740	6255	Prem
00050000-569c-c8b0-fa86-f76384d61910	1352	Preserje
00050000-569c-c8b0-3e73-b07fe43cb97c	6258	Prestranek
00050000-569c-c8b0-d2c3-b2d71180cdfc	2391	Prevalje
00050000-569c-c8b0-9e51-fe0dffddcf76	3262	Prevorje
00050000-569c-c8b0-fbaa-6bdc821a1dc6	1276	Primskovo 
00050000-569c-c8b0-a9c4-eb4b3541f0cb	3253	Pristava pri Mestinju
00050000-569c-c8b0-d35b-ac40db943d32	9207	Prosenjakovci/Partosfalva
00050000-569c-c8b0-70e1-b873378260a5	5297	Prvačina
00050000-569c-c8b0-7828-865d4a94e1b0	2250	Ptuj
00050000-569c-c8b0-27df-f69ccea5ec1f	2323	Ptujska Gora
00050000-569c-c8b0-d247-2daac53a9c3e	9201	Puconci
00050000-569c-c8b0-2a82-e2a9a0becc92	2327	Rače
00050000-569c-c8b0-617e-7d4338f10dfe	1433	Radeče
00050000-569c-c8b0-c727-a3b060e1c78e	9252	Radenci
00050000-569c-c8b0-2746-ef177270d8b3	2360	Radlje ob Dravi
00050000-569c-c8b0-0dae-ecc26825517f	1235	Radomlje
00050000-569c-c8b0-ffd7-5b7961d30633	4240	Radovljica
00050000-569c-c8b0-df51-c1f01e551ae5	8274	Raka
00050000-569c-c8b0-55d9-cf914ea38b71	1381	Rakek
00050000-569c-c8b0-8d7d-549bce591c3e	4283	Rateče - Planica
00050000-569c-c8b0-94a0-bacacc442c5e	2390	Ravne na Koroškem
00050000-569c-c8b0-5f59-071140cd77a9	9246	Razkrižje
00050000-569c-c8b0-6afe-56c02fd4eb38	3332	Rečica ob Savinji
00050000-569c-c8b0-d5e5-df94d9dccad9	5292	Renče
00050000-569c-c8b0-0685-f40067fd9dd0	1310	Ribnica
00050000-569c-c8b0-34ac-ff2ce3d32e2c	2364	Ribnica na Pohorju
00050000-569c-c8b0-6a15-847ba9f22b1b	3272	Rimske Toplice
00050000-569c-c8b0-1654-ef24c68be765	1314	Rob
00050000-569c-c8b0-228a-fee4629c4de5	5215	Ročinj
00050000-569c-c8b0-6ef0-5c568cd59b03	3250	Rogaška Slatina
00050000-569c-c8b0-f29b-fe92d9a76966	9262	Rogašovci
00050000-569c-c8b0-c04e-8a2dc5c3be76	3252	Rogatec
00050000-569c-c8b0-ebc7-d7efdb7fdf3e	1373	Rovte
00050000-569c-c8b0-31c8-e5c2d2414485	2342	Ruše
00050000-569c-c8b0-7aca-6d5b0c815846	1282	Sava
00050000-569c-c8b0-7d02-29024fb20a32	6333	Sečovlje/Sicciole
00050000-569c-c8b0-4d31-6c31a3d3f70f	4227	Selca
00050000-569c-c8b0-7747-a9ce09198c8c	2352	Selnica ob Dravi
00050000-569c-c8b0-f5ff-36ed47a23dd6	8333	Semič
00050000-569c-c8b0-ffe8-9153c2c5cef9	8281	Senovo
00050000-569c-c8b0-9b8d-cdfe552ccc73	6224	Senožeče
00050000-569c-c8b0-00ba-3c2505da6abe	8290	Sevnica
00050000-569c-c8b0-4d8a-83a0e845fded	6210	Sežana
00050000-569c-c8b0-3cae-e975ff09160a	2214	Sladki Vrh
00050000-569c-c8b0-21c9-94e0d262ddac	5283	Slap ob Idrijci
00050000-569c-c8b0-7f99-6504b94dd9fb	2380	Slovenj Gradec
00050000-569c-c8b0-6fc6-911e9da6a7c0	2310	Slovenska Bistrica
00050000-569c-c8b0-1c10-06458065e5b8	3210	Slovenske Konjice
00050000-569c-c8b0-01e3-d0364c6596c8	1216	Smlednik
00050000-569c-c8b0-15ce-c09c8a6533d5	5232	Soča
00050000-569c-c8b0-5f89-07332b565f8c	1317	Sodražica
00050000-569c-c8b0-16a4-96e91f73ad83	3335	Solčava
00050000-569c-c8b0-68ac-c50ce3aea6b1	5250	Solkan
00050000-569c-c8b0-c998-ab26d0f07eb1	4229	Sorica
00050000-569c-c8b0-c314-6dc04688f3bc	4225	Sovodenj
00050000-569c-c8b0-a7bc-27ee2278a5e9	5281	Spodnja Idrija
00050000-569c-c8b0-4ae6-13402a4ac02c	2241	Spodnji Duplek
00050000-569c-c8b0-6acb-93835d612a63	9245	Spodnji Ivanjci
00050000-569c-c8b0-e105-ecc716b30bc3	2277	Središče ob Dravi
00050000-569c-c8b0-e5b8-27a38cc5e129	4267	Srednja vas v Bohinju
00050000-569c-c8b0-7d08-290f00629cd7	8256	Sromlje 
00050000-569c-c8b0-1d90-7b8954343866	5224	Srpenica
00050000-569c-c8b0-2b55-c1d437c1f64f	1242	Stahovica
00050000-569c-c8b0-fecd-a208b87d54eb	1332	Stara Cerkev
00050000-569c-c8b0-91fa-76a739efa788	8342	Stari trg ob Kolpi
00050000-569c-c8b0-e234-aaffbcdb4c0b	1386	Stari trg pri Ložu
00050000-569c-c8b0-ec1c-2ec5f310937c	2205	Starše
00050000-569c-c8b0-4419-b8aee527e2c2	2289	Stoperce
00050000-569c-c8b0-4516-210553d481bf	8322	Stopiče
00050000-569c-c8b0-d7ab-68e4c3064d32	3206	Stranice
00050000-569c-c8b0-f1d3-e5b9317a7d7e	8351	Straža
00050000-569c-c8b0-f074-e26f0859cc05	1313	Struge
00050000-569c-c8b0-0ec7-c3fd4b14bb18	8293	Studenec
00050000-569c-c8b0-aa04-28f3907d8f4c	8331	Suhor
00050000-569c-c8b0-c6eb-d3e393ab9eb8	2233	Sv. Ana v Slovenskih goricah
00050000-569c-c8b0-2d59-b685e85f7498	2235	Sv. Trojica v Slovenskih goricah
00050000-569c-c8b0-4233-8a61b3e523ce	2353	Sveti Duh na Ostrem Vrhu
00050000-569c-c8b0-e185-2d2f9003b3a6	9244	Sveti Jurij ob Ščavnici
00050000-569c-c8b0-0fea-a9398bcac8d4	3264	Sveti Štefan
00050000-569c-c8b0-c2e2-2e832b618c4f	2258	Sveti Tomaž
00050000-569c-c8b0-cf3c-de401c06b881	9204	Šalovci
00050000-569c-c8b0-87e9-8c8f39e28216	5261	Šempas
00050000-569c-c8b0-d8b4-c423725a06e0	5290	Šempeter pri Gorici
00050000-569c-c8b0-e10d-fd66d7878ee7	3311	Šempeter v Savinjski dolini
00050000-569c-c8b0-a9cb-bb6797323fb4	4208	Šenčur
00050000-569c-c8b0-cf6b-bbee1ea1ef20	2212	Šentilj v Slovenskih goricah
00050000-569c-c8b0-27b1-6c00be2ecf28	8297	Šentjanž
00050000-569c-c8b0-68c2-7cfd09853d97	2373	Šentjanž pri Dravogradu
00050000-569c-c8b0-9b11-3a557f377727	8310	Šentjernej
00050000-569c-c8b0-f209-5af182460aac	3230	Šentjur
00050000-569c-c8b0-47db-bfd0d7164702	3271	Šentrupert
00050000-569c-c8b0-f1c2-9292c018e5fe	8232	Šentrupert
00050000-569c-c8b0-fb5a-e8cec283def5	1296	Šentvid pri Stični
00050000-569c-c8b0-75ad-f031aef8911f	8275	Škocjan
00050000-569c-c8b0-07fa-aa1d810787af	6281	Škofije
00050000-569c-c8b0-5f37-077efdf68ecf	4220	Škofja Loka
00050000-569c-c8b0-bcf0-e3a87ad7b2c9	3211	Škofja vas
00050000-569c-c8b0-f3e7-e1ddd1b00d95	1291	Škofljica
00050000-569c-c8b0-786b-b2208508826f	6274	Šmarje
00050000-569c-c8b0-2514-8b85cfd7619b	1293	Šmarje - Sap
00050000-569c-c8b0-932e-8e7c130631e4	3240	Šmarje pri Jelšah
00050000-569c-c8b0-a6ed-5dd8286616b5	8220	Šmarješke Toplice
00050000-569c-c8b0-8c29-6164a8266627	2315	Šmartno na Pohorju
00050000-569c-c8b0-0c3c-7856ab88953c	3341	Šmartno ob Dreti
00050000-569c-c8b0-c882-e04cd772ca3a	3327	Šmartno ob Paki
00050000-569c-c8b0-490e-b4cbdbe6dd21	1275	Šmartno pri Litiji
00050000-569c-c8b0-c838-0a6e8a595be2	2383	Šmartno pri Slovenj Gradcu
00050000-569c-c8b0-00c5-c2c1421465a4	3201	Šmartno v Rožni dolini
00050000-569c-c8b0-d22e-eff83d29cf3a	3325	Šoštanj
00050000-569c-c8b0-7a24-cc2c00ccf917	6222	Štanjel
00050000-569c-c8b0-0dd7-087b5a5228ad	3220	Štore
00050000-569c-c8b0-809e-00649fca166a	3304	Tabor
00050000-569c-c8b0-63a4-06b03b1dc66c	3221	Teharje
00050000-569c-c8b0-a934-391d458250f0	9251	Tišina
00050000-569c-c8b0-deff-008d1d90b2e6	5220	Tolmin
00050000-569c-c8b0-b003-38b308323cbc	3326	Topolšica
00050000-569c-c8b0-406b-a9f07c7bdbc0	2371	Trbonje
00050000-569c-c8b0-809c-5a3795238854	1420	Trbovlje
00050000-569c-c8b0-2253-8fa770c801e7	8231	Trebelno 
00050000-569c-c8b0-723e-32a9207f2e60	8210	Trebnje
00050000-569c-c8b0-1225-9ec6069c1e7d	5252	Trnovo pri Gorici
00050000-569c-c8b0-4ac4-bdd204ea345a	2254	Trnovska vas
00050000-569c-c8b0-c1ea-a3e3492e9ac8	1222	Trojane
00050000-569c-c8b0-2f57-c5889ad87f55	1236	Trzin
00050000-569c-c8b0-2407-ddfd3f91cc52	4290	Tržič
00050000-569c-c8b0-aa3f-0902485bac86	8295	Tržišče
00050000-569c-c8b0-288f-ffa205db2db1	1311	Turjak
00050000-569c-c8b0-1d84-850c3a1e2a33	9224	Turnišče
00050000-569c-c8b0-da94-28438fba923d	8323	Uršna sela
00050000-569c-c8b0-701f-c3a7b8975848	1252	Vače
00050000-569c-c8b0-ac6f-d45b844c8284	3320	Velenje 
00050000-569c-c8b0-a19f-b49897379d02	3322	Velenje - poštni predali
00050000-569c-c8b0-3dd1-5acbb3f19b1b	8212	Velika Loka
00050000-569c-c8b0-aa03-6bccd0f3ab13	2274	Velika Nedelja
00050000-569c-c8b0-7f84-350763cdb869	9225	Velika Polana
00050000-569c-c8b0-2414-900be4a5b69f	1315	Velike Lašče
00050000-569c-c8b0-1b02-70c30ddcb512	8213	Veliki Gaber
00050000-569c-c8b0-97d6-9421827871a4	9241	Veržej
00050000-569c-c8b0-12ae-2265d1bc5668	1312	Videm - Dobrepolje
00050000-569c-c8b0-ead6-b57a83c02170	2284	Videm pri Ptuju
00050000-569c-c8b0-9484-b4ac7876ead6	8344	Vinica
00050000-569c-c8b0-87ba-52294a78b956	5271	Vipava
00050000-569c-c8b0-91a3-9832b5e70f12	4212	Visoko
00050000-569c-c8b0-a6ea-908b9c8f03d2	1294	Višnja Gora
00050000-569c-c8b0-3d6b-2883f3a3abc9	3205	Vitanje
00050000-569c-c8b0-9208-8b38d4e0ecb6	2255	Vitomarci
00050000-569c-c8b0-1a5b-29cd226390f7	1217	Vodice
00050000-569c-c8b0-083f-307f89fd3d5c	3212	Vojnik\t
00050000-569c-c8b0-79f0-f1e878c89c47	5293	Volčja Draga
00050000-569c-c8b0-600c-128a944012c4	2232	Voličina
00050000-569c-c8b0-32be-e1959c117fbb	3305	Vransko
00050000-569c-c8b0-6024-2baab1aa5daf	6217	Vremski Britof
00050000-569c-c8b0-97ea-e2cb0376becb	1360	Vrhnika
00050000-569c-c8b0-99c0-b0e884f20a3d	2365	Vuhred
00050000-569c-c8b0-aef1-b9fbb024ab6f	2367	Vuzenica
00050000-569c-c8b0-8598-94726d669840	8292	Zabukovje 
00050000-569c-c8b0-fd42-12b08d6a1f6f	1410	Zagorje ob Savi
00050000-569c-c8b0-ba10-2338ec8b2bae	1303	Zagradec
00050000-569c-c8b0-4896-14b5728c8942	2283	Zavrč
00050000-569c-c8b0-a1eb-136286bbc318	8272	Zdole 
00050000-569c-c8b0-686d-6e496be27967	4201	Zgornja Besnica
00050000-569c-c8b0-5305-80c8edffd865	2242	Zgornja Korena
00050000-569c-c8b0-95c6-156f484fea6f	2201	Zgornja Kungota
00050000-569c-c8b0-8980-6f97e701ffd0	2316	Zgornja Ložnica
00050000-569c-c8b0-bea7-1c46766efcb0	2314	Zgornja Polskava
00050000-569c-c8b0-b605-1618b6b7c577	2213	Zgornja Velka
00050000-569c-c8b0-9cb7-736ecee73b0b	4247	Zgornje Gorje
00050000-569c-c8b0-884f-5b66ecf76200	4206	Zgornje Jezersko
00050000-569c-c8b0-3a28-721ed9937f66	2285	Zgornji Leskovec
00050000-569c-c8b0-d8d9-e0b5f8282fac	1432	Zidani Most
00050000-569c-c8b0-b12f-289dd8e23bb6	3214	Zreče
00050000-569c-c8b0-5e01-19e52e5ef940	4209	Žabnica
00050000-569c-c8b0-d69c-158605451677	3310	Žalec
00050000-569c-c8b0-9e7c-49d37698d023	4228	Železniki
00050000-569c-c8b0-5e01-bda9a90660c1	2287	Žetale
00050000-569c-c8b0-00ab-a3c258338102	4226	Žiri
00050000-569c-c8b0-1131-b3433a8aa55f	4274	Žirovnica
00050000-569c-c8b0-638f-05468bbd6823	8360	Žužemberk
\.


--
-- TOC entry 3207 (class 0 OID 37345096)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 37344666)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 37344404)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569c-c8b3-c61a-be97afd127eb	00080000-569c-c8b3-ca73-b3847ef7f360	\N	00040000-569c-c8b0-06ae-79104035809e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569c-c8b3-fd1e-cca0cc67f337	00080000-569c-c8b3-ca73-b3847ef7f360	\N	00040000-569c-c8b0-06ae-79104035809e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569c-c8b3-0613-b7edf32b4981	00080000-569c-c8b3-2a64-4fc04d3e4379	\N	00040000-569c-c8b0-06ae-79104035809e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3167 (class 0 OID 37344542)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569c-c8b1-fe65-feca194212f1	novo leto	1	1	\N	t
00430000-569c-c8b1-48ba-79a6263d42a5	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569c-c8b1-df30-37f9747ef040	dan upora proti okupatorju	27	4	\N	t
00430000-569c-c8b1-85e1-c3231a202e38	praznik dela	1	5	\N	t
00430000-569c-c8b1-1551-7141cc9c6fde	praznik dela	2	5	\N	t
00430000-569c-c8b1-a3a4-5fb7a0132557	dan Primoža Trubarja	8	6	\N	f
00430000-569c-c8b1-5e2e-8ba03011d219	dan državnosti	25	6	\N	t
00430000-569c-c8b1-8751-73c0940ea415	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569c-c8b1-10ce-581af31cd43d	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569c-c8b1-0590-6da60ce28c99	dan suverenosti	25	10	\N	f
00430000-569c-c8b1-a3f3-9a85a4461378	dan spomina na mrtve	1	11	\N	t
00430000-569c-c8b1-c640-67dda3d66748	dan Rudolfa Maistra	23	11	\N	f
00430000-569c-c8b1-6dfc-243fb40da955	božič	25	12	\N	t
00430000-569c-c8b1-50fb-4b881f9656eb	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569c-c8b1-74e5-777cf2d96f3e	Marijino vnebovzetje	15	8	\N	t
00430000-569c-c8b1-43dc-9ebe93f935db	dan reformacije	31	10	\N	t
00430000-569c-c8b1-edc1-5944507e1126	velikonočna nedelja	27	3	2016	t
00430000-569c-c8b1-6cfe-daad7c3c7e2b	velikonočna nedelja	16	4	2017	t
00430000-569c-c8b1-6fa5-55368465ac7c	velikonočna nedelja	1	4	2018	t
00430000-569c-c8b1-12ec-382ea5ca0696	velikonočna nedelja	21	4	2019	t
00430000-569c-c8b1-0376-f594a3abec01	velikonočna nedelja	12	4	2020	t
00430000-569c-c8b1-9bb0-d3a7a5e4e7c3	velikonočna nedelja	4	4	2021	t
00430000-569c-c8b1-de14-8a60b838cd7d	velikonočna nedelja	17	4	2022	t
00430000-569c-c8b1-7a02-d04d253774ea	velikonočna nedelja	9	4	2023	t
00430000-569c-c8b1-8888-e4c48a4b4133	velikonočna nedelja	31	3	2024	t
00430000-569c-c8b1-e48a-8dd40f816254	velikonočna nedelja	20	4	2025	t
00430000-569c-c8b1-4e46-a0ae919373eb	velikonočna nedelja	5	4	2026	t
00430000-569c-c8b1-9fc6-b910100dcf34	velikonočna nedelja	28	3	2027	t
00430000-569c-c8b1-046f-d500ba67107f	velikonočna nedelja	16	4	2028	t
00430000-569c-c8b1-d19b-fee2fc39f787	velikonočna nedelja	1	4	2029	t
00430000-569c-c8b1-ae7b-605778d4fffe	velikonočna nedelja	21	4	2030	t
00430000-569c-c8b1-c825-dc6de436e271	velikonočni ponedeljek	28	3	2016	t
00430000-569c-c8b1-2d4f-c4655b41ed88	velikonočni ponedeljek	17	4	2017	t
00430000-569c-c8b1-4b50-17948e3d5541	velikonočni ponedeljek	2	4	2018	t
00430000-569c-c8b1-d90b-03efc736d3a3	velikonočni ponedeljek	22	4	2019	t
00430000-569c-c8b1-b1ea-0cb64e1c9483	velikonočni ponedeljek	13	4	2020	t
00430000-569c-c8b1-dc0b-cb37b6a2bc78	velikonočni ponedeljek	5	4	2021	t
00430000-569c-c8b1-a397-7e98df82a4dc	velikonočni ponedeljek	18	4	2022	t
00430000-569c-c8b1-6cf5-da407823e831	velikonočni ponedeljek	10	4	2023	t
00430000-569c-c8b1-4295-9c7b4632a5f0	velikonočni ponedeljek	1	4	2024	t
00430000-569c-c8b1-5373-23f40f4a08f3	velikonočni ponedeljek	21	4	2025	t
00430000-569c-c8b1-d0c2-38ba1e249946	velikonočni ponedeljek	6	4	2026	t
00430000-569c-c8b1-2d8e-0cb20629ed45	velikonočni ponedeljek	29	3	2027	t
00430000-569c-c8b1-3ffc-326f0eed2596	velikonočni ponedeljek	17	4	2028	t
00430000-569c-c8b1-093a-5009774d5e83	velikonočni ponedeljek	2	4	2029	t
00430000-569c-c8b1-8853-304f02a4f1d8	velikonočni ponedeljek	22	4	2030	t
00430000-569c-c8b1-59b9-6975258799b6	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569c-c8b1-69cb-bd95d26f2393	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569c-c8b1-33eb-c930328dd1d4	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569c-c8b1-adfd-37aca98ee335	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569c-c8b1-e07d-81c012c832a5	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569c-c8b1-01e9-adcbde503636	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569c-c8b1-a496-a4d331bb3cb6	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569c-c8b1-f276-6e58dea41a1e	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569c-c8b1-2427-b83c2fdadfb9	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569c-c8b1-1a8a-5b3753d4a566	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569c-c8b1-e968-9866079dc4f1	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569c-c8b1-efe4-4e25e42fc775	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569c-c8b1-0595-1c026867bd20	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569c-c8b1-cb1b-ad18e7edd404	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569c-c8b1-396f-dc2abf12b859	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3163 (class 0 OID 37344508)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569c-c8b4-9fd9-55e75f522796	000e0000-569c-c8b3-c69f-70726666c071	\N	00090000-569c-c8b3-c7c3-367aaf0cd0e6	1	\N	\N
\.


--
-- TOC entry 3164 (class 0 OID 37344517)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 37344678)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 37345110)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 37345120)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569c-c8b3-12a8-78c92f1bfe0e	00080000-569c-c8b3-75b9-dcad0526844c	0987	AK
00190000-569c-c8b3-b919-b86013c0c885	00080000-569c-c8b3-2a64-4fc04d3e4379	0989	AK
00190000-569c-c8b3-2ae1-9a1c477f388f	00080000-569c-c8b3-6e5d-3142812b21b4	0986	AK
00190000-569c-c8b3-e586-ade1f6b6f9fb	00080000-569c-c8b3-dab5-bbeea6d6660c	0984	AK
00190000-569c-c8b3-ef52-89ec1a5f09c3	00080000-569c-c8b3-aee5-c94f5f17f73a	0983	AK
00190000-569c-c8b3-0a76-782d66cdb0b1	00080000-569c-c8b3-549a-b3ae58fb99f6	0982	AK
00190000-569c-c8b5-ee04-157b41b3df8d	00080000-569c-c8b5-470a-9669532f2031	1001	AK
\.


--
-- TOC entry 3206 (class 0 OID 37345009)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569c-c8b4-febd-b7206056b2e6	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3210 (class 0 OID 37345128)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 37344707)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-569c-c8b3-013e-455cf7a9da76	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-569c-c8b3-fe58-d01b44796a63	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-569c-c8b3-cf5b-110501600dcf	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-569c-c8b3-9814-c349fcfacf1c	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-569c-c8b3-aa1e-2ecc6a79b767	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-569c-c8b3-f5b7-5ccb79770dc5	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-569c-c8b3-ebee-79dddd7831a2	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3178 (class 0 OID 37344651)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 37344641)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 37344848)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 37344778)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 37344482)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 37344244)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569c-c8b5-470a-9669532f2031	00010000-569c-c8b1-cb72-5a81332e1cda	2016-01-18 12:12:53	INS	a:0:{}
2	App\\Entity\\Option	00000000-569c-c8b5-d84f-3090d560510b	00010000-569c-c8b1-cb72-5a81332e1cda	2016-01-18 12:12:53	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569c-c8b5-ee04-157b41b3df8d	00010000-569c-c8b1-cb72-5a81332e1cda	2016-01-18 12:12:53	INS	a:0:{}
\.


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3187 (class 0 OID 37344720)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 37344282)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569c-c8b1-7694-8fca92eb49c1	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569c-c8b1-c99c-f92140f18172	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569c-c8b1-d483-40fae2b3d295	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569c-c8b1-2e0e-fe995f6e5519	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569c-c8b1-2769-2e971897f518	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569c-c8b1-814d-105ec29814d9	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569c-c8b1-67ad-d7ecebbcd516	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569c-c8b1-0fd5-29ed6f14ba55	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569c-c8b1-4438-fab8d6269b48	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-c8b1-43ad-1d29dece66c4	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-c8b1-363d-fb1a13364d82	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-c8b1-aa58-a6592267d292	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569c-c8b1-7734-649f5dbf2e08	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569c-c8b1-07d1-c5da3d4ab34f	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569c-c8b1-8114-5ec671299e60	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569c-c8b1-a6bf-256599311aac	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569c-c8b1-885e-7a8c129df4bc	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569c-c8b1-16c2-2599caea4108	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569c-c8b1-44bb-585f46a0c4ec	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569c-c8b1-0e7f-840aff4a8710	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569c-c8b1-e7ff-22f5dceb0041	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569c-c8b1-98ae-f56cabeaea00	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569c-c8b1-c61d-550357e140bc	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569c-c8b1-9780-1d91798017a8	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569c-c8b1-5e33-47d7cac7bbd7	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569c-c8b1-ae43-925346e69051	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569c-c8b1-d5d3-b6b93b8bd3de	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569c-c8b1-ed6b-d60cc0550689	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569c-c8b1-5474-094c5e366448	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569c-c8b1-0f98-f637c2dbe17a	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569c-c8b1-6623-7cf51626f0e1	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569c-c8b1-c90a-fc824c4e3600	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569c-c8b1-77ea-532d2cbdb7bd	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569c-c8b1-8fc2-e96516db3296	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569c-c8b1-7e1d-7adcade25c97	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569c-c8b1-0253-8b5f9c29c65a	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569c-c8b1-65d8-b3ff58deaf11	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569c-c8b1-e2a3-ef46e10f6d1c	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569c-c8b1-a9e2-de6da7ca3889	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569c-c8b1-7d8e-44c01a35fc99	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569c-c8b1-1baf-f07fc397f9ec	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569c-c8b1-f6a2-56b973672fbe	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569c-c8b1-8420-223a190027f6	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569c-c8b1-38bf-13df6b144ec2	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569c-c8b1-5f36-cc7310a4a8d8	direktor	minimalne pravice za direktorja	t
00020000-569c-c8b1-fff3-2420078c2873	arhivar	arhivar	t
00020000-569c-c8b1-9f9b-df18e76b362c	dramaturg	dramaturg	t
00020000-569c-c8b1-9230-673ddabad152	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569c-c8b1-bfb9-a43f483480eb	poslovni-sekretar	poslovni sekretar	t
00020000-569c-c8b1-6a80-a7cbdda4f61c	vodja-tehnike	vodja tehnike	t
00020000-569c-c8b1-a6f3-24b654d8560d	racunovodja	računovodja	t
00020000-569c-c8b3-4ce7-ea7db0a90c03	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569c-c8b3-ea39-fc4bd0c0345f	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-579e-34ff8e19a21e	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-3173-aad520b1cebc	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-da53-c729d3987e91	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-eee7-86820f09ecf2	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-1146-8fc4409bd66c	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-bf6a-2e791ddd4018	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-459a-cf0d2aed3938	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-bfeb-55aa6a52b15b	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-2ff0-d0e30e52e233	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-7858-2210e88fea4d	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-8aee-63e825ddb00f	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-527f-873280df6145	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-a1b6-f46c0f727f49	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-aed4-9521f6da51b6	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-5ce3-54bd6f5a1073	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-80b5-fb67e7edc618	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-8fe0-86a9f80e7d3a	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-3b8a-009d131f5045	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569c-c8b3-cb52-66aeebf66723	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-ca77-0f5cfe747151	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-5d4b-9d68f687ff70	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-1526-16f23f347c59	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-ab7f-77efc9ad7507	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-002c-0ed70d2e938a	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-fa70-16416392e0fe	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-7e1f-95694691695b	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-2499-3ecd560b3925	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-cbd6-a7352f563865	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-676d-3aeea0016b00	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-9f82-384b30e808a5	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-ae60-a33d552d3240	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-ab3c-9f8851e6e300	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-a85f-cf98d71a2d76	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-3ed5-5c1f2aec4126	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-84c9-a7dafbb67ec6	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-b682-d31bb943e687	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569c-c8b3-c3c9-7325d51fcc96	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3142 (class 0 OID 37344266)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569c-c8b1-f398-142ded30d138	00020000-569c-c8b1-d483-40fae2b3d295
00010000-569c-c8b1-cb72-5a81332e1cda	00020000-569c-c8b1-d483-40fae2b3d295
00010000-569c-c8b3-59b3-686b7034251b	00020000-569c-c8b3-4ce7-ea7db0a90c03
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-ea39-fc4bd0c0345f
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-eee7-86820f09ecf2
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-bfeb-55aa6a52b15b
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-7858-2210e88fea4d
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-527f-873280df6145
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-8fe0-86a9f80e7d3a
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-3173-aad520b1cebc
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-cb52-66aeebf66723
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-1526-16f23f347c59
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-002c-0ed70d2e938a
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-7e1f-95694691695b
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-cbd6-a7352f563865
00010000-569c-c8b3-bdd1-e962c1657ce5	00020000-569c-c8b3-ab3c-9f8851e6e300
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-ea39-fc4bd0c0345f
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-579e-34ff8e19a21e
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-3173-aad520b1cebc
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-da53-c729d3987e91
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-527f-873280df6145
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-5ce3-54bd6f5a1073
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-cb52-66aeebf66723
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-1526-16f23f347c59
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-002c-0ed70d2e938a
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-7e1f-95694691695b
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-cbd6-a7352f563865
00010000-569c-c8b3-95e6-09476944d121	00020000-569c-c8b3-ab3c-9f8851e6e300
00010000-569c-c8b3-c474-843c866ea321	00020000-569c-c8b3-ea39-fc4bd0c0345f
00010000-569c-c8b3-c474-843c866ea321	00020000-569c-c8b3-579e-34ff8e19a21e
00010000-569c-c8b3-c474-843c866ea321	00020000-569c-c8b3-3173-aad520b1cebc
00010000-569c-c8b3-c474-843c866ea321	00020000-569c-c8b3-da53-c729d3987e91
00010000-569c-c8b3-c474-843c866ea321	00020000-569c-c8b3-7858-2210e88fea4d
00010000-569c-c8b3-c474-843c866ea321	00020000-569c-c8b3-527f-873280df6145
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-579e-34ff8e19a21e
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-1146-8fc4409bd66c
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-2ff0-d0e30e52e233
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-8aee-63e825ddb00f
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-7858-2210e88fea4d
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-80b5-fb67e7edc618
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-527f-873280df6145
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-a1b6-f46c0f727f49
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-cb52-66aeebf66723
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-ca77-0f5cfe747151
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-1526-16f23f347c59
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-ab7f-77efc9ad7507
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-002c-0ed70d2e938a
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-fa70-16416392e0fe
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-7e1f-95694691695b
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-2499-3ecd560b3925
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-cbd6-a7352f563865
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-676d-3aeea0016b00
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-ab3c-9f8851e6e300
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-a85f-cf98d71a2d76
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-84c9-a7dafbb67ec6
00010000-569c-c8b3-4177-3306d81dfb1e	00020000-569c-c8b3-b682-d31bb943e687
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-579e-34ff8e19a21e
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-1146-8fc4409bd66c
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-459a-cf0d2aed3938
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-2ff0-d0e30e52e233
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-8aee-63e825ddb00f
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-7858-2210e88fea4d
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-80b5-fb67e7edc618
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-527f-873280df6145
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-a1b6-f46c0f727f49
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-aed4-9521f6da51b6
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-cb52-66aeebf66723
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-ca77-0f5cfe747151
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-5d4b-9d68f687ff70
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-1526-16f23f347c59
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-ab7f-77efc9ad7507
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-002c-0ed70d2e938a
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-fa70-16416392e0fe
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-7e1f-95694691695b
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-2499-3ecd560b3925
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-cbd6-a7352f563865
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-676d-3aeea0016b00
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-ab3c-9f8851e6e300
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-a85f-cf98d71a2d76
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-3ed5-5c1f2aec4126
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-84c9-a7dafbb67ec6
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-b682-d31bb943e687
00010000-569c-c8b3-f077-1f44677f7ab2	00020000-569c-c8b3-c3c9-7325d51fcc96
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-579e-34ff8e19a21e
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-3173-aad520b1cebc
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-1146-8fc4409bd66c
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-bf6a-2e791ddd4018
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-459a-cf0d2aed3938
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-eee7-86820f09ecf2
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-2ff0-d0e30e52e233
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-8aee-63e825ddb00f
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-7858-2210e88fea4d
00010000-569c-c8b3-10de-7657c531de18	00020000-569c-c8b3-80b5-fb67e7edc618
00010000-569c-c8b3-6a73-667253bda02e	00020000-569c-c8b3-ea39-fc4bd0c0345f
00010000-569c-c8b3-6a73-667253bda02e	00020000-569c-c8b3-da53-c729d3987e91
00010000-569c-c8b3-6a73-667253bda02e	00020000-569c-c8b3-eee7-86820f09ecf2
00010000-569c-c8b3-6a73-667253bda02e	00020000-569c-c8b3-bfeb-55aa6a52b15b
00010000-569c-c8b3-6a73-667253bda02e	00020000-569c-c8b3-7858-2210e88fea4d
00010000-569c-c8b3-6a73-667253bda02e	00020000-569c-c8b3-527f-873280df6145
00010000-569c-c8b3-6a73-667253bda02e	00020000-569c-c8b3-8fe0-86a9f80e7d3a
00010000-569c-c8b3-6a73-667253bda02e	00020000-569c-c8b3-9f82-384b30e808a5
00010000-569c-c8b3-6386-a0e4c5e339f2	00020000-569c-c8b3-3b8a-009d131f5045
00010000-569c-c8b3-9068-59fc51043c7e	00020000-569c-c8b1-5f36-cc7310a4a8d8
00010000-569c-c8b3-b1b2-e648b522be65	00020000-569c-c8b1-fff3-2420078c2873
00010000-569c-c8b3-8a10-82795f0483cd	00020000-569c-c8b1-9f9b-df18e76b362c
00010000-569c-c8b3-90a0-159dfdfa3717	00020000-569c-c8b1-9230-673ddabad152
00010000-569c-c8b3-0504-cf40538f6cc6	00020000-569c-c8b1-bfb9-a43f483480eb
00010000-569c-c8b3-4256-7c6350dd5446	00020000-569c-c8b1-6a80-a7cbdda4f61c
00010000-569c-c8b3-0f62-a1a6c077572d	00020000-569c-c8b1-a6f3-24b654d8560d
\.


--
-- TOC entry 3189 (class 0 OID 37344734)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 37344672)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 37344595)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569c-c8b3-1b7b-44f2c24d5a35	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569c-c8b3-16eb-c397e461c1d3	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569c-c8b3-fce9-30d521dafbfa	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3138 (class 0 OID 37344231)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569c-c8b0-685f-991dfd608313	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569c-c8b0-da0f-7fc81a530b20	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569c-c8b0-d624-6a4affcbab22	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569c-c8b0-32e7-ade8ba0a5a0d	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569c-c8b0-1cd2-ddf3d2b17d58	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3137 (class 0 OID 37344223)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569c-c8b0-5e91-c46596d46ab9	00230000-569c-c8b0-32e7-ade8ba0a5a0d	popa
00240000-569c-c8b0-cc0f-2fe95bf73727	00230000-569c-c8b0-32e7-ade8ba0a5a0d	oseba
00240000-569c-c8b0-a389-b6a71be8a0aa	00230000-569c-c8b0-32e7-ade8ba0a5a0d	tippopa
00240000-569c-c8b0-ab27-24bbbdcdfb04	00230000-569c-c8b0-32e7-ade8ba0a5a0d	organizacijskaenota
00240000-569c-c8b0-d4ec-643d5535a50d	00230000-569c-c8b0-32e7-ade8ba0a5a0d	sezona
00240000-569c-c8b0-39c2-87c04c04eaf5	00230000-569c-c8b0-32e7-ade8ba0a5a0d	tipvaje
00240000-569c-c8b0-5cbb-ac6c0d03118d	00230000-569c-c8b0-32e7-ade8ba0a5a0d	tipdodatka
00240000-569c-c8b0-a1d2-149f7692ef41	00230000-569c-c8b0-da0f-7fc81a530b20	prostor
00240000-569c-c8b0-a3f8-8d2ae43bf014	00230000-569c-c8b0-32e7-ade8ba0a5a0d	besedilo
00240000-569c-c8b0-c3fa-c4e7d9949181	00230000-569c-c8b0-32e7-ade8ba0a5a0d	uprizoritev
00240000-569c-c8b0-b716-accc28691827	00230000-569c-c8b0-32e7-ade8ba0a5a0d	funkcija
00240000-569c-c8b0-369d-86a26299a349	00230000-569c-c8b0-32e7-ade8ba0a5a0d	tipfunkcije
00240000-569c-c8b0-76f7-bf00b65c133c	00230000-569c-c8b0-32e7-ade8ba0a5a0d	alternacija
00240000-569c-c8b0-47c8-34393a52b913	00230000-569c-c8b0-685f-991dfd608313	pogodba
00240000-569c-c8b0-8a3a-552435f0b7ad	00230000-569c-c8b0-32e7-ade8ba0a5a0d	zaposlitev
00240000-569c-c8b0-772b-02826308bc38	00230000-569c-c8b0-32e7-ade8ba0a5a0d	zvrstuprizoritve
00240000-569c-c8b0-e2cb-bc61b457bde7	00230000-569c-c8b0-685f-991dfd608313	programdela
00240000-569c-c8b0-892a-a8bc404ef866	00230000-569c-c8b0-32e7-ade8ba0a5a0d	zapis
\.


--
-- TOC entry 3136 (class 0 OID 37344218)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ef91acbc-37cf-498e-8618-6576ee817549	00240000-569c-c8b0-5e91-c46596d46ab9	0	1001
\.


--
-- TOC entry 3195 (class 0 OID 37344795)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569c-c8b4-e540-a9058fe21691	000e0000-569c-c8b3-c69f-70726666c071	00080000-569c-c8b3-ca73-b3847ef7f360	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569c-c8b1-f3fd-85e66f982d13
00270000-569c-c8b4-c01b-23e2c6d04998	000e0000-569c-c8b3-c69f-70726666c071	00080000-569c-c8b3-ca73-b3847ef7f360	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569c-c8b1-f3fd-85e66f982d13
\.


--
-- TOC entry 3152 (class 0 OID 37344366)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 37344614)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569c-c8b4-2620-1e2d9a99b6da	00180000-569c-c8b4-76ab-6b6c79718430	000c0000-569c-c8b4-9e4b-8b89e41cf9e2	00090000-569c-c8b3-e8a3-31a9908fe6fd	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-c8b4-eb19-4f758b82f80b	00180000-569c-c8b4-76ab-6b6c79718430	000c0000-569c-c8b4-965a-c203c46fd62e	00090000-569c-c8b3-4400-1ed886855fcf	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-c8b4-2d89-55866dd4da76	00180000-569c-c8b4-76ab-6b6c79718430	000c0000-569c-c8b4-ffe9-7bd58db90117	00090000-569c-c8b3-624d-fa9634d09985	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-c8b4-d81c-9f4f31ee82b0	00180000-569c-c8b4-76ab-6b6c79718430	000c0000-569c-c8b4-cd33-a84bc29ae1ef	00090000-569c-c8b3-c7c3-367aaf0cd0e6	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-c8b4-e385-600b50461ea2	00180000-569c-c8b4-76ab-6b6c79718430	000c0000-569c-c8b4-dda1-fd077bb96688	00090000-569c-c8b3-cddf-7521921c741c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569c-c8b4-b482-bf7df346c445	00180000-569c-c8b4-7e98-1a99491bc6e9	\N	00090000-569c-c8b3-cddf-7521921c741c	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569c-c8b4-9c3b-7c2f0fbd03f6	00180000-569c-c8b4-d512-01ae2412ec15	\N	00090000-569c-c8b3-4400-1ed886855fcf	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3176 (class 0 OID 37344631)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569c-c8b0-a7f4-d564741da5c2	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569c-c8b0-c39a-dc492f0f23b3	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569c-c8b0-a968-523918138a46	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569c-c8b0-e6da-863c41a51761	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569c-c8b0-17e3-a19c4b11b65e	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569c-c8b0-718e-169b3bf847bf	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3198 (class 0 OID 37344836)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569c-c8b0-0e65-f1422029b305	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569c-c8b0-6d7e-222d54e28da8	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569c-c8b0-7179-fb34fa2e68b3	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569c-c8b0-a690-bd7dc4b6c4b5	04	Režija	Režija	Režija	umetnik	30
000f0000-569c-c8b0-8254-b133b647cb06	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569c-c8b0-014f-aab501360c41	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569c-c8b0-c844-dc0993535953	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569c-c8b0-3bda-287d894d3de8	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569c-c8b0-67b1-ebbdec452021	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569c-c8b0-7ea6-fea382253eab	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569c-c8b0-865f-44ebd2c4ec77	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569c-c8b0-1fe8-391d7650a86f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569c-c8b0-3fd5-58205cbd6510	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569c-c8b0-16db-bad6311cbbf6	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569c-c8b0-77a0-b067b4fefa53	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569c-c8b0-1c95-26e4228cb583	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569c-c8b0-9337-145616df749b	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569c-c8b0-e7fa-b76f6526b75e	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569c-c8b0-cc06-2154d739892d	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3149 (class 0 OID 37344317)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569c-c8b3-c213-9ba78e9d6188	0001	šola	osnovna ali srednja šola
00400000-569c-c8b3-05a6-a0f7a759e8f1	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569c-c8b3-41c8-dc70e6ea7c29	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3211 (class 0 OID 37345140)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569c-c8b0-a8c7-d7556f6263d9	01	Velika predstava	f	1.00	1.00
002b0000-569c-c8b0-3c90-cb5684d1e784	02	Mala predstava	f	0.50	0.50
002b0000-569c-c8b0-cfb9-8d5091230530	03	Mala koprodukcija	t	0.40	1.00
002b0000-569c-c8b0-2486-01a101ed2720	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569c-c8b0-29eb-fd4f1862ed5f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3171 (class 0 OID 37344585)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569c-c8b0-632e-fae33ae85384	0001	prva vaja	prva vaja
00420000-569c-c8b0-7534-f340b85b7a00	0002	tehnična vaja	tehnična vaja
00420000-569c-c8b0-bd4f-9ad36456bc3e	0003	lučna vaja	lučna vaja
00420000-569c-c8b0-1589-35f0bd02fe75	0004	kostumska vaja	kostumska vaja
00420000-569c-c8b0-6822-c86e09ce9e38	0005	foto vaja	foto vaja
00420000-569c-c8b0-a7f5-9baa242f5789	0006	1. glavna vaja	1. glavna vaja
00420000-569c-c8b0-dddc-0906feeede30	0007	2. glavna vaja	2. glavna vaja
00420000-569c-c8b0-3ec5-0ed7cc685864	0008	1. generalka	1. generalka
00420000-569c-c8b0-38d1-1b8041aaa5b2	0009	2. generalka	2. generalka
00420000-569c-c8b0-9978-c16c89366b4f	0010	odprta generalka	odprta generalka
00420000-569c-c8b0-0074-82e879e2de66	0011	obnovitvena vaja	obnovitvena vaja
00420000-569c-c8b0-b882-fe7b020166f8	0012	italijanka	krajša "obnovitvena" vaja
00420000-569c-c8b0-2ea1-b3c531dceeb4	0013	pevska vaja	pevska vaja
00420000-569c-c8b0-7f8e-401d02e6ecf9	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569c-c8b0-6e32-63ddbfe3b94d	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569c-c8b0-f94d-10b79c221669	0016	orientacijska vaja	orientacijska vaja
00420000-569c-c8b0-cb43-8642960ffecc	0017	situacijska vaja	situacijska vaja
00420000-569c-c8b0-5831-c284800e6640	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3158 (class 0 OID 37344439)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 37344253)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569c-c8b1-cb72-5a81332e1cda	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROXJVy7PFjGko5zy8leLm4twXOi3SKYyi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-8ffc-1bd8ae1e9aa0	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-03e2-744be18bec9c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-68af-4495d424381b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-430f-846946173e47	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-9252-a289ab945f44	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-f7c3-3eca8b262157	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-8d83-b47766fe17f2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-874d-45edcbe414c3	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-f219-b1712168eadd	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-59b3-686b7034251b	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-bdab-bf3845420e26	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-bdd1-e962c1657ce5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-95e6-09476944d121	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-c474-843c866ea321	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-4177-3306d81dfb1e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-f077-1f44677f7ab2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-10de-7657c531de18	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-6a73-667253bda02e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-6386-a0e4c5e339f2	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-9068-59fc51043c7e	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-b1b2-e648b522be65	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-8a10-82795f0483cd	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-90a0-159dfdfa3717	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-0504-cf40538f6cc6	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-4256-7c6350dd5446	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569c-c8b3-0f62-a1a6c077572d	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569c-c8b1-f398-142ded30d138	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3202 (class 0 OID 37344886)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569c-c8b3-d0c5-f09bf78b2f6b	00160000-569c-c8b3-563a-42ccee1ffb23	\N	00140000-569c-c8b0-df74-3125c6eab438	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569c-c8b3-aa1e-2ecc6a79b767
000e0000-569c-c8b3-c69f-70726666c071	00160000-569c-c8b3-f46a-5a568572c7c3	\N	00140000-569c-c8b0-8c8c-ef91f9c68582	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569c-c8b3-f5b7-5ccb79770dc5
000e0000-569c-c8b3-b11e-8bd727c51ff3	\N	\N	00140000-569c-c8b0-8c8c-ef91f9c68582	00190000-569c-c8b3-12a8-78c92f1bfe0e	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569c-c8b3-aa1e-2ecc6a79b767
000e0000-569c-c8b3-a45b-76e4bd5ca6d5	\N	\N	00140000-569c-c8b0-8c8c-ef91f9c68582	00190000-569c-c8b3-12a8-78c92f1bfe0e	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569c-c8b3-aa1e-2ecc6a79b767
000e0000-569c-c8b3-874b-c8ee7d5512ec	\N	\N	00140000-569c-c8b0-8c8c-ef91f9c68582	00190000-569c-c8b3-12a8-78c92f1bfe0e	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-3b2a-d565f11cfd90	\N	\N	00140000-569c-c8b0-8c8c-ef91f9c68582	00190000-569c-c8b3-12a8-78c92f1bfe0e	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-6741-429a91d54ccf	\N	\N	00140000-569c-c8b0-d220-1bb6fc5b5ef5	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-39db-d95799a2570c	\N	\N	00140000-569c-c8b0-d220-1bb6fc5b5ef5	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-1a14-446fa0a88718	\N	\N	00140000-569c-c8b0-d220-1bb6fc5b5ef5	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-a183-83e5da963b4f	\N	\N	00140000-569c-c8b0-d220-1bb6fc5b5ef5	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-2a5e-0e803c1bab86	\N	\N	00140000-569c-c8b0-d220-1bb6fc5b5ef5	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-2906-3a7d4f2b8140	\N	\N	00140000-569c-c8b0-d220-1bb6fc5b5ef5	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-62bd-c012bc00e317	\N	\N	00140000-569c-c8b0-d220-1bb6fc5b5ef5	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-70a5-7ca1b0842680	\N	\N	00140000-569c-c8b0-d220-1bb6fc5b5ef5	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
000e0000-569c-c8b3-464d-a0b0d211f207	\N	\N	00140000-569c-c8b0-d220-1bb6fc5b5ef5	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569c-c8b3-013e-455cf7a9da76
\.


--
-- TOC entry 3173 (class 0 OID 37344605)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 37344535)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569c-c8b4-e550-81e5fb170ec1	\N	000e0000-569c-c8b3-c69f-70726666c071	1
00200000-569c-c8b4-00ff-994d27981018	\N	000e0000-569c-c8b3-c69f-70726666c071	2
00200000-569c-c8b4-a9ce-9d8d8b3389df	\N	000e0000-569c-c8b3-c69f-70726666c071	3
00200000-569c-c8b4-29c3-f683f99b780c	\N	000e0000-569c-c8b3-c69f-70726666c071	4
00200000-569c-c8b4-b669-acba2663f218	\N	000e0000-569c-c8b3-c69f-70726666c071	5
\.


--
-- TOC entry 3185 (class 0 OID 37344699)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 37344809)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569c-c8b1-76b6-a223767007c5	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569c-c8b1-d9cb-69af4ce18886	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569c-c8b1-a50d-f20a9cb61f22	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569c-c8b1-8c3f-ff114c98a279	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569c-c8b1-9ef7-be8b8e159018	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569c-c8b1-3fe1-d5f3113f8c87	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569c-c8b1-c377-9ed9c3732bd9	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569c-c8b1-a7b9-537e43372a9c	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569c-c8b1-f3fd-85e66f982d13	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569c-c8b1-45f4-603873052e51	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569c-c8b1-896a-16cae86969d3	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569c-c8b1-5d61-23b85fc7f19e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569c-c8b1-d2e8-44e8e81713b0	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569c-c8b1-3e90-6892e2fdb7c4	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569c-c8b1-f995-f83e0b9f2012	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569c-c8b1-f8e2-6c55eeeea04a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569c-c8b1-ffdd-47806344dbff	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569c-c8b1-8e42-2c34d37a5aa7	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569c-c8b1-059f-b9088393ce71	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569c-c8b1-fdf1-063405e91e58	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569c-c8b1-b552-e36a5fed4b7e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569c-c8b1-8e8c-4f7be7528d6c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569c-c8b1-541a-1be20b276ae3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569c-c8b1-5b0f-bec471b303dc	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569c-c8b1-f162-d04e32186962	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569c-c8b1-3dec-5621514e4de7	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569c-c8b1-57b1-747ded496684	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569c-c8b1-517f-6df139aba8a7	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3214 (class 0 OID 37345190)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 37345159)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 37345202)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 37344771)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569c-c8b3-5028-86781b8c385c	00090000-569c-c8b3-4400-1ed886855fcf	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-c8b3-1eb2-10a8ce15a6d8	00090000-569c-c8b3-624d-fa9634d09985	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-c8b3-aa5e-b5073d169dc3	00090000-569c-c8b3-3c51-38d0d140963c	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-c8b3-88d1-a2687c68332c	00090000-569c-c8b3-5923-9b4994563339	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-c8b3-3728-56aed9b48c68	00090000-569c-c8b3-c449-05a4f84bfdf6	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569c-c8b3-9d97-5707fff30cec	00090000-569c-c8b3-d45d-275e171431b5	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3135 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 37344876)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569c-c8b0-df74-3125c6eab438	01	Drama	drama (SURS 01)
00140000-569c-c8b0-0905-f7bd28b08fe7	02	Opera	opera (SURS 02)
00140000-569c-c8b0-c1ae-e6f895472eba	03	Balet	balet (SURS 03)
00140000-569c-c8b0-264b-ddfb10d78ac3	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569c-c8b0-d220-1bb6fc5b5ef5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569c-c8b0-8c8c-ef91f9c68582	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569c-c8b0-c847-7df2007f5b46	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3191 (class 0 OID 37344761)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 37344316)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 37344934)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 37344925)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 37344307)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 37344792)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 37344834)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 37345243)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 37344628)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 37344564)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 37344579)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 37344584)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 37345157)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 37344465)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 37345003)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 37344757)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 37344533)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 37344503)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 37344479)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 37344664)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 37345220)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 37345227)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2909 (class 2606 OID 37345251)
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
-- TOC entry 2767 (class 2606 OID 37344691)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 37344437)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 37344335)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 37344399)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 37344362)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 37344296)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 37344281)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 37344697)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 37344733)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 37344871)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 37344390)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 37344425)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 37345108)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 37344670)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 37344415)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 37344549)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 37344521)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 37344513)
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
-- TOC entry 2765 (class 2606 OID 37344682)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 37345117)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 37345125)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 37345095)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 37345138)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 37344715)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 37344655)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 37344646)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 37344858)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 37344785)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 37344491)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 37344252)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 37344724)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 37344270)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 37344290)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 37344742)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 37344677)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 37344603)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 37344240)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 37344228)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 37344222)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 37344805)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 37344371)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 37344620)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 37344638)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 37344845)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 37344324)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 37345150)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 37344592)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 37344450)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 37344265)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 37344904)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 37344611)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 37344539)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 37344705)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 37344817)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 37345200)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 37345184)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 37345208)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 37344775)
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
-- TOC entry 2834 (class 2606 OID 37344884)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 37344769)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 37344573)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 37344574)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 37344572)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 37344571)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 37344570)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2810 (class 1259 OID 37344806)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2811 (class 1259 OID 37344807)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2812 (class 1259 OID 37344808)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2895 (class 1259 OID 37345222)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2896 (class 1259 OID 37345221)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 37344392)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 37344393)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2768 (class 1259 OID 37344698)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2882 (class 1259 OID 37345188)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2883 (class 1259 OID 37345187)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2884 (class 1259 OID 37345189)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2885 (class 1259 OID 37345186)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2886 (class 1259 OID 37345185)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 37344684)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2763 (class 1259 OID 37344683)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 37344540)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 37344541)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 37344758)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2793 (class 1259 OID 37344760)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2794 (class 1259 OID 37344759)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 37344481)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 37344480)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2873 (class 1259 OID 37345139)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2826 (class 1259 OID 37344873)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2827 (class 1259 OID 37344874)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2828 (class 1259 OID 37344875)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2892 (class 1259 OID 37345209)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2835 (class 1259 OID 37344909)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2836 (class 1259 OID 37344906)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2837 (class 1259 OID 37344910)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2838 (class 1259 OID 37344908)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2839 (class 1259 OID 37344907)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 37344452)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 37344451)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 37344365)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2780 (class 1259 OID 37344725)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 37344297)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 37344298)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2785 (class 1259 OID 37344745)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2786 (class 1259 OID 37344744)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2787 (class 1259 OID 37344743)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 37344402)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 37344401)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 37344403)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 37344516)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2685 (class 1259 OID 37344514)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 37344515)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 37344230)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 37344650)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 37344648)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 37344647)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 37344649)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 37344271)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 37344272)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2771 (class 1259 OID 37344706)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2905 (class 1259 OID 37345244)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2808 (class 1259 OID 37344794)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 37344793)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2906 (class 1259 OID 37345252)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2907 (class 1259 OID 37345253)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 37344671)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2802 (class 1259 OID 37344786)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2803 (class 1259 OID 37344787)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2855 (class 1259 OID 37345008)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2856 (class 1259 OID 37345007)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2857 (class 1259 OID 37345004)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2858 (class 1259 OID 37345005)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2859 (class 1259 OID 37345006)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 37344417)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 37344416)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 37344418)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2774 (class 1259 OID 37344719)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2775 (class 1259 OID 37344718)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2865 (class 1259 OID 37345118)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2866 (class 1259 OID 37345119)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2848 (class 1259 OID 37344938)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2849 (class 1259 OID 37344939)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2850 (class 1259 OID 37344936)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2851 (class 1259 OID 37344937)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 37344629)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 37344630)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2798 (class 1259 OID 37344776)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 37344777)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 37344612)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 37344659)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 37344658)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 37344656)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 37344657)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2845 (class 1259 OID 37344926)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 37344492)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 37344506)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 37344505)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 37344504)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 37344507)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 37344534)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 37344522)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 37344523)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2862 (class 1259 OID 37345109)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2881 (class 1259 OID 37345158)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2899 (class 1259 OID 37345228)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2900 (class 1259 OID 37345229)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 37344337)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 37344336)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 37344372)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 37344373)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 37344623)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 37344622)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 37344621)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 37344566)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 37344569)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 37344565)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 37344568)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 37344567)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 37344391)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 37344325)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 37344326)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 37344466)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 37344468)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 37344467)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 37344469)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 37344665)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2831 (class 1259 OID 37344872)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2840 (class 1259 OID 37344905)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 37344846)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 37344847)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 37344363)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 37344364)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 37344639)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 37344640)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2795 (class 1259 OID 37344770)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 37344241)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 37344438)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 37344400)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 37344229)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2878 (class 1259 OID 37345151)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 37344717)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2779 (class 1259 OID 37344716)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 37344593)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 37344594)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2852 (class 1259 OID 37344935)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 37344613)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 37344426)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 37344885)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2889 (class 1259 OID 37345201)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2871 (class 1259 OID 37345126)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2872 (class 1259 OID 37345127)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2819 (class 1259 OID 37344835)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 37344604)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 37344291)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2944 (class 2606 OID 37345424)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2949 (class 2606 OID 37345449)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2947 (class 2606 OID 37345439)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2943 (class 2606 OID 37345419)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2946 (class 2606 OID 37345434)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2948 (class 2606 OID 37345444)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 37345429)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2986 (class 2606 OID 37345634)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2987 (class 2606 OID 37345639)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2988 (class 2606 OID 37345644)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3020 (class 2606 OID 37345804)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3019 (class 2606 OID 37345799)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 37345309)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2922 (class 2606 OID 37345314)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2969 (class 2606 OID 37345549)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3016 (class 2606 OID 37345784)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3015 (class 2606 OID 37345779)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 37345789)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3014 (class 2606 OID 37345774)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3013 (class 2606 OID 37345769)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2968 (class 2606 OID 37345544)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2967 (class 2606 OID 37345539)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2941 (class 2606 OID 37345409)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2942 (class 2606 OID 37345414)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 37345589)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2979 (class 2606 OID 37345599)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2978 (class 2606 OID 37345594)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2932 (class 2606 OID 37345364)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 37345359)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2965 (class 2606 OID 37345529)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3011 (class 2606 OID 37345759)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2989 (class 2606 OID 37345649)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2990 (class 2606 OID 37345654)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 37345659)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3018 (class 2606 OID 37345794)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2995 (class 2606 OID 37345679)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2992 (class 2606 OID 37345664)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2996 (class 2606 OID 37345684)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2994 (class 2606 OID 37345674)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2993 (class 2606 OID 37345669)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2930 (class 2606 OID 37345354)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 37345349)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 37345294)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 37345289)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 37345569)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 37345269)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2914 (class 2606 OID 37345274)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2976 (class 2606 OID 37345584)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2975 (class 2606 OID 37345579)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2974 (class 2606 OID 37345574)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2924 (class 2606 OID 37345324)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2923 (class 2606 OID 37345319)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2925 (class 2606 OID 37345329)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2937 (class 2606 OID 37345389)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2935 (class 2606 OID 37345379)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2936 (class 2606 OID 37345384)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2910 (class 2606 OID 37345254)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2960 (class 2606 OID 37345504)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2958 (class 2606 OID 37345494)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2957 (class 2606 OID 37345489)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2959 (class 2606 OID 37345499)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 37345259)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2912 (class 2606 OID 37345264)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2970 (class 2606 OID 37345554)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3023 (class 2606 OID 37345819)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2985 (class 2606 OID 37345629)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2984 (class 2606 OID 37345624)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3024 (class 2606 OID 37345824)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3025 (class 2606 OID 37345829)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2966 (class 2606 OID 37345534)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2982 (class 2606 OID 37345614)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2983 (class 2606 OID 37345619)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3006 (class 2606 OID 37345734)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3005 (class 2606 OID 37345729)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3002 (class 2606 OID 37345714)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 37345719)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3004 (class 2606 OID 37345724)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2927 (class 2606 OID 37345339)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 37345334)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2928 (class 2606 OID 37345344)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 37345564)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2971 (class 2606 OID 37345559)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 37345744)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3009 (class 2606 OID 37345749)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3000 (class 2606 OID 37345704)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3001 (class 2606 OID 37345709)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 37345694)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2999 (class 2606 OID 37345699)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2955 (class 2606 OID 37345479)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2956 (class 2606 OID 37345484)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2980 (class 2606 OID 37345604)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2981 (class 2606 OID 37345609)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2950 (class 2606 OID 37345454)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 37345459)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2964 (class 2606 OID 37345524)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2963 (class 2606 OID 37345519)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2961 (class 2606 OID 37345509)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2962 (class 2606 OID 37345514)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2997 (class 2606 OID 37345689)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 37345369)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2934 (class 2606 OID 37345374)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2940 (class 2606 OID 37345404)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2938 (class 2606 OID 37345394)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 37345399)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3007 (class 2606 OID 37345739)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3010 (class 2606 OID 37345754)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 37345764)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3021 (class 2606 OID 37345809)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3022 (class 2606 OID 37345814)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2916 (class 2606 OID 37345284)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 37345279)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 37345299)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 37345304)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2954 (class 2606 OID 37345474)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 37345469)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 37345464)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-18 12:12:55 CET

--
-- PostgreSQL database dump complete
--

