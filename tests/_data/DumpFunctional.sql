--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-03 10:29:10 CET

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
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 25113405)
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
-- TOC entry 237 (class 1259 OID 25114019)
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
-- TOC entry 236 (class 1259 OID 25114002)
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
-- TOC entry 182 (class 1259 OID 25113398)
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
-- TOC entry 181 (class 1259 OID 25113396)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 25113879)
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
-- TOC entry 230 (class 1259 OID 25113909)
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
-- TOC entry 251 (class 1259 OID 25114306)
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
-- TOC entry 203 (class 1259 OID 25113653)
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
-- TOC entry 205 (class 1259 OID 25113685)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25113690)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 25114232)
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
-- TOC entry 194 (class 1259 OID 25113550)
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
-- TOC entry 238 (class 1259 OID 25114032)
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
-- TOC entry 223 (class 1259 OID 25113833)
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
-- TOC entry 200 (class 1259 OID 25113624)
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
-- TOC entry 197 (class 1259 OID 25113590)
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
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 25113567)
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
-- TOC entry 212 (class 1259 OID 25113747)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 25114287)
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
-- TOC entry 250 (class 1259 OID 25114299)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25114321)
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
-- TOC entry 170 (class 1259 OID 24507014)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 25113772)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 25113524)
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
-- TOC entry 185 (class 1259 OID 25113424)
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
-- TOC entry 189 (class 1259 OID 25113491)
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
-- TOC entry 186 (class 1259 OID 25113435)
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
-- TOC entry 178 (class 1259 OID 25113370)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 25113389)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 25113779)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 25113813)
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
-- TOC entry 233 (class 1259 OID 25113950)
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
-- TOC entry 188 (class 1259 OID 25113471)
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
-- TOC entry 191 (class 1259 OID 25113516)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 25114177)
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
-- TOC entry 213 (class 1259 OID 25113753)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 25113501)
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
-- TOC entry 202 (class 1259 OID 25113645)
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
-- TOC entry 198 (class 1259 OID 25113605)
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
-- TOC entry 199 (class 1259 OID 25113617)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25113765)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 25114191)
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
-- TOC entry 242 (class 1259 OID 25114201)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 25114100)
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
-- TOC entry 243 (class 1259 OID 25114209)
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
-- TOC entry 219 (class 1259 OID 25113794)
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
-- TOC entry 211 (class 1259 OID 25113738)
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
-- TOC entry 210 (class 1259 OID 25113728)
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
-- TOC entry 232 (class 1259 OID 25113939)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 25113869)
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
-- TOC entry 196 (class 1259 OID 25113579)
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
-- TOC entry 175 (class 1259 OID 25113341)
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
-- TOC entry 174 (class 1259 OID 25113339)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 25113807)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 25113379)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 25113363)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25113821)
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
-- TOC entry 214 (class 1259 OID 25113759)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 25113705)
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
-- TOC entry 173 (class 1259 OID 25113328)
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
-- TOC entry 172 (class 1259 OID 25113320)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 25113315)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 25113886)
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
-- TOC entry 187 (class 1259 OID 25113463)
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
-- TOC entry 209 (class 1259 OID 25113715)
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
-- TOC entry 231 (class 1259 OID 25113927)
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
-- TOC entry 184 (class 1259 OID 25113414)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 25114220)
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
-- TOC entry 207 (class 1259 OID 25113695)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 25113536)
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
-- TOC entry 176 (class 1259 OID 25113350)
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
-- TOC entry 235 (class 1259 OID 25113977)
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
-- TOC entry 201 (class 1259 OID 25113635)
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
-- TOC entry 218 (class 1259 OID 25113786)
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
-- TOC entry 229 (class 1259 OID 25113900)
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
-- TOC entry 247 (class 1259 OID 25114267)
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
-- TOC entry 246 (class 1259 OID 25114239)
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
    relation character varying(255) DEFAULT NULL::character varying,
    rights character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 248 (class 1259 OID 25114279)
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
-- TOC entry 225 (class 1259 OID 25113858)
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
-- TOC entry 204 (class 1259 OID 25113679)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 25113967)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 25113848)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 25113401)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 25113344)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 25113405)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5638-7e63-e1b4-cb9f3a92645b	10	30	Otroci	Abonma za otroke	200
000a0000-5638-7e63-ef3c-c07e94081c61	20	60	Mladina	Abonma za mladino	400
000a0000-5638-7e63-61a8-f6c7e330ce04	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3155 (class 0 OID 25114019)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5638-7e63-2b1c-8fb80697bab0	000d0000-5638-7e63-6c97-07c550272cda	\N	00090000-5638-7e63-9355-121b08f0f8cf	000b0000-5638-7e63-d6a3-3a8b0d8e710a	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5638-7e63-1e38-cf56d5990e3a	000d0000-5638-7e63-f303-58eff799f72e	00100000-5638-7e63-f83a-5b6858a97a4a	00090000-5638-7e63-3a48-0f2955a23882	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5638-7e63-410a-9bf3835acc65	000d0000-5638-7e63-0740-60bf0bc5b900	00100000-5638-7e63-07de-f7cee5af022a	00090000-5638-7e63-5346-163c6708fe64	\N	0003	t	\N	2015-11-03	\N	2	t	\N	f	f
000c0000-5638-7e63-f757-3919bc2c4227	000d0000-5638-7e63-59e0-138b03e00a36	\N	00090000-5638-7e63-fee8-d49d1ed07345	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5638-7e63-0f1f-50b8c01db169	000d0000-5638-7e63-f690-5c5449c2c648	\N	00090000-5638-7e63-28d8-d65ae8650e4a	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5638-7e63-238d-c72debd8d6c6	000d0000-5638-7e63-f6ff-f7c8f031d34e	\N	00090000-5638-7e63-1326-0ba3eccf7e70	000b0000-5638-7e63-667f-00d7d3d309ba	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5638-7e63-1bbd-a4e6776df515	000d0000-5638-7e63-2493-d2007153d2e3	00100000-5638-7e63-f279-e7e3f36ce779	00090000-5638-7e63-f940-aa840c997405	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5638-7e63-4994-a9b3b45a4147	000d0000-5638-7e63-04c1-ea8ef803d76c	\N	00090000-5638-7e63-9dee-bbf77aa61b23	000b0000-5638-7e63-13f3-10fe1b54ab22	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5638-7e63-f9ee-e3302ac13b90	000d0000-5638-7e63-2493-d2007153d2e3	00100000-5638-7e63-1d3d-3edddcebeac4	00090000-5638-7e63-f3b6-92293ca8ed6e	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5638-7e63-7826-ab5ed3d61bf1	000d0000-5638-7e63-2493-d2007153d2e3	00100000-5638-7e63-1cd4-189e3ccb3018	00090000-5638-7e63-6482-8cd7dbfeae62	\N	0010	t	\N	2015-11-03	\N	16	f	\N	f	t
000c0000-5638-7e63-9550-91b7d9210787	000d0000-5638-7e63-2493-d2007153d2e3	00100000-5638-7e63-7313-a8a5888e8738	00090000-5638-7e63-35aa-4abe2ce0f03f	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5638-7e63-b20a-e4f00df0c612	000d0000-5638-7e63-76c8-aad803915fe2	00100000-5638-7e63-f83a-5b6858a97a4a	00090000-5638-7e63-3a48-0f2955a23882	000b0000-5638-7e63-d670-4627348cb378	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3154 (class 0 OID 25114002)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 25113398)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3145 (class 0 OID 25113879)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5638-7e63-29f4-3211ebdbee39	00160000-5638-7e63-cfde-7af1fccab39b	00090000-5638-7e63-95a2-43868273c30e	aizv	10	t
003d0000-5638-7e63-ed0e-0c88095da063	00160000-5638-7e63-cfde-7af1fccab39b	00090000-5638-7e63-3327-2cae24eadeee	apri	14	t
003d0000-5638-7e63-b2b2-0bbd8e10bc85	00160000-5638-7e63-3e33-4382aae8d3f7	00090000-5638-7e63-e201-a3f7b4acda0f	aizv	11	t
003d0000-5638-7e63-dac7-6c52a4d05ad5	00160000-5638-7e63-82e1-9594f6edf8d5	00090000-5638-7e63-1e2a-73f0fbf92829	aizv	12	t
003d0000-5638-7e63-850f-316de2d49c13	00160000-5638-7e63-cfde-7af1fccab39b	00090000-5638-7e63-cd02-9d3b0caa990c	apri	18	f
\.


