--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-13 13:27:31 CET

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
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 26743907)
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
-- TOC entry 237 (class 1259 OID 26744521)
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
-- TOC entry 236 (class 1259 OID 26744504)
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
-- TOC entry 182 (class 1259 OID 26743900)
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
-- TOC entry 181 (class 1259 OID 26743898)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 26744381)
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
-- TOC entry 230 (class 1259 OID 26744411)
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
-- TOC entry 251 (class 1259 OID 26744811)
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
-- TOC entry 203 (class 1259 OID 26744155)
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
-- TOC entry 205 (class 1259 OID 26744187)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 26744192)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 26744734)
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
-- TOC entry 194 (class 1259 OID 26744052)
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
-- TOC entry 238 (class 1259 OID 26744534)
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
-- TOC entry 223 (class 1259 OID 26744335)
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
-- TOC entry 200 (class 1259 OID 26744126)
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
-- TOC entry 197 (class 1259 OID 26744092)
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
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 26744069)
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
-- TOC entry 212 (class 1259 OID 26744249)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 26744792)
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
-- TOC entry 250 (class 1259 OID 26744804)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 26744826)
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
-- TOC entry 216 (class 1259 OID 26744274)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 26744026)
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
-- TOC entry 185 (class 1259 OID 26743926)
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
-- TOC entry 189 (class 1259 OID 26743993)
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
-- TOC entry 186 (class 1259 OID 26743937)
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
-- TOC entry 178 (class 1259 OID 26743872)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 26743891)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 26744281)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 26744315)
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
-- TOC entry 233 (class 1259 OID 26744452)
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
-- TOC entry 188 (class 1259 OID 26743973)
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
-- TOC entry 191 (class 1259 OID 26744018)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 26744679)
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
-- TOC entry 213 (class 1259 OID 26744255)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 26744003)
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
-- TOC entry 202 (class 1259 OID 26744147)
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
-- TOC entry 198 (class 1259 OID 26744107)
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
-- TOC entry 199 (class 1259 OID 26744119)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 26744267)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 26744693)
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
-- TOC entry 242 (class 1259 OID 26744703)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 26744602)
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
-- TOC entry 243 (class 1259 OID 26744711)
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
-- TOC entry 219 (class 1259 OID 26744296)
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
-- TOC entry 211 (class 1259 OID 26744240)
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
-- TOC entry 210 (class 1259 OID 26744230)
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
-- TOC entry 232 (class 1259 OID 26744441)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 26744371)
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
-- TOC entry 196 (class 1259 OID 26744081)
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
-- TOC entry 175 (class 1259 OID 26743843)
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
-- TOC entry 174 (class 1259 OID 26743841)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 26744309)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 26743881)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 26743865)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 26744323)
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
-- TOC entry 214 (class 1259 OID 26744261)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 26744207)
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
-- TOC entry 173 (class 1259 OID 26743830)
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
-- TOC entry 172 (class 1259 OID 26743822)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 26743817)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 26744388)
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
-- TOC entry 187 (class 1259 OID 26743965)
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
-- TOC entry 209 (class 1259 OID 26744217)
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
-- TOC entry 231 (class 1259 OID 26744429)
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
-- TOC entry 184 (class 1259 OID 26743916)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 26744722)
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
-- TOC entry 207 (class 1259 OID 26744197)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 26744038)
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
-- TOC entry 176 (class 1259 OID 26743852)
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
-- TOC entry 235 (class 1259 OID 26744479)
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
-- TOC entry 201 (class 1259 OID 26744137)
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
-- TOC entry 218 (class 1259 OID 26744288)
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
-- TOC entry 229 (class 1259 OID 26744402)
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
-- TOC entry 247 (class 1259 OID 26744772)
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
-- TOC entry 246 (class 1259 OID 26744741)
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
-- TOC entry 248 (class 1259 OID 26744784)
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
-- TOC entry 225 (class 1259 OID 26744360)
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
-- TOC entry 204 (class 1259 OID 26744181)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 26744469)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 26744350)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 26743903)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 26743846)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3104 (class 0 OID 26743907)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5645-d730-6980-cf3f6196ecf4	10	30	Otroci	Abonma za otroke	200
000a0000-5645-d730-218c-c4a851ff2e5e	20	60	Mladina	Abonma za mladino	400
000a0000-5645-d730-377f-a51a5e6de0e7	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3158 (class 0 OID 26744521)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5645-d731-883f-5ef7b87bb632	000d0000-5645-d730-c664-433a7f92d3ef	\N	00090000-5645-d730-c07c-f04c14f36ddd	000b0000-5645-d730-3156-7e78c61ca677	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5645-d731-4af3-a977a76ef219	000d0000-5645-d730-29b5-4b6cc9176092	00100000-5645-d730-6b7d-0b094d29e5ec	00090000-5645-d730-2982-fa619ff4416f	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5645-d731-5e14-740f690905af	000d0000-5645-d730-bf9f-49bea1b332fb	00100000-5645-d730-a68c-3a775e756cc4	00090000-5645-d730-8e0c-806b6d847cc7	\N	0003	t	\N	2015-11-13	\N	2	t	\N	f	f
000c0000-5645-d731-9d57-15fa7fdd60a0	000d0000-5645-d730-4409-5ba1f7b0a570	\N	00090000-5645-d730-b4d9-f1037a5a7740	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5645-d731-2880-4410450d06f4	000d0000-5645-d730-0b41-8696233bf0bc	\N	00090000-5645-d730-f00e-b7dc9d972e99	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5645-d731-c46d-d677f49d654e	000d0000-5645-d730-d394-6303d7d2a0a6	\N	00090000-5645-d730-a6be-5504722394b7	000b0000-5645-d730-1e4e-542b8e0b41dd	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5645-d731-c920-9249364eb6a2	000d0000-5645-d730-cb53-f76daeac2672	00100000-5645-d730-9020-c27640854482	00090000-5645-d730-3927-f6365c1fd5bb	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5645-d731-fbca-5c309fcc86d0	000d0000-5645-d730-0966-d34403031727	\N	00090000-5645-d730-cc76-eb57b11580cc	000b0000-5645-d730-8e95-9da74e097e6e	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5645-d731-39cc-1d84c147c7a4	000d0000-5645-d730-cb53-f76daeac2672	00100000-5645-d730-f042-9302ebd33e32	00090000-5645-d730-c0f7-cea69ccd0739	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5645-d731-3e5e-af2fb57d9e91	000d0000-5645-d730-cb53-f76daeac2672	00100000-5645-d730-25c5-893665a38492	00090000-5645-d730-be5e-6b60ae2d7569	\N	0010	t	\N	2015-11-13	\N	16	f	\N	f	t
000c0000-5645-d731-ac9d-d0c62f2cc5ee	000d0000-5645-d730-cb53-f76daeac2672	00100000-5645-d730-4e2c-ab8884ed38af	00090000-5645-d730-9da2-bca780a381d5	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5645-d731-a948-ae9820d3dd6a	000d0000-5645-d730-3673-058f9ed10a1f	00100000-5645-d730-6b7d-0b094d29e5ec	00090000-5645-d730-2982-fa619ff4416f	000b0000-5645-d730-25f7-c80f32c1fa37	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3157 (class 0 OID 26744504)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 26743900)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3148 (class 0 OID 26744381)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5645-d730-8f96-8ae5317e21a1	00160000-5645-d730-8aa1-045ceb7d70aa	00090000-5645-d730-18df-43179c2dd4c5	aizv	10	t
003d0000-5645-d730-4982-0fb0fb169a12	00160000-5645-d730-8aa1-045ceb7d70aa	00090000-5645-d730-d38c-4958a43aa771	apri	14	t
003d0000-5645-d730-b4e3-2d4b5cd1468e	00160000-5645-d730-cb63-61b74a30500d	00090000-5645-d730-992b-1f0af483cac5	aizv	11	t
003d0000-5645-d730-c548-c290a7fb106a	00160000-5645-d730-1679-6dbe13f1be95	00090000-5645-d730-41d6-f1e2c0c52bde	aizv	12	t
003d0000-5645-d730-380d-bbc08bea4839	00160000-5645-d730-8aa1-045ceb7d70aa	00090000-5645-d730-b056-3b3774a52bf7	apri	18	f
\.


