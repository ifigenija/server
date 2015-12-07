--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-07 13:00:50 CET

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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 30996973)
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
-- TOC entry 237 (class 1259 OID 30997587)
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
-- TOC entry 236 (class 1259 OID 30997570)
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
-- TOC entry 182 (class 1259 OID 30996966)
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
-- TOC entry 181 (class 1259 OID 30996964)
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
-- TOC entry 227 (class 1259 OID 30997447)
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
-- TOC entry 230 (class 1259 OID 30997477)
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
-- TOC entry 251 (class 1259 OID 30997880)
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
-- TOC entry 203 (class 1259 OID 30997221)
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
-- TOC entry 205 (class 1259 OID 30997253)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30997258)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 30997802)
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
-- TOC entry 194 (class 1259 OID 30997118)
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
-- TOC entry 238 (class 1259 OID 30997600)
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
-- TOC entry 223 (class 1259 OID 30997401)
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
-- TOC entry 200 (class 1259 OID 30997192)
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
-- TOC entry 197 (class 1259 OID 30997158)
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
-- TOC entry 195 (class 1259 OID 30997135)
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
-- TOC entry 212 (class 1259 OID 30997315)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 30997860)
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
-- TOC entry 250 (class 1259 OID 30997873)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 30997895)
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
-- TOC entry 216 (class 1259 OID 30997340)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 30997092)
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
-- TOC entry 185 (class 1259 OID 30996992)
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
-- TOC entry 189 (class 1259 OID 30997059)
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
-- TOC entry 186 (class 1259 OID 30997003)
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
-- TOC entry 178 (class 1259 OID 30996938)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 30996957)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30997347)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 30997381)
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
-- TOC entry 233 (class 1259 OID 30997518)
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
-- TOC entry 188 (class 1259 OID 30997039)
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
-- TOC entry 191 (class 1259 OID 30997084)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 30997746)
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
-- TOC entry 213 (class 1259 OID 30997321)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 30997069)
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
-- TOC entry 202 (class 1259 OID 30997213)
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
-- TOC entry 198 (class 1259 OID 30997173)
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
-- TOC entry 199 (class 1259 OID 30997185)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30997333)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 30997760)
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
-- TOC entry 242 (class 1259 OID 30997770)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 30997669)
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
-- TOC entry 243 (class 1259 OID 30997778)
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
-- TOC entry 219 (class 1259 OID 30997362)
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
-- TOC entry 211 (class 1259 OID 30997306)
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
-- TOC entry 210 (class 1259 OID 30997296)
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
-- TOC entry 232 (class 1259 OID 30997507)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 30997437)
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
-- TOC entry 196 (class 1259 OID 30997147)
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
-- TOC entry 175 (class 1259 OID 30996909)
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
-- TOC entry 174 (class 1259 OID 30996907)
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
-- TOC entry 220 (class 1259 OID 30997375)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 30996947)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 30996931)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 30997389)
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
-- TOC entry 214 (class 1259 OID 30997327)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 30997273)
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
-- TOC entry 173 (class 1259 OID 30996896)
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
-- TOC entry 172 (class 1259 OID 30996888)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 30996883)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 30997454)
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
-- TOC entry 187 (class 1259 OID 30997031)
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
-- TOC entry 209 (class 1259 OID 30997283)
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
-- TOC entry 231 (class 1259 OID 30997495)
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
-- TOC entry 184 (class 1259 OID 30996982)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 30997790)
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
-- TOC entry 207 (class 1259 OID 30997263)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 30997104)
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
-- TOC entry 176 (class 1259 OID 30996918)
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
-- TOC entry 235 (class 1259 OID 30997545)
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
-- TOC entry 201 (class 1259 OID 30997203)
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
-- TOC entry 218 (class 1259 OID 30997354)
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
-- TOC entry 229 (class 1259 OID 30997468)
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
-- TOC entry 247 (class 1259 OID 30997840)
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
-- TOC entry 246 (class 1259 OID 30997809)
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
-- TOC entry 248 (class 1259 OID 30997852)
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
-- TOC entry 225 (class 1259 OID 30997426)
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
-- TOC entry 204 (class 1259 OID 30997247)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 30997535)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 30997416)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 30996969)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 30996912)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 30996973)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5665-74ef-4ee6-aa8a0605ed5c	10	30	Otroci	Abonma za otroke	200
000a0000-5665-74ef-168b-3b6c4cb87eb6	20	60	Mladina	Abonma za mladino	400
000a0000-5665-74ef-b370-d9a5a1ef33ef	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 30997587)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5665-74f0-1512-fd57023100a9	000d0000-5665-74ef-9d63-95ab219c24f0	\N	00090000-5665-74ef-aa2c-79d33cfaf6ad	000b0000-5665-74ef-db6e-1f9275e125d7	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5665-74f0-84b8-c788e395fb0d	000d0000-5665-74ef-c5b8-6ea61cc0d0ef	00100000-5665-74ef-6e8d-4fa87682a533	00090000-5665-74ef-3106-b1a60512dee6	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5665-74f0-064a-3ccb080a7061	000d0000-5665-74ef-7e78-5e609a04b1ae	00100000-5665-74ef-4eb2-27984fc13051	00090000-5665-74ef-a76c-188318ec6501	\N	0003	t	\N	2015-12-07	\N	2	t	\N	f	f
000c0000-5665-74f0-20a3-b63ebfaabd58	000d0000-5665-74ef-ed3c-90fa1fb29e6f	\N	00090000-5665-74ef-3ec5-c7d0d13edf86	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5665-74f0-01ff-20edae3bc3e6	000d0000-5665-74ef-ab1c-720c00f1b51b	\N	00090000-5665-74ef-6961-0ba27869b2e2	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5665-74f0-0e23-30fe630d2330	000d0000-5665-74ef-8f43-0ad03cce505c	\N	00090000-5665-74ef-427c-11ced3c5c35b	000b0000-5665-74ef-0d29-e43e8d8daebc	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5665-74f0-0258-dcaadd39f959	000d0000-5665-74ef-cd0d-bb50bdaf7dd7	00100000-5665-74ef-463e-46d68db0e37c	00090000-5665-74ef-2fb1-080b1e56d92f	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5665-74f0-1620-1fc39bd191bd	000d0000-5665-74ef-053a-6b8f4c4fe1ca	\N	00090000-5665-74ef-1623-a67ed19ee44b	000b0000-5665-74ef-1ca9-4cd111258169	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5665-74f0-6294-bd64e0781116	000d0000-5665-74ef-cd0d-bb50bdaf7dd7	00100000-5665-74ef-9c90-4ad9692f1d99	00090000-5665-74ef-37ee-8016d8b8dd9c	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5665-74f0-d533-dbd26b068727	000d0000-5665-74ef-cd0d-bb50bdaf7dd7	00100000-5665-74ef-7869-c798c886c808	00090000-5665-74ef-f157-5e36cda6a898	\N	0010	t	\N	2015-12-07	\N	16	f	\N	f	t
000c0000-5665-74f0-a8c6-802102f451bb	000d0000-5665-74ef-cd0d-bb50bdaf7dd7	00100000-5665-74ef-7481-77a0aa558439	00090000-5665-74ef-f1a7-a6f0cc5963e4	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5665-74f0-5300-d60ba2291384	000d0000-5665-74ef-fe0d-4f8912444c96	00100000-5665-74ef-6e8d-4fa87682a533	00090000-5665-74ef-3106-b1a60512dee6	000b0000-5665-74ef-0b99-d1f1afbac5f4	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 30997570)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 30996966)
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
-- TOC entry 3151 (class 0 OID 30997447)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5665-74ef-02b8-476b4603b9d2	00160000-5665-74ef-d802-1a4a8ee7a6fb	00090000-5665-74ef-6777-5d96c4351ab1	aizv	10	t
003d0000-5665-74ef-c04c-d55454c67b4e	00160000-5665-74ef-d802-1a4a8ee7a6fb	00090000-5665-74ef-eaa9-5057d805cf24	apri	14	t
003d0000-5665-74ef-b2a0-658e97acadc1	00160000-5665-74ef-b45d-7eddd8ff6975	00090000-5665-74ef-f238-96e759a42299	aizv	11	t
003d0000-5665-74ef-c1a3-72d97b222526	00160000-5665-74ef-13dc-bcaf09b26cfe	00090000-5665-74ef-5f38-665ad0d3d5b7	aizv	12	t
003d0000-5665-74ef-1665-406c23e37e98	00160000-5665-74ef-d802-1a4a8ee7a6fb	00090000-5665-74ef-faee-7245416e30d0	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 30997477)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5665-74ef-d802-1a4a8ee7a6fb	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5665-74ef-b45d-7eddd8ff6975	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5665-74ef-13dc-bcaf09b26cfe	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 30997880)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 30997221)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5665-74f0-2626-d007c5fc4e2d	\N	\N	00200000-5665-74ef-0414-672bbca9afd3	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5665-74f0-0e8a-364dbbef421b	\N	\N	00200000-5665-74ef-7732-3039a6c391ce	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5665-74f0-0274-dcc6a13fe454	\N	\N	00200000-5665-74ef-82f0-5aa410709c82	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5665-74f0-fa46-afc1cbfe8c35	\N	\N	00200000-5665-74ef-66df-0e2ba8f42402	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5665-74f0-247e-504f93b29a9c	\N	\N	00200000-5665-74ef-0792-b59543396c60	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 30997253)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 30997258)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 30997802)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 30997118)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5665-74ed-5f1a-22d3d34e9673	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5665-74ed-773c-e1d0567d0282	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5665-74ed-e159-98ab199af1dc	AL	ALB	008	Albania 	Albanija	\N
00040000-5665-74ed-e97f-1f8994282c5c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5665-74ed-e699-7dc143ede6b4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5665-74ed-68d5-42740a2c3126	AD	AND	020	Andorra 	Andora	\N
00040000-5665-74ed-2187-a6925e079269	AO	AGO	024	Angola 	Angola	\N
00040000-5665-74ed-6751-066e242715b5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5665-74ed-2dcc-01a60313557e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5665-74ed-d721-a16c5309a977	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5665-74ed-06d8-8de3ad5931b3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5665-74ed-952a-89adcc557805	AM	ARM	051	Armenia 	Armenija	\N
00040000-5665-74ed-e119-bfaca6bd7fb0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5665-74ed-7887-3b22dcf4f891	AU	AUS	036	Australia 	Avstralija	\N
00040000-5665-74ed-72fa-6d4b1c39902f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5665-74ed-5a5f-822ab3d3e216	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5665-74ed-3d27-db155275f8e2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5665-74ed-c599-e635253a5acc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5665-74ed-e4c4-d1ceb19bd38a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5665-74ed-80b2-5e423acb2730	BB	BRB	052	Barbados 	Barbados	\N
00040000-5665-74ed-4a48-833d803e1e85	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5665-74ed-96bb-f698590a3933	BE	BEL	056	Belgium 	Belgija	\N
00040000-5665-74ed-1ab3-0e6ce4a3b4da	BZ	BLZ	084	Belize 	Belize	\N
00040000-5665-74ed-8a0f-6324cc4cd775	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5665-74ed-2c18-b192e4c192d8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5665-74ed-4965-cbab1b7e85c5	BT	BTN	064	Bhutan 	Butan	\N
00040000-5665-74ed-f9fd-56185a929a48	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5665-74ed-ad20-ba95f3f1d241	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5665-74ed-bfa6-994dfcfad499	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5665-74ed-92fb-8507c81f1b6b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5665-74ed-a47d-fc51448d4e92	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5665-74ed-b9ee-4a65d855868c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5665-74ed-9523-7b72b6283609	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5665-74ed-9888-b1177f676c3d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5665-74ed-5ee2-d3bdbee4734b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5665-74ed-d44c-a7681d9c1272	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5665-74ed-4616-7a4372d0b56e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5665-74ed-5c84-767abbb2f0e2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5665-74ed-6ad3-5e46aad375a0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5665-74ed-d5b2-9df5a7e6c33a	CA	CAN	124	Canada 	Kanada	\N
00040000-5665-74ed-222e-f68a350c6aaf	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5665-74ed-21a3-48ad945383c7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5665-74ed-e830-85bcaf0635e1	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5665-74ed-e44d-84b9a8d31418	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5665-74ed-a2b7-fca358dec1b7	CL	CHL	152	Chile 	Čile	\N
00040000-5665-74ed-6bd3-4b07dc41c03b	CN	CHN	156	China 	Kitajska	\N
00040000-5665-74ed-ec6a-65fb3605db69	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5665-74ed-2f81-3b953300d244	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5665-74ed-b9c0-a3a712a59b7a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5665-74ed-614d-635d98cec089	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5665-74ed-6a78-cc36fd99f4dd	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5665-74ed-aac8-808cd04c562f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5665-74ed-d24c-2285b53dc899	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5665-74ed-f3f3-1dc85ccac007	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5665-74ed-9b20-7af0db9e1c65	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5665-74ed-f33c-79a2bfffcb62	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5665-74ed-98bd-d0e31452868e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5665-74ed-c445-8e56393b07cf	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5665-74ed-4016-17e606110073	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5665-74ed-d040-1c52231ea407	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5665-74ed-7499-5fe4ee18c626	DK	DNK	208	Denmark 	Danska	\N
00040000-5665-74ed-9526-72d8e8ef2d82	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5665-74ed-b39c-b443e4550c0a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5665-74ed-23b8-c562bd72a3cc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5665-74ed-9ab4-772e8b634329	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5665-74ed-6574-a28dcb12f8dd	EG	EGY	818	Egypt 	Egipt	\N
00040000-5665-74ed-2a9f-c55f64252e18	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5665-74ed-c39c-bb903082e9f4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5665-74ed-450d-cebcdf032d81	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5665-74ed-51dd-500065d50826	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5665-74ed-35e6-20aed1456df5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5665-74ed-cdf7-eeb33cf9e168	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5665-74ed-fb9d-d6f2f9451a64	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5665-74ed-1130-01f710a7a53b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5665-74ed-53d2-3a8c7ef89e00	FI	FIN	246	Finland 	Finska	\N
00040000-5665-74ed-029a-0158545e2615	FR	FRA	250	France 	Francija	\N
00040000-5665-74ed-b84d-908180f1235b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5665-74ed-a551-006372660b98	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5665-74ed-4705-8ffce9766635	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5665-74ed-c45a-afb77ea7fd39	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5665-74ed-f384-bda9d7476021	GA	GAB	266	Gabon 	Gabon	\N
00040000-5665-74ed-3912-e3159baee701	GM	GMB	270	Gambia 	Gambija	\N
00040000-5665-74ed-64ce-13f7bc60a63c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5665-74ed-093f-9e28aacbfc3a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5665-74ed-578f-ae9393de1936	GH	GHA	288	Ghana 	Gana	\N
00040000-5665-74ed-7415-11aeae338293	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5665-74ed-30c1-ab5c117be38a	GR	GRC	300	Greece 	Grčija	\N
00040000-5665-74ed-d3b7-257780ae3a48	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5665-74ed-cbf0-61aee9a46a67	GD	GRD	308	Grenada 	Grenada	\N
00040000-5665-74ed-e7e4-2cd81c4f14df	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5665-74ed-d672-1715e5dd73a7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5665-74ed-fea9-79d8bdd2f4ee	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5665-74ed-0a90-87fd88f93fe4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5665-74ed-ff5a-9e65e85fb4a3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5665-74ed-3cca-8c6cda8dc3cd	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5665-74ed-ad97-70532789252f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5665-74ed-ea7d-e793f9ee9b27	HT	HTI	332	Haiti 	Haiti	\N
00040000-5665-74ed-2b9e-264b5f0b86f5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5665-74ed-4a0a-1c9f0e9d95a8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5665-74ed-6022-cf6075a543e2	HN	HND	340	Honduras 	Honduras	\N
00040000-5665-74ed-2cc0-158e006e5703	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5665-74ed-518a-963c1a5dc562	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5665-74ed-fffe-00716df4d29a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5665-74ed-6eb4-7dd877756f55	IN	IND	356	India 	Indija	\N
00040000-5665-74ed-2450-d9f232067122	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5665-74ed-2239-1d69ee7f1874	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5665-74ed-a97a-38e0a3190027	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5665-74ed-0750-58ae85654e04	IE	IRL	372	Ireland 	Irska	\N
00040000-5665-74ed-b9fe-dc28977e656c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5665-74ed-cb93-d81d265e9b87	IL	ISR	376	Israel 	Izrael	\N
00040000-5665-74ed-769f-1c939301a3a6	IT	ITA	380	Italy 	Italija	\N
00040000-5665-74ed-a529-2360c8995edc	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5665-74ed-ea69-e79e7946e8e7	JP	JPN	392	Japan 	Japonska	\N
00040000-5665-74ed-b5f5-e87d48565d9a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5665-74ed-b2ef-b7fdded19ce8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5665-74ed-c1ea-7d362c36a844	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5665-74ed-ad84-4b7afaef5cc8	KE	KEN	404	Kenya 	Kenija	\N
00040000-5665-74ed-20ce-b013840453b2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5665-74ed-5137-e734fb6f12da	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5665-74ed-67a2-f6f084002e9c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5665-74ed-639d-06f21b6edccf	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5665-74ed-4ab2-9f01255fc3e9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5665-74ed-927b-60e0ffadc5a1	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5665-74ed-5b89-b1e346a555e5	LV	LVA	428	Latvia 	Latvija	\N
00040000-5665-74ed-6da5-929207522088	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5665-74ed-67f6-09ed7aa7b69e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5665-74ed-18b4-8cd5bb13dc9d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5665-74ed-a2c5-f3a5b6499b7c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5665-74ed-a0ad-f1ff60c46e7a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5665-74ed-216f-bfb51e58bdab	LT	LTU	440	Lithuania 	Litva	\N
00040000-5665-74ed-edeb-a820a5f1ba1e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5665-74ed-b14a-698561e070f1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5665-74ed-36bf-9cd66f1f2f14	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5665-74ed-45a3-bd8ff6568ce1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5665-74ed-d27d-b3ffa2f7bd7c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5665-74ed-c356-41b6b5807690	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5665-74ed-0c50-5750638a80e7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5665-74ed-7310-5c72a3987731	ML	MLI	466	Mali 	Mali	\N
00040000-5665-74ed-7937-be7834016afa	MT	MLT	470	Malta 	Malta	\N
00040000-5665-74ed-0238-4fa3e3bafbbe	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5665-74ed-2440-c6c529fc0eda	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5665-74ed-fd47-a28df41c1fb0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5665-74ed-4b8a-170aedff966a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5665-74ed-807a-cee22355e8ec	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5665-74ed-679d-dc0ce523e209	MX	MEX	484	Mexico 	Mehika	\N
00040000-5665-74ed-e6be-a7ff203bda41	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5665-74ed-1201-1f0fd39f4d20	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5665-74ed-430c-0e259ed0ff8c	MC	MCO	492	Monaco 	Monako	\N
00040000-5665-74ed-3342-1256574fdc2f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5665-74ed-20e1-36f95aaebe89	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5665-74ed-706f-1143728a04e6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5665-74ed-6b83-7d7a57f96c13	MA	MAR	504	Morocco 	Maroko	\N
00040000-5665-74ed-e084-2ee647d74610	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5665-74ed-7d4f-1ccf43958ab8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5665-74ed-50bc-227fc72d4102	NA	NAM	516	Namibia 	Namibija	\N
00040000-5665-74ed-104a-2fbc563825bd	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5665-74ed-f0e3-7a4966f0fb6a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5665-74ed-3ddd-133b48890a98	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5665-74ed-e649-c9b438648038	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5665-74ed-d6c6-fc8733635780	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5665-74ed-fdcc-7b5ad25215d6	NE	NER	562	Niger 	Niger 	\N
00040000-5665-74ed-198f-9d40713fc4f0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5665-74ed-7da5-2d3fa56852b2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5665-74ed-cff2-f4b435bd5d20	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5665-74ed-6e10-22a4a6d0b718	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5665-74ed-ef70-7b62bf58f85e	NO	NOR	578	Norway 	Norveška	\N
00040000-5665-74ed-8b45-b6adc893b18b	OM	OMN	512	Oman 	Oman	\N
00040000-5665-74ed-8efa-5e59c9dc44ae	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5665-74ed-6c2b-41d0e1bc509f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5665-74ed-0353-ff40769229ee	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5665-74ed-468c-43ea894fe584	PA	PAN	591	Panama 	Panama	\N
00040000-5665-74ed-2047-59722764c0b2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5665-74ed-a176-8216759dada3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5665-74ed-7300-e6fbc70b0664	PE	PER	604	Peru 	Peru	\N
00040000-5665-74ed-8119-136c4ec619e4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5665-74ed-7587-0f135b0da5ca	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5665-74ed-fdf1-5bda47bc0ff5	PL	POL	616	Poland 	Poljska	\N
00040000-5665-74ed-8f67-1b6d27265950	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5665-74ed-bf99-b38e74d6df1e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5665-74ed-136e-ad78bc0bac13	QA	QAT	634	Qatar 	Katar	\N
00040000-5665-74ed-cbd6-9dfc2bf927c5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5665-74ed-0963-c392e809e474	RO	ROU	642	Romania 	Romunija	\N
00040000-5665-74ed-626d-4100ea45c77e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5665-74ed-b4ec-0a8a0529ee6a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5665-74ed-317c-e2291c069549	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5665-74ed-0d2d-5041ad19728b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5665-74ed-25bc-909e3180a789	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5665-74ed-81ee-39685bc92153	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5665-74ed-90a1-1bdd55438db4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5665-74ed-cd5d-60ab0db4edf2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5665-74ed-6b25-0829a9b874aa	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5665-74ed-bc67-7cb6faff65f3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5665-74ed-353c-d872fa324dae	SM	SMR	674	San Marino 	San Marino	\N
00040000-5665-74ed-2136-a18b37160274	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5665-74ed-07be-d2c69f2e9603	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5665-74ed-8aad-e4409812027c	SN	SEN	686	Senegal 	Senegal	\N
00040000-5665-74ed-0e95-525992cebabc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5665-74ed-6f5c-b4487370d9bf	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5665-74ed-da9b-bb399e3c1d41	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5665-74ed-2b47-8128bc3fff04	SG	SGP	702	Singapore 	Singapur	\N
00040000-5665-74ed-b33a-94645b227e7a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5665-74ed-431a-2c85cf926f45	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5665-74ed-c54f-40e52b1afbb8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5665-74ed-b6a2-7cea2e74d633	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5665-74ed-729c-69ee0000b793	SO	SOM	706	Somalia 	Somalija	\N
00040000-5665-74ed-5e1b-32edd1724359	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5665-74ed-6283-0376fa3b36b0	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5665-74ed-dbbe-cdeff6afa03e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5665-74ed-2556-bb19a95e0d26	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5665-74ed-8448-5716dc813db9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5665-74ed-fedb-3e4ce817ca5d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5665-74ed-5c4d-f135ee723b82	SR	SUR	740	Suriname 	Surinam	\N
00040000-5665-74ed-e796-ecd658ce82d4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5665-74ed-83c1-1250667acd51	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5665-74ed-0a18-39fb1b14bfe0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5665-74ed-05be-2d531904838b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5665-74ed-bcce-b7889bf2b277	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5665-74ed-3430-f1f4c68da5ca	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5665-74ed-8e65-391a1bc5d50b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5665-74ed-5ca9-0acc4c32b6f9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5665-74ed-a644-89593ea25d32	TH	THA	764	Thailand 	Tajska	\N
00040000-5665-74ed-292e-beb1470616d8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5665-74ed-0506-bdf2ae517972	TG	TGO	768	Togo 	Togo	\N
00040000-5665-74ed-3100-20b1e3a89761	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5665-74ed-99fd-2ed39b3efd33	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5665-74ed-c844-ce0328c55925	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5665-74ed-ce62-47eea4d95315	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5665-74ed-9849-aaea787f6ae2	TR	TUR	792	Turkey 	Turčija	\N
00040000-5665-74ed-d7d0-4a5fcc64cfdb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5665-74ed-2c1a-aac562fe6810	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5665-74ed-1871-d37432925f94	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5665-74ed-dbcc-2a0e14d40722	UG	UGA	800	Uganda 	Uganda	\N
00040000-5665-74ed-e6ad-1b03f22c0938	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5665-74ed-6f27-04c165d318da	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5665-74ed-7352-8dad7975bdb7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5665-74ed-0ca9-d278adab47bd	US	USA	840	United States 	Združene države Amerike	\N
00040000-5665-74ed-f917-f65521f74341	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5665-74ed-8042-13bd30677871	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5665-74ed-5ed7-eaa2493fe92e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5665-74ed-c4f2-be0e839f656a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5665-74ed-1178-d140472cbac1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5665-74ed-f079-272692ed5b5d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5665-74ed-b275-0ea253d19519	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5665-74ed-5413-f8ad11bcedcf	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5665-74ed-9ad8-1b1cb5454413	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5665-74ed-f162-f2ab6921bae3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5665-74ed-69f8-48647fa4e025	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5665-74ed-0f99-57c7da81d76c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5665-74ed-309e-c63814122f04	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 30997600)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5665-74f0-e21f-a8ce5f6029e3	000e0000-5665-74ef-065b-9488aa0ec301	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5665-74ed-78bf-1edde5f5c501	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5665-74f0-5436-f4646ce7ee46	000e0000-5665-74ef-748f-b14148a8d5c1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5665-74ed-02ed-3d01850e0ba0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5665-74f0-6214-1816f33eb122	000e0000-5665-74ef-b8da-1f2891d3806a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5665-74ed-78bf-1edde5f5c501	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5665-74f0-03be-a3bef9c5f49d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5665-74f0-41cc-0f940a12c0be	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 30997401)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5665-74ef-cd0d-bb50bdaf7dd7	000e0000-5665-74ef-748f-b14148a8d5c1	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5665-74ed-95a2-f4b3a441e574
000d0000-5665-74ef-9d63-95ab219c24f0	000e0000-5665-74ef-748f-b14148a8d5c1	000c0000-5665-74f0-1512-fd57023100a9	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5665-74ed-95a2-f4b3a441e574
000d0000-5665-74ef-c5b8-6ea61cc0d0ef	000e0000-5665-74ef-748f-b14148a8d5c1	000c0000-5665-74f0-84b8-c788e395fb0d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5665-74ed-a757-7fc83369e076
000d0000-5665-74ef-7e78-5e609a04b1ae	000e0000-5665-74ef-748f-b14148a8d5c1	000c0000-5665-74f0-064a-3ccb080a7061	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5665-74ed-7a61-f47c1bf4ff67
000d0000-5665-74ef-ed3c-90fa1fb29e6f	000e0000-5665-74ef-748f-b14148a8d5c1	000c0000-5665-74f0-20a3-b63ebfaabd58	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5665-74ed-132c-e4b48c9456c5
000d0000-5665-74ef-ab1c-720c00f1b51b	000e0000-5665-74ef-748f-b14148a8d5c1	000c0000-5665-74f0-01ff-20edae3bc3e6	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5665-74ed-132c-e4b48c9456c5
000d0000-5665-74ef-8f43-0ad03cce505c	000e0000-5665-74ef-748f-b14148a8d5c1	000c0000-5665-74f0-0e23-30fe630d2330	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5665-74ed-95a2-f4b3a441e574
000d0000-5665-74ef-053a-6b8f4c4fe1ca	000e0000-5665-74ef-748f-b14148a8d5c1	000c0000-5665-74f0-1620-1fc39bd191bd	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5665-74ed-7c1a-400b1d106ae8
000d0000-5665-74ef-fe0d-4f8912444c96	000e0000-5665-74ef-748f-b14148a8d5c1	000c0000-5665-74f0-5300-d60ba2291384	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5665-74ed-dd81-496764656ceb
\.


