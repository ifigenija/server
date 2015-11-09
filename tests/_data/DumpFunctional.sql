--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-09 15:39:41 CET

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
-- TOC entry 183 (class 1259 OID 25873119)
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
-- TOC entry 237 (class 1259 OID 25873733)
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
-- TOC entry 236 (class 1259 OID 25873716)
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
-- TOC entry 182 (class 1259 OID 25873112)
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
-- TOC entry 181 (class 1259 OID 25873110)
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
-- TOC entry 227 (class 1259 OID 25873593)
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
-- TOC entry 230 (class 1259 OID 25873623)
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
-- TOC entry 251 (class 1259 OID 25874020)
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
-- TOC entry 203 (class 1259 OID 25873367)
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
-- TOC entry 205 (class 1259 OID 25873399)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25873404)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 25873946)
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
-- TOC entry 194 (class 1259 OID 25873264)
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
-- TOC entry 238 (class 1259 OID 25873746)
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
-- TOC entry 223 (class 1259 OID 25873547)
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
-- TOC entry 200 (class 1259 OID 25873338)
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
-- TOC entry 197 (class 1259 OID 25873304)
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
-- TOC entry 195 (class 1259 OID 25873281)
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
-- TOC entry 212 (class 1259 OID 25873461)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 25874001)
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
-- TOC entry 250 (class 1259 OID 25874013)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25874035)
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
-- TOC entry 216 (class 1259 OID 25873486)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 25873238)
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
-- TOC entry 185 (class 1259 OID 25873138)
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
-- TOC entry 189 (class 1259 OID 25873205)
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
-- TOC entry 186 (class 1259 OID 25873149)
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
-- TOC entry 178 (class 1259 OID 25873084)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 25873103)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 25873493)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 25873527)
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
-- TOC entry 233 (class 1259 OID 25873664)
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
-- TOC entry 188 (class 1259 OID 25873185)
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
-- TOC entry 191 (class 1259 OID 25873230)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 25873891)
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
-- TOC entry 213 (class 1259 OID 25873467)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 25873215)
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
-- TOC entry 202 (class 1259 OID 25873359)
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
-- TOC entry 198 (class 1259 OID 25873319)
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
-- TOC entry 199 (class 1259 OID 25873331)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25873479)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 25873905)
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
-- TOC entry 242 (class 1259 OID 25873915)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 25873814)
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
-- TOC entry 243 (class 1259 OID 25873923)
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
-- TOC entry 219 (class 1259 OID 25873508)
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
-- TOC entry 211 (class 1259 OID 25873452)
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
-- TOC entry 210 (class 1259 OID 25873442)
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
-- TOC entry 232 (class 1259 OID 25873653)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 25873583)
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
-- TOC entry 196 (class 1259 OID 25873293)
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
-- TOC entry 175 (class 1259 OID 25873055)
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
-- TOC entry 174 (class 1259 OID 25873053)
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
-- TOC entry 220 (class 1259 OID 25873521)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 25873093)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 25873077)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25873535)
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
-- TOC entry 214 (class 1259 OID 25873473)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 25873419)
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
-- TOC entry 173 (class 1259 OID 25873042)
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
-- TOC entry 172 (class 1259 OID 25873034)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 25873029)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 25873600)
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
-- TOC entry 187 (class 1259 OID 25873177)
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
-- TOC entry 209 (class 1259 OID 25873429)
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
-- TOC entry 231 (class 1259 OID 25873641)
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
-- TOC entry 184 (class 1259 OID 25873128)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 25873934)
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
-- TOC entry 207 (class 1259 OID 25873409)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 25873250)
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
-- TOC entry 176 (class 1259 OID 25873064)
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
-- TOC entry 235 (class 1259 OID 25873691)
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
-- TOC entry 201 (class 1259 OID 25873349)
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
-- TOC entry 218 (class 1259 OID 25873500)
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
-- TOC entry 229 (class 1259 OID 25873614)
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
-- TOC entry 247 (class 1259 OID 25873981)
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
-- TOC entry 246 (class 1259 OID 25873953)
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
-- TOC entry 248 (class 1259 OID 25873993)
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
-- TOC entry 225 (class 1259 OID 25873572)
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
-- TOC entry 204 (class 1259 OID 25873393)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 25873681)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 25873562)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 25873115)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 25873058)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 25873119)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5640-b01d-0681-04d094170c4d	10	30	Otroci	Abonma za otroke	200
000a0000-5640-b01d-e87c-e6575d3ee4b6	20	60	Mladina	Abonma za mladino	400
000a0000-5640-b01d-0baf-a8dc271bbb13	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3155 (class 0 OID 25873733)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5640-b029-0452-2a72c593ff92	000d0000-5640-b029-0da9-9172865cee98	\N	00090000-5640-b029-5475-ca8fc0ddab4a	000b0000-5640-b029-cdfe-734fd508e60d	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5640-b029-f529-898c17d4b0e2	000d0000-5640-b029-33a6-69759a8ce725	00100000-5640-b029-5d1c-b15efeafbfee	00090000-5640-b029-cd3a-aba013767209	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5640-b029-bc48-3bd265a5e028	000d0000-5640-b029-2ab8-4775630edad2	00100000-5640-b029-cee0-8594ca72e227	00090000-5640-b029-e4cd-d92bb36481a1	\N	0003	t	\N	2015-11-09	\N	2	t	\N	f	f
000c0000-5640-b029-7629-5ce52c5deefa	000d0000-5640-b029-eafa-dabb8e4afa95	\N	00090000-5640-b029-2094-f0a810464a2e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5640-b029-1288-b089fb78db55	000d0000-5640-b029-2d97-12e33120a879	\N	00090000-5640-b029-e821-87132711fe28	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5640-b029-b7a3-b9811902ba5e	000d0000-5640-b029-4c96-3b12e3487aa0	\N	00090000-5640-b029-47b4-467f9eba034a	000b0000-5640-b029-4fcd-df19c2ee121d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5640-b029-f423-bd35df786be0	000d0000-5640-b029-ebdd-ef8698640459	00100000-5640-b029-7d0e-c84bff44f378	00090000-5640-b029-244c-207b7b4a1f2a	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5640-b029-52c8-11343f57ec5c	000d0000-5640-b029-5e36-a4ad83aa1e32	\N	00090000-5640-b029-5ef1-fc5f7e3284fe	000b0000-5640-b029-186a-ced88f3bd912	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5640-b029-c493-ec49fb191dbb	000d0000-5640-b029-ebdd-ef8698640459	00100000-5640-b029-041e-5f3ec5b0acea	00090000-5640-b029-29e8-aa72ecc59185	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5640-b029-1f38-f97d175d0b16	000d0000-5640-b029-ebdd-ef8698640459	00100000-5640-b029-9ff7-9075c962ba7d	00090000-5640-b029-7508-0fded3794ceb	\N	0010	t	\N	2015-11-09	\N	16	f	\N	f	t
000c0000-5640-b029-ef39-443a0fa7f2d4	000d0000-5640-b029-ebdd-ef8698640459	00100000-5640-b029-fc50-20b9bfa9f9e5	00090000-5640-b029-448a-762e4ed4accb	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5640-b029-aa9c-3eaba27b9804	000d0000-5640-b029-96c4-524c88e5dc66	00100000-5640-b029-5d1c-b15efeafbfee	00090000-5640-b029-cd3a-aba013767209	000b0000-5640-b029-6dbe-a047203a04c6	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3154 (class 0 OID 25873716)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 25873112)
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
-- TOC entry 3145 (class 0 OID 25873593)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5640-b029-fbae-290d07df59c8	00160000-5640-b01d-022f-a3650a457580	00090000-5640-b029-d803-bdff224119b7	aizv	10	t
003d0000-5640-b029-8fc2-675f39b2ec50	00160000-5640-b01d-022f-a3650a457580	00090000-5640-b029-12b6-f9f33415e7e7	apri	14	t
003d0000-5640-b029-23f5-fbb69e77fe56	00160000-5640-b01d-051f-8cae65b89042	00090000-5640-b029-3398-aacec45d2471	aizv	11	t
003d0000-5640-b029-a6ad-ef2576ce9180	00160000-5640-b01d-8d2a-cbfadc049893	00090000-5640-b029-4e1d-e2e8a55dadba	aizv	12	t
003d0000-5640-b029-da7c-bc37082cbf18	00160000-5640-b01d-022f-a3650a457580	00090000-5640-b029-47e1-d8f43d01cd3e	apri	18	f
\.