--
-- TOC entry 3151 (class 0 OID 26744411)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5645-d730-8aa1-045ceb7d70aa	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5645-d730-cb63-61b74a30500d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5645-d730-1679-6dbe13f1be95	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3172 (class 0 OID 26744811)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 26744155)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5645-d730-914e-b925c1106304	\N	\N	00200000-5645-d730-c0c3-1ca12cf5f389	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5645-d730-06c1-c7aee951c0b2	\N	\N	00200000-5645-d730-dd63-345779cdb038	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5645-d730-76b5-860e0cb81cfe	\N	\N	00200000-5645-d730-85c1-64c417ef1226	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5645-d730-86e4-388d9af24580	\N	\N	00200000-5645-d730-47f2-df0af04b6530	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5645-d730-ec9a-9e7c0ec1d7a8	\N	\N	00200000-5645-d730-8967-51b2a13b1c89	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3126 (class 0 OID 26744187)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 26744192)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 26744734)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 26744052)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5645-d72e-48fb-24cd721f13c5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5645-d72e-b948-a262efc74074	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5645-d72e-723f-14dbd6d9015f	AL	ALB	008	Albania 	Albanija	\N
00040000-5645-d72e-8242-a4c0ca7176ce	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5645-d72e-a6aa-17ce1a39bf67	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5645-d72e-42b9-bb926d23441b	AD	AND	020	Andorra 	Andora	\N
00040000-5645-d72e-635d-9a0fb64a9eb2	AO	AGO	024	Angola 	Angola	\N
00040000-5645-d72e-6ac8-a30cf40319dd	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5645-d72e-463e-7ee3f8e82c72	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5645-d72e-9ab1-65794f2e7679	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5645-d72e-e1e8-ed7cf9c2fee8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5645-d72e-7673-6e1977745759	AM	ARM	051	Armenia 	Armenija	\N
00040000-5645-d72e-9444-380bd573e41b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5645-d72e-335f-85b1f2e4315b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5645-d72e-8568-12a714fe271b	AT	AUT	040	Austria 	Avstrija	\N
00040000-5645-d72e-ad15-80d938311140	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5645-d72e-b81b-523d07ee38de	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5645-d72e-6531-4f16e106027f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5645-d72e-1945-eaa335a4cc80	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5645-d72e-1e03-6938afa9de74	BB	BRB	052	Barbados 	Barbados	\N
00040000-5645-d72e-e58a-edacd702fdc0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5645-d72e-6ce7-ea2c5ea7c95d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5645-d72e-67be-1cc2a1400fba	BZ	BLZ	084	Belize 	Belize	\N
00040000-5645-d72e-58e4-c6f6d44c7186	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5645-d72e-4e3a-a53c24a14d10	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5645-d72e-5237-5c501bf0d08a	BT	BTN	064	Bhutan 	Butan	\N
00040000-5645-d72e-056e-f5a293ee873f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5645-d72e-7b07-58bf587a7d7a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5645-d72e-f4a8-19950ab8449e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5645-d72e-b8cd-7ea99a8a6c88	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5645-d72e-d9b2-7d336091ac7b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5645-d72e-9b7b-2883ded52916	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5645-d72e-5ef7-dc76e6262ae9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5645-d72e-2a96-817d6e20e5a0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5645-d72e-3024-3c405ec4e1f1	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5645-d72e-5b68-18af47b7a1c9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5645-d72e-6e14-c469eecd342c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5645-d72e-602f-4046f4609a54	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5645-d72e-04b0-5a819f9405a7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5645-d72e-bbc7-4313682cf9dc	CA	CAN	124	Canada 	Kanada	\N
00040000-5645-d72e-8d65-976447ca4cda	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5645-d72e-bbc3-6b3d53fb40f5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5645-d72e-ea8b-b644100e7bc8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5645-d72e-2a89-6be6c9406024	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5645-d72e-313c-527250b70dd1	CL	CHL	152	Chile 	Čile	\N
00040000-5645-d72e-b894-3bbe5b0194bd	CN	CHN	156	China 	Kitajska	\N
00040000-5645-d72e-09d1-f1b6f177d9a1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5645-d72e-9d4f-58e90c2c973e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5645-d72e-29eb-ef33270701d2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5645-d72e-ad5a-411960041758	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5645-d72e-0be8-e49fa61bc38f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5645-d72e-ab39-8bad2c2f3a73	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5645-d72e-fc15-4b5c2b6869ab	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5645-d72e-bad7-67150e3a064a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5645-d72e-c249-c8f89f9c3526	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5645-d72e-7920-ac3d6af797b9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5645-d72e-6cb9-32b08652d273	CU	CUB	192	Cuba 	Kuba	\N
00040000-5645-d72e-b60d-5a0cfbb44f6e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5645-d72e-f001-592ccb8a47b9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5645-d72e-0a90-b484b25fb20f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5645-d72e-4701-63c3bae847f7	DK	DNK	208	Denmark 	Danska	\N
00040000-5645-d72e-e2d8-b25b7a478a1d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5645-d72e-2eb3-7323ad9908fc	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5645-d72e-066e-09ec8094ce05	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5645-d72e-be8a-70f5f8595c62	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5645-d72e-cd4c-3862719de74f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5645-d72e-d656-868f74bd417f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5645-d72e-8289-8d992e3ac701	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5645-d72e-1027-5715696376d0	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5645-d72e-bdf2-3ba3aa0fa675	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5645-d72e-b1db-d7664d3861f7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5645-d72e-96f9-dce0f13ec03f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5645-d72e-a5d6-74407bfc99a9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5645-d72e-29b2-3ba2a0cb5d69	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5645-d72e-a536-ac6eed173dfc	FI	FIN	246	Finland 	Finska	\N
00040000-5645-d72e-3571-c1796bc07dc5	FR	FRA	250	France 	Francija	\N
00040000-5645-d72e-306e-310d0b9dbc70	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5645-d72e-7d24-7aa96ac85b4c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5645-d72e-eae3-0ea85a039868	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5645-d72e-0abb-9845b1be6df6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5645-d72e-d8b5-c7f66be321aa	GA	GAB	266	Gabon 	Gabon	\N
00040000-5645-d72e-bcc4-701ee971f8df	GM	GMB	270	Gambia 	Gambija	\N
00040000-5645-d72e-1f79-88d8b8758f19	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5645-d72e-54c0-1b6f91d8b628	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5645-d72e-4f04-23c002fc460e	GH	GHA	288	Ghana 	Gana	\N
00040000-5645-d72e-3250-7280901f0d4f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5645-d72e-4894-5c13eaca4cba	GR	GRC	300	Greece 	Grčija	\N
00040000-5645-d72e-2fb7-658a928a761f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5645-d72e-8f18-c737c94cb635	GD	GRD	308	Grenada 	Grenada	\N
00040000-5645-d72e-62e6-54da82183afd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5645-d72e-1619-b1463f6b9dad	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5645-d72e-0e0c-c804f60ae8e2	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5645-d72e-ea33-ef9604ee7b5c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5645-d72e-0beb-73b2fc450e2b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5645-d72e-5e74-5f0a85cedb4a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5645-d72e-dfd7-c15d3585dabb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5645-d72e-234e-52f0e7109acc	HT	HTI	332	Haiti 	Haiti	\N
00040000-5645-d72e-ac2c-25233087c1be	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5645-d72e-b033-fd6c05b7b221	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5645-d72e-32e4-7da6a597f06f	HN	HND	340	Honduras 	Honduras	\N
00040000-5645-d72e-a830-79eef20dbcea	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5645-d72e-feff-d45917ce7cae	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5645-d72e-6651-b04f48209259	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5645-d72e-c4f7-23c7f237fce6	IN	IND	356	India 	Indija	\N
00040000-5645-d72e-dcd7-1c3a7a525571	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5645-d72e-9446-ae73aeb11523	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5645-d72e-977a-a71e05c86b57	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5645-d72e-3022-3cfd9d071fa1	IE	IRL	372	Ireland 	Irska	\N
00040000-5645-d72e-5787-4488ad15e112	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5645-d72e-7f1a-626aa724b93f	IL	ISR	376	Israel 	Izrael	\N
00040000-5645-d72e-3fe2-13efc986da56	IT	ITA	380	Italy 	Italija	\N
00040000-5645-d72e-be07-33149db34a26	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5645-d72e-1af5-d45a524a72d8	JP	JPN	392	Japan 	Japonska	\N
00040000-5645-d72e-40d5-bdeb627eef2a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5645-d72e-b936-6415de36d7f4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5645-d72e-872a-f0c4d84c2c8a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5645-d72e-c328-65f019970974	KE	KEN	404	Kenya 	Kenija	\N
00040000-5645-d72e-9681-6bcddcf5a9a2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5645-d72e-42ba-3d3570dfda3b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5645-d72e-0199-35631e549478	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5645-d72e-02fc-247b4641275f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5645-d72e-4924-2bc65c00eb2f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5645-d72e-b58d-bf3ed56a83f6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5645-d72e-a284-e45944766343	LV	LVA	428	Latvia 	Latvija	\N
00040000-5645-d72e-13a6-037cca52f2c5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5645-d72e-21ac-12f18783ab28	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5645-d72e-cefc-c90bcf0701f6	LR	LBR	430	Liberia 	Liberija	\N
00040000-5645-d72e-d4cc-25d384572fdd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5645-d72e-007a-696c148cd344	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5645-d72e-17ff-6ae8c713cdcc	LT	LTU	440	Lithuania 	Litva	\N
00040000-5645-d72e-17af-35d46cc97138	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5645-d72e-a197-7d5bc6b974f4	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5645-d72e-08ed-5a4b9af7adb9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5645-d72e-d587-3eae8d962f5e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5645-d72e-85cf-f25903bb7aa5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5645-d72e-6576-78234af4ace5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5645-d72e-dbc2-003e0660e691	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5645-d72e-3ab3-941a4e3f8f2a	ML	MLI	466	Mali 	Mali	\N
00040000-5645-d72e-3e30-9ade870cd019	MT	MLT	470	Malta 	Malta	\N
00040000-5645-d72e-309d-8b2123f12aec	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5645-d72e-a805-45f5632164ce	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5645-d72e-a07a-48223b270f43	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5645-d72e-5631-0d037365018e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5645-d72e-f171-7d0f60408ef6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5645-d72e-f136-a2c54bdd2540	MX	MEX	484	Mexico 	Mehika	\N
00040000-5645-d72e-0ea9-7d716aa09cb7	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5645-d72e-96c2-4573d306c593	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5645-d72e-02a0-28df53f8b796	MC	MCO	492	Monaco 	Monako	\N
00040000-5645-d72e-a9d5-475d2cc6a2fa	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5645-d72e-f757-0508c8dfcfcf	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5645-d72e-0279-c50f40686838	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5645-d72e-0b89-bdb1ba6ab784	MA	MAR	504	Morocco 	Maroko	\N
00040000-5645-d72e-6fcc-e6464ffd6361	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5645-d72e-0b2d-a46692403b18	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5645-d72e-2226-9715d70b4056	NA	NAM	516	Namibia 	Namibija	\N
00040000-5645-d72e-94d3-bbf7472294db	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5645-d72e-459a-73d22a2b51ac	NP	NPL	524	Nepal 	Nepal	\N
00040000-5645-d72e-cc49-4fd255c4ca8f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5645-d72e-a1a4-2dfadb42ef9e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5645-d72e-2eb4-2786642ae882	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5645-d72e-e147-0c0fdac76f12	NE	NER	562	Niger 	Niger 	\N
00040000-5645-d72e-d9ef-505c4be1b36c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5645-d72e-e2d3-33b6e79f750e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5645-d72e-33eb-7ab1fcb47d1b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5645-d72e-350a-a7a3db93fcd8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5645-d72e-c4de-bb0d1ec58ac5	NO	NOR	578	Norway 	Norveška	\N
00040000-5645-d72e-888a-7fe2bc5cd55d	OM	OMN	512	Oman 	Oman	\N
00040000-5645-d72e-3270-761695fd65f4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5645-d72e-d685-efec5c92899c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5645-d72e-8379-e8049ce49804	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5645-d72e-93ef-340aaa7d661b	PA	PAN	591	Panama 	Panama	\N
00040000-5645-d72e-361b-c7f685702d66	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5645-d72e-91bd-92c6671dfb5e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5645-d72e-4c49-64fe18b55be0	PE	PER	604	Peru 	Peru	\N
00040000-5645-d72e-75c5-bbe508ae4a59	PH	PHL	608	Philippines 	Filipini	\N
00040000-5645-d72e-578f-d4d12dc7a9ec	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5645-d72e-277f-f318efc48574	PL	POL	616	Poland 	Poljska	\N
00040000-5645-d72e-caa5-fe3158adace4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5645-d72e-9c52-01c8892d0593	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5645-d72e-396a-13000ff5d63f	QA	QAT	634	Qatar 	Katar	\N
00040000-5645-d72e-0383-349be5634c4a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5645-d72e-17bc-fad18e37e0c4	RO	ROU	642	Romania 	Romunija	\N
00040000-5645-d72e-c186-1c36642681c7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5645-d72e-86c2-c45fa7e52799	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5645-d72e-5e8f-e69b071b28ff	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5645-d72e-61ee-b0ecb592975c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5645-d72e-4f6f-6ed9b99e2854	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5645-d72e-a92f-3db8dabf5605	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5645-d72e-204d-032204ba4d18	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5645-d72e-6f9c-52881dd7ba53	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5645-d72e-0bed-e6ece186acfc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5645-d72e-b6f9-1f6a574ce699	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5645-d72e-8d9e-2446ab69b814	SM	SMR	674	San Marino 	San Marino	\N
00040000-5645-d72e-ebea-72384aa19ac8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5645-d72e-2d03-3197e06019a5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5645-d72e-9ea2-e17a5dd8405f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5645-d72e-f6dc-d2363326e462	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5645-d72e-ec58-853a0d9af1ef	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5645-d72e-5594-473d76390b02	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5645-d72e-fe8c-b2fee754233a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5645-d72e-48d1-deb86d62f485	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5645-d72e-1c19-1c0f46ac9436	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5645-d72e-f3fe-4de26d7ebf63	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5645-d72e-08c8-c6d76a781812	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5645-d72e-9ee2-8ecfe443b80e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5645-d72e-cc81-d529c54691c3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5645-d72e-003d-d1940f19476b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5645-d72e-3e63-1911e8cd581a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5645-d72e-4b78-0b57933419b6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5645-d72e-4194-cf3aa32ff0c1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5645-d72e-3a7e-c4b26d0462a4	SD	SDN	729	Sudan 	Sudan	\N
00040000-5645-d72e-4fae-d7d0f3b1dfc7	SR	SUR	740	Suriname 	Surinam	\N
00040000-5645-d72e-f985-a1645074fe20	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5645-d72e-20bf-5c40a0ab4d7d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5645-d72e-b105-f0ea1ae2a9a7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5645-d72e-d316-6ac41bb19bea	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5645-d72e-304a-cb8c7011cca7	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5645-d72e-e0e2-e795bd188b27	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5645-d72e-3c5f-3c1957f6f4dd	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5645-d72e-ddee-5b8988b22b95	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5645-d72e-3787-975161af1cb9	TH	THA	764	Thailand 	Tajska	\N
00040000-5645-d72e-e9ef-7140f4a0cacc	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5645-d72e-46c4-7e20186c3984	TG	TGO	768	Togo 	Togo	\N
00040000-5645-d72e-2993-84b4592d007f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5645-d72e-6d30-d1c849271c43	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5645-d72e-a757-c1f5548b3f3d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5645-d72e-5295-94433d3b4d57	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5645-d72e-20a1-6bc587057af5	TR	TUR	792	Turkey 	Turčija	\N
00040000-5645-d72e-af83-1723be909e98	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5645-d72e-eb17-dcf8af109d13	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5645-d72e-a775-270f092eef5e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5645-d72e-d05d-d32db0804237	UG	UGA	800	Uganda 	Uganda	\N
00040000-5645-d72e-0706-9d96b05def2a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5645-d72e-62e7-5f47f061a3c8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5645-d72e-52e0-5f600b5d52c1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5645-d72e-d805-7fe6ae499ff6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5645-d72e-21bc-7abbed2652a5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5645-d72e-bd7c-a761a26256ef	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5645-d72e-03dd-ca77dec0c364	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5645-d72e-87f7-ee0280561c4b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5645-d72e-1b62-53a47008aad6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5645-d72e-ca9e-dac7f2ba24a3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5645-d72e-df46-6dfe1b1141a2	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5645-d72e-0bea-081600c07415	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5645-d72e-50a2-df0a40cf1288	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5645-d72e-fa13-c2acb8a47e56	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5645-d72e-8d6d-6fec74157c63	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5645-d72e-f1d6-b3a9bf0653df	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5645-d72e-7a6c-3841c7341765	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3159 (class 0 OID 26744534)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5645-d730-1ce1-55fb0f726b6d	000e0000-5645-d730-93a5-40262ee5fabb	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5645-d72e-cef6-a093b99f33ae	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5645-d730-35b5-27fc50dd9c6d	000e0000-5645-d730-ee2b-aced88ab2937	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5645-d72e-036c-35c2d4a25f77	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5645-d730-2c10-68c50c30abdc	000e0000-5645-d730-bad6-4cafa063db08	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5645-d72e-cef6-a093b99f33ae	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5645-d731-23c8-b91a7c1a3401	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5645-d731-f9db-d8c25a93d18c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 26744335)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5645-d730-cb53-f76daeac2672	000e0000-5645-d730-ee2b-aced88ab2937	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5645-d72e-85e2-7a8dc6fd7b22
000d0000-5645-d730-c664-433a7f92d3ef	000e0000-5645-d730-ee2b-aced88ab2937	000c0000-5645-d731-883f-5ef7b87bb632	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5645-d72e-85e2-7a8dc6fd7b22
000d0000-5645-d730-29b5-4b6cc9176092	000e0000-5645-d730-ee2b-aced88ab2937	000c0000-5645-d731-4af3-a977a76ef219	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5645-d72e-509d-825b4ad0f4e3
000d0000-5645-d730-bf9f-49bea1b332fb	000e0000-5645-d730-ee2b-aced88ab2937	000c0000-5645-d731-5e14-740f690905af	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5645-d72e-5252-76e302366df7
000d0000-5645-d730-4409-5ba1f7b0a570	000e0000-5645-d730-ee2b-aced88ab2937	000c0000-5645-d731-9d57-15fa7fdd60a0	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5645-d72e-4a64-9565ab61c664
000d0000-5645-d730-0b41-8696233bf0bc	000e0000-5645-d730-ee2b-aced88ab2937	000c0000-5645-d731-2880-4410450d06f4	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5645-d72e-4a64-9565ab61c664
000d0000-5645-d730-d394-6303d7d2a0a6	000e0000-5645-d730-ee2b-aced88ab2937	000c0000-5645-d731-c46d-d677f49d654e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5645-d72e-85e2-7a8dc6fd7b22
000d0000-5645-d730-0966-d34403031727	000e0000-5645-d730-ee2b-aced88ab2937	000c0000-5645-d731-fbca-5c309fcc86d0	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5645-d72e-005b-005253ae0064
000d0000-5645-d730-3673-058f9ed10a1f	000e0000-5645-d730-ee2b-aced88ab2937	000c0000-5645-d731-a948-ae9820d3dd6a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5645-d72e-a93a-ce97dd5199ae
\.


--
-- TOC entry 3121 (class 0 OID 26744126)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 26744092)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 26744069)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5645-d730-f413-76da5729872f	00080000-5645-d730-e044-1937a682a55a	00090000-5645-d730-be5e-6b60ae2d7569	AK		igralka
\.


--
-- TOC entry 3133 (class 0 OID 26744249)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 26744792)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5645-d730-70ba-75ed073ac03a	00010000-5645-d72f-a0f6-292079ab0582	\N	Prva mapa	Root mapa	2015-11-13 13:27:28	2015-11-13 13:27:28	R	\N	\N
\.


--
-- TOC entry 3171 (class 0 OID 26744804)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 26744826)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 25231831)
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
-- TOC entry 3137 (class 0 OID 26744274)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 26744026)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5645-d72f-4c85-f995e7e699d8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5645-d72f-827c-34347ca97439	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5645-d72f-ab06-7bf224c61062	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5645-d72f-b48b-709622540813	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5645-d72f-a670-3a5e1b33ea78	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5645-d72f-db53-024ed97c35d5	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5645-d72f-b0c8-9a28ba4251bd	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5645-d72f-e86c-cca3d05b8503	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5645-d72f-ba17-7bdff0aa0d14	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5645-d72f-04d7-8f69c40c1124	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5645-d72f-a5ab-b3136c444c6b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5645-d72f-ca99-cfe6c10c9e1d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5645-d72f-bf73-f4989486f3f4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5645-d72f-7435-dc3b446caabd	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5645-d72f-7a59-c0071a95d4ae	fsacl.dostop	array	a:5:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}s:4:"RWDA";a:1:{s:5:"label";s:45:"Branje pisanje, brisanje, ažuriranje zapisov";}}	f	t	f	\N	ACL Javni dostop
00000000-5645-d730-a204-3e4f8cf1fbc3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5645-d730-05a0-b9889dd7d905	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5645-d730-f7de-d356fde17a6e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5645-d730-92fd-bde920fdc475	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5645-d730-6f1a-5359cddfa7b1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5645-d732-ed88-539e96a83508	application.tenant.maticnopodjetje	string	s:36:"00080000-5645-d732-8cc0-77884fdb059d";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3106 (class 0 OID 26743926)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5645-d730-6d1d-be904c947241	00000000-5645-d730-a204-3e4f8cf1fbc3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5645-d730-a813-c4c0be939308	00000000-5645-d730-a204-3e4f8cf1fbc3	00010000-5645-d72f-a0f6-292079ab0582	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5645-d730-802f-345466efa935	00000000-5645-d730-05a0-b9889dd7d905	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3110 (class 0 OID 26743993)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5645-d730-b3e1-b165068da149	\N	00100000-5645-d730-6b7d-0b094d29e5ec	00100000-5645-d730-a68c-3a775e756cc4	01	Gledališče Nimbis
00410000-5645-d730-363f-3b02117b29c4	00410000-5645-d730-b3e1-b165068da149	00100000-5645-d730-6b7d-0b094d29e5ec	00100000-5645-d730-a68c-3a775e756cc4	02	Tehnika
\.


