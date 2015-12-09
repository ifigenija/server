--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-09 16:37:05 CET

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
-- TOC entry 183 (class 1259 OID 31801632)
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
-- TOC entry 237 (class 1259 OID 31802246)
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
-- TOC entry 236 (class 1259 OID 31802229)
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
-- TOC entry 182 (class 1259 OID 31801625)
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
-- TOC entry 181 (class 1259 OID 31801623)
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
-- TOC entry 227 (class 1259 OID 31802106)
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
-- TOC entry 230 (class 1259 OID 31802136)
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
-- TOC entry 251 (class 1259 OID 31802539)
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
-- TOC entry 203 (class 1259 OID 31801880)
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
-- TOC entry 205 (class 1259 OID 31801912)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 31801917)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 31802461)
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
-- TOC entry 194 (class 1259 OID 31801777)
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
-- TOC entry 238 (class 1259 OID 31802259)
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
-- TOC entry 223 (class 1259 OID 31802060)
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
-- TOC entry 200 (class 1259 OID 31801851)
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
-- TOC entry 197 (class 1259 OID 31801817)
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
-- TOC entry 195 (class 1259 OID 31801794)
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
-- TOC entry 212 (class 1259 OID 31801974)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 31802519)
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
-- TOC entry 250 (class 1259 OID 31802532)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 31802554)
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
-- TOC entry 216 (class 1259 OID 31801999)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 31801751)
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
-- TOC entry 185 (class 1259 OID 31801651)
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
-- TOC entry 189 (class 1259 OID 31801718)
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
-- TOC entry 186 (class 1259 OID 31801662)
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
-- TOC entry 178 (class 1259 OID 31801597)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 31801616)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 31802006)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 31802040)
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
-- TOC entry 233 (class 1259 OID 31802177)
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
-- TOC entry 188 (class 1259 OID 31801698)
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
-- TOC entry 191 (class 1259 OID 31801743)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 31802405)
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
-- TOC entry 213 (class 1259 OID 31801980)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 31801728)
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
-- TOC entry 202 (class 1259 OID 31801872)
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
-- TOC entry 198 (class 1259 OID 31801832)
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
-- TOC entry 199 (class 1259 OID 31801844)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 31801992)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 31802419)
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
-- TOC entry 242 (class 1259 OID 31802429)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 31802328)
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
-- TOC entry 243 (class 1259 OID 31802437)
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
-- TOC entry 219 (class 1259 OID 31802021)
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
-- TOC entry 211 (class 1259 OID 31801965)
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
-- TOC entry 210 (class 1259 OID 31801955)
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
-- TOC entry 232 (class 1259 OID 31802166)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 31802096)
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
-- TOC entry 196 (class 1259 OID 31801806)
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
-- TOC entry 175 (class 1259 OID 31801568)
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
-- TOC entry 174 (class 1259 OID 31801566)
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
-- TOC entry 220 (class 1259 OID 31802034)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 31801606)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 31801590)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 31802048)
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
-- TOC entry 214 (class 1259 OID 31801986)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 31801932)
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
-- TOC entry 173 (class 1259 OID 31801555)
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
-- TOC entry 172 (class 1259 OID 31801547)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 31801542)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 31802113)
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
-- TOC entry 187 (class 1259 OID 31801690)
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
-- TOC entry 209 (class 1259 OID 31801942)
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
-- TOC entry 231 (class 1259 OID 31802154)
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
-- TOC entry 184 (class 1259 OID 31801641)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 31802449)
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
-- TOC entry 207 (class 1259 OID 31801922)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 31801763)
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
-- TOC entry 176 (class 1259 OID 31801577)
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
-- TOC entry 235 (class 1259 OID 31802204)
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
-- TOC entry 201 (class 1259 OID 31801862)
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
-- TOC entry 218 (class 1259 OID 31802013)
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
-- TOC entry 229 (class 1259 OID 31802127)
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
-- TOC entry 247 (class 1259 OID 31802499)
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
-- TOC entry 246 (class 1259 OID 31802468)
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
-- TOC entry 248 (class 1259 OID 31802511)
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
-- TOC entry 225 (class 1259 OID 31802085)
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
-- TOC entry 204 (class 1259 OID 31801906)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 31802194)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 31802075)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 31801628)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 31801571)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 31801632)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5668-4a9e-748f-f1fca3ac531b	10	30	Otroci	Abonma za otroke	200
000a0000-5668-4a9e-9648-9e7e63f1daf7	20	60	Mladina	Abonma za mladino	400
000a0000-5668-4a9e-8c08-b8d17faf3287	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 31802246)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5668-4a9e-63be-65d7894f2cbd	000d0000-5668-4a9e-dc51-397fd42de01c	\N	00090000-5668-4a9e-ef18-e2d491b8bef0	000b0000-5668-4a9e-c58e-a821f467c177	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5668-4a9e-9d98-90c9b6ed2ff6	000d0000-5668-4a9e-f9f7-8a9f96a264ba	00100000-5668-4a9e-afc7-342a3a0b3ed9	00090000-5668-4a9e-6782-19cfd6e977e3	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5668-4a9e-ec03-246b7cd22d10	000d0000-5668-4a9e-d5d3-89e4c6b1d97b	00100000-5668-4a9e-5301-75e683150c4f	00090000-5668-4a9e-7b4f-60ef2b2776cc	\N	0003	t	\N	2015-12-09	\N	2	t	\N	f	f
000c0000-5668-4a9e-271b-8dc2356ba8e0	000d0000-5668-4a9e-f2fe-0042f5a636af	\N	00090000-5668-4a9e-30a3-48e7a3afec30	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5668-4a9e-7d47-c6ad7c52a07d	000d0000-5668-4a9e-9ac5-bf61e46e0644	\N	00090000-5668-4a9e-c729-57c6d9c5c145	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5668-4a9e-35e6-cbe15a9ee26d	000d0000-5668-4a9e-40d7-f8c2784a1b78	\N	00090000-5668-4a9e-320f-b32aa2b41ccb	000b0000-5668-4a9e-c1c4-ebb319c65a32	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5668-4a9e-8d1a-e0c1dd387ac5	000d0000-5668-4a9e-c4f7-70b3e7600668	00100000-5668-4a9e-263d-a36a2840c071	00090000-5668-4a9e-6d8b-fea5903dfafb	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5668-4a9e-f367-fd4b54bc3c48	000d0000-5668-4a9e-6940-5ddb9c2b12fc	\N	00090000-5668-4a9e-78d8-67d10be370f6	000b0000-5668-4a9e-c777-70fe078a12da	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5668-4a9e-d889-02ea8f21f451	000d0000-5668-4a9e-c4f7-70b3e7600668	00100000-5668-4a9e-663f-cd5372afcf1d	00090000-5668-4a9e-2e97-de48031dca13	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5668-4a9e-2b81-81e8fa978b83	000d0000-5668-4a9e-c4f7-70b3e7600668	00100000-5668-4a9e-b199-72df2d9d956e	00090000-5668-4a9e-3c03-ade2e52616f4	\N	0010	t	\N	2015-12-09	\N	16	f	\N	f	t
000c0000-5668-4a9e-8d96-db7587090be8	000d0000-5668-4a9e-c4f7-70b3e7600668	00100000-5668-4a9e-fc7d-6078a69cfe60	00090000-5668-4a9e-a8d6-e6c2b4e55716	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5668-4a9e-ecb0-31f661c07364	000d0000-5668-4a9e-06b0-ee3e3b012834	00100000-5668-4a9e-afc7-342a3a0b3ed9	00090000-5668-4a9e-6782-19cfd6e977e3	000b0000-5668-4a9e-235a-29214bafb7d5	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 31802229)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 31801625)
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
-- TOC entry 3151 (class 0 OID 31802106)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5668-4a9e-aa0a-9e9195d1d448	00160000-5668-4a9e-813e-4c1d7ac85cf4	00090000-5668-4a9e-dc46-a51f256d93f8	aizv	10	t
003d0000-5668-4a9e-84dd-5d6aa9a94b62	00160000-5668-4a9e-813e-4c1d7ac85cf4	00090000-5668-4a9e-f729-b3d72947c8ae	apri	14	t
003d0000-5668-4a9e-382e-876769b37244	00160000-5668-4a9e-27bc-dd82c631aed3	00090000-5668-4a9e-b005-88b058df6132	aizv	11	t
003d0000-5668-4a9e-ad86-d30aea06dffb	00160000-5668-4a9e-3c57-16c85cb20a75	00090000-5668-4a9e-6e42-4c2e7bfe00b9	aizv	12	t
003d0000-5668-4a9e-1e28-5accaa5a8a80	00160000-5668-4a9e-813e-4c1d7ac85cf4	00090000-5668-4a9e-de3a-62d21dd4a152	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 31802136)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5668-4a9e-813e-4c1d7ac85cf4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5668-4a9e-27bc-dd82c631aed3	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5668-4a9e-3c57-16c85cb20a75	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 31802539)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 31801880)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5668-4a9e-2d48-3aa6e38e4fee	\N	\N	00200000-5668-4a9e-b2f7-d7ef501cff73	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5668-4a9e-359e-70a2bd319ed0	\N	\N	00200000-5668-4a9e-1935-3baca88f0321	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5668-4a9e-adfe-c376a7d975f6	\N	\N	00200000-5668-4a9e-7e11-3e35fe2714df	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5668-4a9e-9405-6ed49fb17250	\N	\N	00200000-5668-4a9e-692e-dc4cf2d8e173	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5668-4a9e-72db-b8b00307d0d9	\N	\N	00200000-5668-4a9e-d2fa-5c0290fe3885	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 31801912)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 31801917)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 31802461)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 31801777)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5668-4a9b-de46-1f0189761ec6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5668-4a9b-f80a-44836f52a9b9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5668-4a9b-fd38-5c4988b52a42	AL	ALB	008	Albania 	Albanija	\N
00040000-5668-4a9b-b0a5-babacd154520	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5668-4a9b-f9e4-ebcf90becf84	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5668-4a9b-f7f3-892c76be861e	AD	AND	020	Andorra 	Andora	\N
00040000-5668-4a9b-37c0-372387c11979	AO	AGO	024	Angola 	Angola	\N
00040000-5668-4a9b-1bd2-9b2c6543ca16	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5668-4a9b-9c08-35e89808e4ea	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5668-4a9b-f770-921ec420763d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5668-4a9b-0833-da31b0f4bedd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5668-4a9b-c22c-75123c676269	AM	ARM	051	Armenia 	Armenija	\N
00040000-5668-4a9b-5283-d8a381f2d28f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5668-4a9b-ac53-845769f93023	AU	AUS	036	Australia 	Avstralija	\N
00040000-5668-4a9b-1505-0ff3805ac476	AT	AUT	040	Austria 	Avstrija	\N
00040000-5668-4a9b-b831-8f74bf55912a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5668-4a9b-f3b1-f2f4e2ddbd00	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5668-4a9b-df6d-7a3a9d8dfbf6	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5668-4a9b-9dff-462b803ba4be	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5668-4a9b-cf75-4cba827c32f2	BB	BRB	052	Barbados 	Barbados	\N
00040000-5668-4a9b-8f03-e8e6bc7e5d82	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5668-4a9b-ff2c-db87efcba0f1	BE	BEL	056	Belgium 	Belgija	\N
00040000-5668-4a9b-7005-7292299259dc	BZ	BLZ	084	Belize 	Belize	\N
00040000-5668-4a9b-b5d1-9c0a2900604a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5668-4a9b-29dc-fad5bae45948	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5668-4a9b-acce-79df56fd9ffa	BT	BTN	064	Bhutan 	Butan	\N
00040000-5668-4a9b-4ae2-7d744aa16e27	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5668-4a9b-3bba-59ec823c9aec	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5668-4a9b-2fef-963ef0ca87dd	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5668-4a9b-9f9c-65aac5ef53c9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5668-4a9b-731a-9c1f1f475bd0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5668-4a9b-19ed-aaecbf5c8c4b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5668-4a9b-c54d-cf7e0775dba9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5668-4a9b-19db-6b243f75535c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5668-4a9b-9cc3-9f280b35ab08	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5668-4a9b-f6a0-b1b1ea713577	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5668-4a9b-f407-1b6d36bc2b79	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5668-4a9b-9afc-4bd460605b07	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5668-4a9b-f827-7d3c5366f7a7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5668-4a9b-eb76-db1906e3c44a	CA	CAN	124	Canada 	Kanada	\N
00040000-5668-4a9b-80a3-3282717ae2f5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5668-4a9b-dff0-4b9cceedccca	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5668-4a9b-09ea-e39ae51770a5	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5668-4a9b-cd3e-dba3f6afa85a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5668-4a9b-ca9d-edd0e79177f1	CL	CHL	152	Chile 	Čile	\N
00040000-5668-4a9b-52ce-149bca9567f3	CN	CHN	156	China 	Kitajska	\N
00040000-5668-4a9b-7368-fbdd78cac410	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5668-4a9b-9663-7aff6ee28bd8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5668-4a9b-ec9d-3c5312a9ba19	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5668-4a9b-188e-340602d30db2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5668-4a9b-969d-7f1a7773fd2a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5668-4a9b-b67c-f0b628f68813	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5668-4a9b-04f6-cfa868a81726	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5668-4a9b-6041-effaacb98ff8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5668-4a9b-df32-e658ee5e1a2a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5668-4a9b-f0a2-4af384e8a5cb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5668-4a9b-6089-cf903a38651b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5668-4a9b-3047-dd710bc19506	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5668-4a9b-27bf-59234f51677d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5668-4a9b-626c-d8f86f3faed7	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5668-4a9b-a160-9d0e3a5f6d6d	DK	DNK	208	Denmark 	Danska	\N
00040000-5668-4a9b-1ca6-0421edb856b7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5668-4a9b-4167-682041124091	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5668-4a9b-3013-27eb1a10f255	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5668-4a9b-07f2-6112a0c65cfd	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5668-4a9b-dcd9-1d6b7d49e9d8	EG	EGY	818	Egypt 	Egipt	\N
00040000-5668-4a9b-3205-053edb2790c4	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5668-4a9b-5560-b909399a8c97	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5668-4a9b-253e-54b526b6ec8d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5668-4a9b-500c-cb49eaa59598	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5668-4a9b-3372-88881d5730a9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5668-4a9b-4c6f-78bae70c0268	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5668-4a9b-7b06-70e4f8367b37	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5668-4a9b-4022-f514f15e4dd7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5668-4a9b-10b6-e6bb56fa7a6f	FI	FIN	246	Finland 	Finska	\N
00040000-5668-4a9b-8559-39f8cd771464	FR	FRA	250	France 	Francija	\N
00040000-5668-4a9b-395a-9b6c65cc73e1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5668-4a9b-ea0f-02eb63378d96	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5668-4a9b-299d-7e6887925270	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5668-4a9b-b79b-200c6d486533	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5668-4a9b-8772-2727173d5ff2	GA	GAB	266	Gabon 	Gabon	\N
00040000-5668-4a9b-f342-8f67033ed575	GM	GMB	270	Gambia 	Gambija	\N
00040000-5668-4a9b-d291-3898a1ef9e30	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5668-4a9b-f8cc-69190fa914c0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5668-4a9b-6c45-cffb861b291b	GH	GHA	288	Ghana 	Gana	\N
00040000-5668-4a9b-3c41-5c754669bf09	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5668-4a9b-22b2-147ce5bc27cd	GR	GRC	300	Greece 	Grčija	\N
00040000-5668-4a9b-4ac6-3ae7345bcf83	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5668-4a9b-89b6-f72d504d6ee6	GD	GRD	308	Grenada 	Grenada	\N
00040000-5668-4a9b-11c7-c151ee84367c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5668-4a9b-5cdb-672d7b1b2a5c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5668-4a9b-c7fd-74d088428522	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5668-4a9b-88e0-28daa21f6ef3	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5668-4a9b-e117-d5f54c3789d7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5668-4a9b-024e-976be3824775	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5668-4a9b-b40d-50d1c3c70fc0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5668-4a9b-a178-d41a27e43889	HT	HTI	332	Haiti 	Haiti	\N
00040000-5668-4a9b-8e69-cb926c349809	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5668-4a9b-b988-6fc4b31f15a7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5668-4a9b-8cdd-8d18e46dc31c	HN	HND	340	Honduras 	Honduras	\N
00040000-5668-4a9b-e953-53c511b59355	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5668-4a9b-dd29-57912b484dcd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5668-4a9b-afcd-7faa6a307b21	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5668-4a9b-0d9d-054faa76607f	IN	IND	356	India 	Indija	\N
00040000-5668-4a9b-c57e-f687c003f33d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5668-4a9b-6e86-78d1feac9852	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5668-4a9b-b711-94939a50307a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5668-4a9b-a1e6-2002c1e705be	IE	IRL	372	Ireland 	Irska	\N
00040000-5668-4a9b-515e-b647ce3541a8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5668-4a9b-478f-ea9363e0cbf7	IL	ISR	376	Israel 	Izrael	\N
00040000-5668-4a9b-acf8-f5ea1ee98790	IT	ITA	380	Italy 	Italija	\N
00040000-5668-4a9b-003a-20c3e5f336c2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5668-4a9b-f7b0-93ba14bc4bf1	JP	JPN	392	Japan 	Japonska	\N
00040000-5668-4a9b-1596-07f0d2cd2118	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5668-4a9b-f943-39ba59db813c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5668-4a9b-53cc-8007b0e0e7b0	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5668-4a9b-5828-6b933a99c722	KE	KEN	404	Kenya 	Kenija	\N
00040000-5668-4a9b-46d5-cf7e2ed9a841	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5668-4a9b-7c83-acf2fcb378f0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5668-4a9b-6e38-ea817e68bfc3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5668-4a9b-2f80-0bd57c54038a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5668-4a9b-0348-89716913c1a8	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5668-4a9b-b462-1050c34937b9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5668-4a9b-b9ee-b1a0c44fc030	LV	LVA	428	Latvia 	Latvija	\N
00040000-5668-4a9b-66d2-c85d31498b5a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5668-4a9b-a102-8b003defae6e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5668-4a9b-5cb5-245a5c6742cb	LR	LBR	430	Liberia 	Liberija	\N
00040000-5668-4a9b-0805-8eac1428e484	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5668-4a9b-b83f-c449ab674f06	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5668-4a9b-0ef0-1c37de3c6e9f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5668-4a9b-431a-364d098ea8f4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5668-4a9b-8a53-228b37543c20	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5668-4a9b-7cbe-86985c096423	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5668-4a9b-4bb4-5a66076c6460	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5668-4a9b-0d4d-ad70080ff6bc	MW	MWI	454	Malawi 	Malavi	\N
00040000-5668-4a9b-88aa-c734df2df47b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5668-4a9b-4870-4d22a8dbe5fd	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5668-4a9b-bfe3-91e14b3ce8a2	ML	MLI	466	Mali 	Mali	\N
00040000-5668-4a9b-e676-0b293b2f7b72	MT	MLT	470	Malta 	Malta	\N
00040000-5668-4a9b-c9e0-a7a556f62053	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5668-4a9b-674e-4e017ffb2d95	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5668-4a9b-ea65-e10d0dfe64be	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5668-4a9b-63b3-c44e353be556	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5668-4a9b-0098-f1874445f320	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5668-4a9b-edc9-6b6264bd73c1	MX	MEX	484	Mexico 	Mehika	\N
00040000-5668-4a9b-de11-cf9583d8a96b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5668-4a9b-20bb-5cc641afadb4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5668-4a9b-3bdc-1db0c604f4fc	MC	MCO	492	Monaco 	Monako	\N
00040000-5668-4a9b-c99f-b93d3843ca60	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5668-4a9b-15a8-7c674c10ea00	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5668-4a9b-2537-d7bc5d276007	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5668-4a9b-1cde-6829b5c4d9fe	MA	MAR	504	Morocco 	Maroko	\N
00040000-5668-4a9b-6895-50a3abfe131f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5668-4a9b-6968-d2f104bb6a3e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5668-4a9b-cecd-ac27af41444d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5668-4a9b-a97f-22fd21b238bf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5668-4a9b-15db-f637a73e2299	NP	NPL	524	Nepal 	Nepal	\N
00040000-5668-4a9b-0e66-c1fcfb8c8bae	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5668-4a9b-61c4-8ee32e3b9206	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5668-4a9b-39e0-160ba76e6966	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5668-4a9b-fce9-77ba5aad2269	NE	NER	562	Niger 	Niger 	\N
00040000-5668-4a9b-28e3-cd75d1faaaa8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5668-4a9b-d848-2fda2dd5fcb7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5668-4a9b-d0eb-8c88e92b8e57	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5668-4a9b-5997-2925b00ae945	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5668-4a9b-0832-69dd1a394f95	NO	NOR	578	Norway 	Norveška	\N
00040000-5668-4a9b-7d80-8be92241e95b	OM	OMN	512	Oman 	Oman	\N
00040000-5668-4a9b-1502-db8d1592df9f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5668-4a9b-ecd5-4af31b5457dc	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5668-4a9b-f027-1395670c41dc	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5668-4a9b-44db-b7b9f2ffdb03	PA	PAN	591	Panama 	Panama	\N
00040000-5668-4a9b-7a89-5d1c67de37fb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5668-4a9b-cbc1-6cdbc23a51e6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5668-4a9b-3de6-f0a0cd502edb	PE	PER	604	Peru 	Peru	\N
00040000-5668-4a9b-7353-538ceb537dfb	PH	PHL	608	Philippines 	Filipini	\N
00040000-5668-4a9b-c603-0b769745f6a7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5668-4a9b-9b5f-ddd542453332	PL	POL	616	Poland 	Poljska	\N
00040000-5668-4a9b-9ab8-69b016463c19	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5668-4a9b-6b68-9485c1327b54	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5668-4a9b-ef89-8b58bfb34ccc	QA	QAT	634	Qatar 	Katar	\N
00040000-5668-4a9b-56a6-67bd0a2b65b1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5668-4a9b-f198-58a2f1c36173	RO	ROU	642	Romania 	Romunija	\N
00040000-5668-4a9b-279f-05e0da55db5d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5668-4a9b-c86d-357a6def1bce	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5668-4a9b-11c2-d8b77b0c2d00	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5668-4a9b-cabc-1976c2965db8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5668-4a9c-e26d-6d97d0016648	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5668-4a9c-ed05-8ad0eb165717	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5668-4a9c-000d-fb6c8234fe5a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5668-4a9c-7d12-eeafcafe6aa2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5668-4a9c-cd58-843182f44a1a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5668-4a9c-2d4b-a10d32776716	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5668-4a9c-0ed0-316e3a4697da	SM	SMR	674	San Marino 	San Marino	\N
00040000-5668-4a9c-6737-b941d6acb5fd	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5668-4a9c-6ff8-de97641c34f6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5668-4a9c-507e-b84ee7a16d2d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5668-4a9c-a460-9b24729ec90f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5668-4a9c-0916-7fca019be70d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5668-4a9c-94f4-b3e85293facf	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5668-4a9c-ef8b-4e5ff5fa9556	SG	SGP	702	Singapore 	Singapur	\N
00040000-5668-4a9c-c1ad-482b45d03749	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5668-4a9c-89eb-b4e7eb074108	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5668-4a9c-73ff-8cb313726f4c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5668-4a9c-648a-59a985fbbd19	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5668-4a9c-8585-b9fad7c17352	SO	SOM	706	Somalia 	Somalija	\N
00040000-5668-4a9c-2664-ef92ad9ab6f7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5668-4a9c-3f69-2785b92db595	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5668-4a9c-337b-e6c1bce8593c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5668-4a9c-7165-c280af7be429	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5668-4a9c-3ae9-d84a46eddfd6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5668-4a9c-7dce-09e78dd28951	SD	SDN	729	Sudan 	Sudan	\N
00040000-5668-4a9c-78ae-c7a6edbb6df5	SR	SUR	740	Suriname 	Surinam	\N
00040000-5668-4a9c-bba3-a9b2f34c2728	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5668-4a9c-5216-1fbc155309bd	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5668-4a9c-c7f8-726951619e76	SE	SWE	752	Sweden 	Švedska	\N
00040000-5668-4a9c-b310-d6f355c9c101	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5668-4a9c-77fb-25041fda59f0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5668-4a9c-e65b-855b00a92f94	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5668-4a9c-13be-1bdf33a62817	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5668-4a9c-1eb6-5d6e52ee05cc	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5668-4a9c-ddd6-51754476fe19	TH	THA	764	Thailand 	Tajska	\N
00040000-5668-4a9c-275f-6abc2ff96eae	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5668-4a9c-7531-bef8376e02fe	TG	TGO	768	Togo 	Togo	\N
00040000-5668-4a9c-8018-725fbdc708cc	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5668-4a9c-315d-8f03cff8aac2	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5668-4a9c-70dd-2ef1ae2ab97d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5668-4a9c-6b16-a9b1a430f5d5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5668-4a9c-fdd7-d0474e00680f	TR	TUR	792	Turkey 	Turčija	\N
00040000-5668-4a9c-b398-ae033d57d089	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5668-4a9c-d34f-12ab3cc657f0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5668-4a9c-d040-77e672b90b40	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5668-4a9c-e666-7b9bcdc5ac4a	UG	UGA	800	Uganda 	Uganda	\N
00040000-5668-4a9c-f5a9-ca8386494f05	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5668-4a9c-beef-1cb56e0dfe30	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5668-4a9c-2665-33cef8a55aaa	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5668-4a9c-751f-551ebaa7577f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5668-4a9c-f25c-f3ebf89c6665	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5668-4a9c-400f-136c08e713c9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5668-4a9c-28cf-e4d8bfe36a29	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5668-4a9c-7694-2f59b9ee27a9	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5668-4a9c-1c8a-e11578fcd99a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5668-4a9c-e131-7fd75b83f36b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5668-4a9c-1569-613c592f8ea5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5668-4a9c-3365-1a6feb1636ff	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5668-4a9c-1af7-870fa994001e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5668-4a9c-5e17-64e4096db1d1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5668-4a9c-e337-d23f31f18d5a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5668-4a9c-88db-b3a94305f208	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5668-4a9c-df0d-86252887f273	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 31802259)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5668-4a9e-dfa7-20deb2ac394a	000e0000-5668-4a9e-6628-616c2c9a5e2c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5668-4a9b-f5f1-f41810ff2325	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5668-4a9e-2255-9ecbbe1123c7	000e0000-5668-4a9e-a19c-03aa05acc87e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5668-4a9b-67ae-823eae3a3192	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5668-4a9e-c3d6-d66f6facd9bf	000e0000-5668-4a9e-3ba9-27f978a0fbf3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5668-4a9b-f5f1-f41810ff2325	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5668-4a9e-2d25-669739ad43b9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5668-4a9e-b60d-0ecaff9d9ffb	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 31802060)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5668-4a9e-c4f7-70b3e7600668	000e0000-5668-4a9e-a19c-03aa05acc87e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5668-4a9b-d569-d1a74fbe133c
000d0000-5668-4a9e-dc51-397fd42de01c	000e0000-5668-4a9e-a19c-03aa05acc87e	000c0000-5668-4a9e-63be-65d7894f2cbd	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5668-4a9b-d569-d1a74fbe133c
000d0000-5668-4a9e-f9f7-8a9f96a264ba	000e0000-5668-4a9e-a19c-03aa05acc87e	000c0000-5668-4a9e-9d98-90c9b6ed2ff6	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5668-4a9b-35ca-295029618722
000d0000-5668-4a9e-d5d3-89e4c6b1d97b	000e0000-5668-4a9e-a19c-03aa05acc87e	000c0000-5668-4a9e-ec03-246b7cd22d10	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5668-4a9b-4b6d-5424be65f967
000d0000-5668-4a9e-f2fe-0042f5a636af	000e0000-5668-4a9e-a19c-03aa05acc87e	000c0000-5668-4a9e-271b-8dc2356ba8e0	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5668-4a9b-b75e-f052bde26bfc
000d0000-5668-4a9e-9ac5-bf61e46e0644	000e0000-5668-4a9e-a19c-03aa05acc87e	000c0000-5668-4a9e-7d47-c6ad7c52a07d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5668-4a9b-b75e-f052bde26bfc
000d0000-5668-4a9e-40d7-f8c2784a1b78	000e0000-5668-4a9e-a19c-03aa05acc87e	000c0000-5668-4a9e-35e6-cbe15a9ee26d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5668-4a9b-d569-d1a74fbe133c
000d0000-5668-4a9e-6940-5ddb9c2b12fc	000e0000-5668-4a9e-a19c-03aa05acc87e	000c0000-5668-4a9e-f367-fd4b54bc3c48	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5668-4a9b-3986-d7a7825df1f7
000d0000-5668-4a9e-06b0-ee3e3b012834	000e0000-5668-4a9e-a19c-03aa05acc87e	000c0000-5668-4a9e-ecb0-31f661c07364	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5668-4a9b-c5a3-7d49d50b24a4
\.