--
-- TOC entry 3124 (class 0 OID 30997192)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 30997158)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 30997135)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5665-74ef-ba0d-51b605f59dee	00080000-5665-74ef-a396-8e507ffb2fac	00090000-5665-74ef-f157-5e36cda6a898	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 30997315)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 30997860)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5665-74ef-9f5f-323fce730a34	00010000-5665-74ee-a552-77295fd9571e	\N	Prva mapa	Root mapa	2015-12-07 13:00:47	2015-12-07 13:00:47	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 30997873)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 30997895)
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
-- TOC entry 3140 (class 0 OID 30997340)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 30997092)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5665-74ee-a7db-fe3e0c3e4bd0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5665-74ee-dca7-e445948e53ea	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5665-74ee-8db3-aa5198b9e78c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5665-74ee-12cb-2acc1a032334	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5665-74ee-a2c8-8fe96d9cff63	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5665-74ee-e178-80279f8a4d07	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5665-74ee-f8be-5ca62d975939	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5665-74ee-e9fb-50e1c2cfc37a	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5665-74ee-7ce1-d3e9431f3e5e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5665-74ee-1560-1d329442c678	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5665-74ee-f2a4-eb6530580d79	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5665-74ee-da5e-28aa1e43dbda	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5665-74ee-8420-42dfef5788ce	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5665-74ee-602e-fe263f9add19	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5665-74ef-b177-5cbe7982d9e6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5665-74ef-ee4d-6289c9788504	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5665-74ef-1174-e9d31358ceeb	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5665-74ef-8818-8cfc6da03460	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5665-74ef-db36-4660f740c824	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5665-74f1-5f50-6a013609abc3	application.tenant.maticnopodjetje	string	s:36:"00080000-5665-74f1-214a-75d58b783a69";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 30996992)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5665-74ef-529a-d62f58df20a3	00000000-5665-74ef-b177-5cbe7982d9e6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5665-74ef-816d-10fb0e3e3444	00000000-5665-74ef-b177-5cbe7982d9e6	00010000-5665-74ee-a552-77295fd9571e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5665-74ef-5685-57e82f9060b7	00000000-5665-74ef-ee4d-6289c9788504	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 30997059)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5665-74ef-037d-0d5aa17b256b	\N	00100000-5665-74ef-6e8d-4fa87682a533	00100000-5665-74ef-4eb2-27984fc13051	01	Gledališče Nimbis
00410000-5665-74ef-3f2f-7295e1c815e6	00410000-5665-74ef-037d-0d5aa17b256b	00100000-5665-74ef-6e8d-4fa87682a533	00100000-5665-74ef-4eb2-27984fc13051	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 30997003)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5665-74ef-aa2c-79d33cfaf6ad	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5665-74ef-3ec5-c7d0d13edf86	00010000-5665-74ef-d5b3-9481d503d286	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5665-74ef-a76c-188318ec6501	00010000-5665-74ef-132a-a207caae2ad8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5665-74ef-37ee-8016d8b8dd9c	00010000-5665-74ef-da29-d3b776d76066	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5665-74ef-26c7-d7352e1f2a73	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5665-74ef-427c-11ced3c5c35b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5665-74ef-f1a7-a6f0cc5963e4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5665-74ef-2fb1-080b1e56d92f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5665-74ef-f157-5e36cda6a898	00010000-5665-74ef-19a1-18688f95e4fb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5665-74ef-3106-b1a60512dee6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5665-74ef-0d40-483e90450e08	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5665-74ef-6961-0ba27869b2e2	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5665-74ef-1623-a67ed19ee44b	00010000-5665-74ef-27b6-82911a9045aa	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5665-74ef-6777-5d96c4351ab1	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-74ef-eaa9-5057d805cf24	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-74ef-f238-96e759a42299	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-74ef-5f38-665ad0d3d5b7	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5665-74ef-faee-7245416e30d0	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5665-74ef-f95e-2aff803c867b	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-74ef-6590-e55118199b97	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-74ef-caf0-02cff791c399	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 30996938)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5665-74ed-13c0-e48e19f096c1	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5665-74ed-7a58-66f138dedc52	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5665-74ed-7181-02969ae1f7b7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5665-74ed-37a7-8d068971ac4e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5665-74ed-9fac-bd587fa11430	Oseba-vse	Oseba - spreminjanje osebnih podatkov	t
00030000-5665-74ed-0c68-7e1b5e1a4ed5	Oseba-readVse	Oseba - branje tudi osebnih podatkov	t
00030000-5665-74ed-78bf-1ccecbafc248	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5665-74ed-26c0-d47604c1d67d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5665-74ed-6ca4-13f37c2cbc63	Abonma-read	Abonma - branje	t
00030000-5665-74ed-1632-bb1e4808c81c	Abonma-write	Abonma - spreminjanje	t
00030000-5665-74ed-694d-b09690935b7c	Alternacija-read	Alternacija - branje	t
00030000-5665-74ed-f78b-c0e3fd48045b	Alternacija-write	Alternacija - spreminjanje	t
00030000-5665-74ed-ae97-4baaa54b17f7	Arhivalija-read	Arhivalija - branje	t
00030000-5665-74ed-ed06-4c3182f5602f	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5665-74ed-3a05-ff165cf421fa	AuthStorage-read	AuthStorage - branje	t
00030000-5665-74ed-55b0-d3810c1add7c	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5665-74ed-037f-f6022eb5fcd8	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5665-74ed-7905-6992ac3024aa	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5665-74ed-253a-1f086567ad02	Besedilo-read	Besedilo - branje	t
00030000-5665-74ed-5333-ac0909469bef	Besedilo-write	Besedilo - spreminjanje	t
00030000-5665-74ed-2c61-b17e698a598d	Dogodek-read	Dogodek - branje	t
00030000-5665-74ed-c9d3-5e4adf609480	Dogodek-write	Dogodek - spreminjanje	t
00030000-5665-74ed-dbc2-ecb4405cdaa9	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5665-74ed-cfc3-ca365c9c6fa1	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5665-74ed-5342-aed692a29746	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5665-74ed-a0f7-cd4dfaac018d	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5665-74ed-a99d-2783e606ca8b	DogodekTrait-read	DogodekTrait - branje	t
00030000-5665-74ed-e9a2-6a2a62151659	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5665-74ed-45b6-eae30fffdcb1	DrugiVir-read	DrugiVir - branje	t
00030000-5665-74ed-a374-f83e5102c4fb	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5665-74ed-203b-33845363956f	Drzava-read	Drzava - branje	t
00030000-5665-74ed-a5ad-d163e302ba64	Drzava-write	Drzava - spreminjanje	t
00030000-5665-74ed-9e13-f0b01864f250	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5665-74ed-a2a6-599ce592b27c	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5665-74ed-b2fb-68ddfd0c9cdd	Funkcija-read	Funkcija - branje	t
00030000-5665-74ed-ab67-9e3c7d48baac	Funkcija-write	Funkcija - spreminjanje	t
00030000-5665-74ed-7b83-d66be9730e84	Gostovanje-read	Gostovanje - branje	t
00030000-5665-74ed-f092-72d10d0515d6	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5665-74ed-5c67-627cbd2b39c7	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5665-74ed-262d-0f0005f30077	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5665-74ed-1a2a-99f3054bad0f	Kupec-read	Kupec - branje	t
00030000-5665-74ed-c547-d34f6cf9346b	Kupec-write	Kupec - spreminjanje	t
00030000-5665-74ed-74cf-00103f4bfd0c	NacinPlacina-read	NacinPlacina - branje	t
00030000-5665-74ed-356e-1e8bd3bae598	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5665-74ed-082d-9da57863c8a0	Option-read	Option - branje	t
00030000-5665-74ed-61bb-cd95a06e50f6	Option-write	Option - spreminjanje	t
00030000-5665-74ed-9f20-09f60759f603	OptionValue-read	OptionValue - branje	t
00030000-5665-74ed-4f8b-5c4c24aaea3a	OptionValue-write	OptionValue - spreminjanje	t
00030000-5665-74ed-f10a-b7e6ffae920a	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5665-74ed-23e8-b6541c02acbb	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5665-74ed-f422-8dbf62330765	Oseba-read	Oseba - branje	t
00030000-5665-74ed-e53f-1f4caf47d555	Oseba-write	Oseba - spreminjanje	t
00030000-5665-74ed-830e-27d5432c35ea	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5665-74ed-0b12-82e1b70ec5f8	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5665-74ed-6cd2-a6b9264b7ac2	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5665-74ed-c96a-acb7d646488d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5665-74ed-ac03-6b988343b410	Pogodba-read	Pogodba - branje	t
00030000-5665-74ed-b78d-0c17b543d1cb	Pogodba-write	Pogodba - spreminjanje	t
00030000-5665-74ed-09e9-4513061d73dc	Popa-read	Popa - branje	t
00030000-5665-74ed-b40e-6df05e8a5b47	Popa-write	Popa - spreminjanje	t
00030000-5665-74ed-bf70-83a92658ed57	Posta-read	Posta - branje	t
00030000-5665-74ed-9f34-c900b3900db2	Posta-write	Posta - spreminjanje	t
00030000-5665-74ed-882d-8dbcf8ab90c5	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5665-74ed-16e5-06e8ef01fc4e	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5665-74ed-9e85-06d5485a42fc	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5665-74ed-c875-dc938337da6c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5665-74ed-7d48-ad6b74eab183	PostniNaslov-read	PostniNaslov - branje	t
00030000-5665-74ed-15bf-9bb2c0cc953a	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5665-74ed-0b57-225f4406450e	Praznik-read	Praznik - branje	t
00030000-5665-74ed-7e95-322c4980430e	Praznik-write	Praznik - spreminjanje	t
00030000-5665-74ed-5ed6-86513d365a46	Predstava-read	Predstava - branje	t
00030000-5665-74ed-99dd-a5722955e741	Predstava-write	Predstava - spreminjanje	t
00030000-5665-74ed-6516-cf28bf6ebddd	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5665-74ed-dfba-115f5e64b95f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5665-74ed-ab66-d187ff830998	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5665-74ed-bf58-329466e7aa08	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5665-74ed-2339-322f6ebb0760	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5665-74ed-20bd-89a411258352	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5665-74ed-e770-552ff0a2463e	ProgramDela-read	ProgramDela - branje	t
00030000-5665-74ed-9fc5-66d54f7b119a	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5665-74ed-0ff0-a9a6ab062dc7	ProgramFestival-read	ProgramFestival - branje	t
00030000-5665-74ed-848a-86412e3fa011	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5665-74ed-05f5-cea3837a2290	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5665-74ed-38af-18e8e433cf20	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5665-74ed-5898-ddeaba9c835e	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5665-74ed-6d8d-4d31b71aa6b5	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5665-74ed-098e-1299d67c4b38	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5665-74ed-314b-607d86868a92	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5665-74ed-d49e-8c30f4daee85	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5665-74ed-c6ff-e8d73d3a9461	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5665-74ed-034a-f339566d20db	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5665-74ed-a0ac-94f498235b3a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5665-74ed-3732-a9f0b375c2ee	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5665-74ed-19d1-e54a5b15d77b	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5665-74ed-47af-79d6d62c9e19	ProgramRazno-read	ProgramRazno - branje	t
00030000-5665-74ed-cbd0-64d79bfe0c31	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5665-74ed-32c4-af135535f769	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5665-74ed-b094-a538614721ee	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5665-74ed-592a-ad5805b5b69c	Prostor-read	Prostor - branje	t
00030000-5665-74ed-7522-0583dc785bf8	Prostor-write	Prostor - spreminjanje	t
00030000-5665-74ed-5ba1-01a0d653d679	Racun-read	Racun - branje	t
00030000-5665-74ed-5710-fe7600ec7bd6	Racun-write	Racun - spreminjanje	t
00030000-5665-74ed-88b7-b89617370b5c	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5665-74ed-ed51-b359d13ef295	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5665-74ed-c9b7-c183ab4dc267	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5665-74ed-5079-7ce591dbeebe	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5665-74ed-42c5-235c2e0f962b	Rekvizit-read	Rekvizit - branje	t
00030000-5665-74ed-1f7f-9b0a62b00365	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5665-74ed-c933-8aa6754bccda	Revizija-read	Revizija - branje	t
00030000-5665-74ed-8670-93278da121f2	Revizija-write	Revizija - spreminjanje	t
00030000-5665-74ed-a1cc-8e3b9390e958	Rezervacija-read	Rezervacija - branje	t
00030000-5665-74ed-0361-b46e98ec5146	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5665-74ed-e8ae-a5621213a18e	SedezniRed-read	SedezniRed - branje	t
00030000-5665-74ed-a2c1-42ac06554692	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5665-74ed-e610-69576b37f778	Sedez-read	Sedez - branje	t
00030000-5665-74ed-1bad-604fc0ee39e7	Sedez-write	Sedez - spreminjanje	t
00030000-5665-74ed-3729-9dd84cedcf60	Sezona-read	Sezona - branje	t
00030000-5665-74ed-ff0b-2628a2e5caa9	Sezona-write	Sezona - spreminjanje	t
00030000-5665-74ed-6460-6a2b58885bd0	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5665-74ed-b74d-fb5da9394e21	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5665-74ed-49a1-575bc9233211	Telefonska-read	Telefonska - branje	t
00030000-5665-74ed-6164-0d03b1034f58	Telefonska-write	Telefonska - spreminjanje	t
00030000-5665-74ed-9984-96e76727cd30	TerminStoritve-read	TerminStoritve - branje	t
00030000-5665-74ed-2a9e-0ffb024d4a96	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5665-74ed-38e0-759934540ae1	TipFunkcije-read	TipFunkcije - branje	t
00030000-5665-74ed-f1b1-65daabc9f8a9	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5665-74ed-c723-f15ef7758572	TipPopa-read	TipPopa - branje	t
00030000-5665-74ed-cd8c-1a796514f716	TipPopa-write	TipPopa - spreminjanje	t
00030000-5665-74ed-c626-848f222f5252	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5665-74ed-0866-f41b59b0e68d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5665-74ed-51d5-256da0842c7b	TipVaje-read	TipVaje - branje	t
00030000-5665-74ed-f3ad-efd685883752	TipVaje-write	TipVaje - spreminjanje	t
00030000-5665-74ed-4314-12d41fe15dba	Trr-read	Trr - branje	t
00030000-5665-74ed-2dbe-a9a6191b22a4	Trr-write	Trr - spreminjanje	t
00030000-5665-74ed-7b0f-6dc0cf33c88f	Uprizoritev-read	Uprizoritev - branje	t
00030000-5665-74ed-d972-ca12f850de2a	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5665-74ed-79dd-071263f61a29	Vaja-read	Vaja - branje	t
00030000-5665-74ed-0f4a-a69333ff84d5	Vaja-write	Vaja - spreminjanje	t
00030000-5665-74ed-5e4e-fb4fef3b4d99	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5665-74ed-a3e0-aa803441e43b	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5665-74ed-0104-8f9cd92a00d5	VrstaStroska-read	VrstaStroska - branje	t
00030000-5665-74ed-053b-21907d94f7f2	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5665-74ed-2f8e-1a76bea8f5f7	Zaposlitev-read	Zaposlitev - branje	t
00030000-5665-74ed-b71b-6df70ace958f	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5665-74ed-0b13-9aa6a3b16adb	Zasedenost-read	Zasedenost - branje	t
00030000-5665-74ed-33f7-1f8c882130b4	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5665-74ed-0d57-c0e6a23a7419	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5665-74ed-bca2-3cca87ff6abb	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5665-74ed-6353-0fda1b7eca3f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5665-74ed-8ecb-48919ef6d1cf	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5665-74ed-f1a2-0050373d1413	Job-read	Branje opravil - samo zase - branje	t
00030000-5665-74ed-6eb3-3e8af22ce8de	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5665-74ed-25a7-caa094485d94	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5665-74ed-2d7b-39bacf47a787	Report-read	Report - branje	t
00030000-5665-74ed-d454-3504ffd14b92	Report-write	Report - spreminjanje	t
00030000-5665-74ed-41f1-9e2ea987d655	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5665-74ed-0cdb-4bacf117b53f	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5665-74ed-68cc-0f9d68f64f70	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5665-74ed-7d82-db6af0b78445	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5665-74ed-60fe-67c9650c1e9b	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5665-74ed-2107-37112de3d3cf	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5665-74ed-7abc-af6e32493a59	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5665-74ed-a4fe-31c9564a8c1f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5665-74ed-7b25-141fe86541ea	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5665-74ed-a04a-58a6f348a507	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5665-74ed-69b4-1b3227de76d2	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5665-74ed-b9e9-7bb864f11053	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5665-74ed-3799-7927b8759079	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5665-74ed-7fb4-50973e4e13bd	Datoteka-write	Datoteka - spreminjanje	t
00030000-5665-74ed-768e-819245988bbf	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 30996957)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5665-74ed-2c30-b66e77f74692	00030000-5665-74ed-7a58-66f138dedc52
00020000-5665-74ed-2c30-b66e77f74692	00030000-5665-74ed-13c0-e48e19f096c1
00020000-5665-74ed-e3b3-7403ee840529	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-7905-6992ac3024aa
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-5333-ac0909469bef
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-7fb4-50973e4e13bd
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-a04a-58a6f348a507
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-037f-f6022eb5fcd8
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-253a-1f086567ad02
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-bb0c-a518722c99b6	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-8d4e-75b8ef02122b	00030000-5665-74ed-037f-f6022eb5fcd8
00020000-5665-74ed-8d4e-75b8ef02122b	00030000-5665-74ed-253a-1f086567ad02
00020000-5665-74ed-8d4e-75b8ef02122b	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-8d4e-75b8ef02122b	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-8d4e-75b8ef02122b	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-f46f-63f571b795f4	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-f46f-63f571b795f4	00030000-5665-74ed-2f8e-1a76bea8f5f7
00020000-5665-74ed-f46f-63f571b795f4	00030000-5665-74ed-b71b-6df70ace958f
00020000-5665-74ed-f46f-63f571b795f4	00030000-5665-74ed-f10a-b7e6ffae920a
00020000-5665-74ed-53ad-90d548f61b5c	00030000-5665-74ed-2f8e-1a76bea8f5f7
00020000-5665-74ed-53ad-90d548f61b5c	00030000-5665-74ed-f10a-b7e6ffae920a
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-e53f-1f4caf47d555
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-7d48-ad6b74eab183
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-15bf-9bb2c0cc953a
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-49a1-575bc9233211
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-6164-0d03b1034f58
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-7fb4-50973e4e13bd
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-a04a-58a6f348a507
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-f16a-c9d64bda85b4	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ed-f5d5-eb079d55fc27	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-f5d5-eb079d55fc27	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-f5d5-eb079d55fc27	00030000-5665-74ed-7d48-ad6b74eab183
00020000-5665-74ed-f5d5-eb079d55fc27	00030000-5665-74ed-49a1-575bc9233211
00020000-5665-74ed-f5d5-eb079d55fc27	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-f5d5-eb079d55fc27	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-f5d5-eb079d55fc27	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-85b5-59e555db1a50	00030000-5665-74ed-e53f-1f4caf47d555
00020000-5665-74ed-85b5-59e555db1a50	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-85b5-59e555db1a50	00030000-5665-74ed-0c68-7e1b5e1a4ed5
00020000-5665-74ed-85b5-59e555db1a50	00030000-5665-74ed-9fac-bd587fa11430
00020000-5665-74ed-85b5-59e555db1a50	00030000-5665-74ed-4314-12d41fe15dba
00020000-5665-74ed-85b5-59e555db1a50	00030000-5665-74ed-2dbe-a9a6191b22a4
00020000-5665-74ed-85b5-59e555db1a50	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-bca1-ffd7f11b095c	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-bca1-ffd7f11b095c	00030000-5665-74ed-0c68-7e1b5e1a4ed5
00020000-5665-74ed-bca1-ffd7f11b095c	00030000-5665-74ed-4314-12d41fe15dba
00020000-5665-74ed-bca1-ffd7f11b095c	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-49a1-575bc9233211
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-7d48-ad6b74eab183
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-4314-12d41fe15dba
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-5c67-627cbd2b39c7
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-6164-0d03b1034f58
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-15bf-9bb2c0cc953a
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-2dbe-a9a6191b22a4
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-b40e-6df05e8a5b47
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-7fb4-50973e4e13bd
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-a04a-58a6f348a507
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-262d-0f0005f30077
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-20bd-89a411258352
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-7c8f-41c939d9a0cc	00030000-5665-74ed-c723-f15ef7758572
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-49a1-575bc9233211
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-7d48-ad6b74eab183
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-4314-12d41fe15dba
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-5c67-627cbd2b39c7
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-59c6-23f8a82a0046	00030000-5665-74ed-c723-f15ef7758572
00020000-5665-74ed-b886-313b2ff9b9dd	00030000-5665-74ed-c723-f15ef7758572
00020000-5665-74ed-b886-313b2ff9b9dd	00030000-5665-74ed-cd8c-1a796514f716
00020000-5665-74ed-a0b5-6ec60046f4e8	00030000-5665-74ed-c723-f15ef7758572
00020000-5665-74ed-ab0e-58fa61a9882f	00030000-5665-74ed-bf70-83a92658ed57
00020000-5665-74ed-ab0e-58fa61a9882f	00030000-5665-74ed-9f34-c900b3900db2
00020000-5665-74ed-8edc-42299f8ef63d	00030000-5665-74ed-bf70-83a92658ed57
00020000-5665-74ed-2e20-bf89dcba3364	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-2e20-bf89dcba3364	00030000-5665-74ed-a5ad-d163e302ba64
00020000-5665-74ed-f106-8844eb9d52ba	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-cc32-c598ab9461ea	00030000-5665-74ed-6353-0fda1b7eca3f
00020000-5665-74ed-cc32-c598ab9461ea	00030000-5665-74ed-8ecb-48919ef6d1cf
00020000-5665-74ed-f461-c645a3b482ff	00030000-5665-74ed-6353-0fda1b7eca3f
00020000-5665-74ed-79b4-709e3510543b	00030000-5665-74ed-0d57-c0e6a23a7419
00020000-5665-74ed-79b4-709e3510543b	00030000-5665-74ed-bca2-3cca87ff6abb
00020000-5665-74ed-7d96-889b790990f1	00030000-5665-74ed-0d57-c0e6a23a7419
00020000-5665-74ed-7004-7c4b53168a85	00030000-5665-74ed-6ca4-13f37c2cbc63
00020000-5665-74ed-7004-7c4b53168a85	00030000-5665-74ed-1632-bb1e4808c81c
00020000-5665-74ed-fbbd-31d370d56db8	00030000-5665-74ed-6ca4-13f37c2cbc63
00020000-5665-74ed-bd76-7bbb864518b6	00030000-5665-74ed-592a-ad5805b5b69c
00020000-5665-74ed-bd76-7bbb864518b6	00030000-5665-74ed-7522-0583dc785bf8
00020000-5665-74ed-bd76-7bbb864518b6	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ed-bd76-7bbb864518b6	00030000-5665-74ed-7d48-ad6b74eab183
00020000-5665-74ed-bd76-7bbb864518b6	00030000-5665-74ed-15bf-9bb2c0cc953a
00020000-5665-74ed-bd76-7bbb864518b6	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-73ad-d2304ad933a1	00030000-5665-74ed-592a-ad5805b5b69c
00020000-5665-74ed-73ad-d2304ad933a1	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ed-73ad-d2304ad933a1	00030000-5665-74ed-7d48-ad6b74eab183
00020000-5665-74ed-6b95-d1a3ce09cc55	00030000-5665-74ed-0104-8f9cd92a00d5
00020000-5665-74ed-6b95-d1a3ce09cc55	00030000-5665-74ed-053b-21907d94f7f2
00020000-5665-74ed-17cf-0dcfb09a92ba	00030000-5665-74ed-0104-8f9cd92a00d5
00020000-5665-74ed-87a6-f4ceae3797a1	00030000-5665-74ed-23e8-b6541c02acbb
00020000-5665-74ed-87a6-f4ceae3797a1	00030000-5665-74ed-f10a-b7e6ffae920a
00020000-5665-74ed-87a6-f4ceae3797a1	00030000-5665-74ed-2f8e-1a76bea8f5f7
00020000-5665-74ed-87a6-f4ceae3797a1	00030000-5665-74ed-7fb4-50973e4e13bd
00020000-5665-74ed-87a6-f4ceae3797a1	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-87a6-f4ceae3797a1	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ed-87a6-f4ceae3797a1	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-87a6-f4ceae3797a1	00030000-5665-74ed-a04a-58a6f348a507
00020000-5665-74ed-87a6-f4ceae3797a1	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-91dc-31f46909f976	00030000-5665-74ed-f10a-b7e6ffae920a
00020000-5665-74ed-91dc-31f46909f976	00030000-5665-74ed-2f8e-1a76bea8f5f7
00020000-5665-74ed-91dc-31f46909f976	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-91dc-31f46909f976	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-91dc-31f46909f976	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-398f-2038f918d8ec	00030000-5665-74ed-51d5-256da0842c7b
00020000-5665-74ed-398f-2038f918d8ec	00030000-5665-74ed-f3ad-efd685883752
00020000-5665-74ed-55b7-343a8cdf02d5	00030000-5665-74ed-51d5-256da0842c7b
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-78bf-1ccecbafc248
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-26c0-d47604c1d67d
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-e770-552ff0a2463e
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-9fc5-66d54f7b119a
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-0ff0-a9a6ab062dc7
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-848a-86412e3fa011
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-05f5-cea3837a2290
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-38af-18e8e433cf20
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-5898-ddeaba9c835e
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-6d8d-4d31b71aa6b5
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-098e-1299d67c4b38
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-314b-607d86868a92
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-d49e-8c30f4daee85
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-c6ff-e8d73d3a9461
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-034a-f339566d20db
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-a0ac-94f498235b3a
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-3732-a9f0b375c2ee
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-19d1-e54a5b15d77b
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-47af-79d6d62c9e19
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-cbd0-64d79bfe0c31
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-32c4-af135535f769
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-b094-a538614721ee
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-bf58-329466e7aa08
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-a374-f83e5102c4fb
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-16e5-06e8ef01fc4e
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-6eb3-3e8af22ce8de
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-45b6-eae30fffdcb1
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-ab66-d187ff830998
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-882d-8dbcf8ab90c5
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-0104-8f9cd92a00d5
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-6460-6a2b58885bd0
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-b2fb-68ddfd0c9cdd
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-694d-b09690935b7c
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-38e0-759934540ae1
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-ac03-6b988343b410
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-7fb4-50973e4e13bd
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-a04a-58a6f348a507
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-f1a2-0050373d1413
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-38c4-db0e7ef6820f	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-e770-552ff0a2463e
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-0ff0-a9a6ab062dc7
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-05f5-cea3837a2290
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-5898-ddeaba9c835e
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-098e-1299d67c4b38
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-d49e-8c30f4daee85
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-034a-f339566d20db
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-3732-a9f0b375c2ee
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-47af-79d6d62c9e19
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-32c4-af135535f769
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-ab66-d187ff830998
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-45b6-eae30fffdcb1
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-882d-8dbcf8ab90c5
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-f1a2-0050373d1413
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-3f6d-bc9c2894fd5b	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-d972-ca12f850de2a
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-694d-b09690935b7c
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-f78b-c0e3fd48045b
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-253a-1f086567ad02
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-b2fb-68ddfd0c9cdd
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-ab67-9e3c7d48baac
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-38e0-759934540ae1
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-7fb4-50973e4e13bd
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-6816-80a414169783	00030000-5665-74ed-a04a-58a6f348a507
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-694d-b09690935b7c
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-253a-1f086567ad02
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-b2fb-68ddfd0c9cdd
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-38e0-759934540ae1
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ed-abae-0baf1da91d55	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-694d-b09690935b7c
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-f78b-c0e3fd48045b
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-b2fb-68ddfd0c9cdd
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-ac03-6b988343b410
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-b78d-0c17b543d1cb
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-6460-6a2b58885bd0
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-b74d-fb5da9394e21
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-38e0-759934540ae1
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-4314-12d41fe15dba
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ed-c825-1c6ed8fa2c6c	00030000-5665-74ed-2f8e-1a76bea8f5f7
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-694d-b09690935b7c
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-b2fb-68ddfd0c9cdd
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-ac03-6b988343b410
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-6460-6a2b58885bd0
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-38e0-759934540ae1
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-4314-12d41fe15dba
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ed-eb22-850afead2530	00030000-5665-74ed-2f8e-1a76bea8f5f7
00020000-5665-74ed-0c5e-e229beaaadcd	00030000-5665-74ed-6460-6a2b58885bd0
00020000-5665-74ed-0c5e-e229beaaadcd	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ed-0c5e-e229beaaadcd	00030000-5665-74ed-b2fb-68ddfd0c9cdd
00020000-5665-74ed-0c5e-e229beaaadcd	00030000-5665-74ed-ac03-6b988343b410
00020000-5665-74ed-0c5e-e229beaaadcd	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ed-0c5e-e229beaaadcd	00030000-5665-74ed-38e0-759934540ae1
00020000-5665-74ed-0c5e-e229beaaadcd	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-517d-925a7ce21272	00030000-5665-74ed-6460-6a2b58885bd0
00020000-5665-74ed-517d-925a7ce21272	00030000-5665-74ed-b74d-fb5da9394e21
00020000-5665-74ed-517d-925a7ce21272	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ed-517d-925a7ce21272	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ed-c67e-432e8c18a555	00030000-5665-74ed-6460-6a2b58885bd0
00020000-5665-74ed-c67e-432e8c18a555	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-6ca4-13f37c2cbc63
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-694d-b09690935b7c
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-037f-f6022eb5fcd8
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-7905-6992ac3024aa
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-253a-1f086567ad02
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-5333-ac0909469bef
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-7fb4-50973e4e13bd
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-b2fb-68ddfd0c9cdd
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-5c67-627cbd2b39c7
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-f10a-b7e6ffae920a
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-e53f-1f4caf47d555
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-bf70-83a92658ed57
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-7d48-ad6b74eab183
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-15bf-9bb2c0cc953a
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-592a-ad5805b5b69c
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-49a1-575bc9233211
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-6164-0d03b1034f58
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-38e0-759934540ae1
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-c723-f15ef7758572
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-51d5-256da0842c7b
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-4314-12d41fe15dba
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-0104-8f9cd92a00d5
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-a04a-58a6f348a507
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-2f8e-1a76bea8f5f7
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-0d57-c0e6a23a7419
00020000-5665-74ed-d265-2ba874923d72	00030000-5665-74ed-6353-0fda1b7eca3f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-13c0-e48e19f096c1
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7a58-66f138dedc52
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-6ca4-13f37c2cbc63
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-1632-bb1e4808c81c
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-694d-b09690935b7c
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-f78b-c0e3fd48045b
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-ae97-4baaa54b17f7
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-ed06-4c3182f5602f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-3a05-ff165cf421fa
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-55b0-d3810c1add7c
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-037f-f6022eb5fcd8
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7905-6992ac3024aa
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-253a-1f086567ad02
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-5333-ac0909469bef
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7fb4-50973e4e13bd
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-2c61-b17e698a598d
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-37a7-8d068971ac4e
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-c9d3-5e4adf609480
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-dbc2-ecb4405cdaa9
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-cfc3-ca365c9c6fa1
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-5342-aed692a29746
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a0f7-cd4dfaac018d
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-45b6-eae30fffdcb1
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a374-f83e5102c4fb
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-203b-33845363956f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a5ad-d163e302ba64
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-9e13-f0b01864f250
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a2a6-599ce592b27c
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-b2fb-68ddfd0c9cdd
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-ab67-9e3c7d48baac
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7b83-d66be9730e84
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-f092-72d10d0515d6
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-25a7-caa094485d94
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-f1a2-0050373d1413
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-6eb3-3e8af22ce8de
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-5c67-627cbd2b39c7
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-262d-0f0005f30077
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-1a2a-99f3054bad0f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-c547-d34f6cf9346b
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0cdb-4bacf117b53f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-68cc-0f9d68f64f70
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7d82-db6af0b78445
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-60fe-67c9650c1e9b
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7abc-af6e32493a59
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-2107-37112de3d3cf
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-74cf-00103f4bfd0c
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-356e-1e8bd3bae598
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-082d-9da57863c8a0
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-61bb-cd95a06e50f6
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-9f20-09f60759f603
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-4f8b-5c4c24aaea3a
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-f10a-b7e6ffae920a
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-23e8-b6541c02acbb
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-9fac-bd587fa11430
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-e53f-1f4caf47d555
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-830e-27d5432c35ea
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0b12-82e1b70ec5f8
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-6cd2-a6b9264b7ac2
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-c96a-acb7d646488d
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-ac03-6b988343b410
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-b78d-0c17b543d1cb
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-b40e-6df05e8a5b47
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-bf70-83a92658ed57
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-9f34-c900b3900db2
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-882d-8dbcf8ab90c5
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-16e5-06e8ef01fc4e
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-9e85-06d5485a42fc
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-c875-dc938337da6c
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7d48-ad6b74eab183
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-15bf-9bb2c0cc953a
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0b57-225f4406450e
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7e95-322c4980430e
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-5ed6-86513d365a46
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-99dd-a5722955e741
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-6516-cf28bf6ebddd
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-dfba-115f5e64b95f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-ab66-d187ff830998
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-bf58-329466e7aa08
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-2339-322f6ebb0760
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-20bd-89a411258352
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-78bf-1ccecbafc248
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-e770-552ff0a2463e
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-26c0-d47604c1d67d
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-9fc5-66d54f7b119a
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0ff0-a9a6ab062dc7
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-848a-86412e3fa011
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-05f5-cea3837a2290
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-38af-18e8e433cf20
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-5898-ddeaba9c835e
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-6d8d-4d31b71aa6b5
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-098e-1299d67c4b38
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-314b-607d86868a92
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-d49e-8c30f4daee85
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-c6ff-e8d73d3a9461
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-034a-f339566d20db
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a0ac-94f498235b3a
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-3732-a9f0b375c2ee
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-19d1-e54a5b15d77b
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-47af-79d6d62c9e19
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-cbd0-64d79bfe0c31
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-32c4-af135535f769
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-b094-a538614721ee
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-592a-ad5805b5b69c
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7522-0583dc785bf8
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-5ba1-01a0d653d679
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-5710-fe7600ec7bd6
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-88b7-b89617370b5c
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-ed51-b359d13ef295
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-42c5-235c2e0f962b
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-1f7f-9b0a62b00365
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-c9b7-c183ab4dc267
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-5079-7ce591dbeebe
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-2d7b-39bacf47a787
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-d454-3504ffd14b92
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-c933-8aa6754bccda
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-8670-93278da121f2
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a1cc-8e3b9390e958
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0361-b46e98ec5146
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-e610-69576b37f778
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-1bad-604fc0ee39e7
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-e8ae-a5621213a18e
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a2c1-42ac06554692
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-3729-9dd84cedcf60
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-ff0b-2628a2e5caa9
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-41f1-9e2ea987d655
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-6460-6a2b58885bd0
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-b74d-fb5da9394e21
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-49a1-575bc9233211
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-6164-0d03b1034f58
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-9984-96e76727cd30
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7181-02969ae1f7b7
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-2a9e-0ffb024d4a96
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-38e0-759934540ae1
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-f1b1-65daabc9f8a9
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-c723-f15ef7758572
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-cd8c-1a796514f716
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-c626-848f222f5252
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0866-f41b59b0e68d
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-51d5-256da0842c7b
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-f3ad-efd685883752
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-4314-12d41fe15dba
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-2dbe-a9a6191b22a4
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-d972-ca12f850de2a
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-79dd-071263f61a29
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0f4a-a69333ff84d5
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-5e4e-fb4fef3b4d99
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a3e0-aa803441e43b
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0104-8f9cd92a00d5
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-053b-21907d94f7f2
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-3799-7927b8759079
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-b9e9-7bb864f11053
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-a04a-58a6f348a507
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-2f8e-1a76bea8f5f7
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-b71b-6df70ace958f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0b13-9aa6a3b16adb
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-33f7-1f8c882130b4
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-0d57-c0e6a23a7419
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-bca2-3cca87ff6abb
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-6353-0fda1b7eca3f
00020000-5665-74ef-b9c7-4b6be01bc9eb	00030000-5665-74ed-8ecb-48919ef6d1cf
00020000-5665-74ef-4df1-d8d946676680	00030000-5665-74ed-69b4-1b3227de76d2
00020000-5665-74ef-b01e-1337edca7f97	00030000-5665-74ed-a04a-58a6f348a507
00020000-5665-74ef-5987-3c80c8d58a72	00030000-5665-74ed-d972-ca12f850de2a
00020000-5665-74ef-28a0-7b4a18edb808	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ef-7bc4-a037eb399656	00030000-5665-74ed-68cc-0f9d68f64f70
00020000-5665-74ef-6d14-e702f9046109	00030000-5665-74ed-7d82-db6af0b78445
00020000-5665-74ef-fc2b-e24af1344e48	00030000-5665-74ed-60fe-67c9650c1e9b
00020000-5665-74ef-8ef1-0f9994e03a55	00030000-5665-74ed-0cdb-4bacf117b53f
00020000-5665-74ef-00c6-21a1a0cda02e	00030000-5665-74ed-7abc-af6e32493a59
00020000-5665-74ef-63e5-5cf057c4822a	00030000-5665-74ed-2107-37112de3d3cf
00020000-5665-74ef-9597-d09f4ed005e8	00030000-5665-74ed-7b25-141fe86541ea
00020000-5665-74ef-9ec0-8a993ec95e63	00030000-5665-74ed-a4fe-31c9564a8c1f
00020000-5665-74ef-7973-07d72d9f013f	00030000-5665-74ed-f422-8dbf62330765
00020000-5665-74ef-b829-62831590e128	00030000-5665-74ed-e53f-1f4caf47d555
00020000-5665-74ef-9da1-1cfdd434059c	00030000-5665-74ed-9fac-bd587fa11430
00020000-5665-74ef-920d-68da230f7931	00030000-5665-74ed-0c68-7e1b5e1a4ed5
00020000-5665-74ef-86b4-164cf223dc0a	00030000-5665-74ed-7fb4-50973e4e13bd
00020000-5665-74ef-8d58-7c8b4df2d33c	00030000-5665-74ed-768e-819245988bbf
00020000-5665-74ef-0edd-9290ece33df8	00030000-5665-74ed-09e9-4513061d73dc
00020000-5665-74ef-0edd-9290ece33df8	00030000-5665-74ed-b40e-6df05e8a5b47
00020000-5665-74ef-0edd-9290ece33df8	00030000-5665-74ed-7b0f-6dc0cf33c88f
00020000-5665-74ef-6101-602c8c226512	00030000-5665-74ed-4314-12d41fe15dba
00020000-5665-74ef-1c34-0e958b447926	00030000-5665-74ed-2dbe-a9a6191b22a4
00020000-5665-74ef-f536-cd664f8993d8	00030000-5665-74ed-41f1-9e2ea987d655
00020000-5665-74ef-9cd0-fceaa3d5e2db	00030000-5665-74ed-49a1-575bc9233211
00020000-5665-74ef-1ea8-b5eeeaa9aa28	00030000-5665-74ed-6164-0d03b1034f58
\.