--
-- TOC entry 3148 (class 0 OID 25113909)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5638-7e63-cfde-7af1fccab39b	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5638-7e63-3e33-4382aae8d3f7	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5638-7e63-82e1-9594f6edf8d5	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3169 (class 0 OID 25114306)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 25113653)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5638-7e63-c16d-b232a611789f	\N	\N	00200000-5638-7e63-2ff4-b191d77c5e85	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5638-7e63-be5a-ebcb8374260c	\N	\N	00200000-5638-7e63-b700-1dc9896e1337	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5638-7e63-64ba-58b604fdf6f1	\N	\N	00200000-5638-7e63-b4a0-fc6186f7367c	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5638-7e63-1056-b4a71d033fe9	\N	\N	00200000-5638-7e63-1cef-be43af3a79a5	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5638-7e63-1be6-320d57631cb0	\N	\N	00200000-5638-7e63-7c9d-1799b8863478	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3123 (class 0 OID 25113685)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 25113690)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 25114232)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 25113550)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5638-7e60-65ad-4c6e3ab1465b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5638-7e60-5f07-23fbcc58bd27	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5638-7e60-738b-0350167c0644	AL	ALB	008	Albania 	Albanija	\N
00040000-5638-7e60-b5ca-b461dc3b89bb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5638-7e60-da91-6e1df9234349	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5638-7e60-437b-24a6b55ba8e5	AD	AND	020	Andorra 	Andora	\N
00040000-5638-7e60-4067-7abc55de0506	AO	AGO	024	Angola 	Angola	\N
00040000-5638-7e60-6317-c53e68a2ef87	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5638-7e60-fed0-7239fb11f9c8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5638-7e60-854e-458ed8d71c44	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5638-7e60-ade0-7eaaa8632b4e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5638-7e60-4ffc-5d41a12d52c5	AM	ARM	051	Armenia 	Armenija	\N
00040000-5638-7e60-cb9c-1f494e5dca6e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5638-7e60-7731-fabb4e2a3d50	AU	AUS	036	Australia 	Avstralija	\N
00040000-5638-7e60-e6e1-4b3649955ca2	AT	AUT	040	Austria 	Avstrija	\N
00040000-5638-7e60-0837-9bebf3abfceb	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5638-7e60-ea73-2692942d11ab	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5638-7e60-479e-0acfd85e43c7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5638-7e60-cde3-85db8fc771f7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5638-7e60-dd0d-55dace660370	BB	BRB	052	Barbados 	Barbados	\N
00040000-5638-7e60-5abc-c07dabcafba8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5638-7e60-5535-d70d4b505e6f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5638-7e60-7483-877a26dbd694	BZ	BLZ	084	Belize 	Belize	\N
00040000-5638-7e60-9013-df865306e07b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5638-7e60-42df-f61b1e4ab907	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5638-7e60-3be5-3c89d256fbca	BT	BTN	064	Bhutan 	Butan	\N
00040000-5638-7e60-991e-b614cba6cff0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5638-7e60-c1e5-ff7f9f448845	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5638-7e60-ebd9-3e7fc896e390	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5638-7e60-1777-2b0fb6a594ac	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5638-7e60-e142-c2d07e9e26ef	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5638-7e60-6dce-af28f34c5e7f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5638-7e60-e0c1-566242d57070	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5638-7e60-9fe4-352be1c66c5e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5638-7e60-554b-70b11ee32a2a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5638-7e60-d389-46193a5529ce	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5638-7e60-7069-2742641bec1e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5638-7e60-6a15-fa618464ee49	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5638-7e60-c58e-c64cbf2d516c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5638-7e60-8c8e-b4908c490856	CA	CAN	124	Canada 	Kanada	\N
00040000-5638-7e60-7cc0-40c673bbff05	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5638-7e60-208c-ea45bac6b4b5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5638-7e60-f0ca-fd3250b7a63e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5638-7e60-1fcc-c2b80fba3fa3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5638-7e60-a875-20655bea35fd	CL	CHL	152	Chile 	Čile	\N
00040000-5638-7e60-b7bc-2c6019e39550	CN	CHN	156	China 	Kitajska	\N
00040000-5638-7e60-de36-f63c2d184c40	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5638-7e60-6212-e712dc42fb29	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5638-7e60-ecd8-62fd9b75a8ce	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5638-7e60-ba76-f9b53197c9fc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5638-7e60-c35e-440f402d47cb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5638-7e60-47fd-0df1faa82605	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5638-7e60-19f3-554bb575c952	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5638-7e60-476a-9003273c689d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5638-7e60-d76f-111751c99b66	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5638-7e60-aebd-11a6e7193edb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5638-7e60-fdd0-65a6ac43c6f0	CU	CUB	192	Cuba 	Kuba	\N
00040000-5638-7e60-051c-90c92e592376	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5638-7e60-354f-7957f66fbf94	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5638-7e60-25d3-786c8656f0fb	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5638-7e60-5009-0faa0ba37af2	DK	DNK	208	Denmark 	Danska	\N
00040000-5638-7e60-f578-0530b1aa3c67	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5638-7e60-ab9f-4594fb33a65f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5638-7e60-1802-e0562850d06e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5638-7e60-28bc-c667dcd00289	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5638-7e60-f7e3-6f1eb0a576e8	EG	EGY	818	Egypt 	Egipt	\N
00040000-5638-7e60-5acf-d5f7c82975f6	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5638-7e60-7575-bd9e82bad529	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5638-7e60-ead4-bafa0a13ff68	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5638-7e60-e319-c360115c23c9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5638-7e60-bc64-2573996d5f81	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5638-7e60-2806-0e3910a8546c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5638-7e60-7cab-bb8d36e44aa2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5638-7e60-d041-b82593e27524	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5638-7e60-079b-fedfc543653f	FI	FIN	246	Finland 	Finska	\N
00040000-5638-7e60-1f48-58a6d2e3d2c9	FR	FRA	250	France 	Francija	\N
00040000-5638-7e60-267a-7b47994d4a68	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5638-7e61-f543-c4f64ba4d913	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5638-7e60-0148-2ee6f2d80eb6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5638-7e60-fa2c-da2a29750a53	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5638-7e60-bb0b-7bd574803084	GA	GAB	266	Gabon 	Gabon	\N
00040000-5638-7e60-5e5c-481fe526909d	GM	GMB	270	Gambia 	Gambija	\N
00040000-5638-7e60-4e25-d5667e208dc1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5638-7e60-29b6-74cb122c1fad	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5638-7e60-b034-09afe219c169	GH	GHA	288	Ghana 	Gana	\N
00040000-5638-7e60-2fc0-4292490f4bc0	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5638-7e60-a8a7-a132831859a0	GR	GRC	300	Greece 	Grčija	\N
00040000-5638-7e60-5258-402cd08066e0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5638-7e60-2f14-f3e16c50a91b	GD	GRD	308	Grenada 	Grenada	\N
00040000-5638-7e60-838d-c9c47aecf7cd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5638-7e60-aff5-90fd4059c169	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5638-7e60-17a8-662596e0d604	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5638-7e60-7bbb-8d852679cfcc	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5638-7e60-3ec2-d9d7da2e5c38	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5638-7e60-ce95-cea127f196b5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5638-7e60-cae4-cf149bb29f90	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5638-7e60-a9fe-99d45458f55e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5638-7e60-c3f7-5b2173ca48a6	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5638-7e60-d71a-ff0ef4489d95	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5638-7e60-a9c6-98a39f6e0f3b	HN	HND	340	Honduras 	Honduras	\N
00040000-5638-7e60-632d-3f2ff604d77d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5638-7e60-a957-716bc6be890c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5638-7e60-5d64-ba3a71d98cfd	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5638-7e60-957d-1a73b029e695	IN	IND	356	India 	Indija	\N
00040000-5638-7e60-8bfd-3350ce30ca68	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5638-7e60-c2d9-2f83ed7298a2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5638-7e60-1949-3870af9f5816	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5638-7e60-0ecf-15238de1a0c9	IE	IRL	372	Ireland 	Irska	\N
00040000-5638-7e60-84c9-fe6089b48d10	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5638-7e60-3007-a368e776c81b	IL	ISR	376	Israel 	Izrael	\N
00040000-5638-7e60-4df7-21d7486c1f32	IT	ITA	380	Italy 	Italija	\N
00040000-5638-7e60-802e-7b58ccf13ea1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5638-7e60-c5c7-05bd01ceff2e	JP	JPN	392	Japan 	Japonska	\N
00040000-5638-7e60-4c8c-d83c5f5ab993	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5638-7e60-f2b0-75a055cf3e90	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5638-7e60-f399-af10eea8b97b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5638-7e60-d29e-67fed8fc4642	KE	KEN	404	Kenya 	Kenija	\N
00040000-5638-7e60-0f21-b076e2afa726	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5638-7e60-ac20-bc6c0378cee2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5638-7e60-467c-6facab9ee01f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5638-7e60-8873-f8a6a1ad8220	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5638-7e60-6dc0-e33b94a1b2d6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5638-7e60-7f17-3b5b073a8637	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5638-7e60-2d11-4009bf004760	LV	LVA	428	Latvia 	Latvija	\N
00040000-5638-7e60-d6a8-286627f695f9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5638-7e60-c430-551f8e7eb8cf	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5638-7e60-9faf-4ed9d4819120	LR	LBR	430	Liberia 	Liberija	\N
00040000-5638-7e60-579f-6a683ff882ef	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5638-7e60-326e-5f6c2dd390d5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5638-7e61-8415-41559b20c00c	LT	LTU	440	Lithuania 	Litva	\N
00040000-5638-7e61-ba77-83f01ca200e3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5638-7e61-c7ed-9f5ed266d796	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5638-7e61-28f9-00d402ffbf62	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5638-7e61-af4f-090139546f25	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5638-7e61-9fbc-7525a4c5c74e	MW	MWI	454	Malawi 	Malavi	\N
00040000-5638-7e61-96aa-245059c07c81	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5638-7e61-ddcc-6e9aa416dce0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5638-7e61-3031-6074f272bf6d	ML	MLI	466	Mali 	Mali	\N
00040000-5638-7e61-c08d-d1ff1b9611e4	MT	MLT	470	Malta 	Malta	\N
00040000-5638-7e61-3b4b-925ae31e53aa	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5638-7e61-a4ae-6507c8f15a9c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5638-7e61-5c3f-cbcf55b9e66f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5638-7e61-d4d5-5a1360524223	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5638-7e61-98fc-fcc65e4de9ad	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5638-7e61-9355-95535738f924	MX	MEX	484	Mexico 	Mehika	\N
00040000-5638-7e61-e76b-5369e7d9bc48	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5638-7e61-267f-0e27e5fc977d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5638-7e61-cad4-216b3307498e	MC	MCO	492	Monaco 	Monako	\N
00040000-5638-7e61-524d-c2642701e0db	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5638-7e61-b747-18236743c10c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5638-7e61-28fe-5afa489eeda0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5638-7e61-1cb6-58299c7c8e91	MA	MAR	504	Morocco 	Maroko	\N
00040000-5638-7e61-e3d7-2cd084f759c8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5638-7e61-673c-e35aa751c378	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5638-7e61-b797-c28774f3b26a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5638-7e61-1d8b-54e5850cd58a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5638-7e61-5f99-80a93e5b792c	NP	NPL	524	Nepal 	Nepal	\N
00040000-5638-7e61-c1cb-ceffc23c1a9b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5638-7e61-ef79-80dc90700273	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5638-7e61-fbeb-62de1d32fd61	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5638-7e61-88b6-2078cb2ca29d	NE	NER	562	Niger 	Niger 	\N
00040000-5638-7e61-70dc-4ee3b049501f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5638-7e61-0f9a-cc0ded6d5a2b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5638-7e61-8916-6e2a8cb06325	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5638-7e61-8c0e-fd493fa65386	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5638-7e61-4ee7-2344aaeaecd4	NO	NOR	578	Norway 	Norveška	\N
00040000-5638-7e61-cbe8-b9d23d588086	OM	OMN	512	Oman 	Oman	\N
00040000-5638-7e61-432b-eee6bad50173	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5638-7e61-5605-a558ec424c99	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5638-7e61-c498-598658199fc1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5638-7e61-8034-a1eff9ec878c	PA	PAN	591	Panama 	Panama	\N
00040000-5638-7e61-0e4b-30daf2c8dc3b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5638-7e61-99e9-98172ce15d0e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5638-7e61-e0ea-d179c2de0ff0	PE	PER	604	Peru 	Peru	\N
00040000-5638-7e61-befa-03a3e49b55e6	PH	PHL	608	Philippines 	Filipini	\N
00040000-5638-7e61-d901-efc93da98982	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5638-7e61-b469-a810328da693	PL	POL	616	Poland 	Poljska	\N
00040000-5638-7e61-4dfa-b85bd1091633	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5638-7e61-d4d4-04150403e0da	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5638-7e61-7df5-34a44ffa8e69	QA	QAT	634	Qatar 	Katar	\N
00040000-5638-7e61-4b55-f73537693dc3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5638-7e61-0719-1b86d7f75f2b	RO	ROU	642	Romania 	Romunija	\N
00040000-5638-7e61-c987-21791c6b1ce7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5638-7e61-6e31-8d31bc41a814	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5638-7e61-51be-2ad7d7e023b1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5638-7e61-df19-74db5b5088a2	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5638-7e61-f016-b988591b6250	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5638-7e61-3e0e-63a1504a23e0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5638-7e61-c9e7-71a49f8cc282	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5638-7e61-d467-d001500067c1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5638-7e61-7c3a-f873f96fb7ae	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5638-7e61-4c5a-941ac57af35c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5638-7e61-50a7-5efbdbc6e7ac	SM	SMR	674	San Marino 	San Marino	\N
00040000-5638-7e61-de81-4cbd8367a4ae	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5638-7e61-c38e-a8e3f30fa54f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5638-7e61-b1b7-d558d44017de	SN	SEN	686	Senegal 	Senegal	\N
00040000-5638-7e61-8309-42b12b71a7dc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5638-7e61-8d3b-5ca902c15e96	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5638-7e61-b1a7-2876d6bd5beb	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5638-7e61-9028-7946c2de6798	SG	SGP	702	Singapore 	Singapur	\N
00040000-5638-7e61-066a-d6676297e457	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5638-7e61-ef9a-539620370573	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5638-7e61-28a6-9ca9a90f301d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5638-7e61-5950-5efea29a2dbc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5638-7e61-d4bd-3df7b4a428b1	SO	SOM	706	Somalia 	Somalija	\N
00040000-5638-7e61-4e71-3d0bade107b4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5638-7e61-cb4c-8903c0b3daac	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5638-7e61-c187-6e257f8732e6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5638-7e61-3d87-17f37f514c15	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5638-7e61-ae15-859b7ca05bfa	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5638-7e61-6cd2-ba7b4f8c97df	SD	SDN	729	Sudan 	Sudan	\N
00040000-5638-7e61-ac31-792651772175	SR	SUR	740	Suriname 	Surinam	\N
00040000-5638-7e61-7f74-4d8f097586aa	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5638-7e61-fcb2-46bcefc56595	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5638-7e61-32aa-af399075221d	SE	SWE	752	Sweden 	Švedska	\N
00040000-5638-7e61-2bd3-193675082e72	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5638-7e61-1fc8-27c49f752b91	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5638-7e61-1ba8-c40f895ad514	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5638-7e61-bacf-30e3d526b566	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5638-7e61-4dce-c1268f7d5a8c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5638-7e61-d3cd-01f048cbe4b6	TH	THA	764	Thailand 	Tajska	\N
00040000-5638-7e61-f3f3-126ed3824d0c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5638-7e61-fc0b-048fc6c94ac9	TG	TGO	768	Togo 	Togo	\N
00040000-5638-7e61-e071-d76d70998a75	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5638-7e61-51b2-b89650bee3b7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5638-7e61-ee09-163d24ce5b44	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5638-7e61-0c9a-fbf7034f059c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5638-7e61-af6c-8f8ca2cbf6a7	TR	TUR	792	Turkey 	Turčija	\N
00040000-5638-7e61-782e-bb8cce193920	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5638-7e61-bf7a-2cf9499d934a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5638-7e61-b093-154f92bfca5b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5638-7e61-9ee1-8b5e8d341fb7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5638-7e61-165c-f7c05a53ad80	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5638-7e61-e953-8130f9226a1e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5638-7e61-a641-46d29e00fbf2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5638-7e61-f584-c7b67ea6dfd4	US	USA	840	United States 	Združene države Amerike	\N
00040000-5638-7e61-19d3-560b29ac36b6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5638-7e61-c34c-a6e6cc656cf7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5638-7e61-257e-db08c2822930	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5638-7e61-6733-9cbeebe0182a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5638-7e61-3fca-d296216f1cc6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5638-7e61-17ca-e30cc4ab3ee0	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5638-7e61-0f0a-ec5031e9f1c2	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5638-7e61-4852-a88118ce0ccf	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5638-7e61-7bef-8b75015b4922	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5638-7e61-d20c-b47acfdb2b68	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5638-7e61-71e9-188dfabc0c9b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5638-7e61-7752-b728eefacb9f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5638-7e61-4d48-f0d8a9cd6bdb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 25114032)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5638-7e63-9550-ef068df4344b	000e0000-5638-7e63-3422-13946a4fc2d6	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5638-7e60-1180-80e680788f0d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5638-7e63-fb36-d574bda12884	000e0000-5638-7e63-d293-87ab983050a9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5638-7e60-eef4-a9720af5f0f6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5638-7e63-e547-72e6cd9c3763	000e0000-5638-7e63-470a-833ba472974d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5638-7e60-1180-80e680788f0d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5638-7e63-5594-9b08479819ce	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5638-7e63-3656-576be2894952	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 25113833)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5638-7e63-2493-d2007153d2e3	000e0000-5638-7e63-d293-87ab983050a9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5638-7e60-b1e5-c0ed0a7564ae
000d0000-5638-7e63-6c97-07c550272cda	000e0000-5638-7e63-d293-87ab983050a9	000c0000-5638-7e63-2b1c-8fb80697bab0	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5638-7e60-b1e5-c0ed0a7564ae
000d0000-5638-7e63-f303-58eff799f72e	000e0000-5638-7e63-d293-87ab983050a9	000c0000-5638-7e63-1e38-cf56d5990e3a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5638-7e60-68d9-fe6ddef6bc31
000d0000-5638-7e63-0740-60bf0bc5b900	000e0000-5638-7e63-d293-87ab983050a9	000c0000-5638-7e63-410a-9bf3835acc65	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5638-7e60-0ee5-95f78eb00fe2
000d0000-5638-7e63-59e0-138b03e00a36	000e0000-5638-7e63-d293-87ab983050a9	000c0000-5638-7e63-f757-3919bc2c4227	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5638-7e60-4673-eed0407baa2f
000d0000-5638-7e63-f690-5c5449c2c648	000e0000-5638-7e63-d293-87ab983050a9	000c0000-5638-7e63-0f1f-50b8c01db169	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5638-7e60-4673-eed0407baa2f
000d0000-5638-7e63-f6ff-f7c8f031d34e	000e0000-5638-7e63-d293-87ab983050a9	000c0000-5638-7e63-238d-c72debd8d6c6	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5638-7e60-b1e5-c0ed0a7564ae
000d0000-5638-7e63-04c1-ea8ef803d76c	000e0000-5638-7e63-d293-87ab983050a9	000c0000-5638-7e63-4994-a9b3b45a4147	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5638-7e60-0984-f9ed1cef66ea
000d0000-5638-7e63-76c8-aad803915fe2	000e0000-5638-7e63-d293-87ab983050a9	000c0000-5638-7e63-b20a-e4f00df0c612	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5638-7e60-f3bb-6f8c5f4bda86
\.


--
-- TOC entry 3118 (class 0 OID 25113624)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 25113590)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 25113567)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5638-7e63-1221-d7a8d6a1041d	00080000-5638-7e63-c7ab-a56da22a9ac9	00090000-5638-7e63-6482-8cd7dbfeae62	AK		igralka
\.


--
-- TOC entry 3130 (class 0 OID 25113747)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 25114287)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 25114299)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 25114321)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 24507014)
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
\.


--
-- TOC entry 3134 (class 0 OID 25113772)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 25113524)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5638-7e61-7cf9-59c5256b3db2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5638-7e61-a4bf-3a16cee00c02	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5638-7e61-c138-4220e2ce2202	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5638-7e61-b6d1-b8442f57d6a3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5638-7e61-2da4-a9cca09f4927	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5638-7e61-6736-02d0f4565b93	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5638-7e61-368e-6df8632388f1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5638-7e61-c6b9-2327070071ed	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5638-7e61-758a-8daec8ae8bb6	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5638-7e61-c66e-0a3e8461e107	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5638-7e61-ca3d-f2010967a134	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5638-7e61-c2be-bcb01e8a8e8c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5638-7e61-ce94-439fa047eaef	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5638-7e61-be15-d6bed7083ead	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5638-7e61-7c42-df6983619680	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5638-7e63-9547-950f33c1a3a3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5638-7e63-267a-9149eeb46d0f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5638-7e63-80b0-de6c8e1791a6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5638-7e63-316a-9a8edd56dbc7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5638-7e63-7d6a-80b5851adcf2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5638-7e64-9666-c07b1eb3a80a	application.tenant.maticnopodjetje	string	s:36:"00080000-5638-7e64-4695-f6ef86695d2f";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 25113424)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5638-7e63-09cf-8ed50c87f86f	00000000-5638-7e63-9547-950f33c1a3a3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5638-7e63-8099-80d711311ceb	00000000-5638-7e63-9547-950f33c1a3a3	00010000-5638-7e61-9570-0ac239023f38	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5638-7e63-6f43-5774cbbb8dc7	00000000-5638-7e63-267a-9149eeb46d0f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3107 (class 0 OID 25113491)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5638-7e63-56a9-9b88134cf01e	\N	00100000-5638-7e63-f83a-5b6858a97a4a	00100000-5638-7e63-07de-f7cee5af022a	01	Gledališče Nimbis
00410000-5638-7e63-79a6-0d60e8955d74	00410000-5638-7e63-56a9-9b88134cf01e	00100000-5638-7e63-f83a-5b6858a97a4a	00100000-5638-7e63-07de-f7cee5af022a	02	Tehnika
\.