--
-- TOC entry 3148 (class 0 OID 25873623)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5640-b01d-022f-a3650a457580	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5640-b01d-051f-8cae65b89042	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5640-b01d-8d2a-cbfadc049893	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3169 (class 0 OID 25874020)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 25873367)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5640-b029-9eb6-3840799fdeb3	\N	\N	00200000-5640-b029-dde9-9e103922acc1	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5640-b029-74cf-aa71d5da292a	\N	\N	00200000-5640-b029-1cdd-b30f00b7533a	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5640-b029-5101-00166d54b3a2	\N	\N	00200000-5640-b029-8791-cef1ce0c928c	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5640-b029-d80c-7f2a46ebfe9e	\N	\N	00200000-5640-b029-c9c1-d1c09f504364	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5640-b029-cfce-5c1f5fdf07f5	\N	\N	00200000-5640-b029-19f2-f6b7bd7d1141	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3123 (class 0 OID 25873399)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 25873404)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 25873946)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 25873264)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5640-b019-5f8f-960d7156e983	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5640-b019-15d8-b405f50c260b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5640-b019-d720-3385e5b0e5d9	AL	ALB	008	Albania 	Albanija	\N
00040000-5640-b019-9898-4009d638a3c8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5640-b019-71cd-319955dd3d87	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5640-b019-7f80-d007183281bb	AD	AND	020	Andorra 	Andora	\N
00040000-5640-b019-eb9c-66898b3a36f6	AO	AGO	024	Angola 	Angola	\N
00040000-5640-b019-58c5-85f5392fddd6	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5640-b019-f05e-ac92b3028936	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5640-b019-0b34-71b12d624047	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5640-b019-88ce-a997113448ff	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5640-b019-7a0b-3a91bb1e5092	AM	ARM	051	Armenia 	Armenija	\N
00040000-5640-b019-f52d-7892e0906c37	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5640-b019-5595-bd24767f312c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5640-b019-ad12-c22103f74b3b	AT	AUT	040	Austria 	Avstrija	\N
00040000-5640-b019-b71c-451d4f31e683	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5640-b019-a1d2-5e67798f0b89	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5640-b019-e903-48a5deabedb5	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5640-b019-4cdb-288561a30b7f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5640-b019-1173-568b53dbb11a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5640-b019-0ea5-ea3937afb61a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5640-b019-df21-c897531b0b89	BE	BEL	056	Belgium 	Belgija	\N
00040000-5640-b019-0d8d-7b1fb575c286	BZ	BLZ	084	Belize 	Belize	\N
00040000-5640-b019-d256-0c8a53b11d7c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5640-b019-0824-ae1de67bfb89	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5640-b019-e563-c64634dda69d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5640-b019-e22c-95cff81a49b2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5640-b019-c8e7-22f209e7c4a9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5640-b019-fc90-a604e646295c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5640-b019-e795-5f1ca0f76d54	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5640-b019-5ec8-caef66670c4c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5640-b019-1abd-1df97f858379	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5640-b019-ea7b-97ef4f3640e3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5640-b019-bd6f-42ae3f6ccebe	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5640-b019-b465-02ebe24021e2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5640-b019-9a31-8e208202adb8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5640-b019-d57e-e679b979a41d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5640-b019-e24a-e457a69fbbc2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5640-b019-9a94-eabb0ca10bbb	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5640-b019-9d76-21115025559d	CA	CAN	124	Canada 	Kanada	\N
00040000-5640-b019-193a-c0dc929c7435	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5640-b019-153c-f7276d865fa2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5640-b019-dc3d-b8bf830b48be	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5640-b019-98fd-80e69f207edb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5640-b019-52a6-e2e9a845c05f	CL	CHL	152	Chile 	Čile	\N
00040000-5640-b019-df75-9311114df5ec	CN	CHN	156	China 	Kitajska	\N
00040000-5640-b019-d557-670bf5afd1e1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5640-b019-23bd-219507d1d362	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5640-b019-3c18-8388655d0f0c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5640-b019-6c95-7bd36e93227d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5640-b019-0b3e-5434c47a9597	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5640-b019-5664-c63bd319c018	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5640-b019-30c6-5038b692cabd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5640-b019-da16-8ac6479a9943	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5640-b019-8232-e03e39549938	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5640-b019-2c50-0af758353411	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5640-b019-0839-ac62883cfbdf	CU	CUB	192	Cuba 	Kuba	\N
00040000-5640-b019-1f25-e4c721868da7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5640-b019-3f80-f7d661f70a26	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5640-b019-15e8-71fdae4956d4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5640-b019-bfed-a71667c7e866	DK	DNK	208	Denmark 	Danska	\N
00040000-5640-b019-3fee-f67c5427e4cc	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5640-b019-0b85-2edab4b62c07	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5640-b019-09dc-cf153ce99909	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5640-b019-9bc3-242f3ce13afb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5640-b019-2619-4fb8427fd885	EG	EGY	818	Egypt 	Egipt	\N
00040000-5640-b019-4d08-78ec1a2d746f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5640-b019-19d7-c1b2dc5c46e2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5640-b019-100d-b74bcfc36250	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5640-b019-b579-29244499d618	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5640-b019-71d0-228a212176c5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5640-b019-ecd7-3c3259ef6b7d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5640-b019-f3fe-b80b4ab6452e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5640-b019-f295-38ff66a7a742	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5640-b019-0edb-a04802650c90	FI	FIN	246	Finland 	Finska	\N
00040000-5640-b019-67ca-5e4a134ce64e	FR	FRA	250	France 	Francija	\N
00040000-5640-b019-44c9-3c472cf82728	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5640-b019-bc80-9c16b4ad3f61	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5640-b019-035d-f8b7da3ee155	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5640-b019-5e6d-65da59c33858	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5640-b019-0fab-ded60a010db3	GA	GAB	266	Gabon 	Gabon	\N
00040000-5640-b019-18f4-541ab04364ca	GM	GMB	270	Gambia 	Gambija	\N
00040000-5640-b019-163e-cd06e0e3162d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5640-b019-9f7b-a1d47594887a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5640-b019-e65b-1e2af2c951d3	GH	GHA	288	Ghana 	Gana	\N
00040000-5640-b019-496c-0f1e5e236198	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5640-b019-28b9-38fc70aacba2	GR	GRC	300	Greece 	Grčija	\N
00040000-5640-b019-8e0d-bde3ed665311	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5640-b019-f5c2-ca544888f5f2	GD	GRD	308	Grenada 	Grenada	\N
00040000-5640-b019-22f2-8407483cf106	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5640-b019-c270-5ca4f6a436eb	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5640-b019-321a-aead9ee412cd	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5640-b019-e0a6-1888c2f38428	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5640-b019-2d23-59f255644497	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5640-b019-e868-b1f883dffcd1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5640-b019-ca81-b2db9035a3a1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5640-b019-a1b3-d27227e49f17	HT	HTI	332	Haiti 	Haiti	\N
00040000-5640-b019-58a7-ad6d0f13dbd2	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5640-b019-000a-ac0461fdeb49	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5640-b019-cb84-ac6feb810952	HN	HND	340	Honduras 	Honduras	\N
00040000-5640-b019-550b-b75474190e6f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5640-b019-37b2-2e67fde00645	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5640-b019-5d44-c26711a35e34	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5640-b019-1006-47e2fc2a9d5e	IN	IND	356	India 	Indija	\N
00040000-5640-b019-496f-67dc86d95268	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5640-b019-83c2-33911a81ee08	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5640-b019-ffc6-c12e20e5fcaa	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5640-b019-c90d-38f747e3dda9	IE	IRL	372	Ireland 	Irska	\N
00040000-5640-b019-fe14-e42a046909f3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5640-b019-c09e-f2dc39983468	IL	ISR	376	Israel 	Izrael	\N
00040000-5640-b019-abf6-9a371bb94aa7	IT	ITA	380	Italy 	Italija	\N
00040000-5640-b019-55a2-4e055d832834	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5640-b019-e82e-2cf103662f6f	JP	JPN	392	Japan 	Japonska	\N
00040000-5640-b019-2e28-3fb9fd2357dc	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5640-b019-0c97-ada7916c4559	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5640-b019-5cba-c7547bc024f7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5640-b019-1538-eb207e3f07b3	KE	KEN	404	Kenya 	Kenija	\N
00040000-5640-b019-b690-474b481b2c23	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5640-b019-1bc5-e7f7343eebd5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5640-b019-3ce3-05648aa0005b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5640-b019-8551-412063f9c94a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5640-b019-0b6e-26482422cb7c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5640-b019-89b9-efa4dcd63128	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5640-b019-0f97-e69c1d037d5c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5640-b019-ad97-14218898f94c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5640-b019-ebd9-495b72b36b73	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5640-b019-6be2-24ee1229e458	LR	LBR	430	Liberia 	Liberija	\N
00040000-5640-b019-c9f7-a406ca6ef4fc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5640-b019-0cad-9619002ea9c4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5640-b019-675f-55d03da66e7d	LT	LTU	440	Lithuania 	Litva	\N
00040000-5640-b019-56a7-b1a97ba6d1a0	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5640-b019-7e01-0be200b67920	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5640-b019-28e9-229d07df0394	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5640-b019-be9b-3689581d9edc	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5640-b019-2e08-8a8fe1ad842a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5640-b019-53fb-00feb5e62fdc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5640-b019-8c2f-bbd4c58ae5ae	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5640-b019-9b4d-d9e13d9bad47	ML	MLI	466	Mali 	Mali	\N
00040000-5640-b019-817f-a2a68b79e683	MT	MLT	470	Malta 	Malta	\N
00040000-5640-b019-1f6e-e479d24a6da5	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5640-b019-d49d-f92ddae61065	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5640-b019-c090-8756f3d4955e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5640-b019-f435-cda862a3bedb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5640-b019-f4f1-063961969651	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5640-b019-2ad3-c164a45b5ea1	MX	MEX	484	Mexico 	Mehika	\N
00040000-5640-b019-f8b9-a0a21c0610e3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5640-b019-1810-2403c7d052fd	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5640-b019-6cf3-dca07ac7246c	MC	MCO	492	Monaco 	Monako	\N
00040000-5640-b019-7e26-48378e2fbd33	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5640-b019-a358-3a1b3f6db87e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5640-b019-bd77-5afc78821313	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5640-b019-531b-74610fda0ae2	MA	MAR	504	Morocco 	Maroko	\N
00040000-5640-b019-1fc3-d9a024ebfbe1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5640-b019-6dba-03ad9f028318	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5640-b019-3561-e819fa944aae	NA	NAM	516	Namibia 	Namibija	\N
00040000-5640-b019-2a3d-5881554dffc8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5640-b019-ab46-18abff629b2f	NP	NPL	524	Nepal 	Nepal	\N
00040000-5640-b019-3d9b-b78b7d26972b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5640-b019-9e34-28a9f036aa74	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5640-b019-3ff8-c74c59f28457	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5640-b019-0fd2-d8c9ebf903f3	NE	NER	562	Niger 	Niger 	\N
00040000-5640-b019-89d7-e43324a1ead0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5640-b019-eacc-507673c28b4e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5640-b019-3549-79c69f672005	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5640-b019-4363-3c42581bbe46	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5640-b019-5916-b1f0fe7d7211	NO	NOR	578	Norway 	Norveška	\N
00040000-5640-b019-258a-edaffc7f4ac2	OM	OMN	512	Oman 	Oman	\N
00040000-5640-b019-43f4-c7298afe2470	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5640-b019-3118-4780ba754635	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5640-b019-2e1f-9545624adeda	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5640-b019-2e51-f7f62c28e5f2	PA	PAN	591	Panama 	Panama	\N
00040000-5640-b019-0c9d-2f73c7686ab9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5640-b019-178c-99e566496390	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5640-b019-ab2e-3e08e94c8cad	PE	PER	604	Peru 	Peru	\N
00040000-5640-b019-6a57-13b77cedd975	PH	PHL	608	Philippines 	Filipini	\N
00040000-5640-b019-1f9c-430e933fc91e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5640-b019-46ff-0b2053e73522	PL	POL	616	Poland 	Poljska	\N
00040000-5640-b019-42e9-12de3e434e99	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5640-b019-c513-a2190048727b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5640-b019-3e66-11c85d0e23a3	QA	QAT	634	Qatar 	Katar	\N
00040000-5640-b019-1084-e2f39a695726	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5640-b019-f42f-d5498e77fc74	RO	ROU	642	Romania 	Romunija	\N
00040000-5640-b019-40c1-8872b55c0dfd	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5640-b019-b16c-fd501b5c60b1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5640-b019-e372-58f9c12f85f3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5640-b019-19f9-d984c995b1c1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5640-b019-8f0a-7eaa2d226999	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5640-b019-9dfb-4f89e20715da	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5640-b019-554c-2e072717c955	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5640-b019-b83e-e517152c1a7e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5640-b019-3f68-1d86985c31f3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5640-b019-712b-54fea9958a11	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5640-b019-82dd-ba68eb53aba8	SM	SMR	674	San Marino 	San Marino	\N
00040000-5640-b019-78a4-f94653186008	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5640-b019-ed3e-81adfa8f707e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5640-b019-a3e7-008d29b46d0d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5640-b019-ca49-ef844e21afaa	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5640-b019-5c91-0ef38a848994	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5640-b019-ea27-a4cc8c80ac8a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5640-b019-bf16-e90e4cb2609f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5640-b019-f282-bbfac4588524	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5640-b019-532f-3a03ced2498c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5640-b019-5867-aa418832f24d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5640-b019-1c1f-ca52465a0cb6	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5640-b019-a283-7d8430326485	SO	SOM	706	Somalia 	Somalija	\N
00040000-5640-b019-349e-56ec46ad9237	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5640-b019-e71c-f135d2912d1e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5640-b019-7c80-a443d5cf3574	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5640-b019-0aa6-488e1b725f17	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5640-b019-dadf-c372eafe4eec	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5640-b019-e53f-ed298084d5a9	SD	SDN	729	Sudan 	Sudan	\N
00040000-5640-b019-3c1c-228f79a664ab	SR	SUR	740	Suriname 	Surinam	\N
00040000-5640-b019-22d0-2042ca816bd7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5640-b019-59ee-0fafe2c7465e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5640-b019-d165-62ad387d6b15	SE	SWE	752	Sweden 	Švedska	\N
00040000-5640-b019-2f4b-ad058b323bdd	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5640-b019-a39f-320cd57d5549	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5640-b019-83da-9bef855e55cb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5640-b019-efe3-7df1bbe74cd2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5640-b019-dc07-7b19cdd0b841	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5640-b019-427c-58ee0a5681a8	TH	THA	764	Thailand 	Tajska	\N
00040000-5640-b019-a9d3-fc7a63b82269	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5640-b019-31a2-211b030270b4	TG	TGO	768	Togo 	Togo	\N
00040000-5640-b019-77f8-9368c2442c61	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5640-b019-8c4d-45b2181be702	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5640-b019-e65e-360583a68116	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5640-b019-2d6c-8d9cbddd337b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5640-b019-3bb9-e37d0d21d48d	TR	TUR	792	Turkey 	Turčija	\N
00040000-5640-b019-9368-916abdac09b4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5640-b019-ac02-b029ae6562ba	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5640-b019-b511-0b32860f66bd	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5640-b019-98a9-46c6ec24eea6	UG	UGA	800	Uganda 	Uganda	\N
00040000-5640-b019-d1a2-291718cecb24	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5640-b019-5c4a-c417b73b223b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5640-b019-4348-703d158fd502	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5640-b019-18f1-3d5a4f3eaa9f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5640-b019-c74f-897b11847e47	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5640-b019-20c7-562866df95ef	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5640-b019-78c9-8e521428c35f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5640-b019-a1de-154d07e02039	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5640-b019-782f-b60fd60bc2c2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5640-b019-89fd-38b8810e7b0a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5640-b019-8275-b33f8a01778e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5640-b019-aeb6-fbf9cd25fc7d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5640-b019-eb4e-a9acdb9f9152	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5640-b019-5ff6-8276d83e2d0b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5640-b019-87b3-15c7c2769ed7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5640-b019-e901-b9bf24de1314	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5640-b019-4a39-c003f647adb9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 25873746)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5640-b029-68a5-3d10e38f98c3	000e0000-5640-b029-b09f-9642c65ea20f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5640-b019-a688-9ecc01e6a6b8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5640-b029-42f0-3cf09e52c08e	000e0000-5640-b029-4843-71552b23fe87	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5640-b019-3d3e-ebd3abf9a662	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5640-b029-c716-4b568b123f47	000e0000-5640-b029-7497-e97331714516	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5640-b019-a688-9ecc01e6a6b8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5640-b029-d711-f5834d82a746	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5640-b029-0852-7db1f4d7b0f4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 25873547)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5640-b029-ebdd-ef8698640459	000e0000-5640-b029-4843-71552b23fe87	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5640-b019-16c3-b3460a74ca28
000d0000-5640-b029-0da9-9172865cee98	000e0000-5640-b029-4843-71552b23fe87	000c0000-5640-b029-0452-2a72c593ff92	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5640-b019-16c3-b3460a74ca28
000d0000-5640-b029-33a6-69759a8ce725	000e0000-5640-b029-4843-71552b23fe87	000c0000-5640-b029-f529-898c17d4b0e2	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5640-b019-fd44-dbb0b34f6e6d
000d0000-5640-b029-2ab8-4775630edad2	000e0000-5640-b029-4843-71552b23fe87	000c0000-5640-b029-bc48-3bd265a5e028	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5640-b019-c9b1-c6c5e7aaff6d
000d0000-5640-b029-eafa-dabb8e4afa95	000e0000-5640-b029-4843-71552b23fe87	000c0000-5640-b029-7629-5ce52c5deefa	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5640-b019-65f2-429eb3dabcef
000d0000-5640-b029-2d97-12e33120a879	000e0000-5640-b029-4843-71552b23fe87	000c0000-5640-b029-1288-b089fb78db55	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5640-b019-65f2-429eb3dabcef
000d0000-5640-b029-4c96-3b12e3487aa0	000e0000-5640-b029-4843-71552b23fe87	000c0000-5640-b029-b7a3-b9811902ba5e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5640-b019-16c3-b3460a74ca28
000d0000-5640-b029-5e36-a4ad83aa1e32	000e0000-5640-b029-4843-71552b23fe87	000c0000-5640-b029-52c8-11343f57ec5c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5640-b019-3b09-32d2a51c940c
000d0000-5640-b029-96c4-524c88e5dc66	000e0000-5640-b029-4843-71552b23fe87	000c0000-5640-b029-aa9c-3eaba27b9804	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5640-b019-d7d2-155a0c363233
\.


--
-- TOC entry 3118 (class 0 OID 25873338)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 25873304)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 25873281)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5640-b029-ed65-9ccec2e1a373	00080000-5640-b01d-c43e-ab9241962a32	00090000-5640-b029-7508-0fded3794ceb	AK		igralka
\.


--
-- TOC entry 3130 (class 0 OID 25873461)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 25874001)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5640-b029-5c54-8e044ff3c91f	00010000-5640-b01a-9d8e-5c1399005b72	\N	Prva mapa	Root mapa	2015-11-09 15:39:25	2015-11-09 15:39:25	R	\N	\N
\.


--
-- TOC entry 3168 (class 0 OID 25874013)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 25874035)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 25231831)
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
-- TOC entry 3134 (class 0 OID 25873486)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 25873238)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5640-b01a-2432-4008756e7471	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5640-b01a-e948-d49e8ac820e2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5640-b01a-9b79-53fe9f2c4179	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5640-b01a-84d3-c8be3ef8b8a9	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5640-b01a-5923-4491c1024117	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5640-b01a-f8d8-49aa7bf21b40	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5640-b01a-bca2-1622d9c2b5c9	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5640-b01a-2c7d-51b3f2725df2	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5640-b01a-02dc-1c99b652ec19	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5640-b01a-0d44-aa6fd45b8d10	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5640-b01a-c858-20983c73b927	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5640-b01a-080c-e4a39caeebf1	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5640-b01a-42b1-3d838806bb9b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5640-b01a-8aa4-74fa232b682b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5640-b01a-b178-ad882d76ce5b	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5640-b01d-66f7-4e94799e4bb9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5640-b01d-794e-4afb414aae50	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5640-b01d-6157-653d3b617027	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5640-b01d-2435-ff1e143b38dd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5640-b01d-4e8e-106236586308	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5640-b02c-18e4-fbbb7b35a421	application.tenant.maticnopodjetje	string	s:36:"00080000-5640-b02c-c18a-8419620860ed";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 25873138)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5640-b01d-6d3e-9ebb86afadd7	00000000-5640-b01d-66f7-4e94799e4bb9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5640-b01d-10e4-bc5c4e58700e	00000000-5640-b01d-66f7-4e94799e4bb9	00010000-5640-b01a-9d8e-5c1399005b72	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5640-b01d-9e9f-1d80984f6786	00000000-5640-b01d-794e-4afb414aae50	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3107 (class 0 OID 25873205)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5640-b029-5689-e53ca7f77c5e	\N	00100000-5640-b029-5d1c-b15efeafbfee	00100000-5640-b029-cee0-8594ca72e227	01	Gledališče Nimbis
00410000-5640-b029-bdd3-0a3e712e84fa	00410000-5640-b029-5689-e53ca7f77c5e	00100000-5640-b029-5d1c-b15efeafbfee	00100000-5640-b029-cee0-8594ca72e227	02	Tehnika
\.


