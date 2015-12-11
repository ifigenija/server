--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-10 14:09:44 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 31927274)
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
-- TOC entry 237 (class 1259 OID 31927888)
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
-- TOC entry 236 (class 1259 OID 31927871)
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
-- TOC entry 182 (class 1259 OID 31927267)
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
-- TOC entry 181 (class 1259 OID 31927265)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 31927748)
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
-- TOC entry 230 (class 1259 OID 31927778)
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
-- TOC entry 251 (class 1259 OID 31928181)
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
-- TOC entry 203 (class 1259 OID 31927522)
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
-- TOC entry 205 (class 1259 OID 31927554)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 31927559)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 31928103)
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
-- TOC entry 194 (class 1259 OID 31927419)
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
-- TOC entry 238 (class 1259 OID 31927901)
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
-- TOC entry 223 (class 1259 OID 31927702)
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
-- TOC entry 200 (class 1259 OID 31927493)
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
-- TOC entry 197 (class 1259 OID 31927459)
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
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 31927436)
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
-- TOC entry 212 (class 1259 OID 31927616)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 31928161)
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
-- TOC entry 250 (class 1259 OID 31928174)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 31928196)
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
-- TOC entry 216 (class 1259 OID 31927641)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 31927393)
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
-- TOC entry 185 (class 1259 OID 31927293)
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
-- TOC entry 189 (class 1259 OID 31927360)
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
-- TOC entry 186 (class 1259 OID 31927304)
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
-- TOC entry 178 (class 1259 OID 31927239)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 31927258)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 31927648)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 31927682)
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
-- TOC entry 233 (class 1259 OID 31927819)
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
-- TOC entry 188 (class 1259 OID 31927340)
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
-- TOC entry 191 (class 1259 OID 31927385)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 31928047)
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
-- TOC entry 213 (class 1259 OID 31927622)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 31927370)
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
-- TOC entry 202 (class 1259 OID 31927514)
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
-- TOC entry 198 (class 1259 OID 31927474)
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
-- TOC entry 199 (class 1259 OID 31927486)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 31927634)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 31928061)
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
-- TOC entry 242 (class 1259 OID 31928071)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 31927970)
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
-- TOC entry 243 (class 1259 OID 31928079)
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
-- TOC entry 219 (class 1259 OID 31927663)
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
-- TOC entry 211 (class 1259 OID 31927607)
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
-- TOC entry 210 (class 1259 OID 31927597)
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
-- TOC entry 232 (class 1259 OID 31927808)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 31927738)
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
-- TOC entry 196 (class 1259 OID 31927448)
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
-- TOC entry 175 (class 1259 OID 31927210)
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
-- TOC entry 174 (class 1259 OID 31927208)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 31927676)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 31927248)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 31927232)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 31927690)
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
-- TOC entry 214 (class 1259 OID 31927628)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 31927574)
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
-- TOC entry 173 (class 1259 OID 31927197)
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
-- TOC entry 172 (class 1259 OID 31927189)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 31927184)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 31927755)
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
-- TOC entry 187 (class 1259 OID 31927332)
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
-- TOC entry 209 (class 1259 OID 31927584)
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
-- TOC entry 231 (class 1259 OID 31927796)
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
-- TOC entry 184 (class 1259 OID 31927283)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 31928091)
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
-- TOC entry 207 (class 1259 OID 31927564)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 31927405)
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
-- TOC entry 176 (class 1259 OID 31927219)
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
-- TOC entry 235 (class 1259 OID 31927846)
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
-- TOC entry 201 (class 1259 OID 31927504)
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
-- TOC entry 218 (class 1259 OID 31927655)
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
-- TOC entry 229 (class 1259 OID 31927769)
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
-- TOC entry 247 (class 1259 OID 31928141)
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
-- TOC entry 246 (class 1259 OID 31928110)
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
-- TOC entry 248 (class 1259 OID 31928153)
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
-- TOC entry 225 (class 1259 OID 31927727)
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
-- TOC entry 204 (class 1259 OID 31927548)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 31927836)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 31927717)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 31927270)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 31927213)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 31927274)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5669-7994-0867-89bf2e3bec49	10	30	Otroci	Abonma za otroke	200
000a0000-5669-7994-47ed-ff3c56f03908	20	60	Mladina	Abonma za mladino	400
000a0000-5669-7994-cb61-02ef6990743a	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 31927888)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5669-7995-1ae1-e337a4deacc7	000d0000-5669-7995-e258-92e31c43aea7	\N	00090000-5669-7994-f69c-0365ec6d73b2	000b0000-5669-7995-61de-203653e3ca52	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5669-7995-c8ba-668c37584f36	000d0000-5669-7995-fcb0-da237419156d	00100000-5669-7995-66ca-7f1fcec95d8f	00090000-5669-7994-17f7-958eb8f6c95e	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5669-7995-a514-303ad81852c3	000d0000-5669-7995-aa75-0da0873d8459	00100000-5669-7995-3f45-cf4b57972012	00090000-5669-7994-2ccb-b099502f0405	\N	0003	t	\N	2015-12-10	\N	2	t	\N	f	f
000c0000-5669-7995-3ec4-16d4194f37df	000d0000-5669-7995-e747-5d98533894ac	\N	00090000-5669-7994-9aaa-321dad1f08e5	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5669-7995-2e90-622d21d0c42d	000d0000-5669-7995-0a88-9e4c502dd2d9	\N	00090000-5669-7994-bf01-631485ef55a6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5669-7995-12c3-2b698b30b07d	000d0000-5669-7995-1048-9b227c6b7cbe	\N	00090000-5669-7994-609d-72cfeaece424	000b0000-5669-7995-d118-7c7df786831a	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5669-7995-0363-ae3d938cd4a4	000d0000-5669-7995-bc83-3fc0b1f472a6	00100000-5669-7995-2378-fbfae62f4876	00090000-5669-7994-bdcd-5f02406708d3	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5669-7995-3f7a-28df66f51054	000d0000-5669-7995-229d-d0a50469fa04	\N	00090000-5669-7994-68d8-63bcfa934a5f	000b0000-5669-7995-e895-01a95ed9a40a	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5669-7995-88f4-715a1e9c88db	000d0000-5669-7995-bc83-3fc0b1f472a6	00100000-5669-7995-e094-a46738b16566	00090000-5669-7994-f9c2-9dfee1611c97	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5669-7995-1818-97fd574097d7	000d0000-5669-7995-bc83-3fc0b1f472a6	00100000-5669-7995-e05a-467d0b2a19ea	00090000-5669-7994-adb5-368d737395f7	\N	0010	t	\N	2015-12-10	\N	16	f	\N	f	t
000c0000-5669-7995-3b11-e9d7ccf1ecf4	000d0000-5669-7995-bc83-3fc0b1f472a6	00100000-5669-7995-0558-7185f29bd327	00090000-5669-7994-8faa-b2de98377508	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5669-7995-8dd6-d11beb381d12	000d0000-5669-7995-9d7a-015e9acda633	00100000-5669-7995-66ca-7f1fcec95d8f	00090000-5669-7994-17f7-958eb8f6c95e	000b0000-5669-7995-4b29-7c5422fcc122	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 31927871)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 31927267)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3151 (class 0 OID 31927748)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5669-7995-ad6b-acffe9117dcf	00160000-5669-7994-febb-edba304153d4	00090000-5669-7994-c6e3-4c39e75c45dc	aizv	10	t
003d0000-5669-7995-98b5-fd22c7b4497b	00160000-5669-7994-febb-edba304153d4	00090000-5669-7994-f916-ea7381cfeb99	apri	14	t
003d0000-5669-7995-9587-988ce0a429b2	00160000-5669-7994-28b9-ec8e1df23ba6	00090000-5669-7994-36c0-f96bc83d7e6c	aizv	11	t
003d0000-5669-7995-8556-e85e7d6db159	00160000-5669-7994-ee94-8ff278849f20	00090000-5669-7994-95ad-98fa4dada199	aizv	12	t
003d0000-5669-7995-3a54-9a195fee4337	00160000-5669-7994-febb-edba304153d4	00090000-5669-7994-be4b-5e9edef39f85	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 31927778)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5669-7994-febb-edba304153d4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5669-7994-28b9-ec8e1df23ba6	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5669-7994-ee94-8ff278849f20	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 31928181)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 31927522)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5669-7995-e9f3-3a20a3c9f4eb	\N	\N	00200000-5669-7995-dbc1-3347e668e98a	\N	\N	\N	00220000-5669-7994-28ad-527eb8cc3864	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5669-7995-13c6-6e4b460171ec	\N	\N	00200000-5669-7995-1324-eee1bbed5689	\N	\N	\N	00220000-5669-7994-28ad-527eb8cc3864	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5669-7995-9f84-d26495802978	\N	\N	00200000-5669-7995-3a79-f9a7c4337037	\N	\N	\N	00220000-5669-7994-5263-e5712e0b8079	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5669-7995-ca03-f31196130359	\N	\N	00200000-5669-7995-d18e-97dbaac04a5f	\N	\N	\N	00220000-5669-7994-7223-f27255a3513b	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5669-7995-141c-428e0c449e9f	\N	\N	00200000-5669-7995-ae16-2a7ce4247ab0	\N	\N	\N	00220000-5669-7994-208b-fdbf630531fa	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 31927554)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 31927559)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 31928103)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 31927419)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5669-7992-c639-3714e3a09025	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5669-7992-7362-323790eb304c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5669-7992-a44d-5a1b51595646	AL	ALB	008	Albania 	Albanija	\N
00040000-5669-7992-b0a6-f7e04862fa63	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5669-7992-2b62-1ef840f5c505	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5669-7992-14c5-4f0a122e42d1	AD	AND	020	Andorra 	Andora	\N
00040000-5669-7992-8dc5-81ef5b17dbcf	AO	AGO	024	Angola 	Angola	\N
00040000-5669-7992-e802-12750096252d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5669-7992-7380-143f2d72f5d7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5669-7992-c74e-d195c997a285	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5669-7992-ea6f-ece48b000214	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5669-7992-e9c4-9179072029e0	AM	ARM	051	Armenia 	Armenija	\N
00040000-5669-7992-4deb-9a5522018a0a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5669-7992-4adc-f3f22cd7e43e	AU	AUS	036	Australia 	Avstralija	\N
00040000-5669-7992-8312-4f2a554d8f15	AT	AUT	040	Austria 	Avstrija	\N
00040000-5669-7992-7dbb-2e26408dee48	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5669-7992-9501-7d1ab47f73b9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5669-7992-effa-b04abab30236	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5669-7992-cad6-7977d93a5891	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5669-7992-54c5-2a4b598fe131	BB	BRB	052	Barbados 	Barbados	\N
00040000-5669-7992-c9f5-6f908ca5c740	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5669-7992-a5bb-1d551ba171a5	BE	BEL	056	Belgium 	Belgija	\N
00040000-5669-7992-11a6-0d7ca2918ac9	BZ	BLZ	084	Belize 	Belize	\N
00040000-5669-7992-6b64-ea270da4da32	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5669-7992-4542-913a2a6921db	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5669-7992-0562-ad6838a61578	BT	BTN	064	Bhutan 	Butan	\N
00040000-5669-7992-13ea-a7733da86c91	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5669-7992-c251-ed5db53dc40b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5669-7992-2689-3f8c8f856d81	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5669-7992-cb08-d0a200965054	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5669-7992-5ed0-6b8c0dafbe81	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5669-7992-237d-3a7d4368ea81	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5669-7992-f972-112b237cbc6f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5669-7992-6ae5-4bfc9e46eec0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5669-7992-33ab-d57a8ecda94e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5669-7992-cc46-8a88d3980db4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5669-7992-b396-2010ecf435f1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5669-7992-5572-17cd8496d250	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5669-7992-539c-ff03de1d4d81	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5669-7992-3695-8503ed1d1114	CA	CAN	124	Canada 	Kanada	\N
00040000-5669-7992-3e21-f8f76f466f5b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5669-7992-a2ad-ecf133d4425f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5669-7992-2404-a0b66aa14f99	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5669-7992-830e-a12a8af9e09f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5669-7992-c809-aff14876d119	CL	CHL	152	Chile 	Čile	\N
00040000-5669-7992-59d2-812ff31df01f	CN	CHN	156	China 	Kitajska	\N
00040000-5669-7992-0655-a4001bd5837a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5669-7992-ff55-4a7819ef3d8e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5669-7992-1237-297605769f24	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5669-7992-d2e8-bd9342a1fc15	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5669-7992-6b9d-e78704bde62f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5669-7992-08de-1673c681e387	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5669-7992-c62d-c0f1ad6035e3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5669-7992-3540-e3396da9ad61	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5669-7992-86dc-23a6f81e74d8	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5669-7992-f359-b34bb3c1aa07	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5669-7992-db44-13a7424bcb84	CU	CUB	192	Cuba 	Kuba	\N
00040000-5669-7992-1531-d08325378901	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5669-7992-108b-92a2af8187c8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5669-7992-44f1-72dfe2970884	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5669-7992-337e-0796d0d8067d	DK	DNK	208	Denmark 	Danska	\N
00040000-5669-7992-f374-c32b8ef4952a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5669-7992-81be-c6440a8d64e3	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5669-7992-424c-9c1ed57809d7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5669-7992-f3c2-77e1d38b0fdf	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5669-7992-76a8-2a0b4b99889d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5669-7992-621f-ba72f4aaa98b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5669-7992-20e9-9fdebfbdd2b1	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5669-7992-3574-29e1128dc72f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5669-7992-0e69-bae6a8800c33	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5669-7992-07f3-753a87c562c8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5669-7992-ee2b-d009963f06d6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5669-7992-ef71-10ca6beddc48	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5669-7992-15ab-91af29fd1ebc	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5669-7992-659a-2b38358e2afd	FI	FIN	246	Finland 	Finska	\N
00040000-5669-7992-b2b1-72dc467e2c68	FR	FRA	250	France 	Francija	\N
00040000-5669-7992-ae05-b1659128be31	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5669-7992-5e85-07f2ec7820a2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5669-7992-5ac0-342f56debf56	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5669-7992-bf4d-b235e00140d9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5669-7992-3c1a-73e271e89a78	GA	GAB	266	Gabon 	Gabon	\N
00040000-5669-7992-3ae2-bc95cfa1f71a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5669-7992-b5df-65bbfe20f66b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5669-7992-421a-fe0c6a7611ea	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5669-7992-6198-4a3834ab7e2f	GH	GHA	288	Ghana 	Gana	\N
00040000-5669-7992-7064-de210a3689f0	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5669-7992-8bc0-15f3f7b9add5	GR	GRC	300	Greece 	Grčija	\N
00040000-5669-7992-0011-c438b5e6ec46	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5669-7992-23c9-e1e63a20fe93	GD	GRD	308	Grenada 	Grenada	\N
00040000-5669-7992-040f-53ce3283cd15	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5669-7992-919b-61bdd824d254	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5669-7992-3738-0f123da19cde	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5669-7992-c58c-f366746d78a1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5669-7992-1d9f-80d7de482780	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5669-7992-1027-dbfa65847a67	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5669-7992-dec4-0c28ade2d353	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5669-7992-a8bc-025b63306fbb	HT	HTI	332	Haiti 	Haiti	\N
00040000-5669-7992-f694-b38399d1860a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5669-7992-eaf0-666177651772	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5669-7992-b0b0-7fd504b0aaad	HN	HND	340	Honduras 	Honduras	\N
00040000-5669-7992-5f40-56663f1a887b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5669-7992-adf6-b392e9bcfabb	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5669-7992-2389-3ff07f9ecd2d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5669-7992-692b-fd5c2ec386da	IN	IND	356	India 	Indija	\N
00040000-5669-7992-58f6-d87966e6b49b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5669-7992-dc37-d88e80ef8a39	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5669-7992-2582-b924660a6c0b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5669-7992-deab-d6eb161b41ef	IE	IRL	372	Ireland 	Irska	\N
00040000-5669-7992-3d0c-c7b12a6a3d49	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5669-7992-82e3-274a1e917f27	IL	ISR	376	Israel 	Izrael	\N
00040000-5669-7992-0f8c-5d1f062de8ed	IT	ITA	380	Italy 	Italija	\N
00040000-5669-7992-fcdf-fdb4222f4052	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5669-7992-a610-4508e0d576fe	JP	JPN	392	Japan 	Japonska	\N
00040000-5669-7992-7f41-1c953b6e527a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5669-7992-219b-2434eeff2c67	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5669-7992-3a85-2b09f3310519	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5669-7992-1b6e-1a73abe5bdbb	KE	KEN	404	Kenya 	Kenija	\N
00040000-5669-7992-04dc-33274bfa1688	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5669-7992-ae36-0ee1908986a5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5669-7992-3890-c5a22de8bb44	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5669-7992-83ae-6d695012f760	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5669-7992-0f9f-90123b4034eb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5669-7992-c7a1-f28ce9f56afd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5669-7992-f328-18de2ccd04f0	LV	LVA	428	Latvia 	Latvija	\N
00040000-5669-7992-5d58-5f51cbb5a32a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5669-7992-b489-160d04927820	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5669-7992-2de3-4cb4f7d1702d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5669-7992-f1f9-67adbc4e0975	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5669-7992-feb4-c90f48c4681f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5669-7992-bec1-35e683ee7375	LT	LTU	440	Lithuania 	Litva	\N
00040000-5669-7992-63a4-baf186d51c85	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5669-7992-538f-097c8ed25d52	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5669-7992-58db-a5dfa875b921	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5669-7992-dda8-638eafbdceb4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5669-7992-2cee-a85f489428e5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5669-7992-8907-1f6769f0e274	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5669-7992-3f1c-67973e73be23	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5669-7992-59a5-fc1c4fda14a2	ML	MLI	466	Mali 	Mali	\N
00040000-5669-7992-f6a0-2f7e30335085	MT	MLT	470	Malta 	Malta	\N
00040000-5669-7992-cbd9-3451fc7824b8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5669-7992-c755-788d2fc2d8f9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5669-7992-0489-8bd25662c6e7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5669-7992-3448-5d912dd71cff	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5669-7992-9210-ae15f7131b4d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5669-7992-9307-2a7286b083ec	MX	MEX	484	Mexico 	Mehika	\N
00040000-5669-7992-8daf-f69e69a270e9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5669-7992-1482-503710ded6cf	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5669-7992-57eb-76b58dd24441	MC	MCO	492	Monaco 	Monako	\N
00040000-5669-7992-9704-7a68d19a927e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5669-7992-5295-582d7b72cbbd	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5669-7992-bf1b-42f5b8644521	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5669-7992-7d03-1d9e38125a4d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5669-7992-802b-bb6eadae3c5f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5669-7992-40b9-7f031b4a2c5c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5669-7992-3578-061406d5971e	NA	NAM	516	Namibia 	Namibija	\N
00040000-5669-7992-b03b-065322073a51	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5669-7992-fea4-0495714f596e	NP	NPL	524	Nepal 	Nepal	\N
00040000-5669-7992-30ce-dfcad1750cb0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5669-7992-007a-a1e0c56f30ca	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5669-7992-3959-68187e9bd308	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5669-7992-aecd-d868d4c45e18	NE	NER	562	Niger 	Niger 	\N
00040000-5669-7992-fc77-02aaa69659ae	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5669-7992-60fb-d63c9f30803a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5669-7992-7df7-d7ac3e296222	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5669-7992-4319-d9d862f5df70	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5669-7992-956d-4147fe000259	NO	NOR	578	Norway 	Norveška	\N
00040000-5669-7992-079e-373d916fbd1f	OM	OMN	512	Oman 	Oman	\N
00040000-5669-7992-6297-5e8a5849d740	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5669-7992-f7fe-a0386a231ea4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5669-7992-eb92-58255074c94d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5669-7992-a4c3-e5647e663053	PA	PAN	591	Panama 	Panama	\N
00040000-5669-7992-6388-62ad4eb5ee5c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5669-7992-0640-ace60d0d1567	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5669-7992-af02-cace34cd06a9	PE	PER	604	Peru 	Peru	\N
00040000-5669-7992-b58d-8c7f1ac80906	PH	PHL	608	Philippines 	Filipini	\N
00040000-5669-7992-fade-6a9315061b56	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5669-7992-d859-5aae14926e2d	PL	POL	616	Poland 	Poljska	\N
00040000-5669-7992-09d9-2446d391461d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5669-7992-a2d3-625721753d08	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5669-7992-db9b-ff0971c3a4be	QA	QAT	634	Qatar 	Katar	\N
00040000-5669-7992-64c4-07b29d3b28f7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5669-7992-6388-30d20e975b4a	RO	ROU	642	Romania 	Romunija	\N
00040000-5669-7992-53ae-9f79a8e71056	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5669-7992-1f6c-a527888cfebc	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5669-7992-60a6-956667e337bc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5669-7992-cfe7-894cd2a0f142	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5669-7992-0cb3-ddf35751c591	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5669-7992-cd46-4d4aa1882288	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5669-7992-8dd3-b210a8deb3d0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5669-7992-43e9-953a30b5fdd8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5669-7992-2ced-8f2b0c841c69	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5669-7992-760e-a503397383dd	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5669-7992-5d31-c537927468ec	SM	SMR	674	San Marino 	San Marino	\N
00040000-5669-7992-5ecb-83d5eef9b822	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5669-7992-cb92-43394a4c23d6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5669-7992-1520-49cfe26120a2	SN	SEN	686	Senegal 	Senegal	\N
00040000-5669-7992-7095-1b9baf5b6a8b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5669-7992-dd45-3837dc02abcd	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5669-7992-ca94-0c5a1fc0dc77	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5669-7992-9338-153105f5ea90	SG	SGP	702	Singapore 	Singapur	\N
00040000-5669-7992-3049-61b360aeebfb	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5669-7992-4bae-e22ae4e151ec	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5669-7992-f6b5-3d6f8ee0c41c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5669-7992-ace6-4f6b55aa8409	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5669-7992-0131-d13317ce8adc	SO	SOM	706	Somalia 	Somalija	\N
00040000-5669-7992-d31d-dcedb57498bb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5669-7992-8f08-9c29577f248e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5669-7992-bb46-2e14a190192e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5669-7992-9a89-fd15ac4f8042	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5669-7992-7c96-c04da7af7bd6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5669-7992-db07-a23dcae1d358	SD	SDN	729	Sudan 	Sudan	\N
00040000-5669-7992-e383-5bb5f3f3d2cd	SR	SUR	740	Suriname 	Surinam	\N
00040000-5669-7992-1514-98b2e3054d96	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5669-7992-58f2-185255b39697	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5669-7992-dc86-69c284203320	SE	SWE	752	Sweden 	Švedska	\N
00040000-5669-7992-1eee-2bc5612d8981	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5669-7992-98c8-8a74336d9740	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5669-7992-f329-5fe077d2edd0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5669-7992-ba83-bc8d1e974ba2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5669-7992-99e1-1d32489964d9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5669-7992-5d38-3e4731d48959	TH	THA	764	Thailand 	Tajska	\N
00040000-5669-7992-fa97-2aba65a54b1e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5669-7992-9e83-bc8e0943f7bb	TG	TGO	768	Togo 	Togo	\N
00040000-5669-7992-2320-06dfbb315289	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5669-7992-dc92-a660236d8fa4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5669-7992-87f1-bdc6ff8cd746	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5669-7992-3540-f742ca183844	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5669-7992-6bbe-7e59c6e035c6	TR	TUR	792	Turkey 	Turčija	\N
00040000-5669-7992-db32-bb9b3f4e5d7c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5669-7992-a298-bab11fd39816	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5669-7992-e008-a812d1b0a2ea	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5669-7992-b0e2-5dbdf57c8274	UG	UGA	800	Uganda 	Uganda	\N
00040000-5669-7992-f3d4-c5420beab10b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5669-7992-7a0a-1680804ce8d9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5669-7992-7c7c-4cc5356c43e8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5669-7992-e022-8bdc20bd483c	US	USA	840	United States 	Združene države Amerike	\N
00040000-5669-7992-0801-12c9673febcf	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5669-7992-25e3-ac57a17f906e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5669-7992-f312-a45b2ab13682	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5669-7992-f92f-b18e2f6fe1c6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5669-7992-7357-9e00cf3484f9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5669-7992-d893-df99a62eefb2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5669-7992-a443-c9c7164a4db4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5669-7992-0b47-7274ea7a0fa2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5669-7992-58fc-026a1deb771d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5669-7992-8444-8e96c37b3c8f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5669-7992-be1b-dbbd9d1a2b1c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5669-7992-421c-faac781960a8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5669-7992-2ed5-31be3115151a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 31927901)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5669-7995-1660-65fbf976018c	000e0000-5669-7995-7cb3-3b40f5ff3b9a	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5669-7992-b982-6edc079899c3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5669-7995-14f9-06a2b815774b	000e0000-5669-7995-48cc-24f32b468e60	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5669-7992-3c14-43bbb6140f1a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5669-7995-cefe-4c2213c8e8dd	000e0000-5669-7995-7ace-f2d81da2e26d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5669-7992-b982-6edc079899c3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5669-7995-6128-3c4db45aa2d0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5669-7995-002c-7364f61f0fed	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 31927702)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5669-7995-bc83-3fc0b1f472a6	000e0000-5669-7995-48cc-24f32b468e60	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5669-7992-3986-7d9759bdade9
000d0000-5669-7995-e258-92e31c43aea7	000e0000-5669-7995-48cc-24f32b468e60	000c0000-5669-7995-1ae1-e337a4deacc7	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5669-7992-3986-7d9759bdade9
000d0000-5669-7995-fcb0-da237419156d	000e0000-5669-7995-48cc-24f32b468e60	000c0000-5669-7995-c8ba-668c37584f36	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5669-7992-33a1-b9044ec3bf43
000d0000-5669-7995-aa75-0da0873d8459	000e0000-5669-7995-48cc-24f32b468e60	000c0000-5669-7995-a514-303ad81852c3	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5669-7992-da37-3b57ff14c047
000d0000-5669-7995-e747-5d98533894ac	000e0000-5669-7995-48cc-24f32b468e60	000c0000-5669-7995-3ec4-16d4194f37df	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5669-7992-5d7a-d9791e121376
000d0000-5669-7995-0a88-9e4c502dd2d9	000e0000-5669-7995-48cc-24f32b468e60	000c0000-5669-7995-2e90-622d21d0c42d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5669-7992-5d7a-d9791e121376
000d0000-5669-7995-1048-9b227c6b7cbe	000e0000-5669-7995-48cc-24f32b468e60	000c0000-5669-7995-12c3-2b698b30b07d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5669-7992-3986-7d9759bdade9
000d0000-5669-7995-229d-d0a50469fa04	000e0000-5669-7995-48cc-24f32b468e60	000c0000-5669-7995-3f7a-28df66f51054	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5669-7992-5fbc-9efe062912d2
000d0000-5669-7995-9d7a-015e9acda633	000e0000-5669-7995-48cc-24f32b468e60	000c0000-5669-7995-8dd6-d11beb381d12	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5669-7992-2448-494a69b43d02
\.