--
-- TOC entry 3124 (class 0 OID 31801851)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 31801817)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 31801794)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5668-4a9e-31f1-10d22f361214	00080000-5668-4a9e-5d61-902efbc0fbbb	00090000-5668-4a9e-3c03-ade2e52616f4	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 31801974)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 31802519)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5668-4a9e-3b61-51c844807f44	00010000-5668-4a9c-f863-f1f71256aeef	\N	Prva mapa	Root mapa	2015-12-09 16:37:02	2015-12-09 16:37:02	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 31802532)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 31802554)
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
-- TOC entry 3140 (class 0 OID 31801999)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 31801751)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5668-4a9c-4b71-17362237a81b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5668-4a9c-e3a3-361f3f95e239	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5668-4a9c-26e8-ed04b1385f1b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5668-4a9c-3a39-4f5d6ed02ef1	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5668-4a9c-f070-548d56bc52d4	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5668-4a9c-be21-67714e0b895c	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5668-4a9c-2cb0-2a94077e1157	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5668-4a9c-e8d9-78590324b4f5	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5668-4a9c-15ee-f779dee17e7a	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5668-4a9c-38d9-b5f0fd02c20c	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5668-4a9c-0717-d2807a78633b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5668-4a9c-205c-0cef8711dddd	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5668-4a9c-909b-2c92e7130c2c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5668-4a9c-607d-061010da0219	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5668-4a9e-e605-221c6bca6248	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5668-4a9e-f4a6-7e8c3f0fcefb	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5668-4a9e-a921-89b43623dbeb	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5668-4a9e-f6bf-572db12b350e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5668-4a9e-1a75-390baf4841fc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5668-4aa0-c399-c32a8dcc6173	application.tenant.maticnopodjetje	string	s:36:"00080000-5668-4aa0-8297-94e8a004fffa";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 31801651)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5668-4a9e-dad4-361241e7410d	00000000-5668-4a9e-e605-221c6bca6248	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5668-4a9e-8bf7-60f468f4e371	00000000-5668-4a9e-e605-221c6bca6248	00010000-5668-4a9c-f863-f1f71256aeef	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5668-4a9e-cd90-2e2fa31bb938	00000000-5668-4a9e-f4a6-7e8c3f0fcefb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 31801718)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5668-4a9e-3ac4-2057f2943a9f	\N	00100000-5668-4a9e-afc7-342a3a0b3ed9	00100000-5668-4a9e-5301-75e683150c4f	01	Gledališče Nimbis
00410000-5668-4a9e-cfcb-5348936fe30b	00410000-5668-4a9e-3ac4-2057f2943a9f	00100000-5668-4a9e-afc7-342a3a0b3ed9	00100000-5668-4a9e-5301-75e683150c4f	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 31801662)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5668-4a9e-ef18-e2d491b8bef0	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5668-4a9e-30a3-48e7a3afec30	00010000-5668-4a9e-e832-761cd4f0d451	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5668-4a9e-7b4f-60ef2b2776cc	00010000-5668-4a9e-9bb4-9638876c9bee	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5668-4a9e-2e97-de48031dca13	00010000-5668-4a9e-5c9f-48225cc86c46	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5668-4a9e-7ce0-339fe1d9806d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5668-4a9e-320f-b32aa2b41ccb	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5668-4a9e-a8d6-e6c2b4e55716	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5668-4a9e-6d8b-fea5903dfafb	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5668-4a9e-3c03-ade2e52616f4	00010000-5668-4a9e-2aac-87d36a1ae40c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5668-4a9e-6782-19cfd6e977e3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5668-4a9e-95ac-17edb722e61a	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5668-4a9e-c729-57c6d9c5c145	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5668-4a9e-78d8-67d10be370f6	00010000-5668-4a9e-6deb-e6a5b574fe8f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5668-4a9e-dc46-a51f256d93f8	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5668-4a9e-f729-b3d72947c8ae	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5668-4a9e-b005-88b058df6132	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5668-4a9e-6e42-4c2e7bfe00b9	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5668-4a9e-de3a-62d21dd4a152	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5668-4a9e-45b2-a67b85ae962d	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5668-4a9e-905b-ed4a23f6716f	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5668-4a9e-cd19-2e1d954450ae	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 31801597)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5668-4a9c-7206-c04193a0e5ef	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5668-4a9c-e795-42057b2c2bf3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5668-4a9c-eb10-ff23310b04da	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5668-4a9c-58e6-251fe462d638	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5668-4a9c-e8db-a1ac1cf2061f	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5668-4a9c-dd38-3253366aa6ce	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5668-4a9c-fc2c-5b459a1a46df	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5668-4a9c-1644-641ebfdc3e6a	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5668-4a9c-e3a9-fafafbff5595	Abonma-read	Abonma - branje	t
00030000-5668-4a9c-062e-96df44d264ac	Abonma-write	Abonma - spreminjanje	t
00030000-5668-4a9c-074e-e78c5ac5167a	Alternacija-read	Alternacija - branje	t
00030000-5668-4a9c-116e-061b8403b7f5	Alternacija-write	Alternacija - spreminjanje	t
00030000-5668-4a9c-5445-12153fc420cd	Arhivalija-read	Arhivalija - branje	t
00030000-5668-4a9c-01da-d97f7800d486	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5668-4a9c-cbf1-e85f4fede462	AuthStorage-read	AuthStorage - branje	t
00030000-5668-4a9c-4eeb-26ccea6fe04a	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5668-4a9c-3de2-fc4cb632f0ac	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5668-4a9c-2dbc-fc66d9b92f17	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5668-4a9c-f3ec-edbd7ad88f65	Besedilo-read	Besedilo - branje	t
00030000-5668-4a9c-fa5c-8086ad6c4a8c	Besedilo-write	Besedilo - spreminjanje	t
00030000-5668-4a9c-859f-de83a324137a	Dogodek-read	Dogodek - branje	t
00030000-5668-4a9c-3bb9-59c482a88725	Dogodek-write	Dogodek - spreminjanje	t
00030000-5668-4a9c-e038-1ca3db518cef	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5668-4a9c-1d3b-6b703980d1bc	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5668-4a9c-09f4-2814d7c3ebc1	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5668-4a9c-0ad0-21582384ef24	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5668-4a9c-c789-5f9f934d7c89	DogodekTrait-read	DogodekTrait - branje	t
00030000-5668-4a9c-0f5a-f4c6bf505d65	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5668-4a9c-2f1f-e1b42c4cd7de	DrugiVir-read	DrugiVir - branje	t
00030000-5668-4a9c-f780-33871c3d57e8	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5668-4a9c-483a-0b0c3f6778f1	Drzava-read	Drzava - branje	t
00030000-5668-4a9c-ee04-1e68f20a1c3f	Drzava-write	Drzava - spreminjanje	t
00030000-5668-4a9c-7e72-b16abba0114e	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5668-4a9c-658f-38b11bd79058	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5668-4a9c-a1be-e63ecac12d55	Funkcija-read	Funkcija - branje	t
00030000-5668-4a9c-1032-0b40a4b4b853	Funkcija-write	Funkcija - spreminjanje	t
00030000-5668-4a9c-4c43-21e931e74b01	Gostovanje-read	Gostovanje - branje	t
00030000-5668-4a9c-d60e-99fbc588d5fd	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5668-4a9c-9de3-a7c696fe9411	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5668-4a9c-c00f-50fb69bb424b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5668-4a9c-a587-c29afd761e49	Kupec-read	Kupec - branje	t
00030000-5668-4a9c-8a97-bd44b73bf015	Kupec-write	Kupec - spreminjanje	t
00030000-5668-4a9c-b501-5315860f6705	NacinPlacina-read	NacinPlacina - branje	t
00030000-5668-4a9c-b2a7-66a7339fbf1a	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5668-4a9c-92e8-58cca46a4213	Option-read	Option - branje	t
00030000-5668-4a9c-dd58-3e24036c006e	Option-write	Option - spreminjanje	t
00030000-5668-4a9c-e377-190256635c9e	OptionValue-read	OptionValue - branje	t
00030000-5668-4a9c-eab1-b2504fa0cd61	OptionValue-write	OptionValue - spreminjanje	t
00030000-5668-4a9c-66c0-47fea69c73e0	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5668-4a9c-404f-d59606f4e30b	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5668-4a9c-e074-dfca88567fad	Oseba-read	Oseba - branje	t
00030000-5668-4a9c-d7fa-8b9e58e2651d	Oseba-write	Oseba - spreminjanje	t
00030000-5668-4a9c-4486-6cac76e06388	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5668-4a9c-fe4a-c5ae295c4382	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5668-4a9c-84c5-ab70aa3612b0	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5668-4a9c-5e60-081007147f5e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5668-4a9c-a1d5-3c95db6eb53d	Pogodba-read	Pogodba - branje	t
00030000-5668-4a9c-734a-11566814f625	Pogodba-write	Pogodba - spreminjanje	t
00030000-5668-4a9c-1771-165d14fd593a	Popa-read	Popa - branje	t
00030000-5668-4a9c-9d75-9f3f04fa19ba	Popa-write	Popa - spreminjanje	t
00030000-5668-4a9c-a7ae-2a28ce2267fa	Posta-read	Posta - branje	t
00030000-5668-4a9c-16df-0938a5b1b8e8	Posta-write	Posta - spreminjanje	t
00030000-5668-4a9c-afd7-8acb4b414b05	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5668-4a9c-3d3f-dc262dbcfafb	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5668-4a9c-e0b0-f9c3da8e6307	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5668-4a9c-5955-0456980b4a3c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5668-4a9c-e99a-96973d0654ac	PostniNaslov-read	PostniNaslov - branje	t
00030000-5668-4a9c-5427-4f65f602314e	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5668-4a9c-10c5-8524456e3ffb	Praznik-read	Praznik - branje	t
00030000-5668-4a9c-617f-94d72124599d	Praznik-write	Praznik - spreminjanje	t
00030000-5668-4a9c-0933-b152d5f0b27e	Predstava-read	Predstava - branje	t
00030000-5668-4a9c-f307-64650cbfea60	Predstava-write	Predstava - spreminjanje	t
00030000-5668-4a9c-43d5-fcfc68ab0db4	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5668-4a9c-f07c-0d0e2415a6f3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5668-4a9c-633d-4cb024acceaf	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5668-4a9c-9f9d-4c530f40d618	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5668-4a9c-6aa7-9c55369ab27c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5668-4a9c-7bbb-d1b55db4a4e8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5668-4a9c-cfa3-c556047da814	ProgramDela-read	ProgramDela - branje	t
00030000-5668-4a9c-a743-01cb891f5db3	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5668-4a9c-6527-cfb1ab376c2f	ProgramFestival-read	ProgramFestival - branje	t
00030000-5668-4a9c-011c-f178119ea172	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5668-4a9c-fabb-a3a8c4e47b0c	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5668-4a9c-5314-1d9b8f8118bb	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5668-4a9c-ffbc-fae0d2892563	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5668-4a9c-b399-8553f5e25dd2	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5668-4a9c-d209-bbea46789b2a	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5668-4a9c-f4b7-328d3a8576d0	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5668-4a9c-5c04-303947cba251	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5668-4a9c-4f5c-a3350f28c25c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5668-4a9c-4b29-1b32ffb58b69	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5668-4a9c-f77f-8e7d66ad9e33	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5668-4a9c-e68a-c3679da5c56a	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5668-4a9c-110c-2bcbc081e887	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5668-4a9c-1a63-24c7ce19c653	ProgramRazno-read	ProgramRazno - branje	t
00030000-5668-4a9c-13db-e66e48f8f2b9	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5668-4a9c-aa51-35eb08ff2036	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5668-4a9c-4697-4c3e5d3aa55f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5668-4a9c-03eb-8b4ed9c80302	Prostor-read	Prostor - branje	t
00030000-5668-4a9c-819e-28c4099b18f4	Prostor-write	Prostor - spreminjanje	t
00030000-5668-4a9c-7936-5d6ea701b317	Racun-read	Racun - branje	t
00030000-5668-4a9c-10ad-a0a1316d444f	Racun-write	Racun - spreminjanje	t
00030000-5668-4a9c-da5c-061874ab7a2e	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5668-4a9c-b00b-41cf794df12f	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5668-4a9c-872d-4bca82f4dde6	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5668-4a9c-f8cd-9eabe2c5d963	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5668-4a9c-afe3-02e723eb01e6	Rekvizit-read	Rekvizit - branje	t
00030000-5668-4a9c-9234-c8793c041dd7	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5668-4a9c-38c1-199c1d601617	Revizija-read	Revizija - branje	t
00030000-5668-4a9c-4ab6-c96380b399d8	Revizija-write	Revizija - spreminjanje	t
00030000-5668-4a9c-3623-6a4f42c65c53	Rezervacija-read	Rezervacija - branje	t
00030000-5668-4a9c-d097-c746d055fc32	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5668-4a9c-1a57-b8e872a3c9cb	SedezniRed-read	SedezniRed - branje	t
00030000-5668-4a9c-2365-767f94ff9518	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5668-4a9c-e361-7d6faa5c8e71	Sedez-read	Sedez - branje	t
00030000-5668-4a9c-2d14-87b88447616d	Sedez-write	Sedez - spreminjanje	t
00030000-5668-4a9c-97a6-6726b8593ebc	Sezona-read	Sezona - branje	t
00030000-5668-4a9c-8ae2-6706bcf460c0	Sezona-write	Sezona - spreminjanje	t
00030000-5668-4a9c-a7a4-56abcba79e69	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5668-4a9c-4125-a63385e5f036	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5668-4a9c-1d96-781f08bed063	Telefonska-read	Telefonska - branje	t
00030000-5668-4a9c-ea22-74b2ddb392f6	Telefonska-write	Telefonska - spreminjanje	t
00030000-5668-4a9c-dcd7-f323263789ed	TerminStoritve-read	TerminStoritve - branje	t
00030000-5668-4a9c-9d0c-2babea3c1292	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5668-4a9c-adb5-60f8a718f885	TipFunkcije-read	TipFunkcije - branje	t
00030000-5668-4a9c-5ea4-6cc1327c6399	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5668-4a9c-6f49-ac45486d88ae	TipPopa-read	TipPopa - branje	t
00030000-5668-4a9c-43af-4262e6b80171	TipPopa-write	TipPopa - spreminjanje	t
00030000-5668-4a9c-4831-f21a379e8947	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5668-4a9c-bd9e-e65c3d32cb84	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5668-4a9c-fa97-c04de0241dac	TipVaje-read	TipVaje - branje	t
00030000-5668-4a9c-67b6-6ed83acb3ed6	TipVaje-write	TipVaje - spreminjanje	t
00030000-5668-4a9c-3a4c-305be39b9b3b	Trr-read	Trr - branje	t
00030000-5668-4a9c-9836-710ee0865fd7	Trr-write	Trr - spreminjanje	t
00030000-5668-4a9c-a34a-489a990151d3	Uprizoritev-read	Uprizoritev - branje	t
00030000-5668-4a9c-57e6-2de3da414b98	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5668-4a9c-eaee-2045593ac206	Vaja-read	Vaja - branje	t
00030000-5668-4a9c-a52a-6d28b8fe327e	Vaja-write	Vaja - spreminjanje	t
00030000-5668-4a9c-fe63-48b372acdfd5	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5668-4a9c-b6c6-839248a508df	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5668-4a9c-bf23-be90b32dd951	VrstaStroska-read	VrstaStroska - branje	t
00030000-5668-4a9c-d3a1-a943e571be61	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5668-4a9c-617b-649a0cc5f361	Zaposlitev-read	Zaposlitev - branje	t
00030000-5668-4a9c-42f9-b20ea52d654b	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5668-4a9c-c52d-29152163ec46	Zasedenost-read	Zasedenost - branje	t
00030000-5668-4a9c-f823-d43840a76908	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5668-4a9c-09a8-232eb80c7110	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5668-4a9c-4dfd-87c0a1c3ca4e	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5668-4a9c-34a7-ad2a969a6bee	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5668-4a9c-ade7-1113f51774a1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5668-4a9c-9bb2-d8162fd29131	Job-read	Branje opravil - samo zase - branje	t
00030000-5668-4a9c-1084-c401cf168124	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5668-4a9c-4a05-3f9563da15db	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5668-4a9c-abe4-d085d2c64649	Report-read	Report - branje	t
00030000-5668-4a9c-a069-5386239156bf	Report-write	Report - spreminjanje	t
00030000-5668-4a9c-d8d8-138bceed4dc5	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5668-4a9c-6723-40ee8b5b898e	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5668-4a9c-e4cd-fa90e1c5c19b	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5668-4a9c-43d8-ca7f9a9a6a63	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5668-4a9c-4605-b0eb27617dfa	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5668-4a9c-b42e-8ac0f7ffda23	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5668-4a9c-8202-87bbd78ed22a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5668-4a9c-aba9-b9e3bec57788	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5668-4a9c-c8cc-5b4462510a42	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5668-4a9c-e2a9-da64f726067f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5668-4a9c-31ea-0a994e19ab3f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5668-4a9c-339c-a12e5abc68e5	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5668-4a9c-9875-57bb77527c3b	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5668-4a9c-b79a-c7a9b5993177	Datoteka-write	Datoteka - spreminjanje	t
00030000-5668-4a9c-5a3c-4a8acc553189	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 31801616)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5668-4a9c-7ff5-44fb6f55c245	00030000-5668-4a9c-e795-42057b2c2bf3
00020000-5668-4a9c-7ff5-44fb6f55c245	00030000-5668-4a9c-7206-c04193a0e5ef
00020000-5668-4a9c-3c1e-a8a85bcaf8fd	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-2dbc-fc66d9b92f17
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-fa5c-8086ad6c4a8c
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-b79a-c7a9b5993177
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-e2a9-da64f726067f
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-3de2-fc4cb632f0ac
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-f3ec-edbd7ad88f65
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-c49c-15e3659c441c	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-b04e-7479f15cdb80	00030000-5668-4a9c-3de2-fc4cb632f0ac
00020000-5668-4a9c-b04e-7479f15cdb80	00030000-5668-4a9c-f3ec-edbd7ad88f65
00020000-5668-4a9c-b04e-7479f15cdb80	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-b04e-7479f15cdb80	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-b04e-7479f15cdb80	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-b356-bb38c095bccb	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-b356-bb38c095bccb	00030000-5668-4a9c-617b-649a0cc5f361
00020000-5668-4a9c-b356-bb38c095bccb	00030000-5668-4a9c-42f9-b20ea52d654b
00020000-5668-4a9c-b356-bb38c095bccb	00030000-5668-4a9c-66c0-47fea69c73e0
00020000-5668-4a9c-8cdf-72f1f4f62523	00030000-5668-4a9c-617b-649a0cc5f361
00020000-5668-4a9c-8cdf-72f1f4f62523	00030000-5668-4a9c-66c0-47fea69c73e0
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-d7fa-8b9e58e2651d
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-e99a-96973d0654ac
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-5427-4f65f602314e
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-1d96-781f08bed063
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-ea22-74b2ddb392f6
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-b79a-c7a9b5993177
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-e2a9-da64f726067f
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-955a-c31554fd9006	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9c-987f-55b1f8cdfd38	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-987f-55b1f8cdfd38	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-987f-55b1f8cdfd38	00030000-5668-4a9c-e99a-96973d0654ac
00020000-5668-4a9c-987f-55b1f8cdfd38	00030000-5668-4a9c-1d96-781f08bed063
00020000-5668-4a9c-987f-55b1f8cdfd38	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-987f-55b1f8cdfd38	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-987f-55b1f8cdfd38	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-8224-8f08592d88ba	00030000-5668-4a9c-d7fa-8b9e58e2651d
00020000-5668-4a9c-8224-8f08592d88ba	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-8224-8f08592d88ba	00030000-5668-4a9c-dd38-3253366aa6ce
00020000-5668-4a9c-8224-8f08592d88ba	00030000-5668-4a9c-e8db-a1ac1cf2061f
00020000-5668-4a9c-8224-8f08592d88ba	00030000-5668-4a9c-3a4c-305be39b9b3b
00020000-5668-4a9c-8224-8f08592d88ba	00030000-5668-4a9c-9836-710ee0865fd7
00020000-5668-4a9c-8224-8f08592d88ba	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-df4b-b184ea0830ed	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-df4b-b184ea0830ed	00030000-5668-4a9c-dd38-3253366aa6ce
00020000-5668-4a9c-df4b-b184ea0830ed	00030000-5668-4a9c-3a4c-305be39b9b3b
00020000-5668-4a9c-df4b-b184ea0830ed	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-1d96-781f08bed063
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-e99a-96973d0654ac
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-3a4c-305be39b9b3b
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-9de3-a7c696fe9411
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-ea22-74b2ddb392f6
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-5427-4f65f602314e
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-9836-710ee0865fd7
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-9d75-9f3f04fa19ba
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-b79a-c7a9b5993177
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-e2a9-da64f726067f
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-c00f-50fb69bb424b
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-7bbb-d1b55db4a4e8
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-573f-7d639fb42ac0	00030000-5668-4a9c-6f49-ac45486d88ae
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-1d96-781f08bed063
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-e99a-96973d0654ac
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-3a4c-305be39b9b3b
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-9de3-a7c696fe9411
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-3066-b00fed6423d0	00030000-5668-4a9c-6f49-ac45486d88ae
00020000-5668-4a9c-67bd-3d8259e06df4	00030000-5668-4a9c-6f49-ac45486d88ae
00020000-5668-4a9c-67bd-3d8259e06df4	00030000-5668-4a9c-43af-4262e6b80171
00020000-5668-4a9c-ec4b-4a9e187f0455	00030000-5668-4a9c-6f49-ac45486d88ae
00020000-5668-4a9c-bdd2-5d2ca9eb6bc7	00030000-5668-4a9c-a7ae-2a28ce2267fa
00020000-5668-4a9c-bdd2-5d2ca9eb6bc7	00030000-5668-4a9c-16df-0938a5b1b8e8
00020000-5668-4a9c-6150-d636ba087d88	00030000-5668-4a9c-a7ae-2a28ce2267fa
00020000-5668-4a9c-852e-96512f61500f	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-852e-96512f61500f	00030000-5668-4a9c-ee04-1e68f20a1c3f
00020000-5668-4a9c-6c25-6cc39567f4d0	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-190f-a1f34c090451	00030000-5668-4a9c-34a7-ad2a969a6bee
00020000-5668-4a9c-190f-a1f34c090451	00030000-5668-4a9c-ade7-1113f51774a1
00020000-5668-4a9c-edf6-36368aee5be5	00030000-5668-4a9c-34a7-ad2a969a6bee
00020000-5668-4a9c-2340-571138f215e7	00030000-5668-4a9c-09a8-232eb80c7110
00020000-5668-4a9c-2340-571138f215e7	00030000-5668-4a9c-4dfd-87c0a1c3ca4e
00020000-5668-4a9c-5604-8bf506e2f609	00030000-5668-4a9c-09a8-232eb80c7110
00020000-5668-4a9c-7bd2-c528e023ab3a	00030000-5668-4a9c-e3a9-fafafbff5595
00020000-5668-4a9c-7bd2-c528e023ab3a	00030000-5668-4a9c-062e-96df44d264ac
00020000-5668-4a9c-416f-23eb5f806da6	00030000-5668-4a9c-e3a9-fafafbff5595
00020000-5668-4a9c-2672-20573fcd8be5	00030000-5668-4a9c-03eb-8b4ed9c80302
00020000-5668-4a9c-2672-20573fcd8be5	00030000-5668-4a9c-819e-28c4099b18f4
00020000-5668-4a9c-2672-20573fcd8be5	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9c-2672-20573fcd8be5	00030000-5668-4a9c-e99a-96973d0654ac
00020000-5668-4a9c-2672-20573fcd8be5	00030000-5668-4a9c-5427-4f65f602314e
00020000-5668-4a9c-2672-20573fcd8be5	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-16cd-cfb1ff2e4e2c	00030000-5668-4a9c-03eb-8b4ed9c80302
00020000-5668-4a9c-16cd-cfb1ff2e4e2c	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9c-16cd-cfb1ff2e4e2c	00030000-5668-4a9c-e99a-96973d0654ac
00020000-5668-4a9c-c7ac-50be2f3071e5	00030000-5668-4a9c-bf23-be90b32dd951
00020000-5668-4a9c-c7ac-50be2f3071e5	00030000-5668-4a9c-d3a1-a943e571be61
00020000-5668-4a9c-21d9-f3dd10fb6629	00030000-5668-4a9c-bf23-be90b32dd951
00020000-5668-4a9c-d898-c7a53425c839	00030000-5668-4a9c-404f-d59606f4e30b
00020000-5668-4a9c-d898-c7a53425c839	00030000-5668-4a9c-66c0-47fea69c73e0
00020000-5668-4a9c-d898-c7a53425c839	00030000-5668-4a9c-617b-649a0cc5f361
00020000-5668-4a9c-d898-c7a53425c839	00030000-5668-4a9c-b79a-c7a9b5993177
00020000-5668-4a9c-d898-c7a53425c839	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-d898-c7a53425c839	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9c-d898-c7a53425c839	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-d898-c7a53425c839	00030000-5668-4a9c-e2a9-da64f726067f
00020000-5668-4a9c-d898-c7a53425c839	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-daa2-562695abe81a	00030000-5668-4a9c-66c0-47fea69c73e0
00020000-5668-4a9c-daa2-562695abe81a	00030000-5668-4a9c-617b-649a0cc5f361
00020000-5668-4a9c-daa2-562695abe81a	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-daa2-562695abe81a	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-daa2-562695abe81a	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-ed23-d1396af4bd86	00030000-5668-4a9c-fa97-c04de0241dac
00020000-5668-4a9c-ed23-d1396af4bd86	00030000-5668-4a9c-67b6-6ed83acb3ed6
00020000-5668-4a9c-150b-4e468c2edcee	00030000-5668-4a9c-fa97-c04de0241dac
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-fc2c-5b459a1a46df
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-1644-641ebfdc3e6a
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-cfa3-c556047da814
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-a743-01cb891f5db3
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-6527-cfb1ab376c2f
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-011c-f178119ea172
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-fabb-a3a8c4e47b0c
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-5314-1d9b8f8118bb
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-ffbc-fae0d2892563
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-b399-8553f5e25dd2
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-d209-bbea46789b2a
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-f4b7-328d3a8576d0
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-5c04-303947cba251
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-4f5c-a3350f28c25c
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-4b29-1b32ffb58b69
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-f77f-8e7d66ad9e33
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-e68a-c3679da5c56a
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-110c-2bcbc081e887
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-1a63-24c7ce19c653
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-13db-e66e48f8f2b9
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-aa51-35eb08ff2036
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-4697-4c3e5d3aa55f
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-9f9d-4c530f40d618
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-f780-33871c3d57e8
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-3d3f-dc262dbcfafb
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-1084-c401cf168124
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-2f1f-e1b42c4cd7de
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-633d-4cb024acceaf
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-afd7-8acb4b414b05
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-bf23-be90b32dd951
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-a7a4-56abcba79e69
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-a1be-e63ecac12d55
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-074e-e78c5ac5167a
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-adb5-60f8a718f885
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-a1d5-3c95db6eb53d
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-b79a-c7a9b5993177
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-e2a9-da64f726067f
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-9bb2-d8162fd29131
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-bf47-b3faec17345a	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-cfa3-c556047da814
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-6527-cfb1ab376c2f
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-fabb-a3a8c4e47b0c
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-ffbc-fae0d2892563
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-d209-bbea46789b2a
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-5c04-303947cba251
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-4b29-1b32ffb58b69
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-e68a-c3679da5c56a
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-1a63-24c7ce19c653
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-aa51-35eb08ff2036
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-633d-4cb024acceaf
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-2f1f-e1b42c4cd7de
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-afd7-8acb4b414b05
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-9bb2-d8162fd29131
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-6e1a-9e60563ea7a8	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-57e6-2de3da414b98
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-074e-e78c5ac5167a
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-116e-061b8403b7f5
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-f3ec-edbd7ad88f65
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-a1be-e63ecac12d55
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-1032-0b40a4b4b853
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-adb5-60f8a718f885
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-b79a-c7a9b5993177
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-2bab-0af9bfe81f89	00030000-5668-4a9c-e2a9-da64f726067f
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-074e-e78c5ac5167a
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-f3ec-edbd7ad88f65
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-a1be-e63ecac12d55
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-adb5-60f8a718f885
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9c-403b-1f50bb5e161b	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-074e-e78c5ac5167a
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-116e-061b8403b7f5
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-a1be-e63ecac12d55
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-a1d5-3c95db6eb53d
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-734a-11566814f625
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-a7a4-56abcba79e69
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-4125-a63385e5f036
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-adb5-60f8a718f885
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-3a4c-305be39b9b3b
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9c-8dc6-4c4e2060bd33	00030000-5668-4a9c-617b-649a0cc5f361
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-074e-e78c5ac5167a
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-a1be-e63ecac12d55
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-a1d5-3c95db6eb53d
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-a7a4-56abcba79e69
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-adb5-60f8a718f885
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-3a4c-305be39b9b3b
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9c-e2f2-6aa5398b9905	00030000-5668-4a9c-617b-649a0cc5f361
00020000-5668-4a9c-221c-ab7901dd41aa	00030000-5668-4a9c-a7a4-56abcba79e69
00020000-5668-4a9c-221c-ab7901dd41aa	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9c-221c-ab7901dd41aa	00030000-5668-4a9c-a1be-e63ecac12d55
00020000-5668-4a9c-221c-ab7901dd41aa	00030000-5668-4a9c-a1d5-3c95db6eb53d
00020000-5668-4a9c-221c-ab7901dd41aa	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9c-221c-ab7901dd41aa	00030000-5668-4a9c-adb5-60f8a718f885
00020000-5668-4a9c-221c-ab7901dd41aa	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-ffb0-45f877dfc8ba	00030000-5668-4a9c-a7a4-56abcba79e69
00020000-5668-4a9c-ffb0-45f877dfc8ba	00030000-5668-4a9c-4125-a63385e5f036
00020000-5668-4a9c-ffb0-45f877dfc8ba	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9c-ffb0-45f877dfc8ba	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9c-f1c4-4399c8551a52	00030000-5668-4a9c-a7a4-56abcba79e69
00020000-5668-4a9c-f1c4-4399c8551a52	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-e3a9-fafafbff5595
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-074e-e78c5ac5167a
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-3de2-fc4cb632f0ac
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-2dbc-fc66d9b92f17
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-f3ec-edbd7ad88f65
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-fa5c-8086ad6c4a8c
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-b79a-c7a9b5993177
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-a1be-e63ecac12d55
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-9de3-a7c696fe9411
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-66c0-47fea69c73e0
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-d7fa-8b9e58e2651d
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-a7ae-2a28ce2267fa
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-e99a-96973d0654ac
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-5427-4f65f602314e
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-03eb-8b4ed9c80302
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-1d96-781f08bed063
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-ea22-74b2ddb392f6
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-adb5-60f8a718f885
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-6f49-ac45486d88ae
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-fa97-c04de0241dac
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-3a4c-305be39b9b3b
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-bf23-be90b32dd951
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-e2a9-da64f726067f
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-617b-649a0cc5f361
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-09a8-232eb80c7110
00020000-5668-4a9c-15ff-ea6563853429	00030000-5668-4a9c-34a7-ad2a969a6bee
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-7206-c04193a0e5ef
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e795-42057b2c2bf3
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e3a9-fafafbff5595
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-062e-96df44d264ac
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-074e-e78c5ac5167a
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-116e-061b8403b7f5
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-5445-12153fc420cd
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-01da-d97f7800d486
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-cbf1-e85f4fede462
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4eeb-26ccea6fe04a
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-3de2-fc4cb632f0ac
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-2dbc-fc66d9b92f17
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-f3ec-edbd7ad88f65
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-fa5c-8086ad6c4a8c
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-b79a-c7a9b5993177
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-859f-de83a324137a
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-58e6-251fe462d638
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-3bb9-59c482a88725
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e038-1ca3db518cef
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-1d3b-6b703980d1bc
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-09f4-2814d7c3ebc1
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-0ad0-21582384ef24
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-2f1f-e1b42c4cd7de
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-f780-33871c3d57e8
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-483a-0b0c3f6778f1
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-ee04-1e68f20a1c3f
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-7e72-b16abba0114e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-658f-38b11bd79058
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-a1be-e63ecac12d55
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-1032-0b40a4b4b853
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4c43-21e931e74b01
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-d60e-99fbc588d5fd
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4a05-3f9563da15db
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-9bb2-d8162fd29131
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-1084-c401cf168124
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-9de3-a7c696fe9411
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-c00f-50fb69bb424b
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-a587-c29afd761e49
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-8a97-bd44b73bf015
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-6723-40ee8b5b898e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e4cd-fa90e1c5c19b
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-43d8-ca7f9a9a6a63
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4605-b0eb27617dfa
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-8202-87bbd78ed22a
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-b42e-8ac0f7ffda23
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-b501-5315860f6705
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-b2a7-66a7339fbf1a
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-92e8-58cca46a4213
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-dd58-3e24036c006e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e377-190256635c9e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-eab1-b2504fa0cd61
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-66c0-47fea69c73e0
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-404f-d59606f4e30b
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e8db-a1ac1cf2061f
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-d7fa-8b9e58e2651d
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4486-6cac76e06388
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-fe4a-c5ae295c4382
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-84c5-ab70aa3612b0
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-5e60-081007147f5e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-a1d5-3c95db6eb53d
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-734a-11566814f625
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-9d75-9f3f04fa19ba
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-a7ae-2a28ce2267fa
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-16df-0938a5b1b8e8
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-afd7-8acb4b414b05
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-3d3f-dc262dbcfafb
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e0b0-f9c3da8e6307
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-5955-0456980b4a3c
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e99a-96973d0654ac
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-5427-4f65f602314e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-10c5-8524456e3ffb
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-617f-94d72124599d
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-0933-b152d5f0b27e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-f307-64650cbfea60
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-43d5-fcfc68ab0db4
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-f07c-0d0e2415a6f3
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-633d-4cb024acceaf
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-9f9d-4c530f40d618
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-6aa7-9c55369ab27c
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-7bbb-d1b55db4a4e8
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-fc2c-5b459a1a46df
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-cfa3-c556047da814
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-1644-641ebfdc3e6a
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-a743-01cb891f5db3
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-6527-cfb1ab376c2f
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-011c-f178119ea172
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-fabb-a3a8c4e47b0c
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-5314-1d9b8f8118bb
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-ffbc-fae0d2892563
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-b399-8553f5e25dd2
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-d209-bbea46789b2a
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-f4b7-328d3a8576d0
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-5c04-303947cba251
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4f5c-a3350f28c25c
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4b29-1b32ffb58b69
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-f77f-8e7d66ad9e33
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e68a-c3679da5c56a
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-110c-2bcbc081e887
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-1a63-24c7ce19c653
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-13db-e66e48f8f2b9
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-aa51-35eb08ff2036
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4697-4c3e5d3aa55f
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-03eb-8b4ed9c80302
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-819e-28c4099b18f4
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-7936-5d6ea701b317
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-10ad-a0a1316d444f
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-da5c-061874ab7a2e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-b00b-41cf794df12f
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-afe3-02e723eb01e6
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-9234-c8793c041dd7
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-872d-4bca82f4dde6
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-f8cd-9eabe2c5d963
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-abe4-d085d2c64649
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-a069-5386239156bf
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-38c1-199c1d601617
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4ab6-c96380b399d8
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-3623-6a4f42c65c53
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-d097-c746d055fc32
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e361-7d6faa5c8e71
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-2d14-87b88447616d
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-1a57-b8e872a3c9cb
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-2365-767f94ff9518
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-97a6-6726b8593ebc
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-8ae2-6706bcf460c0
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-d8d8-138bceed4dc5
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-a7a4-56abcba79e69
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4125-a63385e5f036
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-1d96-781f08bed063
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-ea22-74b2ddb392f6
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-dcd7-f323263789ed
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-eb10-ff23310b04da
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-9d0c-2babea3c1292
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-adb5-60f8a718f885
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-5ea4-6cc1327c6399
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-6f49-ac45486d88ae
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-43af-4262e6b80171
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4831-f21a379e8947
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-bd9e-e65c3d32cb84
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-fa97-c04de0241dac
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-67b6-6ed83acb3ed6
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-3a4c-305be39b9b3b
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-9836-710ee0865fd7
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-57e6-2de3da414b98
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-eaee-2045593ac206
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-a52a-6d28b8fe327e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-fe63-48b372acdfd5
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-b6c6-839248a508df
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-bf23-be90b32dd951
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-d3a1-a943e571be61
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-9875-57bb77527c3b
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-339c-a12e5abc68e5
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-e2a9-da64f726067f
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-617b-649a0cc5f361
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-42f9-b20ea52d654b
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-c52d-29152163ec46
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-f823-d43840a76908
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-09a8-232eb80c7110
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-4dfd-87c0a1c3ca4e
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-34a7-ad2a969a6bee
00020000-5668-4a9e-7018-76306498b5eb	00030000-5668-4a9c-ade7-1113f51774a1
00020000-5668-4a9e-6b43-f1148454b344	00030000-5668-4a9c-31ea-0a994e19ab3f
00020000-5668-4a9e-813e-6a78be1da501	00030000-5668-4a9c-e2a9-da64f726067f
00020000-5668-4a9e-09b3-6d914b67df57	00030000-5668-4a9c-57e6-2de3da414b98
00020000-5668-4a9e-34ac-f42d0c8c8544	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9e-08b8-908b84d4d540	00030000-5668-4a9c-e4cd-fa90e1c5c19b
00020000-5668-4a9e-6fdf-ea39dc82f563	00030000-5668-4a9c-43d8-ca7f9a9a6a63
00020000-5668-4a9e-998a-8a316f5f9307	00030000-5668-4a9c-4605-b0eb27617dfa
00020000-5668-4a9e-9afd-a76b26f4c69f	00030000-5668-4a9c-6723-40ee8b5b898e
00020000-5668-4a9e-e810-cc7a4286343f	00030000-5668-4a9c-8202-87bbd78ed22a
00020000-5668-4a9e-955b-cf12f17a3160	00030000-5668-4a9c-b42e-8ac0f7ffda23
00020000-5668-4a9e-2877-bbe472c648d8	00030000-5668-4a9c-c8cc-5b4462510a42
00020000-5668-4a9e-d10f-c5735dfb77aa	00030000-5668-4a9c-aba9-b9e3bec57788
00020000-5668-4a9e-e4ed-ea82e2f3625f	00030000-5668-4a9c-e074-dfca88567fad
00020000-5668-4a9e-471f-42d158777d66	00030000-5668-4a9c-d7fa-8b9e58e2651d
00020000-5668-4a9e-8846-d1c34bf761b7	00030000-5668-4a9c-e8db-a1ac1cf2061f
00020000-5668-4a9e-8349-07d8adf5aafd	00030000-5668-4a9c-dd38-3253366aa6ce
00020000-5668-4a9e-a371-cb49610ce26a	00030000-5668-4a9c-b79a-c7a9b5993177
00020000-5668-4a9e-677a-f3af90a46fd5	00030000-5668-4a9c-5a3c-4a8acc553189
00020000-5668-4a9e-7aa4-7fec2e88859c	00030000-5668-4a9c-1771-165d14fd593a
00020000-5668-4a9e-7aa4-7fec2e88859c	00030000-5668-4a9c-9d75-9f3f04fa19ba
00020000-5668-4a9e-7aa4-7fec2e88859c	00030000-5668-4a9c-a34a-489a990151d3
00020000-5668-4a9e-65d7-72b524142517	00030000-5668-4a9c-3a4c-305be39b9b3b
00020000-5668-4a9e-edad-f1eccd38a1ab	00030000-5668-4a9c-9836-710ee0865fd7
00020000-5668-4a9e-1455-f0b191edbb3b	00030000-5668-4a9c-d8d8-138bceed4dc5
00020000-5668-4a9e-3e14-88336c7620e3	00030000-5668-4a9c-1d96-781f08bed063
00020000-5668-4a9e-fea4-f8d3fbdca7dc	00030000-5668-4a9c-ea22-74b2ddb392f6
00020000-5668-4a9e-0e22-0dcea83207e3	00030000-5668-4a9c-e99a-96973d0654ac
00020000-5668-4a9e-7c26-513d30242ef1	00030000-5668-4a9c-5427-4f65f602314e
00020000-5668-4a9e-082d-633ff40d1d76	00030000-5668-4a9c-617b-649a0cc5f361
00020000-5668-4a9e-c5f2-7f6edb34e0f1	00030000-5668-4a9c-42f9-b20ea52d654b
00020000-5668-4a9e-1110-8b432428a8e2	00030000-5668-4a9c-a1d5-3c95db6eb53d
00020000-5668-4a9e-b87f-d98b915e1dc4	00030000-5668-4a9c-734a-11566814f625
00020000-5668-4a9e-249a-cebc384655b9	00030000-5668-4a9c-a7a4-56abcba79e69
00020000-5668-4a9e-62e5-c7de835f5574	00030000-5668-4a9c-4125-a63385e5f036
00020000-5668-4a9e-c69b-f9c0ec548b53	00030000-5668-4a9c-074e-e78c5ac5167a
00020000-5668-4a9e-0b0e-9b46126ac0ea	00030000-5668-4a9c-116e-061b8403b7f5
\.