--
-- TOC entry 3104 (class 0 OID 25873149)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5640-b029-5475-ca8fc0ddab4a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5640-b029-2094-f0a810464a2e	00010000-5640-b01d-5924-d6c4414a9e65	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5640-b029-e4cd-d92bb36481a1	00010000-5640-b01d-5464-07e7ad5c5840	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5640-b029-29e8-aa72ecc59185	00010000-5640-b01d-5643-7ce02b20e25b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5640-b029-1851-21fc139f24d4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5640-b029-47b4-467f9eba034a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5640-b029-448a-762e4ed4accb	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5640-b029-244c-207b7b4a1f2a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5640-b029-7508-0fded3794ceb	00010000-5640-b01d-5f4e-1117e445856d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5640-b029-cd3a-aba013767209	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5640-b029-015e-1f3c64a7a08e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5640-b029-e821-87132711fe28	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5640-b029-5ef1-fc5f7e3284fe	00010000-5640-b01d-61ee-93f9f6edc131	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5640-b029-d803-bdff224119b7	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5640-b029-12b6-f9f33415e7e7	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5640-b029-3398-aacec45d2471	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5640-b029-4e1d-e2e8a55dadba	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5640-b029-47e1-d8f43d01cd3e	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5640-b029-3141-126e4a22fb98	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5640-b029-9e18-b305cf872b4e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5640-b029-fedf-cc8b79bf5fdf	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3096 (class 0 OID 25873084)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5640-b01a-237b-5040e0f736b7	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5640-b01a-b646-df09c542e0fe	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5640-b01a-0ba9-fedf39ecc5dc	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5640-b01a-6384-fbc37adf66a5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5640-b01a-7fb4-318c6d814abb	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5640-b01a-b448-609d8870a383	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5640-b01a-43c8-c2798ff5a082	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5640-b01a-84cc-1236653cd97b	Abonma-read	Abonma - branje	t
00030000-5640-b01a-ae9c-c2c868413eec	Abonma-write	Abonma - spreminjanje	t
00030000-5640-b01a-cb86-ec99722baed7	Alternacija-read	Alternacija - branje	t
00030000-5640-b01a-e253-40f094b8f3bc	Alternacija-write	Alternacija - spreminjanje	t
00030000-5640-b01a-92f6-279f0a1f6e42	Arhivalija-read	Arhivalija - branje	t
00030000-5640-b01a-2f99-aa024bbda7d8	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5640-b01a-3310-b3c4192d9a7e	AuthStorage-read	AuthStorage - branje	t
00030000-5640-b01a-41ab-5143cd21d3df	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5640-b01a-ff4c-2370ccc964fb	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5640-b01a-f83b-69be1429a763	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5640-b01a-464d-f568a37fc728	Besedilo-read	Besedilo - branje	t
00030000-5640-b01a-e66c-3a531c9fac7f	Besedilo-write	Besedilo - spreminjanje	t
00030000-5640-b01a-57b1-beefdb07a640	Dogodek-read	Dogodek - branje	t
00030000-5640-b01a-e596-de6751394df6	Dogodek-write	Dogodek - spreminjanje	t
00030000-5640-b01a-589a-ca43ab96830f	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5640-b01a-f2c0-f440276ad216	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5640-b01a-d783-064d5958091a	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5640-b01a-d930-e878f365b773	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5640-b01a-16e9-104fac19618f	DogodekTrait-read	DogodekTrait - branje	t
00030000-5640-b01a-82ee-c126d712f2f6	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5640-b01a-a3ca-9ec0d5907dbf	DrugiVir-read	DrugiVir - branje	t
00030000-5640-b01a-e761-6aae43579e5d	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5640-b01a-ad38-b1c5775b9157	Drzava-read	Drzava - branje	t
00030000-5640-b01a-43c7-65c5e4b7feef	Drzava-write	Drzava - spreminjanje	t
00030000-5640-b01a-a03b-7f9ccac0c09b	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5640-b01a-7ba0-d8d3d20f0831	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5640-b01a-0677-d35e22fa220c	Funkcija-read	Funkcija - branje	t
00030000-5640-b01a-fcad-b1c9f5cbc9ea	Funkcija-write	Funkcija - spreminjanje	t
00030000-5640-b01a-60d5-49c2a4005a5a	Gostovanje-read	Gostovanje - branje	t
00030000-5640-b01a-4533-b90b67391dbe	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5640-b01a-c1e4-875e11b3a710	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5640-b01a-76ca-a12952e460c5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5640-b01a-ae74-6109f8bed587	Kupec-read	Kupec - branje	t
00030000-5640-b01a-9da0-52a261c0b7c6	Kupec-write	Kupec - spreminjanje	t
00030000-5640-b01a-f964-7f4cb1790096	NacinPlacina-read	NacinPlacina - branje	t
00030000-5640-b01a-cc0a-ef9ddc37e880	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5640-b01a-2237-55d063203492	Option-read	Option - branje	t
00030000-5640-b01a-d307-3ed6acf102a1	Option-write	Option - spreminjanje	t
00030000-5640-b01a-849b-ed4358e8789e	OptionValue-read	OptionValue - branje	t
00030000-5640-b01a-19b2-b133895177f2	OptionValue-write	OptionValue - spreminjanje	t
00030000-5640-b01a-d209-b6e3584240e3	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5640-b01a-06db-ecfc0cfe110b	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5640-b01a-a521-416f900f0ac3	Oseba-read	Oseba - branje	t
00030000-5640-b01a-a3ad-1eab64f2d7fe	Oseba-write	Oseba - spreminjanje	t
00030000-5640-b01a-026b-e5acc28cbe7e	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5640-b01a-5d07-fd42b043479d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5640-b01a-6278-bb5c1c82940a	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5640-b01a-3eca-9c01518796bd	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5640-b01a-f663-b9a5e130a1cb	Pogodba-read	Pogodba - branje	t
00030000-5640-b01a-bd05-bade07608f36	Pogodba-write	Pogodba - spreminjanje	t
00030000-5640-b01a-d4e9-67eb2bec426e	Popa-read	Popa - branje	t
00030000-5640-b01a-6b42-e19fe21c78f4	Popa-write	Popa - spreminjanje	t
00030000-5640-b01a-33aa-da610a2a6672	Posta-read	Posta - branje	t
00030000-5640-b01a-c26f-ba231f34f56e	Posta-write	Posta - spreminjanje	t
00030000-5640-b01a-23ce-cc9cba3420f3	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5640-b01a-b808-9e902f966566	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5640-b01a-70a4-b8a8cd4c2d8c	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5640-b01a-a50e-47a48de007be	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5640-b01a-0c08-de7548fdf7e4	PostniNaslov-read	PostniNaslov - branje	t
00030000-5640-b01a-dead-584117c8a90e	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5640-b01a-cd3c-3f9de82c7fa4	Praznik-read	Praznik - branje	t
00030000-5640-b01a-e711-01cf5856a562	Praznik-write	Praznik - spreminjanje	t
00030000-5640-b01a-db40-de24a6036d39	Predstava-read	Predstava - branje	t
00030000-5640-b01a-c11d-bb5960dc3e29	Predstava-write	Predstava - spreminjanje	t
00030000-5640-b01a-c894-5e898434a1ab	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5640-b01a-b202-46aafa235e40	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5640-b01a-88f8-513c6bbe5d2f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5640-b01a-76e1-13ae94b74343	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5640-b01a-d901-ef5f9193a5db	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5640-b01a-2426-2ee25f514076	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5640-b01a-fa42-ca75cec64ab2	ProgramDela-read	ProgramDela - branje	t
00030000-5640-b01a-1873-58c14c9f337b	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5640-b01a-6018-d19086621449	ProgramFestival-read	ProgramFestival - branje	t
00030000-5640-b01a-1b10-17d1d5dae20b	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5640-b01a-20a5-4a276526f241	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5640-b01a-47ce-9a28ee6cd16c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5640-b01a-a27e-fc63ac4fb541	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5640-b01a-6285-b9f67e2caea0	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5640-b01a-414f-60f3a7dbd830	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5640-b01a-0913-211c6b69bbc4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5640-b01a-c8e2-0fbddebe42c3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5640-b01a-a80c-c25978a7517d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5640-b01a-8599-877d18602c8f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5640-b01a-be12-9eb15d96dba0	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5640-b01a-f21c-70dc61f20a45	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5640-b01a-341f-172afc68772e	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5640-b01a-099d-e9de12b2c764	ProgramRazno-read	ProgramRazno - branje	t
00030000-5640-b01a-4dd9-1d3bb111bab0	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5640-b01a-f7a1-4cefbd15492f	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5640-b01a-33fa-bcf08cd0163b	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5640-b01a-6312-ac6549420741	Prostor-read	Prostor - branje	t
00030000-5640-b01a-f915-19c52001fdba	Prostor-write	Prostor - spreminjanje	t
00030000-5640-b01a-4910-56be67be0b13	Racun-read	Racun - branje	t
00030000-5640-b01a-abda-9368266e5618	Racun-write	Racun - spreminjanje	t
00030000-5640-b01a-f3a6-82f21fdca306	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5640-b01a-e98e-8e10d91b8886	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5640-b01a-d665-678829980566	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5640-b01a-2a95-5a19bf25b001	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5640-b01a-0195-7f8eec4d5252	Rekvizit-read	Rekvizit - branje	t
00030000-5640-b01a-7846-5371c56fb430	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5640-b01a-b952-4d08c6620f83	Revizija-read	Revizija - branje	t
00030000-5640-b01a-d91b-b2769e1e8069	Revizija-write	Revizija - spreminjanje	t
00030000-5640-b01a-0a05-aa2b1d448422	Rezervacija-read	Rezervacija - branje	t
00030000-5640-b01a-1867-cd47e9263d81	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5640-b01a-4284-2c2e35135b8b	SedezniRed-read	SedezniRed - branje	t
00030000-5640-b01a-1ad5-1134ed4c8a02	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5640-b01a-4c97-71b2177585a0	Sedez-read	Sedez - branje	t
00030000-5640-b01a-4720-7032ec65c2fb	Sedez-write	Sedez - spreminjanje	t
00030000-5640-b01a-6430-cfbc4a5bbf99	Sezona-read	Sezona - branje	t
00030000-5640-b01a-5d72-c152c6928bec	Sezona-write	Sezona - spreminjanje	t
00030000-5640-b01a-1632-97c5e8689592	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5640-b01a-b05f-af51c12fe349	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5640-b01a-9e95-c44e96dd58a9	Stevilcenje-read	Stevilcenje - branje	t
00030000-5640-b01a-7a65-e675c92b43d9	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5640-b01a-5beb-0e8313994aa1	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5640-b01a-dcfa-10ed84a03d9d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5640-b01a-aac1-962c4a449e17	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5640-b01a-d796-b2fb89a6db61	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5640-b01a-0d62-f938915e2d65	Telefonska-read	Telefonska - branje	t
00030000-5640-b01a-fa3a-0eedf72bdea7	Telefonska-write	Telefonska - spreminjanje	t
00030000-5640-b01a-2fb0-1705182bbdf0	TerminStoritve-read	TerminStoritve - branje	t
00030000-5640-b01a-f90e-020c37e6c9c4	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5640-b01a-7c18-cd473f4fc722	TipFunkcije-read	TipFunkcije - branje	t
00030000-5640-b01a-c3fe-d71ac1901e41	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5640-b01a-45ac-a8d4f85b031b	TipPopa-read	TipPopa - branje	t
00030000-5640-b01a-d618-8477c18e2d22	TipPopa-write	TipPopa - spreminjanje	t
00030000-5640-b01a-c9e2-fb997a20ae28	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5640-b01a-d489-381aab145643	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5640-b01a-e471-1826b803df5c	TipVaje-read	TipVaje - branje	t
00030000-5640-b01a-7454-4e8596b10ba4	TipVaje-write	TipVaje - spreminjanje	t
00030000-5640-b01a-9789-4b67126c767e	Trr-read	Trr - branje	t
00030000-5640-b01a-6895-ecdea6adc69f	Trr-write	Trr - spreminjanje	t
00030000-5640-b01a-2f63-98e327bf3e2d	Uprizoritev-read	Uprizoritev - branje	t
00030000-5640-b01a-b547-f9c6362bd614	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5640-b01a-6574-305dc3732d6a	Vaja-read	Vaja - branje	t
00030000-5640-b01a-0978-0d19f798295b	Vaja-write	Vaja - spreminjanje	t
00030000-5640-b01a-22e4-35d5211da2d8	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5640-b01a-300d-a0088b499be8	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5640-b01a-11d5-68923a4c7a9b	VrstaStroska-read	VrstaStroska - branje	t
00030000-5640-b01a-1f6c-9ce8924be367	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5640-b01a-b206-b62fec9c0ab1	Zaposlitev-read	Zaposlitev - branje	t
00030000-5640-b01a-5d81-f86d1332b0f6	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5640-b01a-96eb-a2ed27dc5847	Zasedenost-read	Zasedenost - branje	t
00030000-5640-b01a-56d4-e7f3be11f67e	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5640-b01a-8977-9d402c927f69	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5640-b01a-308a-b8cafda8ac70	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5640-b01a-2d92-f7394828dce3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5640-b01a-2e56-32c36569c597	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5640-b01a-d0fd-9cf725160ff6	Job-read	Branje opravil - samo zase - branje	t
00030000-5640-b01a-6da4-1c4721444879	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5640-b01a-7c97-856e573d02a3	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5640-b01a-9b7c-454587939d07	Report-read	Report - branje	t
00030000-5640-b01a-de83-6c49ad5a58f4	Report-write	Report - spreminjanje	t
00030000-5640-b01a-1968-09fc13016a7a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5640-b01a-d12a-f3a3a8a520f8	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5640-b01a-8bc2-316d47f4fbc0	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5640-b01a-be7e-b8aafa646eef	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5640-b01a-e0d7-310b6672ce5f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5640-b01a-459c-51a120f8fd1a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5640-b01a-aa2f-ce5fdab5cfc2	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5640-b01a-b115-1ae8c56ce7f9	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5640-b01a-1011-618e292c7947	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5640-b01a-4813-a3bda713e739	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5640-b01a-7cf7-c6b69d70824f	Datoteka-write	Datoteka - spreminjanje	t
00030000-5640-b01a-41d5-c000356714cd	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 25873103)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5640-b01a-13d1-e1934b45ab90	00030000-5640-b01a-b646-df09c542e0fe
00020000-5640-b01a-980a-d2efffcdacf4	00030000-5640-b01a-ad38-b1c5775b9157
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-84cc-1236653cd97b
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-ae9c-c2c868413eec
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-cb86-ec99722baed7
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-e253-40f094b8f3bc
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-92f6-279f0a1f6e42
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-57b1-beefdb07a640
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-6384-fbc37adf66a5
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-e596-de6751394df6
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-ad38-b1c5775b9157
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-43c7-65c5e4b7feef
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-0677-d35e22fa220c
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-fcad-b1c9f5cbc9ea
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-60d5-49c2a4005a5a
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-4533-b90b67391dbe
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-c1e4-875e11b3a710
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-76ca-a12952e460c5
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-2237-55d063203492
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-849b-ed4358e8789e
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-a521-416f900f0ac3
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-a3ad-1eab64f2d7fe
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-d4e9-67eb2bec426e
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-6b42-e19fe21c78f4
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-33aa-da610a2a6672
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-c26f-ba231f34f56e
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-0c08-de7548fdf7e4
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-dead-584117c8a90e
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-db40-de24a6036d39
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-c11d-bb5960dc3e29
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-d901-ef5f9193a5db
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-2426-2ee25f514076
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-6312-ac6549420741
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-f915-19c52001fdba
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-d665-678829980566
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-2a95-5a19bf25b001
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-0195-7f8eec4d5252
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-7846-5371c56fb430
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-6430-cfbc4a5bbf99
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-5d72-c152c6928bec
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-7c18-cd473f4fc722
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-2f63-98e327bf3e2d
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-b547-f9c6362bd614
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-6574-305dc3732d6a
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-0978-0d19f798295b
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-96eb-a2ed27dc5847
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-56d4-e7f3be11f67e
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-8977-9d402c927f69
00020000-5640-b01a-7eb0-4711e5cb763d	00030000-5640-b01a-2d92-f7394828dce3
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-84cc-1236653cd97b
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-92f6-279f0a1f6e42
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-57b1-beefdb07a640
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-ad38-b1c5775b9157
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-60d5-49c2a4005a5a
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-c1e4-875e11b3a710
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-76ca-a12952e460c5
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-2237-55d063203492
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-849b-ed4358e8789e
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-a521-416f900f0ac3
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-a3ad-1eab64f2d7fe
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-d4e9-67eb2bec426e
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-33aa-da610a2a6672
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-0c08-de7548fdf7e4
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-dead-584117c8a90e
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-db40-de24a6036d39
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-6312-ac6549420741
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-d665-678829980566
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-0195-7f8eec4d5252
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-6430-cfbc4a5bbf99
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-0d62-f938915e2d65
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-fa3a-0eedf72bdea7
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-9789-4b67126c767e
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-6895-ecdea6adc69f
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-b206-b62fec9c0ab1
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-5d81-f86d1332b0f6
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-8977-9d402c927f69
00020000-5640-b01a-1bab-5b028678ef20	00030000-5640-b01a-2d92-f7394828dce3
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-84cc-1236653cd97b
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-cb86-ec99722baed7
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-92f6-279f0a1f6e42
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-2f99-aa024bbda7d8
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-464d-f568a37fc728
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-589a-ca43ab96830f
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-57b1-beefdb07a640
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-ad38-b1c5775b9157
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-0677-d35e22fa220c
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-60d5-49c2a4005a5a
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-c1e4-875e11b3a710
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-2237-55d063203492
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-849b-ed4358e8789e
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-a521-416f900f0ac3
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-d4e9-67eb2bec426e
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-33aa-da610a2a6672
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-db40-de24a6036d39
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-d901-ef5f9193a5db
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-6312-ac6549420741
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-d665-678829980566
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-0195-7f8eec4d5252
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-6430-cfbc4a5bbf99
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-7c18-cd473f4fc722
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-6574-305dc3732d6a
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-96eb-a2ed27dc5847
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-8977-9d402c927f69
00020000-5640-b01a-0e17-700f9f9c13c3	00030000-5640-b01a-2d92-f7394828dce3
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-84cc-1236653cd97b
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-ae9c-c2c868413eec
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-e253-40f094b8f3bc
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-92f6-279f0a1f6e42
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-57b1-beefdb07a640
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-ad38-b1c5775b9157
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-60d5-49c2a4005a5a
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-2237-55d063203492
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-849b-ed4358e8789e
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-d4e9-67eb2bec426e
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-33aa-da610a2a6672
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-db40-de24a6036d39
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-6312-ac6549420741
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-d665-678829980566
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-0195-7f8eec4d5252
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-6430-cfbc4a5bbf99
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-7c18-cd473f4fc722
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-8977-9d402c927f69
00020000-5640-b01a-b584-d5c8428cf30b	00030000-5640-b01a-2d92-f7394828dce3
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-84cc-1236653cd97b
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-92f6-279f0a1f6e42
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-57b1-beefdb07a640
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-ad38-b1c5775b9157
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-60d5-49c2a4005a5a
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-2237-55d063203492
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-849b-ed4358e8789e
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-d4e9-67eb2bec426e
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-33aa-da610a2a6672
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-db40-de24a6036d39
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-6312-ac6549420741
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-d665-678829980566
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-0195-7f8eec4d5252
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-6430-cfbc4a5bbf99
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-2fb0-1705182bbdf0
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-0ba9-fedf39ecc5dc
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-7c18-cd473f4fc722
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-8977-9d402c927f69
00020000-5640-b01a-ebb7-6eb126790b8d	00030000-5640-b01a-2d92-f7394828dce3
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-237b-5040e0f736b7
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-b646-df09c542e0fe
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-84cc-1236653cd97b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-ae9c-c2c868413eec
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-cb86-ec99722baed7
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-e253-40f094b8f3bc
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-92f6-279f0a1f6e42
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-2f99-aa024bbda7d8
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-ff4c-2370ccc964fb
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-f83b-69be1429a763
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-464d-f568a37fc728
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-e66c-3a531c9fac7f
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-589a-ca43ab96830f
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-f2c0-f440276ad216
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-57b1-beefdb07a640
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-6384-fbc37adf66a5
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-e596-de6751394df6
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-a3ca-9ec0d5907dbf
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-e761-6aae43579e5d
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-ad38-b1c5775b9157
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-43c7-65c5e4b7feef
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-a03b-7f9ccac0c09b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-7ba0-d8d3d20f0831
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-0677-d35e22fa220c
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-fcad-b1c9f5cbc9ea
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-60d5-49c2a4005a5a
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-4533-b90b67391dbe
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-c1e4-875e11b3a710
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-76ca-a12952e460c5
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-ae74-6109f8bed587
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-9da0-52a261c0b7c6
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-f964-7f4cb1790096
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-cc0a-ef9ddc37e880
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-2237-55d063203492
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-849b-ed4358e8789e
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-19b2-b133895177f2
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-d307-3ed6acf102a1
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-d209-b6e3584240e3
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-06db-ecfc0cfe110b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-a521-416f900f0ac3
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-7fb4-318c6d814abb
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-a3ad-1eab64f2d7fe
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-026b-e5acc28cbe7e
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-5d07-fd42b043479d
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-6278-bb5c1c82940a
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-3eca-9c01518796bd
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-f663-b9a5e130a1cb
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-bd05-bade07608f36
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-d4e9-67eb2bec426e
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-6b42-e19fe21c78f4
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-33aa-da610a2a6672
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-23ce-cc9cba3420f3
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-b808-9e902f966566
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-70a4-b8a8cd4c2d8c
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-a50e-47a48de007be
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-c26f-ba231f34f56e
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-0c08-de7548fdf7e4
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-dead-584117c8a90e
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-cd3c-3f9de82c7fa4
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-e711-01cf5856a562
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-db40-de24a6036d39
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-c11d-bb5960dc3e29
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-c894-5e898434a1ab
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-b202-46aafa235e40
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-88f8-513c6bbe5d2f
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-76e1-13ae94b74343
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-d901-ef5f9193a5db
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-2426-2ee25f514076
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-b448-609d8870a383
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-fa42-ca75cec64ab2
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-43c8-c2798ff5a082
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-1873-58c14c9f337b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-6018-d19086621449
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-1b10-17d1d5dae20b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-20a5-4a276526f241
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-47ce-9a28ee6cd16c
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-a27e-fc63ac4fb541
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-6285-b9f67e2caea0
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-414f-60f3a7dbd830
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-0913-211c6b69bbc4
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-c8e2-0fbddebe42c3
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-a80c-c25978a7517d
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-8599-877d18602c8f
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-be12-9eb15d96dba0
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-f21c-70dc61f20a45
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-341f-172afc68772e
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-099d-e9de12b2c764
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-4dd9-1d3bb111bab0
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-f7a1-4cefbd15492f
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-33fa-bcf08cd0163b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-6312-ac6549420741
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-f915-19c52001fdba
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-4910-56be67be0b13
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-abda-9368266e5618
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-f3a6-82f21fdca306
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-e98e-8e10d91b8886
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-d665-678829980566
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-2a95-5a19bf25b001
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-0195-7f8eec4d5252
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-7846-5371c56fb430
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-b952-4d08c6620f83
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-d91b-b2769e1e8069
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-0a05-aa2b1d448422
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-1867-cd47e9263d81
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-4284-2c2e35135b8b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-1ad5-1134ed4c8a02
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-4c97-71b2177585a0
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-4720-7032ec65c2fb
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-6430-cfbc4a5bbf99
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-5d72-c152c6928bec
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-1632-97c5e8689592
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-b05f-af51c12fe349
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-9e95-c44e96dd58a9
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-5beb-0e8313994aa1
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-dcfa-10ed84a03d9d
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-7a65-e675c92b43d9
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-aac1-962c4a449e17
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-d796-b2fb89a6db61
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-0d62-f938915e2d65
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-fa3a-0eedf72bdea7
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-2fb0-1705182bbdf0
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-0ba9-fedf39ecc5dc
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-f90e-020c37e6c9c4
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-7c18-cd473f4fc722
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-c3fe-d71ac1901e41
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-45ac-a8d4f85b031b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-d618-8477c18e2d22
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-c9e2-fb997a20ae28
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-d489-381aab145643
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-e471-1826b803df5c
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-7454-4e8596b10ba4
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-9789-4b67126c767e
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-6895-ecdea6adc69f
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-2f63-98e327bf3e2d
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-b547-f9c6362bd614
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-6574-305dc3732d6a
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-0978-0d19f798295b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-22e4-35d5211da2d8
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-300d-a0088b499be8
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-11d5-68923a4c7a9b
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-1f6c-9ce8924be367
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-b206-b62fec9c0ab1
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-5d81-f86d1332b0f6
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-96eb-a2ed27dc5847
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-56d4-e7f3be11f67e
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-8977-9d402c927f69
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-308a-b8cafda8ac70
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-2d92-f7394828dce3
00020000-5640-b01d-1790-21718bd607c0	00030000-5640-b01a-2e56-32c36569c597
00020000-5640-b01d-65b1-f0545c4d504f	00030000-5640-b01a-b115-1ae8c56ce7f9
00020000-5640-b01d-3a47-551a6015ffde	00030000-5640-b01a-aa2f-ce5fdab5cfc2
00020000-5640-b01d-9933-9dd2757e5dba	00030000-5640-b01a-b547-f9c6362bd614
00020000-5640-b01d-3344-b404b700a697	00030000-5640-b01a-2f63-98e327bf3e2d
\.


