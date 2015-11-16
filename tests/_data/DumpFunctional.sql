--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-16 17:25:45 CET

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
-- TOC entry 183 (class 1259 OID 27341409)
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
-- TOC entry 237 (class 1259 OID 27342023)
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
-- TOC entry 236 (class 1259 OID 27342006)
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
-- TOC entry 182 (class 1259 OID 27341402)
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
-- TOC entry 181 (class 1259 OID 27341400)
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
-- TOC entry 227 (class 1259 OID 27341883)
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
-- TOC entry 230 (class 1259 OID 27341913)
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
-- TOC entry 251 (class 1259 OID 27342314)
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
-- TOC entry 203 (class 1259 OID 27341657)
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
-- TOC entry 205 (class 1259 OID 27341689)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 27341694)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 27342236)
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
-- TOC entry 194 (class 1259 OID 27341554)
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
-- TOC entry 238 (class 1259 OID 27342036)
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
-- TOC entry 223 (class 1259 OID 27341837)
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
-- TOC entry 200 (class 1259 OID 27341628)
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
-- TOC entry 197 (class 1259 OID 27341594)
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
-- TOC entry 195 (class 1259 OID 27341571)
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
-- TOC entry 212 (class 1259 OID 27341751)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 27342294)
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
-- TOC entry 250 (class 1259 OID 27342307)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 27342329)
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
-- TOC entry 216 (class 1259 OID 27341776)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 27341528)
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
-- TOC entry 185 (class 1259 OID 27341428)
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
-- TOC entry 189 (class 1259 OID 27341495)
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
-- TOC entry 186 (class 1259 OID 27341439)
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
-- TOC entry 178 (class 1259 OID 27341374)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 27341393)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 27341783)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 27341817)
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
-- TOC entry 233 (class 1259 OID 27341954)
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
-- TOC entry 188 (class 1259 OID 27341475)
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
-- TOC entry 191 (class 1259 OID 27341520)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 27342181)
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
-- TOC entry 213 (class 1259 OID 27341757)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 27341505)
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
-- TOC entry 202 (class 1259 OID 27341649)
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
-- TOC entry 198 (class 1259 OID 27341609)
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
-- TOC entry 199 (class 1259 OID 27341621)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 27341769)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 27342195)
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
-- TOC entry 242 (class 1259 OID 27342205)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 27342104)
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
-- TOC entry 243 (class 1259 OID 27342213)
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
-- TOC entry 219 (class 1259 OID 27341798)
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
-- TOC entry 211 (class 1259 OID 27341742)
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
-- TOC entry 210 (class 1259 OID 27341732)
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
-- TOC entry 232 (class 1259 OID 27341943)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 27341873)
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
-- TOC entry 196 (class 1259 OID 27341583)
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
-- TOC entry 175 (class 1259 OID 27341345)
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
-- TOC entry 174 (class 1259 OID 27341343)
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
-- TOC entry 220 (class 1259 OID 27341811)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 27341383)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 27341367)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 27341825)
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
-- TOC entry 214 (class 1259 OID 27341763)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 27341709)
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
-- TOC entry 173 (class 1259 OID 27341332)
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
-- TOC entry 172 (class 1259 OID 27341324)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 27341319)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 27341890)
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
-- TOC entry 187 (class 1259 OID 27341467)
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
-- TOC entry 209 (class 1259 OID 27341719)
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
-- TOC entry 231 (class 1259 OID 27341931)
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
-- TOC entry 184 (class 1259 OID 27341418)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 27342224)
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
-- TOC entry 207 (class 1259 OID 27341699)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 27341540)
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
-- TOC entry 176 (class 1259 OID 27341354)
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
-- TOC entry 235 (class 1259 OID 27341981)
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
-- TOC entry 201 (class 1259 OID 27341639)
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
-- TOC entry 218 (class 1259 OID 27341790)
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
-- TOC entry 229 (class 1259 OID 27341904)
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
-- TOC entry 247 (class 1259 OID 27342274)
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
-- TOC entry 246 (class 1259 OID 27342243)
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
-- TOC entry 248 (class 1259 OID 27342286)
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
-- TOC entry 225 (class 1259 OID 27341862)
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
-- TOC entry 204 (class 1259 OID 27341683)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 27341971)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 27341852)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 27341405)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 27341348)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 27341409)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-564a-0385-7041-47e29f08f5da	10	30	Otroci	Abonma za otroke	200
000a0000-564a-0385-30e0-4415ac824af7	20	60	Mladina	Abonma za mladino	400
000a0000-564a-0385-693c-07f24908d524	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 27342023)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-564a-0385-81ff-27cb2110dfe1	000d0000-564a-0385-366d-8ad14895ed66	\N	00090000-564a-0385-2757-9a8670aa26f5	000b0000-564a-0385-9b57-01f4f66a2cda	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-564a-0385-4143-ae160998dea8	000d0000-564a-0385-f858-4766a45ba1e6	00100000-564a-0385-59e8-f3125afab03b	00090000-564a-0385-9d8a-47a0e783af07	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-564a-0385-7f68-b1fce8aa560b	000d0000-564a-0385-04fc-ecff6b376df9	00100000-564a-0385-9f44-a3695883f429	00090000-564a-0385-a99f-09a514eb56ac	\N	0003	t	\N	2015-11-16	\N	2	t	\N	f	f
000c0000-564a-0385-5412-52e14ddd411a	000d0000-564a-0385-7ee3-96a555deb8b3	\N	00090000-564a-0385-b96b-2f87f162cae4	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-564a-0385-74cf-1862b8615595	000d0000-564a-0385-40c3-b1c38927b95e	\N	00090000-564a-0385-d7ac-3ff66c625bd6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-564a-0385-e2fc-fa3fa4716316	000d0000-564a-0385-2b75-f1aa13df2927	\N	00090000-564a-0385-a32e-611242f11fc8	000b0000-564a-0385-8f40-0eeef650db58	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-564a-0386-56d4-46397bc56f69	000d0000-564a-0385-c22f-05ffe17be455	00100000-564a-0385-ec42-029b374abef2	00090000-564a-0385-b6fc-fb1ca2a972db	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-564a-0386-2157-31f8e685667e	000d0000-564a-0385-7d78-43d188b4278b	\N	00090000-564a-0385-4ac1-8d1a10ab4e69	000b0000-564a-0385-819e-b79a2acd9dd5	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-564a-0386-81b8-c1babb0efaf5	000d0000-564a-0385-c22f-05ffe17be455	00100000-564a-0385-6def-cfcc0563a844	00090000-564a-0385-d2a9-779648433ad5	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-564a-0386-e657-e43ed1578637	000d0000-564a-0385-c22f-05ffe17be455	00100000-564a-0385-5b15-3bfd682a7ee8	00090000-564a-0385-8c04-4217c0a26883	\N	0010	t	\N	2015-11-16	\N	16	f	\N	f	t
000c0000-564a-0386-9a6f-65dcb711cccf	000d0000-564a-0385-c22f-05ffe17be455	00100000-564a-0385-66af-238c616b83b6	00090000-564a-0385-2fca-4dede6474f9e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-564a-0386-4402-1f07700daa07	000d0000-564a-0385-52c5-f0a131b81f4e	00100000-564a-0385-59e8-f3125afab03b	00090000-564a-0385-9d8a-47a0e783af07	000b0000-564a-0385-aab5-fc17ebda1518	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 27342006)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 27341402)
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
-- TOC entry 3149 (class 0 OID 27341883)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-564a-0385-9aa2-a31de35ff478	00160000-564a-0385-6da7-ec1e0565e577	00090000-564a-0385-0fd0-daf682c2ffb1	aizv	10	t
003d0000-564a-0385-843d-d92d1039fa4c	00160000-564a-0385-6da7-ec1e0565e577	00090000-564a-0385-ddb9-574c6caf1a27	apri	14	t
003d0000-564a-0385-7a77-d013b7bef18a	00160000-564a-0385-5fdf-7c62f168f288	00090000-564a-0385-61b6-463648f7eb9e	aizv	11	t
003d0000-564a-0385-2d7b-e44700dc8b02	00160000-564a-0385-ebc6-800ac1d921ca	00090000-564a-0385-b86d-f59fbe093a28	aizv	12	t
003d0000-564a-0385-eaa0-2814f1471a4e	00160000-564a-0385-6da7-ec1e0565e577	00090000-564a-0385-6d5e-5edff10368d1	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 27341913)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-564a-0385-6da7-ec1e0565e577	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-564a-0385-5fdf-7c62f168f288	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-564a-0385-ebc6-800ac1d921ca	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 27342314)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 27341657)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-564a-0385-d5c1-7770647d3123	\N	\N	00200000-564a-0385-b6bb-d4aa787f079b	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-564a-0385-bf5b-726bc5ce802e	\N	\N	00200000-564a-0385-2c9f-f247d935a1c2	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-564a-0385-81ea-b2910ba827b0	\N	\N	00200000-564a-0385-bd50-fc6c4d08964d	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-564a-0385-6fbf-3e7d8d570425	\N	\N	00200000-564a-0385-0e98-0af373637711	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-564a-0385-f03a-ca9575bb68b7	\N	\N	00200000-564a-0385-206a-c8088fd7e31a	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 27341689)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 27341694)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 27342236)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 27341554)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-564a-0383-176f-497dc4c40252	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-564a-0383-9de6-351f080a9dfb	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-564a-0383-8dcf-ed58b405187d	AL	ALB	008	Albania 	Albanija	\N
00040000-564a-0383-775b-6c1f238f8cbf	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-564a-0383-fdd3-227ece4f67eb	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-564a-0383-b35f-0e5cad016bbf	AD	AND	020	Andorra 	Andora	\N
00040000-564a-0383-cb0f-068c65226b81	AO	AGO	024	Angola 	Angola	\N
00040000-564a-0383-98f1-2c5b73bfce9f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-564a-0383-6865-99939ac848d0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-564a-0383-0a16-2ca1fd322884	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-564a-0383-174f-eef6cf14b5d5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-564a-0383-3df0-3c6dacd7d042	AM	ARM	051	Armenia 	Armenija	\N
00040000-564a-0383-3a96-f7f0efabb936	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-564a-0383-cfc7-7c423d61c7d1	AU	AUS	036	Australia 	Avstralija	\N
00040000-564a-0383-c71c-b9127c97745a	AT	AUT	040	Austria 	Avstrija	\N
00040000-564a-0383-a22b-b981c1ea711d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-564a-0383-cf60-064f0dce181a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-564a-0383-0fa9-5700553f7718	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-564a-0383-d504-9554624ad539	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-564a-0383-93ce-aeb89bbf8f28	BB	BRB	052	Barbados 	Barbados	\N
00040000-564a-0383-663c-8597ce2ef913	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-564a-0383-fe1f-51833e86c85e	BE	BEL	056	Belgium 	Belgija	\N
00040000-564a-0383-b6cf-0db7c1df8462	BZ	BLZ	084	Belize 	Belize	\N
00040000-564a-0383-305d-be52f1395078	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-564a-0383-2504-37b6265bee3a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-564a-0383-968b-cf077568dbbd	BT	BTN	064	Bhutan 	Butan	\N
00040000-564a-0383-18aa-7413ca7844e2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-564a-0383-3122-5eca52e51f3e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-564a-0383-80eb-2fefcd6b4ccd	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-564a-0383-1bd0-1f129986766c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-564a-0383-b28a-327c3d4b21a8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-564a-0383-13f6-aac6b7bfafe6	BR	BRA	076	Brazil 	Brazilija	\N
00040000-564a-0383-f8e8-f6ec52d552b4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-564a-0383-81dd-42968a59fa3d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-564a-0383-9570-b13d9ab1abc5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-564a-0383-3684-21178cc17761	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-564a-0383-ea81-15a768da338a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-564a-0383-7f48-19caac882765	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-564a-0383-a7e3-6929cd28896e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-564a-0383-8454-c2c5c0a6e278	CA	CAN	124	Canada 	Kanada	\N
00040000-564a-0383-d4b4-4aa987d9c7d1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-564a-0383-de67-1b0d2acad6f0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-564a-0383-4b92-e73832c320b3	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-564a-0383-fa14-df44826ab75f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-564a-0383-c7ca-f4a1ed0f43b5	CL	CHL	152	Chile 	Čile	\N
00040000-564a-0383-3678-28d5f8c461e4	CN	CHN	156	China 	Kitajska	\N
00040000-564a-0383-3060-515fd6e48185	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-564a-0383-f4d4-e5f487d204c5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-564a-0383-b55a-aa8e8922b58f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-564a-0383-ec76-7cd5e4dd6478	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-564a-0383-f7d6-5033479a4e78	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-564a-0383-5dd1-f676beea1869	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-564a-0383-de13-6b4cf1373548	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-564a-0383-72b2-0f9891cdd3d4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-564a-0383-729a-55726ec5ee6b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-564a-0383-cd57-3c867b8217d7	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-564a-0383-5b9e-4de3e38360ba	CU	CUB	192	Cuba 	Kuba	\N
00040000-564a-0383-0b22-30e1fd0f5d09	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-564a-0383-226a-2c3e0693b4be	CY	CYP	196	Cyprus 	Ciper	\N
00040000-564a-0383-687e-7f82d11b3766	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-564a-0383-f32e-67dd85e3ed23	DK	DNK	208	Denmark 	Danska	\N
00040000-564a-0383-5e84-20c7732b66b5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-564a-0383-7c19-0bb528a81dfe	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-564a-0383-389f-326276756d12	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-564a-0383-efb2-50ec3aef1dfb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-564a-0383-3639-7163e6cdc95d	EG	EGY	818	Egypt 	Egipt	\N
00040000-564a-0383-d8a9-7a25bb4ffa74	SV	SLV	222	El Salvador 	Salvador	\N
00040000-564a-0383-4f54-a8defa0f042a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-564a-0383-792f-6996a58954e2	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-564a-0383-e9d9-4860e9ca5a6f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-564a-0383-1a91-b164f3e93d87	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-564a-0383-82d6-f34fb1e3d9e7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-564a-0383-d191-bdc665e36a2d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-564a-0383-a18c-f23df3d9ba51	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-564a-0383-c6a1-68550866d83a	FI	FIN	246	Finland 	Finska	\N
00040000-564a-0383-379f-cca0e3fe86d0	FR	FRA	250	France 	Francija	\N
00040000-564a-0383-a673-be195efaf867	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-564a-0383-129b-00aadcdf5ae8	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-564a-0383-f141-c9c6eb20c899	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-564a-0383-7b63-49ed6443834f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-564a-0383-14fe-672775195b42	GA	GAB	266	Gabon 	Gabon	\N
00040000-564a-0383-1c3f-1f6f165f0108	GM	GMB	270	Gambia 	Gambija	\N
00040000-564a-0383-d802-3de9df3c6cc8	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-564a-0383-b96e-d7120f689deb	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-564a-0383-f2e9-95a4acb55e35	GH	GHA	288	Ghana 	Gana	\N
00040000-564a-0383-d292-e8d4aafd2517	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-564a-0383-9e75-eb3460e1d05d	GR	GRC	300	Greece 	Grčija	\N
00040000-564a-0383-771a-7d541bd269f8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-564a-0383-6b82-e3668a7fda0c	GD	GRD	308	Grenada 	Grenada	\N
00040000-564a-0383-c25f-e61a4d421506	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-564a-0383-e9d2-8b9c08b52d04	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-564a-0383-213d-3fdc84fc0140	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-564a-0383-61ac-00a90abcc316	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-564a-0383-67fb-a9d6c54452fa	GN	GIN	324	Guinea 	Gvineja	\N
00040000-564a-0383-8fc3-f699672d1541	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-564a-0383-1793-8e9d579817be	GY	GUY	328	Guyana 	Gvajana	\N
00040000-564a-0383-4e27-e08e40adeb00	HT	HTI	332	Haiti 	Haiti	\N
00040000-564a-0383-4dec-ce61e116b136	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-564a-0383-4c92-dba252fc807b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-564a-0383-0805-12f27161e999	HN	HND	340	Honduras 	Honduras	\N
00040000-564a-0383-dff9-0fec71baa988	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-564a-0383-a0f2-26cbee50832e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-564a-0383-5cae-6227d9293a41	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-564a-0383-e808-2db8cd537bc5	IN	IND	356	India 	Indija	\N
00040000-564a-0383-4d11-85e501e81f02	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-564a-0383-a698-87fc4a1e308a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-564a-0383-4747-3510668023c3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-564a-0383-4096-ea93c2c8f225	IE	IRL	372	Ireland 	Irska	\N
00040000-564a-0383-1083-099414f287a6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-564a-0383-641e-2702663b42bb	IL	ISR	376	Israel 	Izrael	\N
00040000-564a-0383-85d8-3742e1bda08f	IT	ITA	380	Italy 	Italija	\N
00040000-564a-0383-7532-e6a7b4ef8d16	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-564a-0383-dd69-42ffee0cb143	JP	JPN	392	Japan 	Japonska	\N
00040000-564a-0383-01c9-d25b0c41c8ff	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-564a-0383-8890-f1dfbcaeb45c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-564a-0383-f278-5d69468bdb4c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-564a-0383-6315-6272c39ba6a4	KE	KEN	404	Kenya 	Kenija	\N
00040000-564a-0383-2369-015234e67a4a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-564a-0383-77fa-c9f61246fb61	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-564a-0383-90c0-724275c9009b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-564a-0383-9dba-bcf5126c8d11	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-564a-0383-65dd-07fdebf8cac4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-564a-0383-8e1a-06828df81184	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-564a-0383-36db-5bfd1b90cfdd	LV	LVA	428	Latvia 	Latvija	\N
00040000-564a-0383-81e0-fb2a66482e07	LB	LBN	422	Lebanon 	Libanon	\N
00040000-564a-0383-a65b-1f811538f4ba	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-564a-0383-3464-baa209062b6a	LR	LBR	430	Liberia 	Liberija	\N
00040000-564a-0383-1781-055dce3b6bed	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-564a-0383-5292-cffd4d7bea5c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-564a-0383-ceae-8c961b6511bc	LT	LTU	440	Lithuania 	Litva	\N
00040000-564a-0383-d8f1-079e62a55a61	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-564a-0383-04ca-18826e3fb967	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-564a-0383-6854-5565757ed124	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-564a-0383-9d51-2e5aa4928584	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-564a-0383-c625-13ab569c815c	MW	MWI	454	Malawi 	Malavi	\N
00040000-564a-0383-98c7-1cf484a74f5b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-564a-0383-c4f4-307a6259ed70	MV	MDV	462	Maldives 	Maldivi	\N
00040000-564a-0383-d6d2-0c27fe1f256d	ML	MLI	466	Mali 	Mali	\N
00040000-564a-0383-f41a-5ec387a0af74	MT	MLT	470	Malta 	Malta	\N
00040000-564a-0383-c664-241464042aac	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-564a-0383-51f9-19f8bb731c1d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-564a-0383-a1f8-8f13f3269065	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-564a-0383-81ed-15f3ede2f33e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-564a-0383-b65a-cacddeba62f2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-564a-0383-edb1-b4ea2e6e0481	MX	MEX	484	Mexico 	Mehika	\N
00040000-564a-0383-1b6c-6153e37d485a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-564a-0383-3b83-04752e7c19e0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-564a-0383-0526-140b9fe6b803	MC	MCO	492	Monaco 	Monako	\N
00040000-564a-0383-b402-c6a8cd2933ce	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-564a-0383-3cc5-758d98a2f352	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-564a-0383-31f2-6fa9c793d96c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-564a-0383-6cd2-297cf3a866e5	MA	MAR	504	Morocco 	Maroko	\N
00040000-564a-0383-ae21-66edc8e8bcca	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-564a-0383-2151-b7b70a101d2a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-564a-0383-1bb3-f7bbf122fd32	NA	NAM	516	Namibia 	Namibija	\N
00040000-564a-0383-cbf8-151d78db0992	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-564a-0383-b9e4-6cf7d2682652	NP	NPL	524	Nepal 	Nepal	\N
00040000-564a-0383-6c45-8e591174be5a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-564a-0383-c8ae-ff2483996046	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-564a-0383-baad-64e458627ec6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-564a-0383-a52a-98d84bbb927c	NE	NER	562	Niger 	Niger 	\N
00040000-564a-0383-a3d5-f6b04263b36c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-564a-0383-36cd-d6ba66c454fe	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-564a-0383-0391-029fbd1aeb57	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-564a-0383-789d-56b462d61dfe	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-564a-0383-58c1-3272c2f4d24e	NO	NOR	578	Norway 	Norveška	\N
00040000-564a-0383-aa53-3e2c704d4bf0	OM	OMN	512	Oman 	Oman	\N
00040000-564a-0383-809b-e6335d89deef	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-564a-0383-9a8b-e59662fe556e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-564a-0383-39f4-ab15c4a37212	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-564a-0383-0c21-992208399c46	PA	PAN	591	Panama 	Panama	\N
00040000-564a-0383-364a-0dd5a83856fa	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-564a-0383-805d-50f758bb6344	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-564a-0383-fffd-1840112aa45b	PE	PER	604	Peru 	Peru	\N
00040000-564a-0383-dfa3-9415822d54e8	PH	PHL	608	Philippines 	Filipini	\N
00040000-564a-0383-5b36-4cd8ab5e4691	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-564a-0383-ee2a-bd24f88fe220	PL	POL	616	Poland 	Poljska	\N
00040000-564a-0383-d032-9885b91cb59a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-564a-0383-5b33-a81bdbf7145c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-564a-0383-977d-9dca30c9a4fa	QA	QAT	634	Qatar 	Katar	\N
00040000-564a-0383-1747-a7965aa5fb33	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-564a-0383-4703-d5a247984f37	RO	ROU	642	Romania 	Romunija	\N
00040000-564a-0383-2358-008594cdf02c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-564a-0383-401e-ca60c9685505	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-564a-0383-a1ea-5834794cb5c3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-564a-0383-82e4-0195c613ff63	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-564a-0383-ae4c-cf69b97fa05f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-564a-0383-7b0e-bab5db2a3c2e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-564a-0383-dada-880419f8315b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-564a-0383-541e-48b9d93002b4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-564a-0383-1067-fde6407107ef	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-564a-0383-8432-48c03ccaecc4	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-564a-0383-dfb0-3de1f6e17f14	SM	SMR	674	San Marino 	San Marino	\N
00040000-564a-0383-314f-83b3528d46a3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-564a-0383-d7bd-4c29b80b26df	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-564a-0383-584f-95036a5d894c	SN	SEN	686	Senegal 	Senegal	\N
00040000-564a-0383-4459-757d0017b6aa	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-564a-0383-d998-a420897a0f43	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-564a-0383-1683-3b3789d2868a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-564a-0383-fd7e-0a52fec795a3	SG	SGP	702	Singapore 	Singapur	\N
00040000-564a-0383-e2a9-1a4578b6946b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-564a-0383-34d2-c08e0a4f595a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-564a-0383-e6f9-356610cf1e58	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-564a-0383-6d7c-8c20618b98af	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-564a-0383-fa27-1695cd193d72	SO	SOM	706	Somalia 	Somalija	\N
00040000-564a-0383-642f-f6d7903a3bef	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-564a-0383-41a4-b8bce9e68619	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-564a-0383-c4d1-703172e56df3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-564a-0383-c2e9-9323f5c41409	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-564a-0383-3eb3-1518840628e6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-564a-0383-352b-3e4abe337309	SD	SDN	729	Sudan 	Sudan	\N
00040000-564a-0383-566b-201b126c3e1c	SR	SUR	740	Suriname 	Surinam	\N
00040000-564a-0383-8857-2b7589fd07a2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-564a-0383-9b01-1be0722ef00b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-564a-0383-ef20-0583e9defa95	SE	SWE	752	Sweden 	Švedska	\N
00040000-564a-0383-fe73-4db7cafc62ba	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-564a-0383-7148-e5984efd0305	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-564a-0383-67a8-d2a5e06e82be	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-564a-0383-ddd5-1c73786b06ee	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-564a-0383-a23d-8fe3ea80b2c7	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-564a-0383-9d0b-ac868d910647	TH	THA	764	Thailand 	Tajska	\N
00040000-564a-0383-8078-2e73936480b8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-564a-0383-47a0-89aa2c2342ad	TG	TGO	768	Togo 	Togo	\N
00040000-564a-0383-4730-e69bd6aaa54b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-564a-0383-48c8-bfe4737e4a81	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-564a-0383-5a02-7c88d4c13932	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-564a-0383-afb4-6484e315508f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-564a-0383-51a6-bda9ac14f487	TR	TUR	792	Turkey 	Turčija	\N
00040000-564a-0383-fe56-3c79619bdec3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-564a-0383-470a-a7e714dcd293	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564a-0383-b666-2af794824e7d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-564a-0383-a299-d4a8e533e947	UG	UGA	800	Uganda 	Uganda	\N
00040000-564a-0383-bcfa-a8c45bd85640	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-564a-0383-00da-64c66626e773	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-564a-0383-3ae1-bba0a302d6ef	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-564a-0383-bc9e-0abf47dbb982	US	USA	840	United States 	Združene države Amerike	\N
00040000-564a-0383-b0e0-f4aabeeb7dd1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-564a-0383-bcae-ec3e42fed98e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-564a-0383-80cc-1d0813e9f3c4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-564a-0383-b92c-ab01c7ac07e1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-564a-0383-5097-8ba210386bee	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-564a-0383-33ce-aa7b3c7e96d0	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-564a-0383-20e4-3ca03d025dde	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-564a-0383-25f8-d426561ad9ce	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-564a-0383-32d1-bd6204fb1b9f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-564a-0383-ce99-e72d8a7df574	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-564a-0383-28f8-df75092b11c7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-564a-0383-fc16-aed3c8902cad	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-564a-0383-bd51-b07e6ede2a77	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 27342036)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-564a-0385-0856-991126d3b130	000e0000-564a-0385-01ba-f577bf6f7522	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564a-0383-2322-2e64dfc9aa41	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564a-0385-998d-f72fe5db0fb2	000e0000-564a-0385-7c06-12e7504705ab	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564a-0383-bee0-9ced17150cfb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-564a-0385-fb05-1636aeab3e0c	000e0000-564a-0385-83b7-e42e7f1027e5	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-564a-0383-2322-2e64dfc9aa41	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564a-0385-3a2d-1479ee70c642	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-564a-0385-490d-bad24d0ae1e6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 27341837)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-564a-0385-c22f-05ffe17be455	000e0000-564a-0385-7c06-12e7504705ab	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-564a-0383-ac35-de25a8ce155e
000d0000-564a-0385-366d-8ad14895ed66	000e0000-564a-0385-7c06-12e7504705ab	000c0000-564a-0385-81ff-27cb2110dfe1	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-564a-0383-ac35-de25a8ce155e
000d0000-564a-0385-f858-4766a45ba1e6	000e0000-564a-0385-7c06-12e7504705ab	000c0000-564a-0385-4143-ae160998dea8	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-564a-0383-87ed-c1c73563fd77
000d0000-564a-0385-04fc-ecff6b376df9	000e0000-564a-0385-7c06-12e7504705ab	000c0000-564a-0385-7f68-b1fce8aa560b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-564a-0383-9bbc-d014a4eac8f7
000d0000-564a-0385-7ee3-96a555deb8b3	000e0000-564a-0385-7c06-12e7504705ab	000c0000-564a-0385-5412-52e14ddd411a	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-564a-0383-dc6a-0c50406faa43
000d0000-564a-0385-40c3-b1c38927b95e	000e0000-564a-0385-7c06-12e7504705ab	000c0000-564a-0385-74cf-1862b8615595	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-564a-0383-dc6a-0c50406faa43
000d0000-564a-0385-2b75-f1aa13df2927	000e0000-564a-0385-7c06-12e7504705ab	000c0000-564a-0385-e2fc-fa3fa4716316	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-564a-0383-ac35-de25a8ce155e
000d0000-564a-0385-7d78-43d188b4278b	000e0000-564a-0385-7c06-12e7504705ab	000c0000-564a-0386-2157-31f8e685667e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-564a-0383-21e9-365a1dd2467d
000d0000-564a-0385-52c5-f0a131b81f4e	000e0000-564a-0385-7c06-12e7504705ab	000c0000-564a-0386-4402-1f07700daa07	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-564a-0383-45ff-dbf90584bac9
\.