--
-- TOC entry 3141 (class 0 OID 30997347)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 30997381)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 30997518)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5665-74ef-db6e-1f9275e125d7	00090000-5665-74ef-aa2c-79d33cfaf6ad	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5665-74ef-0d29-e43e8d8daebc	00090000-5665-74ef-427c-11ced3c5c35b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5665-74ef-1ca9-4cd111258169	00090000-5665-74ef-1623-a67ed19ee44b	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5665-74ef-0b99-d1f1afbac5f4	00090000-5665-74ef-3106-b1a60512dee6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 30997039)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5665-74ef-a396-8e507ffb2fac	\N	00040000-5665-74ed-c54f-40e52b1afbb8	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-74ef-075a-9355070e1682	\N	00040000-5665-74ed-c54f-40e52b1afbb8	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5665-74ef-1164-215e4a497be5	\N	00040000-5665-74ed-c54f-40e52b1afbb8	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-74ef-e7b9-aa9866beea29	\N	00040000-5665-74ed-c54f-40e52b1afbb8	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-74ef-4549-fa2307e8e206	\N	00040000-5665-74ed-c54f-40e52b1afbb8	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-74ef-3133-4627d65acf47	\N	00040000-5665-74ed-06d8-8de3ad5931b3	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-74ef-b6f9-7e7cfcd1564f	\N	00040000-5665-74ed-f33c-79a2bfffcb62	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-74ef-b991-f601f0a1ad6b	\N	00040000-5665-74ed-72fa-6d4b1c39902f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-74ef-7030-553910401617	\N	00040000-5665-74ed-093f-9e28aacbfc3a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-74f1-214a-75d58b783a69	\N	00040000-5665-74ed-c54f-40e52b1afbb8	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 30997084)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5665-74ec-438d-d36e9d3c76ef	8341	Adlešiči
00050000-5665-74ec-e01d-497d7796f997	5270	Ajdovščina
00050000-5665-74ec-ef27-5e5d8b891a6e	6280	Ankaran/Ancarano
00050000-5665-74ec-114d-7e3cc5d7fa39	9253	Apače
00050000-5665-74ec-96c6-1c64e1817c28	8253	Artiče
00050000-5665-74ec-0c73-5a4a72901967	4275	Begunje na Gorenjskem
00050000-5665-74ec-bef9-c4d095f56c6c	1382	Begunje pri Cerknici
00050000-5665-74ec-088c-6b64497fa437	9231	Beltinci
00050000-5665-74ec-f248-d5dd2d45a612	2234	Benedikt
00050000-5665-74ec-5944-5d5a400853b9	2345	Bistrica ob Dravi
00050000-5665-74ec-5f82-f9fe6d595ff1	3256	Bistrica ob Sotli
00050000-5665-74ec-f8ea-23a070cad393	8259	Bizeljsko
00050000-5665-74ec-3275-f5d2f134d540	1223	Blagovica
00050000-5665-74ec-b060-d7d5fffc366c	8283	Blanca
00050000-5665-74ec-9b45-dcb0d93fccee	4260	Bled
00050000-5665-74ec-9160-6ffe70a95563	4273	Blejska Dobrava
00050000-5665-74ec-e99f-3172ddeb3ec1	9265	Bodonci
00050000-5665-74ec-eade-295d6565e035	9222	Bogojina
00050000-5665-74ec-3674-6329a89e1ef6	4263	Bohinjska Bela
00050000-5665-74ec-c517-20c4b0167c3f	4264	Bohinjska Bistrica
00050000-5665-74ec-000a-21e6e75b2a4f	4265	Bohinjsko jezero
00050000-5665-74ec-07da-1bd86215764b	1353	Borovnica
00050000-5665-74ec-9875-65d5947b14b0	8294	Boštanj
00050000-5665-74ec-30e1-6ab5df3d9e72	5230	Bovec
00050000-5665-74ec-4943-e46bc0d0efa1	5295	Branik
00050000-5665-74ec-efbd-23a784834cfb	3314	Braslovče
00050000-5665-74ec-4fc3-810a7f61f832	5223	Breginj
00050000-5665-74ec-b143-08cf9003c723	8280	Brestanica
00050000-5665-74ec-15ab-b443c739d9e5	2354	Bresternica
00050000-5665-74ec-bcf6-f092250e064d	4243	Brezje
00050000-5665-74ec-7367-67d9691ef166	1351	Brezovica pri Ljubljani
00050000-5665-74ec-a76c-6a262f94723a	8250	Brežice
00050000-5665-74ec-6cff-94d8812c8d1c	4210	Brnik - Aerodrom
00050000-5665-74ec-10d6-fc585b03fab3	8321	Brusnice
00050000-5665-74ec-b9f6-76f071ce571d	3255	Buče
00050000-5665-74ec-3751-9578aa87484c	8276	Bučka 
00050000-5665-74ec-29ea-4f44bf4089b5	9261	Cankova
00050000-5665-74ec-9a55-fbb405ade4f7	3000	Celje 
00050000-5665-74ec-8073-8ee3eaa68bc0	3001	Celje - poštni predali
00050000-5665-74ec-f3bc-b17b8e2f7395	4207	Cerklje na Gorenjskem
00050000-5665-74ec-38e6-438d53200dcb	8263	Cerklje ob Krki
00050000-5665-74ec-295b-b26dbf138a97	1380	Cerknica
00050000-5665-74ec-a954-fc15e65b39d5	5282	Cerkno
00050000-5665-74ec-376e-baa8bdbff329	2236	Cerkvenjak
00050000-5665-74ec-69fb-0834c9316a2f	2215	Ceršak
00050000-5665-74ec-e3df-8bf1bb7951a3	2326	Cirkovce
00050000-5665-74ec-ed06-a29213a2caaf	2282	Cirkulane
00050000-5665-74ec-ca34-3dcaddc4c4ac	5273	Col
00050000-5665-74ec-9660-20c787d0ba41	8251	Čatež ob Savi
00050000-5665-74ec-5af5-0aa0ca582b8b	1413	Čemšenik
00050000-5665-74ec-c4ff-0717b4f2ad4a	5253	Čepovan
00050000-5665-74ec-fb92-402287f6b2a9	9232	Črenšovci
00050000-5665-74ec-5740-52e2c8093ab0	2393	Črna na Koroškem
00050000-5665-74ec-bb6f-fc894c12b91e	6275	Črni Kal
00050000-5665-74ec-bf02-32dd93ba86a7	5274	Črni Vrh nad Idrijo
00050000-5665-74ec-0631-993b30441de4	5262	Črniče
00050000-5665-74ec-74cc-283f97e585c7	8340	Črnomelj
00050000-5665-74ec-8b43-f879cb73a043	6271	Dekani
00050000-5665-74ec-f69f-37e68c8cc950	5210	Deskle
00050000-5665-74ec-e302-44dc8c8ad4ed	2253	Destrnik
00050000-5665-74ec-96a1-ea5577b50e4e	6215	Divača
00050000-5665-74ec-240e-eba33c6ad62e	1233	Dob
00050000-5665-74ec-95d5-b2ddc4bbdbfa	3224	Dobje pri Planini
00050000-5665-74ec-c2ba-88cce5e1c53e	8257	Dobova
00050000-5665-74ec-f1fd-a7a4af837b59	1423	Dobovec
00050000-5665-74ec-25b9-843acd28ad5e	5263	Dobravlje
00050000-5665-74ec-6b66-5024d81a05a9	3204	Dobrna
00050000-5665-74ec-51ab-b5f8a9bb4957	8211	Dobrnič
00050000-5665-74ec-f94c-8ccffd2024e6	1356	Dobrova
00050000-5665-74ec-18b9-9c06891f0bd7	9223	Dobrovnik/Dobronak 
00050000-5665-74ec-8a42-b7898d5f84ee	5212	Dobrovo v Brdih
00050000-5665-74ec-d282-88bd9abcb190	1431	Dol pri Hrastniku
00050000-5665-74ec-df50-1fc30c5c97e9	1262	Dol pri Ljubljani
00050000-5665-74ec-d8d1-45ca1d209b6e	1273	Dole pri Litiji
00050000-5665-74ec-fadb-c8ba91b0642b	1331	Dolenja vas
00050000-5665-74ec-7db1-7b8791d9ec53	8350	Dolenjske Toplice
00050000-5665-74ec-12ea-efd1adb9816c	1230	Domžale
00050000-5665-74ec-f77f-3ee2ff94fb27	2252	Dornava
00050000-5665-74ec-d406-a2d012f1c3be	5294	Dornberk
00050000-5665-74ec-4b57-025a369e2acb	1319	Draga
00050000-5665-74ec-6207-0465ddd545ba	8343	Dragatuš
00050000-5665-74ec-307c-bf6f0bb5f731	3222	Dramlje
00050000-5665-74ec-a9e3-fc700dac4159	2370	Dravograd
00050000-5665-74ec-3b9a-d4169329a81f	4203	Duplje
00050000-5665-74ec-4c8a-6f803f7794fe	6221	Dutovlje
00050000-5665-74ec-26d1-a388db5e6f17	8361	Dvor
00050000-5665-74ec-da18-9d7d85d91e3f	2343	Fala
00050000-5665-74ec-ba24-3ea59362a29d	9208	Fokovci
00050000-5665-74ec-134f-8c13c48bc7c2	2313	Fram
00050000-5665-74ec-bf08-170d9693865c	3213	Frankolovo
00050000-5665-74ec-f86e-2dccc541a63b	1274	Gabrovka
00050000-5665-74ec-1d87-58acd4c002e6	8254	Globoko
00050000-5665-74ec-cd3a-51d9be0fe0f6	5275	Godovič
00050000-5665-74ec-8f40-394605513be4	4204	Golnik
00050000-5665-74ec-b5e8-32aeb266c90d	3303	Gomilsko
00050000-5665-74ec-f268-22de28b8ce18	4224	Gorenja vas
00050000-5665-74ec-fc66-e7e5d16fde4e	3263	Gorica pri Slivnici
00050000-5665-74ec-c468-056aef380056	2272	Gorišnica
00050000-5665-74ec-e42b-2768665e609f	9250	Gornja Radgona
00050000-5665-74ec-5c50-53d57519d97c	3342	Gornji Grad
00050000-5665-74ec-db92-d609298d3953	4282	Gozd Martuljek
00050000-5665-74ec-f7e6-51c20fd2a69f	6272	Gračišče
00050000-5665-74ec-561d-2f784fcc1896	9264	Grad
00050000-5665-74ec-e047-be34231a055f	8332	Gradac
00050000-5665-74ec-9c2f-a5325b534fe8	1384	Grahovo
00050000-5665-74ec-c45e-fd5bdb181173	5242	Grahovo ob Bači
00050000-5665-74ec-cc50-1748e4578efb	5251	Grgar
00050000-5665-74ec-4342-008bb2424889	3302	Griže
00050000-5665-74ec-b404-50a2e5166844	3231	Grobelno
00050000-5665-74ec-5816-ce3832a2f8aa	1290	Grosuplje
00050000-5665-74ec-a9cf-a48689f602d4	2288	Hajdina
00050000-5665-74ec-b39e-0c72851f8fad	8362	Hinje
00050000-5665-74ec-f864-45b28b0fc446	2311	Hoče
00050000-5665-74ec-5dc6-c8278eb42dfa	9205	Hodoš/Hodos
00050000-5665-74ec-e943-dfabdc605ed9	1354	Horjul
00050000-5665-74ec-da34-1491d718ae45	1372	Hotedršica
00050000-5665-74ec-1f9c-48f353b13cac	1430	Hrastnik
00050000-5665-74ec-61da-72c736557603	6225	Hruševje
00050000-5665-74ec-b72f-d95ca8419b04	4276	Hrušica
00050000-5665-74ec-86b0-02666feb8688	5280	Idrija
00050000-5665-74ec-4fd8-a0ee09752248	1292	Ig
00050000-5665-74ec-60a1-17abd72bb6ef	6250	Ilirska Bistrica
00050000-5665-74ec-49d8-36a002f0bea2	6251	Ilirska Bistrica-Trnovo
00050000-5665-74ec-741d-c33212eae650	1295	Ivančna Gorica
00050000-5665-74ec-3a08-d12ff4e1a278	2259	Ivanjkovci
00050000-5665-74ec-4510-03a1a23860b3	1411	Izlake
00050000-5665-74ec-f3c8-481f5097810d	6310	Izola/Isola
00050000-5665-74ec-bc83-2a23233001f1	2222	Jakobski Dol
00050000-5665-74ec-1be0-b40e86adfbaa	2221	Jarenina
00050000-5665-74ec-cb0c-15374f7bf1a4	6254	Jelšane
00050000-5665-74ec-52dc-5b855e23d4e9	4270	Jesenice
00050000-5665-74ec-4032-6246641bac07	8261	Jesenice na Dolenjskem
00050000-5665-74ec-c8a1-5bef7594ce59	3273	Jurklošter
00050000-5665-74ec-3fa7-e90eb9474d9a	2223	Jurovski Dol
00050000-5665-74ec-e08c-806111dff747	2256	Juršinci
00050000-5665-74ec-b82f-2a2405afccd0	5214	Kal nad Kanalom
00050000-5665-74ec-11a4-c74473bfdf8c	3233	Kalobje
00050000-5665-74ec-2929-a47fa4bdd07d	4246	Kamna Gorica
00050000-5665-74ec-2196-56f1cbd67acc	2351	Kamnica
00050000-5665-74ec-b4fa-9077d0b86cc6	1241	Kamnik
00050000-5665-74ec-d292-23a1f4140dae	5213	Kanal
00050000-5665-74ec-7a35-f98a6b20381e	8258	Kapele
00050000-5665-74ec-7a99-34587cc27004	2362	Kapla
00050000-5665-74ec-ab52-f5cc7daa7e48	2325	Kidričevo
00050000-5665-74ec-d02e-f74bfe7ccb88	1412	Kisovec
00050000-5665-74ec-8cc5-c30a6b2cb195	6253	Knežak
00050000-5665-74ec-baef-ddb02ee6b121	5222	Kobarid
00050000-5665-74ec-d889-343acee470e4	9227	Kobilje
00050000-5665-74ec-eb1d-caf9e3620c4f	1330	Kočevje
00050000-5665-74ec-d705-8977eabae152	1338	Kočevska Reka
00050000-5665-74ec-829a-e59520dda439	2276	Kog
00050000-5665-74ec-22ee-1486bbc44189	5211	Kojsko
00050000-5665-74ec-0b99-7a89b5044b54	6223	Komen
00050000-5665-74ec-07e6-0342ca355404	1218	Komenda
00050000-5665-74ec-334b-a0159a060499	6000	Koper/Capodistria 
00050000-5665-74ec-d758-115dba92dd11	6001	Koper/Capodistria - poštni predali
00050000-5665-74ec-e1ba-40aeabc1e1c9	8282	Koprivnica
00050000-5665-74ec-f497-817d10b302b6	5296	Kostanjevica na Krasu
00050000-5665-74ec-1750-ed60fa4b4a44	8311	Kostanjevica na Krki
00050000-5665-74ec-a51b-68ad4e43a779	1336	Kostel
00050000-5665-74ec-4c28-9f80cc8c021d	6256	Košana
00050000-5665-74ec-755d-0909da1aed64	2394	Kotlje
00050000-5665-74ec-0090-984546eecf94	6240	Kozina
00050000-5665-74ec-f7b1-ec42215bb5c2	3260	Kozje
00050000-5665-74ec-cb60-5602cbe163e6	4000	Kranj 
00050000-5665-74ec-3a12-85ec3c722f01	4001	Kranj - poštni predali
00050000-5665-74ec-666d-cf0f6a6f3564	4280	Kranjska Gora
00050000-5665-74ec-7143-df3b072c094b	1281	Kresnice
00050000-5665-74ec-16fc-323f235cb170	4294	Križe
00050000-5665-74ec-8d20-5a68f25d1c69	9206	Križevci
00050000-5665-74ec-d4a0-9488c3d82943	9242	Križevci pri Ljutomeru
00050000-5665-74ec-daf2-718b0bbe8bfd	1301	Krka
00050000-5665-74ec-0779-53563d575c46	8296	Krmelj
00050000-5665-74ec-a64c-d798947a445c	4245	Kropa
00050000-5665-74ec-6cf1-20291d0d3c87	8262	Krška vas
00050000-5665-74ec-69b8-0561b9fee7fb	8270	Krško
00050000-5665-74ec-6785-1ec7caec05b6	9263	Kuzma
00050000-5665-74ec-cc77-f8990bb8aa04	2318	Laporje
00050000-5665-74ec-0cff-0b537e9f7e23	3270	Laško
00050000-5665-74ec-2c2b-acfb02dc0963	1219	Laze v Tuhinju
00050000-5665-74ec-e387-9229804c280b	2230	Lenart v Slovenskih goricah
00050000-5665-74ec-763b-8da8f07b994b	9220	Lendava/Lendva
00050000-5665-74ec-6000-3cd44fa597b0	4248	Lesce
00050000-5665-74ec-9337-512286974b23	3261	Lesično
00050000-5665-74ec-1cc4-f9059a73beed	8273	Leskovec pri Krškem
00050000-5665-74ec-81b2-0b8f5c579737	2372	Libeliče
00050000-5665-74ec-11a8-ae6b9ce59888	2341	Limbuš
00050000-5665-74ec-cb53-83f0e3a4da42	1270	Litija
00050000-5665-74ec-f48f-4a245f1c9091	3202	Ljubečna
00050000-5665-74ec-5ce0-ea379c2bcde8	1000	Ljubljana 
00050000-5665-74ec-8816-97f16394837f	1001	Ljubljana - poštni predali
00050000-5665-74ec-69be-1e7fd5c2d76c	1231	Ljubljana - Črnuče
00050000-5665-74ec-0bee-eb090e86cbed	1261	Ljubljana - Dobrunje
00050000-5665-74ec-d9a4-a9ceb4841f5a	1260	Ljubljana - Polje
00050000-5665-74ec-21b1-225733b155a1	1210	Ljubljana - Šentvid
00050000-5665-74ec-acca-92379500d0dc	1211	Ljubljana - Šmartno
00050000-5665-74ec-4ae0-131780ef2745	3333	Ljubno ob Savinji
00050000-5665-74ec-ff5c-b5f9ae88ff2c	9240	Ljutomer
00050000-5665-74ec-69ea-87489b67d1f7	3215	Loče
00050000-5665-74ec-cf52-572c062a4553	5231	Log pod Mangartom
00050000-5665-74ec-ae3e-61d6452c962a	1358	Log pri Brezovici
00050000-5665-74ec-2742-7e9b04c00407	1370	Logatec
00050000-5665-74ec-212a-230827fa7f64	1371	Logatec
00050000-5665-74ec-fb63-73baa3d7c380	1434	Loka pri Zidanem Mostu
00050000-5665-74ec-54fb-c1e37c97550d	3223	Loka pri Žusmu
00050000-5665-74ec-a5ad-bdecf107ce80	6219	Lokev
00050000-5665-74ec-f4b5-93b96e2e5da9	1318	Loški Potok
00050000-5665-74ec-c6e2-2afcdafe2f46	2324	Lovrenc na Dravskem polju
00050000-5665-74ec-7363-e2b57c5e57fa	2344	Lovrenc na Pohorju
00050000-5665-74ec-061d-1f275de8ea84	3334	Luče
00050000-5665-74ec-7811-11f6b9a7ba92	1225	Lukovica
00050000-5665-74ec-a0f9-b49b3e449411	9202	Mačkovci
00050000-5665-74ec-03ed-a05242a434b7	2322	Majšperk
00050000-5665-74ec-d556-3e99a20896e5	2321	Makole
00050000-5665-74ec-85b6-08f0a1a71b28	9243	Mala Nedelja
00050000-5665-74ec-0bb6-4631cf541611	2229	Malečnik
00050000-5665-74ec-aa54-800449ddb085	6273	Marezige
00050000-5665-74ec-e157-312a54035c91	2000	Maribor 
00050000-5665-74ec-564f-0a01fd4519fb	2001	Maribor - poštni predali
00050000-5665-74ec-e9a1-6642d4c28262	2206	Marjeta na Dravskem polju
00050000-5665-74ec-afe0-ccf0357fd597	2281	Markovci
00050000-5665-74ec-f4ba-5e4f124c1d13	9221	Martjanci
00050000-5665-74ec-3fbc-e97727937ce8	6242	Materija
00050000-5665-74ec-642f-40218f18926a	4211	Mavčiče
00050000-5665-74ec-7ec4-b8150998cbbf	1215	Medvode
00050000-5665-74ec-2078-e0a8fca3e7f6	1234	Mengeš
00050000-5665-74ec-3d99-2ec0393c861b	8330	Metlika
00050000-5665-74ec-9a98-da3f7dfa9bb3	2392	Mežica
00050000-5665-74ec-da46-07871e7a3adc	2204	Miklavž na Dravskem polju
00050000-5665-74ec-bd27-023fbd0182f5	2275	Miklavž pri Ormožu
00050000-5665-74ec-616b-b5f05113106c	5291	Miren
00050000-5665-74ec-4825-289cc7e38b31	8233	Mirna
00050000-5665-74ec-f406-339818e73b73	8216	Mirna Peč
00050000-5665-74ec-6656-770bfd3ce921	2382	Mislinja
00050000-5665-74ec-f193-b3649927ab10	4281	Mojstrana
00050000-5665-74ec-1aa6-ae1906dc8c51	8230	Mokronog
00050000-5665-74ec-947b-66c41c295d8a	1251	Moravče
00050000-5665-74ec-548d-0c83409c401b	9226	Moravske Toplice
00050000-5665-74ec-c628-ee7dcd6e037a	5216	Most na Soči
00050000-5665-74ec-2697-7e539cfdc067	1221	Motnik
00050000-5665-74ec-9e6f-948fdc85fd92	3330	Mozirje
00050000-5665-74ec-cd5c-4e5841bf03e3	9000	Murska Sobota 
00050000-5665-74ec-7600-0c5ec0f0b430	9001	Murska Sobota - poštni predali
00050000-5665-74ec-1333-24b6470a22b0	2366	Muta
00050000-5665-74ec-a9dc-261a1cf49466	4202	Naklo
00050000-5665-74ec-ad29-1e8edb4076a5	3331	Nazarje
00050000-5665-74ec-5199-29f82fe4e611	1357	Notranje Gorice
00050000-5665-74ec-20dd-8e833ada2602	3203	Nova Cerkev
00050000-5665-74ec-d061-5589f8325b89	5000	Nova Gorica 
00050000-5665-74ec-53d6-5cdd8ad31a12	5001	Nova Gorica - poštni predali
00050000-5665-74ec-42af-b882798c7e6e	1385	Nova vas
00050000-5665-74ec-d4d5-e1df276de835	8000	Novo mesto
00050000-5665-74ec-db75-758c994070b7	8001	Novo mesto - poštni predali
00050000-5665-74ec-9f86-0eb053457fa5	6243	Obrov
00050000-5665-74ec-0b35-9cec925a3b76	9233	Odranci
00050000-5665-74ec-7740-52f01fb91827	2317	Oplotnica
00050000-5665-74ec-341c-2cc4567f8319	2312	Orehova vas
00050000-5665-74ec-a20d-206c8c4bf377	2270	Ormož
00050000-5665-74ec-e8a6-8ec2cccaa558	1316	Ortnek
00050000-5665-74ec-cab9-e959388590c0	1337	Osilnica
00050000-5665-74ec-3011-c982a1866d48	8222	Otočec
00050000-5665-74ec-2df6-8efc479d137a	2361	Ožbalt
00050000-5665-74ec-a026-b720143eaa21	2231	Pernica
00050000-5665-74ec-23c0-a905fdab8314	2211	Pesnica pri Mariboru
00050000-5665-74ec-1aea-1391015d36ca	9203	Petrovci
00050000-5665-74ec-9b34-9f71f4d5f8b8	3301	Petrovče
00050000-5665-74ec-3b23-ca981a846795	6330	Piran/Pirano
00050000-5665-74ec-0237-5dd18b95d381	8255	Pišece
00050000-5665-74ec-c516-9880daf9b692	6257	Pivka
00050000-5665-74ec-c95d-263c4dfac9db	6232	Planina
00050000-5665-74ec-87d6-1ecbab708f30	3225	Planina pri Sevnici
00050000-5665-74ec-3798-1dcb565aadb0	6276	Pobegi
00050000-5665-74ec-616d-5b4842df93e6	8312	Podbočje
00050000-5665-74ec-7a9d-40a41efc36d8	5243	Podbrdo
00050000-5665-74ec-19f1-d88e136febcc	3254	Podčetrtek
00050000-5665-74ec-928d-9e6d21d1afe0	2273	Podgorci
00050000-5665-74ec-726c-5effc1f67a4a	6216	Podgorje
00050000-5665-74ec-f879-5fcdf3fc2bde	2381	Podgorje pri Slovenj Gradcu
00050000-5665-74ec-ad2f-d9b4d287d2a2	6244	Podgrad
00050000-5665-74ec-66ff-7098ab560797	1414	Podkum
00050000-5665-74ed-bd4c-6333dd94fcc4	2286	Podlehnik
00050000-5665-74ed-bb0d-eae8becbf935	5272	Podnanos
00050000-5665-74ed-3376-393f2983b201	4244	Podnart
00050000-5665-74ed-ce93-e28649508f41	3241	Podplat
00050000-5665-74ed-16c9-a65edc88a165	3257	Podsreda
00050000-5665-74ed-a383-8fd307341143	2363	Podvelka
00050000-5665-74ed-326e-809f667a7bae	2208	Pohorje
00050000-5665-74ed-fdac-70835ce1334f	2257	Polenšak
00050000-5665-74ed-6b85-e12a39eed2f6	1355	Polhov Gradec
00050000-5665-74ed-3581-257a3dac7718	4223	Poljane nad Škofjo Loko
00050000-5665-74ed-4318-5b7166dc9909	2319	Poljčane
00050000-5665-74ed-981b-6059d8600c1c	1272	Polšnik
00050000-5665-74ed-f0d9-dbb22697cee7	3313	Polzela
00050000-5665-74ed-9d76-284ec870b6c5	3232	Ponikva
00050000-5665-74ed-363f-b8115a6012ee	6320	Portorož/Portorose
00050000-5665-74ed-0a8f-3de208a47a3c	6230	Postojna
00050000-5665-74ed-b719-13f1048c98d4	2331	Pragersko
00050000-5665-74ed-0e7f-91733bc684f5	3312	Prebold
00050000-5665-74ed-515e-8769d1049760	4205	Preddvor
00050000-5665-74ed-a472-7635729b6d4c	6255	Prem
00050000-5665-74ed-ad49-36c9672819ea	1352	Preserje
00050000-5665-74ed-3135-56f8f27fa3ee	6258	Prestranek
00050000-5665-74ed-9391-85a09f8d3061	2391	Prevalje
00050000-5665-74ed-4529-8f7ae38d2fd3	3262	Prevorje
00050000-5665-74ed-88ce-84503c09fd63	1276	Primskovo 
00050000-5665-74ed-2ec3-de3ccdac371a	3253	Pristava pri Mestinju
00050000-5665-74ed-4576-1214ffaf60f5	9207	Prosenjakovci/Partosfalva
00050000-5665-74ed-209d-3f05d2405ae5	5297	Prvačina
00050000-5665-74ed-db34-f2825ec8932a	2250	Ptuj
00050000-5665-74ed-2336-f9931a6efb5c	2323	Ptujska Gora
00050000-5665-74ed-d319-ec1a7deb4f9a	9201	Puconci
00050000-5665-74ed-eeda-d24ab2d0bbdf	2327	Rače
00050000-5665-74ed-bccb-f2295233e7c6	1433	Radeče
00050000-5665-74ed-3158-318b8b4fcd46	9252	Radenci
00050000-5665-74ed-c850-94274e7738ed	2360	Radlje ob Dravi
00050000-5665-74ed-eb55-a6da491313af	1235	Radomlje
00050000-5665-74ed-972e-a10e7c417152	4240	Radovljica
00050000-5665-74ed-bbdb-876ff64a8e91	8274	Raka
00050000-5665-74ed-5a13-eae96307716a	1381	Rakek
00050000-5665-74ed-cb9c-6509a720cb07	4283	Rateče - Planica
00050000-5665-74ed-dd79-6cb7760ac42a	2390	Ravne na Koroškem
00050000-5665-74ed-af73-bf21cd5fec1e	9246	Razkrižje
00050000-5665-74ed-a9ed-9bc38f52000c	3332	Rečica ob Savinji
00050000-5665-74ed-81ae-c4715353fb3f	5292	Renče
00050000-5665-74ed-5b71-610fa974c1ff	1310	Ribnica
00050000-5665-74ed-7f5f-10e00a5e3e0a	2364	Ribnica na Pohorju
00050000-5665-74ed-f065-c88d9d03221f	3272	Rimske Toplice
00050000-5665-74ed-95d3-c46174025a22	1314	Rob
00050000-5665-74ed-4e51-1c3c2ea05020	5215	Ročinj
00050000-5665-74ed-dccc-c1a05863ae45	3250	Rogaška Slatina
00050000-5665-74ed-cf65-3e173a8b82b0	9262	Rogašovci
00050000-5665-74ed-ec2c-eea255a88601	3252	Rogatec
00050000-5665-74ed-b6af-33df2e4c1b57	1373	Rovte
00050000-5665-74ed-31f4-6ac8729f9a08	2342	Ruše
00050000-5665-74ed-11df-aea13cd4b42e	1282	Sava
00050000-5665-74ed-aef8-e9b5d8d5b80d	6333	Sečovlje/Sicciole
00050000-5665-74ed-c156-9abc361c6b40	4227	Selca
00050000-5665-74ed-bc7d-f0088bec8b30	2352	Selnica ob Dravi
00050000-5665-74ed-efcd-00326834d72e	8333	Semič
00050000-5665-74ed-37d9-10381bfe408b	8281	Senovo
00050000-5665-74ed-80a7-d47c7a466711	6224	Senožeče
00050000-5665-74ed-9b2a-30e1844482b3	8290	Sevnica
00050000-5665-74ed-6538-7a45dafc499e	6210	Sežana
00050000-5665-74ed-3eb4-502e43d9979d	2214	Sladki Vrh
00050000-5665-74ed-1b27-6ad7588f81f1	5283	Slap ob Idrijci
00050000-5665-74ed-a5e0-579323132426	2380	Slovenj Gradec
00050000-5665-74ed-5687-408f93cd2024	2310	Slovenska Bistrica
00050000-5665-74ed-efae-4de5da9446a5	3210	Slovenske Konjice
00050000-5665-74ed-97c6-92cf5c4a1a46	1216	Smlednik
00050000-5665-74ed-0846-8942a2bcf641	5232	Soča
00050000-5665-74ed-c835-80db86355992	1317	Sodražica
00050000-5665-74ed-0a62-f7c99732fed2	3335	Solčava
00050000-5665-74ed-e6d3-0fcf7283aca0	5250	Solkan
00050000-5665-74ed-0846-5bdf64606981	4229	Sorica
00050000-5665-74ed-1c30-4d2cc2bb27d1	4225	Sovodenj
00050000-5665-74ed-48d7-1d867f02eed3	5281	Spodnja Idrija
00050000-5665-74ed-1da1-2c1433cf1a2d	2241	Spodnji Duplek
00050000-5665-74ed-7fab-165f50bcb687	9245	Spodnji Ivanjci
00050000-5665-74ed-7991-3c1ba55c5e90	2277	Središče ob Dravi
00050000-5665-74ed-398e-a72412dae59c	4267	Srednja vas v Bohinju
00050000-5665-74ed-f1d5-226f46514f8a	8256	Sromlje 
00050000-5665-74ed-8a78-377d9f9a9049	5224	Srpenica
00050000-5665-74ed-19e3-1c5023c40997	1242	Stahovica
00050000-5665-74ed-f361-daec0b51e968	1332	Stara Cerkev
00050000-5665-74ed-c8ca-03272df7385f	8342	Stari trg ob Kolpi
00050000-5665-74ed-0eb4-986e141bd869	1386	Stari trg pri Ložu
00050000-5665-74ed-84f8-65d1cc6d52c1	2205	Starše
00050000-5665-74ed-e23e-1b26b57739d2	2289	Stoperce
00050000-5665-74ed-c590-ad71326ba5eb	8322	Stopiče
00050000-5665-74ed-5f79-6cd0be987bf1	3206	Stranice
00050000-5665-74ed-c495-fb8fbce393c9	8351	Straža
00050000-5665-74ed-cec0-fd47c98a9813	1313	Struge
00050000-5665-74ed-84ed-bce627db6c40	8293	Studenec
00050000-5665-74ed-8935-5bffd6fa5780	8331	Suhor
00050000-5665-74ed-21ee-6c49bc3ccc70	2233	Sv. Ana v Slovenskih goricah
00050000-5665-74ed-5d58-2c0329a8d8cf	2235	Sv. Trojica v Slovenskih goricah
00050000-5665-74ed-e30d-0a387058ab29	2353	Sveti Duh na Ostrem Vrhu
00050000-5665-74ed-1453-45e50468e11c	9244	Sveti Jurij ob Ščavnici
00050000-5665-74ed-f5bd-660c8588af22	3264	Sveti Štefan
00050000-5665-74ed-7eb0-45ceba36bf74	2258	Sveti Tomaž
00050000-5665-74ed-7d18-5a77f77aed97	9204	Šalovci
00050000-5665-74ed-6b7f-350b503af830	5261	Šempas
00050000-5665-74ed-2bda-bb4055829336	5290	Šempeter pri Gorici
00050000-5665-74ed-db14-e7f7ce65f6f1	3311	Šempeter v Savinjski dolini
00050000-5665-74ed-7dbd-98bd6a48ef60	4208	Šenčur
00050000-5665-74ed-8335-9f94feab8ea2	2212	Šentilj v Slovenskih goricah
00050000-5665-74ed-5c82-082fd29befe1	8297	Šentjanž
00050000-5665-74ed-a3ce-54efa4a6b089	2373	Šentjanž pri Dravogradu
00050000-5665-74ed-ac29-173e83d8093e	8310	Šentjernej
00050000-5665-74ed-c5e7-e38b16625e44	3230	Šentjur
00050000-5665-74ed-cece-afef57cdaf86	3271	Šentrupert
00050000-5665-74ed-6c5b-553fef18c620	8232	Šentrupert
00050000-5665-74ed-27c8-e266e2063973	1296	Šentvid pri Stični
00050000-5665-74ed-5c50-f9383b32668f	8275	Škocjan
00050000-5665-74ed-c4e6-384a6247c79a	6281	Škofije
00050000-5665-74ed-429f-df442b6937b2	4220	Škofja Loka
00050000-5665-74ed-3a71-a93c0232bf82	3211	Škofja vas
00050000-5665-74ed-5cf9-f4a61129a9c2	1291	Škofljica
00050000-5665-74ed-dc08-c686113a82f6	6274	Šmarje
00050000-5665-74ed-a90e-3e4061e0cc82	1293	Šmarje - Sap
00050000-5665-74ed-3f41-91fdf387cb95	3240	Šmarje pri Jelšah
00050000-5665-74ed-93fb-0709a34558e0	8220	Šmarješke Toplice
00050000-5665-74ed-70d9-e5ea37298bc1	2315	Šmartno na Pohorju
00050000-5665-74ed-e5df-1ec046f4058a	3341	Šmartno ob Dreti
00050000-5665-74ed-bab1-622bdc121163	3327	Šmartno ob Paki
00050000-5665-74ed-355a-31fae32bf4fe	1275	Šmartno pri Litiji
00050000-5665-74ed-a584-e69a279adbd1	2383	Šmartno pri Slovenj Gradcu
00050000-5665-74ed-fcce-4d52b0c9a96e	3201	Šmartno v Rožni dolini
00050000-5665-74ed-4096-17c7a1d4f5f9	3325	Šoštanj
00050000-5665-74ed-4f97-4286eddcec1b	6222	Štanjel
00050000-5665-74ed-451f-56d86246c73f	3220	Štore
00050000-5665-74ed-14cd-d29d50d09fdd	3304	Tabor
00050000-5665-74ed-77f6-3697585c9233	3221	Teharje
00050000-5665-74ed-e9c2-cd9f6095b946	9251	Tišina
00050000-5665-74ed-7f77-f21121a4eb1b	5220	Tolmin
00050000-5665-74ed-ddf1-63c5ef43903f	3326	Topolšica
00050000-5665-74ed-12b2-7d1ea1e508cf	2371	Trbonje
00050000-5665-74ed-b60b-ddb0ea80c41e	1420	Trbovlje
00050000-5665-74ed-4edc-38e2592681c2	8231	Trebelno 
00050000-5665-74ed-e5e7-aa054d708536	8210	Trebnje
00050000-5665-74ed-0303-82278eeb2559	5252	Trnovo pri Gorici
00050000-5665-74ed-bd80-3204f51b6c0a	2254	Trnovska vas
00050000-5665-74ed-7ca8-952bd346c046	1222	Trojane
00050000-5665-74ed-c33f-9463ff19beb0	1236	Trzin
00050000-5665-74ed-bfa1-3ab698f957a5	4290	Tržič
00050000-5665-74ed-1d41-0a4867ce552b	8295	Tržišče
00050000-5665-74ed-6f6f-ce1dc4fa9cb5	1311	Turjak
00050000-5665-74ed-380d-68ffdd9079b5	9224	Turnišče
00050000-5665-74ed-cb94-4b5afaaa3681	8323	Uršna sela
00050000-5665-74ed-5476-4ecff098d601	1252	Vače
00050000-5665-74ed-41a3-d88b9603666a	3320	Velenje 
00050000-5665-74ed-0e05-220682039648	3322	Velenje - poštni predali
00050000-5665-74ed-38b7-91f1b7bcabbc	8212	Velika Loka
00050000-5665-74ed-ebd0-5ff391a39133	2274	Velika Nedelja
00050000-5665-74ed-c0a5-a29ef2d331da	9225	Velika Polana
00050000-5665-74ed-6838-e4b4ee52a772	1315	Velike Lašče
00050000-5665-74ed-6e88-e880a850e631	8213	Veliki Gaber
00050000-5665-74ed-c666-0e2457f8fb93	9241	Veržej
00050000-5665-74ed-22c1-99ccc6556238	1312	Videm - Dobrepolje
00050000-5665-74ed-7418-0697e2c5338c	2284	Videm pri Ptuju
00050000-5665-74ed-5219-4f9ae2d450a4	8344	Vinica
00050000-5665-74ed-4a1a-06c3baf34e38	5271	Vipava
00050000-5665-74ed-be01-85ebe7be4094	4212	Visoko
00050000-5665-74ed-f85b-1eb4617eedbd	1294	Višnja Gora
00050000-5665-74ed-4dbb-9dc33f58458c	3205	Vitanje
00050000-5665-74ed-823c-bf9c94312594	2255	Vitomarci
00050000-5665-74ed-aaed-ebc208f3c325	1217	Vodice
00050000-5665-74ed-dbe4-93b973b6ed47	3212	Vojnik\t
00050000-5665-74ed-2aac-4d5c00925ba8	5293	Volčja Draga
00050000-5665-74ed-7da8-a315b30ce223	2232	Voličina
00050000-5665-74ed-7da7-3e18e5500c13	3305	Vransko
00050000-5665-74ed-a5d5-b3ba4f8b76e8	6217	Vremski Britof
00050000-5665-74ed-e41a-1995030f6b73	1360	Vrhnika
00050000-5665-74ed-a61d-ba0fc3d9c1e2	2365	Vuhred
00050000-5665-74ed-0645-e875ebd6a192	2367	Vuzenica
00050000-5665-74ed-2375-944b177829d9	8292	Zabukovje 
00050000-5665-74ed-4aab-82424e91c28b	1410	Zagorje ob Savi
00050000-5665-74ed-3f34-732501e4504a	1303	Zagradec
00050000-5665-74ed-4939-e7ae3cfb1762	2283	Zavrč
00050000-5665-74ed-f33a-d5b6aec8926f	8272	Zdole 
00050000-5665-74ed-0317-ec5eb6d5e335	4201	Zgornja Besnica
00050000-5665-74ed-98ad-419feb509b6b	2242	Zgornja Korena
00050000-5665-74ed-2e9b-bd900f53cb2e	2201	Zgornja Kungota
00050000-5665-74ed-1897-b403dffc5586	2316	Zgornja Ložnica
00050000-5665-74ed-be3a-e206845ea99c	2314	Zgornja Polskava
00050000-5665-74ed-ed41-2108d5883933	2213	Zgornja Velka
00050000-5665-74ed-6df8-e33c47f52b9b	4247	Zgornje Gorje
00050000-5665-74ed-6acb-99ca082a74db	4206	Zgornje Jezersko
00050000-5665-74ed-56c0-7525d179237b	2285	Zgornji Leskovec
00050000-5665-74ed-0e2e-ed7b3e8cf653	1432	Zidani Most
00050000-5665-74ed-fdc3-2a223109d403	3214	Zreče
00050000-5665-74ed-c903-2011fc35b81c	4209	Žabnica
00050000-5665-74ed-6195-c5c8f91746a8	3310	Žalec
00050000-5665-74ed-5116-c2e0380dc18e	4228	Železniki
00050000-5665-74ed-87f6-0927be0cd977	2287	Žetale
00050000-5665-74ed-c98b-49ea10fd2c56	4226	Žiri
00050000-5665-74ed-22a2-d8e701f16e26	4274	Žirovnica
00050000-5665-74ed-edeb-3163dcf29853	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 30997746)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 30997321)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 30997069)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5665-74ef-d21a-595c23f5d354	00080000-5665-74ef-a396-8e507ffb2fac	\N	00040000-5665-74ed-c54f-40e52b1afbb8	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5665-74ef-c2a3-1a3d6c904092	00080000-5665-74ef-a396-8e507ffb2fac	\N	00040000-5665-74ed-c54f-40e52b1afbb8	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5665-74ef-1ea6-7556ab2fa62a	00080000-5665-74ef-075a-9355070e1682	\N	00040000-5665-74ed-c54f-40e52b1afbb8	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 30997213)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5665-74ed-a2f2-4059c3ea4515	novo leto	1	1	\N	t
00430000-5665-74ed-0f87-2cf3e4a6fcfc	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5665-74ed-5f89-0b08f1cfa6ba	dan upora proti okupatorju	27	4	\N	t
00430000-5665-74ed-9f13-f5d41d575945	praznik dela	1	5	\N	t
00430000-5665-74ed-936b-2102fc381689	praznik dela	2	5	\N	t
00430000-5665-74ed-15da-e62ab89f0e2e	dan Primoža Trubarja	8	6	\N	f
00430000-5665-74ed-5954-2a9673cdf137	dan državnosti	25	6	\N	t
00430000-5665-74ed-467a-33886a3f9889	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5665-74ed-7375-c7dd1ca0f666	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5665-74ed-9ab6-1fa9d5d474ac	dan suverenosti	25	10	\N	f
00430000-5665-74ed-9318-4a540c242577	dan spomina na mrtve	1	11	\N	t
00430000-5665-74ed-6687-8bd54f7feb54	dan Rudolfa Maistra	23	11	\N	f
00430000-5665-74ed-4267-1ea39c9fb71b	božič	25	12	\N	t
00430000-5665-74ed-f9bc-d557e32b5484	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5665-74ed-945c-5b3182f70931	Marijino vnebovzetje	15	8	\N	t
00430000-5665-74ed-a458-0ed4d7d4edb1	dan reformacije	31	10	\N	t
00430000-5665-74ed-c710-ac4eeccc912c	velikonočna nedelja	27	3	2016	t
00430000-5665-74ed-a367-83b48cf2ce6f	velikonočna nedelja	16	4	2017	t
00430000-5665-74ed-7425-df2976cf1119	velikonočna nedelja	1	4	2018	t
00430000-5665-74ed-bc00-50421a59a9e2	velikonočna nedelja	21	4	2019	t
00430000-5665-74ed-86c5-093a6c191d08	velikonočna nedelja	12	4	2020	t
00430000-5665-74ed-d845-3c1125f84bd3	velikonočna nedelja	4	4	2021	t
00430000-5665-74ed-0af3-64ed7136007c	velikonočna nedelja	17	4	2022	t
00430000-5665-74ed-cb01-bdd7efd7561b	velikonočna nedelja	9	4	2023	t
00430000-5665-74ed-b86a-1835e5c816ab	velikonočna nedelja	31	3	2024	t
00430000-5665-74ed-777e-5f67ad1690c6	velikonočna nedelja	20	4	2025	t
00430000-5665-74ed-b2dd-51cb512a70bd	velikonočna nedelja	5	4	2026	t
00430000-5665-74ed-20ed-bc41cdf6a8ae	velikonočna nedelja	28	3	2027	t
00430000-5665-74ed-8749-d96c71adcd67	velikonočna nedelja	16	4	2028	t
00430000-5665-74ed-e7e2-b3d15b9416bb	velikonočna nedelja	1	4	2029	t
00430000-5665-74ed-5fb1-89c6ef04a9b0	velikonočna nedelja	21	4	2030	t
00430000-5665-74ed-0786-a2c618fd035d	velikonočni ponedeljek	28	3	2016	t
00430000-5665-74ed-96f0-1dd61bd7a4be	velikonočni ponedeljek	17	4	2017	t
00430000-5665-74ed-36e9-564f67bf6c4d	velikonočni ponedeljek	2	4	2018	t
00430000-5665-74ed-84a9-b1f89c79d657	velikonočni ponedeljek	22	4	2019	t
00430000-5665-74ed-189e-cf8acdb34110	velikonočni ponedeljek	13	4	2020	t
00430000-5665-74ed-8b31-3f6053cdef53	velikonočni ponedeljek	5	4	2021	t
00430000-5665-74ed-ba6e-e09cb1e27fec	velikonočni ponedeljek	18	4	2022	t
00430000-5665-74ed-af96-d048c7def4bd	velikonočni ponedeljek	10	4	2023	t
00430000-5665-74ed-f7ef-669fbd63d9cd	velikonočni ponedeljek	1	4	2024	t
00430000-5665-74ed-4a91-e899d2ec0582	velikonočni ponedeljek	21	4	2025	t
00430000-5665-74ed-200f-3fc723deddf3	velikonočni ponedeljek	6	4	2026	t
00430000-5665-74ed-f4a1-6e678fc60f28	velikonočni ponedeljek	29	3	2027	t
00430000-5665-74ed-606e-ed40ea19f7c6	velikonočni ponedeljek	17	4	2028	t
00430000-5665-74ed-b666-29bb65bd07ce	velikonočni ponedeljek	2	4	2029	t
00430000-5665-74ed-4095-0c1e5e14d6f0	velikonočni ponedeljek	22	4	2030	t
00430000-5665-74ed-3317-ef2284799767	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5665-74ed-8d2a-9dcd4cd2fcd4	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5665-74ed-94c8-e9964edac67d	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5665-74ed-8ca1-943ad1e69791	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5665-74ed-5305-0171645fda1a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5665-74ed-1164-7e938a008613	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5665-74ed-983e-f2447f14e3ae	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5665-74ed-d456-c0b59faf6f89	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5665-74ed-af45-60fb4c866605	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5665-74ed-d1d5-f4c85d6183c0	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5665-74ed-eff4-1df77084e50a	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5665-74ed-01ce-527c93d33d29	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5665-74ed-a0c2-ccaed297fe0f	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5665-74ed-0ae0-628c6f9da4d2	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5665-74ed-7f1c-dff56e225e50	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 30997173)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 30997185)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 30997333)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 30997760)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 30997770)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5665-74ef-ba12-bcaa30273bda	00080000-5665-74ef-1164-215e4a497be5	0987	AK
00190000-5665-74ef-42b6-2b2fc4f33ae9	00080000-5665-74ef-075a-9355070e1682	0989	AK
00190000-5665-74ef-28c1-b57061b17037	00080000-5665-74ef-e7b9-aa9866beea29	0986	AK
00190000-5665-74ef-5e20-09d6b0d65974	00080000-5665-74ef-3133-4627d65acf47	0984	AK
00190000-5665-74ef-adaa-54bdc71fe5f3	00080000-5665-74ef-b6f9-7e7cfcd1564f	0983	AK
00190000-5665-74ef-168a-b1c51cdf4ff5	00080000-5665-74ef-b991-f601f0a1ad6b	0982	AK
00190000-5665-74f1-4ead-c85496ff606d	00080000-5665-74f1-214a-75d58b783a69	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 30997669)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5665-74f0-c969-19fa48324912	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 30997778)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 30997362)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5665-74ef-3d09-b57d80334f7c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5665-74ef-ae88-b4b5f1450015	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5665-74ef-f7bd-b2600fa4069e	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5665-74ef-d4ea-541ed65b88d7	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5665-74ef-0698-5b8353605c6e	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5665-74ef-5d61-dc6ebff64029	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5665-74ef-0ca4-acbf44e8d610	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 30997306)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 30997296)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 30997507)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 30997437)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 30997147)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 30996909)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5665-74f1-214a-75d58b783a69	00010000-5665-74ee-5f9d-b3670820c606	2015-12-07 13:00:49	INS	a:0:{}
2	App\\Entity\\Option	00000000-5665-74f1-5f50-6a013609abc3	00010000-5665-74ee-5f9d-b3670820c606	2015-12-07 13:00:49	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5665-74f1-4ead-c85496ff606d	00010000-5665-74ee-5f9d-b3670820c606	2015-12-07 13:00:49	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 30997375)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 30996947)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5665-74ed-2c30-b66e77f74692	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5665-74ed-e3b3-7403ee840529	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5665-74ed-645f-b5597b0e9d34	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5665-74ed-70ae-ec5bbecc2d74	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5665-74ed-bb0c-a518722c99b6	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5665-74ed-8d4e-75b8ef02122b	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5665-74ed-f46f-63f571b795f4	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5665-74ed-53ad-90d548f61b5c	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5665-74ed-f16a-c9d64bda85b4	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-74ed-f5d5-eb079d55fc27	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-74ed-85b5-59e555db1a50	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-74ed-bca1-ffd7f11b095c	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-74ed-7c8f-41c939d9a0cc	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5665-74ed-59c6-23f8a82a0046	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5665-74ed-b886-313b2ff9b9dd	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5665-74ed-a0b5-6ec60046f4e8	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5665-74ed-ab0e-58fa61a9882f	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5665-74ed-8edc-42299f8ef63d	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5665-74ed-2e20-bf89dcba3364	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5665-74ed-f106-8844eb9d52ba	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5665-74ed-cc32-c598ab9461ea	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5665-74ed-f461-c645a3b482ff	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5665-74ed-79b4-709e3510543b	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5665-74ed-7d96-889b790990f1	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5665-74ed-7004-7c4b53168a85	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5665-74ed-fbbd-31d370d56db8	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5665-74ed-bd76-7bbb864518b6	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5665-74ed-73ad-d2304ad933a1	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5665-74ed-6b95-d1a3ce09cc55	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5665-74ed-17cf-0dcfb09a92ba	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5665-74ed-87a6-f4ceae3797a1	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5665-74ed-91dc-31f46909f976	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5665-74ed-398f-2038f918d8ec	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5665-74ed-55b7-343a8cdf02d5	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5665-74ed-38c4-db0e7ef6820f	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5665-74ed-3f6d-bc9c2894fd5b	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5665-74ed-6816-80a414169783	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5665-74ed-abae-0baf1da91d55	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5665-74ed-c825-1c6ed8fa2c6c	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5665-74ed-eb22-850afead2530	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5665-74ed-0c5e-e229beaaadcd	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5665-74ed-517d-925a7ce21272	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5665-74ed-c67e-432e8c18a555	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5665-74ed-d265-2ba874923d72	arhivar	arhivar	t
00020000-5665-74ef-b9c7-4b6be01bc9eb	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5665-74ef-4df1-d8d946676680	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-b01e-1337edca7f97	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-5987-3c80c8d58a72	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-28a0-7b4a18edb808	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-7bc4-a037eb399656	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-6d14-e702f9046109	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-fc2b-e24af1344e48	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-8ef1-0f9994e03a55	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-00c6-21a1a0cda02e	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-63e5-5cf057c4822a	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-9597-d09f4ed005e8	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-9ec0-8a993ec95e63	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-7973-07d72d9f013f	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-b829-62831590e128	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-9da1-1cfdd434059c	Oseba-vse	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-920d-68da230f7931	Oseba-readVse	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-86b4-164cf223dc0a	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-8d58-7c8b4df2d33c	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-0edd-9290ece33df8	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5665-74ef-6101-602c8c226512	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-1c34-0e958b447926	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-f536-cd664f8993d8	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-9cd0-fceaa3d5e2db	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5665-74ef-1ea8-b5eeeaa9aa28	Telefonska-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 30996931)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5665-74ee-a552-77295fd9571e	00020000-5665-74ed-645f-b5597b0e9d34
00010000-5665-74ee-5f9d-b3670820c606	00020000-5665-74ed-645f-b5597b0e9d34
00010000-5665-74ef-3391-37bebb0a7eb1	00020000-5665-74ef-b9c7-4b6be01bc9eb
00010000-5665-74ef-1415-f95870016d5c	00020000-5665-74ef-4df1-d8d946676680
00010000-5665-74ef-1415-f95870016d5c	00020000-5665-74ef-7bc4-a037eb399656
00010000-5665-74ef-1415-f95870016d5c	00020000-5665-74ef-00c6-21a1a0cda02e
00010000-5665-74ef-1415-f95870016d5c	00020000-5665-74ef-9597-d09f4ed005e8
00010000-5665-74ef-1415-f95870016d5c	00020000-5665-74ef-7973-07d72d9f013f
00010000-5665-74ef-1415-f95870016d5c	00020000-5665-74ef-8d58-7c8b4df2d33c
00010000-5665-74ef-1415-f95870016d5c	00020000-5665-74ef-5987-3c80c8d58a72
00010000-5665-74ef-1415-f95870016d5c	00020000-5665-74ef-6101-602c8c226512
00010000-5665-74ef-1415-f95870016d5c	00020000-5665-74ef-9cd0-fceaa3d5e2db
00010000-5665-74ef-7715-fdba2271efd0	00020000-5665-74ef-4df1-d8d946676680
00010000-5665-74ef-7715-fdba2271efd0	00020000-5665-74ef-b01e-1337edca7f97
00010000-5665-74ef-7715-fdba2271efd0	00020000-5665-74ef-5987-3c80c8d58a72
00010000-5665-74ef-7715-fdba2271efd0	00020000-5665-74ef-28a0-7b4a18edb808
00010000-5665-74ef-7715-fdba2271efd0	00020000-5665-74ef-7973-07d72d9f013f
00010000-5665-74ef-7715-fdba2271efd0	00020000-5665-74ef-920d-68da230f7931
00010000-5665-74ef-7715-fdba2271efd0	00020000-5665-74ef-6101-602c8c226512
00010000-5665-74ef-7715-fdba2271efd0	00020000-5665-74ef-9cd0-fceaa3d5e2db
00010000-5665-74ef-5a31-68046da9391a	00020000-5665-74ef-4df1-d8d946676680
00010000-5665-74ef-5a31-68046da9391a	00020000-5665-74ef-b01e-1337edca7f97
00010000-5665-74ef-5a31-68046da9391a	00020000-5665-74ef-5987-3c80c8d58a72
00010000-5665-74ef-5a31-68046da9391a	00020000-5665-74ef-28a0-7b4a18edb808
00010000-5665-74ef-5a31-68046da9391a	00020000-5665-74ef-9597-d09f4ed005e8
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-b01e-1337edca7f97
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-6d14-e702f9046109
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-63e5-5cf057c4822a
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-9ec0-8a993ec95e63
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-9597-d09f4ed005e8
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-86b4-164cf223dc0a
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-7973-07d72d9f013f
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-b829-62831590e128
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-6101-602c8c226512
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-1c34-0e958b447926
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-9cd0-fceaa3d5e2db
00010000-5665-74ef-9b82-43376b0d2d48	00020000-5665-74ef-1ea8-b5eeeaa9aa28
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-b01e-1337edca7f97
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-6d14-e702f9046109
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-8ef1-0f9994e03a55
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-63e5-5cf057c4822a
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-9ec0-8a993ec95e63
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-9597-d09f4ed005e8
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-86b4-164cf223dc0a
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-7973-07d72d9f013f
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-b829-62831590e128
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-9da1-1cfdd434059c
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-6101-602c8c226512
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-1c34-0e958b447926
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-f536-cd664f8993d8
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-9cd0-fceaa3d5e2db
00010000-5665-74ef-e63d-943dc3e9f86d	00020000-5665-74ef-1ea8-b5eeeaa9aa28
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-b01e-1337edca7f97
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-5987-3c80c8d58a72
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-6d14-e702f9046109
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-fc2b-e24af1344e48
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-8ef1-0f9994e03a55
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-7bc4-a037eb399656
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-63e5-5cf057c4822a
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-9ec0-8a993ec95e63
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-9597-d09f4ed005e8
00010000-5665-74ef-a9be-b74bc02ff479	00020000-5665-74ef-86b4-164cf223dc0a
00010000-5665-74ef-ce16-82f7efef28b1	00020000-5665-74ef-4df1-d8d946676680
00010000-5665-74ef-ce16-82f7efef28b1	00020000-5665-74ef-28a0-7b4a18edb808
00010000-5665-74ef-ce16-82f7efef28b1	00020000-5665-74ef-7bc4-a037eb399656
00010000-5665-74ef-ce16-82f7efef28b1	00020000-5665-74ef-00c6-21a1a0cda02e
00010000-5665-74ef-ce16-82f7efef28b1	00020000-5665-74ef-9597-d09f4ed005e8
00010000-5665-74ef-ce16-82f7efef28b1	00020000-5665-74ef-7973-07d72d9f013f
00010000-5665-74ef-ce16-82f7efef28b1	00020000-5665-74ef-8d58-7c8b4df2d33c
00010000-5665-74ef-f1af-f49e0d683585	00020000-5665-74ef-0edd-9290ece33df8
\.