--
-- TOC entry 3135 (class 0 OID 25873493)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 25873527)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 25873664)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5640-b029-cdfe-734fd508e60d	00090000-5640-b029-5475-ca8fc0ddab4a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5640-b029-4fcd-df19c2ee121d	00090000-5640-b029-47b4-467f9eba034a	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5640-b029-186a-ced88f3bd912	00090000-5640-b029-5ef1-fc5f7e3284fe	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5640-b029-6dbe-a047203a04c6	00090000-5640-b029-cd3a-aba013767209	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3106 (class 0 OID 25873185)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5640-b01d-c43e-ab9241962a32	\N	00040000-5640-b019-5867-aa418832f24d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5640-b01d-b63b-5b8043c02515	\N	00040000-5640-b019-5867-aa418832f24d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5640-b01d-feca-4068eabacd03	\N	00040000-5640-b019-5867-aa418832f24d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5640-b01d-94a4-c6be54ca0c07	\N	00040000-5640-b019-5867-aa418832f24d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5640-b01d-c78b-761b767b7b26	\N	00040000-5640-b019-5867-aa418832f24d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5640-b01d-e2e9-b7cf0dc13c6a	\N	00040000-5640-b019-88ce-a997113448ff	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5640-b01d-886a-f29cde711363	\N	00040000-5640-b019-2c50-0af758353411	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5640-b01d-0112-6ab0bc1d20e3	\N	00040000-5640-b019-ad12-c22103f74b3b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5640-b01d-c74c-2c7233c6d025	\N	00040000-5640-b019-9f7b-a1d47594887a	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5640-b02c-c18a-8419620860ed	\N	00040000-5640-b019-5867-aa418832f24d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 25873230)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5640-b019-7119-ffc20a199686	8341	Adlešiči
00050000-5640-b019-cb2c-3baa971265fa	5270	Ajdovščina
00050000-5640-b019-238d-23e939be0f3f	6280	Ankaran/Ancarano
00050000-5640-b019-5667-9fa7f396763f	9253	Apače
00050000-5640-b019-b769-731fe20a90e1	8253	Artiče
00050000-5640-b019-84ca-d1a47808b548	4275	Begunje na Gorenjskem
00050000-5640-b019-96e1-8229659d813d	1382	Begunje pri Cerknici
00050000-5640-b019-38c7-71a217b21b9c	9231	Beltinci
00050000-5640-b019-6ec0-573e56e42c30	2234	Benedikt
00050000-5640-b019-7a0e-ad75268ebf8d	2345	Bistrica ob Dravi
00050000-5640-b019-7bf4-aa012687ff3f	3256	Bistrica ob Sotli
00050000-5640-b019-10a9-9ae541f6d54e	8259	Bizeljsko
00050000-5640-b019-7b52-adc4f4799652	1223	Blagovica
00050000-5640-b019-a2c6-b0dee36a928e	8283	Blanca
00050000-5640-b019-fff8-1855df091e00	4260	Bled
00050000-5640-b019-d2d2-6d16d6be670a	4273	Blejska Dobrava
00050000-5640-b019-2938-f3d5a448dc1a	9265	Bodonci
00050000-5640-b019-699b-a07ee903ed24	9222	Bogojina
00050000-5640-b019-cc85-27608a7eefbe	4263	Bohinjska Bela
00050000-5640-b019-7a31-183c38735dde	4264	Bohinjska Bistrica
00050000-5640-b019-1755-d9fb5dd5c647	4265	Bohinjsko jezero
00050000-5640-b019-cca7-44f5e58c6fe0	1353	Borovnica
00050000-5640-b019-9695-aa8f75494c65	8294	Boštanj
00050000-5640-b019-0a14-0de5e00cc053	5230	Bovec
00050000-5640-b019-cea6-7c9f4483d51d	5295	Branik
00050000-5640-b019-e9f1-45b7b7298306	3314	Braslovče
00050000-5640-b019-6345-6b3aafe4f7ce	5223	Breginj
00050000-5640-b019-7890-cc7d6c84e05c	8280	Brestanica
00050000-5640-b019-25fd-715fecaadb02	2354	Bresternica
00050000-5640-b019-3e7e-3b9ccb598c21	4243	Brezje
00050000-5640-b019-fbe8-6f78e9f3b5d0	1351	Brezovica pri Ljubljani
00050000-5640-b019-5300-05f9e68a2fb3	8250	Brežice
00050000-5640-b019-01fe-2f2253490af3	4210	Brnik - Aerodrom
00050000-5640-b019-a764-aa8e095f3fbd	8321	Brusnice
00050000-5640-b019-bca6-954556b2604f	3255	Buče
00050000-5640-b019-720c-59aa112e62fb	8276	Bučka 
00050000-5640-b019-8da3-3704b2a5ff08	9261	Cankova
00050000-5640-b019-3e87-1b30f9dc2114	3000	Celje 
00050000-5640-b019-3582-8b4452d41ff0	3001	Celje - poštni predali
00050000-5640-b019-899e-7e283a0c80a9	4207	Cerklje na Gorenjskem
00050000-5640-b019-0084-7e90cbeb74cd	8263	Cerklje ob Krki
00050000-5640-b019-aed9-d12acacb68b7	1380	Cerknica
00050000-5640-b019-45f6-0388ad13e2c6	5282	Cerkno
00050000-5640-b019-4407-579374f0f386	2236	Cerkvenjak
00050000-5640-b019-3352-faae0f96e27f	2215	Ceršak
00050000-5640-b019-0d1a-73f1c10e8ab1	2326	Cirkovce
00050000-5640-b019-602c-c7e0249af6b6	2282	Cirkulane
00050000-5640-b019-e85c-6560185d79d3	5273	Col
00050000-5640-b019-be73-154bce86f8e8	8251	Čatež ob Savi
00050000-5640-b019-6403-302d4b15bd93	1413	Čemšenik
00050000-5640-b019-0a54-2d307aced50c	5253	Čepovan
00050000-5640-b019-f42f-e61b4a599ea9	9232	Črenšovci
00050000-5640-b019-47e3-6c34b1485a88	2393	Črna na Koroškem
00050000-5640-b019-cbeb-50247128f83b	6275	Črni Kal
00050000-5640-b019-4544-a0d74a2cffad	5274	Črni Vrh nad Idrijo
00050000-5640-b019-5d4d-6c643b4b7b62	5262	Črniče
00050000-5640-b019-1d5a-ab00400f5d92	8340	Črnomelj
00050000-5640-b019-e9d7-cc1a45ea22b1	6271	Dekani
00050000-5640-b019-36d2-4a279878dfaf	5210	Deskle
00050000-5640-b019-acbd-26fac7a2fc0e	2253	Destrnik
00050000-5640-b019-988d-10e9c9be1e49	6215	Divača
00050000-5640-b019-ed33-db4e7a38c5bd	1233	Dob
00050000-5640-b019-0f7e-20ada3dc8c35	3224	Dobje pri Planini
00050000-5640-b019-c103-cad71a7a797b	8257	Dobova
00050000-5640-b019-083a-5072dbde0dee	1423	Dobovec
00050000-5640-b019-4cf9-1c8772304276	5263	Dobravlje
00050000-5640-b019-c401-6d07f2d8b25c	3204	Dobrna
00050000-5640-b019-ca33-07498915cbf4	8211	Dobrnič
00050000-5640-b019-ebf0-afc2b3bfd0fe	1356	Dobrova
00050000-5640-b019-9b69-64444e0dd31e	9223	Dobrovnik/Dobronak 
00050000-5640-b019-d1fe-d2ec04d74ae6	5212	Dobrovo v Brdih
00050000-5640-b019-17b8-06adbfb81c63	1431	Dol pri Hrastniku
00050000-5640-b019-4069-09704fffd723	1262	Dol pri Ljubljani
00050000-5640-b019-2ef0-2b938e009786	1273	Dole pri Litiji
00050000-5640-b019-4981-4e4a9b6581cd	1331	Dolenja vas
00050000-5640-b019-f128-cba2239ac151	8350	Dolenjske Toplice
00050000-5640-b019-4bab-5c9cf3ffa449	1230	Domžale
00050000-5640-b019-bd95-7eda94ab5d27	2252	Dornava
00050000-5640-b019-f157-eb50fd58b394	5294	Dornberk
00050000-5640-b019-dcd9-fe17a92e9be0	1319	Draga
00050000-5640-b019-fcc6-0d7a26e18483	8343	Dragatuš
00050000-5640-b019-ce35-62895c25cb97	3222	Dramlje
00050000-5640-b019-187b-bc29b25c7a54	2370	Dravograd
00050000-5640-b019-97b5-34156e9f0ca3	4203	Duplje
00050000-5640-b019-7a12-53025399d270	6221	Dutovlje
00050000-5640-b019-bcee-58dde6497ec7	8361	Dvor
00050000-5640-b019-288b-4c196b7321bf	2343	Fala
00050000-5640-b019-8bff-a0b69dc757ba	9208	Fokovci
00050000-5640-b019-f173-60b062c73b87	2313	Fram
00050000-5640-b019-dded-693ea031637f	3213	Frankolovo
00050000-5640-b019-8e92-a321c6e8fc9d	1274	Gabrovka
00050000-5640-b019-6fd7-35e1f9965a94	8254	Globoko
00050000-5640-b019-a3b6-4b39eef07ec1	5275	Godovič
00050000-5640-b019-a742-15118e701868	4204	Golnik
00050000-5640-b019-3830-bec1c28ed00d	3303	Gomilsko
00050000-5640-b019-eb16-f7dc7f993367	4224	Gorenja vas
00050000-5640-b019-7a7e-eda7a298c82e	3263	Gorica pri Slivnici
00050000-5640-b019-e83a-4edd263ebf4d	2272	Gorišnica
00050000-5640-b019-8956-00af14c4fa56	9250	Gornja Radgona
00050000-5640-b019-1f3b-04266d00dc70	3342	Gornji Grad
00050000-5640-b019-bf58-208b59cfaa76	4282	Gozd Martuljek
00050000-5640-b019-6ae6-e9437e1c797f	6272	Gračišče
00050000-5640-b019-5d3b-e2d95c38cc58	9264	Grad
00050000-5640-b019-586f-081c22d760d3	8332	Gradac
00050000-5640-b019-06b6-5a9494476e2f	1384	Grahovo
00050000-5640-b019-e6be-0f7ae347984a	5242	Grahovo ob Bači
00050000-5640-b019-2080-7ba8c8eef7c5	5251	Grgar
00050000-5640-b019-1b4a-1e6104255499	3302	Griže
00050000-5640-b019-eb7d-0200cd6e8b1b	3231	Grobelno
00050000-5640-b019-f6ab-bd47e99dbd49	1290	Grosuplje
00050000-5640-b019-5896-4dbac04d8ca2	2288	Hajdina
00050000-5640-b019-1289-05aff0bfef11	8362	Hinje
00050000-5640-b019-52c6-78d605a220d2	2311	Hoče
00050000-5640-b019-e0d2-01e73ea58927	9205	Hodoš/Hodos
00050000-5640-b019-a94f-015703da7b47	1354	Horjul
00050000-5640-b019-a4b1-860b03a9d92c	1372	Hotedršica
00050000-5640-b019-1d76-a53437dc40ae	1430	Hrastnik
00050000-5640-b019-42cf-8faaa1480601	6225	Hruševje
00050000-5640-b019-a382-0a775013223a	4276	Hrušica
00050000-5640-b019-3e5d-14e464bf67d4	5280	Idrija
00050000-5640-b019-4b1d-558ea4ebcd61	1292	Ig
00050000-5640-b019-e458-6bda2556c20f	6250	Ilirska Bistrica
00050000-5640-b019-312c-6a6db5838cb6	6251	Ilirska Bistrica-Trnovo
00050000-5640-b019-22cf-f66ccff0aa30	1295	Ivančna Gorica
00050000-5640-b019-5a6a-335cc42dbf71	2259	Ivanjkovci
00050000-5640-b019-fb90-3b87b1a010dc	1411	Izlake
00050000-5640-b019-349c-68fa66810ad9	6310	Izola/Isola
00050000-5640-b019-9d71-61bd3453268d	2222	Jakobski Dol
00050000-5640-b019-329b-d0a6ba0ae9a1	2221	Jarenina
00050000-5640-b019-0ee9-c27b0af42803	6254	Jelšane
00050000-5640-b019-dfa4-2ed5e0d426a1	4270	Jesenice
00050000-5640-b019-0072-b30afde581ce	8261	Jesenice na Dolenjskem
00050000-5640-b019-0f0e-0b38c33cf652	3273	Jurklošter
00050000-5640-b019-58d2-a20755cd50dc	2223	Jurovski Dol
00050000-5640-b019-aba7-92f999afae6c	2256	Juršinci
00050000-5640-b019-2add-5adaa1e6b186	5214	Kal nad Kanalom
00050000-5640-b019-254f-260bc61a1ed0	3233	Kalobje
00050000-5640-b019-55a7-6d2f919f53d1	4246	Kamna Gorica
00050000-5640-b019-01b5-130ac560f739	2351	Kamnica
00050000-5640-b019-2739-5f240ce6a10a	1241	Kamnik
00050000-5640-b019-d430-66f7ec73b2ec	5213	Kanal
00050000-5640-b019-633a-c07b748d54cd	8258	Kapele
00050000-5640-b019-49fd-c0300e84753e	2362	Kapla
00050000-5640-b019-50bc-21f1235173bc	2325	Kidričevo
00050000-5640-b019-47bc-4c3834227140	1412	Kisovec
00050000-5640-b019-5b38-f72ab94feb46	6253	Knežak
00050000-5640-b019-43bf-4f64487e0987	5222	Kobarid
00050000-5640-b019-5c99-fa86c49892eb	9227	Kobilje
00050000-5640-b019-81ff-742dfb4de4d2	1330	Kočevje
00050000-5640-b019-8a40-19cbe96c88b2	1338	Kočevska Reka
00050000-5640-b019-910c-66fc53ddb0a6	2276	Kog
00050000-5640-b019-956b-40fbb08d4c71	5211	Kojsko
00050000-5640-b019-fa5f-81a3aff3f4d1	6223	Komen
00050000-5640-b019-69b9-2fda680fc99f	1218	Komenda
00050000-5640-b019-bf4e-e3511778b31a	6000	Koper/Capodistria 
00050000-5640-b019-9caa-18f47f8dd324	6001	Koper/Capodistria - poštni predali
00050000-5640-b019-1dd4-393fe97f203c	8282	Koprivnica
00050000-5640-b019-80d2-2f708507c179	5296	Kostanjevica na Krasu
00050000-5640-b019-509a-b2e4c49a1493	8311	Kostanjevica na Krki
00050000-5640-b019-de5e-d449bd750f26	1336	Kostel
00050000-5640-b019-6dc3-f18889d44b42	6256	Košana
00050000-5640-b019-9307-ace797b6e1a9	2394	Kotlje
00050000-5640-b019-719f-c9af67d43ac3	6240	Kozina
00050000-5640-b019-d2cb-d6f716b85286	3260	Kozje
00050000-5640-b019-f7b1-f0ea7a94d428	4000	Kranj 
00050000-5640-b019-5545-2fad2b04a6bf	4001	Kranj - poštni predali
00050000-5640-b019-360a-0e23d855f18e	4280	Kranjska Gora
00050000-5640-b019-3401-544cdb8bae53	1281	Kresnice
00050000-5640-b019-9e2f-39362d8d23b3	4294	Križe
00050000-5640-b019-cbfd-d19064088983	9206	Križevci
00050000-5640-b019-d88e-f43f76a9864e	9242	Križevci pri Ljutomeru
00050000-5640-b019-1e04-cc3e5890cf0c	1301	Krka
00050000-5640-b019-9391-6009ec8213b9	8296	Krmelj
00050000-5640-b019-1e55-4d5abd8d44d8	4245	Kropa
00050000-5640-b019-b06a-7b043770cd92	8262	Krška vas
00050000-5640-b019-e5dc-472dc3d2bd62	8270	Krško
00050000-5640-b019-95b8-49757b6789a2	9263	Kuzma
00050000-5640-b019-de96-6e0162b3b418	2318	Laporje
00050000-5640-b019-459a-ef8bccb56373	3270	Laško
00050000-5640-b019-e6c6-71462d5088ef	1219	Laze v Tuhinju
00050000-5640-b019-0b50-878366f81eb4	2230	Lenart v Slovenskih goricah
00050000-5640-b019-aa32-05136f87a18d	9220	Lendava/Lendva
00050000-5640-b019-9b60-c45f6ec3ad13	4248	Lesce
00050000-5640-b019-d25d-8ab1f13a8be1	3261	Lesično
00050000-5640-b019-9d7f-b2580faa41e1	8273	Leskovec pri Krškem
00050000-5640-b019-748b-a6939780fb6f	2372	Libeliče
00050000-5640-b019-b7ed-fa985ac4ce54	2341	Limbuš
00050000-5640-b019-0a62-0fbd484d3b26	1270	Litija
00050000-5640-b019-37ed-704013fe6ed2	3202	Ljubečna
00050000-5640-b019-59e4-926836997171	1000	Ljubljana 
00050000-5640-b019-28bb-4c1d35d4120c	1001	Ljubljana - poštni predali
00050000-5640-b019-d651-1d6bbf4d0b2f	1231	Ljubljana - Črnuče
00050000-5640-b019-0556-6a5221c9b510	1261	Ljubljana - Dobrunje
00050000-5640-b019-d318-5c800de3e9ac	1260	Ljubljana - Polje
00050000-5640-b019-2239-daf6a49bf91e	1210	Ljubljana - Šentvid
00050000-5640-b019-31ea-5506b6b53eaf	1211	Ljubljana - Šmartno
00050000-5640-b019-9ff7-983e8fb31671	3333	Ljubno ob Savinji
00050000-5640-b019-f435-76e90e1ecdfd	9240	Ljutomer
00050000-5640-b019-35a4-dea328b044ff	3215	Loče
00050000-5640-b019-cf0e-4aa4331c2cce	5231	Log pod Mangartom
00050000-5640-b019-f361-bd53b00fa9c6	1358	Log pri Brezovici
00050000-5640-b019-dc7c-fcb870c30f3b	1370	Logatec
00050000-5640-b019-0dd1-8a508b5b391e	1371	Logatec
00050000-5640-b019-2c62-8ce65e212c30	1434	Loka pri Zidanem Mostu
00050000-5640-b019-728b-a67aec98e2a6	3223	Loka pri Žusmu
00050000-5640-b019-add0-d18947d55daa	6219	Lokev
00050000-5640-b019-6667-d369da28fe49	1318	Loški Potok
00050000-5640-b019-5625-1a8033cf6f1b	2324	Lovrenc na Dravskem polju
00050000-5640-b019-4b17-8b514c1b27c2	2344	Lovrenc na Pohorju
00050000-5640-b019-a49b-6b55368a1221	3334	Luče
00050000-5640-b019-ba27-b5156012616e	1225	Lukovica
00050000-5640-b019-c9a9-263543c6db28	9202	Mačkovci
00050000-5640-b019-908a-4723754c613b	2322	Majšperk
00050000-5640-b019-2798-03517d932f8f	2321	Makole
00050000-5640-b019-c1af-fa46df1b27a7	9243	Mala Nedelja
00050000-5640-b019-8596-1fea1eb87dcc	2229	Malečnik
00050000-5640-b019-c606-c24a1f5d76fd	6273	Marezige
00050000-5640-b019-3466-440c7be9e148	2000	Maribor 
00050000-5640-b019-adb6-b3ea5439cea2	2001	Maribor - poštni predali
00050000-5640-b019-8c89-70a2c5a58731	2206	Marjeta na Dravskem polju
00050000-5640-b019-6f68-d489e7067aad	2281	Markovci
00050000-5640-b019-2f29-319c6d4e815d	9221	Martjanci
00050000-5640-b019-f8fe-df91167f8645	6242	Materija
00050000-5640-b019-f5cf-6563e2090e69	4211	Mavčiče
00050000-5640-b019-ae69-b1658c45229b	1215	Medvode
00050000-5640-b019-69f4-9b2bfd924270	1234	Mengeš
00050000-5640-b019-0e57-511c633c5423	8330	Metlika
00050000-5640-b019-fb62-8758d36bd5c2	2392	Mežica
00050000-5640-b019-835a-f288278bb21e	2204	Miklavž na Dravskem polju
00050000-5640-b019-3a09-f74a88113582	2275	Miklavž pri Ormožu
00050000-5640-b019-8e59-e3273b8eea07	5291	Miren
00050000-5640-b019-1d03-8438e18e9199	8233	Mirna
00050000-5640-b019-e23b-9d6c00b52796	8216	Mirna Peč
00050000-5640-b019-579a-bcbfc6599647	2382	Mislinja
00050000-5640-b019-5b91-fd908b644cbf	4281	Mojstrana
00050000-5640-b019-a06f-739dd8bce093	8230	Mokronog
00050000-5640-b019-e70e-81419ae86da7	1251	Moravče
00050000-5640-b019-09e4-69490f3517b6	9226	Moravske Toplice
00050000-5640-b019-fd61-5ea0ba3d3cb5	5216	Most na Soči
00050000-5640-b019-f8ac-ef91d71dc4b3	1221	Motnik
00050000-5640-b019-c141-4ade131fdeab	3330	Mozirje
00050000-5640-b019-d77f-3c5f3e7ad46f	9000	Murska Sobota 
00050000-5640-b019-6380-7aedee8497fc	9001	Murska Sobota - poštni predali
00050000-5640-b019-518f-649155442cad	2366	Muta
00050000-5640-b019-e5dc-4a872122efba	4202	Naklo
00050000-5640-b019-d493-ea62efee22fe	3331	Nazarje
00050000-5640-b019-4c75-2429d333f8a9	1357	Notranje Gorice
00050000-5640-b019-ef5e-57f3ab45840e	3203	Nova Cerkev
00050000-5640-b019-7448-f8c034dfa10b	5000	Nova Gorica 
00050000-5640-b019-37b7-68e0f5c3e075	5001	Nova Gorica - poštni predali
00050000-5640-b019-c434-f87081e93a55	1385	Nova vas
00050000-5640-b019-435c-a5b40e420238	8000	Novo mesto
00050000-5640-b019-1ef6-478b73f777e4	8001	Novo mesto - poštni predali
00050000-5640-b019-8bff-3c9075aabe6d	6243	Obrov
00050000-5640-b019-f821-768d79f0866a	9233	Odranci
00050000-5640-b019-fbf1-c364312428af	2317	Oplotnica
00050000-5640-b019-7b20-a0eaffe4233a	2312	Orehova vas
00050000-5640-b019-9c15-6fd87f2a12fe	2270	Ormož
00050000-5640-b019-3dfd-c72670905315	1316	Ortnek
00050000-5640-b019-a07e-598717141c6e	1337	Osilnica
00050000-5640-b019-32fb-035019bfa2e5	8222	Otočec
00050000-5640-b019-121c-3634c7352022	2361	Ožbalt
00050000-5640-b019-07db-f54948431ea8	2231	Pernica
00050000-5640-b019-e70e-c34354ca1e27	2211	Pesnica pri Mariboru
00050000-5640-b019-595c-ecc7a61844c5	9203	Petrovci
00050000-5640-b019-9ae8-4f05ac1f3c94	3301	Petrovče
00050000-5640-b019-f732-7580ce8895e8	6330	Piran/Pirano
00050000-5640-b019-ceda-8a27312f33f3	8255	Pišece
00050000-5640-b019-1b3d-f1f3d9a9ae39	6257	Pivka
00050000-5640-b019-afae-66f4da640de2	6232	Planina
00050000-5640-b019-2359-5c916cc080e4	3225	Planina pri Sevnici
00050000-5640-b019-9a71-8c32e58cdd84	6276	Pobegi
00050000-5640-b019-43b9-abaa881ac66e	8312	Podbočje
00050000-5640-b019-0938-14b9ab4757d0	5243	Podbrdo
00050000-5640-b019-add2-7b922b9bbeb4	3254	Podčetrtek
00050000-5640-b019-ff3d-fc1140e58905	2273	Podgorci
00050000-5640-b019-78ce-b77af8c87eea	6216	Podgorje
00050000-5640-b019-f816-fec8aebfdc1e	2381	Podgorje pri Slovenj Gradcu
00050000-5640-b019-32cf-d17fb33d1ca2	6244	Podgrad
00050000-5640-b019-8e0e-d339b1f9b570	1414	Podkum
00050000-5640-b019-562c-dd636d51ddaf	2286	Podlehnik
00050000-5640-b019-34b1-a3a82cdd57cb	5272	Podnanos
00050000-5640-b019-a509-ec6526046914	4244	Podnart
00050000-5640-b019-7220-105a85954d91	3241	Podplat
00050000-5640-b019-7240-392f02c6311a	3257	Podsreda
00050000-5640-b019-6000-4878b23fe469	2363	Podvelka
00050000-5640-b019-67f6-18d1c08f3fd1	2208	Pohorje
00050000-5640-b019-7e52-dcf71ab7c6e6	2257	Polenšak
00050000-5640-b019-20c9-1003b0591bc6	1355	Polhov Gradec
00050000-5640-b019-6ee8-a82241c755b6	4223	Poljane nad Škofjo Loko
00050000-5640-b019-d6f4-dedf548eb270	2319	Poljčane
00050000-5640-b019-b20b-90ddad5b3987	1272	Polšnik
00050000-5640-b019-a8a1-c55c7e56fc8e	3313	Polzela
00050000-5640-b019-29a8-b23f67c29fcc	3232	Ponikva
00050000-5640-b019-4185-249b1b4e957a	6320	Portorož/Portorose
00050000-5640-b019-190a-a7128e74d4e0	6230	Postojna
00050000-5640-b019-475d-c13db99d6007	2331	Pragersko
00050000-5640-b019-c2ac-ac7d83b4fdce	3312	Prebold
00050000-5640-b019-cdf6-8f16178d7d9d	4205	Preddvor
00050000-5640-b019-17bb-aaba48cf8528	6255	Prem
00050000-5640-b019-2c01-edf019c37661	1352	Preserje
00050000-5640-b019-0ba5-2532008ecde9	6258	Prestranek
00050000-5640-b019-1f79-b831f34424c3	2391	Prevalje
00050000-5640-b019-f4a4-af741947f7bf	3262	Prevorje
00050000-5640-b019-2749-f66ffc2681ba	1276	Primskovo 
00050000-5640-b019-3747-4959a2beaca9	3253	Pristava pri Mestinju
00050000-5640-b019-66fd-edc5ef4d5e1c	9207	Prosenjakovci/Partosfalva
00050000-5640-b019-a4a5-d6046732413e	5297	Prvačina
00050000-5640-b019-d060-7d0f8787dd06	2250	Ptuj
00050000-5640-b019-2ed3-6cddcfff5758	2323	Ptujska Gora
00050000-5640-b019-b28d-9807ad471901	9201	Puconci
00050000-5640-b019-cba0-3709d33101ec	2327	Rače
00050000-5640-b019-e6ce-723f537a45a5	1433	Radeče
00050000-5640-b019-45b8-926fe1d08a6c	9252	Radenci
00050000-5640-b019-ad66-c6d629fa9206	2360	Radlje ob Dravi
00050000-5640-b019-8459-f0d011745aee	1235	Radomlje
00050000-5640-b019-8b20-a46badc5be68	4240	Radovljica
00050000-5640-b019-27a7-309f9ed730b7	8274	Raka
00050000-5640-b019-36d0-0e7abd84d1b8	1381	Rakek
00050000-5640-b019-ee6b-b92f527f8dbe	4283	Rateče - Planica
00050000-5640-b019-cece-20ae38e2fcb3	2390	Ravne na Koroškem
00050000-5640-b019-bb02-b4bd64d49caf	9246	Razkrižje
00050000-5640-b019-8eac-be28bd26cbbb	3332	Rečica ob Savinji
00050000-5640-b019-7e1d-9c176c74a87b	5292	Renče
00050000-5640-b019-1ed8-9f7742ef53e8	1310	Ribnica
00050000-5640-b019-be23-101aaea64fda	2364	Ribnica na Pohorju
00050000-5640-b019-910a-39899577c8fb	3272	Rimske Toplice
00050000-5640-b019-660f-981df51c26a5	1314	Rob
00050000-5640-b019-8138-802fe9311c1c	5215	Ročinj
00050000-5640-b019-33d0-c6ce326d63b6	3250	Rogaška Slatina
00050000-5640-b019-9743-a8dc2c4d77e1	9262	Rogašovci
00050000-5640-b019-12cb-21a6b38ba58c	3252	Rogatec
00050000-5640-b019-17f9-2371ee65e30f	1373	Rovte
00050000-5640-b019-0be2-b449baecd7bf	2342	Ruše
00050000-5640-b019-b49d-27b754759491	1282	Sava
00050000-5640-b019-57ac-a4f37bd6b61b	6333	Sečovlje/Sicciole
00050000-5640-b019-9f84-22882ea0818b	4227	Selca
00050000-5640-b019-4f66-4fa18f735772	2352	Selnica ob Dravi
00050000-5640-b019-0e53-532a66330ece	8333	Semič
00050000-5640-b019-f82b-67a5ec03c2ed	8281	Senovo
00050000-5640-b019-336e-89b805ccb740	6224	Senožeče
00050000-5640-b019-ea72-ec19ebb59551	8290	Sevnica
00050000-5640-b019-bac7-5c9ad47a3cf0	6210	Sežana
00050000-5640-b019-0677-3b61960929a9	2214	Sladki Vrh
00050000-5640-b019-d191-e219a3623e1f	5283	Slap ob Idrijci
00050000-5640-b019-1bfc-ed121970311c	2380	Slovenj Gradec
00050000-5640-b019-e9ac-6cb5eed757ea	2310	Slovenska Bistrica
00050000-5640-b019-cc8b-2da2e660efcf	3210	Slovenske Konjice
00050000-5640-b019-c87c-6f0596b1313f	1216	Smlednik
00050000-5640-b019-43f5-aa919413ae12	5232	Soča
00050000-5640-b019-a432-a679907d71ca	1317	Sodražica
00050000-5640-b019-173b-ab2e62deb5ed	3335	Solčava
00050000-5640-b019-27ca-a8e87cf5a4e9	5250	Solkan
00050000-5640-b019-7a21-e02b716ff2c6	4229	Sorica
00050000-5640-b019-795c-0bdf1e61fe37	4225	Sovodenj
00050000-5640-b019-2d64-e0b8717559f6	5281	Spodnja Idrija
00050000-5640-b019-e375-ecb2ed7f4ffd	2241	Spodnji Duplek
00050000-5640-b019-422a-4e6f702861bd	9245	Spodnji Ivanjci
00050000-5640-b019-00f1-75d86dd85cb5	2277	Središče ob Dravi
00050000-5640-b019-5840-43841fa57d1f	4267	Srednja vas v Bohinju
00050000-5640-b019-c096-e1c482bea584	8256	Sromlje 
00050000-5640-b019-c23a-2ea8c85f1425	5224	Srpenica
00050000-5640-b019-d2ad-fdf704c84a9b	1242	Stahovica
00050000-5640-b019-9107-403e17fe2a4f	1332	Stara Cerkev
00050000-5640-b019-2391-9dd019e1dd21	8342	Stari trg ob Kolpi
00050000-5640-b019-b2ae-c7e711ac945a	1386	Stari trg pri Ložu
00050000-5640-b019-eccb-42f935aa9902	2205	Starše
00050000-5640-b019-b1b1-53a68869bd41	2289	Stoperce
00050000-5640-b019-2548-d18dc8e3f688	8322	Stopiče
00050000-5640-b019-24c8-8d759b7ec99e	3206	Stranice
00050000-5640-b019-e888-5f4041fcd9c1	8351	Straža
00050000-5640-b019-9aea-640f1444d3e0	1313	Struge
00050000-5640-b019-e638-81f6bc3363f6	8293	Studenec
00050000-5640-b019-1426-8ae885d53c1e	8331	Suhor
00050000-5640-b019-d968-01e0aba7bb01	2233	Sv. Ana v Slovenskih goricah
00050000-5640-b019-8736-2ec26c45c087	2235	Sv. Trojica v Slovenskih goricah
00050000-5640-b019-d7d3-94760ebd7681	2353	Sveti Duh na Ostrem Vrhu
00050000-5640-b019-3ce3-8d2e3856a7c6	9244	Sveti Jurij ob Ščavnici
00050000-5640-b019-787c-717a1f0cb6d9	3264	Sveti Štefan
00050000-5640-b019-5fdc-099619dbcb8d	2258	Sveti Tomaž
00050000-5640-b019-e062-434f308f8b90	9204	Šalovci
00050000-5640-b019-bc10-e25b41a149a0	5261	Šempas
00050000-5640-b019-1717-df5974912b2c	5290	Šempeter pri Gorici
00050000-5640-b019-1afa-8d8bcb4b8143	3311	Šempeter v Savinjski dolini
00050000-5640-b019-ce06-644aba2216fe	4208	Šenčur
00050000-5640-b019-b48e-4eea58a2bf4c	2212	Šentilj v Slovenskih goricah
00050000-5640-b019-046e-148fa11f171e	8297	Šentjanž
00050000-5640-b019-b891-3232d544deb5	2373	Šentjanž pri Dravogradu
00050000-5640-b019-2961-7579afc055dc	8310	Šentjernej
00050000-5640-b019-12ef-349afad7d3a6	3230	Šentjur
00050000-5640-b019-b0ec-53a261ed98df	3271	Šentrupert
00050000-5640-b019-7fc7-2300c09e57b8	8232	Šentrupert
00050000-5640-b019-b8d1-f863d86d63c2	1296	Šentvid pri Stični
00050000-5640-b019-6e25-d75a602eebfd	8275	Škocjan
00050000-5640-b019-dda2-d50c96111eec	6281	Škofije
00050000-5640-b019-1e65-7ffddca64c86	4220	Škofja Loka
00050000-5640-b019-2e59-302b6b06c01b	3211	Škofja vas
00050000-5640-b019-9af7-c6d9747003fb	1291	Škofljica
00050000-5640-b019-cb6a-4e1227a269a1	6274	Šmarje
00050000-5640-b019-ca84-08364ada7c24	1293	Šmarje - Sap
00050000-5640-b019-fc28-de0139f94d62	3240	Šmarje pri Jelšah
00050000-5640-b019-93b0-3c260dd877b2	8220	Šmarješke Toplice
00050000-5640-b019-5c4d-b5c91588691a	2315	Šmartno na Pohorju
00050000-5640-b019-407d-b552cbdc7165	3341	Šmartno ob Dreti
00050000-5640-b019-605f-61ed6ca7de6e	3327	Šmartno ob Paki
00050000-5640-b019-1e12-88c9dfd5c74a	1275	Šmartno pri Litiji
00050000-5640-b019-df3e-10fe88d9c2ee	2383	Šmartno pri Slovenj Gradcu
00050000-5640-b019-82f5-bc995c8f8763	3201	Šmartno v Rožni dolini
00050000-5640-b019-d956-1ac210cb1bef	3325	Šoštanj
00050000-5640-b019-9015-086b7f0f4823	6222	Štanjel
00050000-5640-b019-d04e-cd4b416aafd8	3220	Štore
00050000-5640-b019-bffa-bc80c15ee534	3304	Tabor
00050000-5640-b019-19ff-b19a67ec71d3	3221	Teharje
00050000-5640-b019-adbe-2becc4d0159b	9251	Tišina
00050000-5640-b019-929c-422969a7a590	5220	Tolmin
00050000-5640-b019-c51e-35ed33e863cd	3326	Topolšica
00050000-5640-b019-aeb6-3ba16f2ed283	2371	Trbonje
00050000-5640-b019-0811-be45fdea633e	1420	Trbovlje
00050000-5640-b019-7c87-740caf70350d	8231	Trebelno 
00050000-5640-b019-4bc5-4278032966dd	8210	Trebnje
00050000-5640-b019-573b-f9bb049da5b2	5252	Trnovo pri Gorici
00050000-5640-b019-e9df-b00011a1e49d	2254	Trnovska vas
00050000-5640-b019-1e94-a67cbc377dfd	1222	Trojane
00050000-5640-b019-3f2f-ea5604a4dcbb	1236	Trzin
00050000-5640-b019-a157-e7634fd5a0a3	4290	Tržič
00050000-5640-b019-a8b0-aaffd11c3ae8	8295	Tržišče
00050000-5640-b019-aaad-f0301af3c3a9	1311	Turjak
00050000-5640-b019-0ac0-5758d4b443ce	9224	Turnišče
00050000-5640-b019-cfa1-52270d6d2aa0	8323	Uršna sela
00050000-5640-b019-cb34-1d4a98f8affc	1252	Vače
00050000-5640-b019-8987-95ab0b87ec64	3320	Velenje 
00050000-5640-b019-3257-7cb8109f972c	3322	Velenje - poštni predali
00050000-5640-b019-f068-5496aedaa587	8212	Velika Loka
00050000-5640-b019-eab2-02a5346bd17f	2274	Velika Nedelja
00050000-5640-b019-bb53-e1aae72a6f59	9225	Velika Polana
00050000-5640-b019-e610-f91c5eca500b	1315	Velike Lašče
00050000-5640-b019-4517-b0f169e06d45	8213	Veliki Gaber
00050000-5640-b019-f1f7-22cd1b8b0ecc	9241	Veržej
00050000-5640-b019-b807-bfd5bdacdadc	1312	Videm - Dobrepolje
00050000-5640-b019-d0aa-ec4292f1d7b2	2284	Videm pri Ptuju
00050000-5640-b019-e349-071d46ad3f16	8344	Vinica
00050000-5640-b019-2943-ee4b4a6c6035	5271	Vipava
00050000-5640-b019-3f28-8cee67fa60d9	4212	Visoko
00050000-5640-b019-c5f1-f86c764dadf9	1294	Višnja Gora
00050000-5640-b019-c2d5-b6f05b3e8430	3205	Vitanje
00050000-5640-b019-289e-7efa04a6449e	2255	Vitomarci
00050000-5640-b019-363b-03d8fc9c0507	1217	Vodice
00050000-5640-b019-6242-c0e4a6e4ea1a	3212	Vojnik\t
00050000-5640-b019-5c48-8e668e585853	5293	Volčja Draga
00050000-5640-b019-556b-e7b2d5d72463	2232	Voličina
00050000-5640-b019-ac66-6157436bb8c5	3305	Vransko
00050000-5640-b019-1f9e-46493ed23ba6	6217	Vremski Britof
00050000-5640-b019-29bd-a85d66635c3c	1360	Vrhnika
00050000-5640-b019-100a-d10d04e39df7	2365	Vuhred
00050000-5640-b019-4f56-253cc424b5f6	2367	Vuzenica
00050000-5640-b019-deca-68d125542e36	8292	Zabukovje 
00050000-5640-b019-004c-47378ac1e18c	1410	Zagorje ob Savi
00050000-5640-b019-b969-826b76f9b906	1303	Zagradec
00050000-5640-b019-6182-a85bc6676a4b	2283	Zavrč
00050000-5640-b019-da92-5fa744324e81	8272	Zdole 
00050000-5640-b019-e31d-fe46e035b7bc	4201	Zgornja Besnica
00050000-5640-b019-1c25-e8a3e42af044	2242	Zgornja Korena
00050000-5640-b019-1051-f589f512e0e9	2201	Zgornja Kungota
00050000-5640-b019-b646-d8d609b4090a	2316	Zgornja Ložnica
00050000-5640-b019-5a5a-692b3c5ff97f	2314	Zgornja Polskava
00050000-5640-b019-0f5f-2c71d05c13e2	2213	Zgornja Velka
00050000-5640-b019-85c4-e538823c71ee	4247	Zgornje Gorje
00050000-5640-b019-1b4a-bafbc9514a8f	4206	Zgornje Jezersko
00050000-5640-b019-55e5-30d9363a8f54	2285	Zgornji Leskovec
00050000-5640-b019-12f8-aa344ea1f797	1432	Zidani Most
00050000-5640-b019-22c0-03ce426641bd	3214	Zreče
00050000-5640-b019-2bc0-eea87d377d52	4209	Žabnica
00050000-5640-b019-4a59-f2acccecf962	3310	Žalec
00050000-5640-b019-b47f-6cc6d30de932	4228	Železniki
00050000-5640-b019-ee36-d69c555b231e	2287	Žetale
00050000-5640-b019-654e-5df42f63192a	4226	Žiri
00050000-5640-b019-9de9-afd28938c521	4274	Žirovnica
00050000-5640-b019-6cf9-d025a64d9226	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 25873891)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 25873467)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 25873215)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5640-b01d-5498-63b6b7b14e3f	00080000-5640-b01d-c43e-ab9241962a32	\N	00040000-5640-b019-5867-aa418832f24d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5640-b01d-bb14-119827da0236	00080000-5640-b01d-c43e-ab9241962a32	\N	00040000-5640-b019-5867-aa418832f24d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5640-b01d-d41b-e4c79e0dbc67	00080000-5640-b01d-b63b-5b8043c02515	\N	00040000-5640-b019-5867-aa418832f24d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3120 (class 0 OID 25873359)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5640-b01a-de58-103f16ff1970	novo leto	1	1	\N	t
00430000-5640-b01a-c8eb-5561f3aba9fc	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5640-b01a-01e5-3cc9821e8962	dan upora proti okupatorju	27	4	\N	t
00430000-5640-b01a-c770-31951d912468	praznik dela	1	5	\N	t
00430000-5640-b01a-92ff-90885f2f28dd	praznik dela	2	5	\N	t
00430000-5640-b01a-83d7-a9f772ba0665	dan Primoža Trubarja	8	6	\N	f
00430000-5640-b01a-3527-c2d6a15453fe	dan državnosti	25	6	\N	t
00430000-5640-b01a-5a65-61e6fb2968cd	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5640-b01a-8757-2c53d819c07c	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5640-b01a-d134-cc215d6237be	dan suverenosti	25	10	\N	f
00430000-5640-b01a-b02b-3a9cc942fcf7	dan spomina na mrtve	1	11	\N	t
00430000-5640-b01a-fb95-242b2efc8ab9	dan Rudolfa Maistra	23	11	\N	f
00430000-5640-b01a-d08d-13f8a25cd529	božič	25	12	\N	t
00430000-5640-b01a-ba61-2e7baeeed2d6	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5640-b01a-9fcc-bd96f748b430	Marijino vnebovzetje	15	8	\N	t
00430000-5640-b01a-705f-678d1e448ae2	dan reformacije	31	10	\N	t
00430000-5640-b01a-e535-1443db18d86f	velikonočna nedelja	27	3	2016	t
00430000-5640-b01a-f68c-14f53c6379f5	velikonočna nedelja	16	4	2017	t
00430000-5640-b01a-1170-b3a300b338d6	velikonočna nedelja	1	4	2018	t
00430000-5640-b01a-ed45-4d266e8a98db	velikonočna nedelja	21	4	2019	t
00430000-5640-b01a-447b-41841dc7535c	velikonočna nedelja	12	4	2020	t
00430000-5640-b01a-537d-55af8536c1e3	velikonočna nedelja	4	4	2021	t
00430000-5640-b01a-f966-5722ebc511e5	velikonočna nedelja	17	4	2022	t
00430000-5640-b01a-c4bb-4aa686ba4459	velikonočna nedelja	9	4	2023	t
00430000-5640-b01a-8427-ad79fce375c6	velikonočna nedelja	31	3	2024	t
00430000-5640-b01a-c419-eb489eb89060	velikonočna nedelja	20	4	2025	t
00430000-5640-b01a-27f0-629d5fd5ab5a	velikonočna nedelja	5	4	2026	t
00430000-5640-b01a-e12a-66bfd0684492	velikonočna nedelja	28	3	2027	t
00430000-5640-b01a-08bb-961ee8fb9d68	velikonočna nedelja	16	4	2028	t
00430000-5640-b01a-2000-a05d9daac832	velikonočna nedelja	1	4	2029	t
00430000-5640-b01a-98fd-6ad8c6f61deb	velikonočna nedelja	21	4	2030	t
00430000-5640-b01a-315b-8069a486bd4e	velikonočni ponedeljek	28	3	2016	t
00430000-5640-b01a-0385-cd9cdb72c87c	velikonočni ponedeljek	17	4	2017	t
00430000-5640-b01a-46c6-9c8d6d214272	velikonočni ponedeljek	2	4	2018	t
00430000-5640-b01a-5171-8f32294ead7d	velikonočni ponedeljek	22	4	2019	t
00430000-5640-b01a-2b18-68de89bcc1ae	velikonočni ponedeljek	13	4	2020	t
00430000-5640-b01a-7c0f-e0c6d226f5f5	velikonočni ponedeljek	5	4	2021	t
00430000-5640-b01a-41a9-a17abeb1c920	velikonočni ponedeljek	18	4	2022	t
00430000-5640-b01a-d1ce-ddfd1f14ae3f	velikonočni ponedeljek	10	4	2023	t
00430000-5640-b01a-4a5f-33748311aff9	velikonočni ponedeljek	1	4	2024	t
00430000-5640-b01a-c47f-67ad284db189	velikonočni ponedeljek	21	4	2025	t
00430000-5640-b01a-4b01-dda364f3b220	velikonočni ponedeljek	6	4	2026	t
00430000-5640-b01a-34b3-5075baf4c8f9	velikonočni ponedeljek	29	3	2027	t
00430000-5640-b01a-fe3c-d7417670c88f	velikonočni ponedeljek	17	4	2028	t
00430000-5640-b01a-ee81-c4334e48212c	velikonočni ponedeljek	2	4	2029	t
00430000-5640-b01a-a602-6082f558052c	velikonočni ponedeljek	22	4	2030	t
00430000-5640-b01a-c1b3-f6d1d8f45df4	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5640-b01a-bf05-f23832035ccc	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5640-b01a-e60c-465d76c4bd59	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5640-b01a-b863-d6678d9ecfa5	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5640-b01a-974c-8a1a5170b89e	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5640-b01a-9f2b-187d858a3cce	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5640-b01a-ddfe-03fb57376c80	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5640-b01a-f1ef-7e38e61567d2	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5640-b01a-2f2b-2b0047bbdf29	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5640-b01a-1bd1-b118b8e8eb51	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5640-b01a-ffb2-fcef08a45c54	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5640-b01a-2cc2-e78a0cdcc2c8	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5640-b01a-0d01-a68618376879	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5640-b01a-1de2-38bc6b5b1d70	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5640-b01a-f6ff-fbdbf6e5aa8b	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 25873319)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 25873331)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 25873479)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 25873905)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 25873915)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5640-b029-2138-b0e016038180	00080000-5640-b01d-feca-4068eabacd03	0987	AK
00190000-5640-b029-cbca-fa6643a908a1	00080000-5640-b01d-b63b-5b8043c02515	0989	AK
00190000-5640-b029-d317-addfc0547af8	00080000-5640-b01d-94a4-c6be54ca0c07	0986	AK
00190000-5640-b029-49ec-f957ecf6e434	00080000-5640-b01d-e2e9-b7cf0dc13c6a	0984	AK
00190000-5640-b029-eeed-72601ce8a47a	00080000-5640-b01d-886a-f29cde711363	0983	AK
00190000-5640-b029-ed59-fdc29fb6335e	00080000-5640-b01d-0112-6ab0bc1d20e3	0982	AK
00190000-5640-b02c-bb9a-13aa2449cd2b	00080000-5640-b02c-c18a-8419620860ed	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 25873814)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5640-b029-a338-d394fa457c7e	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3161 (class 0 OID 25873923)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 25873508)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5640-b01d-58bf-a199cf25a341	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5640-b01d-3fc9-1a3282566fea	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5640-b01d-21f2-260a28075e68	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5640-b01d-474b-9e00a79f8e7d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5640-b01d-858f-e903fb72cc85	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5640-b01d-1202-495e5aa8f147	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5640-b01d-c6b4-a9f32dab30a6	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3129 (class 0 OID 25873452)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 25873442)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 25873653)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 25873583)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 25873293)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 25873055)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5640-b02c-c18a-8419620860ed	00010000-5640-b01a-6a16-187ae7be4eac	2015-11-09 15:39:40	INS	a:0:{}
2	App\\Entity\\Option	00000000-5640-b02c-18e4-fbbb7b35a421	00010000-5640-b01a-6a16-187ae7be4eac	2015-11-09 15:39:40	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5640-b02c-bb9a-13aa2449cd2b	00010000-5640-b01a-6a16-187ae7be4eac	2015-11-09 15:39:40	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 25873521)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 25873093)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5640-b01a-13d1-e1934b45ab90	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5640-b01a-980a-d2efffcdacf4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5640-b01a-f281-cabf47aed3f5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5640-b01a-4cd9-982aafefefef	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5640-b01a-7eb0-4711e5cb763d	planer	Planer dogodkov v koledarju	t
00020000-5640-b01a-1bab-5b028678ef20	kadrovska	Kadrovska služba	t
00020000-5640-b01a-0e17-700f9f9c13c3	arhivar	Ažuriranje arhivalij	t
00020000-5640-b01a-b584-d5c8428cf30b	igralec	Igralec	t
00020000-5640-b01a-ebb7-6eb126790b8d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5640-b01d-1790-21718bd607c0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5640-b01d-65b1-f0545c4d504f	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5640-b01d-3a47-551a6015ffde	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5640-b01d-9933-9dd2757e5dba	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5640-b01d-3344-b404b700a697	Uprizoritev-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3095 (class 0 OID 25873077)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5640-b01a-9d8e-5c1399005b72	00020000-5640-b01a-f281-cabf47aed3f5
00010000-5640-b01a-6a16-187ae7be4eac	00020000-5640-b01a-f281-cabf47aed3f5
00010000-5640-b01d-3c23-9b117e99567b	00020000-5640-b01d-1790-21718bd607c0
00010000-5640-b01d-dd0d-b17ef48e7a22	00020000-5640-b01d-65b1-f0545c4d504f
00010000-5640-b01d-489c-e0e2e0642916	00020000-5640-b01d-3a47-551a6015ffde
00010000-5640-b01d-0a59-3b1c92d4dd6e	00020000-5640-b01d-3a47-551a6015ffde
00010000-5640-b01d-0a59-3b1c92d4dd6e	00020000-5640-b01d-9933-9dd2757e5dba
00010000-5640-b01d-bfdc-e441b649e98f	00020000-5640-b01d-65b1-f0545c4d504f
00010000-5640-b01d-bfdc-e441b649e98f	00020000-5640-b01d-3344-b404b700a697
\.


