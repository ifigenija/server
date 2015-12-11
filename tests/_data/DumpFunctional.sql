--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-10 17:04:56 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 32026789)
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
-- TOC entry 237 (class 1259 OID 32027403)
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
-- TOC entry 236 (class 1259 OID 32027386)
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
-- TOC entry 182 (class 1259 OID 32026782)
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
-- TOC entry 181 (class 1259 OID 32026780)
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
-- TOC entry 227 (class 1259 OID 32027263)
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
-- TOC entry 230 (class 1259 OID 32027293)
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
-- TOC entry 251 (class 1259 OID 32027696)
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
-- TOC entry 203 (class 1259 OID 32027037)
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
-- TOC entry 205 (class 1259 OID 32027069)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32027074)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32027618)
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
-- TOC entry 194 (class 1259 OID 32026934)
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
-- TOC entry 238 (class 1259 OID 32027416)
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
-- TOC entry 223 (class 1259 OID 32027217)
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
-- TOC entry 200 (class 1259 OID 32027008)
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
-- TOC entry 197 (class 1259 OID 32026974)
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
-- TOC entry 195 (class 1259 OID 32026951)
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
-- TOC entry 212 (class 1259 OID 32027131)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32027676)
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
-- TOC entry 250 (class 1259 OID 32027689)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32027711)
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
-- TOC entry 170 (class 1259 OID 32019540)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32027156)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32026908)
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
-- TOC entry 185 (class 1259 OID 32026808)
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
-- TOC entry 189 (class 1259 OID 32026875)
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
-- TOC entry 186 (class 1259 OID 32026819)
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
-- TOC entry 178 (class 1259 OID 32026754)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32026773)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32027163)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32027197)
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
-- TOC entry 233 (class 1259 OID 32027334)
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
-- TOC entry 188 (class 1259 OID 32026855)
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
-- TOC entry 191 (class 1259 OID 32026900)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32027562)
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
-- TOC entry 213 (class 1259 OID 32027137)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32026885)
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
-- TOC entry 202 (class 1259 OID 32027029)
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
-- TOC entry 198 (class 1259 OID 32026989)
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
-- TOC entry 199 (class 1259 OID 32027001)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32027149)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32027576)
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
-- TOC entry 242 (class 1259 OID 32027586)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32027485)
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
-- TOC entry 243 (class 1259 OID 32027594)
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
-- TOC entry 219 (class 1259 OID 32027178)
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
-- TOC entry 211 (class 1259 OID 32027122)
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
-- TOC entry 210 (class 1259 OID 32027112)
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
-- TOC entry 232 (class 1259 OID 32027323)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32027253)
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
-- TOC entry 196 (class 1259 OID 32026963)
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
-- TOC entry 175 (class 1259 OID 32026725)
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
-- TOC entry 174 (class 1259 OID 32026723)
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
-- TOC entry 220 (class 1259 OID 32027191)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32026763)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32026747)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32027205)
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
-- TOC entry 214 (class 1259 OID 32027143)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32027089)
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
-- TOC entry 173 (class 1259 OID 32026712)
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
-- TOC entry 172 (class 1259 OID 32026704)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32026699)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32027270)
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
-- TOC entry 187 (class 1259 OID 32026847)
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
-- TOC entry 209 (class 1259 OID 32027099)
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
-- TOC entry 231 (class 1259 OID 32027311)
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
-- TOC entry 184 (class 1259 OID 32026798)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32027606)
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
-- TOC entry 207 (class 1259 OID 32027079)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32026920)
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
-- TOC entry 176 (class 1259 OID 32026734)
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
-- TOC entry 235 (class 1259 OID 32027361)
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
-- TOC entry 201 (class 1259 OID 32027019)
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
-- TOC entry 218 (class 1259 OID 32027170)
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
-- TOC entry 229 (class 1259 OID 32027284)
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
-- TOC entry 247 (class 1259 OID 32027656)
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
-- TOC entry 246 (class 1259 OID 32027625)
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
-- TOC entry 248 (class 1259 OID 32027668)
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
-- TOC entry 225 (class 1259 OID 32027242)
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
-- TOC entry 204 (class 1259 OID 32027063)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32027351)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32027232)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32026785)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32026728)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 32026789)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5669-a2a4-7430-29ea185a463b	10	30	Otroci	Abonma za otroke	200
000a0000-5669-a2a4-d76b-466b1ee6e23e	20	60	Mladina	Abonma za mladino	400
000a0000-5669-a2a4-9dea-a7c0c567bb08	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 32027403)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5669-a2a5-439c-158fd8ba7e63	000d0000-5669-a2a5-23d9-e216a44bbd1e	\N	00090000-5669-a2a5-eef7-d3ba5cf06751	000b0000-5669-a2a5-fa4a-c1760029d376	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5669-a2a5-151c-3d561905682e	000d0000-5669-a2a5-4e60-2e3e83f2a62f	00100000-5669-a2a5-99ec-352070e7a587	00090000-5669-a2a5-2d64-969935dc7eb6	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5669-a2a5-c08f-a3e8e5bc585f	000d0000-5669-a2a5-91ab-7d5a7290248d	00100000-5669-a2a5-3cfb-508504471a7c	00090000-5669-a2a5-54f2-15ad45ea45c8	\N	0003	t	\N	2015-12-10	\N	2	t	\N	f	f
000c0000-5669-a2a5-4b68-e1f5030dadb8	000d0000-5669-a2a5-561f-ae8ea474ff78	\N	00090000-5669-a2a5-2509-bc5e8f58c4ed	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5669-a2a5-a664-4bfc7317538c	000d0000-5669-a2a5-bb34-bd08cb3fc462	\N	00090000-5669-a2a5-6a37-4ba886b2ffa7	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5669-a2a5-32c0-3add98b49456	000d0000-5669-a2a5-1ba7-c116c190a295	\N	00090000-5669-a2a5-0aa9-ee78856b38f3	000b0000-5669-a2a5-407b-c6c03f8fc2bd	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5669-a2a5-2c01-5109b85ef482	000d0000-5669-a2a5-8e7a-156ce1b3a75a	00100000-5669-a2a5-6cef-cd5d1e7d8e31	00090000-5669-a2a5-f0af-fcc8f2dc2740	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5669-a2a5-7487-40a4ad4fcb1e	000d0000-5669-a2a5-a745-62d195a3a23b	\N	00090000-5669-a2a5-aea5-9cd5ac26f015	000b0000-5669-a2a5-31cf-4629de5c66ae	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5669-a2a5-e012-1cc5b8425f2b	000d0000-5669-a2a5-8e7a-156ce1b3a75a	00100000-5669-a2a5-5500-cb51755ef203	00090000-5669-a2a5-5b13-388d6f306493	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5669-a2a5-182d-ac3b1bb8bbf5	000d0000-5669-a2a5-8e7a-156ce1b3a75a	00100000-5669-a2a5-b5aa-045593807b70	00090000-5669-a2a5-0cc1-da0939de2438	\N	0010	t	\N	2015-12-10	\N	16	f	\N	f	t
000c0000-5669-a2a5-631f-f9f393464170	000d0000-5669-a2a5-8e7a-156ce1b3a75a	00100000-5669-a2a5-9384-7570415f30e3	00090000-5669-a2a5-93a0-0d376cba94ff	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5669-a2a5-1b7a-2a3e8b5c88b6	000d0000-5669-a2a5-3d87-1b127533a74a	00100000-5669-a2a5-99ec-352070e7a587	00090000-5669-a2a5-2d64-969935dc7eb6	000b0000-5669-a2a5-02cb-dc015d7e4695	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 32027386)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 32026782)
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
-- TOC entry 3151 (class 0 OID 32027263)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5669-a2a5-7dd9-c95e58f97656	00160000-5669-a2a4-7c12-3e9715bdada6	00090000-5669-a2a5-84d2-a9d5cfcf3756	aizv	10	t
003d0000-5669-a2a5-535c-1131a56084ba	00160000-5669-a2a4-7c12-3e9715bdada6	00090000-5669-a2a5-4514-5c316a2640c4	apri	14	t
003d0000-5669-a2a5-f7d7-482367902986	00160000-5669-a2a4-a1d0-6351dd1d4a7b	00090000-5669-a2a5-3f67-f76c8c4f5f40	aizv	11	t
003d0000-5669-a2a5-e5ef-4d8eb1387f20	00160000-5669-a2a4-92c5-37963a1e6d32	00090000-5669-a2a5-de72-995eec132cf1	aizv	12	t
003d0000-5669-a2a5-6b9e-8e2069b369f7	00160000-5669-a2a4-7c12-3e9715bdada6	00090000-5669-a2a5-1fc8-86b67f1f9670	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 32027293)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5669-a2a4-7c12-3e9715bdada6	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5669-a2a4-a1d0-6351dd1d4a7b	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5669-a2a4-92c5-37963a1e6d32	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 32027696)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32027037)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5669-a2a5-30a1-ce321d329d1d	\N	\N	00200000-5669-a2a5-8237-93595bb0877f	\N	\N	\N	00220000-5669-a2a4-3231-7cc2ebef7532	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5669-a2a5-1a5b-3ace490ae184	\N	\N	00200000-5669-a2a5-81c1-715b7e389c2c	\N	\N	\N	00220000-5669-a2a4-3231-7cc2ebef7532	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5669-a2a5-4101-d81cccff7a2f	\N	\N	00200000-5669-a2a5-2bc5-110379362aa0	\N	\N	\N	00220000-5669-a2a4-b452-66e291a888f8	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5669-a2a5-7870-7f6f069377d2	\N	\N	00200000-5669-a2a5-dd23-fe6c8a7b9a0d	\N	\N	\N	00220000-5669-a2a4-2f77-8e4198012ecb	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5669-a2a5-ab40-8f3225b8d0ae	\N	\N	00200000-5669-a2a5-ff4c-ccdf655b10a5	\N	\N	\N	00220000-5669-a2a4-a9fe-2b4eb96ac3d0	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 32027069)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32027074)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32027618)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 32026934)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5669-a2a2-8d4d-f7cff24de020	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5669-a2a2-7302-4d40826f9685	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5669-a2a2-ce95-9af3d707d3aa	AL	ALB	008	Albania 	Albanija	\N
00040000-5669-a2a2-6733-18dd566c1327	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5669-a2a2-8ce5-e56212136981	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5669-a2a2-35ff-6d9d60ccc26d	AD	AND	020	Andorra 	Andora	\N
00040000-5669-a2a2-1560-46b63924be97	AO	AGO	024	Angola 	Angola	\N
00040000-5669-a2a2-c692-6b69c38ccaba	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5669-a2a2-6836-d5d168f6b4b2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5669-a2a2-ad50-9d4a94992739	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5669-a2a2-2f9a-3e3d86a1e55a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5669-a2a2-bc62-1e5b67e393da	AM	ARM	051	Armenia 	Armenija	\N
00040000-5669-a2a2-5579-c6d7c9484826	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5669-a2a2-1f2e-65e33223aeca	AU	AUS	036	Australia 	Avstralija	\N
00040000-5669-a2a2-d5fa-57296f4d1f33	AT	AUT	040	Austria 	Avstrija	\N
00040000-5669-a2a2-13c6-786db8e8e631	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5669-a2a2-3616-e72feee36cf1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5669-a2a2-148f-98a7135d4656	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5669-a2a2-04c9-5708d4cce26c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5669-a2a2-6e14-e6789c300555	BB	BRB	052	Barbados 	Barbados	\N
00040000-5669-a2a2-bb55-f40d810bd08b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5669-a2a2-496f-afd74b3ee1d8	BE	BEL	056	Belgium 	Belgija	\N
00040000-5669-a2a2-8e7f-8adfcff994ee	BZ	BLZ	084	Belize 	Belize	\N
00040000-5669-a2a2-6cf4-877fdc82a891	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5669-a2a2-52fd-f695362ac1fe	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5669-a2a2-f4b8-70529534bc29	BT	BTN	064	Bhutan 	Butan	\N
00040000-5669-a2a2-00ef-dd7fdaded925	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5669-a2a2-1086-3690dc7da206	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5669-a2a2-3415-0eab1a5d33d8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5669-a2a2-99f1-9696edb9b008	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5669-a2a2-689d-baf35031e27d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5669-a2a2-a58e-15465f636878	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5669-a2a2-51e0-12995a4425c8	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5669-a2a2-e158-131bc94a74f6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5669-a2a2-2d7e-0bee67110d59	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5669-a2a2-a6ac-1fdd75120aeb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5669-a2a2-50b6-ff59a0e820d9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5669-a2a2-b883-9df3053b5e8c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5669-a2a2-fca3-34d71b0e2b22	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5669-a2a2-9673-790b5f2269ba	CA	CAN	124	Canada 	Kanada	\N
00040000-5669-a2a2-d06f-137a69bcd7f1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5669-a2a2-407e-79a0b1f1fc95	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5669-a2a2-d162-75c0e2f80cf2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5669-a2a2-c65c-ca8873eafb03	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5669-a2a2-0901-a4b546c12432	CL	CHL	152	Chile 	Čile	\N
00040000-5669-a2a2-a8ca-8197bd40d19f	CN	CHN	156	China 	Kitajska	\N
00040000-5669-a2a2-4d36-b26c4569c3b9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5669-a2a2-828f-9b7ede867cc6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5669-a2a2-bd91-782f9223a8b6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5669-a2a2-2bdf-cc8d71ec40c5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5669-a2a2-2a64-4c3ab435c0e4	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5669-a2a2-1138-157fcf4a0893	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5669-a2a2-6716-5b5504004bdc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5669-a2a2-5d81-3ff3d312bc2e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5669-a2a2-f06d-688d821ed718	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5669-a2a2-a001-e51fbcd8ac78	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5669-a2a2-e905-b9558334390e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5669-a2a2-bee8-0399caf6a65f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5669-a2a2-7f96-fc7d78b4f7dd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5669-a2a2-dfae-c5288660e1d8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5669-a2a2-7f11-38166cfddb72	DK	DNK	208	Denmark 	Danska	\N
00040000-5669-a2a2-e51e-3824955dddfb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5669-a2a2-4187-aabd2213a1a4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5669-a2a2-0dc9-0fbd7f57a7b6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5669-a2a2-5427-0475f95f1702	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5669-a2a2-5beb-b3a0440f5380	EG	EGY	818	Egypt 	Egipt	\N
00040000-5669-a2a2-205d-ddfe8428a497	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5669-a2a2-3af7-17c708b56650	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5669-a2a2-b232-32019346e081	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5669-a2a2-6491-a63f631ee1ef	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5669-a2a2-0671-c6869c05eedd	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5669-a2a2-fff1-8529e62a64dd	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5669-a2a2-bda8-c725686e8b8e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5669-a2a2-dce0-71e150b51efc	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5669-a2a2-b8e4-9b58b82e01b6	FI	FIN	246	Finland 	Finska	\N
00040000-5669-a2a2-ecab-477d3e0ccfe6	FR	FRA	250	France 	Francija	\N
00040000-5669-a2a2-421d-481921ffb874	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5669-a2a2-35c4-b52c9cd76ac0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5669-a2a2-ce4b-096b97caa4dc	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5669-a2a2-ff45-c71c670fd09d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5669-a2a2-a95d-adf976af2c51	GA	GAB	266	Gabon 	Gabon	\N
00040000-5669-a2a2-e629-257e5c88bacc	GM	GMB	270	Gambia 	Gambija	\N
00040000-5669-a2a2-76e9-31f27638ed6e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5669-a2a2-b368-d5bcbf96df86	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5669-a2a2-9026-96ffa40035bd	GH	GHA	288	Ghana 	Gana	\N
00040000-5669-a2a2-268f-38f1c851a50d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5669-a2a2-7ae6-e7103228f9bc	GR	GRC	300	Greece 	Grčija	\N
00040000-5669-a2a2-62ad-255cb58c0d86	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5669-a2a2-9399-a1333f32dd5a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5669-a2a2-3fc7-df4526a4479d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5669-a2a2-0304-ea7e0c066c16	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5669-a2a2-5f22-c43294f6b17a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5669-a2a2-7124-0549df6c9760	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5669-a2a2-8cca-d4cc9d79c774	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5669-a2a2-03df-8e31404c6d1d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5669-a2a2-f57a-9473b6ccf6f6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5669-a2a2-b89d-48534478d208	HT	HTI	332	Haiti 	Haiti	\N
00040000-5669-a2a2-bf64-d14df86677fb	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5669-a2a2-01d6-76efa2093fa6	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5669-a2a2-a999-07d509440df1	HN	HND	340	Honduras 	Honduras	\N
00040000-5669-a2a2-5f36-0cae14accf83	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5669-a2a2-6d49-de6860ec778b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5669-a2a2-48d6-a509ee7b4c5d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5669-a2a2-8d39-28f7d8f29ae1	IN	IND	356	India 	Indija	\N
00040000-5669-a2a2-0eb5-c1ded4657748	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5669-a2a2-04f0-6d3014948baa	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5669-a2a2-ee5a-031cf7350e27	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5669-a2a2-e5e8-7666db1b3ff8	IE	IRL	372	Ireland 	Irska	\N
00040000-5669-a2a2-a38f-38f45f5aa95a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5669-a2a2-6627-3feb05af32eb	IL	ISR	376	Israel 	Izrael	\N
00040000-5669-a2a2-7ad9-db8b5ebd3b54	IT	ITA	380	Italy 	Italija	\N
00040000-5669-a2a2-0702-f9c99ab55f85	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5669-a2a2-f010-e0bee03d8a25	JP	JPN	392	Japan 	Japonska	\N
00040000-5669-a2a2-b312-f201f6a44d4f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5669-a2a2-2169-d8d30602e9d2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5669-a2a2-20a5-019004b949b6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5669-a2a2-aebb-bda2592bd6cd	KE	KEN	404	Kenya 	Kenija	\N
00040000-5669-a2a2-ca8a-eda75d7bf8e2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5669-a2a2-27d0-a6cab31585a5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5669-a2a2-aa12-a967eb7c08cc	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5669-a2a2-1974-61c9810de5ea	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5669-a2a2-4534-69585dabf6b7	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5669-a2a2-be6f-f33b3ffef1a0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5669-a2a2-f53e-91c40f2eb914	LV	LVA	428	Latvia 	Latvija	\N
00040000-5669-a2a2-abbf-4c473ee70cc5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5669-a2a2-4543-1fabad165b6d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5669-a2a2-63be-c5e7339daaa7	LR	LBR	430	Liberia 	Liberija	\N
00040000-5669-a2a2-5df0-bf269ffdbf10	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5669-a2a2-f1ed-b8f1e773da06	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5669-a2a2-3c30-a2349dde653c	LT	LTU	440	Lithuania 	Litva	\N
00040000-5669-a2a2-a305-3b81c11cbcc7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5669-a2a2-c4a2-aeb0fd942778	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5669-a2a2-c24e-dbf99e61df67	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5669-a2a2-4df6-4ced5a9b5551	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5669-a2a2-aa30-034a6ae85509	MW	MWI	454	Malawi 	Malavi	\N
00040000-5669-a2a2-bed3-1bd4367adf93	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5669-a2a2-bd3e-0ee963b15e4c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5669-a2a2-40a5-028fd5a0a55c	ML	MLI	466	Mali 	Mali	\N
00040000-5669-a2a2-59a9-980c3808adf0	MT	MLT	470	Malta 	Malta	\N
00040000-5669-a2a2-7590-65f7e57dd58d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5669-a2a2-954a-34dc65d42bab	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5669-a2a2-9a93-467a75065413	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5669-a2a2-95b4-a021b84c636d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5669-a2a2-ac0a-6a3dd7ab544b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5669-a2a2-82ed-3e88679d3b0f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5669-a2a2-5e29-6c12ae421722	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5669-a2a2-d2c7-bd71a7445868	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5669-a2a2-f287-6d03127abe61	MC	MCO	492	Monaco 	Monako	\N
00040000-5669-a2a2-48e3-801144dc8c93	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5669-a2a2-807a-90b65196e365	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5669-a2a2-90b6-dec387654185	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5669-a2a2-ee97-9f0d1788e969	MA	MAR	504	Morocco 	Maroko	\N
00040000-5669-a2a2-0b75-6e803bf712de	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5669-a2a2-0426-356e5f834805	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5669-a2a2-7c82-e9a03ccb1a44	NA	NAM	516	Namibia 	Namibija	\N
00040000-5669-a2a2-fb10-17ae4625c43b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5669-a2a2-dde4-0daefa005b68	NP	NPL	524	Nepal 	Nepal	\N
00040000-5669-a2a2-9721-f1bfdf75f04c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5669-a2a2-5b03-7ed11930ff11	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5669-a2a2-77aa-90362dc713a6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5669-a2a2-8fa8-dc631f2a9667	NE	NER	562	Niger 	Niger 	\N
00040000-5669-a2a2-b64f-bb13ee47889e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5669-a2a2-994f-89256145eaa6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5669-a2a2-ad9f-79cc4f42768b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5669-a2a2-9dae-78e644428183	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5669-a2a2-764a-22c6a48094cb	NO	NOR	578	Norway 	Norveška	\N
00040000-5669-a2a2-3b44-d4cf55db2227	OM	OMN	512	Oman 	Oman	\N
00040000-5669-a2a2-5e7b-3777d44e4a0b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5669-a2a2-a789-efacfc8f3749	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5669-a2a2-c678-7045df820738	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5669-a2a2-2bd2-4c395aeca939	PA	PAN	591	Panama 	Panama	\N
00040000-5669-a2a2-3580-2a118f1c85b4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5669-a2a2-5d9f-0dc88d2fae4a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5669-a2a2-3bb5-cf22bba91414	PE	PER	604	Peru 	Peru	\N
00040000-5669-a2a2-ba9f-d2f890a4caca	PH	PHL	608	Philippines 	Filipini	\N
00040000-5669-a2a2-15a6-5aebb7a5af44	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5669-a2a2-a3c3-9ba6fd33ca99	PL	POL	616	Poland 	Poljska	\N
00040000-5669-a2a2-a37b-05833e72e26e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5669-a2a2-a8f2-bca413915407	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5669-a2a2-568f-9b2a97f63eb2	QA	QAT	634	Qatar 	Katar	\N
00040000-5669-a2a2-ee9c-695f5db2d991	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5669-a2a2-4047-c6462ed91b3a	RO	ROU	642	Romania 	Romunija	\N
00040000-5669-a2a2-ebd4-49f316c0c868	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5669-a2a2-ebe0-cba9995e7c5d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5669-a2a2-5ace-7adb8dcfcf92	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5669-a2a2-b1b9-0ac42b5cf596	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5669-a2a2-ef28-77ea92c902b5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5669-a2a2-dcfe-62004cb3dfa0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5669-a2a2-a957-50086a44bb52	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5669-a2a2-1138-46eeb4e71bbd	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5669-a2a2-c178-58343b10f258	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5669-a2a2-7b0a-bbaa76a80e03	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5669-a2a2-2df4-685b155fb3e0	SM	SMR	674	San Marino 	San Marino	\N
00040000-5669-a2a2-d7aa-2bab82c372ed	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5669-a2a2-62c8-7d83deead68c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5669-a2a2-5835-9828c281ddcd	SN	SEN	686	Senegal 	Senegal	\N
00040000-5669-a2a2-7da9-8ad980bcc177	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5669-a2a2-11a3-c174d5d64adb	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5669-a2a2-afc7-5246ce41d433	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5669-a2a2-6dfc-fbc8e6092d03	SG	SGP	702	Singapore 	Singapur	\N
00040000-5669-a2a2-1288-fb22a1cdf802	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5669-a2a2-8530-b5113eb4c510	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5669-a2a2-46bf-9fbb95d8ff90	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5669-a2a2-8dc8-5be51ae5e2c5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5669-a2a2-31d4-0b468b777105	SO	SOM	706	Somalia 	Somalija	\N
00040000-5669-a2a2-6cc2-d124bf745bc9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5669-a2a2-a9c4-ef5f9ede5486	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5669-a2a2-3356-479196cb9054	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5669-a2a2-aa08-a324d71d6cbf	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5669-a2a2-4d7a-f869199582a1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5669-a2a2-6674-c3c29157b182	SD	SDN	729	Sudan 	Sudan	\N
00040000-5669-a2a2-3f60-aa563b5dfcbc	SR	SUR	740	Suriname 	Surinam	\N
00040000-5669-a2a2-0fb8-c13c69f55b2a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5669-a2a2-5285-30ff185c8214	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5669-a2a2-3193-951bc1b7dab2	SE	SWE	752	Sweden 	Švedska	\N
00040000-5669-a2a2-343a-d33ab14ac4e9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5669-a2a2-bc77-55ac945e6bca	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5669-a2a2-e52d-5558d03e6344	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5669-a2a2-519a-be32654cb57b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5669-a2a2-205f-0df90b0be9ac	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5669-a2a2-0673-9ea7fab43005	TH	THA	764	Thailand 	Tajska	\N
00040000-5669-a2a2-fbcf-9604dacc63f7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5669-a2a2-28df-bf8b4cb40aa3	TG	TGO	768	Togo 	Togo	\N
00040000-5669-a2a2-e2df-6af008a8b967	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5669-a2a2-a74d-2eaec95253d8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5669-a2a2-5f30-e690984ffccd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5669-a2a2-f788-5ba4b4dfbd9a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5669-a2a2-8ac1-670b0204dbd7	TR	TUR	792	Turkey 	Turčija	\N
00040000-5669-a2a2-536d-86f02b9bdb43	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5669-a2a2-0832-6104efbd65e0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5669-a2a2-7984-11373e4f9620	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5669-a2a2-00f2-8d1c2d5ee9bb	UG	UGA	800	Uganda 	Uganda	\N
00040000-5669-a2a2-7fb7-4c37a8b23bb2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5669-a2a2-de0a-97f401690f25	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5669-a2a2-2963-98dec5d307a6	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5669-a2a2-e388-629a933ee9f2	US	USA	840	United States 	Združene države Amerike	\N
00040000-5669-a2a2-db2b-d65037e2d8fc	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5669-a2a2-0f7d-09ed562b2377	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5669-a2a2-87eb-8cefdee1489c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5669-a2a2-1bdc-d4d247f7661c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5669-a2a2-4b94-ffbe15c2cd4e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5669-a2a2-6a69-bad57fdb2045	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5669-a2a2-4d5c-be60ccd892ea	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5669-a2a2-9d4a-51611f64e5c5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5669-a2a2-e018-40800232659a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5669-a2a2-c413-d65fb5f2d78f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5669-a2a2-d885-aa827389d256	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5669-a2a2-855c-0a73becc883d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5669-a2a2-f1e4-6a3d4e82bb71	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 32027416)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5669-a2a5-d637-4fee27f5a5ae	000e0000-5669-a2a5-c5a7-3760151aff25	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5669-a2a2-3a4f-caf5b2e0dcc7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5669-a2a5-2ac6-149da78f42d6	000e0000-5669-a2a5-f416-d9e23cf85136	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5669-a2a2-a87b-3a7145c7b59b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5669-a2a5-c5e8-7efb05b2fc95	000e0000-5669-a2a5-d93a-b8481b0628ba	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5669-a2a2-3a4f-caf5b2e0dcc7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5669-a2a5-682a-8a0b9f76ea8d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5669-a2a5-331f-e77ffb7cb17d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 32027217)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5669-a2a5-8e7a-156ce1b3a75a	000e0000-5669-a2a5-f416-d9e23cf85136	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5669-a2a2-7b1e-9418e64ef42d
000d0000-5669-a2a5-23d9-e216a44bbd1e	000e0000-5669-a2a5-f416-d9e23cf85136	000c0000-5669-a2a5-439c-158fd8ba7e63	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5669-a2a2-7b1e-9418e64ef42d
000d0000-5669-a2a5-4e60-2e3e83f2a62f	000e0000-5669-a2a5-f416-d9e23cf85136	000c0000-5669-a2a5-151c-3d561905682e	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5669-a2a2-edfc-3982463ab1c0
000d0000-5669-a2a5-91ab-7d5a7290248d	000e0000-5669-a2a5-f416-d9e23cf85136	000c0000-5669-a2a5-c08f-a3e8e5bc585f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5669-a2a2-589d-87b5eb768cfe
000d0000-5669-a2a5-561f-ae8ea474ff78	000e0000-5669-a2a5-f416-d9e23cf85136	000c0000-5669-a2a5-4b68-e1f5030dadb8	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5669-a2a2-bb0f-6b19ba035302
000d0000-5669-a2a5-bb34-bd08cb3fc462	000e0000-5669-a2a5-f416-d9e23cf85136	000c0000-5669-a2a5-a664-4bfc7317538c	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5669-a2a2-bb0f-6b19ba035302
000d0000-5669-a2a5-1ba7-c116c190a295	000e0000-5669-a2a5-f416-d9e23cf85136	000c0000-5669-a2a5-32c0-3add98b49456	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5669-a2a2-7b1e-9418e64ef42d
000d0000-5669-a2a5-a745-62d195a3a23b	000e0000-5669-a2a5-f416-d9e23cf85136	000c0000-5669-a2a5-7487-40a4ad4fcb1e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5669-a2a2-4c4c-fa1dc5ddcae7
000d0000-5669-a2a5-3d87-1b127533a74a	000e0000-5669-a2a5-f416-d9e23cf85136	000c0000-5669-a2a5-1b7a-2a3e8b5c88b6	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5669-a2a2-b6de-1552e53beb41
\.