--
-- TOC entry 3104 (class 0 OID 25113435)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5638-7e63-9355-121b08f0f8cf	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5638-7e63-fee8-d49d1ed07345	00010000-5638-7e63-763e-faa2d356472c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5638-7e63-5346-163c6708fe64	00010000-5638-7e63-3aab-ddd4f81aed67	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5638-7e63-f3b6-92293ca8ed6e	00010000-5638-7e63-1c84-ce7e3d45246b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5638-7e63-4176-03fd5e00b9b3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5638-7e63-1326-0ba3eccf7e70	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5638-7e63-35aa-4abe2ce0f03f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5638-7e63-f940-aa840c997405	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5638-7e63-6482-8cd7dbfeae62	00010000-5638-7e63-e556-ff8e7414e356	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5638-7e63-3a48-0f2955a23882	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5638-7e63-ab53-955e79a7a169	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5638-7e63-28d8-d65ae8650e4a	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5638-7e63-9dee-bbf77aa61b23	00010000-5638-7e63-7985-595f8dd8ad15	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5638-7e63-95a2-43868273c30e	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-7e63-3327-2cae24eadeee	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-7e63-e201-a3f7b4acda0f	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-7e63-1e2a-73f0fbf92829	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5638-7e63-cd02-9d3b0caa990c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5638-7e63-50bb-bbd0417bb169	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-7e63-9403-115ef3279b57	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5638-7e63-72bc-e5d95aec183f	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3096 (class 0 OID 25113370)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5638-7e61-d253-8033d86c7cb9	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5638-7e61-0978-6cc78be7f1d1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5638-7e61-c44a-e080a33e45e3	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5638-7e61-9135-3f16352d9a20	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5638-7e61-fca1-9325f0d8c61e	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5638-7e61-9316-b6c616e7e830	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5638-7e61-30f5-cdc2a473b235	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5638-7e61-8212-de67d1f1f23e	Abonma-read	Abonma - branje	t
00030000-5638-7e61-d8dc-6afaa18e8d0c	Abonma-write	Abonma - spreminjanje	t
00030000-5638-7e61-0384-bb81f772306c	Alternacija-read	Alternacija - branje	t
00030000-5638-7e61-4970-eec64c4bbe53	Alternacija-write	Alternacija - spreminjanje	t
00030000-5638-7e61-a0d4-dbec33e6c0ed	Arhivalija-read	Arhivalija - branje	t
00030000-5638-7e61-5221-f5b7c069f2b9	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5638-7e61-796e-ba7722cb343c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5638-7e61-39e5-9d0574e60d27	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5638-7e61-2149-f28d7486ecd5	Besedilo-read	Besedilo - branje	t
00030000-5638-7e61-94c9-cb55f0eb632f	Besedilo-write	Besedilo - spreminjanje	t
00030000-5638-7e61-64ab-874b6643ae24	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5638-7e61-3972-e55c57bbd1e1	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5638-7e61-f9ed-b4df45fd67b6	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5638-7e61-a8f1-2aae56dcdffd	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5638-7e61-ea9b-9997d905d568	Dogodek-read	Dogodek - branje	t
00030000-5638-7e61-edd8-b4fd0e54fd44	Dogodek-write	Dogodek - spreminjanje	t
00030000-5638-7e61-7637-27a7421e59cb	DrugiVir-read	DrugiVir - branje	t
00030000-5638-7e61-0392-6fd589454d0c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5638-7e61-ee64-8bc48cee0003	Drzava-read	Drzava - branje	t
00030000-5638-7e61-8f5a-1d4bfcc15d39	Drzava-write	Drzava - spreminjanje	t
00030000-5638-7e61-4b1a-2d519d95bf54	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5638-7e61-0f86-0140c8fa7f06	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5638-7e61-1fa3-b9b63ccc4338	Funkcija-read	Funkcija - branje	t
00030000-5638-7e61-698e-78e86b6eb5e9	Funkcija-write	Funkcija - spreminjanje	t
00030000-5638-7e61-d772-499f41918f2b	Gostovanje-read	Gostovanje - branje	t
00030000-5638-7e61-cc30-da63283792d9	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5638-7e61-f0ba-1f12f0346e95	Gostujoca-read	Gostujoca - branje	t
00030000-5638-7e61-806f-810277505341	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-5638-7e61-4a38-0f428f5986c5	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5638-7e61-3532-dd6545853d7a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5638-7e61-75aa-5fdbdce076c5	Kupec-read	Kupec - branje	t
00030000-5638-7e61-94f6-93d68fb1586c	Kupec-write	Kupec - spreminjanje	t
00030000-5638-7e61-a0c4-bb1e6536e807	NacinPlacina-read	NacinPlacina - branje	t
00030000-5638-7e61-a644-6f3055ab96eb	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5638-7e61-edc1-c61e7f8ff9e9	Option-read	Option - branje	t
00030000-5638-7e61-ba28-edb1af9780b5	Option-write	Option - spreminjanje	t
00030000-5638-7e61-7a50-54ccf9e2ec38	OptionValue-read	OptionValue - branje	t
00030000-5638-7e61-6668-d1a42328b12f	OptionValue-write	OptionValue - spreminjanje	t
00030000-5638-7e61-cec3-25c6363416cd	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5638-7e61-ffc6-bcad8cdfc4e6	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5638-7e61-ee9e-6a62f6959107	Oseba-read	Oseba - branje	t
00030000-5638-7e61-d8f5-7070070322f5	Oseba-write	Oseba - spreminjanje	t
00030000-5638-7e61-d467-597a8c6faf34	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5638-7e61-190c-4dba4a1d9378	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5638-7e61-1385-3a55e52805a0	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5638-7e61-5210-d77bf469ef86	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5638-7e61-e4f3-ca17cb119547	Pogodba-read	Pogodba - branje	t
00030000-5638-7e61-acc3-e1c1c8403b48	Pogodba-write	Pogodba - spreminjanje	t
00030000-5638-7e61-023d-685e972077df	Popa-read	Popa - branje	t
00030000-5638-7e61-b2ac-a2095ea4a16b	Popa-write	Popa - spreminjanje	t
00030000-5638-7e61-a5bb-cfe5e5cddfda	Posta-read	Posta - branje	t
00030000-5638-7e61-083b-d705d90082a2	Posta-write	Posta - spreminjanje	t
00030000-5638-7e61-f4d5-5050059e9c2e	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5638-7e61-3c1a-19ce370bb06a	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5638-7e61-f984-7060ea345584	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5638-7e61-3ce0-2a895d52f42d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5638-7e61-9bda-142b93e0618c	PostniNaslov-read	PostniNaslov - branje	t
00030000-5638-7e61-9c4a-98ce16c927dc	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5638-7e61-fb22-686e2cea880d	Predstava-read	Predstava - branje	t
00030000-5638-7e61-cedd-14a765907406	Predstava-write	Predstava - spreminjanje	t
00030000-5638-7e61-9398-95ce260926ff	Praznik-read	Praznik - branje	t
00030000-5638-7e61-f19a-cf7ef16d3828	Praznik-write	Praznik - spreminjanje	t
00030000-5638-7e61-b8cf-b99050e4bb0a	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5638-7e61-d663-f76d29a1231f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5638-7e61-92ce-3cc256c2b494	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5638-7e61-a55f-018daf02fd1d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5638-7e61-6bea-291d939d8dd3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5638-7e61-fe9e-6653c4e692f8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5638-7e61-8ee2-f54de53d4949	ProgramDela-read	ProgramDela - branje	t
00030000-5638-7e61-51b5-9488ba862a48	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5638-7e61-f771-5a8462e7ec80	ProgramFestival-read	ProgramFestival - branje	t
00030000-5638-7e61-4394-cad39e5a595d	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5638-7e61-2540-bd6a7eeb11f0	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5638-7e61-ec10-2a3e8aa65e1c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5638-7e61-8d3c-b0526ac8afae	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5638-7e61-d846-f3bcecac0a8a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5638-7e61-1788-a077f943bb60	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5638-7e61-bfd4-305269390061	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5638-7e61-c053-e8e3af3fcceb	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5638-7e61-be17-f4f6f8c5e4ea	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5638-7e61-b571-2c8a1c486b94	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5638-7e61-c178-4719ea8d1cc7	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5638-7e61-ce29-84e582dbca15	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5638-7e61-84e7-5093c97cce54	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5638-7e61-74dd-eb9c718ac1eb	ProgramRazno-read	ProgramRazno - branje	t
00030000-5638-7e61-f054-9007018a5a73	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5638-7e61-b9d6-ecc91d493698	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5638-7e61-7e02-4743ca49ea23	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5638-7e61-289b-1cdb8944acb8	Prostor-read	Prostor - branje	t
00030000-5638-7e61-233a-af05edca5238	Prostor-write	Prostor - spreminjanje	t
00030000-5638-7e61-8a88-5d30101c73bd	Racun-read	Racun - branje	t
00030000-5638-7e61-ef7f-f321581e40c4	Racun-write	Racun - spreminjanje	t
00030000-5638-7e61-3147-25c2d1b2f645	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5638-7e61-92ca-d897ec16d837	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5638-7e61-51a6-9ee9f06b2bd0	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5638-7e61-3223-ae89f8c3b9fc	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5638-7e61-5250-a13732767987	Rekvizit-read	Rekvizit - branje	t
00030000-5638-7e61-9284-f3a8ec232d37	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5638-7e61-7ce5-b6143274ed0d	Revizija-read	Revizija - branje	t
00030000-5638-7e61-8b5e-1d0a0ad49e53	Revizija-write	Revizija - spreminjanje	t
00030000-5638-7e61-7afa-bd93aca56ed1	Rezervacija-read	Rezervacija - branje	t
00030000-5638-7e61-fa01-4e47a1245937	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5638-7e61-9f12-a29cabaef99b	SedezniRed-read	SedezniRed - branje	t
00030000-5638-7e61-70ae-79c47087eddf	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5638-7e61-c0ba-3885d4debd39	Sedez-read	Sedez - branje	t
00030000-5638-7e61-5986-5a2d872d5525	Sedez-write	Sedez - spreminjanje	t
00030000-5638-7e61-f55d-888c05f8e5bd	Sezona-read	Sezona - branje	t
00030000-5638-7e61-c4b8-8c449839f9e1	Sezona-write	Sezona - spreminjanje	t
00030000-5638-7e61-c524-19883ebfd297	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5638-7e61-8070-b6331f633bb2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5638-7e61-24a1-1a52210d210a	Stevilcenje-read	Stevilcenje - branje	t
00030000-5638-7e61-ed5d-5c74a4284560	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5638-7e61-dec5-67cf2fe832e4	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5638-7e61-ed39-053a2b80ce6b	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5638-7e61-5933-23c6ce042cfe	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5638-7e61-9824-619e279baa2e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5638-7e61-d677-7f2ef992135e	Telefonska-read	Telefonska - branje	t
00030000-5638-7e61-094a-6b92b5473936	Telefonska-write	Telefonska - spreminjanje	t
00030000-5638-7e61-62ed-fbf2b67c98d0	TerminStoritve-read	TerminStoritve - branje	t
00030000-5638-7e61-eb09-b39b4a7456ef	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5638-7e61-eaaf-b526011d11f7	TipFunkcije-read	TipFunkcije - branje	t
00030000-5638-7e61-2f7f-37fb0566a70d	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5638-7e61-d15e-6c6d6ae0299f	TipPopa-read	TipPopa - branje	t
00030000-5638-7e61-22a9-756087ed19d8	TipPopa-write	TipPopa - spreminjanje	t
00030000-5638-7e61-d991-a946059bae2c	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5638-7e61-a6f8-344a914e91af	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5638-7e61-9b03-3a311ed3c624	TipVaje-read	TipVaje - branje	t
00030000-5638-7e61-09e6-8ae95a6fd784	TipVaje-write	TipVaje - spreminjanje	t
00030000-5638-7e61-f931-81eb185d043c	Trr-read	Trr - branje	t
00030000-5638-7e61-aea5-921c4a2d2840	Trr-write	Trr - spreminjanje	t
00030000-5638-7e61-286c-3d7402733cab	Uprizoritev-read	Uprizoritev - branje	t
00030000-5638-7e61-bb51-9966feacc149	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5638-7e61-b1a1-47974567d208	Vaja-read	Vaja - branje	t
00030000-5638-7e61-5421-854cf93585f6	Vaja-write	Vaja - spreminjanje	t
00030000-5638-7e61-0803-01e09f85ba25	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5638-7e61-0672-0969e8c37fb3	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5638-7e61-96f0-c5b2bc828605	VrstaStroska-read	VrstaStroska - branje	t
00030000-5638-7e61-3141-722d5d2a2c61	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5638-7e61-f95a-4497856c5bc7	Zaposlitev-read	Zaposlitev - branje	t
00030000-5638-7e61-6153-d61af5cc40e3	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5638-7e61-d7fd-5bb42fc8be9f	Zasedenost-read	Zasedenost - branje	t
00030000-5638-7e61-35ef-a6819204b0eb	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5638-7e61-ed2d-9c338dd3fdf7	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5638-7e61-da8e-cae6b74096d6	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5638-7e61-be83-adf6a7756fad	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5638-7e61-39d5-f3a2555d8553	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5638-7e61-0d44-b6784ef087df	Job-read	Branje opravil - samo zase - branje	t
00030000-5638-7e61-9cc8-2fede03c6d84	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5638-7e61-e071-68431536c1f6	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5638-7e61-c789-973f7ce7800c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5638-7e61-58b5-703ccaf1e8a2	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5638-7e61-51e7-bf0da2f039cc	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5638-7e61-f4bd-5264a6a85d79	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5638-7e61-5022-3457e311242b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5638-7e61-0b47-08691cd7a1e9	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5638-7e61-5266-1eaef3e6c68b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5638-7e61-61b9-28011bf01211	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5638-7e61-ce80-995686a545ec	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5638-7e61-88f3-8252a75b6094	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5638-7e61-a26d-74acef2cf1a3	Datoteka-write	Datoteka - spreminjanje	t
00030000-5638-7e61-5047-d3d82032b197	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 25113389)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5638-7e61-bd53-395cd185e2e6	00030000-5638-7e61-0978-6cc78be7f1d1
00020000-5638-7e61-f994-cbce4f9b35cd	00030000-5638-7e61-ee64-8bc48cee0003
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-8212-de67d1f1f23e
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-d8dc-6afaa18e8d0c
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-0384-bb81f772306c
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-4970-eec64c4bbe53
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-a0d4-dbec33e6c0ed
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-ea9b-9997d905d568
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-9135-3f16352d9a20
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-edd8-b4fd0e54fd44
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-ee64-8bc48cee0003
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-8f5a-1d4bfcc15d39
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-1fa3-b9b63ccc4338
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-698e-78e86b6eb5e9
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-d772-499f41918f2b
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-cc30-da63283792d9
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-f0ba-1f12f0346e95
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-806f-810277505341
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-4a38-0f428f5986c5
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-3532-dd6545853d7a
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-edc1-c61e7f8ff9e9
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-7a50-54ccf9e2ec38
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-ee9e-6a62f6959107
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-d8f5-7070070322f5
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-023d-685e972077df
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-b2ac-a2095ea4a16b
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-a5bb-cfe5e5cddfda
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-083b-d705d90082a2
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-9bda-142b93e0618c
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-9c4a-98ce16c927dc
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-fb22-686e2cea880d
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-cedd-14a765907406
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-6bea-291d939d8dd3
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-fe9e-6653c4e692f8
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-289b-1cdb8944acb8
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-233a-af05edca5238
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-51a6-9ee9f06b2bd0
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-3223-ae89f8c3b9fc
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-5250-a13732767987
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-9284-f3a8ec232d37
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-f55d-888c05f8e5bd
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-c4b8-8c449839f9e1
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-eaaf-b526011d11f7
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-286c-3d7402733cab
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-bb51-9966feacc149
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-b1a1-47974567d208
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-5421-854cf93585f6
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-d7fd-5bb42fc8be9f
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-35ef-a6819204b0eb
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-ed2d-9c338dd3fdf7
00020000-5638-7e61-7da7-3af5c29e0b51	00030000-5638-7e61-be83-adf6a7756fad
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-8212-de67d1f1f23e
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-a0d4-dbec33e6c0ed
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-ea9b-9997d905d568
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-ee64-8bc48cee0003
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-d772-499f41918f2b
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-f0ba-1f12f0346e95
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-4a38-0f428f5986c5
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-3532-dd6545853d7a
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-edc1-c61e7f8ff9e9
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-7a50-54ccf9e2ec38
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-ee9e-6a62f6959107
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-d8f5-7070070322f5
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-023d-685e972077df
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-a5bb-cfe5e5cddfda
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-9bda-142b93e0618c
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-9c4a-98ce16c927dc
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-fb22-686e2cea880d
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-289b-1cdb8944acb8
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-51a6-9ee9f06b2bd0
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-5250-a13732767987
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-f55d-888c05f8e5bd
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-d677-7f2ef992135e
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-094a-6b92b5473936
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-f931-81eb185d043c
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-aea5-921c4a2d2840
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-f95a-4497856c5bc7
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-6153-d61af5cc40e3
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-ed2d-9c338dd3fdf7
00020000-5638-7e61-2e43-64241ed4417c	00030000-5638-7e61-be83-adf6a7756fad
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-8212-de67d1f1f23e
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-0384-bb81f772306c
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-a0d4-dbec33e6c0ed
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-5221-f5b7c069f2b9
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-2149-f28d7486ecd5
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-64ab-874b6643ae24
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-ea9b-9997d905d568
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-ee64-8bc48cee0003
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-1fa3-b9b63ccc4338
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-d772-499f41918f2b
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-f0ba-1f12f0346e95
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-4a38-0f428f5986c5
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-edc1-c61e7f8ff9e9
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-7a50-54ccf9e2ec38
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-ee9e-6a62f6959107
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-023d-685e972077df
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-a5bb-cfe5e5cddfda
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-fb22-686e2cea880d
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-6bea-291d939d8dd3
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-289b-1cdb8944acb8
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-51a6-9ee9f06b2bd0
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-5250-a13732767987
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-f55d-888c05f8e5bd
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-eaaf-b526011d11f7
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-b1a1-47974567d208
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-d7fd-5bb42fc8be9f
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-ed2d-9c338dd3fdf7
00020000-5638-7e61-4ea9-00d7c201af38	00030000-5638-7e61-be83-adf6a7756fad
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-8212-de67d1f1f23e
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-d8dc-6afaa18e8d0c
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-4970-eec64c4bbe53
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-a0d4-dbec33e6c0ed
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-ea9b-9997d905d568
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-ee64-8bc48cee0003
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-d772-499f41918f2b
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-f0ba-1f12f0346e95
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-edc1-c61e7f8ff9e9
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-7a50-54ccf9e2ec38
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-023d-685e972077df
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-a5bb-cfe5e5cddfda
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-fb22-686e2cea880d
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-289b-1cdb8944acb8
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-51a6-9ee9f06b2bd0
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-5250-a13732767987
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-f55d-888c05f8e5bd
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-eaaf-b526011d11f7
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-ed2d-9c338dd3fdf7
00020000-5638-7e61-0849-9740cabcf455	00030000-5638-7e61-be83-adf6a7756fad
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-8212-de67d1f1f23e
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-a0d4-dbec33e6c0ed
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-ea9b-9997d905d568
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-ee64-8bc48cee0003
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-d772-499f41918f2b
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-f0ba-1f12f0346e95
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-edc1-c61e7f8ff9e9
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-7a50-54ccf9e2ec38
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-023d-685e972077df
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-a5bb-cfe5e5cddfda
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-fb22-686e2cea880d
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-289b-1cdb8944acb8
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-51a6-9ee9f06b2bd0
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-5250-a13732767987
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-f55d-888c05f8e5bd
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-62ed-fbf2b67c98d0
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-c44a-e080a33e45e3
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-eaaf-b526011d11f7
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-ed2d-9c338dd3fdf7
00020000-5638-7e61-ca01-c414d89b61af	00030000-5638-7e61-be83-adf6a7756fad
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d253-8033d86c7cb9
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-0978-6cc78be7f1d1
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-8212-de67d1f1f23e
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d8dc-6afaa18e8d0c
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-0384-bb81f772306c
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-4970-eec64c4bbe53
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-a0d4-dbec33e6c0ed
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-5221-f5b7c069f2b9
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-796e-ba7722cb343c
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-39e5-9d0574e60d27
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-2149-f28d7486ecd5
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-94c9-cb55f0eb632f
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-64ab-874b6643ae24
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-3972-e55c57bbd1e1
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ea9b-9997d905d568
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-9135-3f16352d9a20
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-edd8-b4fd0e54fd44
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-7637-27a7421e59cb
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-0392-6fd589454d0c
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ee64-8bc48cee0003
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-8f5a-1d4bfcc15d39
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-4b1a-2d519d95bf54
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-0f86-0140c8fa7f06
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-1fa3-b9b63ccc4338
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-698e-78e86b6eb5e9
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d772-499f41918f2b
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-cc30-da63283792d9
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-f0ba-1f12f0346e95
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-806f-810277505341
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-4a38-0f428f5986c5
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-3532-dd6545853d7a
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-75aa-5fdbdce076c5
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-94f6-93d68fb1586c
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-a0c4-bb1e6536e807
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-a644-6f3055ab96eb
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-edc1-c61e7f8ff9e9
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-7a50-54ccf9e2ec38
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-6668-d1a42328b12f
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ba28-edb1af9780b5
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-cec3-25c6363416cd
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ffc6-bcad8cdfc4e6
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ee9e-6a62f6959107
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-fca1-9325f0d8c61e
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d8f5-7070070322f5
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d467-597a8c6faf34
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-190c-4dba4a1d9378
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-1385-3a55e52805a0
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-5210-d77bf469ef86
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-e4f3-ca17cb119547
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-acc3-e1c1c8403b48
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-023d-685e972077df
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-b2ac-a2095ea4a16b
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-a5bb-cfe5e5cddfda
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-f4d5-5050059e9c2e
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-3c1a-19ce370bb06a
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-f984-7060ea345584
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-3ce0-2a895d52f42d
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-083b-d705d90082a2
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-9bda-142b93e0618c
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-9c4a-98ce16c927dc
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-9398-95ce260926ff
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-f19a-cf7ef16d3828
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-fb22-686e2cea880d
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-cedd-14a765907406
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-b8cf-b99050e4bb0a
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d663-f76d29a1231f
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-92ce-3cc256c2b494
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-a55f-018daf02fd1d
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-6bea-291d939d8dd3
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-fe9e-6653c4e692f8
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-9316-b6c616e7e830
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-8ee2-f54de53d4949
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-30f5-cdc2a473b235
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-51b5-9488ba862a48
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-f771-5a8462e7ec80
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-4394-cad39e5a595d
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-2540-bd6a7eeb11f0
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ec10-2a3e8aa65e1c
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-8d3c-b0526ac8afae
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d846-f3bcecac0a8a
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-1788-a077f943bb60
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-bfd4-305269390061
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-c053-e8e3af3fcceb
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-be17-f4f6f8c5e4ea
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-b571-2c8a1c486b94
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-c178-4719ea8d1cc7
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ce29-84e582dbca15
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-84e7-5093c97cce54
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-74dd-eb9c718ac1eb
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-f054-9007018a5a73
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-b9d6-ecc91d493698
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-7e02-4743ca49ea23
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-289b-1cdb8944acb8
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-233a-af05edca5238
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-8a88-5d30101c73bd
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ef7f-f321581e40c4
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-3147-25c2d1b2f645
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-92ca-d897ec16d837
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-51a6-9ee9f06b2bd0
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-3223-ae89f8c3b9fc
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-5250-a13732767987
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-9284-f3a8ec232d37
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-7ce5-b6143274ed0d
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-8b5e-1d0a0ad49e53
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-7afa-bd93aca56ed1
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-fa01-4e47a1245937
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-9f12-a29cabaef99b
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-70ae-79c47087eddf
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-c0ba-3885d4debd39
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-5986-5a2d872d5525
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-f55d-888c05f8e5bd
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-c4b8-8c449839f9e1
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-c524-19883ebfd297
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-8070-b6331f633bb2
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-24a1-1a52210d210a
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-dec5-67cf2fe832e4
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ed39-053a2b80ce6b
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ed5d-5c74a4284560
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-5933-23c6ce042cfe
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-9824-619e279baa2e
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d677-7f2ef992135e
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-094a-6b92b5473936
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-62ed-fbf2b67c98d0
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-c44a-e080a33e45e3
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-eb09-b39b4a7456ef
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-eaaf-b526011d11f7
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-2f7f-37fb0566a70d
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d15e-6c6d6ae0299f
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-22a9-756087ed19d8
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d991-a946059bae2c
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-a6f8-344a914e91af
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-9b03-3a311ed3c624
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-09e6-8ae95a6fd784
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-f931-81eb185d043c
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-aea5-921c4a2d2840
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-286c-3d7402733cab
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-bb51-9966feacc149
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-b1a1-47974567d208
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-5421-854cf93585f6
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-0803-01e09f85ba25
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-0672-0969e8c37fb3
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-96f0-c5b2bc828605
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-3141-722d5d2a2c61
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-f95a-4497856c5bc7
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-6153-d61af5cc40e3
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-d7fd-5bb42fc8be9f
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-35ef-a6819204b0eb
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-ed2d-9c338dd3fdf7
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-da8e-cae6b74096d6
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-be83-adf6a7756fad
00020000-5638-7e63-9b7a-19b916479157	00030000-5638-7e61-39d5-f3a2555d8553
\.