--
-- TOC entry 3107 (class 0 OID 26743937)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5645-d730-c07c-f04c14f36ddd	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5645-d730-b4d9-f1037a5a7740	00010000-5645-d730-bcb4-d7d786fb61a5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5645-d730-8e0c-806b6d847cc7	00010000-5645-d730-1184-d92e2a496ca1	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5645-d730-c0f7-cea69ccd0739	00010000-5645-d730-7278-6754f403215b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5645-d730-4170-5761dda8d4f4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5645-d730-a6be-5504722394b7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5645-d730-9da2-bca780a381d5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5645-d730-3927-f6365c1fd5bb	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5645-d730-be5e-6b60ae2d7569	00010000-5645-d730-ba33-81aef633820e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5645-d730-2982-fa619ff4416f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5645-d730-8ec2-6448f44682e4	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5645-d730-f00e-b7dc9d972e99	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5645-d730-cc76-eb57b11580cc	00010000-5645-d730-42f9-f7d55d50fca1	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5645-d730-18df-43179c2dd4c5	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-d730-d38c-4958a43aa771	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-d730-992b-1f0af483cac5	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-d730-41d6-f1e2c0c52bde	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5645-d730-b056-3b3774a52bf7	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5645-d730-ce4a-9bd5cfd1a5a4	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-d730-73fb-9298edee16aa	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5645-d730-1732-5d9d2445e9e6	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3099 (class 0 OID 26743872)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5645-d72e-1612-e01b4fdc56b8	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5645-d72e-4329-25dc3efd46ef	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5645-d72e-3b77-ec134b0a6cf9	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5645-d72e-cd53-ed47b98d0e86	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5645-d72e-40be-1b26a62af966	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5645-d72e-92cc-5da5e4df2786	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5645-d72e-c74f-8036732f32c6	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5645-d72e-46b0-ab1f32bc05bf	Abonma-read	Abonma - branje	t
00030000-5645-d72e-f0b4-eb973993ae4a	Abonma-write	Abonma - spreminjanje	t
00030000-5645-d72e-560a-dce00ba643fe	Alternacija-read	Alternacija - branje	t
00030000-5645-d72e-48c4-18cc64c705f2	Alternacija-write	Alternacija - spreminjanje	t
00030000-5645-d72e-d287-d7a342bf8bf7	Arhivalija-read	Arhivalija - branje	t
00030000-5645-d72e-3638-791cc51f8ff7	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5645-d72e-4712-a615580a1d55	AuthStorage-read	AuthStorage - branje	t
00030000-5645-d72e-8179-47e53db2f3ee	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5645-d72e-40d6-62348bfff5f1	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5645-d72e-1525-ace8ad6dee5b	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5645-d72e-1d44-4238a50592e8	Besedilo-read	Besedilo - branje	t
00030000-5645-d72e-90e5-56ee1467d75d	Besedilo-write	Besedilo - spreminjanje	t
00030000-5645-d72e-6367-3ecd6df4fab6	Dogodek-read	Dogodek - branje	t
00030000-5645-d72e-8b88-a18ca0019afb	Dogodek-write	Dogodek - spreminjanje	t
00030000-5645-d72e-896c-591951cebd7c	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5645-d72e-2f9b-6cc79fd812af	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5645-d72e-6cb5-1755f902c0e4	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5645-d72e-a48e-0064c126189e	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5645-d72e-cc4c-0155a6f5fec6	DogodekTrait-read	DogodekTrait - branje	t
00030000-5645-d72e-7d65-5904e1d409d0	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5645-d72e-7f2d-f8cbf5083e25	DrugiVir-read	DrugiVir - branje	t
00030000-5645-d72e-d5ca-7dca8c38b535	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5645-d72e-fb7d-dcd001edd3b5	Drzava-read	Drzava - branje	t
00030000-5645-d72e-74ca-c8d942a2a829	Drzava-write	Drzava - spreminjanje	t
00030000-5645-d72e-5cfe-5da090d4956f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5645-d72e-8e16-e1d30b5a13d2	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5645-d72e-6931-b05fcf5f0c58	Funkcija-read	Funkcija - branje	t
00030000-5645-d72e-3c76-d85b6a01fa40	Funkcija-write	Funkcija - spreminjanje	t
00030000-5645-d72e-edce-f6b691455c92	Gostovanje-read	Gostovanje - branje	t
00030000-5645-d72e-ddc2-b05b6feecd1b	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5645-d72e-c00e-eac2431f652c	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5645-d72e-60b8-caff9f7037aa	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5645-d72e-5ad9-ff9b69d9e857	Kupec-read	Kupec - branje	t
00030000-5645-d72e-a751-9745db73f978	Kupec-write	Kupec - spreminjanje	t
00030000-5645-d72e-ddb5-9c64dd1a27e9	NacinPlacina-read	NacinPlacina - branje	t
00030000-5645-d72e-a049-288aa6b4dac5	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5645-d72e-c914-a80f40d4a588	Option-read	Option - branje	t
00030000-5645-d72e-eedf-ba9e3328cbaa	Option-write	Option - spreminjanje	t
00030000-5645-d72e-1596-c4418c3ddcf6	OptionValue-read	OptionValue - branje	t
00030000-5645-d72e-9168-24cdaa5b7d60	OptionValue-write	OptionValue - spreminjanje	t
00030000-5645-d72e-d8ad-f8110a7264f8	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5645-d72e-2405-e737ec054b25	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5645-d72e-de38-8dccd4817dc7	Oseba-read	Oseba - branje	t
00030000-5645-d72e-bf05-f06cedd87bdf	Oseba-write	Oseba - spreminjanje	t
00030000-5645-d72e-9a0e-70527147404e	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5645-d72e-532e-019e0d2b6d8b	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5645-d72e-1730-9a683df34e9a	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5645-d72e-7121-2ba4317b678c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5645-d72e-b1e3-8beb18687888	Pogodba-read	Pogodba - branje	t
00030000-5645-d72e-24d8-840f04402101	Pogodba-write	Pogodba - spreminjanje	t
00030000-5645-d72e-d121-dddcd946199a	Popa-read	Popa - branje	t
00030000-5645-d72e-8324-3949d1981422	Popa-write	Popa - spreminjanje	t
00030000-5645-d72e-c8be-cfd657ecd347	Posta-read	Posta - branje	t
00030000-5645-d72e-5392-3ed59658db3a	Posta-write	Posta - spreminjanje	t
00030000-5645-d72e-dd35-3f458a56fd2d	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5645-d72e-be4c-608dd7e2a921	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5645-d72e-b135-8350e808407b	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5645-d72e-3a24-b202ba3e3369	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5645-d72e-07c0-190ca6778cf8	PostniNaslov-read	PostniNaslov - branje	t
00030000-5645-d72e-6727-087c0b649452	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5645-d72e-10f5-8dcfaad4422e	Praznik-read	Praznik - branje	t
00030000-5645-d72e-0499-1960913b6a95	Praznik-write	Praznik - spreminjanje	t
00030000-5645-d72e-d8b9-e8c03d507cd5	Predstava-read	Predstava - branje	t
00030000-5645-d72e-03c9-9a3d39fbdf68	Predstava-write	Predstava - spreminjanje	t
00030000-5645-d72e-8017-883703624d5e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5645-d72e-5531-50f2a01bb1ce	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5645-d72e-814b-6197452b785b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5645-d72e-9ca7-0bc40f165f34	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5645-d72e-565f-377d3e659816	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5645-d72e-937c-84a238a476a8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5645-d72e-233d-800d7c4da67b	ProgramDela-read	ProgramDela - branje	t
00030000-5645-d72e-524b-2c3465f08527	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5645-d72e-3883-895ae7cb696a	ProgramFestival-read	ProgramFestival - branje	t
00030000-5645-d72e-b3b6-3e7183a7a517	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5645-d72e-1fa1-579c0699ce23	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5645-d72e-7b6c-2dd637a564cc	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5645-d72e-6492-397baade1f44	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5645-d72e-0fe4-e659c692f859	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5645-d72e-8ea4-6121e146d23c	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5645-d72e-4f5b-56ca5bd137d7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5645-d72e-e47b-dedba107f7a0	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5645-d72e-2401-26d94dda4d13	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5645-d72e-5dea-86c57b679e81	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5645-d72e-bad2-57ff0402d2b5	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5645-d72e-3458-1f45b16970d8	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5645-d72e-b8ef-ab57a90f251d	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5645-d72e-fb5a-2a3facc21025	ProgramRazno-read	ProgramRazno - branje	t
00030000-5645-d72e-a304-45e6d6ae9be6	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5645-d72e-951a-48beae53aef6	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5645-d72e-8d67-2cfc288154b2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5645-d72e-4eca-b500d8ee1c81	Prostor-read	Prostor - branje	t
00030000-5645-d72e-e7ee-2e519ccb88fb	Prostor-write	Prostor - spreminjanje	t
00030000-5645-d72e-a74a-20e7749d570c	Racun-read	Racun - branje	t
00030000-5645-d72e-9a1f-f526ec969803	Racun-write	Racun - spreminjanje	t
00030000-5645-d72e-e413-79dd37d89fac	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5645-d72e-4e15-e9a52cec8be3	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5645-d72e-a83c-511d79389b25	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5645-d72e-ff3d-2a533fc38dea	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5645-d72e-55ef-c69e68511426	Rekvizit-read	Rekvizit - branje	t
00030000-5645-d72e-8978-1f6deeacb1c6	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5645-d72e-27d1-ead984ae7132	Revizija-read	Revizija - branje	t
00030000-5645-d72e-e089-4fae0ff2872b	Revizija-write	Revizija - spreminjanje	t
00030000-5645-d72e-46bd-f3ed4cf341ae	Rezervacija-read	Rezervacija - branje	t
00030000-5645-d72e-6393-d931ae60212a	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5645-d72e-c126-d66841bde697	SedezniRed-read	SedezniRed - branje	t
00030000-5645-d72e-3711-b48391affc6c	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5645-d72e-f137-53e7ff9a11fe	Sedez-read	Sedez - branje	t
00030000-5645-d72e-a390-dc6bf54d7292	Sedez-write	Sedez - spreminjanje	t
00030000-5645-d72e-201d-c7627babb3f8	Sezona-read	Sezona - branje	t
00030000-5645-d72e-d527-981135186723	Sezona-write	Sezona - spreminjanje	t
00030000-5645-d72e-b191-a60ec9abec58	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5645-d72e-4eef-0eedb1440d20	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5645-d72e-879b-4b1a22a3f7ca	Stevilcenje-read	Stevilcenje - branje	t
00030000-5645-d72e-b344-09eca1466b5e	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5645-d72e-770c-bb585bbca8d7	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5645-d72e-dffc-8aa2b0e01c0e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5645-d72e-e312-3ffe8f093f53	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5645-d72e-7019-e00c3880969c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5645-d72e-0bc9-3cca0c0cb696	Telefonska-read	Telefonska - branje	t
00030000-5645-d72e-4c64-e1db7cdd0be8	Telefonska-write	Telefonska - spreminjanje	t
00030000-5645-d72e-3d0b-c89acb41319a	TerminStoritve-read	TerminStoritve - branje	t
00030000-5645-d72e-adb2-67ab8e0ab6c1	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5645-d72e-669a-e77f103b16a9	TipFunkcije-read	TipFunkcije - branje	t
00030000-5645-d72e-6cdb-5207cacb986f	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5645-d72e-df18-a081303be0ba	TipPopa-read	TipPopa - branje	t
00030000-5645-d72e-ee9c-336ab6999f73	TipPopa-write	TipPopa - spreminjanje	t
00030000-5645-d72e-249f-5091ab5ca6c5	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5645-d72e-1a91-484617b7342a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5645-d72e-8344-c7179b6ae5a0	TipVaje-read	TipVaje - branje	t
00030000-5645-d72e-bfeb-9150db2b7423	TipVaje-write	TipVaje - spreminjanje	t
00030000-5645-d72e-6705-d578d6955bc5	Trr-read	Trr - branje	t
00030000-5645-d72e-c8d0-cdcb8eacd2c3	Trr-write	Trr - spreminjanje	t
00030000-5645-d72e-2aec-1cec1e270bf5	Uprizoritev-read	Uprizoritev - branje	t
00030000-5645-d72e-1a1a-989d12c94bfa	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5645-d72e-7087-6a30cc7a6c9b	Vaja-read	Vaja - branje	t
00030000-5645-d72e-530f-bbee4762b6fe	Vaja-write	Vaja - spreminjanje	t
00030000-5645-d72e-a70b-76f1166b54b2	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5645-d72e-aaec-134384f8979b	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5645-d72e-16bb-665160e524b7	VrstaStroska-read	VrstaStroska - branje	t
00030000-5645-d72e-12fd-850816675d9c	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5645-d72e-0ada-8a5965d41f63	Zaposlitev-read	Zaposlitev - branje	t
00030000-5645-d72e-89ec-f0da496281b9	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5645-d72e-47f2-7e4a93a75060	Zasedenost-read	Zasedenost - branje	t
00030000-5645-d72e-8246-646f483a1992	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5645-d72e-ef8b-68c0bfaf7fbf	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5645-d72e-dc79-8eb8e09245a9	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5645-d72e-8a5c-bfbeeee37f65	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5645-d72e-e193-eb3583899a92	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5645-d72e-77a9-58ca646863dc	Job-read	Branje opravil - samo zase - branje	t
00030000-5645-d72e-576c-b71eef3d0f2c	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5645-d72e-a20a-adc49b15eae3	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5645-d72e-6409-a42793c4b098	Report-read	Report - branje	t
00030000-5645-d72e-7ca7-d99fddfc2ac4	Report-write	Report - spreminjanje	t
00030000-5645-d72e-f847-8d9321624b62	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5645-d72e-1704-0c8cb8a2e67a	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5645-d72e-bb6a-15b8e8638534	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5645-d72e-df14-d1286f255697	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5645-d72e-7177-1d459584c8a6	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5645-d72e-d9ff-492dc686a873	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5645-d72e-160a-822d96e76df9	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5645-d72e-b3eb-372ab4d1bd3e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5645-d72e-83ec-00026a72154b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5645-d72e-79e8-f0347dd872c6	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5645-d72e-4673-07d9875b4b31	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5645-d72e-07fd-f8c85d3152d5	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5645-d72e-1c7f-1c949e25bfcd	Datoteka-write	Datoteka - spreminjanje	t
00030000-5645-d72e-3f2c-7c40fce43a30	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3101 (class 0 OID 26743891)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5645-d72f-897a-48c8edfa9057	00030000-5645-d72e-4329-25dc3efd46ef
00020000-5645-d72f-1e59-bf2e9dfdcf3a	00030000-5645-d72e-fb7d-dcd001edd3b5
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-46b0-ab1f32bc05bf
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-f0b4-eb973993ae4a
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-560a-dce00ba643fe
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-48c4-18cc64c705f2
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-d287-d7a342bf8bf7
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-6367-3ecd6df4fab6
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-cd53-ed47b98d0e86
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-8b88-a18ca0019afb
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-fb7d-dcd001edd3b5
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-74ca-c8d942a2a829
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-6931-b05fcf5f0c58
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-3c76-d85b6a01fa40
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-edce-f6b691455c92
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-ddc2-b05b6feecd1b
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-c00e-eac2431f652c
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-60b8-caff9f7037aa
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-c914-a80f40d4a588
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-1596-c4418c3ddcf6
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-de38-8dccd4817dc7
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-bf05-f06cedd87bdf
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-d121-dddcd946199a
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-8324-3949d1981422
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-c8be-cfd657ecd347
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-5392-3ed59658db3a
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-07c0-190ca6778cf8
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-6727-087c0b649452
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-d8b9-e8c03d507cd5
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-03c9-9a3d39fbdf68
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-565f-377d3e659816
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-937c-84a238a476a8
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-4eca-b500d8ee1c81
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-e7ee-2e519ccb88fb
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-a83c-511d79389b25
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-ff3d-2a533fc38dea
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-55ef-c69e68511426
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-8978-1f6deeacb1c6
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-201d-c7627babb3f8
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-d527-981135186723
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-669a-e77f103b16a9
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-2aec-1cec1e270bf5
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-1a1a-989d12c94bfa
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-7087-6a30cc7a6c9b
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-530f-bbee4762b6fe
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-47f2-7e4a93a75060
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-8246-646f483a1992
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-ef8b-68c0bfaf7fbf
00020000-5645-d72f-f3fb-a71af44f30d0	00030000-5645-d72e-8a5c-bfbeeee37f65
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-46b0-ab1f32bc05bf
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-d287-d7a342bf8bf7
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-6367-3ecd6df4fab6
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-fb7d-dcd001edd3b5
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-edce-f6b691455c92
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-c00e-eac2431f652c
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-60b8-caff9f7037aa
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-c914-a80f40d4a588
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-1596-c4418c3ddcf6
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-de38-8dccd4817dc7
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-bf05-f06cedd87bdf
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-d121-dddcd946199a
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-c8be-cfd657ecd347
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-07c0-190ca6778cf8
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-6727-087c0b649452
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-d8b9-e8c03d507cd5
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-4eca-b500d8ee1c81
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-a83c-511d79389b25
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-55ef-c69e68511426
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-201d-c7627babb3f8
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-0bc9-3cca0c0cb696
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-4c64-e1db7cdd0be8
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-6705-d578d6955bc5
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-c8d0-cdcb8eacd2c3
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-0ada-8a5965d41f63
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-89ec-f0da496281b9
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-ef8b-68c0bfaf7fbf
00020000-5645-d72f-6513-10649345178b	00030000-5645-d72e-8a5c-bfbeeee37f65
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-46b0-ab1f32bc05bf
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-560a-dce00ba643fe
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-d287-d7a342bf8bf7
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-3638-791cc51f8ff7
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-1d44-4238a50592e8
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-896c-591951cebd7c
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-6367-3ecd6df4fab6
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-fb7d-dcd001edd3b5
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-6931-b05fcf5f0c58
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-edce-f6b691455c92
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-c00e-eac2431f652c
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-c914-a80f40d4a588
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-1596-c4418c3ddcf6
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-de38-8dccd4817dc7
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-d121-dddcd946199a
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-c8be-cfd657ecd347
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-d8b9-e8c03d507cd5
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-565f-377d3e659816
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-4eca-b500d8ee1c81
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-a83c-511d79389b25
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-55ef-c69e68511426
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-201d-c7627babb3f8
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-669a-e77f103b16a9
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-7087-6a30cc7a6c9b
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-47f2-7e4a93a75060
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-ef8b-68c0bfaf7fbf
00020000-5645-d72f-96fd-5e0888d35272	00030000-5645-d72e-8a5c-bfbeeee37f65
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-46b0-ab1f32bc05bf
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-f0b4-eb973993ae4a
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-48c4-18cc64c705f2
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-d287-d7a342bf8bf7
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-6367-3ecd6df4fab6
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-fb7d-dcd001edd3b5
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-edce-f6b691455c92
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-c914-a80f40d4a588
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-1596-c4418c3ddcf6
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-d121-dddcd946199a
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-c8be-cfd657ecd347
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-d8b9-e8c03d507cd5
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-4eca-b500d8ee1c81
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-a83c-511d79389b25
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-55ef-c69e68511426
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-201d-c7627babb3f8
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-669a-e77f103b16a9
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-ef8b-68c0bfaf7fbf
00020000-5645-d72f-20b9-bf5edb0fbbab	00030000-5645-d72e-8a5c-bfbeeee37f65
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-46b0-ab1f32bc05bf
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-d287-d7a342bf8bf7
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-6367-3ecd6df4fab6
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-fb7d-dcd001edd3b5
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-edce-f6b691455c92
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-c914-a80f40d4a588
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-1596-c4418c3ddcf6
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-d121-dddcd946199a
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-c8be-cfd657ecd347
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-d8b9-e8c03d507cd5
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-4eca-b500d8ee1c81
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-a83c-511d79389b25
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-55ef-c69e68511426
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-201d-c7627babb3f8
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-3d0b-c89acb41319a
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-3b77-ec134b0a6cf9
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-669a-e77f103b16a9
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-ef8b-68c0bfaf7fbf
00020000-5645-d72f-baab-d4c7162a229e	00030000-5645-d72e-8a5c-bfbeeee37f65
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-1612-e01b4fdc56b8
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-4329-25dc3efd46ef
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-46b0-ab1f32bc05bf
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-f0b4-eb973993ae4a
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-560a-dce00ba643fe
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-48c4-18cc64c705f2
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-d287-d7a342bf8bf7
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-3638-791cc51f8ff7
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-40d6-62348bfff5f1
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-1525-ace8ad6dee5b
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-1d44-4238a50592e8
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-90e5-56ee1467d75d
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-896c-591951cebd7c
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-2f9b-6cc79fd812af
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-6367-3ecd6df4fab6
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-cd53-ed47b98d0e86
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8b88-a18ca0019afb
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-7f2d-f8cbf5083e25
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-d5ca-7dca8c38b535
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-fb7d-dcd001edd3b5
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-74ca-c8d942a2a829
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-5cfe-5da090d4956f
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8e16-e1d30b5a13d2
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-6931-b05fcf5f0c58
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-3c76-d85b6a01fa40
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-edce-f6b691455c92
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-ddc2-b05b6feecd1b
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-c00e-eac2431f652c
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-60b8-caff9f7037aa
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-5ad9-ff9b69d9e857
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-a751-9745db73f978
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-ddb5-9c64dd1a27e9
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-a049-288aa6b4dac5
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-c914-a80f40d4a588
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-1596-c4418c3ddcf6
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-9168-24cdaa5b7d60
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-eedf-ba9e3328cbaa
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-d8ad-f8110a7264f8
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-2405-e737ec054b25
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-de38-8dccd4817dc7
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-40be-1b26a62af966
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-bf05-f06cedd87bdf
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-9a0e-70527147404e
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-532e-019e0d2b6d8b
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-1730-9a683df34e9a
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-7121-2ba4317b678c
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-b1e3-8beb18687888
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-24d8-840f04402101
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-d121-dddcd946199a
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8324-3949d1981422
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-c8be-cfd657ecd347
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-dd35-3f458a56fd2d
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-be4c-608dd7e2a921
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-b135-8350e808407b
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-3a24-b202ba3e3369
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-5392-3ed59658db3a
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-07c0-190ca6778cf8
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-6727-087c0b649452
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-10f5-8dcfaad4422e
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-0499-1960913b6a95
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-d8b9-e8c03d507cd5
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-03c9-9a3d39fbdf68
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8017-883703624d5e
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-5531-50f2a01bb1ce
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-814b-6197452b785b
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-9ca7-0bc40f165f34
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-565f-377d3e659816
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-937c-84a238a476a8
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-92cc-5da5e4df2786
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-233d-800d7c4da67b
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-c74f-8036732f32c6
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-524b-2c3465f08527
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-3883-895ae7cb696a
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-b3b6-3e7183a7a517
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-1fa1-579c0699ce23
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-7b6c-2dd637a564cc
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-6492-397baade1f44
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-0fe4-e659c692f859
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8ea4-6121e146d23c
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-4f5b-56ca5bd137d7
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-e47b-dedba107f7a0
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-2401-26d94dda4d13
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-5dea-86c57b679e81
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-bad2-57ff0402d2b5
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-3458-1f45b16970d8
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-b8ef-ab57a90f251d
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-fb5a-2a3facc21025
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-a304-45e6d6ae9be6
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-951a-48beae53aef6
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8d67-2cfc288154b2
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-4eca-b500d8ee1c81
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-e7ee-2e519ccb88fb
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-a74a-20e7749d570c
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-9a1f-f526ec969803
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-e413-79dd37d89fac
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-4e15-e9a52cec8be3
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-a83c-511d79389b25
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-ff3d-2a533fc38dea
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-55ef-c69e68511426
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8978-1f6deeacb1c6
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-27d1-ead984ae7132
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-e089-4fae0ff2872b
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-46bd-f3ed4cf341ae
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-6393-d931ae60212a
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-c126-d66841bde697
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-3711-b48391affc6c
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-f137-53e7ff9a11fe
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-a390-dc6bf54d7292
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-201d-c7627babb3f8
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-d527-981135186723
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-b191-a60ec9abec58
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-4eef-0eedb1440d20
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-879b-4b1a22a3f7ca
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-770c-bb585bbca8d7
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-dffc-8aa2b0e01c0e
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-b344-09eca1466b5e
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-e312-3ffe8f093f53
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-7019-e00c3880969c
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-0bc9-3cca0c0cb696
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-4c64-e1db7cdd0be8
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-3d0b-c89acb41319a
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-3b77-ec134b0a6cf9
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-adb2-67ab8e0ab6c1
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-669a-e77f103b16a9
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-6cdb-5207cacb986f
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-df18-a081303be0ba
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-ee9c-336ab6999f73
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-249f-5091ab5ca6c5
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-1a91-484617b7342a
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8344-c7179b6ae5a0
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-bfeb-9150db2b7423
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-6705-d578d6955bc5
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-c8d0-cdcb8eacd2c3
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-2aec-1cec1e270bf5
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-1a1a-989d12c94bfa
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-7087-6a30cc7a6c9b
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-530f-bbee4762b6fe
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-a70b-76f1166b54b2
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-aaec-134384f8979b
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-16bb-665160e524b7
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-12fd-850816675d9c
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-0ada-8a5965d41f63
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-89ec-f0da496281b9
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-47f2-7e4a93a75060
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8246-646f483a1992
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-ef8b-68c0bfaf7fbf
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-dc79-8eb8e09245a9
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-8a5c-bfbeeee37f65
00020000-5645-d730-eb6c-d3c5adb78d3f	00030000-5645-d72e-e193-eb3583899a92
00020000-5645-d730-bbe2-2490284a5244	00030000-5645-d72e-79e8-f0347dd872c6
00020000-5645-d730-e145-e562193be85c	00030000-5645-d72e-83ec-00026a72154b
00020000-5645-d730-4d9e-0f9142eac0c7	00030000-5645-d72e-1a1a-989d12c94bfa
00020000-5645-d730-8ffb-022892558033	00030000-5645-d72e-2aec-1cec1e270bf5
00020000-5645-d730-06be-fb4949ea381a	00030000-5645-d72e-1704-0c8cb8a2e67a
00020000-5645-d730-63f2-9bc47a68d414	00030000-5645-d72e-bb6a-15b8e8638534
00020000-5645-d730-3697-bb55cf111465	00030000-5645-d72e-df14-d1286f255697
00020000-5645-d730-3375-1eb7c42de127	00030000-5645-d72e-f847-8d9321624b62
00020000-5645-d730-5dc3-6196927c7183	00030000-5645-d72e-d9ff-492dc686a873
00020000-5645-d730-ae92-734383473910	00030000-5645-d72e-7177-1d459584c8a6
\.