--
-- TOC entry 3122 (class 0 OID 27341628)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 27341594)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 27341571)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-564a-0385-7537-cd87bacdb6f1	00080000-564a-0385-435e-67f6ce1a64d0	00090000-564a-0385-8c04-4217c0a26883	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 27341751)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 27342294)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-564a-0385-f7ac-818ce9419fdd	00010000-564a-0384-8785-e6e7dd3b688b	\N	Prva mapa	Root mapa	2015-11-16 17:25:41	2015-11-16 17:25:41	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 27342307)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 27342329)
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
-- TOC entry 3138 (class 0 OID 27341776)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 27341528)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-564a-0384-eecc-a34277900aa1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-564a-0384-144c-84ec11f10227	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-564a-0384-477f-e9bb8b8079b1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-564a-0384-eecb-7be7d796b6bd	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-564a-0384-b0b0-db6ade7151dd	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-564a-0384-a8a3-427234510185	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-564a-0384-8815-058523e843b5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-564a-0384-aa6f-3561e7ffa4a5	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564a-0384-eb67-9c21a3205dc4	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-564a-0384-902b-3e7d8a1d1175	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-564a-0384-c2f5-a888dedc80c4	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-564a-0384-5447-5168d0246428	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-564a-0384-8329-0770c89406ea	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-564a-0384-6dbd-33c0e11b2462	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-564a-0385-65c1-c462ad2a4136	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-564a-0385-a2ac-903956e61600	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-564a-0385-0423-a2c54df3678b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-564a-0385-0d6a-21249d119a26	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-564a-0385-6835-4258d80db6bb	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-564a-0387-07a7-4eee86fb7b78	application.tenant.maticnopodjetje	string	s:36:"00080000-564a-0387-25b1-8f81e81930d5";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 27341428)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-564a-0385-c9a1-539f659b988d	00000000-564a-0385-65c1-c462ad2a4136	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-564a-0385-704b-90db041b6bde	00000000-564a-0385-65c1-c462ad2a4136	00010000-564a-0384-8785-e6e7dd3b688b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-564a-0385-caa4-5e4571e534cd	00000000-564a-0385-a2ac-903956e61600	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 27341495)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-564a-0385-d0bd-8b8c28ecf8ca	\N	00100000-564a-0385-59e8-f3125afab03b	00100000-564a-0385-9f44-a3695883f429	01	Gledališče Nimbis
00410000-564a-0385-0e75-5a0425179bd4	00410000-564a-0385-d0bd-8b8c28ecf8ca	00100000-564a-0385-59e8-f3125afab03b	00100000-564a-0385-9f44-a3695883f429	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 27341439)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-564a-0385-2757-9a8670aa26f5	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-564a-0385-b96b-2f87f162cae4	00010000-564a-0385-7f74-c93a6f25be5c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-564a-0385-a99f-09a514eb56ac	00010000-564a-0385-25e8-cf765f68574f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-564a-0385-d2a9-779648433ad5	00010000-564a-0385-8a00-10781497b842	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-564a-0385-28f3-90373f179a6e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-564a-0385-a32e-611242f11fc8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-564a-0385-2fca-4dede6474f9e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-564a-0385-b6fc-fb1ca2a972db	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-564a-0385-8c04-4217c0a26883	00010000-564a-0385-0509-c7ec395d5780	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-564a-0385-9d8a-47a0e783af07	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-564a-0385-ad67-46da2f0c5ed2	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564a-0385-d7ac-3ff66c625bd6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-564a-0385-4ac1-8d1a10ab4e69	00010000-564a-0385-ca71-7a8f80d2cca1	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-564a-0385-0fd0-daf682c2ffb1	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-564a-0385-ddb9-574c6caf1a27	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-564a-0385-61b6-463648f7eb9e	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-564a-0385-b86d-f59fbe093a28	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564a-0385-6d5e-5edff10368d1	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-564a-0385-627d-2c3f03231e8a	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-564a-0385-28b7-6d3d397fbcdc	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-564a-0385-8e0f-e7ec86b40117	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 27341374)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-564a-0383-dc84-98637d3b9c44	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-564a-0383-beb7-e00a1ff70b29	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-564a-0383-841a-7e3ed2a65474	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-564a-0383-58f4-61f2135c9350	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-564a-0383-ae51-0285368d6c6d	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-564a-0383-c485-06057b6defae	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-564a-0383-c68a-2ff293f34101	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-564a-0383-827d-3fdca3ecc0ac	Abonma-read	Abonma - branje	t
00030000-564a-0383-9165-d356b3e5e333	Abonma-write	Abonma - spreminjanje	t
00030000-564a-0383-40ec-d85898f4aacc	Alternacija-read	Alternacija - branje	t
00030000-564a-0383-569d-bf4ca157fffd	Alternacija-write	Alternacija - spreminjanje	t
00030000-564a-0383-f049-2ad1c5d85c6d	Arhivalija-read	Arhivalija - branje	t
00030000-564a-0383-fec9-ed5929ca4cf7	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-564a-0383-ed05-0c7d928f747a	AuthStorage-read	AuthStorage - branje	t
00030000-564a-0383-0eb6-52ad72390cae	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-564a-0383-0b0c-11a3a7d21bd4	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-564a-0383-a977-8a5327daebf0	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-564a-0383-3167-0b70a4039bdf	Besedilo-read	Besedilo - branje	t
00030000-564a-0383-cbb4-e0c5e83f6675	Besedilo-write	Besedilo - spreminjanje	t
00030000-564a-0383-4064-6cd964213d8a	Dogodek-read	Dogodek - branje	t
00030000-564a-0383-e9ef-a818c2136b80	Dogodek-write	Dogodek - spreminjanje	t
00030000-564a-0383-8e97-aceed154b33f	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-564a-0383-92f1-8c6a02f6c966	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-564a-0383-d7d8-9a3425d3f315	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-564a-0383-61e6-687ae3f2ced5	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-564a-0383-61f8-87d4478c065f	DogodekTrait-read	DogodekTrait - branje	t
00030000-564a-0383-4cf6-0b8fffd05df0	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-564a-0383-265a-ea419214b225	DrugiVir-read	DrugiVir - branje	t
00030000-564a-0383-e59b-1feac4b9d8a6	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-564a-0383-8ef1-dd43663defee	Drzava-read	Drzava - branje	t
00030000-564a-0383-715e-febc4a9279c3	Drzava-write	Drzava - spreminjanje	t
00030000-564a-0383-ecb3-4513614609f4	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-564a-0383-39d0-d5fd718d144c	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-564a-0383-d390-496295959a71	Funkcija-read	Funkcija - branje	t
00030000-564a-0383-a909-595bb6d43ed6	Funkcija-write	Funkcija - spreminjanje	t
00030000-564a-0383-1c6d-2386d3421628	Gostovanje-read	Gostovanje - branje	t
00030000-564a-0383-c7e8-f6ccf469a8de	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-564a-0383-47d3-f42628ca0f23	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-564a-0383-17d9-ec0eebe58358	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-564a-0383-6e1d-f4516791867d	Kupec-read	Kupec - branje	t
00030000-564a-0383-88b7-a966fe8de095	Kupec-write	Kupec - spreminjanje	t
00030000-564a-0383-e1f3-ec4f8a9a2d89	NacinPlacina-read	NacinPlacina - branje	t
00030000-564a-0383-acfa-f1992c44c90e	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-564a-0383-32d3-b8cb30d18b51	Option-read	Option - branje	t
00030000-564a-0383-6297-726c657e3243	Option-write	Option - spreminjanje	t
00030000-564a-0383-4fc8-6c0d069d343c	OptionValue-read	OptionValue - branje	t
00030000-564a-0383-e706-fa4d0c06041c	OptionValue-write	OptionValue - spreminjanje	t
00030000-564a-0383-cac1-9d273ba360db	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-564a-0383-91a3-d0f1d173aaf6	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-564a-0383-af46-d9ee70558216	Oseba-read	Oseba - branje	t
00030000-564a-0383-462d-77b8d437e209	Oseba-write	Oseba - spreminjanje	t
00030000-564a-0383-ac5b-d69c4e552e35	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-564a-0383-4af3-216f2e93a9a6	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-564a-0383-d97d-781558604f47	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-564a-0383-e00d-c5904d90a3d8	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-564a-0383-68ac-0b59204008cc	Pogodba-read	Pogodba - branje	t
00030000-564a-0383-fd2d-a679ca7c28d4	Pogodba-write	Pogodba - spreminjanje	t
00030000-564a-0383-5f98-5ac1aef1d317	Popa-read	Popa - branje	t
00030000-564a-0383-c377-e94e160a32da	Popa-write	Popa - spreminjanje	t
00030000-564a-0383-0731-e61291eb1d1f	Posta-read	Posta - branje	t
00030000-564a-0383-dcc6-94813e691cfc	Posta-write	Posta - spreminjanje	t
00030000-564a-0383-3f4c-b42e60d46078	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-564a-0383-e93f-3554d9a4fd03	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-564a-0383-c548-60b6dd266d86	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-564a-0383-8a1d-2b08e152e6e8	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-564a-0383-cc1a-43b8528a66e8	PostniNaslov-read	PostniNaslov - branje	t
00030000-564a-0383-6675-4c38401201a1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-564a-0383-0b99-76005e08a3e6	Praznik-read	Praznik - branje	t
00030000-564a-0383-655e-ac80c246e7c8	Praznik-write	Praznik - spreminjanje	t
00030000-564a-0383-7c76-bcef4f3a494b	Predstava-read	Predstava - branje	t
00030000-564a-0383-eeec-db99d6b6ef48	Predstava-write	Predstava - spreminjanje	t
00030000-564a-0383-cda1-d3cfe4588ced	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-564a-0383-6d88-41e87d1d246b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-564a-0383-71dd-d286c262a900	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-564a-0383-db36-ab526e18a938	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-564a-0383-81ae-6335afec7304	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-564a-0383-0ee0-4914dc8219ec	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-564a-0383-56e6-9c56198d2bbd	ProgramDela-read	ProgramDela - branje	t
00030000-564a-0383-39f9-4494b1617307	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-564a-0383-f18a-1d1e7a91cf97	ProgramFestival-read	ProgramFestival - branje	t
00030000-564a-0383-10e2-40ea4af9c9b1	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-564a-0383-2e3d-2246e652aea1	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-564a-0383-2fba-b0cbe2dbbb55	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-564a-0383-ca37-f55ce003240c	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-564a-0383-4bdc-82bbdb60036a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-564a-0383-d3ba-1f8bb6a46258	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-564a-0383-616a-8fafb0f1a6f7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-564a-0383-fae5-dca89d88ca95	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-564a-0383-8789-d3fe73ce21b1	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-564a-0383-fe52-639597a4f62d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-564a-0383-6713-20645458c00a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-564a-0383-d2ac-9d5ae9fd3605	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-564a-0383-068c-57bf3132c259	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-564a-0383-f159-c37aac7b6235	ProgramRazno-read	ProgramRazno - branje	t
00030000-564a-0383-937b-2c1362847b63	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-564a-0383-67d6-9a904cbfdde6	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-564a-0383-10bc-d2e998461023	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-564a-0383-baca-4f52bf08494f	Prostor-read	Prostor - branje	t
00030000-564a-0383-5018-4e66c105336d	Prostor-write	Prostor - spreminjanje	t
00030000-564a-0383-6194-ffa9925de63a	Racun-read	Racun - branje	t
00030000-564a-0383-8722-b84446f49764	Racun-write	Racun - spreminjanje	t
00030000-564a-0383-1d50-726391954b86	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-564a-0383-d3e6-0e5e3bd38da5	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-564a-0383-1505-4201fddae72f	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-564a-0383-555d-eb63d39c60a3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-564a-0383-8658-bf663c2fffc9	Rekvizit-read	Rekvizit - branje	t
00030000-564a-0383-fc07-5cac1729ab20	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-564a-0383-417c-b4e2c1f35d07	Revizija-read	Revizija - branje	t
00030000-564a-0383-10c1-52dc0af9971e	Revizija-write	Revizija - spreminjanje	t
00030000-564a-0383-1949-a08025ae2b31	Rezervacija-read	Rezervacija - branje	t
00030000-564a-0383-fac4-51a8187fa57a	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-564a-0383-3f27-9b2896896484	SedezniRed-read	SedezniRed - branje	t
00030000-564a-0383-7d3b-866940f19cdb	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-564a-0383-a787-f72f752cc232	Sedez-read	Sedez - branje	t
00030000-564a-0383-b96d-fd60ac38042e	Sedez-write	Sedez - spreminjanje	t
00030000-564a-0383-2795-ecff650f0f3a	Sezona-read	Sezona - branje	t
00030000-564a-0383-d7aa-764fb33d8b58	Sezona-write	Sezona - spreminjanje	t
00030000-564a-0383-34c0-3807c667dcef	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-564a-0383-22ff-feab773d9df4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-564a-0383-ac3a-d842258edc52	Stevilcenje-read	Stevilcenje - branje	t
00030000-564a-0383-8e69-22d1df3e0d7f	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-564a-0383-4488-bd085f249db5	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-564a-0383-32e3-0f1ce35b79e2	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-564a-0383-de50-3114e7e1e022	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-564a-0383-bff8-d250c8ef1c08	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-564a-0383-2393-b78adcd48b41	Telefonska-read	Telefonska - branje	t
00030000-564a-0383-91b6-e0a78691998f	Telefonska-write	Telefonska - spreminjanje	t
00030000-564a-0383-7829-e815c8908446	TerminStoritve-read	TerminStoritve - branje	t
00030000-564a-0383-7b77-3ca26e9d2331	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-564a-0383-4985-11d714078325	TipFunkcije-read	TipFunkcije - branje	t
00030000-564a-0383-1697-91e68e292006	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-564a-0383-edfb-6673316b14f4	TipPopa-read	TipPopa - branje	t
00030000-564a-0383-9c95-ebf1919123ba	TipPopa-write	TipPopa - spreminjanje	t
00030000-564a-0383-2d74-acfc99508408	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-564a-0383-d75b-275168278b54	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-564a-0383-05d6-69f1ee12b090	TipVaje-read	TipVaje - branje	t
00030000-564a-0383-418f-af085c2dbf71	TipVaje-write	TipVaje - spreminjanje	t
00030000-564a-0383-2244-0269d4530383	Trr-read	Trr - branje	t
00030000-564a-0383-5fde-178717569582	Trr-write	Trr - spreminjanje	t
00030000-564a-0383-8287-b0d17fe89123	Uprizoritev-read	Uprizoritev - branje	t
00030000-564a-0383-bfca-260cdc646025	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-564a-0383-a6b5-4a9b46b839f4	Vaja-read	Vaja - branje	t
00030000-564a-0383-3bd5-bc46a63837a5	Vaja-write	Vaja - spreminjanje	t
00030000-564a-0383-ec28-8afd23fd2abc	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-564a-0383-364c-a6fd067e74bd	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-564a-0383-e373-f28faaf29966	VrstaStroska-read	VrstaStroska - branje	t
00030000-564a-0383-3305-eec2d5ae1961	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-564a-0383-ba88-b7937fa62c93	Zaposlitev-read	Zaposlitev - branje	t
00030000-564a-0383-380e-53e402d492cb	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-564a-0383-9134-19702aa86c06	Zasedenost-read	Zasedenost - branje	t
00030000-564a-0383-1f67-f0d8988f5061	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-564a-0383-e0ef-ad51a01f31cc	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-564a-0383-f3d0-873d1858ef03	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-564a-0383-91ec-e8102ff805e4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-564a-0383-7595-2f33a7df88a8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-564a-0383-0ef0-62b871f27a6e	Job-read	Branje opravil - samo zase - branje	t
00030000-564a-0383-56ba-5d13949eee22	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-564a-0383-6e4b-74255971a620	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-564a-0383-ff3b-a7fcf059a6f3	Report-read	Report - branje	t
00030000-564a-0383-de28-3ad040d95e88	Report-write	Report - spreminjanje	t
00030000-564a-0383-acb5-4b102c519fdf	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-564a-0383-83f1-3eb1c1e140b3	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-564a-0383-95fc-d96706917418	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-564a-0383-5a03-9847dbdc63ec	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-564a-0383-10f4-b221c7a2d614	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-564a-0383-984f-a3742977f0b7	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-564a-0383-79a8-70251ba86607	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-564a-0383-792a-5ea4eff11d0a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-564a-0383-d5f0-96635e601b70	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564a-0383-a518-7a83043bab9c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-564a-0383-31c1-7963ae1a4166	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-564a-0383-ae3b-ae413a004f76	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-564a-0383-c5a6-ce6063ad294a	Datoteka-write	Datoteka - spreminjanje	t
00030000-564a-0383-927e-2db9389eda99	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 27341393)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-564a-0383-5c50-18760a381108	00030000-564a-0383-beb7-e00a1ff70b29
00020000-564a-0383-c3f1-b2756d4192ef	00030000-564a-0383-8ef1-dd43663defee
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-827d-3fdca3ecc0ac
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-9165-d356b3e5e333
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-40ec-d85898f4aacc
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-569d-bf4ca157fffd
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-f049-2ad1c5d85c6d
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-4064-6cd964213d8a
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-58f4-61f2135c9350
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-e9ef-a818c2136b80
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-8ef1-dd43663defee
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-715e-febc4a9279c3
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-d390-496295959a71
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-a909-595bb6d43ed6
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-1c6d-2386d3421628
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-c7e8-f6ccf469a8de
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-47d3-f42628ca0f23
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-17d9-ec0eebe58358
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-32d3-b8cb30d18b51
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-4fc8-6c0d069d343c
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-af46-d9ee70558216
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-462d-77b8d437e209
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-5f98-5ac1aef1d317
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-c377-e94e160a32da
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-0731-e61291eb1d1f
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-dcc6-94813e691cfc
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-cc1a-43b8528a66e8
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-6675-4c38401201a1
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-7c76-bcef4f3a494b
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-eeec-db99d6b6ef48
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-81ae-6335afec7304
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-0ee0-4914dc8219ec
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-baca-4f52bf08494f
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-5018-4e66c105336d
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-1505-4201fddae72f
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-555d-eb63d39c60a3
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-8658-bf663c2fffc9
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-fc07-5cac1729ab20
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-2795-ecff650f0f3a
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-d7aa-764fb33d8b58
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-4985-11d714078325
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-8287-b0d17fe89123
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-bfca-260cdc646025
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-a6b5-4a9b46b839f4
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-3bd5-bc46a63837a5
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-9134-19702aa86c06
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-1f67-f0d8988f5061
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-e0ef-ad51a01f31cc
00020000-564a-0383-3697-ec41c1f84db9	00030000-564a-0383-91ec-e8102ff805e4
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-827d-3fdca3ecc0ac
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-f049-2ad1c5d85c6d
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-4064-6cd964213d8a
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-8ef1-dd43663defee
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-1c6d-2386d3421628
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-47d3-f42628ca0f23
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-17d9-ec0eebe58358
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-32d3-b8cb30d18b51
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-4fc8-6c0d069d343c
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-af46-d9ee70558216
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-462d-77b8d437e209
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-5f98-5ac1aef1d317
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-0731-e61291eb1d1f
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-cc1a-43b8528a66e8
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-6675-4c38401201a1
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-7c76-bcef4f3a494b
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-baca-4f52bf08494f
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-1505-4201fddae72f
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-8658-bf663c2fffc9
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-2795-ecff650f0f3a
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-2393-b78adcd48b41
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-91b6-e0a78691998f
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-2244-0269d4530383
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-5fde-178717569582
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-ba88-b7937fa62c93
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-380e-53e402d492cb
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-e0ef-ad51a01f31cc
00020000-564a-0383-43ae-2e68e1b352d3	00030000-564a-0383-91ec-e8102ff805e4
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-827d-3fdca3ecc0ac
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-40ec-d85898f4aacc
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-f049-2ad1c5d85c6d
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-fec9-ed5929ca4cf7
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-3167-0b70a4039bdf
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-8e97-aceed154b33f
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-4064-6cd964213d8a
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-8ef1-dd43663defee
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-d390-496295959a71
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-1c6d-2386d3421628
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-47d3-f42628ca0f23
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-32d3-b8cb30d18b51
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-4fc8-6c0d069d343c
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-af46-d9ee70558216
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-5f98-5ac1aef1d317
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-0731-e61291eb1d1f
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-7c76-bcef4f3a494b
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-81ae-6335afec7304
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-baca-4f52bf08494f
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-1505-4201fddae72f
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-8658-bf663c2fffc9
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-2795-ecff650f0f3a
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-4985-11d714078325
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-a6b5-4a9b46b839f4
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-9134-19702aa86c06
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-e0ef-ad51a01f31cc
00020000-564a-0383-f12a-1786a043d843	00030000-564a-0383-91ec-e8102ff805e4
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-827d-3fdca3ecc0ac
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-9165-d356b3e5e333
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-569d-bf4ca157fffd
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-f049-2ad1c5d85c6d
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-4064-6cd964213d8a
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-8ef1-dd43663defee
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-1c6d-2386d3421628
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-32d3-b8cb30d18b51
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-4fc8-6c0d069d343c
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-5f98-5ac1aef1d317
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-0731-e61291eb1d1f
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-7c76-bcef4f3a494b
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-baca-4f52bf08494f
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-1505-4201fddae72f
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-8658-bf663c2fffc9
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-2795-ecff650f0f3a
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-4985-11d714078325
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-e0ef-ad51a01f31cc
00020000-564a-0383-f300-a5b4d7b3e35c	00030000-564a-0383-91ec-e8102ff805e4
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-827d-3fdca3ecc0ac
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-f049-2ad1c5d85c6d
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-4064-6cd964213d8a
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-8ef1-dd43663defee
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-1c6d-2386d3421628
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-32d3-b8cb30d18b51
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-4fc8-6c0d069d343c
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-5f98-5ac1aef1d317
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-0731-e61291eb1d1f
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-7c76-bcef4f3a494b
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-baca-4f52bf08494f
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-1505-4201fddae72f
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-8658-bf663c2fffc9
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-2795-ecff650f0f3a
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-7829-e815c8908446
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-841a-7e3ed2a65474
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-4985-11d714078325
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-e0ef-ad51a01f31cc
00020000-564a-0383-323b-6afd8c888c6e	00030000-564a-0383-91ec-e8102ff805e4
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-dc84-98637d3b9c44
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-beb7-e00a1ff70b29
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-827d-3fdca3ecc0ac
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-9165-d356b3e5e333
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-40ec-d85898f4aacc
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-569d-bf4ca157fffd
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-f049-2ad1c5d85c6d
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-fec9-ed5929ca4cf7
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-0b0c-11a3a7d21bd4
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-a977-8a5327daebf0
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-3167-0b70a4039bdf
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-cbb4-e0c5e83f6675
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-8e97-aceed154b33f
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-92f1-8c6a02f6c966
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-4064-6cd964213d8a
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-58f4-61f2135c9350
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-e9ef-a818c2136b80
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-265a-ea419214b225
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-e59b-1feac4b9d8a6
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-8ef1-dd43663defee
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-715e-febc4a9279c3
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-ecb3-4513614609f4
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-39d0-d5fd718d144c
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-d390-496295959a71
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-a909-595bb6d43ed6
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-1c6d-2386d3421628
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-c7e8-f6ccf469a8de
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-47d3-f42628ca0f23
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-17d9-ec0eebe58358
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-6e1d-f4516791867d
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-88b7-a966fe8de095
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-e1f3-ec4f8a9a2d89
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-acfa-f1992c44c90e
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-32d3-b8cb30d18b51
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-4fc8-6c0d069d343c
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-e706-fa4d0c06041c
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-6297-726c657e3243
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-cac1-9d273ba360db
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-91a3-d0f1d173aaf6
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-af46-d9ee70558216
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-ae51-0285368d6c6d
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-462d-77b8d437e209
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-ac5b-d69c4e552e35
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-4af3-216f2e93a9a6
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-d97d-781558604f47
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-e00d-c5904d90a3d8
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-68ac-0b59204008cc
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-fd2d-a679ca7c28d4
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-5f98-5ac1aef1d317
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-c377-e94e160a32da
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-0731-e61291eb1d1f
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-3f4c-b42e60d46078
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-e93f-3554d9a4fd03
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-c548-60b6dd266d86
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-8a1d-2b08e152e6e8
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-dcc6-94813e691cfc
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-cc1a-43b8528a66e8
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-6675-4c38401201a1
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-0b99-76005e08a3e6
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-655e-ac80c246e7c8
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-7c76-bcef4f3a494b
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-eeec-db99d6b6ef48
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-cda1-d3cfe4588ced
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-6d88-41e87d1d246b
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-71dd-d286c262a900
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-db36-ab526e18a938
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-81ae-6335afec7304
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-0ee0-4914dc8219ec
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-c485-06057b6defae
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-56e6-9c56198d2bbd
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-c68a-2ff293f34101
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-39f9-4494b1617307
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-f18a-1d1e7a91cf97
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-10e2-40ea4af9c9b1
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-2e3d-2246e652aea1
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-2fba-b0cbe2dbbb55
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-ca37-f55ce003240c
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-4bdc-82bbdb60036a
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-d3ba-1f8bb6a46258
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-616a-8fafb0f1a6f7
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-fae5-dca89d88ca95
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-8789-d3fe73ce21b1
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-fe52-639597a4f62d
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-6713-20645458c00a
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-d2ac-9d5ae9fd3605
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-068c-57bf3132c259
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-f159-c37aac7b6235
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-937b-2c1362847b63
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-67d6-9a904cbfdde6
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-10bc-d2e998461023
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-baca-4f52bf08494f
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-5018-4e66c105336d
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-6194-ffa9925de63a
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-8722-b84446f49764
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-1d50-726391954b86
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-d3e6-0e5e3bd38da5
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-1505-4201fddae72f
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-555d-eb63d39c60a3
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-8658-bf663c2fffc9
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-fc07-5cac1729ab20
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-417c-b4e2c1f35d07
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-10c1-52dc0af9971e
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-1949-a08025ae2b31
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-fac4-51a8187fa57a
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-3f27-9b2896896484
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-7d3b-866940f19cdb
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-a787-f72f752cc232
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-b96d-fd60ac38042e
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-2795-ecff650f0f3a
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-d7aa-764fb33d8b58
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-34c0-3807c667dcef
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-22ff-feab773d9df4
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-ac3a-d842258edc52
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-4488-bd085f249db5
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-32e3-0f1ce35b79e2
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-8e69-22d1df3e0d7f
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-de50-3114e7e1e022
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-bff8-d250c8ef1c08
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-2393-b78adcd48b41
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-91b6-e0a78691998f
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-7829-e815c8908446
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-841a-7e3ed2a65474
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-7b77-3ca26e9d2331
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-4985-11d714078325
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-1697-91e68e292006
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-edfb-6673316b14f4
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-9c95-ebf1919123ba
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-2d74-acfc99508408
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-d75b-275168278b54
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-05d6-69f1ee12b090
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-418f-af085c2dbf71
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-2244-0269d4530383
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-5fde-178717569582
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-8287-b0d17fe89123
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-bfca-260cdc646025
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-a6b5-4a9b46b839f4
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-3bd5-bc46a63837a5
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-ec28-8afd23fd2abc
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-364c-a6fd067e74bd
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-e373-f28faaf29966
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-3305-eec2d5ae1961
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-ba88-b7937fa62c93
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-380e-53e402d492cb
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-9134-19702aa86c06
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-1f67-f0d8988f5061
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-e0ef-ad51a01f31cc
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-f3d0-873d1858ef03
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-91ec-e8102ff805e4
00020000-564a-0385-d617-c0f7c5be72d5	00030000-564a-0383-7595-2f33a7df88a8
00020000-564a-0385-7f8b-8478e066e43c	00030000-564a-0383-a518-7a83043bab9c
00020000-564a-0385-b45c-5bcbc027a858	00030000-564a-0383-d5f0-96635e601b70
00020000-564a-0385-8505-3e82fa48522a	00030000-564a-0383-bfca-260cdc646025
00020000-564a-0385-987d-0f2cdfb46d24	00030000-564a-0383-8287-b0d17fe89123
00020000-564a-0385-96ca-e0621056bcb4	00030000-564a-0383-83f1-3eb1c1e140b3
00020000-564a-0385-d7fa-280d4f18e311	00030000-564a-0383-95fc-d96706917418
00020000-564a-0385-c761-6212b0d91516	00030000-564a-0383-5a03-9847dbdc63ec
00020000-564a-0385-3193-cf79fb874042	00030000-564a-0383-acb5-4b102c519fdf
00020000-564a-0385-68ff-4211f46b39f8	00030000-564a-0383-984f-a3742977f0b7
00020000-564a-0385-b2b3-0ef2155a9a6d	00030000-564a-0383-10f4-b221c7a2d614
00020000-564a-0385-7081-a1018886c3e7	00030000-564a-0383-792a-5ea4eff11d0a
00020000-564a-0385-a04d-132f3d486003	00030000-564a-0383-79a8-70251ba86607
00020000-564a-0385-5b8a-fceee6ef83d7	00030000-564a-0383-462d-77b8d437e209
00020000-564a-0385-6969-2ccc54056014	00030000-564a-0383-af46-d9ee70558216
00020000-564a-0385-0ed6-b0868309a3cc	00030000-564a-0383-c5a6-ce6063ad294a
00020000-564a-0385-dfef-a90d21a3372c	00030000-564a-0383-927e-2db9389eda99
\.