--
-- TOC entry 3124 (class 0 OID 31927493)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 31927459)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 31927436)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5669-7995-2bdd-0ae4ae4afdc6	00080000-5669-7994-db8e-8b6acfc66e99	00090000-5669-7994-adb5-368d737395f7	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 31927616)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 31928161)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5669-7994-06f7-fc2e1723e2b4	00010000-5669-7993-0537-bbacf73dc82c	\N	Prva mapa	Root mapa	2015-12-10 14:09:40	2015-12-10 14:09:40	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 31928174)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 31928196)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25231831)
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
-- TOC entry 3140 (class 0 OID 31927641)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 31927393)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5669-7993-a0e6-bb4ac350923d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5669-7993-f307-cf45b934ba51	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5669-7993-2ec7-93d7f7c04c11	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5669-7993-e527-208014e01201	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5669-7993-2c7d-13d024900a9c	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5669-7993-f1f9-952cdd1c35a4	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5669-7993-c66e-1a0620121759	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5669-7993-f1f4-c1d6ed0a14c9	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5669-7993-0bb5-80a37717f74d	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5669-7993-2549-3e2c9a0ef44a	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5669-7993-0618-52caa55bf028	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5669-7993-9c6a-71ef9cc1c993	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5669-7993-d7d2-c83f57100b75	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5669-7993-fbc9-9ae09eb4ec06	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5669-7994-8d94-95f0eb01513a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5669-7994-1983-97fff5206cb5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5669-7994-50ae-c08a7bf5edf1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5669-7994-91c9-1cdfd6ceea16	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5669-7994-fc67-a88d92add966	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5669-7996-0306-2269eaedda07	application.tenant.maticnopodjetje	string	s:36:"00080000-5669-7996-ff85-cce2fd0be4dc";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 31927293)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5669-7994-a6da-8d6b393af04c	00000000-5669-7994-8d94-95f0eb01513a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5669-7994-951a-904fcd76eaf0	00000000-5669-7994-8d94-95f0eb01513a	00010000-5669-7993-0537-bbacf73dc82c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5669-7994-ce4d-374496e53969	00000000-5669-7994-1983-97fff5206cb5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 31927360)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5669-7995-2a5b-3dd90b3e620a	\N	00100000-5669-7995-66ca-7f1fcec95d8f	00100000-5669-7995-3f45-cf4b57972012	01	Gledališče Nimbis
00410000-5669-7995-7b93-4a6f26f86bfc	00410000-5669-7995-2a5b-3dd90b3e620a	00100000-5669-7995-66ca-7f1fcec95d8f	00100000-5669-7995-3f45-cf4b57972012	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 31927304)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5669-7994-f69c-0365ec6d73b2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5669-7994-9aaa-321dad1f08e5	00010000-5669-7994-ca1f-eda78197f163	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5669-7994-2ccb-b099502f0405	00010000-5669-7994-ed80-e9eda79dd5f7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5669-7994-f9c2-9dfee1611c97	00010000-5669-7994-46b4-99bebb701fe2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5669-7994-c8f9-b287bae8ea80	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5669-7994-609d-72cfeaece424	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5669-7994-8faa-b2de98377508	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5669-7994-bdcd-5f02406708d3	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5669-7994-adb5-368d737395f7	00010000-5669-7994-0522-fd386b4711c4	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5669-7994-17f7-958eb8f6c95e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5669-7994-00da-fbaa6afeb94a	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5669-7994-bf01-631485ef55a6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5669-7994-68d8-63bcfa934a5f	00010000-5669-7994-c2f4-afa9cd1eb6c7	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5669-7994-c6e3-4c39e75c45dc	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-7994-f916-ea7381cfeb99	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-7994-36c0-f96bc83d7e6c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-7994-95ad-98fa4dada199	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5669-7994-be4b-5e9edef39f85	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5669-7994-0e8c-7b9665976ba5	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-7994-60b1-651f9b5d421e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-7994-8212-00bd0f693e04	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 31927239)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5669-7992-8137-1e13721b436f	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5669-7992-0d32-df99ebc47357	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5669-7992-f54e-7026ef9808b9	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5669-7992-e6c9-108597aa86f6	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5669-7992-441f-a96edc7ec710	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5669-7992-3a3d-be862219b85e	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5669-7992-3fbe-ff0af47e8501	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5669-7992-4395-d5015b98193e	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5669-7992-84b7-44b06438a548	Abonma-read	Abonma - branje	t
00030000-5669-7992-7fdd-28f5a4f3976a	Abonma-write	Abonma - spreminjanje	t
00030000-5669-7992-875a-39434fb1d269	Alternacija-read	Alternacija - branje	t
00030000-5669-7992-20d9-faf3a3d60caf	Alternacija-write	Alternacija - spreminjanje	t
00030000-5669-7992-d594-20fb5710ab53	Arhivalija-read	Arhivalija - branje	t
00030000-5669-7992-8adb-ee7c095b92e9	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5669-7992-eb2d-96f3289c7967	AuthStorage-read	AuthStorage - branje	t
00030000-5669-7992-2c71-538d33874f71	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5669-7992-54f1-7357c818d5b7	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5669-7992-af95-7c80fa37aad4	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5669-7992-1208-f44d4e2d2d2e	Besedilo-read	Besedilo - branje	t
00030000-5669-7992-a73f-10a75445cd4c	Besedilo-write	Besedilo - spreminjanje	t
00030000-5669-7992-4fc4-fb0722d735ee	Dogodek-read	Dogodek - branje	t
00030000-5669-7992-eee3-f83229fc5f0e	Dogodek-write	Dogodek - spreminjanje	t
00030000-5669-7992-8482-3a5dd5d6ef7d	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5669-7992-9142-49c13198b38e	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5669-7992-8a63-348608aebaaa	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5669-7992-4726-621979e494fc	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5669-7992-38e5-dfc3e604fd93	DogodekTrait-read	DogodekTrait - branje	t
00030000-5669-7992-d6ee-3f2bee23b650	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5669-7992-91c4-a887597b78d4	DrugiVir-read	DrugiVir - branje	t
00030000-5669-7992-9c50-51483cfd7c13	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5669-7992-54b8-bef3ed79c26a	Drzava-read	Drzava - branje	t
00030000-5669-7992-1f3c-73fcdeafc154	Drzava-write	Drzava - spreminjanje	t
00030000-5669-7992-ed23-2a0e9394a553	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5669-7992-f7de-8aeeb083e859	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5669-7992-75aa-9c2d79f06957	Funkcija-read	Funkcija - branje	t
00030000-5669-7992-d080-dca4a583ba18	Funkcija-write	Funkcija - spreminjanje	t
00030000-5669-7992-b8a3-f9edd8f66850	Gostovanje-read	Gostovanje - branje	t
00030000-5669-7992-1dc5-7c34f634a02a	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5669-7992-f8ef-2f6605da67bc	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5669-7992-9de8-8fb4fd2d8521	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5669-7992-830b-d28ac6f80714	Kupec-read	Kupec - branje	t
00030000-5669-7992-b81b-bf151f1d3c27	Kupec-write	Kupec - spreminjanje	t
00030000-5669-7992-d457-83a90d1f6dbb	NacinPlacina-read	NacinPlacina - branje	t
00030000-5669-7992-d846-cd1006e88a7c	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5669-7992-0a33-e283ebfe95ee	Option-read	Option - branje	t
00030000-5669-7992-d2ba-357d3405b345	Option-write	Option - spreminjanje	t
00030000-5669-7992-c5aa-8f374a127dae	OptionValue-read	OptionValue - branje	t
00030000-5669-7992-d488-8fed2525335b	OptionValue-write	OptionValue - spreminjanje	t
00030000-5669-7992-a05d-7389c915316a	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5669-7992-b989-6a27dbddbad3	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5669-7992-24cf-3431c92766ed	Oseba-read	Oseba - branje	t
00030000-5669-7992-bc53-4bf5d3db6d66	Oseba-write	Oseba - spreminjanje	t
00030000-5669-7992-2e7f-c397fbb1e8d8	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5669-7992-6bc4-fd93f966b847	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5669-7992-5738-3eb757855bac	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5669-7992-cdb6-0016598150a6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5669-7992-18f4-70d8697a8eb0	Pogodba-read	Pogodba - branje	t
00030000-5669-7992-f606-f1746215825b	Pogodba-write	Pogodba - spreminjanje	t
00030000-5669-7992-9219-52bbdc0818f6	Popa-read	Popa - branje	t
00030000-5669-7992-ffed-a858f6e42661	Popa-write	Popa - spreminjanje	t
00030000-5669-7992-c363-25e5f1492f85	Posta-read	Posta - branje	t
00030000-5669-7992-9b5f-98d6a622d970	Posta-write	Posta - spreminjanje	t
00030000-5669-7992-89b8-1bd294491587	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5669-7992-d5d7-acd1a9e3b082	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5669-7992-231e-fb1259c29e33	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5669-7992-ef12-4b7a595f9446	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5669-7992-d183-470e9e99eebf	PostniNaslov-read	PostniNaslov - branje	t
00030000-5669-7992-2610-a370edd11f73	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5669-7992-f235-5685fcec1188	Praznik-read	Praznik - branje	t
00030000-5669-7992-e4f6-c4d6ddcf8d3c	Praznik-write	Praznik - spreminjanje	t
00030000-5669-7992-2691-ab98412082b4	Predstava-read	Predstava - branje	t
00030000-5669-7992-7176-492a3390af34	Predstava-write	Predstava - spreminjanje	t
00030000-5669-7992-82df-ffbfaaf6107c	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5669-7992-bd85-7d00e366629e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5669-7992-068f-1ab5a783cc68	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5669-7992-101e-011d19f65a43	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5669-7992-ff12-63d9881b7a9d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5669-7992-e7cb-16cc234a6ca7	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5669-7992-e351-20a408db2083	ProgramDela-read	ProgramDela - branje	t
00030000-5669-7992-c3ab-1aed89c943b1	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5669-7992-bf48-1a15b0acfe34	ProgramFestival-read	ProgramFestival - branje	t
00030000-5669-7992-c9db-d0e3c5ae7cb8	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5669-7992-06f1-3ac0ddc5312b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5669-7992-f3c2-0232a3cecf53	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5669-7992-8ef7-45c42cacff21	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5669-7992-2407-6456b090ed82	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5669-7992-9b87-957b7ce4e52c	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5669-7992-8553-35a4fd225c6a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5669-7992-f090-4140b5731053	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5669-7992-5421-ec7f9040ce06	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5669-7992-602d-2d405239e880	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5669-7992-b26e-13bd402ad55c	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5669-7992-f701-85a77e1de4b4	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5669-7992-2019-7c7b18f78e77	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5669-7992-2c83-6ab326f226cc	ProgramRazno-read	ProgramRazno - branje	t
00030000-5669-7992-457d-98db45d16e09	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5669-7992-89b7-9e35d5f22241	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5669-7992-a0c8-be174166004e	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5669-7992-8f09-4aeb6d049eee	Prostor-read	Prostor - branje	t
00030000-5669-7992-69df-77c57b6bda77	Prostor-write	Prostor - spreminjanje	t
00030000-5669-7992-cb8e-f2516fa7c65e	Racun-read	Racun - branje	t
00030000-5669-7992-a13b-0418dacb3252	Racun-write	Racun - spreminjanje	t
00030000-5669-7992-3318-185a050ef1f8	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5669-7992-8794-387a0cadba8c	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5669-7992-7ddf-4cfd4676dafa	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5669-7992-cebc-ced36128da2a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5669-7992-a336-1a934c926f99	Rekvizit-read	Rekvizit - branje	t
00030000-5669-7992-b2b6-873852455dc0	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5669-7992-faee-3176737afc04	Revizija-read	Revizija - branje	t
00030000-5669-7992-bfef-a97e8e7d851f	Revizija-write	Revizija - spreminjanje	t
00030000-5669-7992-d4b8-95bf37b14c40	Rezervacija-read	Rezervacija - branje	t
00030000-5669-7992-cedd-4d6100808f08	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5669-7992-ec0a-a132ab4e5752	SedezniRed-read	SedezniRed - branje	t
00030000-5669-7992-fc03-1132b774c768	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5669-7992-d6b4-75a72771d6ca	Sedez-read	Sedez - branje	t
00030000-5669-7992-ea5e-a45e5bfcea43	Sedez-write	Sedez - spreminjanje	t
00030000-5669-7992-ec85-b7cde38fbaa6	Sezona-read	Sezona - branje	t
00030000-5669-7992-295c-7779cb61dc37	Sezona-write	Sezona - spreminjanje	t
00030000-5669-7992-347a-03cc0d5dc3d1	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5669-7992-2118-86abb1c98607	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5669-7992-2339-e2cfd370f29e	Telefonska-read	Telefonska - branje	t
00030000-5669-7992-08be-460d35d15032	Telefonska-write	Telefonska - spreminjanje	t
00030000-5669-7992-0d15-666e1d2e4cfa	TerminStoritve-read	TerminStoritve - branje	t
00030000-5669-7992-8c1d-56e49626a923	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5669-7992-5b85-af1038e57b4a	TipFunkcije-read	TipFunkcije - branje	t
00030000-5669-7992-f54e-bed9388be02e	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5669-7992-f98e-cde5d050d70c	TipPopa-read	TipPopa - branje	t
00030000-5669-7992-7f9c-6ef54e1a47d3	TipPopa-write	TipPopa - spreminjanje	t
00030000-5669-7992-75b2-66eabde46971	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5669-7992-4daf-697769cd58c1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5669-7992-2712-64e34b8985bc	TipVaje-read	TipVaje - branje	t
00030000-5669-7992-f5a0-78ddb121377a	TipVaje-write	TipVaje - spreminjanje	t
00030000-5669-7992-e05f-504cb3e9b4d9	Trr-read	Trr - branje	t
00030000-5669-7992-0e2d-735bde5de9c4	Trr-write	Trr - spreminjanje	t
00030000-5669-7992-fe04-2a533743b28d	Uprizoritev-read	Uprizoritev - branje	t
00030000-5669-7992-dc00-dfa688e8606c	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5669-7992-3f67-916845dc20da	Vaja-read	Vaja - branje	t
00030000-5669-7992-ebf4-7011207a6f3d	Vaja-write	Vaja - spreminjanje	t
00030000-5669-7992-6cdc-75391bd64471	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5669-7992-a74f-f29eb2b3d784	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5669-7992-1813-e841f94ee5b1	VrstaStroska-read	VrstaStroska - branje	t
00030000-5669-7992-4750-4d82cce0da7d	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5669-7992-c6d7-a9113fc6eff7	Zaposlitev-read	Zaposlitev - branje	t
00030000-5669-7992-c705-570b3208641f	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5669-7992-4f43-8d29c47dc1a4	Zasedenost-read	Zasedenost - branje	t
00030000-5669-7992-96f3-4db934f7206d	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5669-7992-c534-4821f34c7d45	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5669-7992-0a2a-448a18410497	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5669-7992-1146-f605f9caf483	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5669-7992-6cdc-c4c904d9e8a1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5669-7992-a81e-da02aae6b6dc	Job-read	Branje opravil - samo zase - branje	t
00030000-5669-7992-16bc-7e105443f583	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5669-7992-c364-fa38159917fe	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5669-7992-7a1a-3ac51a8f9b1b	Report-read	Report - branje	t
00030000-5669-7992-5e48-27e5107f294b	Report-write	Report - spreminjanje	t
00030000-5669-7992-47a6-fea5c732e00c	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5669-7992-2f20-c4011fecb9a9	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5669-7992-1025-e75feb0015a2	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5669-7992-ba8b-74dc2674b132	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5669-7992-9972-4deeb58b8ff9	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5669-7992-8ff0-54f2bfb91ea3	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5669-7992-5a64-5744c0dbab8b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5669-7992-3795-1ee00cabf05d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5669-7992-e472-d777c4d53153	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5669-7992-7cac-56698a0125da	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5669-7992-f5e5-bf09ed966b62	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5669-7992-3644-5079894ebed9	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5669-7992-654f-a44115b305a2	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5669-7992-6646-cdfb874a8906	Datoteka-write	Datoteka - spreminjanje	t
00030000-5669-7992-a1cd-d75a6daf4aed	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 31927258)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5669-7992-147f-6791740ebb5c	00030000-5669-7992-0d32-df99ebc47357
00020000-5669-7992-147f-6791740ebb5c	00030000-5669-7992-8137-1e13721b436f
00020000-5669-7992-2a22-7ddc5eedefaa	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-af95-7c80fa37aad4
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-a73f-10a75445cd4c
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-6646-cdfb874a8906
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-7cac-56698a0125da
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-54f1-7357c818d5b7
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-1208-f44d4e2d2d2e
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7992-9ac0-3d5295c990f8	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7992-6737-70ac0cc27ec5	00030000-5669-7992-54f1-7357c818d5b7
00020000-5669-7992-6737-70ac0cc27ec5	00030000-5669-7992-1208-f44d4e2d2d2e
00020000-5669-7992-6737-70ac0cc27ec5	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7992-6737-70ac0cc27ec5	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7992-6737-70ac0cc27ec5	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7992-a3aa-4bd56465a817	00030000-5669-7992-c6d7-a9113fc6eff7
00020000-5669-7992-a3aa-4bd56465a817	00030000-5669-7992-c705-570b3208641f
00020000-5669-7992-a3aa-4bd56465a817	00030000-5669-7992-3a3d-be862219b85e
00020000-5669-7992-a3aa-4bd56465a817	00030000-5669-7992-441f-a96edc7ec710
00020000-5669-7992-a3aa-4bd56465a817	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7992-a3aa-4bd56465a817	00030000-5669-7992-bc53-4bf5d3db6d66
00020000-5669-7992-a3aa-4bd56465a817	00030000-5669-7992-a05d-7389c915316a
00020000-5669-7992-da28-76ce3f836f3f	00030000-5669-7992-c6d7-a9113fc6eff7
00020000-5669-7992-da28-76ce3f836f3f	00030000-5669-7992-3a3d-be862219b85e
00020000-5669-7992-da28-76ce3f836f3f	00030000-5669-7992-a05d-7389c915316a
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-bc53-4bf5d3db6d66
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-d183-470e9e99eebf
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-2610-a370edd11f73
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-2339-e2cfd370f29e
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-08be-460d35d15032
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-6646-cdfb874a8906
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-7cac-56698a0125da
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7992-a153-585f1d9712e2	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7992-a63c-a60c59f9f87a	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7992-a63c-a60c59f9f87a	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7992-a63c-a60c59f9f87a	00030000-5669-7992-d183-470e9e99eebf
00020000-5669-7992-a63c-a60c59f9f87a	00030000-5669-7992-2339-e2cfd370f29e
00020000-5669-7992-a63c-a60c59f9f87a	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7992-a63c-a60c59f9f87a	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7992-a63c-a60c59f9f87a	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7992-3320-7130414b172f	00030000-5669-7992-bc53-4bf5d3db6d66
00020000-5669-7992-3320-7130414b172f	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7992-3320-7130414b172f	00030000-5669-7992-3a3d-be862219b85e
00020000-5669-7992-3320-7130414b172f	00030000-5669-7992-441f-a96edc7ec710
00020000-5669-7992-3320-7130414b172f	00030000-5669-7992-e05f-504cb3e9b4d9
00020000-5669-7992-3320-7130414b172f	00030000-5669-7992-0e2d-735bde5de9c4
00020000-5669-7992-3320-7130414b172f	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7992-833b-fdddb03badad	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7992-833b-fdddb03badad	00030000-5669-7992-3a3d-be862219b85e
00020000-5669-7992-833b-fdddb03badad	00030000-5669-7992-e05f-504cb3e9b4d9
00020000-5669-7992-833b-fdddb03badad	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-2339-e2cfd370f29e
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-d183-470e9e99eebf
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-e05f-504cb3e9b4d9
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-f8ef-2f6605da67bc
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-08be-460d35d15032
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-2610-a370edd11f73
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-0e2d-735bde5de9c4
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-ffed-a858f6e42661
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-6646-cdfb874a8906
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-7cac-56698a0125da
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-9de8-8fb4fd2d8521
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-e7cb-16cc234a6ca7
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7992-b168-7f754af84bca	00030000-5669-7992-f98e-cde5d050d70c
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-2339-e2cfd370f29e
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-d183-470e9e99eebf
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-e05f-504cb3e9b4d9
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-f8ef-2f6605da67bc
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7992-2fdb-90d8877820f8	00030000-5669-7992-f98e-cde5d050d70c
00020000-5669-7992-c086-a69104423c48	00030000-5669-7992-f98e-cde5d050d70c
00020000-5669-7992-c086-a69104423c48	00030000-5669-7992-7f9c-6ef54e1a47d3
00020000-5669-7992-5f94-ddb58cc0e8f7	00030000-5669-7992-f98e-cde5d050d70c
00020000-5669-7992-a77b-a7b2d2533317	00030000-5669-7992-c363-25e5f1492f85
00020000-5669-7992-a77b-a7b2d2533317	00030000-5669-7992-9b5f-98d6a622d970
00020000-5669-7992-cd52-251775cb96b0	00030000-5669-7992-c363-25e5f1492f85
00020000-5669-7992-6326-ad18f3f07729	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7992-6326-ad18f3f07729	00030000-5669-7992-1f3c-73fcdeafc154
00020000-5669-7992-6a2b-301a7c7ba11e	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7993-d8cc-3e700b8f804e	00030000-5669-7992-1146-f605f9caf483
00020000-5669-7993-d8cc-3e700b8f804e	00030000-5669-7992-6cdc-c4c904d9e8a1
00020000-5669-7993-c6d0-ca35e36ca9c1	00030000-5669-7992-1146-f605f9caf483
00020000-5669-7993-7dd5-b442d6a7011f	00030000-5669-7992-c534-4821f34c7d45
00020000-5669-7993-7dd5-b442d6a7011f	00030000-5669-7992-0a2a-448a18410497
00020000-5669-7993-0fe4-74ea58812011	00030000-5669-7992-c534-4821f34c7d45
00020000-5669-7993-bacf-b9f781509b81	00030000-5669-7992-84b7-44b06438a548
00020000-5669-7993-bacf-b9f781509b81	00030000-5669-7992-7fdd-28f5a4f3976a
00020000-5669-7993-409c-8fff2cab2b93	00030000-5669-7992-84b7-44b06438a548
00020000-5669-7993-5d2e-3c050b698dcd	00030000-5669-7992-8f09-4aeb6d049eee
00020000-5669-7993-5d2e-3c050b698dcd	00030000-5669-7992-69df-77c57b6bda77
00020000-5669-7993-5d2e-3c050b698dcd	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7993-5d2e-3c050b698dcd	00030000-5669-7992-d183-470e9e99eebf
00020000-5669-7993-5d2e-3c050b698dcd	00030000-5669-7992-2610-a370edd11f73
00020000-5669-7993-5d2e-3c050b698dcd	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7993-d274-05452765c981	00030000-5669-7992-8f09-4aeb6d049eee
00020000-5669-7993-d274-05452765c981	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7993-d274-05452765c981	00030000-5669-7992-d183-470e9e99eebf
00020000-5669-7993-fb1d-a9642adb21ee	00030000-5669-7992-1813-e841f94ee5b1
00020000-5669-7993-fb1d-a9642adb21ee	00030000-5669-7992-4750-4d82cce0da7d
00020000-5669-7993-9340-0a8c8486ec7f	00030000-5669-7992-1813-e841f94ee5b1
00020000-5669-7993-faa2-a77e81892c6a	00030000-5669-7992-b989-6a27dbddbad3
00020000-5669-7993-faa2-a77e81892c6a	00030000-5669-7992-a05d-7389c915316a
00020000-5669-7993-faa2-a77e81892c6a	00030000-5669-7992-c6d7-a9113fc6eff7
00020000-5669-7993-faa2-a77e81892c6a	00030000-5669-7992-6646-cdfb874a8906
00020000-5669-7993-faa2-a77e81892c6a	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7993-faa2-a77e81892c6a	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7993-faa2-a77e81892c6a	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7993-faa2-a77e81892c6a	00030000-5669-7992-7cac-56698a0125da
00020000-5669-7993-faa2-a77e81892c6a	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7993-6236-53cf9e279118	00030000-5669-7992-a05d-7389c915316a
00020000-5669-7993-6236-53cf9e279118	00030000-5669-7992-c6d7-a9113fc6eff7
00020000-5669-7993-6236-53cf9e279118	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7993-6236-53cf9e279118	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7993-6236-53cf9e279118	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7993-4c5c-1e84498de0bb	00030000-5669-7992-2712-64e34b8985bc
00020000-5669-7993-4c5c-1e84498de0bb	00030000-5669-7992-f5a0-78ddb121377a
00020000-5669-7993-33c6-73781a0ba786	00030000-5669-7992-2712-64e34b8985bc
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-3fbe-ff0af47e8501
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-4395-d5015b98193e
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-e351-20a408db2083
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-c3ab-1aed89c943b1
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-bf48-1a15b0acfe34
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-c9db-d0e3c5ae7cb8
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-06f1-3ac0ddc5312b
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-f3c2-0232a3cecf53
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-8ef7-45c42cacff21
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-2407-6456b090ed82
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-9b87-957b7ce4e52c
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-8553-35a4fd225c6a
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-f090-4140b5731053
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-5421-ec7f9040ce06
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-602d-2d405239e880
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-b26e-13bd402ad55c
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-f701-85a77e1de4b4
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-2019-7c7b18f78e77
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-2c83-6ab326f226cc
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-457d-98db45d16e09
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-89b7-9e35d5f22241
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-a0c8-be174166004e
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-101e-011d19f65a43
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-9c50-51483cfd7c13
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-d5d7-acd1a9e3b082
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-16bc-7e105443f583
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-91c4-a887597b78d4
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-068f-1ab5a783cc68
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-89b8-1bd294491587
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-1813-e841f94ee5b1
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-347a-03cc0d5dc3d1
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-75aa-9c2d79f06957
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-875a-39434fb1d269
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-5b85-af1038e57b4a
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-18f4-70d8697a8eb0
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-6646-cdfb874a8906
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-7cac-56698a0125da
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-a81e-da02aae6b6dc
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7993-117f-f64b131ff6fb	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-e351-20a408db2083
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-bf48-1a15b0acfe34
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-06f1-3ac0ddc5312b
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-8ef7-45c42cacff21
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-9b87-957b7ce4e52c
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-f090-4140b5731053
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-602d-2d405239e880
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-f701-85a77e1de4b4
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-2c83-6ab326f226cc
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-89b7-9e35d5f22241
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-068f-1ab5a783cc68
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-91c4-a887597b78d4
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-89b8-1bd294491587
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-a81e-da02aae6b6dc
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7993-7f2b-9c61ca4ccf1f	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-dc00-dfa688e8606c
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-875a-39434fb1d269
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-20d9-faf3a3d60caf
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-1208-f44d4e2d2d2e
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-75aa-9c2d79f06957
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-d080-dca4a583ba18
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-5b85-af1038e57b4a
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-6646-cdfb874a8906
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7993-65e7-7db89a38024f	00030000-5669-7992-7cac-56698a0125da
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-875a-39434fb1d269
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-1208-f44d4e2d2d2e
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-75aa-9c2d79f06957
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-5b85-af1038e57b4a
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7993-7cb4-80da4d92d329	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-875a-39434fb1d269
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-20d9-faf3a3d60caf
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-75aa-9c2d79f06957
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-3a3d-be862219b85e
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-441f-a96edc7ec710
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-18f4-70d8697a8eb0
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-f606-f1746215825b
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-347a-03cc0d5dc3d1
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-2118-86abb1c98607
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-5b85-af1038e57b4a
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-e05f-504cb3e9b4d9
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7993-7441-fe1fddf46979	00030000-5669-7992-c6d7-a9113fc6eff7
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-875a-39434fb1d269
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-75aa-9c2d79f06957
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-3a3d-be862219b85e
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-18f4-70d8697a8eb0
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-347a-03cc0d5dc3d1
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-5b85-af1038e57b4a
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-e05f-504cb3e9b4d9
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7993-d0ac-947a77c0a163	00030000-5669-7992-c6d7-a9113fc6eff7
00020000-5669-7993-94ae-b0332e46b119	00030000-5669-7992-347a-03cc0d5dc3d1
00020000-5669-7993-94ae-b0332e46b119	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7993-94ae-b0332e46b119	00030000-5669-7992-75aa-9c2d79f06957
00020000-5669-7993-94ae-b0332e46b119	00030000-5669-7992-18f4-70d8697a8eb0
00020000-5669-7993-94ae-b0332e46b119	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7993-94ae-b0332e46b119	00030000-5669-7992-5b85-af1038e57b4a
00020000-5669-7993-94ae-b0332e46b119	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7993-941b-51e95200991c	00030000-5669-7992-347a-03cc0d5dc3d1
00020000-5669-7993-941b-51e95200991c	00030000-5669-7992-2118-86abb1c98607
00020000-5669-7993-941b-51e95200991c	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7993-941b-51e95200991c	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7993-b30b-75ef915a394a	00030000-5669-7992-347a-03cc0d5dc3d1
00020000-5669-7993-b30b-75ef915a394a	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-84b7-44b06438a548
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-875a-39434fb1d269
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-54f1-7357c818d5b7
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-af95-7c80fa37aad4
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-1208-f44d4e2d2d2e
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-a73f-10a75445cd4c
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-6646-cdfb874a8906
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-75aa-9c2d79f06957
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-f8ef-2f6605da67bc
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-a05d-7389c915316a
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-bc53-4bf5d3db6d66
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-c363-25e5f1492f85
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-d183-470e9e99eebf
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-2610-a370edd11f73
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-8f09-4aeb6d049eee
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-2339-e2cfd370f29e
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-08be-460d35d15032
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-5b85-af1038e57b4a
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-f98e-cde5d050d70c
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-2712-64e34b8985bc
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-e05f-504cb3e9b4d9
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-1813-e841f94ee5b1
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-7cac-56698a0125da
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-c6d7-a9113fc6eff7
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-c534-4821f34c7d45
00020000-5669-7993-9857-5a064f9f1f45	00030000-5669-7992-1146-f605f9caf483
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8137-1e13721b436f
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-0d32-df99ebc47357
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-84b7-44b06438a548
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-7fdd-28f5a4f3976a
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-875a-39434fb1d269
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-20d9-faf3a3d60caf
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d594-20fb5710ab53
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8adb-ee7c095b92e9
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-eb2d-96f3289c7967
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2c71-538d33874f71
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-54f1-7357c818d5b7
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-af95-7c80fa37aad4
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-1208-f44d4e2d2d2e
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-a73f-10a75445cd4c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-6646-cdfb874a8906
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-4fc4-fb0722d735ee
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-e6c9-108597aa86f6
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-eee3-f83229fc5f0e
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8482-3a5dd5d6ef7d
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-9142-49c13198b38e
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8a63-348608aebaaa
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-4726-621979e494fc
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-91c4-a887597b78d4
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-9c50-51483cfd7c13
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-54b8-bef3ed79c26a
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-1f3c-73fcdeafc154
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-ed23-2a0e9394a553
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f7de-8aeeb083e859
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-75aa-9c2d79f06957
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d080-dca4a583ba18
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-b8a3-f9edd8f66850
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-1dc5-7c34f634a02a
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-c364-fa38159917fe
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-a81e-da02aae6b6dc
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-16bc-7e105443f583
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f8ef-2f6605da67bc
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-9de8-8fb4fd2d8521
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-830b-d28ac6f80714
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-b81b-bf151f1d3c27
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2f20-c4011fecb9a9
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-1025-e75feb0015a2
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-ba8b-74dc2674b132
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-9972-4deeb58b8ff9
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-5a64-5744c0dbab8b
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8ff0-54f2bfb91ea3
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d457-83a90d1f6dbb
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d846-cd1006e88a7c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-0a33-e283ebfe95ee
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d2ba-357d3405b345
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-c5aa-8f374a127dae
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d488-8fed2525335b
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-a05d-7389c915316a
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-b989-6a27dbddbad3
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-441f-a96edc7ec710
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-bc53-4bf5d3db6d66
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2e7f-c397fbb1e8d8
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-6bc4-fd93f966b847
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-5738-3eb757855bac
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-cdb6-0016598150a6
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-18f4-70d8697a8eb0
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f606-f1746215825b
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-ffed-a858f6e42661
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-c363-25e5f1492f85
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-9b5f-98d6a622d970
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-89b8-1bd294491587
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d5d7-acd1a9e3b082
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-231e-fb1259c29e33
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-ef12-4b7a595f9446
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d183-470e9e99eebf
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2610-a370edd11f73
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f235-5685fcec1188
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-e4f6-c4d6ddcf8d3c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2691-ab98412082b4
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-7176-492a3390af34
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-82df-ffbfaaf6107c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-bd85-7d00e366629e
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-068f-1ab5a783cc68
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-101e-011d19f65a43
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-ff12-63d9881b7a9d
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-e7cb-16cc234a6ca7
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-3fbe-ff0af47e8501
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-e351-20a408db2083
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-4395-d5015b98193e
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-c3ab-1aed89c943b1
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-bf48-1a15b0acfe34
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-c9db-d0e3c5ae7cb8
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-06f1-3ac0ddc5312b
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f3c2-0232a3cecf53
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8ef7-45c42cacff21
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2407-6456b090ed82
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-9b87-957b7ce4e52c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8553-35a4fd225c6a
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f090-4140b5731053
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-5421-ec7f9040ce06
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-602d-2d405239e880
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-b26e-13bd402ad55c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f701-85a77e1de4b4
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2019-7c7b18f78e77
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2c83-6ab326f226cc
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-457d-98db45d16e09
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-89b7-9e35d5f22241
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-a0c8-be174166004e
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8f09-4aeb6d049eee
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-69df-77c57b6bda77
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-cb8e-f2516fa7c65e
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-a13b-0418dacb3252
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-3318-185a050ef1f8
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8794-387a0cadba8c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-a336-1a934c926f99
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-b2b6-873852455dc0
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-7ddf-4cfd4676dafa
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-cebc-ced36128da2a
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-7a1a-3ac51a8f9b1b
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-5e48-27e5107f294b
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-faee-3176737afc04
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-bfef-a97e8e7d851f
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d4b8-95bf37b14c40
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-cedd-4d6100808f08
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-d6b4-75a72771d6ca
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-ea5e-a45e5bfcea43
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-ec0a-a132ab4e5752
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-fc03-1132b774c768
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-ec85-b7cde38fbaa6
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-295c-7779cb61dc37
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-47a6-fea5c732e00c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-347a-03cc0d5dc3d1
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2118-86abb1c98607
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2339-e2cfd370f29e
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-08be-460d35d15032
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-0d15-666e1d2e4cfa
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f54e-7026ef9808b9
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-8c1d-56e49626a923
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-5b85-af1038e57b4a
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f54e-bed9388be02e
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f98e-cde5d050d70c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-7f9c-6ef54e1a47d3
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-75b2-66eabde46971
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-4daf-697769cd58c1
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-2712-64e34b8985bc
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f5a0-78ddb121377a
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-e05f-504cb3e9b4d9
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-0e2d-735bde5de9c4
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-dc00-dfa688e8606c
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-3f67-916845dc20da
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-ebf4-7011207a6f3d
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-6cdc-75391bd64471
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-a74f-f29eb2b3d784
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-1813-e841f94ee5b1
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-4750-4d82cce0da7d
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-654f-a44115b305a2
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-3644-5079894ebed9
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-7cac-56698a0125da
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-c6d7-a9113fc6eff7
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-c705-570b3208641f
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-4f43-8d29c47dc1a4
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-96f3-4db934f7206d
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-c534-4821f34c7d45
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-0a2a-448a18410497
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-1146-f605f9caf483
00020000-5669-7994-28f2-cfc281e0dbc1	00030000-5669-7992-6cdc-c4c904d9e8a1
00020000-5669-7994-070a-ef6f0987716a	00030000-5669-7992-f5e5-bf09ed966b62
00020000-5669-7994-902a-c4592f16ff8b	00030000-5669-7992-7cac-56698a0125da
00020000-5669-7994-53c0-b1b8ad50d15a	00030000-5669-7992-dc00-dfa688e8606c
00020000-5669-7994-f8d2-86b525a36dc2	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7994-adaa-fc897cbe293a	00030000-5669-7992-1025-e75feb0015a2
00020000-5669-7994-6990-8ac9f4ebe0dd	00030000-5669-7992-ba8b-74dc2674b132
00020000-5669-7994-f84f-df5105b9e1fb	00030000-5669-7992-9972-4deeb58b8ff9
00020000-5669-7994-02c2-7d56456a87bc	00030000-5669-7992-2f20-c4011fecb9a9
00020000-5669-7994-e5b6-4fcb6923803d	00030000-5669-7992-5a64-5744c0dbab8b
00020000-5669-7994-1fd6-31cd0c675a69	00030000-5669-7992-8ff0-54f2bfb91ea3
00020000-5669-7994-3d52-2ce6c9a4877a	00030000-5669-7992-e472-d777c4d53153
00020000-5669-7994-1268-78083305ab97	00030000-5669-7992-3795-1ee00cabf05d
00020000-5669-7994-a221-7905fe5baa08	00030000-5669-7992-24cf-3431c92766ed
00020000-5669-7994-4437-6bab5d1b02c9	00030000-5669-7992-bc53-4bf5d3db6d66
00020000-5669-7994-51b5-d5a2a85fbe22	00030000-5669-7992-441f-a96edc7ec710
00020000-5669-7994-6abb-674b0044a65f	00030000-5669-7992-3a3d-be862219b85e
00020000-5669-7994-49ac-fd7260b0a6c7	00030000-5669-7992-6646-cdfb874a8906
00020000-5669-7994-a26a-fc287d514d67	00030000-5669-7992-a1cd-d75a6daf4aed
00020000-5669-7994-ec1e-96938837805e	00030000-5669-7992-9219-52bbdc0818f6
00020000-5669-7994-ec1e-96938837805e	00030000-5669-7992-ffed-a858f6e42661
00020000-5669-7994-ec1e-96938837805e	00030000-5669-7992-fe04-2a533743b28d
00020000-5669-7994-0920-945213bfe24b	00030000-5669-7992-e05f-504cb3e9b4d9
00020000-5669-7994-e670-b799ac05ac4f	00030000-5669-7992-0e2d-735bde5de9c4
00020000-5669-7994-7c75-7f5e0198b4c8	00030000-5669-7992-47a6-fea5c732e00c
00020000-5669-7994-749d-47f38232dcc2	00030000-5669-7992-2339-e2cfd370f29e
00020000-5669-7994-70b9-5af8368d52d7	00030000-5669-7992-08be-460d35d15032
00020000-5669-7994-cbe4-360118483416	00030000-5669-7992-d183-470e9e99eebf
00020000-5669-7994-2d99-a1d85c1a1d46	00030000-5669-7992-2610-a370edd11f73
00020000-5669-7994-4688-7fcda8cf3e09	00030000-5669-7992-c6d7-a9113fc6eff7
00020000-5669-7994-3249-0f94f5762a45	00030000-5669-7992-c705-570b3208641f
00020000-5669-7994-6c5a-022de3b47f61	00030000-5669-7992-18f4-70d8697a8eb0
00020000-5669-7994-c11a-27ff47c0fc6e	00030000-5669-7992-f606-f1746215825b
00020000-5669-7994-e5db-348f2355e9ec	00030000-5669-7992-347a-03cc0d5dc3d1
00020000-5669-7994-11f7-48e9c0f8f290	00030000-5669-7992-2118-86abb1c98607
00020000-5669-7994-ca98-86336312317b	00030000-5669-7992-875a-39434fb1d269
00020000-5669-7994-edb8-b8f5e8c209d9	00030000-5669-7992-20d9-faf3a3d60caf
\.