--
-- TOC entry 3138 (class 0 OID 26744281)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 26744315)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 26744452)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5645-d730-3156-7e78c61ca677	00090000-5645-d730-c07c-f04c14f36ddd	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5645-d730-1e4e-542b8e0b41dd	00090000-5645-d730-a6be-5504722394b7	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5645-d730-8e95-9da74e097e6e	00090000-5645-d730-cc76-eb57b11580cc	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5645-d730-25f7-c80f32c1fa37	00090000-5645-d730-2982-fa619ff4416f	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3109 (class 0 OID 26743973)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5645-d730-e044-1937a682a55a	\N	00040000-5645-d72e-f3fe-4de26d7ebf63	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-d730-c34d-fed7c6395f37	\N	00040000-5645-d72e-f3fe-4de26d7ebf63	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5645-d730-0d34-ded0c101c12c	\N	00040000-5645-d72e-f3fe-4de26d7ebf63	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-d730-0a7b-a183b928e630	\N	00040000-5645-d72e-f3fe-4de26d7ebf63	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-d730-4f96-dfb4530b8875	\N	00040000-5645-d72e-f3fe-4de26d7ebf63	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-d730-447f-bfe63320bde7	\N	00040000-5645-d72e-e1e8-ed7cf9c2fee8	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-d730-9dbf-8c7849f5c2f0	\N	00040000-5645-d72e-7920-ac3d6af797b9	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-d730-d41d-cd638fb22a5f	\N	00040000-5645-d72e-8568-12a714fe271b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-d730-9c1c-7ed11c646811	\N	00040000-5645-d72e-54c0-1b6f91d8b628	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5645-d732-8cc0-77884fdb059d	\N	00040000-5645-d72e-f3fe-4de26d7ebf63	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3112 (class 0 OID 26744018)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5645-d72e-f867-4366f1896309	8341	Adlešiči
00050000-5645-d72e-3340-5ac9da934d22	5270	Ajdovščina
00050000-5645-d72e-d8a0-2c53ded3c8d1	6280	Ankaran/Ancarano
00050000-5645-d72e-a1c4-1cdded4e43eb	9253	Apače
00050000-5645-d72e-ca2c-d1b85d6217c1	8253	Artiče
00050000-5645-d72e-f5a5-d56670688ed4	4275	Begunje na Gorenjskem
00050000-5645-d72e-9d95-bb45e90a2126	1382	Begunje pri Cerknici
00050000-5645-d72e-211d-198f6c7d91f2	9231	Beltinci
00050000-5645-d72e-982d-c4b906e8a99c	2234	Benedikt
00050000-5645-d72e-0c4b-c75af6928701	2345	Bistrica ob Dravi
00050000-5645-d72e-b05a-fb059bf92eb9	3256	Bistrica ob Sotli
00050000-5645-d72e-54e8-1ed105878407	8259	Bizeljsko
00050000-5645-d72e-cb85-f14afca4c92d	1223	Blagovica
00050000-5645-d72e-b6e2-0ade3e722ae6	8283	Blanca
00050000-5645-d72e-cbdd-fcb10aecb45a	4260	Bled
00050000-5645-d72e-f34f-0071401cc942	4273	Blejska Dobrava
00050000-5645-d72e-2a03-c3c146d91300	9265	Bodonci
00050000-5645-d72e-4fa5-c89aa1adbe7b	9222	Bogojina
00050000-5645-d72e-9820-7f15b165bcda	4263	Bohinjska Bela
00050000-5645-d72e-eb8e-e1ae993907a3	4264	Bohinjska Bistrica
00050000-5645-d72e-0d8e-4d67c7948a93	4265	Bohinjsko jezero
00050000-5645-d72e-89bc-f8cd6a3ed0c1	1353	Borovnica
00050000-5645-d72e-3e8a-d825a51e6950	8294	Boštanj
00050000-5645-d72e-d342-e9c6d0b176c8	5230	Bovec
00050000-5645-d72e-efe8-9f03a665ee9c	5295	Branik
00050000-5645-d72e-8ce7-a933dcd12ed1	3314	Braslovče
00050000-5645-d72e-042f-a940612039f8	5223	Breginj
00050000-5645-d72e-3b24-92f76a2910c0	8280	Brestanica
00050000-5645-d72e-2e2b-5c931bdf3576	2354	Bresternica
00050000-5645-d72e-3fcb-0c1ff2b9958e	4243	Brezje
00050000-5645-d72e-d364-1be60f1e6457	1351	Brezovica pri Ljubljani
00050000-5645-d72e-e0ea-783d03a42c2f	8250	Brežice
00050000-5645-d72e-5827-15e3c97a8c20	4210	Brnik - Aerodrom
00050000-5645-d72e-452e-3d3a91e7be74	8321	Brusnice
00050000-5645-d72e-991f-2c6a647cb5a0	3255	Buče
00050000-5645-d72e-4141-dd569c92119e	8276	Bučka 
00050000-5645-d72e-7310-381a11881329	9261	Cankova
00050000-5645-d72e-eb36-a63de1b34069	3000	Celje 
00050000-5645-d72e-c3ab-ce0cd3dd849e	3001	Celje - poštni predali
00050000-5645-d72e-704c-cc16a4ca8030	4207	Cerklje na Gorenjskem
00050000-5645-d72e-2811-84f22adf40de	8263	Cerklje ob Krki
00050000-5645-d72e-342c-1ae371f3dbc9	1380	Cerknica
00050000-5645-d72e-aa0b-a279259aaf81	5282	Cerkno
00050000-5645-d72e-cdc7-09ecd2784a9b	2236	Cerkvenjak
00050000-5645-d72e-1b1b-97fcc78cd4ad	2215	Ceršak
00050000-5645-d72e-7708-f18acd35dd71	2326	Cirkovce
00050000-5645-d72e-f754-926c118686ee	2282	Cirkulane
00050000-5645-d72e-5870-21286044eb69	5273	Col
00050000-5645-d72e-38b9-a7d5f985177a	8251	Čatež ob Savi
00050000-5645-d72e-1ca9-44cbd18914ec	1413	Čemšenik
00050000-5645-d72e-39b2-0848a962c724	5253	Čepovan
00050000-5645-d72e-e150-cfe30283af5e	9232	Črenšovci
00050000-5645-d72e-137a-3beeaef2feb9	2393	Črna na Koroškem
00050000-5645-d72e-9d57-eaaf0a4ffa8e	6275	Črni Kal
00050000-5645-d72e-617c-239642977356	5274	Črni Vrh nad Idrijo
00050000-5645-d72e-deea-b00976d15c14	5262	Črniče
00050000-5645-d72e-e72f-c6aba666430c	8340	Črnomelj
00050000-5645-d72e-bfab-29a66a0de583	6271	Dekani
00050000-5645-d72e-8dc4-4b5fc1e3cd8a	5210	Deskle
00050000-5645-d72e-2193-bb6d698ec792	2253	Destrnik
00050000-5645-d72e-645d-629f7fad20df	6215	Divača
00050000-5645-d72e-6c22-af5dcfad8bf1	1233	Dob
00050000-5645-d72e-a95a-01e31159822b	3224	Dobje pri Planini
00050000-5645-d72e-e228-b02a3a917399	8257	Dobova
00050000-5645-d72e-27aa-1e2a8e7a55ca	1423	Dobovec
00050000-5645-d72e-0910-e2b87d26c867	5263	Dobravlje
00050000-5645-d72e-86a6-692b8d29d1f1	3204	Dobrna
00050000-5645-d72e-2547-d855669ec612	8211	Dobrnič
00050000-5645-d72e-3538-c95f49f832da	1356	Dobrova
00050000-5645-d72e-053f-d452ef3b284a	9223	Dobrovnik/Dobronak 
00050000-5645-d72e-19fd-b7da87ea4dce	5212	Dobrovo v Brdih
00050000-5645-d72e-8cba-e5831afafab4	1431	Dol pri Hrastniku
00050000-5645-d72e-b047-5866cf932617	1262	Dol pri Ljubljani
00050000-5645-d72e-a148-fe563540754d	1273	Dole pri Litiji
00050000-5645-d72e-e44d-6589661b600a	1331	Dolenja vas
00050000-5645-d72e-dcb4-3e5ce2815171	8350	Dolenjske Toplice
00050000-5645-d72e-d0cf-bf577d521a38	1230	Domžale
00050000-5645-d72e-c8fa-b8c0b46c3e95	2252	Dornava
00050000-5645-d72e-b153-f4660dcaae4c	5294	Dornberk
00050000-5645-d72e-cccc-3ad7984ae4cf	1319	Draga
00050000-5645-d72e-84c8-9ddcd5b8504e	8343	Dragatuš
00050000-5645-d72e-66d5-028529776981	3222	Dramlje
00050000-5645-d72e-537e-e47d914c6bec	2370	Dravograd
00050000-5645-d72e-86a2-5e3c03e06aaf	4203	Duplje
00050000-5645-d72e-b249-19da84a9e0e7	6221	Dutovlje
00050000-5645-d72e-1a99-0b8a8209b8a8	8361	Dvor
00050000-5645-d72e-6487-adb9e8c49d53	2343	Fala
00050000-5645-d72e-6e69-9cadae5dd5f5	9208	Fokovci
00050000-5645-d72e-6214-83a4024057de	2313	Fram
00050000-5645-d72e-486c-ab285af23f2f	3213	Frankolovo
00050000-5645-d72e-e6dd-1532e24f4b5f	1274	Gabrovka
00050000-5645-d72e-2c42-643b07d4147d	8254	Globoko
00050000-5645-d72e-b764-a6690cd804e3	5275	Godovič
00050000-5645-d72e-de9b-b8073528d243	4204	Golnik
00050000-5645-d72e-0dfa-595801f744c8	3303	Gomilsko
00050000-5645-d72e-c1d5-056b7ab97639	4224	Gorenja vas
00050000-5645-d72e-f98c-37246ac458bc	3263	Gorica pri Slivnici
00050000-5645-d72e-9606-a394a0be94e3	2272	Gorišnica
00050000-5645-d72e-8c2f-a0f818b76225	9250	Gornja Radgona
00050000-5645-d72e-59f1-43e3a34b21ac	3342	Gornji Grad
00050000-5645-d72e-dc91-3d6a0c5014a9	4282	Gozd Martuljek
00050000-5645-d72e-d86f-d52fbc22c058	6272	Gračišče
00050000-5645-d72e-1d00-a28c7af71333	9264	Grad
00050000-5645-d72e-a0bd-fcc7247db2c1	8332	Gradac
00050000-5645-d72e-1caf-4e1f865e0a19	1384	Grahovo
00050000-5645-d72e-22ae-012eecb24161	5242	Grahovo ob Bači
00050000-5645-d72e-2110-f538a30ff80e	5251	Grgar
00050000-5645-d72e-b05a-4f4b20a295b7	3302	Griže
00050000-5645-d72e-84c4-bae468504842	3231	Grobelno
00050000-5645-d72e-3e74-1d9d79e1b581	1290	Grosuplje
00050000-5645-d72e-9271-00ea3a769edb	2288	Hajdina
00050000-5645-d72e-0e27-72e536e394e0	8362	Hinje
00050000-5645-d72e-0e62-ae68bd494d93	2311	Hoče
00050000-5645-d72e-49e3-744e85641ddd	9205	Hodoš/Hodos
00050000-5645-d72e-e89c-511e01045837	1354	Horjul
00050000-5645-d72e-95d0-a4c3f385aa01	1372	Hotedršica
00050000-5645-d72e-9f63-e3176030f18e	1430	Hrastnik
00050000-5645-d72e-9d8b-f61c13a0f236	6225	Hruševje
00050000-5645-d72e-f497-316dfc00ca94	4276	Hrušica
00050000-5645-d72e-bca5-6c8a1a8b0333	5280	Idrija
00050000-5645-d72e-1b9f-04dfffa533ab	1292	Ig
00050000-5645-d72e-7784-f5cb18cc6b62	6250	Ilirska Bistrica
00050000-5645-d72e-b9e3-2f6ae7725469	6251	Ilirska Bistrica-Trnovo
00050000-5645-d72e-7b2b-a123129d428c	1295	Ivančna Gorica
00050000-5645-d72e-672c-0b6b3ab055f6	2259	Ivanjkovci
00050000-5645-d72e-2030-2f94a2e5d8be	1411	Izlake
00050000-5645-d72e-a57b-26a88f428d76	6310	Izola/Isola
00050000-5645-d72e-3b60-4e551da77577	2222	Jakobski Dol
00050000-5645-d72e-69d7-931f4aad64a3	2221	Jarenina
00050000-5645-d72e-985e-3c8943024f98	6254	Jelšane
00050000-5645-d72e-716e-d7e25b79da05	4270	Jesenice
00050000-5645-d72e-74c4-bff52ac0dbf7	8261	Jesenice na Dolenjskem
00050000-5645-d72e-e070-393e3d5211e5	3273	Jurklošter
00050000-5645-d72e-0fc9-a9dc1a49abd1	2223	Jurovski Dol
00050000-5645-d72e-94c0-67f47dfeffbb	2256	Juršinci
00050000-5645-d72e-16b6-c2a3e78840cc	5214	Kal nad Kanalom
00050000-5645-d72e-3cd1-82f49e606f15	3233	Kalobje
00050000-5645-d72e-9215-8a38bd232b82	4246	Kamna Gorica
00050000-5645-d72e-1a20-96e91a1080b1	2351	Kamnica
00050000-5645-d72e-1709-9a9e38e51c8d	1241	Kamnik
00050000-5645-d72e-fd88-e2d0839f3cbd	5213	Kanal
00050000-5645-d72e-ed94-b3ef217128ad	8258	Kapele
00050000-5645-d72e-421e-1924d0e9bc33	2362	Kapla
00050000-5645-d72e-1d9a-eb013b46a8ef	2325	Kidričevo
00050000-5645-d72e-87b1-222b9e49b8b9	1412	Kisovec
00050000-5645-d72e-10b2-17ba5e19ef76	6253	Knežak
00050000-5645-d72e-4259-251867cc74cd	5222	Kobarid
00050000-5645-d72e-77bf-46b28736932b	9227	Kobilje
00050000-5645-d72e-77af-37f70eac2407	1330	Kočevje
00050000-5645-d72e-2d80-ccaf1a08645b	1338	Kočevska Reka
00050000-5645-d72e-3a1b-946d402eede0	2276	Kog
00050000-5645-d72e-fa02-d1ee3908cfa7	5211	Kojsko
00050000-5645-d72e-bee0-7884ed1afb6e	6223	Komen
00050000-5645-d72e-ef62-9428292a4277	1218	Komenda
00050000-5645-d72e-29bc-bd33f99a82c4	6000	Koper/Capodistria 
00050000-5645-d72e-6237-0e8cdb9956ed	6001	Koper/Capodistria - poštni predali
00050000-5645-d72e-8b7e-d0eed0973674	8282	Koprivnica
00050000-5645-d72e-0d97-6573f7cf39a3	5296	Kostanjevica na Krasu
00050000-5645-d72e-5380-83d8fe8743f7	8311	Kostanjevica na Krki
00050000-5645-d72e-0acf-a4b68b9b1696	1336	Kostel
00050000-5645-d72e-28f1-c16031271926	6256	Košana
00050000-5645-d72e-7274-01fb391be935	2394	Kotlje
00050000-5645-d72e-50e1-c6c282a1dfad	6240	Kozina
00050000-5645-d72e-3702-1a3886c11fae	3260	Kozje
00050000-5645-d72e-7621-b213e0103b2d	4000	Kranj 
00050000-5645-d72e-a16f-0d4a36853f68	4001	Kranj - poštni predali
00050000-5645-d72e-76c2-a8b3f942c34e	4280	Kranjska Gora
00050000-5645-d72e-a97a-e6207f9937fe	1281	Kresnice
00050000-5645-d72e-9641-8d2a86c08411	4294	Križe
00050000-5645-d72e-87d3-3c1b7c7bac0b	9206	Križevci
00050000-5645-d72e-8714-5d080c413c7e	9242	Križevci pri Ljutomeru
00050000-5645-d72e-44c4-3627085c782b	1301	Krka
00050000-5645-d72e-24a2-d4f496f23262	8296	Krmelj
00050000-5645-d72e-b3b8-09d1a3d8843f	4245	Kropa
00050000-5645-d72e-9464-4cd7ea3b1d3c	8262	Krška vas
00050000-5645-d72e-490d-d69d7817b63f	8270	Krško
00050000-5645-d72e-c42f-5d2cfab780b6	9263	Kuzma
00050000-5645-d72e-bb59-31fd738d9b38	2318	Laporje
00050000-5645-d72e-dfc7-1b2fef459855	3270	Laško
00050000-5645-d72e-6802-f1c07c5992f7	1219	Laze v Tuhinju
00050000-5645-d72e-e4f8-44c7ce88b31f	2230	Lenart v Slovenskih goricah
00050000-5645-d72e-a33e-35f92b4dffbe	9220	Lendava/Lendva
00050000-5645-d72e-2f43-80a96d932cd3	4248	Lesce
00050000-5645-d72e-3e0a-f954f5f97d22	3261	Lesično
00050000-5645-d72e-591c-5efd31c2e8ae	8273	Leskovec pri Krškem
00050000-5645-d72e-6873-484ee82a39ad	2372	Libeliče
00050000-5645-d72e-9db7-e6b0771345d9	2341	Limbuš
00050000-5645-d72e-d241-083d5e4bdbd0	1270	Litija
00050000-5645-d72e-189c-cc7a28f6780e	3202	Ljubečna
00050000-5645-d72e-2af6-9dc239678c45	1000	Ljubljana 
00050000-5645-d72e-9d75-27aa23291718	1001	Ljubljana - poštni predali
00050000-5645-d72e-5d83-87ab44da8e72	1231	Ljubljana - Črnuče
00050000-5645-d72e-c1f2-c697bb8bc5ec	1261	Ljubljana - Dobrunje
00050000-5645-d72e-3c20-b170bfda83d4	1260	Ljubljana - Polje
00050000-5645-d72e-19fd-85ea7e3d941b	1210	Ljubljana - Šentvid
00050000-5645-d72e-9707-a2cd0adfbe39	1211	Ljubljana - Šmartno
00050000-5645-d72e-551f-2236d5bfac23	3333	Ljubno ob Savinji
00050000-5645-d72e-9d05-6ef7903c00e6	9240	Ljutomer
00050000-5645-d72e-3533-5e9701d5b462	3215	Loče
00050000-5645-d72e-4690-b46d4847d9ce	5231	Log pod Mangartom
00050000-5645-d72e-f658-d857fdfb7480	1358	Log pri Brezovici
00050000-5645-d72e-cc68-5b4e3e061f6a	1370	Logatec
00050000-5645-d72e-dacc-18c8df08631c	1371	Logatec
00050000-5645-d72e-fb06-501614109fa4	1434	Loka pri Zidanem Mostu
00050000-5645-d72e-6e59-1a6f1df813da	3223	Loka pri Žusmu
00050000-5645-d72e-f45d-7c1807bf300f	6219	Lokev
00050000-5645-d72e-254c-f116b25ba3d0	1318	Loški Potok
00050000-5645-d72e-8118-cb6629dcdbe8	2324	Lovrenc na Dravskem polju
00050000-5645-d72e-693d-9825acc9dfbf	2344	Lovrenc na Pohorju
00050000-5645-d72e-de02-c1a795de2358	3334	Luče
00050000-5645-d72e-ab68-3ef1d14cb71f	1225	Lukovica
00050000-5645-d72e-5685-537d8e046ae3	9202	Mačkovci
00050000-5645-d72e-cc02-7b26840c86e4	2322	Majšperk
00050000-5645-d72e-b1e3-be20c4a6178b	2321	Makole
00050000-5645-d72e-9a39-12a4a035ed80	9243	Mala Nedelja
00050000-5645-d72e-e554-65133873a445	2229	Malečnik
00050000-5645-d72e-e193-b83ebd377a9c	6273	Marezige
00050000-5645-d72e-c873-31eb0fb762ca	2000	Maribor 
00050000-5645-d72e-c2c8-5c0034ffe839	2001	Maribor - poštni predali
00050000-5645-d72e-113a-121dd9329cb8	2206	Marjeta na Dravskem polju
00050000-5645-d72e-64d5-c5a9243d6ee1	2281	Markovci
00050000-5645-d72e-809a-bcc486720a0e	9221	Martjanci
00050000-5645-d72e-4025-79b632c9b720	6242	Materija
00050000-5645-d72e-b326-e9d9e2e8b8a5	4211	Mavčiče
00050000-5645-d72e-3aee-8b04d8d6b44e	1215	Medvode
00050000-5645-d72e-b1cc-6a5ba5b89d49	1234	Mengeš
00050000-5645-d72e-de42-b19e2606ff4b	8330	Metlika
00050000-5645-d72e-d114-4e5b1a6a8c34	2392	Mežica
00050000-5645-d72e-ce38-b80a0731bbc3	2204	Miklavž na Dravskem polju
00050000-5645-d72e-71ae-d1a973b264e8	2275	Miklavž pri Ormožu
00050000-5645-d72e-0584-0afe666b2d15	5291	Miren
00050000-5645-d72e-ada5-f77a7b5650bb	8233	Mirna
00050000-5645-d72e-87d3-84a428270605	8216	Mirna Peč
00050000-5645-d72e-7264-1a9405321ad6	2382	Mislinja
00050000-5645-d72e-cb1a-8f0d06dd1965	4281	Mojstrana
00050000-5645-d72e-2911-a9fa0174a0d2	8230	Mokronog
00050000-5645-d72e-9e2e-3ea411601444	1251	Moravče
00050000-5645-d72e-f6ce-fd786917f281	9226	Moravske Toplice
00050000-5645-d72e-2b96-ac677370fd8e	5216	Most na Soči
00050000-5645-d72e-449b-27fca9480751	1221	Motnik
00050000-5645-d72e-f07b-29098a902714	3330	Mozirje
00050000-5645-d72e-9791-a34de3444e21	9000	Murska Sobota 
00050000-5645-d72e-98cc-74499e8d7f7c	9001	Murska Sobota - poštni predali
00050000-5645-d72e-9f72-2a8ea8e7f7bb	2366	Muta
00050000-5645-d72e-4230-dcd4d312e1c5	4202	Naklo
00050000-5645-d72e-aca6-c233fb16266e	3331	Nazarje
00050000-5645-d72e-1bf7-559802d8abc3	1357	Notranje Gorice
00050000-5645-d72e-bc03-65ffbbf0153b	3203	Nova Cerkev
00050000-5645-d72e-c732-f9496885b17f	5000	Nova Gorica 
00050000-5645-d72e-f8f9-1aa9d6740f4a	5001	Nova Gorica - poštni predali
00050000-5645-d72e-bbd2-1c311685fde6	1385	Nova vas
00050000-5645-d72e-dd68-10b04503ef87	8000	Novo mesto
00050000-5645-d72e-b70a-ee9d81352437	8001	Novo mesto - poštni predali
00050000-5645-d72e-4c6c-7680bcdaff40	6243	Obrov
00050000-5645-d72e-cf17-abf798cea4e3	9233	Odranci
00050000-5645-d72e-f45c-0061e2d86664	2317	Oplotnica
00050000-5645-d72e-9f11-e1a242121f81	2312	Orehova vas
00050000-5645-d72e-61b5-dcc74175615f	2270	Ormož
00050000-5645-d72e-7bca-447a34b9e334	1316	Ortnek
00050000-5645-d72e-9911-cc7668bee676	1337	Osilnica
00050000-5645-d72e-52fe-fa7a25190d98	8222	Otočec
00050000-5645-d72e-e7a2-de140902778d	2361	Ožbalt
00050000-5645-d72e-3b35-15d8078bd616	2231	Pernica
00050000-5645-d72e-07c0-ff63c91606c2	2211	Pesnica pri Mariboru
00050000-5645-d72e-26c9-4d9bbedb711d	9203	Petrovci
00050000-5645-d72e-4b7e-9addeb8d81bc	3301	Petrovče
00050000-5645-d72e-f5f4-f8809036ed0f	6330	Piran/Pirano
00050000-5645-d72e-b8bd-8bedd83ff727	8255	Pišece
00050000-5645-d72e-55ec-b2ec29a32ff5	6257	Pivka
00050000-5645-d72e-2b9f-818c6ec61a55	6232	Planina
00050000-5645-d72e-fe1a-28e734c6b96b	3225	Planina pri Sevnici
00050000-5645-d72e-8340-f33607576d98	6276	Pobegi
00050000-5645-d72e-23a7-5ec51b25dc7b	8312	Podbočje
00050000-5645-d72e-0cfd-09eaf04159b7	5243	Podbrdo
00050000-5645-d72e-7176-b2e6f01d6e3a	3254	Podčetrtek
00050000-5645-d72e-013a-c721e4810a2a	2273	Podgorci
00050000-5645-d72e-0805-e7b3c3cf0892	6216	Podgorje
00050000-5645-d72e-b4db-25a9e5450696	2381	Podgorje pri Slovenj Gradcu
00050000-5645-d72e-728d-e9a85391ab6a	6244	Podgrad
00050000-5645-d72e-46d0-3e7f69354b5c	1414	Podkum
00050000-5645-d72e-39ad-33ba0813bcdc	2286	Podlehnik
00050000-5645-d72e-10e0-b7fafe0eb773	5272	Podnanos
00050000-5645-d72e-aeaf-98e3c2b3b45a	4244	Podnart
00050000-5645-d72e-2b98-a1341ec7e0bf	3241	Podplat
00050000-5645-d72e-703b-d74352305256	3257	Podsreda
00050000-5645-d72e-b23b-5dcd80280dd0	2363	Podvelka
00050000-5645-d72e-8c09-20ef65303bd6	2208	Pohorje
00050000-5645-d72e-abe9-868e73a750ba	2257	Polenšak
00050000-5645-d72e-99c9-196b5384c4a6	1355	Polhov Gradec
00050000-5645-d72e-41b1-9735ec61e20e	4223	Poljane nad Škofjo Loko
00050000-5645-d72e-9b00-4f66ff7ba76e	2319	Poljčane
00050000-5645-d72e-b417-902809f37fc9	1272	Polšnik
00050000-5645-d72e-d5a5-dbdd8cfaa983	3313	Polzela
00050000-5645-d72e-58bc-564942368233	3232	Ponikva
00050000-5645-d72e-9227-f803e0b01f64	6320	Portorož/Portorose
00050000-5645-d72e-6825-13d85daf712d	6230	Postojna
00050000-5645-d72e-d428-3aa770a53433	2331	Pragersko
00050000-5645-d72e-e6aa-268aca25e684	3312	Prebold
00050000-5645-d72e-1cd1-d97e76b5264a	4205	Preddvor
00050000-5645-d72e-68f2-be42408d393e	6255	Prem
00050000-5645-d72e-4e44-d9b0957bc07f	1352	Preserje
00050000-5645-d72e-035c-36fe11b99926	6258	Prestranek
00050000-5645-d72e-9ae0-8b12e2a458be	2391	Prevalje
00050000-5645-d72e-0149-c974a28387d1	3262	Prevorje
00050000-5645-d72e-e5ab-9a0056129d88	1276	Primskovo 
00050000-5645-d72e-4f2c-ffa08cccc057	3253	Pristava pri Mestinju
00050000-5645-d72e-0658-5f835f5346b4	9207	Prosenjakovci/Partosfalva
00050000-5645-d72e-a7cf-2a7a98181c63	5297	Prvačina
00050000-5645-d72e-12cd-bf46b608577b	2250	Ptuj
00050000-5645-d72e-2f8b-e3aeb23bfb28	2323	Ptujska Gora
00050000-5645-d72e-afab-62b5af2d8fb7	9201	Puconci
00050000-5645-d72e-f147-b8ca8c362930	2327	Rače
00050000-5645-d72e-254a-d153d3af4a3d	1433	Radeče
00050000-5645-d72e-cc0e-a39fe1f07cab	9252	Radenci
00050000-5645-d72e-2a7c-47c03f517d2f	2360	Radlje ob Dravi
00050000-5645-d72e-16a5-0a029f8c4882	1235	Radomlje
00050000-5645-d72e-d19f-c75c9eb91598	4240	Radovljica
00050000-5645-d72e-7cfe-803fdddfc95f	8274	Raka
00050000-5645-d72e-2eae-8b14da57bd59	1381	Rakek
00050000-5645-d72e-1043-c780f3ce0711	4283	Rateče - Planica
00050000-5645-d72e-7a27-3bd97fcd0553	2390	Ravne na Koroškem
00050000-5645-d72e-0c64-0de6113a699d	9246	Razkrižje
00050000-5645-d72e-0f0f-a9eeff413683	3332	Rečica ob Savinji
00050000-5645-d72e-7d04-44d9f373d823	5292	Renče
00050000-5645-d72e-b43b-b2dfeb6524b6	1310	Ribnica
00050000-5645-d72e-ed9c-8873ddc614ac	2364	Ribnica na Pohorju
00050000-5645-d72e-58b6-3577a037e804	3272	Rimske Toplice
00050000-5645-d72e-856a-23a8747de684	1314	Rob
00050000-5645-d72e-96fd-77b22acf3b48	5215	Ročinj
00050000-5645-d72e-c5de-3ded9a03a7d5	3250	Rogaška Slatina
00050000-5645-d72e-d292-b170475a4c8b	9262	Rogašovci
00050000-5645-d72e-193e-71e542a66e27	3252	Rogatec
00050000-5645-d72e-12f7-49997c808e94	1373	Rovte
00050000-5645-d72e-bc00-2783dfd29004	2342	Ruše
00050000-5645-d72e-d229-a1cbf1d78c98	1282	Sava
00050000-5645-d72e-525e-6e31a9484816	6333	Sečovlje/Sicciole
00050000-5645-d72e-4378-48a0066eb65a	4227	Selca
00050000-5645-d72e-699a-5541a5580203	2352	Selnica ob Dravi
00050000-5645-d72e-f59d-de4d7318d4c6	8333	Semič
00050000-5645-d72e-3f13-f09c9cf26ee1	8281	Senovo
00050000-5645-d72e-6f5c-91445f9edbdb	6224	Senožeče
00050000-5645-d72e-e70f-728828bff1d1	8290	Sevnica
00050000-5645-d72e-9356-b8394fc56672	6210	Sežana
00050000-5645-d72e-70d2-e1dcbcb1234b	2214	Sladki Vrh
00050000-5645-d72e-ebb4-c06362d857a2	5283	Slap ob Idrijci
00050000-5645-d72e-51a0-7f9a773d12d6	2380	Slovenj Gradec
00050000-5645-d72e-4a79-777772a78487	2310	Slovenska Bistrica
00050000-5645-d72e-4d63-f3ca22f88858	3210	Slovenske Konjice
00050000-5645-d72e-32d5-39622095dc61	1216	Smlednik
00050000-5645-d72e-9524-ae88e118115d	5232	Soča
00050000-5645-d72e-74ea-0db4b73ced5b	1317	Sodražica
00050000-5645-d72e-2451-650b5984051d	3335	Solčava
00050000-5645-d72e-b2a3-ca8ab64efa89	5250	Solkan
00050000-5645-d72e-0b95-bec7d76a572f	4229	Sorica
00050000-5645-d72e-a75f-8a7cbf4e25a2	4225	Sovodenj
00050000-5645-d72e-6548-6cae78a10ef2	5281	Spodnja Idrija
00050000-5645-d72e-1230-16cb39649b30	2241	Spodnji Duplek
00050000-5645-d72e-fce9-bdac69d4ccdc	9245	Spodnji Ivanjci
00050000-5645-d72e-b335-1c53a173c2e8	2277	Središče ob Dravi
00050000-5645-d72e-8f0c-bc4f721b4cbc	4267	Srednja vas v Bohinju
00050000-5645-d72e-92eb-815751f641da	8256	Sromlje 
00050000-5645-d72e-ed31-15b39481aca2	5224	Srpenica
00050000-5645-d72e-37e2-de802c47c417	1242	Stahovica
00050000-5645-d72e-4ee3-6a15b4ab1fa1	1332	Stara Cerkev
00050000-5645-d72e-be46-62618d6f1a3b	8342	Stari trg ob Kolpi
00050000-5645-d72e-3b56-d4a0fa6066d0	1386	Stari trg pri Ložu
00050000-5645-d72e-a9c4-048636b10805	2205	Starše
00050000-5645-d72e-7095-167b54d67a52	2289	Stoperce
00050000-5645-d72e-f025-17431c947577	8322	Stopiče
00050000-5645-d72e-b83e-1ba99fff4a5b	3206	Stranice
00050000-5645-d72e-121f-c25471487a9c	8351	Straža
00050000-5645-d72e-1124-f535eff4e683	1313	Struge
00050000-5645-d72e-0f3d-4644ef6c8ece	8293	Studenec
00050000-5645-d72e-c54a-aa6d20a8bcfa	8331	Suhor
00050000-5645-d72e-188e-962b2c2dc114	2233	Sv. Ana v Slovenskih goricah
00050000-5645-d72e-3002-33b151fbf03e	2235	Sv. Trojica v Slovenskih goricah
00050000-5645-d72e-dd95-04b94388c68a	2353	Sveti Duh na Ostrem Vrhu
00050000-5645-d72e-75f6-21a61f18739a	9244	Sveti Jurij ob Ščavnici
00050000-5645-d72e-0260-efa8188bb707	3264	Sveti Štefan
00050000-5645-d72e-33c5-9faebeff2ec6	2258	Sveti Tomaž
00050000-5645-d72e-7691-000b132dad6f	9204	Šalovci
00050000-5645-d72e-f216-065d9eb1867a	5261	Šempas
00050000-5645-d72e-4018-da7ac64445f2	5290	Šempeter pri Gorici
00050000-5645-d72e-adef-89e17a2a09a9	3311	Šempeter v Savinjski dolini
00050000-5645-d72e-2a9e-f4e9e84d8629	4208	Šenčur
00050000-5645-d72e-a24b-7bc4f5b537e6	2212	Šentilj v Slovenskih goricah
00050000-5645-d72e-e00a-2864e38999dc	8297	Šentjanž
00050000-5645-d72e-6e22-6f588d4b1e84	2373	Šentjanž pri Dravogradu
00050000-5645-d72e-d70d-51aa6e228daa	8310	Šentjernej
00050000-5645-d72e-d2f8-02ad8709d367	3230	Šentjur
00050000-5645-d72e-758c-835924d10e84	3271	Šentrupert
00050000-5645-d72e-2918-de70aab6a0f5	8232	Šentrupert
00050000-5645-d72e-4e0e-0d8a32458204	1296	Šentvid pri Stični
00050000-5645-d72e-d1fb-7ba00798946a	8275	Škocjan
00050000-5645-d72e-53c6-849a3a1a9b45	6281	Škofije
00050000-5645-d72e-afa0-ea901568e0d6	4220	Škofja Loka
00050000-5645-d72e-a82b-f04d6c3c9bc0	3211	Škofja vas
00050000-5645-d72e-ce21-a38d95a27112	1291	Škofljica
00050000-5645-d72e-fa73-73970240d178	6274	Šmarje
00050000-5645-d72e-db44-5786f600fb5e	1293	Šmarje - Sap
00050000-5645-d72e-6cea-7d18deaffe60	3240	Šmarje pri Jelšah
00050000-5645-d72e-6c5f-18d12bff0f6f	8220	Šmarješke Toplice
00050000-5645-d72e-61f2-14a46d9a75e8	2315	Šmartno na Pohorju
00050000-5645-d72e-9807-d00538d0cd9b	3341	Šmartno ob Dreti
00050000-5645-d72e-adb6-138a8fc3afaf	3327	Šmartno ob Paki
00050000-5645-d72e-f195-8753c5ec722b	1275	Šmartno pri Litiji
00050000-5645-d72e-d6c0-67dff4ae02ae	2383	Šmartno pri Slovenj Gradcu
00050000-5645-d72e-98f7-6cb1a1572819	3201	Šmartno v Rožni dolini
00050000-5645-d72e-b082-655cf9866912	3325	Šoštanj
00050000-5645-d72e-ad7a-92ec9761afb4	6222	Štanjel
00050000-5645-d72e-50c6-d6a994c4ea10	3220	Štore
00050000-5645-d72e-82cc-4de54245541c	3304	Tabor
00050000-5645-d72e-e0d4-63cae70350bf	3221	Teharje
00050000-5645-d72e-063b-6d71fc6a5b2b	9251	Tišina
00050000-5645-d72e-d879-20ff366f2915	5220	Tolmin
00050000-5645-d72e-d007-bd31aae5db1f	3326	Topolšica
00050000-5645-d72e-6810-70e47618574b	2371	Trbonje
00050000-5645-d72e-9095-f90c2defe9b8	1420	Trbovlje
00050000-5645-d72e-4ebd-fd9c7c1ae2df	8231	Trebelno 
00050000-5645-d72e-487c-aea2bde72a51	8210	Trebnje
00050000-5645-d72e-629f-34f0decc14ed	5252	Trnovo pri Gorici
00050000-5645-d72e-05d8-f18ce9fab693	2254	Trnovska vas
00050000-5645-d72e-5f29-d4d577f89a89	1222	Trojane
00050000-5645-d72e-fb76-eaa1d61680e9	1236	Trzin
00050000-5645-d72e-5d77-58d1aa5d4627	4290	Tržič
00050000-5645-d72e-a9fd-6f54557026bb	8295	Tržišče
00050000-5645-d72e-d509-4fdfe5d5ef14	1311	Turjak
00050000-5645-d72e-d340-6f75781eee09	9224	Turnišče
00050000-5645-d72e-0255-04c00853e64b	8323	Uršna sela
00050000-5645-d72e-a29d-dd7e77283760	1252	Vače
00050000-5645-d72e-bbe9-d45e0f499cb2	3320	Velenje 
00050000-5645-d72e-bbf5-7727df64eb96	3322	Velenje - poštni predali
00050000-5645-d72e-7552-f1579276e558	8212	Velika Loka
00050000-5645-d72e-ed7e-b665e3e6d1d0	2274	Velika Nedelja
00050000-5645-d72e-9603-ca82d0c5e62a	9225	Velika Polana
00050000-5645-d72e-a7be-2741d5425b8f	1315	Velike Lašče
00050000-5645-d72e-676d-76ef27820eba	8213	Veliki Gaber
00050000-5645-d72e-56c9-a7bf7d19916a	9241	Veržej
00050000-5645-d72e-becc-fb69417948fe	1312	Videm - Dobrepolje
00050000-5645-d72e-c29f-be42f0be763c	2284	Videm pri Ptuju
00050000-5645-d72e-2558-26aaddf315f0	8344	Vinica
00050000-5645-d72e-e90f-76a844a67e6d	5271	Vipava
00050000-5645-d72e-be4c-d5d514621b51	4212	Visoko
00050000-5645-d72e-4fd8-35b451c7324c	1294	Višnja Gora
00050000-5645-d72e-6b76-81958ab3455d	3205	Vitanje
00050000-5645-d72e-772b-df51ef494b47	2255	Vitomarci
00050000-5645-d72e-9b5b-398c42126f90	1217	Vodice
00050000-5645-d72e-084c-760603304489	3212	Vojnik\t
00050000-5645-d72e-741c-f1f223124185	5293	Volčja Draga
00050000-5645-d72e-f6e1-fee110109357	2232	Voličina
00050000-5645-d72e-5d79-b69717ce8e76	3305	Vransko
00050000-5645-d72e-8dfa-d2eef2eee1ea	6217	Vremski Britof
00050000-5645-d72e-0790-dbe128cb0b1c	1360	Vrhnika
00050000-5645-d72e-8ca0-1787770e3c30	2365	Vuhred
00050000-5645-d72e-0897-a552104d7015	2367	Vuzenica
00050000-5645-d72e-859c-2cb1ffada73f	8292	Zabukovje 
00050000-5645-d72e-8497-5f5909a279aa	1410	Zagorje ob Savi
00050000-5645-d72e-f50a-0d8bae96d6fd	1303	Zagradec
00050000-5645-d72e-7fba-a7190987acd1	2283	Zavrč
00050000-5645-d72e-1777-29a594b757a3	8272	Zdole 
00050000-5645-d72e-96ab-cbe81a9fb087	4201	Zgornja Besnica
00050000-5645-d72e-8c26-7e2fc4c75d09	2242	Zgornja Korena
00050000-5645-d72e-8ce4-75e9f23df6fe	2201	Zgornja Kungota
00050000-5645-d72e-8d37-5191111b0475	2316	Zgornja Ložnica
00050000-5645-d72e-762c-ab628b566404	2314	Zgornja Polskava
00050000-5645-d72e-962b-561f88e6d7ad	2213	Zgornja Velka
00050000-5645-d72e-3c4f-23f8359c4a60	4247	Zgornje Gorje
00050000-5645-d72e-0322-84eab51cd300	4206	Zgornje Jezersko
00050000-5645-d72e-bd01-a84e47004a54	2285	Zgornji Leskovec
00050000-5645-d72e-e12e-a8c4cde20140	1432	Zidani Most
00050000-5645-d72e-4b11-34cfe03d25c3	3214	Zreče
00050000-5645-d72e-2c72-bfd7c3698cf2	4209	Žabnica
00050000-5645-d72e-bd39-87ce0ab90610	3310	Žalec
00050000-5645-d72e-2642-ad214d3f2e6f	4228	Železniki
00050000-5645-d72e-86fa-e790517464fe	2287	Žetale
00050000-5645-d72e-995a-7cea4823e7ae	4226	Žiri
00050000-5645-d72e-bf98-2891a7a14d1f	4274	Žirovnica
00050000-5645-d72e-eac4-781bc52c98ef	8360	Žužemberk
\.


