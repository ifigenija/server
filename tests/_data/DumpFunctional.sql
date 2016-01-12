--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-12 13:10:06 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 255 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 255
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 35406861)
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
-- TOC entry 239 (class 1259 OID 35407488)
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
-- TOC entry 238 (class 1259 OID 35407471)
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
-- TOC entry 182 (class 1259 OID 35406854)
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
-- TOC entry 181 (class 1259 OID 35406852)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 229 (class 1259 OID 35407348)
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
-- TOC entry 232 (class 1259 OID 35407378)
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
-- TOC entry 253 (class 1259 OID 35407791)
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
-- TOC entry 210 (class 1259 OID 35407184)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    tipdodatka_id uuid,
    trajanje integer,
    terminstoritve_id uuid
);


--
-- TOC entry 203 (class 1259 OID 35407109)
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
-- TOC entry 205 (class 1259 OID 35407141)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 35407146)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 35407713)
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
-- TOC entry 194 (class 1259 OID 35407006)
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
-- TOC entry 240 (class 1259 OID 35407501)
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
-- TOC entry 225 (class 1259 OID 35407306)
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
-- TOC entry 200 (class 1259 OID 35407080)
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
-- TOC entry 197 (class 1259 OID 35407046)
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
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 35407023)
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
-- TOC entry 214 (class 1259 OID 35407220)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 251 (class 1259 OID 35407771)
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
-- TOC entry 252 (class 1259 OID 35407784)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 35407806)
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
-- TOC entry 218 (class 1259 OID 35407245)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 35406980)
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
-- TOC entry 185 (class 1259 OID 35406880)
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
-- TOC entry 189 (class 1259 OID 35406947)
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
-- TOC entry 186 (class 1259 OID 35406891)
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
-- TOC entry 178 (class 1259 OID 35406826)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 35406845)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 35407252)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 35407286)
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
-- TOC entry 235 (class 1259 OID 35407419)
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
-- TOC entry 188 (class 1259 OID 35406927)
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
-- TOC entry 191 (class 1259 OID 35406972)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 242 (class 1259 OID 35407657)
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
-- TOC entry 215 (class 1259 OID 35407226)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 35406957)
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
-- TOC entry 202 (class 1259 OID 35407101)
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
-- TOC entry 198 (class 1259 OID 35407061)
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
-- TOC entry 199 (class 1259 OID 35407073)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 35407238)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 35407671)
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
-- TOC entry 244 (class 1259 OID 35407681)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 241 (class 1259 OID 35407570)
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
-- TOC entry 245 (class 1259 OID 35407689)
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
-- TOC entry 221 (class 1259 OID 35407267)
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
-- TOC entry 213 (class 1259 OID 35407211)
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
-- TOC entry 212 (class 1259 OID 35407201)
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
-- TOC entry 234 (class 1259 OID 35407408)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 35407338)
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
-- TOC entry 196 (class 1259 OID 35407035)
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
-- TOC entry 175 (class 1259 OID 35406797)
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
-- TOC entry 174 (class 1259 OID 35406795)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 222 (class 1259 OID 35407280)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 35406835)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 35406819)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 35407294)
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
-- TOC entry 216 (class 1259 OID 35407232)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 35407161)
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
-- TOC entry 173 (class 1259 OID 35406784)
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
-- TOC entry 172 (class 1259 OID 35406776)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 35406771)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 230 (class 1259 OID 35407355)
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
-- TOC entry 187 (class 1259 OID 35406919)
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
-- TOC entry 209 (class 1259 OID 35407171)
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
-- TOC entry 211 (class 1259 OID 35407191)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 233 (class 1259 OID 35407396)
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
-- TOC entry 184 (class 1259 OID 35406870)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 246 (class 1259 OID 35407701)
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
-- TOC entry 207 (class 1259 OID 35407151)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 35406992)
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
-- TOC entry 176 (class 1259 OID 35406806)
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
-- TOC entry 237 (class 1259 OID 35407446)
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
-- TOC entry 201 (class 1259 OID 35407091)
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
-- TOC entry 220 (class 1259 OID 35407259)
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
-- TOC entry 231 (class 1259 OID 35407369)
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
-- TOC entry 249 (class 1259 OID 35407751)
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
-- TOC entry 248 (class 1259 OID 35407720)
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
-- TOC entry 250 (class 1259 OID 35407763)
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
-- TOC entry 227 (class 1259 OID 35407331)
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
-- TOC entry 204 (class 1259 OID 35407135)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 236 (class 1259 OID 35407436)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 226 (class 1259 OID 35407321)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2250 (class 2604 OID 35406857)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2242 (class 2604 OID 35406800)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3134 (class 0 OID 35406861)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5694-ed1a-73d2-b55a23bb662f	10	30	Otroci	Abonma za otroke	200
000a0000-5694-ed1a-6cd5-0876791ce020	20	60	Mladina	Abonma za mladino	400
000a0000-5694-ed1a-d05b-f93b7f3ded2e	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3190 (class 0 OID 35407488)
-- Dependencies: 239
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5694-ed1b-aacc-bf3cc1b19f86	000d0000-5694-ed1b-ebc8-f5415f1d0681	\N	00090000-5694-ed1a-4436-594c778aa14a	000b0000-5694-ed1b-af4d-a3cbb7b8e494	0001	f	\N	\N	\N	3	t	t	t
000c0000-5694-ed1b-d703-2f93e08e8a1f	000d0000-5694-ed1b-6e75-1e28c05044ab	00100000-5694-ed1a-681f-f5d31fd4f9d3	00090000-5694-ed1a-f14a-494ef8a2e635	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5694-ed1b-cae3-520aaa332ac2	000d0000-5694-ed1b-9712-d5be1e5f8fa4	00100000-5694-ed1a-fe25-7617190b6a05	00090000-5694-ed1a-81fd-466d7a2a92a0	\N	0003	t	\N	2016-01-12	\N	2	t	f	f
000c0000-5694-ed1b-8346-8fa55a1a05da	000d0000-5694-ed1b-45b9-dbd231ea7e9f	\N	00090000-5694-ed1a-4233-bb3f970f4de4	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5694-ed1b-68a2-f0240d389a47	000d0000-5694-ed1b-5545-e683cec2795d	\N	00090000-5694-ed1a-b08c-131c551f1825	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5694-ed1b-bcaa-b182cf4d9c82	000d0000-5694-ed1b-488b-86da62422df0	\N	00090000-5694-ed1a-dfda-584a0de6d4d8	000b0000-5694-ed1b-23d9-0c38fd8c6325	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5694-ed1b-e438-c9722d9395a8	000d0000-5694-ed1b-29f2-19f01dfb1699	00100000-5694-ed1a-d60a-f9b6654bb6cf	00090000-5694-ed1a-2ace-27f7dca2bdb6	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5694-ed1b-e950-5aa9f15eb3aa	000d0000-5694-ed1b-f918-80ce1b4f83d0	\N	00090000-5694-ed1a-0155-0ee2a8913b37	000b0000-5694-ed1b-6e59-349e9867afe1	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5694-ed1b-20ea-78a728ce8254	000d0000-5694-ed1b-29f2-19f01dfb1699	00100000-5694-ed1b-0c64-71ca7c1eed24	00090000-5694-ed1a-7945-87d6350d7820	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5694-ed1b-ddb2-83408fea293d	000d0000-5694-ed1b-29f2-19f01dfb1699	00100000-5694-ed1b-361a-b7df80ffd6de	00090000-5694-ed1a-eb84-8265e31160df	\N	0010	t	\N	2016-01-12	\N	16	f	f	t
000c0000-5694-ed1b-96f8-99a7d9a1bceb	000d0000-5694-ed1b-29f2-19f01dfb1699	00100000-5694-ed1b-ccc9-0487a30434c4	00090000-5694-ed1a-6927-4be9d0b910fa	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5694-ed1b-7d4d-b57c93233799	000d0000-5694-ed1b-c289-c06fe93a9fea	00100000-5694-ed1a-681f-f5d31fd4f9d3	00090000-5694-ed1a-f14a-494ef8a2e635	000b0000-5694-ed1b-df56-6876f6c05ec8	0012	t	\N	\N	\N	2	t	t	t
000c0000-5694-ed1b-39e3-657e822f08bd	000d0000-5694-ed1b-80d6-7bee4ea624a4	\N	00090000-5694-ed1a-0155-0ee2a8913b37	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5694-ed1b-a8e6-e90f8b4513f5	000d0000-5694-ed1b-80d6-7bee4ea624a4	\N	00090000-5694-ed1a-0de9-b2ab314607be	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5694-ed1b-2557-3d8cde915c77	000d0000-5694-ed1b-4244-fd80686bd81f	00100000-5694-ed1a-fe25-7617190b6a05	00090000-5694-ed1a-81fd-466d7a2a92a0	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5694-ed1b-03f2-4d59bc90a43d	000d0000-5694-ed1b-4244-fd80686bd81f	\N	00090000-5694-ed1a-0de9-b2ab314607be	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5694-ed1b-8713-689740da7c9a	000d0000-5694-ed1b-9c29-0eefdb12d831	\N	00090000-5694-ed1a-0de9-b2ab314607be	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5694-ed1b-7320-21e2e88e2a4f	000d0000-5694-ed1b-9c29-0eefdb12d831	\N	00090000-5694-ed1a-0155-0ee2a8913b37	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5694-ed1b-2307-34ae5d3ee21d	000d0000-5694-ed1b-72eb-fdff8911f89d	00100000-5694-ed1a-d60a-f9b6654bb6cf	00090000-5694-ed1a-2ace-27f7dca2bdb6	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5694-ed1b-a5c1-989f9fe56d62	000d0000-5694-ed1b-72eb-fdff8911f89d	\N	00090000-5694-ed1a-0de9-b2ab314607be	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5694-ed1b-b49d-dfb0a9f2c925	000d0000-5694-ed1b-a98c-26f1c4aa308f	\N	00090000-5694-ed1a-0de9-b2ab314607be	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5694-ed1b-04bb-e9800b4d8091	000d0000-5694-ed1b-a98c-26f1c4aa308f	00100000-5694-ed1a-d60a-f9b6654bb6cf	00090000-5694-ed1a-2ace-27f7dca2bdb6	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5694-ed1b-80b3-ea95c2f49e6b	000d0000-5694-ed1b-b162-b4d5d1787bb7	\N	00090000-5694-ed1a-0de9-b2ab314607be	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5694-ed1b-bd96-315de59a2fc0	000d0000-5694-ed1b-6a51-f5950884c54a	\N	00090000-5694-ed1a-0155-0ee2a8913b37	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5694-ed1b-5aa4-928da395cd1d	000d0000-5694-ed1b-0e1c-8e5ed84897be	\N	00090000-5694-ed1a-0155-0ee2a8913b37	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5694-ed1b-215a-e98f466d3faf	000d0000-5694-ed1b-0e1c-8e5ed84897be	00100000-5694-ed1a-fe25-7617190b6a05	00090000-5694-ed1a-81fd-466d7a2a92a0	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5694-ed1b-f1db-ee039a343bc8	000d0000-5694-ed1b-3c5c-b5f7b607ede7	\N	00090000-5694-ed1a-683b-90fa7a2f631c	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5694-ed1b-6a3d-b36a94421c87	000d0000-5694-ed1b-3c5c-b5f7b607ede7	\N	00090000-5694-ed1a-be12-d202c49333f2	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5694-ed1b-3dd7-ba0c9769e6f0	000d0000-5694-ed1b-d822-13e291d85a48	\N	00090000-5694-ed1a-0155-0ee2a8913b37	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5694-ed1b-6899-c06d311fd6a8	000d0000-5694-ed1b-d822-13e291d85a48	00100000-5694-ed1a-fe25-7617190b6a05	00090000-5694-ed1a-81fd-466d7a2a92a0	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5694-ed1b-f31d-984b3cb48786	000d0000-5694-ed1b-d822-13e291d85a48	\N	00090000-5694-ed1a-be12-d202c49333f2	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5694-ed1b-c226-ae9847f6a181	000d0000-5694-ed1b-d822-13e291d85a48	\N	00090000-5694-ed1a-683b-90fa7a2f631c	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5694-ed1b-3487-121082a568b5	000d0000-5694-ed1b-813c-85a318ba77d1	\N	00090000-5694-ed1a-0155-0ee2a8913b37	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5694-ed1b-06da-096a60742ab4	000d0000-5694-ed1b-9de2-d65a64de0ddc	00100000-5694-ed1a-fe25-7617190b6a05	00090000-5694-ed1a-81fd-466d7a2a92a0	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5694-ed1b-a512-230829cc5413	000d0000-5694-ed1b-9de2-d65a64de0ddc	\N	00090000-5694-ed1a-0de9-b2ab314607be	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3189 (class 0 OID 35407471)
-- Dependencies: 238
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 35406854)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3180 (class 0 OID 35407348)
-- Dependencies: 229
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5694-ed1b-c4d7-a670a16af8a2	00160000-5694-ed1a-88ff-450616efb20d	00090000-5694-ed1a-be12-d202c49333f2	aizv	10	t
003d0000-5694-ed1b-8a52-3775e0b76eb7	00160000-5694-ed1a-88ff-450616efb20d	00090000-5694-ed1a-3fb7-b78638525836	apri	14	t
003d0000-5694-ed1b-8aaf-8b89898e4080	00160000-5694-ed1a-3b58-a53cc9047036	00090000-5694-ed1a-683b-90fa7a2f631c	aizv	11	t
003d0000-5694-ed1b-393c-7815552aed48	00160000-5694-ed1a-bc6a-85fda6fa6d4b	00090000-5694-ed1a-dce3-918bd7b22b5e	aizv	12	t
003d0000-5694-ed1b-4579-97dfd0c8a748	00160000-5694-ed1a-88ff-450616efb20d	00090000-5694-ed1a-0de9-b2ab314607be	apri	18	f
\.