--
-- TOC entry 3124 (class 0 OID 32027008)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 32026974)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 32026951)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5669-a2a5-cdf1-ba656350b4a9	00080000-5669-a2a5-ca24-711f51d92484	00090000-5669-a2a5-0cc1-da0939de2438	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 32027131)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 32027676)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5669-a2a5-1dce-e1e3eef587ea	00010000-5669-a2a3-35c5-bd9278702f97	\N	Prva mapa	Root mapa	2015-12-10 17:04:53	2015-12-10 17:04:53	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 32027689)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32027711)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 32019540)
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
\.


--
-- TOC entry 3140 (class 0 OID 32027156)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 32026908)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5669-a2a3-cf9f-231f876d9411	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5669-a2a3-3e93-7ec4435458d2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5669-a2a3-55e4-9d23b14e26a6	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5669-a2a3-1eb3-fcd0157475b9	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5669-a2a3-7698-432976d291d4	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5669-a2a3-51ef-2ec0fe8f9e5f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5669-a2a3-6a3f-7732920c8aa8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5669-a2a3-53f6-bee5753c7f7a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5669-a2a3-8e4e-4115d0f29a10	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5669-a2a3-2ed2-0b2826c80c43	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5669-a2a3-54b6-81efc7d708fc	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5669-a2a3-7572-20173386624d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5669-a2a3-338d-a6c2355d257e	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5669-a2a3-8485-bd6bf866bb32	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5669-a2a4-6d76-7d8ebab13396	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5669-a2a4-f8ae-6acad62d2af6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5669-a2a4-7499-d5c4b4914711	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5669-a2a4-9f72-8997d107b2dd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5669-a2a4-b6d9-1bbd51be8b09	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5669-a2a7-32a6-30308a4f7fa7	application.tenant.maticnopodjetje	string	s:36:"00080000-5669-a2a7-ebc4-5e5e4c1cb69f";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 32026808)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5669-a2a4-7bf0-fdf4712730b7	00000000-5669-a2a4-6d76-7d8ebab13396	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5669-a2a4-100b-c44b5c578832	00000000-5669-a2a4-6d76-7d8ebab13396	00010000-5669-a2a3-35c5-bd9278702f97	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5669-a2a4-385b-3addcfdf30b2	00000000-5669-a2a4-f8ae-6acad62d2af6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 32026875)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5669-a2a5-bd64-0b16f2bd6679	\N	00100000-5669-a2a5-99ec-352070e7a587	00100000-5669-a2a5-3cfb-508504471a7c	01	Gledališče Nimbis
00410000-5669-a2a5-b1d9-9324982c9822	00410000-5669-a2a5-bd64-0b16f2bd6679	00100000-5669-a2a5-99ec-352070e7a587	00100000-5669-a2a5-3cfb-508504471a7c	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 32026819)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5669-a2a5-eef7-d3ba5cf06751	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5669-a2a5-2509-bc5e8f58c4ed	00010000-5669-a2a5-e940-7075066850d6	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5669-a2a5-54f2-15ad45ea45c8	00010000-5669-a2a5-d5fe-ae075f1533e5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5669-a2a5-5b13-388d6f306493	00010000-5669-a2a5-6c6d-b932098b82dd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5669-a2a5-fe3d-fe58ec38c4ed	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5669-a2a5-0aa9-ee78856b38f3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5669-a2a5-93a0-0d376cba94ff	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5669-a2a5-f0af-fcc8f2dc2740	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5669-a2a5-0cc1-da0939de2438	00010000-5669-a2a5-ec2a-e400fe8229c8	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5669-a2a5-2d64-969935dc7eb6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5669-a2a5-574f-cf1da41918b7	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5669-a2a5-6a37-4ba886b2ffa7	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5669-a2a5-aea5-9cd5ac26f015	00010000-5669-a2a5-f914-c36e62f92ac7	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5669-a2a5-84d2-a9d5cfcf3756	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-a2a5-4514-5c316a2640c4	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-a2a5-3f67-f76c8c4f5f40	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-a2a5-de72-995eec132cf1	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5669-a2a5-1fc8-86b67f1f9670	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5669-a2a5-ff23-b01e71939a1b	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-a2a5-a2b8-18d86bc67fb3	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5669-a2a5-3a1d-bd6d71fc1645	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 32026754)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5669-a2a2-cdf4-26fa2b996c32	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5669-a2a2-a7de-4d7f84363ac3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5669-a2a2-d172-ba241aaea9ff	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5669-a2a2-d0ff-5c4e3a8e16a5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5669-a2a2-8424-4367f196b363	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5669-a2a2-07e7-70b6a0d17112	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5669-a2a2-4ea7-98a5cabce3a9	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5669-a2a2-2762-351736196d57	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5669-a2a2-ec40-7fb7106bb49c	Abonma-read	Abonma - branje	t
00030000-5669-a2a2-be8f-f6d3d0122d67	Abonma-write	Abonma - spreminjanje	t
00030000-5669-a2a2-7e72-20f9fee95e09	Alternacija-read	Alternacija - branje	t
00030000-5669-a2a2-65b2-f810e72c2068	Alternacija-write	Alternacija - spreminjanje	t
00030000-5669-a2a2-2660-a69a11e4e685	Arhivalija-read	Arhivalija - branje	t
00030000-5669-a2a2-062a-dd3f19b0fa63	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5669-a2a2-3e5b-e28d17e89249	AuthStorage-read	AuthStorage - branje	t
00030000-5669-a2a2-3389-f6e25ab3efef	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5669-a2a2-d8ea-0b432aa11b91	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5669-a2a2-3ced-7825720b354a	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5669-a2a2-002e-3be9881a9f1c	Besedilo-read	Besedilo - branje	t
00030000-5669-a2a2-02e7-d10ab2bf6e20	Besedilo-write	Besedilo - spreminjanje	t
00030000-5669-a2a2-9f80-04f162d53578	Dogodek-read	Dogodek - branje	t
00030000-5669-a2a2-1fac-073a6c70b463	Dogodek-write	Dogodek - spreminjanje	t
00030000-5669-a2a2-6bb3-397a23eb5ff6	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5669-a2a2-ed93-82ca6c2d71e6	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5669-a2a2-e787-d72ad3100d76	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5669-a2a2-c8be-92463f3852b3	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5669-a2a2-e7dc-64c1ba5d2f06	DogodekTrait-read	DogodekTrait - branje	t
00030000-5669-a2a2-8359-5323b33fb68e	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5669-a2a2-79c5-a966aa4ba9b0	DrugiVir-read	DrugiVir - branje	t
00030000-5669-a2a2-654f-f6c7416580ee	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5669-a2a2-ab7a-faeafa3a98d5	Drzava-read	Drzava - branje	t
00030000-5669-a2a2-e56e-a4f40a452910	Drzava-write	Drzava - spreminjanje	t
00030000-5669-a2a2-d4da-2bfa08e57a9c	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5669-a2a2-127e-1e8bdc578a38	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5669-a2a2-07c2-c17c62ce824c	Funkcija-read	Funkcija - branje	t
00030000-5669-a2a2-236f-dc189a722444	Funkcija-write	Funkcija - spreminjanje	t
00030000-5669-a2a2-eb94-1f3a7d6f528f	Gostovanje-read	Gostovanje - branje	t
00030000-5669-a2a2-608e-a1dce9baafd6	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5669-a2a2-53b1-e4b7100dee2b	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5669-a2a2-bc29-d50063731591	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5669-a2a2-84de-54269c938126	Kupec-read	Kupec - branje	t
00030000-5669-a2a2-80b6-1a42ac4ad055	Kupec-write	Kupec - spreminjanje	t
00030000-5669-a2a2-e9bd-4be28dffdc69	NacinPlacina-read	NacinPlacina - branje	t
00030000-5669-a2a2-2245-04cb6a106991	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5669-a2a2-73fe-aebb1e47e2ee	Option-read	Option - branje	t
00030000-5669-a2a2-f512-89e75e057c02	Option-write	Option - spreminjanje	t
00030000-5669-a2a2-a264-19ac4b3309c6	OptionValue-read	OptionValue - branje	t
00030000-5669-a2a2-621b-12ad36f7b532	OptionValue-write	OptionValue - spreminjanje	t
00030000-5669-a2a2-831e-11a48e457214	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5669-a2a2-9cfa-e088e53e1cdc	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5669-a2a2-e9c9-6161d8e7c6a4	Oseba-read	Oseba - branje	t
00030000-5669-a2a2-16ad-1f0d96926f40	Oseba-write	Oseba - spreminjanje	t
00030000-5669-a2a2-caf9-93b94e25d57f	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5669-a2a2-1dc6-1fc5d5b7964a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5669-a2a2-aa63-d59937ec8892	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5669-a2a2-e70d-9cebe0e4c94b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5669-a2a2-7a39-6ef7941c7c29	Pogodba-read	Pogodba - branje	t
00030000-5669-a2a2-4aa3-100a4d64ca88	Pogodba-write	Pogodba - spreminjanje	t
00030000-5669-a2a2-fc9b-0e3f3dff44bc	Popa-read	Popa - branje	t
00030000-5669-a2a2-ab64-5938dbf9fed9	Popa-write	Popa - spreminjanje	t
00030000-5669-a2a2-e6b6-d2f3624579f8	Posta-read	Posta - branje	t
00030000-5669-a2a2-b80c-a5d0b81c91ac	Posta-write	Posta - spreminjanje	t
00030000-5669-a2a2-ccaa-9fc129056072	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5669-a2a2-826c-383f51f1983e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5669-a2a2-7fe7-d1217cf7781b	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5669-a2a2-11b2-68ad2f8c1b57	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5669-a2a2-db6d-74ba81bd8574	PostniNaslov-read	PostniNaslov - branje	t
00030000-5669-a2a2-c27c-2103c6eb80d5	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5669-a2a2-a0ef-2e4378925d01	Praznik-read	Praznik - branje	t
00030000-5669-a2a2-d1e0-e4b39ad015ab	Praznik-write	Praznik - spreminjanje	t
00030000-5669-a2a2-c516-a9e5f53f4992	Predstava-read	Predstava - branje	t
00030000-5669-a2a2-dda1-0ff03dbc0621	Predstava-write	Predstava - spreminjanje	t
00030000-5669-a2a2-ffeb-80036a43da03	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5669-a2a2-3337-629b934daf1c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5669-a2a2-3396-a907270416a2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5669-a2a2-53a6-e3967456fe1c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5669-a2a2-2d6b-6d638e64dda8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5669-a2a2-e4f6-3b4d9f108aa9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5669-a2a2-38d4-562166c52538	ProgramDela-read	ProgramDela - branje	t
00030000-5669-a2a2-1eac-1d1316075439	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5669-a2a2-13a1-f4d11f18852c	ProgramFestival-read	ProgramFestival - branje	t
00030000-5669-a2a2-b775-da38a71a5046	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5669-a2a2-04db-f77e691b9a7a	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5669-a2a2-db14-d145450d89f6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5669-a2a2-b7ab-47bff4909b50	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5669-a2a2-d656-160cb30b500f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5669-a2a2-df87-47d4b17f3076	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5669-a2a2-996d-87a436f6b247	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5669-a2a2-9ae7-d59e6925ab58	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5669-a2a2-9a36-1bcd99160c7b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5669-a2a2-1b35-0d7aff4f3853	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5669-a2a2-0305-44383724d897	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5669-a2a2-bd8d-cb3a022aca67	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5669-a2a2-f4bb-ef328c03b2e5	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5669-a2a2-a86c-83619336d10d	ProgramRazno-read	ProgramRazno - branje	t
00030000-5669-a2a2-1a62-969830ac3f8b	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5669-a2a2-7b5c-4bbdad23de1b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5669-a2a2-4aac-2a05c1795b67	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5669-a2a2-b87f-482fe04f7bba	Prostor-read	Prostor - branje	t
00030000-5669-a2a2-400a-703e55d8d2b9	Prostor-write	Prostor - spreminjanje	t
00030000-5669-a2a2-111c-06a1466e0a77	Racun-read	Racun - branje	t
00030000-5669-a2a2-c27d-359c5240b3cb	Racun-write	Racun - spreminjanje	t
00030000-5669-a2a2-197c-27fafaf5ec81	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5669-a2a2-189b-04375445187b	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5669-a2a2-0a39-1f710dd806a9	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5669-a2a2-01ad-44e7413a7e1a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5669-a2a2-d074-9919634b4f12	Rekvizit-read	Rekvizit - branje	t
00030000-5669-a2a2-42d2-149670f66b63	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5669-a2a2-08f1-78e143838d78	Revizija-read	Revizija - branje	t
00030000-5669-a2a2-8930-2c26d7c70b5f	Revizija-write	Revizija - spreminjanje	t
00030000-5669-a2a2-7745-9191f6943662	Rezervacija-read	Rezervacija - branje	t
00030000-5669-a2a2-8d45-be6d1e54893b	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5669-a2a2-9217-1dacb0717217	SedezniRed-read	SedezniRed - branje	t
00030000-5669-a2a2-361e-1b79e221001f	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5669-a2a2-2962-2f74f13f18cf	Sedez-read	Sedez - branje	t
00030000-5669-a2a2-6a52-6e9292eeff91	Sedez-write	Sedez - spreminjanje	t
00030000-5669-a2a2-7e03-abd062103b3f	Sezona-read	Sezona - branje	t
00030000-5669-a2a2-dc9d-7f8904ec0e68	Sezona-write	Sezona - spreminjanje	t
00030000-5669-a2a2-aa38-9c14fcb911a9	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5669-a2a2-e723-663d0ebb7df2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5669-a2a2-dfd6-d2d7fefa07f8	Telefonska-read	Telefonska - branje	t
00030000-5669-a2a2-c699-9e3d94361bbf	Telefonska-write	Telefonska - spreminjanje	t
00030000-5669-a2a2-adb1-1f93dba1a47f	TerminStoritve-read	TerminStoritve - branje	t
00030000-5669-a2a2-f5da-917e7035847f	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5669-a2a2-f271-8e501610921e	TipFunkcije-read	TipFunkcije - branje	t
00030000-5669-a2a2-4c07-7ad23e17997b	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5669-a2a2-b8d4-96a19eed7e0a	TipPopa-read	TipPopa - branje	t
00030000-5669-a2a2-bda8-30da5f23e62f	TipPopa-write	TipPopa - spreminjanje	t
00030000-5669-a2a2-63e9-900c7407764f	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5669-a2a2-0eee-c7bef204c0a9	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5669-a2a2-6f0f-caa011d8ef5a	TipVaje-read	TipVaje - branje	t
00030000-5669-a2a2-d997-6b4af127ca1c	TipVaje-write	TipVaje - spreminjanje	t
00030000-5669-a2a2-3a33-3de190f954c0	Trr-read	Trr - branje	t
00030000-5669-a2a2-a1ca-737aac811861	Trr-write	Trr - spreminjanje	t
00030000-5669-a2a2-5ae8-cb8b13e4cc16	Uprizoritev-read	Uprizoritev - branje	t
00030000-5669-a2a2-9b6d-edb5e220acf5	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5669-a2a2-d8e7-89460c261e85	Vaja-read	Vaja - branje	t
00030000-5669-a2a2-38cb-af88ad3ea1f7	Vaja-write	Vaja - spreminjanje	t
00030000-5669-a2a2-3ec7-72ec2a2a9595	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5669-a2a2-af2b-ee6f385bb1ce	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5669-a2a2-e7c2-06e6f472935f	VrstaStroska-read	VrstaStroska - branje	t
00030000-5669-a2a2-d378-20c7b6e8f5af	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5669-a2a2-4cb9-631c07effca6	Zaposlitev-read	Zaposlitev - branje	t
00030000-5669-a2a2-4282-60a5e1d09394	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5669-a2a2-5fbb-cc6a7658ff9f	Zasedenost-read	Zasedenost - branje	t
00030000-5669-a2a2-f096-2c9d5ec9fc10	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5669-a2a2-8c24-6e07d4a1a90e	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5669-a2a2-57d6-24aa90940ecc	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5669-a2a2-fc95-99dabd190a9b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5669-a2a2-8b29-ca622551570d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5669-a2a2-881a-0bdecd68888a	Job-read	Branje opravil - samo zase - branje	t
00030000-5669-a2a2-953b-c57efe539e33	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5669-a2a2-4ddd-e1b3dc04db7f	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5669-a2a2-dfcd-fab862a73bc3	Report-read	Report - branje	t
00030000-5669-a2a2-2cd9-1067449b3d6b	Report-write	Report - spreminjanje	t
00030000-5669-a2a2-19da-7e2315396984	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5669-a2a2-9760-15574270b3e8	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5669-a2a2-4bd3-44908439aac1	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5669-a2a2-933e-9a5a79f467fc	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5669-a2a2-bdd5-d879721ba202	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5669-a2a2-fc3e-a961939f9d4e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5669-a2a2-865f-492140c86d73	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5669-a2a2-f082-bc9c68da48ff	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5669-a2a2-def7-c786409a0f58	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5669-a2a2-4d17-78ccd4f48564	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5669-a2a2-ca5b-4fa32132b70b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5669-a2a2-3ec3-7663937b9589	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5669-a2a2-365d-d13a8ff16285	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5669-a2a2-8705-c9f567cee538	Datoteka-write	Datoteka - spreminjanje	t
00030000-5669-a2a2-d2ec-74917d2aebf0	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 32026773)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5669-a2a2-e7f7-d8a45eefcedd	00030000-5669-a2a2-a7de-4d7f84363ac3
00020000-5669-a2a2-e7f7-d8a45eefcedd	00030000-5669-a2a2-cdf4-26fa2b996c32
00020000-5669-a2a2-d7fe-d773049377ea	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-3ced-7825720b354a
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-02e7-d10ab2bf6e20
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-8705-c9f567cee538
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-4d17-78ccd4f48564
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-d8ea-0b432aa11b91
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-002e-3be9881a9f1c
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-07bb-e710ea21124f	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-0ae2-02e9384c6fa1	00030000-5669-a2a2-d8ea-0b432aa11b91
00020000-5669-a2a2-0ae2-02e9384c6fa1	00030000-5669-a2a2-002e-3be9881a9f1c
00020000-5669-a2a2-0ae2-02e9384c6fa1	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-0ae2-02e9384c6fa1	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-0ae2-02e9384c6fa1	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-7f04-44a715e2cd9b	00030000-5669-a2a2-4cb9-631c07effca6
00020000-5669-a2a2-7f04-44a715e2cd9b	00030000-5669-a2a2-4282-60a5e1d09394
00020000-5669-a2a2-7f04-44a715e2cd9b	00030000-5669-a2a2-07e7-70b6a0d17112
00020000-5669-a2a2-7f04-44a715e2cd9b	00030000-5669-a2a2-8424-4367f196b363
00020000-5669-a2a2-7f04-44a715e2cd9b	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-7f04-44a715e2cd9b	00030000-5669-a2a2-16ad-1f0d96926f40
00020000-5669-a2a2-7f04-44a715e2cd9b	00030000-5669-a2a2-831e-11a48e457214
00020000-5669-a2a2-fe6f-f2d3db9da162	00030000-5669-a2a2-4cb9-631c07effca6
00020000-5669-a2a2-fe6f-f2d3db9da162	00030000-5669-a2a2-07e7-70b6a0d17112
00020000-5669-a2a2-fe6f-f2d3db9da162	00030000-5669-a2a2-831e-11a48e457214
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-16ad-1f0d96926f40
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-db6d-74ba81bd8574
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-c27c-2103c6eb80d5
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-dfd6-d2d7fefa07f8
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-c699-9e3d94361bbf
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-8705-c9f567cee538
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-4d17-78ccd4f48564
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-3344-beced14c2c82	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a2-fedd-b56f28dcc5a6	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-fedd-b56f28dcc5a6	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-fedd-b56f28dcc5a6	00030000-5669-a2a2-db6d-74ba81bd8574
00020000-5669-a2a2-fedd-b56f28dcc5a6	00030000-5669-a2a2-dfd6-d2d7fefa07f8
00020000-5669-a2a2-fedd-b56f28dcc5a6	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-fedd-b56f28dcc5a6	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-fedd-b56f28dcc5a6	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-739c-83969242a6aa	00030000-5669-a2a2-16ad-1f0d96926f40
00020000-5669-a2a2-739c-83969242a6aa	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-739c-83969242a6aa	00030000-5669-a2a2-07e7-70b6a0d17112
00020000-5669-a2a2-739c-83969242a6aa	00030000-5669-a2a2-8424-4367f196b363
00020000-5669-a2a2-739c-83969242a6aa	00030000-5669-a2a2-3a33-3de190f954c0
00020000-5669-a2a2-739c-83969242a6aa	00030000-5669-a2a2-a1ca-737aac811861
00020000-5669-a2a2-739c-83969242a6aa	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-0d11-831a1dc7edd2	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-0d11-831a1dc7edd2	00030000-5669-a2a2-07e7-70b6a0d17112
00020000-5669-a2a2-0d11-831a1dc7edd2	00030000-5669-a2a2-3a33-3de190f954c0
00020000-5669-a2a2-0d11-831a1dc7edd2	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-dfd6-d2d7fefa07f8
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-db6d-74ba81bd8574
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-3a33-3de190f954c0
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-53b1-e4b7100dee2b
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-c699-9e3d94361bbf
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-c27c-2103c6eb80d5
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-a1ca-737aac811861
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-ab64-5938dbf9fed9
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-8705-c9f567cee538
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-4d17-78ccd4f48564
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-bc29-d50063731591
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-e4f6-3b4d9f108aa9
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-8850-aef69db11df1	00030000-5669-a2a2-b8d4-96a19eed7e0a
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-dfd6-d2d7fefa07f8
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-db6d-74ba81bd8574
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-3a33-3de190f954c0
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-53b1-e4b7100dee2b
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-e85e-b8365b3983d5	00030000-5669-a2a2-b8d4-96a19eed7e0a
00020000-5669-a2a2-3036-91d82a9b43b0	00030000-5669-a2a2-b8d4-96a19eed7e0a
00020000-5669-a2a2-3036-91d82a9b43b0	00030000-5669-a2a2-bda8-30da5f23e62f
00020000-5669-a2a2-263f-461601d9e95c	00030000-5669-a2a2-b8d4-96a19eed7e0a
00020000-5669-a2a2-5c16-3929aac99680	00030000-5669-a2a2-e6b6-d2f3624579f8
00020000-5669-a2a2-5c16-3929aac99680	00030000-5669-a2a2-b80c-a5d0b81c91ac
00020000-5669-a2a2-de3d-5f5427a0decb	00030000-5669-a2a2-e6b6-d2f3624579f8
00020000-5669-a2a2-3fd2-99153c6a965f	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-3fd2-99153c6a965f	00030000-5669-a2a2-e56e-a4f40a452910
00020000-5669-a2a2-716c-4c5572284631	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-65b1-f871904e645b	00030000-5669-a2a2-fc95-99dabd190a9b
00020000-5669-a2a2-65b1-f871904e645b	00030000-5669-a2a2-8b29-ca622551570d
00020000-5669-a2a2-b9b8-595cb00f041c	00030000-5669-a2a2-fc95-99dabd190a9b
00020000-5669-a2a2-88a6-5cd2d1cb624a	00030000-5669-a2a2-8c24-6e07d4a1a90e
00020000-5669-a2a2-88a6-5cd2d1cb624a	00030000-5669-a2a2-57d6-24aa90940ecc
00020000-5669-a2a2-4405-fd93ac184fcc	00030000-5669-a2a2-8c24-6e07d4a1a90e
00020000-5669-a2a2-e47f-c034100536e8	00030000-5669-a2a2-ec40-7fb7106bb49c
00020000-5669-a2a2-e47f-c034100536e8	00030000-5669-a2a2-be8f-f6d3d0122d67
00020000-5669-a2a2-965f-3715f3eaa1a7	00030000-5669-a2a2-ec40-7fb7106bb49c
00020000-5669-a2a2-f405-c3605136529a	00030000-5669-a2a2-b87f-482fe04f7bba
00020000-5669-a2a2-f405-c3605136529a	00030000-5669-a2a2-400a-703e55d8d2b9
00020000-5669-a2a2-f405-c3605136529a	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a2-f405-c3605136529a	00030000-5669-a2a2-db6d-74ba81bd8574
00020000-5669-a2a2-f405-c3605136529a	00030000-5669-a2a2-c27c-2103c6eb80d5
00020000-5669-a2a2-f405-c3605136529a	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-bed2-713aefc36979	00030000-5669-a2a2-b87f-482fe04f7bba
00020000-5669-a2a2-bed2-713aefc36979	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a2-bed2-713aefc36979	00030000-5669-a2a2-db6d-74ba81bd8574
00020000-5669-a2a2-549f-72a739c4c8ce	00030000-5669-a2a2-e7c2-06e6f472935f
00020000-5669-a2a2-549f-72a739c4c8ce	00030000-5669-a2a2-d378-20c7b6e8f5af
00020000-5669-a2a2-f54c-b13b0a169558	00030000-5669-a2a2-e7c2-06e6f472935f
00020000-5669-a2a2-dd94-d64ef21c963e	00030000-5669-a2a2-9cfa-e088e53e1cdc
00020000-5669-a2a2-dd94-d64ef21c963e	00030000-5669-a2a2-831e-11a48e457214
00020000-5669-a2a2-dd94-d64ef21c963e	00030000-5669-a2a2-4cb9-631c07effca6
00020000-5669-a2a2-dd94-d64ef21c963e	00030000-5669-a2a2-8705-c9f567cee538
00020000-5669-a2a2-dd94-d64ef21c963e	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-dd94-d64ef21c963e	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a2-dd94-d64ef21c963e	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-dd94-d64ef21c963e	00030000-5669-a2a2-4d17-78ccd4f48564
00020000-5669-a2a2-dd94-d64ef21c963e	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-2238-c16eca689b2b	00030000-5669-a2a2-831e-11a48e457214
00020000-5669-a2a2-2238-c16eca689b2b	00030000-5669-a2a2-4cb9-631c07effca6
00020000-5669-a2a2-2238-c16eca689b2b	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-2238-c16eca689b2b	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-2238-c16eca689b2b	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-dd39-0466ab19cd18	00030000-5669-a2a2-6f0f-caa011d8ef5a
00020000-5669-a2a2-dd39-0466ab19cd18	00030000-5669-a2a2-d997-6b4af127ca1c
00020000-5669-a2a2-fa80-2753fca06c34	00030000-5669-a2a2-6f0f-caa011d8ef5a
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-4ea7-98a5cabce3a9
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-2762-351736196d57
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-38d4-562166c52538
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-1eac-1d1316075439
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-13a1-f4d11f18852c
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-b775-da38a71a5046
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-04db-f77e691b9a7a
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-db14-d145450d89f6
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-b7ab-47bff4909b50
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-d656-160cb30b500f
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-df87-47d4b17f3076
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-996d-87a436f6b247
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-9ae7-d59e6925ab58
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-9a36-1bcd99160c7b
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-1b35-0d7aff4f3853
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-0305-44383724d897
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-bd8d-cb3a022aca67
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-f4bb-ef328c03b2e5
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-a86c-83619336d10d
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-1a62-969830ac3f8b
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-7b5c-4bbdad23de1b
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-4aac-2a05c1795b67
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-53a6-e3967456fe1c
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-654f-f6c7416580ee
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-826c-383f51f1983e
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-953b-c57efe539e33
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-79c5-a966aa4ba9b0
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-3396-a907270416a2
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-ccaa-9fc129056072
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-e7c2-06e6f472935f
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-aa38-9c14fcb911a9
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-07c2-c17c62ce824c
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-7e72-20f9fee95e09
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-f271-8e501610921e
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-7a39-6ef7941c7c29
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-8705-c9f567cee538
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-4d17-78ccd4f48564
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-881a-0bdecd68888a
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-edb1-f564c3296618	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-38d4-562166c52538
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-13a1-f4d11f18852c
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-04db-f77e691b9a7a
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-b7ab-47bff4909b50
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-df87-47d4b17f3076
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-9ae7-d59e6925ab58
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-1b35-0d7aff4f3853
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-bd8d-cb3a022aca67
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-a86c-83619336d10d
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-7b5c-4bbdad23de1b
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-3396-a907270416a2
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-79c5-a966aa4ba9b0
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-ccaa-9fc129056072
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-881a-0bdecd68888a
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-09eb-74f9ef70f1ac	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-9b6d-edb5e220acf5
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-7e72-20f9fee95e09
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-65b2-f810e72c2068
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-002e-3be9881a9f1c
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-07c2-c17c62ce824c
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-236f-dc189a722444
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-f271-8e501610921e
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-8705-c9f567cee538
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a2-e376-8e5cee8c56ab	00030000-5669-a2a2-4d17-78ccd4f48564
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-7e72-20f9fee95e09
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-002e-3be9881a9f1c
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-07c2-c17c62ce824c
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-f271-8e501610921e
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-7e72-20f9fee95e09
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-65b2-f810e72c2068
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-07c2-c17c62ce824c
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-07e7-70b6a0d17112
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-8424-4367f196b363
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-7a39-6ef7941c7c29
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-4aa3-100a4d64ca88
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-aa38-9c14fcb911a9
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-e723-663d0ebb7df2
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-f271-8e501610921e
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-3a33-3de190f954c0
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a3-ed07-a100b89b38bc	00030000-5669-a2a2-4cb9-631c07effca6
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-7e72-20f9fee95e09
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-07c2-c17c62ce824c
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-07e7-70b6a0d17112
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-7a39-6ef7941c7c29
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-aa38-9c14fcb911a9
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-f271-8e501610921e
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-3a33-3de190f954c0
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a3-5c75-e9f71e121abb	00030000-5669-a2a2-4cb9-631c07effca6
00020000-5669-a2a3-35a5-edd272983016	00030000-5669-a2a2-aa38-9c14fcb911a9
00020000-5669-a2a3-35a5-edd272983016	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a3-35a5-edd272983016	00030000-5669-a2a2-07c2-c17c62ce824c
00020000-5669-a2a3-35a5-edd272983016	00030000-5669-a2a2-7a39-6ef7941c7c29
00020000-5669-a2a3-35a5-edd272983016	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a3-35a5-edd272983016	00030000-5669-a2a2-f271-8e501610921e
00020000-5669-a2a3-35a5-edd272983016	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a3-5555-b0a51e551da2	00030000-5669-a2a2-aa38-9c14fcb911a9
00020000-5669-a2a3-5555-b0a51e551da2	00030000-5669-a2a2-e723-663d0ebb7df2
00020000-5669-a2a3-5555-b0a51e551da2	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a3-5555-b0a51e551da2	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a3-c100-df18bc9ad9ce	00030000-5669-a2a2-aa38-9c14fcb911a9
00020000-5669-a2a3-c100-df18bc9ad9ce	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-ec40-7fb7106bb49c
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-7e72-20f9fee95e09
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-d8ea-0b432aa11b91
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-3ced-7825720b354a
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-002e-3be9881a9f1c
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-02e7-d10ab2bf6e20
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-8705-c9f567cee538
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-07c2-c17c62ce824c
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-53b1-e4b7100dee2b
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-831e-11a48e457214
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-16ad-1f0d96926f40
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-e6b6-d2f3624579f8
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-db6d-74ba81bd8574
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-c27c-2103c6eb80d5
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-b87f-482fe04f7bba
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-dfd6-d2d7fefa07f8
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-c699-9e3d94361bbf
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-f271-8e501610921e
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-b8d4-96a19eed7e0a
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-6f0f-caa011d8ef5a
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-3a33-3de190f954c0
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-e7c2-06e6f472935f
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-4d17-78ccd4f48564
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-4cb9-631c07effca6
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-8c24-6e07d4a1a90e
00020000-5669-a2a3-decd-91a366fad756	00030000-5669-a2a2-fc95-99dabd190a9b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-cdf4-26fa2b996c32
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-a7de-4d7f84363ac3
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-ec40-7fb7106bb49c
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-be8f-f6d3d0122d67
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-7e72-20f9fee95e09
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-65b2-f810e72c2068
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-2660-a69a11e4e685
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-062a-dd3f19b0fa63
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-3e5b-e28d17e89249
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-3389-f6e25ab3efef
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d8ea-0b432aa11b91
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-3ced-7825720b354a
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-002e-3be9881a9f1c
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-02e7-d10ab2bf6e20
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-8705-c9f567cee538
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-9f80-04f162d53578
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d0ff-5c4e3a8e16a5
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-1fac-073a6c70b463
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-6bb3-397a23eb5ff6
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-ed93-82ca6c2d71e6
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-e787-d72ad3100d76
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-c8be-92463f3852b3
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-79c5-a966aa4ba9b0
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-654f-f6c7416580ee
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-ab7a-faeafa3a98d5
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-e56e-a4f40a452910
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d4da-2bfa08e57a9c
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-127e-1e8bdc578a38
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-07c2-c17c62ce824c
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-236f-dc189a722444
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-eb94-1f3a7d6f528f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-608e-a1dce9baafd6
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-4ddd-e1b3dc04db7f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-881a-0bdecd68888a
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-953b-c57efe539e33
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-53b1-e4b7100dee2b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-bc29-d50063731591
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-84de-54269c938126
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-80b6-1a42ac4ad055
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-9760-15574270b3e8
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-4bd3-44908439aac1
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-933e-9a5a79f467fc
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-bdd5-d879721ba202
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-865f-492140c86d73
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-fc3e-a961939f9d4e
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-e9bd-4be28dffdc69
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-2245-04cb6a106991
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-73fe-aebb1e47e2ee
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-f512-89e75e057c02
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-a264-19ac4b3309c6
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-621b-12ad36f7b532
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-831e-11a48e457214
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-9cfa-e088e53e1cdc
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-8424-4367f196b363
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-16ad-1f0d96926f40
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-caf9-93b94e25d57f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-1dc6-1fc5d5b7964a
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-aa63-d59937ec8892
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-e70d-9cebe0e4c94b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-7a39-6ef7941c7c29
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-4aa3-100a4d64ca88
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-ab64-5938dbf9fed9
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-e6b6-d2f3624579f8
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-b80c-a5d0b81c91ac
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-ccaa-9fc129056072
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-826c-383f51f1983e
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-7fe7-d1217cf7781b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-11b2-68ad2f8c1b57
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-db6d-74ba81bd8574
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-c27c-2103c6eb80d5
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-a0ef-2e4378925d01
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d1e0-e4b39ad015ab
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-c516-a9e5f53f4992
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-dda1-0ff03dbc0621
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-ffeb-80036a43da03
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-3337-629b934daf1c
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-3396-a907270416a2
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-53a6-e3967456fe1c
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-2d6b-6d638e64dda8
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-e4f6-3b4d9f108aa9
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-4ea7-98a5cabce3a9
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-38d4-562166c52538
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-2762-351736196d57
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-1eac-1d1316075439
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-13a1-f4d11f18852c
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-b775-da38a71a5046
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-04db-f77e691b9a7a
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-db14-d145450d89f6
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-b7ab-47bff4909b50
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d656-160cb30b500f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-df87-47d4b17f3076
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-996d-87a436f6b247
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-9ae7-d59e6925ab58
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-9a36-1bcd99160c7b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-1b35-0d7aff4f3853
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-0305-44383724d897
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-bd8d-cb3a022aca67
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-f4bb-ef328c03b2e5
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-a86c-83619336d10d
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-1a62-969830ac3f8b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-7b5c-4bbdad23de1b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-4aac-2a05c1795b67
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-b87f-482fe04f7bba
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-400a-703e55d8d2b9
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-111c-06a1466e0a77
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-c27d-359c5240b3cb
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-197c-27fafaf5ec81
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-189b-04375445187b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d074-9919634b4f12
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-42d2-149670f66b63
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-0a39-1f710dd806a9
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-01ad-44e7413a7e1a
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-dfcd-fab862a73bc3
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-2cd9-1067449b3d6b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-08f1-78e143838d78
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-8930-2c26d7c70b5f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-7745-9191f6943662
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-8d45-be6d1e54893b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-2962-2f74f13f18cf
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-6a52-6e9292eeff91
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-9217-1dacb0717217
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-361e-1b79e221001f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-7e03-abd062103b3f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-dc9d-7f8904ec0e68
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-19da-7e2315396984
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-aa38-9c14fcb911a9
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-e723-663d0ebb7df2
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-dfd6-d2d7fefa07f8
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-c699-9e3d94361bbf
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-adb1-1f93dba1a47f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d172-ba241aaea9ff
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-f5da-917e7035847f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-f271-8e501610921e
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-4c07-7ad23e17997b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-b8d4-96a19eed7e0a
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-bda8-30da5f23e62f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-63e9-900c7407764f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-0eee-c7bef204c0a9
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-6f0f-caa011d8ef5a
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d997-6b4af127ca1c
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-3a33-3de190f954c0
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-a1ca-737aac811861
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-9b6d-edb5e220acf5
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d8e7-89460c261e85
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-38cb-af88ad3ea1f7
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-3ec7-72ec2a2a9595
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-af2b-ee6f385bb1ce
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-e7c2-06e6f472935f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-d378-20c7b6e8f5af
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-365d-d13a8ff16285
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-3ec3-7663937b9589
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-4d17-78ccd4f48564
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-4cb9-631c07effca6
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-4282-60a5e1d09394
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-5fbb-cc6a7658ff9f
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-f096-2c9d5ec9fc10
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-8c24-6e07d4a1a90e
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-57d6-24aa90940ecc
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-fc95-99dabd190a9b
00020000-5669-a2a4-6f8c-a638bc77e1d3	00030000-5669-a2a2-8b29-ca622551570d
00020000-5669-a2a4-4dd2-3179ad1af709	00030000-5669-a2a2-ca5b-4fa32132b70b
00020000-5669-a2a4-c7fa-4cd2b8cd6ac2	00030000-5669-a2a2-4d17-78ccd4f48564
00020000-5669-a2a4-39cb-6f1e3be74077	00030000-5669-a2a2-9b6d-edb5e220acf5
00020000-5669-a2a4-c7a5-0e2b0036592f	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a4-5a1d-48ef17e9d992	00030000-5669-a2a2-4bd3-44908439aac1
00020000-5669-a2a4-37b7-7e22e65a13f4	00030000-5669-a2a2-933e-9a5a79f467fc
00020000-5669-a2a4-9e36-a50dae8b0559	00030000-5669-a2a2-bdd5-d879721ba202
00020000-5669-a2a4-05d5-5a81e0918433	00030000-5669-a2a2-9760-15574270b3e8
00020000-5669-a2a4-ddac-71f4aeee5b59	00030000-5669-a2a2-865f-492140c86d73
00020000-5669-a2a4-78cd-b49aaa246cbf	00030000-5669-a2a2-fc3e-a961939f9d4e
00020000-5669-a2a4-68ee-a9037742b773	00030000-5669-a2a2-def7-c786409a0f58
00020000-5669-a2a4-5ef9-02c320234e7f	00030000-5669-a2a2-f082-bc9c68da48ff
00020000-5669-a2a4-3095-0f0af0e1c6e5	00030000-5669-a2a2-e9c9-6161d8e7c6a4
00020000-5669-a2a4-a439-4b1ee55fe866	00030000-5669-a2a2-16ad-1f0d96926f40
00020000-5669-a2a4-d5e7-125decda5830	00030000-5669-a2a2-8424-4367f196b363
00020000-5669-a2a4-b647-f7271ea08c22	00030000-5669-a2a2-07e7-70b6a0d17112
00020000-5669-a2a4-454f-a6b942512cb0	00030000-5669-a2a2-8705-c9f567cee538
00020000-5669-a2a4-5ace-b0b6bb488627	00030000-5669-a2a2-d2ec-74917d2aebf0
00020000-5669-a2a4-6e08-5c3b2bac1e6d	00030000-5669-a2a2-fc9b-0e3f3dff44bc
00020000-5669-a2a4-6e08-5c3b2bac1e6d	00030000-5669-a2a2-ab64-5938dbf9fed9
00020000-5669-a2a4-6e08-5c3b2bac1e6d	00030000-5669-a2a2-5ae8-cb8b13e4cc16
00020000-5669-a2a4-ee59-6d4f084c6289	00030000-5669-a2a2-3a33-3de190f954c0
00020000-5669-a2a4-3ec2-bd84b5e45135	00030000-5669-a2a2-a1ca-737aac811861
00020000-5669-a2a4-31d1-08e8361da0a4	00030000-5669-a2a2-19da-7e2315396984
00020000-5669-a2a4-e66f-de71a501b273	00030000-5669-a2a2-dfd6-d2d7fefa07f8
00020000-5669-a2a4-336e-0bf71e1c86d1	00030000-5669-a2a2-c699-9e3d94361bbf
00020000-5669-a2a4-faa5-3163a4c5a97f	00030000-5669-a2a2-db6d-74ba81bd8574
00020000-5669-a2a4-b29e-05fafd8d9527	00030000-5669-a2a2-c27c-2103c6eb80d5
00020000-5669-a2a4-161f-4076af443843	00030000-5669-a2a2-4cb9-631c07effca6
00020000-5669-a2a4-cc14-9ec26740b338	00030000-5669-a2a2-4282-60a5e1d09394
00020000-5669-a2a4-88c6-8157c0cb2b79	00030000-5669-a2a2-7a39-6ef7941c7c29
00020000-5669-a2a4-86bd-e02597e11a39	00030000-5669-a2a2-4aa3-100a4d64ca88
00020000-5669-a2a4-52fe-6f5a818d5e99	00030000-5669-a2a2-aa38-9c14fcb911a9
00020000-5669-a2a4-e55f-65694ad28cae	00030000-5669-a2a2-e723-663d0ebb7df2
00020000-5669-a2a4-73ce-82690b2588fc	00030000-5669-a2a2-7e72-20f9fee95e09
00020000-5669-a2a4-2428-21bc100aa4e2	00030000-5669-a2a2-65b2-f810e72c2068
\.