--
-- TOC entry 3161 (class 0 OID 26744679)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 26744255)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 26744003)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5645-d730-c580-2e13426212fb	00080000-5645-d730-e044-1937a682a55a	\N	00040000-5645-d72e-f3fe-4de26d7ebf63	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5645-d730-44cb-3f8a0f9dab89	00080000-5645-d730-e044-1937a682a55a	\N	00040000-5645-d72e-f3fe-4de26d7ebf63	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5645-d730-3e4b-b5aeca0b5275	00080000-5645-d730-c34d-fed7c6395f37	\N	00040000-5645-d72e-f3fe-4de26d7ebf63	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3123 (class 0 OID 26744147)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5645-d72e-8dc8-6f0c95a2c32a	novo leto	1	1	\N	t
00430000-5645-d72e-0179-1880c45d0e7e	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5645-d72e-2a8f-6bf07941fd2c	dan upora proti okupatorju	27	4	\N	t
00430000-5645-d72e-cba0-0cc7a7b91bad	praznik dela	1	5	\N	t
00430000-5645-d72e-37a5-c1b34f1a812a	praznik dela	2	5	\N	t
00430000-5645-d72e-8704-eac73ef237f5	dan Primoža Trubarja	8	6	\N	f
00430000-5645-d72e-71f0-36c6ae26cc18	dan državnosti	25	6	\N	t
00430000-5645-d72e-b5fd-21b49faa1d8b	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5645-d72e-9355-bc14b463954b	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5645-d72e-14d4-cd805e065798	dan suverenosti	25	10	\N	f
00430000-5645-d72e-f4aa-430bd85b523c	dan spomina na mrtve	1	11	\N	t
00430000-5645-d72e-bc8c-679526ec6595	dan Rudolfa Maistra	23	11	\N	f
00430000-5645-d72e-6718-9a2d0cbe9ef1	božič	25	12	\N	t
00430000-5645-d72e-f69c-bb80df419121	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5645-d72e-8c0b-e69f0035c41b	Marijino vnebovzetje	15	8	\N	t
00430000-5645-d72e-d502-6abd66c90097	dan reformacije	31	10	\N	t
00430000-5645-d72e-072f-79b98924c21a	velikonočna nedelja	27	3	2016	t
00430000-5645-d72e-ec87-d335bd40ffd4	velikonočna nedelja	16	4	2017	t
00430000-5645-d72e-4d0b-b81876f40dc7	velikonočna nedelja	1	4	2018	t
00430000-5645-d72e-a8af-fa6c2dbf218f	velikonočna nedelja	21	4	2019	t
00430000-5645-d72e-2646-8b6adbcf008e	velikonočna nedelja	12	4	2020	t
00430000-5645-d72e-fe29-fc98633eef14	velikonočna nedelja	4	4	2021	t
00430000-5645-d72e-9e47-e75c1a8fd6b6	velikonočna nedelja	17	4	2022	t
00430000-5645-d72e-6a4c-1fa3fb77a5d8	velikonočna nedelja	9	4	2023	t
00430000-5645-d72e-9b2f-ef13f3a77684	velikonočna nedelja	31	3	2024	t
00430000-5645-d72e-a577-04caa35d2483	velikonočna nedelja	20	4	2025	t
00430000-5645-d72e-f23c-6075fb46a6dd	velikonočna nedelja	5	4	2026	t
00430000-5645-d72e-ffc7-b6438fefbcd3	velikonočna nedelja	28	3	2027	t
00430000-5645-d72e-8581-d2b0f28386a6	velikonočna nedelja	16	4	2028	t
00430000-5645-d72e-8782-c363dc7223de	velikonočna nedelja	1	4	2029	t
00430000-5645-d72e-5795-85ad4903cc9c	velikonočna nedelja	21	4	2030	t
00430000-5645-d72e-0a09-548de7b275d7	velikonočni ponedeljek	28	3	2016	t
00430000-5645-d72e-deaa-f81a9dc263dc	velikonočni ponedeljek	17	4	2017	t
00430000-5645-d72e-730a-56489fc43293	velikonočni ponedeljek	2	4	2018	t
00430000-5645-d72e-3475-cb9d139a0939	velikonočni ponedeljek	22	4	2019	t
00430000-5645-d72e-1020-03d4b726f061	velikonočni ponedeljek	13	4	2020	t
00430000-5645-d72e-052f-7ba410ff38ff	velikonočni ponedeljek	5	4	2021	t
00430000-5645-d72e-7f61-cfbcecfef3e3	velikonočni ponedeljek	18	4	2022	t
00430000-5645-d72e-1e75-2bba32a4fc6c	velikonočni ponedeljek	10	4	2023	t
00430000-5645-d72e-3931-891e34dd3997	velikonočni ponedeljek	1	4	2024	t
00430000-5645-d72e-aaca-e28e3002d2b0	velikonočni ponedeljek	21	4	2025	t
00430000-5645-d72e-59e3-abaada15717e	velikonočni ponedeljek	6	4	2026	t
00430000-5645-d72e-a96f-bbf211bfa409	velikonočni ponedeljek	29	3	2027	t
00430000-5645-d72e-eb01-1888dcebd671	velikonočni ponedeljek	17	4	2028	t
00430000-5645-d72e-c075-fa23a1df5864	velikonočni ponedeljek	2	4	2029	t
00430000-5645-d72e-2add-d59c6ebd7033	velikonočni ponedeljek	22	4	2030	t
00430000-5645-d72e-6da3-cc52d78b74c3	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5645-d72e-21f9-b41986810aaf	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5645-d72e-19bd-af1211f75546	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5645-d72e-adee-70af2125469b	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5645-d72e-961e-f3838192fa9b	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5645-d72e-d25a-ba73afb63492	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5645-d72e-c5ba-fda7c626fb3e	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5645-d72e-5169-f2fe274a954c	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5645-d72e-2496-bdebeca293d5	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5645-d72e-4678-374f76c1364e	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5645-d72e-b569-defebf8acb42	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5645-d72e-5be4-7811941b1a1f	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5645-d72e-a189-85ae38b101aa	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5645-d72e-1f92-49ed92afc053	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5645-d72e-d574-28076fd3df44	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3119 (class 0 OID 26744107)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 26744119)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 26744267)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 26744693)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 26744703)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5645-d730-ce3f-b8fd2ae3538b	00080000-5645-d730-0d34-ded0c101c12c	0987	AK
00190000-5645-d730-2b6d-2144f5d9cf96	00080000-5645-d730-c34d-fed7c6395f37	0989	AK
00190000-5645-d730-4550-6583231ac007	00080000-5645-d730-0a7b-a183b928e630	0986	AK
00190000-5645-d730-71c1-8c8f1341ab09	00080000-5645-d730-447f-bfe63320bde7	0984	AK
00190000-5645-d730-2f87-639fa8892b76	00080000-5645-d730-9dbf-8c7849f5c2f0	0983	AK
00190000-5645-d730-1b58-538b78a1540f	00080000-5645-d730-d41d-cd638fb22a5f	0982	AK
00190000-5645-d732-976c-4a7ae3d4fee7	00080000-5645-d732-8cc0-77884fdb059d	1001	AK
\.