--
-- TOC entry 3183 (class 0 OID 35407378)
-- Dependencies: 232
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5694-ed1a-88ff-450616efb20d	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5694-ed1a-3b58-a53cc9047036	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5694-ed1a-bc6a-85fda6fa6d4b	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3204 (class 0 OID 35407791)
-- Dependencies: 253
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 35407184)
-- Dependencies: 210
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, tipdodatka_id, trajanje, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 35407109)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5694-ed1b-f7ad-2ca02ce8ce99	\N	\N	00200000-5694-ed1b-0e86-ccff9e3d36a9	\N	\N	\N	00220000-5694-ed1a-a3c0-8a5d219b6e16	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5694-ed1b-8daf-560b7fd10145	\N	\N	00200000-5694-ed1b-0e22-f75ce580f61d	\N	\N	\N	00220000-5694-ed1a-a3c0-8a5d219b6e16	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5694-ed1b-b7a3-d678b12762b6	\N	\N	00200000-5694-ed1b-b983-b1efbb3134f9	\N	\N	\N	00220000-5694-ed1a-3425-65bae93c290c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5694-ed1b-f048-f41e3a2b61a6	\N	\N	00200000-5694-ed1b-47bd-13afcdb2e707	\N	\N	\N	00220000-5694-ed1a-4f89-91c494e99632	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5694-ed1b-1315-036ca2e4525e	\N	\N	00200000-5694-ed1b-1b16-bd8971f878c0	\N	\N	\N	00220000-5694-ed1a-7091-ebd7f8a85464	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3156 (class 0 OID 35407141)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 35407146)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 35407713)
-- Dependencies: 247
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 35407006)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5694-ed17-3606-9b115d37339b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5694-ed17-930d-15d9982b083f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5694-ed17-24b5-283765c9ac34	AL	ALB	008	Albania 	Albanija	\N
00040000-5694-ed17-287f-7cb32a56e514	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5694-ed17-66fc-661d65c64bd5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5694-ed17-8e76-ca0b5f1f7a7c	AD	AND	020	Andorra 	Andora	\N
00040000-5694-ed17-3e8b-7e3a2f9f77cb	AO	AGO	024	Angola 	Angola	\N
00040000-5694-ed17-6ac5-da2cda4eb284	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5694-ed17-9c7f-ab3d97688340	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5694-ed17-5d76-10a0df3f4b50	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5694-ed17-9c4b-9d2316eaf18a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5694-ed17-4068-85e0d9fc8069	AM	ARM	051	Armenia 	Armenija	\N
00040000-5694-ed17-4458-9aa52c1794b0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5694-ed17-9893-eb42f002a077	AU	AUS	036	Australia 	Avstralija	\N
00040000-5694-ed17-65de-2ea7f870c5a3	AT	AUT	040	Austria 	Avstrija	\N
00040000-5694-ed17-6f9d-4f888bc58166	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5694-ed17-f01a-10cdbde16d48	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5694-ed17-2d3a-db25165ba8f3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5694-ed17-98ec-b13ed020a5cf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5694-ed17-7473-83e74d09cfcb	BB	BRB	052	Barbados 	Barbados	\N
00040000-5694-ed17-d3af-b93ebd9d4876	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5694-ed17-8c85-7ef2b9742758	BE	BEL	056	Belgium 	Belgija	\N
00040000-5694-ed17-a5b6-38f79b26d3e0	BZ	BLZ	084	Belize 	Belize	\N
00040000-5694-ed17-0c3e-68a182090f35	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5694-ed17-5bf8-ad12d55bd648	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5694-ed17-e186-4412131d0c6a	BT	BTN	064	Bhutan 	Butan	\N
00040000-5694-ed17-8e4e-0070ac989bd9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5694-ed17-2165-4a3a0600eca5	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5694-ed17-56b1-2563ae6f83c8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5694-ed17-e776-8c6c348863be	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5694-ed17-5809-4547436e6c7b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5694-ed17-69e6-e2b324c4273f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5694-ed17-d35e-3de871cce1a2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5694-ed17-a37d-bf46a11e0ae0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5694-ed17-326f-dce4c2708ee7	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5694-ed17-5d4c-13184d7d8e7c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5694-ed17-8b93-aae5c869b53a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5694-ed17-dff2-d13321babd91	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5694-ed17-3c8f-fe2f626dc4a1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5694-ed17-1fd1-292aac11a205	CA	CAN	124	Canada 	Kanada	\N
00040000-5694-ed17-e79e-86ae9adeddd5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5694-ed17-3874-0b6e77ea0b9d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5694-ed17-bc57-c529a71e2285	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5694-ed17-633f-48a9cfd114dd	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5694-ed17-31a1-260fe3701e57	CL	CHL	152	Chile 	Čile	\N
00040000-5694-ed17-361a-197a987b3658	CN	CHN	156	China 	Kitajska	\N
00040000-5694-ed17-304e-0a9e9bd88c78	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5694-ed17-111d-e4b416c0c8de	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5694-ed17-384b-16f2f895e3c9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5694-ed17-4dbc-29836f639ea6	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5694-ed17-2252-0c683ca30906	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5694-ed17-991b-03eef3662bae	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5694-ed17-0783-bf7e85bcc363	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5694-ed17-ba36-8397f9c61dad	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5694-ed17-1184-1a7dc40e493f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5694-ed17-94eb-d692a1b68c00	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5694-ed17-e5d7-f10c3a820dda	CU	CUB	192	Cuba 	Kuba	\N
00040000-5694-ed17-20bb-5b26543cf349	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5694-ed17-9f45-7f8a1e6cf199	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5694-ed17-47bd-6ad13961adc1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5694-ed17-f0e7-8a42507e6768	DK	DNK	208	Denmark 	Danska	\N
00040000-5694-ed17-134d-e07ceea2deab	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5694-ed17-8ff0-dbc972a476de	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5694-ed17-6ad4-5a74fec481d0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5694-ed17-a29e-f152ad5cdd08	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5694-ed17-b083-9f04164ce826	EG	EGY	818	Egypt 	Egipt	\N
00040000-5694-ed17-979c-c50901b9ba00	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5694-ed17-fcf0-63a73d43dc4f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5694-ed17-ff5b-d85baf329db5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5694-ed17-5617-cd39205e0e0c	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5694-ed17-b192-9850b835525d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5694-ed17-8aa3-c2bfdc33c628	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5694-ed17-26a5-0a0b70d017f5	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5694-ed17-d05d-72faf80a65f7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5694-ed17-af71-676ac9b1f478	FI	FIN	246	Finland 	Finska	\N
00040000-5694-ed17-f91a-358ff5e68a28	FR	FRA	250	France 	Francija	\N
00040000-5694-ed17-b8c3-8a8ead5622bf	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5694-ed17-0ad0-67f7925cd4f6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5694-ed17-0f14-18341651f02a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5694-ed17-aa73-642b25c004b1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5694-ed17-079f-f753870814cb	GA	GAB	266	Gabon 	Gabon	\N
00040000-5694-ed17-1ed4-d60430c66a19	GM	GMB	270	Gambia 	Gambija	\N
00040000-5694-ed17-7ef5-f9024335aa7c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5694-ed17-af13-247cb0d77fc8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5694-ed17-94b2-0a194e801f4d	GH	GHA	288	Ghana 	Gana	\N
00040000-5694-ed17-715c-0c48c881b7dd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5694-ed17-ec4a-a564197742f4	GR	GRC	300	Greece 	Grčija	\N
00040000-5694-ed17-85ed-38ce62757b2b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5694-ed17-33e3-25294fe3bed9	GD	GRD	308	Grenada 	Grenada	\N
00040000-5694-ed17-a188-d29d460abf24	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5694-ed17-7d17-5c33b7c2df7d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5694-ed17-9c5b-615215cd0162	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5694-ed17-6da1-08ec9d54a351	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5694-ed17-dc81-d74129f1c9d1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5694-ed17-8ea0-4b8c82db974c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5694-ed17-e262-6ace15cb949a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5694-ed17-6309-fbc31e45d09b	HT	HTI	332	Haiti 	Haiti	\N
00040000-5694-ed17-3f60-e9ec610ec35b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5694-ed17-db90-31393b19b17c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5694-ed17-1a96-4834427944ac	HN	HND	340	Honduras 	Honduras	\N
00040000-5694-ed17-a49d-de7a958f9111	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5694-ed17-63cd-f05022d691b8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5694-ed17-2828-30a9669cdd01	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5694-ed17-637b-2a2178827b37	IN	IND	356	India 	Indija	\N
00040000-5694-ed17-a809-fea5e8234113	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5694-ed17-968c-a1a71137a9e6	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5694-ed17-6225-b9936d1766bd	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5694-ed17-0649-595f3d08de99	IE	IRL	372	Ireland 	Irska	\N
00040000-5694-ed17-201f-1b1ddf94c9f9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5694-ed17-2f71-1634a4b67319	IL	ISR	376	Israel 	Izrael	\N
00040000-5694-ed17-cb40-206e4c27de21	IT	ITA	380	Italy 	Italija	\N
00040000-5694-ed17-611a-ca3cefc46758	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5694-ed17-50fa-1036802785c3	JP	JPN	392	Japan 	Japonska	\N
00040000-5694-ed17-28c1-f3a7a73286e3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5694-ed17-c1d4-20e9428b2d6b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5694-ed17-262d-d8208deb7ea6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5694-ed17-abe3-dc00236fa84d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5694-ed17-6cdb-055463541e83	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5694-ed17-60f2-97600b081932	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5694-ed17-806f-34955c9901ba	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5694-ed17-d553-eec741cfc9c1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5694-ed17-7ca6-51320d257904	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5694-ed17-52fa-ece12f6c2045	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5694-ed17-ed16-a79e37bf5828	LV	LVA	428	Latvia 	Latvija	\N
00040000-5694-ed17-8c95-c0f54b8b3b27	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5694-ed17-e0e7-fe5c9440f4d2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5694-ed17-bc9f-d07fb382d701	LR	LBR	430	Liberia 	Liberija	\N
00040000-5694-ed17-bd96-178d898c2683	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5694-ed17-89af-42f50fd01fa8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5694-ed17-38d8-cc4a9b55a18d	LT	LTU	440	Lithuania 	Litva	\N
00040000-5694-ed17-538c-f563631d0337	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5694-ed17-c811-46f2eaee1171	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5694-ed17-9b1a-c2c35f9884f1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5694-ed17-63a0-68a40178e4f6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5694-ed17-4522-89aa9bdb0e0c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5694-ed17-8945-74391f0b7250	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5694-ed17-c318-3a1fe83d720c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5694-ed17-6282-1750e9d18043	ML	MLI	466	Mali 	Mali	\N
00040000-5694-ed17-6223-c4d9af021d0e	MT	MLT	470	Malta 	Malta	\N
00040000-5694-ed17-ee8c-cc849d6d63ee	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5694-ed17-9519-a6d1624d6e90	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5694-ed17-a0dc-6f337751ed1f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5694-ed17-81dc-3f2ed5f61780	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5694-ed17-b37c-3fdc786b8871	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5694-ed17-ae3c-a76af8f09d51	MX	MEX	484	Mexico 	Mehika	\N
00040000-5694-ed17-d0f2-ab62b5bf8e2b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5694-ed17-479a-914af90365b0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5694-ed17-0eac-c46c9ee22319	MC	MCO	492	Monaco 	Monako	\N
00040000-5694-ed17-c052-6b8b5ff067f4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5694-ed17-9aa9-44ca1f3839aa	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5694-ed17-17c5-58e2087b9c5b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5694-ed17-023e-cccaeb69e3f8	MA	MAR	504	Morocco 	Maroko	\N
00040000-5694-ed17-6cc2-78d82384014c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5694-ed17-6ba0-06a557efc473	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5694-ed17-97f6-7b111a08ae7a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5694-ed17-2d9b-686bb37fc20e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5694-ed17-6bda-ff90574245c0	NP	NPL	524	Nepal 	Nepal	\N
00040000-5694-ed17-1336-7999a7238c5b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5694-ed17-6f8a-e197efaaf05b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5694-ed17-7573-aa90334f4384	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5694-ed17-b78b-ccd3cced2bdf	NE	NER	562	Niger 	Niger 	\N
00040000-5694-ed17-c6ad-2e376526dda3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5694-ed17-1d67-bd1f2f84e50d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5694-ed17-fb11-cd20e3fa7d8d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5694-ed17-e84c-fa59d7640400	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5694-ed17-3f11-8a99db83efa9	NO	NOR	578	Norway 	Norveška	\N
00040000-5694-ed17-9f05-6ff9ed38154f	OM	OMN	512	Oman 	Oman	\N
00040000-5694-ed17-f0dd-ec3ced7082ea	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5694-ed17-d56e-e2e233f1e5b7	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5694-ed17-6748-a6d5dc9e8374	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5694-ed17-d352-0653c6e14bff	PA	PAN	591	Panama 	Panama	\N
00040000-5694-ed17-83d3-b1057c8f52ed	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5694-ed17-5373-aa4d5e6fa5d5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5694-ed17-b043-fd944ed2597e	PE	PER	604	Peru 	Peru	\N
00040000-5694-ed17-e2fd-928227fa1194	PH	PHL	608	Philippines 	Filipini	\N
00040000-5694-ed17-13a9-66165589c60e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5694-ed17-6af4-3a8f9f2d9a78	PL	POL	616	Poland 	Poljska	\N
00040000-5694-ed17-b843-382b2a1a17a5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5694-ed17-9d47-1fb78c362c61	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5694-ed17-cbb5-c6c8a6900f1b	QA	QAT	634	Qatar 	Katar	\N
00040000-5694-ed17-fd6e-081147fc196c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5694-ed17-44fa-3bcc3e47721d	RO	ROU	642	Romania 	Romunija	\N
00040000-5694-ed17-32d1-a2daa286bf8d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5694-ed17-ab12-cd4dbfc98228	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5694-ed17-846a-98a3ab7e0858	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5694-ed17-4997-bd75ae31cf5a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5694-ed17-542d-01b69dc8386f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5694-ed17-e11d-90787025c170	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5694-ed17-10f3-1165248ca8a0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5694-ed17-ace9-261cde5af29e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5694-ed17-db96-e007ae52753f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5694-ed17-e6b1-fba90ea09003	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5694-ed17-d835-0d760dbe2d7b	SM	SMR	674	San Marino 	San Marino	\N
00040000-5694-ed17-58ce-59064da76a9b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5694-ed17-5926-0ed6cd28e859	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5694-ed17-8e24-1848ba07277b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5694-ed17-241c-f60366d4b4e4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5694-ed17-c7e8-55931f28c282	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5694-ed17-ce24-4d9ec1031a04	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5694-ed17-4b0f-3da51b7800dc	SG	SGP	702	Singapore 	Singapur	\N
00040000-5694-ed17-cf7e-cee8d709cd16	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5694-ed17-49ee-8dd1c4ff4715	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5694-ed17-b8fc-84a499462b33	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5694-ed17-8907-049b4b7f05a4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5694-ed17-2d0b-ecc16e644af1	SO	SOM	706	Somalia 	Somalija	\N
00040000-5694-ed17-0f1b-455776fec290	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5694-ed17-9413-56c30f7cf5e2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5694-ed17-b651-2d85c9445fad	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5694-ed17-72f7-184385ce8542	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5694-ed17-0586-8ab08c611c0a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5694-ed17-0dca-691d08976fd6	SD	SDN	729	Sudan 	Sudan	\N
00040000-5694-ed17-8ec5-7485c5d2054e	SR	SUR	740	Suriname 	Surinam	\N
00040000-5694-ed17-267a-4eb287cf8f71	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5694-ed17-3a94-7272fa5b74fb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5694-ed17-22d9-caaa2c86e90f	SE	SWE	752	Sweden 	Švedska	\N
00040000-5694-ed17-1071-c8341cd32491	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5694-ed17-b7dd-aa850376cf81	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5694-ed17-8dbb-a82b3b1359d0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5694-ed17-8f5e-32c877cc0ce8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5694-ed17-86d7-5f0ea05fdcfc	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5694-ed17-53d4-3683e6090827	TH	THA	764	Thailand 	Tajska	\N
00040000-5694-ed18-3187-9c5c10708e6d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5694-ed18-dd7c-7a35af5f3a12	TG	TGO	768	Togo 	Togo	\N
00040000-5694-ed18-d6d3-96412602b9e6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5694-ed18-2928-e5b7c5bbb826	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5694-ed18-3162-c5c3a55a5e0c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5694-ed18-dbbc-6e7d4a0c4208	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5694-ed18-fd61-89e161e46675	TR	TUR	792	Turkey 	Turčija	\N
00040000-5694-ed18-8847-4ddde2436f34	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5694-ed18-eb98-9aefb0a7b646	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5694-ed18-fabd-38c6bd7dfb6a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5694-ed18-9f6e-d06f2b85efae	UG	UGA	800	Uganda 	Uganda	\N
00040000-5694-ed18-98bf-cbc4b78fb79e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5694-ed18-ab2c-eb129f698951	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5694-ed18-3819-74bc3c674100	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5694-ed18-18f1-bcea286cc377	US	USA	840	United States 	Združene države Amerike	\N
00040000-5694-ed18-f5ff-0a23618c5601	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5694-ed18-6317-ae8bb763eeb7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5694-ed18-7d9a-3069d94735fe	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5694-ed18-1ceb-081bd61fb0f3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5694-ed18-472c-7076da79c59d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5694-ed18-9017-4ed4d57f8450	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5694-ed18-deb2-7f08eab9b279	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5694-ed18-67dc-2770dffa67b4	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5694-ed18-51bc-18f5abe659de	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5694-ed18-070b-36cc3ae543da	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5694-ed18-eca2-19beb7f82123	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5694-ed18-be5b-98e37e0e729a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5694-ed18-02da-6e3748c3788d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3191 (class 0 OID 35407501)
-- Dependencies: 240
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5694-ed1b-7326-200a56efb93f	000e0000-5694-ed1b-9e9c-09b590bd1e55	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-ed17-17d0-a8decde9c342	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5694-ed1b-651d-1defaa49c4d9	000e0000-5694-ed1b-7fd7-6ebeab1c85df	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-ed17-9289-9850002be198	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5694-ed1b-c3bc-9badade16de4	000e0000-5694-ed1b-939d-1f433c3049c1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5694-ed17-17d0-a8decde9c342	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5694-ed1b-3366-2a5639511ac8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5694-ed1b-68ef-60ac7cb44efd	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3176 (class 0 OID 35407306)
-- Dependencies: 225
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5694-ed1b-bf88-bfa9909c6d6f	000e0000-5694-ed1b-62fa-5f54f4b4df82	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5694-ed17-1940-37c5af8121ca
000d0000-5694-ed1b-cfb6-98ad0adf904b	000e0000-5694-ed1b-62fa-5f54f4b4df82	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-ebc8-f5415f1d0681	000e0000-5694-ed1b-7fd7-6ebeab1c85df	000c0000-5694-ed1b-aacc-bf3cc1b19f86	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5694-ed17-1940-37c5af8121ca
000d0000-5694-ed1b-6e75-1e28c05044ab	000e0000-5694-ed1b-7fd7-6ebeab1c85df	000c0000-5694-ed1b-d703-2f93e08e8a1f	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-9712-d5be1e5f8fa4	000e0000-5694-ed1b-7fd7-6ebeab1c85df	000c0000-5694-ed1b-cae3-520aaa332ac2	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5694-ed17-f0c9-4c8b1ef7fa91
000d0000-5694-ed1b-45b9-dbd231ea7e9f	000e0000-5694-ed1b-7fd7-6ebeab1c85df	000c0000-5694-ed1b-8346-8fa55a1a05da	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5694-ed17-b0f9-9210e1d95823
000d0000-5694-ed1b-5545-e683cec2795d	000e0000-5694-ed1b-7fd7-6ebeab1c85df	000c0000-5694-ed1b-68a2-f0240d389a47	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5694-ed17-b0f9-9210e1d95823
000d0000-5694-ed1b-488b-86da62422df0	000e0000-5694-ed1b-7fd7-6ebeab1c85df	000c0000-5694-ed1b-bcaa-b182cf4d9c82	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5694-ed17-1940-37c5af8121ca
000d0000-5694-ed1b-29f2-19f01dfb1699	000e0000-5694-ed1b-7fd7-6ebeab1c85df	000c0000-5694-ed1b-20ea-78a728ce8254	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5694-ed17-1940-37c5af8121ca
000d0000-5694-ed1b-f918-80ce1b4f83d0	000e0000-5694-ed1b-7fd7-6ebeab1c85df	000c0000-5694-ed1b-e950-5aa9f15eb3aa	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5694-ed17-d0f4-eb3f83cc6185
000d0000-5694-ed1b-c289-c06fe93a9fea	000e0000-5694-ed1b-7fd7-6ebeab1c85df	000c0000-5694-ed1b-7d4d-b57c93233799	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5694-ed17-2c30-34f12da984d6
000d0000-5694-ed1b-80d6-7bee4ea624a4	000e0000-5694-ed1b-2cd8-c2fe357ad5a7	000c0000-5694-ed1b-39e3-657e822f08bd	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-4244-fd80686bd81f	000e0000-5694-ed1b-9191-3ac324df0b6b	000c0000-5694-ed1b-2557-3d8cde915c77	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-9c29-0eefdb12d831	000e0000-5694-ed1b-9191-3ac324df0b6b	000c0000-5694-ed1b-8713-689740da7c9a	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-72eb-fdff8911f89d	000e0000-5694-ed1b-3574-128968336845	000c0000-5694-ed1b-2307-34ae5d3ee21d	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-a98c-26f1c4aa308f	000e0000-5694-ed1b-d313-9021d12af51c	000c0000-5694-ed1b-b49d-dfb0a9f2c925	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-b162-b4d5d1787bb7	000e0000-5694-ed1b-7521-06b92e937a6e	000c0000-5694-ed1b-80b3-ea95c2f49e6b	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-6a51-f5950884c54a	000e0000-5694-ed1b-a04b-b8583dd2909b	000c0000-5694-ed1b-bd96-315de59a2fc0	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-0e1c-8e5ed84897be	000e0000-5694-ed1b-798f-15e5c33cf7e4	000c0000-5694-ed1b-5aa4-928da395cd1d	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-3c5c-b5f7b607ede7	000e0000-5694-ed1b-d8b8-4977bab73cfc	000c0000-5694-ed1b-f1db-ee039a343bc8	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-d822-13e291d85a48	000e0000-5694-ed1b-d8b8-4977bab73cfc	000c0000-5694-ed1b-3dd7-ba0c9769e6f0	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-813c-85a318ba77d1	000e0000-5694-ed1b-e662-b9f661a66f90	000c0000-5694-ed1b-3487-121082a568b5	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
000d0000-5694-ed1b-9de2-d65a64de0ddc	000e0000-5694-ed1b-e662-b9f661a66f90	000c0000-5694-ed1b-06da-096a60742ab4	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5694-ed17-e89c-7a086abcc725
\.


--
-- TOC entry 3151 (class 0 OID 35407080)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 35407046)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 35407023)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5694-ed1b-9be3-4783bb6e7cb3	00080000-5694-ed1a-11c2-9eac7a20ee31	00090000-5694-ed1a-eb84-8265e31160df	AK		igralka
\.


--
-- TOC entry 3165 (class 0 OID 35407220)
-- Dependencies: 214
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 35407771)
-- Dependencies: 251
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5694-ed1a-08e1-ea81df5877f5	00010000-5694-ed19-ca81-40362a09162a	\N	Prva mapa	Root mapa	2016-01-12 13:10:02	2016-01-12 13:10:02	R	\N	\N
\.


--
-- TOC entry 3203 (class 0 OID 35407784)
-- Dependencies: 252
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 35407806)
-- Dependencies: 254
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 34548309)
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
-- TOC entry 3169 (class 0 OID 35407245)
-- Dependencies: 218
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 35406980)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5694-ed19-747d-e2fd940447bd	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5694-ed19-3a13-2aa1cfd05be4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5694-ed19-f93a-4e23fcf5f1c0	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5694-ed19-18fb-d8f24921350f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5694-ed19-0486-c8afb7bc2f66	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5694-ed19-8aed-15726a210b70	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5694-ed19-f520-28fe570f305f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5694-ed19-574d-e6895e8165a7	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5694-ed19-f6b7-af21a8050797	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5694-ed19-ee2b-64701b23ea06	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5694-ed19-e80c-4be155b1485d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5694-ed19-c34c-266e2de91976	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5694-ed19-9a5a-1ea2b0fd13d5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5694-ed19-6db7-5033b7f5458a	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5694-ed1a-4526-22799b3fd5a6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5694-ed1a-5d8d-8f0de07f8e2f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5694-ed1a-85ec-c1111f06849a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5694-ed1a-d2e4-18c61a09d6a3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5694-ed1a-07f2-c509b553de23	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5694-ed1c-6cf5-90201fca1832	application.tenant.maticnopodjetje	string	s:36:"00080000-5694-ed1c-f393-0578eacc9a17";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3136 (class 0 OID 35406880)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5694-ed1a-c222-827d9f8f3e49	00000000-5694-ed1a-4526-22799b3fd5a6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5694-ed1a-6d49-0e6fae37d8a9	00000000-5694-ed1a-4526-22799b3fd5a6	00010000-5694-ed19-ca81-40362a09162a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5694-ed1a-30de-a35ba9c93c40	00000000-5694-ed1a-5d8d-8f0de07f8e2f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3140 (class 0 OID 35406947)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5694-ed1b-cc1c-4f5c35658888	\N	00100000-5694-ed1a-681f-f5d31fd4f9d3	00100000-5694-ed1a-fe25-7617190b6a05	01	Gledališče Nimbis
00410000-5694-ed1b-4162-3b4dd745e66e	00410000-5694-ed1b-cc1c-4f5c35658888	00100000-5694-ed1a-681f-f5d31fd4f9d3	00100000-5694-ed1a-fe25-7617190b6a05	02	Tehnika
\.