--
-- TOC entry 3140 (class 0 OID 25873535)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 25873473)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 25873419)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5640-b01d-3dc4-2f461e4f4bfa	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5640-b01d-6a74-9911b6e0cfb0	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5640-b01d-e6bf-e1ba244e9689	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3091 (class 0 OID 25873042)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5640-b019-287d-1b93d3aef966	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5640-b019-717b-137c4445f943	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5640-b019-2521-beffb97e4fb8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5640-b019-0f49-4e9e3eb95cce	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5640-b019-c6fb-119a7d7367f1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 25873034)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5640-b019-346d-e8cb76a88413	00230000-5640-b019-0f49-4e9e3eb95cce	popa
00240000-5640-b019-5cbd-dbd77b01a421	00230000-5640-b019-0f49-4e9e3eb95cce	oseba
00240000-5640-b019-cfe7-7a3c2e028e74	00230000-5640-b019-0f49-4e9e3eb95cce	tippopa
00240000-5640-b019-39a6-97d6d91056d1	00230000-5640-b019-0f49-4e9e3eb95cce	organizacijskaenota
00240000-5640-b019-780e-c1d1b41871b8	00230000-5640-b019-0f49-4e9e3eb95cce	sezona
00240000-5640-b019-c769-2bb49b9c5a59	00230000-5640-b019-0f49-4e9e3eb95cce	tipvaje
00240000-5640-b019-1d1b-18122b312e08	00230000-5640-b019-717b-137c4445f943	prostor
00240000-5640-b019-b13b-99d1bf600d99	00230000-5640-b019-0f49-4e9e3eb95cce	besedilo
00240000-5640-b019-afc7-844b19b8f8bb	00230000-5640-b019-0f49-4e9e3eb95cce	uprizoritev
00240000-5640-b019-27f4-57566b0eb7a0	00230000-5640-b019-0f49-4e9e3eb95cce	funkcija
00240000-5640-b019-1eec-6d1eec5cf7c1	00230000-5640-b019-0f49-4e9e3eb95cce	tipfunkcije
00240000-5640-b019-fb0d-273f77ced509	00230000-5640-b019-0f49-4e9e3eb95cce	alternacija
00240000-5640-b019-0659-a8e0004ff045	00230000-5640-b019-287d-1b93d3aef966	pogodba
00240000-5640-b019-74f7-0a66d723f20b	00230000-5640-b019-0f49-4e9e3eb95cce	zaposlitev
00240000-5640-b019-e924-60d350d5727d	00230000-5640-b019-0f49-4e9e3eb95cce	zvrstuprizoritve
00240000-5640-b019-921e-32b87698a76d	00230000-5640-b019-287d-1b93d3aef966	programdela
00240000-5640-b019-61ed-2d6b17e7d040	00230000-5640-b019-0f49-4e9e3eb95cce	zapis
\.