--
-- TOC entry 3141 (class 0 OID 31802006)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 31802040)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 31802177)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5668-4a9e-c58e-a821f467c177	00090000-5668-4a9e-ef18-e2d491b8bef0	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5668-4a9e-c1c4-ebb319c65a32	00090000-5668-4a9e-320f-b32aa2b41ccb	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5668-4a9e-c777-70fe078a12da	00090000-5668-4a9e-78d8-67d10be370f6	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5668-4a9e-235a-29214bafb7d5	00090000-5668-4a9e-6782-19cfd6e977e3	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 31801698)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5668-4a9e-5d61-902efbc0fbbb	\N	00040000-5668-4a9c-73ff-8cb313726f4c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5668-4a9e-59ae-d653b8788e40	\N	00040000-5668-4a9c-73ff-8cb313726f4c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5668-4a9e-c6ae-6deae6b11c6c	\N	00040000-5668-4a9c-73ff-8cb313726f4c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5668-4a9e-6d24-cefe8fca1e49	\N	00040000-5668-4a9c-73ff-8cb313726f4c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5668-4a9e-f258-45fbd2830fd6	\N	00040000-5668-4a9c-73ff-8cb313726f4c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5668-4a9e-84c8-d968f1252bd3	\N	00040000-5668-4a9b-0833-da31b0f4bedd	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5668-4a9e-80cc-35fc580a375a	\N	00040000-5668-4a9b-f0a2-4af384e8a5cb	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5668-4a9e-8301-68ab88d01228	\N	00040000-5668-4a9b-1505-0ff3805ac476	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5668-4a9e-4948-feb7c4affc41	\N	00040000-5668-4a9b-f8cc-69190fa914c0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5668-4aa0-8297-94e8a004fffa	\N	00040000-5668-4a9c-73ff-8cb313726f4c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 31801743)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5668-4a9b-2ee5-f5cfdf972c3b	8341	Adlešiči
00050000-5668-4a9b-1598-b6637e45dfe0	5270	Ajdovščina
00050000-5668-4a9b-c8e6-0861cd15ea03	6280	Ankaran/Ancarano
00050000-5668-4a9b-6f5b-ad5630291e21	9253	Apače
00050000-5668-4a9b-b098-49e84a40be6e	8253	Artiče
00050000-5668-4a9b-c100-283a92aebf6c	4275	Begunje na Gorenjskem
00050000-5668-4a9b-c0f7-a0fc164417e7	1382	Begunje pri Cerknici
00050000-5668-4a9b-0075-b70dca859fb2	9231	Beltinci
00050000-5668-4a9b-9958-2854f9942dfa	2234	Benedikt
00050000-5668-4a9b-1b48-7c29dfaf4d11	2345	Bistrica ob Dravi
00050000-5668-4a9b-4ca1-00a48bad08bf	3256	Bistrica ob Sotli
00050000-5668-4a9b-435b-4b9394fc75cc	8259	Bizeljsko
00050000-5668-4a9b-4efb-2046e00e4f25	1223	Blagovica
00050000-5668-4a9b-ce59-3d0676b4ac3b	8283	Blanca
00050000-5668-4a9b-f679-5191745537b4	4260	Bled
00050000-5668-4a9b-55e7-345bbb609fab	4273	Blejska Dobrava
00050000-5668-4a9b-8478-436b1110f633	9265	Bodonci
00050000-5668-4a9b-7f83-faeaf8fca815	9222	Bogojina
00050000-5668-4a9b-f928-7e8065537776	4263	Bohinjska Bela
00050000-5668-4a9b-f0ef-44c61a256226	4264	Bohinjska Bistrica
00050000-5668-4a9b-2022-0bf4c1d5d80e	4265	Bohinjsko jezero
00050000-5668-4a9b-13db-53cd844adc48	1353	Borovnica
00050000-5668-4a9b-c25b-dd16b46cee8b	8294	Boštanj
00050000-5668-4a9b-b9af-deee1c90b33b	5230	Bovec
00050000-5668-4a9b-92c6-7199e2e229ef	5295	Branik
00050000-5668-4a9b-3b3b-a6f34941ade1	3314	Braslovče
00050000-5668-4a9b-4480-232726a324c7	5223	Breginj
00050000-5668-4a9b-9ee5-2ae1d477e306	8280	Brestanica
00050000-5668-4a9b-cd13-36a22cce0715	2354	Bresternica
00050000-5668-4a9b-ba70-cb10a0a873f1	4243	Brezje
00050000-5668-4a9b-dc24-e7d3d4d7c69b	1351	Brezovica pri Ljubljani
00050000-5668-4a9b-e176-8749ebe02243	8250	Brežice
00050000-5668-4a9b-8ce8-69bf14f41eb1	4210	Brnik - Aerodrom
00050000-5668-4a9b-b061-de30cf3dfae1	8321	Brusnice
00050000-5668-4a9b-4b1f-5e2ef3c5c5a4	3255	Buče
00050000-5668-4a9b-30df-da1b329455be	8276	Bučka 
00050000-5668-4a9b-debf-a4938591b8f1	9261	Cankova
00050000-5668-4a9b-2dc1-38068962de2c	3000	Celje 
00050000-5668-4a9b-cc1e-97e52a222d7b	3001	Celje - poštni predali
00050000-5668-4a9b-856a-bce9ce7bdb32	4207	Cerklje na Gorenjskem
00050000-5668-4a9b-d1f3-5c55b693aaae	8263	Cerklje ob Krki
00050000-5668-4a9b-bbfd-fb6dc462378a	1380	Cerknica
00050000-5668-4a9b-e3f3-1bb5a1227a7b	5282	Cerkno
00050000-5668-4a9b-1f78-e31f0f118342	2236	Cerkvenjak
00050000-5668-4a9b-7738-88a2c008c3ae	2215	Ceršak
00050000-5668-4a9b-65b4-bbe0f772683f	2326	Cirkovce
00050000-5668-4a9b-5705-17cb8c1c5698	2282	Cirkulane
00050000-5668-4a9b-e4d4-dcaace9920f7	5273	Col
00050000-5668-4a9b-ef18-73a4e6639830	8251	Čatež ob Savi
00050000-5668-4a9b-2871-fd4782230e94	1413	Čemšenik
00050000-5668-4a9b-b688-cd2ff7e975e6	5253	Čepovan
00050000-5668-4a9b-de5a-b32bc507a87f	9232	Črenšovci
00050000-5668-4a9b-3f49-e030890be3db	2393	Črna na Koroškem
00050000-5668-4a9b-cb2f-1620672fd3dc	6275	Črni Kal
00050000-5668-4a9b-7fb8-ec3f02b2859c	5274	Črni Vrh nad Idrijo
00050000-5668-4a9b-3c57-c83e2c3b9374	5262	Črniče
00050000-5668-4a9b-0f36-fd5826909248	8340	Črnomelj
00050000-5668-4a9b-c8b7-0718abdebb18	6271	Dekani
00050000-5668-4a9b-cd75-c56069e83098	5210	Deskle
00050000-5668-4a9b-3bb3-a1b9087cfb26	2253	Destrnik
00050000-5668-4a9b-eb20-67c0bbdd6295	6215	Divača
00050000-5668-4a9b-da9d-e1f517631a4a	1233	Dob
00050000-5668-4a9b-cb26-98751a56664d	3224	Dobje pri Planini
00050000-5668-4a9b-e499-ac3c227c2648	8257	Dobova
00050000-5668-4a9b-bf3a-d5594c76a605	1423	Dobovec
00050000-5668-4a9b-596f-06975a6fe1a0	5263	Dobravlje
00050000-5668-4a9b-4eda-909b1e9ee3fb	3204	Dobrna
00050000-5668-4a9b-7e2e-55d49a535492	8211	Dobrnič
00050000-5668-4a9b-1e4b-3d8c7d71dbda	1356	Dobrova
00050000-5668-4a9b-337a-cf64ec53cfce	9223	Dobrovnik/Dobronak 
00050000-5668-4a9b-2e60-3dd80cb4fbd7	5212	Dobrovo v Brdih
00050000-5668-4a9b-6374-d8426ca588e4	1431	Dol pri Hrastniku
00050000-5668-4a9b-be7d-03ce1565b0d6	1262	Dol pri Ljubljani
00050000-5668-4a9b-c050-1b577fb3b6b7	1273	Dole pri Litiji
00050000-5668-4a9b-6233-f32dd4dc5ffd	1331	Dolenja vas
00050000-5668-4a9b-f779-0ef3deaeaa93	8350	Dolenjske Toplice
00050000-5668-4a9b-6e09-8d439bf7d473	1230	Domžale
00050000-5668-4a9b-ed10-4817aab0c6c9	2252	Dornava
00050000-5668-4a9b-c8d0-5227ad63ee9e	5294	Dornberk
00050000-5668-4a9b-289d-ff2438f093ff	1319	Draga
00050000-5668-4a9b-7a87-3d2a1cb612cb	8343	Dragatuš
00050000-5668-4a9b-10c4-1c98fc531cd1	3222	Dramlje
00050000-5668-4a9b-ea25-6d0002ec9f16	2370	Dravograd
00050000-5668-4a9b-f2e9-240c94994fa8	4203	Duplje
00050000-5668-4a9b-bf56-9f1efd2f8712	6221	Dutovlje
00050000-5668-4a9b-9330-1edb5e92d743	8361	Dvor
00050000-5668-4a9b-277b-6bbac89e6a38	2343	Fala
00050000-5668-4a9b-8489-5e8ca500ed88	9208	Fokovci
00050000-5668-4a9b-4920-e3aad8ce775b	2313	Fram
00050000-5668-4a9b-1912-4c4d1d41c339	3213	Frankolovo
00050000-5668-4a9b-b635-d4b51240beb8	1274	Gabrovka
00050000-5668-4a9b-72f8-1118232ca1cf	8254	Globoko
00050000-5668-4a9b-e318-3677659df4f8	5275	Godovič
00050000-5668-4a9b-f3b9-01f07cf0e9ac	4204	Golnik
00050000-5668-4a9b-8b30-7e4fa7472270	3303	Gomilsko
00050000-5668-4a9b-4b72-69262de6acec	4224	Gorenja vas
00050000-5668-4a9b-d971-5f339eb1d264	3263	Gorica pri Slivnici
00050000-5668-4a9b-ffcd-359091c7452e	2272	Gorišnica
00050000-5668-4a9b-ee9d-d140f29d01ff	9250	Gornja Radgona
00050000-5668-4a9b-3d1c-bb253ba57870	3342	Gornji Grad
00050000-5668-4a9b-11b8-52a949595816	4282	Gozd Martuljek
00050000-5668-4a9b-4990-3bb30fdaec18	6272	Gračišče
00050000-5668-4a9b-e663-3f68a5d6b195	9264	Grad
00050000-5668-4a9b-1909-4c7f7376c6f1	8332	Gradac
00050000-5668-4a9b-a7d6-eb4990da84c8	1384	Grahovo
00050000-5668-4a9b-fb59-9eb2e2e8223d	5242	Grahovo ob Bači
00050000-5668-4a9b-0c0b-f11280f02216	5251	Grgar
00050000-5668-4a9b-50ce-6b9b4b00eadf	3302	Griže
00050000-5668-4a9b-e777-35fe47b7dd52	3231	Grobelno
00050000-5668-4a9b-fe1d-44dd71dbe2e5	1290	Grosuplje
00050000-5668-4a9b-7833-c9fa477958b8	2288	Hajdina
00050000-5668-4a9b-371a-8d462a0486c7	8362	Hinje
00050000-5668-4a9b-d1ad-200f6915583e	2311	Hoče
00050000-5668-4a9b-8cdd-ac418cded5df	9205	Hodoš/Hodos
00050000-5668-4a9b-0fad-cc05a4feeeae	1354	Horjul
00050000-5668-4a9b-1082-87726ce0d50f	1372	Hotedršica
00050000-5668-4a9b-d6e7-01c4b2cefe43	1430	Hrastnik
00050000-5668-4a9b-570e-ac00007f62a2	6225	Hruševje
00050000-5668-4a9b-2b9d-8c3c005d081f	4276	Hrušica
00050000-5668-4a9b-1087-ec2509d2dbb1	5280	Idrija
00050000-5668-4a9b-d1c1-8fb42f5ef4f5	1292	Ig
00050000-5668-4a9b-2396-7f884c523415	6250	Ilirska Bistrica
00050000-5668-4a9b-f2bd-3628db72a4c1	6251	Ilirska Bistrica-Trnovo
00050000-5668-4a9b-61aa-bac366e3b82e	1295	Ivančna Gorica
00050000-5668-4a9b-594b-f70784fcc06f	2259	Ivanjkovci
00050000-5668-4a9b-a9d3-61bbd763d8a0	1411	Izlake
00050000-5668-4a9b-b329-f38be4837d57	6310	Izola/Isola
00050000-5668-4a9b-ea72-b08abac4ed89	2222	Jakobski Dol
00050000-5668-4a9b-98a2-10b3831291dc	2221	Jarenina
00050000-5668-4a9b-63fa-b1e6922f366b	6254	Jelšane
00050000-5668-4a9b-de8d-f005ee3cf3b9	4270	Jesenice
00050000-5668-4a9b-5f74-cd2ad42e7d1e	8261	Jesenice na Dolenjskem
00050000-5668-4a9b-34f3-0f272cf31e7f	3273	Jurklošter
00050000-5668-4a9b-a8e9-a6ae5d3dbe60	2223	Jurovski Dol
00050000-5668-4a9b-8367-c1b3ef67958e	2256	Juršinci
00050000-5668-4a9b-1fe3-fc3f0f5518eb	5214	Kal nad Kanalom
00050000-5668-4a9b-9b69-e449db533a5e	3233	Kalobje
00050000-5668-4a9b-a603-48eaf79bfbfb	4246	Kamna Gorica
00050000-5668-4a9b-11f2-b0666fccfbb8	2351	Kamnica
00050000-5668-4a9b-7780-91c2b8360b05	1241	Kamnik
00050000-5668-4a9b-e391-8e63391bddd6	5213	Kanal
00050000-5668-4a9b-e60c-72f489c15150	8258	Kapele
00050000-5668-4a9b-b426-5efb8a52c8a8	2362	Kapla
00050000-5668-4a9b-559c-41c5b44e0edc	2325	Kidričevo
00050000-5668-4a9b-70b4-47ab3feb6e47	1412	Kisovec
00050000-5668-4a9b-5671-781fe8357fc2	6253	Knežak
00050000-5668-4a9b-993f-e857312edbd5	5222	Kobarid
00050000-5668-4a9b-4926-70b6e236cdf1	9227	Kobilje
00050000-5668-4a9b-009c-ce83f3366e6f	1330	Kočevje
00050000-5668-4a9b-a7c3-86275626d35a	1338	Kočevska Reka
00050000-5668-4a9b-4dea-3be6246e1002	2276	Kog
00050000-5668-4a9b-acd8-3643079a49d4	5211	Kojsko
00050000-5668-4a9b-d79a-a3e7f3dcea64	6223	Komen
00050000-5668-4a9b-1df4-1319b68c5f58	1218	Komenda
00050000-5668-4a9b-5f71-d3d173c36fd4	6000	Koper/Capodistria 
00050000-5668-4a9b-6594-bcf161a6f300	6001	Koper/Capodistria - poštni predali
00050000-5668-4a9b-acf7-00e203e26d7f	8282	Koprivnica
00050000-5668-4a9b-8677-98c0d18794ff	5296	Kostanjevica na Krasu
00050000-5668-4a9b-af59-da419b29b8e6	8311	Kostanjevica na Krki
00050000-5668-4a9b-631f-b463b5cf0cda	1336	Kostel
00050000-5668-4a9b-d782-6ca5c7446e56	6256	Košana
00050000-5668-4a9b-30d7-7608649aaeab	2394	Kotlje
00050000-5668-4a9b-b731-cdb9f838eed8	6240	Kozina
00050000-5668-4a9b-97b8-7bcefcc19d35	3260	Kozje
00050000-5668-4a9b-e99d-e6c49ca267e0	4000	Kranj 
00050000-5668-4a9b-0094-25031ed77912	4001	Kranj - poštni predali
00050000-5668-4a9b-fbd3-b7451d367d84	4280	Kranjska Gora
00050000-5668-4a9b-8e8b-c6482aef0a78	1281	Kresnice
00050000-5668-4a9b-269b-add6ecf8065b	4294	Križe
00050000-5668-4a9b-47ab-b51babf7a841	9206	Križevci
00050000-5668-4a9b-5a81-e6c646cdcf79	9242	Križevci pri Ljutomeru
00050000-5668-4a9b-5d5c-200d13fb1b58	1301	Krka
00050000-5668-4a9b-1453-bb5df810333b	8296	Krmelj
00050000-5668-4a9b-e06c-6a899186bd0e	4245	Kropa
00050000-5668-4a9b-53fd-71eb142cfff9	8262	Krška vas
00050000-5668-4a9b-7f31-04cb897aae38	8270	Krško
00050000-5668-4a9b-2981-b863137ceeb1	9263	Kuzma
00050000-5668-4a9b-72b1-958d0c54a84b	2318	Laporje
00050000-5668-4a9b-8cd0-9fc176cba599	3270	Laško
00050000-5668-4a9b-4db0-9b584c58ec61	1219	Laze v Tuhinju
00050000-5668-4a9b-f722-86411bd06f59	2230	Lenart v Slovenskih goricah
00050000-5668-4a9b-ce5a-18da746f36f7	9220	Lendava/Lendva
00050000-5668-4a9b-88e3-5705be8ee9a7	4248	Lesce
00050000-5668-4a9b-8ad3-1dc297bbe22a	3261	Lesično
00050000-5668-4a9b-e7ad-612c8810c74f	8273	Leskovec pri Krškem
00050000-5668-4a9b-386f-8abfe3033657	2372	Libeliče
00050000-5668-4a9b-8b38-826f912c4208	2341	Limbuš
00050000-5668-4a9b-dd33-6904443afaa0	1270	Litija
00050000-5668-4a9b-cd3e-e77f3b4cf0b5	3202	Ljubečna
00050000-5668-4a9b-e23a-0cefb065c1de	1000	Ljubljana 
00050000-5668-4a9b-7fc7-51a614dc8649	1001	Ljubljana - poštni predali
00050000-5668-4a9b-8632-32ee008658dc	1231	Ljubljana - Črnuče
00050000-5668-4a9b-1158-148889e8c62d	1261	Ljubljana - Dobrunje
00050000-5668-4a9b-5c05-7fbd390ac8a3	1260	Ljubljana - Polje
00050000-5668-4a9b-bd25-80808fd4d3a5	1210	Ljubljana - Šentvid
00050000-5668-4a9b-112d-f8b8de91ae9d	1211	Ljubljana - Šmartno
00050000-5668-4a9b-3f96-2ba1989658c1	3333	Ljubno ob Savinji
00050000-5668-4a9b-8a56-ccbae6b486c6	9240	Ljutomer
00050000-5668-4a9b-6274-6c431644ec40	3215	Loče
00050000-5668-4a9b-40d7-bed2f35fabbe	5231	Log pod Mangartom
00050000-5668-4a9b-f8cc-0c0ef81c6696	1358	Log pri Brezovici
00050000-5668-4a9b-c46e-b9c23971de00	1370	Logatec
00050000-5668-4a9b-77df-6f33fb09b65f	1371	Logatec
00050000-5668-4a9b-c812-5960702433ed	1434	Loka pri Zidanem Mostu
00050000-5668-4a9b-db06-a8ddec3a32ed	3223	Loka pri Žusmu
00050000-5668-4a9b-4437-02a42f2dbe26	6219	Lokev
00050000-5668-4a9b-436f-deff9b6ab138	1318	Loški Potok
00050000-5668-4a9b-7516-00c15d54875f	2324	Lovrenc na Dravskem polju
00050000-5668-4a9b-d5a6-017c78ebfa26	2344	Lovrenc na Pohorju
00050000-5668-4a9b-0f31-9e07b05e9e10	3334	Luče
00050000-5668-4a9b-ee38-0fcd37df9be8	1225	Lukovica
00050000-5668-4a9b-3501-9b4114017573	9202	Mačkovci
00050000-5668-4a9b-3711-0266549e6b3f	2322	Majšperk
00050000-5668-4a9b-44de-9566d0a855ba	2321	Makole
00050000-5668-4a9b-8868-3fdfeba55ac8	9243	Mala Nedelja
00050000-5668-4a9b-6b96-252157175f59	2229	Malečnik
00050000-5668-4a9b-6efb-909008d288ee	6273	Marezige
00050000-5668-4a9b-a236-819873772bc1	2000	Maribor 
00050000-5668-4a9b-bbd8-9ccae34979f3	2001	Maribor - poštni predali
00050000-5668-4a9b-3820-fc2854700dd1	2206	Marjeta na Dravskem polju
00050000-5668-4a9b-6bc4-16862f714d57	2281	Markovci
00050000-5668-4a9b-fb6f-c7a66c0110d8	9221	Martjanci
00050000-5668-4a9b-7cdf-5186194cac34	6242	Materija
00050000-5668-4a9b-b959-560c807ba0e3	4211	Mavčiče
00050000-5668-4a9b-ac00-1c00b43d7b1a	1215	Medvode
00050000-5668-4a9b-915e-c803f3d20b6b	1234	Mengeš
00050000-5668-4a9b-a920-0c8c6c3ac3b5	8330	Metlika
00050000-5668-4a9b-b5f5-3ec58beb77c3	2392	Mežica
00050000-5668-4a9b-c3b8-23adf1ffc346	2204	Miklavž na Dravskem polju
00050000-5668-4a9b-2512-85d5e3ebf79c	2275	Miklavž pri Ormožu
00050000-5668-4a9b-fce4-a264756f233a	5291	Miren
00050000-5668-4a9b-ffcd-bba7680d2f07	8233	Mirna
00050000-5668-4a9b-2dc5-998acf0e93a5	8216	Mirna Peč
00050000-5668-4a9b-98ee-c646a56e2c1a	2382	Mislinja
00050000-5668-4a9b-1d2c-21657e7514ca	4281	Mojstrana
00050000-5668-4a9b-5393-523bad8fcd6b	8230	Mokronog
00050000-5668-4a9b-bd17-b5bcee08d252	1251	Moravče
00050000-5668-4a9b-f371-9d3cdcde73e8	9226	Moravske Toplice
00050000-5668-4a9b-bc9f-9e843974a4b5	5216	Most na Soči
00050000-5668-4a9b-ac34-e658af10dea7	1221	Motnik
00050000-5668-4a9b-ed8d-a8779fab173d	3330	Mozirje
00050000-5668-4a9b-a592-643bff00bd75	9000	Murska Sobota 
00050000-5668-4a9b-c514-e96925bb3a84	9001	Murska Sobota - poštni predali
00050000-5668-4a9b-e854-02dcb6a17e6f	2366	Muta
00050000-5668-4a9b-2ea0-135841d41f3c	4202	Naklo
00050000-5668-4a9b-401e-62ba87b62094	3331	Nazarje
00050000-5668-4a9b-95d6-7de6963e5ac7	1357	Notranje Gorice
00050000-5668-4a9b-76e1-494fc9b91e9e	3203	Nova Cerkev
00050000-5668-4a9b-3ef9-51e9b7816876	5000	Nova Gorica 
00050000-5668-4a9b-ed2f-c02207d4f518	5001	Nova Gorica - poštni predali
00050000-5668-4a9b-2557-14c17bd44284	1385	Nova vas
00050000-5668-4a9b-1e2e-40c85db6c624	8000	Novo mesto
00050000-5668-4a9b-67ce-3e2dc04ee7ce	8001	Novo mesto - poštni predali
00050000-5668-4a9b-39ba-fb88d8b39f64	6243	Obrov
00050000-5668-4a9b-5508-2a887adc9e27	9233	Odranci
00050000-5668-4a9b-8912-b9eb584517b4	2317	Oplotnica
00050000-5668-4a9b-5568-6ed67a7d0f47	2312	Orehova vas
00050000-5668-4a9b-2344-37f2c31b1ac1	2270	Ormož
00050000-5668-4a9b-9559-38e5da886394	1316	Ortnek
00050000-5668-4a9b-b786-592c68e688f2	1337	Osilnica
00050000-5668-4a9b-42e3-1496e2e50118	8222	Otočec
00050000-5668-4a9b-2283-9116ad3baae3	2361	Ožbalt
00050000-5668-4a9b-a2aa-9e524087c29a	2231	Pernica
00050000-5668-4a9b-a4b3-3c9e26ed12e0	2211	Pesnica pri Mariboru
00050000-5668-4a9b-ca70-8dd66f856cd0	9203	Petrovci
00050000-5668-4a9b-9834-0ea988262be5	3301	Petrovče
00050000-5668-4a9b-6b6b-2fc94edfbbfd	6330	Piran/Pirano
00050000-5668-4a9b-bf00-0aed137ce9cf	8255	Pišece
00050000-5668-4a9b-96ce-9670fce7955c	6257	Pivka
00050000-5668-4a9b-6196-50a46aa06c7e	6232	Planina
00050000-5668-4a9b-128d-769ffc13cdfd	3225	Planina pri Sevnici
00050000-5668-4a9b-4b11-43b2bc4f6321	6276	Pobegi
00050000-5668-4a9b-ef68-798a926de8f8	8312	Podbočje
00050000-5668-4a9b-9912-bb2f6b6f623d	5243	Podbrdo
00050000-5668-4a9b-6b58-7005826def98	3254	Podčetrtek
00050000-5668-4a9b-0ac4-1efd5b8f16d9	2273	Podgorci
00050000-5668-4a9b-ad8b-643513d7d40d	6216	Podgorje
00050000-5668-4a9b-c7bb-86019221df4e	2381	Podgorje pri Slovenj Gradcu
00050000-5668-4a9b-4dfd-bee7f81f9bec	6244	Podgrad
00050000-5668-4a9b-5af1-770ca44f9f6b	1414	Podkum
00050000-5668-4a9b-8711-8789fc9a448e	2286	Podlehnik
00050000-5668-4a9b-fb9a-0cc06630af0f	5272	Podnanos
00050000-5668-4a9b-8a17-e4ad574c8ba0	4244	Podnart
00050000-5668-4a9b-99cc-79479bb1831e	3241	Podplat
00050000-5668-4a9b-2321-071ae467501c	3257	Podsreda
00050000-5668-4a9b-5d24-50ff92941014	2363	Podvelka
00050000-5668-4a9b-a1aa-fbd64650b764	2208	Pohorje
00050000-5668-4a9b-0262-b0ea09afd0e0	2257	Polenšak
00050000-5668-4a9b-db8c-8b6b54d2d137	1355	Polhov Gradec
00050000-5668-4a9b-5edc-ce5f6af02ec1	4223	Poljane nad Škofjo Loko
00050000-5668-4a9b-b3cd-894843ddc9e7	2319	Poljčane
00050000-5668-4a9b-1d82-24e16209eb7e	1272	Polšnik
00050000-5668-4a9b-9892-8c6f80a963e3	3313	Polzela
00050000-5668-4a9b-5e5e-38ec046b8d49	3232	Ponikva
00050000-5668-4a9b-7cd7-2483c245378d	6320	Portorož/Portorose
00050000-5668-4a9b-1f0d-d33e2bfc68d4	6230	Postojna
00050000-5668-4a9b-0632-30f6f7f2b5e1	2331	Pragersko
00050000-5668-4a9b-b7c8-d9df6d584f79	3312	Prebold
00050000-5668-4a9b-cc76-9c96ac076e1b	4205	Preddvor
00050000-5668-4a9b-e2e5-c19b023c0d0b	6255	Prem
00050000-5668-4a9b-37c6-b39c036c3800	1352	Preserje
00050000-5668-4a9b-80d3-e9b3262bc25b	6258	Prestranek
00050000-5668-4a9b-7720-b1c70ae3e661	2391	Prevalje
00050000-5668-4a9b-e48b-b82d802ba1e1	3262	Prevorje
00050000-5668-4a9b-0b9d-1c9727c54723	1276	Primskovo 
00050000-5668-4a9b-f27a-770f29976204	3253	Pristava pri Mestinju
00050000-5668-4a9b-1cc2-79a77f8dbb8d	9207	Prosenjakovci/Partosfalva
00050000-5668-4a9b-29df-1ef2dca15e2f	5297	Prvačina
00050000-5668-4a9b-6a9d-b29b0d421b3e	2250	Ptuj
00050000-5668-4a9b-07c6-87c93b3b0b65	2323	Ptujska Gora
00050000-5668-4a9b-e961-51c0b1605bc6	9201	Puconci
00050000-5668-4a9b-b6d7-a5e4387102a0	2327	Rače
00050000-5668-4a9b-0e5c-ec5979c20a6d	1433	Radeče
00050000-5668-4a9b-f20b-b838b7942828	9252	Radenci
00050000-5668-4a9b-bf90-a46123f53d5c	2360	Radlje ob Dravi
00050000-5668-4a9b-371e-6730a0ab8f33	1235	Radomlje
00050000-5668-4a9b-957a-ef1a48f317ec	4240	Radovljica
00050000-5668-4a9b-c9bf-db80dba0f395	8274	Raka
00050000-5668-4a9b-1b51-5af0586b28ea	1381	Rakek
00050000-5668-4a9b-fea8-e29eee762dee	4283	Rateče - Planica
00050000-5668-4a9b-368f-5420d1106c69	2390	Ravne na Koroškem
00050000-5668-4a9b-de18-fd41a7cf8477	9246	Razkrižje
00050000-5668-4a9b-90b3-1f4d37a706bd	3332	Rečica ob Savinji
00050000-5668-4a9b-b432-9d22962f3622	5292	Renče
00050000-5668-4a9b-82ec-93d38e9f032e	1310	Ribnica
00050000-5668-4a9b-7296-532d802ffc38	2364	Ribnica na Pohorju
00050000-5668-4a9b-77ae-c05220bdb79c	3272	Rimske Toplice
00050000-5668-4a9b-d239-e883a270ccda	1314	Rob
00050000-5668-4a9b-2032-30a3ad4d1c06	5215	Ročinj
00050000-5668-4a9b-37cb-e80c25b85cfa	3250	Rogaška Slatina
00050000-5668-4a9b-6638-662eb89457f7	9262	Rogašovci
00050000-5668-4a9b-fa40-dcb7d0b95fa5	3252	Rogatec
00050000-5668-4a9b-4b5f-a383d551d23a	1373	Rovte
00050000-5668-4a9b-261f-c786139d8743	2342	Ruše
00050000-5668-4a9b-2daa-8eee8f375d1e	1282	Sava
00050000-5668-4a9b-e9a3-a5438e30f8a0	6333	Sečovlje/Sicciole
00050000-5668-4a9b-3df1-9e4ec09e94f7	4227	Selca
00050000-5668-4a9b-ffa6-e794709d98dc	2352	Selnica ob Dravi
00050000-5668-4a9b-30a7-ed2053de5830	8333	Semič
00050000-5668-4a9b-9438-4e3516f93266	8281	Senovo
00050000-5668-4a9b-dc00-d6b0c02eb11f	6224	Senožeče
00050000-5668-4a9b-4b17-bac3c7d5bbe2	8290	Sevnica
00050000-5668-4a9b-2ec0-128c22276c8a	6210	Sežana
00050000-5668-4a9b-dfaf-d3c24f6a5e04	2214	Sladki Vrh
00050000-5668-4a9b-aeb6-aaa308f2737d	5283	Slap ob Idrijci
00050000-5668-4a9b-4d67-fd94977621f6	2380	Slovenj Gradec
00050000-5668-4a9b-9124-f95ec06d250b	2310	Slovenska Bistrica
00050000-5668-4a9b-6b8b-daddc845b31f	3210	Slovenske Konjice
00050000-5668-4a9b-e8f8-6c876145db91	1216	Smlednik
00050000-5668-4a9b-04fd-6c4cfb947596	5232	Soča
00050000-5668-4a9b-8063-63c06c6e4b43	1317	Sodražica
00050000-5668-4a9b-bfd4-b5ebef3616b4	3335	Solčava
00050000-5668-4a9b-c730-195ccb4836cf	5250	Solkan
00050000-5668-4a9b-16c3-9874cf5506a1	4229	Sorica
00050000-5668-4a9b-8bd7-312902d37cf7	4225	Sovodenj
00050000-5668-4a9b-b4d4-68569fd047b9	5281	Spodnja Idrija
00050000-5668-4a9b-2e24-c96d3791fffd	2241	Spodnji Duplek
00050000-5668-4a9b-131b-88f2f139ad06	9245	Spodnji Ivanjci
00050000-5668-4a9b-e25e-03696120ef42	2277	Središče ob Dravi
00050000-5668-4a9b-20be-38f80fd4bf9b	4267	Srednja vas v Bohinju
00050000-5668-4a9b-8970-26bbdaa30189	8256	Sromlje 
00050000-5668-4a9b-39bd-ed3f7f0a69bd	5224	Srpenica
00050000-5668-4a9b-1139-03bb65bc515c	1242	Stahovica
00050000-5668-4a9b-937f-352c3a5feb0f	1332	Stara Cerkev
00050000-5668-4a9b-c7a8-261b6a4466ed	8342	Stari trg ob Kolpi
00050000-5668-4a9b-e985-15eeb61e1c54	1386	Stari trg pri Ložu
00050000-5668-4a9b-140c-c0400e4fac01	2205	Starše
00050000-5668-4a9b-d829-4cce2d9610e2	2289	Stoperce
00050000-5668-4a9b-d94d-de0cbb32d82e	8322	Stopiče
00050000-5668-4a9b-8c3f-8b9ceb76852f	3206	Stranice
00050000-5668-4a9b-7902-5c5c9d6eff50	8351	Straža
00050000-5668-4a9b-b4b2-404a428d7dbc	1313	Struge
00050000-5668-4a9b-5c3a-e72e6db7bb96	8293	Studenec
00050000-5668-4a9b-e09a-172b0181fea9	8331	Suhor
00050000-5668-4a9b-5c5e-cd1312b93df4	2233	Sv. Ana v Slovenskih goricah
00050000-5668-4a9b-423a-12c7e43c6e16	2235	Sv. Trojica v Slovenskih goricah
00050000-5668-4a9b-5c52-9a97e5d9e543	2353	Sveti Duh na Ostrem Vrhu
00050000-5668-4a9b-d2e5-dce0a9f5474b	9244	Sveti Jurij ob Ščavnici
00050000-5668-4a9b-9770-c096675c4e6b	3264	Sveti Štefan
00050000-5668-4a9b-c809-431d3feced90	2258	Sveti Tomaž
00050000-5668-4a9b-da6f-c3ce820e7dae	9204	Šalovci
00050000-5668-4a9b-1819-877c8b4b8adf	5261	Šempas
00050000-5668-4a9b-1735-5dfd6a7fcade	5290	Šempeter pri Gorici
00050000-5668-4a9b-b9b2-a8543b496a00	3311	Šempeter v Savinjski dolini
00050000-5668-4a9b-de57-d2374a716092	4208	Šenčur
00050000-5668-4a9b-be53-fea16df26b17	2212	Šentilj v Slovenskih goricah
00050000-5668-4a9b-7441-864978267134	8297	Šentjanž
00050000-5668-4a9b-af88-53abaa4c04c5	2373	Šentjanž pri Dravogradu
00050000-5668-4a9b-70a6-c7294a9dcd12	8310	Šentjernej
00050000-5668-4a9b-0d34-4fac43d35474	3230	Šentjur
00050000-5668-4a9b-3adf-e9893e3725fb	3271	Šentrupert
00050000-5668-4a9b-38a3-319f6d8fd95f	8232	Šentrupert
00050000-5668-4a9b-9203-6aae3668678f	1296	Šentvid pri Stični
00050000-5668-4a9b-845f-298cdd301592	8275	Škocjan
00050000-5668-4a9b-a7cb-17048b0f5c31	6281	Škofije
00050000-5668-4a9b-3b20-ee092a44cb9d	4220	Škofja Loka
00050000-5668-4a9b-fca4-8c0f73b9a257	3211	Škofja vas
00050000-5668-4a9b-da57-d136f3d81c92	1291	Škofljica
00050000-5668-4a9b-b1e8-5e38809a0495	6274	Šmarje
00050000-5668-4a9b-b741-28b5dcf7f982	1293	Šmarje - Sap
00050000-5668-4a9b-57dd-861b02a42898	3240	Šmarje pri Jelšah
00050000-5668-4a9b-7d4b-f14cd7ab6a0f	8220	Šmarješke Toplice
00050000-5668-4a9b-8093-ad924beb2c7d	2315	Šmartno na Pohorju
00050000-5668-4a9b-dfe4-2b1775b0d7a6	3341	Šmartno ob Dreti
00050000-5668-4a9b-e4e7-fa168bdb5563	3327	Šmartno ob Paki
00050000-5668-4a9b-5313-8678652b72e6	1275	Šmartno pri Litiji
00050000-5668-4a9b-f5be-0e06b6c58d98	2383	Šmartno pri Slovenj Gradcu
00050000-5668-4a9b-9c0d-3522285de8d3	3201	Šmartno v Rožni dolini
00050000-5668-4a9b-3cf8-d5ccc9733a14	3325	Šoštanj
00050000-5668-4a9b-ce93-22ad68932497	6222	Štanjel
00050000-5668-4a9b-3f54-2e199decb5dd	3220	Štore
00050000-5668-4a9b-767a-70b67ddf5995	3304	Tabor
00050000-5668-4a9b-771d-68f902c21766	3221	Teharje
00050000-5668-4a9b-c9ce-84c537176d37	9251	Tišina
00050000-5668-4a9b-b59a-de5ceb62be72	5220	Tolmin
00050000-5668-4a9b-afa3-9533d6dd3ec9	3326	Topolšica
00050000-5668-4a9b-0177-34419eca061e	2371	Trbonje
00050000-5668-4a9b-c49f-d94d1a12ddc4	1420	Trbovlje
00050000-5668-4a9b-160b-6bc78eab81db	8231	Trebelno 
00050000-5668-4a9b-c8d6-c07106afdb96	8210	Trebnje
00050000-5668-4a9b-986f-7e465ce14ed6	5252	Trnovo pri Gorici
00050000-5668-4a9b-a9f0-ca3035321a66	2254	Trnovska vas
00050000-5668-4a9b-4e4a-c7e3c2de7f75	1222	Trojane
00050000-5668-4a9b-4907-59e5dd8d6732	1236	Trzin
00050000-5668-4a9b-23f4-fde0cfa778e3	4290	Tržič
00050000-5668-4a9b-c8de-63093ab8af1d	8295	Tržišče
00050000-5668-4a9b-ce17-2c9b5d7dfc51	1311	Turjak
00050000-5668-4a9b-9d76-d59965e026c5	9224	Turnišče
00050000-5668-4a9b-93aa-69487530bab5	8323	Uršna sela
00050000-5668-4a9b-e0eb-7fc93e7d332f	1252	Vače
00050000-5668-4a9b-9bd8-376d75ae6b97	3320	Velenje 
00050000-5668-4a9b-c674-0ec771cc3bda	3322	Velenje - poštni predali
00050000-5668-4a9b-dfdf-0a56983b1f92	8212	Velika Loka
00050000-5668-4a9b-dd7f-cfd7f1d604fd	2274	Velika Nedelja
00050000-5668-4a9b-2a69-5086ff2bf891	9225	Velika Polana
00050000-5668-4a9b-3c48-f52591dab548	1315	Velike Lašče
00050000-5668-4a9b-6708-e17fd1cfe660	8213	Veliki Gaber
00050000-5668-4a9b-448a-aeb0a9610d3f	9241	Veržej
00050000-5668-4a9b-347c-7923b40a9c0e	1312	Videm - Dobrepolje
00050000-5668-4a9b-7550-cb4fa3eb0558	2284	Videm pri Ptuju
00050000-5668-4a9b-e2b9-abe468f23203	8344	Vinica
00050000-5668-4a9b-fbe5-7e6b1f20fd47	5271	Vipava
00050000-5668-4a9b-e832-f44d2a338151	4212	Visoko
00050000-5668-4a9b-7847-d778324bc1a9	1294	Višnja Gora
00050000-5668-4a9b-a8a8-b8a00b7e0986	3205	Vitanje
00050000-5668-4a9b-403f-03c4aed42f18	2255	Vitomarci
00050000-5668-4a9b-9fb6-833ec71af670	1217	Vodice
00050000-5668-4a9b-c96f-ba3a1134383c	3212	Vojnik\t
00050000-5668-4a9b-214d-6a85b305966c	5293	Volčja Draga
00050000-5668-4a9b-8944-9304abbb7227	2232	Voličina
00050000-5668-4a9b-bfb8-56c4346481bf	3305	Vransko
00050000-5668-4a9b-b83a-54e0decec6ba	6217	Vremski Britof
00050000-5668-4a9b-6127-3e1c5788096a	1360	Vrhnika
00050000-5668-4a9b-9b25-c7ea93671fea	2365	Vuhred
00050000-5668-4a9b-d383-d091242709af	2367	Vuzenica
00050000-5668-4a9b-1975-67fc3db116c6	8292	Zabukovje 
00050000-5668-4a9b-8f2e-3bf9423c841e	1410	Zagorje ob Savi
00050000-5668-4a9b-8682-2c36ce98f835	1303	Zagradec
00050000-5668-4a9b-3b4b-4c6818e64654	2283	Zavrč
00050000-5668-4a9b-4727-a7155c10b068	8272	Zdole 
00050000-5668-4a9b-5b01-f77092e0b10a	4201	Zgornja Besnica
00050000-5668-4a9b-3279-ae2deafd946c	2242	Zgornja Korena
00050000-5668-4a9b-a333-dedf9048dad0	2201	Zgornja Kungota
00050000-5668-4a9b-d64d-7e0648ff2eef	2316	Zgornja Ložnica
00050000-5668-4a9b-06cd-2c75168e106c	2314	Zgornja Polskava
00050000-5668-4a9b-2653-4518ab895f7b	2213	Zgornja Velka
00050000-5668-4a9b-e1ef-2eafaa881a2d	4247	Zgornje Gorje
00050000-5668-4a9b-bd09-0b6318415876	4206	Zgornje Jezersko
00050000-5668-4a9b-f90d-cd0b623d15ac	2285	Zgornji Leskovec
00050000-5668-4a9b-12ee-b9476542a3f0	1432	Zidani Most
00050000-5668-4a9b-bcca-d2fa09328b08	3214	Zreče
00050000-5668-4a9b-bf58-247e00f3c5db	4209	Žabnica
00050000-5668-4a9b-f5c0-50a30bf24295	3310	Žalec
00050000-5668-4a9b-dc26-b719af0b271a	4228	Železniki
00050000-5668-4a9b-0d76-c1b1c3cd7840	2287	Žetale
00050000-5668-4a9b-36c5-51e7599d6461	4226	Žiri
00050000-5668-4a9b-d963-2207ed29294c	4274	Žirovnica
00050000-5668-4a9b-5642-be3c7d8a27ef	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 31802405)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 31801980)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 31801728)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5668-4a9e-3f25-a124c62f6461	00080000-5668-4a9e-5d61-902efbc0fbbb	\N	00040000-5668-4a9c-73ff-8cb313726f4c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5668-4a9e-d336-102378cb0f68	00080000-5668-4a9e-5d61-902efbc0fbbb	\N	00040000-5668-4a9c-73ff-8cb313726f4c	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5668-4a9e-0ee0-932f8c528806	00080000-5668-4a9e-59ae-d653b8788e40	\N	00040000-5668-4a9c-73ff-8cb313726f4c	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 31801872)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5668-4a9c-6b10-e848853c74a9	novo leto	1	1	\N	t
00430000-5668-4a9c-0a03-1140dd1fce9c	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5668-4a9c-b8fe-a129e261202a	dan upora proti okupatorju	27	4	\N	t
00430000-5668-4a9c-f062-237f83d63f3f	praznik dela	1	5	\N	t
00430000-5668-4a9c-b164-867a68dd6e5a	praznik dela	2	5	\N	t
00430000-5668-4a9c-869c-5d10f3f30e97	dan Primoža Trubarja	8	6	\N	f
00430000-5668-4a9c-385e-448fe570911d	dan državnosti	25	6	\N	t
00430000-5668-4a9c-1909-4e6617303619	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5668-4a9c-dce4-bf3fa25da733	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5668-4a9c-cdef-9f61a0bcbeb4	dan suverenosti	25	10	\N	f
00430000-5668-4a9c-892d-cf36e8417048	dan spomina na mrtve	1	11	\N	t
00430000-5668-4a9c-b990-afeec2f8e65d	dan Rudolfa Maistra	23	11	\N	f
00430000-5668-4a9c-aaa1-4aa36d03d6a6	božič	25	12	\N	t
00430000-5668-4a9c-7087-83e6b4293619	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5668-4a9c-da68-4685194bc25e	Marijino vnebovzetje	15	8	\N	t
00430000-5668-4a9c-39cc-f1c838373d7a	dan reformacije	31	10	\N	t
00430000-5668-4a9c-a1b0-ee16db3b8346	velikonočna nedelja	27	3	2016	t
00430000-5668-4a9c-216c-350953567c64	velikonočna nedelja	16	4	2017	t
00430000-5668-4a9c-06c4-dcb4f989932d	velikonočna nedelja	1	4	2018	t
00430000-5668-4a9c-fb39-0b642e736f9c	velikonočna nedelja	21	4	2019	t
00430000-5668-4a9c-abfc-ab172fe40be8	velikonočna nedelja	12	4	2020	t
00430000-5668-4a9c-9b05-7fef7c7dc60a	velikonočna nedelja	4	4	2021	t
00430000-5668-4a9c-6ee1-a28f04f006db	velikonočna nedelja	17	4	2022	t
00430000-5668-4a9c-919d-d576f1e800b9	velikonočna nedelja	9	4	2023	t
00430000-5668-4a9c-f4b3-c1a6da70ab1f	velikonočna nedelja	31	3	2024	t
00430000-5668-4a9c-239c-38a7ae707211	velikonočna nedelja	20	4	2025	t
00430000-5668-4a9c-120b-f4263813e35a	velikonočna nedelja	5	4	2026	t
00430000-5668-4a9c-3397-02153d702ef8	velikonočna nedelja	28	3	2027	t
00430000-5668-4a9c-7ff2-2f9db2f5b960	velikonočna nedelja	16	4	2028	t
00430000-5668-4a9c-4258-bdbbc9071d7a	velikonočna nedelja	1	4	2029	t
00430000-5668-4a9c-b03e-8a7ca2f7c267	velikonočna nedelja	21	4	2030	t
00430000-5668-4a9c-3296-315681f9a201	velikonočni ponedeljek	28	3	2016	t
00430000-5668-4a9c-929d-20a61c20e650	velikonočni ponedeljek	17	4	2017	t
00430000-5668-4a9c-21e9-b46129d500e3	velikonočni ponedeljek	2	4	2018	t
00430000-5668-4a9c-fc9d-8c910fc424ae	velikonočni ponedeljek	22	4	2019	t
00430000-5668-4a9c-155f-9fceabf0ae3c	velikonočni ponedeljek	13	4	2020	t
00430000-5668-4a9c-71aa-4ef223bd1fa7	velikonočni ponedeljek	5	4	2021	t
00430000-5668-4a9c-ebae-d550bdbd4aa5	velikonočni ponedeljek	18	4	2022	t
00430000-5668-4a9c-a334-ae3b5309c25c	velikonočni ponedeljek	10	4	2023	t
00430000-5668-4a9c-44b9-d0be40b79e68	velikonočni ponedeljek	1	4	2024	t
00430000-5668-4a9c-130b-6d1c2ea406d3	velikonočni ponedeljek	21	4	2025	t
00430000-5668-4a9c-0ebb-077f9043ee38	velikonočni ponedeljek	6	4	2026	t
00430000-5668-4a9c-4d8d-63b63b2b8b48	velikonočni ponedeljek	29	3	2027	t
00430000-5668-4a9c-169e-11aa76216721	velikonočni ponedeljek	17	4	2028	t
00430000-5668-4a9c-f490-5e27c4a39605	velikonočni ponedeljek	2	4	2029	t
00430000-5668-4a9c-95d6-a0daf9aec95b	velikonočni ponedeljek	22	4	2030	t
00430000-5668-4a9c-1c68-40f7a01af032	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5668-4a9c-e0e3-0fb3450f8f78	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5668-4a9c-3ac0-14d62b29028f	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5668-4a9c-a66c-eefaf568f749	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5668-4a9c-1995-b9718df6d8c0	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5668-4a9c-3455-df277396c977	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5668-4a9c-795f-af22dba3b34f	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5668-4a9c-3303-11121f4385f5	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5668-4a9c-e812-841d61980557	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5668-4a9c-0dce-d60564747bc1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5668-4a9c-2ec7-7aca0399e7c6	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5668-4a9c-4b1f-0524ce1c30ed	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5668-4a9c-34f3-4bf10f757885	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5668-4a9c-96db-c7d10ef2358b	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5668-4a9c-c092-03f2a8eadbba	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 31801832)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 31801844)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 31801992)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 31802419)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 31802429)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5668-4a9e-414c-9bd1c79cfab4	00080000-5668-4a9e-c6ae-6deae6b11c6c	0987	AK
00190000-5668-4a9e-6caf-979f394c79dd	00080000-5668-4a9e-59ae-d653b8788e40	0989	AK
00190000-5668-4a9e-d071-6b6bd2f042ee	00080000-5668-4a9e-6d24-cefe8fca1e49	0986	AK
00190000-5668-4a9e-8792-64d244582e03	00080000-5668-4a9e-84c8-d968f1252bd3	0984	AK
00190000-5668-4a9e-dcd5-a54547fb36d6	00080000-5668-4a9e-80cc-35fc580a375a	0983	AK
00190000-5668-4a9e-57ad-0e4b9d2a906d	00080000-5668-4a9e-8301-68ab88d01228	0982	AK
00190000-5668-4aa0-4059-3cc4559837c7	00080000-5668-4aa0-8297-94e8a004fffa	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 31802328)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5668-4a9e-9661-cd9fb43da65c	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 31802437)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 31802021)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5668-4a9e-a85c-7b7cd015ac42	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5668-4a9e-d3aa-958626a7bde1	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5668-4a9e-8e73-d6e64ffbc8d0	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5668-4a9e-b6d7-d027c74bcd7a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5668-4a9e-bc9c-5c8d1336cdd8	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5668-4a9e-629c-98c4efdadc8f	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5668-4a9e-e069-8963203daa38	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 31801965)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 31801955)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 31802166)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 31802096)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 31801806)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 31801568)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5668-4aa0-8297-94e8a004fffa	00010000-5668-4a9c-be3e-7906b12543ad	2015-12-09 16:37:04	INS	a:0:{}
2	App\\Entity\\Option	00000000-5668-4aa0-c399-c32a8dcc6173	00010000-5668-4a9c-be3e-7906b12543ad	2015-12-09 16:37:04	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5668-4aa0-4059-3cc4559837c7	00010000-5668-4a9c-be3e-7906b12543ad	2015-12-09 16:37:04	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 31802034)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 31801606)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5668-4a9c-7ff5-44fb6f55c245	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5668-4a9c-3c1e-a8a85bcaf8fd	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5668-4a9c-70d8-ca2e15770bf3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5668-4a9c-1a78-5ebe5fdb0be3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5668-4a9c-c49c-15e3659c441c	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5668-4a9c-b04e-7479f15cdb80	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5668-4a9c-b356-bb38c095bccb	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5668-4a9c-8cdf-72f1f4f62523	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5668-4a9c-955a-c31554fd9006	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5668-4a9c-987f-55b1f8cdfd38	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5668-4a9c-8224-8f08592d88ba	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5668-4a9c-df4b-b184ea0830ed	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5668-4a9c-573f-7d639fb42ac0	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5668-4a9c-3066-b00fed6423d0	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5668-4a9c-67bd-3d8259e06df4	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5668-4a9c-ec4b-4a9e187f0455	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5668-4a9c-bdd2-5d2ca9eb6bc7	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5668-4a9c-6150-d636ba087d88	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5668-4a9c-852e-96512f61500f	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5668-4a9c-6c25-6cc39567f4d0	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5668-4a9c-190f-a1f34c090451	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5668-4a9c-edf6-36368aee5be5	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5668-4a9c-2340-571138f215e7	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5668-4a9c-5604-8bf506e2f609	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5668-4a9c-7bd2-c528e023ab3a	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5668-4a9c-416f-23eb5f806da6	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5668-4a9c-2672-20573fcd8be5	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5668-4a9c-16cd-cfb1ff2e4e2c	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5668-4a9c-c7ac-50be2f3071e5	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5668-4a9c-21d9-f3dd10fb6629	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5668-4a9c-d898-c7a53425c839	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5668-4a9c-daa2-562695abe81a	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5668-4a9c-ed23-d1396af4bd86	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5668-4a9c-150b-4e468c2edcee	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5668-4a9c-bf47-b3faec17345a	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5668-4a9c-6e1a-9e60563ea7a8	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5668-4a9c-2bab-0af9bfe81f89	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5668-4a9c-403b-1f50bb5e161b	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5668-4a9c-8dc6-4c4e2060bd33	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5668-4a9c-e2f2-6aa5398b9905	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5668-4a9c-221c-ab7901dd41aa	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5668-4a9c-ffb0-45f877dfc8ba	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5668-4a9c-f1c4-4399c8551a52	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5668-4a9c-15ff-ea6563853429	arhivar	arhivar	t
00020000-5668-4a9e-7018-76306498b5eb	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5668-4a9e-6b43-f1148454b344	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-813e-6a78be1da501	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-09b3-6d914b67df57	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-34ac-f42d0c8c8544	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-08b8-908b84d4d540	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-6fdf-ea39dc82f563	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-998a-8a316f5f9307	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-9afd-a76b26f4c69f	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-e810-cc7a4286343f	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-955b-cf12f17a3160	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-2877-bbe472c648d8	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-d10f-c5735dfb77aa	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-e4ed-ea82e2f3625f	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-471f-42d158777d66	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-8846-d1c34bf761b7	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-8349-07d8adf5aafd	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-a371-cb49610ce26a	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-677a-f3af90a46fd5	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-7aa4-7fec2e88859c	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5668-4a9e-65d7-72b524142517	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-edad-f1eccd38a1ab	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-1455-f0b191edbb3b	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-3e14-88336c7620e3	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-fea4-f8d3fbdca7dc	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-0e22-0dcea83207e3	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-7c26-513d30242ef1	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-082d-633ff40d1d76	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-c5f2-7f6edb34e0f1	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-1110-8b432428a8e2	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-b87f-d98b915e1dc4	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-249a-cebc384655b9	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-62e5-c7de835f5574	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-c69b-f9c0ec548b53	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5668-4a9e-0b0e-9b46126ac0ea	Alternacija-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 31801590)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5668-4a9c-f863-f1f71256aeef	00020000-5668-4a9c-70d8-ca2e15770bf3
00010000-5668-4a9c-be3e-7906b12543ad	00020000-5668-4a9c-70d8-ca2e15770bf3
00010000-5668-4a9e-a0ff-5057f4870b3d	00020000-5668-4a9e-7018-76306498b5eb
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-6b43-f1148454b344
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-08b8-908b84d4d540
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-e810-cc7a4286343f
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-2877-bbe472c648d8
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-e4ed-ea82e2f3625f
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-677a-f3af90a46fd5
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-09b3-6d914b67df57
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-65d7-72b524142517
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-3e14-88336c7620e3
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-0e22-0dcea83207e3
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-082d-633ff40d1d76
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-1110-8b432428a8e2
00010000-5668-4a9e-8f59-52372304baaf	00020000-5668-4a9e-c69b-f9c0ec548b53
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-6b43-f1148454b344
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-813e-6a78be1da501
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-09b3-6d914b67df57
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-34ac-f42d0c8c8544
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-e4ed-ea82e2f3625f
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-8349-07d8adf5aafd
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-65d7-72b524142517
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-3e14-88336c7620e3
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-0e22-0dcea83207e3
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-082d-633ff40d1d76
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-1110-8b432428a8e2
00010000-5668-4a9e-f9c2-10fe8574e89d	00020000-5668-4a9e-c69b-f9c0ec548b53
00010000-5668-4a9e-4cbd-80a272d59400	00020000-5668-4a9e-6b43-f1148454b344
00010000-5668-4a9e-4cbd-80a272d59400	00020000-5668-4a9e-813e-6a78be1da501
00010000-5668-4a9e-4cbd-80a272d59400	00020000-5668-4a9e-09b3-6d914b67df57
00010000-5668-4a9e-4cbd-80a272d59400	00020000-5668-4a9e-34ac-f42d0c8c8544
00010000-5668-4a9e-4cbd-80a272d59400	00020000-5668-4a9e-2877-bbe472c648d8
00010000-5668-4a9e-4cbd-80a272d59400	00020000-5668-4a9e-e4ed-ea82e2f3625f
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-813e-6a78be1da501
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-6fdf-ea39dc82f563
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-955b-cf12f17a3160
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-d10f-c5735dfb77aa
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-2877-bbe472c648d8
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-a371-cb49610ce26a
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-e4ed-ea82e2f3625f
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-471f-42d158777d66
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-65d7-72b524142517
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-edad-f1eccd38a1ab
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-3e14-88336c7620e3
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-fea4-f8d3fbdca7dc
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-0e22-0dcea83207e3
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-7c26-513d30242ef1
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-082d-633ff40d1d76
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-c5f2-7f6edb34e0f1
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-1110-8b432428a8e2
00010000-5668-4a9e-14bc-8c202c0ccb61	00020000-5668-4a9e-b87f-d98b915e1dc4
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-813e-6a78be1da501
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-6fdf-ea39dc82f563
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-9afd-a76b26f4c69f
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-955b-cf12f17a3160
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-d10f-c5735dfb77aa
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-2877-bbe472c648d8
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-a371-cb49610ce26a
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-e4ed-ea82e2f3625f
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-471f-42d158777d66
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-8846-d1c34bf761b7
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-65d7-72b524142517
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-edad-f1eccd38a1ab
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-1455-f0b191edbb3b
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-3e14-88336c7620e3
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-fea4-f8d3fbdca7dc
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-0e22-0dcea83207e3
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-7c26-513d30242ef1
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-082d-633ff40d1d76
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-c5f2-7f6edb34e0f1
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-1110-8b432428a8e2
00010000-5668-4a9e-3594-25d0e92aa0b3	00020000-5668-4a9e-b87f-d98b915e1dc4
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-813e-6a78be1da501
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-09b3-6d914b67df57
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-6fdf-ea39dc82f563
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-998a-8a316f5f9307
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-9afd-a76b26f4c69f
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-08b8-908b84d4d540
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-955b-cf12f17a3160
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-d10f-c5735dfb77aa
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-2877-bbe472c648d8
00010000-5668-4a9e-325d-440966dede30	00020000-5668-4a9e-a371-cb49610ce26a
00010000-5668-4a9e-81d8-4f8a56aaf7c3	00020000-5668-4a9e-6b43-f1148454b344
00010000-5668-4a9e-81d8-4f8a56aaf7c3	00020000-5668-4a9e-34ac-f42d0c8c8544
00010000-5668-4a9e-81d8-4f8a56aaf7c3	00020000-5668-4a9e-08b8-908b84d4d540
00010000-5668-4a9e-81d8-4f8a56aaf7c3	00020000-5668-4a9e-e810-cc7a4286343f
00010000-5668-4a9e-81d8-4f8a56aaf7c3	00020000-5668-4a9e-2877-bbe472c648d8
00010000-5668-4a9e-81d8-4f8a56aaf7c3	00020000-5668-4a9e-e4ed-ea82e2f3625f
00010000-5668-4a9e-81d8-4f8a56aaf7c3	00020000-5668-4a9e-677a-f3af90a46fd5
00010000-5668-4a9e-81d8-4f8a56aaf7c3	00020000-5668-4a9e-249a-cebc384655b9
00010000-5668-4a9e-fa9a-c65b3e73e90d	00020000-5668-4a9e-7aa4-7fec2e88859c
\.