--
-- TOC entry 3137 (class 0 OID 35406891)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5694-ed1a-4436-594c778aa14a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5694-ed1a-4233-bb3f970f4de4	00010000-5694-ed1a-2732-80980f862d82	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5694-ed1a-81fd-466d7a2a92a0	00010000-5694-ed1a-8283-8b6d0caf85be	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5694-ed1a-7945-87d6350d7820	00010000-5694-ed1a-50cd-dcd14ffbc622	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5694-ed1a-2e2b-82e37e981d84	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5694-ed1a-dfda-584a0de6d4d8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5694-ed1a-6927-4be9d0b910fa	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5694-ed1a-2ace-27f7dca2bdb6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5694-ed1a-eb84-8265e31160df	00010000-5694-ed1a-b6d2-d01bf46dc596	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5694-ed1a-f14a-494ef8a2e635	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5694-ed1a-b948-0ca5cb1031da	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5694-ed1a-b08c-131c551f1825	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5694-ed1a-0155-0ee2a8913b37	00010000-5694-ed1a-7406-f83c10c79abb	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5694-ed1a-be12-d202c49333f2	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-ed1a-3fb7-b78638525836	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-ed1a-683b-90fa7a2f631c	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-ed1a-dce3-918bd7b22b5e	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5694-ed1a-0de9-b2ab314607be	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5694-ed1a-6571-5e21e5f2f233	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-ed1a-ebfe-2f966bb1bf49	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5694-ed1a-213b-5630563d4c33	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3129 (class 0 OID 35406826)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5694-ed18-5f97-7806d5d91781	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5694-ed18-b69b-812bc342cacc	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5694-ed18-bafe-c44634a878a0	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5694-ed18-e37b-a6298059c721	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5694-ed18-f54a-ac6792f765a1	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5694-ed18-4ea5-4980714edc3c	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5694-ed18-b573-22421891bce3	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5694-ed18-47e1-68a00aaab35f	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5694-ed18-9404-03bf5de7104d	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5694-ed18-dd04-c3e8ea94ac90	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5694-ed18-cb0a-9def6bf3d7bc	Abonma-read	Abonma - branje	t
00030000-5694-ed18-687a-4d3f397a93ee	Abonma-write	Abonma - spreminjanje	t
00030000-5694-ed18-e921-0eb7519599d4	Alternacija-read	Alternacija - branje	t
00030000-5694-ed18-711f-265279e42787	Alternacija-write	Alternacija - spreminjanje	t
00030000-5694-ed18-79e3-6985f8fb57a7	Arhivalija-read	Arhivalija - branje	t
00030000-5694-ed18-8efb-6ece79879410	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5694-ed18-fea5-954f3974df9a	AuthStorage-read	AuthStorage - branje	t
00030000-5694-ed18-5b82-ca857accb089	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5694-ed18-4278-99c6fed55d88	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5694-ed18-f1e8-c62f7d70ee72	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5694-ed18-5fe2-c875ad12f983	Besedilo-read	Besedilo - branje	t
00030000-5694-ed18-8517-b9ecb28f2a93	Besedilo-write	Besedilo - spreminjanje	t
00030000-5694-ed18-4f3f-6250448754ea	Dodatek-read	Dodatek - branje	t
00030000-5694-ed18-648f-12b0b913e870	Dodatek-write	Dodatek - spreminjanje	t
00030000-5694-ed18-a7c7-8f8e963503f8	Dogodek-read	Dogodek - branje	t
00030000-5694-ed18-e442-817f1b1062eb	Dogodek-write	Dogodek - spreminjanje	t
00030000-5694-ed18-f7b2-2323f0925b34	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5694-ed18-f4f4-61addc08364c	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5694-ed18-ba9c-270d87b451ea	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5694-ed18-f0ec-42b1cdf96b64	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5694-ed18-eafb-8d84b79c6e9b	DogodekTrait-read	DogodekTrait - branje	t
00030000-5694-ed18-d642-6c7fda76cd73	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5694-ed18-adad-43ae33d72d01	DrugiVir-read	DrugiVir - branje	t
00030000-5694-ed18-0b64-0b2f65bcb635	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5694-ed18-f35d-dcaf8b1d650c	Drzava-read	Drzava - branje	t
00030000-5694-ed18-a497-06d7d0a2b399	Drzava-write	Drzava - spreminjanje	t
00030000-5694-ed18-7cce-9341c31572bd	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5694-ed18-6ff4-461d3287416d	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5694-ed18-7c36-3a8c253f80df	Funkcija-read	Funkcija - branje	t
00030000-5694-ed18-97f0-d0faa7ff5aaa	Funkcija-write	Funkcija - spreminjanje	t
00030000-5694-ed18-6111-38ac872a4b6b	Gostovanje-read	Gostovanje - branje	t
00030000-5694-ed18-bb39-29e4c7ced7e9	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5694-ed18-06c0-fa0328cb3a43	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5694-ed18-57f9-6f57a32b8295	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5694-ed18-43d5-cba4a23e9597	Kupec-read	Kupec - branje	t
00030000-5694-ed18-b88f-f2c67394bdf5	Kupec-write	Kupec - spreminjanje	t
00030000-5694-ed18-5b36-d0f7cd088e78	NacinPlacina-read	NacinPlacina - branje	t
00030000-5694-ed18-b121-c56e16c54c21	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5694-ed18-9e1a-82745f9292f8	Option-read	Option - branje	t
00030000-5694-ed18-a3c5-d3e4d95f32b8	Option-write	Option - spreminjanje	t
00030000-5694-ed18-0c48-d234e42d0e41	OptionValue-read	OptionValue - branje	t
00030000-5694-ed18-f9d0-d97c47fe6a7d	OptionValue-write	OptionValue - spreminjanje	t
00030000-5694-ed18-6adb-d77fb36d22c1	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5694-ed18-2987-657cbc927924	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5694-ed18-ea1b-e788900b19bb	Oseba-read	Oseba - branje	t
00030000-5694-ed18-1a76-f4ff0dc0461f	Oseba-write	Oseba - spreminjanje	t
00030000-5694-ed18-2755-bbc5326e3970	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5694-ed18-7ed2-a261e8d2bca2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5694-ed18-7141-dc7551d7cb4e	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5694-ed18-efaa-116b767d0654	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5694-ed18-2514-3b50bd209573	Pogodba-read	Pogodba - branje	t
00030000-5694-ed18-3679-c07c8ff9513e	Pogodba-write	Pogodba - spreminjanje	t
00030000-5694-ed18-d259-05c3ce91d45c	Popa-read	Popa - branje	t
00030000-5694-ed18-eeb4-a31c453721cd	Popa-write	Popa - spreminjanje	t
00030000-5694-ed18-d81a-96cbf0029c95	Posta-read	Posta - branje	t
00030000-5694-ed18-3741-4576d6a58b83	Posta-write	Posta - spreminjanje	t
00030000-5694-ed18-9071-7bf4e140026a	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5694-ed18-0bfc-6997dc58be33	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5694-ed18-bbad-04f36aab9407	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5694-ed18-791f-f8d8f525dcda	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5694-ed18-70b5-4e13d6e4804e	PostniNaslov-read	PostniNaslov - branje	t
00030000-5694-ed18-7cfb-dee13167ef00	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5694-ed18-561d-1fcb23f22e09	Praznik-read	Praznik - branje	t
00030000-5694-ed18-f835-411bc8ccfe31	Praznik-write	Praznik - spreminjanje	t
00030000-5694-ed18-d264-efa53993fcd5	Predstava-read	Predstava - branje	t
00030000-5694-ed18-511c-5e75c7edc552	Predstava-write	Predstava - spreminjanje	t
00030000-5694-ed18-82be-9c7f6914b430	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5694-ed18-3f64-3593a0d43193	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5694-ed18-22d6-fcbbf2af8660	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5694-ed18-d177-0f84b2e5c316	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5694-ed18-da46-44b705e877a8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5694-ed18-c598-8ae6d7dc5095	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5694-ed18-5ccd-d5e473a1841c	ProgramDela-read	ProgramDela - branje	t
00030000-5694-ed18-a144-1eeead096ae6	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5694-ed18-decb-163e0b65bc13	ProgramFestival-read	ProgramFestival - branje	t
00030000-5694-ed18-6faa-798fb00127f9	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5694-ed18-2011-33b649499a0c	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5694-ed18-41c6-ff68c3f9d8dd	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5694-ed18-7c48-6d53bee18079	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5694-ed18-4c71-4d42cfdb7710	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5694-ed18-8a67-a3b29b271a39	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5694-ed18-9459-c71ce97e953e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5694-ed18-b471-2d6022e98a57	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5694-ed18-df9b-7ef193ba259d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5694-ed18-d0d5-74467257dc88	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5694-ed18-6382-cf72d5bf661f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5694-ed18-cc16-c9a5f4bec279	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5694-ed18-0517-7cdccd083993	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5694-ed18-60ed-ec0e07034099	ProgramRazno-read	ProgramRazno - branje	t
00030000-5694-ed18-b2c0-31610320bc97	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5694-ed18-3772-40835b54905d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5694-ed18-ca7f-bf847f369f5a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5694-ed18-7739-4268d72a6148	Prostor-read	Prostor - branje	t
00030000-5694-ed18-21fc-c27dbc394a7f	Prostor-write	Prostor - spreminjanje	t
00030000-5694-ed18-1cc5-5993d068add3	Racun-read	Racun - branje	t
00030000-5694-ed18-8078-9db6b7e80231	Racun-write	Racun - spreminjanje	t
00030000-5694-ed18-0699-4a53ac3a8d3b	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5694-ed18-3d58-ef6b78eb3269	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5694-ed18-f47e-19e5bd329b16	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5694-ed18-190a-8bf47359a5fa	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5694-ed18-80b5-87524fff3ced	Rekvizit-read	Rekvizit - branje	t
00030000-5694-ed18-9d0b-f6769a40f566	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5694-ed18-8e91-eae063e301eb	Revizija-read	Revizija - branje	t
00030000-5694-ed18-a06a-29f03a807329	Revizija-write	Revizija - spreminjanje	t
00030000-5694-ed18-4b98-984f9f0f5e4f	Rezervacija-read	Rezervacija - branje	t
00030000-5694-ed18-6f35-a67868c020f2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5694-ed18-97d8-ada5b22024f8	SedezniRed-read	SedezniRed - branje	t
00030000-5694-ed18-e22b-1df2ff998e71	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5694-ed18-312f-604ddb849a44	Sedez-read	Sedez - branje	t
00030000-5694-ed18-a7b7-9944a0d49c3c	Sedez-write	Sedez - spreminjanje	t
00030000-5694-ed18-ec39-f2e48e9ee5e9	Sezona-read	Sezona - branje	t
00030000-5694-ed18-55d0-dc19e26ad19b	Sezona-write	Sezona - spreminjanje	t
00030000-5694-ed18-f9e7-3fec65f54bfd	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5694-ed18-c990-c70369240611	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5694-ed18-abc4-d1c6ffe98c27	Telefonska-read	Telefonska - branje	t
00030000-5694-ed18-dc6b-af994e325a31	Telefonska-write	Telefonska - spreminjanje	t
00030000-5694-ed18-f777-a52cadc47245	TerminStoritve-read	TerminStoritve - branje	t
00030000-5694-ed18-eced-2eab4ebf0447	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5694-ed18-b619-4e7ed393bb7b	TipDodatka-read	TipDodatka - branje	t
00030000-5694-ed18-cea6-81bc5de181be	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5694-ed18-2fbf-36cf5eaad000	TipFunkcije-read	TipFunkcije - branje	t
00030000-5694-ed18-ba72-8e348b51202d	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5694-ed18-6d64-a2c9355b5be2	TipPopa-read	TipPopa - branje	t
00030000-5694-ed18-d94a-170a17e0e441	TipPopa-write	TipPopa - spreminjanje	t
00030000-5694-ed18-63c8-75421b222873	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5694-ed18-52ff-0ef5044fa7ad	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5694-ed18-49cf-ad4b7925d09e	TipVaje-read	TipVaje - branje	t
00030000-5694-ed18-7654-c861198fc5af	TipVaje-write	TipVaje - spreminjanje	t
00030000-5694-ed18-e036-b01cb4d74fcf	Trr-read	Trr - branje	t
00030000-5694-ed18-785d-4be0ba609518	Trr-write	Trr - spreminjanje	t
00030000-5694-ed18-c56a-493419533170	Uprizoritev-read	Uprizoritev - branje	t
00030000-5694-ed18-970c-5f3074084fa8	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5694-ed18-6e7b-ad4a443b7d59	Vaja-read	Vaja - branje	t
00030000-5694-ed18-9d54-28c8b895cc24	Vaja-write	Vaja - spreminjanje	t
00030000-5694-ed18-2b4f-974891c1ae61	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5694-ed18-b886-7935482f590c	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5694-ed18-8e0e-b3e21d958ab2	VrstaStroska-read	VrstaStroska - branje	t
00030000-5694-ed18-7d40-4d6d69f1d19f	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5694-ed18-203b-1e708c6f2b34	Zaposlitev-read	Zaposlitev - branje	t
00030000-5694-ed18-4d55-411a54aeb49c	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5694-ed18-c904-02f2325743aa	Zasedenost-read	Zasedenost - branje	t
00030000-5694-ed18-913c-022069972f08	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5694-ed18-d90b-2024cbed8d40	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5694-ed18-9e1b-0fe7c9983dc6	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5694-ed18-b64e-dde913e79562	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5694-ed18-b296-3acebca81bfd	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5694-ed18-edd6-ecf2a7a57e1c	Job-read	Branje opravil - samo zase - branje	t
00030000-5694-ed18-969e-6c294d61d632	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5694-ed18-9ed1-3b2811d9b176	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5694-ed18-1e7f-9d5d8853ec25	Report-read	Report - branje	t
00030000-5694-ed18-be46-7d4adf6f5ab8	Report-write	Report - spreminjanje	t
00030000-5694-ed18-5d87-91d9518916f6	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5694-ed18-233b-8560d5b887f3	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5694-ed18-9268-ff9a1dc421a6	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5694-ed18-5de4-67c590b2fd29	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5694-ed18-b5b3-cafd40cb48a8	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5694-ed18-0d3a-a57c6192001e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5694-ed18-5a1d-c68ec0408489	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5694-ed18-c4c6-6d4cccba527b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5694-ed18-89dd-98b4728c712c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5694-ed18-ddc1-14da597e1501	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5694-ed18-3042-e43fa06e762f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5694-ed18-b65b-1ecbc5308712	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5694-ed18-45d0-17175f274f5c	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5694-ed18-953b-9c02a7d60803	Datoteka-write	Datoteka - spreminjanje	t
00030000-5694-ed18-8668-0033a28567ef	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3131 (class 0 OID 35406845)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5694-ed18-62a6-37cb6950003c	00030000-5694-ed18-b69b-812bc342cacc
00020000-5694-ed18-62a6-37cb6950003c	00030000-5694-ed18-5f97-7806d5d91781
00020000-5694-ed18-ae20-6ab619a7f4bf	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-f1e8-c62f7d70ee72
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-8517-b9ecb28f2a93
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-4278-99c6fed55d88
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-804a-1f83b136f73d	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-200a-bb9988923e8f	00030000-5694-ed18-4278-99c6fed55d88
00020000-5694-ed18-200a-bb9988923e8f	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-200a-bb9988923e8f	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-200a-bb9988923e8f	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-200a-bb9988923e8f	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-200a-bb9988923e8f	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-6311-c120de3ad4e3	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-6311-c120de3ad4e3	00030000-5694-ed18-4d55-411a54aeb49c
00020000-5694-ed18-6311-c120de3ad4e3	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-6311-c120de3ad4e3	00030000-5694-ed18-f54a-ac6792f765a1
00020000-5694-ed18-6311-c120de3ad4e3	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-6311-c120de3ad4e3	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-6311-c120de3ad4e3	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-89d0-86412a4b6921	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-89d0-86412a4b6921	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-89d0-86412a4b6921	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-bbd8-733d4adba9ba	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-bbd8-733d4adba9ba	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-bbd8-733d4adba9ba	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-bbd8-733d4adba9ba	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-bbd8-733d4adba9ba	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-bbd8-733d4adba9ba	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-bbd8-733d4adba9ba	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-bbd8-733d4adba9ba	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-a874-859ef361549c	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-a874-859ef361549c	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-a874-859ef361549c	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-a874-859ef361549c	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-f54a-ac6792f765a1
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-785d-4be0ba609518
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-7cfb-dee13167ef00
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-dc6b-af994e325a31
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-00ba-d41f2390a56c	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-04e5-35db3f45ce04	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-04e5-35db3f45ce04	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-04e5-35db3f45ce04	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-04e5-35db3f45ce04	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-04e5-35db3f45ce04	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-04e5-35db3f45ce04	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-04e5-35db3f45ce04	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-dc6b-af994e325a31
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-7cfb-dee13167ef00
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-785d-4be0ba609518
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-eeb4-a31c453721cd
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-57f9-6f57a32b8295
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-c598-8ae6d7dc5095
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-013c-c11cb07e5167	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-acd9-94c52a751d65	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-8407-d8c7ca20b402	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-8407-d8c7ca20b402	00030000-5694-ed18-d94a-170a17e0e441
00020000-5694-ed18-d206-8aa501750112	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-1d4b-7b16e31b4478	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed18-1d4b-7b16e31b4478	00030000-5694-ed18-3741-4576d6a58b83
00020000-5694-ed18-19c3-ac29180c952a	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed18-4b6b-d22b9afaa61f	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-4b6b-d22b9afaa61f	00030000-5694-ed18-a497-06d7d0a2b399
00020000-5694-ed18-1670-b8ac4fe762f3	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-8419-f5ef4a905a88	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed18-8419-f5ef4a905a88	00030000-5694-ed18-b296-3acebca81bfd
00020000-5694-ed18-bfff-c50eac709919	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed18-fbab-91592a12c07c	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed18-fbab-91592a12c07c	00030000-5694-ed18-9e1b-0fe7c9983dc6
00020000-5694-ed18-fa01-1d4a7c0c4bfa	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed18-f7f9-df4828abd596	00030000-5694-ed18-cb0a-9def6bf3d7bc
00020000-5694-ed18-f7f9-df4828abd596	00030000-5694-ed18-687a-4d3f397a93ee
00020000-5694-ed18-f6a4-1be82512c60e	00030000-5694-ed18-cb0a-9def6bf3d7bc
00020000-5694-ed18-ed19-b083309d08ed	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed18-ed19-b083309d08ed	00030000-5694-ed18-21fc-c27dbc394a7f
00020000-5694-ed18-ed19-b083309d08ed	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-ed19-b083309d08ed	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-ed19-b083309d08ed	00030000-5694-ed18-7cfb-dee13167ef00
00020000-5694-ed18-ed19-b083309d08ed	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-13fe-b2aaedddd4c3	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed18-13fe-b2aaedddd4c3	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-13fe-b2aaedddd4c3	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-6640-64326a0e480d	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-6640-64326a0e480d	00030000-5694-ed18-7d40-4d6d69f1d19f
00020000-5694-ed18-739b-658ca94d7907	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-163e-38ebffa1498b	00030000-5694-ed18-2987-657cbc927924
00020000-5694-ed18-163e-38ebffa1498b	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-163e-38ebffa1498b	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-163e-38ebffa1498b	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-163e-38ebffa1498b	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-163e-38ebffa1498b	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-163e-38ebffa1498b	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-163e-38ebffa1498b	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-163e-38ebffa1498b	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-24d5-494248d6727d	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-24d5-494248d6727d	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-24d5-494248d6727d	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-24d5-494248d6727d	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-24d5-494248d6727d	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-3d9c-1cc72eb064d8	00030000-5694-ed18-49cf-ad4b7925d09e
00020000-5694-ed18-3d9c-1cc72eb064d8	00030000-5694-ed18-7654-c861198fc5af
00020000-5694-ed18-abb8-8d03abe52cac	00030000-5694-ed18-49cf-ad4b7925d09e
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-b573-22421891bce3
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-47e1-68a00aaab35f
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-5ccd-d5e473a1841c
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-a144-1eeead096ae6
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-decb-163e0b65bc13
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-6faa-798fb00127f9
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-2011-33b649499a0c
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-41c6-ff68c3f9d8dd
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-7c48-6d53bee18079
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-4c71-4d42cfdb7710
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-8a67-a3b29b271a39
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-9459-c71ce97e953e
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-b471-2d6022e98a57
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-df9b-7ef193ba259d
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-d0d5-74467257dc88
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-6382-cf72d5bf661f
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-cc16-c9a5f4bec279
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-0517-7cdccd083993
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-60ed-ec0e07034099
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-b2c0-31610320bc97
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-3772-40835b54905d
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-ca7f-bf847f369f5a
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-d177-0f84b2e5c316
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-0b64-0b2f65bcb635
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-0bfc-6997dc58be33
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-969e-6c294d61d632
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-adad-43ae33d72d01
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-22d6-fcbbf2af8660
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-9071-7bf4e140026a
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-edd6-ecf2a7a57e1c
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-ca38-4716a5e877b0	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-5ccd-d5e473a1841c
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-decb-163e0b65bc13
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-2011-33b649499a0c
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-7c48-6d53bee18079
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-8a67-a3b29b271a39
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-b471-2d6022e98a57
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-d0d5-74467257dc88
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-cc16-c9a5f4bec279
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-60ed-ec0e07034099
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-3772-40835b54905d
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-22d6-fcbbf2af8660
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-adad-43ae33d72d01
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-9071-7bf4e140026a
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-edd6-ecf2a7a57e1c
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-3d79-b3fb6a0475a1	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-970c-5f3074084fa8
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-9404-03bf5de7104d
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-97f0-d0faa7ff5aaa
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-dd04-c3e8ea94ac90
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-7c94-aa7bf93c57c0	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-5f13-66fdd5d1f881	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-b585-b4fa5665e5b2	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-b585-b4fa5665e5b2	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed18-b585-b4fa5665e5b2	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-b585-b4fa5665e5b2	00030000-5694-ed18-97f0-d0faa7ff5aaa
00020000-5694-ed18-b585-b4fa5665e5b2	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-b585-b4fa5665e5b2	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-b585-b4fa5665e5b2	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-b585-b4fa5665e5b2	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-9404-03bf5de7104d
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-f54a-ac6792f765a1
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-3679-c07c8ff9513e
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-c990-c70369240611
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-7d10-8d13535ef5d5	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-c6fc-7c84efda662e	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-622a-53985151854d	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-622a-53985151854d	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-622a-53985151854d	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-622a-53985151854d	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed18-622a-53985151854d	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-622a-53985151854d	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-622a-53985151854d	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-577c-99d8ffe1e693	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-577c-99d8ffe1e693	00030000-5694-ed18-c990-c70369240611
00020000-5694-ed18-577c-99d8ffe1e693	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-577c-99d8ffe1e693	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-ce88-b65b68bc6d11	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-ce88-b65b68bc6d11	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-cb0a-9def6bf3d7bc
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-9404-03bf5de7104d
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-4278-99c6fed55d88
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-f1e8-c62f7d70ee72
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-8517-b9ecb28f2a93
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-adad-43ae33d72d01
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-0b64-0b2f65bcb635
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-97f0-d0faa7ff5aaa
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-dd04-c3e8ea94ac90
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-edd6-ecf2a7a57e1c
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-969e-6c294d61d632
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-f54a-ac6792f765a1
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-3679-c07c8ff9513e
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-9071-7bf4e140026a
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-0bfc-6997dc58be33
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-22d6-fcbbf2af8660
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-d177-0f84b2e5c316
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-b573-22421891bce3
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-5ccd-d5e473a1841c
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-47e1-68a00aaab35f
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-a144-1eeead096ae6
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-decb-163e0b65bc13
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-6faa-798fb00127f9
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-2011-33b649499a0c
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-41c6-ff68c3f9d8dd
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-7c48-6d53bee18079
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-4c71-4d42cfdb7710
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-8a67-a3b29b271a39
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-9459-c71ce97e953e
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-b471-2d6022e98a57
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-df9b-7ef193ba259d
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-d0d5-74467257dc88
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-6382-cf72d5bf661f
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-cc16-c9a5f4bec279
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-0517-7cdccd083993
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-60ed-ec0e07034099
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-b2c0-31610320bc97
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-3772-40835b54905d
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-ca7f-bf847f369f5a
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-c990-c70369240611
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-49cf-ad4b7925d09e
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-970c-5f3074084fa8
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed18-709b-388893b83e44	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-cb0a-9def6bf3d7bc
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-4278-99c6fed55d88
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-f1e8-c62f7d70ee72
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-8517-b9ecb28f2a93
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-49cf-ad4b7925d09e
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed18-4c1f-857ac01a702d	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-cb0a-9def6bf3d7bc
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-9404-03bf5de7104d
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-4278-99c6fed55d88
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-f1e8-c62f7d70ee72
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-8517-b9ecb28f2a93
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-97f0-d0faa7ff5aaa
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-dd04-c3e8ea94ac90
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-49cf-ad4b7925d09e
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-970c-5f3074084fa8
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed18-d501-48aa4e8d8426	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-9404-03bf5de7104d
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-4278-99c6fed55d88
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-f1e8-c62f7d70ee72
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-8517-b9ecb28f2a93
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-adad-43ae33d72d01
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-0b64-0b2f65bcb635
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-97f0-d0faa7ff5aaa
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-dd04-c3e8ea94ac90
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-edd6-ecf2a7a57e1c
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-969e-6c294d61d632
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-57f9-6f57a32b8295
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-f54a-ac6792f765a1
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-3679-c07c8ff9513e
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-eeb4-a31c453721cd
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-9071-7bf4e140026a
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-0bfc-6997dc58be33
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-7cfb-dee13167ef00
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-22d6-fcbbf2af8660
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-d177-0f84b2e5c316
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-c598-8ae6d7dc5095
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-b573-22421891bce3
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-5ccd-d5e473a1841c
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-47e1-68a00aaab35f
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-a144-1eeead096ae6
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-decb-163e0b65bc13
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-6faa-798fb00127f9
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-2011-33b649499a0c
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-41c6-ff68c3f9d8dd
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-7c48-6d53bee18079
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-4c71-4d42cfdb7710
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-8a67-a3b29b271a39
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-9459-c71ce97e953e
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-b471-2d6022e98a57
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-df9b-7ef193ba259d
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-d0d5-74467257dc88
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-6382-cf72d5bf661f
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-cc16-c9a5f4bec279
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-0517-7cdccd083993
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-60ed-ec0e07034099
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-b2c0-31610320bc97
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-3772-40835b54905d
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-ca7f-bf847f369f5a
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-c990-c70369240611
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-dc6b-af994e325a31
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-785d-4be0ba609518
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-970c-5f3074084fa8
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-4d55-411a54aeb49c
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed18-db9f-692c498fd30b	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-cb0a-9def6bf3d7bc
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-9404-03bf5de7104d
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-4278-99c6fed55d88
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-f1e8-c62f7d70ee72
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-8517-b9ecb28f2a93
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-97f0-d0faa7ff5aaa
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-dd04-c3e8ea94ac90
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-57f9-6f57a32b8295
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-f54a-ac6792f765a1
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-eeb4-a31c453721cd
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-7cfb-dee13167ef00
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-c598-8ae6d7dc5095
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-dc6b-af994e325a31
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-49cf-ad4b7925d09e
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-785d-4be0ba609518
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-970c-5f3074084fa8
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-4d55-411a54aeb49c
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed18-cbb3-5aea603af823	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-cb0a-9def6bf3d7bc
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-4278-99c6fed55d88
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-97f0-d0faa7ff5aaa
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-49cf-ad4b7925d09e
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed18-bd5e-04480f8e8f52	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-cb0a-9def6bf3d7bc
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-9404-03bf5de7104d
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-adad-43ae33d72d01
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-0b64-0b2f65bcb635
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-edd6-ecf2a7a57e1c
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-969e-6c294d61d632
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-57f9-6f57a32b8295
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-2987-657cbc927924
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-f54a-ac6792f765a1
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-3679-c07c8ff9513e
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-eeb4-a31c453721cd
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-9071-7bf4e140026a
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-0bfc-6997dc58be33
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-7cfb-dee13167ef00
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-22d6-fcbbf2af8660
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-d177-0f84b2e5c316
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-c598-8ae6d7dc5095
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-b573-22421891bce3
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-5ccd-d5e473a1841c
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-47e1-68a00aaab35f
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-a144-1eeead096ae6
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-decb-163e0b65bc13
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-6faa-798fb00127f9
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-2011-33b649499a0c
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-41c6-ff68c3f9d8dd
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-7c48-6d53bee18079
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-4c71-4d42cfdb7710
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-8a67-a3b29b271a39
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-9459-c71ce97e953e
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-b471-2d6022e98a57
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-df9b-7ef193ba259d
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-d0d5-74467257dc88
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-6382-cf72d5bf661f
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-cc16-c9a5f4bec279
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-0517-7cdccd083993
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-60ed-ec0e07034099
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-b2c0-31610320bc97
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-3772-40835b54905d
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-ca7f-bf847f369f5a
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-c990-c70369240611
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-dc6b-af994e325a31
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-49cf-ad4b7925d09e
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-785d-4be0ba609518
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-7d40-4d6d69f1d19f
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-4d55-411a54aeb49c
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed18-4066-f67c503ab592	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-5f97-7806d5d91781
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b69b-812bc342cacc
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-cb0a-9def6bf3d7bc
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-687a-4d3f397a93ee
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-9404-03bf5de7104d
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-79e3-6985f8fb57a7
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-8efb-6ece79879410
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-fea5-954f3974df9a
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-5b82-ca857accb089
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-4278-99c6fed55d88
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f1e8-c62f7d70ee72
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-5fe2-c875ad12f983
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-8517-b9ecb28f2a93
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-a7c7-8f8e963503f8
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-e37b-a6298059c721
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f7b2-2323f0925b34
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f4f4-61addc08364c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-ba9c-270d87b451ea
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f0ec-42b1cdf96b64
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-eafb-8d84b79c6e9b
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-d642-6c7fda76cd73
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-e442-817f1b1062eb
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-adad-43ae33d72d01
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-0b64-0b2f65bcb635
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f35d-dcaf8b1d650c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-a497-06d7d0a2b399
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-7cce-9341c31572bd
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-6ff4-461d3287416d
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-dd04-c3e8ea94ac90
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-97f0-d0faa7ff5aaa
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-6111-38ac872a4b6b
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-bb39-29e4c7ced7e9
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-9ed1-3b2811d9b176
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-edd6-ecf2a7a57e1c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-969e-6c294d61d632
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-06c0-fa0328cb3a43
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-57f9-6f57a32b8295
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-43d5-cba4a23e9597
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b88f-f2c67394bdf5
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-5a1d-c68ec0408489
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-0d3a-a57c6192001e
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-233b-8560d5b887f3
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-9268-ff9a1dc421a6
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-5de4-67c590b2fd29
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b5b3-cafd40cb48a8
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-5b36-d0f7cd088e78
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b121-c56e16c54c21
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-9e1a-82745f9292f8
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-0c48-d234e42d0e41
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f9d0-d97c47fe6a7d
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-a3c5-d3e4d95f32b8
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-6adb-d77fb36d22c1
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-2987-657cbc927924
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f54a-ac6792f765a1
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-2755-bbc5326e3970
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-7ed2-a261e8d2bca2
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-7141-dc7551d7cb4e
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-efaa-116b767d0654
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-3679-c07c8ff9513e
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-eeb4-a31c453721cd
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-d81a-96cbf0029c95
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-9071-7bf4e140026a
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-0bfc-6997dc58be33
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-bbad-04f36aab9407
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-791f-f8d8f525dcda
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-3741-4576d6a58b83
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-7cfb-dee13167ef00
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-561d-1fcb23f22e09
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f835-411bc8ccfe31
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-d264-efa53993fcd5
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-511c-5e75c7edc552
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-82be-9c7f6914b430
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-3f64-3593a0d43193
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-22d6-fcbbf2af8660
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-d177-0f84b2e5c316
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-da46-44b705e877a8
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-c598-8ae6d7dc5095
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b573-22421891bce3
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-5ccd-d5e473a1841c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-47e1-68a00aaab35f
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-a144-1eeead096ae6
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-decb-163e0b65bc13
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-6faa-798fb00127f9
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-2011-33b649499a0c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-41c6-ff68c3f9d8dd
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-7c48-6d53bee18079
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-4c71-4d42cfdb7710
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-8a67-a3b29b271a39
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-9459-c71ce97e953e
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b471-2d6022e98a57
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-df9b-7ef193ba259d
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-d0d5-74467257dc88
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-6382-cf72d5bf661f
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-cc16-c9a5f4bec279
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-0517-7cdccd083993
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-60ed-ec0e07034099
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b2c0-31610320bc97
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-3772-40835b54905d
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-ca7f-bf847f369f5a
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-7739-4268d72a6148
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-21fc-c27dbc394a7f
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-1cc5-5993d068add3
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-8078-9db6b7e80231
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-0699-4a53ac3a8d3b
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-3d58-ef6b78eb3269
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f47e-19e5bd329b16
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-190a-8bf47359a5fa
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-80b5-87524fff3ced
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-9d0b-f6769a40f566
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-1e7f-9d5d8853ec25
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-be46-7d4adf6f5ab8
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-8e91-eae063e301eb
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-a06a-29f03a807329
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-4b98-984f9f0f5e4f
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-6f35-a67868c020f2
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-97d8-ada5b22024f8
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-e22b-1df2ff998e71
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-312f-604ddb849a44
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-a7b7-9944a0d49c3c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-ec39-f2e48e9ee5e9
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-55d0-dc19e26ad19b
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-5d87-91d9518916f6
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-c990-c70369240611
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-dc6b-af994e325a31
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-f777-a52cadc47245
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-bafe-c44634a878a0
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-eced-2eab4ebf0447
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-2fbf-36cf5eaad000
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-ba72-8e348b51202d
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-6d64-a2c9355b5be2
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-d94a-170a17e0e441
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-63c8-75421b222873
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-52ff-0ef5044fa7ad
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-49cf-ad4b7925d09e
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-7654-c861198fc5af
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-785d-4be0ba609518
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-970c-5f3074084fa8
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-6e7b-ad4a443b7d59
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-9d54-28c8b895cc24
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-2b4f-974891c1ae61
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b886-7935482f590c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-8e0e-b3e21d958ab2
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-7d40-4d6d69f1d19f
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-45d0-17175f274f5c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b65b-1ecbc5308712
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-4d55-411a54aeb49c
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-c904-02f2325743aa
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-913c-022069972f08
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-d90b-2024cbed8d40
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-9e1b-0fe7c9983dc6
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b64e-dde913e79562
00020000-5694-ed1a-3bb8-f3ae646168ee	00030000-5694-ed18-b296-3acebca81bfd
00020000-5694-ed1a-7e4e-79c9d27c7483	00030000-5694-ed18-3042-e43fa06e762f
00020000-5694-ed1a-f9a0-b85d0f5df34b	00030000-5694-ed18-ddc1-14da597e1501
00020000-5694-ed1a-a921-86aa94973f09	00030000-5694-ed18-970c-5f3074084fa8
00020000-5694-ed1a-f84e-0701dbf39d06	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed1a-901b-7fb3e9807ead	00030000-5694-ed18-9268-ff9a1dc421a6
00020000-5694-ed1a-d8c8-3918000531d6	00030000-5694-ed18-5de4-67c590b2fd29
00020000-5694-ed1a-d6cf-0addcc91fd27	00030000-5694-ed18-b5b3-cafd40cb48a8
00020000-5694-ed1a-c21e-873a52574362	00030000-5694-ed18-233b-8560d5b887f3
00020000-5694-ed1a-0061-794bd6314ac9	00030000-5694-ed18-5a1d-c68ec0408489
00020000-5694-ed1a-d5ee-dc191ba345f7	00030000-5694-ed18-0d3a-a57c6192001e
00020000-5694-ed1a-8ac0-3790c0667d7c	00030000-5694-ed18-89dd-98b4728c712c
00020000-5694-ed1a-e2c9-5636347dffb2	00030000-5694-ed18-c4c6-6d4cccba527b
00020000-5694-ed1a-0098-d33cf253079f	00030000-5694-ed18-ea1b-e788900b19bb
00020000-5694-ed1a-d07f-104a2cc78f41	00030000-5694-ed18-1a76-f4ff0dc0461f
00020000-5694-ed1a-0590-97c7057e031e	00030000-5694-ed18-f54a-ac6792f765a1
00020000-5694-ed1a-fab0-e8a34c0893fe	00030000-5694-ed18-4ea5-4980714edc3c
00020000-5694-ed1a-45dd-d835e93d1400	00030000-5694-ed18-953b-9c02a7d60803
00020000-5694-ed1a-1665-cce980d59586	00030000-5694-ed18-8668-0033a28567ef
00020000-5694-ed1a-6d34-2c491715a608	00030000-5694-ed18-d259-05c3ce91d45c
00020000-5694-ed1a-6d34-2c491715a608	00030000-5694-ed18-eeb4-a31c453721cd
00020000-5694-ed1a-6d34-2c491715a608	00030000-5694-ed18-c56a-493419533170
00020000-5694-ed1a-ae22-0c78c2de4c01	00030000-5694-ed18-e036-b01cb4d74fcf
00020000-5694-ed1a-a988-5f540e509122	00030000-5694-ed18-785d-4be0ba609518
00020000-5694-ed1a-ca2d-1f3b64a7a74c	00030000-5694-ed18-5d87-91d9518916f6
00020000-5694-ed1a-2133-2abae4d1df70	00030000-5694-ed18-abc4-d1c6ffe98c27
00020000-5694-ed1a-6b6b-e2abc96173f1	00030000-5694-ed18-dc6b-af994e325a31
00020000-5694-ed1a-8158-ba6a4a145627	00030000-5694-ed18-70b5-4e13d6e4804e
00020000-5694-ed1a-f8b3-58e692b42cae	00030000-5694-ed18-7cfb-dee13167ef00
00020000-5694-ed1a-7a6a-2d28d1e6f19d	00030000-5694-ed18-203b-1e708c6f2b34
00020000-5694-ed1a-c0c2-f5e9ef42ea3e	00030000-5694-ed18-4d55-411a54aeb49c
00020000-5694-ed1a-1c42-76b3c5863a75	00030000-5694-ed18-2514-3b50bd209573
00020000-5694-ed1a-7825-904daa348547	00030000-5694-ed18-3679-c07c8ff9513e
00020000-5694-ed1a-6101-cc9b4c086dd6	00030000-5694-ed18-f9e7-3fec65f54bfd
00020000-5694-ed1a-2f5e-f82ed792ebce	00030000-5694-ed18-c990-c70369240611
00020000-5694-ed1a-43f3-822bca4adf99	00030000-5694-ed18-e921-0eb7519599d4
00020000-5694-ed1a-6cf3-0dde65da6dd3	00030000-5694-ed18-711f-265279e42787
00020000-5694-ed1a-7ee3-4c88e73b4931	00030000-5694-ed18-9404-03bf5de7104d
00020000-5694-ed1a-4112-7586c88eb5e7	00030000-5694-ed18-7c36-3a8c253f80df
00020000-5694-ed1a-0cdc-5a9504fa4e60	00030000-5694-ed18-97f0-d0faa7ff5aaa
00020000-5694-ed1a-a248-829b853b9aaf	00030000-5694-ed18-dd04-c3e8ea94ac90
\.