--
-- TOC entry 3135 (class 0 OID 25113779)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 25113813)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 25113950)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5638-7e63-d6a3-3a8b0d8e710a	00090000-5638-7e63-9355-121b08f0f8cf	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5638-7e63-667f-00d7d3d309ba	00090000-5638-7e63-1326-0ba3eccf7e70	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5638-7e63-13f3-10fe1b54ab22	00090000-5638-7e63-9dee-bbf77aa61b23	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5638-7e63-d670-4627348cb378	00090000-5638-7e63-3a48-0f2955a23882	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3106 (class 0 OID 25113471)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5638-7e63-c7ab-a56da22a9ac9	\N	00040000-5638-7e61-28a6-9ca9a90f301d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-7e63-7025-c2c2b3570459	\N	00040000-5638-7e61-28a6-9ca9a90f301d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5638-7e63-2c89-159fb0881770	\N	00040000-5638-7e61-28a6-9ca9a90f301d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-7e63-146d-422256d87d59	\N	00040000-5638-7e61-28a6-9ca9a90f301d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-7e63-0641-5eb9b7c7633d	\N	00040000-5638-7e61-28a6-9ca9a90f301d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-7e63-cb8a-97d7e8786475	\N	00040000-5638-7e60-ade0-7eaaa8632b4e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-7e63-cfc2-94a996b1fa27	\N	00040000-5638-7e60-aebd-11a6e7193edb	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-7e63-5d2a-a43539251a76	\N	00040000-5638-7e60-e6e1-4b3649955ca2	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-7e63-2f14-bc62a768921f	\N	00040000-5638-7e60-29b6-74cb122c1fad	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5638-7e64-4695-f6ef86695d2f	\N	00040000-5638-7e61-28a6-9ca9a90f301d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 25113516)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5638-7e60-6f12-01ae63e16b2e	8341	Adlešiči
00050000-5638-7e60-c170-a169fb6a3c39	5270	Ajdovščina
00050000-5638-7e60-02ce-3411b427e33c	6280	Ankaran/Ancarano
00050000-5638-7e60-ed1c-5a0f32e9c0d2	9253	Apače
00050000-5638-7e60-7be5-83a43c9a395a	8253	Artiče
00050000-5638-7e60-500d-04241f05baeb	4275	Begunje na Gorenjskem
00050000-5638-7e60-49e9-ff3abd978bf5	1382	Begunje pri Cerknici
00050000-5638-7e60-eb9f-7279cf21e056	9231	Beltinci
00050000-5638-7e60-4eaf-f24be9770542	2234	Benedikt
00050000-5638-7e60-c2d9-c15805e477ca	2345	Bistrica ob Dravi
00050000-5638-7e60-4dad-f6dfa4bb1ff0	3256	Bistrica ob Sotli
00050000-5638-7e60-b455-a9022021a4cd	8259	Bizeljsko
00050000-5638-7e60-d649-b71ee9136b3c	1223	Blagovica
00050000-5638-7e60-308a-5efafebb1690	8283	Blanca
00050000-5638-7e60-a913-5020f6b99beb	4260	Bled
00050000-5638-7e60-418c-5f30d9f5fe2b	4273	Blejska Dobrava
00050000-5638-7e60-7eda-2d7890648266	9265	Bodonci
00050000-5638-7e60-bb4f-a14ead6294c5	9222	Bogojina
00050000-5638-7e60-e71d-81b92a61892e	4263	Bohinjska Bela
00050000-5638-7e60-7b8f-fd600a5c5d0d	4264	Bohinjska Bistrica
00050000-5638-7e60-6711-a60160684abf	4265	Bohinjsko jezero
00050000-5638-7e60-56b2-c935d8f971fd	1353	Borovnica
00050000-5638-7e60-2312-944a653325d5	8294	Boštanj
00050000-5638-7e60-7756-4544ca4b7813	5230	Bovec
00050000-5638-7e60-5f1a-e77da9beaa04	5295	Branik
00050000-5638-7e60-be7e-ea5027701678	3314	Braslovče
00050000-5638-7e60-7a33-92b0addb30ae	5223	Breginj
00050000-5638-7e60-881a-2e53d75f47a8	8280	Brestanica
00050000-5638-7e60-bd0c-0a44ee795fd9	2354	Bresternica
00050000-5638-7e60-0c24-c9608b313061	4243	Brezje
00050000-5638-7e60-4d14-f8eb064e6e72	1351	Brezovica pri Ljubljani
00050000-5638-7e60-3dd4-89bbb761c63e	8250	Brežice
00050000-5638-7e60-5b66-4cd52a121a0b	4210	Brnik - Aerodrom
00050000-5638-7e60-0ccf-8c9f9ba5a9c7	8321	Brusnice
00050000-5638-7e60-8a75-ef9dc7b87ad8	3255	Buče
00050000-5638-7e60-7d05-497d9dc70722	8276	Bučka 
00050000-5638-7e60-d46b-b28521316bc1	9261	Cankova
00050000-5638-7e60-30aa-f253fa757f73	3000	Celje 
00050000-5638-7e60-8a14-8b3e29b86b7b	3001	Celje - poštni predali
00050000-5638-7e60-d42f-1fa29e70b047	4207	Cerklje na Gorenjskem
00050000-5638-7e60-8227-ecee8f17ddd3	8263	Cerklje ob Krki
00050000-5638-7e60-4b60-6d7d3a4d075e	1380	Cerknica
00050000-5638-7e60-18a1-00dcd3e7903f	5282	Cerkno
00050000-5638-7e60-1365-89f816720cda	2236	Cerkvenjak
00050000-5638-7e60-0b3c-679b8031af62	2215	Ceršak
00050000-5638-7e60-9249-f73b0c707475	2326	Cirkovce
00050000-5638-7e60-c0a0-add454c2b913	2282	Cirkulane
00050000-5638-7e60-2aab-4876735e077d	5273	Col
00050000-5638-7e60-06f6-be902060aa4a	8251	Čatež ob Savi
00050000-5638-7e60-1b54-517ddbf2affe	1413	Čemšenik
00050000-5638-7e60-6d16-b0310ed8d3c8	5253	Čepovan
00050000-5638-7e60-99a0-0202aa34a5db	9232	Črenšovci
00050000-5638-7e60-979b-63f3158cdfa4	2393	Črna na Koroškem
00050000-5638-7e60-b903-8d265433fde9	6275	Črni Kal
00050000-5638-7e60-3af9-afcdaf7d503b	5274	Črni Vrh nad Idrijo
00050000-5638-7e60-7d05-dcc622e013be	5262	Črniče
00050000-5638-7e60-ebf9-fbf76e58c0da	8340	Črnomelj
00050000-5638-7e60-3f07-7ce719fef482	6271	Dekani
00050000-5638-7e60-7f43-fb94589c2168	5210	Deskle
00050000-5638-7e60-f2e4-e7c048b2d15d	2253	Destrnik
00050000-5638-7e60-73fb-c6031b70324b	6215	Divača
00050000-5638-7e60-7d6d-5e72a18a95ea	1233	Dob
00050000-5638-7e60-ed67-5b3148846901	3224	Dobje pri Planini
00050000-5638-7e60-a027-3906e4e1bddd	8257	Dobova
00050000-5638-7e60-a63d-440673284441	1423	Dobovec
00050000-5638-7e60-2095-3b2967b789e6	5263	Dobravlje
00050000-5638-7e60-627c-bd63b8991d82	3204	Dobrna
00050000-5638-7e60-9879-b38dc5dbbcec	8211	Dobrnič
00050000-5638-7e60-fbe3-db3f7e724216	1356	Dobrova
00050000-5638-7e60-6b98-915d5cd7a314	9223	Dobrovnik/Dobronak 
00050000-5638-7e60-4167-5f3552445efc	5212	Dobrovo v Brdih
00050000-5638-7e60-1aa7-cb861b3bc0b4	1431	Dol pri Hrastniku
00050000-5638-7e60-ed21-6f28dcd6dbc9	1262	Dol pri Ljubljani
00050000-5638-7e60-71c9-3307e4d8e675	1273	Dole pri Litiji
00050000-5638-7e60-0960-ac9c8bb51e92	1331	Dolenja vas
00050000-5638-7e60-57b5-53de03037bdc	8350	Dolenjske Toplice
00050000-5638-7e60-fc45-4eb1f2eebaf2	1230	Domžale
00050000-5638-7e60-dc9b-2afe20b2e6ef	2252	Dornava
00050000-5638-7e60-8fe8-879e0c4af335	5294	Dornberk
00050000-5638-7e60-004e-e3f4f02c2f25	1319	Draga
00050000-5638-7e60-458d-0fe8f49f7eaf	8343	Dragatuš
00050000-5638-7e60-143c-6de155b0347b	3222	Dramlje
00050000-5638-7e60-2512-8198ff96dcdf	2370	Dravograd
00050000-5638-7e60-0570-7b139b1bf4c4	4203	Duplje
00050000-5638-7e60-df96-091fd76445f6	6221	Dutovlje
00050000-5638-7e60-2eed-69da165570eb	8361	Dvor
00050000-5638-7e60-8645-5cc08c63cd4b	2343	Fala
00050000-5638-7e60-3d68-72a390a9ebf9	9208	Fokovci
00050000-5638-7e60-aca3-8e452022a002	2313	Fram
00050000-5638-7e60-9ffe-12c55c3a7215	3213	Frankolovo
00050000-5638-7e60-d881-84d3f041a5f1	1274	Gabrovka
00050000-5638-7e60-a74d-a5f09e049a61	8254	Globoko
00050000-5638-7e60-9e4f-18a3cdde8c55	5275	Godovič
00050000-5638-7e60-bf31-e60ead1d142a	4204	Golnik
00050000-5638-7e60-5774-75cef0c7beac	3303	Gomilsko
00050000-5638-7e60-5a5b-aed6c05d557c	4224	Gorenja vas
00050000-5638-7e60-e88d-1d3136bc5caa	3263	Gorica pri Slivnici
00050000-5638-7e60-d4ae-f4e963d9a3a0	2272	Gorišnica
00050000-5638-7e60-0038-799c5579ee5b	9250	Gornja Radgona
00050000-5638-7e60-adb3-0697202b91ea	3342	Gornji Grad
00050000-5638-7e60-3b51-1c5a14694a7d	4282	Gozd Martuljek
00050000-5638-7e60-bd81-74cca4bd36ce	6272	Gračišče
00050000-5638-7e60-7d66-39c780153e65	9264	Grad
00050000-5638-7e60-8993-fe871f7a6d65	8332	Gradac
00050000-5638-7e60-0486-32cc5f5adf20	1384	Grahovo
00050000-5638-7e60-6238-1933c645c756	5242	Grahovo ob Bači
00050000-5638-7e60-2659-253819de986c	5251	Grgar
00050000-5638-7e60-1a39-4f5afa2fe470	3302	Griže
00050000-5638-7e60-e97a-9fcdd7a904ac	3231	Grobelno
00050000-5638-7e60-e051-7899a3e80472	1290	Grosuplje
00050000-5638-7e60-c4f0-d97a3e83e12a	2288	Hajdina
00050000-5638-7e60-85a4-dee4ed454f4e	8362	Hinje
00050000-5638-7e60-c831-f7b35f6a57a9	2311	Hoče
00050000-5638-7e60-c3d2-e7d04c975d1b	9205	Hodoš/Hodos
00050000-5638-7e60-bb85-259984db35d7	1354	Horjul
00050000-5638-7e60-198c-b52d65cb20fe	1372	Hotedršica
00050000-5638-7e60-bc51-4ffd873628d2	1430	Hrastnik
00050000-5638-7e60-db4b-ccb6ad98036c	6225	Hruševje
00050000-5638-7e60-c110-94fa1786e1e8	4276	Hrušica
00050000-5638-7e60-ec5e-ee218f267611	5280	Idrija
00050000-5638-7e60-3607-e34aa7a5f240	1292	Ig
00050000-5638-7e60-f36a-a76eadb963c2	6250	Ilirska Bistrica
00050000-5638-7e60-a014-07134fc2983b	6251	Ilirska Bistrica-Trnovo
00050000-5638-7e60-a321-f199293f7b7d	1295	Ivančna Gorica
00050000-5638-7e60-ba3d-a7d60b8a9aa5	2259	Ivanjkovci
00050000-5638-7e60-9e4c-f6a5b90f3167	1411	Izlake
00050000-5638-7e60-0f66-a6c42eb63a00	6310	Izola/Isola
00050000-5638-7e60-b526-0d30e4c39940	2222	Jakobski Dol
00050000-5638-7e60-3ce2-c8546ab8bfe6	2221	Jarenina
00050000-5638-7e60-9fd5-41ec3002c468	6254	Jelšane
00050000-5638-7e60-eb3c-fdfe5872ef57	4270	Jesenice
00050000-5638-7e60-e3ff-b573d895aed7	8261	Jesenice na Dolenjskem
00050000-5638-7e60-f864-3a1c422ff5cc	3273	Jurklošter
00050000-5638-7e60-605a-4032971dbb7c	2223	Jurovski Dol
00050000-5638-7e60-cfc0-f1f8a5e2f2a3	2256	Juršinci
00050000-5638-7e60-da01-f3688bcb0496	5214	Kal nad Kanalom
00050000-5638-7e60-8d26-8947d36a2909	3233	Kalobje
00050000-5638-7e60-e526-88701d81cd81	4246	Kamna Gorica
00050000-5638-7e60-b230-ff19fb9d261d	2351	Kamnica
00050000-5638-7e60-88f0-1e4441a968ae	1241	Kamnik
00050000-5638-7e60-6629-fae16f63b75d	5213	Kanal
00050000-5638-7e60-2175-57af4369cb89	8258	Kapele
00050000-5638-7e60-8069-f976b61e7129	2362	Kapla
00050000-5638-7e60-6b9e-26177449d861	2325	Kidričevo
00050000-5638-7e60-d922-daab0f58af82	1412	Kisovec
00050000-5638-7e60-ab05-a35482037406	6253	Knežak
00050000-5638-7e60-bc4c-5f490af146b9	5222	Kobarid
00050000-5638-7e60-25be-a98e900ab4f9	9227	Kobilje
00050000-5638-7e60-a69b-16a2e3d1a608	1330	Kočevje
00050000-5638-7e60-be68-c9ccecff8970	1338	Kočevska Reka
00050000-5638-7e60-58f9-20291e9ab487	2276	Kog
00050000-5638-7e60-2e3c-d484e104a39a	5211	Kojsko
00050000-5638-7e60-8715-fb64bb167d37	6223	Komen
00050000-5638-7e60-2014-1f217b7dc732	1218	Komenda
00050000-5638-7e60-e162-49bbb64d7cf8	6000	Koper/Capodistria 
00050000-5638-7e60-f547-49e39d486c9b	6001	Koper/Capodistria - poštni predali
00050000-5638-7e60-1b32-fd9035400ca4	8282	Koprivnica
00050000-5638-7e60-c797-b63414e39c64	5296	Kostanjevica na Krasu
00050000-5638-7e60-8eba-ee77c06bd2aa	8311	Kostanjevica na Krki
00050000-5638-7e60-c192-c5be2e9b031e	1336	Kostel
00050000-5638-7e60-0d1e-a8f11ee36b6e	6256	Košana
00050000-5638-7e60-0da2-abfac5f3dc08	2394	Kotlje
00050000-5638-7e60-bf08-539bad1085b4	6240	Kozina
00050000-5638-7e60-8db4-d7c5e4084b47	3260	Kozje
00050000-5638-7e60-51e7-cc7036c10d6d	4000	Kranj 
00050000-5638-7e60-0011-e49f3c6ae147	4001	Kranj - poštni predali
00050000-5638-7e60-a0da-e106af6d8380	4280	Kranjska Gora
00050000-5638-7e60-acb3-2215a672f870	1281	Kresnice
00050000-5638-7e60-3476-364002b370d8	4294	Križe
00050000-5638-7e60-4855-a02c906cb5b7	9206	Križevci
00050000-5638-7e60-c6b3-6a70779b05c3	9242	Križevci pri Ljutomeru
00050000-5638-7e60-e123-17068ea8e679	1301	Krka
00050000-5638-7e60-f149-a82b600d1e2f	8296	Krmelj
00050000-5638-7e60-a0f0-6f10fcf0c261	4245	Kropa
00050000-5638-7e60-81de-2ab792e6871a	8262	Krška vas
00050000-5638-7e60-eb3a-d2c2e6ae20b8	8270	Krško
00050000-5638-7e60-eaae-a02126f3d5f2	9263	Kuzma
00050000-5638-7e60-4316-9cd700142bf4	2318	Laporje
00050000-5638-7e60-4e5c-a485eb566731	3270	Laško
00050000-5638-7e60-f311-7a136a53ff01	1219	Laze v Tuhinju
00050000-5638-7e60-1cc2-30c3847c9a13	2230	Lenart v Slovenskih goricah
00050000-5638-7e60-b169-cfe858bd7439	9220	Lendava/Lendva
00050000-5638-7e60-aa82-24a417b49ca2	4248	Lesce
00050000-5638-7e60-0648-6c63de295edc	3261	Lesično
00050000-5638-7e60-a263-8d941e218086	8273	Leskovec pri Krškem
00050000-5638-7e60-9750-561b265037e9	2372	Libeliče
00050000-5638-7e60-03d8-e66e9a000985	2341	Limbuš
00050000-5638-7e60-ad12-40dd900818a1	1270	Litija
00050000-5638-7e60-1a75-a9daf4ab485b	3202	Ljubečna
00050000-5638-7e60-dd3a-9c0e82d19686	1000	Ljubljana 
00050000-5638-7e60-5268-390d25ddf532	1001	Ljubljana - poštni predali
00050000-5638-7e60-af89-4c6c22bff77f	1231	Ljubljana - Črnuče
00050000-5638-7e60-ae36-bbdfc7846683	1261	Ljubljana - Dobrunje
00050000-5638-7e60-babc-a40737ac3f99	1260	Ljubljana - Polje
00050000-5638-7e60-7460-07c6dc94b7ed	1210	Ljubljana - Šentvid
00050000-5638-7e60-bab6-396e015191df	1211	Ljubljana - Šmartno
00050000-5638-7e60-58e0-f852e3bda55f	3333	Ljubno ob Savinji
00050000-5638-7e60-7e57-beca987dadea	9240	Ljutomer
00050000-5638-7e60-7d46-bd02cf081245	3215	Loče
00050000-5638-7e60-f0e5-026f23c96181	5231	Log pod Mangartom
00050000-5638-7e60-f48b-7308be0525b8	1358	Log pri Brezovici
00050000-5638-7e60-22db-8406170e1e51	1370	Logatec
00050000-5638-7e60-816a-4e4b33e43f76	1371	Logatec
00050000-5638-7e60-aa3f-5465c75a1a5a	1434	Loka pri Zidanem Mostu
00050000-5638-7e60-574f-80aaddce2bcb	3223	Loka pri Žusmu
00050000-5638-7e60-3f67-5b4ce96703f7	6219	Lokev
00050000-5638-7e60-957c-daa341977676	1318	Loški Potok
00050000-5638-7e60-f450-8323b0282edd	2324	Lovrenc na Dravskem polju
00050000-5638-7e60-ec2c-0eeeb07ecce4	2344	Lovrenc na Pohorju
00050000-5638-7e60-97c7-86059b2a9d02	3334	Luče
00050000-5638-7e60-d51a-948adfab937f	1225	Lukovica
00050000-5638-7e60-8266-47fb834e61e5	9202	Mačkovci
00050000-5638-7e60-303e-909b57e1e3a9	2322	Majšperk
00050000-5638-7e60-853d-142b3a9a7a6f	2321	Makole
00050000-5638-7e60-46ec-0fb3886ba3cd	9243	Mala Nedelja
00050000-5638-7e60-446d-494feadfae5a	2229	Malečnik
00050000-5638-7e60-dec1-542ac80676a8	6273	Marezige
00050000-5638-7e60-1b3b-674e92a1199d	2000	Maribor 
00050000-5638-7e60-fd89-88c24359407d	2001	Maribor - poštni predali
00050000-5638-7e60-a658-c30decd9c6ea	2206	Marjeta na Dravskem polju
00050000-5638-7e60-f5ce-6c2db978239e	2281	Markovci
00050000-5638-7e60-ef78-701515242fa4	9221	Martjanci
00050000-5638-7e60-99d9-f53799549bd4	6242	Materija
00050000-5638-7e60-db49-67d1889cb0ef	4211	Mavčiče
00050000-5638-7e60-ab6f-0383ee7b7b96	1215	Medvode
00050000-5638-7e60-6b0c-b58d0c3b4dd4	1234	Mengeš
00050000-5638-7e60-a191-8263923bc611	8330	Metlika
00050000-5638-7e60-261e-d3788e4a72fc	2392	Mežica
00050000-5638-7e60-027c-bdff93941bfb	2204	Miklavž na Dravskem polju
00050000-5638-7e60-8684-324d17e8f80e	2275	Miklavž pri Ormožu
00050000-5638-7e60-e1c6-c507f7164fb7	5291	Miren
00050000-5638-7e60-7f3c-af3f71c5a35e	8233	Mirna
00050000-5638-7e60-e743-30f45120f046	8216	Mirna Peč
00050000-5638-7e60-125c-ed0f17ec2532	2382	Mislinja
00050000-5638-7e60-7d73-193218ee8c79	4281	Mojstrana
00050000-5638-7e60-7af4-b42df19cf6a1	8230	Mokronog
00050000-5638-7e60-7170-d7b579a599df	1251	Moravče
00050000-5638-7e60-ff0c-ba15545edb0b	9226	Moravske Toplice
00050000-5638-7e60-d8b2-924552333b7d	5216	Most na Soči
00050000-5638-7e60-ea73-8f25f10cc547	1221	Motnik
00050000-5638-7e60-f282-bb74118c2f38	3330	Mozirje
00050000-5638-7e60-a4c2-910e105bd932	9000	Murska Sobota 
00050000-5638-7e60-df92-cb9227aa2658	9001	Murska Sobota - poštni predali
00050000-5638-7e60-ee3b-17818cc50f09	2366	Muta
00050000-5638-7e60-2915-6518da7f4bd9	4202	Naklo
00050000-5638-7e60-9b2b-9f641f2ab84f	3331	Nazarje
00050000-5638-7e60-1514-8a0be54595bc	1357	Notranje Gorice
00050000-5638-7e60-d41e-4120ccf57d04	3203	Nova Cerkev
00050000-5638-7e60-840c-c41586bfbced	5000	Nova Gorica 
00050000-5638-7e60-e7e8-708c0fd32c7d	5001	Nova Gorica - poštni predali
00050000-5638-7e60-73bd-1417ddd83d77	1385	Nova vas
00050000-5638-7e60-3611-e2466025aa0e	8000	Novo mesto
00050000-5638-7e60-8509-db0c6a9db445	8001	Novo mesto - poštni predali
00050000-5638-7e60-b094-5483b87749b1	6243	Obrov
00050000-5638-7e60-9846-a6a9b38caef0	9233	Odranci
00050000-5638-7e60-3af9-a61f77907229	2317	Oplotnica
00050000-5638-7e60-db16-3aa0e8a8d347	2312	Orehova vas
00050000-5638-7e60-325a-8cab11e015c8	2270	Ormož
00050000-5638-7e60-ddba-dab78727658a	1316	Ortnek
00050000-5638-7e60-a8bf-bdc1fe34c5b5	1337	Osilnica
00050000-5638-7e60-253c-a651f677a94c	8222	Otočec
00050000-5638-7e60-5214-547e1148402d	2361	Ožbalt
00050000-5638-7e60-3df9-4025709c81c3	2231	Pernica
00050000-5638-7e60-6b9d-2505aa76efa2	2211	Pesnica pri Mariboru
00050000-5638-7e60-3686-9c50f68bab26	9203	Petrovci
00050000-5638-7e60-720c-771be4511365	3301	Petrovče
00050000-5638-7e60-02af-213c42c72b97	6330	Piran/Pirano
00050000-5638-7e60-89f8-4b96c041eb19	8255	Pišece
00050000-5638-7e60-6718-d4fb85809d66	6257	Pivka
00050000-5638-7e60-7d82-37bd495a88e5	6232	Planina
00050000-5638-7e60-7299-b491f19ff1cb	3225	Planina pri Sevnici
00050000-5638-7e60-b744-a87979434621	6276	Pobegi
00050000-5638-7e60-393c-a9f519f8d4ab	8312	Podbočje
00050000-5638-7e60-ca28-29ee8c157fa4	5243	Podbrdo
00050000-5638-7e60-36c4-3ffa00b4dceb	3254	Podčetrtek
00050000-5638-7e60-4680-a96ea9c9f344	2273	Podgorci
00050000-5638-7e60-1c66-e0315995054d	6216	Podgorje
00050000-5638-7e60-f24d-34e51ffe9929	2381	Podgorje pri Slovenj Gradcu
00050000-5638-7e60-1d4a-3d3befb6ba1a	6244	Podgrad
00050000-5638-7e60-0c54-43a5c1f9d0a8	1414	Podkum
00050000-5638-7e60-9124-f0b023020ca3	2286	Podlehnik
00050000-5638-7e60-cad5-14ce9c01b517	5272	Podnanos
00050000-5638-7e60-27e3-6b4296b0a098	4244	Podnart
00050000-5638-7e60-1440-84981d7b3d1d	3241	Podplat
00050000-5638-7e60-207c-098fc499bc88	3257	Podsreda
00050000-5638-7e60-8b9f-76c054de46e9	2363	Podvelka
00050000-5638-7e60-9b71-dbb77c1f0877	2208	Pohorje
00050000-5638-7e60-46ed-f911496d08b6	2257	Polenšak
00050000-5638-7e60-c64e-ab1b89acf36a	1355	Polhov Gradec
00050000-5638-7e60-5df7-e1452f9b699e	4223	Poljane nad Škofjo Loko
00050000-5638-7e60-b369-340de1f5f8b9	2319	Poljčane
00050000-5638-7e60-3a7f-204c2f919f45	1272	Polšnik
00050000-5638-7e60-6ebd-a3c59c7966ee	3313	Polzela
00050000-5638-7e60-2fcd-c1fa8f66374e	3232	Ponikva
00050000-5638-7e60-9da2-717b9d3c5f02	6320	Portorož/Portorose
00050000-5638-7e60-268e-b8ab2b1a44d6	6230	Postojna
00050000-5638-7e60-fcfe-117b8a80cc53	2331	Pragersko
00050000-5638-7e60-38fc-396a28a97202	3312	Prebold
00050000-5638-7e60-26af-ed087626cb82	4205	Preddvor
00050000-5638-7e60-013f-9ba0500aa8cf	6255	Prem
00050000-5638-7e60-5ff3-e02df3f2e973	1352	Preserje
00050000-5638-7e60-c9ef-1773bfbabb79	6258	Prestranek
00050000-5638-7e60-efa9-74ec61a563c1	2391	Prevalje
00050000-5638-7e60-098c-2dceb56fb5d1	3262	Prevorje
00050000-5638-7e60-ac41-b5c11bb693a2	1276	Primskovo 
00050000-5638-7e60-00f6-600a380664fb	3253	Pristava pri Mestinju
00050000-5638-7e60-db1e-d733af9aff0a	9207	Prosenjakovci/Partosfalva
00050000-5638-7e60-8f15-40d228bf5f37	5297	Prvačina
00050000-5638-7e60-9590-0c8066f9fa56	2250	Ptuj
00050000-5638-7e60-c1a0-5af42a92b327	2323	Ptujska Gora
00050000-5638-7e60-5abc-8dfbf3afdaa6	9201	Puconci
00050000-5638-7e60-daf5-0d6120acc9ae	2327	Rače
00050000-5638-7e60-a5ab-cf0e7362b057	1433	Radeče
00050000-5638-7e60-9b41-a6bbbed4071f	9252	Radenci
00050000-5638-7e60-ed3a-3124870afa76	2360	Radlje ob Dravi
00050000-5638-7e60-365f-7dd904d6d056	1235	Radomlje
00050000-5638-7e60-5fa1-6d8725029444	4240	Radovljica
00050000-5638-7e60-3a8a-79816c104ea8	8274	Raka
00050000-5638-7e60-cd98-20ba13e853ef	1381	Rakek
00050000-5638-7e60-b864-826de65bc6e8	4283	Rateče - Planica
00050000-5638-7e60-e2aa-49e4ce8d5b53	2390	Ravne na Koroškem
00050000-5638-7e60-1064-5337d1ddda93	9246	Razkrižje
00050000-5638-7e60-2569-04fd707a9632	3332	Rečica ob Savinji
00050000-5638-7e60-c68b-2708323a9ce1	5292	Renče
00050000-5638-7e60-acb7-b14085b54ac7	1310	Ribnica
00050000-5638-7e60-be47-7f1c1934ccc2	2364	Ribnica na Pohorju
00050000-5638-7e60-5aae-34cf71d6834b	3272	Rimske Toplice
00050000-5638-7e60-4b35-0506c7103aec	1314	Rob
00050000-5638-7e60-3278-d18b8829adfc	5215	Ročinj
00050000-5638-7e60-1aa2-6d5b8e1103ee	3250	Rogaška Slatina
00050000-5638-7e60-b5e7-7df0f8c07887	9262	Rogašovci
00050000-5638-7e60-d4a2-36c9e1c16c34	3252	Rogatec
00050000-5638-7e60-df1e-41d4e8a4e664	1373	Rovte
00050000-5638-7e60-99de-d8a1d4916690	2342	Ruše
00050000-5638-7e60-ffaf-e34b11d86dc2	1282	Sava
00050000-5638-7e60-7c5b-7504cdb23f18	6333	Sečovlje/Sicciole
00050000-5638-7e60-e5b0-a53e5ef788b8	4227	Selca
00050000-5638-7e60-21dd-72ea52057ef5	2352	Selnica ob Dravi
00050000-5638-7e60-f0fe-b4d7ad086b09	8333	Semič
00050000-5638-7e60-3dbc-b761b56b5001	8281	Senovo
00050000-5638-7e60-91c2-4823603c6492	6224	Senožeče
00050000-5638-7e60-5458-254388a443d8	8290	Sevnica
00050000-5638-7e60-941f-4acfa79ce487	6210	Sežana
00050000-5638-7e60-af4b-1f47b6849b95	2214	Sladki Vrh
00050000-5638-7e60-5cf0-f30a9e501084	5283	Slap ob Idrijci
00050000-5638-7e60-c7c7-526204cac00c	2380	Slovenj Gradec
00050000-5638-7e60-8340-6d08f9b0ee87	2310	Slovenska Bistrica
00050000-5638-7e60-9f15-bfe6744d1aad	3210	Slovenske Konjice
00050000-5638-7e60-93a7-fa02423738c8	1216	Smlednik
00050000-5638-7e60-1c72-c03ae8aa3ec4	5232	Soča
00050000-5638-7e60-f389-77dc9ac3e83e	1317	Sodražica
00050000-5638-7e60-f19e-700265c71fc6	3335	Solčava
00050000-5638-7e60-1f20-54c38b9beef7	5250	Solkan
00050000-5638-7e60-786a-1fbb73c8febc	4229	Sorica
00050000-5638-7e60-e78c-50409db83c3f	4225	Sovodenj
00050000-5638-7e60-fb21-5f99518b84fa	5281	Spodnja Idrija
00050000-5638-7e60-1d5d-8c318d3c8775	2241	Spodnji Duplek
00050000-5638-7e60-94dc-012268b451c9	9245	Spodnji Ivanjci
00050000-5638-7e60-8364-7d24602c10f7	2277	Središče ob Dravi
00050000-5638-7e60-e544-d0febb8829dc	4267	Srednja vas v Bohinju
00050000-5638-7e60-8d44-2fd120d38916	8256	Sromlje 
00050000-5638-7e60-a1c9-2eb7d41e9620	5224	Srpenica
00050000-5638-7e60-ffa6-22ffc2e14e5b	1242	Stahovica
00050000-5638-7e60-6191-8be245b3e643	1332	Stara Cerkev
00050000-5638-7e60-0d95-9fbf8220cdf1	8342	Stari trg ob Kolpi
00050000-5638-7e60-6343-d388afae218c	1386	Stari trg pri Ložu
00050000-5638-7e60-c799-ad9ebc3698d9	2205	Starše
00050000-5638-7e60-4fed-abf6af3025b3	2289	Stoperce
00050000-5638-7e60-abe3-174d9173804d	8322	Stopiče
00050000-5638-7e60-1e8d-de88467e56cd	3206	Stranice
00050000-5638-7e60-23bc-f55949bd114b	8351	Straža
00050000-5638-7e60-5c74-a7e1ba697efa	1313	Struge
00050000-5638-7e60-4587-782d255d6e4e	8293	Studenec
00050000-5638-7e60-ec23-cca39fbaa058	8331	Suhor
00050000-5638-7e60-323d-11498d55c642	2233	Sv. Ana v Slovenskih goricah
00050000-5638-7e60-051c-d718f6d9a5e4	2235	Sv. Trojica v Slovenskih goricah
00050000-5638-7e60-e4ac-012fd77cd459	2353	Sveti Duh na Ostrem Vrhu
00050000-5638-7e60-dc02-9f01b2de7e03	9244	Sveti Jurij ob Ščavnici
00050000-5638-7e60-2e4e-74b0fa13f52a	3264	Sveti Štefan
00050000-5638-7e60-af2e-2e47df454ee7	2258	Sveti Tomaž
00050000-5638-7e60-1719-5971e0329ff1	9204	Šalovci
00050000-5638-7e60-044d-a337139426fa	5261	Šempas
00050000-5638-7e60-86e4-765879802c6c	5290	Šempeter pri Gorici
00050000-5638-7e60-4245-363778987c7d	3311	Šempeter v Savinjski dolini
00050000-5638-7e60-bf64-e7471296ab6c	4208	Šenčur
00050000-5638-7e60-d9d8-9c6a4afc1c40	2212	Šentilj v Slovenskih goricah
00050000-5638-7e60-88dc-526b5d08aae3	8297	Šentjanž
00050000-5638-7e60-4e1b-730ff6556a35	2373	Šentjanž pri Dravogradu
00050000-5638-7e60-17a1-72ecbc375930	8310	Šentjernej
00050000-5638-7e60-466e-247f5b223fea	3230	Šentjur
00050000-5638-7e60-fc1c-cf2e289592f3	3271	Šentrupert
00050000-5638-7e60-5c0a-19935b2acf12	8232	Šentrupert
00050000-5638-7e60-ce2e-d7b0538f019c	1296	Šentvid pri Stični
00050000-5638-7e60-d843-955ac2dccfc2	8275	Škocjan
00050000-5638-7e60-c25e-5c2a58d68fcb	6281	Škofije
00050000-5638-7e60-a929-e52d2bffae65	4220	Škofja Loka
00050000-5638-7e60-ae23-8dcaee0aacf9	3211	Škofja vas
00050000-5638-7e60-530b-87f2cb4a10da	1291	Škofljica
00050000-5638-7e60-af8e-1c8d4be303bc	6274	Šmarje
00050000-5638-7e60-9399-971ca490e2ab	1293	Šmarje - Sap
00050000-5638-7e60-523c-1b6a0d95456b	3240	Šmarje pri Jelšah
00050000-5638-7e60-22bf-52704f18b009	8220	Šmarješke Toplice
00050000-5638-7e60-93a2-605b4c03a65f	2315	Šmartno na Pohorju
00050000-5638-7e60-99f1-52cfee93c087	3341	Šmartno ob Dreti
00050000-5638-7e60-479f-9933694d0f29	3327	Šmartno ob Paki
00050000-5638-7e60-85de-19642f1f0795	1275	Šmartno pri Litiji
00050000-5638-7e60-66b1-f634fb8851a4	2383	Šmartno pri Slovenj Gradcu
00050000-5638-7e60-8cc1-69bba2879f6f	3201	Šmartno v Rožni dolini
00050000-5638-7e60-225d-4d2e516f3100	3325	Šoštanj
00050000-5638-7e60-7941-04230ad85d11	6222	Štanjel
00050000-5638-7e60-05f8-65d3be2b60b5	3220	Štore
00050000-5638-7e60-9a76-e6860d47535d	3304	Tabor
00050000-5638-7e60-7ad1-825a6d5d5d30	3221	Teharje
00050000-5638-7e60-3920-70c59e6163f9	9251	Tišina
00050000-5638-7e60-3399-33552f09556a	5220	Tolmin
00050000-5638-7e60-d2a7-fea47037dbaf	3326	Topolšica
00050000-5638-7e60-09b3-eb580a5b72b2	2371	Trbonje
00050000-5638-7e60-6cf4-aa49564d66f9	1420	Trbovlje
00050000-5638-7e60-26e7-54cda2995bd7	8231	Trebelno 
00050000-5638-7e60-1bbb-53c5ee649e0a	8210	Trebnje
00050000-5638-7e60-6d57-96bcff857543	5252	Trnovo pri Gorici
00050000-5638-7e60-4a8b-27c6c49c5175	2254	Trnovska vas
00050000-5638-7e60-e2c6-e2f07db465ee	1222	Trojane
00050000-5638-7e60-be02-a2ccbbd5fe65	1236	Trzin
00050000-5638-7e60-540e-5fa05a9a9445	4290	Tržič
00050000-5638-7e60-8e30-9f84b9e48f7d	8295	Tržišče
00050000-5638-7e60-4f30-4b9f47d851ae	1311	Turjak
00050000-5638-7e60-b616-4326d90a4dbe	9224	Turnišče
00050000-5638-7e60-4c5a-62711d8c1ed3	8323	Uršna sela
00050000-5638-7e60-be9a-d2fef2b6213b	1252	Vače
00050000-5638-7e60-be93-375ba003aa14	3320	Velenje 
00050000-5638-7e60-96ad-d40fa9279990	3322	Velenje - poštni predali
00050000-5638-7e60-dc20-aa8d55e8c23c	8212	Velika Loka
00050000-5638-7e60-fd57-6299465fe571	2274	Velika Nedelja
00050000-5638-7e60-2c2a-4afa0c667eb4	9225	Velika Polana
00050000-5638-7e60-be79-4e816e0d0af1	1315	Velike Lašče
00050000-5638-7e60-78a0-59e963a105b9	8213	Veliki Gaber
00050000-5638-7e60-4c39-f36475a11de5	9241	Veržej
00050000-5638-7e60-d068-354d0d5be406	1312	Videm - Dobrepolje
00050000-5638-7e60-28cc-8c07f1ce4540	2284	Videm pri Ptuju
00050000-5638-7e60-810d-855ebdd37efe	8344	Vinica
00050000-5638-7e60-92ac-cd8a7a5456ff	5271	Vipava
00050000-5638-7e60-c1d4-6270493bba2f	4212	Visoko
00050000-5638-7e60-456c-c0f85d6eb29f	1294	Višnja Gora
00050000-5638-7e60-c45f-4063fd44ea1e	3205	Vitanje
00050000-5638-7e60-cadb-64b206e9999c	2255	Vitomarci
00050000-5638-7e60-e124-7f81e95c6836	1217	Vodice
00050000-5638-7e60-cdee-6f8ab0158d30	3212	Vojnik\t
00050000-5638-7e60-6e6c-900326b02d30	5293	Volčja Draga
00050000-5638-7e60-9b11-bc3429be368d	2232	Voličina
00050000-5638-7e60-70f5-51d6f3f43783	3305	Vransko
00050000-5638-7e60-f1c0-c6bf370d4813	6217	Vremski Britof
00050000-5638-7e60-3bbf-7abe7fa6f50b	1360	Vrhnika
00050000-5638-7e60-370d-03a3b8f9c8b1	2365	Vuhred
00050000-5638-7e60-08d0-f2e78d1185b5	2367	Vuzenica
00050000-5638-7e60-4a95-8be59774996f	8292	Zabukovje 
00050000-5638-7e60-e7f7-51963a3030ee	1410	Zagorje ob Savi
00050000-5638-7e60-f9b2-44d9be4ec2aa	1303	Zagradec
00050000-5638-7e60-edfc-7ab31e4582df	2283	Zavrč
00050000-5638-7e60-2502-bae3eaa934d7	8272	Zdole 
00050000-5638-7e60-e8ee-50ac0e83faed	4201	Zgornja Besnica
00050000-5638-7e60-3115-08a2004bcf18	2242	Zgornja Korena
00050000-5638-7e60-3e08-f489f5b89537	2201	Zgornja Kungota
00050000-5638-7e60-8a59-2fbec741f60d	2316	Zgornja Ložnica
00050000-5638-7e60-b974-64b976e5fe7f	2314	Zgornja Polskava
00050000-5638-7e60-5a68-d3f14d917461	2213	Zgornja Velka
00050000-5638-7e60-c49b-65d48fbcdcff	4247	Zgornje Gorje
00050000-5638-7e60-a8fc-951ea839d885	4206	Zgornje Jezersko
00050000-5638-7e60-bd4e-0dd3b8a542f1	2285	Zgornji Leskovec
00050000-5638-7e60-aad9-1b88308e29c3	1432	Zidani Most
00050000-5638-7e60-4787-b6fafda981c2	3214	Zreče
00050000-5638-7e60-b119-01ae35c44781	4209	Žabnica
00050000-5638-7e60-ddf3-d26fec14e3c5	3310	Žalec
00050000-5638-7e60-0b6b-0cf01603a5a4	4228	Železniki
00050000-5638-7e60-b32f-052c910003ad	2287	Žetale
00050000-5638-7e60-d447-2a5caca07e83	4226	Žiri
00050000-5638-7e60-bfc8-27cea0daae5e	4274	Žirovnica
00050000-5638-7e60-6897-d863a75d1b49	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 25114177)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 25113753)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 25113501)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5638-7e63-a3d2-5efa971ed977	00080000-5638-7e63-c7ab-a56da22a9ac9	\N	00040000-5638-7e61-28a6-9ca9a90f301d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5638-7e63-fd0c-a34f832b7a17	00080000-5638-7e63-c7ab-a56da22a9ac9	\N	00040000-5638-7e61-28a6-9ca9a90f301d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5638-7e63-f671-520019ac38ab	00080000-5638-7e63-7025-c2c2b3570459	\N	00040000-5638-7e61-28a6-9ca9a90f301d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3120 (class 0 OID 25113645)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5638-7e61-ba27-f9952027073d	novo leto	1	1	\N	t
00430000-5638-7e61-6dd3-5d37bd7195a8	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5638-7e61-e333-ba4e644640a6	dan upora proti okupatorju	27	4	\N	t
00430000-5638-7e61-dced-13c794e7a08b	praznik dela	1	5	\N	t
00430000-5638-7e61-5bde-f2ad7ffb9154	praznik dela	2	5	\N	t
00430000-5638-7e61-5e45-b3a6d28c838f	dan Primoža Trubarja	8	6	\N	f
00430000-5638-7e61-bf94-439476b404bd	dan državnosti	25	6	\N	t
00430000-5638-7e61-68c0-7f6f44a53227	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5638-7e61-03dd-dea13201fa28	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5638-7e61-0998-34c65425148b	dan suverenosti	25	10	\N	f
00430000-5638-7e61-bd49-350051e4e328	dan spomina na mrtve	1	11	\N	t
00430000-5638-7e61-bef5-a03fa0388820	dan Rudolfa Maistra	23	11	\N	f
00430000-5638-7e61-63d5-b05068d7f3bd	božič	25	12	\N	t
00430000-5638-7e61-1602-207851c560ca	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5638-7e61-4b8b-0effbfdd230e	Marijino vnebovzetje	15	8	\N	t
00430000-5638-7e61-53ca-b458a39a891e	dan reformacije	31	10	\N	t
00430000-5638-7e61-7969-179867f66d60	velikonočna nedelja	27	3	2016	t
00430000-5638-7e61-0f14-efc52f41d7ca	velikonočna nedelja	16	4	2017	t
00430000-5638-7e61-fb4f-c8983d469805	velikonočna nedelja	1	4	2018	t
00430000-5638-7e61-794d-8e2a66d117a1	velikonočna nedelja	21	4	2019	t
00430000-5638-7e61-f500-1a8651c5c9f7	velikonočna nedelja	12	4	2020	t
00430000-5638-7e61-a348-8056de72acc0	velikonočna nedelja	4	4	2021	t
00430000-5638-7e61-ed17-089624223b57	velikonočna nedelja	17	4	2022	t
00430000-5638-7e61-890c-20db70c6f3db	velikonočna nedelja	9	4	2023	t
00430000-5638-7e61-837f-2ada947e509a	velikonočna nedelja	31	3	2024	t
00430000-5638-7e61-74e1-391f7873a6c9	velikonočna nedelja	20	4	2025	t
00430000-5638-7e61-e587-4ea25aca4e84	velikonočna nedelja	5	4	2026	t
00430000-5638-7e61-0e6a-5babfd18aeae	velikonočna nedelja	28	3	2027	t
00430000-5638-7e61-1232-f985aad955f1	velikonočna nedelja	16	4	2028	t
00430000-5638-7e61-5d70-be558d9daa4d	velikonočna nedelja	1	4	2029	t
00430000-5638-7e61-ce6b-328aa0205356	velikonočna nedelja	21	4	2030	t
00430000-5638-7e61-a519-678fe9b24c7b	velikonočni ponedeljek	28	3	2016	t
00430000-5638-7e61-ca9b-6701d821c3c4	velikonočni ponedeljek	17	4	2017	t
00430000-5638-7e61-5ff2-76b5e6eeef38	velikonočni ponedeljek	2	4	2018	t
00430000-5638-7e61-9a3c-bcc2e315add4	velikonočni ponedeljek	22	4	2019	t
00430000-5638-7e61-c08c-bf23e0c890ad	velikonočni ponedeljek	13	4	2020	t
00430000-5638-7e61-8437-1af66259406a	velikonočni ponedeljek	5	4	2021	t
00430000-5638-7e61-13f2-ea822ee7389f	velikonočni ponedeljek	18	4	2022	t
00430000-5638-7e61-09e7-07de033f5d90	velikonočni ponedeljek	10	4	2023	t
00430000-5638-7e61-4f79-00d86db6b292	velikonočni ponedeljek	1	4	2024	t
00430000-5638-7e61-1406-c5dab9a9b657	velikonočni ponedeljek	21	4	2025	t
00430000-5638-7e61-7ad8-958e1ba254be	velikonočni ponedeljek	6	4	2026	t
00430000-5638-7e61-a50d-5cb7fffd43a4	velikonočni ponedeljek	29	3	2027	t
00430000-5638-7e61-6b11-c44aa1232598	velikonočni ponedeljek	17	4	2028	t
00430000-5638-7e61-0f2e-e30c1681a007	velikonočni ponedeljek	2	4	2029	t
00430000-5638-7e61-4ac7-c3f6f0c97238	velikonočni ponedeljek	22	4	2030	t
00430000-5638-7e61-d423-7c50b200889b	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5638-7e61-ee2e-f17cb6337784	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5638-7e61-525e-de951eaa6c46	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5638-7e61-33ab-542e3b704598	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5638-7e61-da3a-e97b35720b6a	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5638-7e61-2c86-bbaa104a2f37	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5638-7e61-bf9c-68348e8fa28e	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5638-7e61-fe78-298781f9d9b9	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5638-7e61-452f-a6500d810626	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5638-7e61-3518-f1d4d845ed1f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5638-7e61-493f-7377c35f3ec5	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5638-7e61-7782-7c289196d60a	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5638-7e61-ecfa-c00bd1f9deea	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5638-7e61-4002-648ac245d0f9	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5638-7e61-3caa-95971f643419	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 25113605)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 25113617)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 25113765)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 25114191)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 25114201)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5638-7e63-64e4-723260ff0866	00080000-5638-7e63-2c89-159fb0881770	0987	AK
00190000-5638-7e63-3131-630ed0fc94bf	00080000-5638-7e63-7025-c2c2b3570459	0989	AK
00190000-5638-7e63-d419-06d5b05d65db	00080000-5638-7e63-146d-422256d87d59	0986	AK
00190000-5638-7e63-b679-72a87176e333	00080000-5638-7e63-cb8a-97d7e8786475	0984	AK
00190000-5638-7e63-929a-474bc9de3841	00080000-5638-7e63-cfc2-94a996b1fa27	0983	AK
00190000-5638-7e63-dcca-3f4a418db5c2	00080000-5638-7e63-5d2a-a43539251a76	0982	AK
00190000-5638-7e64-cf26-97782ef33168	00080000-5638-7e64-4695-f6ef86695d2f	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 25114100)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5638-7e63-022e-3d47d51399bf	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3161 (class 0 OID 25114209)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 25113794)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5638-7e63-fb45-a9ed84aaa686	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5638-7e63-3454-e543d3c3888d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5638-7e63-6565-3a3a6bb71ea5	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5638-7e63-4629-83f35961413e	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5638-7e63-d92c-cc2c2cf8f108	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5638-7e63-c51f-6b698343ad9a	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5638-7e63-ca10-25ab6ebc0d85	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3129 (class 0 OID 25113738)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 25113728)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 25113939)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 25113869)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 25113579)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 25113341)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5638-7e64-4695-f6ef86695d2f	00010000-5638-7e61-6a05-0fd1d985052b	2015-11-03 10:29:08	INS	a:0:{}
2	App\\Entity\\Option	00000000-5638-7e64-9666-c07b1eb3a80a	00010000-5638-7e61-6a05-0fd1d985052b	2015-11-03 10:29:08	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5638-7e64-cf26-97782ef33168	00010000-5638-7e61-6a05-0fd1d985052b	2015-11-03 10:29:08	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 25113807)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 25113379)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5638-7e61-bd53-395cd185e2e6	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5638-7e61-f994-cbce4f9b35cd	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5638-7e61-0e38-9fe047f6673b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5638-7e61-2a5f-bfbb633cd6d2	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5638-7e61-7da7-3af5c29e0b51	planer	Planer dogodkov v koledarju	t
00020000-5638-7e61-2e43-64241ed4417c	kadrovska	Kadrovska služba	t
00020000-5638-7e61-4ea9-00d7c201af38	arhivar	Ažuriranje arhivalij	t
00020000-5638-7e61-0849-9740cabcf455	igralec	Igralec	t
00020000-5638-7e61-ca01-c414d89b61af	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5638-7e63-9b7a-19b916479157	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3095 (class 0 OID 25113363)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5638-7e61-9570-0ac239023f38	00020000-5638-7e61-0e38-9fe047f6673b
00010000-5638-7e61-6a05-0fd1d985052b	00020000-5638-7e61-0e38-9fe047f6673b
00010000-5638-7e63-44f4-c0b05be51d12	00020000-5638-7e63-9b7a-19b916479157
\.