--
-- TOC entry 3146 (class 0 OID 31802048)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 31801986)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 31801932)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5668-4a9e-71af-00e19052eb96	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5668-4a9e-6690-1085bd44bcb0	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5668-4a9e-f026-57a31a0c166d	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 31801555)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5668-4a9b-b164-3947977e6307	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5668-4a9b-11ca-565b4cf49b96	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5668-4a9b-132f-343f97e6b0d4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5668-4a9b-9284-3a168ceb6156	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5668-4a9b-8bc4-95d3a7f85f1b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 31801547)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5668-4a9b-0cc6-0bf280d120c3	00230000-5668-4a9b-9284-3a168ceb6156	popa
00240000-5668-4a9b-ab43-316d27793405	00230000-5668-4a9b-9284-3a168ceb6156	oseba
00240000-5668-4a9b-3a16-056407d7326c	00230000-5668-4a9b-9284-3a168ceb6156	tippopa
00240000-5668-4a9b-041e-7cbc20f79054	00230000-5668-4a9b-9284-3a168ceb6156	organizacijskaenota
00240000-5668-4a9b-5d71-793d9735023c	00230000-5668-4a9b-9284-3a168ceb6156	sezona
00240000-5668-4a9b-ea8f-9146f99a2967	00230000-5668-4a9b-9284-3a168ceb6156	tipvaje
00240000-5668-4a9b-4532-bf1867a0a2c8	00230000-5668-4a9b-11ca-565b4cf49b96	prostor
00240000-5668-4a9b-0691-8068420f3ec0	00230000-5668-4a9b-9284-3a168ceb6156	besedilo
00240000-5668-4a9b-1281-474087ab21ef	00230000-5668-4a9b-9284-3a168ceb6156	uprizoritev
00240000-5668-4a9b-fb59-3fd365677d79	00230000-5668-4a9b-9284-3a168ceb6156	funkcija
00240000-5668-4a9b-beb4-b51ec75d4bc6	00230000-5668-4a9b-9284-3a168ceb6156	tipfunkcije
00240000-5668-4a9b-9d37-97de149ec075	00230000-5668-4a9b-9284-3a168ceb6156	alternacija
00240000-5668-4a9b-37b6-e7ad7686acef	00230000-5668-4a9b-b164-3947977e6307	pogodba
00240000-5668-4a9b-e5d0-b9247e05eb90	00230000-5668-4a9b-9284-3a168ceb6156	zaposlitev
00240000-5668-4a9b-c82d-240d0544a7a9	00230000-5668-4a9b-9284-3a168ceb6156	zvrstuprizoritve
00240000-5668-4a9b-1420-933c04f72171	00230000-5668-4a9b-b164-3947977e6307	programdela
00240000-5668-4a9b-d91f-cd0349ddafce	00230000-5668-4a9b-9284-3a168ceb6156	zapis
\.