--
-- TOC entry 3170 (class 0 OID 35407252)
-- Dependencies: 219
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 35407286)
-- Dependencies: 223
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 35407419)
-- Dependencies: 235
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5694-ed1b-af4d-a3cbb7b8e494	00090000-5694-ed1a-4436-594c778aa14a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5694-ed1b-23d9-0c38fd8c6325	00090000-5694-ed1a-dfda-584a0de6d4d8	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5694-ed1b-6e59-349e9867afe1	00090000-5694-ed1a-0155-0ee2a8913b37	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5694-ed1b-df56-6876f6c05ec8	00090000-5694-ed1a-f14a-494ef8a2e635	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3139 (class 0 OID 35406927)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5694-ed1a-11c2-9eac7a20ee31	\N	00040000-5694-ed17-b8fc-84a499462b33	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-ed1a-a18f-0f0669d98a0b	\N	00040000-5694-ed17-b8fc-84a499462b33	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5694-ed1a-49da-66b762def84d	\N	00040000-5694-ed17-b8fc-84a499462b33	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-ed1a-1ea9-edb79659a103	\N	00040000-5694-ed17-b8fc-84a499462b33	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-ed1a-885f-bea0e0379675	\N	00040000-5694-ed17-b8fc-84a499462b33	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-ed1a-c4cc-606c51885107	\N	00040000-5694-ed17-9c4b-9d2316eaf18a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-ed1a-223a-bc258af925b7	\N	00040000-5694-ed17-94eb-d692a1b68c00	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-ed1a-775a-172c1a7d3bf4	\N	00040000-5694-ed17-65de-2ea7f870c5a3	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-ed1a-1257-38749d2258ae	\N	00040000-5694-ed17-af13-247cb0d77fc8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5694-ed1c-f393-0578eacc9a17	\N	00040000-5694-ed17-b8fc-84a499462b33	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3142 (class 0 OID 35406972)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5694-ed17-97d4-5545414a9651	8341	Adlešiči
00050000-5694-ed17-7dee-aa1ae5e93935	5270	Ajdovščina
00050000-5694-ed17-a7d2-d1aa9463ecfc	6280	Ankaran/Ancarano
00050000-5694-ed17-b135-398115caaed4	9253	Apače
00050000-5694-ed17-94f7-e65441a298f2	8253	Artiče
00050000-5694-ed17-f210-2e6c080e9c81	4275	Begunje na Gorenjskem
00050000-5694-ed17-3a31-b7f37ebd8eb4	1382	Begunje pri Cerknici
00050000-5694-ed17-2682-177c68205999	9231	Beltinci
00050000-5694-ed17-0fd4-f358f36b87cb	2234	Benedikt
00050000-5694-ed17-a8bc-9152ede93478	2345	Bistrica ob Dravi
00050000-5694-ed17-4105-ab71620216cf	3256	Bistrica ob Sotli
00050000-5694-ed17-04b8-ac6f9709d2aa	8259	Bizeljsko
00050000-5694-ed17-9430-fe34cd4b5804	1223	Blagovica
00050000-5694-ed17-2865-0f15597798f0	8283	Blanca
00050000-5694-ed17-af5f-ef90c6b26009	4260	Bled
00050000-5694-ed17-811c-2694206752b1	4273	Blejska Dobrava
00050000-5694-ed17-f17e-a5cd30750b54	9265	Bodonci
00050000-5694-ed17-c0c1-af84328fe281	9222	Bogojina
00050000-5694-ed17-7da5-78d89022be8c	4263	Bohinjska Bela
00050000-5694-ed17-000c-5d8104b261c6	4264	Bohinjska Bistrica
00050000-5694-ed17-b025-cc53a17fbf18	4265	Bohinjsko jezero
00050000-5694-ed17-59df-f7194da08186	1353	Borovnica
00050000-5694-ed17-3fdd-7eb3d442ac80	8294	Boštanj
00050000-5694-ed17-91ed-9f9e582ee4b0	5230	Bovec
00050000-5694-ed17-bdcf-c4ba6a2bc6eb	5295	Branik
00050000-5694-ed17-d12c-e2d4179ba8d8	3314	Braslovče
00050000-5694-ed17-f8a6-2269039f2838	5223	Breginj
00050000-5694-ed17-a0c1-8dcd7b23c9f1	8280	Brestanica
00050000-5694-ed17-42c5-c4849f89a18f	2354	Bresternica
00050000-5694-ed17-4112-bb1d61d1809a	4243	Brezje
00050000-5694-ed17-109f-1581f1cdd659	1351	Brezovica pri Ljubljani
00050000-5694-ed17-7285-47988db860b9	8250	Brežice
00050000-5694-ed17-d8d3-b169be78062e	4210	Brnik - Aerodrom
00050000-5694-ed17-9771-cf31c84ecc36	8321	Brusnice
00050000-5694-ed17-346c-2da71554e933	3255	Buče
00050000-5694-ed17-5a6a-cd04341f551b	8276	Bučka 
00050000-5694-ed17-c3a2-a2ec022a101a	9261	Cankova
00050000-5694-ed17-4b8c-babb432708ec	3000	Celje 
00050000-5694-ed17-9639-eccf20411e43	3001	Celje - poštni predali
00050000-5694-ed17-cdfc-c6f65cd099c4	4207	Cerklje na Gorenjskem
00050000-5694-ed17-aae1-269381d883eb	8263	Cerklje ob Krki
00050000-5694-ed17-e62b-689605cc14f8	1380	Cerknica
00050000-5694-ed17-7853-bfd5bf589766	5282	Cerkno
00050000-5694-ed17-b11d-2cd08dc3013c	2236	Cerkvenjak
00050000-5694-ed17-ec03-06658a13c8b7	2215	Ceršak
00050000-5694-ed17-0c94-69b28a8e6ce5	2326	Cirkovce
00050000-5694-ed17-2389-ac49982ef0db	2282	Cirkulane
00050000-5694-ed17-9f1b-0a7434e81fa7	5273	Col
00050000-5694-ed17-5bd3-4324e3f2a539	8251	Čatež ob Savi
00050000-5694-ed17-8f4a-f279f364c855	1413	Čemšenik
00050000-5694-ed17-9fb9-e30923c79fa7	5253	Čepovan
00050000-5694-ed17-e156-4649e9448a2d	9232	Črenšovci
00050000-5694-ed17-8280-4dbeb44ac8d6	2393	Črna na Koroškem
00050000-5694-ed17-195b-ac726528db2e	6275	Črni Kal
00050000-5694-ed17-5f39-21f59e373339	5274	Črni Vrh nad Idrijo
00050000-5694-ed17-d868-b3b019e2e6ba	5262	Črniče
00050000-5694-ed17-4d53-1bca6f67e3f2	8340	Črnomelj
00050000-5694-ed17-7cdc-ec19979bcbdc	6271	Dekani
00050000-5694-ed17-507c-3a2a2bbe8dec	5210	Deskle
00050000-5694-ed17-8bc9-b8a05d6234f1	2253	Destrnik
00050000-5694-ed17-435c-37d55fca7699	6215	Divača
00050000-5694-ed17-f1e5-04d2997d9fef	1233	Dob
00050000-5694-ed17-4602-cd2aec7df903	3224	Dobje pri Planini
00050000-5694-ed17-00d1-bde9dd823934	8257	Dobova
00050000-5694-ed17-c747-28fcdff72490	1423	Dobovec
00050000-5694-ed17-8438-111967282b88	5263	Dobravlje
00050000-5694-ed17-9c8a-6100de93a065	3204	Dobrna
00050000-5694-ed17-f5d0-4aabadfbf225	8211	Dobrnič
00050000-5694-ed17-e970-646cc253ac62	1356	Dobrova
00050000-5694-ed17-fd43-fb986a92e875	9223	Dobrovnik/Dobronak 
00050000-5694-ed17-9d91-27ed9e026819	5212	Dobrovo v Brdih
00050000-5694-ed17-370d-1fc8545abaed	1431	Dol pri Hrastniku
00050000-5694-ed17-d472-58f4c8aea1d6	1262	Dol pri Ljubljani
00050000-5694-ed17-66d6-d4262b53ab65	1273	Dole pri Litiji
00050000-5694-ed17-4528-8ecfb24672d7	1331	Dolenja vas
00050000-5694-ed17-6fcd-8d18ea0dc10d	8350	Dolenjske Toplice
00050000-5694-ed17-2095-be91c0545377	1230	Domžale
00050000-5694-ed17-f839-5324380fcf55	2252	Dornava
00050000-5694-ed17-4b33-537eba6439dc	5294	Dornberk
00050000-5694-ed17-419d-fa005bc9fefd	1319	Draga
00050000-5694-ed17-b6dd-99e20704163d	8343	Dragatuš
00050000-5694-ed17-6fbe-c4d769d3af7a	3222	Dramlje
00050000-5694-ed17-a131-5df382394e28	2370	Dravograd
00050000-5694-ed17-e6e4-307607c13ab7	4203	Duplje
00050000-5694-ed17-1786-0d826b13715c	6221	Dutovlje
00050000-5694-ed17-e9da-3e1fa42c5b57	8361	Dvor
00050000-5694-ed17-afe9-4cc468e9968f	2343	Fala
00050000-5694-ed17-5a0c-c147cc98d07e	9208	Fokovci
00050000-5694-ed17-2b77-c6cbf6eaa895	2313	Fram
00050000-5694-ed17-db45-e6157f81a722	3213	Frankolovo
00050000-5694-ed17-57e8-d835ab877850	1274	Gabrovka
00050000-5694-ed17-920a-3090bc0020e1	8254	Globoko
00050000-5694-ed17-6975-053e9d61cab7	5275	Godovič
00050000-5694-ed17-1739-e8e2d34001ef	4204	Golnik
00050000-5694-ed17-dba0-84d8fc69775c	3303	Gomilsko
00050000-5694-ed17-84fb-5eeac9ce5ff1	4224	Gorenja vas
00050000-5694-ed17-f234-fc1ccce98b5b	3263	Gorica pri Slivnici
00050000-5694-ed17-5c4a-453acdbb7740	2272	Gorišnica
00050000-5694-ed17-fea9-ed2a9b407fc8	9250	Gornja Radgona
00050000-5694-ed17-10a8-cfcae7aa3e51	3342	Gornji Grad
00050000-5694-ed17-4c22-83044215ba76	4282	Gozd Martuljek
00050000-5694-ed17-7abe-2e706e041d77	6272	Gračišče
00050000-5694-ed17-3c81-5d352d06debc	9264	Grad
00050000-5694-ed17-53b8-f7baf08660c2	8332	Gradac
00050000-5694-ed17-5965-0afb1390f0c3	1384	Grahovo
00050000-5694-ed17-d430-8933145afa6b	5242	Grahovo ob Bači
00050000-5694-ed17-0ac6-dab47d131808	5251	Grgar
00050000-5694-ed17-40d0-b4b8f07027d4	3302	Griže
00050000-5694-ed17-0e4b-2d8dec977e05	3231	Grobelno
00050000-5694-ed17-1494-a46c75b1b88f	1290	Grosuplje
00050000-5694-ed17-7ee9-582c4f2ef40f	2288	Hajdina
00050000-5694-ed17-04a1-0f5073a9e734	8362	Hinje
00050000-5694-ed17-ac82-4be94aab2c90	2311	Hoče
00050000-5694-ed17-2724-1575edfb6f76	9205	Hodoš/Hodos
00050000-5694-ed17-bb3c-a56f657f024f	1354	Horjul
00050000-5694-ed17-2f23-a9f819e2daed	1372	Hotedršica
00050000-5694-ed17-bdcf-ef0d15dae15a	1430	Hrastnik
00050000-5694-ed17-79f1-ec4fd95024e9	6225	Hruševje
00050000-5694-ed17-13ee-fc19c1dbb136	4276	Hrušica
00050000-5694-ed17-68ff-87fb9e1252ed	5280	Idrija
00050000-5694-ed17-f34c-1279a1a66fd2	1292	Ig
00050000-5694-ed17-4026-7f9f3d025ca0	6250	Ilirska Bistrica
00050000-5694-ed17-9a8f-08c2db09c6db	6251	Ilirska Bistrica-Trnovo
00050000-5694-ed17-0b28-a569f09244e4	1295	Ivančna Gorica
00050000-5694-ed17-a9a6-dc32f7608edb	2259	Ivanjkovci
00050000-5694-ed17-e5f2-b0b8b8430d8c	1411	Izlake
00050000-5694-ed17-d601-b55903819b44	6310	Izola/Isola
00050000-5694-ed17-b016-16ede4bc2e86	2222	Jakobski Dol
00050000-5694-ed17-c3df-c0156c1421b1	2221	Jarenina
00050000-5694-ed17-366c-02d8249cb45c	6254	Jelšane
00050000-5694-ed17-6365-c04ed2dd1123	4270	Jesenice
00050000-5694-ed17-85fe-206aa5aedc31	8261	Jesenice na Dolenjskem
00050000-5694-ed17-18db-44cce1ccd04a	3273	Jurklošter
00050000-5694-ed17-d9f9-5e70ced62797	2223	Jurovski Dol
00050000-5694-ed17-4923-d2b88029f189	2256	Juršinci
00050000-5694-ed17-cc3f-ec8b9c8a1ba2	5214	Kal nad Kanalom
00050000-5694-ed17-feb9-a6939eb5a7d0	3233	Kalobje
00050000-5694-ed17-8b19-ba2e799c848d	4246	Kamna Gorica
00050000-5694-ed17-b7c9-63142d2b09ad	2351	Kamnica
00050000-5694-ed17-4622-22e358b8809a	1241	Kamnik
00050000-5694-ed17-0c11-ae6cf99ff175	5213	Kanal
00050000-5694-ed17-2d22-6c4acffef67d	8258	Kapele
00050000-5694-ed17-03d9-92b7108e5af3	2362	Kapla
00050000-5694-ed17-effa-6ab175be3b0d	2325	Kidričevo
00050000-5694-ed17-fe41-84964661a988	1412	Kisovec
00050000-5694-ed17-c535-96f0906757b8	6253	Knežak
00050000-5694-ed17-b000-94244cf9f536	5222	Kobarid
00050000-5694-ed17-fb74-72211dacc492	9227	Kobilje
00050000-5694-ed17-e311-9219367732a6	1330	Kočevje
00050000-5694-ed17-01b2-1210d90bcebb	1338	Kočevska Reka
00050000-5694-ed17-13fe-2d4df0627000	2276	Kog
00050000-5694-ed17-77c0-617b7402c697	5211	Kojsko
00050000-5694-ed17-6c7a-d8b943be7d98	6223	Komen
00050000-5694-ed17-88c0-cfc06bdfedf6	1218	Komenda
00050000-5694-ed17-c8e1-9917508d94ba	6000	Koper/Capodistria 
00050000-5694-ed17-f7e8-193612abbd42	6001	Koper/Capodistria - poštni predali
00050000-5694-ed17-3433-1c84b97ef8fb	8282	Koprivnica
00050000-5694-ed17-d602-48e9e1aeda48	5296	Kostanjevica na Krasu
00050000-5694-ed17-2d81-3940bc36e5ba	8311	Kostanjevica na Krki
00050000-5694-ed17-b2f0-0a093cc7e9d2	1336	Kostel
00050000-5694-ed17-3cd3-016c592124a6	6256	Košana
00050000-5694-ed17-c8d9-c8f7d5e603c2	2394	Kotlje
00050000-5694-ed17-fb53-296ee3c86d3c	6240	Kozina
00050000-5694-ed17-f6ad-61fea0e1af7d	3260	Kozje
00050000-5694-ed17-49a7-6e168a391399	4000	Kranj 
00050000-5694-ed17-7ac7-a2430875b3a3	4001	Kranj - poštni predali
00050000-5694-ed17-5a49-e493c1845625	4280	Kranjska Gora
00050000-5694-ed17-1e9a-15f2b4ded996	1281	Kresnice
00050000-5694-ed17-844d-e23a8970e350	4294	Križe
00050000-5694-ed17-35d5-44b795544cae	9206	Križevci
00050000-5694-ed17-6007-c28333bb00b2	9242	Križevci pri Ljutomeru
00050000-5694-ed17-ae8e-6e5f92c023da	1301	Krka
00050000-5694-ed17-fa1f-27ff9b355c97	8296	Krmelj
00050000-5694-ed17-c0c6-d6e2556e8326	4245	Kropa
00050000-5694-ed17-7e15-465c11b4975c	8262	Krška vas
00050000-5694-ed17-1b05-880f40bfb3ec	8270	Krško
00050000-5694-ed17-b6f6-6cf4f54103c9	9263	Kuzma
00050000-5694-ed17-5ea2-4ea300f26d85	2318	Laporje
00050000-5694-ed17-e5e2-06bcb47e03f9	3270	Laško
00050000-5694-ed17-c194-faeeb282ef4c	1219	Laze v Tuhinju
00050000-5694-ed17-b96b-7df22df0bc57	2230	Lenart v Slovenskih goricah
00050000-5694-ed17-f8ba-e26eee3d2313	9220	Lendava/Lendva
00050000-5694-ed17-93fa-3608b1f9d26b	4248	Lesce
00050000-5694-ed17-0f7c-a22947242c78	3261	Lesično
00050000-5694-ed17-f4e9-d8b0d92dad7c	8273	Leskovec pri Krškem
00050000-5694-ed17-256c-2b3ea758df52	2372	Libeliče
00050000-5694-ed17-4b8a-035aebde1a94	2341	Limbuš
00050000-5694-ed17-e805-c3bcfc72855d	1270	Litija
00050000-5694-ed17-9eea-c932616c9d83	3202	Ljubečna
00050000-5694-ed17-006c-c72009b62f7f	1000	Ljubljana 
00050000-5694-ed17-b62b-bb1633b2b504	1001	Ljubljana - poštni predali
00050000-5694-ed17-9add-88fc8e9c26ed	1231	Ljubljana - Črnuče
00050000-5694-ed17-f9da-d206f43279d4	1261	Ljubljana - Dobrunje
00050000-5694-ed17-4153-06d3d51ef98d	1260	Ljubljana - Polje
00050000-5694-ed17-90ba-b56f24cfd911	1210	Ljubljana - Šentvid
00050000-5694-ed17-0c88-8d2540cf185e	1211	Ljubljana - Šmartno
00050000-5694-ed17-c9c1-cc9846a554f7	3333	Ljubno ob Savinji
00050000-5694-ed17-f5cf-25adf2a1826b	9240	Ljutomer
00050000-5694-ed17-713d-39a7019d2258	3215	Loče
00050000-5694-ed17-080b-8b2d360ae297	5231	Log pod Mangartom
00050000-5694-ed17-15ac-ee92a3535398	1358	Log pri Brezovici
00050000-5694-ed17-5e42-f7c8bf4f6364	1370	Logatec
00050000-5694-ed17-8e36-a49dbabf9bb5	1371	Logatec
00050000-5694-ed17-33ea-317415087505	1434	Loka pri Zidanem Mostu
00050000-5694-ed17-d4b7-76eb70563e24	3223	Loka pri Žusmu
00050000-5694-ed17-4e6b-c9102a530734	6219	Lokev
00050000-5694-ed17-9a00-d7c7fc55c318	1318	Loški Potok
00050000-5694-ed17-4040-13a2ca2f9405	2324	Lovrenc na Dravskem polju
00050000-5694-ed17-61a8-bfa538758381	2344	Lovrenc na Pohorju
00050000-5694-ed17-6530-1eec9a0c56eb	3334	Luče
00050000-5694-ed17-a8d1-cddac675054e	1225	Lukovica
00050000-5694-ed17-1432-19919da15847	9202	Mačkovci
00050000-5694-ed17-88c4-b93e5955bf5e	2322	Majšperk
00050000-5694-ed17-3cfd-7b4f03aa1f8e	2321	Makole
00050000-5694-ed17-cf26-107e8f29ed82	9243	Mala Nedelja
00050000-5694-ed17-03b8-ecc87cafb389	2229	Malečnik
00050000-5694-ed17-4eeb-5d0fe1b78bf2	6273	Marezige
00050000-5694-ed17-6627-eafe263b4b01	2000	Maribor 
00050000-5694-ed17-c374-f4db89ba4e60	2001	Maribor - poštni predali
00050000-5694-ed17-8259-cc20966425d1	2206	Marjeta na Dravskem polju
00050000-5694-ed17-70de-22ab6b27da2d	2281	Markovci
00050000-5694-ed17-33e3-4c9a845d093c	9221	Martjanci
00050000-5694-ed17-fcfc-1a9cc08739a4	6242	Materija
00050000-5694-ed17-e2bd-2b602a1dc3a4	4211	Mavčiče
00050000-5694-ed17-1b4b-206726460c24	1215	Medvode
00050000-5694-ed17-ff4a-4642ba68bd0d	1234	Mengeš
00050000-5694-ed17-d58c-4df0035983a2	8330	Metlika
00050000-5694-ed17-7eb5-9219d9cafb9c	2392	Mežica
00050000-5694-ed17-0fe9-66d951d29f3c	2204	Miklavž na Dravskem polju
00050000-5694-ed17-0ed6-d79d95fe9294	2275	Miklavž pri Ormožu
00050000-5694-ed17-cd3a-08a9794d3cca	5291	Miren
00050000-5694-ed17-e7ba-0fd55c952925	8233	Mirna
00050000-5694-ed17-9536-5df2dc1fd93b	8216	Mirna Peč
00050000-5694-ed17-3cef-dc04d7664578	2382	Mislinja
00050000-5694-ed17-7bf9-5a30913566bf	4281	Mojstrana
00050000-5694-ed17-978d-e44e3f63cbd5	8230	Mokronog
00050000-5694-ed17-2ab1-02496c76d6bf	1251	Moravče
00050000-5694-ed17-668a-de469808a298	9226	Moravske Toplice
00050000-5694-ed17-4f88-6ae181729201	5216	Most na Soči
00050000-5694-ed17-6d2d-1f1dbf474544	1221	Motnik
00050000-5694-ed17-8c7a-15997377a58a	3330	Mozirje
00050000-5694-ed17-07a6-03ddeb931894	9000	Murska Sobota 
00050000-5694-ed17-c6d9-c8a7c9ec4979	9001	Murska Sobota - poštni predali
00050000-5694-ed17-41f6-be4b79ca5820	2366	Muta
00050000-5694-ed17-48f6-6424ded71390	4202	Naklo
00050000-5694-ed17-ae60-6d6fa047c216	3331	Nazarje
00050000-5694-ed17-5639-5b6a5155068a	1357	Notranje Gorice
00050000-5694-ed17-d0d4-d9a0b4e01e74	3203	Nova Cerkev
00050000-5694-ed17-a229-5b5934b6bfc6	5000	Nova Gorica 
00050000-5694-ed17-5951-a42c5349d443	5001	Nova Gorica - poštni predali
00050000-5694-ed17-d632-2a32c3438fb0	1385	Nova vas
00050000-5694-ed17-cf07-955f225ba39b	8000	Novo mesto
00050000-5694-ed17-aaa1-892c187b1618	8001	Novo mesto - poštni predali
00050000-5694-ed17-d226-ac445c9cf061	6243	Obrov
00050000-5694-ed17-3e25-7d509d22f8e6	9233	Odranci
00050000-5694-ed17-899b-7b8be7d8b4e3	2317	Oplotnica
00050000-5694-ed17-d883-cf374f021fcf	2312	Orehova vas
00050000-5694-ed17-cb14-b6e8aad1284b	2270	Ormož
00050000-5694-ed17-ef00-227780b0fff9	1316	Ortnek
00050000-5694-ed17-d0e7-42562ab210e3	1337	Osilnica
00050000-5694-ed17-8622-728bcbba8350	8222	Otočec
00050000-5694-ed17-f33c-8e05792d10d6	2361	Ožbalt
00050000-5694-ed17-ab13-874d0cbec0ee	2231	Pernica
00050000-5694-ed17-4218-2d394c550eed	2211	Pesnica pri Mariboru
00050000-5694-ed17-5189-ad3a5281f8f3	9203	Petrovci
00050000-5694-ed17-763f-70a56f6df113	3301	Petrovče
00050000-5694-ed17-545a-fd91c4fe20d3	6330	Piran/Pirano
00050000-5694-ed17-5654-6b5bae1c6c74	8255	Pišece
00050000-5694-ed17-5700-7deece720a61	6257	Pivka
00050000-5694-ed17-131b-2bb26fe6bd95	6232	Planina
00050000-5694-ed17-a956-c3d02e03a28f	3225	Planina pri Sevnici
00050000-5694-ed17-b12e-fe918ea9ed60	6276	Pobegi
00050000-5694-ed17-00f6-16a7fa635bdf	8312	Podbočje
00050000-5694-ed17-e4df-4d400f08b59e	5243	Podbrdo
00050000-5694-ed17-e8cb-2397d32d6688	3254	Podčetrtek
00050000-5694-ed17-6b41-3c56172bf1d6	2273	Podgorci
00050000-5694-ed17-9e20-c2eb26b11b22	6216	Podgorje
00050000-5694-ed17-a513-04babbda229a	2381	Podgorje pri Slovenj Gradcu
00050000-5694-ed17-df05-bd26dea608e7	6244	Podgrad
00050000-5694-ed17-4590-8925126a50bc	1414	Podkum
00050000-5694-ed17-f57c-5fd1daab04f7	2286	Podlehnik
00050000-5694-ed17-f8fd-3e600ed91327	5272	Podnanos
00050000-5694-ed17-3b98-303e1aa910eb	4244	Podnart
00050000-5694-ed17-26f3-19217da4e8a6	3241	Podplat
00050000-5694-ed17-5905-96b537592863	3257	Podsreda
00050000-5694-ed17-7e20-c71d2b1af633	2363	Podvelka
00050000-5694-ed17-0567-67784235cb93	2208	Pohorje
00050000-5694-ed17-820a-04efaec5d9b0	2257	Polenšak
00050000-5694-ed17-207c-1d498cf7c104	1355	Polhov Gradec
00050000-5694-ed17-a0f9-b4bd6a657a78	4223	Poljane nad Škofjo Loko
00050000-5694-ed17-4c0d-63576d801293	2319	Poljčane
00050000-5694-ed17-133e-040703688fd2	1272	Polšnik
00050000-5694-ed17-4e43-55f9ce29480f	3313	Polzela
00050000-5694-ed17-f0f4-01a9f4147b51	3232	Ponikva
00050000-5694-ed17-0867-43ae46d84222	6320	Portorož/Portorose
00050000-5694-ed17-064a-abf4fc2dabb7	6230	Postojna
00050000-5694-ed17-f92b-0aede451978c	2331	Pragersko
00050000-5694-ed17-3ce3-64ada239a24e	3312	Prebold
00050000-5694-ed17-7d4a-92b49596942c	4205	Preddvor
00050000-5694-ed17-3f5d-e174ef59cbca	6255	Prem
00050000-5694-ed17-ac06-20e61b3e99cf	1352	Preserje
00050000-5694-ed17-2ef9-185c6bc69c04	6258	Prestranek
00050000-5694-ed17-8064-b1cda902d5f5	2391	Prevalje
00050000-5694-ed17-bc00-1dec931da7d6	3262	Prevorje
00050000-5694-ed17-10f3-d25da45f015f	1276	Primskovo 
00050000-5694-ed17-5239-25512f1ba7c3	3253	Pristava pri Mestinju
00050000-5694-ed17-adc4-5ca892afa59b	9207	Prosenjakovci/Partosfalva
00050000-5694-ed17-0581-b4d872fe885e	5297	Prvačina
00050000-5694-ed17-c81b-c78b4b9b3a87	2250	Ptuj
00050000-5694-ed17-9e20-ebe8f9505b46	2323	Ptujska Gora
00050000-5694-ed17-b564-217309534156	9201	Puconci
00050000-5694-ed17-5a7d-cf913a670291	2327	Rače
00050000-5694-ed17-635d-cc2888b37724	1433	Radeče
00050000-5694-ed17-25fd-94efbb6a5f14	9252	Radenci
00050000-5694-ed17-a960-c76bac7e4473	2360	Radlje ob Dravi
00050000-5694-ed17-5a4a-3ea12d9bbf75	1235	Radomlje
00050000-5694-ed17-bed7-6977fdaf3562	4240	Radovljica
00050000-5694-ed17-534e-a169060b2d8e	8274	Raka
00050000-5694-ed17-e9dc-535fc9f42f3e	1381	Rakek
00050000-5694-ed17-a132-50bba8073dc6	4283	Rateče - Planica
00050000-5694-ed17-de01-9aab3174336a	2390	Ravne na Koroškem
00050000-5694-ed17-7543-44baac9e26a3	9246	Razkrižje
00050000-5694-ed17-32df-c97d1637c14c	3332	Rečica ob Savinji
00050000-5694-ed17-41fa-03a27e9a3922	5292	Renče
00050000-5694-ed17-0863-d644f08b6dd9	1310	Ribnica
00050000-5694-ed17-44f7-8f483e1aaac2	2364	Ribnica na Pohorju
00050000-5694-ed17-9ef0-6590b001fe39	3272	Rimske Toplice
00050000-5694-ed17-119b-5eedc0072163	1314	Rob
00050000-5694-ed17-5063-8fc159aaf95f	5215	Ročinj
00050000-5694-ed17-c52c-0c07def0e489	3250	Rogaška Slatina
00050000-5694-ed17-b2ba-1828ffb61c36	9262	Rogašovci
00050000-5694-ed17-961b-f126f3076eae	3252	Rogatec
00050000-5694-ed17-4f69-a388765cb83c	1373	Rovte
00050000-5694-ed17-be5b-3799b4e8c6d7	2342	Ruše
00050000-5694-ed17-c9ad-022ddfb305e0	1282	Sava
00050000-5694-ed17-a093-4652679a2003	6333	Sečovlje/Sicciole
00050000-5694-ed17-0b06-48274f0c1144	4227	Selca
00050000-5694-ed17-c543-4b21f78e47fa	2352	Selnica ob Dravi
00050000-5694-ed17-2f56-64488959e3e4	8333	Semič
00050000-5694-ed17-c089-ed6894253743	8281	Senovo
00050000-5694-ed17-52b8-f01f502a6d17	6224	Senožeče
00050000-5694-ed17-03a0-c0e2b1d91f87	8290	Sevnica
00050000-5694-ed17-018d-cbba788c87b0	6210	Sežana
00050000-5694-ed17-b948-a545f349d764	2214	Sladki Vrh
00050000-5694-ed17-f063-47beb45dc686	5283	Slap ob Idrijci
00050000-5694-ed17-7e97-7b0d008f6a44	2380	Slovenj Gradec
00050000-5694-ed17-097f-fea04a2300bc	2310	Slovenska Bistrica
00050000-5694-ed17-4418-f05a358043d0	3210	Slovenske Konjice
00050000-5694-ed17-53b9-d518c50a8de8	1216	Smlednik
00050000-5694-ed17-ec29-9fd94db55555	5232	Soča
00050000-5694-ed17-7e04-77b65c79867d	1317	Sodražica
00050000-5694-ed17-7a2d-34f87e1cbb53	3335	Solčava
00050000-5694-ed17-9098-328250a24f4e	5250	Solkan
00050000-5694-ed17-33b0-c063a4908996	4229	Sorica
00050000-5694-ed17-05c8-e87f803fc16b	4225	Sovodenj
00050000-5694-ed17-8608-1bb0881b5867	5281	Spodnja Idrija
00050000-5694-ed17-d05b-b0c88eaf118f	2241	Spodnji Duplek
00050000-5694-ed17-7212-ec5a0b4b7d08	9245	Spodnji Ivanjci
00050000-5694-ed17-c3e0-75c4d96a0c48	2277	Središče ob Dravi
00050000-5694-ed17-2591-4e66cc893036	4267	Srednja vas v Bohinju
00050000-5694-ed17-be7f-ff439f427a3d	8256	Sromlje 
00050000-5694-ed17-e9eb-fdbeb56bbc8a	5224	Srpenica
00050000-5694-ed17-9b7f-a7b54c2b7745	1242	Stahovica
00050000-5694-ed17-d19e-8e9c7d66b2a1	1332	Stara Cerkev
00050000-5694-ed17-bc8d-fd95be01ee3f	8342	Stari trg ob Kolpi
00050000-5694-ed17-8221-03df9231f10d	1386	Stari trg pri Ložu
00050000-5694-ed17-202b-8d1e8c5a2bf5	2205	Starše
00050000-5694-ed17-f5ea-60b90e09f4aa	2289	Stoperce
00050000-5694-ed17-c910-91c086d9497a	8322	Stopiče
00050000-5694-ed17-05d9-61408a23e171	3206	Stranice
00050000-5694-ed17-b44c-ad6d4c9c7ceb	8351	Straža
00050000-5694-ed17-36a5-3688a8a5d5a8	1313	Struge
00050000-5694-ed17-3653-5496047d3799	8293	Studenec
00050000-5694-ed17-06a5-ebffbd1d18b3	8331	Suhor
00050000-5694-ed17-00de-391267da83ae	2233	Sv. Ana v Slovenskih goricah
00050000-5694-ed17-3ac1-06a7a548c863	2235	Sv. Trojica v Slovenskih goricah
00050000-5694-ed17-3957-5b4c5414bf90	2353	Sveti Duh na Ostrem Vrhu
00050000-5694-ed17-08ec-6e9ce54f5098	9244	Sveti Jurij ob Ščavnici
00050000-5694-ed17-d563-ed6c6a19e20b	3264	Sveti Štefan
00050000-5694-ed17-5c9f-63a5f93675f4	2258	Sveti Tomaž
00050000-5694-ed17-b430-ddfd3546301d	9204	Šalovci
00050000-5694-ed17-d613-34f198d1a5e1	5261	Šempas
00050000-5694-ed17-62ea-e22306873060	5290	Šempeter pri Gorici
00050000-5694-ed17-777a-709a5cfb9ee0	3311	Šempeter v Savinjski dolini
00050000-5694-ed17-ffe1-f0d5fa4915c4	4208	Šenčur
00050000-5694-ed17-bc56-43c13690c42f	2212	Šentilj v Slovenskih goricah
00050000-5694-ed17-c9b0-1119c7668aa4	8297	Šentjanž
00050000-5694-ed17-485f-329a106e7245	2373	Šentjanž pri Dravogradu
00050000-5694-ed17-ea5f-522467a76e71	8310	Šentjernej
00050000-5694-ed17-db64-03de68e8f72c	3230	Šentjur
00050000-5694-ed17-dab8-426ea1361a52	3271	Šentrupert
00050000-5694-ed17-4e39-808b07cb0c0d	8232	Šentrupert
00050000-5694-ed17-1715-dc48587d7a89	1296	Šentvid pri Stični
00050000-5694-ed17-7f24-491fdf977d10	8275	Škocjan
00050000-5694-ed17-ca08-a6b65f25cb35	6281	Škofije
00050000-5694-ed17-fab4-c019daf14faa	4220	Škofja Loka
00050000-5694-ed17-efbb-f05669799c10	3211	Škofja vas
00050000-5694-ed17-5322-97bba7e71650	1291	Škofljica
00050000-5694-ed17-438c-8b6d5f45fcc5	6274	Šmarje
00050000-5694-ed17-7443-6ea256f1c75d	1293	Šmarje - Sap
00050000-5694-ed17-0bb3-839922c4e7d3	3240	Šmarje pri Jelšah
00050000-5694-ed17-1bf0-094768a82598	8220	Šmarješke Toplice
00050000-5694-ed17-4536-53191b0fec38	2315	Šmartno na Pohorju
00050000-5694-ed17-cb5a-b967e819fee9	3341	Šmartno ob Dreti
00050000-5694-ed17-91b4-90fe9ecdc9c6	3327	Šmartno ob Paki
00050000-5694-ed17-d680-bbf5ce050111	1275	Šmartno pri Litiji
00050000-5694-ed17-a18c-895df2f8db99	2383	Šmartno pri Slovenj Gradcu
00050000-5694-ed17-fd6b-36006cb214bd	3201	Šmartno v Rožni dolini
00050000-5694-ed17-0e2d-14881a38a819	3325	Šoštanj
00050000-5694-ed17-c43c-449ec48b2a9a	6222	Štanjel
00050000-5694-ed17-b458-e51d9d875545	3220	Štore
00050000-5694-ed17-0bd0-796ac4dfbbe6	3304	Tabor
00050000-5694-ed17-ce62-1757c69757c4	3221	Teharje
00050000-5694-ed17-3ea1-da49bdf1472f	9251	Tišina
00050000-5694-ed17-e27e-72f594cdbea7	5220	Tolmin
00050000-5694-ed17-b3a2-bff3c0451b79	3326	Topolšica
00050000-5694-ed17-971c-2833c6784a4f	2371	Trbonje
00050000-5694-ed17-11f0-b815339caaa2	1420	Trbovlje
00050000-5694-ed17-c6af-2e4d47310e37	8231	Trebelno 
00050000-5694-ed17-b239-97f5baadc4aa	8210	Trebnje
00050000-5694-ed17-9273-3d148efe90c2	5252	Trnovo pri Gorici
00050000-5694-ed17-eb1b-c8e9dc634120	2254	Trnovska vas
00050000-5694-ed17-ae9d-e1496fa6b53f	1222	Trojane
00050000-5694-ed17-939e-52801578b254	1236	Trzin
00050000-5694-ed17-438b-512edce3ff1f	4290	Tržič
00050000-5694-ed17-2ff2-6bf30e9c9a9b	8295	Tržišče
00050000-5694-ed17-3679-7d777a76e92b	1311	Turjak
00050000-5694-ed17-65be-aad5ed960491	9224	Turnišče
00050000-5694-ed17-ca36-099403aadc1a	8323	Uršna sela
00050000-5694-ed17-6c1b-bbea0f7016b8	1252	Vače
00050000-5694-ed17-4f4b-6a22b1500324	3320	Velenje 
00050000-5694-ed17-deb5-c0f60dced074	3322	Velenje - poštni predali
00050000-5694-ed17-dace-3c61a0b92add	8212	Velika Loka
00050000-5694-ed17-d838-a7b4375b4f47	2274	Velika Nedelja
00050000-5694-ed17-6251-03c54878fbd9	9225	Velika Polana
00050000-5694-ed17-0410-700804c9f950	1315	Velike Lašče
00050000-5694-ed17-f6e1-c288832a7013	8213	Veliki Gaber
00050000-5694-ed17-2d23-e49d6800b690	9241	Veržej
00050000-5694-ed17-37ca-48b4f1208f28	1312	Videm - Dobrepolje
00050000-5694-ed17-6a81-2c52114b6213	2284	Videm pri Ptuju
00050000-5694-ed17-b2f7-c3b601a6af02	8344	Vinica
00050000-5694-ed17-8d69-56dd7bc99a67	5271	Vipava
00050000-5694-ed17-95bb-f97a570da9d5	4212	Visoko
00050000-5694-ed17-2c29-604d3b0d00d4	1294	Višnja Gora
00050000-5694-ed17-837f-53a079619ef7	3205	Vitanje
00050000-5694-ed17-8027-9a5d46754a5e	2255	Vitomarci
00050000-5694-ed17-7197-c7ff48f27cb7	1217	Vodice
00050000-5694-ed17-a445-0f412adde459	3212	Vojnik\t
00050000-5694-ed17-9203-2d8dfac36abe	5293	Volčja Draga
00050000-5694-ed17-493c-78f6cd9f9a11	2232	Voličina
00050000-5694-ed17-806c-a4a234610bdc	3305	Vransko
00050000-5694-ed17-3db6-a5f19c7837fd	6217	Vremski Britof
00050000-5694-ed17-a419-5054684e1766	1360	Vrhnika
00050000-5694-ed17-d460-251667d333f0	2365	Vuhred
00050000-5694-ed17-52e9-9122f8236a66	2367	Vuzenica
00050000-5694-ed17-cfbe-a64aff8435cf	8292	Zabukovje 
00050000-5694-ed17-a80a-cb559ace0725	1410	Zagorje ob Savi
00050000-5694-ed17-6fbb-020d43da92d1	1303	Zagradec
00050000-5694-ed17-0867-9c430dea4f33	2283	Zavrč
00050000-5694-ed17-5eb5-6690dd8f275f	8272	Zdole 
00050000-5694-ed17-fef9-4c720f4bfaca	4201	Zgornja Besnica
00050000-5694-ed17-9103-0c20fc6713e7	2242	Zgornja Korena
00050000-5694-ed17-99e5-5e5c7581e4f7	2201	Zgornja Kungota
00050000-5694-ed17-167b-fb4624639b07	2316	Zgornja Ložnica
00050000-5694-ed17-ad17-8481c712ccae	2314	Zgornja Polskava
00050000-5694-ed17-7f07-a821cca21a77	2213	Zgornja Velka
00050000-5694-ed17-acf2-8948a3813f53	4247	Zgornje Gorje
00050000-5694-ed17-27dc-8800c2fc2ad4	4206	Zgornje Jezersko
00050000-5694-ed17-3f5e-e2f9dcd74ebc	2285	Zgornji Leskovec
00050000-5694-ed17-149d-d63f59931c84	1432	Zidani Most
00050000-5694-ed17-c103-6691eedfcc9c	3214	Zreče
00050000-5694-ed17-502a-cf55b052de7b	4209	Žabnica
00050000-5694-ed17-c072-94c2c41eafaf	3310	Žalec
00050000-5694-ed17-3924-7a8dd43ac8f5	4228	Železniki
00050000-5694-ed17-083f-365bf89cd983	2287	Žetale
00050000-5694-ed17-b2b0-b602ceb600ab	4226	Žiri
00050000-5694-ed17-b099-8e7c934d5aec	4274	Žirovnica
00050000-5694-ed17-3313-013b3699ba2c	8360	Žužemberk
\.