--
-- TOC entry 3141 (class 0 OID 32027163)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32027197)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 32027334)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5669-a2a5-fa4a-c1760029d376	00090000-5669-a2a5-eef7-d3ba5cf06751	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5669-a2a5-407b-c6c03f8fc2bd	00090000-5669-a2a5-0aa9-ee78856b38f3	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5669-a2a5-31cf-4629de5c66ae	00090000-5669-a2a5-aea5-9cd5ac26f015	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5669-a2a5-02cb-dc015d7e4695	00090000-5669-a2a5-2d64-969935dc7eb6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 32026855)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5669-a2a5-ca24-711f51d92484	\N	00040000-5669-a2a2-46bf-9fbb95d8ff90	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-a2a5-7200-4b7b6abe8452	\N	00040000-5669-a2a2-46bf-9fbb95d8ff90	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5669-a2a5-7213-5815c79c5111	\N	00040000-5669-a2a2-46bf-9fbb95d8ff90	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-a2a5-429f-c552d673bbc4	\N	00040000-5669-a2a2-46bf-9fbb95d8ff90	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-a2a5-0951-e46e32b10eac	\N	00040000-5669-a2a2-46bf-9fbb95d8ff90	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-a2a5-f195-211ce870c6fa	\N	00040000-5669-a2a2-2f9a-3e3d86a1e55a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-a2a5-c823-31b516b485a3	\N	00040000-5669-a2a2-a001-e51fbcd8ac78	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-a2a5-cf10-7a21a12b0de3	\N	00040000-5669-a2a2-d5fa-57296f4d1f33	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-a2a5-fcba-46f5a306814c	\N	00040000-5669-a2a2-b368-d5bcbf96df86	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5669-a2a7-ebc4-5e5e4c1cb69f	\N	00040000-5669-a2a2-46bf-9fbb95d8ff90	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 32026900)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5669-a2a1-516a-d2a5aa9f238e	8341	Adlešiči
00050000-5669-a2a1-8e77-a77e646c740e	5270	Ajdovščina
00050000-5669-a2a1-5a6b-8a875849c949	6280	Ankaran/Ancarano
00050000-5669-a2a1-b38d-c64c03a48337	9253	Apače
00050000-5669-a2a1-80dc-9a45b43702ad	8253	Artiče
00050000-5669-a2a1-58c3-c86fda21f844	4275	Begunje na Gorenjskem
00050000-5669-a2a1-38b0-77a9fe59859b	1382	Begunje pri Cerknici
00050000-5669-a2a1-2715-129ad7341dbb	9231	Beltinci
00050000-5669-a2a1-cec5-56eae93121ed	2234	Benedikt
00050000-5669-a2a1-0e7d-8ac8d7aadad6	2345	Bistrica ob Dravi
00050000-5669-a2a1-5f23-6717ebd8bb89	3256	Bistrica ob Sotli
00050000-5669-a2a1-b5a7-0954357c1a1f	8259	Bizeljsko
00050000-5669-a2a1-4af5-a8076eccd8f3	1223	Blagovica
00050000-5669-a2a1-e0dc-66e855d68016	8283	Blanca
00050000-5669-a2a1-9435-5c7377eb7c46	4260	Bled
00050000-5669-a2a1-afdd-d9ee631ebe8e	4273	Blejska Dobrava
00050000-5669-a2a1-5e56-0b93a519f359	9265	Bodonci
00050000-5669-a2a1-4244-ffb23a5ccb83	9222	Bogojina
00050000-5669-a2a1-3cd6-5f3825833ab2	4263	Bohinjska Bela
00050000-5669-a2a1-4054-d9b3a7ce59d8	4264	Bohinjska Bistrica
00050000-5669-a2a1-5695-2bf35811cec8	4265	Bohinjsko jezero
00050000-5669-a2a1-79b2-4fc2092435eb	1353	Borovnica
00050000-5669-a2a1-99ba-d6c770f90eb8	8294	Boštanj
00050000-5669-a2a1-e997-f64a814bbac5	5230	Bovec
00050000-5669-a2a1-c8c1-20660c38dec3	5295	Branik
00050000-5669-a2a1-149e-751fb155386f	3314	Braslovče
00050000-5669-a2a1-1bc9-c86bb3e3807c	5223	Breginj
00050000-5669-a2a1-a595-0678be592194	8280	Brestanica
00050000-5669-a2a1-f353-df875314d022	2354	Bresternica
00050000-5669-a2a1-498e-714d3be89268	4243	Brezje
00050000-5669-a2a1-6247-3466ddf7537c	1351	Brezovica pri Ljubljani
00050000-5669-a2a1-77e6-5fabf6d74b62	8250	Brežice
00050000-5669-a2a1-c17c-756c76b9912c	4210	Brnik - Aerodrom
00050000-5669-a2a1-7757-643b1e83ac57	8321	Brusnice
00050000-5669-a2a1-fb2c-31381c88d1e3	3255	Buče
00050000-5669-a2a1-90c0-90f72b299ef4	8276	Bučka 
00050000-5669-a2a1-8727-9739c59ab3cf	9261	Cankova
00050000-5669-a2a1-0625-c98c70c2a576	3000	Celje 
00050000-5669-a2a1-d522-938dd1494ee3	3001	Celje - poštni predali
00050000-5669-a2a1-95c0-9658215f2476	4207	Cerklje na Gorenjskem
00050000-5669-a2a1-9d36-c4b21feea05d	8263	Cerklje ob Krki
00050000-5669-a2a1-6cd0-3280fc0d3dde	1380	Cerknica
00050000-5669-a2a1-b2c4-4a1da30a1cf1	5282	Cerkno
00050000-5669-a2a1-9b7f-fc2812c1704c	2236	Cerkvenjak
00050000-5669-a2a1-ca5a-8e304cde652e	2215	Ceršak
00050000-5669-a2a1-8dcd-c11f459f28e3	2326	Cirkovce
00050000-5669-a2a1-e5b0-8a0bbf8e9af5	2282	Cirkulane
00050000-5669-a2a1-52db-252aa7a3bc61	5273	Col
00050000-5669-a2a1-9619-2bbde5bf9242	8251	Čatež ob Savi
00050000-5669-a2a1-7976-cca0d859a681	1413	Čemšenik
00050000-5669-a2a1-f39d-d26ba84838d4	5253	Čepovan
00050000-5669-a2a1-5493-89c49e367123	9232	Črenšovci
00050000-5669-a2a1-c3c2-11fbd1b5a3a9	2393	Črna na Koroškem
00050000-5669-a2a1-bfe8-837eedace674	6275	Črni Kal
00050000-5669-a2a1-a02b-17b2d75e71d3	5274	Črni Vrh nad Idrijo
00050000-5669-a2a1-c2a2-45fb0180be92	5262	Črniče
00050000-5669-a2a1-bcc4-d6138659a317	8340	Črnomelj
00050000-5669-a2a1-dd04-890b04dc7847	6271	Dekani
00050000-5669-a2a1-9f94-c1db056cb4a5	5210	Deskle
00050000-5669-a2a1-cb8d-a072bce55472	2253	Destrnik
00050000-5669-a2a1-0112-31c5afc67127	6215	Divača
00050000-5669-a2a1-4a4a-194e655932b7	1233	Dob
00050000-5669-a2a1-c4b8-1e2623f1f850	3224	Dobje pri Planini
00050000-5669-a2a1-4b50-cd319722b65e	8257	Dobova
00050000-5669-a2a1-bbb5-b8a36654dbfa	1423	Dobovec
00050000-5669-a2a1-34f0-539d20e51742	5263	Dobravlje
00050000-5669-a2a1-f017-87c17a69368d	3204	Dobrna
00050000-5669-a2a1-2057-4ba73c5075c1	8211	Dobrnič
00050000-5669-a2a1-3371-7ad930d33cf8	1356	Dobrova
00050000-5669-a2a1-723b-819d9d3e968a	9223	Dobrovnik/Dobronak 
00050000-5669-a2a1-fecb-99d09afc9b09	5212	Dobrovo v Brdih
00050000-5669-a2a1-d39a-e9cb678f369c	1431	Dol pri Hrastniku
00050000-5669-a2a1-ed35-bcabd950a103	1262	Dol pri Ljubljani
00050000-5669-a2a1-0eb1-f1d659306989	1273	Dole pri Litiji
00050000-5669-a2a1-8790-4e37867a197c	1331	Dolenja vas
00050000-5669-a2a1-5c58-7284ad4d7c9f	8350	Dolenjske Toplice
00050000-5669-a2a1-275f-b0962a24f34f	1230	Domžale
00050000-5669-a2a1-efa4-0bae9d30b326	2252	Dornava
00050000-5669-a2a1-e659-a86883d7afd6	5294	Dornberk
00050000-5669-a2a1-c977-06eedc611a9a	1319	Draga
00050000-5669-a2a1-09f9-14055e033cb4	8343	Dragatuš
00050000-5669-a2a1-b1ed-4f0bad473585	3222	Dramlje
00050000-5669-a2a1-b2b0-6e741b48f701	2370	Dravograd
00050000-5669-a2a1-d20a-22040fedd873	4203	Duplje
00050000-5669-a2a1-ff22-d9d57e9bb5e2	6221	Dutovlje
00050000-5669-a2a1-1c9e-c39a02b6b9e6	8361	Dvor
00050000-5669-a2a1-6350-fa9f608c06c7	2343	Fala
00050000-5669-a2a1-8e2d-9fe884b70f7a	9208	Fokovci
00050000-5669-a2a1-9849-2cab1605f8c3	2313	Fram
00050000-5669-a2a1-c0ac-d969162515a8	3213	Frankolovo
00050000-5669-a2a1-6e4a-7860eb937de7	1274	Gabrovka
00050000-5669-a2a1-bb64-4ca930c689f8	8254	Globoko
00050000-5669-a2a1-cdca-a8b0451d219a	5275	Godovič
00050000-5669-a2a1-3cf8-e7bed43c32a5	4204	Golnik
00050000-5669-a2a1-4464-dcc2caeb7ff3	3303	Gomilsko
00050000-5669-a2a1-4fdd-0c0150aacf90	4224	Gorenja vas
00050000-5669-a2a1-093e-1f88739f58d3	3263	Gorica pri Slivnici
00050000-5669-a2a1-733c-29403b02e6b3	2272	Gorišnica
00050000-5669-a2a1-2775-02955ab7b653	9250	Gornja Radgona
00050000-5669-a2a1-5af5-0ac2ba2b1950	3342	Gornji Grad
00050000-5669-a2a1-e047-09b7db986008	4282	Gozd Martuljek
00050000-5669-a2a1-f50c-c94ca6a064b7	6272	Gračišče
00050000-5669-a2a1-9a79-8ad048cbf28a	9264	Grad
00050000-5669-a2a1-6be9-93229746cdf0	8332	Gradac
00050000-5669-a2a1-8a47-19bbfddfd936	1384	Grahovo
00050000-5669-a2a1-5787-e9dae3f3396b	5242	Grahovo ob Bači
00050000-5669-a2a1-b012-2c725bb91de1	5251	Grgar
00050000-5669-a2a1-553d-77f57ce1584b	3302	Griže
00050000-5669-a2a1-ccfa-142f5769c747	3231	Grobelno
00050000-5669-a2a1-c6de-1bb6373ea65f	1290	Grosuplje
00050000-5669-a2a1-0bc5-c48b20090adf	2288	Hajdina
00050000-5669-a2a1-af3d-30b6ebdac9f1	8362	Hinje
00050000-5669-a2a1-0330-b8176ab9d1cb	2311	Hoče
00050000-5669-a2a1-586c-2c74266b61e0	9205	Hodoš/Hodos
00050000-5669-a2a1-9f9c-5cd7d22e555f	1354	Horjul
00050000-5669-a2a1-806e-7db1af481fbc	1372	Hotedršica
00050000-5669-a2a1-e781-65b5cc304041	1430	Hrastnik
00050000-5669-a2a1-3108-ae073aef6da3	6225	Hruševje
00050000-5669-a2a1-c10e-90c31a4e0582	4276	Hrušica
00050000-5669-a2a1-7e48-240da256bb63	5280	Idrija
00050000-5669-a2a1-a78b-09c1c3fa62af	1292	Ig
00050000-5669-a2a1-ed16-209b46407a82	6250	Ilirska Bistrica
00050000-5669-a2a1-41d2-9ecc32e86fd0	6251	Ilirska Bistrica-Trnovo
00050000-5669-a2a1-47d6-f8b2237ddf24	1295	Ivančna Gorica
00050000-5669-a2a1-7a5d-d6179b54d603	2259	Ivanjkovci
00050000-5669-a2a1-cb06-2ab065a1a663	1411	Izlake
00050000-5669-a2a1-e614-f5addfeeb55a	6310	Izola/Isola
00050000-5669-a2a1-c7a1-9810f0ef2839	2222	Jakobski Dol
00050000-5669-a2a1-66c5-846da16bb637	2221	Jarenina
00050000-5669-a2a1-c574-4f2562418529	6254	Jelšane
00050000-5669-a2a1-8c6b-afa05e766c4f	4270	Jesenice
00050000-5669-a2a1-7421-7b0dc2a9b2a3	8261	Jesenice na Dolenjskem
00050000-5669-a2a1-3a56-8b7e356742fc	3273	Jurklošter
00050000-5669-a2a1-ad0a-10769e3eba83	2223	Jurovski Dol
00050000-5669-a2a1-15ff-c235446a1f77	2256	Juršinci
00050000-5669-a2a1-ee40-554536977c19	5214	Kal nad Kanalom
00050000-5669-a2a1-ec78-200f5317d97c	3233	Kalobje
00050000-5669-a2a1-bc7c-87b27515ddba	4246	Kamna Gorica
00050000-5669-a2a1-be60-1a56d5c44a95	2351	Kamnica
00050000-5669-a2a1-6b5c-a9952f95b072	1241	Kamnik
00050000-5669-a2a1-8338-ebcd26658cb6	5213	Kanal
00050000-5669-a2a1-3b57-a274a97fa2cd	8258	Kapele
00050000-5669-a2a1-4009-4d0182f134a6	2362	Kapla
00050000-5669-a2a1-cfe2-70a943849c57	2325	Kidričevo
00050000-5669-a2a1-d9f4-1f0f6c581689	1412	Kisovec
00050000-5669-a2a1-9315-d62c711894b6	6253	Knežak
00050000-5669-a2a1-9741-56725693b91b	5222	Kobarid
00050000-5669-a2a1-567e-c6763b9097b9	9227	Kobilje
00050000-5669-a2a1-bd6f-de2f117a5508	1330	Kočevje
00050000-5669-a2a1-132b-16e9b077394a	1338	Kočevska Reka
00050000-5669-a2a1-d182-c776c3ad45e6	2276	Kog
00050000-5669-a2a1-899c-adf878a7d98b	5211	Kojsko
00050000-5669-a2a1-0df7-2da8bb714dfd	6223	Komen
00050000-5669-a2a1-c09f-b599eb1771a3	1218	Komenda
00050000-5669-a2a1-0636-de51a8187b94	6000	Koper/Capodistria 
00050000-5669-a2a1-1ea6-99ddce48abd1	6001	Koper/Capodistria - poštni predali
00050000-5669-a2a1-3679-1548f99a58fe	8282	Koprivnica
00050000-5669-a2a1-3f9d-7b0f84e74893	5296	Kostanjevica na Krasu
00050000-5669-a2a1-b4d3-dbaab4bc3fac	8311	Kostanjevica na Krki
00050000-5669-a2a1-83ba-126976d31e5f	1336	Kostel
00050000-5669-a2a1-27b2-6a2e4c78b2db	6256	Košana
00050000-5669-a2a1-56b9-782ad6db7947	2394	Kotlje
00050000-5669-a2a1-db8c-46e6a14a3439	6240	Kozina
00050000-5669-a2a1-ac14-d60c3a1cf607	3260	Kozje
00050000-5669-a2a1-363f-b9c15384ad4d	4000	Kranj 
00050000-5669-a2a1-812d-6624a58d5e33	4001	Kranj - poštni predali
00050000-5669-a2a1-2eac-b43bbcba03f9	4280	Kranjska Gora
00050000-5669-a2a1-8d24-04d72dbe6147	1281	Kresnice
00050000-5669-a2a1-620d-0e66ed7e1eef	4294	Križe
00050000-5669-a2a1-4c1d-f8c7f76481b4	9206	Križevci
00050000-5669-a2a1-94fb-79d4c53bf933	9242	Križevci pri Ljutomeru
00050000-5669-a2a1-22c6-66597bc18cfb	1301	Krka
00050000-5669-a2a1-eb2c-bda20604b58c	8296	Krmelj
00050000-5669-a2a1-1358-f5fbea067967	4245	Kropa
00050000-5669-a2a1-b673-8683ef4076ff	8262	Krška vas
00050000-5669-a2a1-22c1-c6b76ac2ea67	8270	Krško
00050000-5669-a2a1-9d5c-29baee97f68d	9263	Kuzma
00050000-5669-a2a1-ffcb-8191744d6b5a	2318	Laporje
00050000-5669-a2a1-1428-84c965a87a3d	3270	Laško
00050000-5669-a2a1-474b-f7bc469c1a59	1219	Laze v Tuhinju
00050000-5669-a2a1-543d-6b0b49d8be88	2230	Lenart v Slovenskih goricah
00050000-5669-a2a1-6c87-98aef55d5544	9220	Lendava/Lendva
00050000-5669-a2a1-e1c1-51f392c1dbe3	4248	Lesce
00050000-5669-a2a1-be16-a812dc0f3a1c	3261	Lesično
00050000-5669-a2a1-5585-323ea9ee9513	8273	Leskovec pri Krškem
00050000-5669-a2a1-8992-5b7763098858	2372	Libeliče
00050000-5669-a2a1-fffb-dbbf903930ee	2341	Limbuš
00050000-5669-a2a1-0f94-fe35260ec2a7	1270	Litija
00050000-5669-a2a1-ba9c-f1ea1d9ba2af	3202	Ljubečna
00050000-5669-a2a1-dcd6-e4170d6eaaab	1000	Ljubljana 
00050000-5669-a2a1-fa41-1d20d86c6202	1001	Ljubljana - poštni predali
00050000-5669-a2a1-91c3-dd8398627652	1231	Ljubljana - Črnuče
00050000-5669-a2a1-882c-b8657849cdfe	1261	Ljubljana - Dobrunje
00050000-5669-a2a1-805f-78d563b0ce16	1260	Ljubljana - Polje
00050000-5669-a2a1-d989-c647d1dba526	1210	Ljubljana - Šentvid
00050000-5669-a2a1-97a5-05132e0b0eea	1211	Ljubljana - Šmartno
00050000-5669-a2a1-4e1d-85b8564bcd9d	3333	Ljubno ob Savinji
00050000-5669-a2a1-b98d-2593ec321fcf	9240	Ljutomer
00050000-5669-a2a1-d732-2722a263aaef	3215	Loče
00050000-5669-a2a1-41d7-bbe68e6f17cc	5231	Log pod Mangartom
00050000-5669-a2a1-2f52-404e4eb89b57	1358	Log pri Brezovici
00050000-5669-a2a1-d5de-552201f36067	1370	Logatec
00050000-5669-a2a1-b911-45dcbfad78a4	1371	Logatec
00050000-5669-a2a1-147c-b6f8473e883b	1434	Loka pri Zidanem Mostu
00050000-5669-a2a1-be17-2c834752747e	3223	Loka pri Žusmu
00050000-5669-a2a1-6b64-9de7fd68ae46	6219	Lokev
00050000-5669-a2a1-0b93-99dd267175ef	1318	Loški Potok
00050000-5669-a2a1-12c4-a2ad2fe8f8d9	2324	Lovrenc na Dravskem polju
00050000-5669-a2a1-359b-7eb6c92a02db	2344	Lovrenc na Pohorju
00050000-5669-a2a1-444c-a015b2bdd61c	3334	Luče
00050000-5669-a2a1-1ab4-b27b8b079c6c	1225	Lukovica
00050000-5669-a2a1-2d49-153dc6e053d7	9202	Mačkovci
00050000-5669-a2a1-2e0a-4791c04d44ee	2322	Majšperk
00050000-5669-a2a1-b377-383d34ae9616	2321	Makole
00050000-5669-a2a1-a927-5700ac1287a6	9243	Mala Nedelja
00050000-5669-a2a1-df27-340d762b3eb5	2229	Malečnik
00050000-5669-a2a1-be57-1cc54fa02326	6273	Marezige
00050000-5669-a2a1-2074-44ab8ae6b5fa	2000	Maribor 
00050000-5669-a2a1-3eda-effbcba71591	2001	Maribor - poštni predali
00050000-5669-a2a1-4528-68f2ecc9e579	2206	Marjeta na Dravskem polju
00050000-5669-a2a1-ba73-fb100e20b03e	2281	Markovci
00050000-5669-a2a1-dfde-276316f199bf	9221	Martjanci
00050000-5669-a2a1-47a5-820c959ac236	6242	Materija
00050000-5669-a2a1-f06c-d266f4380b03	4211	Mavčiče
00050000-5669-a2a1-ec1c-f9ebc2b45ac1	1215	Medvode
00050000-5669-a2a1-bb0b-f25efec16d0f	1234	Mengeš
00050000-5669-a2a1-2a81-5414b8832572	8330	Metlika
00050000-5669-a2a1-e8af-f40ab937ed7f	2392	Mežica
00050000-5669-a2a1-fef5-96d4be12f39f	2204	Miklavž na Dravskem polju
00050000-5669-a2a1-f60f-201649211ca0	2275	Miklavž pri Ormožu
00050000-5669-a2a1-6060-59b37009ca1d	5291	Miren
00050000-5669-a2a1-7185-f851ec0cf82d	8233	Mirna
00050000-5669-a2a1-80fc-c11ef05cfac4	8216	Mirna Peč
00050000-5669-a2a1-e7b2-b60391ed384d	2382	Mislinja
00050000-5669-a2a1-4863-851b1053b1f3	4281	Mojstrana
00050000-5669-a2a1-c8cb-2d1d85593edb	8230	Mokronog
00050000-5669-a2a1-31ed-bfe58fea600e	1251	Moravče
00050000-5669-a2a1-06e1-6a214a160aa5	9226	Moravske Toplice
00050000-5669-a2a1-c341-520be617de6c	5216	Most na Soči
00050000-5669-a2a1-22a1-e70feb70a9a9	1221	Motnik
00050000-5669-a2a1-739f-25baecba50c1	3330	Mozirje
00050000-5669-a2a1-9c1c-5f501756592d	9000	Murska Sobota 
00050000-5669-a2a1-21b5-0a16b8f5fb1d	9001	Murska Sobota - poštni predali
00050000-5669-a2a1-3417-a8b6e9b38b09	2366	Muta
00050000-5669-a2a1-edc3-64de726429c1	4202	Naklo
00050000-5669-a2a1-290b-6e8886b11cfa	3331	Nazarje
00050000-5669-a2a1-bacf-ba810c0db5c4	1357	Notranje Gorice
00050000-5669-a2a1-cfc9-6a9c53aaa039	3203	Nova Cerkev
00050000-5669-a2a1-5383-44199299b74b	5000	Nova Gorica 
00050000-5669-a2a1-0148-58209d180137	5001	Nova Gorica - poštni predali
00050000-5669-a2a1-115b-219d48c1d582	1385	Nova vas
00050000-5669-a2a1-1d73-0bbac63c7aa4	8000	Novo mesto
00050000-5669-a2a1-8893-a78331744557	8001	Novo mesto - poštni predali
00050000-5669-a2a1-a0e1-763fd4ec4b2b	6243	Obrov
00050000-5669-a2a1-36f4-7d97195263d0	9233	Odranci
00050000-5669-a2a1-eb3c-e82f7412bbed	2317	Oplotnica
00050000-5669-a2a1-38d4-16b5a5eacdb2	2312	Orehova vas
00050000-5669-a2a1-5d11-0185b3804ca6	2270	Ormož
00050000-5669-a2a1-93b7-c0fd76364ee9	1316	Ortnek
00050000-5669-a2a1-89e9-1b4f605100b7	1337	Osilnica
00050000-5669-a2a1-fca3-7c1269242e4d	8222	Otočec
00050000-5669-a2a1-214f-4e066fea0ebb	2361	Ožbalt
00050000-5669-a2a1-b816-778e2757cdd4	2231	Pernica
00050000-5669-a2a1-df81-c843690b8da9	2211	Pesnica pri Mariboru
00050000-5669-a2a1-8131-33bb05e74a06	9203	Petrovci
00050000-5669-a2a1-c956-bffb600bde7f	3301	Petrovče
00050000-5669-a2a1-40f5-e7f0cf37dac1	6330	Piran/Pirano
00050000-5669-a2a1-c22b-4be63d286e51	8255	Pišece
00050000-5669-a2a1-6b63-16877396db40	6257	Pivka
00050000-5669-a2a1-6e7e-b99665544e9c	6232	Planina
00050000-5669-a2a1-b36b-c39d65cfb963	3225	Planina pri Sevnici
00050000-5669-a2a1-cdc6-31fac4594967	6276	Pobegi
00050000-5669-a2a1-e4c2-4bcf27e9b29f	8312	Podbočje
00050000-5669-a2a1-42ba-204c04a3bd2d	5243	Podbrdo
00050000-5669-a2a1-68c6-dac0b0b3fe09	3254	Podčetrtek
00050000-5669-a2a1-dd43-a72901e98a20	2273	Podgorci
00050000-5669-a2a1-cabc-a60690666723	6216	Podgorje
00050000-5669-a2a1-098b-77fdce00a698	2381	Podgorje pri Slovenj Gradcu
00050000-5669-a2a1-0dec-a46eeea1dd52	6244	Podgrad
00050000-5669-a2a1-722f-0c7b4b748ae2	1414	Podkum
00050000-5669-a2a1-8dbc-a412c45e1dc2	2286	Podlehnik
00050000-5669-a2a1-abe9-129ac8bdb329	5272	Podnanos
00050000-5669-a2a1-76a3-20f29d1eddfa	4244	Podnart
00050000-5669-a2a1-7a17-01fda19e6b41	3241	Podplat
00050000-5669-a2a1-3d74-4934ae3d9746	3257	Podsreda
00050000-5669-a2a1-489c-ef0c5d1c056a	2363	Podvelka
00050000-5669-a2a1-95be-8badc68e8207	2208	Pohorje
00050000-5669-a2a1-3936-1aae6210f039	2257	Polenšak
00050000-5669-a2a1-e259-fad9793c793e	1355	Polhov Gradec
00050000-5669-a2a1-524d-f5023a2ab046	4223	Poljane nad Škofjo Loko
00050000-5669-a2a1-8ade-3c442c3299a5	2319	Poljčane
00050000-5669-a2a1-0955-ae7040fdcb1b	1272	Polšnik
00050000-5669-a2a1-6626-34e42f1a9cfc	3313	Polzela
00050000-5669-a2a1-035e-516c6741689c	3232	Ponikva
00050000-5669-a2a1-e45f-7c6429e6dcb4	6320	Portorož/Portorose
00050000-5669-a2a1-0145-8870dacbc0d3	6230	Postojna
00050000-5669-a2a1-49cd-2321fc4e2222	2331	Pragersko
00050000-5669-a2a1-d98c-86aff2d87d3a	3312	Prebold
00050000-5669-a2a1-3527-fc3d2045710d	4205	Preddvor
00050000-5669-a2a1-43dc-47c419ce94a6	6255	Prem
00050000-5669-a2a1-36fe-83897b762f27	1352	Preserje
00050000-5669-a2a1-66f1-9090882748f1	6258	Prestranek
00050000-5669-a2a1-ba5a-5ea85a09194d	2391	Prevalje
00050000-5669-a2a1-b678-bc40429ed571	3262	Prevorje
00050000-5669-a2a1-fbd9-2831593a0f70	1276	Primskovo 
00050000-5669-a2a1-2b59-eda27f0094e2	3253	Pristava pri Mestinju
00050000-5669-a2a1-f5bc-1ace545b0a90	9207	Prosenjakovci/Partosfalva
00050000-5669-a2a1-2b72-0d1dd7ece5ad	5297	Prvačina
00050000-5669-a2a1-4710-9152c42eeefe	2250	Ptuj
00050000-5669-a2a1-3c12-6f4d95515223	2323	Ptujska Gora
00050000-5669-a2a1-98c3-d4b24218dd92	9201	Puconci
00050000-5669-a2a1-d41e-46cccd602169	2327	Rače
00050000-5669-a2a1-b31c-29b478802d1b	1433	Radeče
00050000-5669-a2a1-2127-22161fbd79bd	9252	Radenci
00050000-5669-a2a1-f999-ccd29ff12387	2360	Radlje ob Dravi
00050000-5669-a2a1-df8f-d8ddf99603d4	1235	Radomlje
00050000-5669-a2a1-3eb8-fba6f374ff65	4240	Radovljica
00050000-5669-a2a1-c0ff-415646140fd4	8274	Raka
00050000-5669-a2a1-62a8-b678424131d8	1381	Rakek
00050000-5669-a2a1-ebce-296d060ca9d3	4283	Rateče - Planica
00050000-5669-a2a1-4c3a-b37f9d1c3302	2390	Ravne na Koroškem
00050000-5669-a2a1-6a42-26e94b8121dc	9246	Razkrižje
00050000-5669-a2a1-e32e-f6439295ed00	3332	Rečica ob Savinji
00050000-5669-a2a1-6bd0-27dbb894920e	5292	Renče
00050000-5669-a2a1-c627-9da8218a1f1d	1310	Ribnica
00050000-5669-a2a1-26a3-d2b6ff276f63	2364	Ribnica na Pohorju
00050000-5669-a2a1-a574-6330ced6e303	3272	Rimske Toplice
00050000-5669-a2a1-1cac-9d9349445481	1314	Rob
00050000-5669-a2a1-6aee-e6f540d31aa6	5215	Ročinj
00050000-5669-a2a1-ff46-3d3e98230730	3250	Rogaška Slatina
00050000-5669-a2a1-b3ce-efcdeea60469	9262	Rogašovci
00050000-5669-a2a1-9047-6410242179c4	3252	Rogatec
00050000-5669-a2a1-4e21-461a986dcb13	1373	Rovte
00050000-5669-a2a1-1256-3db88896d040	2342	Ruše
00050000-5669-a2a1-9bd8-741a0acc749a	1282	Sava
00050000-5669-a2a1-6c87-b21f7a5607f8	6333	Sečovlje/Sicciole
00050000-5669-a2a1-1804-a694c1899a80	4227	Selca
00050000-5669-a2a1-8a53-210db3c67e29	2352	Selnica ob Dravi
00050000-5669-a2a1-4cd6-ed687bb71413	8333	Semič
00050000-5669-a2a1-234c-14006fbb903c	8281	Senovo
00050000-5669-a2a1-c43b-1e8c384e9290	6224	Senožeče
00050000-5669-a2a1-59ea-e7e809e36a72	8290	Sevnica
00050000-5669-a2a1-be58-62f990bacf45	6210	Sežana
00050000-5669-a2a1-aef3-3e83342dad08	2214	Sladki Vrh
00050000-5669-a2a1-a251-19707a8fdc43	5283	Slap ob Idrijci
00050000-5669-a2a1-190c-a9145f56a3a1	2380	Slovenj Gradec
00050000-5669-a2a1-e5f6-d9ccbceb5504	2310	Slovenska Bistrica
00050000-5669-a2a1-acc6-1236171fbd23	3210	Slovenske Konjice
00050000-5669-a2a1-fa8a-74aa8a47b8f7	1216	Smlednik
00050000-5669-a2a1-b7e1-94b2aabeb4f0	5232	Soča
00050000-5669-a2a1-3013-f36ca00a547a	1317	Sodražica
00050000-5669-a2a1-48ab-c81331acd729	3335	Solčava
00050000-5669-a2a1-2d0e-2d3e42f08330	5250	Solkan
00050000-5669-a2a1-c470-b661cd109315	4229	Sorica
00050000-5669-a2a1-98a9-86cde8debce7	4225	Sovodenj
00050000-5669-a2a1-0e2e-b46a7d093747	5281	Spodnja Idrija
00050000-5669-a2a1-b26b-36b4e80847a1	2241	Spodnji Duplek
00050000-5669-a2a1-7d7f-35031ab31092	9245	Spodnji Ivanjci
00050000-5669-a2a1-f7bd-b5b7e7d9a1c7	2277	Središče ob Dravi
00050000-5669-a2a1-1d99-8c25fdae4fb9	4267	Srednja vas v Bohinju
00050000-5669-a2a1-b628-038645e7f364	8256	Sromlje 
00050000-5669-a2a1-1bff-79167b813d08	5224	Srpenica
00050000-5669-a2a1-4db1-59a3258c44da	1242	Stahovica
00050000-5669-a2a1-04a3-e0c5f0fb5e01	1332	Stara Cerkev
00050000-5669-a2a1-d079-d883ba8e3bdc	8342	Stari trg ob Kolpi
00050000-5669-a2a1-ff7b-e7a79bee3388	1386	Stari trg pri Ložu
00050000-5669-a2a1-8692-56005c777279	2205	Starše
00050000-5669-a2a1-ad7c-87a41d1f8bf7	2289	Stoperce
00050000-5669-a2a1-cfb5-8c1b07274c2a	8322	Stopiče
00050000-5669-a2a1-61f7-6dd4c74911d7	3206	Stranice
00050000-5669-a2a1-d4e3-0ccd5b9a7052	8351	Straža
00050000-5669-a2a1-9658-2846a6114d1c	1313	Struge
00050000-5669-a2a1-98fb-3bf5b553188d	8293	Studenec
00050000-5669-a2a1-32c7-354cdec21188	8331	Suhor
00050000-5669-a2a1-9d5a-10c5a871c8c4	2233	Sv. Ana v Slovenskih goricah
00050000-5669-a2a1-8ca2-2e27fd8b607f	2235	Sv. Trojica v Slovenskih goricah
00050000-5669-a2a1-8f7e-67eade7ea6d5	2353	Sveti Duh na Ostrem Vrhu
00050000-5669-a2a1-e4ea-27d7d7a9a88a	9244	Sveti Jurij ob Ščavnici
00050000-5669-a2a1-761c-144cafce0ad5	3264	Sveti Štefan
00050000-5669-a2a1-92bd-0965f1cc662c	2258	Sveti Tomaž
00050000-5669-a2a1-9ee9-d6811c0a1152	9204	Šalovci
00050000-5669-a2a1-b77e-77c3cfff2dfb	5261	Šempas
00050000-5669-a2a1-6097-cfc2ddd70aaf	5290	Šempeter pri Gorici
00050000-5669-a2a1-3dd6-8f2c4ee21204	3311	Šempeter v Savinjski dolini
00050000-5669-a2a1-244b-ffff2293c8f3	4208	Šenčur
00050000-5669-a2a1-7a0d-8dfca5a1e802	2212	Šentilj v Slovenskih goricah
00050000-5669-a2a1-dc15-0ec39b24efe9	8297	Šentjanž
00050000-5669-a2a1-7a03-91c1c7a26c3b	2373	Šentjanž pri Dravogradu
00050000-5669-a2a1-6304-4386d2afb046	8310	Šentjernej
00050000-5669-a2a1-6720-a6ce373e4906	3230	Šentjur
00050000-5669-a2a1-b18d-cc200f24c9cc	3271	Šentrupert
00050000-5669-a2a1-aec0-bc806c092389	8232	Šentrupert
00050000-5669-a2a1-63d1-6430390d9c93	1296	Šentvid pri Stični
00050000-5669-a2a1-e8e8-5a1ceda0c87b	8275	Škocjan
00050000-5669-a2a1-64b2-0cffeda0b6ac	6281	Škofije
00050000-5669-a2a1-2d50-63c5b88e2949	4220	Škofja Loka
00050000-5669-a2a1-1a4f-5d07c52ab091	3211	Škofja vas
00050000-5669-a2a1-d096-4efc0452e4b7	1291	Škofljica
00050000-5669-a2a1-6258-b9b231a1475f	6274	Šmarje
00050000-5669-a2a1-6165-8663255c9a3f	1293	Šmarje - Sap
00050000-5669-a2a1-4bba-d258336ed5b2	3240	Šmarje pri Jelšah
00050000-5669-a2a1-935c-8375f7e0c27d	8220	Šmarješke Toplice
00050000-5669-a2a1-32b0-e9683f489f7b	2315	Šmartno na Pohorju
00050000-5669-a2a1-5a30-7b1cee3bf872	3341	Šmartno ob Dreti
00050000-5669-a2a1-1426-60af8c04ab49	3327	Šmartno ob Paki
00050000-5669-a2a1-1aa7-f2930b955040	1275	Šmartno pri Litiji
00050000-5669-a2a1-5d70-76dfd9639fd1	2383	Šmartno pri Slovenj Gradcu
00050000-5669-a2a1-ec99-ff7251fa2c01	3201	Šmartno v Rožni dolini
00050000-5669-a2a1-e484-5b3c3e2ef84b	3325	Šoštanj
00050000-5669-a2a1-89b6-79bb799f7c73	6222	Štanjel
00050000-5669-a2a1-7b25-c847bf87a784	3220	Štore
00050000-5669-a2a1-4a79-b2a34f0366e9	3304	Tabor
00050000-5669-a2a1-5303-459bd78c6f73	3221	Teharje
00050000-5669-a2a1-d7a9-9ceb41d5bc7c	9251	Tišina
00050000-5669-a2a1-195a-8269dfb4fd8d	5220	Tolmin
00050000-5669-a2a1-e756-126458bb49a1	3326	Topolšica
00050000-5669-a2a1-e7c8-92d3c118f207	2371	Trbonje
00050000-5669-a2a1-7bfd-11085ca41f49	1420	Trbovlje
00050000-5669-a2a1-3b56-d4ee7a5f5d55	8231	Trebelno 
00050000-5669-a2a1-e603-baf25ae335d8	8210	Trebnje
00050000-5669-a2a1-a0d1-28797082cf51	5252	Trnovo pri Gorici
00050000-5669-a2a1-275b-a7b43592bbcf	2254	Trnovska vas
00050000-5669-a2a1-10df-3bbf113477cf	1222	Trojane
00050000-5669-a2a1-ac59-03e34a0447aa	1236	Trzin
00050000-5669-a2a1-6ef9-de153984c431	4290	Tržič
00050000-5669-a2a1-f526-df87431e7703	8295	Tržišče
00050000-5669-a2a1-ab40-d12413a5faf6	1311	Turjak
00050000-5669-a2a1-43f8-a081e8e95670	9224	Turnišče
00050000-5669-a2a1-b36f-a089ac5cccae	8323	Uršna sela
00050000-5669-a2a1-9f20-c148618622d3	1252	Vače
00050000-5669-a2a1-f77b-88491e1d5bdc	3320	Velenje 
00050000-5669-a2a1-e72a-89ada0ff019f	3322	Velenje - poštni predali
00050000-5669-a2a1-d8d7-118d58b6240c	8212	Velika Loka
00050000-5669-a2a1-dadf-04fa8f53d8ab	2274	Velika Nedelja
00050000-5669-a2a1-25da-0de83a4d688b	9225	Velika Polana
00050000-5669-a2a1-7021-d03071132d5b	1315	Velike Lašče
00050000-5669-a2a1-3255-c5d94a1ee76c	8213	Veliki Gaber
00050000-5669-a2a1-5eec-a4b901985482	9241	Veržej
00050000-5669-a2a1-c703-03b85fba18cb	1312	Videm - Dobrepolje
00050000-5669-a2a1-6f3f-2342e54d7490	2284	Videm pri Ptuju
00050000-5669-a2a1-6dcd-9ea96138f048	8344	Vinica
00050000-5669-a2a1-3c5c-9c1de3b57fb0	5271	Vipava
00050000-5669-a2a2-64fa-91276fb67f0f	4212	Visoko
00050000-5669-a2a2-a27e-0240ca462801	1294	Višnja Gora
00050000-5669-a2a2-d408-0fb9f8a6acc1	3205	Vitanje
00050000-5669-a2a2-4936-74cee1fdf96e	2255	Vitomarci
00050000-5669-a2a2-9caa-5d3fd6e2d167	1217	Vodice
00050000-5669-a2a2-bf6e-53f82770f974	3212	Vojnik\t
00050000-5669-a2a2-e7f2-0fa8b068ed85	5293	Volčja Draga
00050000-5669-a2a2-149a-d6f114eefd81	2232	Voličina
00050000-5669-a2a2-fef7-c05dd2f5a84b	3305	Vransko
00050000-5669-a2a2-c1f9-876a81abf830	6217	Vremski Britof
00050000-5669-a2a2-0ec8-4868907ebd26	1360	Vrhnika
00050000-5669-a2a2-2fa1-27c8e01e2eae	2365	Vuhred
00050000-5669-a2a2-0e28-458d703f16dc	2367	Vuzenica
00050000-5669-a2a2-2d48-01294a70609c	8292	Zabukovje 
00050000-5669-a2a2-c2a9-86b2a5808ded	1410	Zagorje ob Savi
00050000-5669-a2a2-ba6b-59841f03c448	1303	Zagradec
00050000-5669-a2a2-637a-55e86f0cc66b	2283	Zavrč
00050000-5669-a2a2-dcc5-ab570b93521f	8272	Zdole 
00050000-5669-a2a2-a7d9-d10eefe59011	4201	Zgornja Besnica
00050000-5669-a2a2-4951-b2ab3459f4ea	2242	Zgornja Korena
00050000-5669-a2a2-5e21-18387ed2dd1a	2201	Zgornja Kungota
00050000-5669-a2a2-3517-6885b8ec998a	2316	Zgornja Ložnica
00050000-5669-a2a2-d3f6-ce290aec9419	2314	Zgornja Polskava
00050000-5669-a2a2-c9ab-eec502b7a50a	2213	Zgornja Velka
00050000-5669-a2a2-8a7c-df357ce2f54b	4247	Zgornje Gorje
00050000-5669-a2a2-38b2-f76acbd0e2c9	4206	Zgornje Jezersko
00050000-5669-a2a2-8c82-28250b34619e	2285	Zgornji Leskovec
00050000-5669-a2a2-db0f-ceb096d6725a	1432	Zidani Most
00050000-5669-a2a2-8086-b098322a46aa	3214	Zreče
00050000-5669-a2a2-c176-1b449f1f056c	4209	Žabnica
00050000-5669-a2a2-06b5-c82af8335cf6	3310	Žalec
00050000-5669-a2a2-7f28-d1919308d1aa	4228	Železniki
00050000-5669-a2a2-c0b7-b9c343f567ae	2287	Žetale
00050000-5669-a2a2-1891-ee1fc33d5fba	4226	Žiri
00050000-5669-a2a2-8e51-fff04d3c7136	4274	Žirovnica
00050000-5669-a2a2-7300-46532870ebf1	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 32027562)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 32027137)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32026885)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5669-a2a5-d513-3c5d11b38a4c	00080000-5669-a2a5-ca24-711f51d92484	\N	00040000-5669-a2a2-46bf-9fbb95d8ff90	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5669-a2a5-3d81-c50b58766433	00080000-5669-a2a5-ca24-711f51d92484	\N	00040000-5669-a2a2-46bf-9fbb95d8ff90	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5669-a2a5-97a0-2bc2a1556247	00080000-5669-a2a5-7200-4b7b6abe8452	\N	00040000-5669-a2a2-46bf-9fbb95d8ff90	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 32027029)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5669-a2a2-a2ef-88bf7b16c0ab	novo leto	1	1	\N	t
00430000-5669-a2a2-385f-e45443f674a6	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5669-a2a2-5576-6ccba8e61687	dan upora proti okupatorju	27	4	\N	t
00430000-5669-a2a2-7b80-eec8247b31e0	praznik dela	1	5	\N	t
00430000-5669-a2a2-ae29-917ec1ac7713	praznik dela	2	5	\N	t
00430000-5669-a2a2-0661-e147922f9730	dan Primoža Trubarja	8	6	\N	f
00430000-5669-a2a2-e5f2-5b5f164a2011	dan državnosti	25	6	\N	t
00430000-5669-a2a2-d9cb-7697c34488a8	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5669-a2a2-5d35-e3b355cd917e	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5669-a2a2-65b5-02e8a7caf334	dan suverenosti	25	10	\N	f
00430000-5669-a2a2-cc04-218a63045907	dan spomina na mrtve	1	11	\N	t
00430000-5669-a2a2-d5de-87cbf196a751	dan Rudolfa Maistra	23	11	\N	f
00430000-5669-a2a2-cd8d-e66283b10cee	božič	25	12	\N	t
00430000-5669-a2a2-d0d8-f6cb64d01795	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5669-a2a2-5faf-08a4e7935c4e	Marijino vnebovzetje	15	8	\N	t
00430000-5669-a2a2-6b62-f926c967a127	dan reformacije	31	10	\N	t
00430000-5669-a2a2-22da-c8215f79bc43	velikonočna nedelja	27	3	2016	t
00430000-5669-a2a2-e07e-dfd92eb737c4	velikonočna nedelja	16	4	2017	t
00430000-5669-a2a2-03d4-3c237d9449e9	velikonočna nedelja	1	4	2018	t
00430000-5669-a2a2-43fb-85c36f27d5e2	velikonočna nedelja	21	4	2019	t
00430000-5669-a2a2-e7f0-f84548607925	velikonočna nedelja	12	4	2020	t
00430000-5669-a2a2-96df-244a0ebff87b	velikonočna nedelja	4	4	2021	t
00430000-5669-a2a2-a02d-31db08e1d0f1	velikonočna nedelja	17	4	2022	t
00430000-5669-a2a2-3131-2f0edb6754d7	velikonočna nedelja	9	4	2023	t
00430000-5669-a2a2-615b-bceaf31ae9f1	velikonočna nedelja	31	3	2024	t
00430000-5669-a2a2-587d-4161d9d4fab9	velikonočna nedelja	20	4	2025	t
00430000-5669-a2a2-65b3-2b69e85d20a1	velikonočna nedelja	5	4	2026	t
00430000-5669-a2a2-7011-37a24df03db2	velikonočna nedelja	28	3	2027	t
00430000-5669-a2a2-21b9-64d082b2ed2d	velikonočna nedelja	16	4	2028	t
00430000-5669-a2a2-38bf-c3bf655171cf	velikonočna nedelja	1	4	2029	t
00430000-5669-a2a2-f943-7833b3cb755a	velikonočna nedelja	21	4	2030	t
00430000-5669-a2a2-d1ee-83dac6a8fb61	velikonočni ponedeljek	28	3	2016	t
00430000-5669-a2a2-22aa-0e4446abc873	velikonočni ponedeljek	17	4	2017	t
00430000-5669-a2a2-9413-e09c4ebeb9e5	velikonočni ponedeljek	2	4	2018	t
00430000-5669-a2a2-5205-ce0a8430749b	velikonočni ponedeljek	22	4	2019	t
00430000-5669-a2a2-c7e0-2180894f5076	velikonočni ponedeljek	13	4	2020	t
00430000-5669-a2a2-8dfb-af2ec302f113	velikonočni ponedeljek	5	4	2021	t
00430000-5669-a2a2-6003-f88668da79c6	velikonočni ponedeljek	18	4	2022	t
00430000-5669-a2a2-f109-84564b63fdc4	velikonočni ponedeljek	10	4	2023	t
00430000-5669-a2a2-e4ff-cbcac0ce804e	velikonočni ponedeljek	1	4	2024	t
00430000-5669-a2a2-f818-522059a0ae09	velikonočni ponedeljek	21	4	2025	t
00430000-5669-a2a2-dd04-a4388ecb0c21	velikonočni ponedeljek	6	4	2026	t
00430000-5669-a2a2-3d54-08e31468bc11	velikonočni ponedeljek	29	3	2027	t
00430000-5669-a2a2-e379-ef0cc7ab0517	velikonočni ponedeljek	17	4	2028	t
00430000-5669-a2a2-e6a1-c6ec1c56886d	velikonočni ponedeljek	2	4	2029	t
00430000-5669-a2a2-1698-c5b9a90bc6f2	velikonočni ponedeljek	22	4	2030	t
00430000-5669-a2a2-5a4d-058ef8c1edbf	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5669-a2a2-32f8-3308a77cef4c	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5669-a2a2-6336-bbcd49905b06	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5669-a2a2-c379-7ded53648d58	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5669-a2a2-2b47-7580c169bc3c	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5669-a2a2-ae58-9d0970109736	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5669-a2a2-7cf7-6b90cddf3e15	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5669-a2a2-a9a4-b8b92ea87f1a	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5669-a2a2-5058-324f8dd4d2be	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5669-a2a2-426c-e294e6d5fee7	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5669-a2a2-8272-512b109ef5fa	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5669-a2a2-7ad9-a85000ab36af	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5669-a2a2-9e48-c9db78bcfc5f	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5669-a2a2-cea3-f4ba36c34bc8	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5669-a2a2-b750-7ef599fe6a02	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 32026989)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 32027001)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 32027149)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 32027576)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 32027586)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5669-a2a5-7ca9-9234ae29a7bd	00080000-5669-a2a5-7213-5815c79c5111	0987	AK
00190000-5669-a2a5-e3fb-1735b4670506	00080000-5669-a2a5-7200-4b7b6abe8452	0989	AK
00190000-5669-a2a5-732c-f3bb8b2e459e	00080000-5669-a2a5-429f-c552d673bbc4	0986	AK
00190000-5669-a2a5-3cc2-9e4bcc14e857	00080000-5669-a2a5-f195-211ce870c6fa	0984	AK
00190000-5669-a2a5-f3e8-d24df8db9370	00080000-5669-a2a5-c823-31b516b485a3	0983	AK
00190000-5669-a2a5-d867-73b698c47e77	00080000-5669-a2a5-cf10-7a21a12b0de3	0982	AK
00190000-5669-a2a7-a604-31efe7c10601	00080000-5669-a2a7-ebc4-5e5e4c1cb69f	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 32027485)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5669-a2a5-39d8-262e64f9d3eb	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 32027594)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32027178)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5669-a2a4-607d-e64999f5731e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5669-a2a4-b452-66e291a888f8	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5669-a2a4-2f77-8e4198012ecb	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5669-a2a4-1c7b-68002a6c30d7	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5669-a2a4-3231-7cc2ebef7532	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5669-a2a4-a9fe-2b4eb96ac3d0	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5669-a2a4-261d-b9e88b15b09e	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 32027122)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32027112)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32027323)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32027253)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 32026963)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 32026725)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5669-a2a7-ebc4-5e5e4c1cb69f	00010000-5669-a2a3-99a2-ca454a3ea649	2015-12-10 17:04:55	INS	a:0:{}
2	App\\Entity\\Option	00000000-5669-a2a7-32a6-30308a4f7fa7	00010000-5669-a2a3-99a2-ca454a3ea649	2015-12-10 17:04:55	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5669-a2a7-a604-31efe7c10601	00010000-5669-a2a3-99a2-ca454a3ea649	2015-12-10 17:04:55	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 32027191)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 32026763)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5669-a2a2-e7f7-d8a45eefcedd	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5669-a2a2-d7fe-d773049377ea	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5669-a2a2-b02c-04b6262a6fa1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5669-a2a2-ef4d-05b1e051097e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5669-a2a2-07bb-e710ea21124f	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5669-a2a2-0ae2-02e9384c6fa1	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5669-a2a2-7f04-44a715e2cd9b	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5669-a2a2-fe6f-f2d3db9da162	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5669-a2a2-3344-beced14c2c82	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5669-a2a2-fedd-b56f28dcc5a6	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5669-a2a2-739c-83969242a6aa	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5669-a2a2-0d11-831a1dc7edd2	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5669-a2a2-8850-aef69db11df1	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5669-a2a2-e85e-b8365b3983d5	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5669-a2a2-3036-91d82a9b43b0	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5669-a2a2-263f-461601d9e95c	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5669-a2a2-5c16-3929aac99680	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5669-a2a2-de3d-5f5427a0decb	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5669-a2a2-3fd2-99153c6a965f	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5669-a2a2-716c-4c5572284631	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5669-a2a2-65b1-f871904e645b	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5669-a2a2-b9b8-595cb00f041c	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5669-a2a2-88a6-5cd2d1cb624a	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5669-a2a2-4405-fd93ac184fcc	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5669-a2a2-e47f-c034100536e8	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5669-a2a2-965f-3715f3eaa1a7	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5669-a2a2-f405-c3605136529a	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5669-a2a2-bed2-713aefc36979	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5669-a2a2-549f-72a739c4c8ce	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5669-a2a2-f54c-b13b0a169558	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5669-a2a2-dd94-d64ef21c963e	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5669-a2a2-2238-c16eca689b2b	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5669-a2a2-dd39-0466ab19cd18	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5669-a2a2-fa80-2753fca06c34	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5669-a2a2-edb1-f564c3296618	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5669-a2a2-09eb-74f9ef70f1ac	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5669-a2a2-e376-8e5cee8c56ab	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5669-a2a2-c1d2-64ebfe3dd0c5	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5669-a2a3-ed07-a100b89b38bc	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5669-a2a3-5c75-e9f71e121abb	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5669-a2a3-35a5-edd272983016	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5669-a2a3-5555-b0a51e551da2	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5669-a2a3-c100-df18bc9ad9ce	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5669-a2a3-decd-91a366fad756	arhivar	arhivar	t
00020000-5669-a2a4-6f8c-a638bc77e1d3	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5669-a2a4-4dd2-3179ad1af709	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-c7fa-4cd2b8cd6ac2	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-39cb-6f1e3be74077	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-c7a5-0e2b0036592f	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-5a1d-48ef17e9d992	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-37b7-7e22e65a13f4	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-9e36-a50dae8b0559	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-05d5-5a81e0918433	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-ddac-71f4aeee5b59	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-78cd-b49aaa246cbf	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-68ee-a9037742b773	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-5ef9-02c320234e7f	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-3095-0f0af0e1c6e5	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-a439-4b1ee55fe866	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-d5e7-125decda5830	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-b647-f7271ea08c22	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-454f-a6b942512cb0	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-5ace-b0b6bb488627	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-6e08-5c3b2bac1e6d	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5669-a2a4-ee59-6d4f084c6289	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-3ec2-bd84b5e45135	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-31d1-08e8361da0a4	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-e66f-de71a501b273	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-336e-0bf71e1c86d1	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-faa5-3163a4c5a97f	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-b29e-05fafd8d9527	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-161f-4076af443843	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-cc14-9ec26740b338	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-88c6-8157c0cb2b79	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-86bd-e02597e11a39	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-52fe-6f5a818d5e99	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-e55f-65694ad28cae	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-73ce-82690b2588fc	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5669-a2a4-2428-21bc100aa4e2	Alternacija-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 32026747)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5669-a2a3-35c5-bd9278702f97	00020000-5669-a2a2-b02c-04b6262a6fa1
00010000-5669-a2a3-99a2-ca454a3ea649	00020000-5669-a2a2-b02c-04b6262a6fa1
00010000-5669-a2a5-858a-044465ce5377	00020000-5669-a2a4-6f8c-a638bc77e1d3
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-4dd2-3179ad1af709
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-5a1d-48ef17e9d992
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-ddac-71f4aeee5b59
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-68ee-a9037742b773
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-3095-0f0af0e1c6e5
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-5ace-b0b6bb488627
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-39cb-6f1e3be74077
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-ee59-6d4f084c6289
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-e66f-de71a501b273
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-faa5-3163a4c5a97f
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-161f-4076af443843
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-88c6-8157c0cb2b79
00010000-5669-a2a5-afaa-74d0211631f5	00020000-5669-a2a4-73ce-82690b2588fc
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-4dd2-3179ad1af709
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-c7fa-4cd2b8cd6ac2
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-39cb-6f1e3be74077
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-c7a5-0e2b0036592f
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-3095-0f0af0e1c6e5
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-b647-f7271ea08c22
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-ee59-6d4f084c6289
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-e66f-de71a501b273
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-faa5-3163a4c5a97f
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-161f-4076af443843
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-88c6-8157c0cb2b79
00010000-5669-a2a5-2654-0a42e937cdd1	00020000-5669-a2a4-73ce-82690b2588fc
00010000-5669-a2a5-5db0-dd73328b3ec7	00020000-5669-a2a4-4dd2-3179ad1af709
00010000-5669-a2a5-5db0-dd73328b3ec7	00020000-5669-a2a4-c7fa-4cd2b8cd6ac2
00010000-5669-a2a5-5db0-dd73328b3ec7	00020000-5669-a2a4-39cb-6f1e3be74077
00010000-5669-a2a5-5db0-dd73328b3ec7	00020000-5669-a2a4-c7a5-0e2b0036592f
00010000-5669-a2a5-5db0-dd73328b3ec7	00020000-5669-a2a4-68ee-a9037742b773
00010000-5669-a2a5-5db0-dd73328b3ec7	00020000-5669-a2a4-3095-0f0af0e1c6e5
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-c7fa-4cd2b8cd6ac2
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-37b7-7e22e65a13f4
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-78cd-b49aaa246cbf
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-5ef9-02c320234e7f
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-68ee-a9037742b773
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-454f-a6b942512cb0
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-3095-0f0af0e1c6e5
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-a439-4b1ee55fe866
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-ee59-6d4f084c6289
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-3ec2-bd84b5e45135
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-e66f-de71a501b273
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-336e-0bf71e1c86d1
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-faa5-3163a4c5a97f
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-b29e-05fafd8d9527
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-161f-4076af443843
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-cc14-9ec26740b338
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-88c6-8157c0cb2b79
00010000-5669-a2a5-444f-c38bc5b443c9	00020000-5669-a2a4-86bd-e02597e11a39
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-c7fa-4cd2b8cd6ac2
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-37b7-7e22e65a13f4
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-05d5-5a81e0918433
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-78cd-b49aaa246cbf
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-5ef9-02c320234e7f
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-68ee-a9037742b773
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-454f-a6b942512cb0
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-3095-0f0af0e1c6e5
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-a439-4b1ee55fe866
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-d5e7-125decda5830
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-ee59-6d4f084c6289
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-3ec2-bd84b5e45135
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-31d1-08e8361da0a4
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-e66f-de71a501b273
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-336e-0bf71e1c86d1
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-faa5-3163a4c5a97f
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-b29e-05fafd8d9527
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-161f-4076af443843
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-cc14-9ec26740b338
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-88c6-8157c0cb2b79
00010000-5669-a2a5-8eb3-b0aa04c2f97c	00020000-5669-a2a4-86bd-e02597e11a39
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-c7fa-4cd2b8cd6ac2
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-39cb-6f1e3be74077
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-37b7-7e22e65a13f4
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-9e36-a50dae8b0559
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-05d5-5a81e0918433
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-5a1d-48ef17e9d992
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-78cd-b49aaa246cbf
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-5ef9-02c320234e7f
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-68ee-a9037742b773
00010000-5669-a2a5-3609-8705dc39376b	00020000-5669-a2a4-454f-a6b942512cb0
00010000-5669-a2a5-6087-4418ec674fe0	00020000-5669-a2a4-4dd2-3179ad1af709
00010000-5669-a2a5-6087-4418ec674fe0	00020000-5669-a2a4-c7a5-0e2b0036592f
00010000-5669-a2a5-6087-4418ec674fe0	00020000-5669-a2a4-5a1d-48ef17e9d992
00010000-5669-a2a5-6087-4418ec674fe0	00020000-5669-a2a4-ddac-71f4aeee5b59
00010000-5669-a2a5-6087-4418ec674fe0	00020000-5669-a2a4-68ee-a9037742b773
00010000-5669-a2a5-6087-4418ec674fe0	00020000-5669-a2a4-3095-0f0af0e1c6e5
00010000-5669-a2a5-6087-4418ec674fe0	00020000-5669-a2a4-5ace-b0b6bb488627
00010000-5669-a2a5-6087-4418ec674fe0	00020000-5669-a2a4-52fe-6f5a818d5e99
00010000-5669-a2a5-b3c2-1844039af831	00020000-5669-a2a4-6e08-5c3b2bac1e6d
\.