--
-- TOC entry 3160 (class 0 OID 26744602)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5645-d730-c595-6d922b16112a	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3164 (class 0 OID 26744711)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 26744296)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5645-d730-747c-673c01e81d3c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5645-d730-855d-6666dbe05409	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5645-d730-25c2-2ccc858672b6	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5645-d730-5c7f-c1ae930b7890	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5645-d730-bee7-19240be490ce	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5645-d730-d659-4f292d6c74b0	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5645-d730-d878-808d38f3da59	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3132 (class 0 OID 26744240)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 26744230)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 26744441)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 26744371)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 26744081)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 26743843)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5645-d732-8cc0-77884fdb059d	00010000-5645-d72f-96bc-c85865154a94	2015-11-13 13:27:30	INS	a:0:{}
2	App\\Entity\\Option	00000000-5645-d732-ed88-539e96a83508	00010000-5645-d72f-96bc-c85865154a94	2015-11-13 13:27:30	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5645-d732-976c-4a7ae3d4fee7	00010000-5645-d72f-96bc-c85865154a94	2015-11-13 13:27:30	INS	a:0:{}
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3141 (class 0 OID 26744309)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 26743881)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5645-d72f-897a-48c8edfa9057	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5645-d72f-1e59-bf2e9dfdcf3a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5645-d72f-2dc5-a99a0538a7f9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5645-d72f-3684-c31c1f06b38d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5645-d72f-f3fb-a71af44f30d0	planer	Planer dogodkov v koledarju	t
00020000-5645-d72f-6513-10649345178b	kadrovska	Kadrovska služba	t
00020000-5645-d72f-96fd-5e0888d35272	arhivar	Ažuriranje arhivalij	t
00020000-5645-d72f-20b9-bf5edb0fbbab	igralec	Igralec	t
00020000-5645-d72f-baab-d4c7162a229e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5645-d730-eb6c-d3c5adb78d3f	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5645-d730-bbe2-2490284a5244	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5645-d730-e145-e562193be85c	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5645-d730-4d9e-0f9142eac0c7	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5645-d730-8ffb-022892558033	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5645-d730-06be-fb4949ea381a	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5645-d730-63f2-9bc47a68d414	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5645-d730-3697-bb55cf111465	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5645-d730-3375-1eb7c42de127	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5645-d730-5dc3-6196927c7183	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5645-d730-ae92-734383473910	MapaAcl-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3098 (class 0 OID 26743865)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5645-d72f-a0f6-292079ab0582	00020000-5645-d72f-2dc5-a99a0538a7f9
00010000-5645-d72f-96bc-c85865154a94	00020000-5645-d72f-2dc5-a99a0538a7f9
00010000-5645-d730-ac80-a9ae2a941f8d	00020000-5645-d730-eb6c-d3c5adb78d3f
00010000-5645-d730-785c-289de4f06956	00020000-5645-d730-bbe2-2490284a5244
00010000-5645-d730-785c-289de4f06956	00020000-5645-d730-06be-fb4949ea381a
00010000-5645-d730-b28c-a871eccb2849	00020000-5645-d730-e145-e562193be85c
00010000-5645-d730-b28c-a871eccb2849	00020000-5645-d730-63f2-9bc47a68d414
00010000-5645-d730-b28c-a871eccb2849	00020000-5645-d730-ae92-734383473910
00010000-5645-d730-641d-dd4a940f5147	00020000-5645-d730-e145-e562193be85c
00010000-5645-d730-641d-dd4a940f5147	00020000-5645-d730-4d9e-0f9142eac0c7
00010000-5645-d730-641d-dd4a940f5147	00020000-5645-d730-63f2-9bc47a68d414
00010000-5645-d730-641d-dd4a940f5147	00020000-5645-d730-3697-bb55cf111465
00010000-5645-d730-641d-dd4a940f5147	00020000-5645-d730-3375-1eb7c42de127
00010000-5645-d730-641d-dd4a940f5147	00020000-5645-d730-06be-fb4949ea381a
00010000-5645-d730-641d-dd4a940f5147	00020000-5645-d730-ae92-734383473910
00010000-5645-d730-d9bf-09051736cba6	00020000-5645-d730-bbe2-2490284a5244
00010000-5645-d730-d9bf-09051736cba6	00020000-5645-d730-8ffb-022892558033
00010000-5645-d730-d9bf-09051736cba6	00020000-5645-d730-06be-fb4949ea381a
00010000-5645-d730-d9bf-09051736cba6	00020000-5645-d730-5dc3-6196927c7183
\.