--
-- TOC entry 3193 (class 0 OID 35407657)
-- Dependencies: 242
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 35407226)
-- Dependencies: 215
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 35406957)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5694-ed1a-5a3c-293bf0e98b50	00080000-5694-ed1a-11c2-9eac7a20ee31	\N	00040000-5694-ed17-b8fc-84a499462b33	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5694-ed1a-3494-d8352b87d32c	00080000-5694-ed1a-11c2-9eac7a20ee31	\N	00040000-5694-ed17-b8fc-84a499462b33	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5694-ed1a-979e-8ab0253b2866	00080000-5694-ed1a-a18f-0f0669d98a0b	\N	00040000-5694-ed17-b8fc-84a499462b33	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3153 (class 0 OID 35407101)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5694-ed18-1cf6-4a065a67382f	novo leto	1	1	\N	t
00430000-5694-ed18-5d3c-596c4c4cd5f9	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5694-ed18-905b-3eecd14ff40c	dan upora proti okupatorju	27	4	\N	t
00430000-5694-ed18-1346-0b101cd645a8	praznik dela	1	5	\N	t
00430000-5694-ed18-c68d-5ebc8cb2aeb8	praznik dela	2	5	\N	t
00430000-5694-ed18-9371-3475f8b4acec	dan Primoža Trubarja	8	6	\N	f
00430000-5694-ed18-6abc-f70063f250ac	dan državnosti	25	6	\N	t
00430000-5694-ed18-8376-b280e7c89aea	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5694-ed18-b6c4-15aa51395995	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5694-ed18-a2d7-0d0c40d5a73a	dan suverenosti	25	10	\N	f
00430000-5694-ed18-0a02-8e42694aa887	dan spomina na mrtve	1	11	\N	t
00430000-5694-ed18-93f8-08a1e3443b92	dan Rudolfa Maistra	23	11	\N	f
00430000-5694-ed18-ae0a-483890e65142	božič	25	12	\N	t
00430000-5694-ed18-97cc-62b0a1c55384	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5694-ed18-7a5a-10e07bfdfb96	Marijino vnebovzetje	15	8	\N	t
00430000-5694-ed18-413a-6d667dc831b2	dan reformacije	31	10	\N	t
00430000-5694-ed18-b0ec-80f9aa7feab0	velikonočna nedelja	27	3	2016	t
00430000-5694-ed18-5ea1-b4b399da6465	velikonočna nedelja	16	4	2017	t
00430000-5694-ed18-ee78-0de649c728d9	velikonočna nedelja	1	4	2018	t
00430000-5694-ed18-b722-d55927b5692d	velikonočna nedelja	21	4	2019	t
00430000-5694-ed18-c28a-ac0fc2483fe0	velikonočna nedelja	12	4	2020	t
00430000-5694-ed18-04ef-f45cf946c355	velikonočna nedelja	4	4	2021	t
00430000-5694-ed18-a798-dbc0416fa5e7	velikonočna nedelja	17	4	2022	t
00430000-5694-ed18-b01b-8dfcab79a8c9	velikonočna nedelja	9	4	2023	t
00430000-5694-ed18-de25-d286fdd4541d	velikonočna nedelja	31	3	2024	t
00430000-5694-ed18-35d5-ee7938c535f7	velikonočna nedelja	20	4	2025	t
00430000-5694-ed18-a6be-d8c8a899cd7c	velikonočna nedelja	5	4	2026	t
00430000-5694-ed18-e0a9-3c2f73ab71b6	velikonočna nedelja	28	3	2027	t
00430000-5694-ed18-715f-73231e0168af	velikonočna nedelja	16	4	2028	t
00430000-5694-ed18-7307-c0fda89fd5bd	velikonočna nedelja	1	4	2029	t
00430000-5694-ed18-e1ad-7a91272489c1	velikonočna nedelja	21	4	2030	t
00430000-5694-ed18-5b57-27566c1ac462	velikonočni ponedeljek	28	3	2016	t
00430000-5694-ed18-a276-82af13f164b4	velikonočni ponedeljek	17	4	2017	t
00430000-5694-ed18-b736-56afc9301e8a	velikonočni ponedeljek	2	4	2018	t
00430000-5694-ed18-4251-acd01c581d73	velikonočni ponedeljek	22	4	2019	t
00430000-5694-ed18-e06f-1e11c09bdac9	velikonočni ponedeljek	13	4	2020	t
00430000-5694-ed18-7389-d39d90906005	velikonočni ponedeljek	5	4	2021	t
00430000-5694-ed18-3da6-b270e2cfa276	velikonočni ponedeljek	18	4	2022	t
00430000-5694-ed18-bc75-6ef9419a0139	velikonočni ponedeljek	10	4	2023	t
00430000-5694-ed18-f6a2-d64f32ff3927	velikonočni ponedeljek	1	4	2024	t
00430000-5694-ed18-5d14-a09c7a375dda	velikonočni ponedeljek	21	4	2025	t
00430000-5694-ed18-10a0-64d09c8d894b	velikonočni ponedeljek	6	4	2026	t
00430000-5694-ed18-1b6d-fadca82c41db	velikonočni ponedeljek	29	3	2027	t
00430000-5694-ed18-e449-28f177dcbacf	velikonočni ponedeljek	17	4	2028	t
00430000-5694-ed18-90fd-adefa8a139cd	velikonočni ponedeljek	2	4	2029	t
00430000-5694-ed18-a4c2-ae668f5943a8	velikonočni ponedeljek	22	4	2030	t
00430000-5694-ed18-adae-d7b3c9693d16	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5694-ed18-0a44-9ed9e156e339	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5694-ed18-9e38-14b602a01355	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5694-ed18-6175-4225f6da8866	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5694-ed18-c9ba-fe62f64a8966	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5694-ed18-33cc-d54179362b1d	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5694-ed18-1c79-8e5f1bcabc35	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5694-ed18-4b42-f56fb6fce356	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5694-ed18-9620-61e0dbf4ef44	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5694-ed18-6f2c-e1de8c62a87e	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5694-ed18-cd3b-87b1af74cd2d	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5694-ed18-1cb5-2c837642e01f	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5694-ed18-e820-d1b733a5ed80	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5694-ed18-e103-604b76eb50cd	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5694-ed18-f647-bc2d713a761c	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3149 (class 0 OID 35407061)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 35407073)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 35407238)
-- Dependencies: 217
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 35407671)
-- Dependencies: 243
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 35407681)
-- Dependencies: 244
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5694-ed1b-16cd-038db818c031	00080000-5694-ed1a-49da-66b762def84d	0987	AK
00190000-5694-ed1b-8eb2-2c4f372e1cc3	00080000-5694-ed1a-a18f-0f0669d98a0b	0989	AK
00190000-5694-ed1b-732e-78ed92a3878e	00080000-5694-ed1a-1ea9-edb79659a103	0986	AK
00190000-5694-ed1b-1788-0016220a61f4	00080000-5694-ed1a-c4cc-606c51885107	0984	AK
00190000-5694-ed1b-0caa-f561d3ab92f5	00080000-5694-ed1a-223a-bc258af925b7	0983	AK
00190000-5694-ed1b-76cb-ed6e2638623e	00080000-5694-ed1a-775a-172c1a7d3bf4	0982	AK
00190000-5694-ed1c-af44-207c5cca0906	00080000-5694-ed1c-f393-0578eacc9a17	1001	AK
\.