--
-- TOC entry 3089 (class 0 OID 25873029)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
6c123f74-7437-43c9-9e78-9032323e42bf	00240000-5640-b019-346d-e8cb76a88413	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 25873600)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5640-b029-2f23-b9608a6e8a59	000e0000-5640-b029-4843-71552b23fe87	00080000-5640-b01d-c43e-ab9241962a32	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5640-b01a-d689-db429a92afeb
00270000-5640-b029-79d4-35d4555dcc06	000e0000-5640-b029-4843-71552b23fe87	00080000-5640-b01d-c43e-ab9241962a32	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5640-b01a-d689-db429a92afeb
\.


--
-- TOC entry 3105 (class 0 OID 25873177)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 25873429)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5640-b029-a922-0989e4bbd2cc	00180000-5640-b029-9eb6-3840799fdeb3	000c0000-5640-b029-0452-2a72c593ff92	00090000-5640-b029-5475-ca8fc0ddab4a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5640-b029-1cbc-c12856826d3a	00180000-5640-b029-9eb6-3840799fdeb3	000c0000-5640-b029-f529-898c17d4b0e2	00090000-5640-b029-cd3a-aba013767209	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5640-b029-703e-78fe0ac4e576	00180000-5640-b029-9eb6-3840799fdeb3	000c0000-5640-b029-bc48-3bd265a5e028	00090000-5640-b029-e4cd-d92bb36481a1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5640-b029-4537-5e7a97a50273	00180000-5640-b029-9eb6-3840799fdeb3	000c0000-5640-b029-7629-5ce52c5deefa	00090000-5640-b029-2094-f0a810464a2e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5640-b029-faf1-464134f25583	00180000-5640-b029-9eb6-3840799fdeb3	000c0000-5640-b029-1288-b089fb78db55	00090000-5640-b029-e821-87132711fe28	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5640-b029-2ea4-a02ea9c3386f	00180000-5640-b029-5101-00166d54b3a2	\N	00090000-5640-b029-e821-87132711fe28	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5640-b029-7d81-ff010cfd8ef4	00180000-5640-b029-5101-00166d54b3a2	\N	00090000-5640-b029-cd3a-aba013767209	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3149 (class 0 OID 25873641)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5640-b019-d7d2-155a0c363233	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5640-b019-a15c-a731c506373b	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5640-b019-b013-b32a307e773d	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5640-b019-fd44-dbb0b34f6e6d	04	Režija	Režija	Režija	umetnik	30
000f0000-5640-b019-0d8d-596bc7691ae8	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5640-b019-9a19-0ea5d26e5571	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5640-b019-5d04-f240022a1558	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5640-b019-b3b9-1c2499aff041	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5640-b019-209e-1f1be96d3ba2	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5640-b019-8cb1-d0f7c6a5a419	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5640-b019-3b09-32d2a51c940c	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5640-b019-e4fa-08afc24e54fe	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5640-b019-2b23-f86ca51de14f	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5640-b019-fff6-71d5baf576f9	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5640-b019-16c3-b3460a74ca28	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5640-b019-617c-1cbea59b4c02	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5640-b019-65f2-429eb3dabcef	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5640-b019-c9b1-c6c5e7aaff6d	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 25873128)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5640-b01d-92a0-59e236060c75	0001	šola	osnovna ali srednja šola
00400000-5640-b01d-bf90-12ba296f0575	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5640-b01d-ab27-b742fdf0c3bc	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3162 (class 0 OID 25873934)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5640-b019-96b0-3af665724a1f	01	Velika predstava	f	1.00	1.00
002b0000-5640-b019-9306-b647680155e3	02	Mala predstava	f	0.50	0.50
002b0000-5640-b019-cfc3-56e6c1989bf2	03	Mala koprodukcija	t	0.40	1.00
002b0000-5640-b019-a688-9ecc01e6a6b8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5640-b019-3d3e-ebd3abf9a662	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 25873409)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5640-b019-8c9c-9340ebed2cd6	0001	prva vaja	prva vaja
00420000-5640-b019-e408-d57b7e0bce72	0002	tehnična vaja	tehnična vaja
00420000-5640-b019-c987-8d162405c503	0003	lučna vaja	lučna vaja
00420000-5640-b019-2da8-9352d43870d8	0004	kostumska vaja	kostumska vaja
00420000-5640-b019-22da-0492a754850f	0005	foto vaja	foto vaja
00420000-5640-b019-244c-f1d63075a1e0	0006	1. glavna vaja	1. glavna vaja
00420000-5640-b019-0cb3-8d8629638f5f	0007	2. glavna vaja	2. glavna vaja
00420000-5640-b019-c181-341cb8573181	0008	1. generalka	1. generalka
00420000-5640-b019-9698-256841446570	0009	2. generalka	2. generalka
00420000-5640-b019-31c8-af6038096bb2	0010	odprta generalka	odprta generalka
00420000-5640-b019-6c0c-495050cbdbbf	0011	obnovitvena vaja	obnovitvena vaja
00420000-5640-b019-cacf-2a46c0eccd4d	0012	pevska vaja	pevska vaja
00420000-5640-b019-2a0d-b032509729e3	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5640-b019-692d-d61594d78342	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 25873250)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25873064)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5640-b01a-6a16-187ae7be4eac	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROVyRJjZF0ypJTEpuPcr.JPA5f/bkI46m	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5640-b01d-5464-07e7ad5c5840	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5640-b01d-5924-d6c4414a9e65	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5640-b01d-5f4e-1117e445856d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5640-b01d-61ee-93f9f6edc131	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5640-b01d-5643-7ce02b20e25b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5640-b01d-4090-8ef4e5229e42	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5640-b01d-0678-e82406b141e1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5640-b01d-aaa4-6670cb92e748	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5640-b01d-0eee-bef4085d4ef5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5640-b01d-3c23-9b117e99567b	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5640-b01d-444c-3d5da79a0933	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5640-b01d-dd0d-b17ef48e7a22	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5640-b01d-489c-e0e2e0642916	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5640-b01d-0a59-3b1c92d4dd6e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5640-b01d-bfdc-e441b649e98f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5640-b01a-9d8e-5c1399005b72	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 25873691)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5640-b029-b09f-9642c65ea20f	00160000-5640-b01d-022f-a3650a457580	\N	00140000-5640-b019-90d3-c2cc9694ef52	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5640-b01d-858f-e903fb72cc85
000e0000-5640-b029-4843-71552b23fe87	00160000-5640-b01d-8d2a-cbfadc049893	\N	00140000-5640-b019-e2a7-6a7835028093	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5640-b01d-1202-495e5aa8f147
000e0000-5640-b029-7497-e97331714516	\N	\N	00140000-5640-b019-e2a7-6a7835028093	00190000-5640-b029-2138-b0e016038180	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5640-b01d-858f-e903fb72cc85
000e0000-5640-b029-606b-e1d038d8764f	\N	\N	00140000-5640-b019-e2a7-6a7835028093	00190000-5640-b029-2138-b0e016038180	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5640-b01d-858f-e903fb72cc85
000e0000-5640-b029-ea60-1240dae54400	\N	\N	00140000-5640-b019-e2a7-6a7835028093	00190000-5640-b029-2138-b0e016038180	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5640-b01d-58bf-a199cf25a341
000e0000-5640-b029-b155-d3ad4c0c9f92	\N	\N	00140000-5640-b019-e2a7-6a7835028093	00190000-5640-b029-2138-b0e016038180	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5640-b01d-58bf-a199cf25a341
\.