--
-- TOC entry 3146 (class 0 OID 32027205)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32027143)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32027089)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5669-a2a4-5acb-7ee83a2e0aa8	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5669-a2a5-4814-50c4f4da955b	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5669-a2a5-ddc5-c93dd80d120c	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 32026712)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5669-a2a2-a235-acc15b8ef564	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5669-a2a2-4feb-ef0982a6b10e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5669-a2a2-d547-ac9d5534c44b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5669-a2a2-dacd-53159f47a8d7	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5669-a2a2-5750-5486d30137bf	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 32026704)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5669-a2a2-8a15-5a8fa22c27ff	00230000-5669-a2a2-dacd-53159f47a8d7	popa
00240000-5669-a2a2-a21f-df4327762873	00230000-5669-a2a2-dacd-53159f47a8d7	oseba
00240000-5669-a2a2-f104-19dc7dfd4573	00230000-5669-a2a2-dacd-53159f47a8d7	tippopa
00240000-5669-a2a2-4c49-2e3d3d2fb9cc	00230000-5669-a2a2-dacd-53159f47a8d7	organizacijskaenota
00240000-5669-a2a2-a02a-c7c28946fd86	00230000-5669-a2a2-dacd-53159f47a8d7	sezona
00240000-5669-a2a2-fe08-256598b226c5	00230000-5669-a2a2-dacd-53159f47a8d7	tipvaje
00240000-5669-a2a2-4cb5-eee030b304ef	00230000-5669-a2a2-4feb-ef0982a6b10e	prostor
00240000-5669-a2a2-0838-542bb6a3a009	00230000-5669-a2a2-dacd-53159f47a8d7	besedilo
00240000-5669-a2a2-500a-bc34a434ad37	00230000-5669-a2a2-dacd-53159f47a8d7	uprizoritev
00240000-5669-a2a2-c5b1-a22deab07daa	00230000-5669-a2a2-dacd-53159f47a8d7	funkcija
00240000-5669-a2a2-c322-bf554137deeb	00230000-5669-a2a2-dacd-53159f47a8d7	tipfunkcije
00240000-5669-a2a2-eeff-eba241249a47	00230000-5669-a2a2-dacd-53159f47a8d7	alternacija
00240000-5669-a2a2-1390-b07db733502d	00230000-5669-a2a2-a235-acc15b8ef564	pogodba
00240000-5669-a2a2-6f3a-b9f7260f1ca2	00230000-5669-a2a2-dacd-53159f47a8d7	zaposlitev
00240000-5669-a2a2-bb3a-d4b37d75c0fa	00230000-5669-a2a2-dacd-53159f47a8d7	zvrstuprizoritve
00240000-5669-a2a2-6e4b-dcf8b47cffe7	00230000-5669-a2a2-a235-acc15b8ef564	programdela
00240000-5669-a2a2-ebf2-d5796ee0b951	00230000-5669-a2a2-dacd-53159f47a8d7	zapis
\.