--
-- TOC entry 3192 (class 0 OID 35407570)
-- Dependencies: 241
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5694-ed1b-3611-48aad4d9be14	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3196 (class 0 OID 35407689)
-- Dependencies: 245
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 35407267)
-- Dependencies: 221
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5694-ed1a-c2f3-458cad15de9a	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5694-ed1a-3425-65bae93c290c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5694-ed1a-4f89-91c494e99632	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5694-ed1a-20b3-6eda21815b44	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5694-ed1a-a3c0-8a5d219b6e16	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5694-ed1a-7091-ebd7f8a85464	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5694-ed1a-a8d0-50ac9480170f	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3164 (class 0 OID 35407211)
-- Dependencies: 213
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 35407201)
-- Dependencies: 212
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 35407408)
-- Dependencies: 234
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 35407338)
-- Dependencies: 228
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 35407035)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 35406797)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5694-ed1c-f393-0578eacc9a17	00010000-5694-ed19-0d3c-dafe2595ae54	2016-01-12 13:10:04	INS	a:0:{}
2	App\\Entity\\Option	00000000-5694-ed1c-6cf5-90201fca1832	00010000-5694-ed19-0d3c-dafe2595ae54	2016-01-12 13:10:04	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5694-ed1c-af44-207c5cca0906	00010000-5694-ed19-0d3c-dafe2595ae54	2016-01-12 13:10:04	INS	a:0:{}
\.


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3173 (class 0 OID 35407280)
-- Dependencies: 222
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 35406835)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5694-ed18-62a6-37cb6950003c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5694-ed18-ae20-6ab619a7f4bf	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5694-ed18-95f1-34e4bfda00b2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5694-ed18-6cc6-46580a0b1bdb	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5694-ed18-804a-1f83b136f73d	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5694-ed18-200a-bb9988923e8f	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5694-ed18-6311-c120de3ad4e3	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5694-ed18-89d0-86412a4b6921	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5694-ed18-bbd8-733d4adba9ba	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-ed18-a874-859ef361549c	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-ed18-00ba-d41f2390a56c	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-ed18-04e5-35db3f45ce04	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5694-ed18-013c-c11cb07e5167	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5694-ed18-acd9-94c52a751d65	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5694-ed18-8407-d8c7ca20b402	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5694-ed18-d206-8aa501750112	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5694-ed18-1d4b-7b16e31b4478	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5694-ed18-19c3-ac29180c952a	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5694-ed18-4b6b-d22b9afaa61f	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5694-ed18-1670-b8ac4fe762f3	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5694-ed18-8419-f5ef4a905a88	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5694-ed18-bfff-c50eac709919	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5694-ed18-fbab-91592a12c07c	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5694-ed18-fa01-1d4a7c0c4bfa	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5694-ed18-f7f9-df4828abd596	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5694-ed18-f6a4-1be82512c60e	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5694-ed18-ed19-b083309d08ed	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5694-ed18-13fe-b2aaedddd4c3	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5694-ed18-6640-64326a0e480d	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5694-ed18-739b-658ca94d7907	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5694-ed18-163e-38ebffa1498b	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5694-ed18-24d5-494248d6727d	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5694-ed18-3d9c-1cc72eb064d8	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5694-ed18-abb8-8d03abe52cac	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5694-ed18-ca38-4716a5e877b0	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5694-ed18-3d79-b3fb6a0475a1	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5694-ed18-7c94-aa7bf93c57c0	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5694-ed18-5f13-66fdd5d1f881	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5694-ed18-b585-b4fa5665e5b2	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5694-ed18-7d10-8d13535ef5d5	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5694-ed18-c6fc-7c84efda662e	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5694-ed18-622a-53985151854d	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5694-ed18-577c-99d8ffe1e693	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5694-ed18-ce88-b65b68bc6d11	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5694-ed18-709b-388893b83e44	direktor	minimalne pravice za direktorja	t
00020000-5694-ed18-4c1f-857ac01a702d	arhivar	arhivar	t
00020000-5694-ed18-d501-48aa4e8d8426	dramaturg	dramaturg	t
00020000-5694-ed18-db9f-692c498fd30b	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5694-ed18-cbb3-5aea603af823	poslovni-sekretar	poslovni sekretar	t
00020000-5694-ed18-bd5e-04480f8e8f52	vodja-tehnike	vodja tehnike	t
00020000-5694-ed18-4066-f67c503ab592	racunovodja	računovodja	t
00020000-5694-ed1a-3bb8-f3ae646168ee	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5694-ed1a-7e4e-79c9d27c7483	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-f9a0-b85d0f5df34b	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-a921-86aa94973f09	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-f84e-0701dbf39d06	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-901b-7fb3e9807ead	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-d8c8-3918000531d6	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-d6cf-0addcc91fd27	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-c21e-873a52574362	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-0061-794bd6314ac9	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-d5ee-dc191ba345f7	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-8ac0-3790c0667d7c	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-e2c9-5636347dffb2	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-0098-d33cf253079f	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-d07f-104a2cc78f41	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-0590-97c7057e031e	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-fab0-e8a34c0893fe	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-45dd-d835e93d1400	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-1665-cce980d59586	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-6d34-2c491715a608	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5694-ed1a-ae22-0c78c2de4c01	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-a988-5f540e509122	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-ca2d-1f3b64a7a74c	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-2133-2abae4d1df70	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-6b6b-e2abc96173f1	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-8158-ba6a4a145627	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-f8b3-58e692b42cae	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-7a6a-2d28d1e6f19d	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-c0c2-f5e9ef42ea3e	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-1c42-76b3c5863a75	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-7825-904daa348547	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-6101-cc9b4c086dd6	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-2f5e-f82ed792ebce	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-43f3-822bca4adf99	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-6cf3-0dde65da6dd3	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-7ee3-4c88e73b4931	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-4112-7586c88eb5e7	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-0cdc-5a9504fa4e60	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5694-ed1a-a248-829b853b9aaf	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3128 (class 0 OID 35406819)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5694-ed19-ca81-40362a09162a	00020000-5694-ed18-95f1-34e4bfda00b2
00010000-5694-ed19-0d3c-dafe2595ae54	00020000-5694-ed18-95f1-34e4bfda00b2
00010000-5694-ed1a-0281-da10e6501b8b	00020000-5694-ed1a-3bb8-f3ae646168ee
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-7e4e-79c9d27c7483
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-901b-7fb3e9807ead
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-0061-794bd6314ac9
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-8ac0-3790c0667d7c
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-0098-d33cf253079f
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-1665-cce980d59586
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-a921-86aa94973f09
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-ae22-0c78c2de4c01
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-2133-2abae4d1df70
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-8158-ba6a4a145627
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-7a6a-2d28d1e6f19d
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-1c42-76b3c5863a75
00010000-5694-ed1a-d61b-8ce0f1e36b31	00020000-5694-ed1a-43f3-822bca4adf99
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-7e4e-79c9d27c7483
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-f9a0-b85d0f5df34b
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-a921-86aa94973f09
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-f84e-0701dbf39d06
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-0098-d33cf253079f
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-fab0-e8a34c0893fe
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-ae22-0c78c2de4c01
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-2133-2abae4d1df70
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-8158-ba6a4a145627
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-7a6a-2d28d1e6f19d
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-1c42-76b3c5863a75
00010000-5694-ed1a-4acd-0d9804ff72ca	00020000-5694-ed1a-43f3-822bca4adf99
00010000-5694-ed1a-b1e6-218a525237ba	00020000-5694-ed1a-7e4e-79c9d27c7483
00010000-5694-ed1a-b1e6-218a525237ba	00020000-5694-ed1a-f9a0-b85d0f5df34b
00010000-5694-ed1a-b1e6-218a525237ba	00020000-5694-ed1a-a921-86aa94973f09
00010000-5694-ed1a-b1e6-218a525237ba	00020000-5694-ed1a-f84e-0701dbf39d06
00010000-5694-ed1a-b1e6-218a525237ba	00020000-5694-ed1a-8ac0-3790c0667d7c
00010000-5694-ed1a-b1e6-218a525237ba	00020000-5694-ed1a-0098-d33cf253079f
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-f9a0-b85d0f5df34b
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-d8c8-3918000531d6
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-d5ee-dc191ba345f7
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-e2c9-5636347dffb2
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-8ac0-3790c0667d7c
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-45dd-d835e93d1400
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-0098-d33cf253079f
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-d07f-104a2cc78f41
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-ae22-0c78c2de4c01
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-a988-5f540e509122
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-2133-2abae4d1df70
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-6b6b-e2abc96173f1
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-8158-ba6a4a145627
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-f8b3-58e692b42cae
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-7a6a-2d28d1e6f19d
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-c0c2-f5e9ef42ea3e
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-1c42-76b3c5863a75
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-7825-904daa348547
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-43f3-822bca4adf99
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-6cf3-0dde65da6dd3
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-4112-7586c88eb5e7
00010000-5694-ed1a-68e3-ed8ba5e9c828	00020000-5694-ed1a-0cdc-5a9504fa4e60
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-f9a0-b85d0f5df34b
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-d8c8-3918000531d6
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-c21e-873a52574362
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-d5ee-dc191ba345f7
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-e2c9-5636347dffb2
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-8ac0-3790c0667d7c
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-45dd-d835e93d1400
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-0098-d33cf253079f
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-d07f-104a2cc78f41
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-0590-97c7057e031e
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-ae22-0c78c2de4c01
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-a988-5f540e509122
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-ca2d-1f3b64a7a74c
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-2133-2abae4d1df70
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-6b6b-e2abc96173f1
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-8158-ba6a4a145627
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-f8b3-58e692b42cae
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-7a6a-2d28d1e6f19d
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-c0c2-f5e9ef42ea3e
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-1c42-76b3c5863a75
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-7825-904daa348547
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-43f3-822bca4adf99
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-6cf3-0dde65da6dd3
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-7ee3-4c88e73b4931
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-4112-7586c88eb5e7
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-0cdc-5a9504fa4e60
00010000-5694-ed1a-ef6b-f537db9558d3	00020000-5694-ed1a-a248-829b853b9aaf
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-f9a0-b85d0f5df34b
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-a921-86aa94973f09
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-d8c8-3918000531d6
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-d6cf-0addcc91fd27
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-c21e-873a52574362
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-901b-7fb3e9807ead
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-d5ee-dc191ba345f7
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-e2c9-5636347dffb2
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-8ac0-3790c0667d7c
00010000-5694-ed1a-d366-f350ae251535	00020000-5694-ed1a-45dd-d835e93d1400
00010000-5694-ed1a-daaf-87082e722dcd	00020000-5694-ed1a-7e4e-79c9d27c7483
00010000-5694-ed1a-daaf-87082e722dcd	00020000-5694-ed1a-f84e-0701dbf39d06
00010000-5694-ed1a-daaf-87082e722dcd	00020000-5694-ed1a-901b-7fb3e9807ead
00010000-5694-ed1a-daaf-87082e722dcd	00020000-5694-ed1a-0061-794bd6314ac9
00010000-5694-ed1a-daaf-87082e722dcd	00020000-5694-ed1a-8ac0-3790c0667d7c
00010000-5694-ed1a-daaf-87082e722dcd	00020000-5694-ed1a-0098-d33cf253079f
00010000-5694-ed1a-daaf-87082e722dcd	00020000-5694-ed1a-1665-cce980d59586
00010000-5694-ed1a-daaf-87082e722dcd	00020000-5694-ed1a-6101-cc9b4c086dd6
00010000-5694-ed1a-a775-6afcca10466d	00020000-5694-ed1a-6d34-2c491715a608
00010000-5694-ed1a-2687-8e6633f3e41a	00020000-5694-ed18-709b-388893b83e44
00010000-5694-ed1a-45cd-8a05e64e3d48	00020000-5694-ed18-4c1f-857ac01a702d
00010000-5694-ed1a-b4d9-0dcca2158be5	00020000-5694-ed18-d501-48aa4e8d8426
00010000-5694-ed1a-812b-62fb54262ef7	00020000-5694-ed18-db9f-692c498fd30b
00010000-5694-ed1a-75eb-22d73413529a	00020000-5694-ed18-cbb3-5aea603af823
00010000-5694-ed1a-5518-234d1fb7d939	00020000-5694-ed18-bd5e-04480f8e8f52
00010000-5694-ed1a-c9f9-509ccaa0eb42	00020000-5694-ed18-4066-f67c503ab592
\.