--
-- TOC entry 3139 (class 0 OID 27341783)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 27341817)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 27341954)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-564a-0385-9b57-01f4f66a2cda	00090000-564a-0385-2757-9a8670aa26f5	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-564a-0385-8f40-0eeef650db58	00090000-564a-0385-a32e-611242f11fc8	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-564a-0385-819e-b79a2acd9dd5	00090000-564a-0385-4ac1-8d1a10ab4e69	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-564a-0385-aab5-fc17ebda1518	00090000-564a-0385-9d8a-47a0e783af07	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 27341475)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-564a-0385-435e-67f6ce1a64d0	\N	00040000-564a-0383-e6f9-356610cf1e58	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564a-0385-8104-0ef96a494d96	\N	00040000-564a-0383-e6f9-356610cf1e58	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-564a-0385-82b4-d96a4aaa54e9	\N	00040000-564a-0383-e6f9-356610cf1e58	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564a-0385-0791-0b0101e0a8a7	\N	00040000-564a-0383-e6f9-356610cf1e58	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564a-0385-0a22-56b962d40294	\N	00040000-564a-0383-e6f9-356610cf1e58	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564a-0385-8627-82ae047154aa	\N	00040000-564a-0383-174f-eef6cf14b5d5	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564a-0385-cc2a-e7dc6bca3285	\N	00040000-564a-0383-cd57-3c867b8217d7	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564a-0385-1e4b-b5214820f5e3	\N	00040000-564a-0383-c71c-b9127c97745a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564a-0385-3628-2b31e856a343	\N	00040000-564a-0383-b96e-d7120f689deb	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-564a-0387-25b1-8f81e81930d5	\N	00040000-564a-0383-e6f9-356610cf1e58	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 27341520)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-564a-0382-d4a7-e55d8dfdcc99	8341	Adlešiči
00050000-564a-0382-ce15-acee13760fb6	5270	Ajdovščina
00050000-564a-0382-8bc6-aa429e34072b	6280	Ankaran/Ancarano
00050000-564a-0382-1e09-f6e0ed0a58b1	9253	Apače
00050000-564a-0382-5f70-530800b889e5	8253	Artiče
00050000-564a-0382-ca07-fc985cf0a119	4275	Begunje na Gorenjskem
00050000-564a-0382-249f-af403cd80804	1382	Begunje pri Cerknici
00050000-564a-0382-fe46-a1eee8ef34ad	9231	Beltinci
00050000-564a-0382-f440-68f8c7a9c4f7	2234	Benedikt
00050000-564a-0382-a6fc-7ace72303014	2345	Bistrica ob Dravi
00050000-564a-0382-d67b-b4ce6733c2e1	3256	Bistrica ob Sotli
00050000-564a-0382-2405-ae48e82365a3	8259	Bizeljsko
00050000-564a-0382-c6d7-5ebf7f4c9c8c	1223	Blagovica
00050000-564a-0382-f228-83160f5307bb	8283	Blanca
00050000-564a-0382-99c3-a630308a790d	4260	Bled
00050000-564a-0382-c5ef-c49b11ede529	4273	Blejska Dobrava
00050000-564a-0382-81b7-752cd728cf98	9265	Bodonci
00050000-564a-0382-af00-0a94234f9ab9	9222	Bogojina
00050000-564a-0382-99e8-3dd80ef422c1	4263	Bohinjska Bela
00050000-564a-0382-76d4-cd76c0b83d03	4264	Bohinjska Bistrica
00050000-564a-0382-acc6-537dbbe360aa	4265	Bohinjsko jezero
00050000-564a-0382-13b4-9e4de093d8f4	1353	Borovnica
00050000-564a-0382-3c72-7af2621299ae	8294	Boštanj
00050000-564a-0382-10bb-f96aca310800	5230	Bovec
00050000-564a-0382-8d70-4375fdf80d4b	5295	Branik
00050000-564a-0382-8885-46cda6b537ed	3314	Braslovče
00050000-564a-0382-57bd-662508e29137	5223	Breginj
00050000-564a-0382-fc5a-7533f091a15d	8280	Brestanica
00050000-564a-0382-9600-fda9e9140d29	2354	Bresternica
00050000-564a-0382-881d-577ba6010f51	4243	Brezje
00050000-564a-0382-c584-a8aff0f60873	1351	Brezovica pri Ljubljani
00050000-564a-0382-86ea-3af6922c87ef	8250	Brežice
00050000-564a-0382-c484-ed41a3922b33	4210	Brnik - Aerodrom
00050000-564a-0383-f31d-a3bc6a277247	8321	Brusnice
00050000-564a-0383-095d-0632cf4fcc89	3255	Buče
00050000-564a-0383-e243-de7112e7df5c	8276	Bučka 
00050000-564a-0383-bc60-284127d1bd6a	9261	Cankova
00050000-564a-0383-5a30-803692119fcb	3000	Celje 
00050000-564a-0383-41ac-64098c7d18a4	3001	Celje - poštni predali
00050000-564a-0383-98c1-fb44efc151be	4207	Cerklje na Gorenjskem
00050000-564a-0383-88d6-7ad8b07a3b2a	8263	Cerklje ob Krki
00050000-564a-0383-3f0b-8953371e8ae1	1380	Cerknica
00050000-564a-0383-b931-9b63d225bdd7	5282	Cerkno
00050000-564a-0383-8bce-685605fa5df1	2236	Cerkvenjak
00050000-564a-0383-b58c-87709eeb845e	2215	Ceršak
00050000-564a-0383-7150-e89f8826a389	2326	Cirkovce
00050000-564a-0383-74cb-f0fa29fac1cf	2282	Cirkulane
00050000-564a-0383-eac9-95e30fa31388	5273	Col
00050000-564a-0383-278c-1469e004a075	8251	Čatež ob Savi
00050000-564a-0383-eb4f-6920c3253464	1413	Čemšenik
00050000-564a-0383-fce6-7622ae69f2b2	5253	Čepovan
00050000-564a-0383-c1f4-1c327773170a	9232	Črenšovci
00050000-564a-0383-de6a-7e41a71b04e4	2393	Črna na Koroškem
00050000-564a-0383-efdf-bd46beb60100	6275	Črni Kal
00050000-564a-0383-515f-1cc224619d2c	5274	Črni Vrh nad Idrijo
00050000-564a-0383-5b2b-07ea5cbdc659	5262	Črniče
00050000-564a-0383-9e01-2ef6617b7a09	8340	Črnomelj
00050000-564a-0383-b803-f6b499d09c9e	6271	Dekani
00050000-564a-0383-c21e-e3998f35ee71	5210	Deskle
00050000-564a-0383-6161-25c928047dbd	2253	Destrnik
00050000-564a-0383-a4fb-1e81c177690c	6215	Divača
00050000-564a-0383-05f0-32b94d962d5b	1233	Dob
00050000-564a-0383-7081-018fd3ad81c0	3224	Dobje pri Planini
00050000-564a-0383-dd7f-7620a84cb06a	8257	Dobova
00050000-564a-0383-a359-1009f2a11482	1423	Dobovec
00050000-564a-0383-9566-c8402d334e47	5263	Dobravlje
00050000-564a-0383-f4c0-676d951b5127	3204	Dobrna
00050000-564a-0383-b79e-4292030ec372	8211	Dobrnič
00050000-564a-0383-84d8-fc56f9b8a884	1356	Dobrova
00050000-564a-0383-64fb-90429c813069	9223	Dobrovnik/Dobronak 
00050000-564a-0383-5ddc-e5c19d1e30b3	5212	Dobrovo v Brdih
00050000-564a-0383-6254-7bce3515ec41	1431	Dol pri Hrastniku
00050000-564a-0383-68ad-4e0f8bbfcade	1262	Dol pri Ljubljani
00050000-564a-0383-27f2-0df1fe423a08	1273	Dole pri Litiji
00050000-564a-0383-0fc0-de7a10da3d45	1331	Dolenja vas
00050000-564a-0383-e34f-f2eaeb792b20	8350	Dolenjske Toplice
00050000-564a-0383-7d5c-0b5c94fa18be	1230	Domžale
00050000-564a-0383-c7a1-894dc34942ed	2252	Dornava
00050000-564a-0383-d7a3-64656a4b993b	5294	Dornberk
00050000-564a-0383-6916-16171c71a7ce	1319	Draga
00050000-564a-0383-9df9-91f849a362dd	8343	Dragatuš
00050000-564a-0383-a66a-c695cb096c92	3222	Dramlje
00050000-564a-0383-6520-7ea5f0fbac8f	2370	Dravograd
00050000-564a-0383-7c83-4f4096723e13	4203	Duplje
00050000-564a-0383-4fb8-47c02de837b2	6221	Dutovlje
00050000-564a-0383-6679-741fb04783ce	8361	Dvor
00050000-564a-0383-f863-722e07e9dc5c	2343	Fala
00050000-564a-0383-94a7-7be62733756b	9208	Fokovci
00050000-564a-0383-f751-a6946cfa3216	2313	Fram
00050000-564a-0383-4b18-2c959f36f5b0	3213	Frankolovo
00050000-564a-0383-48ed-cda3df51fd19	1274	Gabrovka
00050000-564a-0383-2c06-ae6f0f5f193b	8254	Globoko
00050000-564a-0383-f666-01a53ba476ea	5275	Godovič
00050000-564a-0383-2d12-8f2a18e2a3b5	4204	Golnik
00050000-564a-0383-7664-b471bbdfebb5	3303	Gomilsko
00050000-564a-0383-db50-9f81fbe7e2e9	4224	Gorenja vas
00050000-564a-0383-758e-67b65cdd8be0	3263	Gorica pri Slivnici
00050000-564a-0383-cbc8-55a04c17430b	2272	Gorišnica
00050000-564a-0383-0821-e7156523720e	9250	Gornja Radgona
00050000-564a-0383-9cc5-52f4a15d014d	3342	Gornji Grad
00050000-564a-0383-529a-164818817660	4282	Gozd Martuljek
00050000-564a-0383-bf99-f1282ec334dd	6272	Gračišče
00050000-564a-0383-fb78-d87302cdf66c	9264	Grad
00050000-564a-0383-d331-f45f5f0e9e23	8332	Gradac
00050000-564a-0383-c9e7-cc736e050fd8	1384	Grahovo
00050000-564a-0383-76fb-8cc003418c8c	5242	Grahovo ob Bači
00050000-564a-0383-5cdf-139b70e05e20	5251	Grgar
00050000-564a-0383-4891-cae26041adbf	3302	Griže
00050000-564a-0383-f6a4-666ebc8115e2	3231	Grobelno
00050000-564a-0383-28c5-75310854814c	1290	Grosuplje
00050000-564a-0383-2443-7c9bffb24c42	2288	Hajdina
00050000-564a-0383-4f0d-86f54ccef1ca	8362	Hinje
00050000-564a-0383-7d06-2f81f35e88f3	2311	Hoče
00050000-564a-0383-a05b-0ec1aa172d23	9205	Hodoš/Hodos
00050000-564a-0383-aac4-500b84d45c9a	1354	Horjul
00050000-564a-0383-d2a2-c43054ff4cab	1372	Hotedršica
00050000-564a-0383-801a-3a9670cdc4b3	1430	Hrastnik
00050000-564a-0383-7ea9-aa95af8f0769	6225	Hruševje
00050000-564a-0383-30de-26316f5c12b5	4276	Hrušica
00050000-564a-0383-202b-52084c306397	5280	Idrija
00050000-564a-0383-7e61-b25d0672e8a4	1292	Ig
00050000-564a-0383-a658-85322fc8ff16	6250	Ilirska Bistrica
00050000-564a-0383-c7ae-141f90d618f2	6251	Ilirska Bistrica-Trnovo
00050000-564a-0383-d70b-4d1c63067434	1295	Ivančna Gorica
00050000-564a-0383-9336-2e27da281a4d	2259	Ivanjkovci
00050000-564a-0383-934d-64f9eef88bff	1411	Izlake
00050000-564a-0383-e2a1-80bc0796dcf2	6310	Izola/Isola
00050000-564a-0383-a38b-a08aee6ae077	2222	Jakobski Dol
00050000-564a-0383-de1c-1be8477a37c0	2221	Jarenina
00050000-564a-0383-51e0-26bfc7713a86	6254	Jelšane
00050000-564a-0383-c80c-99533e76c4ab	4270	Jesenice
00050000-564a-0383-cb4d-f123967cc083	8261	Jesenice na Dolenjskem
00050000-564a-0383-8225-add9cad82daa	3273	Jurklošter
00050000-564a-0383-0169-99561108d289	2223	Jurovski Dol
00050000-564a-0383-6c93-01f20ac72e37	2256	Juršinci
00050000-564a-0383-d307-7713efeb73c2	5214	Kal nad Kanalom
00050000-564a-0383-425f-a41541858794	3233	Kalobje
00050000-564a-0383-34aa-cd11155f1bd8	4246	Kamna Gorica
00050000-564a-0383-7a4f-cc16b63d6956	2351	Kamnica
00050000-564a-0383-7692-c8c7ae4565d7	1241	Kamnik
00050000-564a-0383-7c75-177be67fa252	5213	Kanal
00050000-564a-0383-90eb-70828eea0b87	8258	Kapele
00050000-564a-0383-b74f-7877477a8bad	2362	Kapla
00050000-564a-0383-8ee2-3f16433b0b3a	2325	Kidričevo
00050000-564a-0383-0734-887d51925e7d	1412	Kisovec
00050000-564a-0383-31cb-c241c585ffd3	6253	Knežak
00050000-564a-0383-063e-89ed063c0106	5222	Kobarid
00050000-564a-0383-bc30-b426c4b9c5fb	9227	Kobilje
00050000-564a-0383-25ef-d68702a9743f	1330	Kočevje
00050000-564a-0383-4af2-3da816df4ecf	1338	Kočevska Reka
00050000-564a-0383-5659-ffea8cf5cb42	2276	Kog
00050000-564a-0383-2f75-d73a64ae1b76	5211	Kojsko
00050000-564a-0383-2f94-ecb9fdd33126	6223	Komen
00050000-564a-0383-bbf0-9dddadf2264b	1218	Komenda
00050000-564a-0383-783a-6a5dc16ef31b	6000	Koper/Capodistria 
00050000-564a-0383-1a89-d9ec3543c160	6001	Koper/Capodistria - poštni predali
00050000-564a-0383-d85b-746a6d33a35a	8282	Koprivnica
00050000-564a-0383-a92b-3207d9b06189	5296	Kostanjevica na Krasu
00050000-564a-0383-dea4-60e19e11a4d6	8311	Kostanjevica na Krki
00050000-564a-0383-0942-c2a29968fbd7	1336	Kostel
00050000-564a-0383-642c-c3c3a370088b	6256	Košana
00050000-564a-0383-0c5f-e9450d744d87	2394	Kotlje
00050000-564a-0383-ef2d-913db209c8bf	6240	Kozina
00050000-564a-0383-c509-cf9a61974080	3260	Kozje
00050000-564a-0383-42a2-28668e61b019	4000	Kranj 
00050000-564a-0383-c6b9-978939292e7b	4001	Kranj - poštni predali
00050000-564a-0383-8370-cf041eca3777	4280	Kranjska Gora
00050000-564a-0383-04f9-eaf9a0b03f6c	1281	Kresnice
00050000-564a-0383-92f3-e977cbe0e3ef	4294	Križe
00050000-564a-0383-f355-e7937f6d95e1	9206	Križevci
00050000-564a-0383-aa75-b7e9d3b38ce1	9242	Križevci pri Ljutomeru
00050000-564a-0383-092e-d36bc0f9630d	1301	Krka
00050000-564a-0383-a3dd-3d79741ea30f	8296	Krmelj
00050000-564a-0383-a16c-d8d652816447	4245	Kropa
00050000-564a-0383-3ba6-1a43bc520d19	8262	Krška vas
00050000-564a-0383-235e-2813b5f005ca	8270	Krško
00050000-564a-0383-821f-f6e6e5d8ea5b	9263	Kuzma
00050000-564a-0383-a775-69ef563cd4cc	2318	Laporje
00050000-564a-0383-e3cb-3cdb642ffe9f	3270	Laško
00050000-564a-0383-b079-8dce36658d08	1219	Laze v Tuhinju
00050000-564a-0383-d994-a76caf6734ae	2230	Lenart v Slovenskih goricah
00050000-564a-0383-d561-4b6a96f5f97d	9220	Lendava/Lendva
00050000-564a-0383-a1ad-69cec8b73dd0	4248	Lesce
00050000-564a-0383-1743-f986e211e2d4	3261	Lesično
00050000-564a-0383-508a-bd5405a4847c	8273	Leskovec pri Krškem
00050000-564a-0383-e079-51bbb3456ad9	2372	Libeliče
00050000-564a-0383-dd81-48c4a14609a7	2341	Limbuš
00050000-564a-0383-a69e-1942df4ac6fd	1270	Litija
00050000-564a-0383-7255-826b52205e77	3202	Ljubečna
00050000-564a-0383-bc62-1edbaf5ca88f	1000	Ljubljana 
00050000-564a-0383-3d45-094f10dd9b01	1001	Ljubljana - poštni predali
00050000-564a-0383-e857-552cd5e8e8ca	1231	Ljubljana - Črnuče
00050000-564a-0383-8b3d-202fb45028f4	1261	Ljubljana - Dobrunje
00050000-564a-0383-7a1a-3e59094bb4d4	1260	Ljubljana - Polje
00050000-564a-0383-1ba0-fc414c2ed85d	1210	Ljubljana - Šentvid
00050000-564a-0383-f56a-50fdcc8bc6c3	1211	Ljubljana - Šmartno
00050000-564a-0383-f382-4f45fe3a813d	3333	Ljubno ob Savinji
00050000-564a-0383-1cff-f2694d77680e	9240	Ljutomer
00050000-564a-0383-9258-825a01c13ec7	3215	Loče
00050000-564a-0383-58cd-9e3b296810c9	5231	Log pod Mangartom
00050000-564a-0383-cbb2-d497ce0a1bd6	1358	Log pri Brezovici
00050000-564a-0383-747c-ae9cc5ba386f	1370	Logatec
00050000-564a-0383-4f23-ae527ccb9e64	1371	Logatec
00050000-564a-0383-a105-632995ebac20	1434	Loka pri Zidanem Mostu
00050000-564a-0383-5c76-f3868f33a322	3223	Loka pri Žusmu
00050000-564a-0383-4569-c97cdbd0d144	6219	Lokev
00050000-564a-0383-40c9-5f06b4a04b82	1318	Loški Potok
00050000-564a-0383-f112-9ce367f96ef6	2324	Lovrenc na Dravskem polju
00050000-564a-0383-e753-b714eb9c0d2b	2344	Lovrenc na Pohorju
00050000-564a-0383-7cde-54d899c2cf9e	3334	Luče
00050000-564a-0383-879e-f8e3434791cb	1225	Lukovica
00050000-564a-0383-461f-66fe87e4fb4b	9202	Mačkovci
00050000-564a-0383-8d52-418723750a92	2322	Majšperk
00050000-564a-0383-7c9a-bf9994446083	2321	Makole
00050000-564a-0383-a0af-7a7b20a6bd3b	9243	Mala Nedelja
00050000-564a-0383-fa1f-9739b2f187f7	2229	Malečnik
00050000-564a-0383-c644-d2b8b7b89e76	6273	Marezige
00050000-564a-0383-760f-9e5c00f59feb	2000	Maribor 
00050000-564a-0383-3374-5e867c1aa25c	2001	Maribor - poštni predali
00050000-564a-0383-0099-4fb47fcd08be	2206	Marjeta na Dravskem polju
00050000-564a-0383-0a61-c4b1618e692b	2281	Markovci
00050000-564a-0383-05c8-c2f938512609	9221	Martjanci
00050000-564a-0383-befb-d7129841e9ac	6242	Materija
00050000-564a-0383-b8ce-b39694e7a975	4211	Mavčiče
00050000-564a-0383-df39-cb6b173261bf	1215	Medvode
00050000-564a-0383-6da1-598c67366722	1234	Mengeš
00050000-564a-0383-28d7-3334c37f67a8	8330	Metlika
00050000-564a-0383-2843-c819d3a1c328	2392	Mežica
00050000-564a-0383-0d4b-9ad77c6b37de	2204	Miklavž na Dravskem polju
00050000-564a-0383-9500-0a45999590e2	2275	Miklavž pri Ormožu
00050000-564a-0383-2800-1fd5794957aa	5291	Miren
00050000-564a-0383-a0c2-1596eed0b81a	8233	Mirna
00050000-564a-0383-682d-077facf781c2	8216	Mirna Peč
00050000-564a-0383-afc6-f8da30f41f45	2382	Mislinja
00050000-564a-0383-9a39-82226529fe35	4281	Mojstrana
00050000-564a-0383-4779-3237bdcc3098	8230	Mokronog
00050000-564a-0383-4a1c-0b3b91f59043	1251	Moravče
00050000-564a-0383-281c-b9999e5a16e9	9226	Moravske Toplice
00050000-564a-0383-892b-0e2334d39e7f	5216	Most na Soči
00050000-564a-0383-1e39-054bc8808104	1221	Motnik
00050000-564a-0383-f610-694c48595251	3330	Mozirje
00050000-564a-0383-0b07-d2db953f5ea2	9000	Murska Sobota 
00050000-564a-0383-8285-436182c98bb9	9001	Murska Sobota - poštni predali
00050000-564a-0383-45b5-bb060ad2f6e5	2366	Muta
00050000-564a-0383-5d5a-3c419c6922f2	4202	Naklo
00050000-564a-0383-b62b-9c99d58fb01b	3331	Nazarje
00050000-564a-0383-12ab-0f9e923490fc	1357	Notranje Gorice
00050000-564a-0383-17fb-92054f60e84f	3203	Nova Cerkev
00050000-564a-0383-f31d-0d7c383eb654	5000	Nova Gorica 
00050000-564a-0383-8df3-76fd5d4383a7	5001	Nova Gorica - poštni predali
00050000-564a-0383-230f-e40d61643c07	1385	Nova vas
00050000-564a-0383-5bd4-5f01bc7efc6e	8000	Novo mesto
00050000-564a-0383-52e3-afb221b295e8	8001	Novo mesto - poštni predali
00050000-564a-0383-9a1f-2b0d4068a7ce	6243	Obrov
00050000-564a-0383-de61-fd948a43082e	9233	Odranci
00050000-564a-0383-7681-0b55d2be230d	2317	Oplotnica
00050000-564a-0383-144b-fb16e6f90e60	2312	Orehova vas
00050000-564a-0383-1836-6a3f07a6c929	2270	Ormož
00050000-564a-0383-8989-996208bf6ffa	1316	Ortnek
00050000-564a-0383-2b62-5dd58a75d0c8	1337	Osilnica
00050000-564a-0383-6072-c0491796a749	8222	Otočec
00050000-564a-0383-8f8c-9d1ff845c143	2361	Ožbalt
00050000-564a-0383-f1f8-73df378fa84c	2231	Pernica
00050000-564a-0383-4bdf-7bf8cabaec5f	2211	Pesnica pri Mariboru
00050000-564a-0383-0bc7-8465f93fb19f	9203	Petrovci
00050000-564a-0383-9a30-548da6614aa5	3301	Petrovče
00050000-564a-0383-a762-dd8237ae293d	6330	Piran/Pirano
00050000-564a-0383-0c16-c99875727aac	8255	Pišece
00050000-564a-0383-c143-fea2ece5106e	6257	Pivka
00050000-564a-0383-31eb-a7e272471d95	6232	Planina
00050000-564a-0383-611c-62f490ea26ba	3225	Planina pri Sevnici
00050000-564a-0383-4826-c80aec6075b8	6276	Pobegi
00050000-564a-0383-48d4-c4bb33f909bf	8312	Podbočje
00050000-564a-0383-1e05-169f56c087dc	5243	Podbrdo
00050000-564a-0383-27b8-3cf8826aea34	3254	Podčetrtek
00050000-564a-0383-e7b4-31f4e8516a2c	2273	Podgorci
00050000-564a-0383-bca1-0c907f7a815e	6216	Podgorje
00050000-564a-0383-dd53-83894294b849	2381	Podgorje pri Slovenj Gradcu
00050000-564a-0383-afbc-ce100ae8f369	6244	Podgrad
00050000-564a-0383-efb9-440f07349a8b	1414	Podkum
00050000-564a-0383-c61b-6e9ccb5d2af8	2286	Podlehnik
00050000-564a-0383-8e0e-731c906c2b9a	5272	Podnanos
00050000-564a-0383-6a79-ae720a45c101	4244	Podnart
00050000-564a-0383-eb0d-34c0e51588c1	3241	Podplat
00050000-564a-0383-9dd5-9c52eba66a29	3257	Podsreda
00050000-564a-0383-ac2c-d21e27df3a70	2363	Podvelka
00050000-564a-0383-8a77-2e547fa97d04	2208	Pohorje
00050000-564a-0383-f4f0-f814f45f462d	2257	Polenšak
00050000-564a-0383-6f5d-d6aca60ded01	1355	Polhov Gradec
00050000-564a-0383-a9e9-7af4988e75e8	4223	Poljane nad Škofjo Loko
00050000-564a-0383-7bbb-736d7054dbdc	2319	Poljčane
00050000-564a-0383-76b4-cb685d973362	1272	Polšnik
00050000-564a-0383-0f2c-7cf7c722243f	3313	Polzela
00050000-564a-0383-2727-dea76a86c52d	3232	Ponikva
00050000-564a-0383-5622-90b6d69a7e84	6320	Portorož/Portorose
00050000-564a-0383-24c4-f58f0dd48c57	6230	Postojna
00050000-564a-0383-851d-3ff17ad231b8	2331	Pragersko
00050000-564a-0383-8cfe-a9339d901a79	3312	Prebold
00050000-564a-0383-e577-af23b18d0d3d	4205	Preddvor
00050000-564a-0383-8487-49af8182226d	6255	Prem
00050000-564a-0383-18d7-f48dd64d0e94	1352	Preserje
00050000-564a-0383-c911-3e3251628a16	6258	Prestranek
00050000-564a-0383-a03f-ff4b5f8b4cf4	2391	Prevalje
00050000-564a-0383-f85a-09b84d12d54c	3262	Prevorje
00050000-564a-0383-26c8-d84f497a57b2	1276	Primskovo 
00050000-564a-0383-2cef-f8722f76f442	3253	Pristava pri Mestinju
00050000-564a-0383-2d77-f488c6d1f5c9	9207	Prosenjakovci/Partosfalva
00050000-564a-0383-2833-ece80a4c68fe	5297	Prvačina
00050000-564a-0383-9a14-370fb26a93af	2250	Ptuj
00050000-564a-0383-9816-02db5451cbcf	2323	Ptujska Gora
00050000-564a-0383-c1a1-a001b900372e	9201	Puconci
00050000-564a-0383-dfc3-295b6aa3bf59	2327	Rače
00050000-564a-0383-e8db-f75d03f9107f	1433	Radeče
00050000-564a-0383-ee8e-bf9b19dd11a2	9252	Radenci
00050000-564a-0383-2510-228ad5d261d9	2360	Radlje ob Dravi
00050000-564a-0383-1e1c-a1f4cbe8ad71	1235	Radomlje
00050000-564a-0383-5eaa-2c44e288c8a0	4240	Radovljica
00050000-564a-0383-5ef1-1242cbc223bd	8274	Raka
00050000-564a-0383-c090-6045d4d44218	1381	Rakek
00050000-564a-0383-f655-c03471b3e60e	4283	Rateče - Planica
00050000-564a-0383-fd1e-57140a7ed089	2390	Ravne na Koroškem
00050000-564a-0383-c563-de8408c67345	9246	Razkrižje
00050000-564a-0383-2058-9014dee03cfc	3332	Rečica ob Savinji
00050000-564a-0383-1d19-025db8c40555	5292	Renče
00050000-564a-0383-935e-79d86df27331	1310	Ribnica
00050000-564a-0383-b7ca-76bdcf3ee136	2364	Ribnica na Pohorju
00050000-564a-0383-b1cb-91f4f301b2ec	3272	Rimske Toplice
00050000-564a-0383-56c0-2808450ccfea	1314	Rob
00050000-564a-0383-91e8-5408b0be5b06	5215	Ročinj
00050000-564a-0383-b36c-7cef062dcc1d	3250	Rogaška Slatina
00050000-564a-0383-05bc-8618886870e8	9262	Rogašovci
00050000-564a-0383-f2be-7d7eb2247699	3252	Rogatec
00050000-564a-0383-23fc-928bf27d050e	1373	Rovte
00050000-564a-0383-768d-3c9590c2a0ce	2342	Ruše
00050000-564a-0383-23fd-569898b3f2aa	1282	Sava
00050000-564a-0383-18dd-3f7d6df98d47	6333	Sečovlje/Sicciole
00050000-564a-0383-620d-0906e8eb529a	4227	Selca
00050000-564a-0383-b3fd-013e27e6bbf9	2352	Selnica ob Dravi
00050000-564a-0383-1808-9b48a5455388	8333	Semič
00050000-564a-0383-4bbb-ce23ae166ffc	8281	Senovo
00050000-564a-0383-f086-372c5fe6aeb0	6224	Senožeče
00050000-564a-0383-d2dd-1d94d0fbece5	8290	Sevnica
00050000-564a-0383-b12f-f5f6ed7a010c	6210	Sežana
00050000-564a-0383-bd3b-bafc8719498d	2214	Sladki Vrh
00050000-564a-0383-2463-41932599a6a6	5283	Slap ob Idrijci
00050000-564a-0383-141c-a716cc689e02	2380	Slovenj Gradec
00050000-564a-0383-2f7c-2af66d73cab2	2310	Slovenska Bistrica
00050000-564a-0383-a8a2-ca454cc13739	3210	Slovenske Konjice
00050000-564a-0383-43fd-d869d7bfff63	1216	Smlednik
00050000-564a-0383-fa47-ab043adddde1	5232	Soča
00050000-564a-0383-9a61-ddfeb4258658	1317	Sodražica
00050000-564a-0383-ed07-a6c2257682cd	3335	Solčava
00050000-564a-0383-fdfc-ca6b26704e3e	5250	Solkan
00050000-564a-0383-1f5f-f2eee58f1111	4229	Sorica
00050000-564a-0383-f2ca-c81a10f68247	4225	Sovodenj
00050000-564a-0383-db84-26bec2301916	5281	Spodnja Idrija
00050000-564a-0383-dbd6-f3ac79dada57	2241	Spodnji Duplek
00050000-564a-0383-f5e4-0c68167e7dda	9245	Spodnji Ivanjci
00050000-564a-0383-206f-4b0d2d8ea5e2	2277	Središče ob Dravi
00050000-564a-0383-adba-8aa986d9391b	4267	Srednja vas v Bohinju
00050000-564a-0383-a5e4-8ed3adf1e966	8256	Sromlje 
00050000-564a-0383-aaee-1427c78f4ca3	5224	Srpenica
00050000-564a-0383-a6dd-a5a6e565e7f5	1242	Stahovica
00050000-564a-0383-310f-b58639792f6e	1332	Stara Cerkev
00050000-564a-0383-ef01-659488cf3f1c	8342	Stari trg ob Kolpi
00050000-564a-0383-23b2-19069680ec57	1386	Stari trg pri Ložu
00050000-564a-0383-52c2-4c91cb3d115d	2205	Starše
00050000-564a-0383-9267-9020c3fd6fa4	2289	Stoperce
00050000-564a-0383-b83e-124180f7284b	8322	Stopiče
00050000-564a-0383-6cc3-d08a5bf78ee6	3206	Stranice
00050000-564a-0383-0be5-762aa79a7bef	8351	Straža
00050000-564a-0383-0137-14803ed9cd67	1313	Struge
00050000-564a-0383-20ea-a3d4ba240770	8293	Studenec
00050000-564a-0383-8409-753e0343a3c4	8331	Suhor
00050000-564a-0383-f47b-044b4313d333	2233	Sv. Ana v Slovenskih goricah
00050000-564a-0383-002e-a475a957543c	2235	Sv. Trojica v Slovenskih goricah
00050000-564a-0383-b01c-fec908f87667	2353	Sveti Duh na Ostrem Vrhu
00050000-564a-0383-555a-61c6846f9e85	9244	Sveti Jurij ob Ščavnici
00050000-564a-0383-7fb3-ebe6ffe3e834	3264	Sveti Štefan
00050000-564a-0383-0e95-0aed8a7f5a9a	2258	Sveti Tomaž
00050000-564a-0383-5e81-baa9f51db400	9204	Šalovci
00050000-564a-0383-7376-87c5124b2a5a	5261	Šempas
00050000-564a-0383-1678-afe44e0a063e	5290	Šempeter pri Gorici
00050000-564a-0383-2d2e-2e04c7a68273	3311	Šempeter v Savinjski dolini
00050000-564a-0383-36aa-8ea953814fa2	4208	Šenčur
00050000-564a-0383-a12b-f895168a0fa7	2212	Šentilj v Slovenskih goricah
00050000-564a-0383-6fce-77d57e7c0167	8297	Šentjanž
00050000-564a-0383-acab-616644cb3eb3	2373	Šentjanž pri Dravogradu
00050000-564a-0383-432d-8ef8ef007097	8310	Šentjernej
00050000-564a-0383-810c-8459b375623b	3230	Šentjur
00050000-564a-0383-39e6-11da4aa88206	3271	Šentrupert
00050000-564a-0383-1d2b-d8799125dd7f	8232	Šentrupert
00050000-564a-0383-b1b1-8d09847c9d3c	1296	Šentvid pri Stični
00050000-564a-0383-ade7-82abcff27372	8275	Škocjan
00050000-564a-0383-75f1-677c210f6f8b	6281	Škofije
00050000-564a-0383-06e6-e49a116e80ad	4220	Škofja Loka
00050000-564a-0383-65e9-7f05eddd263d	3211	Škofja vas
00050000-564a-0383-aaf8-e77a05b8107d	1291	Škofljica
00050000-564a-0383-f057-e0b07fa2648a	6274	Šmarje
00050000-564a-0383-30a6-817e3b628bec	1293	Šmarje - Sap
00050000-564a-0383-c546-120f80555132	3240	Šmarje pri Jelšah
00050000-564a-0383-efc0-31fc2831f5c6	8220	Šmarješke Toplice
00050000-564a-0383-497d-05a5fa1addc9	2315	Šmartno na Pohorju
00050000-564a-0383-767d-224ba012734a	3341	Šmartno ob Dreti
00050000-564a-0383-9321-b45483070a04	3327	Šmartno ob Paki
00050000-564a-0383-5ef1-f45e6bf3b6d4	1275	Šmartno pri Litiji
00050000-564a-0383-11d5-4e503cb68017	2383	Šmartno pri Slovenj Gradcu
00050000-564a-0383-25a8-c2774be1ecfc	3201	Šmartno v Rožni dolini
00050000-564a-0383-825b-a41b99b9b4cd	3325	Šoštanj
00050000-564a-0383-ef19-4a5c1d413497	6222	Štanjel
00050000-564a-0383-19e2-a1e634e143cb	3220	Štore
00050000-564a-0383-317d-6f7cbec93b22	3304	Tabor
00050000-564a-0383-f08c-c2b3a0d1a897	3221	Teharje
00050000-564a-0383-3177-92f46c4e4d7f	9251	Tišina
00050000-564a-0383-1741-001567205237	5220	Tolmin
00050000-564a-0383-0628-616cc9284e0b	3326	Topolšica
00050000-564a-0383-2c90-01ac8f0330a5	2371	Trbonje
00050000-564a-0383-d464-d6258a7b0e23	1420	Trbovlje
00050000-564a-0383-5c8e-4ee97f2594a0	8231	Trebelno 
00050000-564a-0383-1fe1-861a973ec531	8210	Trebnje
00050000-564a-0383-387d-e87d39ab748d	5252	Trnovo pri Gorici
00050000-564a-0383-a6b3-d1885d4e6b02	2254	Trnovska vas
00050000-564a-0383-3735-7a3fd838c0b5	1222	Trojane
00050000-564a-0383-ff89-e069da2e643a	1236	Trzin
00050000-564a-0383-9b50-0a354d77a1e3	4290	Tržič
00050000-564a-0383-3f52-93d56797131b	8295	Tržišče
00050000-564a-0383-da6f-729353d86f58	1311	Turjak
00050000-564a-0383-8ad7-cbd875dcf378	9224	Turnišče
00050000-564a-0383-22c7-4f42807d1cbc	8323	Uršna sela
00050000-564a-0383-3645-460909ff8edf	1252	Vače
00050000-564a-0383-eb86-72750751addd	3320	Velenje 
00050000-564a-0383-53f8-0086dc7ba018	3322	Velenje - poštni predali
00050000-564a-0383-48aa-db390b9a25f9	8212	Velika Loka
00050000-564a-0383-f22f-de032f3ab25d	2274	Velika Nedelja
00050000-564a-0383-1c35-264acd34461a	9225	Velika Polana
00050000-564a-0383-c7a4-9acf177bcade	1315	Velike Lašče
00050000-564a-0383-67b8-3fff508df1a6	8213	Veliki Gaber
00050000-564a-0383-997b-cc6807a98706	9241	Veržej
00050000-564a-0383-1b1c-71dc89243547	1312	Videm - Dobrepolje
00050000-564a-0383-c47a-c4ef77ce3d83	2284	Videm pri Ptuju
00050000-564a-0383-2d38-5e232839aafd	8344	Vinica
00050000-564a-0383-af30-c186d267d8f8	5271	Vipava
00050000-564a-0383-ed52-0f4abf32d54c	4212	Visoko
00050000-564a-0383-c5e7-e3492ae10ab0	1294	Višnja Gora
00050000-564a-0383-2059-2b408cc1c202	3205	Vitanje
00050000-564a-0383-c12c-fca241ca9028	2255	Vitomarci
00050000-564a-0383-a0bb-9654b18714f8	1217	Vodice
00050000-564a-0383-3ec3-4a2efa86e9d3	3212	Vojnik\t
00050000-564a-0383-6c93-e76112930581	5293	Volčja Draga
00050000-564a-0383-8f90-0bc705f8284f	2232	Voličina
00050000-564a-0383-63c3-5226558d907b	3305	Vransko
00050000-564a-0383-efc3-3a4abe1f7e24	6217	Vremski Britof
00050000-564a-0383-9d2b-4a21ee342895	1360	Vrhnika
00050000-564a-0383-940d-97e48de8d800	2365	Vuhred
00050000-564a-0383-70bf-b208efee15d1	2367	Vuzenica
00050000-564a-0383-82b9-817a5854ac28	8292	Zabukovje 
00050000-564a-0383-b443-57a1b3f230c7	1410	Zagorje ob Savi
00050000-564a-0383-901b-4ad30b15e9e4	1303	Zagradec
00050000-564a-0383-86b1-a0cfa4c887af	2283	Zavrč
00050000-564a-0383-3553-e964aae9502a	8272	Zdole 
00050000-564a-0383-f3aa-a94c0557e6c9	4201	Zgornja Besnica
00050000-564a-0383-4fc7-1b81e906d0ab	2242	Zgornja Korena
00050000-564a-0383-a05a-4a888c3da0fb	2201	Zgornja Kungota
00050000-564a-0383-e1d1-53ddf1a7a69e	2316	Zgornja Ložnica
00050000-564a-0383-3b07-2f1244ee4f3f	2314	Zgornja Polskava
00050000-564a-0383-44ef-423f32d6524d	2213	Zgornja Velka
00050000-564a-0383-2370-0e6fbd33dad2	4247	Zgornje Gorje
00050000-564a-0383-5ec5-9e8cd34f4d03	4206	Zgornje Jezersko
00050000-564a-0383-8f5b-782b43634c9d	2285	Zgornji Leskovec
00050000-564a-0383-f67c-31bd27ce205c	1432	Zidani Most
00050000-564a-0383-07cf-4b26ff908177	3214	Zreče
00050000-564a-0383-915a-ad07549750bc	4209	Žabnica
00050000-564a-0383-57a0-f6cda3a3566c	3310	Žalec
00050000-564a-0383-1e06-b40bdd45d661	4228	Železniki
00050000-564a-0383-7e47-251f2a0fd2e3	2287	Žetale
00050000-564a-0383-f595-237c7cae60bb	4226	Žiri
00050000-564a-0383-25c9-d0ab2627ce56	4274	Žirovnica
00050000-564a-0383-2a6a-dfb1a6370d08	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 27342181)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 27341757)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 27341505)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-564a-0385-91ad-b830b7ffa5f5	00080000-564a-0385-435e-67f6ce1a64d0	\N	00040000-564a-0383-e6f9-356610cf1e58	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-564a-0385-b4fc-662797cf4319	00080000-564a-0385-435e-67f6ce1a64d0	\N	00040000-564a-0383-e6f9-356610cf1e58	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-564a-0385-4c81-9b8b6a222ac1	00080000-564a-0385-8104-0ef96a494d96	\N	00040000-564a-0383-e6f9-356610cf1e58	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 27341649)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-564a-0383-bbb7-ab3f792431ad	novo leto	1	1	\N	t
00430000-564a-0383-0733-2b8e9affe88f	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-564a-0383-5c9d-1914dc2dccaf	dan upora proti okupatorju	27	4	\N	t
00430000-564a-0383-e0d4-7aa647701da2	praznik dela	1	5	\N	t
00430000-564a-0383-fccf-3d536730c5f7	praznik dela	2	5	\N	t
00430000-564a-0383-35ab-aed40af56ff5	dan Primoža Trubarja	8	6	\N	f
00430000-564a-0383-0a33-7813564a7e45	dan državnosti	25	6	\N	t
00430000-564a-0383-6a80-be0e584cb592	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-564a-0383-9e95-7279dc0a0665	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-564a-0383-9170-ef5e3a738fe4	dan suverenosti	25	10	\N	f
00430000-564a-0383-e029-cba31027bada	dan spomina na mrtve	1	11	\N	t
00430000-564a-0383-a266-d18c5ffe561f	dan Rudolfa Maistra	23	11	\N	f
00430000-564a-0383-489b-09f3d70f5096	božič	25	12	\N	t
00430000-564a-0383-1110-5e64e8889525	dan samostojnosti in enotnosti	26	12	\N	t
00430000-564a-0383-763d-cf2fb434d5cc	Marijino vnebovzetje	15	8	\N	t
00430000-564a-0383-4803-aa981c28d94b	dan reformacije	31	10	\N	t
00430000-564a-0383-87a1-29cba30693e6	velikonočna nedelja	27	3	2016	t
00430000-564a-0383-15ea-abc800a48579	velikonočna nedelja	16	4	2017	t
00430000-564a-0383-2a8c-67b89acbb68f	velikonočna nedelja	1	4	2018	t
00430000-564a-0383-9fc7-a15c9bf501b0	velikonočna nedelja	21	4	2019	t
00430000-564a-0383-230d-e6e684eee632	velikonočna nedelja	12	4	2020	t
00430000-564a-0383-0019-23c0a8684874	velikonočna nedelja	4	4	2021	t
00430000-564a-0383-3b12-a2bede37c0cd	velikonočna nedelja	17	4	2022	t
00430000-564a-0383-378c-6aa4a1bb027e	velikonočna nedelja	9	4	2023	t
00430000-564a-0383-6391-d3b64ebbc788	velikonočna nedelja	31	3	2024	t
00430000-564a-0383-a2c3-7c34ddf37cf9	velikonočna nedelja	20	4	2025	t
00430000-564a-0383-2dfd-23d78ccee331	velikonočna nedelja	5	4	2026	t
00430000-564a-0383-71c9-74f66c5eee04	velikonočna nedelja	28	3	2027	t
00430000-564a-0383-fefb-e1e3c76fa228	velikonočna nedelja	16	4	2028	t
00430000-564a-0383-e304-aaf36b682cb0	velikonočna nedelja	1	4	2029	t
00430000-564a-0383-1158-6f08bc41f8b6	velikonočna nedelja	21	4	2030	t
00430000-564a-0383-f475-3319db8dc318	velikonočni ponedeljek	28	3	2016	t
00430000-564a-0383-5419-b9f7b9b3aa78	velikonočni ponedeljek	17	4	2017	t
00430000-564a-0383-bed4-afcace9598e1	velikonočni ponedeljek	2	4	2018	t
00430000-564a-0383-801e-0708be94a727	velikonočni ponedeljek	22	4	2019	t
00430000-564a-0383-2efa-2368fc395730	velikonočni ponedeljek	13	4	2020	t
00430000-564a-0383-9f29-9bf41b5bdcde	velikonočni ponedeljek	5	4	2021	t
00430000-564a-0383-bce2-35e35b193d4a	velikonočni ponedeljek	18	4	2022	t
00430000-564a-0383-3a76-6c3b9ef98b83	velikonočni ponedeljek	10	4	2023	t
00430000-564a-0383-c8df-3a6a0b24d2dc	velikonočni ponedeljek	1	4	2024	t
00430000-564a-0383-6f4d-1322fd8e6f60	velikonočni ponedeljek	21	4	2025	t
00430000-564a-0383-20db-b0d0042b8046	velikonočni ponedeljek	6	4	2026	t
00430000-564a-0383-2a9f-0c093212da96	velikonočni ponedeljek	29	3	2027	t
00430000-564a-0383-a1d6-ec2f86f2b34d	velikonočni ponedeljek	17	4	2028	t
00430000-564a-0383-67d7-68804f98fc63	velikonočni ponedeljek	2	4	2029	t
00430000-564a-0383-c878-e94c0f6b0604	velikonočni ponedeljek	22	4	2030	t
00430000-564a-0383-2012-4d060c0d3c14	binkoštna nedelja - binkošti	15	5	2016	t
00430000-564a-0383-5456-980c78d5d4c1	binkoštna nedelja - binkošti	4	6	2017	t
00430000-564a-0383-4237-baf17e9aaa01	binkoštna nedelja - binkošti	20	5	2018	t
00430000-564a-0383-87f5-64f1bd10774d	binkoštna nedelja - binkošti	9	6	2019	t
00430000-564a-0383-9a79-76f92fa5aad0	binkoštna nedelja - binkošti	31	5	2020	t
00430000-564a-0383-2a37-a262b3e2552a	binkoštna nedelja - binkošti	23	5	2021	t
00430000-564a-0383-3f90-38730666c90e	binkoštna nedelja - binkošti	5	6	2022	t
00430000-564a-0383-7317-26605852d33f	binkoštna nedelja - binkošti	28	5	2023	t
00430000-564a-0383-a5c6-9391792e8065	binkoštna nedelja - binkošti	19	5	2024	t
00430000-564a-0383-baea-090145661456	binkoštna nedelja - binkošti	8	6	2025	t
00430000-564a-0383-7859-19db09bb239b	binkoštna nedelja - binkošti	24	5	2026	t
00430000-564a-0383-481e-fd15cc3421fb	binkoštna nedelja - binkošti	16	5	2027	t
00430000-564a-0383-ce28-30b8f2d62fbd	binkoštna nedelja - binkošti	4	6	2028	t
00430000-564a-0383-a301-28a131301151	binkoštna nedelja - binkošti	20	5	2029	t
00430000-564a-0383-9e48-a400b909226c	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 27341609)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 27341621)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 27341769)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 27342195)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 27342205)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-564a-0385-243f-4de42f1eeb3f	00080000-564a-0385-82b4-d96a4aaa54e9	0987	AK
00190000-564a-0385-6ade-e023e3843916	00080000-564a-0385-8104-0ef96a494d96	0989	AK
00190000-564a-0385-ba9f-a234100132d3	00080000-564a-0385-0791-0b0101e0a8a7	0986	AK
00190000-564a-0385-35ae-5a70fbb3e120	00080000-564a-0385-8627-82ae047154aa	0984	AK
00190000-564a-0385-cfb6-4b468fcfdd87	00080000-564a-0385-cc2a-e7dc6bca3285	0983	AK
00190000-564a-0385-739f-b5cd2c15ee08	00080000-564a-0385-1e4b-b5214820f5e3	0982	AK
00190000-564a-0387-227b-3e6fb9ba99a1	00080000-564a-0387-25b1-8f81e81930d5	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 27342104)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-564a-0385-8fad-1aae2124ebe8	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 27342213)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 27341798)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-564a-0385-2574-9e82ca78d607	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-564a-0385-cdcf-6d492db66d6e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-564a-0385-3e7a-94c7339c10fb	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-564a-0385-ed5f-9e471bf56892	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-564a-0385-539f-68958aeef5d1	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-564a-0385-c8ca-521b7297b47f	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-564a-0385-f4e8-ca0f789e4d65	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 27341742)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 27341732)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 27341943)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 27341873)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 27341583)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 27341345)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-564a-0387-25b1-8f81e81930d5	00010000-564a-0384-2161-7263dd0dae04	2015-11-16 17:25:43	INS	a:0:{}
2	App\\Entity\\Option	00000000-564a-0387-07a7-4eee86fb7b78	00010000-564a-0384-2161-7263dd0dae04	2015-11-16 17:25:43	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-564a-0387-227b-3e6fb9ba99a1	00010000-564a-0384-2161-7263dd0dae04	2015-11-16 17:25:43	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 27341811)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 27341383)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-564a-0383-5c50-18760a381108	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-564a-0383-c3f1-b2756d4192ef	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-564a-0383-8846-95541beda9c0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-564a-0383-9728-c1fc9c865fad	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-564a-0383-3697-ec41c1f84db9	planer	Planer dogodkov v koledarju	t
00020000-564a-0383-43ae-2e68e1b352d3	kadrovska	Kadrovska služba	t
00020000-564a-0383-f12a-1786a043d843	arhivar	Ažuriranje arhivalij	t
00020000-564a-0383-f300-a5b4d7b3e35c	igralec	Igralec	t
00020000-564a-0383-323b-6afd8c888c6e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-564a-0385-d617-c0f7c5be72d5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-564a-0385-7f8b-8478e066e43c	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-564a-0385-b45c-5bcbc027a858	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-564a-0385-8505-3e82fa48522a	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-564a-0385-987d-0f2cdfb46d24	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-564a-0385-96ca-e0621056bcb4	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-564a-0385-d7fa-280d4f18e311	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-564a-0385-c761-6212b0d91516	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-564a-0385-3193-cf79fb874042	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-564a-0385-68ff-4211f46b39f8	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-564a-0385-b2b3-0ef2155a9a6d	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-564a-0385-7081-a1018886c3e7	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-564a-0385-a04d-132f3d486003	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-564a-0385-5b8a-fceee6ef83d7	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-564a-0385-6969-2ccc54056014	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-564a-0385-0ed6-b0868309a3cc	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-564a-0385-dfef-a90d21a3372c	Datoteka-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3099 (class 0 OID 27341367)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-564a-0384-8785-e6e7dd3b688b	00020000-564a-0383-8846-95541beda9c0
00010000-564a-0384-2161-7263dd0dae04	00020000-564a-0383-8846-95541beda9c0
00010000-564a-0385-7bb7-9dd9ee29f1cc	00020000-564a-0385-d617-c0f7c5be72d5
00010000-564a-0385-d133-ba2c451f5577	00020000-564a-0385-7f8b-8478e066e43c
00010000-564a-0385-d133-ba2c451f5577	00020000-564a-0385-96ca-e0621056bcb4
00010000-564a-0385-d133-ba2c451f5577	00020000-564a-0385-68ff-4211f46b39f8
00010000-564a-0385-d133-ba2c451f5577	00020000-564a-0385-7081-a1018886c3e7
00010000-564a-0385-d133-ba2c451f5577	00020000-564a-0385-6969-2ccc54056014
00010000-564a-0385-d133-ba2c451f5577	00020000-564a-0385-dfef-a90d21a3372c
00010000-564a-0385-150b-4bd1991c8a31	00020000-564a-0385-b45c-5bcbc027a858
00010000-564a-0385-150b-4bd1991c8a31	00020000-564a-0385-d7fa-280d4f18e311
00010000-564a-0385-150b-4bd1991c8a31	00020000-564a-0385-b2b3-0ef2155a9a6d
00010000-564a-0385-150b-4bd1991c8a31	00020000-564a-0385-a04d-132f3d486003
00010000-564a-0385-150b-4bd1991c8a31	00020000-564a-0385-0ed6-b0868309a3cc
00010000-564a-0385-a536-bf1a78c13f21	00020000-564a-0385-b45c-5bcbc027a858
00010000-564a-0385-a536-bf1a78c13f21	00020000-564a-0385-d7fa-280d4f18e311
00010000-564a-0385-a536-bf1a78c13f21	00020000-564a-0385-3193-cf79fb874042
00010000-564a-0385-a536-bf1a78c13f21	00020000-564a-0385-b2b3-0ef2155a9a6d
00010000-564a-0385-a536-bf1a78c13f21	00020000-564a-0385-a04d-132f3d486003
00010000-564a-0385-a536-bf1a78c13f21	00020000-564a-0385-0ed6-b0868309a3cc
00010000-564a-0385-cba1-42c2d464d8b7	00020000-564a-0385-b45c-5bcbc027a858
00010000-564a-0385-cba1-42c2d464d8b7	00020000-564a-0385-8505-3e82fa48522a
00010000-564a-0385-cba1-42c2d464d8b7	00020000-564a-0385-d7fa-280d4f18e311
00010000-564a-0385-cba1-42c2d464d8b7	00020000-564a-0385-c761-6212b0d91516
00010000-564a-0385-cba1-42c2d464d8b7	00020000-564a-0385-3193-cf79fb874042
00010000-564a-0385-cba1-42c2d464d8b7	00020000-564a-0385-96ca-e0621056bcb4
00010000-564a-0385-cba1-42c2d464d8b7	00020000-564a-0385-b2b3-0ef2155a9a6d
00010000-564a-0385-cba1-42c2d464d8b7	00020000-564a-0385-a04d-132f3d486003
00010000-564a-0385-cba1-42c2d464d8b7	00020000-564a-0385-0ed6-b0868309a3cc
00010000-564a-0385-6d55-f67813052ce4	00020000-564a-0385-7f8b-8478e066e43c
00010000-564a-0385-6d55-f67813052ce4	00020000-564a-0385-987d-0f2cdfb46d24
00010000-564a-0385-6d55-f67813052ce4	00020000-564a-0385-96ca-e0621056bcb4
00010000-564a-0385-6d55-f67813052ce4	00020000-564a-0385-68ff-4211f46b39f8
00010000-564a-0385-6d55-f67813052ce4	00020000-564a-0385-7081-a1018886c3e7
00010000-564a-0385-6d55-f67813052ce4	00020000-564a-0385-6969-2ccc54056014
00010000-564a-0385-6d55-f67813052ce4	00020000-564a-0385-dfef-a90d21a3372c
\.