--
-- TOC entry 3140 (class 0 OID 25113821)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 25113759)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 25113705)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5638-7e63-2cf7-ae0e2b862977	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5638-7e63-ea7c-66bac4d86f5c	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5638-7e63-0ea7-6f80dea9754a	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3091 (class 0 OID 25113328)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5638-7e60-6106-f959814a59c3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5638-7e60-0151-f9175febe1af	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5638-7e60-2ea5-6f5ca45fa689	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5638-7e60-f9ed-a62eab31a9ae	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5638-7e60-c23f-6bf543254fc8	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 25113320)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5638-7e60-4abd-43e33351b4ee	00230000-5638-7e60-f9ed-a62eab31a9ae	popa
00240000-5638-7e60-0127-00b959039cc8	00230000-5638-7e60-f9ed-a62eab31a9ae	oseba
00240000-5638-7e60-400c-eebac6980d51	00230000-5638-7e60-f9ed-a62eab31a9ae	tippopa
00240000-5638-7e60-cbd9-8acbf541ba6d	00230000-5638-7e60-f9ed-a62eab31a9ae	organizacijskaenota
00240000-5638-7e60-77b3-660bdfba1afd	00230000-5638-7e60-f9ed-a62eab31a9ae	sezona
00240000-5638-7e60-f2c0-142361c548cb	00230000-5638-7e60-f9ed-a62eab31a9ae	tipvaje
00240000-5638-7e60-2bb6-d4f79fc9df30	00230000-5638-7e60-0151-f9175febe1af	prostor
00240000-5638-7e60-0523-e0ac19e33051	00230000-5638-7e60-f9ed-a62eab31a9ae	besedilo
00240000-5638-7e60-d352-df83c429d5cc	00230000-5638-7e60-f9ed-a62eab31a9ae	uprizoritev
00240000-5638-7e60-ae45-5d6369c074eb	00230000-5638-7e60-f9ed-a62eab31a9ae	funkcija
00240000-5638-7e60-f1ee-0ae78aed08a2	00230000-5638-7e60-f9ed-a62eab31a9ae	tipfunkcije
00240000-5638-7e60-0ced-5d4dce2de6bc	00230000-5638-7e60-f9ed-a62eab31a9ae	alternacija
00240000-5638-7e60-24ec-ad2ef5bd9a46	00230000-5638-7e60-6106-f959814a59c3	pogodba
00240000-5638-7e60-ec24-f080ef73991b	00230000-5638-7e60-f9ed-a62eab31a9ae	zaposlitev
00240000-5638-7e60-1631-f38d639c0cce	00230000-5638-7e60-f9ed-a62eab31a9ae	zvrstuprizoritve
00240000-5638-7e60-5a6d-952998a73ac1	00230000-5638-7e60-6106-f959814a59c3	programdela
00240000-5638-7e60-6f4a-3bc18ada65f1	00230000-5638-7e60-f9ed-a62eab31a9ae	zapis
\.