--
-- TOC entry 3146 (class 0 OID 30997389)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 30997327)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 30997273)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5665-74ef-5059-c416f462e03d	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5665-74ef-7d75-15f8fcfc3211	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5665-74ef-0525-fa8e4f237ad9	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 30996896)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5665-74ed-2fe2-12dcfd043c71	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5665-74ed-c216-7d218a90d8b1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5665-74ed-1b3b-7afebfa34c3d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5665-74ed-853f-a28df41513a1	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5665-74ed-e8d5-e8942c011b5e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 30996888)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5665-74ed-5063-21a1be8a778d	00230000-5665-74ed-853f-a28df41513a1	popa
00240000-5665-74ed-5582-dbbc39f13f59	00230000-5665-74ed-853f-a28df41513a1	oseba
00240000-5665-74ed-4afe-bbb520177b08	00230000-5665-74ed-853f-a28df41513a1	tippopa
00240000-5665-74ed-2137-38d5665b4240	00230000-5665-74ed-853f-a28df41513a1	organizacijskaenota
00240000-5665-74ed-328d-0db81b3a422f	00230000-5665-74ed-853f-a28df41513a1	sezona
00240000-5665-74ed-f3a1-8d5cc65cf392	00230000-5665-74ed-853f-a28df41513a1	tipvaje
00240000-5665-74ed-f821-8c838d6929dc	00230000-5665-74ed-c216-7d218a90d8b1	prostor
00240000-5665-74ed-f3df-9b087e458be3	00230000-5665-74ed-853f-a28df41513a1	besedilo
00240000-5665-74ed-8fb6-f23b9011f0fa	00230000-5665-74ed-853f-a28df41513a1	uprizoritev
00240000-5665-74ed-0de1-4f2c12587b50	00230000-5665-74ed-853f-a28df41513a1	funkcija
00240000-5665-74ed-227c-6e6f4e2b96fb	00230000-5665-74ed-853f-a28df41513a1	tipfunkcije
00240000-5665-74ed-4a04-988fc7769271	00230000-5665-74ed-853f-a28df41513a1	alternacija
00240000-5665-74ed-dffd-5bd3e7de13b9	00230000-5665-74ed-2fe2-12dcfd043c71	pogodba
00240000-5665-74ed-5f90-40d85aaf7f60	00230000-5665-74ed-853f-a28df41513a1	zaposlitev
00240000-5665-74ed-5f50-1e773044b0ea	00230000-5665-74ed-853f-a28df41513a1	zvrstuprizoritve
00240000-5665-74ed-0acd-9b273b104375	00230000-5665-74ed-2fe2-12dcfd043c71	programdela
00240000-5665-74ed-7fb6-16e00707f961	00230000-5665-74ed-853f-a28df41513a1	zapis
\.