--
-- TOC entry 3095 (class 0 OID 31801542)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
8bea55e8-98a9-4816-878d-c2f6985f48cb	00240000-5668-4a9b-0cc6-0bf280d120c3	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 31802113)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5668-4a9e-d31b-2bb94e75f77c	000e0000-5668-4a9e-a19c-03aa05acc87e	00080000-5668-4a9e-5d61-902efbc0fbbb	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5668-4a9c-6028-52ad6b6a00f9
00270000-5668-4a9e-30f5-a38fe4db53f1	000e0000-5668-4a9e-a19c-03aa05acc87e	00080000-5668-4a9e-5d61-902efbc0fbbb	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5668-4a9c-6028-52ad6b6a00f9
\.


--
-- TOC entry 3111 (class 0 OID 31801690)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 31801942)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5668-4a9f-28df-717ae7fc890e	00180000-5668-4a9e-2d48-3aa6e38e4fee	000c0000-5668-4a9e-63be-65d7894f2cbd	00090000-5668-4a9e-ef18-e2d491b8bef0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5668-4a9f-28e0-de3720312f08	00180000-5668-4a9e-2d48-3aa6e38e4fee	000c0000-5668-4a9e-9d98-90c9b6ed2ff6	00090000-5668-4a9e-6782-19cfd6e977e3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5668-4a9f-e374-0b7541726c59	00180000-5668-4a9e-2d48-3aa6e38e4fee	000c0000-5668-4a9e-ec03-246b7cd22d10	00090000-5668-4a9e-7b4f-60ef2b2776cc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5668-4a9f-c260-5e1ebdd14157	00180000-5668-4a9e-2d48-3aa6e38e4fee	000c0000-5668-4a9e-271b-8dc2356ba8e0	00090000-5668-4a9e-30a3-48e7a3afec30	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5668-4a9f-db1b-616b0e68f78b	00180000-5668-4a9e-2d48-3aa6e38e4fee	000c0000-5668-4a9e-7d47-c6ad7c52a07d	00090000-5668-4a9e-c729-57c6d9c5c145	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5668-4a9f-ae6a-6662d92e3c87	00180000-5668-4a9e-adfe-c376a7d975f6	\N	00090000-5668-4a9e-c729-57c6d9c5c145	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5668-4a9f-f9f4-b42d728663a0	00180000-5668-4a9e-adfe-c376a7d975f6	\N	00090000-5668-4a9e-6782-19cfd6e977e3	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 31802154)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5668-4a9b-c5a3-7d49d50b24a4	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5668-4a9b-5546-c0bebf3c3510	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5668-4a9b-8852-f1033a528a35	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5668-4a9b-35ca-295029618722	04	Režija	Režija	Režija	umetnik	30
000f0000-5668-4a9b-a32a-668d73a5a267	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5668-4a9b-9de0-25785266fb68	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5668-4a9b-ea5a-f532a575d3e3	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5668-4a9b-2bba-0c3db355077f	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5668-4a9b-a364-5c15ae0b0b50	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5668-4a9b-7931-cfdbfce71a43	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5668-4a9b-3986-d7a7825df1f7	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5668-4a9b-92e6-4507126ccd9d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5668-4a9b-a075-a971781fecb0	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5668-4a9b-ba52-e59ffb41214d	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5668-4a9b-d569-d1a74fbe133c	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5668-4a9b-ad84-ae648c5e7409	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5668-4a9b-b75e-f052bde26bfc	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5668-4a9b-4b6d-5424be65f967	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 31801641)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5668-4a9e-69e7-3c7a070abdf3	0001	šola	osnovna ali srednja šola
00400000-5668-4a9e-3d86-64876e84894d	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5668-4a9e-3949-791aeb0ea339	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 31802449)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5668-4a9b-4755-8ba9ec2ccd9b	01	Velika predstava	f	1.00	1.00
002b0000-5668-4a9b-a0c8-c3ea7613a3fd	02	Mala predstava	f	0.50	0.50
002b0000-5668-4a9b-0917-141b28ce6996	03	Mala koprodukcija	t	0.40	1.00
002b0000-5668-4a9b-f5f1-f41810ff2325	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5668-4a9b-67ae-823eae3a3192	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 31801922)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5668-4a9b-9022-2d9144f01f09	0001	prva vaja	prva vaja
00420000-5668-4a9b-144b-7fa0422e59aa	0002	tehnična vaja	tehnična vaja
00420000-5668-4a9b-c818-09ec63c2bb03	0003	lučna vaja	lučna vaja
00420000-5668-4a9b-a978-53bbceb6ee7e	0004	kostumska vaja	kostumska vaja
00420000-5668-4a9b-f442-f24d645969a5	0005	foto vaja	foto vaja
00420000-5668-4a9b-10d5-d051326ea089	0006	1. glavna vaja	1. glavna vaja
00420000-5668-4a9b-4172-e5b5aff68dbf	0007	2. glavna vaja	2. glavna vaja
00420000-5668-4a9b-7abd-1b4473638ea4	0008	1. generalka	1. generalka
00420000-5668-4a9b-b6c9-79c18a75da61	0009	2. generalka	2. generalka
00420000-5668-4a9b-6f42-f7e323ba415f	0010	odprta generalka	odprta generalka
00420000-5668-4a9b-42ec-6e66b159cf70	0011	obnovitvena vaja	obnovitvena vaja
00420000-5668-4a9b-ae20-dbbbcb503173	0012	italijanka	krajša "obnovitvena" vaja
00420000-5668-4a9b-d75a-4f225761ade5	0013	pevska vaja	pevska vaja
00420000-5668-4a9b-eeb2-7a1ed19eac14	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5668-4a9b-3084-bf7fac3b86f9	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 31801763)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 31801577)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5668-4a9c-be3e-7906b12543ad	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROb69odLgI7kDBaPEFv5NDKmrx7SskK2C	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-9bb4-9638876c9bee	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-e832-761cd4f0d451	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-2aac-87d36a1ae40c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-6deb-e6a5b574fe8f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-5c9f-48225cc86c46	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-c273-e31f54544ebc	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-2f16-e6b153ca6924	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-a6b1-de097454bdca	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-07bf-f431b725ac56	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-a0ff-5057f4870b3d	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-1a68-d367d389ecb1	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-8f59-52372304baaf	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-f9c2-10fe8574e89d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-4cbd-80a272d59400	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-14bc-8c202c0ccb61	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-3594-25d0e92aa0b3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-325d-440966dede30	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-81d8-4f8a56aaf7c3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5668-4a9e-fa9a-c65b3e73e90d	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5668-4a9c-f863-f1f71256aeef	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 31802204)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5668-4a9e-6628-616c2c9a5e2c	00160000-5668-4a9e-813e-4c1d7ac85cf4	\N	00140000-5668-4a9b-b91f-41dea3387231	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5668-4a9e-bc9c-5c8d1336cdd8
000e0000-5668-4a9e-a19c-03aa05acc87e	00160000-5668-4a9e-3c57-16c85cb20a75	\N	00140000-5668-4a9b-f695-482835f0f469	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5668-4a9e-629c-98c4efdadc8f
000e0000-5668-4a9e-3ba9-27f978a0fbf3	\N	\N	00140000-5668-4a9b-f695-482835f0f469	00190000-5668-4a9e-414c-9bd1c79cfab4	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5668-4a9e-bc9c-5c8d1336cdd8
000e0000-5668-4a9e-2113-5f68dfb68f85	\N	\N	00140000-5668-4a9b-f695-482835f0f469	00190000-5668-4a9e-414c-9bd1c79cfab4	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5668-4a9e-bc9c-5c8d1336cdd8
000e0000-5668-4a9e-e072-f90d02432db4	\N	\N	00140000-5668-4a9b-f695-482835f0f469	00190000-5668-4a9e-414c-9bd1c79cfab4	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5668-4a9e-a85c-7b7cd015ac42
000e0000-5668-4a9e-eb9d-5c8512b7f00a	\N	\N	00140000-5668-4a9b-f695-482835f0f469	00190000-5668-4a9e-414c-9bd1c79cfab4	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5668-4a9e-a85c-7b7cd015ac42
\.