--
-- TOC entry 3119 (class 0 OID 25873349)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5640-b029-dde9-9e103922acc1	\N	000e0000-5640-b029-4843-71552b23fe87	1	
00200000-5640-b029-1cdd-b30f00b7533a	\N	000e0000-5640-b029-4843-71552b23fe87	2	
00200000-5640-b029-8791-cef1ce0c928c	\N	000e0000-5640-b029-4843-71552b23fe87	3	
00200000-5640-b029-c9c1-d1c09f504364	\N	000e0000-5640-b029-4843-71552b23fe87	4	
00200000-5640-b029-19f2-f6b7bd7d1141	\N	000e0000-5640-b029-4843-71552b23fe87	5	
\.


--
-- TOC entry 3136 (class 0 OID 25873500)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 25873614)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5640-b01a-1db7-07bfa7c8a02f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5640-b01a-1358-39370a2fccf2	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5640-b01a-ce49-c4d30702cf07	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5640-b01a-24f1-3114deeeef61	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5640-b01a-6d7c-072cb506737d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5640-b01a-2fa1-6c353244bf27	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5640-b01a-f296-b7446afb55c2	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5640-b01a-dc58-90e851829bf0	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5640-b01a-d689-db429a92afeb	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5640-b01a-8363-ada276677bed	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5640-b01a-a1fc-e78a22fd689f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5640-b01a-634c-dc618c1e8f71	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5640-b01a-b7f6-e22731b4e5b4	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5640-b01a-3b67-130dff81a0df	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5640-b01a-8e8f-2ed06508ccb2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5640-b01a-b525-0e03379ee45f	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5640-b01a-c60a-9adfac211554	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5640-b01a-b738-07e9e2fe67df	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5640-b01a-8059-aff57e82fd20	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5640-b01a-598e-df5950d76a86	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5640-b01a-d354-3a62e8afb4ea	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5640-b01a-2122-cdc8bbb73496	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5640-b01a-2772-978bb1b21a68	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5640-b01a-d75b-b53459c7e14d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5640-b01a-cc20-80a1108b69a0	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5640-b01a-6404-6a70613648f6	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5640-b01a-9fc2-1147314e653c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5640-b01a-bc3a-f530586a6d55	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 25873981)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 25873953)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 25873993)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 25873572)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5640-b029-5d1c-b15efeafbfee	00090000-5640-b029-cd3a-aba013767209	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5640-b029-cee0-8594ca72e227	00090000-5640-b029-e4cd-d92bb36481a1	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5640-b029-7d0e-c84bff44f378	00090000-5640-b029-244c-207b7b4a1f2a	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5640-b029-041e-5f3ec5b0acea	00090000-5640-b029-29e8-aa72ecc59185	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5640-b029-9ff7-9075c962ba7d	00090000-5640-b029-7508-0fded3794ceb	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5640-b029-fc50-20b9bfa9f9e5	00090000-5640-b029-448a-762e4ed4accb	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3122 (class 0 OID 25873393)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 25873681)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5640-b019-90d3-c2cc9694ef52	01	Drama	drama (SURS 01)
00140000-5640-b019-a352-41cb19e440ce	02	Opera	opera (SURS 02)
00140000-5640-b019-1158-ada3bac089f3	03	Balet	balet (SURS 03)
00140000-5640-b019-a7b5-efebd664add1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5640-b019-8e69-f9a61e8fa671	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5640-b019-e2a7-6a7835028093	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5640-b019-b6f9-65ce418854ae	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 25873562)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 25873127)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25873740)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 25873730)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 25873118)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 25873597)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 25873639)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 25874033)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 25873381)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 25873403)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25873408)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25873951)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 25873276)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 25873808)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 25873558)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 25873347)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 25873314)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 25873290)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 25873465)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25874010)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25874017)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 25874041)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2722 (class 2606 OID 25873492)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 25873248)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 25873146)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 25873210)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 25873173)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 25873107)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 25873092)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 25873498)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 25873534)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 25873676)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 25873201)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 25873236)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 25873903)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 25873471)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 25873226)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 25873366)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 25873335)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 25873327)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 25873483)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 25873912)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 25873920)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 25873890)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 25873932)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 25873516)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 25873456)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 25873447)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 25873663)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 25873590)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 25873302)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 25873063)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 25873525)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 25873081)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 25873101)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 25873543)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 25873478)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 25873427)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 25873051)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 25873039)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 25873033)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 25873610)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 25873182)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25873438)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 25873650)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 25873135)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25873944)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 25873416)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 25873261)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 25873076)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25873709)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 25873356)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 25873506)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 25873622)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 25873991)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 25873975)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 25873999)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 25873580)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 25873397)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 25873689)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 25873570)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 25873391)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 25873392)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 25873390)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 25873389)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 25873388)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 25873611)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 25873612)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 25873613)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 25874012)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 25874011)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 25873203)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 25873204)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 25873499)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 25873979)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 25873978)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 25873980)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 25873977)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 25873976)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 25873485)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 25873484)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 25873357)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 25873358)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 25873559)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 25873561)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 25873560)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 25873292)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 25873291)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 25873933)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 25873678)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 25873679)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 25873680)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 25874000)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 25873714)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 25873711)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 25873715)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 25873713)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 25873712)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 25873263)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 25873262)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 25873176)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 25873526)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 25873108)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 25873109)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 25873546)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 25873545)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 25873544)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 25873213)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 25873212)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 25873214)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 25873330)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 25873328)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 25873329)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 25873041)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 25873451)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 25873449)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 25873448)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 25873450)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 25873082)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 25873083)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 25873507)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 25874034)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 25873599)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 25873598)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 25874042)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 25874043)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 25873472)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 25873591)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 25873592)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 25873813)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 25873812)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 25873809)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 25873810)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 25873811)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 25873228)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 25873227)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 25873229)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 25873520)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 25873519)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 25873913)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 25873914)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 25873744)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 25873745)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 25873742)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 25873743)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 25873581)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 25873582)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 25873460)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 25873459)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 25873457)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 25873458)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 25873732)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 25873731)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 25873303)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 25873317)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 25873316)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 25873315)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 25873318)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 25873348)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 25873336)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 25873337)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 25873904)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 25873952)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 25874018)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 25874019)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 25873148)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 25873147)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 25873183)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 25873184)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 25873398)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 25873441)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 25873440)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 25873439)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 25873383)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 25873384)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 25873387)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 25873382)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 25873386)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 25873385)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 25873202)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 25873136)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 25873137)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 25873277)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 25873279)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 25873278)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 25873280)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 25873466)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 25873677)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 25873710)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 25873651)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 25873652)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 25873174)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 25873175)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 25873571)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 25873052)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 25873249)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 25873211)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 25873040)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 25873945)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 25873518)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 25873517)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 25873417)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 25873418)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 25873741)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 25873237)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 25873690)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 25873992)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 25873921)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 25873922)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 25873640)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 25873428)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 25873102)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2900 (class 2606 OID 25874214)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2901 (class 2606 OID 25874219)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2906 (class 2606 OID 25874244)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2904 (class 2606 OID 25874234)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2899 (class 2606 OID 25874209)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2903 (class 2606 OID 25874229)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2905 (class 2606 OID 25874239)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2902 (class 2606 OID 25874224)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2940 (class 2606 OID 25874414)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 25874419)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2942 (class 2606 OID 25874424)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 25874589)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2974 (class 2606 OID 25874584)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 25874099)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2878 (class 2606 OID 25874104)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 25874329)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2971 (class 2606 OID 25874569)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 25874564)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 25874574)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2969 (class 2606 OID 25874559)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2968 (class 2606 OID 25874554)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2922 (class 2606 OID 25874324)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2921 (class 2606 OID 25874319)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2897 (class 2606 OID 25874199)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2898 (class 2606 OID 25874204)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 25874369)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 25874379)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 25874374)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2888 (class 2606 OID 25874154)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2887 (class 2606 OID 25874149)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 25874309)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 25874544)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2943 (class 2606 OID 25874429)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 25874434)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2945 (class 2606 OID 25874439)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 25874579)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2949 (class 2606 OID 25874459)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2946 (class 2606 OID 25874444)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 25874464)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 25874454)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2947 (class 2606 OID 25874449)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2886 (class 2606 OID 25874144)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2885 (class 2606 OID 25874139)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2874 (class 2606 OID 25874084)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2873 (class 2606 OID 25874079)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 25874349)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2869 (class 2606 OID 25874059)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2870 (class 2606 OID 25874064)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2930 (class 2606 OID 25874364)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 25874359)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2928 (class 2606 OID 25874354)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 25874114)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2879 (class 2606 OID 25874109)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2881 (class 2606 OID 25874119)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2893 (class 2606 OID 25874179)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 25874169)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 25874174)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 25874044)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2914 (class 2606 OID 25874284)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2912 (class 2606 OID 25874274)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2911 (class 2606 OID 25874269)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2913 (class 2606 OID 25874279)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2867 (class 2606 OID 25874049)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 25874054)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 25874334)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 25874604)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2939 (class 2606 OID 25874409)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 25874404)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2979 (class 2606 OID 25874609)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2980 (class 2606 OID 25874614)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 25874314)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2936 (class 2606 OID 25874394)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2937 (class 2606 OID 25874399)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 25874519)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 25874514)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2957 (class 2606 OID 25874499)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2958 (class 2606 OID 25874504)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 25874509)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 25874129)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2882 (class 2606 OID 25874124)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2884 (class 2606 OID 25874134)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 25874344)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2925 (class 2606 OID 25874339)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 25874529)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2964 (class 2606 OID 25874534)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2955 (class 2606 OID 25874489)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 25874494)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2953 (class 2606 OID 25874479)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2954 (class 2606 OID 25874484)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 25874384)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2935 (class 2606 OID 25874389)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2918 (class 2606 OID 25874304)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2917 (class 2606 OID 25874299)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2915 (class 2606 OID 25874289)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2916 (class 2606 OID 25874294)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2952 (class 2606 OID 25874474)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2951 (class 2606 OID 25874469)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 25874159)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 25874164)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 25874194)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2894 (class 2606 OID 25874184)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2895 (class 2606 OID 25874189)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 25874524)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 25874539)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 25874549)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2976 (class 2606 OID 25874594)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2977 (class 2606 OID 25874599)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2872 (class 2606 OID 25874074)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 25874069)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2875 (class 2606 OID 25874089)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2876 (class 2606 OID 25874094)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 25874249)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 25874264)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 25874259)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2908 (class 2606 OID 25874254)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-09 15:39:42 CET

--
-- PostgreSQL database dump complete
--