--
-- TOC entry 3143 (class 0 OID 26744323)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 26744261)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 26744207)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5645-d730-74d6-91970d4dc3e2	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5645-d730-67e3-16e2a4ac4217	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5645-d730-903c-373d3b32bc00	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3094 (class 0 OID 26743830)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5645-d72e-3022-dfe90831b2c6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5645-d72e-7043-51c8f26118c4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5645-d72e-ca59-4c67d4db396a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5645-d72e-adf5-93601989b334	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5645-d72e-45bc-020a8e2134ff	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3093 (class 0 OID 26743822)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5645-d72e-505d-8b50d4c3f8d9	00230000-5645-d72e-adf5-93601989b334	popa
00240000-5645-d72e-dd85-dda75510524a	00230000-5645-d72e-adf5-93601989b334	oseba
00240000-5645-d72e-7b07-2ba117e0132d	00230000-5645-d72e-adf5-93601989b334	tippopa
00240000-5645-d72e-5d5b-555f04adc11d	00230000-5645-d72e-adf5-93601989b334	organizacijskaenota
00240000-5645-d72e-fb9e-f68fed4b658c	00230000-5645-d72e-adf5-93601989b334	sezona
00240000-5645-d72e-fede-f2d0dca735c4	00230000-5645-d72e-adf5-93601989b334	tipvaje
00240000-5645-d72e-6212-85277fde9da7	00230000-5645-d72e-7043-51c8f26118c4	prostor
00240000-5645-d72e-53ca-044579220a30	00230000-5645-d72e-adf5-93601989b334	besedilo
00240000-5645-d72e-b11e-f92e26463f60	00230000-5645-d72e-adf5-93601989b334	uprizoritev
00240000-5645-d72e-1a8f-2ea69c190b93	00230000-5645-d72e-adf5-93601989b334	funkcija
00240000-5645-d72e-8189-e2725d681312	00230000-5645-d72e-adf5-93601989b334	tipfunkcije
00240000-5645-d72e-6230-952f48e3c226	00230000-5645-d72e-adf5-93601989b334	alternacija
00240000-5645-d72e-4b4b-ef366220f852	00230000-5645-d72e-3022-dfe90831b2c6	pogodba
00240000-5645-d72e-a4b8-7f18aba90721	00230000-5645-d72e-adf5-93601989b334	zaposlitev
00240000-5645-d72e-45e5-5c8a9f3ad6bc	00230000-5645-d72e-adf5-93601989b334	zvrstuprizoritve
00240000-5645-d72e-fd0e-d993781776b7	00230000-5645-d72e-3022-dfe90831b2c6	programdela
00240000-5645-d72e-49c1-e3856909dff8	00230000-5645-d72e-adf5-93601989b334	zapis
\.


--
-- TOC entry 3092 (class 0 OID 26743817)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
917c0d10-12e5-42bf-ae03-3ac8d62fc4c1	00240000-5645-d72e-505d-8b50d4c3f8d9	0	1001
\.


--
-- TOC entry 3149 (class 0 OID 26744388)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5645-d731-9143-e3df0653af51	000e0000-5645-d730-ee2b-aced88ab2937	00080000-5645-d730-e044-1937a682a55a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5645-d72e-1bb7-9fd3c9ae4c9f
00270000-5645-d731-0b2d-d9497026b6c7	000e0000-5645-d730-ee2b-aced88ab2937	00080000-5645-d730-e044-1937a682a55a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5645-d72e-1bb7-9fd3c9ae4c9f
\.


--
-- TOC entry 3108 (class 0 OID 26743965)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 26744217)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5645-d731-8ea2-ca65242c732b	00180000-5645-d730-914e-b925c1106304	000c0000-5645-d731-883f-5ef7b87bb632	00090000-5645-d730-c07c-f04c14f36ddd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-d731-ad31-946f62fdf8b5	00180000-5645-d730-914e-b925c1106304	000c0000-5645-d731-4af3-a977a76ef219	00090000-5645-d730-2982-fa619ff4416f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-d731-cf0f-dc73e0393324	00180000-5645-d730-914e-b925c1106304	000c0000-5645-d731-5e14-740f690905af	00090000-5645-d730-8e0c-806b6d847cc7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-d731-3fa6-4fe6f7ff19e7	00180000-5645-d730-914e-b925c1106304	000c0000-5645-d731-9d57-15fa7fdd60a0	00090000-5645-d730-b4d9-f1037a5a7740	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-d731-7298-7695e641a5ae	00180000-5645-d730-914e-b925c1106304	000c0000-5645-d731-2880-4410450d06f4	00090000-5645-d730-f00e-b7dc9d972e99	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5645-d731-47f7-1f10e7193ca5	00180000-5645-d730-76b5-860e0cb81cfe	\N	00090000-5645-d730-f00e-b7dc9d972e99	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5645-d731-db5e-f756e86a7af0	00180000-5645-d730-76b5-860e0cb81cfe	\N	00090000-5645-d730-2982-fa619ff4416f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3152 (class 0 OID 26744429)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5645-d72e-a93a-ce97dd5199ae	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5645-d72e-89f1-a38f1eb48fa8	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5645-d72e-b825-e6e111a7e476	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5645-d72e-509d-825b4ad0f4e3	04	Režija	Režija	Režija	umetnik	30
000f0000-5645-d72e-6e9b-45d4adba2c4c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5645-d72e-a8da-bfa5565f0bb8	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5645-d72e-9fd8-d76d3220ed08	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5645-d72e-43e1-0dc3951d9ee1	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5645-d72e-b677-56548b870b80	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5645-d72e-b4d3-67cdd3b498b6	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5645-d72e-005b-005253ae0064	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5645-d72e-9dbf-5029763b1d08	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5645-d72e-b87d-141c7c3e2224	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5645-d72e-8e3d-14442557aa07	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5645-d72e-85e2-7a8dc6fd7b22	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5645-d72e-9927-8a7db27c1c12	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5645-d72e-4a64-9565ab61c664	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5645-d72e-5252-76e302366df7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3105 (class 0 OID 26743916)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5645-d730-5269-ceca25a2a431	0001	šola	osnovna ali srednja šola
00400000-5645-d730-6af6-7b5520e70e3c	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5645-d730-b35f-85db4ba26957	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3165 (class 0 OID 26744722)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5645-d72e-295a-2cbe7dc6ae88	01	Velika predstava	f	1.00	1.00
002b0000-5645-d72e-3548-d5ad11563971	02	Mala predstava	f	0.50	0.50
002b0000-5645-d72e-892e-cfafefe74048	03	Mala koprodukcija	t	0.40	1.00
002b0000-5645-d72e-cef6-a093b99f33ae	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5645-d72e-036c-35c2d4a25f77	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3128 (class 0 OID 26744197)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5645-d72e-4d7b-92d0428c092e	0001	prva vaja	prva vaja
00420000-5645-d72e-430f-87d7fd060d23	0002	tehnična vaja	tehnična vaja
00420000-5645-d72e-e23c-be3d300b0977	0003	lučna vaja	lučna vaja
00420000-5645-d72e-42a9-7d4987eb20f8	0004	kostumska vaja	kostumska vaja
00420000-5645-d72e-bea6-bbe123f5afdb	0005	foto vaja	foto vaja
00420000-5645-d72e-8cb0-1796c5350229	0006	1. glavna vaja	1. glavna vaja
00420000-5645-d72e-b32c-a5f9cf1b1ded	0007	2. glavna vaja	2. glavna vaja
00420000-5645-d72e-0947-c8dee02678cd	0008	1. generalka	1. generalka
00420000-5645-d72e-e139-ff8f97762575	0009	2. generalka	2. generalka
00420000-5645-d72e-0b64-747fc5de1f7c	0010	odprta generalka	odprta generalka
00420000-5645-d72e-4192-19961fbefe5a	0011	obnovitvena vaja	obnovitvena vaja
00420000-5645-d72e-382c-68b8546ad286	0012	pevska vaja	pevska vaja
00420000-5645-d72e-ed2c-03ae0737be5b	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5645-d72e-1276-ac933bdf0be0	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3114 (class 0 OID 26744038)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 26743852)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5645-d72f-96bc-c85865154a94	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROGB/3n4Pg4v3Wvu7mWnwKJ0T7e5nUr.G	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5645-d730-1184-d92e2a496ca1	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5645-d730-bcb4-d7d786fb61a5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5645-d730-ba33-81aef633820e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5645-d730-42f9-f7d55d50fca1	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5645-d730-7278-6754f403215b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5645-d730-2bfa-774e3cafccf9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5645-d730-4389-93610cbf7fa6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5645-d730-a4c8-e225ff51de2f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5645-d730-34bb-ca9b3dda3dc1	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5645-d730-ac80-a9ae2a941f8d	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5645-d730-48b8-b245854755d6	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5645-d730-785c-289de4f06956	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5645-d730-b28c-a871eccb2849	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5645-d730-641d-dd4a940f5147	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5645-d730-d9bf-09051736cba6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5645-d72f-a0f6-292079ab0582	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3156 (class 0 OID 26744479)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5645-d730-93a5-40262ee5fabb	00160000-5645-d730-8aa1-045ceb7d70aa	\N	00140000-5645-d72e-c4c8-a7649f7b8b61	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5645-d730-bee7-19240be490ce
000e0000-5645-d730-ee2b-aced88ab2937	00160000-5645-d730-1679-6dbe13f1be95	\N	00140000-5645-d72e-cdab-82308e5e171e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5645-d730-d659-4f292d6c74b0
000e0000-5645-d730-bad6-4cafa063db08	\N	\N	00140000-5645-d72e-cdab-82308e5e171e	00190000-5645-d730-ce3f-b8fd2ae3538b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5645-d730-bee7-19240be490ce
000e0000-5645-d730-3b15-4e17ed64bb57	\N	\N	00140000-5645-d72e-cdab-82308e5e171e	00190000-5645-d730-ce3f-b8fd2ae3538b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5645-d730-bee7-19240be490ce
000e0000-5645-d730-7bd9-e90b6da223f9	\N	\N	00140000-5645-d72e-cdab-82308e5e171e	00190000-5645-d730-ce3f-b8fd2ae3538b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5645-d730-747c-673c01e81d3c
000e0000-5645-d730-1ccf-a5b463ed2f97	\N	\N	00140000-5645-d72e-cdab-82308e5e171e	00190000-5645-d730-ce3f-b8fd2ae3538b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5645-d730-747c-673c01e81d3c
\.