--
-- TOC entry 3089 (class 0 OID 25113315)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5c4b963c-aeec-4c7d-a15f-dcb46e0f2894	00240000-5638-7e60-4abd-43e33351b4ee	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 25113886)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5638-7e63-49c5-7f55ada7cacf	000e0000-5638-7e63-d293-87ab983050a9	00080000-5638-7e63-c7ab-a56da22a9ac9	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5638-7e61-26f0-12017eadeac3
00270000-5638-7e63-ab54-5a6a9067505c	000e0000-5638-7e63-d293-87ab983050a9	00080000-5638-7e63-c7ab-a56da22a9ac9	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5638-7e61-26f0-12017eadeac3
\.


--
-- TOC entry 3105 (class 0 OID 25113463)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 25113715)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5638-7e63-c083-f7426fa49ee9	00180000-5638-7e63-c16d-b232a611789f	000c0000-5638-7e63-2b1c-8fb80697bab0	00090000-5638-7e63-9355-121b08f0f8cf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-7e63-079c-b6111038c756	00180000-5638-7e63-c16d-b232a611789f	000c0000-5638-7e63-1e38-cf56d5990e3a	00090000-5638-7e63-3a48-0f2955a23882	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-7e63-f392-588ea25c0ae2	00180000-5638-7e63-c16d-b232a611789f	000c0000-5638-7e63-410a-9bf3835acc65	00090000-5638-7e63-5346-163c6708fe64	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-7e63-46a2-a5e48c51e3f9	00180000-5638-7e63-c16d-b232a611789f	000c0000-5638-7e63-f757-3919bc2c4227	00090000-5638-7e63-fee8-d49d1ed07345	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-7e63-8750-0be044db2d2c	00180000-5638-7e63-c16d-b232a611789f	000c0000-5638-7e63-0f1f-50b8c01db169	00090000-5638-7e63-28d8-d65ae8650e4a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5638-7e63-d71d-9c89b4cd1109	00180000-5638-7e63-64ba-58b604fdf6f1	\N	00090000-5638-7e63-28d8-d65ae8650e4a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5638-7e63-b9bf-a7bc1e0efa12	00180000-5638-7e63-64ba-58b604fdf6f1	\N	00090000-5638-7e63-3a48-0f2955a23882	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3149 (class 0 OID 25113927)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5638-7e60-f3bb-6f8c5f4bda86	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5638-7e60-48c1-925f7b27bce0	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5638-7e60-9b57-bc2882ebe57c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5638-7e60-68d9-fe6ddef6bc31	04	Režija	Režija	Režija	umetnik	30
000f0000-5638-7e60-5556-dd3eb04b64f3	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5638-7e60-6038-67de2faff075	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5638-7e60-90ec-ae3f25bb789a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5638-7e60-db1c-33c016ee0b45	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5638-7e60-2f90-a25e43c98631	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5638-7e60-4a3c-72a92b585b53	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5638-7e60-0984-f9ed1cef66ea	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5638-7e60-75db-646a546da575	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5638-7e60-028a-c87d3fd8070b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5638-7e60-ec01-18fa3b2c9a80	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5638-7e60-b1e5-c0ed0a7564ae	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5638-7e60-a814-0324778b8ce9	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5638-7e60-4673-eed0407baa2f	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5638-7e60-0ee5-95f78eb00fe2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 25113414)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5638-7e63-b23b-d8ae4cf43aaa	0001	šola	osnovna ali srednja šola
00400000-5638-7e63-e111-ebbcdc7e3b6b	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5638-7e63-5895-4efb993ff0d4	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3162 (class 0 OID 25114220)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5638-7e60-6bec-da71198294db	01	Velika predstava	f	1.00	1.00
002b0000-5638-7e60-574b-4c60e44fc2f5	02	Mala predstava	f	0.50	0.50
002b0000-5638-7e60-1048-ac614a85d3d5	03	Mala koprodukcija	t	0.40	1.00
002b0000-5638-7e60-1180-80e680788f0d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5638-7e60-eef4-a9720af5f0f6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 25113695)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5638-7e60-6c2c-443dbcf648b5	0001	prva vaja	prva vaja
00420000-5638-7e60-da07-99fc3655d57b	0002	tehnična vaja	tehnična vaja
00420000-5638-7e60-2b9a-5cfbbffb6879	0003	lučna vaja	lučna vaja
00420000-5638-7e60-1099-0319a58c8693	0004	kostumska vaja	kostumska vaja
00420000-5638-7e60-32da-7f5956858553	0005	foto vaja	foto vaja
00420000-5638-7e60-09a8-4f116bc37dec	0006	1. glavna vaja	1. glavna vaja
00420000-5638-7e60-455c-7a8b89da7822	0007	2. glavna vaja	2. glavna vaja
00420000-5638-7e60-f0eb-add980e4b780	0008	1. generalka	1. generalka
00420000-5638-7e60-7645-c9f3b8ceab5c	0009	2. generalka	2. generalka
00420000-5638-7e60-2767-d8d4b958bb4b	0010	odprta generalka	odprta generalka
00420000-5638-7e60-16f1-0166c1055ee4	0011	obnovitvena vaja	obnovitvena vaja
00420000-5638-7e60-feed-f91adcd341a3	0012	pevska vaja	pevska vaja
00420000-5638-7e60-2fec-aaa5fc0371b1	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5638-7e60-3e26-4098b48a2be6	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 25113536)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25113350)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5638-7e61-6a05-0fd1d985052b	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROXk.Wfff.KS./jayhnXMJ4nLs3oure5u	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5638-7e63-3aab-ddd4f81aed67	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5638-7e63-763e-faa2d356472c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5638-7e63-e556-ff8e7414e356	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5638-7e63-7985-595f8dd8ad15	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5638-7e63-1c84-ce7e3d45246b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5638-7e63-ceca-66c1b37d6a76	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5638-7e63-b5b2-953e662242a1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5638-7e63-a480-a4e13eea5668	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5638-7e63-5686-019b190aa0b9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5638-7e63-44f4-c0b05be51d12	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5638-7e61-9570-0ac239023f38	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 25113977)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5638-7e63-3422-13946a4fc2d6	00160000-5638-7e63-cfde-7af1fccab39b	\N	00140000-5638-7e60-89d6-c1f4198199af	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5638-7e63-d92c-cc2c2cf8f108
000e0000-5638-7e63-d293-87ab983050a9	00160000-5638-7e63-82e1-9594f6edf8d5	\N	00140000-5638-7e60-e667-74a819eccaff	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5638-7e63-c51f-6b698343ad9a
000e0000-5638-7e63-470a-833ba472974d	\N	\N	00140000-5638-7e60-e667-74a819eccaff	00190000-5638-7e63-64e4-723260ff0866	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5638-7e63-d92c-cc2c2cf8f108
000e0000-5638-7e63-99c8-07bbf7d63e41	\N	\N	00140000-5638-7e60-e667-74a819eccaff	00190000-5638-7e63-64e4-723260ff0866	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5638-7e63-d92c-cc2c2cf8f108
000e0000-5638-7e63-9a3d-27a216711f0b	\N	\N	00140000-5638-7e60-e667-74a819eccaff	00190000-5638-7e63-64e4-723260ff0866	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5638-7e63-fb45-a9ed84aaa686
000e0000-5638-7e63-616a-7608fdf7641a	\N	\N	00140000-5638-7e60-e667-74a819eccaff	00190000-5638-7e63-64e4-723260ff0866	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5638-7e63-fb45-a9ed84aaa686
\.