--
-- TOC entry 3141 (class 0 OID 31927648)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 31927682)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 31927819)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5669-7995-61de-203653e3ca52	00090000-5669-7994-f69c-0365ec6d73b2	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5669-7995-d118-7c7df786831a	00090000-5669-7994-609d-72cfeaece424	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5669-7995-e895-01a95ed9a40a	00090000-5669-7994-68d8-63bcfa934a5f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5669-7995-4b29-7c5422fcc122	00090000-5669-7994-17f7-958eb8f6c95e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 31927340)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5669-7994-db8e-8b6acfc66e99	\N	00040000-5669-7992-f6b5-3d6f8ee0c41c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-7994-9a2a-614799d619c0	\N	00040000-5669-7992-f6b5-3d6f8ee0c41c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5669-7994-6c1b-d414d7608ef6	\N	00040000-5669-7992-f6b5-3d6f8ee0c41c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-7994-213b-da997bb1c0b6	\N	00040000-5669-7992-f6b5-3d6f8ee0c41c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-7994-44bd-679a9690011e	\N	00040000-5669-7992-f6b5-3d6f8ee0c41c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-7994-d113-e74a8cf57bc8	\N	00040000-5669-7992-ea6f-ece48b000214	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-7994-7ea1-8b948507261d	\N	00040000-5669-7992-f359-b34bb3c1aa07	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-7994-f72b-d6bd685fe4fc	\N	00040000-5669-7992-8312-4f2a554d8f15	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-7994-84b9-684660bf80f3	\N	00040000-5669-7992-421a-fe0c6a7611ea	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-7996-ff85-cce2fd0be4dc	\N	00040000-5669-7992-f6b5-3d6f8ee0c41c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 31927385)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5669-7991-0087-2b07ea23aa7a	8341	Adlešiči
00050000-5669-7991-f875-723ba8d6ec94	5270	Ajdovščina
00050000-5669-7991-a22e-c1973af4ad8a	6280	Ankaran/Ancarano
00050000-5669-7991-d306-60456040ec80	9253	Apače
00050000-5669-7991-4e73-a3ee7d63f4d4	8253	Artiče
00050000-5669-7991-aa4d-99804e75b4b3	4275	Begunje na Gorenjskem
00050000-5669-7991-6908-37820ec60e13	1382	Begunje pri Cerknici
00050000-5669-7991-ec67-12cf983ce6a6	9231	Beltinci
00050000-5669-7991-ff21-cffa2235556e	2234	Benedikt
00050000-5669-7991-a93d-ef1da5435e5c	2345	Bistrica ob Dravi
00050000-5669-7991-fb81-faaf992712ea	3256	Bistrica ob Sotli
00050000-5669-7991-ec4c-1d895ffbbaa4	8259	Bizeljsko
00050000-5669-7991-c47e-8e453a80e0d6	1223	Blagovica
00050000-5669-7991-5f91-1164b54d3b0a	8283	Blanca
00050000-5669-7991-9c03-b5573a1a440f	4260	Bled
00050000-5669-7991-dea9-76a466930765	4273	Blejska Dobrava
00050000-5669-7991-7084-3d06cbf7054c	9265	Bodonci
00050000-5669-7991-a222-2c7db8b493a1	9222	Bogojina
00050000-5669-7991-4d1c-8375226d32b6	4263	Bohinjska Bela
00050000-5669-7991-1c9b-9bf20527f804	4264	Bohinjska Bistrica
00050000-5669-7991-108e-1fd46ccc9990	4265	Bohinjsko jezero
00050000-5669-7991-9cd6-83d5161f3856	1353	Borovnica
00050000-5669-7991-ab2c-03d4fbe7fb3f	8294	Boštanj
00050000-5669-7991-7fe7-0a9414d6a881	5230	Bovec
00050000-5669-7991-7249-5a1371b0cc62	5295	Branik
00050000-5669-7991-d7a5-c280356a0484	3314	Braslovče
00050000-5669-7991-46db-f072de974a88	5223	Breginj
00050000-5669-7991-f561-06198f051cab	8280	Brestanica
00050000-5669-7991-451a-378d83a4a75a	2354	Bresternica
00050000-5669-7991-27d3-727f0a0aba88	4243	Brezje
00050000-5669-7991-c5b1-52e30581ce84	1351	Brezovica pri Ljubljani
00050000-5669-7991-dae4-9b8b8b484f80	8250	Brežice
00050000-5669-7991-78d4-e0c3827c5136	4210	Brnik - Aerodrom
00050000-5669-7991-d3ce-7c536b4cf01d	8321	Brusnice
00050000-5669-7991-7d7d-a8ce3513a3fc	3255	Buče
00050000-5669-7991-d42b-0c65b9d3ca58	8276	Bučka 
00050000-5669-7991-77a8-0ce31136ecf1	9261	Cankova
00050000-5669-7991-ab7c-bb710a6919b6	3000	Celje 
00050000-5669-7991-d962-35d2fcc0a92e	3001	Celje - poštni predali
00050000-5669-7991-9b52-0acf4b12f2eb	4207	Cerklje na Gorenjskem
00050000-5669-7991-3473-4bd73f7614f8	8263	Cerklje ob Krki
00050000-5669-7991-4747-4ad09c7ec477	1380	Cerknica
00050000-5669-7991-4f2d-95000032ab8a	5282	Cerkno
00050000-5669-7991-8066-90d24aa9c79b	2236	Cerkvenjak
00050000-5669-7991-853e-0d011bea9157	2215	Ceršak
00050000-5669-7991-fa26-80f68b6e235a	2326	Cirkovce
00050000-5669-7991-56d9-dfcc738fa46a	2282	Cirkulane
00050000-5669-7991-b28f-41b6e041ca4b	5273	Col
00050000-5669-7991-9dcd-baa7043092d4	8251	Čatež ob Savi
00050000-5669-7991-37b4-7bcdd02af66d	1413	Čemšenik
00050000-5669-7991-d44d-77af8f49d964	5253	Čepovan
00050000-5669-7991-a7c1-963897cf3af6	9232	Črenšovci
00050000-5669-7991-04e1-67d186b4a2bd	2393	Črna na Koroškem
00050000-5669-7991-9ada-856629ef0bf4	6275	Črni Kal
00050000-5669-7991-4f33-c9a257a7fe33	5274	Črni Vrh nad Idrijo
00050000-5669-7991-33ba-166d6436f8a3	5262	Črniče
00050000-5669-7991-0eb6-023fee300c68	8340	Črnomelj
00050000-5669-7991-d5e2-688e0219c211	6271	Dekani
00050000-5669-7991-9be7-775b3429689a	5210	Deskle
00050000-5669-7991-97ac-3cd8033feab4	2253	Destrnik
00050000-5669-7991-096d-0ad7d6d067f9	6215	Divača
00050000-5669-7991-cde6-e76aea25377a	1233	Dob
00050000-5669-7991-8729-9ac6283ea902	3224	Dobje pri Planini
00050000-5669-7991-b2a6-f49088b46480	8257	Dobova
00050000-5669-7991-5844-b5458ee7a01c	1423	Dobovec
00050000-5669-7991-735e-dcd95128c0c7	5263	Dobravlje
00050000-5669-7991-04d4-3181536cc379	3204	Dobrna
00050000-5669-7991-722b-4cf46c2df077	8211	Dobrnič
00050000-5669-7991-9e48-a6bf3af3e30b	1356	Dobrova
00050000-5669-7991-b2fd-f8773365641a	9223	Dobrovnik/Dobronak 
00050000-5669-7991-e4e8-b0c4f62e0219	5212	Dobrovo v Brdih
00050000-5669-7991-302d-5ae5e94c161f	1431	Dol pri Hrastniku
00050000-5669-7991-9613-52c78ed24608	1262	Dol pri Ljubljani
00050000-5669-7991-2569-88a2ae9d387b	1273	Dole pri Litiji
00050000-5669-7991-120e-7a6fae69c53a	1331	Dolenja vas
00050000-5669-7991-78a1-b15b174bc600	8350	Dolenjske Toplice
00050000-5669-7991-67a0-3cdf05fe73b1	1230	Domžale
00050000-5669-7991-492a-36faa0a82330	2252	Dornava
00050000-5669-7991-46d9-9025c7c14c93	5294	Dornberk
00050000-5669-7991-4e5f-8c8837a103ae	1319	Draga
00050000-5669-7991-7da2-26d8eb4332d2	8343	Dragatuš
00050000-5669-7991-4038-f15fc26fe6de	3222	Dramlje
00050000-5669-7991-5cc5-be528512a563	2370	Dravograd
00050000-5669-7991-ae79-ecee00f91caa	4203	Duplje
00050000-5669-7991-4dcf-989cde140b8a	6221	Dutovlje
00050000-5669-7991-c30f-655c8b72d83f	8361	Dvor
00050000-5669-7991-3d1f-a563258fd6fc	2343	Fala
00050000-5669-7991-d7d4-8475f672e43f	9208	Fokovci
00050000-5669-7991-5643-7bb43053ed05	2313	Fram
00050000-5669-7991-90a1-058a9abf8ba0	3213	Frankolovo
00050000-5669-7991-296d-6ae7eaa350da	1274	Gabrovka
00050000-5669-7991-f714-5e1bf7c822f1	8254	Globoko
00050000-5669-7991-791d-23842b27ae25	5275	Godovič
00050000-5669-7991-5f8e-3bd6a440f854	4204	Golnik
00050000-5669-7991-af01-59b790cfb52d	3303	Gomilsko
00050000-5669-7991-4af2-eab169edfbd0	4224	Gorenja vas
00050000-5669-7991-c595-41b7d030527d	3263	Gorica pri Slivnici
00050000-5669-7991-244f-2248c2c6b89b	2272	Gorišnica
00050000-5669-7991-f65e-e37da0cd99dd	9250	Gornja Radgona
00050000-5669-7991-f196-89c5b5e77873	3342	Gornji Grad
00050000-5669-7991-6a1c-bfee6763a516	4282	Gozd Martuljek
00050000-5669-7991-e329-a35e824ea084	6272	Gračišče
00050000-5669-7991-6fa3-d5eea476cb3f	9264	Grad
00050000-5669-7991-a600-74a256ceab17	8332	Gradac
00050000-5669-7991-c144-1ff9b740bf75	1384	Grahovo
00050000-5669-7991-15be-96dd20b33d56	5242	Grahovo ob Bači
00050000-5669-7991-0c07-eb053406213f	5251	Grgar
00050000-5669-7991-ba62-6c662bc6e214	3302	Griže
00050000-5669-7991-9bce-14595d4374bf	3231	Grobelno
00050000-5669-7991-fa13-36123038647c	1290	Grosuplje
00050000-5669-7991-927a-b9c29fad3ffd	2288	Hajdina
00050000-5669-7991-90ea-d763fa73dfd0	8362	Hinje
00050000-5669-7991-675a-8b48469d6b30	2311	Hoče
00050000-5669-7991-da79-e10ca13cd9da	9205	Hodoš/Hodos
00050000-5669-7991-9471-933f32bcaf23	1354	Horjul
00050000-5669-7991-9309-fbb5c34fc3a1	1372	Hotedršica
00050000-5669-7991-e607-44b7ccbaabd5	1430	Hrastnik
00050000-5669-7991-0149-df394beed025	6225	Hruševje
00050000-5669-7991-3333-51a25c8f3a4f	4276	Hrušica
00050000-5669-7991-290b-bce611866492	5280	Idrija
00050000-5669-7991-0608-c1a66d0c614d	1292	Ig
00050000-5669-7991-c921-84586c6cf322	6250	Ilirska Bistrica
00050000-5669-7991-a4e3-26e8a55eae8d	6251	Ilirska Bistrica-Trnovo
00050000-5669-7991-6817-25087a4f63cc	1295	Ivančna Gorica
00050000-5669-7991-886f-65155a6db562	2259	Ivanjkovci
00050000-5669-7991-0134-d1b71c0fe9ad	1411	Izlake
00050000-5669-7991-befb-6d0e3ff779a7	6310	Izola/Isola
00050000-5669-7991-ad8e-5ac3f106526b	2222	Jakobski Dol
00050000-5669-7991-d33e-b5f9e178fba7	2221	Jarenina
00050000-5669-7991-6e81-c345d4debca5	6254	Jelšane
00050000-5669-7991-be04-fcb540543043	4270	Jesenice
00050000-5669-7991-f0d8-47b8a3df0874	8261	Jesenice na Dolenjskem
00050000-5669-7991-f027-0b554864ceb6	3273	Jurklošter
00050000-5669-7991-9abc-46816c4636fd	2223	Jurovski Dol
00050000-5669-7991-6eb0-0f7d61b44dcc	2256	Juršinci
00050000-5669-7991-aaa2-ceefef602a8b	5214	Kal nad Kanalom
00050000-5669-7991-04d4-b806c7227338	3233	Kalobje
00050000-5669-7991-8d6f-dfdc672cc8ad	4246	Kamna Gorica
00050000-5669-7991-4baf-507818725317	2351	Kamnica
00050000-5669-7991-8c31-013cfb5cab66	1241	Kamnik
00050000-5669-7991-9e4b-31f4b8cc6a66	5213	Kanal
00050000-5669-7991-051c-64b3fa189ca7	8258	Kapele
00050000-5669-7991-49ff-08a81d774d8e	2362	Kapla
00050000-5669-7991-0a88-b26a765b09eb	2325	Kidričevo
00050000-5669-7991-b9f1-282283b38c0e	1412	Kisovec
00050000-5669-7991-68de-295f39f60bb4	6253	Knežak
00050000-5669-7991-4504-04e5d1f48423	5222	Kobarid
00050000-5669-7991-8788-d97e67d21dc3	9227	Kobilje
00050000-5669-7991-3b14-857c35d07543	1330	Kočevje
00050000-5669-7991-4f27-4b209545bd3b	1338	Kočevska Reka
00050000-5669-7991-d1be-6c266445c844	2276	Kog
00050000-5669-7991-79ac-6183c81de0f9	5211	Kojsko
00050000-5669-7991-c60f-33d60f582307	6223	Komen
00050000-5669-7991-d7ed-11df645657a1	1218	Komenda
00050000-5669-7991-d19b-dd4c9986bd8b	6000	Koper/Capodistria 
00050000-5669-7991-381c-377cd2aa39ed	6001	Koper/Capodistria - poštni predali
00050000-5669-7991-3d8c-8611c628d2f3	8282	Koprivnica
00050000-5669-7991-ef42-fb16089a2c17	5296	Kostanjevica na Krasu
00050000-5669-7991-e9aa-892f7b7ea0d8	8311	Kostanjevica na Krki
00050000-5669-7991-0fbe-70126e6498a4	1336	Kostel
00050000-5669-7991-b66c-f7268d65a613	6256	Košana
00050000-5669-7991-be8d-3d1e40590405	2394	Kotlje
00050000-5669-7991-f1a6-5d22e7029104	6240	Kozina
00050000-5669-7991-7396-8b06e47a0e70	3260	Kozje
00050000-5669-7991-de6e-d8074b996877	4000	Kranj 
00050000-5669-7991-a647-002be3c3173f	4001	Kranj - poštni predali
00050000-5669-7991-323b-edbf153757bd	4280	Kranjska Gora
00050000-5669-7991-0b14-ba1f6c43f18c	1281	Kresnice
00050000-5669-7991-0b20-7eccb8cfacd0	4294	Križe
00050000-5669-7991-bfbb-fdfacbe63835	9206	Križevci
00050000-5669-7991-6cae-cf66ebdfa4e7	9242	Križevci pri Ljutomeru
00050000-5669-7991-0acc-14fe5a45cabe	1301	Krka
00050000-5669-7991-ab7f-c2793a989953	8296	Krmelj
00050000-5669-7991-49bf-caed92d5dec8	4245	Kropa
00050000-5669-7991-80e7-d2e57a6fc42f	8262	Krška vas
00050000-5669-7991-62cc-c41a5a4bda3c	8270	Krško
00050000-5669-7991-1e1f-4a5dd1b594b1	9263	Kuzma
00050000-5669-7991-458b-24bc140368d3	2318	Laporje
00050000-5669-7991-9e64-11f7d24bb4b3	3270	Laško
00050000-5669-7991-375e-815dc3691c40	1219	Laze v Tuhinju
00050000-5669-7991-7948-2757a5bdb4a2	2230	Lenart v Slovenskih goricah
00050000-5669-7991-de89-0f490a039bb6	9220	Lendava/Lendva
00050000-5669-7991-3e02-81817d89f7e3	4248	Lesce
00050000-5669-7991-6fd0-e408e82aeb87	3261	Lesično
00050000-5669-7991-8f85-5a20b6d8f058	8273	Leskovec pri Krškem
00050000-5669-7991-81fb-783e528fb970	2372	Libeliče
00050000-5669-7991-8780-f585457c6a4b	2341	Limbuš
00050000-5669-7991-5116-35ac96b328dc	1270	Litija
00050000-5669-7991-c5c5-a1450b20b71e	3202	Ljubečna
00050000-5669-7991-64df-ff70017e76a1	1000	Ljubljana 
00050000-5669-7991-f8c1-1dfec36430ff	1001	Ljubljana - poštni predali
00050000-5669-7991-e919-d438c907e2b8	1231	Ljubljana - Črnuče
00050000-5669-7991-f5dd-85cfbeeb9670	1261	Ljubljana - Dobrunje
00050000-5669-7991-2dd4-969c63ee19a7	1260	Ljubljana - Polje
00050000-5669-7991-9bd1-5ba6b1695437	1210	Ljubljana - Šentvid
00050000-5669-7992-88f0-416cfafc075b	1211	Ljubljana - Šmartno
00050000-5669-7992-a774-d1ac52568ade	3333	Ljubno ob Savinji
00050000-5669-7992-5c8c-c95a988e4d14	9240	Ljutomer
00050000-5669-7992-fd66-2750dc59b6d0	3215	Loče
00050000-5669-7992-e7bd-7397a2d6a62b	5231	Log pod Mangartom
00050000-5669-7992-29d0-8f2f9ff9200e	1358	Log pri Brezovici
00050000-5669-7992-03ca-9dae805fbe13	1370	Logatec
00050000-5669-7992-4b85-f1f0bc7636b0	1371	Logatec
00050000-5669-7992-844e-ea2cfc0b6736	1434	Loka pri Zidanem Mostu
00050000-5669-7992-4f9c-d0442baa7b45	3223	Loka pri Žusmu
00050000-5669-7992-28b5-1da97acacaeb	6219	Lokev
00050000-5669-7992-0d2e-73912bf19d11	1318	Loški Potok
00050000-5669-7992-3bb4-6503e873f308	2324	Lovrenc na Dravskem polju
00050000-5669-7992-fd46-ba3ea0a5854b	2344	Lovrenc na Pohorju
00050000-5669-7992-cbff-b2a713baba24	3334	Luče
00050000-5669-7992-de08-9985e7d0f6cb	1225	Lukovica
00050000-5669-7992-6f70-84450c672e69	9202	Mačkovci
00050000-5669-7992-a059-c0fda29e9847	2322	Majšperk
00050000-5669-7992-c985-f88da6f4dcfd	2321	Makole
00050000-5669-7992-32a5-671cea8de58a	9243	Mala Nedelja
00050000-5669-7992-af78-9c90eb797e4d	2229	Malečnik
00050000-5669-7992-541b-3cd4383ada9a	6273	Marezige
00050000-5669-7992-1a58-51912b77ccf3	2000	Maribor 
00050000-5669-7992-710a-5f0e159e9f3d	2001	Maribor - poštni predali
00050000-5669-7992-ab75-09de7f47527a	2206	Marjeta na Dravskem polju
00050000-5669-7992-d010-3ee9b7dd3ff9	2281	Markovci
00050000-5669-7992-f74a-64fa8381088f	9221	Martjanci
00050000-5669-7992-c7f8-cb937a8bedfc	6242	Materija
00050000-5669-7992-6243-5c3a8a77be76	4211	Mavčiče
00050000-5669-7992-4fa6-fd3c4ef6dd6f	1215	Medvode
00050000-5669-7992-161c-f8abfcaab542	1234	Mengeš
00050000-5669-7992-4c42-a0eb21327482	8330	Metlika
00050000-5669-7992-390b-fbf22f1fcac8	2392	Mežica
00050000-5669-7992-e0a6-4bd4bc1acd79	2204	Miklavž na Dravskem polju
00050000-5669-7992-961e-f5efe1c5eb6b	2275	Miklavž pri Ormožu
00050000-5669-7992-4556-eafef664e345	5291	Miren
00050000-5669-7992-1fba-59edc275fce8	8233	Mirna
00050000-5669-7992-d002-45382488b055	8216	Mirna Peč
00050000-5669-7992-0170-17669f365cae	2382	Mislinja
00050000-5669-7992-dad3-d197b8cda8c3	4281	Mojstrana
00050000-5669-7992-6943-03690702e8d9	8230	Mokronog
00050000-5669-7992-e315-9d748daca7f6	1251	Moravče
00050000-5669-7992-c0db-b9c8bb1a2827	9226	Moravske Toplice
00050000-5669-7992-5f2c-be6f331130d5	5216	Most na Soči
00050000-5669-7992-fd8c-67c703d1dd11	1221	Motnik
00050000-5669-7992-b246-4c1e57f0f28d	3330	Mozirje
00050000-5669-7992-3a98-466f5065aef3	9000	Murska Sobota 
00050000-5669-7992-d53c-c32b3315b8cb	9001	Murska Sobota - poštni predali
00050000-5669-7992-b0d3-a3a06111511e	2366	Muta
00050000-5669-7992-8f0d-a03f3ceddf9f	4202	Naklo
00050000-5669-7992-0203-219ae1d9e314	3331	Nazarje
00050000-5669-7992-d390-9b825e491795	1357	Notranje Gorice
00050000-5669-7992-bc95-bbbc96cefe69	3203	Nova Cerkev
00050000-5669-7992-6857-49e0c1d17b1f	5000	Nova Gorica 
00050000-5669-7992-22de-e1a687889ce3	5001	Nova Gorica - poštni predali
00050000-5669-7992-974d-72ab8e868426	1385	Nova vas
00050000-5669-7992-a1b3-b2ef4e2d1997	8000	Novo mesto
00050000-5669-7992-c27c-c22c38f9619e	8001	Novo mesto - poštni predali
00050000-5669-7992-fff1-b59e8c1b50de	6243	Obrov
00050000-5669-7992-5c88-46f4c250207d	9233	Odranci
00050000-5669-7992-21bc-3150f8243ab7	2317	Oplotnica
00050000-5669-7992-72cf-9cde66969404	2312	Orehova vas
00050000-5669-7992-557c-1b5fb679ce05	2270	Ormož
00050000-5669-7992-82be-ebb975012a84	1316	Ortnek
00050000-5669-7992-56ce-0518c05fa65b	1337	Osilnica
00050000-5669-7992-e80f-d7b7e38e8450	8222	Otočec
00050000-5669-7992-ac2a-04a99826f263	2361	Ožbalt
00050000-5669-7992-b1ff-486b14f4f474	2231	Pernica
00050000-5669-7992-4bc1-7d2ae8fa9063	2211	Pesnica pri Mariboru
00050000-5669-7992-cebd-0fd6c748abe1	9203	Petrovci
00050000-5669-7992-a657-696b0ed22ced	3301	Petrovče
00050000-5669-7992-93ab-a6f335ae9f24	6330	Piran/Pirano
00050000-5669-7992-135a-cc8ac4ec932b	8255	Pišece
00050000-5669-7992-cedc-8fd0ee30c8e6	6257	Pivka
00050000-5669-7992-687c-bdc9351ac201	6232	Planina
00050000-5669-7992-0c5b-6d36dad6bce0	3225	Planina pri Sevnici
00050000-5669-7992-4532-8765b2fb4f2e	6276	Pobegi
00050000-5669-7992-a037-40a60804ae3d	8312	Podbočje
00050000-5669-7992-d503-59a786909399	5243	Podbrdo
00050000-5669-7992-873f-8daefd7d5120	3254	Podčetrtek
00050000-5669-7992-0611-a74211931054	2273	Podgorci
00050000-5669-7992-b5e9-fe50255284c8	6216	Podgorje
00050000-5669-7992-79d1-a770ced14b2c	2381	Podgorje pri Slovenj Gradcu
00050000-5669-7992-1189-1c292c3e1246	6244	Podgrad
00050000-5669-7992-989c-c31abe804e6d	1414	Podkum
00050000-5669-7992-e7bb-ab5f4b7578e6	2286	Podlehnik
00050000-5669-7992-20d1-8c62ad3c7011	5272	Podnanos
00050000-5669-7992-6482-78b49d52bd16	4244	Podnart
00050000-5669-7992-3bb7-d70168baee3a	3241	Podplat
00050000-5669-7992-2538-3f4cb8ce216f	3257	Podsreda
00050000-5669-7992-c792-2f69631e952e	2363	Podvelka
00050000-5669-7992-62f0-6101ea717931	2208	Pohorje
00050000-5669-7992-0d09-e17539b7c402	2257	Polenšak
00050000-5669-7992-30a2-a6eccbaa840a	1355	Polhov Gradec
00050000-5669-7992-7623-8a3a1a868b3f	4223	Poljane nad Škofjo Loko
00050000-5669-7992-11b7-1b4cdede594d	2319	Poljčane
00050000-5669-7992-9d93-da17390ad7f7	1272	Polšnik
00050000-5669-7992-77eb-cda9058ee3f0	3313	Polzela
00050000-5669-7992-6713-cb0813cb7896	3232	Ponikva
00050000-5669-7992-4069-319f5e614883	6320	Portorož/Portorose
00050000-5669-7992-843e-10637f4a9b09	6230	Postojna
00050000-5669-7992-4622-b9ebc673cae7	2331	Pragersko
00050000-5669-7992-fb3c-c3c078da6c11	3312	Prebold
00050000-5669-7992-993a-d7dc134801d4	4205	Preddvor
00050000-5669-7992-9e95-3f0befe95d03	6255	Prem
00050000-5669-7992-0c95-048198c03a79	1352	Preserje
00050000-5669-7992-2fbe-ed9de47fca3e	6258	Prestranek
00050000-5669-7992-7270-6315ea50ad4f	2391	Prevalje
00050000-5669-7992-e383-fbb0c662119f	3262	Prevorje
00050000-5669-7992-a32f-97d89e43d154	1276	Primskovo 
00050000-5669-7992-efd6-120dc38e0b58	3253	Pristava pri Mestinju
00050000-5669-7992-4f31-1ee75e80fc02	9207	Prosenjakovci/Partosfalva
00050000-5669-7992-8637-52a79676a470	5297	Prvačina
00050000-5669-7992-a6fa-42334825f452	2250	Ptuj
00050000-5669-7992-ade9-995fce748b6f	2323	Ptujska Gora
00050000-5669-7992-8f3a-c1a3f6d7f575	9201	Puconci
00050000-5669-7992-3983-54c489a7dbda	2327	Rače
00050000-5669-7992-5777-25a9b8dfad96	1433	Radeče
00050000-5669-7992-e7a3-7e85ddc34054	9252	Radenci
00050000-5669-7992-8b0f-227e7563572f	2360	Radlje ob Dravi
00050000-5669-7992-dbf8-13f7cba83b9d	1235	Radomlje
00050000-5669-7992-9d07-d10ca49fedec	4240	Radovljica
00050000-5669-7992-c61d-3309d0b16fc3	8274	Raka
00050000-5669-7992-d078-eb618be71074	1381	Rakek
00050000-5669-7992-4b61-9a3046c84d63	4283	Rateče - Planica
00050000-5669-7992-653e-420036376ce7	2390	Ravne na Koroškem
00050000-5669-7992-f71f-dab8b404e7dd	9246	Razkrižje
00050000-5669-7992-4912-4e9d4885f54f	3332	Rečica ob Savinji
00050000-5669-7992-ed62-3b94151efced	5292	Renče
00050000-5669-7992-0024-97320608066e	1310	Ribnica
00050000-5669-7992-6d77-82063cc7d100	2364	Ribnica na Pohorju
00050000-5669-7992-2db3-43bd6094c5ce	3272	Rimske Toplice
00050000-5669-7992-87ef-ea3d33f904c7	1314	Rob
00050000-5669-7992-2fed-1128decf7433	5215	Ročinj
00050000-5669-7992-6c04-a823ae21e52d	3250	Rogaška Slatina
00050000-5669-7992-13d1-e410a973b8c3	9262	Rogašovci
00050000-5669-7992-474c-8bebf3cb1090	3252	Rogatec
00050000-5669-7992-ffde-2625b20dc2ca	1373	Rovte
00050000-5669-7992-ef6a-81cdc5e70d8b	2342	Ruše
00050000-5669-7992-89dc-0e490ea20f4c	1282	Sava
00050000-5669-7992-52cd-432705864783	6333	Sečovlje/Sicciole
00050000-5669-7992-904f-b00ae6408f1e	4227	Selca
00050000-5669-7992-77b4-4bb76117c864	2352	Selnica ob Dravi
00050000-5669-7992-e6c4-85fdabd23713	8333	Semič
00050000-5669-7992-ca86-46891672733f	8281	Senovo
00050000-5669-7992-a6f6-0cabc7670ac9	6224	Senožeče
00050000-5669-7992-e502-2d50418c26a9	8290	Sevnica
00050000-5669-7992-37af-a40585df4859	6210	Sežana
00050000-5669-7992-e0aa-e41e9ed18b89	2214	Sladki Vrh
00050000-5669-7992-25e2-6625c22cc0cc	5283	Slap ob Idrijci
00050000-5669-7992-f0a2-87669fa69a37	2380	Slovenj Gradec
00050000-5669-7992-01d5-a7c58a2e2ff1	2310	Slovenska Bistrica
00050000-5669-7992-6055-cd4236112ea7	3210	Slovenske Konjice
00050000-5669-7992-71fd-1b72378f9311	1216	Smlednik
00050000-5669-7992-67a8-cbbf95741f4e	5232	Soča
00050000-5669-7992-120b-1385ea838842	1317	Sodražica
00050000-5669-7992-a26a-4d7f32879ca7	3335	Solčava
00050000-5669-7992-aa79-5a42119acdfc	5250	Solkan
00050000-5669-7992-486d-1cbec68b5485	4229	Sorica
00050000-5669-7992-1beb-6ee6b3ee0b36	4225	Sovodenj
00050000-5669-7992-4df0-ec3fdd002852	5281	Spodnja Idrija
00050000-5669-7992-25d9-d8ae952cd7a8	2241	Spodnji Duplek
00050000-5669-7992-6199-3a1f2eeebc45	9245	Spodnji Ivanjci
00050000-5669-7992-468b-dfa222b5b190	2277	Središče ob Dravi
00050000-5669-7992-53e0-8c2ca07e6b9e	4267	Srednja vas v Bohinju
00050000-5669-7992-6475-a5de15389430	8256	Sromlje 
00050000-5669-7992-9d14-bc3bfb5e1401	5224	Srpenica
00050000-5669-7992-d290-1f7610ca6fbb	1242	Stahovica
00050000-5669-7992-f6c2-2fb8ff5cae03	1332	Stara Cerkev
00050000-5669-7992-dd4b-58ac0514d14a	8342	Stari trg ob Kolpi
00050000-5669-7992-8005-7605bfc3d93e	1386	Stari trg pri Ložu
00050000-5669-7992-15ee-e4ec8c23f610	2205	Starše
00050000-5669-7992-5f60-b5c00ce06417	2289	Stoperce
00050000-5669-7992-f2a5-a8a3ae05ebdf	8322	Stopiče
00050000-5669-7992-50f1-6fddcb736c46	3206	Stranice
00050000-5669-7992-af96-698afd02d414	8351	Straža
00050000-5669-7992-e6b5-f6c6bdab9bd9	1313	Struge
00050000-5669-7992-d89e-9fd0d02512cd	8293	Studenec
00050000-5669-7992-b1c0-230ea754d618	8331	Suhor
00050000-5669-7992-255f-58dbb8f9d259	2233	Sv. Ana v Slovenskih goricah
00050000-5669-7992-0d29-e79fdcecac13	2235	Sv. Trojica v Slovenskih goricah
00050000-5669-7992-c1b2-b28061c8a270	2353	Sveti Duh na Ostrem Vrhu
00050000-5669-7992-a1e4-797c1f3b93dd	9244	Sveti Jurij ob Ščavnici
00050000-5669-7992-5e10-0f82089a45f7	3264	Sveti Štefan
00050000-5669-7992-e396-5c73ad99028e	2258	Sveti Tomaž
00050000-5669-7992-74f7-524a6d918e35	9204	Šalovci
00050000-5669-7992-b313-d984080adf4c	5261	Šempas
00050000-5669-7992-3962-b4192ac32c05	5290	Šempeter pri Gorici
00050000-5669-7992-1db8-28bde0ea252e	3311	Šempeter v Savinjski dolini
00050000-5669-7992-35af-6f63f2609080	4208	Šenčur
00050000-5669-7992-1bb3-f7a230101fec	2212	Šentilj v Slovenskih goricah
00050000-5669-7992-c2cb-85663b059509	8297	Šentjanž
00050000-5669-7992-1ac5-b0b30363e5a5	2373	Šentjanž pri Dravogradu
00050000-5669-7992-81cf-14f889cf40bb	8310	Šentjernej
00050000-5669-7992-5af7-8742d60f610d	3230	Šentjur
00050000-5669-7992-89a0-5af89abb5ee0	3271	Šentrupert
00050000-5669-7992-c901-14382799f620	8232	Šentrupert
00050000-5669-7992-c339-4375be37eb77	1296	Šentvid pri Stični
00050000-5669-7992-bac0-42663fa95982	8275	Škocjan
00050000-5669-7992-5388-00697fb23305	6281	Škofije
00050000-5669-7992-c7ae-a809d68f4a99	4220	Škofja Loka
00050000-5669-7992-c3c6-f787d4c4c153	3211	Škofja vas
00050000-5669-7992-7b95-5a5b8362c480	1291	Škofljica
00050000-5669-7992-a108-a22ad2348fcd	6274	Šmarje
00050000-5669-7992-3f94-173697faf922	1293	Šmarje - Sap
00050000-5669-7992-0fe0-70b55d8b5c20	3240	Šmarje pri Jelšah
00050000-5669-7992-528b-8fb9390a9ce5	8220	Šmarješke Toplice
00050000-5669-7992-9e12-332e1a659e51	2315	Šmartno na Pohorju
00050000-5669-7992-56e9-e9441c75e853	3341	Šmartno ob Dreti
00050000-5669-7992-13fd-728d2743f299	3327	Šmartno ob Paki
00050000-5669-7992-d5cb-c74769e02f8e	1275	Šmartno pri Litiji
00050000-5669-7992-1d52-f340de410243	2383	Šmartno pri Slovenj Gradcu
00050000-5669-7992-29a4-36d37643e37c	3201	Šmartno v Rožni dolini
00050000-5669-7992-4078-e13702018e83	3325	Šoštanj
00050000-5669-7992-7be8-434ba217b02c	6222	Štanjel
00050000-5669-7992-f3e1-7635a7b29e15	3220	Štore
00050000-5669-7992-efe6-711f341a2fb5	3304	Tabor
00050000-5669-7992-3235-4fd3c271f48c	3221	Teharje
00050000-5669-7992-677c-ee76982d4850	9251	Tišina
00050000-5669-7992-d46a-c5a4565cc5b1	5220	Tolmin
00050000-5669-7992-7fc3-8923cb6b5795	3326	Topolšica
00050000-5669-7992-9aa8-942482ec100b	2371	Trbonje
00050000-5669-7992-1c0c-38b6999b842c	1420	Trbovlje
00050000-5669-7992-af3b-fd7941ffd90a	8231	Trebelno 
00050000-5669-7992-c924-111127a9f1fb	8210	Trebnje
00050000-5669-7992-f038-6486bff86772	5252	Trnovo pri Gorici
00050000-5669-7992-f062-8684875e35ea	2254	Trnovska vas
00050000-5669-7992-3e8a-56853d415348	1222	Trojane
00050000-5669-7992-44d0-8fc7f7363ab4	1236	Trzin
00050000-5669-7992-c735-754535738b4f	4290	Tržič
00050000-5669-7992-ebb9-9df0c1df01ea	8295	Tržišče
00050000-5669-7992-357b-3237b3816dd0	1311	Turjak
00050000-5669-7992-ac2e-327021264a2b	9224	Turnišče
00050000-5669-7992-900e-8f0d75a47846	8323	Uršna sela
00050000-5669-7992-fb82-b99a393dde58	1252	Vače
00050000-5669-7992-fc44-316bf5c9bbe4	3320	Velenje 
00050000-5669-7992-21fe-814b8888c05e	3322	Velenje - poštni predali
00050000-5669-7992-8e52-ab19cba630a1	8212	Velika Loka
00050000-5669-7992-89a7-fb3449914656	2274	Velika Nedelja
00050000-5669-7992-c660-c2898a1203bc	9225	Velika Polana
00050000-5669-7992-557b-c30e2787ed24	1315	Velike Lašče
00050000-5669-7992-533d-8860539852a3	8213	Veliki Gaber
00050000-5669-7992-b4b1-d9f3c3d7b108	9241	Veržej
00050000-5669-7992-1ac7-88227aa485a5	1312	Videm - Dobrepolje
00050000-5669-7992-b04d-328f4086f971	2284	Videm pri Ptuju
00050000-5669-7992-fdba-0a0df41c7d76	8344	Vinica
00050000-5669-7992-5b22-1a23d2eaf555	5271	Vipava
00050000-5669-7992-edee-ee9cf6ecc71f	4212	Visoko
00050000-5669-7992-75a3-8721eb523901	1294	Višnja Gora
00050000-5669-7992-f1a1-71f650eef2bb	3205	Vitanje
00050000-5669-7992-584b-d26cdf0ba48b	2255	Vitomarci
00050000-5669-7992-6e47-1087085c82e3	1217	Vodice
00050000-5669-7992-f8a1-14cce95a68f5	3212	Vojnik\t
00050000-5669-7992-159d-5fdaedfe840c	5293	Volčja Draga
00050000-5669-7992-e0f3-b1cf0cd5e3c6	2232	Voličina
00050000-5669-7992-c306-1cf9d55f1607	3305	Vransko
00050000-5669-7992-fedf-eb77ed9d7e74	6217	Vremski Britof
00050000-5669-7992-52d3-85282a2ff191	1360	Vrhnika
00050000-5669-7992-6b5b-ef653bc53e4c	2365	Vuhred
00050000-5669-7992-d85c-2ce76cb933d3	2367	Vuzenica
00050000-5669-7992-988d-9f7d7dc547fb	8292	Zabukovje 
00050000-5669-7992-11b9-75c50e8dd9b4	1410	Zagorje ob Savi
00050000-5669-7992-08a7-41d09b52edb6	1303	Zagradec
00050000-5669-7992-effd-f46697ac10ed	2283	Zavrč
00050000-5669-7992-cc11-083db32fe7c4	8272	Zdole 
00050000-5669-7992-e2cb-de0bd5fc241f	4201	Zgornja Besnica
00050000-5669-7992-6aec-e2a8a39de731	2242	Zgornja Korena
00050000-5669-7992-8d4f-45f3c715c861	2201	Zgornja Kungota
00050000-5669-7992-7eaf-c6e308de1233	2316	Zgornja Ložnica
00050000-5669-7992-3dc6-f83bdbba1956	2314	Zgornja Polskava
00050000-5669-7992-7c88-b5ffc62fe799	2213	Zgornja Velka
00050000-5669-7992-e1f9-e3d0d60a5d08	4247	Zgornje Gorje
00050000-5669-7992-540f-bd6fac3ab2bc	4206	Zgornje Jezersko
00050000-5669-7992-c601-9b9718cb19ad	2285	Zgornji Leskovec
00050000-5669-7992-6272-182dc8972151	1432	Zidani Most
00050000-5669-7992-a312-71bb0132cec1	3214	Zreče
00050000-5669-7992-32e9-4bc49ee1518a	4209	Žabnica
00050000-5669-7992-331c-5fbd91b3c462	3310	Žalec
00050000-5669-7992-d434-caf1c0e76c6a	4228	Železniki
00050000-5669-7992-4fb7-19c1e7315e71	2287	Žetale
00050000-5669-7992-aee1-46ae1821d2e4	4226	Žiri
00050000-5669-7992-5915-da8441dd86ec	4274	Žirovnica
00050000-5669-7992-c7bd-a9a28a7b04a2	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 31928047)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 31927622)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 31927370)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5669-7994-bb36-448187332e2d	00080000-5669-7994-db8e-8b6acfc66e99	\N	00040000-5669-7992-f6b5-3d6f8ee0c41c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5669-7994-0f54-85fc6de4b529	00080000-5669-7994-db8e-8b6acfc66e99	\N	00040000-5669-7992-f6b5-3d6f8ee0c41c	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5669-7994-659b-b0cfbce15581	00080000-5669-7994-9a2a-614799d619c0	\N	00040000-5669-7992-f6b5-3d6f8ee0c41c	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 31927514)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5669-7992-07d7-61db36ee5fdd	novo leto	1	1	\N	t
00430000-5669-7992-b487-31e69ae6241e	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5669-7992-131b-29b0a5bf6e1f	dan upora proti okupatorju	27	4	\N	t
00430000-5669-7992-4397-08807de75757	praznik dela	1	5	\N	t
00430000-5669-7992-a392-84a0684b5785	praznik dela	2	5	\N	t
00430000-5669-7992-a682-17ddab06d272	dan Primoža Trubarja	8	6	\N	f
00430000-5669-7992-c90b-ccf7efbc7117	dan državnosti	25	6	\N	t
00430000-5669-7992-e327-abbd375a9671	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5669-7992-6150-3441ca2ce196	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5669-7992-4d91-cd31cd868c75	dan suverenosti	25	10	\N	f
00430000-5669-7992-3c31-6fc445565a11	dan spomina na mrtve	1	11	\N	t
00430000-5669-7992-ce92-f3adfe75fd1f	dan Rudolfa Maistra	23	11	\N	f
00430000-5669-7992-c3d4-471b7f2a5572	božič	25	12	\N	t
00430000-5669-7992-1209-a1caf8761257	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5669-7992-e660-e6ac5bfeb027	Marijino vnebovzetje	15	8	\N	t
00430000-5669-7992-620b-f36f7959b38c	dan reformacije	31	10	\N	t
00430000-5669-7992-4466-810595e0f950	velikonočna nedelja	27	3	2016	t
00430000-5669-7992-8ad5-65baf35f1f3e	velikonočna nedelja	16	4	2017	t
00430000-5669-7992-aae6-58702cb6fa8e	velikonočna nedelja	1	4	2018	t
00430000-5669-7992-2fb2-7be9d533a554	velikonočna nedelja	21	4	2019	t
00430000-5669-7992-ee58-8b27c46ff7db	velikonočna nedelja	12	4	2020	t
00430000-5669-7992-5f0e-7c5ff6305ecf	velikonočna nedelja	4	4	2021	t
00430000-5669-7992-3195-cf77230fb2d1	velikonočna nedelja	17	4	2022	t
00430000-5669-7992-6e6b-bd5bab85c4df	velikonočna nedelja	9	4	2023	t
00430000-5669-7992-cefd-6c71ff44d75c	velikonočna nedelja	31	3	2024	t
00430000-5669-7992-3bbe-6ce3abc4c485	velikonočna nedelja	20	4	2025	t
00430000-5669-7992-b1f7-76d149ec03e1	velikonočna nedelja	5	4	2026	t
00430000-5669-7992-eb82-bde6680be9b7	velikonočna nedelja	28	3	2027	t
00430000-5669-7992-0ce6-d46e8c63f3b0	velikonočna nedelja	16	4	2028	t
00430000-5669-7992-6524-0691aceb1221	velikonočna nedelja	1	4	2029	t
00430000-5669-7992-c230-5164efdf5d7f	velikonočna nedelja	21	4	2030	t
00430000-5669-7992-f3d5-c4347750c6ad	velikonočni ponedeljek	28	3	2016	t
00430000-5669-7992-44c4-1d2da4f38abe	velikonočni ponedeljek	17	4	2017	t
00430000-5669-7992-3c59-5e64ef5b0e61	velikonočni ponedeljek	2	4	2018	t
00430000-5669-7992-21ec-bae7e786efc9	velikonočni ponedeljek	22	4	2019	t
00430000-5669-7992-9bbd-4e3cf853540d	velikonočni ponedeljek	13	4	2020	t
00430000-5669-7992-87d5-beaa18803212	velikonočni ponedeljek	5	4	2021	t
00430000-5669-7992-b8fe-1a5581cc74b3	velikonočni ponedeljek	18	4	2022	t
00430000-5669-7992-2080-6113ff7186fc	velikonočni ponedeljek	10	4	2023	t
00430000-5669-7992-e573-44b756bdffee	velikonočni ponedeljek	1	4	2024	t
00430000-5669-7992-c1e8-d956a5dd97b4	velikonočni ponedeljek	21	4	2025	t
00430000-5669-7992-7627-3b5dfff84b63	velikonočni ponedeljek	6	4	2026	t
00430000-5669-7992-1096-5f61ecdc2c88	velikonočni ponedeljek	29	3	2027	t
00430000-5669-7992-1084-9ce1177d158f	velikonočni ponedeljek	17	4	2028	t
00430000-5669-7992-58ee-ac768ad254df	velikonočni ponedeljek	2	4	2029	t
00430000-5669-7992-3035-18fcf8c8bf73	velikonočni ponedeljek	22	4	2030	t
00430000-5669-7992-650f-57f885d02fab	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5669-7992-e78d-49051b76f493	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5669-7992-8a97-2968d2fc6187	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5669-7992-5f18-42252907ed86	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5669-7992-b794-593ea9c86d78	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5669-7992-7a4c-4de198761f98	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5669-7992-7e2f-6864b9257908	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5669-7992-7507-ccbf01a8bd7b	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5669-7992-f0fd-39a87ee3ad7e	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5669-7992-3601-f07dd108800d	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5669-7992-d3c2-108fb4ccf557	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5669-7992-9148-2855ce62b579	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5669-7992-3744-9b5376d940bb	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5669-7992-dd31-620e0bfe3bf3	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5669-7992-e3bb-51293998c900	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 31927474)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 31927486)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 31927634)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 31928061)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 31928071)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5669-7995-1490-f76ace33c64b	00080000-5669-7994-6c1b-d414d7608ef6	0987	AK
00190000-5669-7995-09b9-0c6685bc40bb	00080000-5669-7994-9a2a-614799d619c0	0989	AK
00190000-5669-7995-f3e6-afba60eee563	00080000-5669-7994-213b-da997bb1c0b6	0986	AK
00190000-5669-7995-d401-6cfd2661ef68	00080000-5669-7994-d113-e74a8cf57bc8	0984	AK
00190000-5669-7995-e8e9-07c0a936b779	00080000-5669-7994-7ea1-8b948507261d	0983	AK
00190000-5669-7995-d543-0c51ab7422b5	00080000-5669-7994-f72b-d6bd685fe4fc	0982	AK
00190000-5669-7996-c02c-4e871f42f6cc	00080000-5669-7996-ff85-cce2fd0be4dc	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 31927970)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5669-7995-8ee7-dab9939540db	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 31928079)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 31927663)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5669-7994-536d-77f2f21764c2	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5669-7994-5263-e5712e0b8079	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5669-7994-7223-f27255a3513b	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5669-7994-f462-dd7abdc9b061	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5669-7994-28ad-527eb8cc3864	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5669-7994-208b-fdbf630531fa	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5669-7994-df1c-93a747ef48de	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 31927607)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 31927597)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 31927808)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 31927738)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 31927448)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 31927210)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5669-7996-ff85-cce2fd0be4dc	00010000-5669-7993-4a57-00ec122a55af	2015-12-10 14:09:42	INS	a:0:{}
2	App\\Entity\\Option	00000000-5669-7996-0306-2269eaedda07	00010000-5669-7993-4a57-00ec122a55af	2015-12-10 14:09:42	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5669-7996-c02c-4e871f42f6cc	00010000-5669-7993-4a57-00ec122a55af	2015-12-10 14:09:42	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 31927676)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 31927248)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5669-7992-147f-6791740ebb5c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5669-7992-2a22-7ddc5eedefaa	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5669-7992-7fc9-cf14d675cdb6	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5669-7992-372b-9651880beecc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5669-7992-9ac0-3d5295c990f8	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5669-7992-6737-70ac0cc27ec5	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5669-7992-a3aa-4bd56465a817	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5669-7992-da28-76ce3f836f3f	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5669-7992-a153-585f1d9712e2	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5669-7992-a63c-a60c59f9f87a	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5669-7992-3320-7130414b172f	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5669-7992-833b-fdddb03badad	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5669-7992-b168-7f754af84bca	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5669-7992-2fdb-90d8877820f8	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5669-7992-c086-a69104423c48	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5669-7992-5f94-ddb58cc0e8f7	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5669-7992-a77b-a7b2d2533317	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5669-7992-cd52-251775cb96b0	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5669-7992-6326-ad18f3f07729	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5669-7992-6a2b-301a7c7ba11e	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5669-7993-d8cc-3e700b8f804e	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5669-7993-c6d0-ca35e36ca9c1	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5669-7993-7dd5-b442d6a7011f	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5669-7993-0fe4-74ea58812011	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5669-7993-bacf-b9f781509b81	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5669-7993-409c-8fff2cab2b93	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5669-7993-5d2e-3c050b698dcd	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5669-7993-d274-05452765c981	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5669-7993-fb1d-a9642adb21ee	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5669-7993-9340-0a8c8486ec7f	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5669-7993-faa2-a77e81892c6a	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5669-7993-6236-53cf9e279118	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5669-7993-4c5c-1e84498de0bb	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5669-7993-33c6-73781a0ba786	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5669-7993-117f-f64b131ff6fb	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5669-7993-7f2b-9c61ca4ccf1f	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5669-7993-65e7-7db89a38024f	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5669-7993-7cb4-80da4d92d329	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5669-7993-7441-fe1fddf46979	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5669-7993-d0ac-947a77c0a163	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5669-7993-94ae-b0332e46b119	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5669-7993-941b-51e95200991c	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5669-7993-b30b-75ef915a394a	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5669-7993-9857-5a064f9f1f45	arhivar	arhivar	t
00020000-5669-7994-28f2-cfc281e0dbc1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5669-7994-070a-ef6f0987716a	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-902a-c4592f16ff8b	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-53c0-b1b8ad50d15a	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-f8d2-86b525a36dc2	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-adaa-fc897cbe293a	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-6990-8ac9f4ebe0dd	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-f84f-df5105b9e1fb	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5669-7994-02c2-7d56456a87bc	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5669-7994-e5b6-4fcb6923803d	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-1fd6-31cd0c675a69	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-3d52-2ce6c9a4877a	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-1268-78083305ab97	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-a221-7905fe5baa08	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-4437-6bab5d1b02c9	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-51b5-d5a2a85fbe22	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-6abb-674b0044a65f	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-49ac-fd7260b0a6c7	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-a26a-fc287d514d67	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-ec1e-96938837805e	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5669-7994-0920-945213bfe24b	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-e670-b799ac05ac4f	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-7c75-7f5e0198b4c8	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-749d-47f38232dcc2	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-70b9-5af8368d52d7	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-cbe4-360118483416	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-2d99-a1d85c1a1d46	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-4688-7fcda8cf3e09	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-3249-0f94f5762a45	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-6c5a-022de3b47f61	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-c11a-27ff47c0fc6e	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-e5db-348f2355e9ec	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-11f7-48e9c0f8f290	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5669-7994-ca98-86336312317b	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5669-7994-edb8-b8f5e8c209d9	Alternacija-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 31927232)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5669-7993-0537-bbacf73dc82c	00020000-5669-7992-7fc9-cf14d675cdb6
00010000-5669-7993-4a57-00ec122a55af	00020000-5669-7992-7fc9-cf14d675cdb6
00010000-5669-7994-5385-ac83ada61c8c	00020000-5669-7994-28f2-cfc281e0dbc1
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-070a-ef6f0987716a
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-adaa-fc897cbe293a
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-e5b6-4fcb6923803d
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-3d52-2ce6c9a4877a
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-a221-7905fe5baa08
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-a26a-fc287d514d67
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-53c0-b1b8ad50d15a
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-0920-945213bfe24b
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-749d-47f38232dcc2
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-cbe4-360118483416
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-4688-7fcda8cf3e09
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-6c5a-022de3b47f61
00010000-5669-7994-805e-937c7526d418	00020000-5669-7994-ca98-86336312317b
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-070a-ef6f0987716a
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-902a-c4592f16ff8b
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-53c0-b1b8ad50d15a
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-f8d2-86b525a36dc2
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-a221-7905fe5baa08
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-6abb-674b0044a65f
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-0920-945213bfe24b
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-749d-47f38232dcc2
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-cbe4-360118483416
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-4688-7fcda8cf3e09
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-6c5a-022de3b47f61
00010000-5669-7994-0a76-434021b175d4	00020000-5669-7994-ca98-86336312317b
00010000-5669-7994-9527-8a901ff39c53	00020000-5669-7994-070a-ef6f0987716a
00010000-5669-7994-9527-8a901ff39c53	00020000-5669-7994-902a-c4592f16ff8b
00010000-5669-7994-9527-8a901ff39c53	00020000-5669-7994-53c0-b1b8ad50d15a
00010000-5669-7994-9527-8a901ff39c53	00020000-5669-7994-f8d2-86b525a36dc2
00010000-5669-7994-9527-8a901ff39c53	00020000-5669-7994-3d52-2ce6c9a4877a
00010000-5669-7994-9527-8a901ff39c53	00020000-5669-7994-a221-7905fe5baa08
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-902a-c4592f16ff8b
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-6990-8ac9f4ebe0dd
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-1fd6-31cd0c675a69
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-1268-78083305ab97
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-3d52-2ce6c9a4877a
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-49ac-fd7260b0a6c7
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-a221-7905fe5baa08
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-4437-6bab5d1b02c9
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-0920-945213bfe24b
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-e670-b799ac05ac4f
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-749d-47f38232dcc2
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-70b9-5af8368d52d7
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-cbe4-360118483416
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-2d99-a1d85c1a1d46
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-4688-7fcda8cf3e09
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-3249-0f94f5762a45
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-6c5a-022de3b47f61
00010000-5669-7994-de5f-ac24a316eab4	00020000-5669-7994-c11a-27ff47c0fc6e
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-902a-c4592f16ff8b
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-6990-8ac9f4ebe0dd
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-02c2-7d56456a87bc
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-1fd6-31cd0c675a69
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-1268-78083305ab97
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-3d52-2ce6c9a4877a
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-49ac-fd7260b0a6c7
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-a221-7905fe5baa08
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-4437-6bab5d1b02c9
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-51b5-d5a2a85fbe22
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-0920-945213bfe24b
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-e670-b799ac05ac4f
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-7c75-7f5e0198b4c8
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-749d-47f38232dcc2
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-70b9-5af8368d52d7
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-cbe4-360118483416
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-2d99-a1d85c1a1d46
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-4688-7fcda8cf3e09
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-3249-0f94f5762a45
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-6c5a-022de3b47f61
00010000-5669-7994-199b-3f3d9236846e	00020000-5669-7994-c11a-27ff47c0fc6e
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-902a-c4592f16ff8b
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-53c0-b1b8ad50d15a
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-6990-8ac9f4ebe0dd
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-f84f-df5105b9e1fb
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-02c2-7d56456a87bc
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-adaa-fc897cbe293a
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-1fd6-31cd0c675a69
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-1268-78083305ab97
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-3d52-2ce6c9a4877a
00010000-5669-7994-43c5-263cf1678efe	00020000-5669-7994-49ac-fd7260b0a6c7
00010000-5669-7994-ea33-67806753eced	00020000-5669-7994-070a-ef6f0987716a
00010000-5669-7994-ea33-67806753eced	00020000-5669-7994-f8d2-86b525a36dc2
00010000-5669-7994-ea33-67806753eced	00020000-5669-7994-adaa-fc897cbe293a
00010000-5669-7994-ea33-67806753eced	00020000-5669-7994-e5b6-4fcb6923803d
00010000-5669-7994-ea33-67806753eced	00020000-5669-7994-3d52-2ce6c9a4877a
00010000-5669-7994-ea33-67806753eced	00020000-5669-7994-a221-7905fe5baa08
00010000-5669-7994-ea33-67806753eced	00020000-5669-7994-a26a-fc287d514d67
00010000-5669-7994-ea33-67806753eced	00020000-5669-7994-e5db-348f2355e9ec
00010000-5669-7994-d82a-20bd1bcbdea8	00020000-5669-7994-ec1e-96938837805e
\.