--
-- TOC entry 3095 (class 0 OID 32026699)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
86057a03-33c9-4446-98ac-e4050947532f	00240000-5669-a2a2-8a15-5a8fa22c27ff	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 32027270)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5669-a2a5-a439-2339d7faa153	000e0000-5669-a2a5-f416-d9e23cf85136	00080000-5669-a2a5-ca24-711f51d92484	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5669-a2a2-7e6e-ea3893f7d50c
00270000-5669-a2a5-eac4-46f09bbdda71	000e0000-5669-a2a5-f416-d9e23cf85136	00080000-5669-a2a5-ca24-711f51d92484	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5669-a2a2-7e6e-ea3893f7d50c
\.


--
-- TOC entry 3111 (class 0 OID 32026847)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 32027099)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5669-a2a5-9300-2fc1c3c0cb38	00180000-5669-a2a5-30a1-ce321d329d1d	000c0000-5669-a2a5-439c-158fd8ba7e63	00090000-5669-a2a5-eef7-d3ba5cf06751	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-a2a5-b442-38a44d5799b3	00180000-5669-a2a5-30a1-ce321d329d1d	000c0000-5669-a2a5-151c-3d561905682e	00090000-5669-a2a5-2d64-969935dc7eb6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-a2a5-f1e7-4fc0abba8c7e	00180000-5669-a2a5-30a1-ce321d329d1d	000c0000-5669-a2a5-c08f-a3e8e5bc585f	00090000-5669-a2a5-54f2-15ad45ea45c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-a2a5-004a-ee2450828602	00180000-5669-a2a5-30a1-ce321d329d1d	000c0000-5669-a2a5-4b68-e1f5030dadb8	00090000-5669-a2a5-2509-bc5e8f58c4ed	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-a2a5-b068-e096875006fa	00180000-5669-a2a5-30a1-ce321d329d1d	000c0000-5669-a2a5-a664-4bfc7317538c	00090000-5669-a2a5-6a37-4ba886b2ffa7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5669-a2a5-4db5-4356abd7b248	00180000-5669-a2a5-4101-d81cccff7a2f	\N	00090000-5669-a2a5-6a37-4ba886b2ffa7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5669-a2a5-0801-6c5ddd51ddfd	00180000-5669-a2a5-4101-d81cccff7a2f	\N	00090000-5669-a2a5-2d64-969935dc7eb6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 32027311)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5669-a2a2-b6de-1552e53beb41	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5669-a2a2-2e44-4e03ee2b24e9	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5669-a2a2-73dd-e762cba6b73c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5669-a2a2-edfc-3982463ab1c0	04	Režija	Režija	Režija	umetnik	30
000f0000-5669-a2a2-0222-53bce3626121	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5669-a2a2-501d-4c3849b6181e	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5669-a2a2-734b-dc034da2d973	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5669-a2a2-0c74-d89a5319a843	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5669-a2a2-d9a6-3c4c70deba14	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5669-a2a2-da7e-7ef08dabd522	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5669-a2a2-4c4c-fa1dc5ddcae7	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5669-a2a2-7063-63318be0d341	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5669-a2a2-72f5-5a15ea66407f	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5669-a2a2-ffac-a1d94bf63dff	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5669-a2a2-7b1e-9418e64ef42d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5669-a2a2-1a4e-c515d1beb777	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5669-a2a2-bb0f-6b19ba035302	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5669-a2a2-589d-87b5eb768cfe	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 32026798)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5669-a2a4-eb01-80d03df18027	0001	šola	osnovna ali srednja šola
00400000-5669-a2a4-eb59-1128c7152335	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5669-a2a4-5f94-383da4026ebc	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 32027606)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5669-a2a2-6c34-3a9ac34750a4	01	Velika predstava	f	1.00	1.00
002b0000-5669-a2a2-a83e-aea2385491ce	02	Mala predstava	f	0.50	0.50
002b0000-5669-a2a2-4c28-a2ba4a5d5236	03	Mala koprodukcija	t	0.40	1.00
002b0000-5669-a2a2-3a4f-caf5b2e0dcc7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5669-a2a2-a87b-3a7145c7b59b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 32027079)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5669-a2a2-029a-9034345510af	0001	prva vaja	prva vaja
00420000-5669-a2a2-9529-39b9a43a8a51	0002	tehnična vaja	tehnična vaja
00420000-5669-a2a2-d769-d67377dde876	0003	lučna vaja	lučna vaja
00420000-5669-a2a2-2b16-1efd25b09bb9	0004	kostumska vaja	kostumska vaja
00420000-5669-a2a2-ac13-4515b4e4c39f	0005	foto vaja	foto vaja
00420000-5669-a2a2-bf82-15a5910282d9	0006	1. glavna vaja	1. glavna vaja
00420000-5669-a2a2-28b5-1e771b3c7680	0007	2. glavna vaja	2. glavna vaja
00420000-5669-a2a2-9c00-def0418c334b	0008	1. generalka	1. generalka
00420000-5669-a2a2-86ac-82974be1f056	0009	2. generalka	2. generalka
00420000-5669-a2a2-7ca8-2236768e9a22	0010	odprta generalka	odprta generalka
00420000-5669-a2a2-1961-ba71a483c1eb	0011	obnovitvena vaja	obnovitvena vaja
00420000-5669-a2a2-cdef-103146479057	0012	italijanka	krajša "obnovitvena" vaja
00420000-5669-a2a2-5cf9-ea07679185c2	0013	pevska vaja	pevska vaja
00420000-5669-a2a2-6e8c-509e4283c6f8	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5669-a2a2-a0e9-2cd0d59f130b	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 32026920)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 32026734)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5669-a2a3-99a2-ca454a3ea649	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO7MMeYRJZgLqu8Et0IJtQ2lwGl055Pn6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-d5fe-ae075f1533e5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-e940-7075066850d6	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-ec2a-e400fe8229c8	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-f914-c36e62f92ac7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-6c6d-b932098b82dd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-4823-bbc249c546e1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-40f3-070eb25bfb8f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-1e89-50b703de6e3f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-ff0a-3ee5db828afe	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-858a-044465ce5377	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-bfbf-5fb94977a5a1	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-afaa-74d0211631f5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-2654-0a42e937cdd1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-5db0-dd73328b3ec7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-444f-c38bc5b443c9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-8eb3-b0aa04c2f97c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-3609-8705dc39376b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-6087-4418ec674fe0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5669-a2a5-b3c2-1844039af831	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5669-a2a3-35c5-bd9278702f97	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 32027361)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5669-a2a5-c5a7-3760151aff25	00160000-5669-a2a4-7c12-3e9715bdada6	\N	00140000-5669-a2a2-fef0-24cb6671c223	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5669-a2a4-3231-7cc2ebef7532
000e0000-5669-a2a5-f416-d9e23cf85136	00160000-5669-a2a4-92c5-37963a1e6d32	\N	00140000-5669-a2a2-a848-c18dc3f8c829	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5669-a2a4-a9fe-2b4eb96ac3d0
000e0000-5669-a2a5-d93a-b8481b0628ba	\N	\N	00140000-5669-a2a2-a848-c18dc3f8c829	00190000-5669-a2a5-7ca9-9234ae29a7bd	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5669-a2a4-3231-7cc2ebef7532
000e0000-5669-a2a5-113d-14625da6bce2	\N	\N	00140000-5669-a2a2-a848-c18dc3f8c829	00190000-5669-a2a5-7ca9-9234ae29a7bd	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5669-a2a4-3231-7cc2ebef7532
000e0000-5669-a2a5-af27-82b0750b8928	\N	\N	00140000-5669-a2a2-a848-c18dc3f8c829	00190000-5669-a2a5-7ca9-9234ae29a7bd	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5669-a2a4-607d-e64999f5731e
000e0000-5669-a2a5-0e9b-b49e30cd10f1	\N	\N	00140000-5669-a2a2-a848-c18dc3f8c829	00190000-5669-a2a5-7ca9-9234ae29a7bd	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5669-a2a4-607d-e64999f5731e
\.