--
-- TOC entry 3095 (class 0 OID 30996883)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
60245e9b-6130-49df-bb2a-f5dce4f1de61	00240000-5665-74ed-5063-21a1be8a778d	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 30997454)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5665-74f0-6dd9-030b37c54b59	000e0000-5665-74ef-748f-b14148a8d5c1	00080000-5665-74ef-a396-8e507ffb2fac	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5665-74ed-0613-e55c463d33b9
00270000-5665-74f0-4a47-4ce971d3636d	000e0000-5665-74ef-748f-b14148a8d5c1	00080000-5665-74ef-a396-8e507ffb2fac	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5665-74ed-0613-e55c463d33b9
\.


--
-- TOC entry 3111 (class 0 OID 30997031)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 30997283)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5665-74f0-390a-f2d352c267b0	00180000-5665-74f0-2626-d007c5fc4e2d	000c0000-5665-74f0-1512-fd57023100a9	00090000-5665-74ef-aa2c-79d33cfaf6ad	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-74f0-669b-19cb1f546cc2	00180000-5665-74f0-2626-d007c5fc4e2d	000c0000-5665-74f0-84b8-c788e395fb0d	00090000-5665-74ef-3106-b1a60512dee6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-74f0-cd2a-f084e2578cd5	00180000-5665-74f0-2626-d007c5fc4e2d	000c0000-5665-74f0-064a-3ccb080a7061	00090000-5665-74ef-a76c-188318ec6501	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-74f0-599a-606f417e04ad	00180000-5665-74f0-2626-d007c5fc4e2d	000c0000-5665-74f0-20a3-b63ebfaabd58	00090000-5665-74ef-3ec5-c7d0d13edf86	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-74f0-027b-80b89ad2abb5	00180000-5665-74f0-2626-d007c5fc4e2d	000c0000-5665-74f0-01ff-20edae3bc3e6	00090000-5665-74ef-6961-0ba27869b2e2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-74f0-74f9-7947bdc0b508	00180000-5665-74f0-0274-dcc6a13fe454	\N	00090000-5665-74ef-6961-0ba27869b2e2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5665-74f0-6598-11c4c6737f3a	00180000-5665-74f0-0274-dcc6a13fe454	\N	00090000-5665-74ef-3106-b1a60512dee6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 30997495)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5665-74ed-dd81-496764656ceb	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5665-74ed-1da3-c7956bce1912	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5665-74ed-bbd9-e3fde8dbfba8	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5665-74ed-a757-7fc83369e076	04	Režija	Režija	Režija	umetnik	30
000f0000-5665-74ed-6fff-e5ad1feba715	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5665-74ed-376a-332ee7933240	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5665-74ed-43c3-23fcc03491c5	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5665-74ed-a93c-cbe9a97ad3c9	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5665-74ed-2947-a818b671863d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5665-74ed-f497-14293f81abf6	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5665-74ed-7c1a-400b1d106ae8	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5665-74ed-758a-c321a22beada	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5665-74ed-2f9e-e26a880f43a0	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5665-74ed-50f4-2ae7187dff51	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5665-74ed-95a2-f4b3a441e574	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5665-74ed-b09a-fa2f85eee0e4	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5665-74ed-132c-e4b48c9456c5	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5665-74ed-7a61-f47c1bf4ff67	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 30996982)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5665-74ef-5494-1b24531f93c4	0001	šola	osnovna ali srednja šola
00400000-5665-74ef-d564-fa42f087b2fd	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5665-74ef-e6b1-302eb44420ce	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 30997790)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5665-74ed-2557-553e63979536	01	Velika predstava	f	1.00	1.00
002b0000-5665-74ed-d902-7ea838e946ee	02	Mala predstava	f	0.50	0.50
002b0000-5665-74ed-910d-25ffb530417d	03	Mala koprodukcija	t	0.40	1.00
002b0000-5665-74ed-78bf-1edde5f5c501	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5665-74ed-02ed-3d01850e0ba0	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 30997263)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5665-74ed-7b12-428ebac76dec	0001	prva vaja	prva vaja
00420000-5665-74ed-dc1b-006d89b95297	0002	tehnična vaja	tehnična vaja
00420000-5665-74ed-2ac6-2ffbf5dae387	0003	lučna vaja	lučna vaja
00420000-5665-74ed-bd45-d91420b77cba	0004	kostumska vaja	kostumska vaja
00420000-5665-74ed-8e76-d252859d096d	0005	foto vaja	foto vaja
00420000-5665-74ed-5024-a00dec3ac7cf	0006	1. glavna vaja	1. glavna vaja
00420000-5665-74ed-ef60-81007f78eed7	0007	2. glavna vaja	2. glavna vaja
00420000-5665-74ed-4728-d428e832dac6	0008	1. generalka	1. generalka
00420000-5665-74ed-95e1-2aa20fdc408e	0009	2. generalka	2. generalka
00420000-5665-74ed-1227-146b833fa2aa	0010	odprta generalka	odprta generalka
00420000-5665-74ed-4493-e224a84c5017	0011	obnovitvena vaja	obnovitvena vaja
00420000-5665-74ed-1867-6cbbc3ada8f0	0012	pevska vaja	pevska vaja
00420000-5665-74ed-7b40-af1d58f2c167	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5665-74ed-6ab4-5ed3b34f311f	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 30997104)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 30996918)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5665-74ee-5f9d-b3670820c606	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROqRf6vkGlECRwGn/4S/OxilLGpXyFw2q	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5665-74ef-132a-a207caae2ad8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5665-74ef-d5b3-9481d503d286	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5665-74ef-19a1-18688f95e4fb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5665-74ef-27b6-82911a9045aa	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5665-74ef-da29-d3b776d76066	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5665-74ef-56ce-1ba591e75655	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5665-74ef-3414-f5b12f43e4e6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5665-74ef-0544-a9e90e956955	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5665-74ef-2cb9-5c086f17a44a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5665-74ef-3391-37bebb0a7eb1	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5665-74ef-caf9-9adb1fd3893f	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5665-74ef-1415-f95870016d5c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5665-74ef-7715-fdba2271efd0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5665-74ef-5a31-68046da9391a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5665-74ef-9b82-43376b0d2d48	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5665-74ef-e63d-943dc3e9f86d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5665-74ef-a9be-b74bc02ff479	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5665-74ef-ce16-82f7efef28b1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5665-74ef-f1af-f49e0d683585	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5665-74ee-a552-77295fd9571e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 30997545)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5665-74ef-065b-9488aa0ec301	00160000-5665-74ef-d802-1a4a8ee7a6fb	\N	00140000-5665-74ed-6771-a8231eb945ba	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5665-74ef-0698-5b8353605c6e
000e0000-5665-74ef-748f-b14148a8d5c1	00160000-5665-74ef-13dc-bcaf09b26cfe	\N	00140000-5665-74ed-c771-c8bbc9c401a4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5665-74ef-5d61-dc6ebff64029
000e0000-5665-74ef-b8da-1f2891d3806a	\N	\N	00140000-5665-74ed-c771-c8bbc9c401a4	00190000-5665-74ef-ba12-bcaa30273bda	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5665-74ef-0698-5b8353605c6e
000e0000-5665-74ef-01a6-96a601d9f8cd	\N	\N	00140000-5665-74ed-c771-c8bbc9c401a4	00190000-5665-74ef-ba12-bcaa30273bda	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5665-74ef-0698-5b8353605c6e
000e0000-5665-74ef-bb02-3935513285bf	\N	\N	00140000-5665-74ed-c771-c8bbc9c401a4	00190000-5665-74ef-ba12-bcaa30273bda	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5665-74ef-3d09-b57d80334f7c
000e0000-5665-74ef-0466-e1f8823e8597	\N	\N	00140000-5665-74ed-c771-c8bbc9c401a4	00190000-5665-74ef-ba12-bcaa30273bda	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5665-74ef-3d09-b57d80334f7c
\.