--
-- TOC entry 3175 (class 0 OID 35407294)
-- Dependencies: 224
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 35407232)
-- Dependencies: 216
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 35407161)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5694-ed1a-0abb-a25cea29da7f	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5694-ed1a-6b7a-9b5fd530c2f6	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5694-ed1a-8ac2-31b632c09091	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3124 (class 0 OID 35406784)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5694-ed17-300c-b22ba32e22a0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5694-ed17-e838-0532efda960f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5694-ed17-508f-f74bc1f7309a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5694-ed17-ebf4-274f8397581a	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5694-ed17-fa2b-c516d23c12ef	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3123 (class 0 OID 35406776)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5694-ed17-e5de-9ce89e8f5630	00230000-5694-ed17-ebf4-274f8397581a	popa
00240000-5694-ed17-d7b8-da8fd312d97b	00230000-5694-ed17-ebf4-274f8397581a	oseba
00240000-5694-ed17-8cc6-89499ac5f436	00230000-5694-ed17-ebf4-274f8397581a	tippopa
00240000-5694-ed17-c5df-e0fa33bdcac5	00230000-5694-ed17-ebf4-274f8397581a	organizacijskaenota
00240000-5694-ed17-7e6d-7a76fe2d5774	00230000-5694-ed17-ebf4-274f8397581a	sezona
00240000-5694-ed17-1be3-f476c8e4c488	00230000-5694-ed17-ebf4-274f8397581a	tipvaje
00240000-5694-ed17-b6dc-eaf06153a87e	00230000-5694-ed17-ebf4-274f8397581a	tipdodatka
00240000-5694-ed17-4388-a91e540b48ab	00230000-5694-ed17-e838-0532efda960f	prostor
00240000-5694-ed17-1e82-262eaa1118fd	00230000-5694-ed17-ebf4-274f8397581a	besedilo
00240000-5694-ed17-8854-ba2ee133ec3a	00230000-5694-ed17-ebf4-274f8397581a	uprizoritev
00240000-5694-ed17-b7e1-7f571ed7d946	00230000-5694-ed17-ebf4-274f8397581a	funkcija
00240000-5694-ed17-2bd7-1daa62ce5cf1	00230000-5694-ed17-ebf4-274f8397581a	tipfunkcije
00240000-5694-ed17-eafd-fa15b6e1204d	00230000-5694-ed17-ebf4-274f8397581a	alternacija
00240000-5694-ed17-6554-da1a48690859	00230000-5694-ed17-300c-b22ba32e22a0	pogodba
00240000-5694-ed17-2911-a9e3fc64d47e	00230000-5694-ed17-ebf4-274f8397581a	zaposlitev
00240000-5694-ed17-cc97-6bedddc44dd1	00230000-5694-ed17-ebf4-274f8397581a	zvrstuprizoritve
00240000-5694-ed17-75ad-8571a8927fdc	00230000-5694-ed17-300c-b22ba32e22a0	programdela
00240000-5694-ed17-daa2-c1dc9d67eb6c	00230000-5694-ed17-ebf4-274f8397581a	zapis
\.


--
-- TOC entry 3122 (class 0 OID 35406771)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
158d24af-c3da-439b-ab2c-5db9d52fcb5a	00240000-5694-ed17-e5de-9ce89e8f5630	0	1001
\.


--
-- TOC entry 3181 (class 0 OID 35407355)
-- Dependencies: 230
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5694-ed1b-a233-6df8ab166994	000e0000-5694-ed1b-7fd7-6ebeab1c85df	00080000-5694-ed1a-11c2-9eac7a20ee31	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5694-ed18-dcea-38104837fade
00270000-5694-ed1b-8df2-33fd79616413	000e0000-5694-ed1b-7fd7-6ebeab1c85df	00080000-5694-ed1a-11c2-9eac7a20ee31	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5694-ed18-dcea-38104837fade
\.