--
-- TOC entry 3125 (class 0 OID 32027019)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5669-a2a5-8237-93595bb0877f	\N	000e0000-5669-a2a5-f416-d9e23cf85136	1	
00200000-5669-a2a5-81c1-715b7e389c2c	\N	000e0000-5669-a2a5-f416-d9e23cf85136	2	
00200000-5669-a2a5-2bc5-110379362aa0	\N	000e0000-5669-a2a5-f416-d9e23cf85136	3	
00200000-5669-a2a5-dd23-fe6c8a7b9a0d	\N	000e0000-5669-a2a5-f416-d9e23cf85136	4	
00200000-5669-a2a5-ff4c-ccdf655b10a5	\N	000e0000-5669-a2a5-f416-d9e23cf85136	5	
\.


--
-- TOC entry 3142 (class 0 OID 32027170)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 32027284)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5669-a2a2-4ea8-87e46c1e2665	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5669-a2a2-7888-b475c88ce9dd	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5669-a2a2-c14f-fdfa4b89a5b0	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5669-a2a2-3856-daafda2e3f4b	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5669-a2a2-1467-1cc8a712817d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5669-a2a2-a906-1f867c992e56	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5669-a2a2-f33d-6dfcc14263e9	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5669-a2a2-42c7-4e8927c7edec	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5669-a2a2-7e6e-ea3893f7d50c	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5669-a2a2-33fd-e4d6a7146597	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5669-a2a2-4a83-bd61e3090abb	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5669-a2a2-6a57-bbadc0f8f77b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5669-a2a2-5e08-6c7b6277b34b	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5669-a2a2-36ee-3992432d96bb	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5669-a2a2-6f10-72888b278e9c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5669-a2a2-6d9f-5b063a008ee5	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5669-a2a2-df60-fad4365e6c96	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5669-a2a2-3d7e-4e7b79dfa99e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5669-a2a2-003a-fb72aa61f617	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5669-a2a2-a44c-c54d07df5bea	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5669-a2a2-4f37-b28ee6cf90a1	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5669-a2a2-db1b-ee622652ada8	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5669-a2a2-97ad-a72434d367c2	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5669-a2a2-5706-d356ff3309b9	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5669-a2a2-b70c-d8cc08e2f0ea	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5669-a2a2-31d4-72ee6eb7a863	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5669-a2a2-1c2e-ded759b69b36	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5669-a2a2-26ef-5398579dcfe0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 32027656)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 32027625)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 32027668)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32027242)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5669-a2a5-99ec-352070e7a587	00090000-5669-a2a5-2d64-969935dc7eb6	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-a2a5-3cfb-508504471a7c	00090000-5669-a2a5-54f2-15ad45ea45c8	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-a2a5-6cef-cd5d1e7d8e31	00090000-5669-a2a5-f0af-fcc8f2dc2740	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-a2a5-5500-cb51755ef203	00090000-5669-a2a5-5b13-388d6f306493	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-a2a5-b5aa-045593807b70	00090000-5669-a2a5-0cc1-da0939de2438	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5669-a2a5-9384-7570415f30e3	00090000-5669-a2a5-93a0-0d376cba94ff	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 32027063)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 32027351)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5669-a2a2-fef0-24cb6671c223	01	Drama	drama (SURS 01)
00140000-5669-a2a2-2df1-31327664e02c	02	Opera	opera (SURS 02)
00140000-5669-a2a2-64df-afa6740f9c0a	03	Balet	balet (SURS 03)
00140000-5669-a2a2-cd62-4c213ac0ec90	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5669-a2a2-9d4b-523046850454	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5669-a2a2-a848-c18dc3f8c829	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5669-a2a2-82d8-c1b2a59334aa	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 32027232)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 32026797)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 32027410)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 32027400)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32026788)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 32027267)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32027309)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 32027709)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32027051)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 32027073)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 32027078)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 32027623)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 32026946)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32027479)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 32027228)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32027017)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 32026984)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 32026960)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 32027135)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 32027686)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32027693)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 32027717)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 32019544)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2728 (class 2606 OID 32027162)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32026918)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 32026816)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 32026880)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 32026843)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 32026777)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 32026762)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32027168)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32027204)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 32027346)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 32026871)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 32026906)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 32027574)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 32027141)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 32026896)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 32027036)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 32027005)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 32026997)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 32027153)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 32027583)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 32027591)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 32027561)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32027604)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 32027186)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 32027126)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 32027117)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32027333)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 32027260)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32026972)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32026733)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 32027195)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 32026751)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 32026771)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 32027213)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 32027148)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 32027097)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 32026721)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 32026709)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 32026703)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 32027280)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 32026852)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 32027108)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 32027320)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 32026805)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 32027616)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 32027086)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 32026931)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32026746)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 32027379)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 32027026)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 32027176)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32027292)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32027666)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32027650)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 32027674)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 32027250)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 32027067)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 32027359)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 32027240)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 32027061)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 32027062)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 32027060)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 32027059)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 32027058)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 32027281)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 32027282)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 32027283)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 32027688)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 32027687)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 32026873)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 32026874)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 32027169)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 32027654)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 32027653)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 32027655)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 32027652)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 32027651)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 32027155)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 32027154)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 32027027)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 32027028)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 32027229)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 32027231)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 32027230)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 32026962)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 32026961)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 32027605)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 32027348)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 32027349)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 32027350)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 32027675)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 32027384)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 32027381)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 32027385)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 32027383)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 32027382)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 32026933)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32026932)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 32026846)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 32027196)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 32026778)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 32026779)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 32027216)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 32027215)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 32027214)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 32026883)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 32026882)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 32026884)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 32027000)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 32026998)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 32026999)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 32026711)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 32027121)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 32027119)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 32027118)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 32027120)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 32026752)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 32026753)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 32027177)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 32027710)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 32027269)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 32027268)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 32027718)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 32027719)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 32027142)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 32027261)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 32027262)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 32027484)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 32027483)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 32027480)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 32027481)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 32027482)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 32026898)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 32026897)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 32026899)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 32027190)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 32027189)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 32027584)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 32027585)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 32027414)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 32027415)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 32027412)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 32027413)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 32027251)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 32027252)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 32027130)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 32027129)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 32027127)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 32027128)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 32027402)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 32027401)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 32026973)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 32026987)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 32026986)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 32026985)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 32026988)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 32027018)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 32027006)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 32027007)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 32027575)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 32027624)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 32027694)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 32027695)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 32026818)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 32026817)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 32026853)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 32026854)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 32027068)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 32027111)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 32027110)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 32027109)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 32027053)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 32027054)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 32027057)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 32027052)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 32027056)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 32027055)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 32026872)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32026806)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 32026807)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 32026947)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32026949)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 32026948)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 32026950)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 32027136)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 32027347)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 32027380)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 32027321)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 32027322)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 32026844)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 32026845)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 32027241)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 32026722)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 32026919)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 32026881)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 32026710)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 32027617)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 32027188)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 32027187)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 32027087)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 32027088)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 32027411)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 32026907)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 32027360)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 32027667)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 32027592)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 32027593)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 32027310)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 32027098)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 32026772)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 32027890)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 32027895)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 32027920)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 32027910)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 32027885)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 32027905)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 32027915)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 32027900)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 32028090)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 32028095)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 32028100)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 32028265)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 32028260)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 32027775)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 32027780)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 32028005)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 32028245)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 32028240)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 32028250)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 32028235)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 32028230)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 32028000)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 32027995)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 32027875)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 32027880)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 32028045)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 32028055)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 32028050)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 32027830)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 32027825)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 32027985)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 32028220)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 32028105)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 32028110)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 32028115)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 32028255)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 32028135)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 32028120)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 32028140)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 32028130)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 32028125)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 32027820)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 32027815)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 32027760)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 32027755)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 32028025)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 32027735)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 32027740)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 32028040)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 32028035)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 32028030)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 32027790)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 32027785)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 32027795)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 32027855)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 32027845)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 32027850)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 32027720)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 32027960)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 32027950)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 32027945)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 32027955)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 32027725)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 32027730)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 32028010)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 32028280)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32028085)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 32028080)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 32028285)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 32028290)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 32027990)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 32028070)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 32028075)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 32028195)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 32028190)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 32028175)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 32028180)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 32028185)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 32027805)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 32027800)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 32027810)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 32028020)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 32028015)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 32028205)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 32028210)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 32028165)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 32028170)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 32028155)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 32028160)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 32028060)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 32028065)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 32027980)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 32027975)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 32027965)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 32027970)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 32028150)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 32028145)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 32027835)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 32027840)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 32027870)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 32027860)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 32027865)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 32028200)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 32028215)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 32028225)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 32028270)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 32028275)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 32027750)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 32027745)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 32027765)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 32027770)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 32027925)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 32027940)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 32027935)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 32027930)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-10 17:04:56 CET

--
-- PostgreSQL database dump complete
--