--
-- TOC entry 3125 (class 0 OID 30997203)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5665-74ef-0414-672bbca9afd3	\N	000e0000-5665-74ef-748f-b14148a8d5c1	1	
00200000-5665-74ef-7732-3039a6c391ce	\N	000e0000-5665-74ef-748f-b14148a8d5c1	2	
00200000-5665-74ef-82f0-5aa410709c82	\N	000e0000-5665-74ef-748f-b14148a8d5c1	3	
00200000-5665-74ef-66df-0e2ba8f42402	\N	000e0000-5665-74ef-748f-b14148a8d5c1	4	
00200000-5665-74ef-0792-b59543396c60	\N	000e0000-5665-74ef-748f-b14148a8d5c1	5	
\.


--
-- TOC entry 3142 (class 0 OID 30997354)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 30997468)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5665-74ed-bdca-83417c49bec3	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5665-74ed-db0c-a39514d89f94	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5665-74ed-e69c-dbaabb641279	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5665-74ed-f9a0-7749701afeaf	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5665-74ed-abc6-1490b6c40f11	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5665-74ed-50c1-1592403d989b	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5665-74ed-2b93-a2e411755100	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5665-74ed-4e9d-19c9db92098e	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5665-74ed-0613-e55c463d33b9	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5665-74ed-6669-ed66c48253e8	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5665-74ed-1a8b-4fc757ef590d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5665-74ed-e5cb-ccd7bf5e5328	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5665-74ed-6921-92de28720bba	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5665-74ed-abce-ff3d2b23559d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5665-74ed-58f4-50cc70872380	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5665-74ed-dad4-d984abb7cead	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5665-74ed-a56a-a4a169c2894f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5665-74ed-70e2-19f6daf3c546	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5665-74ed-bcaf-5237af63e2b5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5665-74ed-9b5a-f0802352a583	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5665-74ed-a356-d9d4d6c454b4	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5665-74ed-6849-09e8a3875a72	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5665-74ed-3c6b-8bfe2d866bfd	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5665-74ed-b668-69a8c4d90140	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5665-74ed-d1d5-3d5a15ea29f2	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5665-74ed-9cd6-8b10a7a2415f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5665-74ed-ad8f-6a7ea08091e5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5665-74ed-1a21-91ea2a445afa	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 30997840)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 30997809)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 30997852)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 30997426)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5665-74ef-6e8d-4fa87682a533	00090000-5665-74ef-3106-b1a60512dee6	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-74ef-4eb2-27984fc13051	00090000-5665-74ef-a76c-188318ec6501	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-74ef-463e-46d68db0e37c	00090000-5665-74ef-2fb1-080b1e56d92f	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-74ef-9c90-4ad9692f1d99	00090000-5665-74ef-37ee-8016d8b8dd9c	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-74ef-7869-c798c886c808	00090000-5665-74ef-f157-5e36cda6a898	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-74ef-7481-77a0aa558439	00090000-5665-74ef-f1a7-a6f0cc5963e4	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 30997247)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 30997535)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5665-74ed-6771-a8231eb945ba	01	Drama	drama (SURS 01)
00140000-5665-74ed-f616-252d02900d01	02	Opera	opera (SURS 02)
00140000-5665-74ed-eea7-25cee17c4465	03	Balet	balet (SURS 03)
00140000-5665-74ed-c119-43b76b968300	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5665-74ed-61dd-a9d4b7567434	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5665-74ed-c771-c8bbc9c401a4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5665-74ed-e25a-f7cbbf4a7dbf	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 30997416)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 30996981)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 30997594)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 30997584)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 30996972)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 30997451)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 30997493)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 30997893)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 30997235)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 30997257)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 30997262)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 30997807)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 30997130)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 30997663)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 30997412)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 30997201)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 30997168)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 30997144)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 30997319)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 30997870)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 30997877)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 30997901)
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
-- TOC entry 2728 (class 2606 OID 30997346)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 30997102)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 30997000)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 30997064)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 30997027)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 30996961)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 30996946)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 30997352)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 30997388)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 30997530)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 30997055)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 30997090)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 30997758)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 30997325)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 30997080)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 30997220)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 30997189)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 30997181)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 30997337)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30997767)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 30997775)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 30997745)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 30997788)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 30997370)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 30997310)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 30997301)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 30997517)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 30997444)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 30997156)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 30996917)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 30997379)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 30996935)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 30996955)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 30997397)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 30997332)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 30997281)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 30996905)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 30996893)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 30996887)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 30997464)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 30997036)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 30997292)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 30997504)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 30996989)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 30997800)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 30997270)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 30997115)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 30996930)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 30997563)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 30997210)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 30997360)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 30997476)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 30997850)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 30997834)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 30997858)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 30997434)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 30997251)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 30997543)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 30997424)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 30997245)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 30997246)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 30997244)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 30997243)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 30997242)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 30997465)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 30997466)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 30997467)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 30997872)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 30997871)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 30997057)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 30997058)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 30997353)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 30997838)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 30997837)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 30997839)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 30997836)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 30997835)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 30997339)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 30997338)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 30997211)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 30997212)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 30997413)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 30997415)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 30997414)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 30997146)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 30997145)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 30997789)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 30997532)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 30997533)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 30997534)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 30997859)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 30997568)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 30997565)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 30997569)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 30997567)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 30997566)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 30997117)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 30997116)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 30997030)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 30997380)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 30996962)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 30996963)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 30997400)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 30997399)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 30997398)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 30997067)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 30997066)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 30997068)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 30997184)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 30997182)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 30997183)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 30996895)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 30997305)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 30997303)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 30997302)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 30997304)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 30996936)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 30996937)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 30997361)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 30997894)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 30997453)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 30997452)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 30997902)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 30997903)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 30997326)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 30997445)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 30997446)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 30997668)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 30997667)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 30997664)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 30997665)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 30997666)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 30997082)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 30997081)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 30997083)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 30997374)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 30997373)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 30997768)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 30997769)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 30997598)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 30997599)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 30997596)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 30997597)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 30997435)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 30997436)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 30997314)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 30997313)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 30997311)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 30997312)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 30997586)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 30997585)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 30997157)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 30997171)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 30997170)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 30997169)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 30997172)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 30997202)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 30997190)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 30997191)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 30997759)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 30997808)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 30997878)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 30997879)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 30997002)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 30997001)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 30997037)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 30997038)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 30997252)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 30997295)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 30997294)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 30997293)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 30997237)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 30997238)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 30997241)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 30997236)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 30997240)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 30997239)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 30997056)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 30996990)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 30996991)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 30997131)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 30997133)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 30997132)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 30997134)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 30997320)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 30997531)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 30997564)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 30997505)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 30997506)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 30997028)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 30997029)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 30997425)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 30996906)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 30997103)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 30997065)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 30996894)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 30997801)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 30997372)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 30997371)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 30997271)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 30997272)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 30997595)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 30997091)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 30997544)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 30997851)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 30997776)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 30997777)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 30997494)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 30997282)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 30996956)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2906 (class 2606 OID 30998074)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2907 (class 2606 OID 30998079)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2912 (class 2606 OID 30998104)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2910 (class 2606 OID 30998094)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2905 (class 2606 OID 30998069)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2909 (class 2606 OID 30998089)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2911 (class 2606 OID 30998099)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2908 (class 2606 OID 30998084)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 30998274)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 30998279)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 30998284)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 30998449)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2980 (class 2606 OID 30998444)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2883 (class 2606 OID 30997959)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2884 (class 2606 OID 30997964)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 30998189)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2977 (class 2606 OID 30998429)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 30998424)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 30998434)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 30998419)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2974 (class 2606 OID 30998414)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2928 (class 2606 OID 30998184)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2927 (class 2606 OID 30998179)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2903 (class 2606 OID 30998059)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2904 (class 2606 OID 30998064)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 30998229)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 30998239)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 30998234)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2894 (class 2606 OID 30998014)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 30998009)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 30998169)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 30998404)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 30998289)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 30998294)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2951 (class 2606 OID 30998299)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 30998439)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2955 (class 2606 OID 30998319)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2952 (class 2606 OID 30998304)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2956 (class 2606 OID 30998324)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 30998314)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 30998309)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2892 (class 2606 OID 30998004)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 30997999)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2880 (class 2606 OID 30997944)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2879 (class 2606 OID 30997939)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 30998209)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2875 (class 2606 OID 30997919)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2876 (class 2606 OID 30997924)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2936 (class 2606 OID 30998224)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 30998219)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 30998214)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 30997974)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 30997969)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2887 (class 2606 OID 30997979)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2899 (class 2606 OID 30998039)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 30998029)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 30998034)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 30997904)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2920 (class 2606 OID 30998144)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2918 (class 2606 OID 30998134)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2917 (class 2606 OID 30998129)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2919 (class 2606 OID 30998139)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 30997909)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2874 (class 2606 OID 30997914)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 30998194)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 30998464)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2945 (class 2606 OID 30998269)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 30998264)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2985 (class 2606 OID 30998469)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2986 (class 2606 OID 30998474)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 30998174)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2942 (class 2606 OID 30998254)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2943 (class 2606 OID 30998259)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 30998379)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 30998374)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2963 (class 2606 OID 30998359)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 30998364)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 30998369)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 30997989)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 30997984)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 30997994)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2932 (class 2606 OID 30998204)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2931 (class 2606 OID 30998199)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2969 (class 2606 OID 30998389)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2970 (class 2606 OID 30998394)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2961 (class 2606 OID 30998349)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2962 (class 2606 OID 30998354)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2959 (class 2606 OID 30998339)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2960 (class 2606 OID 30998344)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2940 (class 2606 OID 30998244)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 30998249)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 30998164)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2923 (class 2606 OID 30998159)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2921 (class 2606 OID 30998149)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2922 (class 2606 OID 30998154)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2958 (class 2606 OID 30998334)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 30998329)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 30998019)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 30998024)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 30998054)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2900 (class 2606 OID 30998044)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2901 (class 2606 OID 30998049)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 30998384)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 30998399)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 30998409)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2982 (class 2606 OID 30998454)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2983 (class 2606 OID 30998459)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2878 (class 2606 OID 30997934)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 30997929)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2881 (class 2606 OID 30997949)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2882 (class 2606 OID 30997954)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 30998109)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 30998124)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 30998119)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 30998114)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-07 13:00:51 CET

--
-- PostgreSQL database dump complete
--