--
-- TOC entry 3146 (class 0 OID 31927690)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 31927628)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 31927574)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5669-7994-c3d0-ce600cb99b2b	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5669-7994-82ef-c8f732bbb6a4	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5669-7994-f344-8e3310e08911	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 31927197)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5669-7992-f4a6-5b4f9f86a49b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5669-7992-8b47-a3c5ea4ab737	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5669-7992-b31a-b17f7902d5f6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5669-7992-e95c-57e1771ccbca	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5669-7992-8c59-e788947b35c6	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 31927189)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5669-7992-b914-9db7b925b9ac	00230000-5669-7992-e95c-57e1771ccbca	popa
00240000-5669-7992-0964-072660282c31	00230000-5669-7992-e95c-57e1771ccbca	oseba
00240000-5669-7992-f2f0-5968efce3be4	00230000-5669-7992-e95c-57e1771ccbca	tippopa
00240000-5669-7992-0523-b54ca331fe9e	00230000-5669-7992-e95c-57e1771ccbca	organizacijskaenota
00240000-5669-7992-6db1-72ecb3e22f6f	00230000-5669-7992-e95c-57e1771ccbca	sezona
00240000-5669-7992-5528-3b6c41e26b99	00230000-5669-7992-e95c-57e1771ccbca	tipvaje
00240000-5669-7992-00ab-21f794a26849	00230000-5669-7992-8b47-a3c5ea4ab737	prostor
00240000-5669-7992-39d6-6a8c2843727f	00230000-5669-7992-e95c-57e1771ccbca	besedilo
00240000-5669-7992-97c4-7432281f93c5	00230000-5669-7992-e95c-57e1771ccbca	uprizoritev
00240000-5669-7992-c689-2876a83a276b	00230000-5669-7992-e95c-57e1771ccbca	funkcija
00240000-5669-7992-486f-bb15ebbb6b60	00230000-5669-7992-e95c-57e1771ccbca	tipfunkcije
00240000-5669-7992-8381-9f3af854d02f	00230000-5669-7992-e95c-57e1771ccbca	alternacija
00240000-5669-7992-47aa-2f4452d3e8f2	00230000-5669-7992-f4a6-5b4f9f86a49b	pogodba
00240000-5669-7992-0f65-1e5ad53f8449	00230000-5669-7992-e95c-57e1771ccbca	zaposlitev
00240000-5669-7992-2868-196146f4daa1	00230000-5669-7992-e95c-57e1771ccbca	zvrstuprizoritve
00240000-5669-7992-e1d0-e6081e857c9e	00230000-5669-7992-f4a6-5b4f9f86a49b	programdela
00240000-5669-7992-94a7-3ae494f41de7	00230000-5669-7992-e95c-57e1771ccbca	zapis
\.