--
-- TOC entry 3119 (class 0 OID 25113635)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5638-7e63-2ff4-b191d77c5e85	\N	000e0000-5638-7e63-d293-87ab983050a9	1	
00200000-5638-7e63-b700-1dc9896e1337	\N	000e0000-5638-7e63-d293-87ab983050a9	2	
00200000-5638-7e63-b4a0-fc6186f7367c	\N	000e0000-5638-7e63-d293-87ab983050a9	3	
00200000-5638-7e63-1cef-be43af3a79a5	\N	000e0000-5638-7e63-d293-87ab983050a9	4	
00200000-5638-7e63-7c9d-1799b8863478	\N	000e0000-5638-7e63-d293-87ab983050a9	5	
\.


--
-- TOC entry 3136 (class 0 OID 25113786)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 25113900)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5638-7e61-d53e-57d8210b0bd6	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5638-7e61-96f0-7914a9a27bc3	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5638-7e61-3ec6-a859adef2cc3	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5638-7e61-84a2-b6c13ee49229	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5638-7e61-f37c-4e4f3fdaf67e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5638-7e61-fa3b-1f9493076510	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5638-7e61-09cb-91c9a14338e2	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5638-7e61-204f-f20f3dcf0a9a	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5638-7e61-26f0-12017eadeac3	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5638-7e61-fde8-6b547d125824	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5638-7e61-d440-c6271b032b9c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5638-7e61-482f-e0aa45e6350d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5638-7e61-dc38-f31bad4ecbf3	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5638-7e61-d345-3020dbe25576	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5638-7e61-62f3-4e1722f75e09	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5638-7e61-c4d7-dcad86ad5f8b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5638-7e61-c0b2-aac13514a53a	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5638-7e61-8287-a3e52ec6e213	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5638-7e61-9ce7-480a0a786860	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5638-7e61-45e1-9ecf64234747	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5638-7e61-fb2a-d9d7bbc10e1e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5638-7e61-ebb9-da0bfb7ccca4	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5638-7e61-8cb2-29a246e33bd8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5638-7e61-d474-8b8ea97519f4	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5638-7e61-7930-b8ede9b51a59	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5638-7e61-77ea-061244b04249	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5638-7e61-9d17-3a90a17e03a5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5638-7e61-c3b7-b4855a33979f	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 25114267)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 25114239)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 25114279)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 25113858)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5638-7e63-f83a-5b6858a97a4a	00090000-5638-7e63-3a48-0f2955a23882	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-7e63-07de-f7cee5af022a	00090000-5638-7e63-5346-163c6708fe64	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-7e63-f279-e7e3f36ce779	00090000-5638-7e63-f940-aa840c997405	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-7e63-1d3d-3edddcebeac4	00090000-5638-7e63-f3b6-92293ca8ed6e	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-7e63-1cd4-189e3ccb3018	00090000-5638-7e63-6482-8cd7dbfeae62	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5638-7e63-7313-a8a5888e8738	00090000-5638-7e63-35aa-4abe2ce0f03f	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3122 (class 0 OID 25113679)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 25113967)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5638-7e60-89d6-c1f4198199af	01	Drama	drama (SURS 01)
00140000-5638-7e60-cc15-676b3095884f	02	Opera	opera (SURS 02)
00140000-5638-7e60-31b7-2a85bc9695f4	03	Balet	balet (SURS 03)
00140000-5638-7e60-145c-5adcbaa00ec7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5638-7e60-e733-22344e06a0dc	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5638-7e60-e667-74a819eccaff	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5638-7e60-5789-a2ed923baf5d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 25113848)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 25113413)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25114026)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 25114016)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 25113404)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 25113883)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 25113925)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 25114319)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 25113667)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 25113689)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25113694)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25114237)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 25113562)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 25114094)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 25113844)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 25113633)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 25113600)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 25113576)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 25113751)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25114296)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25114303)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 25114327)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 24507018)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2722 (class 2606 OID 25113778)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 25113534)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 25113432)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 25113496)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 25113459)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 25113393)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 25113378)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 25113784)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 25113820)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 25113962)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 25113487)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 25113522)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 25114189)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 25113757)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 25113512)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 25113652)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 25113621)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 25113613)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 25113769)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 25114198)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 25114206)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 25114176)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 25114218)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 25113802)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 25113742)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 25113733)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 25113949)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 25113876)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 25113588)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 25113349)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 25113811)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 25113367)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 25113387)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 25113829)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 25113764)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 25113713)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 25113337)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 25113325)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 25113319)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 25113896)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 25113468)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25113724)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 25113936)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 25113421)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25114230)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 25113702)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 25113547)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 25113362)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25113995)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 25113642)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 25113792)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 25113908)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 25114277)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 25114261)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 25114285)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 25113866)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 25113683)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 25113975)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 25113856)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 25113677)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 25113678)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 25113676)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 25113675)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 25113674)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 25113897)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 25113898)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 25113899)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 25114298)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 25114297)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 25113489)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 25113490)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 25113785)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 25114265)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 25114264)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 25114266)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 25114263)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 25114262)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 25113771)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 25113770)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 25113643)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 25113644)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 25113845)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 25113847)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 25113846)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 25113578)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 25113577)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 25114219)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 25113964)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 25113965)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 25113966)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 25114286)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 25114000)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 25113997)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 25114001)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 25113999)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 25113998)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 25113549)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 25113548)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 25113462)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 25113812)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 25113394)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 25113395)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 25113832)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 25113831)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 25113830)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 25113499)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 25113498)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 25113500)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 25113616)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 25113614)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 25113615)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 25113327)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 25113737)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 25113735)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 25113734)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 25113736)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 25113368)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 25113369)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 25113793)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 25114320)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 25113885)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 25113884)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 25114328)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 25114329)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 25113758)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 25113877)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 25113878)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 25114099)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 25114098)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 25114095)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 25114096)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 25114097)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 25113514)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 25113513)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 25113515)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 25113806)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 25113805)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 25114199)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 25114200)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 25114030)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 25114031)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 25114028)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 25114029)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 25113867)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 25113868)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 25113746)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 25113745)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 25113743)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 25113744)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 25114018)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 25114017)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 25113589)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 25113603)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 25113602)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 25113601)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 25113604)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 25113634)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 25113622)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 25113623)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 25114190)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 25114238)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 25114304)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 25114305)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 25113434)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 25113433)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 25113469)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 25113470)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 25113684)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 25113727)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 25113726)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 25113725)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 25113669)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 25113670)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 25113673)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 25113668)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 25113672)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 25113671)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 25113488)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 25113422)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 25113423)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 25113563)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 25113565)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 25113564)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 25113566)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 25113752)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 25113963)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 25113996)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 25113937)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 25113938)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 25113460)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 25113461)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 25113857)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 25113338)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 25113535)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 25113497)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 25113326)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 25114231)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 25113804)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 25113803)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 25113703)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 25113704)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 25114027)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 25113523)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 25113976)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 25114278)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 25114207)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 25114208)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 25113926)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 25113714)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 25113388)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2905 (class 2606 OID 25114500)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2904 (class 2606 OID 25114505)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2899 (class 2606 OID 25114530)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2901 (class 2606 OID 25114520)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2906 (class 2606 OID 25114495)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2902 (class 2606 OID 25114515)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2900 (class 2606 OID 25114525)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2903 (class 2606 OID 25114510)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2942 (class 2606 OID 25114700)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 25114705)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2940 (class 2606 OID 25114710)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2974 (class 2606 OID 25114875)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2975 (class 2606 OID 25114870)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 25114385)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2877 (class 2606 OID 25114390)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 25114615)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2969 (class 2606 OID 25114855)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 25114850)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2968 (class 2606 OID 25114860)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 25114845)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 25114840)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2921 (class 2606 OID 25114610)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2922 (class 2606 OID 25114605)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2898 (class 2606 OID 25114485)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2897 (class 2606 OID 25114490)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 25114655)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 25114665)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 25114660)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2887 (class 2606 OID 25114440)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 25114435)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 25114595)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 25114830)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2945 (class 2606 OID 25114715)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 25114720)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2943 (class 2606 OID 25114725)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 25114865)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2947 (class 2606 OID 25114745)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 25114730)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2946 (class 2606 OID 25114750)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 25114740)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2949 (class 2606 OID 25114735)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2885 (class 2606 OID 25114430)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 25114425)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 25114370)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2874 (class 2606 OID 25114365)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 25114635)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2870 (class 2606 OID 25114345)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 25114350)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2928 (class 2606 OID 25114650)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 25114645)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 25114640)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 25114400)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2881 (class 2606 OID 25114395)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2879 (class 2606 OID 25114405)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 25114465)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 25114455)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 25114460)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 25114330)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2911 (class 2606 OID 25114570)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2913 (class 2606 OID 25114560)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2914 (class 2606 OID 25114555)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2912 (class 2606 OID 25114565)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2868 (class 2606 OID 25114335)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 25114340)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 25114620)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 25114890)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 25114695)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 25114690)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2980 (class 2606 OID 25114895)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 25114900)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 25114600)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2937 (class 2606 OID 25114680)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2936 (class 2606 OID 25114685)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 25114805)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 25114800)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 25114785)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 25114790)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 25114795)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 25114415)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 25114410)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 25114420)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2925 (class 2606 OID 25114630)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2926 (class 2606 OID 25114625)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 25114815)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2963 (class 2606 OID 25114820)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 25114775)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 25114780)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2956 (class 2606 OID 25114765)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2955 (class 2606 OID 25114770)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 25114670)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 25114675)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2915 (class 2606 OID 25114590)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2916 (class 2606 OID 25114585)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2918 (class 2606 OID 25114575)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2917 (class 2606 OID 25114580)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2951 (class 2606 OID 25114760)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 25114755)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 25114445)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 25114450)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 25114480)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2895 (class 2606 OID 25114470)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 25114475)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 25114810)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 25114825)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 25114835)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2977 (class 2606 OID 25114880)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 25114885)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 25114360)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 25114355)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2876 (class 2606 OID 25114375)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 25114380)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 25114535)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 25114550)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 25114545)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2910 (class 2606 OID 25114540)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-03 10:29:10 CET

--
-- PostgreSQL database dump complete
--