--
-- TOC entry 3125 (class 0 OID 31801862)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5668-4a9e-b2f7-d7ef501cff73	\N	000e0000-5668-4a9e-a19c-03aa05acc87e	1	
00200000-5668-4a9e-1935-3baca88f0321	\N	000e0000-5668-4a9e-a19c-03aa05acc87e	2	
00200000-5668-4a9e-7e11-3e35fe2714df	\N	000e0000-5668-4a9e-a19c-03aa05acc87e	3	
00200000-5668-4a9e-692e-dc4cf2d8e173	\N	000e0000-5668-4a9e-a19c-03aa05acc87e	4	
00200000-5668-4a9e-d2fa-5c0290fe3885	\N	000e0000-5668-4a9e-a19c-03aa05acc87e	5	
\.


--
-- TOC entry 3142 (class 0 OID 31802013)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 31802127)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5668-4a9c-29ad-1f58e1b1dc40	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5668-4a9c-1443-484e0333e7e4	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5668-4a9c-5b88-4cf231967445	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5668-4a9c-bcfd-b786bc05fd6b	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5668-4a9c-c362-89abd0079250	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5668-4a9c-bcad-3dbdaaa78892	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5668-4a9c-2a1b-1664aca5b0fc	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5668-4a9c-269c-b9fa4877c2f7	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5668-4a9c-6028-52ad6b6a00f9	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5668-4a9c-6feb-26baae97b14e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5668-4a9c-7b88-94a7c16356de	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5668-4a9c-af28-daaca1fe544b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5668-4a9c-4636-d064a6eedd07	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5668-4a9c-83a6-4688c2e1dd35	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5668-4a9c-e17d-98663d48d8bd	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5668-4a9c-863a-478f793400d4	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5668-4a9c-ad36-85e6327377d1	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5668-4a9c-3465-7d83cce338f3	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5668-4a9c-66ed-1764a176d76b	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5668-4a9c-99d7-1648f4464efb	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5668-4a9c-a1cb-3a948d05437c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5668-4a9c-b88a-1bce5682d6cf	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5668-4a9c-e442-e4d46f03051c	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5668-4a9c-beac-4df1f16d96e5	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5668-4a9c-9807-8aa5e910cba3	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5668-4a9c-a541-4f3365274203	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5668-4a9c-2197-6b3edc8e6669	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5668-4a9c-5a90-f9d7fcca0064	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 31802499)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 31802468)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 31802511)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 31802085)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5668-4a9e-afc7-342a3a0b3ed9	00090000-5668-4a9e-6782-19cfd6e977e3	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5668-4a9e-5301-75e683150c4f	00090000-5668-4a9e-7b4f-60ef2b2776cc	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5668-4a9e-263d-a36a2840c071	00090000-5668-4a9e-6d8b-fea5903dfafb	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5668-4a9e-663f-cd5372afcf1d	00090000-5668-4a9e-2e97-de48031dca13	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5668-4a9e-b199-72df2d9d956e	00090000-5668-4a9e-3c03-ade2e52616f4	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5668-4a9e-fc7d-6078a69cfe60	00090000-5668-4a9e-a8d6-e6c2b4e55716	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 31801906)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 31802194)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5668-4a9b-b91f-41dea3387231	01	Drama	drama (SURS 01)
00140000-5668-4a9b-f72b-65b4c937fce8	02	Opera	opera (SURS 02)
00140000-5668-4a9b-0be1-a4e3f23d6842	03	Balet	balet (SURS 03)
00140000-5668-4a9b-3f8c-c53b5f26c009	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5668-4a9b-1588-b6527591b89c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5668-4a9b-f695-482835f0f469	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5668-4a9b-05c8-65c1e4134889	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 31802075)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 31801640)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 31802253)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 31802243)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 31801631)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 31802110)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 31802152)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 31802552)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 31801894)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 31801916)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 31801921)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 31802466)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 31801789)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 31802322)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 31802071)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 31801860)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 31801827)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 31801803)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 31801978)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 31802529)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 31802536)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 31802560)
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
-- TOC entry 2728 (class 2606 OID 31802005)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 31801761)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 31801659)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 31801723)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 31801686)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 31801620)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 31801605)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 31802011)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 31802047)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 31802189)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 31801714)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 31801749)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 31802417)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 31801984)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 31801739)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 31801879)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 31801848)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 31801840)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 31801996)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 31802426)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 31802434)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 31802404)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 31802447)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 31802029)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 31801969)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 31801960)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 31802176)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 31802103)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 31801815)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 31801576)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 31802038)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 31801594)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 31801614)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 31802056)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 31801991)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 31801940)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 31801564)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 31801552)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 31801546)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 31802123)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 31801695)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 31801951)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 31802163)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 31801648)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 31802459)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 31801929)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 31801774)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 31801589)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 31802222)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 31801869)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 31802019)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 31802135)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 31802509)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 31802493)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 31802517)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 31802093)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 31801910)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 31802202)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 31802083)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 31801904)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 31801905)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 31801903)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 31801902)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 31801901)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 31802124)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 31802125)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 31802126)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 31802531)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 31802530)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 31801716)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 31801717)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 31802012)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 31802497)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 31802496)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 31802498)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 31802495)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 31802494)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 31801998)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 31801997)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 31801870)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 31801871)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 31802072)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 31802074)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 31802073)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 31801805)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 31801804)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 31802448)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 31802191)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 31802192)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 31802193)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 31802518)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 31802227)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 31802224)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 31802228)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 31802226)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 31802225)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 31801776)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 31801775)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 31801689)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 31802039)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 31801621)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 31801622)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 31802059)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 31802058)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 31802057)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 31801726)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 31801725)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 31801727)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 31801843)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 31801841)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 31801842)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 31801554)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 31801964)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 31801962)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 31801961)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 31801963)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 31801595)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 31801596)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 31802020)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 31802553)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 31802112)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 31802111)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 31802561)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 31802562)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 31801985)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 31802104)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 31802105)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 31802327)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 31802326)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 31802323)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 31802324)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 31802325)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 31801741)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 31801740)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 31801742)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 31802033)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 31802032)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 31802427)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 31802428)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 31802257)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 31802258)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 31802255)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 31802256)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 31802094)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 31802095)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 31801973)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 31801972)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 31801970)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 31801971)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 31802245)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 31802244)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 31801816)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 31801830)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 31801829)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 31801828)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 31801831)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 31801861)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 31801849)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 31801850)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 31802418)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 31802467)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 31802537)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 31802538)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 31801661)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 31801660)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 31801696)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 31801697)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 31801911)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 31801954)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 31801953)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 31801952)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 31801896)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 31801897)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 31801900)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 31801895)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 31801899)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 31801898)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 31801715)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 31801649)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 31801650)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 31801790)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 31801792)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 31801791)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 31801793)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 31801979)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 31802190)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 31802223)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 31802164)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 31802165)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 31801687)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 31801688)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 31802084)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 31801565)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 31801762)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 31801724)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 31801553)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 31802460)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 31802031)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 31802030)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 31801930)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 31801931)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 31802254)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 31801750)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 31802203)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 31802510)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 31802435)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 31802436)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 31802153)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 31801941)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 31801615)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2911 (class 2606 OID 31802733)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2910 (class 2606 OID 31802738)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2905 (class 2606 OID 31802763)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2907 (class 2606 OID 31802753)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2912 (class 2606 OID 31802728)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2908 (class 2606 OID 31802748)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2906 (class 2606 OID 31802758)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2909 (class 2606 OID 31802743)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2948 (class 2606 OID 31802933)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 31802938)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 31802943)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 31803108)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2981 (class 2606 OID 31803103)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 31802618)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2883 (class 2606 OID 31802623)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 31802848)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 31803088)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 31803083)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 31803093)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2977 (class 2606 OID 31803078)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2978 (class 2606 OID 31803073)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2927 (class 2606 OID 31802843)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2928 (class 2606 OID 31802838)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2904 (class 2606 OID 31802718)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2903 (class 2606 OID 31802723)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 31802888)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 31802898)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 31802893)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2893 (class 2606 OID 31802673)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 31802668)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 31802828)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 31803063)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2951 (class 2606 OID 31802948)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 31802953)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 31802958)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 31803098)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 31802978)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2956 (class 2606 OID 31802963)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2952 (class 2606 OID 31802983)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 31802973)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2955 (class 2606 OID 31802968)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2891 (class 2606 OID 31802663)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 31802658)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2879 (class 2606 OID 31802603)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2880 (class 2606 OID 31802598)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 31802868)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2876 (class 2606 OID 31802578)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2875 (class 2606 OID 31802583)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 31802883)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 31802878)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2936 (class 2606 OID 31802873)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 31802633)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2887 (class 2606 OID 31802628)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 31802638)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 31802698)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 31802688)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 31802693)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 31802563)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2917 (class 2606 OID 31802803)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2919 (class 2606 OID 31802793)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2920 (class 2606 OID 31802788)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2918 (class 2606 OID 31802798)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 31802568)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2873 (class 2606 OID 31802573)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 31802853)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 31803123)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 31802928)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2945 (class 2606 OID 31802923)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2986 (class 2606 OID 31803128)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 31803133)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 31802833)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2943 (class 2606 OID 31802913)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2942 (class 2606 OID 31802918)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 31803038)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 31803033)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 31803018)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 31803023)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 31803028)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 31802648)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 31802643)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 31802653)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2931 (class 2606 OID 31802863)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2932 (class 2606 OID 31802858)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 31803048)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2969 (class 2606 OID 31803053)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2960 (class 2606 OID 31803008)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2959 (class 2606 OID 31803013)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2962 (class 2606 OID 31802998)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2961 (class 2606 OID 31803003)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2941 (class 2606 OID 31802903)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 31802908)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2921 (class 2606 OID 31802823)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2922 (class 2606 OID 31802818)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 31802808)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2923 (class 2606 OID 31802813)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2957 (class 2606 OID 31802993)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 31802988)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 31802678)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 31802683)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 31802713)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2901 (class 2606 OID 31802703)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2900 (class 2606 OID 31802708)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 31803043)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 31803058)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 31803068)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2983 (class 2606 OID 31803113)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 31803118)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2877 (class 2606 OID 31802593)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 31802588)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2882 (class 2606 OID 31802608)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2881 (class 2606 OID 31802613)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 31802768)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 31802783)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 31802778)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2916 (class 2606 OID 31802773)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-09 16:37:06 CET

--
-- PostgreSQL database dump complete
--