--
-- TOC entry 3144 (class 0 OID 27341825)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 27341763)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 27341709)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-564a-0385-e6ab-4496fa9f55dc	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-564a-0385-ca63-67e60a094ebe	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-564a-0385-16dc-0cda1af61449	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 27341332)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-564a-0383-56ed-490dc600325f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-564a-0383-33a7-026ebb28db51	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-564a-0383-a710-b4e0d32d4ae0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-564a-0383-4e26-eb8f7c064219	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-564a-0383-0cee-c7c74741cb47	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 27341324)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-564a-0383-77d3-7e0d811a0bab	00230000-564a-0383-4e26-eb8f7c064219	popa
00240000-564a-0383-5aad-a9fe82db2cf5	00230000-564a-0383-4e26-eb8f7c064219	oseba
00240000-564a-0383-2b72-c500428565f0	00230000-564a-0383-4e26-eb8f7c064219	tippopa
00240000-564a-0383-c096-bb3ffbcf4443	00230000-564a-0383-4e26-eb8f7c064219	organizacijskaenota
00240000-564a-0383-64bf-d6c977ec723c	00230000-564a-0383-4e26-eb8f7c064219	sezona
00240000-564a-0383-090b-dd16c1b18607	00230000-564a-0383-4e26-eb8f7c064219	tipvaje
00240000-564a-0383-0586-a0dfaf33717c	00230000-564a-0383-33a7-026ebb28db51	prostor
00240000-564a-0383-ce56-a020de31b619	00230000-564a-0383-4e26-eb8f7c064219	besedilo
00240000-564a-0383-d47e-1c61f236f288	00230000-564a-0383-4e26-eb8f7c064219	uprizoritev
00240000-564a-0383-7a26-c01eeda69ad0	00230000-564a-0383-4e26-eb8f7c064219	funkcija
00240000-564a-0383-03ea-7492c72a8d14	00230000-564a-0383-4e26-eb8f7c064219	tipfunkcije
00240000-564a-0383-2864-a4fe7ac98370	00230000-564a-0383-4e26-eb8f7c064219	alternacija
00240000-564a-0383-30e5-70d849ce8e2a	00230000-564a-0383-56ed-490dc600325f	pogodba
00240000-564a-0383-93a8-ac9f93fe8a7f	00230000-564a-0383-4e26-eb8f7c064219	zaposlitev
00240000-564a-0383-073c-6655008267b2	00230000-564a-0383-4e26-eb8f7c064219	zvrstuprizoritve
00240000-564a-0383-bf8e-d784cb290ef4	00230000-564a-0383-56ed-490dc600325f	programdela
00240000-564a-0383-acba-d3e9274622a7	00230000-564a-0383-4e26-eb8f7c064219	zapis
\.