--
-- TOC entry 3122 (class 0 OID 26744137)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5645-d730-c0c3-1ca12cf5f389	\N	000e0000-5645-d730-ee2b-aced88ab2937	1	
00200000-5645-d730-dd63-345779cdb038	\N	000e0000-5645-d730-ee2b-aced88ab2937	2	
00200000-5645-d730-85c1-64c417ef1226	\N	000e0000-5645-d730-ee2b-aced88ab2937	3	
00200000-5645-d730-47f2-df0af04b6530	\N	000e0000-5645-d730-ee2b-aced88ab2937	4	
00200000-5645-d730-8967-51b2a13b1c89	\N	000e0000-5645-d730-ee2b-aced88ab2937	5	
\.


--
-- TOC entry 3139 (class 0 OID 26744288)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 26744402)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5645-d72e-9e4c-c9530e149db2	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5645-d72e-76cd-929f5c33370c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5645-d72e-9913-c0317b22dd05	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5645-d72e-75c2-9350f7ede0a5	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5645-d72e-8d20-4bf0a94742ad	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5645-d72e-b889-4add400c924d	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5645-d72e-6f02-741d3616543a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5645-d72e-e95d-5ff1e2e1d07a	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5645-d72e-1bb7-9fd3c9ae4c9f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5645-d72e-b720-87347275816e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5645-d72e-bdbc-968e256cf59a	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5645-d72e-4ecb-e6b845271dc6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5645-d72e-dce9-d8dfe101c471	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5645-d72e-20a5-e88a244ec64a	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5645-d72e-3bf0-d6328bc45bcc	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5645-d72e-b8fa-2a3eae9dd2c5	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5645-d72e-234f-91694f01fba1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5645-d72e-064e-bf33035d576c	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5645-d72e-6e51-e045df693e7d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5645-d72e-6ab0-9a177b7d0710	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5645-d72e-7bb3-586dda72d8f2	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5645-d72e-b051-aa2b86753c19	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5645-d72e-8177-1ffdc44653ca	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5645-d72e-e535-8eb539611ed7	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5645-d72e-a7ad-f4de7eadfedc	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5645-d72e-939f-11e488a645be	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5645-d72e-1c2f-0e3f56749eab	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5645-d72e-2dbe-2080e1986ab9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3168 (class 0 OID 26744772)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 26744741)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 26744784)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 26744360)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5645-d730-6b7d-0b094d29e5ec	00090000-5645-d730-2982-fa619ff4416f	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-d730-a68c-3a775e756cc4	00090000-5645-d730-8e0c-806b6d847cc7	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-d730-9020-c27640854482	00090000-5645-d730-3927-f6365c1fd5bb	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-d730-f042-9302ebd33e32	00090000-5645-d730-c0f7-cea69ccd0739	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-d730-25c5-893665a38492	00090000-5645-d730-be5e-6b60ae2d7569	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5645-d730-4e2c-ab8884ed38af	00090000-5645-d730-9da2-bca780a381d5	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3125 (class 0 OID 26744181)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 26744469)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5645-d72e-c4c8-a7649f7b8b61	01	Drama	drama (SURS 01)
00140000-5645-d72e-cc4e-0ae46605c9dc	02	Opera	opera (SURS 02)
00140000-5645-d72e-e35c-d4b0df70fb40	03	Balet	balet (SURS 03)
00140000-5645-d72e-4535-a1123f01a857	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5645-d72e-9a06-cdd3b98ffe33	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5645-d72e-cdab-82308e5e171e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5645-d72e-efed-04c9b4b8915f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3145 (class 0 OID 26744350)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2587 (class 2606 OID 26743915)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 26744528)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 26744518)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 26743906)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 26744385)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 26744427)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 26744824)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 26744169)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 26744191)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 26744196)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 26744739)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 26744064)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 26744596)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 26744346)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 26744135)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 26744102)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 26744078)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 26744253)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 26744801)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 26744808)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2868 (class 2606 OID 26744832)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2725 (class 2606 OID 26744280)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 26744036)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 26743934)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 26743998)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 26743961)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 26743895)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2576 (class 2606 OID 26743880)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 26744286)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 26744322)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 26744464)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 26743989)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 26744024)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 26744691)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 26744259)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 26744014)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 26744154)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 26744123)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2654 (class 2606 OID 26744115)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 26744271)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 26744700)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 26744708)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 26744678)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 26744720)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 26744304)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 26744244)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 26744235)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 26744451)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 26744378)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 26744090)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 26743851)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 26744313)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 26743869)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2578 (class 2606 OID 26743889)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 26744331)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 26744266)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 26744215)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 26743839)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 26743827)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 26743821)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 26744398)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 26743970)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 26744226)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 26744438)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 26743923)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 26744732)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 26744204)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 26744049)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 26743864)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 26744497)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 26744144)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 26744294)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 26744410)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 26744782)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 26744766)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 26744790)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 26744368)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 26744185)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 26744477)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 26744358)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 1259 OID 26744179)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2671 (class 1259 OID 26744180)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2672 (class 1259 OID 26744178)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2673 (class 1259 OID 26744177)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2674 (class 1259 OID 26744176)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2768 (class 1259 OID 26744399)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2769 (class 1259 OID 26744400)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2770 (class 1259 OID 26744401)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2854 (class 1259 OID 26744803)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2855 (class 1259 OID 26744802)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2605 (class 1259 OID 26743991)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2606 (class 1259 OID 26743992)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2726 (class 1259 OID 26744287)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2841 (class 1259 OID 26744770)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2842 (class 1259 OID 26744769)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2843 (class 1259 OID 26744771)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2844 (class 1259 OID 26744768)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2845 (class 1259 OID 26744767)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2720 (class 1259 OID 26744273)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2721 (class 1259 OID 26744272)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2662 (class 1259 OID 26744145)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2663 (class 1259 OID 26744146)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2750 (class 1259 OID 26744347)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 26744349)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2752 (class 1259 OID 26744348)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2637 (class 1259 OID 26744080)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 26744079)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 26744721)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2784 (class 1259 OID 26744466)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2785 (class 1259 OID 26744467)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 26744468)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2851 (class 1259 OID 26744791)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2793 (class 1259 OID 26744502)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2794 (class 1259 OID 26744499)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2795 (class 1259 OID 26744503)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2796 (class 1259 OID 26744501)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2797 (class 1259 OID 26744500)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2627 (class 1259 OID 26744051)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 26744050)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 26743964)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2738 (class 1259 OID 26744314)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2580 (class 1259 OID 26743896)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2581 (class 1259 OID 26743897)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2743 (class 1259 OID 26744334)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2744 (class 1259 OID 26744333)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2745 (class 1259 OID 26744332)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2610 (class 1259 OID 26744001)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2611 (class 1259 OID 26744000)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2612 (class 1259 OID 26744002)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2650 (class 1259 OID 26744118)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2651 (class 1259 OID 26744116)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 26744117)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2560 (class 1259 OID 26743829)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2700 (class 1259 OID 26744239)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2701 (class 1259 OID 26744237)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2702 (class 1259 OID 26744236)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2703 (class 1259 OID 26744238)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2571 (class 1259 OID 26743870)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2572 (class 1259 OID 26743871)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2729 (class 1259 OID 26744295)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2864 (class 1259 OID 26744825)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2766 (class 1259 OID 26744387)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2767 (class 1259 OID 26744386)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2865 (class 1259 OID 26744833)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2866 (class 1259 OID 26744834)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2715 (class 1259 OID 26744260)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2760 (class 1259 OID 26744379)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2761 (class 1259 OID 26744380)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 26744601)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2815 (class 1259 OID 26744600)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2816 (class 1259 OID 26744597)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 26744598)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2818 (class 1259 OID 26744599)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2616 (class 1259 OID 26744016)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 26744015)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2618 (class 1259 OID 26744017)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2732 (class 1259 OID 26744308)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2733 (class 1259 OID 26744307)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2824 (class 1259 OID 26744701)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2825 (class 1259 OID 26744702)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2807 (class 1259 OID 26744532)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 26744533)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2809 (class 1259 OID 26744530)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2810 (class 1259 OID 26744531)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2756 (class 1259 OID 26744369)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2757 (class 1259 OID 26744370)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2706 (class 1259 OID 26744248)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2707 (class 1259 OID 26744247)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2708 (class 1259 OID 26744245)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2709 (class 1259 OID 26744246)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2803 (class 1259 OID 26744520)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 26744519)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2641 (class 1259 OID 26744091)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2644 (class 1259 OID 26744105)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2645 (class 1259 OID 26744104)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2646 (class 1259 OID 26744103)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2647 (class 1259 OID 26744106)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2661 (class 1259 OID 26744136)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2655 (class 1259 OID 26744124)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2656 (class 1259 OID 26744125)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2821 (class 1259 OID 26744692)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2840 (class 1259 OID 26744740)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2858 (class 1259 OID 26744809)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2859 (class 1259 OID 26744810)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2592 (class 1259 OID 26743936)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 26743935)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2601 (class 1259 OID 26743971)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2602 (class 1259 OID 26743972)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2681 (class 1259 OID 26744186)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2695 (class 1259 OID 26744229)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 26744228)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2697 (class 1259 OID 26744227)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2675 (class 1259 OID 26744171)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2676 (class 1259 OID 26744172)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2677 (class 1259 OID 26744175)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2678 (class 1259 OID 26744170)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2679 (class 1259 OID 26744174)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2680 (class 1259 OID 26744173)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2609 (class 1259 OID 26743990)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 26743924)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 26743925)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 26744065)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 26744067)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2635 (class 1259 OID 26744066)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2636 (class 1259 OID 26744068)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2714 (class 1259 OID 26744254)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 26744465)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2798 (class 1259 OID 26744498)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 26744439)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 26744440)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2599 (class 1259 OID 26743962)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 26743963)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2753 (class 1259 OID 26744359)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 26743840)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 26744037)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2615 (class 1259 OID 26743999)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 26743828)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2837 (class 1259 OID 26744733)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 26744306)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2737 (class 1259 OID 26744305)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2690 (class 1259 OID 26744205)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 26744206)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2811 (class 1259 OID 26744529)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 26744025)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2790 (class 1259 OID 26744478)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2848 (class 1259 OID 26744783)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2830 (class 1259 OID 26744709)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 26744710)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2777 (class 1259 OID 26744428)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2694 (class 1259 OID 26744216)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 26743890)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2908 (class 2606 OID 26745005)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2907 (class 2606 OID 26745010)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2902 (class 2606 OID 26745035)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2904 (class 2606 OID 26745025)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2909 (class 2606 OID 26745000)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2905 (class 2606 OID 26745020)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2903 (class 2606 OID 26745030)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 26745015)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2945 (class 2606 OID 26745205)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2944 (class 2606 OID 26745210)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2943 (class 2606 OID 26745215)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 26745380)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 26745375)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2881 (class 2606 OID 26744890)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2880 (class 2606 OID 26744895)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 26745120)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2972 (class 2606 OID 26745360)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 26745355)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2971 (class 2606 OID 26745365)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 26745350)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2975 (class 2606 OID 26745345)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2924 (class 2606 OID 26745115)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2925 (class 2606 OID 26745110)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2901 (class 2606 OID 26744990)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2900 (class 2606 OID 26744995)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2936 (class 2606 OID 26745160)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 26745170)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2935 (class 2606 OID 26745165)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2890 (class 2606 OID 26744945)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 26744940)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2922 (class 2606 OID 26745100)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2969 (class 2606 OID 26745335)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2948 (class 2606 OID 26745220)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2947 (class 2606 OID 26745225)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2946 (class 2606 OID 26745230)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2976 (class 2606 OID 26745370)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2950 (class 2606 OID 26745250)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2953 (class 2606 OID 26745235)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2949 (class 2606 OID 26745255)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2951 (class 2606 OID 26745245)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2952 (class 2606 OID 26745240)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2888 (class 2606 OID 26744935)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 26744930)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 26744875)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2877 (class 2606 OID 26744870)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 26745140)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 26744850)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2872 (class 2606 OID 26744855)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2931 (class 2606 OID 26745155)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2932 (class 2606 OID 26745150)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2933 (class 2606 OID 26745145)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2883 (class 2606 OID 26744905)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2884 (class 2606 OID 26744900)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2882 (class 2606 OID 26744910)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2894 (class 2606 OID 26744970)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2896 (class 2606 OID 26744960)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2895 (class 2606 OID 26744965)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2869 (class 2606 OID 26744835)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2914 (class 2606 OID 26745075)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2916 (class 2606 OID 26745065)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2917 (class 2606 OID 26745060)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2915 (class 2606 OID 26745070)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2871 (class 2606 OID 26744840)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2870 (class 2606 OID 26744845)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2927 (class 2606 OID 26745125)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2981 (class 2606 OID 26745395)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 26745200)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 26745195)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2983 (class 2606 OID 26745400)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2982 (class 2606 OID 26745405)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2923 (class 2606 OID 26745105)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2940 (class 2606 OID 26745185)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2939 (class 2606 OID 26745190)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 26745310)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2961 (class 2606 OID 26745305)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2964 (class 2606 OID 26745290)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 26745295)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2962 (class 2606 OID 26745300)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2886 (class 2606 OID 26744920)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2887 (class 2606 OID 26744915)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 26744925)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2928 (class 2606 OID 26745135)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2929 (class 2606 OID 26745130)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 26745320)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2966 (class 2606 OID 26745325)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2957 (class 2606 OID 26745280)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 26745285)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2959 (class 2606 OID 26745270)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2958 (class 2606 OID 26745275)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 26745175)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2937 (class 2606 OID 26745180)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2918 (class 2606 OID 26745095)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2919 (class 2606 OID 26745090)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2921 (class 2606 OID 26745080)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2920 (class 2606 OID 26745085)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2954 (class 2606 OID 26745265)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 26745260)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2892 (class 2606 OID 26744950)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2893 (class 2606 OID 26744955)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 26744985)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2898 (class 2606 OID 26744975)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2897 (class 2606 OID 26744980)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2965 (class 2606 OID 26745315)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2968 (class 2606 OID 26745330)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 26745340)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 26745385)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 26745390)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2874 (class 2606 OID 26744865)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2875 (class 2606 OID 26744860)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2879 (class 2606 OID 26744880)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2878 (class 2606 OID 26744885)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2910 (class 2606 OID 26745040)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2911 (class 2606 OID 26745055)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 26745050)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2913 (class 2606 OID 26745045)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-13 13:27:32 CET

--
-- PostgreSQL database dump complete
--