--
-- TOC entry 3095 (class 0 OID 31927184)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d8c41972-b926-4230-bc2d-b1198e0c9d27	00240000-5669-7992-b914-9db7b925b9ac	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 31927755)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5669-7995-45f0-36692fa53939	000e0000-5669-7995-48cc-24f32b468e60	00080000-5669-7994-db8e-8b6acfc66e99	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5669-7992-ca0a-e5c3a9551b0d
00270000-5669-7995-3afb-b5de7439c247	000e0000-5669-7995-48cc-24f32b468e60	00080000-5669-7994-db8e-8b6acfc66e99	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5669-7992-ca0a-e5c3a9551b0d
\.


--
-- TOC entry 3111 (class 0 OID 31927332)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 31927584)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5669-7995-fef4-032f03a0788e	00180000-5669-7995-e9f3-3a20a3c9f4eb	000c0000-5669-7995-1ae1-e337a4deacc7	00090000-5669-7994-f69c-0365ec6d73b2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-7995-08dd-ca6d70c87e70	00180000-5669-7995-e9f3-3a20a3c9f4eb	000c0000-5669-7995-c8ba-668c37584f36	00090000-5669-7994-17f7-958eb8f6c95e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-7995-6e83-85025d15e393	00180000-5669-7995-e9f3-3a20a3c9f4eb	000c0000-5669-7995-a514-303ad81852c3	00090000-5669-7994-2ccb-b099502f0405	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-7995-7962-6f4267405b08	00180000-5669-7995-e9f3-3a20a3c9f4eb	000c0000-5669-7995-3ec4-16d4194f37df	00090000-5669-7994-9aaa-321dad1f08e5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-7995-4a43-296c650d9880	00180000-5669-7995-e9f3-3a20a3c9f4eb	000c0000-5669-7995-2e90-622d21d0c42d	00090000-5669-7994-bf01-631485ef55a6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-7995-6914-27e3ff3ec2bc	00180000-5669-7995-9f84-d26495802978	\N	00090000-5669-7994-bf01-631485ef55a6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5669-7995-c8f0-132e5f503876	00180000-5669-7995-9f84-d26495802978	\N	00090000-5669-7994-17f7-958eb8f6c95e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 31927796)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5669-7992-2448-494a69b43d02	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5669-7992-984b-72664d348e41	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5669-7992-c3dc-705bf3c50ed4	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5669-7992-33a1-b9044ec3bf43	04	Režija	Režija	Režija	umetnik	30
000f0000-5669-7992-b1da-09f8361cef14	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5669-7992-c5cd-553ce4e35c17	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5669-7992-688b-a5d73244b4fa	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5669-7992-9001-795f2c8293f2	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5669-7992-d849-61262234aadd	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5669-7992-9bb3-b0542493f705	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5669-7992-5fbc-9efe062912d2	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5669-7992-2662-8c7d4052e419	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5669-7992-ff5b-272688e13530	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5669-7992-2aa6-09a7aa0d08d2	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5669-7992-3986-7d9759bdade9	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5669-7992-453c-31c1f1d2b148	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5669-7992-5d7a-d9791e121376	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5669-7992-da37-3b57ff14c047	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 31927283)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5669-7994-28b8-87a14c40abd9	0001	šola	osnovna ali srednja šola
00400000-5669-7994-ad66-1cbd81f573d4	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5669-7994-58ba-36f608a5bc0e	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 31928091)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5669-7992-e7be-9183dd7abfe3	01	Velika predstava	f	1.00	1.00
002b0000-5669-7992-4ad1-627296c899e9	02	Mala predstava	f	0.50	0.50
002b0000-5669-7992-2cbf-59f03d395ae2	03	Mala koprodukcija	t	0.40	1.00
002b0000-5669-7992-b982-6edc079899c3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5669-7992-3c14-43bbb6140f1a	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 31927564)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5669-7992-3d93-0f023b232aae	0001	prva vaja	prva vaja
00420000-5669-7992-5c5d-963bc842e95e	0002	tehnična vaja	tehnična vaja
00420000-5669-7992-b656-30caa3a06663	0003	lučna vaja	lučna vaja
00420000-5669-7992-cb0e-f0e643f03325	0004	kostumska vaja	kostumska vaja
00420000-5669-7992-2de3-23d6192650cf	0005	foto vaja	foto vaja
00420000-5669-7992-77ae-11315d2cc9b4	0006	1. glavna vaja	1. glavna vaja
00420000-5669-7992-4aa9-abe00a01cb78	0007	2. glavna vaja	2. glavna vaja
00420000-5669-7992-da52-e6e846f01706	0008	1. generalka	1. generalka
00420000-5669-7992-bc13-1ac21ead47a9	0009	2. generalka	2. generalka
00420000-5669-7992-0a42-8dbc825fd2c8	0010	odprta generalka	odprta generalka
00420000-5669-7992-8f3c-14a0840b012b	0011	obnovitvena vaja	obnovitvena vaja
00420000-5669-7992-7d00-e3182e9bab97	0012	italijanka	krajša "obnovitvena" vaja
00420000-5669-7992-5f71-be19d0b621d3	0013	pevska vaja	pevska vaja
00420000-5669-7992-3898-d2c0e2020a89	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5669-7992-94c2-d196ccb88b9d	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 31927405)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 31927219)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5669-7993-4a57-00ec122a55af	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROBQ3UP7V..SZNw.UsYlzxbnwUuGa3n7K	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5669-7994-ed80-e9eda79dd5f7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5669-7994-ca1f-eda78197f163	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5669-7994-0522-fd386b4711c4	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5669-7994-c2f4-afa9cd1eb6c7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5669-7994-46b4-99bebb701fe2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5669-7994-718c-beeaafe52637	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5669-7994-e6d3-69b7013d58df	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5669-7994-4c82-f6c4e112abe6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5669-7994-1a44-8016f88e317e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5669-7994-5385-ac83ada61c8c	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5669-7994-36a4-9b0592e7aed1	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5669-7994-805e-937c7526d418	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5669-7994-0a76-434021b175d4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5669-7994-9527-8a901ff39c53	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5669-7994-de5f-ac24a316eab4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5669-7994-199b-3f3d9236846e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5669-7994-43c5-263cf1678efe	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5669-7994-ea33-67806753eced	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5669-7994-d82a-20bd1bcbdea8	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5669-7993-0537-bbacf73dc82c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 31927846)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5669-7995-7cb3-3b40f5ff3b9a	00160000-5669-7994-febb-edba304153d4	\N	00140000-5669-7992-72a2-06223f4afa60	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5669-7994-28ad-527eb8cc3864
000e0000-5669-7995-48cc-24f32b468e60	00160000-5669-7994-ee94-8ff278849f20	\N	00140000-5669-7992-5523-08ec441e9606	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5669-7994-208b-fdbf630531fa
000e0000-5669-7995-7ace-f2d81da2e26d	\N	\N	00140000-5669-7992-5523-08ec441e9606	00190000-5669-7995-1490-f76ace33c64b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5669-7994-28ad-527eb8cc3864
000e0000-5669-7995-495f-459161dd3cbb	\N	\N	00140000-5669-7992-5523-08ec441e9606	00190000-5669-7995-1490-f76ace33c64b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5669-7994-28ad-527eb8cc3864
000e0000-5669-7995-d35c-112d800198b6	\N	\N	00140000-5669-7992-5523-08ec441e9606	00190000-5669-7995-1490-f76ace33c64b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5669-7994-536d-77f2f21764c2
000e0000-5669-7995-dff0-24b94b5d06a4	\N	\N	00140000-5669-7992-5523-08ec441e9606	00190000-5669-7995-1490-f76ace33c64b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5669-7994-536d-77f2f21764c2
\.