--
-- TOC entry 3138 (class 0 OID 35406919)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 35407171)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5694-ed1b-5b96-7ba63213a0c1	00180000-5694-ed1b-f7ad-2ca02ce8ce99	000c0000-5694-ed1b-aacc-bf3cc1b19f86	00090000-5694-ed1a-4436-594c778aa14a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-ed1b-f6b7-e809342be832	00180000-5694-ed1b-f7ad-2ca02ce8ce99	000c0000-5694-ed1b-d703-2f93e08e8a1f	00090000-5694-ed1a-f14a-494ef8a2e635	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-ed1b-23df-141b39636770	00180000-5694-ed1b-f7ad-2ca02ce8ce99	000c0000-5694-ed1b-cae3-520aaa332ac2	00090000-5694-ed1a-81fd-466d7a2a92a0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-ed1b-277f-13faf57351d9	00180000-5694-ed1b-f7ad-2ca02ce8ce99	000c0000-5694-ed1b-8346-8fa55a1a05da	00090000-5694-ed1a-4233-bb3f970f4de4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-ed1b-a4a6-e71fc03bd291	00180000-5694-ed1b-f7ad-2ca02ce8ce99	000c0000-5694-ed1b-68a2-f0240d389a47	00090000-5694-ed1a-b08c-131c551f1825	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5694-ed1b-08d3-471fb0c05b9e	00180000-5694-ed1b-b7a3-d678b12762b6	\N	00090000-5694-ed1a-b08c-131c551f1825	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5694-ed1b-0d87-68aefadf6dd4	00180000-5694-ed1b-b7a3-d678b12762b6	\N	00090000-5694-ed1a-f14a-494ef8a2e635	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3162 (class 0 OID 35407191)
-- Dependencies: 211
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5694-ed17-3148-6a52673a37bb	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5694-ed17-dd26-f836829cb6f9	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5694-ed17-b61e-559122e7fa22	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5694-ed17-b377-3296ffbb2687	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5694-ed17-1628-07f1a7e19fbd	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5694-ed17-5171-82c453e98b59	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3184 (class 0 OID 35407396)
-- Dependencies: 233
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5694-ed17-2c30-34f12da984d6	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5694-ed17-7097-7bcab4bb1b8d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5694-ed17-d0db-c75ca4fed5c7	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5694-ed17-e89c-7a086abcc725	04	Režija	Režija	Režija	umetnik	30
000f0000-5694-ed17-7fbe-99f39e4bdb53	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5694-ed17-8860-767b771b8200	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5694-ed17-6680-cf3a5880f71b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5694-ed17-93d9-fdf1013b99b7	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5694-ed17-9e60-cb212f8c4ff7	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5694-ed17-0d3d-e9ec7af42359	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5694-ed17-d0f4-eb3f83cc6185	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5694-ed17-c1ea-2ccb991eb970	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5694-ed17-87a6-2cb5b8f8e28a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5694-ed17-2dc1-ec01f395ec99	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5694-ed17-1940-37c5af8121ca	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5694-ed17-889e-021ede7ca430	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5694-ed17-b0f9-9210e1d95823	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5694-ed17-f0c9-4c8b1ef7fa91	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5694-ed17-4f4a-c3fd8eedc1dc	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3135 (class 0 OID 35406870)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5694-ed1a-33b7-07052237848c	0001	šola	osnovna ali srednja šola
00400000-5694-ed1a-9174-52a151bb2963	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5694-ed1a-98ae-750543435b67	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3197 (class 0 OID 35407701)
-- Dependencies: 246
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5694-ed17-d67e-ec18f995884d	01	Velika predstava	f	1.00	1.00
002b0000-5694-ed17-df16-e507e7a97012	02	Mala predstava	f	0.50	0.50
002b0000-5694-ed17-2eb8-8848405d1373	03	Mala koprodukcija	t	0.40	1.00
002b0000-5694-ed17-17d0-a8decde9c342	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5694-ed17-9289-9850002be198	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3158 (class 0 OID 35407151)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5694-ed17-77bb-c0acb410991a	0001	prva vaja	prva vaja
00420000-5694-ed17-b06d-fbe27a5067c4	0002	tehnična vaja	tehnična vaja
00420000-5694-ed17-777a-1cb4fc577a87	0003	lučna vaja	lučna vaja
00420000-5694-ed17-301c-93569dbc3ff9	0004	kostumska vaja	kostumska vaja
00420000-5694-ed17-ced6-fa040c3707fc	0005	foto vaja	foto vaja
00420000-5694-ed17-54eb-d06b4a6a2b37	0006	1. glavna vaja	1. glavna vaja
00420000-5694-ed17-e977-872a5b286c2e	0007	2. glavna vaja	2. glavna vaja
00420000-5694-ed17-bb7b-5c3d5175a054	0008	1. generalka	1. generalka
00420000-5694-ed17-e86e-2b1d5a63066f	0009	2. generalka	2. generalka
00420000-5694-ed17-c0b7-1ba6d1b6ae06	0010	odprta generalka	odprta generalka
00420000-5694-ed17-4139-e36a28a9be68	0011	obnovitvena vaja	obnovitvena vaja
00420000-5694-ed17-667c-a8878f41f6a2	0012	italijanka	krajša "obnovitvena" vaja
00420000-5694-ed17-ad55-e6f9fccbfef1	0013	pevska vaja	pevska vaja
00420000-5694-ed17-3586-73990502c40e	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5694-ed17-684c-e11461d8dd08	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5694-ed17-d1a2-b83a839d1083	0016	orientacijska vaja	orientacijska vaja
00420000-5694-ed17-5700-c872a40c0acf	0017	situacijska vaja	situacijska vaja
00420000-5694-ed17-24f5-769d3dfc384d	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3144 (class 0 OID 35406992)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 35406806)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5694-ed19-0d3c-dafe2595ae54	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROhvQPndo9ZOLPSR8lTp87j938nBsLaHa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-8283-8b6d0caf85be	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-2732-80980f862d82	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-b6d2-d01bf46dc596	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-7406-f83c10c79abb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-50cd-dcd14ffbc622	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-2f5e-3c61a9164892	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-3ca8-531f9c567d04	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-a4a4-1d74cfd29c40	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-44e6-5e9dc577e7b4	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-0281-da10e6501b8b	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-7e0c-78dd3a384186	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-d61b-8ce0f1e36b31	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-4acd-0d9804ff72ca	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-b1e6-218a525237ba	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-68e3-ed8ba5e9c828	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-ef6b-f537db9558d3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-d366-f350ae251535	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-daaf-87082e722dcd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-a775-6afcca10466d	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-2687-8e6633f3e41a	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-45cd-8a05e64e3d48	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-b4d9-0dcca2158be5	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-812b-62fb54262ef7	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-75eb-22d73413529a	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-5518-234d1fb7d939	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5694-ed1a-c9f9-509ccaa0eb42	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5694-ed19-ca81-40362a09162a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 35407446)
-- Dependencies: 237
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5694-ed1b-9e9c-09b590bd1e55	00160000-5694-ed1a-88ff-450616efb20d	\N	00140000-5694-ed17-bf13-5431404bd078	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5694-ed1a-a3c0-8a5d219b6e16
000e0000-5694-ed1b-7fd7-6ebeab1c85df	00160000-5694-ed1a-bc6a-85fda6fa6d4b	\N	00140000-5694-ed17-4fd0-b6da8f80c68a	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5694-ed1a-7091-ebd7f8a85464
000e0000-5694-ed1b-939d-1f433c3049c1	\N	\N	00140000-5694-ed17-4fd0-b6da8f80c68a	00190000-5694-ed1b-16cd-038db818c031	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5694-ed1a-a3c0-8a5d219b6e16
000e0000-5694-ed1b-e31c-893fd6c35c29	\N	\N	00140000-5694-ed17-4fd0-b6da8f80c68a	00190000-5694-ed1b-16cd-038db818c031	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5694-ed1a-a3c0-8a5d219b6e16
000e0000-5694-ed1b-62fa-5f54f4b4df82	\N	\N	00140000-5694-ed17-4fd0-b6da8f80c68a	00190000-5694-ed1b-16cd-038db818c031	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-5dde-f31b1d3a4fb1	\N	\N	00140000-5694-ed17-4fd0-b6da8f80c68a	00190000-5694-ed1b-16cd-038db818c031	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-2cd8-c2fe357ad5a7	\N	\N	00140000-5694-ed17-6377-3638584cee07	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-9191-3ac324df0b6b	\N	\N	00140000-5694-ed17-6377-3638584cee07	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-3574-128968336845	\N	\N	00140000-5694-ed17-6377-3638584cee07	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-d313-9021d12af51c	\N	\N	00140000-5694-ed17-6377-3638584cee07	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-7521-06b92e937a6e	\N	\N	00140000-5694-ed17-6377-3638584cee07	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-a04b-b8583dd2909b	\N	\N	00140000-5694-ed17-6377-3638584cee07	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-798f-15e5c33cf7e4	\N	\N	00140000-5694-ed17-6377-3638584cee07	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-d8b8-4977bab73cfc	\N	\N	00140000-5694-ed17-6377-3638584cee07	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
000e0000-5694-ed1b-e662-b9f661a66f90	\N	\N	00140000-5694-ed17-6377-3638584cee07	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5694-ed1a-c2f3-458cad15de9a
\.


--
-- TOC entry 3152 (class 0 OID 35407091)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5694-ed1b-0e86-ccff9e3d36a9	\N	000e0000-5694-ed1b-7fd7-6ebeab1c85df	1	
00200000-5694-ed1b-0e22-f75ce580f61d	\N	000e0000-5694-ed1b-7fd7-6ebeab1c85df	2	
00200000-5694-ed1b-b983-b1efbb3134f9	\N	000e0000-5694-ed1b-7fd7-6ebeab1c85df	3	
00200000-5694-ed1b-47bd-13afcdb2e707	\N	000e0000-5694-ed1b-7fd7-6ebeab1c85df	4	
00200000-5694-ed1b-1b16-bd8971f878c0	\N	000e0000-5694-ed1b-7fd7-6ebeab1c85df	5	
\.


--
-- TOC entry 3171 (class 0 OID 35407259)
-- Dependencies: 220
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 35407369)
-- Dependencies: 231
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5694-ed18-96f3-927aad205329	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5694-ed18-51af-f9e5563cc978	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5694-ed18-42a6-43a1697605e5	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5694-ed18-7b64-2915d9d7e9bd	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5694-ed18-e472-27470801a829	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5694-ed18-2fa0-ec9af84b22b3	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5694-ed18-26c6-38b3c9dc0058	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5694-ed18-2cf6-1134cb4249a2	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5694-ed18-dcea-38104837fade	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5694-ed18-d581-5de0ac6c6444	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5694-ed18-4c5a-643e362c737b	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5694-ed18-a40f-2c04e34ab8a9	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5694-ed18-5648-163e884afae2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5694-ed18-eece-4e0af0bc5d65	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5694-ed18-f5ce-de87077442c7	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5694-ed18-4030-73338deb972c	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5694-ed18-175d-6b33e8a8ea00	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5694-ed18-c3d0-476da6529900	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5694-ed18-11f7-e29696cd6c19	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5694-ed18-1671-a4f3bb1e66bf	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5694-ed18-0037-301737981890	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5694-ed18-dfbb-3c7b290b009f	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5694-ed18-417b-f4b0d8869092	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5694-ed18-347e-8e1275c2a4a2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5694-ed18-fd21-cf367de2be10	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5694-ed18-9eaa-05f3e44ca5cc	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5694-ed18-07ed-b615470f4617	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5694-ed18-7168-c479ba23a6d4	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3200 (class 0 OID 35407751)
-- Dependencies: 249
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 35407720)
-- Dependencies: 248
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 35407763)
-- Dependencies: 250
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 35407331)
-- Dependencies: 227
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5694-ed1a-681f-f5d31fd4f9d3	00090000-5694-ed1a-f14a-494ef8a2e635	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-ed1a-fe25-7617190b6a05	00090000-5694-ed1a-81fd-466d7a2a92a0	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-ed1a-d60a-f9b6654bb6cf	00090000-5694-ed1a-2ace-27f7dca2bdb6	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-ed1b-0c64-71ca7c1eed24	00090000-5694-ed1a-7945-87d6350d7820	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-ed1b-361a-b7df80ffd6de	00090000-5694-ed1a-eb84-8265e31160df	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5694-ed1b-ccc9-0487a30434c4	00090000-5694-ed1a-6927-4be9d0b910fa	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3155 (class 0 OID 35407135)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 35407436)
-- Dependencies: 236
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5694-ed17-bf13-5431404bd078	01	Drama	drama (SURS 01)
00140000-5694-ed17-f364-bde78b9429e4	02	Opera	opera (SURS 02)
00140000-5694-ed17-e3e2-5616378eda38	03	Balet	balet (SURS 03)
00140000-5694-ed17-e11e-e14bffed36ed	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5694-ed17-6377-3638584cee07	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5694-ed17-4fd0-b6da8f80c68a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5694-ed17-550b-9e095cc081ff	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3177 (class 0 OID 35407321)
-- Dependencies: 226
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2607 (class 2606 OID 35406869)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 35407495)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 35407485)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 35406860)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 35407352)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 35407394)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 35407804)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 35407188)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 35407123)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 35407145)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 35407150)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 35407718)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 35407018)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 35407564)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 35407317)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 35407089)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 35407056)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 35407032)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 35407224)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2885 (class 2606 OID 35407781)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 35407788)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2896 (class 2606 OID 35407812)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2753 (class 2606 OID 35407251)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 35406990)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 35406888)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 35406952)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 35406915)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 35406849)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2596 (class 2606 OID 35406834)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 35407257)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 35407293)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 35407431)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 35406943)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 35406978)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 35407669)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 35407230)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 35406968)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 35407108)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 35407077)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2674 (class 2606 OID 35407069)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 35407242)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 35407678)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 35407686)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 35407656)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 35407699)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 35407275)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 35407215)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 35407206)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 35407418)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 35407345)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 35407044)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 35406805)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 35407284)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 35406823)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2598 (class 2606 OID 35406843)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 35407302)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 35407237)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 35407169)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 35406793)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 35406781)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 35406775)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 35407365)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 35406924)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 35407180)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 35407198)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 35407405)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 35406877)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 35407711)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 35407158)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 35407003)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 35406818)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 35407464)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 35407098)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 35407265)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 35407377)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 35407761)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 35407745)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 35407769)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 35407335)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 35407139)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 35407444)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 35407329)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 1259 OID 35407133)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2691 (class 1259 OID 35407134)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2692 (class 1259 OID 35407132)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2693 (class 1259 OID 35407131)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2694 (class 1259 OID 35407130)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2796 (class 1259 OID 35407366)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2797 (class 1259 OID 35407367)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2798 (class 1259 OID 35407368)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2882 (class 1259 OID 35407783)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2883 (class 1259 OID 35407782)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2625 (class 1259 OID 35406945)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2626 (class 1259 OID 35406946)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2754 (class 1259 OID 35407258)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2869 (class 1259 OID 35407749)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2870 (class 1259 OID 35407748)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2871 (class 1259 OID 35407750)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2872 (class 1259 OID 35407747)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2873 (class 1259 OID 35407746)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2748 (class 1259 OID 35407244)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2749 (class 1259 OID 35407243)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2682 (class 1259 OID 35407099)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2683 (class 1259 OID 35407100)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2778 (class 1259 OID 35407318)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2779 (class 1259 OID 35407320)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2780 (class 1259 OID 35407319)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2657 (class 1259 OID 35407034)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2658 (class 1259 OID 35407033)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2860 (class 1259 OID 35407700)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2812 (class 1259 OID 35407433)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2813 (class 1259 OID 35407434)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2814 (class 1259 OID 35407435)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2879 (class 1259 OID 35407770)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2821 (class 1259 OID 35407469)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2822 (class 1259 OID 35407466)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2823 (class 1259 OID 35407470)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2824 (class 1259 OID 35407468)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2825 (class 1259 OID 35407467)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2647 (class 1259 OID 35407005)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 35407004)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2616 (class 1259 OID 35406918)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2766 (class 1259 OID 35407285)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2600 (class 1259 OID 35406850)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2601 (class 1259 OID 35406851)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2771 (class 1259 OID 35407305)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2772 (class 1259 OID 35407304)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2773 (class 1259 OID 35407303)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2630 (class 1259 OID 35406955)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2631 (class 1259 OID 35406954)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2632 (class 1259 OID 35406956)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2670 (class 1259 OID 35407072)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2671 (class 1259 OID 35407070)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 35407071)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2580 (class 1259 OID 35406783)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2728 (class 1259 OID 35407210)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2729 (class 1259 OID 35407208)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2730 (class 1259 OID 35407207)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2731 (class 1259 OID 35407209)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2591 (class 1259 OID 35406824)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2592 (class 1259 OID 35406825)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2757 (class 1259 OID 35407266)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2892 (class 1259 OID 35407805)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2794 (class 1259 OID 35407354)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2795 (class 1259 OID 35407353)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2893 (class 1259 OID 35407813)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2894 (class 1259 OID 35407814)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2743 (class 1259 OID 35407231)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2788 (class 1259 OID 35407346)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2789 (class 1259 OID 35407347)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2842 (class 1259 OID 35407569)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2843 (class 1259 OID 35407568)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2844 (class 1259 OID 35407565)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2845 (class 1259 OID 35407566)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2846 (class 1259 OID 35407567)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2636 (class 1259 OID 35406970)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 35406969)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2638 (class 1259 OID 35406971)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2760 (class 1259 OID 35407279)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2761 (class 1259 OID 35407278)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2852 (class 1259 OID 35407679)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2853 (class 1259 OID 35407680)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2835 (class 1259 OID 35407499)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2836 (class 1259 OID 35407500)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2837 (class 1259 OID 35407497)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2838 (class 1259 OID 35407498)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2722 (class 1259 OID 35407189)
-- Name: idx_aab095ce5e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce5e15bdbd ON dodatek USING btree (terminstoritve_id);


--
-- TOC entry 2723 (class 1259 OID 35407190)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2784 (class 1259 OID 35407336)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2785 (class 1259 OID 35407337)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2734 (class 1259 OID 35407219)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2735 (class 1259 OID 35407218)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2736 (class 1259 OID 35407216)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2737 (class 1259 OID 35407217)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2831 (class 1259 OID 35407487)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2832 (class 1259 OID 35407486)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2661 (class 1259 OID 35407045)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2664 (class 1259 OID 35407059)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2665 (class 1259 OID 35407058)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2666 (class 1259 OID 35407057)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2667 (class 1259 OID 35407060)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2681 (class 1259 OID 35407090)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2675 (class 1259 OID 35407078)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 35407079)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2849 (class 1259 OID 35407670)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2868 (class 1259 OID 35407719)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2886 (class 1259 OID 35407789)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2887 (class 1259 OID 35407790)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2612 (class 1259 OID 35406890)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2613 (class 1259 OID 35406889)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2621 (class 1259 OID 35406925)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2622 (class 1259 OID 35406926)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2701 (class 1259 OID 35407140)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2715 (class 1259 OID 35407183)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2716 (class 1259 OID 35407182)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2717 (class 1259 OID 35407181)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2695 (class 1259 OID 35407125)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2696 (class 1259 OID 35407126)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2697 (class 1259 OID 35407129)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2698 (class 1259 OID 35407124)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2699 (class 1259 OID 35407128)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2700 (class 1259 OID 35407127)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2629 (class 1259 OID 35406944)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 35406878)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 35406879)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2653 (class 1259 OID 35407019)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 35407021)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2655 (class 1259 OID 35407020)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2656 (class 1259 OID 35407022)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2742 (class 1259 OID 35407225)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2817 (class 1259 OID 35407432)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2826 (class 1259 OID 35407465)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2808 (class 1259 OID 35407406)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2809 (class 1259 OID 35407407)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2619 (class 1259 OID 35406916)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 35406917)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2726 (class 1259 OID 35407199)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 35407200)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2781 (class 1259 OID 35407330)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2586 (class 1259 OID 35406794)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 35406991)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2635 (class 1259 OID 35406953)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 35406782)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2865 (class 1259 OID 35407712)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2764 (class 1259 OID 35407277)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2765 (class 1259 OID 35407276)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2710 (class 1259 OID 35407159)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2711 (class 1259 OID 35407160)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2839 (class 1259 OID 35407496)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 35406979)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2818 (class 1259 OID 35407445)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2876 (class 1259 OID 35407762)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2858 (class 1259 OID 35407687)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2859 (class 1259 OID 35407688)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2805 (class 1259 OID 35407395)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2714 (class 1259 OID 35407170)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 35406844)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2936 (class 2606 OID 35407985)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2935 (class 2606 OID 35407990)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2930 (class 2606 OID 35408015)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2932 (class 2606 OID 35408005)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2937 (class 2606 OID 35407980)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2933 (class 2606 OID 35408000)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2931 (class 2606 OID 35408010)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2934 (class 2606 OID 35407995)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2975 (class 2606 OID 35408195)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2974 (class 2606 OID 35408200)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2973 (class 2606 OID 35408205)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3007 (class 2606 OID 35408370)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3008 (class 2606 OID 35408365)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2909 (class 2606 OID 35407870)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2908 (class 2606 OID 35407875)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2956 (class 2606 OID 35408110)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3002 (class 2606 OID 35408350)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3003 (class 2606 OID 35408345)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3001 (class 2606 OID 35408355)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3004 (class 2606 OID 35408340)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3005 (class 2606 OID 35408335)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2954 (class 2606 OID 35408105)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2955 (class 2606 OID 35408100)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2929 (class 2606 OID 35407970)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2928 (class 2606 OID 35407975)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2966 (class 2606 OID 35408150)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 35408160)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2965 (class 2606 OID 35408155)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2918 (class 2606 OID 35407925)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 35407920)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 35408090)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2999 (class 2606 OID 35408325)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2978 (class 2606 OID 35408210)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 35408215)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2976 (class 2606 OID 35408220)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3006 (class 2606 OID 35408360)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2980 (class 2606 OID 35408240)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2983 (class 2606 OID 35408225)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2979 (class 2606 OID 35408245)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2981 (class 2606 OID 35408235)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2982 (class 2606 OID 35408230)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2916 (class 2606 OID 35407915)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2917 (class 2606 OID 35407910)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2904 (class 2606 OID 35407855)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2905 (class 2606 OID 35407850)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2960 (class 2606 OID 35408130)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2901 (class 2606 OID 35407830)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2900 (class 2606 OID 35407835)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2961 (class 2606 OID 35408145)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2962 (class 2606 OID 35408140)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2963 (class 2606 OID 35408135)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2911 (class 2606 OID 35407885)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2912 (class 2606 OID 35407880)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2910 (class 2606 OID 35407890)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 35407950)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2924 (class 2606 OID 35407940)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2923 (class 2606 OID 35407945)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2897 (class 2606 OID 35407815)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2944 (class 2606 OID 35408065)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2946 (class 2606 OID 35408055)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2947 (class 2606 OID 35408050)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2945 (class 2606 OID 35408060)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2899 (class 2606 OID 35407820)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2898 (class 2606 OID 35407825)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2957 (class 2606 OID 35408115)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3011 (class 2606 OID 35408385)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 35408190)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2972 (class 2606 OID 35408185)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3013 (class 2606 OID 35408390)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3012 (class 2606 OID 35408395)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2953 (class 2606 OID 35408095)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2970 (class 2606 OID 35408175)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2969 (class 2606 OID 35408180)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2990 (class 2606 OID 35408300)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 35408295)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2994 (class 2606 OID 35408280)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2993 (class 2606 OID 35408285)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2992 (class 2606 OID 35408290)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2914 (class 2606 OID 35407900)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 35407895)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 35407905)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2958 (class 2606 OID 35408125)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2959 (class 2606 OID 35408120)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2997 (class 2606 OID 35408310)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2996 (class 2606 OID 35408315)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2987 (class 2606 OID 35408270)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2986 (class 2606 OID 35408275)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2989 (class 2606 OID 35408260)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2988 (class 2606 OID 35408265)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2943 (class 2606 OID 35408040)
-- Name: fk_aab095ce5e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce5e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2942 (class 2606 OID 35408045)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2968 (class 2606 OID 35408165)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2967 (class 2606 OID 35408170)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 35408085)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2949 (class 2606 OID 35408080)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2951 (class 2606 OID 35408070)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2950 (class 2606 OID 35408075)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2984 (class 2606 OID 35408255)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2985 (class 2606 OID 35408250)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2920 (class 2606 OID 35407930)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2921 (class 2606 OID 35407935)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 35407965)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 35407955)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2925 (class 2606 OID 35407960)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2995 (class 2606 OID 35408305)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2998 (class 2606 OID 35408320)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 35408330)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3010 (class 2606 OID 35408375)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3009 (class 2606 OID 35408380)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2902 (class 2606 OID 35407845)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2903 (class 2606 OID 35407840)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2907 (class 2606 OID 35407860)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2906 (class 2606 OID 35407865)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2938 (class 2606 OID 35408020)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 35408035)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2940 (class 2606 OID 35408030)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2941 (class 2606 OID 35408025)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-12 13:10:06 CET

--
-- PostgreSQL database dump complete
--