--
-- TOC entry 3093 (class 0 OID 27341319)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e3401d79-8c88-4074-ad4c-d4746c4bdddb	00240000-564a-0383-77d3-7e0d811a0bab	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 27341890)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-564a-0385-4d75-d9ec9cede041	000e0000-564a-0385-7c06-12e7504705ab	00080000-564a-0385-435e-67f6ce1a64d0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-564a-0383-d2d1-e8c5c156b60d
00270000-564a-0385-15a5-4e2ccaa57711	000e0000-564a-0385-7c06-12e7504705ab	00080000-564a-0385-435e-67f6ce1a64d0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-564a-0383-d2d1-e8c5c156b60d
\.


--
-- TOC entry 3109 (class 0 OID 27341467)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 27341719)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-564a-0386-b092-349423db34f1	00180000-564a-0385-d5c1-7770647d3123	000c0000-564a-0385-81ff-27cb2110dfe1	00090000-564a-0385-2757-9a8670aa26f5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564a-0386-59af-77d6f7f21478	00180000-564a-0385-d5c1-7770647d3123	000c0000-564a-0385-4143-ae160998dea8	00090000-564a-0385-9d8a-47a0e783af07	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564a-0386-657a-f72415ec36d6	00180000-564a-0385-d5c1-7770647d3123	000c0000-564a-0385-7f68-b1fce8aa560b	00090000-564a-0385-a99f-09a514eb56ac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564a-0386-5501-2f834fe287e9	00180000-564a-0385-d5c1-7770647d3123	000c0000-564a-0385-5412-52e14ddd411a	00090000-564a-0385-b96b-2f87f162cae4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564a-0386-597d-3849675490d2	00180000-564a-0385-d5c1-7770647d3123	000c0000-564a-0385-74cf-1862b8615595	00090000-564a-0385-d7ac-3ff66c625bd6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-564a-0386-c366-411d5ee0851a	00180000-564a-0385-81ea-b2910ba827b0	\N	00090000-564a-0385-d7ac-3ff66c625bd6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-564a-0386-55ef-b71fb5290caa	00180000-564a-0385-81ea-b2910ba827b0	\N	00090000-564a-0385-9d8a-47a0e783af07	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 27341931)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-564a-0383-45ff-dbf90584bac9	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-564a-0383-f514-9b6e39c92d1d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-564a-0383-abbb-d0fedeb92f2d	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-564a-0383-87ed-c1c73563fd77	04	Režija	Režija	Režija	umetnik	30
000f0000-564a-0383-a0d8-77dc6c201918	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-564a-0383-3c2e-e8a5f5fcb96c	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-564a-0383-19cf-54e567d51f35	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-564a-0383-3e3d-79c0d3601455	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-564a-0383-6bf9-66de2ce1ab9e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-564a-0383-cae8-ae168d19a7e4	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-564a-0383-21e9-365a1dd2467d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-564a-0383-fae8-85106835a42e	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-564a-0383-87af-28cbc7a454df	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-564a-0383-e588-f8f85bfc7c22	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-564a-0383-ac35-de25a8ce155e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-564a-0383-ac2e-9726f6937707	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-564a-0383-dc6a-0c50406faa43	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-564a-0383-9bbc-d014a4eac8f7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 27341418)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-564a-0385-9688-f392372c8372	0001	šola	osnovna ali srednja šola
00400000-564a-0385-8d0d-d2601e64c15b	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-564a-0385-6068-ba4c25663fb2	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 27342224)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-564a-0383-111c-6ba862395265	01	Velika predstava	f	1.00	1.00
002b0000-564a-0383-6653-cac5ac9bf7d1	02	Mala predstava	f	0.50	0.50
002b0000-564a-0383-b5ec-77a49091ffce	03	Mala koprodukcija	t	0.40	1.00
002b0000-564a-0383-2322-2e64dfc9aa41	04	Srednja koprodukcija	t	0.70	2.00
002b0000-564a-0383-bee0-9ced17150cfb	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 27341699)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-564a-0383-9afd-b81f2d3314d6	0001	prva vaja	prva vaja
00420000-564a-0383-bd9d-0f934affe9f7	0002	tehnična vaja	tehnična vaja
00420000-564a-0383-716c-02e560121f24	0003	lučna vaja	lučna vaja
00420000-564a-0383-0db9-2a81f558ec9d	0004	kostumska vaja	kostumska vaja
00420000-564a-0383-0710-53aaec0937dc	0005	foto vaja	foto vaja
00420000-564a-0383-576c-4cf0aa2c0cf8	0006	1. glavna vaja	1. glavna vaja
00420000-564a-0383-522a-cf2152027565	0007	2. glavna vaja	2. glavna vaja
00420000-564a-0383-cdeb-f47f6767e060	0008	1. generalka	1. generalka
00420000-564a-0383-94bc-025e6a519d99	0009	2. generalka	2. generalka
00420000-564a-0383-4281-782d1783e551	0010	odprta generalka	odprta generalka
00420000-564a-0383-f1a6-0451c2a4f2cd	0011	obnovitvena vaja	obnovitvena vaja
00420000-564a-0383-f8a7-ea2b3ee15fea	0012	pevska vaja	pevska vaja
00420000-564a-0383-3355-87bff33c3723	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-564a-0383-bda8-2d6ba542963c	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 27341540)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 27341354)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-564a-0384-2161-7263dd0dae04	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROnqXr8TnD90oOR1/zWCVrJegGCc/8lEm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-564a-0385-25e8-cf765f68574f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-564a-0385-7f74-c93a6f25be5c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-564a-0385-0509-c7ec395d5780	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-564a-0385-ca71-7a8f80d2cca1	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-564a-0385-8a00-10781497b842	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-564a-0385-e93c-109ac0de15e6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-564a-0385-50b6-8b236517a7f9	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-564a-0385-ecb3-0325b4b856d1	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-564a-0385-aac5-99c7a74a2fd7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-564a-0385-7bb7-9dd9ee29f1cc	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-564a-0385-4c34-6cbfcd4b0f49	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-564a-0385-d133-ba2c451f5577	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-564a-0385-150b-4bd1991c8a31	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-564a-0385-a536-bf1a78c13f21	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-564a-0385-cba1-42c2d464d8b7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-564a-0385-6d55-f67813052ce4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-564a-0384-8785-e6e7dd3b688b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 27341981)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-564a-0385-01ba-f577bf6f7522	00160000-564a-0385-6da7-ec1e0565e577	\N	00140000-564a-0383-f220-17e3bfc1f11c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-564a-0385-539f-68958aeef5d1
000e0000-564a-0385-7c06-12e7504705ab	00160000-564a-0385-ebc6-800ac1d921ca	\N	00140000-564a-0383-ef94-360228267b1b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-564a-0385-c8ca-521b7297b47f
000e0000-564a-0385-83b7-e42e7f1027e5	\N	\N	00140000-564a-0383-ef94-360228267b1b	00190000-564a-0385-243f-4de42f1eeb3f	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564a-0385-539f-68958aeef5d1
000e0000-564a-0385-74a8-428c7bff4b5c	\N	\N	00140000-564a-0383-ef94-360228267b1b	00190000-564a-0385-243f-4de42f1eeb3f	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-564a-0385-539f-68958aeef5d1
000e0000-564a-0385-f6a5-8256be745ac2	\N	\N	00140000-564a-0383-ef94-360228267b1b	00190000-564a-0385-243f-4de42f1eeb3f	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-564a-0385-2574-9e82ca78d607
000e0000-564a-0385-483f-fc0afb1886d6	\N	\N	00140000-564a-0383-ef94-360228267b1b	00190000-564a-0385-243f-4de42f1eeb3f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-564a-0385-2574-9e82ca78d607
\.