--
-- TOC entry 3125 (class 0 OID 31927504)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5669-7995-dbc1-3347e668e98a	\N	000e0000-5669-7995-48cc-24f32b468e60	1	
00200000-5669-7995-1324-eee1bbed5689	\N	000e0000-5669-7995-48cc-24f32b468e60	2	
00200000-5669-7995-3a79-f9a7c4337037	\N	000e0000-5669-7995-48cc-24f32b468e60	3	
00200000-5669-7995-d18e-97dbaac04a5f	\N	000e0000-5669-7995-48cc-24f32b468e60	4	
00200000-5669-7995-ae16-2a7ce4247ab0	\N	000e0000-5669-7995-48cc-24f32b468e60	5	
\.


--
-- TOC entry 3142 (class 0 OID 31927655)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 31927769)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5669-7992-dac0-6b246f93878a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5669-7992-06b5-a923a367240e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5669-7992-e115-3319db41840a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5669-7992-0714-70e784d03542	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5669-7992-de44-b5195c2891ff	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5669-7992-4af9-02014840c441	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5669-7992-7e59-a6c474fa957c	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5669-7992-2943-7a60a91fe0fe	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5669-7992-ca0a-e5c3a9551b0d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5669-7992-5fe7-a30729d0877e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5669-7992-1a68-da7e50288259	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5669-7992-d524-59d489e74682	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5669-7992-8bbb-b5859738b62e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5669-7992-bf7c-1c43d80a44b0	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5669-7992-e1cf-2dff85507d5c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5669-7992-56e7-36347c00d1dd	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5669-7992-6007-563728c380ae	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5669-7992-7375-30e73fabfe92	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5669-7992-8384-c1f2f933fa15	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5669-7992-689e-39efecd5425d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5669-7992-9c21-dafe93db06b0	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5669-7992-f65e-558bf3f3b78b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5669-7992-77cb-23f38ae0c456	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5669-7992-884f-5527cdfe34dc	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5669-7992-c4dc-ad8d58ebc606	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5669-7992-bec8-a3f7748a6003	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5669-7992-131b-3570f850184b	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5669-7992-f91c-b3c7bbec1454	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 31928141)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 31928110)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 31928153)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 31927727)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5669-7995-66ca-7f1fcec95d8f	00090000-5669-7994-17f7-958eb8f6c95e	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-7995-3f45-cf4b57972012	00090000-5669-7994-2ccb-b099502f0405	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-7995-2378-fbfae62f4876	00090000-5669-7994-bdcd-5f02406708d3	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-7995-e094-a46738b16566	00090000-5669-7994-f9c2-9dfee1611c97	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-7995-e05a-467d0b2a19ea	00090000-5669-7994-adb5-368d737395f7	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-7995-0558-7185f29bd327	00090000-5669-7994-8faa-b2de98377508	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 31927548)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 31927836)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5669-7992-72a2-06223f4afa60	01	Drama	drama (SURS 01)
00140000-5669-7992-e76b-d5cdbf929e65	02	Opera	opera (SURS 02)
00140000-5669-7992-9b03-eafb2158e046	03	Balet	balet (SURS 03)
00140000-5669-7992-5639-edbad95d08bd	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5669-7992-2de8-f40007f6650f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5669-7992-5523-08ec441e9606	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5669-7992-f194-3206ea4058b9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 31927717)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 31927282)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 31927895)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 31927885)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 31927273)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 31927752)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 31927794)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 31928194)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 31927536)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 31927558)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 31927563)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 31928108)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 31927431)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 31927964)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 31927713)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 31927502)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 31927469)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 31927445)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 31927620)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 31928171)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 31928178)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 31928202)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2728 (class 2606 OID 31927647)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 31927403)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 31927301)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 31927365)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 31927328)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 31927262)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 31927247)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 31927653)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 31927689)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 31927831)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 31927356)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 31927391)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 31928059)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 31927626)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 31927381)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 31927521)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 31927490)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 31927482)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 31927638)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 31928068)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 31928076)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 31928046)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 31928089)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 31927671)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 31927611)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 31927602)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 31927818)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 31927745)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 31927457)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 31927218)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 31927680)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 31927236)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 31927256)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 31927698)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 31927633)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 31927582)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 31927206)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 31927194)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 31927188)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 31927765)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 31927337)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 31927593)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 31927805)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 31927290)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 31928101)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 31927571)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 31927416)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 31927231)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 31927864)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 31927511)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 31927661)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 31927777)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 31928151)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 31928135)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 31928159)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 31927735)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 31927552)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 31927844)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 31927725)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 31927546)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 31927547)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 31927545)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 31927544)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 31927543)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 31927766)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 31927767)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 31927768)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 31928173)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 31928172)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 31927358)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 31927359)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 31927654)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 31928139)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 31928138)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 31928140)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 31928137)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 31928136)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 31927640)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 31927639)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 31927512)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 31927513)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 31927714)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 31927716)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 31927715)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 31927447)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 31927446)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 31928090)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 31927833)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 31927834)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 31927835)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 31928160)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 31927869)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 31927866)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 31927870)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 31927868)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 31927867)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 31927418)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 31927417)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 31927331)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 31927681)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 31927263)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 31927264)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 31927701)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 31927700)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 31927699)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 31927368)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 31927367)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 31927369)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 31927485)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 31927483)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 31927484)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 31927196)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 31927606)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 31927604)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 31927603)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 31927605)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 31927237)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 31927238)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 31927662)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 31928195)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 31927754)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 31927753)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 31928203)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 31928204)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 31927627)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 31927746)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 31927747)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 31927969)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 31927968)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 31927965)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 31927966)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 31927967)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 31927383)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 31927382)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 31927384)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 31927675)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 31927674)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 31928069)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 31928070)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 31927899)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 31927900)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 31927897)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 31927898)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 31927736)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 31927737)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 31927615)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 31927614)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 31927612)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 31927613)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 31927887)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 31927886)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 31927458)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 31927472)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 31927471)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 31927470)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 31927473)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 31927503)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 31927491)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 31927492)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 31928060)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 31928109)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 31928179)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 31928180)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 31927303)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 31927302)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 31927338)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 31927339)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 31927553)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 31927596)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 31927595)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 31927594)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 31927538)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 31927539)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 31927542)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 31927537)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 31927541)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 31927540)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 31927357)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 31927291)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 31927292)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 31927432)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 31927434)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 31927433)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 31927435)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 31927621)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 31927832)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 31927865)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 31927806)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 31927807)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 31927329)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 31927330)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 31927726)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 31927207)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 31927404)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 31927366)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 31927195)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 31928102)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 31927673)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 31927672)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 31927572)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 31927573)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 31927896)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 31927392)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 31927845)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 31928152)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 31928077)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 31928078)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 31927795)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 31927583)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 31927257)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 31928375)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 31928380)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 31928405)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 31928395)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 31928370)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 31928390)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 31928400)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 31928385)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 31928575)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 31928580)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 31928585)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 31928750)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 31928745)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 31928260)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 31928265)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 31928490)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 31928730)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 31928725)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 31928735)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 31928720)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 31928715)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 31928485)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 31928480)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 31928360)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 31928365)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 31928530)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 31928540)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 31928535)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 31928315)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 31928310)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 31928470)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 31928705)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 31928590)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 31928595)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 31928600)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 31928740)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 31928620)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 31928605)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 31928625)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 31928615)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 31928610)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 31928305)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 31928300)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 31928245)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 31928240)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 31928510)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 31928220)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 31928225)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 31928525)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 31928520)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 31928515)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 31928275)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 31928270)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 31928280)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 31928340)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 31928330)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 31928335)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 31928205)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 31928445)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 31928435)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 31928430)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 31928440)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 31928210)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 31928215)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 31928495)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 31928765)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 31928570)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 31928565)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 31928770)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 31928775)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 31928475)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 31928555)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 31928560)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 31928680)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 31928675)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 31928660)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 31928665)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 31928670)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 31928290)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 31928285)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 31928295)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 31928505)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 31928500)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 31928690)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 31928695)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 31928650)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 31928655)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 31928640)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 31928645)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 31928545)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 31928550)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 31928465)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 31928460)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 31928450)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 31928455)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 31928635)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 31928630)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 31928320)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 31928325)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 31928355)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 31928345)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 31928350)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 31928685)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 31928700)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 31928710)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 31928755)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 31928760)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 31928235)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 31928230)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 31928250)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 31928255)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 31928410)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 31928425)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 31928420)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 31928415)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-10 14:09:44 CET

--
-- PostgreSQL database dump complete
--