--
-- TOC entry 3123 (class 0 OID 27341639)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-564a-0385-b6bb-d4aa787f079b	\N	000e0000-564a-0385-7c06-12e7504705ab	1	
00200000-564a-0385-2c9f-f247d935a1c2	\N	000e0000-564a-0385-7c06-12e7504705ab	2	
00200000-564a-0385-bd50-fc6c4d08964d	\N	000e0000-564a-0385-7c06-12e7504705ab	3	
00200000-564a-0385-0e98-0af373637711	\N	000e0000-564a-0385-7c06-12e7504705ab	4	
00200000-564a-0385-206a-c8088fd7e31a	\N	000e0000-564a-0385-7c06-12e7504705ab	5	
\.


--
-- TOC entry 3140 (class 0 OID 27341790)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 27341904)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-564a-0383-18e9-5a8c1f143ce8	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-564a-0383-7a9c-340bb477b446	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-564a-0383-8575-e6885f805f0f	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-564a-0383-10ef-9bd774a47937	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-564a-0383-8b05-228e44b9b31e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-564a-0383-b7f6-6a2a3e55e250	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-564a-0383-1c1e-a189092df2f5	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-564a-0383-9f49-89067d98a8d7	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-564a-0383-d2d1-e8c5c156b60d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-564a-0383-c3a3-0d8756f4307a	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-564a-0383-a6b2-68e312aa080b	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-564a-0383-2335-cf9798ca6562	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-564a-0383-df0b-d3b895a97ce2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-564a-0383-20a0-753e0fde1b64	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-564a-0383-47e6-de1f53776b0c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-564a-0383-a0fd-b444a45e22ae	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-564a-0383-1ccd-2282ab787c45	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-564a-0383-657a-5fb501d78aed	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-564a-0383-db36-cc0b600df697	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-564a-0383-b151-0b45120f96f4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-564a-0383-7ecf-cc84932cd45a	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-564a-0383-b73c-6f3804b7cf30	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-564a-0383-b4e0-56c7100e932b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-564a-0383-4ba1-b7eafe5805b9	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-564a-0383-1cb3-0244c7c7b436	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-564a-0383-9586-7689ea35cbf7	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-564a-0383-2cda-67e6367b3e24	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-564a-0383-aceb-287ae86c0c19	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 27342274)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 27342243)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 27342286)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 27341862)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-564a-0385-59e8-f3125afab03b	00090000-564a-0385-9d8a-47a0e783af07	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564a-0385-9f44-a3695883f429	00090000-564a-0385-a99f-09a514eb56ac	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564a-0385-ec42-029b374abef2	00090000-564a-0385-b6fc-fb1ca2a972db	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564a-0385-6def-cfcc0563a844	00090000-564a-0385-d2a9-779648433ad5	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564a-0385-5b15-3bfd682a7ee8	00090000-564a-0385-8c04-4217c0a26883	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-564a-0385-66af-238c616b83b6	00090000-564a-0385-2fca-4dede6474f9e	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 27341683)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 27341971)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-564a-0383-f220-17e3bfc1f11c	01	Drama	drama (SURS 01)
00140000-564a-0383-8818-b691521a8e60	02	Opera	opera (SURS 02)
00140000-564a-0383-3ca5-6e4a3a47ec8b	03	Balet	balet (SURS 03)
00140000-564a-0383-ca92-21fb83020f13	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-564a-0383-c7de-bec92ea57acb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-564a-0383-ef94-360228267b1b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-564a-0383-9b42-f33ea341a4f8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 27341852)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 27341417)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 27342030)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 27342020)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 27341408)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 27341887)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 27341929)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 27342327)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 27341671)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 27341693)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 27341698)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 27342241)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 27341566)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 27342098)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 27341848)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 27341637)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 27341604)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 27341580)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 27341755)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 27342304)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 27342311)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 27342335)
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
-- TOC entry 2726 (class 2606 OID 27341782)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 27341538)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 27341436)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 27341500)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 27341463)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 27341397)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 27341382)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 27341788)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 27341824)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 27341966)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 27341491)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 27341526)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 27342193)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 27341761)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 27341516)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 27341656)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 27341625)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 27341617)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 27341773)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 27342202)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 27342210)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 27342180)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 27342222)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 27341806)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 27341746)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 27341737)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 27341953)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 27341880)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 27341592)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 27341353)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 27341815)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 27341371)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 27341391)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 27341833)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 27341768)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 27341717)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 27341341)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 27341329)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 27341323)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 27341900)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 27341472)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 27341728)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 27341940)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 27341425)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 27342234)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 27341706)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 27341551)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 27341366)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 27341999)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 27341646)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 27341796)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 27341912)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 27342284)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 27342268)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 27342292)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 27341870)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 27341687)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 27341979)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 27341860)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 27341681)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 27341682)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 27341680)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 27341679)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 27341678)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 27341901)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 27341902)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 27341903)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 27342306)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 27342305)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 27341493)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 27341494)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 27341789)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 27342272)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 27342271)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 27342273)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 27342270)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 27342269)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 27341775)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 27341774)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 27341647)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 27341648)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 27341849)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 27341851)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 27341850)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 27341582)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 27341581)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 27342223)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 27341968)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 27341969)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 27341970)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 27342293)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 27342004)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 27342001)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 27342005)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 27342003)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 27342002)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 27341553)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 27341552)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 27341466)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 27341816)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 27341398)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 27341399)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 27341836)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 27341835)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 27341834)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 27341503)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 27341502)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 27341504)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 27341620)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 27341618)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 27341619)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 27341331)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 27341741)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 27341739)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 27341738)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 27341740)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 27341372)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 27341373)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 27341797)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 27342328)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 27341889)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 27341888)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 27342336)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 27342337)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 27341762)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 27341881)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 27341882)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 27342103)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 27342102)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 27342099)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 27342100)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 27342101)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 27341518)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 27341517)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 27341519)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 27341810)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 27341809)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 27342203)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 27342204)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 27342034)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 27342035)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 27342032)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 27342033)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 27341871)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 27341872)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 27341750)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 27341749)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 27341747)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 27341748)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 27342022)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 27342021)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 27341593)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 27341607)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 27341606)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 27341605)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 27341608)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 27341638)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 27341626)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 27341627)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 27342194)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 27342242)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 27342312)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 27342313)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 27341438)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 27341437)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 27341473)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 27341474)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 27341688)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 27341731)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 27341730)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 27341729)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 27341673)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 27341674)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 27341677)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 27341672)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 27341676)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 27341675)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 27341492)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 27341426)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 27341427)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 27341567)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 27341569)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 27341568)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 27341570)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 27341756)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 27341967)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 27342000)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 27341941)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 27341942)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 27341464)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 27341465)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 27341861)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 27341342)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 27341539)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 27341501)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 27341330)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 27342235)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 27341808)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 27341807)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 27341707)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 27341708)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 27342031)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 27341527)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 27341980)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 27342285)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 27342211)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 27342212)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 27341930)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 27341718)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 27341392)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 27342508)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 27342513)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 27342538)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 27342528)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 27342503)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 27342523)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 27342533)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 27342518)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 27342708)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 27342713)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 27342718)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 27342883)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 27342878)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 27342393)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 27342398)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 27342623)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 27342863)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 27342858)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 27342868)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 27342853)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 27342848)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 27342618)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 27342613)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 27342493)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 27342498)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 27342663)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 27342673)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 27342668)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 27342448)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 27342443)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 27342603)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 27342838)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 27342723)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 27342728)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 27342733)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 27342873)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 27342753)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 27342738)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 27342758)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 27342748)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 27342743)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 27342438)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 27342433)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 27342378)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 27342373)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 27342643)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 27342353)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 27342358)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 27342658)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 27342653)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 27342648)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 27342408)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 27342403)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 27342413)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 27342473)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 27342463)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 27342468)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 27342338)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 27342578)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 27342568)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 27342563)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 27342573)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 27342343)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 27342348)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 27342628)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 27342898)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 27342703)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 27342698)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 27342903)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 27342908)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 27342608)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 27342688)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 27342693)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 27342813)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 27342808)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 27342793)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 27342798)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 27342803)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 27342423)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 27342418)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 27342428)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 27342638)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 27342633)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 27342823)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 27342828)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 27342783)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 27342788)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 27342773)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 27342778)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 27342678)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 27342683)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 27342598)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 27342593)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 27342583)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 27342588)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 27342768)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 27342763)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 27342453)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 27342458)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 27342488)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 27342478)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 27342483)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 27342818)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 27342833)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 27342843)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 27342888)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 27342893)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 27342368)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 27342363)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 27342383)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 27342388)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 27342543)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 27342558)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 27342553)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 27342548)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-16 17:25:45 CET

--
-- PostgreSQL database dump complete
--

